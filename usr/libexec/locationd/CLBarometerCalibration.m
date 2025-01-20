@interface CLBarometerCalibration
+ (BOOL)isNotificationSupported:(unint64_t)a3;
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isIHAAuthorized;
- (BOOL)isInOutdoorWorkout;
- (BOOL)isInOutdoorWorkout:(NotificationData *)a3;
- (BOOL)isInVisit;
- (CLBarometerCalibration)init;
- (double)getLastAltitude;
- (double)getLastAltitudeAccuracy;
- (double)getLastAltitudeTime;
- (id).cxx_construct;
- (id)copyCurrentBias;
- (id)latestAbsoluteAltitude;
- (void)absoluteAltitudeUpdate:(id)a3;
- (void)acknowledgeNotification:(unint64_t)a3;
- (void)alertElevationAlertClientsOnChange;
- (void)announceMostRecentForcedGPS:(double)a3;
- (void)beginService;
- (void)didUpdateDataBuffer:(unint64_t)a3;
- (void)endService;
- (void)fetchLoiFromId:(id)a3 atTimestamp:(double)a4;
- (void)fetchVisitStatusAtStart;
- (void)initAllDayContextManagers;
- (void)initContextManagersForNotification:(unint64_t)a3;
- (void)logBuffers;
- (void)onDaemonStatusNotification:(int)a3 data:(NotificationData *)a4;
- (void)onMobileAssetNotification:(int)a3 data:(NotificationData *)a4;
- (void)onMotionStateMediatorNotification:(int)a3 data:(NotificationData *)a4;
- (void)onMotionStateObserverNotification:(int)a3 data:(NotificationData *)a4;
- (void)onOdometerNotification:(int)a3 data:(NotificationData *)a4;
- (void)onVisit:(id)a3;
- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7;
- (void)registerClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4;
- (void)registerClient:(id)a3 forNotification:(unint64_t)a4;
- (void)releaseAllContextManagers;
- (void)releaseAndClearManager:(id *)a3;
- (void)releaseContextManagersForNotification:(unint64_t)a3;
- (void)sendClientRegisterAnalyticsWithCurrentUncertainty:(double)a3 andTime:(double)a4;
- (void)sendInVisit:(BOOL)a3;
- (void)setAltimeterReleaseTimer;
- (void)setInOutdoorWorkout:(BOOL)a3;
- (void)setLastAltitude:(double)a3;
- (void)setLastAltitudeAccuracy:(double)a3;
- (void)setLastAltitudeTime:(double)a3;
- (void)setupAltimeterReleaseTimer;
- (void)startTrack:(id)a3;
- (void)stopTrack:(id)a3;
- (void)submersionMeasurementUpdate:(id)a3;
- (void)submersionStateUpdate:(id)a3;
- (void)unregisterClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4;
- (void)unregisterClient:(id)a3 forNotification:(unint64_t)a4;
- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6;
- (void)updateCompanionConnected:(BOOL)a3;
- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5;
- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5;
- (void)updateWetState;
- (void)writeThresholdToMsl:(float)a3 withTimestamp:(double)a4 andClientId:(id)a5 active:(BOOL)a6;
@end

@implementation CLBarometerCalibration

- (void)onOdometerNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 != 8) {
    return;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *((void *)a4 + 1);
    int v8 = *((_DWORD *)a4 + 4);
    int v9 = *((_DWORD *)a4 + 5);
    int v10 = *((unsigned __int16 *)a4 + 27);
    int v11 = *((_DWORD *)a4 + 10);
    *(_DWORD *)buf = 134219008;
    uint64_t v47 = v7;
    __int16 v48 = 1024;
    int v49 = v8;
    __int16 v50 = 1024;
    int v51 = v9;
    __int16 v52 = 1024;
    int v53 = v10;
    __int16 v54 = 1024;
    int v55 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "received odometer notification, startTime %f, elevationAscended %u, elevationDescended %u, failure mode %u, source %u", buf, 0x24u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    uint64_t v38 = *((void *)a4 + 1);
    int v39 = *((_DWORD *)a4 + 4);
    int v40 = *((_DWORD *)a4 + 5);
    int v41 = *((unsigned __int16 *)a4 + 27);
    int v42 = *((_DWORD *)a4 + 10);
    int v59 = 134219008;
    uint64_t v60 = v38;
    __int16 v61 = 1024;
    int v62 = v39;
    __int16 v63 = 1024;
    int v64 = v40;
    __int16 v65 = 1024;
    int v66 = v41;
    __int16 v67 = 1024;
    int v68 = v42;
    v43 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration onOdometerNotification:data:]", "%s\n", v43);
    if (v43 != (char *)buf) {
      free(v43);
    }
  }
  unsigned int v12 = [(CLWaterStateInterface *)self->waterStateInterface isWaterStateON];
  if ((sub_10010145C() & v12) == 1)
  {
    uint64_t v13 = sub_1000D2E34(0);
    (*(void (**)(void))(*(void *)(v13 + 112) + 48))();
    if (self->_logHIDShower)
    {
      sub_10170140C(buf);
      sub_101726708((uint64_t)buf);
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v58 |= 1u;
      CFAbsoluteTime v56 = Current;
      uint64_t v15 = v57;
      *(unsigned char *)(v57 + 20) |= 2u;
      *(unsigned char *)(v15 + 16) = 1;
      if (qword_10248AF88 != -1) {
        dispatch_once(&qword_10248AF88, &stru_1022DD510);
      }
      if (qword_10248AF90) {
        sub_1019E5150(qword_10248AF90, (uint64_t)buf);
      }
      sub_101706914((PB::Base *)buf);
    }
  }
  sub_100103240();
  if (!sub_10010145C() || *((_DWORD *)a4 + 10) != 1)
  {
    sub_100103240();
    if (!sub_10016CCBC() || *((_DWORD *)a4 + 10)) {
      return;
    }
    if (self->_prevElevationAscended == *((_DWORD *)a4 + 4) && self->_prevElevationDescended == *((_DWORD *)a4 + 5))
    {
      p_int sameElevationCounter = &self->_sameElevationCounter;
      int sameElevationCounter = self->_sameElevationCounter;
      if (sameElevationCounter > 9) {
        goto LABEL_25;
      }
      int *p_sameElevationCounter = sameElevationCounter + 1;
      if (sameElevationCounter == 9) {
        return;
      }
    }
    else
    {
      self->_int sameElevationCounter = 0;
    }
    uint64_t v29 = 0;
    self->_prevElevationAscended = *((_DWORD *)a4 + 4);
    self->_prevElevationDescended = *((_DWORD *)a4 + 5);
    p_contextManagers = &self->_contextManagers;
    do
    {
      v31 = p_contextManagers->__elems_[v29];
      long long v32 = *((_OWORD *)a4 + 9);
      v44[8] = *((_OWORD *)a4 + 8);
      v44[9] = v32;
      long long v33 = *((_OWORD *)a4 + 11);
      v44[10] = *((_OWORD *)a4 + 10);
      v44[11] = v33;
      long long v34 = *((_OWORD *)a4 + 5);
      v44[4] = *((_OWORD *)a4 + 4);
      v44[5] = v34;
      long long v35 = *((_OWORD *)a4 + 7);
      v44[6] = *((_OWORD *)a4 + 6);
      v44[7] = v35;
      long long v36 = *((_OWORD *)a4 + 1);
      v44[0] = *(_OWORD *)a4;
      v44[1] = v36;
      long long v37 = *((_OWORD *)a4 + 3);
      v44[2] = *((_OWORD *)a4 + 2);
      v44[3] = v37;
      [(CLBarometerCalibrationContextManager *)v31 stepCountElevationNotification:v44];
      ++v29;
    }
    while (v29 != 10);
    return;
  }
  self->_isSensorWet = (*((_WORD *)a4 + 27) & 0x1000) != 0;
  sub_10006ACBC(buf, "BarometerWet", (unsigned __int8 *)&self->_isSensorWet, 0);
  self->_isSensorWet = buf[1];
  [(CLBarometerCalibration *)self updateWetState];
  if (self->_prevElevationAscended != *((_DWORD *)a4 + 4) || self->_prevElevationDescended != *((_DWORD *)a4 + 5))
  {
    int v18 = 0;
    p_int sameElevationCounter = &self->_sameElevationCounter;
    goto LABEL_27;
  }
  p_int sameElevationCounter = &self->_sameElevationCounter;
  int v17 = self->_sameElevationCounter;
  if (v17 > 9)
  {
LABEL_25:
    int *p_sameElevationCounter = 10;
    return;
  }
  int v18 = v17 + 1;
