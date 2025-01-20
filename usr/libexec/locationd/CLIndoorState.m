@interface CLIndoorState
+ (DebounceParameters)getFitnessModeDebounceParamsWithOptionalAvailabilityTile:(SEL)a3;
- (BOOL)fSpectatingLocation;
- (BOOL)gpsAssistanceRequested;
- (BOOL)gpsFusionRequested;
- (BOOL)hasAtLeastOneClientWithCLActivityTypeFitness;
- (BOOL)isInVehicleNavigation;
- (BOOL)isStreamingClientInFitnessSession;
- (BOOL)isVehicleConnected;
- (BOOL)keybagLocked;
- (BOOL)locationGroupsLoaded;
- (BOOL)pipelinedDidStartLocalizing;
- (BOOL)wifiAssociated;
- (BOOL)wifiPowered;
- (CLAvailableVenuesStateMachine)availableVenuesState;
- (CLIndoorState)init;
- (NSSet)pipelinedVenues;
- (NSURL)avlTilePathOverrideForTest;
- (double)availabilityZScoreConfidenceInterval;
- (double)indoorPrefetchClusterMergeRadius;
- (double)indoorPrefetchRadiusMeters;
- (double)regionalPrefetchClusterMergeRadius;
- (double)regionalPrefetchRadiusMeters;
- (id).cxx_construct;
- (id)locationGroups;
- (int)latestReason;
- (int)pipelinedSeeded;
- (int)state;
- (optional<std::chrono::time_point<std::chrono::steady_clock,)lastPrefetchTimestamp;
- (uint64_t)latestNavModeEstimate;
- (uint64_t)setLatestNavModeEstimate:(uint64_t)a3;
- (unint64_t)indoorPrefetchMaxFloorsPerPrefetch;
- (unint64_t)lastARSessionState;
- (unint64_t)regionalPrefetchMaxFloorsPerPrefetch;
- (unsigned)tilePrefetchPredictionActivityCycleAllowance;
- (void)clearLocationGroups;
- (void)dealloc;
- (void)fitnessModeStateMachine;
- (void)lastIndoorError;
- (void)latestPosition;
- (void)navModeEstimator;
- (void)resetNavModeEstimator;
- (void)setAvailabilityTiles:(id)a3 withZScoreConfidenceInterval:(double)a4;
- (void)setAvailabilityZScoreConfidenceInterval:(double)a3;
- (void)setAvailableVenuesState:(id)a3;
- (void)setAvlTilePathOverrideForTest:(id)a3;
- (void)setFSpectatingLocation:(BOOL)a3;
- (void)setGpsAssistanceRequested:(BOOL)a3;
- (void)setGpsFusionRequested:(BOOL)a3;
- (void)setHasAtLeastOneClientWithCLActivityTypeFitness:(BOOL)a3;
- (void)setIndoorPrefetchClusterMergeRadius:(double)a3;
- (void)setIndoorPrefetchMaxFloorsPerPrefetch:(unint64_t)a3;
- (void)setIndoorPrefetchRadiusMeters:(double)a3;
- (void)setIsInVehicleNavigation:(BOOL)a3;
- (void)setIsStreamingClientInFitnessSession:(BOOL)a3;
- (void)setIsVehicleConnected:(BOOL)a3;
- (void)setKeybagLocked:(BOOL)a3;
- (void)setLastARSessionState:(unint64_t)a3;
- (void)setLastIndoorError:(optional<CLIndoorError> *)a3;
- (void)setLastPrefetchTimestamp:()optional<std:(std:()std:(1000000000>>>> *)a3 :ratio<1 :chrono::duration<long)long :chrono::time_point<std::chrono::steady_clock;
- (void)setLatestPosition:(CLLastFix *)a3;
- (void)setLatestReason:(int)a3;
- (void)setPipelinedDidStartLocalizing:(BOOL)a3;
- (void)setPipelinedSeeded:(int)a3;
- (void)setPipelinedVenues:(id)a3;
- (void)setRegionalPrefetchClusterMergeRadius:(double)a3;
- (void)setRegionalPrefetchMaxFloorsPerPrefetch:(unint64_t)a3;
- (void)setRegionalPrefetchRadiusMeters:(double)a3;
- (void)setState:(int)a3;
- (void)setTilePrefetchPredictionActivityCycleAllowance:(unsigned int)a3;
- (void)setWifiAssociated:(BOOL)a3;
- (void)setWifiPowered:(BOOL)a3;
- (void)updatePrefetchParameters:(id)a3;
@end

