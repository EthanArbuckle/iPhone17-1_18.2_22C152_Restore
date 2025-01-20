@interface CLBarometerCalibrationSim
- (BOOL)feedLoiData:(RoutineVisit *)a3;
- (BOOL)inOutdoorWorkout;
- (BOOL)isInOutdoorWorkout;
- (BOOL)isInOutdoorWorkout:(int)a3;
- (BOOL)isInVisit;
- (CLBarometerCalibrationSim)initWithAOPAltimeter:(void *)a3;
- (double)getLastAltitude;
- (double)getLastAltitudeAccuracy;
- (double)getLastAltitudeTime;
- (float)getSurfacePressure;
- (id).cxx_construct;
- (id)copyCurrentBias;
- (id)latestAbsoluteAltitude;
- (void)absoluteAltitudeUpdate:(id)a3;
- (void)announceMostRecentForcedGPS:(double)a3;
- (void)dealloc;
- (void)didUpdateDataBuffer:(unint64_t)a3;
- (void)feedCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5;
- (void)feedEnclosureMaterial:(unint64_t)a3;
- (void)feedLocationData:(uint64_t)a3 data:(uint64_t)a4;
- (void)feedLoiAltitude:()vector<CLBarometerCalibration_Types:(std::allocator<CLBarometerCalibration_Types::NormalDistribution>> *)a3 :NormalDistribution;
- (void)feedPrefilteredLocationData:(uint64_t)a3 data:(uint64_t)a4;
- (void)feedPressureData:(const Sample *)a3 andTempDerivative:(float)a4 andWetState:(BOOL)a5;
- (void)feedPressureKF:(const CMKFFilteredPressureSample *)a3;
- (void)feedSubmersionState:(unsigned __int8)a3;
- (void)initContextManagersForNotification:(unint64_t)a3;
- (void)onMotionStateObserverNotification:(int)a3 activityType:(int)a4;
- (void)releaseAndClearManager:(id *)a3;
- (void)releaseContextManagersForNotification:(unint64_t)a3;
- (void)setInOutdoorWorkout:(BOOL)a3;
- (void)setLastAltitude:(double)a3;
- (void)setLastAltitudeAccuracy:(double)a3;
- (void)setLastAltitudeTime:(double)a3;
- (void)stopTrack:(id)a3;
- (void)surfacePressureCalibrationAtTime:(double)a3 andPressure:(double)a4 andLocation:(BOOL)a5;
- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6;
- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5;
- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5;
@end

@implementation CLBarometerCalibrationSim

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
}

- (CLBarometerCalibrationSim)initWithAOPAltimeter:(void *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLBarometerCalibrationSim;
  v4 = [(CLBarometerCalibrationSim *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_aopAltimeter = a3;
    v6 = [[CLBarometerCalibrationSourceAggregator alloc] initWithUniverse:0 buffers:&v4->fDataBuffers];
    v5->_sourceAggregator = v6;
    [(CLBarometerCalibrationSourceAggregator *)v6 setDelegate:v5];
    *(_OWORD *)&v5->_contextManagers.__elems_[6] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[8] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[2] = 0u;
    *(_OWORD *)&v5->_contextManagers.__elems_[4] = 0u;
    *(_OWORD *)v5->_contextManagers.__elems_ = 0u;
    [(CLBarometerCalibrationSim *)v5 initContextManagersForNotification:2];
    [(CLBarometerCalibrationSim *)v5 initContextManagersForNotification:1];
    v5->_latestAbsoluteAltitude = (CLBarometerCalibrationAbsoluteAltitude *)objc_opt_new();
    *(void *)&v5->_prevElevationAscended = 0;
    v5->_lastAltitudeTime = 1.79769313e308;
    *(int64x2_t *)&v5->_lastAltitude = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v5->_inOutdoorWorkout = 0;
    *(_WORD *)&v5->_currentUnderDEM = 0;
    v5->_sameElevationCounter = 0;
    v5->_fCurrentPressureCalibration = 101.5;
    v5->_fWetState = 0;
    v5->_thresholdManager = objc_alloc_init(CLElevationThresholdManager);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5->_elevationProfileContextManager = (CLContextManagerElevationProfile *)v5->_contextManagers.__elems_[9];
      v5->_biasEstimator = [[CLBarometerCalibrationBiasEstimator alloc] initWithUniverse:0 delegate:v5 buffers:&v5->fDataBuffers contextManager:v5->_elevationProfileContextManager];
    }
    else
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231B4B8);
      }
      v7 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "elevation profile context manager does not exist!", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10231B4B8);
        }
        v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLBarometerCalibrationSim initWithAOPAltimeter:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }
    }
  }
  return v5;
}