LABEL_27:
  int *p_sameElevationCounter = v18;
  if (!self->_isSensorWet && v18 <= 9)
  {
    uint64_t v20 = 0;
    self->_prevElevationAscended = *((_DWORD *)a4 + 4);
    self->_prevElevationDescended = *((_DWORD *)a4 + 5);
    v21 = &self->_contextManagers;
    do
    {
      v22 = v21->__elems_[v20];
      long long v23 = *((_OWORD *)a4 + 9);
      v45[8] = *((_OWORD *)a4 + 8);
      v45[9] = v23;
      long long v24 = *((_OWORD *)a4 + 11);
      v45[10] = *((_OWORD *)a4 + 10);
      v45[11] = v24;
      long long v25 = *((_OWORD *)a4 + 5);
      v45[4] = *((_OWORD *)a4 + 4);
      v45[5] = v25;
      long long v26 = *((_OWORD *)a4 + 7);
      v45[6] = *((_OWORD *)a4 + 6);
      v45[7] = v26;
      long long v27 = *((_OWORD *)a4 + 1);
      v45[0] = *(_OWORD *)a4;
      v45[1] = v27;
      long long v28 = *((_OWORD *)a4 + 3);
      v45[2] = *((_OWORD *)a4 + 2);
      v45[3] = v28;
      [(CLBarometerCalibrationContextManager *)v22 stepCountElevationNotification:v45];
      ++v20;
    }
    while (v20 != 10);
  }
}

- (void)didUpdateDataBuffer:(unint64_t)a3
{
  uint64_t v5 = 0;
  p_contextManagers = &self->_contextManagers;
  do
    [(CLBarometerCalibrationContextManager *)p_contextManagers->__elems_[v5++] sourceUpdated:a3];
  while (v5 != 10);
  if (a3 == 1)
  {
    sub_100096374((uint64_t)v11, &self->fDataBuffers.__elems_[1].__map_.__first_);
    uint64_t v7 = v13;
    int v8 = (uint64_t *)(*(void *)(v11[1] + (((unint64_t)(v13 + v12 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (v13 + v12 - 1));
    uint64_t v10 = *v8;
    int v9 = (std::__shared_weak_count *)v8[1];
    if (v9)
    {
      atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v7 = v13;
    }
    if (v7) {
      self->_mostRecentFilteredPressure = *(double *)(v10 + 8) * 1000.0;
    }
    if (v9) {
      sub_1000DB0A0(v9);
    }
    sub_1000DAF68(v11);
  }
}

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
}

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
}

- (void)onMotionStateMediatorNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 2)
  {
    uint64_t v8 = 0;
    p_contextManagers = &self->_contextManagers;
    do
    {
      uint64_t v10 = p_contextManagers->__elems_[v8];
      memcpy(__dst, a4, sizeof(__dst));
      [(CLBarometerCalibrationContextManager *)v10 onMotionStateMediatorData:__dst];
      ++v8;
    }
    while (v8 != 10);
  }
}

- (BOOL)isInVisit
{
  return self->_inVisit;
}

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_102480078 != -1) {
    dispatch_once(&qword_102480078, &stru_1022DD438);
  }
  return (id)qword_102480070;
}

- (CLBarometerCalibration)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLBarometerCalibration;
  return [(CLBarometerCalibration *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLBarometerCalibrationProtocol outboundProtocol:&OBJC_PROTOCOL___CLBarometerCalibrationClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_102480088 != -1) {
    dispatch_once(&qword_102480088, &stru_1022DD458);
  }
  return byte_102480080;
}

+ (BOOL)isNotificationSupported:(unint64_t)a3
{
  sub_100103240();
  int v4 = sub_10073E30C();
  sub_100103240();
  if (v4) {
    unsigned __int8 v5 = sub_10016CCBC();
  }
  else {
    unsigned __int8 v5 = sub_100743274();
  }
  unsigned __int8 v14 = v5;
  sub_10006ACBC(&v15, "BarometerCalibrationEnableFeature", &v14, 0);
  int v6 = v16;
  unsigned __int8 v14 = 0;
  sub_10006ACBC(&v15, "AbsoluteAltitudeEnabled", &v14, 0);
  int v7 = v16;
  unsigned __int8 v14 = 0;
  sub_10006ACBC(&v15, "AllowWaterSubmersionSimulation", &v14, 0);
  int v8 = v16;
  unsigned __int8 v14 = 0;
  sub_10006ACBC(&v15, "AllowWaterSubmersionOverride", &v14, 0);
  switch(a3)
  {
    case 0uLL:
      unsigned int v9 = (sub_10074157C() >> 4) & 1;
      if (v6) {
        LOBYTE(v10) = v9;
      }
      else {
        LOBYTE(v10) = 0;
      }
      break;
    case 1uLL:
      if ((sub_10074157C() & 0x10) == 0) {
        goto LABEL_12;
      }
      sub_100103240();
      if (sub_10016CCBC())
      {
        LOBYTE(v10) = 1;
      }
      else
      {
        sub_100103240();
        unint64_t v12 = ((unint64_t)sub_1000A16E8() >> 51) & 1;
        if (v7) {
          LOBYTE(v10) = 1;
        }
        else {
          LOBYTE(v10) = v12;
        }
      }
      break;
    case 2uLL:
      unsigned int v10 = (sub_10074157C() >> 4) & 1;
      break;
    case 3uLL:
      int v11 = v16;
      LOBYTE(v10) = sub_1007432FC();
      if (v11 | v8) {
        LOBYTE(v10) = 1;
      }
      break;
    default:
LABEL_12:
      LOBYTE(v10) = 0;
      break;
  }
  return v10;
}