@implementation CLIndoorState

- (void)fitnessModeStateMachine
{
  return self->_fitnessModeStateMachine.__ptr_.__value_;
}

- (uint64_t)latestNavModeEstimate
{
  return *(void *)(a1 + 368);
}

- (int)state
{
  return *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 54);
}

- (void)setLatestPosition:(CLLastFix *)a3
{
  BOOL m_initialized = self->_latestPosition.m_initialized;
  long long v5 = *(_OWORD *)&a3->var0.coordinate.longitude;
  long long v4 = *(_OWORD *)&a3->var0.altitude;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 7) = *(_OWORD *)&a3->var0.suitability;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 23) = v5;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 39) = v4;
  long long v6 = *(_OWORD *)&a3->var0.timestamp;
  long long v7 = *(_OWORD *)&a3->var0.lifespan;
  long long v8 = *(_OWORD *)&a3->var0.course;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 55) = *(_OWORD *)&a3->var0.speed;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 103) = v7;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 87) = v6;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 71) = v8;
  long long v9 = *(_OWORD *)&a3->var0.referenceFrame;
  long long v10 = *(_OWORD *)&a3->var0.ellipsoidalAltitude;
  long long v11 = *(_OWORD *)&a3->var0.rawCourse;
  *($AB5116BA7E623E054F959CECB034F4E7 *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 119) = a3->var0.rawCoordinate;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 167) = v10;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 151) = v9;
  *(_OWORD *)((char *)&self->_latestPosition.m_storage.dummy_.aligner_ + 135) = v11;
  if (!m_initialized) {
    self->_latestPosition.BOOL m_initialized = 1;
  }
}

- (uint64_t)setLatestNavModeEstimate:(uint64_t)a3
{
  *(void *)(result + 368) = a3;
  *(_DWORD *)(result + 376) = a4;
  *(unsigned char *)(result + 380) = BYTE4(a4);
  return result;
}

- (int)pipelinedSeeded
{
  return *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 50);
}

- (void)navModeEstimator
{
  return &self->_navModeEstimator;
}

- (CLIndoorState)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLIndoorState;
  v2 = [(CLIndoorState *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 50) = 0;
    *(_OWORD *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 78) = xmmword_101D047C0;
    *(void *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 94) = 0x4085180000000000;
    *(void *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 102) = 200;
    *(void *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 110) = 200;
    *(void *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 118) = 0x40E86A0000000000;
    *(void *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 126) = 0x4049000000000000;
    *(void *)((char *)&v2->_lastIndoorError.m_storage.dummy_.aligner_ + 142) = objc_alloc_init((Class)CLAvailableVenuesStateMachine);
    *(_WORD *)((char *)&v3->_lastIndoorError.m_storage.dummy_.aligner_ + 39) = 257;
    +[CLIndoorState getFitnessModeDebounceParamsWithOptionalAvailabilityTile:0];
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLIndoorState;
  [(CLIndoorState *)&v3 dealloc];
}

- (void)resetNavModeEstimator
{
}

- (void)latestPosition
{
  return &self->_latestPosition;
}

- (void)lastIndoorError
{
  return (char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 6;
}

- (void)setLastIndoorError:(optional<CLIndoorError> *)a3
{
  if (self->_lastIndoorError.m_storage.dummy_.data[6])
  {
    if (a3->m_initialized)
    {
      uint64_t v3 = *(void *)((char *)&a3->m_storage.dummy_.aligner_ + 7);
      *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 22) = *(_DWORD *)((char *)&a3->m_storage.dummy_.aligner_
                                                                                              + 15);
      *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 14) = v3;
    }
    else
    {
      self->_lastIndoorError.m_storage.dummy_.data[6] = 0;
    }
  }
  else if (a3->m_initialized)
  {
    *(_OWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 14) = *(_OWORD *)((char *)&a3->m_storage.dummy_.aligner_
                                                                                            + 7);
    self->_lastIndoorError.m_storage.dummy_.data[6] = 1;
  }
}

