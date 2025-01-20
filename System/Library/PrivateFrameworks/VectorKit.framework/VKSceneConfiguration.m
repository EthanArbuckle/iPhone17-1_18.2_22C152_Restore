@interface VKSceneConfiguration
- (VKSceneConfiguration)initWithTaskContext:(const void *)a3;
- (const)styleAttributeCoordinateRanges;
- (id).cxx_construct;
- (id)setStyleManager:;
- (shared_ptr<gss::ClientStyleState<gss::ScenePropertyID>>)sceneClientStyleState;
- (shared_ptr<gss::StylesheetManager<gss::PropertyID>>)styleManager;
- (uint64_t)setStyleManager:;
- (unint64_t)navCameraMode;
- (unint64_t)navigationDestination;
- (unsigned)navCameraModeStyleAttribute;
- (unsigned)navigationState;
- (void)_updateStyleManager;
- (void)applyStyleAttributeKeyValue:(unsigned int)a3 withValue:(unsigned int)a4 withCoordinateRange:(GEOPolylineCoordinateRange)a5;
- (void)removeStyleAttributeKey:(unsigned int)a3;
- (void)resetState;
- (void)setCurrentGroupedManeuverCount:(unint64_t)a3;
- (void)setCurrentIncidentType:(unint64_t)a3;
- (void)setCurrentManeuverJunctionsCount:(unint64_t)a3;
- (void)setCurrentManeuverType:(int)a3;
- (void)setCurrentRoadComplexity:(unsigned int)a3;
- (void)setCurrentStepLength:(double)a3;
- (void)setCurrentTransitManeuverType:(int)a3;
- (void)setCurrentTransportationType:(int)a3;
- (void)setDistanceToCurrentManeuver:(double)a3;
- (void)setDistanceToCurrentTrafficSection:(double)a3;
- (void)setDistanceToDestination:(double)a3;
- (void)setLaneCount:(unsigned int)a3;
- (void)setLineType:(unsigned int)a3;
- (void)setNavCameraMode:(unint64_t)a3;
- (void)setNavigationDestination:(unint64_t)a3;
- (void)setNavigationState:(int)a3;
- (void)setNextManeuverRampType:(int)a3;
- (void)setNextRoadComplexity:(unsigned int)a3;
- (void)setNextStepLength:(double)a3;
- (void)setRampType:(int)a3;
- (void)setRoadSpeed:(double)a3;
- (void)setSceneClientStyleState:(shared_ptr<gss::ClientStyleState<gss::ScenePropertyID>>)a3;
- (void)setSearchAlongTheRoute:(BOOL)a3;
- (void)setSinuosity:(double)a3;
- (void)setStyleManager:;
- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3;
- (void)setTrafficColor:(unint64_t)a3;
- (void)setVehicleSpeed:(double)a3;
@end

@implementation VKSceneConfiguration

- (VKSceneConfiguration)initWithTaskContext:(const void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VKSceneConfiguration;
  v4 = [(VKSceneConfiguration *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(TaskContext **)a3;
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_taskContext.__cntrl_;
    v4->_taskContext.__ptr_ = v7;
    v4->_taskContext.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    [(VKSceneConfiguration *)v5 resetState];
    *(_OWORD *)&v5->_distanceRanges._immediate = xmmword_1A28FCB70;
    *(_OWORD *)&v5->_distanceRanges._veryNear = xmmword_1A28FCB80;
    *(_OWORD *)&v5->_distanceRanges._medium = xmmword_1A28FCB90;
    *(_OWORD *)&v5->_distanceRanges._veryFar = xmmword_1A28FCBA0;
    *(_OWORD *)&v5->_sinuosityLevels._low = xmmword_1A28FCBB0;
    v5->_sinuosityLevels._high = 2.0;
  }
  return v5;
}

- (void)_updateStyleManager
{
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
  {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1001Du, self->_navState);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1001Eu, self->_distanceToCurrentManeuver);
    unsigned int v4 = self->_currentManeuverType - 1;
    if (v4 > 0x57) {
      int v5 = 0;
    }
    else {
      int v5 = byte_1A28FFE8A[v4];
    }
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10026u, v5);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1003Eu, self->_currentStepLength);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10027u, self->_nextStepLength);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10028u, self->_currentIncidentType);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10029u, self->_currentManeuverComplexity);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 1u, LOWORD(self->_lineType));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x15u, LOWORD(self->_rampType));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1003Bu, LOWORD(self->_nextManeuverRampType));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10010u, self->_transportType);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10031u, self->_searchAlongTheRoute);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10032u, self->_vehicleSpeed);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10039u, self->_roadSpeed);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10034u, self->_cameraMode);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10040u, self->_navigationDestination);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10055u, LOWORD(self->_roadComplexity));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10061u, LOWORD(self->_nextRoadComplexity));
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1005Du, self->_distanceToCurrentTrafficSection);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x1005Eu, self->_currentTrafficState);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10062u, self->_currentTransitManeuver);
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, 0x10063u, self->_routeSinuosity);
    if (self->_currentGroupedManeuverCount >= 5) {
      LODWORD(currentGroupedManeuverCount) = 5;
    }
    else {
      unint64_t currentGroupedManeuverCount = self->_currentGroupedManeuverCount;
    }
    v7 = self->_sceneClientStyleState.__ptr_;
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)v7, 0x1002Au, currentGroupedManeuverCount);
  }
}