- (void)beginService
{
  objc_super v3 = objc_alloc_init(CLWaterStateInterface);
  self->waterStateInterface = v3;
  [(CLWaterStateInterface *)v3 connect];
  int v4 = [[CLBarometerCalibrationSourceAggregator alloc] initWithUniverse:[(CLBarometerCalibration *)self universe] buffers:&self->fDataBuffers];
  self->_sourceAggregator = v4;
  [(CLBarometerCalibrationSourceAggregator *)v4 setDelegate:self];
  for (uint64_t i = 0; i != 5; ++i)
    self->_clientSets[i] = (NSMutableSet *)objc_opt_new();
  *(_OWORD *)self->_contextManagers.__elems_ = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[2] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[4] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[6] = 0u;
  *(_OWORD *)&self->_contextManagers.__elems_[8] = 0u;
  if (+[CLBarometerCalibration isNotificationSupported:2])
  {
    [(CLBarometerCalibration *)self initAllDayContextManagers];
    [(CLBarometerCalibration *)self universe];
    sub_1004A1714();
  }
  [(CLBarometerCalibration *)self universe];
  sub_10060F068();
}

- (void)endService
{
  [(CLBarometerCalibration *)self releaseAllContextManagers];
  for (uint64_t i = 0; i != 5; ++i)

  self->_biasEstimator = 0;
  self->_latestAbsoluteAltitude = 0;
  [(CLTimer *)self->_releaseAltimeterContextTimer invalidate];

  self->_releaseAltimeterContextTimer = 0;
  [(CLTimer *)self->_fetchRoutineVisitsTimer invalidate];

  self->_fetchRoutineVisitsTimer = 0;
  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitorProxy stopLeechingVisitsForClient:self];

  [(CLWaterStateInterface *)self->waterStateInterface disconnect];
  self->_thresholdManager = 0;
}

- (void)releaseAndClearManager:(id *)a3
{
  if (*a3)
  {
    [*a3 cleanup];

    *a3 = 0;
  }
}

- (void)initContextManagersForNotification:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      objc_super v3 = &self->_contextManagers.__elems_[3];
      if (self->_contextManagers.__elems_[3]) {
        return;
      }
      int v4 = off_10229C0C8;
      goto LABEL_10;
    case 2uLL:
      objc_super v3 = &self->_contextManagers.__elems_[6];
      if (self->_contextManagers.__elems_[6]) {
        return;
      }
      int v4 = off_10229C0C0;
      goto LABEL_10;
    case 1uLL:
      objc_super v3 = &self->_contextManagers.__elems_[5];
      if (!self->_contextManagers.__elems_[5])
      {
        int v4 = off_10229C0B8;
LABEL_10:
        *objc_super v3 = (CLBarometerCalibrationContextManager *)[objc_alloc(*v4) initWithUniverse:-[CLBarometerCalibration universe](self, "universe") delegate:self withBuffer:&self->fDataBuffers withSourceAggregator:self->_sourceAggregator];
      }
      break;
  }
}

- (void)releaseContextManagersForNotification:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 2) {
      return;
    }
    uint64_t v3 = 6;
  }
  else
  {
    uint64_t v3 = 3;
  }
  [(CLBarometerCalibration *)self releaseAndClearManager:&self->_contextManagers.__elems_[v3]];
}

- (void)releaseAllContextManagers
{
  uint64_t v3 = 0;
  p_contextManagers = &self->_contextManagers;
  do
  {
    [(CLBarometerCalibration *)self releaseAndClearManager:(char *)p_contextManagers + v3];
    v3 += 8;
  }
  while (v3 != 80);
}

- (void)initAllDayContextManagers
{
  p_contextManagers = &self->_contextManagers;
  if (!self->_contextManagers.__elems_[6]) {
    self->_contextManagers.__elems_[6] = (CLBarometerCalibrationContextManager *)[[CLContextManagerBiasEstimationScheduler alloc] initWithUniverse:[(CLBarometerCalibration *)self universe] delegate:self withBuffer:&self->fDataBuffers withSourceAggregator:self->_sourceAggregator];
  }
  if (!p_contextManagers->__elems_[9]) {
    p_contextManagers->__elems_[9] = (CLBarometerCalibrationContextManager *)[[CLContextManagerElevationProfile alloc] initWithUniverse:[(CLBarometerCalibration *)self universe] delegate:self withBuffer:&self->fDataBuffers withSourceAggregator:self->_sourceAggregator];
  }
  unsigned __int8 v12 = 0;
  sub_10006ACBC(v13, "AllowWaterSubmersionSimulation", &v12, 0);
  if (v13[1])
  {
    unsigned __int8 v5 = p_contextManagers->__elems_[8];
    int v4 = &p_contextManagers->__elems_[8];
    if (v5) {
      return;
    }
    int v6 = &off_10229C0D8;
    goto LABEL_12;
  }
  unsigned __int8 v10 = 0;
  sub_10006ACBC(v11, "AllowWaterSubmersionOverride", &v10, 0);
  int v7 = v11[1];
  int v8 = sub_1007432FC();
  if (v7 || v8)
  {
    unsigned int v9 = p_contextManagers->__elems_[7];
    int v4 = &p_contextManagers->__elems_[7];
    if (!v9)
    {
      int v6 = off_10229C0D0;
LABEL_12:
      *int v4 = (CLBarometerCalibrationContextManager *)[objc_alloc(*v6) initWithUniverse:-[CLBarometerCalibration universe](self, "universe") delegate:self withBuffer:&self->fDataBuffers withSourceAggregator:self->_sourceAggregator];
    }
  }
}