- (void)feedPressureData:(const Sample *)a3 andTempDerivative:(float)a4 andWetState:(BOOL)a5
{
  v9 = (char *)operator new(0x38uLL);
  *((void *)v9 + 1) = 0;
  *((void *)v9 + 2) = 0;
  *(void *)v9 = off_10231B4E8;
  int64x2_t v10 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(v9 + 24) = v10;
  *(int64x2_t *)(v9 + 40) = v10;
  *((CFAbsoluteTime *)v9 + 3) = CFAbsoluteTimeGetCurrent();
  *((float64x2_t *)v9 + 2) = vcvtq_f64_f32(*(float32x2_t *)&a3->var1.var0);
  *((double *)v9 + 6) = a4;
  self->_fWetState = a5;
  sourceAggregator = self->_sourceAggregator;
  v12 = v9 + 24;
  v13 = (std::__shared_weak_count *)v9;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v9 + 1, 1uLL, memory_order_relaxed);
  [(CLBarometerCalibrationSourceAggregator *)sourceAggregator didUpdateSource:1 withData:&v12];
  if (v13) {
    sub_1000DB0A0(v13);
  }
  sub_1000DB0A0((std::__shared_weak_count *)v9);
}

- (void)feedPressureKF:(const CMKFFilteredPressureSample *)a3
{
  v5 = (char *)operator new(0x38uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)v5 = off_10231B538;
  int64x2_t v6 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(int64x2_t *)(v5 + 24) = v6;
  *(int64x2_t *)(v5 + 40) = v6;
  *((CFAbsoluteTime *)v5 + 3) = CFAbsoluteTimeGetCurrent();
  int8x16_t v7 = (int8x16_t)vcvtq_f64_f32(*(float32x2_t *)&a3->var2);
  *((int8x16_t *)v5 + 2) = vextq_s8(v7, v7, 8uLL);
  *((double *)v5 + 6) = a3->var4;
  sourceAggregator = self->_sourceAggregator;
  v9 = v5 + 24;
  int64x2_t v10 = (std::__shared_weak_count *)v5;
  atomic_fetch_add_explicit((atomic_ullong *volatile)v5 + 1, 1uLL, memory_order_relaxed);
  [(CLBarometerCalibrationSourceAggregator *)sourceAggregator didUpdateSource:5 withData:&v9];
  if (v10) {
    sub_1000DB0A0(v10);
  }
  sub_1000DB0A0((std::__shared_weak_count *)v5);
}

- (void)feedCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
  if (*(void *)&self->_prevElevationAscended != __PAIR64__(a4, a3))
  {
    self->_int sameElevationCounter = 0;
LABEL_5:
    uint64_t v9 = 0;
    self->_prevElevationAscended = a3;
    self->_prevElevationDescended = a4;
    p_contextManagers = &self->_contextManagers;
    do
    {
      v11 = p_contextManagers->__elems_[v9];
      *(double *)&v12[1] = a5;
      unsigned int v13 = a3;
      unsigned int v14 = a4;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      [(CLBarometerCalibrationContextManager *)v11 stepCountElevationNotification:v12];
      ++v9;
    }
    while (v9 != 10);
    return;
  }
  int sameElevationCounter = self->_sameElevationCounter;
  if (sameElevationCounter >= 10)
  {
    self->_int sameElevationCounter = 10;
    return;
  }
  self->_int sameElevationCounter = sameElevationCounter + 1;
  if (sameElevationCounter != 9) {
    goto LABEL_5;
  }
}