- (void)setSceneClientStyleState:(shared_ptr<gss::ClientStyleState<gss::ScenePropertyID>>)a3
{
  int v5 = *(void **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_sceneClientStyleState.__cntrl_;
  self->_sceneClientStyleState.__ptr_ = v5;
  self->_sceneClientStyleState.__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  [(VKSceneConfiguration *)self _updateStyleManager];
}

- (void)resetState
{
  *(_WORD *)&self->_navState = 0;
  *(void *)&self->_rampType = 0;
  self->_lineType = 0;
  *(void *)&self->_currentManeuverType = 0;
  self->_unint64_t currentGroupedManeuverCount = 0;
  self->_distanceToDestination = 0.0;
  *(_DWORD *)&self->_transportType = 4;
  *(_WORD *)&self->_cameraMode = 0;
  self->_roadComplexity = 0;
  self->_nextRoadComplexity = 0;
  self->_roadSpeedZeroes = 0;
  *(_WORD *)&self->_distanceToCurrentTrafficSection = 1032;
  *(_WORD *)&self->_currentTransitManeuver = 0;
  self->_laneCount = 0;
  if (self->_sceneClientStyleState.__ptr_)
  {
    for (i = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_; i; i = *(_DWORD **)i)
      gss::ClientStyleState<gss::ScenePropertyID>::removeClientStyleAttribute((uint64_t)self->_sceneClientStyleState.__ptr_, i[4]);
    if (self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_)
    {
      next = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
      if (next)
      {
        do
        {
          int v5 = (void *)*next;
          operator delete(next);
          next = v5;
        }
        while (v5);
      }
      self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_ = 0;
      unint64_t value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        for (uint64_t j = 0; j != value; ++j)
          self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[j] = 0;
      }
      self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_ = 0;
    }
  }
  [(VKSceneConfiguration *)self _updateStyleManager];
}

- (void)setStyleManager:
{
  JUMPOUT(0x1A6239270);
}

- (void)setStyleManager:(shared_ptr<gss::StylesheetManager<gss::PropertyID>>)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  ptr = *(void **)a3.__ptr_;
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
    ptr = self->_styleManager.__ptr_;
  }
  if (ptr)
  {
    v7 = self;
    v8 = (uint64_t *)self->_styleManager.__ptr_;
    v9 = v7;
    v10[0] = &unk_1EF56C558;
    v10[1] = v9;
    v11 = v10;
    gss::StylesheetManager<gss::PropertyID>::addFinishedDecodingGlobalPropertiesCallback(v8, v10);
    if (v11 == v10)
    {
      (*(void (**)(void *))(v10[0] + 32))(v10);
    }
    else if (v11)
    {
      (*(void (**)(void))(*v11 + 40))();
    }
  }
}

- (id)setStyleManager:
{
  v3 = *(void **)(a1 + 8);
  *a2 = &unk_1EF56C558;
  id result = v3;
  a2[1] = result;
  return result;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((void *)self + 7) = 0;
  *((_DWORD *)self + 68) = 1065353216;
  *((void *)self + 35) = 0;
  *((void *)self + 36) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_taskContext.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    next = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
    if (!next) {
      goto LABEL_5;
    }
  }
  else
  {
    next = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
    if (!next) {
      goto LABEL_5;
    }
  }
  do
  {
    uint64_t v5 = (void *)*next;
    operator delete(next);
    next = v5;
  }
  while (v5);