- (void)registerClient:(id)a3 forNotification:(unint64_t)a4
{
  if (+[CLBarometerCalibration isNotificationSupported:a4])
  {
    int v7 = self->_clientSets[a4];
    [(NSMutableSet *)v7 addObject:a3];
    if ([(NSMutableSet *)v7 count] == (id)1) {
      [(CLBarometerCalibration *)self initContextManagersForNotification:a4];
    }
    if (a4 == 1)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v9 = sub_1000D2E34(0);
      (*(void (**)(void))(*(void *)(v9 + 112) + 16))();
      [(CLTimer *)self->_releaseAltimeterContextTimer invalidate];
      id v10 = [(CLBarometerCalibration *)self copyCurrentBias];
      int v11 = v10;
      if (v10)
      {
        [v10 timestamp];
        if (v12 != 1.79769313e308 && self->_lastAltimeterClientRegisterTime != 1.79769313e308)
        {
          [v11 uncertaintyInMeters];
          -[CLBarometerCalibration sendClientRegisterAnalyticsWithCurrentUncertainty:andTime:](self, "sendClientRegisterAnalyticsWithCurrentUncertainty:andTime:");
        }
      }
      self->_lastAltimeterClientRegisterTime = Current;

      [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude timestamp];
      if (v15 != 1.79769313e308)
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
        }
        unsigned __int8 v16 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
        {
          [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude altitude];
          uint64_t v18 = v17;
          [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude timestamp];
          *(_DWORD *)buf = 134218496;
          *(double *)long long v26 = Current;
          *(_WORD *)&v26[8] = 2048;
          *(void *)&v26[10] = v18;
          *(_WORD *)&v26[18] = 2048;
          *(void *)&v26[20] = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Send cached altitude to client,timestamp,%f,altitude,%f,altitudeTimestamp,%f", buf, 0x20u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
          }
          [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude altitude];
          [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude timestamp];
          long long v24 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration registerClient:forNotification:]", "%s\n", v24);
          if (v24 != (char *)buf) {
            free(v24);
          }
        }
        [a3 onAbsoluteAltitudeUpdate:self->_latestAbsoluteAltitude];
      }
    }
    uint64_t v20 = 0;
    p_contextManagers = &self->_contextManagers;
    do
      [(CLBarometerCalibrationContextManager *)p_contextManagers->__elems_[v20++] clientConnected:a3 withNotification:a4];
    while (v20 != 10);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    v22 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [(NSMutableSet *)v7 count];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)long long v26 = 0;
      *(_WORD *)&v26[4] = 2082;
      *(void *)&v26[6] = "";
      *(_WORD *)&v26[14] = 2050;
      *(void *)&v26[16] = a4;
      *(_WORD *)&v26[24] = 2050;
      *(void *)&v26[26] = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"registerClient\", \"notification\":%{public}ld, \"newCount\":%{public}ld}", buf, 0x26u);
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    uint64_t v13 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)long long v26 = a4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "registerClient: notification %ld is not supported\n", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      unsigned __int8 v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLBarometerCalibration registerClient:forNotification:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
}

- (void)unregisterClient:(id)a3 forNotification:(unint64_t)a4
{
  int v6 = self->_clientSets[a4];
  [(NSMutableSet *)v6 removeObject:a3];
  if (![(NSMutableSet *)v6 count])
  {
    if (a4 == 1)
    {
      uint64_t v7 = sub_1000D2E34(0);
      (*(void (**)(void))(*(void *)(v7 + 112) + 16))();
      [(CLBarometerCalibration *)self setAltimeterReleaseTimer];
    }
    [(CLBarometerCalibration *)self releaseContextManagersForNotification:a4];
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  int v8 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289538;
    v9[1] = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2050;
    unint64_t v13 = a4;
    __int16 v14 = 2050;
    id v15 = [(NSMutableSet *)v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"unregisterClient\", \"notification\":%{public}ld, \"newCount\":%{public}ld}", (uint8_t *)v9, 0x26u);
  }
}

- (void)acknowledgeNotification:(unint64_t)a3
{
  uint64_t v4 = 0;
  p_contextManagers = &self->_contextManagers;
  do
    [(CLBarometerCalibrationContextManager *)p_contextManagers->__elems_[v4++] notificationAcknowledged:a3];
  while (v4 != 10);
}

- (void)queryElevationsFromDate:(id)a3 toDate:(id)a4 withBatchSize:(id)a5 fromRecordId:(id)a6 withReply:(id)a7
{
  p_contextManagers = &self->_contextManagers;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v13 = p_contextManagers->__elems_[9];
    [(CLBarometerCalibrationContextManager *)v13 queryElevationsFromDate:a3 toDate:a4 withBatchSize:a5 fromRecordId:a6 withReply:a7];
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    __int16 v14 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "queryElevationsFromDate,elevation profile context manager does not exist!", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      id v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLBarometerCalibration queryElevationsFromDate:toDate:withBatchSize:fromRecordId:withReply:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
  }
}

- (void)registerClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4
{
  float var1 = a4.var1;
  float v7 = var1;
  -[CLElevationThresholdManager insertClient:withThreshold:](self->_thresholdManager, "insertClient:withThreshold:", a4.var0);
  if (self->_logElevationThresholds)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double v8 = Current;
    *(float *)&double Current = var1;
    [(CLBarometerCalibration *)self writeThresholdToMsl:a3 withTimestamp:1 andClientId:Current active:v8];
  }
}

- (void)unregisterClient:(id)a3 forElevationThreshold:(CLBarometerCalibrationElevationThreshold)a4
{
  double var1 = a4.var1;
  if ([(CLElevationThresholdManager *)self->_thresholdManager removeClient:a4.var0]
    && self->_logElevationThresholds)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v8 = Current;
    float v7 = var1;
    *(float *)&CFAbsoluteTime Current = v7;
    [(CLBarometerCalibration *)self writeThresholdToMsl:a3 withTimestamp:0 andClientId:Current active:v8];
  }
}

- (void)startTrack:(id)a3
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  uint64_t v4 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    [a3 fStartTime];
    v6[0] = 68289539;
    v6[1] = 0;
    __int16 v7 = 2082;
    double v8 = "";
    __int16 v9 = 2049;
    uint64_t v10 = v5;
    __int16 v11 = 1025;
    unsigned int v12 = [a3 fType];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLBarometerCalibration track started\", \"time\":\"%{private}f\", \"type\":%{private}d}", (uint8_t *)v6, 0x22u);
  }
}