- (BOOL)locationGroupsLoaded
{
  return *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30) != 0;
}

- (id)locationGroups
{
  return *(id *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30);
}

- (void)setAvailabilityTiles:(id)a3 withZScoreConfidenceInterval:(double)a4
{
  *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30) = a3;
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 78) = a4;
}

- (void)updatePrefetchParameters:(id)a3
{
  *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102) = [a3 indoorPrefetchMaxFloorCount];
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86) = (double)(1000
                                                                                       * [a3 indoorPrefetchRadiusKM]);
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118) = (double)(1000
                                                                                        * [a3 indoorLocationOfInterestMergeRadiusKM]);
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_10229E160);
  }
  objc_super v5 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102);
    uint64_t v7 = *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86);
    uint64_t v8 = *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118);
    *(_DWORD *)buf = 134349568;
    uint64_t v20 = v6;
    __int16 v21 = 2050;
    uint64_t v22 = v7;
    __int16 v23 = 2050;
    uint64_t v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Prefetch indoor parameters updated, maxFloors=%{public}lu radiusMeters=%{public}f clusterMergeRadius=%{public}f", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10229E160);
    }
    v16 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLIndoorState updatePrefetchParameters:]", "%s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  if ([a3 hasRegionalPrefetchMaxFloorCount])
  {
    *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110) = [a3 regionalPrefetchMaxFloorCount];
    *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94) = (double)(1000
                                                                                         * [a3 regionalPrefetchRadiusKM]);
    double v9 = (double)(1000 * [a3 regionalLocationOfInterestMergeRadiusKM]);
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10229E160);
    }
    long long v10 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#warning No regional prefetch parameters found, falling back to indoor values", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_10229E160);
      }
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLIndoorState updatePrefetchParameters:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110) = *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_
                                                                                             + 102);
    *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94) = *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_
                                                                                            + 86);
    double v9 = *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118);
  }
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126) = v9;
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_10229E160);
  }
  long long v11 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110);
    uint64_t v13 = *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94);
    uint64_t v14 = *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126);
    *(_DWORD *)buf = 134349568;
    uint64_t v20 = v12;
    __int16 v21 = 2050;
    uint64_t v22 = v13;
    __int16 v23 = 2050;
    uint64_t v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Prefetch regional parameters updated, maxFloors=%{public}lu radiusMeters=%{public}f clusterMergeRadius=%{public}f", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10229E160);
    }
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLIndoorState updatePrefetchParameters:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  v15 = [(CLIndoorState *)self fitnessModeStateMachine];
  +[CLIndoorState getFitnessModeDebounceParamsWithOptionalAvailabilityTile:a3];
  sub_1001DB7C0((uint64_t)v15, buf);
}

- (void)clearLocationGroups
{
  if (*(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30))
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10229E160);
    }
    uint64_t v3 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Evicting availability tiles from memory", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 == -1)
      {
LABEL_16:
        objc_super v5 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLIndoorState clearLocationGroups]", "%s\n", v5);
        if (v5 != (char *)buf) {
          free(v5);
        }
        goto LABEL_14;
      }
LABEL_18:
      dispatch_once(&qword_1024193A0, &stru_10229E160);
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_10229E160);
    }
    long long v4 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#Warning Availability tiles already evicted", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 == -1) {
        goto LABEL_16;
      }
      goto LABEL_18;
    }
  }
LABEL_14:

  *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 30) = 0;
}