LABEL_5:
  unint64_t value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
  self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  begin = self->_pointsOfInterest.__begin_;
  if (begin)
  {
    self->_pointsOfInterest.__end_ = begin;
    operator delete(begin);
  }
  v8 = self->_styleManager.__cntrl_;
  if (v8 && !atomic_fetch_add((atomic_ullong *volatile)v8 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v8 + 16))(v8, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v8);
    v9 = self->_sceneClientStyleState.__cntrl_;
    if (!v9) {
      return;
    }
  }
  else
  {
    v9 = self->_sceneClientStyleState.__cntrl_;
    if (!v9) {
      return;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v9 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v9 + 16))(v9, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v9);
  }
}

- (void)removeStyleAttributeKey:(unsigned int)a3
{
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::removeClientStyleAttribute((uint64_t)ptr, a3);
  }
  unint64_t value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    unint64_t v7 = a3;
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v9 = a3;
      if (value <= a3) {
        unint64_t v9 = a3 % value;
      }
    }
    else
    {
      unint64_t v9 = (value - 1) & a3;
    }
    objc_super v10 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
    v11 = (VKSceneConfiguration **)v10[v9];
    if (v11)
    {
      isa = *v11;
      if (*v11)
      {
        unint64_t v13 = value - 1;
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            unint64_t v14 = (unint64_t)isa->_sceneClientStyleState.__ptr_;
            if (v14 == a3)
            {
              if (LODWORD(isa->_sceneClientStyleState.__cntrl_) == a3) {
                goto LABEL_24;
              }
            }
            else if ((v14 & v13) != v9)
            {
              return;
            }
            isa = (VKSceneConfiguration *)isa->super.isa;
            if (!isa) {
              return;
            }
          }
        }
        do
        {
          unint64_t v15 = (unint64_t)isa->_sceneClientStyleState.__ptr_;
          if (v15 == a3)
          {
            if (LODWORD(isa->_sceneClientStyleState.__cntrl_) == a3)
            {
LABEL_24:
              if (v8.u32[0] > 1uLL)
              {
                if (value <= a3) {
                  unint64_t v7 = a3 % value;
                }
              }
              else
              {
                unint64_t v7 = v13 & a3;
              }
              v16 = (VKSceneConfiguration *)v10[v7];
              do
              {
                v17 = v16;
                v16 = (VKSceneConfiguration *)v16->super.isa;
              }
              while (v16 != isa);
              if (v17 == (VKSceneConfiguration *)&self->_styleAttributeCoordinateRanges.__table_.__p1_) {
                goto LABEL_41;
              }
              unint64_t v18 = (unint64_t)v17->_sceneClientStyleState.__ptr_;
              if (v8.u32[0] > 1uLL)
              {
                if (v18 >= value) {
                  v18 %= value;
                }
              }
              else
              {
                v18 &= v13;
              }
              if (v18 != v7)
              {
LABEL_41:
                if (!isa->super.isa) {
                  goto LABEL_42;
                }
                unint64_t v19 = *((void *)isa->super.isa + 1);
                if (v8.u32[0] > 1uLL)
                {
                  if (v19 >= value) {
                    v19 %= value;
                  }
                }
                else
                {
                  v19 &= v13;
                }
                if (v19 != v7) {
LABEL_42:
                }
                  v10[v7] = 0;
              }
              v20 = isa->super.isa;
              if (isa->super.isa)
              {
                unint64_t v21 = *((void *)v20 + 1);
                if (v8.u32[0] > 1uLL)
                {
                  if (v21 >= value) {
                    v21 %= value;
                  }
                }
                else
                {
                  v21 &= v13;
                }
                if (v21 != v7)
                {
                  self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v21] = v17;
                  v20 = isa->super.isa;
                }
              }
              v17->super.isa = v20;
              isa->super.isa = 0;
              --self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_;
              operator delete(isa);
              return;
            }
          }
          else
          {
            if (v15 >= value) {
              v15 %= value;
            }
            if (v15 != v9) {
              return;
            }
          }
          isa = (VKSceneConfiguration *)isa->super.isa;
        }
        while (isa);
      }
    }
  }
}