- (void)stopTrack:(id)a3
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  uint64_t v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    [a3 fEndTime];
    uint64_t buf = 68289539;
    __int16 v27 = 2082;
    long long v28 = "";
    __int16 v29 = 2049;
    uint64_t v30 = v6;
    __int16 v31 = 1025;
    unsigned int v32 = [a3 fType];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"CLBarometerCalibration track stopped\", \"time\":\"%{private}f\", \"type\":%{private}d}", (uint8_t *)&buf, 0x22u);
  }
  if ([a3 fNotification] == (id)2)
  {
    [a3 fStartTime];
    double v8 = v7;
    [a3 fEndTime];
    double v10 = v9;
    [a3 fNextTrackStartTime];
    [(CLBarometerCalibration *)self updateElevationBiasBetweenStartTime:v8 andEndTime:v10 andNextTrackStartTime:v11];
  }
  sourceAggregator = self->_sourceAggregator;
  id v13 = [a3 fType];
  if (sourceAggregator) {
    [(CLBarometerCalibrationSourceAggregator *)sourceAggregator copyDataBuffersForTrack:v13];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  id v14 = sub_100ADFA18((uint64_t)v24);
  for (uint64_t i = 27; i != -3; i -= 3)
    sub_1000DAF68(&v24[i]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unsigned __int8 v16 = self->_clientSets[(void)[a3 fNotification:0]];
  id v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v21;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) onBarometerCalibrationNotification:objc_msgSend(a3, "fNotification") track:a3 data:v14];
      }
      id v17 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void)absoluteAltitudeUpdate:(id)a3
{
  uint64_t v5 = (CLBarometerCalibrationAbsoluteAltitude *)[a3 copy];
  self->_latestAbsoluteAltitude = v5;
  [(CLBarometerCalibrationAbsoluteAltitude *)v5 altitude];
  self->_lastAltitude = v6;
  [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude accuracy];
  self->_lastAltitudeAccuracy = v7;
  [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude timestamp];
  self->_lastAltitudeTime = v8;
  [a3 setFilteredPressure:self->_mostRecentFilteredPressure];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v9 = self->_clientSets[1];
  id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) onAbsoluteAltitudeUpdate:a3];
      }
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
  float v20 = -3.4028e38;
  float v21 = 3.4028e38;
  thresholdManager = self->_thresholdManager;
  [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude altitude];
  float v16 = v15;
  [(CLBarometerCalibrationAbsoluteAltitude *)self->_latestAbsoluteAltitude accuracy];
  *(float *)&double v18 = v17;
  *(float *)&double v17 = v16;
  LODWORD(thresholdManager) = [(CLElevationThresholdManager *)thresholdManager updateWithAltitude:&v21 andAccuracy:&v20 upperBound:v17 lowerBound:v18];
  [(CLBarometerCalibration *)self alertElevationAlertClientsOnChange];
  if (thresholdManager)
  {
    uint64_t v19 = sub_1000D2E34(0);
    (*(void (**)(float, float))(*(void *)(v19 + 112) + 80))(v20, v21);
  }
}

- (void)submersionStateUpdate:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_clientSets[3];
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) onSubmersionStateUpdate:a3];
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)submersionMeasurementUpdate:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_clientSets[3];
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) onSubmersionMeasurementUpdate:a3];
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)logBuffers
{
  uint64_t v3 = +[NSMutableString stringWithString:@"Location: "];
  p_fDataBuffers = &self->fDataBuffers;
  begin = self->fDataBuffers.__elems_[0].__map_.__begin_;
  if (self->fDataBuffers.__elems_[0].__map_.__end_ != begin)
  {
    unint64_t start = self->fDataBuffers.__elems_[0].__start_;
    uint64_t v7 = &begin[start >> 8];
    double v8 = (char *)*v7 + 16 * start;
    uint64_t v9 = *(uint64_t *)((char *)begin
                    + (((self->fDataBuffers.__elems_[0].__size_.__value_ + start) >> 5) & 0x7FFFFFFFFFFFFF8))
       + 16 * (LOBYTE(self->fDataBuffers.__elems_[0].__size_.__value_) + start);
    while (v8 != (char *)v9)
    {
      long long v10 = *(void **)v8;
      long long v11 = (std::__shared_weak_count *)*((void *)v8 + 1);
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(NSMutableString *)v3 appendFormat:@"time,%f,lat,%f,long,%f,", *v10, v10[1], v10[2]];
      if ((unint64_t)[(NSMutableString *)v3 length] >= 0x3C1)
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
        }
        long long v12 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
        {
          id v13 = [(NSMutableString *)v3 UTF8String];
          *(_DWORD *)uint64_t buf = 136315138;
          id v35 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
          }
          [(NSMutableString *)v3 UTF8String];
          double v15 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration logBuffers]", "%s\n", v15);
          if (v15 != (char *)buf) {
            free(v15);
          }
        }
        [(NSMutableString *)v3 setString:@"GPS: "];
      }
      if (v11) {
        sub_1000DB0A0(v11);
      }
      v8 += 16;
      if (v8 - (unsigned char *)*v7 == 4096)
      {
        id v14 = (char *)v7[1];
        ++v7;
        double v8 = v14;
      }
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  float v16 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [(NSMutableString *)v3 UTF8String];
    *(_DWORD *)uint64_t buf = 136315138;
    id v35 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    [(NSMutableString *)v3 UTF8String];
    unsigned int v32 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration logBuffers]", "%s\n", v32);
    if (v32 != (char *)buf) {
      free(v32);
    }
  }
  [(NSMutableString *)v3 setString:@"Pressure: "];
  double v18 = p_fDataBuffers->__elems_[1].__map_.__begin_;
  if (p_fDataBuffers->__elems_[1].__map_.__end_ != v18)
  {
    unint64_t v19 = p_fDataBuffers->__elems_[1].__start_;
    unint64_t value = p_fDataBuffers->__elems_[1].__size_.__value_;
    float v21 = &v18[v19 >> 8];
    long long v22 = (char *)*v21 + 16 * v19;
    uint64_t v23 = *(uint64_t *)((char *)v18 + (((value + v19) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (value + v19);
    while (v22 != (char *)v23)
    {
      long long v24 = *(void **)v22;
      long long v25 = (std::__shared_weak_count *)*((void *)v22 + 1);
      if (v25) {
        atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(NSMutableString *)v3 appendFormat:@"time,%f,pressure,%f,temp,%f,", *v24, v24[1], v24[2]];
      if ((unint64_t)[(NSMutableString *)v3 length] >= 0x3C1)
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
        }
        long long v26 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
        {
          id v27 = [(NSMutableString *)v3 UTF8String];
          *(_DWORD *)uint64_t buf = 136315138;
          id v35 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
          }
          [(NSMutableString *)v3 UTF8String];
          __int16 v29 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration logBuffers]", "%s\n", v29);
          if (v29 != (char *)buf) {
            free(v29);
          }
        }
        [(NSMutableString *)v3 setString:@"Pressure: "];
      }
      if (v25) {
        sub_1000DB0A0(v25);
      }
      v22 += 16;
      if (v22 - (unsigned char *)*v21 == 4096)
      {
        long long v28 = (char *)v21[1];
        ++v21;
        long long v22 = v28;
      }
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  uint64_t v30 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    id v31 = [(NSMutableString *)v3 UTF8String];
    *(_DWORD *)uint64_t buf = 136315138;
    id v35 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    [(NSMutableString *)v3 UTF8String];
    long long v33 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration logBuffers]", "%s\n", v33);
    if (v33 != (char *)buf) {
      free(v33);
    }
  }
}