- (void)feedLocationData:(uint64_t)a3 data:(uint64_t)a4
{
  sub_1000EF97C((uint64_t)v33, a4);
  unsigned __int8 v6 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:v33];

  if (v38) {
    sub_1000DB0A0(v38);
  }
  if (v37 < 0) {
    operator delete(__p);
  }
  if (v35) {
    sub_1000DB0A0(v35);
  }
  if (v34) {
    sub_1000DB0A0(v34);
  }
  if (v6)
  {
    sub_100802130(&v31);
    double v7 = *(double *)(a4 + 76);
    uint64_t v8 = v31;
    *(double *)uint64_t v31 = v7;
    *(_OWORD *)(v8 + 8) = *(_OWORD *)(a4 + 4);
    *(int8x16_t *)(v8 + 24) = vextq_s8(*(int8x16_t *)(a4 + 20), *(int8x16_t *)(a4 + 20), 8uLL);
    *(void *)(v8 + 40) = *(void *)(a4 + 36);
    int v9 = *(_DWORD *)(a4 + 96);
    *(_DWORD *)(v8 + 100) = v9;
    *(_DWORD *)(v8 + 96) = *(_DWORD *)(a4 + 140);
    *(_DWORD *)(v8 + 104) = *(_DWORD *)(a4 + 216);
    *(void *)(v8 + 48) = *(void *)(a4 + 536);
    double v10 = *(double *)(a4 + 544);
    *(double *)(v8 + 56) = v10;
    *(_OWORD *)(v8 + 64) = *(_OWORD *)(a4 + 520);
    *(_OWORD *)(v8 + 80) = *(_OWORD *)(a4 + 44);
    *(_OWORD *)(v8 + 112) = *(_OWORD *)(a4 + 704);
    *(unsigned char *)(v8 + 128) = 0;
    if (v9 != 1 || v10 <= 0.0 || ([*(id *)(a1 + 584) timestamp], vabdd_f64(v7, v11) >= 5.0))
    {
      *(unsigned char *)(a1 + 624) = 0;
LABEL_29:
      if (*(unsigned char *)(a1 + 624)) {
        *(_WORD *)(v31 + 130) |= 1u;
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231B4B8);
      }
      long long v22 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
      {
        int v23 = *(unsigned __int16 *)(v31 + 130);
        *(_DWORD *)buf = 67109120;
        int v43 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "location altitude state %u", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10231B4B8);
        }
        int v25 = *(unsigned __int16 *)(v31 + 130);
        int v40 = 67109120;
        int v41 = v25;
        v26 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim feedLocationData:data:]", "%s\n", v26);
        if (v26 != (char *)buf) {
          free(v26);
        }
      }
      v24 = *(void **)(a1 + 568);
      uint64_t v29 = v31;
      v30 = v32;
      if (v32) {
        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [v24 didUpdateSource:0 withData:&v29];
      if (v30) {
        sub_1000DB0A0(v30);
      }
      if (v32) {
        sub_1000DB0A0(v32);
      }
      return;
    }
    uint64_t v12 = v31;
    if (*(unsigned char *)(a1 + 680)) {
      *(_WORD *)(v31 + 130) |= 2u;
    }
    if (*(_DWORD *)(v12 + 104) == 2) {
      *(_WORD *)(v12 + 130) |= 4u;
    }
    [*(id *)(a1 + 584) accuracy];
    double v14 = *(double *)(v31 + 48);
    double v15 = v13 + 20.0 + *(double *)(v31 + 56);
    long long v16 = *(void **)(a1 + 584);
    if (*(unsigned char *)(a1 + 624))
    {
      [v16 altitude];
      if (v14 - v17 < v15 + -3.0)
      {
        char v18 = 0;
LABEL_23:
        *(unsigned char *)(a1 + 624) = v18;
      }
    }
    else
    {
      [v16 altitude];
      if (v14 - v19 > v15)
      {
        char v18 = 1;
        goto LABEL_23;
      }
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10231B4B8);
    }
    long long v20 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      int v21 = *(unsigned __int16 *)(v31 + 130);
      *(_DWORD *)buf = 67109120;
      int v43 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "good DEM data: location altitude state is %u", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231B4B8);
      }
      int v27 = *(unsigned __int16 *)(v31 + 130);
      int v40 = 67109120;
      int v41 = v27;
      v28 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim feedLocationData:data:]", "%s\n", v28);
      if (v28 != (char *)buf) {
        free(v28);
      }
    }
    goto LABEL_29;
  }
}