- (void)applyStyleAttributeKeyValue:(unsigned int)a3 withValue:(unsigned int)a4 withCoordinateRange:(GEOPolylineCoordinateRange)a5
{
  PolylineCoordinate end = a5.end;
  PolylineCoordinate start = a5.start;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, a3, (unsigned __int16)a4);
  }
  unint64_t v11 = a3;
  unint64_t value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v5 = a3;
      if (value <= a3) {
        unint64_t v5 = a3 % value;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & a3;
    }
    unint64_t v14 = (void **)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v14)
    {
      unint64_t v15 = *v14;
      if (*v14)
      {
        if (v13.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v17 = v15[1];
            if (v17 == a3)
            {
              if (*((_DWORD *)v15 + 4) == a3) {
                goto LABEL_84;
              }
            }
            else if ((v17 & (value - 1)) != v5)
            {
              goto LABEL_24;
            }
            unint64_t v15 = (void *)*v15;
            if (!v15) {
              goto LABEL_24;
            }
          }
        }
        do
        {
          unint64_t v16 = v15[1];
          if (v16 == a3)
          {
            if (*((_DWORD *)v15 + 4) == a3) {
              goto LABEL_84;
            }
          }
          else
          {
            if (v16 >= value) {
              v16 %= value;
            }
            if (v16 != v5) {
              break;
            }
          }
          unint64_t v15 = (void *)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_24:
  unint64_t v15 = operator new(0x28uLL);
  *unint64_t v15 = 0;
  v15[1] = a3;
  *((_DWORD *)v15 + 4) = a3;
  *(void *)((char *)v15 + 20) = 0xBF80000000000000;
  *(void *)((char *)v15 + 28) = 0xBF80000000000000;
  float v18 = (float)(self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_ + 1);
  float v19 = self->_styleAttributeCoordinateRanges.__table_.__p3_.__value_;
  if (value && (float)(v19 * (float)value) >= v18)
  {
    unint64_t v11 = v5;
    goto LABEL_74;
  }
  BOOL v20 = 1;
  if (value >= 3) {
    BOOL v20 = (value & (value - 1)) != 0;
  }
  unint64_t v21 = v20 | (2 * value);
  unint64_t v22 = vcvtps_u32_f32(v18 / v19);
  if (v21 <= v22) {
    size_t prime = v22;
  }
  else {
    size_t prime = v21;
  }
  if (prime == 1)
  {
    size_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(prime);
    unint64_t value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  }
  if (prime > value)
  {
LABEL_37:
    if (prime >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    v24 = (void **)operator new(8 * prime);
    v25 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
    self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_ = v24;
    if (v25) {
      operator delete(v25);
    }
    uint64_t v26 = 0;
    self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = prime;
    do
      self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v26++] = 0;
    while (prime != v26);
    next = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
    if (!next) {
      goto LABEL_61;
    }
    p_p1 = &self->_styleAttributeCoordinateRanges.__table_.__p1_;
    size_t v29 = next[1];
    size_t v30 = prime - 1;
    if ((prime & (prime - 1)) == 0)
    {
      size_t v31 = v29 & v30;
      self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v31] = p_p1;
      for (i = (void *)*next; *next; i = (void *)*next)
      {
        size_t v33 = i[1] & v30;
        if (v33 == v31)
        {
          next = i;
        }
        else
        {
          v34 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
          if (v34[v33])
          {
            void *next = *i;
            size_t v35 = v33;
            void *i = *(void *)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v35];
            *(void *)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v35] = i;
          }
          else
          {
            v34[v33] = next;
            next = i;
            size_t v31 = v33;
          }
        }
      }
LABEL_61:
      unint64_t value = prime;
      goto LABEL_62;
    }
    if (v29 >= prime) {
      v29 %= prime;
    }
    self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v29] = p_p1;
    v39 = (void *)*next;
    if (!*next) {
      goto LABEL_61;
    }
    while (1)
    {
      size_t v41 = v39[1];
      if (v41 >= prime) {
        v41 %= prime;
      }
      if (v41 != v29)
      {
        v42 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
        if (!v42[v41])
        {
          v42[v41] = next;
          goto LABEL_66;
        }
        void *next = *v39;
        size_t v40 = v41;
        void *v39 = *(void *)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v40];
        *(void *)self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v40] = v39;
        v39 = next;
      }
      size_t v41 = v29;