- (id)copyCurrentBias
{
  return [(CLBarometerCalibrationBiasEstimator *)self->_biasEstimator copyCurrentBias];
}

- (BOOL)isInOutdoorWorkout:(NotificationData *)a3
{
  int v3 = *((_DWORD *)a3 + 2);
  BOOL result = 1;
  if (v3 <= 19089)
  {
    BOOL v7 = v3 > 8;
    int v8 = (1 << v3) & 0x150;
    if (v7 || v8 == 0) {
      return 0;
    }
  }
  else
  {
    if (v3 > 90602)
    {
      BOOL v5 = v3 == 90603;
      int v6 = 519150;
    }
    else
    {
      BOOL v5 = v3 == 19090;
      int v6 = 19150;
    }
    if (!v5 && v3 != v6) {
      return 0;
    }
  }
  return result;
}

- (void)onMotionStateObserverNotification:(int)a3 data:(NotificationData *)a4
{
  if (!a3)
  {
    long long v7 = *((_OWORD *)a4 + 1);
    v42[0] = *(_OWORD *)a4;
    v42[1] = v7;
    int v43 = *((_DWORD *)a4 + 8);
    BOOL v8 = [(CLBarometerCalibration *)self isInOutdoorWorkout:v42];
    if (v8)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      uint64_t v9 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)a4;
        int v11 = *((_DWORD *)a4 + 2);
        int v12 = *((_DWORD *)a4 + 3);
        *(_DWORD *)uint64_t buf = 134218496;
        uint64_t v28 = v10;
        __int16 v29 = 1024;
        int v30 = v11;
        __int16 v31 = 1024;
        int v32 = v12;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "motion state observer updates,time,%f,activityType,%d,predictedWorkoutType,%d", buf, 0x18u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
        }
        uint64_t v23 = *(void *)a4;
        int v24 = *((_DWORD *)a4 + 2);
        int v25 = *((_DWORD *)a4 + 3);
        int v36 = 134218496;
        uint64_t v37 = v23;
        __int16 v38 = 1024;
        int v39 = v24;
        __int16 v40 = 1024;
        int v41 = v25;
        long long v26 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration onMotionStateObserverNotification:data:]", "%s\n", v26);
        if (v26 != (char *)buf) {
          free(v26);
        }
      }
    }
    [(CLBarometerCalibration *)self setInOutdoorWorkout:v8];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    id v13 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = [(CLBarometerCalibration *)self isInOutdoorWorkout];
      *(_DWORD *)uint64_t buf = 67109120;
      LODWORD(v28) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "outdoor workout status updated,inOutdoorWorkout,%d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      unsigned int v21 = [(CLBarometerCalibration *)self isInOutdoorWorkout];
      int v36 = 67109120;
      LODWORD(v37) = v21;
      long long v22 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration onMotionStateObserverNotification:data:]", "%s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
  }
  if (self->_logWorkoutActivity)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    double v15 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "write workout activity to msl.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      LOWORD(v36) = 0;
      float v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration onMotionStateObserverNotification:data:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    sub_10170140C(buf);
    sub_1017263A8((uint64_t)buf);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v35 |= 1u;
    CFAbsoluteTime v33 = Current;
    uint64_t v17 = v34;
    int v18 = *((_DWORD *)a4 + 2);
    *(unsigned char *)(v34 + 16) |= 1u;
    *(_DWORD *)(v17 + 8) = v18;
    uint64_t v19 = v34;
    *(unsigned char *)(v34 + 16) |= 2u;
    *(_DWORD *)(v19 + 12) = a3;
    if (qword_10248AF88 != -1) {
      dispatch_once(&qword_10248AF88, &stru_1022DD510);
    }
    if (qword_10248AF90) {
      sub_1019E5150(qword_10248AF90, (uint64_t)buf);
    }
    sub_101706914((PB::Base *)buf);
  }
}

- (void)onDaemonStatusNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 7 && self->_charging != *((unsigned __int8 *)a4 + 9))
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    int v6 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *((unsigned __int8 *)a4 + 9);
      *(_DWORD *)uint64_t buf = 67109376;
      int v11 = v7;
      __int16 v12 = 2048;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "charging on puck,%d,timestamp,%f", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      CFAbsoluteTimeGetCurrent();
      uint64_t v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration onDaemonStatusNotification:data:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    uint64_t v8 = 0;
    self->_charging = *((unsigned char *)a4 + 9);
    do
      [(CLBarometerCalibrationContextManager *)self->_contextManagers.__elems_[v8++] onCharger:self->_charging];
    while (v8 != 10);
  }
}

- (void)onMobileAssetNotification:(int)a3 data:(NotificationData *)a4
{
  if (a3 == 7)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v13 = 0;
    (*(void (**)(NotificationData *, void **))(*(void *)a4 + 800))(a4, __p);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    BOOL v5 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = __p;
      if (v13 < 0) {
        int v6 = (void **)__p[0];
      }
      *(_DWORD *)uint64_t buf = 136446210;
      uint64_t v17 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received config %{public}s", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      uint64_t v9 = __p;
      if (v13 < 0) {
        uint64_t v9 = (void **)__p[0];
      }
      int v14 = 136446210;
      double v15 = v9;
      uint64_t v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration onMobileAssetNotification:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    if (sub_1000E9358((uint64_t)a4))
    {
      buf[0] = 1;
      uint64_t v17 = 0x42C8000045A8C000;
      v18[0] = 0.1;
      sub_1000D29FC((uint64_t)a4, @"useShowerDetector", (BOOL *)buf);
      sub_1004D123C((uint64_t)a4, @"wetTimeout", (float *)&v17);
      sub_1004D123C((uint64_t)a4, @"pressureAmplitude", (float *)&v17 + 1);
      sub_1004D123C((uint64_t)a4, @"tDot", v18);
      sub_100103240();
      if (sub_10010145C())
      {
        uint64_t v7 = sub_1000D2E34(0);
        (*(void (**)(void))(*(void *)(v7 + 112) + 56))();
      }
    }
    else
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      uint64_t v8 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to convert config to dictionary", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
        }
        LOWORD(v14) = 0;
        int v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLBarometerCalibration onMobileAssetNotification:data:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
    }
    if (SHIBYTE(v13) < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)updateCompanionConnected:(BOOL)a3
{
  self->_BOOL isCompanionConnected = a3;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  uint64_t v4 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isCompanionConnected = self->_isCompanionConnected;
    *(_DWORD *)uint64_t buf = 67109120;
    BOOL v8 = isCompanionConnected;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "companion connected updated: %d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    int v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration updateCompanionConnected:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [(CLBarometerCalibration *)self updateWetState];
}