- (void)feedPrefilteredLocationData:(uint64_t)a3 data:(uint64_t)a4
{
  sub_1000EF97C((uint64_t)v13, a4);
  unsigned __int8 v6 = +[CLBarometerCalibrationSourceAggregator isLocationUsefulForCalibration:v13];

  if (v18) {
    sub_1000DB0A0(v18);
  }
  if (v17 < 0) {
    operator delete(__p);
  }
  if (v15) {
    sub_1000DB0A0(v15);
  }
  if (v14) {
    sub_1000DB0A0(v14);
  }
  if (v6)
  {
    sub_100802130(&v11);
    double v7 = v11;
    void *v11 = *(void *)(a4 + 76);
    *(_OWORD *)(v7 + 1) = *(_OWORD *)(a4 + 4);
    *(int8x16_t *)(v7 + 3) = vextq_s8(*(int8x16_t *)(a4 + 20), *(int8x16_t *)(a4 + 20), 8uLL);
    v7[5] = *(void *)(a4 + 36);
    *((_DWORD *)v7 + 25) = *(_DWORD *)(a4 + 96);
    *((_DWORD *)v7 + 24) = *(_DWORD *)(a4 + 140);
    *((_DWORD *)v7 + 26) = *(_DWORD *)(a4 + 216);
    *((_OWORD *)v7 + 3) = *(_OWORD *)(a4 + 536);
    *((_OWORD *)v7 + 4) = *(_OWORD *)(a4 + 520);
    *((_OWORD *)v7 + 5) = *(_OWORD *)(a4 + 44);
    *((_OWORD *)v7 + 7) = *(_OWORD *)(a4 + 704);
    *((unsigned char *)v7 + 128) = 1;
    uint64_t v8 = *(void **)(a1 + 568);
    int v9 = v7;
    double v10 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [v8 didUpdateSource:6 withData:&v9];
    if (v10) {
      sub_1000DB0A0(v10);
    }
    if (v12) {
      sub_1000DB0A0(v12);
    }
  }
}

- (void)didUpdateDataBuffer:(unint64_t)a3
{
  uint64_t v4 = 0;
  p_contextManagers = &self->_contextManagers;
  do
    [(CLBarometerCalibrationContextManager *)p_contextManagers->__elems_[v4++] sourceUpdated:a3];
  while (v4 != 10);
}

- (void)stopTrack:(id)a3
{
  if ([a3 fNotification] == (id)2)
  {
    [a3 fStartTime];
    double v6 = v5;
    [a3 fEndTime];
    double v8 = v7;
    [a3 fNextTrackStartTime];
    [(CLBarometerCalibrationSim *)self updateElevationBiasBetweenStartTime:v6 andEndTime:v8 andNextTrackStartTime:v9];
  }
}

- (void)absoluteAltitudeUpdate:(id)a3
{
  double v5 = (CLBarometerCalibrationAbsoluteAltitude *)[a3 copy];
  self->_latestAbsoluteAltitude = v5;
  int v11 = -8388609;
  int v12 = 2139095039;
  thresholdManager = self->_thresholdManager;
  [(CLBarometerCalibrationAbsoluteAltitude *)v5 altitude];
  float v8 = v7;
  [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude accuracy];
  *(float *)&double v10 = v9;
  *(float *)&double v9 = v8;
  [(CLElevationThresholdManager *)thresholdManager updateWithAltitude:&v12 andAccuracy:&v11 upperBound:v9 lowerBound:v10];
  [(CLBarometerCalibrationSim *)self alertElevationAlertClientsOnChange];
}

- (id)copyCurrentBias
{
  return [(CLBarometerCalibrationBiasEstimator *)self->_biasEstimator copyCurrentBias];
}

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
}

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
}

- (void)initContextManagersForNotification:(unint64_t)a3
{
  if (a3 == 1)
  {
    if (self->_contextManagers.__elems_[5]) {
      goto LABEL_8;
    }
    uint64_t v4 = &self->_contextManagers.__elems_[5];
    double v5 = off_10229C0B8;
  }
  else
  {
    if (a3 != 2 || self->_contextManagers.__elems_[6]) {
      goto LABEL_8;
    }
    uint64_t v4 = &self->_contextManagers.__elems_[6];
    double v5 = off_10229C0C0;
  }
  CLBarometerCalibrationSim *v4 = (CLBarometerCalibrationContextManager *)[objc_alloc(*v5) initWithUniverse:0 delegate:self withBuffer:&self->fDataBuffers withSourceAggregator:self->_sourceAggregator];
LABEL_8:
  if (!self->_contextManagers.__elems_[7]) {
    self->_contextManagers.__elems_[7] = (CLBarometerCalibrationContextManager *)[[CLContextManagerWaterSubmersion alloc] initWithUniverse:0 delegate:self withBuffer:&self->fDataBuffers withSourceAggregator:self->_sourceAggregator];
  }
}