+ (DebounceParameters)getFitnessModeDebounceParamsWithOptionalAvailabilityTile:(SEL)a3
{
  if (a4 && ([a4 hasMotionActivityDebounceParameters] & 1) != 0)
  {
    if ([a4 hasCyclingToNonFitnessSeconds]) {
      uint64_t v6 = [a4 cyclingToNonFitnessSeconds];
    }
    else {
      uint64_t v6 = 180;
    }
    if ([a4 hasRunningToNonFitnessSeconds]) {
      uint64_t v12 = [a4 runningToNonFitnessSeconds];
    }
    else {
      uint64_t v12 = 180;
    }
    if ([a4 hasNonFitnessToCyclingSeconds]) {
      uint64_t v13 = [a4 nonFitnessToCyclingSeconds];
    }
    else {
      uint64_t v13 = 10;
    }
    if ([a4 hasNonFitnessToRunningSeconds]) {
      uint64_t v11 = [a4 nonFitnessToRunningSeconds];
    }
    else {
      uint64_t v11 = 10;
    }
    uint64_t v7 = retstr;
    uint64_t v8 = v6;
    uint64_t v9 = v12;
    uint64_t v10 = v13;
  }
  else
  {
    uint64_t v7 = retstr;
    uint64_t v8 = 180;
    uint64_t v9 = 180;
    uint64_t v10 = 10;
    uint64_t v11 = 10;
  }

  return (DebounceParameters *)sub_1001DC1B4(v7, v8, v9, v10, v11);
}

- (void)setPipelinedSeeded:(int)a3
{
  *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 50) = a3;
}

- (NSSet)pipelinedVenues
{
  return *(NSSet **)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 70);
}

- (void)setPipelinedVenues:(id)a3
{
}

- (void)setState:(int)a3
{
  *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 54) = a3;
}

- (BOOL)pipelinedDidStartLocalizing
{
  return self->_lastIndoorError.m_storage.dummy_.data[38];
}

- (void)setPipelinedDidStartLocalizing:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[38] = a3;
}

- (BOOL)wifiPowered
{
  return self->_lastIndoorError.m_storage.dummy_.data[39];
}

- (void)setWifiPowered:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[39] = a3;
}

- (BOOL)wifiAssociated
{
  return self->_lastIndoorError.m_storage.dummy_.data[40];
}

- (void)setWifiAssociated:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[40] = a3;
}

- (BOOL)gpsAssistanceRequested
{
  return self->_lastIndoorError.m_storage.dummy_.data[41];
}

- (void)setGpsAssistanceRequested:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[41] = a3;
}

- (BOOL)gpsFusionRequested
{
  return self->_lastIndoorError.m_storage.dummy_.data[42];
}

- (void)setGpsFusionRequested:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[42] = a3;
}

- (BOOL)keybagLocked
{
  return self->_lastIndoorError.m_storage.dummy_.data[43];
}

- (void)setKeybagLocked:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[43] = a3;
}

- (BOOL)fSpectatingLocation
{
  return self->_lastIndoorError.m_storage.dummy_.data[44];
}

- (void)setFSpectatingLocation:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[44] = a3;
}

- (double)availabilityZScoreConfidenceInterval
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 78);
}

- (void)setAvailabilityZScoreConfidenceInterval:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 78) = a3;
}

- (unsigned)tilePrefetchPredictionActivityCycleAllowance
{
  return *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 58);
}

- (void)setTilePrefetchPredictionActivityCycleAllowance:(unsigned int)a3
{
  *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 58) = a3;
}

- (double)indoorPrefetchRadiusMeters
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86);
}

- (void)setIndoorPrefetchRadiusMeters:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 86) = a3;
}

- (double)regionalPrefetchRadiusMeters
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94);
}

- (void)setRegionalPrefetchRadiusMeters:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 94) = a3;
}

- (unint64_t)indoorPrefetchMaxFloorsPerPrefetch
{
  return *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102);
}

- (void)setIndoorPrefetchMaxFloorsPerPrefetch:(unint64_t)a3
{
  *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 102) = a3;
}

- (unint64_t)regionalPrefetchMaxFloorsPerPrefetch
{
  return *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110);
}

- (void)setRegionalPrefetchMaxFloorsPerPrefetch:(unint64_t)a3
{
  *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 110) = a3;
}

- (double)indoorPrefetchClusterMergeRadius
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118);
}