- (void)updateWetState
{
  uint64_t v3 = 0;
  self->_unint64_t wetState = self->_isSensorWet;
  p_contextManagers = &self->_contextManagers;
  do
    [(CLBarometerCalibrationContextManager *)p_contextManagers->__elems_[v3++] wetStateUpdated:self->_wetState];
  while (v3 != 10);
  [(CLBarometerCalibrationSourceAggregator *)self->_sourceAggregator wetStateUpdated:self->_wetState];
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  BOOL v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    unint64_t wetState = self->_wetState;
    *(_DWORD *)uint64_t buf = 67109120;
    int v9 = wetState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "wet state updated to %d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration updateWetState]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
}

- (void)setupAltimeterReleaseTimer
{
  releaseAltimeterContextTimer = self->_releaseAltimeterContextTimer;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100AE17E0;
  v3[3] = &unk_10229FED8;
  v3[4] = self;
  [(CLTimer *)releaseAltimeterContextTimer setHandler:v3];
}

- (void)setAltimeterReleaseTimer
{
}

- (id)latestAbsoluteAltitude
{
  return self->_latestAbsoluteAltitude;
}

- (void)onVisit:(id)a3
{
  if (a3)
  {
    if ([a3 hasArrivalDate] && !objc_msgSend(a3, "hasDepartureDate"))
    {
      BOOL v5 = 1;
      goto LABEL_8;
    }
    if ([a3 hasArrivalDate] && objc_msgSend(a3, "hasDepartureDate"))
    {
      BOOL v5 = 0;
LABEL_8:
      self->_BOOL inVisit = v5;
    }
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
  }
  int v6 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inVisit = self->_inVisit;
    [objc_msgSend(a3, "arrivalDate") timeIntervalSinceReferenceDate];
    uint64_t v9 = v8;
    [objc_msgSend(a3, "departureDate") timeIntervalSinceReferenceDate];
    unint64_t buf = __PAIR64__(inVisit, 67109888);
    __int16 v38 = 2048;
    uint64_t v39 = v9;
    __int16 v40 = 2048;
    uint64_t v41 = v10;
    __int16 v42 = 2048;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "received visit for altimeter,inVisit,%d,arrivalDate,%f,departureDate,%f,currentTime,%f", (uint8_t *)&buf, 0x26u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(&buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    BOOL v30 = self->_inVisit;
    [objc_msgSend(a3, "arrivalDate") timeIntervalSinceReferenceDate];
    uint64_t v32 = v31;
    [objc_msgSend(a3, "departureDate") timeIntervalSinceReferenceDate];
    uint64_t v34 = v33;
    CFAbsoluteTime v35 = CFAbsoluteTimeGetCurrent();
    int v47 = 67109888;
    BOOL v48 = v30;
    __int16 v49 = 2048;
    uint64_t v50 = v32;
    __int16 v51 = 2048;
    uint64_t v52 = v34;
    __int16 v53 = 2048;
    CFAbsoluteTime v54 = v35;
    int v36 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration onVisit:]", "%s\n", v36);
    if (v36 != (char *)&buf) {
      free(v36);
    }
  }
  if (self->_inVisit)
  {
    id v11 = [[objc_msgSend(a3, "_placeInference") _loiIdentifier];
    [objc_msgSend(a3, "arrivalDate") timeIntervalSinceReferenceDate];
    -[CLBarometerCalibration fetchLoiFromId:atTimestamp:](self, "fetchLoiFromId:atTimestamp:", v11);
    BOOL v12 = self->_inVisit;
  }
  else
  {
    BOOL v12 = 0;
  }
  biasEstimator = self->_biasEstimator;
  [objc_msgSend(a3, "arrivalDate") timeIntervalSinceReferenceDate];
  double v15 = v14;
  [objc_msgSend(a3, "departureDate") timeIntervalSinceReferenceDate];
  [(CLBarometerCalibrationBiasEstimator *)biasEstimator updateVisitState:v12 arrivalTime:v15 departureTime:v16];
  if (self->_logLois)
  {
    sub_10170140C(&buf);
    sub_101727E18((uint64_t)&buf);
    CFAbsoluteTime v17 = CFAbsoluteTimeGetCurrent();
    v46 |= 1u;
    CFAbsoluteTime v44 = v17;
    uint64_t v18 = v45;
    [a3 coordinate];
    *(_WORD *)(v18 + 92) |= 0x40u;
    *(void *)(v18 + 56) = v19;
    uint64_t v20 = v45;
    [a3 coordinate];
    *(_WORD *)(v20 + 92) |= 0x20u;
    *(void *)(v20 + 48) = v21;
    uint64_t v22 = v45;
    [objc_msgSend(a3, "departureDate") timeIntervalSinceReferenceDate];
    *(_WORD *)(v22 + 92) |= 4u;
    *(void *)(v22 + 24) = v23;
    uint64_t v24 = v45;
    [objc_msgSend(a3, "arrivalDate") timeIntervalSinceReferenceDate];
    *(_WORD *)(v24 + 92) |= 1u;
    *(void *)(v24 + 8) = v25;
    uint64_t v26 = v45;
    [a3 horizontalAccuracy];
    *(_WORD *)(v26 + 92) |= 0x10u;
    *(void *)(v26 + 40) = v27;
    uint64_t v28 = v45;
    *(_WORD *)(v45 + 92) |= 0x200u;
    *(_DWORD *)(v28 + 80) = 2;
    uint64_t v29 = v45;
    *(_WORD *)(v45 + 92) |= 0x400u;
    *(_DWORD *)(v29 + 84) = -1;
    if (qword_10248AF88 != -1) {
      dispatch_once(&qword_10248AF88, &stru_1022DD510);
    }
    if (qword_10248AF90) {
      sub_1019E5150(qword_10248AF90, (uint64_t)&buf);
    }
    sub_101706914((PB::Base *)&buf);
  }
  [(CLBarometerCalibration *)self sendInVisit:self->_inVisit];
}

- (void)announceMostRecentForcedGPS:(double)a3
{
}

- (void)sendClientRegisterAnalyticsWithCurrentUncertainty:(double)a3 andTime:(double)a4
{
}