- (void)releaseContextManagersForNotification:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v3 = 536;
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    uint64_t v3 = 528;
  }
  [(CLBarometerCalibrationSim *)self releaseAndClearManager:(char *)self + v3];
}

- (void)releaseAndClearManager:(id *)a3
{
  if (*a3)
  {
    [*a3 cleanup];

    *a3 = 0;
  }
}

- (void)dealloc
{
  [(CLBarometerCalibrationSim *)self releaseContextManagersForNotification:2];
  [(CLBarometerCalibrationSim *)self releaseContextManagersForNotification:1];

  self->_biasEstimator = 0;
  self->_latestAbsoluteAltitude = 0;

  self->_thresholdManager = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBarometerCalibrationSim;
  [(CLBarometerCalibrationSim *)&v3 dealloc];
}

- (BOOL)inOutdoorWorkout
{
  return self->_inOutdoorWorkout;
}

- (BOOL)isInOutdoorWorkout:(int)a3
{
  BOOL result = 1;
  if (a3 <= 19089)
  {
    if (a3 > 8 || ((1 << a3) & 0x150) == 0) {
      return 0;
    }
  }
  else
  {
    if (a3 > 90602)
    {
      if (a3 == 90603) {
        return result;
      }
      int v4 = 519150;
    }
    else
    {
      if (a3 == 19090) {
        return result;
      }
      int v4 = 19150;
    }
    if (a3 != v4) {
      return 0;
    }
  }
  return result;
}

- (void)onMotionStateObserverNotification:(int)a3 activityType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10231B4B8);
  }
  double v7 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received workout activity.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10231B4B8);
    }
    int v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  if (!a3)
  {
    if ([(CLBarometerCalibrationSim *)self isInOutdoorWorkout:v4])
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231B4B8);
      }
      float v8 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        BOOL v16 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "motion state observer updates,activityType,%d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10231B4B8);
        }
        double v14 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]", "%s\n", v14);
        if (v14 != (char *)buf) {
          free(v14);
        }
      }
      BOOL v9 = 1;
    }
    else
    {
      BOOL v9 = 0;
    }
    self->_BOOL inOutdoorWorkout = v9;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10231B4B8);
    }
    double v10 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL inOutdoorWorkout = self->_inOutdoorWorkout;
      *(_DWORD *)buf = 67109120;
      BOOL v16 = inOutdoorWorkout;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "outdoor workout status updated,inOutdoorWorkout,%d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10231B4B8);
      }
      double v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim onMotionStateObserverNotification:activityType:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)feedEnclosureMaterial:(unint64_t)a3
{
  objc_super v3 = self->_contextManagers.__elems_[7];
  if (v3) {
    [(CLBarometerCalibrationContextManager *)v3 feedEnclosureMaterial:a3];
  }
}

- (BOOL)feedLoiData:(RoutineVisit *)a3
{
  if (a3->var2 == 0.0 && a3->var3 == 0.0) {
    return 0;
  }
  double v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3->var0];
  double v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3->var1];
  if (([(NSDate *)v6 isEqual:+[NSDate distantPast]] & 1) != 0
    || ([(NSDate *)v7 isEqual:+[NSDate distantFuture]] & 1) == 0)
  {
    if (([(NSDate *)v6 isEqual:+[NSDate distantPast]] & 1) != 0
      || ([(NSDate *)v7 isEqual:+[NSDate distantFuture]] & 1) != 0)
    {
      goto LABEL_11;
    }
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
  }
  self->_BOOL inVisit = v8;