LABEL_66:
      next = v39;
      v39 = (void *)*v39;
      size_t v29 = v41;
      if (!v39) {
        goto LABEL_61;
      }
    }
  }
  if (prime >= value) {
    goto LABEL_62;
  }
  unint64_t v36 = vcvtps_u32_f32((float)self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_/ self->_styleAttributeCoordinateRanges.__table_.__p3_.__value_);
  if (value < 3 || (uint8x8_t v37 = (uint8x8_t)vcnt_s8((int8x8_t)value), v37.i16[0] = vaddlv_u8(v37), v37.u32[0] > 1uLL))
  {
    unint64_t v36 = std::__next_prime(v36);
  }
  else
  {
    uint64_t v38 = 1 << -(char)__clz(v36 - 1);
    if (v36 >= 2) {
      unint64_t v36 = v38;
    }
  }
  if (prime <= v36) {
    size_t prime = v36;
  }
  if (prime < value)
  {
    if (!prime)
    {
      v46 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
      self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_ = 0;
      if (v46) {
        operator delete(v46);
      }
      unint64_t value = 0;
      self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
      goto LABEL_62;
    }
    goto LABEL_37;
  }
  unint64_t value = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
LABEL_62:
  if ((value & (value - 1)) != 0)
  {
    if (value <= v11) {
      v11 %= value;
    }
  }
  else
  {
    unint64_t v11 = (value - 1) & v11;
  }
LABEL_74:
  v43 = self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_;
  v44 = (void **)v43[v11];
  if (v44)
  {
    *unint64_t v15 = *v44;
LABEL_82:
    *v44 = v15;
    goto LABEL_83;
  }
  *unint64_t v15 = self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_;
  self->_styleAttributeCoordinateRanges.__table_.__p1_.__value_.__next_ = v15;
  v43[v11] = &self->_styleAttributeCoordinateRanges.__table_.__p1_;
  if (*v15)
  {
    unint64_t v45 = *(void *)(*v15 + 8);
    if ((value & (value - 1)) != 0)
    {
      if (v45 >= value) {
        v45 %= value;
      }
    }
    else
    {
      v45 &= value - 1;
    }
    v44 = &self->_styleAttributeCoordinateRanges.__table_.__bucket_list_.__ptr_.__value_[v45];
    goto LABEL_82;
  }
LABEL_83:
  ++self->_styleAttributeCoordinateRanges.__table_.__p2_.__value_;
LABEL_84:
  *(PolylineCoordinate *)((char *)v15 + 20) = start;
  *(PolylineCoordinate *)((char *)v15 + 28) = end;
}

- (void)setLaneCount:(unsigned int)a3
{
  if (self->_laneCount != a3)
  {
    self->_laneCount = a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr) {
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1006Bu, (unsigned __int16)a3);
    }
  }
}

- (void)setSinuosity:(double)a3
{
  if (self->_sinuosityLevels._straight >= a3)
  {
    int v3 = 0;
  }
  else if (self->_sinuosityLevels._low >= a3)
  {
    int v3 = 1;
  }
  else if (self->_sinuosityLevels._medium >= a3)
  {
    int v3 = 2;
  }
  else if (self->_sinuosityLevels._high >= a3)
  {
    int v3 = 3;
  }
  else
  {
    int v3 = 4;
  }
  if (v3 != self->_routeSinuosity)
  {
    self->_routeSinuosity = v3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr) {
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10063u, v3);
    }
  }
}

- (void)setCurrentTransitManeuverType:(int)a3
{
  if ((a3 - 1) > 9) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = byte_1A28FFEE2[a3 - 1];
  }
  self->_currentTransitManeuver = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10062u, (unsigned __int16)a3);
  }
}

- (void)setTrafficColor:(unint64_t)a3
{
  if (a3 >= 5) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  if (self->_currentTrafficState != v3)
  {
    self->_currentTrafficState = v3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr) {
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1005Eu, v3);
    }
  }
}