- (void)fetchVisitStatusAtStart
{
  if (self->_routineMonitorProxy)
  {
    fetchRoutineVisitsTimer = self->_fetchRoutineVisitsTimer;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100AE2330;
    v5[3] = &unk_10229FED8;
    v5[4] = self;
    [(CLTimer *)fetchRoutineVisitsTimer setHandler:v5];
    [(CLTimer *)self->_fetchRoutineVisitsTimer setNextFireDelay:10.0];
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    uint64_t v4 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)unint64_t buf = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      uint64_t v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning Routine Monitor is not available.\"}", buf, 0x12u);
    }
  }
}

- (BOOL)isIHAAuthorized
{
  uint64_t v2 = objc_opt_class();
  if (v2)
  {
    id v3 = +[MCProfileConnection sharedConnection];
    LOBYTE(v2) = [v3 isHealthDataSubmissionAllowed];
  }
  return v2;
}

- (void)fetchLoiFromId:(id)a3 atTimestamp:(double)a4
{
  routineMonitorProxy = self->_routineMonitorProxy;
  if (routineMonitorProxy)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100AE2C3C;
    v8[3] = &unk_1022C16E8;
    v8[4] = self;
    v8[5] = a3;
    *(double *)&v8[6] = a4;
    [(CLRoutineMonitorServiceProtocol *)routineMonitorProxy fetchLocationOfInterestWithIdentifier:a3 withReply:v8];
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
    }
    int v6 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Routine Monitor is not supported.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      __int16 v9 = 0;
      int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration fetchLoiFromId:atTimestamp:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)alertElevationAlertClientsOnChange
{
  thresholdManager = self->_thresholdManager;
  if (thresholdManager)
  {
    [(CLElevationThresholdManager *)thresholdManager getElevationThresholdProxyMap];
    id v3 = v14;
    if (v14 == (float *)v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v3 = 0;
    double v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
  }
  HIDWORD(v4) = 0;
  do
  {
    if (*((unsigned char *)v3 + 56))
    {
      BOOL v5 = (void *)*((void *)v3 + 6);
      float v6 = v3[8];
      *(float *)&double v4 = v6;
      [v5 onElevationThresold:*((unsigned __int8 *)v3 + 41) direction:v4];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
      }
      int v7 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *((unsigned __int8 *)v3 + 41);
        *(_DWORD *)unint64_t buf = 134218496;
        double v23 = v6;
        __int16 v24 = 2048;
        uint64_t v25 = v5;
        __int16 v26 = 1024;
        int v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "threshold,%f,client,%p,above,%d", buf, 0x1Cu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022DD4F0);
        }
        int v12 = *((unsigned __int8 *)v3 + 41);
        int v16 = 134218496;
        double v17 = v6;
        __int16 v18 = 2048;
        uint64_t v19 = v5;
        __int16 v20 = 1024;
        int v21 = v12;
        uint64_t v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibration alertElevationAlertClientsOnChange]", "%s\n", v13);
        if (v13 != (char *)buf) {
          free(v13);
        }
      }
    }
    __int16 v9 = (float *)*((void *)v3 + 1);
    if (v9)
    {
      do
      {
        uint64_t v10 = v9;
        __int16 v9 = *(float **)v9;
      }
      while (v9);
    }
    else
    {
      do
      {
        uint64_t v10 = (float *)*((void *)v3 + 2);
        BOOL v11 = *(void *)v10 == (void)v3;
        id v3 = v10;
      }
      while (!v11);
    }
    id v3 = v10;
  }
  while (v10 != (float *)v15);
LABEL_3:
  sub_1000F5BB0((uint64_t)&v14, v15[0]);
}

- (void)sendInVisit:(BOOL)a3
{
  id v3 = *(void (**)(void))(*(void *)(sub_1000D2E34(0) + 112) + 72);

  v3();
}

- (void)writeThresholdToMsl:(float)a3 withTimestamp:(double)a4 andClientId:(id)a5 active:(BOOL)a6
{
  sub_10048B72C((uint64_t)v18);
  std::ostream::operator<<();
  sub_10170140C(v15);
  sub_101726288((uint64_t)v15);
  v17 |= 1u;
  *(double *)&v15[77] = a4;
  uint64_t v9 = v16;
  *(unsigned char *)(v16 + 32) |= 1u;
  *(double *)(v9 + 16) = a4;
  uint64_t v10 = v16;
  std::stringbuf::str();
  sub_100AE44AC(v10, &__p);
  if (v14 < 0) {
    operator delete((void *)__p.n128_u64[0]);
  }
  uint64_t v11 = v16;
  *(unsigned char *)(v16 + 32) |= 2u;
  *(float *)(v11 + 24) = a3;
  uint64_t v12 = v16;
  *(unsigned char *)(v16 + 32) |= 4u;
  *(unsigned char *)(v12 + 28) = a6;
  if (qword_10248AF88 != -1) {
    dispatch_once(&qword_10248AF88, &stru_1022DD510);
  }
  if (qword_10248AF90) {
    sub_1019E5150(qword_10248AF90, (uint64_t)v15);
  }
  sub_101706914((PB::Base *)v15);
  if (v19 < 0) {
    operator delete((void *)v18[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  std::ios::~ios();
}

- (BOOL)isInOutdoorWorkout
{
  return self->_inOutdoorWorkout;
}

- (void)setInOutdoorWorkout:(BOOL)a3
{
  self->_inOutdoorWorkout = a3;
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
  unint64_t value = self->fMobileAssetClient.__ptr_.__value_;
  self->fMobileAssetClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  double v4 = self->fStatusClient.__ptr_.__value_;
  self->fStatusClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *, SEL))(*(void *)v4 + 8))(v4, a2);
  }
  BOOL v5 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  float v6 = self->fMotionStateObserverClient.__ptr_.__value_;
  self->fMotionStateObserverClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  int v7 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8))(v7, a2);
  }
  p_fDataBuffers = &self->fDataBuffers;
  for (uint64_t i = 432; i != -48; i -= 48)
    sub_1000DAF68((array<std::deque<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>, 10UL> *)((char *)p_fDataBuffers + i));
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *(_OWORD *)((char *)self + 264) = 0u;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 424) = 0u;
  *(_OWORD *)((char *)self + 440) = 0u;
  *(_OWORD *)((char *)self + 456) = 0u;
  *(_OWORD *)((char *)self + 472) = 0u;
  *((void *)self + 83) = 0;
  *((void *)self + 85) = 0;
  *((void *)self + 86) = 0;
  *((void *)self + 94) = 0;
  *((void *)self + 98) = 0;
  return self;
}

@end