- (void)setIndoorPrefetchClusterMergeRadius:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 118) = a3;
}

- (double)regionalPrefetchClusterMergeRadius
{
  return *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126);
}

- (void)setRegionalPrefetchClusterMergeRadius:(double)a3
{
  *(double *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 126) = a3;
}

- (BOOL)hasAtLeastOneClientWithCLActivityTypeFitness
{
  return self->_lastIndoorError.m_storage.dummy_.data[45];
}

- (void)setHasAtLeastOneClientWithCLActivityTypeFitness:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[45] = a3;
}

- (unint64_t)lastARSessionState
{
  return *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 134);
}

- (void)setLastARSessionState:(unint64_t)a3
{
  *(void *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 134) = a3;
}

- (int)latestReason
{
  return *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 62);
}

- (void)setLatestReason:(int)a3
{
  *(_DWORD *)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 62) = a3;
}

- (BOOL)isStreamingClientInFitnessSession
{
  return self->_lastIndoorError.m_storage.dummy_.data[46];
}

- (void)setIsStreamingClientInFitnessSession:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[46] = a3;
}

- (BOOL)isVehicleConnected
{
  return self->_lastIndoorError.m_storage.dummy_.data[47];
}

- (void)setIsVehicleConnected:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[47] = a3;
}

- (BOOL)isInVehicleNavigation
{
  return self->_lastIndoorError.m_storage.dummy_.data[48];
}

- (void)setIsInVehicleNavigation:(BOOL)a3
{
  self->_lastIndoorError.m_storage.dummy_.data[48] = a3;
}

- (optional<std::chrono::time_point<std::chrono::steady_clock,)lastPrefetchTimestamp
{
  retstr->BOOL m_initialized = 0;
  if (self[2].m_storage.dummy_.data[29])
  {
    *(void *)((char *)&retstr->m_storage.dummy_.aligner_ + 7) = *(void *)((char *)&self[2].m_storage.dummy_.aligner_
                                                                            + 37);
    retstr->BOOL m_initialized = 1;
  }
  return self;
}

- (void)setLastPrefetchTimestamp:()optional<std:(std:()std:(1000000000>>>> *)a3 :ratio<1 :chrono::duration<long)long :chrono::time_point<std::chrono::steady_clock
{
  if (self->_lastIndoorError.m_storage.dummy_.data[174])
  {
    if (a3->m_initialized) {
      self->_locationGroups = *(NSArray **)((char *)&a3->m_storage.dummy_.aligner_ + 7);
    }
    else {
      self->_lastIndoorError.m_storage.dummy_.data[174] = 0;
    }
  }
  else if (a3->m_initialized)
  {
    self->_locationGroups = *(NSArray **)((char *)&a3->m_storage.dummy_.aligner_ + 7);
    self->_lastIndoorError.m_storage.dummy_.data[174] = 1;
  }
}

- (CLAvailableVenuesStateMachine)availableVenuesState
{
  return *(CLAvailableVenuesStateMachine **)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 142);
}

- (void)setAvailableVenuesState:(id)a3
{
}

- (NSURL)avlTilePathOverrideForTest
{
  return *(NSURL **)((char *)&self->_lastIndoorError.m_storage.dummy_.aligner_ + 150);
}

- (void)setAvlTilePathOverrideForTest:(id)a3
{
}

- (void).cxx_destruct
{
  if (self->_lastIndoorError.m_storage.dummy_.data[174]) {
    self->_lastIndoorError.m_storage.dummy_.data[174] = 0;
  }
  if (self->_lastIndoorError.m_storage.dummy_.data[6]) {
    self->_lastIndoorError.m_storage.dummy_.data[6] = 0;
  }
  if (self->_latestPosition.m_initialized) {
    self->_latestPosition.BOOL m_initialized = 0;
  }
  value = self->_fitnessModeStateMachine.__ptr_.__value_;
  self->_fitnessModeStateMachine.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }

  sub_1004B6020((uint64_t *)&self->_navModeEstimator);
}

- (id).cxx_construct
{
}

@end