- (void)setDistanceToCurrentTrafficSection:(double)a3
{
  if (self->_distanceRanges._immediate >= a3)
  {
    int v3 = 1;
  }
  else if (self->_distanceRanges._extremlyNear >= a3)
  {
    int v3 = 2;
  }
  else if (self->_distanceRanges._veryNear >= a3)
  {
    int v3 = 3;
  }
  else if (self->_distanceRanges._near >= a3)
  {
    int v3 = 4;
  }
  else if (self->_distanceRanges._medium >= a3)
  {
    int v3 = 5;
  }
  else if (self->_distanceRanges._far >= a3)
  {
    int v3 = 6;
  }
  else if (self->_distanceRanges._veryFar >= a3)
  {
    int v3 = 7;
  }
  else
  {
    int v3 = 8;
  }
  if (self->_distanceToCurrentTrafficSection != v3)
  {
    self->_distanceToCurrentTrafficSection = v3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr) {
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1005Du, v3);
    }
  }
}

- (void)setNextRoadComplexity:(unsigned int)a3
{
  if (self->_nextRoadComplexity != a3)
  {
    self->_nextRoadComplexity = a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr) {
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10061u, (unsigned __int16)a3);
    }
  }
}

- (void)setCurrentRoadComplexity:(unsigned int)a3
{
  if (self->_roadComplexity != a3)
  {
    self->_roadComplexity = a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr) {
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10055u, (unsigned __int16)a3);
    }
  }
}

- (unsigned)navigationState
{
  return self->_navState;
}

- (unint64_t)navigationDestination
{
  int navigationDestination = self->_navigationDestination;
  if (navigationDestination == 2) {
    return 2;
  }
  else {
    return navigationDestination == 1;
  }
}

- (void)setNavigationDestination:(unint64_t)a3
{
  if (a3 == 2) {
    int v3 = 2;
  }
  else {
    int v3 = a3 == 1;
  }
  self->_int navigationDestination = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10040u, v3);
  }
}

- (const)styleAttributeCoordinateRanges
{
  return &self->_styleAttributeCoordinateRanges;
}

- (unsigned)navCameraModeStyleAttribute
{
  return self->_cameraMode;
}

- (unint64_t)navCameraMode
{
  if (self->_cameraMode - 1 < 3) {
    return (self->_cameraMode - 1) + 1;
  }
  else {
    return 0;
  }
}

- (void)setNavCameraMode:(unint64_t)a3
{
  if (a3 >= 4) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  self->_cameraMode = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10034u, v3);
  }
}

- (void)setRoadSpeed:(double)a3
{
  if (self->_roadSpeed && a3 == 0.0)
  {
    unint64_t roadSpeedZeroes = self->_roadSpeedZeroes;
    if (roadSpeedZeroes <= 9)
    {
      self->_unint64_t roadSpeedZeroes = roadSpeedZeroes + 1;
      return;
    }
    self->_unint64_t roadSpeedZeroes = 0;
  }
  if (a3 > 0.0 && self->_roadSpeedZeroes) {
    self->_unint64_t roadSpeedZeroes = 0;
  }
  if (a3 >= 10.0)
  {
    if (a3 < 20.0)
    {
      int v4 = 1;
    }
    else if (a3 < 30.0)
    {
      int v4 = 2;
    }
    else if (a3 >= 40.0)
    {
      if (a3 >= 50.0)
      {
        if (a3 >= 60.0)
        {
          if (a3 >= 70.0)
          {
            if (a3 >= 80.0)
            {
              if (a3 >= 90.0)
              {
                if (a3 >= 100.0)
                {
                  if (a3 >= 110.0)
                  {
                    if (a3 >= 120.0)
                    {
                      if (a3 >= 130.0)
                      {
                        if (a3 >= 140.0)
                        {
                          if (a3 >= 150.0)
                          {
                            if (a3 >= 160.0) {
                              int v4 = 16 * (a3 >= 160.0);
                            }
                            else {
                              int v4 = 15;
                            }
                          }
                          else
                          {
                            int v4 = 14;
                          }
                        }
                        else
                        {
                          int v4 = 13;
                        }
                      }
                      else
                      {
                        int v4 = 12;
                      }
                    }
                    else
                    {
                      int v4 = 11;
                    }
                  }
                  else
                  {
                    int v4 = 10;
                  }
                }
                else
                {
                  int v4 = 9;
                }
              }
              else
              {
                int v4 = 8;
              }
            }
            else
            {
              int v4 = 7;
            }
          }
          else
          {
            int v4 = 6;
          }
        }
        else
        {
          int v4 = 5;
        }
      }
      else
      {
        int v4 = 4;
      }
    }
    else
    {
      int v4 = 3;
    }
  }
  else
  {
    int v4 = 0;
  }
  self->_roadSpeed = v4;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10039u, v4);
  }
}