LABEL_11:
  if (([(NSDate *)v6 isEqual:+[NSDate distantPast]] & 1) == 0
    && a3->var1 == 0.0)
  {
    self->_BOOL inVisit = 1;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10231B4B8);
  }
  BOOL v9 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inVisit = self->_inVisit;
    *(_DWORD *)buf = 67109120;
    BOOL v13 = inVisit;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "received visit for altimeter, inVisit, %d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10231B4B8);
    }
    int v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationSim feedLoiData:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  [(CLBarometerCalibrationBiasEstimator *)self->_biasEstimator updateVisitState:self->_inVisit arrivalTime:a3->var0 departureTime:a3->var1];
  return self->_inVisit;
}

- (void)feedLoiAltitude:()vector<CLBarometerCalibration_Types:(std::allocator<CLBarometerCalibration_Types::NormalDistribution>> *)a3 :NormalDistribution
{
}

- (BOOL)isInVisit
{
  return self->_inVisit;
}

- (id)latestAbsoluteAltitude
{
  return self->_latestAbsoluteAltitude;
}

- (void)announceMostRecentForcedGPS:(double)a3
{
}

- (void)surfacePressureCalibrationAtTime:(double)a3 andPressure:(double)a4 andLocation:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v8 = (char *)operator new(0x30uLL);
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)BOOL v8 = off_1022DCB58;
  *(int64x2_t *)(v8 + 24) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *((void *)v8 + 5) = 3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  *((_DWORD *)v8 + 10) = !v5;
  *((CFAbsoluteTime *)v8 + 3) = Current;
  *((double *)v8 + 4) = a4;
  if (vabdd_f64(self->_fCurrentPressureCalibration, a4) >= 3.0 || !self->_fWetState)
  {
    float v10 = a4;
    self->_fCurrentPressureCalibration = v10;
    sourceAggregator = self->_sourceAggregator;
    int v12 = v8 + 24;
    BOOL v13 = (std::__shared_weak_count *)v8;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v8 + 1, 1uLL, memory_order_relaxed);
    [(CLBarometerCalibrationSourceAggregator *)sourceAggregator didUpdateSource:7 withData:&v12];
    if (v13) {
      sub_1000DB0A0(v13);
    }
  }
  sub_1000DB0A0((std::__shared_weak_count *)v8);
}

- (float)getSurfacePressure
{
  return self->_fCurrentPressureCalibration;
}

- (void)feedSubmersionState:(unsigned __int8)a3
{
  BOOL v5 = (std::__shared_weak_count *)operator new(0x28uLL);
  v5->__shared_owners_ = 0;
  v5->__shared_weak_owners_ = 0;
  v5->__vftable = (std::__shared_weak_count_vtbl *)off_1022DCB08;
  v5[1].__vftable = (std::__shared_weak_count_vtbl *)0x7FEFFFFFFFFFFFFFLL;
  v5[1].__shared_owners_ = 0;
  *(CFAbsoluteTime *)&v5[1].__vftable = CFAbsoluteTimeGetCurrent();
  LOBYTE(v5[1].__shared_owners_) = a3;
  sourceAggregator = self->_sourceAggregator;
  double v7 = v5 + 1;
  BOOL v8 = v5;
  atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  [(CLBarometerCalibrationSourceAggregator *)sourceAggregator didUpdateSource:8 withData:&v7];
  if (v8) {
    sub_1000DB0A0(v8);
  }
  sub_1000DB0A0(v5);
}

- (BOOL)isInOutdoorWorkout
{
  return self->_inOutdoorWorkout;
}

- (void)setInOutdoorWorkout:(BOOL)a3
{
  self->_BOOL inOutdoorWorkout = a3;
}

- (double)getLastAltitude
{
  return self->_lastAltitude;
}

- (void)setLastAltitude:(double)a3
{
  self->_lastAltitude = a3;
}

- (double)getLastAltitudeAccuracy
{
  return self->_lastAltitudeAccuracy;
}

- (void)setLastAltitudeAccuracy:(double)a3
{
  self->_lastAltitudeAccuracy = a3;
}

- (double)getLastAltitudeTime
{
  return self->_lastAltitudeTime;
}

- (void)setLastAltitudeTime:(double)a3
{
  self->_lastAltitudeTime = a3;
}

- (void).cxx_destruct
{
  for (uint64_t i = 440; i != -40; i -= 48)
    sub_1000DAF68((Class *)((char *)&self->super.isa + i));
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(void *)((char *)self + 636) = 0xFF7FFFFF7F7FFFFFLL;
  return self;
}

@end