- (void)setVehicleSpeed:(double)a3
{
  if (a3 >= 0.0)
  {
    if (a3 < 20.0)
    {
      int v3 = 1;
    }
    else if (a3 < 40.0)
    {
      int v3 = 2;
    }
    else if (a3 >= 60.0)
    {
      if (a3 >= 80.0)
      {
        if (a3 >= 100.0)
        {
          if (a3 >= 120.0)
          {
            if (a3 >= 140.0)
            {
              if (a3 >= 160.0) {
                int v3 = 9;
              }
              else {
                int v3 = 8;
              }
            }
            else
            {
              int v3 = 7;
            }
          }
          else
          {
            int v3 = 6;
          }
        }
        else
        {
          int v3 = 5;
        }
      }
      else
      {
        int v3 = 4;
      }
    }
    else
    {
      int v3 = 3;
    }
  }
  else
  {
    int v3 = 0;
  }
  self->_vehicleSpeed = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10032u, v3);
  }
}

- (void)setSearchAlongTheRoute:(BOOL)a3
{
  self->_searchAlongTheRoute = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10031u, a3);
  }
}

- (void)setCurrentTransportationType:(int)a3
{
  unint64_t v3 = 0x50403020100uLL >> (8 * a3);
  if (a3 >= 7) {
    LOBYTE(v3) = 4;
  }
  self->_transportType = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10010u, v3);
  }
}

- (void)setNextManeuverRampType:(int)a3
{
  self->_nextManeuverRampType = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1003Bu, (unsigned __int16)a3);
  }
}

- (void)setRampType:(int)a3
{
  self->_rampType = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x15u, (unsigned __int16)a3);
  }
}

- (void)setLineType:(unsigned int)a3
{
  if (a3)
  {
    self->_lineType = a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    if (ptr) {
      gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 1u, (unsigned __int16)a3);
    }
  }
}

- (void)setCurrentGroupedManeuverCount:(unint64_t)a3
{
  self->_unint64_t currentGroupedManeuverCount = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
  {
    if (a3 >= 5) {
      LODWORD(a3) = 5;
    }
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1002Au, a3);
  }
}

- (void)setCurrentManeuverJunctionsCount:(unint64_t)a3
{
  uint64_t Integer = GEOConfigGetInteger();
  self->_currentManeuverComplexity = Integer <= (uint64_t)a3;
  if (self->_sceneClientStyleState.__ptr_)
  {
    BOOL v6 = Integer <= (uint64_t)a3;
    ptr = self->_sceneClientStyleState.__ptr_;
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10029u, v6);
  }
}

- (void)setCurrentIncidentType:(unint64_t)a3
{
  if (a3 >= 5) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  self->_currentIncidentType = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10028u, v3);
  }
}

- (void)setNextStepLength:(double)a3
{
  if (self->_distanceRanges._immediate >= a3)
  {
    int v3 = 1;
  }
  else if (self->_distanceRanges._extremlyNear >= a3)
  {
    int v3 = 2;
  }
  else if (self->_distanceRanges._veryNear >= a3)
  {
    int v3 = 3;
  }
  else if (self->_distanceRanges._near >= a3)
  {
    int v3 = 4;
  }
  else if (self->_distanceRanges._medium >= a3)
  {
    int v3 = 5;
  }
  else if (self->_distanceRanges._far >= a3)
  {
    int v3 = 6;
  }
  else if (self->_distanceRanges._veryFar >= a3)
  {
    int v3 = 7;
  }
  else
  {
    int v3 = 8;
  }
  self->_nextStepLength = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10027u, v3);
  }
}

- (void)setCurrentStepLength:(double)a3
{
  if (self->_distanceRanges._immediate >= a3)
  {
    int v3 = 1;
  }
  else if (self->_distanceRanges._extremlyNear >= a3)
  {
    int v3 = 2;
  }
  else if (self->_distanceRanges._veryNear >= a3)
  {
    int v3 = 3;
  }
  else if (self->_distanceRanges._near >= a3)
  {
    int v3 = 4;
  }
  else if (self->_distanceRanges._medium >= a3)
  {
    int v3 = 5;
  }
  else if (self->_distanceRanges._far >= a3)
  {
    int v3 = 6;
  }
  else if (self->_distanceRanges._veryFar >= a3)
  {
    int v3 = 7;
  }
  else
  {
    int v3 = 8;
  }
  self->_currentStepLength = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1003Eu, v3);
  }
}

- (void)setCurrentManeuverType:(int)a3
{
  self->_currentManeuverType = a3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
  {
    if ((a3 - 1) > 0x57) {
      int v4 = 0;
    }
    else {
      int v4 = byte_1A28FFE8A[a3 - 1];
    }
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x10026u, v4);
  }
}

- (void)setDistanceToDestination:(double)a3
{
  self->_distanceToDestination = a3;
}

- (void)setDistanceToCurrentManeuver:(double)a3
{
  int distanceToCurrentManeuver = self->_distanceToCurrentManeuver;
  GEOConfigGetDouble();
  if (self->_distanceRanges._immediate >= a3)
  {
    unsigned __int8 v14 = 1;
    goto LABEL_18;
  }
  double extremlyNear = self->_distanceRanges._extremlyNear;
  if (extremlyNear >= a3) {
    goto LABEL_17;
  }
  double veryNear = self->_distanceRanges._veryNear;
  if (veryNear >= a3)
  {
    unsigned __int8 v14 = 3;
    if (distanceToCurrentManeuver != 2 || extremlyNear + v6 >= a3) {
      goto LABEL_18;
    }
LABEL_17:
    unsigned __int8 v14 = 2;
    goto LABEL_18;
  }
  double near = self->_distanceRanges._near;
  if (near >= a3)
  {
    unsigned __int8 v14 = 4;
    if (distanceToCurrentManeuver == 3 && veryNear + v6 < a3) {
      unsigned __int8 v14 = 3;
    }
  }
  else
  {
    double medium = self->_distanceRanges._medium;
    if (medium >= a3)
    {
      unsigned __int8 v14 = 5;
      if (distanceToCurrentManeuver == 4 && near + v6 < a3) {
        unsigned __int8 v14 = 4;
      }
    }
    else
    {
      double far = self->_distanceRanges._far;
      if (far >= a3)
      {
        unsigned __int8 v14 = 6;
        if (distanceToCurrentManeuver == 5 && medium + v6 < a3) {
          unsigned __int8 v14 = 5;
        }
      }
      else
      {
        double veryFar = self->_distanceRanges._veryFar;
        if (veryFar >= a3)
        {
          unsigned __int8 v14 = 7;
          if (distanceToCurrentManeuver == 6 && far + v6 < a3) {
            unsigned __int8 v14 = 6;
          }
        }
        else if (veryFar + v6 < a3 && distanceToCurrentManeuver == 7)
        {
          unsigned __int8 v14 = 7;
        }
        else
        {
          unsigned __int8 v14 = 8;
        }
      }
    }
  }
LABEL_18:
  self->_int distanceToCurrentManeuver = v14;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr)
  {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1001Eu, v14);
  }
}

- (void)setNavigationState:(int)a3
{
  if ((a3 - 1) >= 8) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = 0x107060504030201uLL >> (8 * (a3 - 1));
  }
  self->_navState = v3;
  ptr = self->_sceneClientStyleState.__ptr_;
  if (ptr) {
    gss::ClientStyleState<gss::ScenePropertyID>::setClientStyleAttribute((uint64_t)ptr, 0x1001Du, v3);
  }
}

- (shared_ptr<gss::StylesheetManager<gss::PropertyID>>)styleManager
{
  cntrl = self->_styleManager.__cntrl_;
  *v2 = self->_styleManager.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

- (uint64_t)setStyleManager:
{
  return a1;
}

- (shared_ptr<gss::ClientStyleState<gss::ScenePropertyID>>)sceneClientStyleState
{
  cntrl = self->_sceneClientStyleState.__cntrl_;
  *v2 = self->_sceneClientStyleState.__ptr_;
  v2[1] = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = self;
  return result;
}

@end