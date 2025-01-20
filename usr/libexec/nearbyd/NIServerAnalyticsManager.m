@interface NIServerAnalyticsManager
- (BOOL)_isPDRAvailable:(PDRInput *)a3;
- (BOOL)_isSemiStaticFromVIO:(optional<nearby:(optional<nearby:(double)a5 :algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 ::;
- (NIServerAnalyticsManager)initWithBundleIdentifier:(id)a3;
- (VectorAggregateErrors)_calculateErrorStatsFromVector:(SEL)a3;
- (double)_deltaDistanceFromVIOPoses:(optional<nearby:(optional<nearby::algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 :;
- (double)_finderTimeFromFirstPoseTo:(double)a3;
- (id).cxx_construct;
- (id)_algorithmSourceToString:(int)a3;
- (void)_calculateAndLogErrorsFromIODeltaP:(NIServerAnalyticsManager *)self vioDeltaP:(SEL)a2 vioPos:;
- (void)_calculateIOMetrics:(double)a3;
- (void)_calculatePoseSplicingMetrics;
- (void)_calculateStraightLineDistance;
- (void)_onVIOReset;
- (void)_sessionStoppedWithTimestamp:(double)a3;
- (void)_submitFindingSessionEndStats;
- (void)_updateAlignedPDRMetrics:(const void *)a3;
- (void)_updateMinMaxRangeAndRSSI:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5;
- (void)_updateUserMovedDistanceWithPose:(const void *)a3 lastPoseInfo:(void *)a4;
- (void)appBecameNotVisibleWithTimestamp:(double)a3;
- (void)appBecameVisibleWithTimestamp:(double)a3;
- (void)backgroundContinuationDiscoveryTimeout;
- (void)backgroundContinuationInteractionTimeout;
- (void)dealloc;
- (void)lifecycleTimeoutAfterTrackingForDiscoveryToken:(id)a3;
- (void)lifecycleTimeoutBeforeTrackingForDiscoveryToken:(id)a3;
- (void)nearbyObjectUpdated:(id)a3;
- (void)sessionInterruptedWithTimestamp:(double)a3;
- (void)sessionInvalidatedWithTimestamp:(double)a3;
- (void)sessionPausedWithTimestamp:(double)a3;
- (void)sessionSuccessfullyRanWithConfig:(id)a3 withTimestamp:(double)a4;
- (void)updateWithAcquisitionReason:(int)a3;
- (void)updateWithFindeePeerData:(const void *)a3;
- (void)updateWithFinderPeerData:(const void *)a3;
- (void)updateWithMissedRange;
- (void)updateWithPDR:(const void *)a3;
- (void)updateWithPeerDeviceType:(BOOL)a3;
- (void)updateWithPeerLocationFromFMF;
- (void)updateWithPose:(const void *)a3;
- (void)updateWithRangeResult:(RangeResult *)a3;
- (void)updateWithSASolution:(Solution *)a3;
- (void)updateWithSelfLocation:(const LocationInput *)a3;
- (void)updateWithSolution:(const void *)a3;
- (void)updateWithSuccessfulRange:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5;
- (void)updateWithVIOPose:(Pose *)a3;
@end

@implementation NIServerAnalyticsManager

- (NIServerAnalyticsManager)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NIServerAnalyticsManager;
  v6 = [(NIServerAnalyticsManager *)&v25 init];
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    bundleIdentifier = v8->_bundleIdentifier;
    if (bundleIdentifier)
    {
      sub_100004950(&v23, (char *)[(NSString *)bundleIdentifier UTF8String]);
      p_bundleIdAsStdString = (void **)&v7->_bundleIdAsStdString;
      if (*((char *)&v8->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0) {
        operator delete(*p_bundleIdAsStdString);
      }
      uint64_t v11 = v24;
      *(_OWORD *)p_bundleIdAsStdString = v23;
      *((void *)&v7->_bundleIdAsStdString.__r_.__value_.var0.var1 + 2) = v11;
    }
    else
    {
      std::string::assign((std::string *)&v7->_bundleIdAsStdString, "");
    }
    LOBYTE(v8->_bundleIdAsStdString.__r_.var0) = 0;
    v8->_bundleIdAsStdString.var0 = 0;
    v8->_isRunning = 1;
    *(void *)&v8->_isVisible = 0;
    v8->_visibilityUpdateTimestamp = 0.0;
    v8->_runTimestamp = 0.0;
    LOBYTE(v8->_timeSpentVisible) = 0;
    *(_OWORD *)&v8->_timeSpentNotVisible = 0u;
    *(_OWORD *)&v8->_firstDistance = 0u;
    double maxDistance = v8->_maxDistance;
    *(void *)&v8->_double maxDistance = @"None";

    double minDistance = v8->_minDistance;
    *(void *)&v8->_double minDistance = @"None";

    LODWORD(v8->_lifecycleTimeoutType) = 0;
    v8->_backgroundContinuationTimeoutType = 0;
    *(void *)((char *)&v8->_sessionType + 1) = 0;
    BYTE1(v8->_backgroundMode) = 0;
    *(void *)&v8->_hasHorizontallyConverged = 0;
    *(void *)&v8->_lastVIOPosition[6] = 0;
    *(void *)&v8->_isCameraAssistanceEnabled = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v8->_lastVIOPosition[14] = _Q0;
    *(_OWORD *)&v8->_distanceMovedToHorizontalConvergence = _Q0;
    long long v21 = _Q0;
    *(_OWORD *)&v8->_totalDistanceMoved = _Q0;
    v8->_rangeAtVerticalConvergence = -1.0;
    v8->_timeToHorizontalConvergence = 0.0;
    LODWORD(v8->_timeToVerticalConvergence) = 0;
    *(void *)&v8->_numberOfInvalidPose = 0xBFF0000000000000;
    v8->_timeAtLastLocationUpdate = -1.0;
    if (*((unsigned char *)&v8->_numberOfLostVerticalConvergence + 4)) {
      *((unsigned char *)&v8->_numberOfLostVerticalConvergence + 4) = 0;
    }
    *(_OWORD *)&v7->_timeLocationFromLOIOverride = 0u;
    *(_OWORD *)&v7->_timeLocationFromPipeline = 0u;
    *(_OWORD *)&v7->_timeLocationFromCompensated = 0u;
    *(_OWORD *)&v7->_timeLocationFromGPSCoarse = 0u;
    *(_OWORD *)&v7->_lastLocationType.var0.__null_state_ = 0u;
    *(_OWORD *)&v7->_timeLocationFromAccessory = 0u;
    *(void *)&long long v19 = -1;
    *((void *)&v19 + 1) = -1;
    *(_OWORD *)&v7->_timeLocationFromWiFi = v19;
    *(_OWORD *)&v7->_numberOfPeerData = v19;
    *(_OWORD *)&v7->_numberOfLocationFromPeerData = v19;
    *(void *)&v8->_numberOfWalkingOrkUnknown = 0xBFF0000000000000;
    *(void *)&v8->_numberOfMissedRanges = 0xBFF0000000000000;
    if (BYTE4(v8->_timeAtFirstPeerData)) {
      BYTE4(v8->_timeAtFirstPeerData) = 0;
    }
    *(_OWORD *)&v8->_timeAtLastBoundedDisplacementUpdate = 0u;
    *(_OWORD *)&v8->_timeFindeeWasSlowlyMoving = 0u;
    *(_OWORD *)&v8->_timeFindeeWasWalkingOrUnknown = xmmword_1004A0190;
    *(_OWORD *)&v8->_pdrTimeAtFirstPDRUpdate = xmmword_1004A0190;
    LOBYTE(v8->_pdrTimeAtLastPDRUpdate) = 0;
    v8->_timePeerLocationFromFindeeData = -1.0;
    *(_OWORD *)&v8->_timeAtLastLocationFromFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstValidPose = v21;
    *(_OWORD *)&v8->_timeAtFirstOutputRange = v21;
    *(_OWORD *)&v8->_timeAtFirstFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstSelfLocation = v21;
    *(_OWORD *)&v8->_timeAtFirstPeerLocationFromFindeeData = v21;
    *(_OWORD *)&v8->_timeAtFirstPDRFromFindeeData = v21;
    v8->_timeAtFirstDeltaVelocityFromFindeeData = -1.0;
    v8->_timeAtFirstStaticFromFindeeData = 0.0;
    LODWORD(v8->_timeAtEndOfSession) = 0;
    *(double *)((char *)&v7->_timeAtEndOfSession + 4) = NAN;
    *(void *)&v7->_firstOutputRangeAlgorithmSource = -1;
    *(void *)&v7->_numberOfArrowRevokes = -1;
    LOWORD(v8->_numberOfSolutions) = 0;
    BYTE2(v8->_numberOfSolutions) = 0;
    if (v8->_anon_3a8[56]) {
      v8->_anon_3a8[56] = 0;
    }
    [(NIServerAnalyticsManager *)v8 _onVIOReset];
    if (v8->_anon_9d8[169]) {
      v8->_anon_9d8[169] = 0;
    }
    if (v8->_anon_9d8[171]) {
      v8->_anon_9d8[171] = 0;
    }
    *(void *)&v8->_anon_9d8[176] = 0;
    *(void *)&v8->_isFinderAPhone.var0.__null_state_ = 0xBFF0000000000000;
    *(_OWORD *)&v7->_timePDRAndVIOWasAvailable = 0u;
    if (v8->_anon_af8[56]) {
      v8->_anon_af8[56] = 0;
    }
    *(_OWORD *)&v8->_anon_af8[72] = v22;
    *(_OWORD *)&v8->_pathLengthError = v22;
    *(_OWORD *)&v8->_radialDisplacementError = v22;
    *(_OWORD *)&v8->_stdSpeedFromVIO = 0uLL;
    *(_OWORD *)&v8->_timeSSFromVIO = 0uLL;
    *(_OWORD *)&v8->_timeSSFromIOAndSSFromVIO = v22;
    *(_OWORD *)&v8->_pdrSSDetectionTruePositiveRate = v22;
    *(_OWORD *)&v8->_percentTimeSSFromVIO = 0uLL;
    v8->_runningMeanSpeedFromVIO = NAN;
    v8->_m2 = -1.0;
    *(_OWORD *)&v8->_acquisitionReason = 0uLL;
    v8->_firstNBRSSI = -1.0;
    *(_OWORD *)&v7->_firstUWBRSSI = 0uLL;
    v8->_lastNBRSSI = -1.79769313e308;
    *(int64x2_t *)&v8->_lastUWBRSSI = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    *(int64x2_t *)&v8->_maxNBRSSI = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    *(_OWORD *)&v8->_minDistance_finding = xmmword_1004A01A0;
    *(_OWORD *)&v8->_minUWBRSSI = xmmword_1004A01A0;
    v8->_minYCoordinateFinder = 1.79769313e308;
    LOWORD(v8->_maxYCoordinateFindee) = 0;
    if (LOBYTE(v8->_minYCoordinateFindee)) {
      LOBYTE(v8->_minYCoordinateFindee) = 0;
    }
    *(_OWORD *)&v7->_didFinderChangeFloor = 0u;
    v8->_firstRawRangeValue = -1.79769313e308;
    *(_OWORD *)&v8->_currentRawRangeValue = xmmword_1004A01B0;
    v8->_minRawRangeValue = -1.0;
    LODWORD(v8->_timeAtFirstIOPose.var0.__val_) = 0;
    v8->_deltaVSourceTime = 0.0;
    v7->_lastSolutionTime = 0u;
    *(_OWORD *)&v7->_vioAvailableTime = 0u;
  }

  return v8;
}

- (void)dealloc
{
  [(NIServerAnalyticsManager *)self _sessionStoppedWithTimestamp:sub_100006C38()];
  v3.receiver = self;
  v3.super_class = (Class)NIServerAnalyticsManager;
  [(NIServerAnalyticsManager *)&v3 dealloc];
}

- (void)sessionSuccessfullyRanWithConfig:(id)a3 withTimestamp:(double)a4
{
  id v7 = a3;
  if (!v7)
  {
    v59 = +[NSAssertionHandler currentHandler];
    [v59 handleFailureInMethod:a2, self, @"NIServerAnalyticsManager.mm", 620, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v8 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = bundleIdentifier;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    __int16 v66 = 2048;
    double v67 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ni-ca,[%@] sessionSuccessfullyRanWithConfig: %@ withTimestamp: %f [s]", buf, 0x20u);
  }
  if (LOBYTE(self->_bundleIdAsStdString.__r_.var0))
  {
    v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = self->_bundleIdentifier;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#ni-ca,[%@] Session is already running. Stop it first.", buf, 0xCu);
    }
    [(NIServerAnalyticsManager *)self _sessionStoppedWithTimestamp:a4];
    LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 0;
  }
  LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 1;
  *(double *)&self->_bundleIdAsStdString.var0 = a4;
  self->_runTimestamp = a4;
  *(void *)&self->_isVisible = 0;
  self->_visibilityUpdateTimestamp = 0.0;
  LOBYTE(self->_timeSpentVisible) = 0;
  *(_OWORD *)&self->_timeSpentNotVisible = 0u;
  *(_OWORD *)&self->_firstDistance = 0u;
  double maxDistance = self->_maxDistance;
  *(void *)&self->_double maxDistance = @"None";

  double minDistance = self->_minDistance;
  *(void *)&self->_double minDistance = @"None";

  *(int *)((char *)&self->_sessionType + 6) = 0;
  *(int *)((char *)&self->_sessionType + 3) = 0;
  *(void *)&self->_hasHorizontallyConverged = 0;
  *(void *)&self->_lastVIOPosition[6] = 0;
  *(void *)&self->_isCameraAssistanceEnabled = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_lastVIOPosition[14] = _Q0;
  *(_OWORD *)&self->_distanceMovedToHorizontalConvergence = _Q0;
  long long v60 = _Q0;
  *(_OWORD *)&self->_totalDistanceMoved = _Q0;
  self->_rangeAtVerticalConvergence = -1.0;
  self->_timeToHorizontalConvergence = 0.0;
  LODWORD(self->_timeToVerticalConvergence) = 0;
  *(void *)&self->_numberOfInvalidPose = 0xBFF0000000000000;
  self->_timeAtLastLocationUpdate = -1.0;
  if (*((unsigned char *)&self->_numberOfLostVerticalConvergence + 4)) {
    *((unsigned char *)&self->_numberOfLostVerticalConvergence + 4) = 0;
  }
  *(_OWORD *)&self->_timeLocationFromLOIOverride = 0u;
  *(_OWORD *)&self->_timeLocationFromPipeline = 0u;
  *(_OWORD *)&self->_timeLocationFromCompensated = 0u;
  *(_OWORD *)&self->_timeLocationFromGPSCoarse = 0u;
  *(_OWORD *)&self->_lastLocationType.var0.__null_state_ = 0u;
  *(_OWORD *)&self->_timeLocationFromAccessory = 0u;
  *(void *)&long long v19 = -1;
  *((void *)&v19 + 1) = -1;
  *(_OWORD *)&self->_timeLocationFromWiFi = v19;
  *(_OWORD *)&self->_numberOfPeerData = v19;
  *(_OWORD *)&self->_numberOfLocationFromPeerData = v19;
  *(void *)&self->_numberOfWalkingOrkUnknown = 0xBFF0000000000000;
  *(void *)&self->_numberOfMissedRanges = 0xBFF0000000000000;
  if (BYTE4(self->_timeAtFirstPeerData)) {
    BYTE4(self->_timeAtFirstPeerData) = 0;
  }
  *(_OWORD *)&self->_timeAtLastBoundedDisplacementUpdate = 0uLL;
  *(_OWORD *)&self->_timeFindeeWasSlowlyMoving = 0uLL;
  *(_OWORD *)&self->_timeFindeeWasWalkingOrUnknown = xmmword_1004A0190;
  *(_OWORD *)&self->_pdrTimeAtFirstPDRUpdate = xmmword_1004A0190;
  LOBYTE(self->_pdrTimeAtLastPDRUpdate) = 0;
  self->_timePeerLocationFromFindeeData = -1.0;
  *(_OWORD *)&self->_timeAtLastLocationFromFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstValidPose = _Q0;
  *(_OWORD *)&self->_timeAtFirstFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstSelfLocation = _Q0;
  *(_OWORD *)&self->_timeAtFirstPeerLocationFromFindeeData = _Q0;
  *(_OWORD *)&self->_timeAtFirstPDRFromFindeeData = _Q0;
  self->_timeAtFirstDeltaVelocityFromFindeeData = -1.0;
  self->_timeAtFirstStaticFromFindeeData = 0.0;
  LODWORD(self->_timeAtEndOfSession) = 0;
  *(double *)((char *)&self->_timeAtEndOfSession + 4) = NAN;
  *(void *)&self->_firstOutputRangeAlgorithmSource = -1;
  *(void *)&self->_numberOfArrowRevokes = -1;
  LOWORD(self->_numberOfSolutions) = 0;
  BYTE2(self->_numberOfSolutions) = 0;
  if (self->_anon_3a8[56]) {
    self->_anon_3a8[56] = 0;
  }
  [(NIServerAnalyticsManager *)self _onVIOReset];
  if (self->_anon_9d8[169]) {
    self->_anon_9d8[169] = 0;
  }
  if (self->_anon_9d8[171]) {
    self->_anon_9d8[171] = 0;
  }
  *(void *)&self->_anon_9d8[176] = 0;
  *(void *)&self->_isFinderAPhone.var0.__null_state_ = 0xBFF0000000000000;
  *(_OWORD *)&self->_timePDRAndVIOWasAvailable = 0u;
  if (self->_anon_af8[56]) {
    self->_anon_af8[56] = 0;
  }
  *(_OWORD *)&self->_anon_af8[72] = v60;
  *(_OWORD *)&self->_pathLengthError = v60;
  *(_OWORD *)&self->_radialDisplacementError = v60;
  *(_OWORD *)&self->_stdSpeedFromVIO = 0uLL;
  *(_OWORD *)&self->_timeSSFromVIO = 0uLL;
  *(_OWORD *)&self->_timeSSFromIOAndSSFromVIO = v60;
  *(_OWORD *)&self->_pdrSSDetectionTruePositiveRate = v60;
  *(_OWORD *)&self->_percentTimeSSFromVIO = 0uLL;
  self->_runningMeanSpeedFromVIO = NAN;
  self->_m2 = -1.0;
  *(_OWORD *)&self->_acquisitionReason = 0uLL;
  self->_firstNBRSSI = -1.0;
  *(_OWORD *)&self->_firstUWBRSSI = 0uLL;
  self->_lastNBRSSI = -1.79769313e308;
  *(int64x2_t *)&self->_lastUWBRSSI = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  *(int64x2_t *)&self->_maxNBRSSI = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *(_OWORD *)&self->_minDistance_finding = xmmword_1004A01A0;
  *(_OWORD *)&self->_minUWBRSSI = xmmword_1004A01A0;
  self->_minYCoordinateFinder = 1.79769313e308;
  LOWORD(self->_maxYCoordinateFindee) = 0;
  if (LOBYTE(self->_minYCoordinateFindee)) {
    LOBYTE(self->_minYCoordinateFindee) = 0;
  }
  LODWORD(self->_lifecycleTimeoutType) = 0;
  p_lifecycleTimeoutType = &self->_lifecycleTimeoutType;
  *(_OWORD *)&self->_didFinderChangeFloor = 0u;
  self->_firstRawRangeValue = -1.79769313e308;
  *(_OWORD *)&self->_currentRawRangeValue = xmmword_1004A01B0;
  self->_minRawRangeValue = -1.0;
  self->_backgroundContinuationTimeoutType = 0;
  p_backgroundContinuationTimeoutType = &self->_backgroundContinuationTimeoutType;
  *(_DWORD *)((char *)&self->_backgroundContinuationTimeoutType + 7) = 0;
  uint64_t v22 = objc_opt_class();
  if (v22 == objc_opt_class())
  {
    *(_DWORD *)p_lifecycleTimeoutType = 1;
    id v25 = v7;
    *p_backgroundContinuationTimeoutType = (NSString *)[v25 backgroundMode];
    LOBYTE(self->_sessionType) = [v25 _internalIsCameraAssistanceEnabled];

    goto LABEL_35;
  }
  uint64_t v23 = objc_opt_class();
  if (v23 == objc_opt_class())
  {
    *(_DWORD *)p_lifecycleTimeoutType = 2;
    id v26 = v7;
    *p_backgroundContinuationTimeoutType = (NSString *)[v26 backgroundMode];
    LOBYTE(self->_sessionType) = [v26 _internalIsCameraAssistanceEnabled];
    id v27 = [v26 accessoryConfigData];
    id v28 = [v27 bytes];

    v29 = [v26 accessoryConfigData];
    id v30 = [v29 length];
    v62 = 0;
    v63 = 0;
    uint64_t v64 = 0;
    sub_10003AD14(&v62, v28, (uint64_t)v30 + (void)v28, (size_t)v30);

    v31 = v62;
    size_t v32 = v63 - (unsigned char *)v62;
    if ((unint64_t)(v63 - (unsigned char *)v62) >= 0x14)
    {
      uint64_t v47 = 0;
      unsigned int v48 = (unsigned __int16)*v62;
      BOOL v49 = !v62[1] && v48 == 1;
      BOOL v50 = v62[1] && v48 == 1;
      unsigned int v51 = (unsigned __int16)v62[8];
      uint64_t v52 = (unsigned __int16)v62[9];
      while (__PAIR64__(v52, v51) != __PAIR64__((unsigned __int16)word_1004A0240[v47 + 1], (unsigned __int16)word_1004A0240[v47]))
      {
        v47 += 2;
        if (v47 == 6)
        {
          int v53 = 0;
          goto LABEL_64;
        }
      }
      int v53 = 1;
LABEL_64:
      BOOL v54 = v51 == 1 && v52 > 2;
      int v55 = v54;
      int v56 = v51 <= 1 ? v55 : 1;
      int v57 = v48 > 1 || v49;
      if ((v57 | v50) == 1 && v53 | v56)
      {
        if (v53)
        {
          if (v51 != 1 || v52 >= 3) {
            __assert_rtn("UWBConfigDataTotalLengthBytes", "NIFiRaDefinitions.h", 375, "false");
          }
          if (v32 != 2 * v52 + 35 || *((unsigned __int8 *)v62 + 15) != (2 * v52 + 19)) {
            goto LABEL_33;
          }
        }
        else if (v56)
        {
          if (v32 < 0x27 || *((unsigned __int8 *)v62 + 15) < 0x17u) {
            goto LABEL_33;
          }
          size_t v32 = 39;
        }
        else
        {
          size_t v32 = 0;
        }
        *(_DWORD *)buf = 0;
        *(_DWORD *)&buf[16] = 0;
        int v69 = 0;
        *(void *)&buf[5] = 0;
        *(_WORD *)&buf[13] = 0;
        memcpy(buf, v62, v32);
        char v58 = buf[4];
        if (buf[4] <= 0x14u
          && ((1 << buf[4]) & 0x100401) != 0
          && v68 <= 1u
          && BYTE2(v69) <= 1u
          && HIBYTE(v69) <= 8u
          && ((1 << SHIBYTE(v69)) & 0x10D) != 0)
        {
          BYTE1(self->_sessionType) = 1;
          BYTE2(self->_sessionType) = v58;
        }
      }
    }
    if (!v31)
    {
LABEL_34:

      goto LABEL_35;
    }
LABEL_33:
    v63 = v31;
    operator delete(v31);
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v7 isFinder]) {
      int v24 = 4;
    }
    else {
      int v24 = 3;
    }
    *(_DWORD *)p_lifecycleTimeoutType = v24;
  }
LABEL_35:
  std::mutex::lock(&stru_10089D170);
  unsigned __int8 v33 = ++byte_1008A00B8;
  *(void *)buf = &self->_lifecycleTimeoutType;
  v34 = sub_10003AE18((uint64_t)&xmmword_1008A0068, (int *)&self->_lifecycleTimeoutType, (uint64_t)&unk_1004BC2F8, (_DWORD **)buf);
  unsigned __int8 v35 = *((unsigned char *)v34 + 20) + 1;
  *((unsigned char *)v34 + 20) = v35;
  if (self->_bundleIdentifier)
  {
    if (*((char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0)
    {
      if (self->_bundleIdAsStdString.__r_.__value_.var0.var1.__size_) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23))
    {
LABEL_38:
      *(void *)buf = &self->_bundleIdAsStdString;
      v36 = sub_10003B03C((uint64_t)&xmmword_1008A0090, (unsigned __int8 *)&self->_bundleIdAsStdString, (uint64_t)&unk_1004BC2F8, (long long **)buf);
      unsigned __int8 v37 = v36[40] + 1;
      v36[40] = v37;
      goto LABEL_40;
    }
    __assert_rtn("-[NIServerAnalyticsManager sessionSuccessfullyRanWithConfig:withTimestamp:]", "NIServerAnalyticsManager.mm", 864, "!_bundleIdAsStdString.empty()");
  }
  unsigned __int8 v37 = 0;
LABEL_40:
  std::mutex::unlock(&stru_10089D170);
  id v38 = objc_alloc_init((Class)NSMutableDictionary);
  v39 = +[NSNumber numberWithInt:v33];
  [v38 setObject:v39 forKey:@"numSimultaneousSessions_All"];

  switch(*(_DWORD *)p_lifecycleTimeoutType)
  {
    case 1:
      v40 = +[NSNumber numberWithInt:v35];
      [v38 setObject:v40 forKey:@"numSimultaneousSessions_Peer"];
      goto LABEL_47;
    case 2:
      v40 = +[NSNumber numberWithInt:v35];
      [v38 setObject:v40 forKey:@"numSimultaneousSessions_Accessory"];
      goto LABEL_47;
    case 3:
      v40 = +[NSNumber numberWithInt:v35];
      [v38 setObject:v40 forKey:@"com.apple.nearbyinteraction.peopleFindingSession.FindeeSummary"];
      goto LABEL_47;
    case 4:
      v40 = +[NSNumber numberWithInt:v35];
      [v38 setObject:v40 forKey:@"com.apple.nearbyinteraction.peopleFindingSession.FinderSummary"];
LABEL_47:

      break;
    default:
      break;
  }
  v41 = self->_bundleIdentifier;
  if (v41)
  {
    [v38 setObject:v41 forKey:@"appBundleID"];
    v42 = +[NSNumber numberWithInt:v37];
    [v38 setObject:v42 forKey:@"numSimultaneousSessions_ThisApp"];
  }
  id v43 = [v38 mutableCopy];
  v44 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v45 = self->_bundleIdentifier;
    v46 = [v43 description];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v45;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = @"com.apple.nearbyinteractionv2.start";
    __int16 v66 = 2112;
    double v67 = *(double *)&v46;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);
  }
  id v61 = v43;
  AnalyticsSendEventLazy();
}

- (void)sessionPausedWithTimestamp:(double)a3
{
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v7 = 138412546;
    v8 = bundleIdentifier;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] sessionPausedWithTimestamp: %f [s]", (uint8_t *)&v7, 0x16u);
  }
  [(NIServerAnalyticsManager *)self _sessionStoppedWithTimestamp:a3];
}

- (void)sessionInterruptedWithTimestamp:(double)a3
{
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v7 = 138412546;
    v8 = bundleIdentifier;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] sessionInterruptedWithTimestamp: %f [s]", (uint8_t *)&v7, 0x16u);
  }
  [(NIServerAnalyticsManager *)self _sessionStoppedWithTimestamp:a3];
}

- (void)sessionInvalidatedWithTimestamp:(double)a3
{
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v7 = 138412546;
    v8 = bundleIdentifier;
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] sessionInvalidatedWithTimestamp: %f [s]", (uint8_t *)&v7, 0x16u);
  }
  [(NIServerAnalyticsManager *)self _sessionStoppedWithTimestamp:a3];
}

- (void)appBecameVisibleWithTimestamp:(double)a3
{
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v9 = 138412546;
    double v10 = bundleIdentifier;
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] appBecameVisibleWithTimestamp: %f [s]", (uint8_t *)&v9, 0x16u);
  }
  if (self->_isRunning)
  {
    int v7 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      v8 = self->_bundleIdentifier;
      int v9 = 138412290;
      double v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#ni-ca,[%@] App already visible. Ignore duplicate call.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    self->_visibilityUpdateTimestamp = self->_visibilityUpdateTimestamp + a3 - self->_runTimestamp;
    self->_runTimestamp = a3;
    self->_isRunning = 1;
  }
}

- (void)appBecameNotVisibleWithTimestamp:(double)a3
{
  id v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v10 = 138412546;
    __int16 v11 = bundleIdentifier;
    __int16 v12 = 2048;
    double v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] appBecameNotVisibleWithTimestamp: %f [s]", (uint8_t *)&v10, 0x16u);
  }
  if (self->_isRunning)
  {
    double v7 = *(double *)&self->_isVisible + a3 - self->_runTimestamp;
    self->_runTimestamp = a3;
    *(double *)&self->_isVisible = v7;
    self->_isRunning = 0;
  }
  else
  {
    v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      int v9 = self->_bundleIdentifier;
      int v10 = 138412290;
      __int16 v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ni-ca,[%@] App already not visible. Ignore duplicate call.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)updateWithRangeResult:(RangeResult *)a3
{
  if (LOBYTE(self->_sessionType))
  {
    if (!HIBYTE(self->_sessionType))
    {
      HIBYTE(self->_sessionType) = 1;
      *(double *)&self->_lastVIOPosition[6] = a3->var1;
    }
  }
}

- (void)updateWithVIOPose:(Pose *)a3
{
  if (LOBYTE(self->_sessionType))
  {
    if (a3[1].source.var0.__val_ == 2)
    {
      if (!*((unsigned char *)&self->_sessionType + 6)) {
        *((unsigned char *)&self->_sessionType + 6) = 1;
      }
      optional<double> lightEstimate = a3[1].lightEstimate;
      if (*((unsigned char *)&self->_sessionType + 7))
      {
        float32x4_t v4 = vsubq_f32(*(float32x4_t *)&self->_isCameraAssistanceEnabled, (float32x4_t)lightEstimate);
        float32x4_t v5 = vmulq_f32(v4, v4);
        self->_distanceMovedToHorizontalConvergence = self->_distanceMovedToHorizontalConvergence
                                                    + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
      }
      else
      {
        *((unsigned char *)&self->_sessionType + 7) = 1;
        self->_distanceMovedToHorizontalConvergence = 0.0;
      }
    }
    else
    {
      if (!*((unsigned char *)&self->_sessionType + 6)) {
        return;
      }
      ++LODWORD(self->_timeToHorizontalConvergence);
      *((unsigned char *)&self->_sessionType + 6) = 0;
      optional<double> lightEstimate = (optional<double>)0;
    }
    *(optional<double> *)&self->_isCameraAssistanceEnabled = lightEstimate;
  }
}

- (void)updateWithSASolution:(Solution *)a3
{
  if (LOBYTE(self->_sessionType))
  {
    if (a3->var2.__engaged_)
    {
      if (!*((unsigned char *)&self->_sessionType + 4)) {
        *((unsigned char *)&self->_sessionType + 4) = 1;
      }
      if (!LOBYTE(self->_backgroundMode))
      {
        LOBYTE(self->_backgroundMode) = 1;
        if (!a3->var1.var1) {
          sub_10040E8A0();
        }
        self->_rangeAtHorizontalConvergence = a3->var1.var0.var1.var1 - *(double *)&self->_lastVIOPosition[6];
        self->_distanceMovedToVerticalConvergence = a3->var1.var0.var1.var2;
        *(double *)&self->_lastVIOPosition[14] = self->_distanceMovedToHorizontalConvergence;
      }
    }
    else if (*((unsigned char *)&self->_sessionType + 4))
    {
      *((unsigned char *)&self->_sessionType + 4) = 0;
      ++HIDWORD(self->_timeToHorizontalConvergence);
    }
    if (a3->var0.var0 == 1)
    {
      if (!*((unsigned char *)&self->_sessionType + 5)) {
        *((unsigned char *)&self->_sessionType + 5) = 1;
      }
      if (!BYTE1(self->_backgroundMode))
      {
        BYTE1(self->_backgroundMode) = 1;
        if (!a3->var1.var1) {
          sub_10040E874();
        }
        self->_rangeAtVerticalConvergence = a3->var1.var0.var1.var1 - *(double *)&self->_lastVIOPosition[6];
        self->_totalDistanceMoved = a3->var1.var0.var1.var2;
        self->_firstRangeMeasurementTime = self->_distanceMovedToHorizontalConvergence;
      }
    }
    else if (*((unsigned char *)&self->_sessionType + 5))
    {
      *((unsigned char *)&self->_sessionType + 5) = 0;
      ++LODWORD(self->_timeToVerticalConvergence);
    }
  }
}

- (void)updateWithPeerDeviceType:(BOOL)a3
{
  int lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    uint64_t v4 = 2706;
  }
  else
  {
    if (lifecycleTimeoutType != 3) {
      return;
    }
    uint64_t v4 = 2704;
  }
  *(_WORD *)((char *)&self->super.isa + v4) = a3 | 0x100;
}

- (void)updateWithFindeePeerData:(const void *)a3
{
  if (LODWORD(self->_lifecycleTimeoutType) != 3) {
    return;
  }
  int timeLocationFromWiFi_low = LODWORD(self->_timeLocationFromWiFi);
  BOOL v6 = __CFADD__(timeLocationFromWiFi_low, 1);
  int v7 = timeLocationFromWiFi_low + 1;
  if (v6) {
    int v7 = 1;
  }
  LODWORD(self->_timeLocationFromWiFi) = v7;
  if (*(double *)&self->_numberOfWalkingOrkUnknown == -1.0)
  {
    *(double *)&self->_numberOfWalkingOrkUnknown = sub_100006C38();
    if (!*((unsigned char *)a3 + 16)) {
      goto LABEL_40;
    }
    LODWORD(self->_timeAtFirstPeerData) = *((_DWORD *)a3 + 2);
    BYTE4(self->_timeAtFirstPeerData) = 1;
    *(double *)&self->_numberOfMissedRanges = sub_100006C38();
    if (*((unsigned char *)a3 + 72))
    {
      HIDWORD(self->_maxYCoordinateFindee) = *((_DWORD *)a3 + 10);
      LOBYTE(self->_minYCoordinateFindee) = 1;
    }
  }
  if (*((unsigned char *)a3 + 16))
  {
    int timeLocationFromWiFi_high = HIDWORD(self->_timeLocationFromWiFi);
    BOOL v6 = __CFADD__(timeLocationFromWiFi_high, 1);
    int v9 = timeLocationFromWiFi_high + 1;
    if (v6) {
      int v9 = 1;
    }
    HIDWORD(self->_timeLocationFromWiFi) = v9;
    uint64_t v10 = *((int *)a3 + 2);
    if (v10 <= 2)
    {
      uint64_t v11 = qword_1004A0268[v10];
      int v12 = *(_DWORD *)((char *)&self->super.isa + v11);
      BOOL v6 = __CFADD__(v12, 1);
      int v13 = v12 + 1;
      if (v6) {
        int v13 = 1;
      }
      *(_DWORD *)((char *)&self->super.isa + v11) = v13;
    }
    if (BYTE4(self->_timeAtFirstPeerData))
    {
      unsigned int timeAtFirstPeerData_low = LODWORD(self->_timeAtFirstPeerData);
      if (timeAtFirstPeerData_low <= 2)
      {
        uint64_t v15 = qword_1004A0250[timeAtFirstPeerData_low];
        *(double *)((char *)&self->super.isa + v15) = *(double *)((char *)&self->super.isa + v15)
                                                    + sub_100006C38()
                                                    - *(double *)&self->_numberOfMissedRanges;
        LODWORD(self->_timeAtFirstPeerData) = timeAtFirstPeerData_low;
        BYTE4(self->_timeAtFirstPeerData) = 1;
      }
      *(double *)&self->_numberOfMissedRanges = sub_100006C38();
      goto LABEL_22;
    }
LABEL_40:
    sub_10000AE44();
  }
LABEL_22:
  if (*((unsigned char *)a3 + 72))
  {
    uint64_t v16 = 412;
    if (*((_DWORD *)a3 + 10) == 1) {
      uint64_t v16 = 400;
    }
    int v17 = *(_DWORD *)((char *)&self->super.isa + v16);
    BOOL v6 = __CFADD__(v17, 1);
    int v18 = v17 + 1;
    if (v6) {
      int v18 = 1;
    }
    *(_DWORD *)((char *)&self->super.isa + v16) = v18;
  }
  if (*((unsigned char *)a3 + 112))
  {
    int numberOfPeerData = self->_numberOfPeerData;
    BOOL v6 = __CFADD__(numberOfPeerData, 1);
    int v20 = numberOfPeerData + 1;
    if (v6) {
      int v20 = 1;
    }
    self->_int numberOfPeerData = v20;
  }
  if (*((unsigned char *)a3 + 160))
  {
    int timeLocationFromWiFi2_high = HIDWORD(self->_timeLocationFromWiFi2);
    BOOL v6 = __CFADD__(timeLocationFromWiFi2_high, 1);
    int v22 = timeLocationFromWiFi2_high + 1;
    if (v6) {
      int v22 = 1;
    }
    HIDWORD(self->_timeLocationFromWiFi2) = v22;
  }
}

- (void)updateWithMissedRange
{
  if (LODWORD(self->_lifecycleTimeoutType) == 3)
  {
    int numberOfSlowlyMoving = self->_numberOfSlowlyMoving;
    BOOL v3 = __CFADD__(numberOfSlowlyMoving, 1);
    int v4 = numberOfSlowlyMoving + 1;
    if (v3) {
      int v4 = 1;
    }
    self->_int numberOfSlowlyMoving = v4;
  }
}

- (void)_calculateAndLogErrorsFromIODeltaP:(NIServerAnalyticsManager *)self vioDeltaP:(SEL)a2 vioPos:
{
  float32x4_t v5 = v4;
  BOOL v6 = v3;
  uint64_t v7 = v2;
  double v9 = sub_100006C38();
  float v10 = atan2f(vmlas_n_f32((float)-COERCE_FLOAT(*(void *)(v7 + 8)) * COERCE_FLOAT(*v6), COERCE_FLOAT(v6->i64[1]), COERCE_FLOAT(*(_OWORD *)v7)), vmlas_n_f32(vmuls_lane_f32(COERCE_FLOAT(*(void *)(v7 + 8)), *v6, 2), COERCE_FLOAT(*v6), COERCE_FLOAT(*(_OWORD *)v7)))* 57.2957795;
  int v11 = BYTE4(self->_pointToPointErrorHistory.__end_);
  if (BYTE4(self->_pointToPointErrorHistory.__end_)) {
    float v12 = v10 - *(float *)&self->_pointToPointErrorHistory.__end_;
  }
  else {
    float v12 = 0.0;
  }
  *(float *)&self->_pointToPointErrorHistory.__end_ = v10;
  BYTE4(self->_pointToPointErrorHistory.__end_) = 1;
  value = self->_angleErrorHistory.__end_cap_.__value_;
  end = self->_angleErrorHistory.__end_;
  uint64_t v15 = (char *)value - (char *)end;
  if ((unint64_t)((char *)value - (char *)end) <= 0x4AF)
  {
    uint64_t v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
    if ((unint64_t)v16 - *(void *)&self->_timeOfLastPDRUpdate.var0.__val_ <= 0x4AF
      && v9 - *(double *)&self->_pointToPointErrorHistory.__end_cap_.__value_ >= 0.5
      && (float *)((char *)self->_deltaAngleErrorHistory.__end_cap_.__value_
                 - (char *)self->_deltaAngleErrorHistory.__end_) <= (float *)0x4AF)
    {
      if (v11)
      {
        begin = self->_deltaAngleErrorHistory.__begin_;
        if (value >= begin)
        {
          uint64_t v19 = v15 >> 2;
          uint64_t v20 = (char *)begin - (char *)end;
          if (v20 >> 1 <= (unint64_t)((v15 >> 2) + 1)) {
            uint64_t v21 = v19 + 1;
          }
          else {
            uint64_t v21 = v20 >> 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v21;
          }
          uint64_t v23 = (char *)sub_10003B54C((uint64_t)&self->_deltaAngleErrorHistory, v22);
          int v24 = self->_angleErrorHistory.__end_cap_.__value_;
          id v25 = self->_angleErrorHistory.__end_;
          id v26 = (float *)&v23[4 * v19];
          id v28 = (float *)&v23[4 * v27];
          *id v26 = v12;
          int v18 = v26 + 1;
          while (v24 != v25)
          {
            int v29 = *((_DWORD *)v24-- - 1);
            *((_DWORD *)v26-- - 1) = v29;
          }
          self->_angleErrorHistory.__end_ = v26;
          self->_angleErrorHistory.__end_cap_.__value_ = v18;
          self->_deltaAngleErrorHistory.__begin_ = v28;
          if (v25) {
            operator delete(v25);
          }
        }
        else
        {
          float *value = v12;
          int v18 = value + 1;
        }
        self->_angleErrorHistory.__end_cap_.__value_ = v18;
        uint64_t v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
      }
      id v30 = self->_angleErrorHistory.__begin_;
      if (v16 >= v30)
      {
        double val = self->_timeOfLastPDRUpdate.var0.__val_;
        uint64_t v33 = ((uint64_t)v16 - *(void *)&val) >> 2;
        if ((unint64_t)(v33 + 1) >> 62) {
          goto LABEL_59;
        }
        unint64_t v34 = (unint64_t)v30 - *(void *)&val;
        unint64_t v35 = ((uint64_t)v30 - *(void *)&val) >> 1;
        if (v35 <= v33 + 1) {
          unint64_t v35 = v33 + 1;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v36 = v35;
        }
        if (v36)
        {
          unsigned __int8 v37 = (char *)sub_10003B54C((uint64_t)&self->_angleErrorHistory, v36);
          uint64_t v16 = *(float **)&self->_timeOfLastPDRUpdate.__engaged_;
          double val = self->_timeOfLastPDRUpdate.var0.__val_;
        }
        else
        {
          unsigned __int8 v37 = 0;
        }
        id v38 = (float *)&v37[4 * v33];
        v39 = (float *)&v37[4 * v36];
        *id v38 = v10;
        v31 = v38 + 1;
        while (v16 != *(float **)&val)
        {
          int v40 = *((_DWORD *)v16-- - 1);
          *((_DWORD *)v38-- - 1) = v40;
        }
        *(void *)&self->_timeOfLastPDRUpdate.var0.__val_ = v38;
        *(void *)&self->_timeOfLastPDRUpdate.__engaged_ = v31;
        self->_angleErrorHistory.__begin_ = v39;
        if (val != 0.0) {
          operator delete(*(void **)&val);
        }
      }
      else
      {
        *uint64_t v16 = v10;
        v31 = v16 + 1;
      }
      *(void *)&self->_timeOfLastPDRUpdate.__engaged_ = v31;
      double deltaVSourceTime = self->_deltaVSourceTime;
      if (deltaVSourceTime <= 0.0)
      {
LABEL_57:
        *(double *)&self->_pointToPointErrorHistory.__end_cap_.__value_ = v9;
        return;
      }
      float32x4_t v42 = vsubq_f32(*(float32x4_t *)&self->_anon_dc8[56], *v5);
      float32x4_t v43 = vmulq_f32(v42, v42);
      float v44 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).f32[0])/ deltaVSourceTime;
      v45 = self->_deltaAngleErrorHistory.__end_cap_.__value_;
      v46 = self->_pointToPointErrorHistory.__begin_;
      if (v45 < v46)
      {
        float *v45 = v44;
        uint64_t v47 = v45 + 1;
LABEL_56:
        self->_deltaAngleErrorHistory.__end_cap_.__value_ = v47;
        goto LABEL_57;
      }
      unsigned int v48 = self->_deltaAngleErrorHistory.__end_;
      uint64_t v49 = v45 - v48;
      if (!((unint64_t)(v49 + 1) >> 62))
      {
        unint64_t v50 = (char *)v46 - (char *)v48;
        unint64_t v51 = ((char *)v46 - (char *)v48) >> 1;
        if (v51 <= v49 + 1) {
          unint64_t v51 = v49 + 1;
        }
        if (v50 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v52 = v51;
        }
        if (v52)
        {
          int v53 = (char *)sub_10003B54C((uint64_t)&self->_pointToPointErrorHistory, v52);
          v45 = self->_deltaAngleErrorHistory.__end_cap_.__value_;
          unsigned int v48 = self->_deltaAngleErrorHistory.__end_;
        }
        else
        {
          int v53 = 0;
        }
        BOOL v54 = (float *)&v53[4 * v49];
        int v55 = (float *)&v53[4 * v52];
        *BOOL v54 = v44;
        uint64_t v47 = v54 + 1;
        while (v45 != v48)
        {
          int v56 = *((_DWORD *)v45-- - 1);
          *((_DWORD *)v54-- - 1) = v56;
        }
        self->_deltaAngleErrorHistory.__end_ = v54;
        self->_deltaAngleErrorHistory.__end_cap_.__value_ = v47;
        self->_pointToPointErrorHistory.__begin_ = v55;
        if (v48) {
          operator delete(v48);
        }
        goto LABEL_56;
      }
LABEL_59:
      sub_1000267C4();
    }
  }
}

- (void)_updateAlignedPDRMetrics:(const void *)a3
{
  double v5 = sub_10002D570();
  double v6 = sub_100006C38();
  double v7 = *(double *)a3 + v6 - v5;
  if (!LOBYTE(self->_vioPathLength) && *((unsigned char *)a3 + 32) && *((unsigned char *)a3 + 48) != 0)
  {
    float64x2_t v9 = *(float64x2_t *)((char *)a3 + 24);
    v9.f64[1] = *((float64_t *)a3 + 5);
    *(float32x2_t *)&v9.f64[0] = vcvt_f32_f64(v9);
    if (sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v9.f64[0], *(float32x2_t *)&v9.f64[0]))) / 0.1 > 0.15)
    {
      self->_noOdometryAvailableTime = v6;
      LOBYTE(self->_vioPathLength) = 1;
    }
  }
  sub_1003882C0((uint64_t)&self->_rangeAtFirstArrow, (uint64_t)a3, (uint64_t)&v28, v7);
  int v10 = sub_100387E9C((uint64_t)&self->_rangeAtFirstArrow);
  v11.n128_f64[0] = v7;
  sub_100388250(&self->_rangeAtFirstArrow, (uint64_t)v25, v11);
  if (v10 != 5)
  {
    LODWORD(self->_timeAtFirstIOPose.var0.__val_) = v10;
    return;
  }
  if (LODWORD(self->_timeAtFirstIOPose.var0.__val_) == 5)
  {
    v23.i8[0] = 0;
    char v24 = 0;
    if (!v27) {
      return;
    }
LABEL_18:
    float32x4_t v12 = vsubq_f32(v26, *(float32x4_t *)self->_integratedPDRVIOFrame);
    char v22 = 1;
    float32x4_t v21 = v12;
    int null_state = self->_previousAdjustedRotatedVioPosition.var0.__null_state_;
    double v14 = 0.0;
    if (self->_previousAdjustedRotatedVioPosition.var0.__null_state_)
    {
      int null_state = self->_anon_e42[22];
      if (self->_anon_e42[22])
      {
        float32x4_t v15 = vsubq_f32(v12, *(float32x4_t *)&self->_previousVioIsNotAvailable);
        int null_state = 1;
        char v24 = 1;
        float32x4_t v23 = v15;
        double v16 = v7 - *(double *)&self->_anon_e42[14];
        if (v16 <= 0.0)
        {
          int v18 = 0;
          double v14 = 0.0;
          goto LABEL_23;
        }
        float32x4_t v17 = vmulq_f32(v15, v15);
        *(double *)v17.i64 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]);
        double v14 = *(double *)v17.i64 / v16;
        self->_double deltaVSourceTime = self->_deltaVSourceTime + *(double *)v17.i64;
      }
    }
    *(float32x4_t *)&self->_previousVioIsNotAvailable = v21;
    self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = v22;
    *(double *)&self->_anon_e42[14] = v7;
    self->_anon_e42[22] = 1;
    int v18 = null_state;
LABEL_23:
    if (v29)
    {
      float32x4_t v19 = v28;
      *(float32x4_t *)&self->_anon_dc8[56] = vaddq_f32(v28, *(float32x4_t *)&self->_anon_dc8[56]);
      if (v18)
      {
        if (null_state)
        {
          float32x4_t v20 = vmulq_f32(v19, v19);
          if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).f32[0])/ 0.1 > 0.15&& v14 > 0.15)
          {
            [(NIServerAnalyticsManager *)self _calculateAndLogErrorsFromIODeltaP:&v28 vioDeltaP:&v23 vioPos:&v21];
          }
        }
      }
    }
    return;
  }
  *(_OWORD *)&self->_anon_dc8[56] = 0u;
  self->_double deltaVSourceTime = 0.0;
  if (self->_previousAdjustedRotatedVioPosition.var0.__null_state_) {
    self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = 0;
  }
  if (v27)
  {
    *(float32x4_t *)self->_integratedPDRVIOFrame = v26;
    LODWORD(self->_timeAtFirstIOPose.var0.__val_) = 5;
    v23.i8[0] = 0;
    char v24 = 0;
    goto LABEL_18;
  }
}

- (void)updateWithPDR:(const void *)a3
{
  int lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    [(NIServerAnalyticsManager *)self _updateAlignedPDRMetrics:a3];
    double v6 = *(double *)&self->_isFinderAPhone.var0.__null_state_;
    if (v6 == -1.0)
    {
      double v6 = *(double *)a3;
      *(void *)&self->_isFinderAPhone.var0.__null_state_ = *(void *)a3;
    }
    double v7 = *(double *)a3;
    long long v8 = *((_OWORD *)a3 + 7);
    v53[6] = *((_OWORD *)a3 + 6);
    v53[7] = v8;
    long long v9 = *((_OWORD *)a3 + 9);
    v53[8] = *((_OWORD *)a3 + 8);
    v53[9] = v9;
    long long v10 = *((_OWORD *)a3 + 3);
    v53[2] = *((_OWORD *)a3 + 2);
    v53[3] = v10;
    long long v11 = *((_OWORD *)a3 + 5);
    v53[4] = *((_OWORD *)a3 + 4);
    v53[5] = v11;
    long long v12 = *((_OWORD *)a3 + 1);
    v53[0] = *(_OWORD *)a3;
    v53[1] = v12;
    if (![(NIServerAnalyticsManager *)self _isPDRAvailable:v53]
      || !BYTE2(self->_numberOfSolutions))
    {
      goto LABEL_33;
    }
    double v13 = v7 - v6;
    *(double *)&self->_anon_9d8[176] = v13 + *(double *)&self->_anon_9d8[176];
    double pdrSSDetectionFalsePositiveRate = self->_pdrSSDetectionFalsePositiveRate;
    if (pdrSSDetectionFalsePositiveRate == -1.0) {
      double v15 = 1.0;
    }
    else {
      double v15 = pdrSSDetectionFalsePositiveRate + 1.0;
    }
    self->_double pdrSSDetectionFalsePositiveRate = v15;
    if (!*((unsigned char *)a3 + 32) || !*((unsigned char *)a3 + 48)) {
      goto LABEL_35;
    }
    double v16 = sqrt(*((double *)a3 + 5) * *((double *)a3 + 5) + *((double *)a3 + 3) * *((double *)a3 + 3));
    self->_timePDRAndVIOWasAvailable = self->_timePDRAndVIOWasAvailable + v16;
    long long v17 = *(_OWORD *)&self->_anon_3a8[40];
    v58[6] = *(_OWORD *)&self->_anon_3a8[24];
    v58[7] = v17;
    v58[8] = *(_OWORD *)&self->_anon_3a8[56];
    long long v18 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
    v58[2] = self->_lastPose.var0.__val_.lightEstimate;
    v58[3] = v18;
    long long v19 = *(_OWORD *)&self->_anon_3a8[8];
    v58[4] = *(_OWORD *)&self->_lastPose.__engaged_;
    v58[5] = v19;
    long long v20 = *(_OWORD *)&self->_lastPose.var0.__null_state_;
    v58[0] = *(_OWORD *)&self->_anon_318[72];
    v58[1] = v20;
    long long v21 = *(_OWORD *)&self->_anon_af8[8];
    long long v22 = *(_OWORD *)&self->_anon_af8[40];
    v57[6] = *(_OWORD *)&self->_anon_af8[24];
    v57[7] = v22;
    v57[8] = *(_OWORD *)&self->_anon_af8[56];
    long long v23 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_;
    long long v24 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_;
    v57[2] = self->_vioPoseAtLastPDRUpdate.var0.__val_.lightEstimate;
    v57[3] = v24;
    v57[4] = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_;
    v57[5] = v21;
    v57[0] = *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable;
    v57[1] = v23;
    [(NIServerAnalyticsManager *)self _deltaDistanceFromVIOPoses:v58 :v57];
    self->_timeAtLastIOUpdate = v25 + self->_timeAtLastIOUpdate;
    if (v13 <= 0.0)
    {
      BOOL v30 = 0;
    }
    else
    {
      double v26 = v25 / v13;
      double percentTimeSSFromVIO = self->_percentTimeSSFromVIO;
      double v28 = v26 - percentTimeSSFromVIO;
      double v29 = percentTimeSSFromVIO + (v26 - percentTimeSSFromVIO) / self->_pdrSSDetectionFalsePositiveRate;
      self->_double percentTimeSSFromVIO = v29;
      self->_numberOfPDRUpdates = self->_numberOfPDRUpdates + v28 * (v26 - v29);
      BOOL v30 = v16 / v13 == 0.0;
    }
    long long v39 = *(_OWORD *)&self->_anon_3a8[40];
    v56[6] = *(_OWORD *)&self->_anon_3a8[24];
    v56[7] = v39;
    v56[8] = *(_OWORD *)&self->_anon_3a8[56];
    long long v40 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
    v56[2] = self->_lastPose.var0.__val_.lightEstimate;
    v56[3] = v40;
    long long v41 = *(_OWORD *)&self->_anon_3a8[8];
    v56[4] = *(_OWORD *)&self->_lastPose.__engaged_;
    v56[5] = v41;
    long long v42 = *(_OWORD *)&self->_lastPose.var0.__null_state_;
    v56[0] = *(_OWORD *)&self->_anon_318[72];
    v56[1] = v42;
    long long v43 = *(_OWORD *)&self->_anon_af8[40];
    v55[6] = *(_OWORD *)&self->_anon_af8[24];
    v55[7] = v43;
    v55[8] = *(_OWORD *)&self->_anon_af8[56];
    long long v44 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_;
    v55[2] = self->_vioPoseAtLastPDRUpdate.var0.__val_.lightEstimate;
    v55[3] = v44;
    long long v45 = *(_OWORD *)&self->_anon_af8[8];
    v55[4] = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_;
    v55[5] = v45;
    long long v46 = *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_;
    v55[0] = *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable;
    v55[1] = v46;
    unsigned int v47 = [(NIServerAnalyticsManager *)self _isSemiStaticFromVIO:v56 :v55 :v13];
    if (v30)
    {
      if (v47)
      {
        self->_timeSSFromVIO = v13 + self->_timeSSFromVIO;
LABEL_29:
        uint64_t v48 = 2944;
LABEL_32:
        *(double *)((char *)&self->super.isa + v48) = v13 + *(double *)((char *)&self->super.isa + v48);
LABEL_33:
        long long v49 = *(_OWORD *)&self->_lastPose.__engaged_;
        *(_OWORD *)&self->_anon_af8[8] = *(_OWORD *)&self->_anon_3a8[8];
        long long v50 = *(_OWORD *)&self->_anon_3a8[40];
        *(_OWORD *)&self->_anon_af8[24] = *(_OWORD *)&self->_anon_3a8[24];
        *(_OWORD *)&self->_anon_af8[40] = v50;
        long long v51 = *(_OWORD *)&self->_anon_318[72];
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
        long long v52 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
        self->_vioPoseAtLastPDRUpdate.var0.__val_.optional<double> lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.var0.__val_.source.var0.__null_state_ = v52;
        *(_OWORD *)&self->_vioPoseAtLastPDRUpdate.__engaged_ = v49;
        self->_anon_af8[56] = self->_anon_3a8[56];
        *(_OWORD *)&self->_vioPathLengthWhenPDRIsAvailable = v51;
        self->_pdrTimeAtFirstPDRUpdate = *(double *)a3;
        *(void *)&self->_isFinderAPhone.var0.__null_state_ = *(void *)a3;
        return;
      }
      self->_timeNotSSFromVIO = v13 + self->_timeNotSSFromVIO;
    }
    else if (v47)
    {
      goto LABEL_29;
    }
    uint64_t v48 = 2952;
    goto LABEL_32;
  }
  if (lifecycleTimeoutType == 3)
  {
    if (self->_timeFindeeWasWalkingOrUnknown == -1.0)
    {
      self->_timeFindeeWasWalkingOrUnknown = *(double *)a3;
LABEL_23:
      self->_pdrTimeAtFirstPDRUpdate = *(double *)a3;
      return;
    }
    int pdrTimeAtLastPDRUpdate_low = LOBYTE(self->_pdrTimeAtLastPDRUpdate);
    long long v32 = *((_OWORD *)a3 + 7);
    v54[6] = *((_OWORD *)a3 + 6);
    v54[7] = v32;
    long long v33 = *((_OWORD *)a3 + 9);
    v54[8] = *((_OWORD *)a3 + 8);
    v54[9] = v33;
    long long v34 = *((_OWORD *)a3 + 3);
    v54[2] = *((_OWORD *)a3 + 2);
    v54[3] = v34;
    long long v35 = *((_OWORD *)a3 + 5);
    v54[4] = *((_OWORD *)a3 + 4);
    v54[5] = v35;
    long long v36 = *((_OWORD *)a3 + 1);
    v54[0] = *(_OWORD *)a3;
    v54[1] = v36;
    if (![(NIServerAnalyticsManager *)self _isPDRAvailable:v54]) {
      goto LABEL_23;
    }
    LOBYTE(self->_pdrTimeAtLastPDRUpdate) = 1;
    if (*((unsigned char *)a3 + 32) && *((unsigned char *)a3 + 48))
    {
      double v37 = sqrt(*((double *)a3 + 5) * *((double *)a3 + 5) + *((double *)a3 + 3) * *((double *)a3 + 3));
      if (pdrTimeAtLastPDRUpdate_low)
      {
        double v38 = *(double *)a3 - self->_pdrTimeAtFirstPDRUpdate;
        if (v37 / v38 < 0.1) {
          self->_distanceTraveledFromPDR = v38 + self->_distanceTraveledFromPDR;
        }
      }
      self->_timeToSessionEnd = v37 + self->_timeToSessionEnd;
      goto LABEL_23;
    }
LABEL_35:
    sub_10000AE44();
  }
}

- (void)updateWithSuccessfulRange:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5
{
  int lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 4)
  {
    -[NIServerAnalyticsManager _updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:](self, "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:", *(void *)&a5.var0.__val_, *(void *)&a5.__engaged_, a3, a4);
    if (self->_timeAtArmsLength == -1.0) {
      self->_timeAtArmsLength = sub_100006C38();
    }
    int numberOfArrowAvailabilityAfterFirstArrow = self->_numberOfArrowAvailabilityAfterFirstArrow;
    BOOL v8 = __CFADD__(numberOfArrowAvailabilityAfterFirstArrow, 1);
    int v11 = numberOfArrowAvailabilityAfterFirstArrow + 1;
    if (v8) {
      int v11 = 1;
    }
    self->_int numberOfArrowAvailabilityAfterFirstArrow = v11;
  }
  else if (lifecycleTimeoutType == 3)
  {
    int numberOfVIOFromPeerData = self->_numberOfVIOFromPeerData;
    BOOL v8 = __CFADD__(numberOfVIOFromPeerData, 1);
    int v9 = numberOfVIOFromPeerData + 1;
    if (v8) {
      int v9 = 1;
    }
    self->_int numberOfVIOFromPeerData = v9;
    -[NIServerAnalyticsManager _updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:](self, "_updateMinMaxRangeAndRSSI:uwbRSSI:nbRSSI:", *(void *)&a5.var0.__val_, *(void *)&a5.__engaged_, a3, a4);
  }
}

- (void)updateWithSelfLocation:(const LocationInput *)a3
{
  int lifecycleTimeoutType = (int)self->_lifecycleTimeoutType;
  if (lifecycleTimeoutType == 3)
  {
    int var11 = a3->var11;
    double timeAtLastLocationUpdate = self->_timeAtLastLocationUpdate;
    double v7 = sub_100006C38();
    if (timeAtLastLocationUpdate == -1.0)
    {
      self->_double timeAtLastLocationUpdate = v7;
    }
    else
    {
      if (!*((unsigned char *)&self->_numberOfLostVerticalConvergence + 4)) {
        sub_10000AE44();
      }
      switch(self->_numberOfLostVerticalConvergence)
      {
        case 0:
          double v9 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v9 > 10.0) {
            double v9 = 10.0;
          }
          self->_timeLocationFromMCC = self->_timeLocationFromMCC + v9;
          break;
        case 1:
          double v10 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v10 > 10.0) {
            double v10 = 10.0;
          }
          self->_timeLocationFromCell = self->_timeLocationFromCell + v10;
          break;
        case 3:
          double v12 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v12 > 10.0) {
            double v12 = 10.0;
          }
          *(double *)&self->_lastLocationType = *(double *)&self->_lastLocationType + v12;
          break;
        case 4:
          double v13 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v13 > 10.0) {
            double v13 = 10.0;
          }
          self->_timeLocationFromPipeline = self->_timeLocationFromPipeline + v13;
          break;
        case 6:
        case 0xA:
          double v8 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v8 > 10.0) {
            double v8 = 10.0;
          }
          self->_timeAtFirstLocationUpdate = self->_timeAtFirstLocationUpdate + v8;
          break;
        case 7:
          double v14 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v14 > 10.0) {
            double v14 = 10.0;
          }
          self->_timeLocationFromGPS = self->_timeLocationFromGPS + v14;
          break;
        case 8:
          double v15 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v15 > 10.0) {
            double v15 = 10.0;
          }
          self->_timeLocationFromLAC = self->_timeLocationFromLAC + v15;
          break;
        case 9:
          double v16 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v16 > 10.0) {
            double v16 = 10.0;
          }
          self->_timeLocationFromCompensated = self->_timeLocationFromCompensated + v16;
          break;
        case 0xB:
          double v17 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v17 > 10.0) {
            double v17 = 10.0;
          }
          self->_timeLocationFromUnknown = self->_timeLocationFromUnknown + v17;
          break;
        case 0xC:
          double v18 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v18 > 10.0) {
            double v18 = 10.0;
          }
          self->_timeLocationFromAccessory = self->_timeLocationFromAccessory + v18;
          break;
        case 0xD:
          double v19 = v7 - *(double *)&self->_numberOfInvalidPose;
          if (v19 > 10.0) {
            double v19 = 10.0;
          }
          self->_timeLocationFromGPSCoarse = self->_timeLocationFromGPSCoarse + v19;
          break;
        default:
          int v11 = qword_1008ABDE0;
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10040E8CC(v11);
          }
          break;
      }
    }
    self->_numberOfLostVerticalConvergence = var11;
    *((unsigned char *)&self->_numberOfLostVerticalConvergence + 4) = 1;
    *(double *)&self->_numberOfInvalidPose = sub_100006C38();
  }
  else if (lifecycleTimeoutType == 4 && self->_timeAtFirstFindeeData == -1.0)
  {
    self->_timeAtFirstFindeeData = sub_100006C38();
  }
}

- (void)updateWithAcquisitionReason:(int)a3
{
  if ((LODWORD(self->_lifecycleTimeoutType) - 3) <= 1)
  {
    LODWORD(self->_runningMeanSpeedFromVIO) = a3;
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    double v5 = +[NSNumber numberWithInt:LODWORD(self->_runningMeanSpeedFromVIO)];
    [v4 setObject:v5 forKey:@"AcquisitionReason"];

    id v6 = [v4 mutableCopy];
    double v7 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      bundleIdentifier = self->_bundleIdentifier;
      double v9 = [v6 description];
      *(_DWORD *)buf = 138412802;
      double v12 = bundleIdentifier;
      __int16 v13 = 2112;
      CFStringRef v14 = @"com.apple.nearbyinteraction.findingsession.begin";
      __int16 v15 = 2112;
      double v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);
    }
    id v10 = v6;
    AnalyticsSendEventLazy();
  }
}

- (void)updateWithPose:(const void *)a3
{
  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    double v5 = sub_100006C38();
    if (BYTE2(self->_numberOfSolutions)) {
      BOOL v6 = *((_DWORD *)a3 + 20) == 2;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      double v7 = v5;
      if (self->_timePeerLocationFromFindeeData == -1.0)
      {
        self->_timePeerLocationFromFindeeData = v5;
        self->_maxRawRangeValue = self->_firstNBRSSI;
      }
      long long v8 = *((_OWORD *)a3 + 5);
      v118[4] = *((_OWORD *)a3 + 4);
      long long v119 = v8;
      long long v9 = *((_OWORD *)a3 + 7);
      long long v120 = *((_OWORD *)a3 + 6);
      long long v121 = v9;
      long long v10 = *((_OWORD *)a3 + 1);
      v118[0] = *(_OWORD *)a3;
      v118[1] = v10;
      long long v11 = *((_OWORD *)a3 + 3);
      v118[2] = *((_OWORD *)a3 + 2);
      v118[3] = v11;
      if (BYTE1(self->_numberOfSolutions)) {
        LODWORD(v119) = 1;
      }
      sub_100388BF4((uint64_t)&self->_rangeAtFirstArrow, (uint64_t)v118, (uint64_t)&v117);
      if (*((_DWORD *)a3 + 20) == 2)
      {
        BYTE2(self->_numberOfSolutions) = 1;
        double minUWBRSSI = *((float *)a3 + 17);
        double minNBRSSI = self->_minNBRSSI;
        if (minNBRSSI <= minUWBRSSI) {
          double minNBRSSI = *((float *)a3 + 17);
        }
        self->_double minNBRSSI = minNBRSSI;
        if (self->_minUWBRSSI < minUWBRSSI) {
          double minUWBRSSI = self->_minUWBRSSI;
        }
        self->_double minUWBRSSI = minUWBRSSI;
        LOBYTE(self->_maxYCoordinateFindee) |= minNBRSSI - minUWBRSSI > 2.5;
        if (self->_timeAtLastLocationFromFindeeData == -1.0)
        {
          self->_timeAtLastLocationFromFindeeData = v7;
          p_numberOfVIOResets = &self->_numberOfVIOResets;
          long long v15 = *(_OWORD *)a3;
          long long v16 = *((_OWORD *)a3 + 1);
          long long v17 = *((_OWORD *)a3 + 3);
          if (self->_anon_318[56])
          {
            self->_firstPose.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstPose.var0.__val_.source.var0.__null_state_ = v17;
            *(_OWORD *)p_numberOfVIOResets = v15;
            *(_OWORD *)&self->_firstPose.var0.__null_state_ = v16;
            long long v18 = *((_OWORD *)a3 + 4);
            long long v19 = *((_OWORD *)a3 + 5);
            long long v20 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_318[40] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_318[8] = v19;
            *(_OWORD *)&self->_anon_318[24] = v20;
            *(_OWORD *)&self->_firstPose.__engaged_ = v18;
          }
          else
          {
            self->_firstPose.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstPose.var0.__val_.source.var0.__null_state_ = v17;
            *(_OWORD *)p_numberOfVIOResets = v15;
            *(_OWORD *)&self->_firstPose.var0.__null_state_ = v16;
            long long v24 = *((_OWORD *)a3 + 4);
            long long v25 = *((_OWORD *)a3 + 5);
            long long v26 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_318[24] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_318[40] = v26;
            *(_OWORD *)&self->_firstPose.__engaged_ = v24;
            *(_OWORD *)&self->_anon_318[8] = v25;
            self->_anon_318[56] = 1;
          }
          p_firstOutputRangeStraightLineDistance = &self->_firstOutputRangeStraightLineDistance;
          long long v28 = *(_OWORD *)a3;
          long long v29 = *((_OWORD *)a3 + 1);
          long long v30 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance))
          {
            self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v30;
            *(_OWORD *)p_firstOutputRangeStraightLineDistance = v28;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v29;
            long long v31 = *((_OWORD *)a3 + 4);
            long long v32 = *((_OWORD *)a3 + 5);
            long long v33 = *((_OWORD *)a3 + 6);
            self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((void *)a3 + 14);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v32;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v33;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.__engaged_ = v31;
          }
          else
          {
            self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v30;
            *(_OWORD *)p_firstOutputRangeStraightLineDistance = v28;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v29;
            long long v34 = *((_OWORD *)a3 + 4);
            long long v35 = *((_OWORD *)a3 + 5);
            long long v36 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v36;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.previousPoseOfUser.__engaged_ = v34;
            *(_OWORD *)&self->_firstArrowUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v35;
            LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 1;
          }
          double v37 = &self->_anon_648[168];
          long long v38 = *(_OWORD *)a3;
          long long v39 = *((_OWORD *)a3 + 1);
          long long v40 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance))
          {
            self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v40;
            *(_OWORD *)double v37 = v38;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v39;
            long long v41 = *((_OWORD *)a3 + 4);
            long long v42 = *((_OWORD *)a3 + 5);
            long long v43 = *((_OWORD *)a3 + 6);
            self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((void *)a3 + 14);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v42;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v43;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.__engaged_ = v41;
          }
          else
          {
            self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v40;
            *(_OWORD *)double v37 = v38;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v39;
            long long v44 = *((_OWORD *)a3 + 4);
            long long v45 = *((_OWORD *)a3 + 5);
            long long v46 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v46;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.previousPoseOfUser.__engaged_ = v44;
            *(_OWORD *)&self->_firstOutputRangeUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v45;
            LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 1;
          }
          unsigned int v47 = &self->_anon_778[168];
          long long v48 = *(_OWORD *)a3;
          long long v49 = *((_OWORD *)a3 + 1);
          long long v50 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_armsReachUserMovedDistance.traveledDistance))
          {
            self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v50;
            *(_OWORD *)unsigned int v47 = v48;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v49;
            long long v51 = *((_OWORD *)a3 + 4);
            long long v52 = *((_OWORD *)a3 + 5);
            long long v53 = *((_OWORD *)a3 + 6);
            self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((void *)a3 + 14);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v52;
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v53;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.__engaged_ = v51;
          }
          else
          {
            self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v50;
            *(_OWORD *)unsigned int v47 = v48;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v49;
            long long v54 = *((_OWORD *)a3 + 4);
            long long v55 = *((_OWORD *)a3 + 5);
            long long v56 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v56;
            *(_OWORD *)&self->_armsReachUserMovedDistance.previousPoseOfUser.__engaged_ = v54;
            *(_OWORD *)&self->_armsReachUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v55;
            LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 1;
          }
          int v57 = &self->_anon_8a8[168];
          long long v58 = *(_OWORD *)a3;
          long long v59 = *((_OWORD *)a3 + 1);
          long long v60 = *((_OWORD *)a3 + 3);
          if (LOBYTE(self->_totalUserMovedDistance.traveledDistance))
          {
            self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v60;
            *(_OWORD *)int v57 = v58;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v59;
            long long v61 = *((_OWORD *)a3 + 4);
            long long v62 = *((_OWORD *)a3 + 5);
            long long v63 = *((_OWORD *)a3 + 6);
            self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability = (optional<nearby::algorithms::common::OdometryAvailabilityState>)*((void *)a3 + 14);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v62;
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = v63;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.__engaged_ = v61;
          }
          else
          {
            self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__val_.source.var0.__null_state_ = v60;
            *(_OWORD *)int v57 = v58;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.var0.__null_state_ = v59;
            long long v64 = *((_OWORD *)a3 + 4);
            long long v65 = *((_OWORD *)a3 + 5);
            long long v66 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.lightEstimate.__engaged_ = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.odometryAvailability.var0.__null_state_ = v66;
            *(_OWORD *)&self->_totalUserMovedDistance.previousPoseOfUser.__engaged_ = v64;
            *(_OWORD *)&self->_totalUserMovedDistance.oldPreviousPoseOfUser.var0.__val_.trackingState = v65;
            LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 1;
          }
          double v67 = &self->_anon_648[8];
          long long v68 = *(_OWORD *)a3;
          long long v69 = *((_OWORD *)a3 + 1);
          long long v70 = *((_OWORD *)a3 + 3);
          if (self->_anon_648[136])
          {
            *(_OWORD *)&self->_anon_648[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_648[56] = v70;
            *(_OWORD *)double v67 = v68;
            *(_OWORD *)&self->_anon_648[24] = v69;
            long long v71 = *((_OWORD *)a3 + 4);
            long long v72 = *((_OWORD *)a3 + 5);
            long long v73 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_648[120] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_648[88] = v72;
            *(_OWORD *)&self->_anon_648[104] = v73;
            *(_OWORD *)&self->_anon_648[72] = v71;
          }
          else
          {
            *(_OWORD *)&self->_anon_648[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_648[56] = v70;
            *(_OWORD *)double v67 = v68;
            *(_OWORD *)&self->_anon_648[24] = v69;
            long long v74 = *((_OWORD *)a3 + 4);
            long long v75 = *((_OWORD *)a3 + 5);
            long long v76 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_648[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_648[120] = v76;
            *(_OWORD *)&self->_anon_648[72] = v74;
            *(_OWORD *)&self->_anon_648[88] = v75;
            self->_anon_648[136] = 1;
          }
          v77 = &self->_anon_778[8];
          long long v78 = *(_OWORD *)a3;
          long long v79 = *((_OWORD *)a3 + 1);
          long long v80 = *((_OWORD *)a3 + 3);
          if (self->_anon_778[136])
          {
            *(_OWORD *)&self->_anon_778[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_778[56] = v80;
            *(_OWORD *)v77 = v78;
            *(_OWORD *)&self->_anon_778[24] = v79;
            long long v81 = *((_OWORD *)a3 + 4);
            long long v82 = *((_OWORD *)a3 + 5);
            long long v83 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_778[120] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_778[88] = v82;
            *(_OWORD *)&self->_anon_778[104] = v83;
            *(_OWORD *)&self->_anon_778[72] = v81;
          }
          else
          {
            *(_OWORD *)&self->_anon_778[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_778[56] = v80;
            *(_OWORD *)v77 = v78;
            *(_OWORD *)&self->_anon_778[24] = v79;
            long long v84 = *((_OWORD *)a3 + 4);
            long long v85 = *((_OWORD *)a3 + 5);
            long long v86 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_778[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_778[120] = v86;
            *(_OWORD *)&self->_anon_778[72] = v84;
            *(_OWORD *)&self->_anon_778[88] = v85;
            self->_anon_778[136] = 1;
          }
          v87 = &self->_anon_8a8[8];
          long long v88 = *(_OWORD *)a3;
          long long v89 = *((_OWORD *)a3 + 1);
          long long v90 = *((_OWORD *)a3 + 3);
          if (self->_anon_8a8[136])
          {
            *(_OWORD *)&self->_anon_8a8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_8a8[56] = v90;
            *(_OWORD *)v87 = v88;
            *(_OWORD *)&self->_anon_8a8[24] = v89;
            long long v91 = *((_OWORD *)a3 + 4);
            long long v92 = *((_OWORD *)a3 + 5);
            long long v93 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_8a8[120] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_8a8[88] = v92;
            *(_OWORD *)&self->_anon_8a8[104] = v93;
            *(_OWORD *)&self->_anon_8a8[72] = v91;
          }
          else
          {
            *(_OWORD *)&self->_anon_8a8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_8a8[56] = v90;
            *(_OWORD *)v87 = v88;
            *(_OWORD *)&self->_anon_8a8[24] = v89;
            long long v94 = *((_OWORD *)a3 + 4);
            long long v95 = *((_OWORD *)a3 + 5);
            long long v96 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_8a8[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_8a8[120] = v96;
            *(_OWORD *)&self->_anon_8a8[72] = v94;
            *(_OWORD *)&self->_anon_8a8[88] = v95;
            self->_anon_8a8[136] = 1;
          }
          v97 = &self->_anon_9d8[8];
          long long v98 = *(_OWORD *)a3;
          long long v99 = *((_OWORD *)a3 + 1);
          long long v100 = *((_OWORD *)a3 + 3);
          if (self->_anon_9d8[136])
          {
            *(_OWORD *)&self->_anon_9d8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_9d8[56] = v100;
            *(_OWORD *)v97 = v98;
            *(_OWORD *)&self->_anon_9d8[24] = v99;
            long long v101 = *((_OWORD *)a3 + 4);
            long long v102 = *((_OWORD *)a3 + 5);
            long long v103 = *((_OWORD *)a3 + 6);
            *(void *)&self->_anon_9d8[120] = *((void *)a3 + 14);
            *(_OWORD *)&self->_anon_9d8[88] = v102;
            *(_OWORD *)&self->_anon_9d8[104] = v103;
            *(_OWORD *)&self->_anon_9d8[72] = v101;
          }
          else
          {
            *(_OWORD *)&self->_anon_9d8[40] = *((_OWORD *)a3 + 2);
            *(_OWORD *)&self->_anon_9d8[56] = v100;
            *(_OWORD *)v97 = v98;
            *(_OWORD *)&self->_anon_9d8[24] = v99;
            long long v104 = *((_OWORD *)a3 + 4);
            long long v105 = *((_OWORD *)a3 + 5);
            long long v106 = *((_OWORD *)a3 + 7);
            *(_OWORD *)&self->_anon_9d8[104] = *((_OWORD *)a3 + 6);
            *(_OWORD *)&self->_anon_9d8[120] = v106;
            *(_OWORD *)&self->_anon_9d8[72] = v104;
            *(_OWORD *)&self->_anon_9d8[88] = v105;
            self->_anon_9d8[136] = 1;
          }
          *(void *)&self->_anon_648[152] = 0;
          *(void *)&self->_anon_778[152] = 0;
          *(void *)&self->_anon_8a8[152] = 0;
          *(void *)&self->_anon_9d8[152] = 0;
        }
        if (self->_timeAtFirstPose == -1.0) {
          [(NIServerAnalyticsManager *)self _updateUserMovedDistanceWithPose:a3 lastPoseInfo:&self->_firstOutputRangeStraightLineDistance];
        }
        if (self->_timeAtFirstValidPose == -1.0) {
          [(NIServerAnalyticsManager *)self _updateUserMovedDistanceWithPose:a3 lastPoseInfo:&self->_anon_648[168]];
        }
        if (self->_timeAtFirstArrow == -1.0) {
          [(NIServerAnalyticsManager *)self _updateUserMovedDistanceWithPose:a3 lastPoseInfo:&self->_anon_778[168]];
        }
        [(NIServerAnalyticsManager *)self _updateUserMovedDistanceWithPose:a3 lastPoseInfo:&self->_anon_8a8[168]];
      }
      v107 = &self->_anon_318[72];
      long long v108 = *(_OWORD *)a3;
      long long v109 = *((_OWORD *)a3 + 1);
      long long v110 = *((_OWORD *)a3 + 3);
      if (self->_anon_3a8[56])
      {
        self->_lastPose.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
        *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_ = v110;
        *(_OWORD *)v107 = v108;
        *(_OWORD *)&self->_lastPose.var0.__null_state_ = v109;
        long long v111 = *((_OWORD *)a3 + 4);
        long long v112 = *((_OWORD *)a3 + 5);
        long long v113 = *((_OWORD *)a3 + 6);
        *(void *)&self->_anon_3a8[40] = *((void *)a3 + 14);
        *(_OWORD *)&self->_anon_3a8[8] = v112;
        *(_OWORD *)&self->_anon_3a8[24] = v113;
        *(_OWORD *)&self->_lastPose.__engaged_ = v111;
      }
      else
      {
        self->_lastPose.var0.__val_.optional<double> lightEstimate = (optional<double>)*((_OWORD *)a3 + 2);
        *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_ = v110;
        *(_OWORD *)v107 = v108;
        *(_OWORD *)&self->_lastPose.var0.__null_state_ = v109;
        long long v114 = *((_OWORD *)a3 + 4);
        long long v115 = *((_OWORD *)a3 + 5);
        long long v116 = *((_OWORD *)a3 + 7);
        *(_OWORD *)&self->_anon_3a8[24] = *((_OWORD *)a3 + 6);
        *(_OWORD *)&self->_anon_3a8[40] = v116;
        *(_OWORD *)&self->_lastPose.__engaged_ = v114;
        *(_OWORD *)&self->_anon_3a8[8] = v115;
        self->_anon_3a8[56] = 1;
      }
    }
    else
    {
      int armsReachAlgorithmSource = self->_armsReachAlgorithmSource;
      BOOL v22 = __CFADD__(armsReachAlgorithmSource, 1);
      int v23 = armsReachAlgorithmSource + 1;
      if (v22) {
        int v23 = 1;
      }
      self->_int armsReachAlgorithmSource = v23;
      [(NIServerAnalyticsManager *)self _onVIOReset];
      BYTE2(self->_numberOfSolutions) = 0;
      self->_maxYCoordinateFinder = -1.79769313e308;
      self->_minYCoordinateFinder = 1.79769313e308;
    }
  }
}

- (void)_updateUserMovedDistanceWithPose:(const void *)a3 lastPoseInfo:(void *)a4
{
  if (*((unsigned char *)a4 + 128) && *((unsigned char *)a4 + 272))
  {
    float32x4_t v4 = *((float32x4_t *)a3 + 4);
    float32x4_t v5 = vsubq_f32(*((float32x4_t *)a4 + 4), v4);
    float32x4_t v6 = vmulq_f32(v5, v5);
    float v7 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    float32x4_t v8 = vsubq_f32(*((float32x4_t *)a4 + 13), v4);
    float32x4_t v9 = vmulq_f32(v8, v8);
    float v10 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v9, 2), vaddq_f32(v9, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v9.f32, 1))).f32[0]);
    if (v7 > 0.5 && v10 > 0.5)
    {
      *((double *)a4 + 36) = *((double *)a4 + 36) + v7;
      long long v12 = *((_OWORD *)a4 + 3);
      *((_OWORD *)a4 + 11) = *((_OWORD *)a4 + 2);
      *((_OWORD *)a4 + 12) = v12;
      *((unsigned char *)a4 + 272) = *((unsigned char *)a4 + 128);
      long long v13 = *((_OWORD *)a4 + 7);
      *((_OWORD *)a4 + 15) = *((_OWORD *)a4 + 6);
      *((_OWORD *)a4 + 16) = v13;
      long long v14 = *((_OWORD *)a4 + 5);
      *((_OWORD *)a4 + 13) = *((_OWORD *)a4 + 4);
      *((_OWORD *)a4 + 14) = v14;
      long long v15 = *((_OWORD *)a4 + 1);
      *((_OWORD *)a4 + 9) = *(_OWORD *)a4;
      *((_OWORD *)a4 + 10) = v15;
      long long v16 = *(_OWORD *)a3;
      long long v17 = *((_OWORD *)a3 + 1);
      long long v18 = *((_OWORD *)a3 + 3);
      *((_OWORD *)a4 + 2) = *((_OWORD *)a3 + 2);
      *((_OWORD *)a4 + 3) = v18;
      *(_OWORD *)a4 = v16;
      *((_OWORD *)a4 + 1) = v17;
      long long v19 = *((_OWORD *)a3 + 4);
      long long v20 = *((_OWORD *)a3 + 5);
      long long v21 = *((_OWORD *)a3 + 6);
      *((void *)a4 + 14) = *((void *)a3 + 14);
      *((_OWORD *)a4 + 5) = v20;
      *((_OWORD *)a4 + 6) = v21;
      *((_OWORD *)a4 + 4) = v19;
    }
  }
}

- (void)updateWithFinderPeerData:(const void *)a3
{
  if (LODWORD(self->_lifecycleTimeoutType) != 4) {
    return;
  }
  double v5 = sub_100006C38();
  if (*(double *)&self->_numberOfWalkingOrkUnknown == -1.0)
  {
    *(double *)&self->_numberOfWalkingOrkUnknown = v5;
    if (*((unsigned char *)a3 + 72))
    {
      HIDWORD(self->_maxYCoordinateFindee) = *((_DWORD *)a3 + 10);
      LOBYTE(self->_minYCoordinateFindee) = 1;
    }
  }
  if (*((unsigned char *)a3 + 72))
  {
    int v6 = *((_DWORD *)a3 + 10);
    if (self->_timeAtFirstPeerLocationFromFindeeData == -1.0 && v6 == 1)
    {
      p_timeAtFirstPeerLocationFromFindeeData = &self->_timeAtFirstPeerLocationFromFindeeData;
    }
    else
    {
      if (self->_timeAtFirstPeerLocationFromFMF != -1.0 || v6 != 0) {
        goto LABEL_19;
      }
      p_timeAtFirstPeerLocationFromFindeeData = &self->_timeAtFirstPeerLocationFromFMF;
    }
    double *p_timeAtFirstPeerLocationFromFindeeData = v5;
LABEL_19:
    if (LOBYTE(self->_minYCoordinateFindee) && HIDWORD(self->_maxYCoordinateFindee) == v6)
    {
      double minYCoordinateFinder = *((double *)a3 + 8);
      double maxYCoordinateFinder = self->_maxYCoordinateFinder;
      if (minYCoordinateFinder >= maxYCoordinateFinder) {
        double maxYCoordinateFinder = *((double *)a3 + 8);
      }
      self->_double maxYCoordinateFinder = maxYCoordinateFinder;
      if (self->_minYCoordinateFinder < minYCoordinateFinder) {
        double minYCoordinateFinder = self->_minYCoordinateFinder;
      }
      self->_double minYCoordinateFinder = minYCoordinateFinder;
      BYTE1(self->_maxYCoordinateFindee) |= vabdd_f64(maxYCoordinateFinder, minYCoordinateFinder) > 2.5;
      if (!*((unsigned char *)a3 + 72)) {
        sub_10000AE44();
      }
    }
    else
    {
      self->_double maxYCoordinateFinder = -1.79769313e308;
      self->_double minYCoordinateFinder = 1.79769313e308;
    }
    HIDWORD(self->_maxYCoordinateFindee) = v6;
    LOBYTE(self->_minYCoordinateFindee) = 1;
    goto LABEL_29;
  }
  self->_double maxYCoordinateFinder = -1.79769313e308;
  self->_double minYCoordinateFinder = 1.79769313e308;
LABEL_29:
  if (*((unsigned char *)a3 + 112) && self->_timeAtFirstPDRFromFindeeData == -1.0) {
    self->_timeAtFirstPDRFromFindeeData = v5;
  }
  if (*((unsigned char *)a3 + 16) && !*((_DWORD *)a3 + 2) && self->_timeAtFirstVIOFromFindeeData == -1.0) {
    self->_timeAtFirstVIOFromFindeeData = v5;
  }
  if (*((unsigned char *)a3 + 160))
  {
    if (self->_timeAtFirstSelfLocation == -1.0) {
      self->_timeAtFirstSelfLocation = v5;
    }
    if (self->_timeAtFirstRawUWBRange == -1.0) {
      self->_timeAtFirstRawUWBRange = v5;
    }
  }
  int numberOfArrowRevokes = self->_numberOfArrowRevokes;
  BOOL v13 = __CFADD__(numberOfArrowRevokes, 1);
  int v14 = numberOfArrowRevokes + 1;
  if (v13) {
    int v14 = 1;
  }
  self->_int numberOfArrowRevokes = v14;
}

- (void)updateWithSolution:(const void *)a3
{
  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    double v5 = sub_100006C38();
    if (*((unsigned char *)a3 + 360))
    {
      if (LOBYTE(self->_timeOfLastSplicedPoseErrorLogging))
      {
        uint64_t v6 = *((int *)a3 + 89);
        if (v6 <= 5) {
          *(double *)((char *)&self->super.isa + qword_1004A0280[v6]) = v5
        }
                                                                      - *(double *)&self->_lastAngleError
                                                                      + *(double *)((char *)&self->super.isa
                                                                                  + qword_1004A0280[v6]);
      }
    }
    if (self->_timePeerLocationFromFindeeData != -1.0)
    {
      if (LOBYTE(self->_numberOfSolutions) && !*((unsigned char *)a3 + 208) && self->_timeAtFirstArrow == -1.0)
      {
        int timeAtEndOfSession_high = HIDWORD(self->_timeAtEndOfSession);
        BOOL v8 = __CFADD__(timeAtEndOfSession_high, 1);
        int v9 = timeAtEndOfSession_high + 1;
        if (v8) {
          int v9 = 1;
        }
        HIDWORD(self->_timeAtEndOfSession) = v9;
      }
      BYTE1(self->_numberOfSolutions) = *((unsigned char *)a3 + 380);
      if (*((unsigned char *)a3 + 208))
      {
        LOBYTE(self->_numberOfSolutions) = 1;
        double timeAtFirstPose = self->_timeAtFirstPose;
        if (timeAtFirstPose == -1.0)
        {
          self->_double timeAtFirstPose = v5;
          if (*((unsigned char *)a3 + 368)) {
            int v11 = *((_DWORD *)a3 + 91);
          }
          else {
            int v11 = 0;
          }
          LODWORD(self->_timeAtFirstStaticFromFindeeData) = v11;
          if (*((unsigned char *)a3 + 192))
          {
            float v12 = *((float *)a3 + 6);
            if (v12 != 1.1755e-38) {
              self->_minRawRangeValue = v12;
            }
          }
          double timeAtFirstPose = v5;
          if (self->_timeAtLastLocationFromFindeeData != -1.0)
          {
            long long v13 = *(_OWORD *)&self->_lastPose.__engaged_;
            *(_OWORD *)&self->_anon_438[8] = *(_OWORD *)&self->_anon_3a8[8];
            long long v14 = *(_OWORD *)&self->_anon_3a8[40];
            *(_OWORD *)&self->_anon_438[24] = *(_OWORD *)&self->_anon_3a8[24];
            *(_OWORD *)&self->_anon_438[40] = v14;
            long long v15 = *(_OWORD *)&self->_anon_318[72];
            *(_OWORD *)&self->_firstArrowPose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
            long long v16 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
            self->_firstArrowPose.var0.__val_.optional<double> lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
            *(_OWORD *)&self->_firstArrowPose.var0.__val_.source.var0.__null_state_ = v16;
            *(_OWORD *)&self->_firstArrowPose.__engaged_ = v13;
            unsigned __int8 v17 = self->_anon_3a8[56];
            *(_OWORD *)&self->_anon_3a8[72] = v15;
            double timeAtFirstPose = v5;
            self->_anon_438[56] = v17;
          }
        }
        if (timeAtFirstPose != -1.0 && self->_timeAtFirstArrow == -1.0)
        {
          int firstArrowAlgorithmSource = self->_firstArrowAlgorithmSource;
          BOOL v8 = __CFADD__(firstArrowAlgorithmSource, 1);
          int v19 = firstArrowAlgorithmSource + 1;
          if (v8) {
            int v19 = 1;
          }
          self->_int firstArrowAlgorithmSource = v19;
        }
      }
      else
      {
        LOBYTE(self->_numberOfSolutions) = 0;
      }
      if (*((unsigned char *)a3 + 192) && *((float *)a3 + 6) != 1.1755e-38)
      {
        if (self->_timeAtFirstValidPose == -1.0)
        {
          self->_timeAtFirstValidPose = v5;
          int v20 = *((unsigned char *)a3 + 368) ? *((_DWORD *)a3 + 91) : 0;
          HIDWORD(self->_timeAtFirstStaticFromFindeeData) = v20;
          if (self->_timeAtLastLocationFromFindeeData != -1.0)
          {
            long long v21 = *(_OWORD *)&self->_lastPose.__engaged_;
            *(_OWORD *)&self->_anon_558[8] = *(_OWORD *)&self->_anon_3a8[8];
            long long v22 = *(_OWORD *)&self->_anon_3a8[40];
            *(_OWORD *)&self->_anon_558[24] = *(_OWORD *)&self->_anon_3a8[24];
            *(_OWORD *)&self->_anon_558[40] = v22;
            long long v23 = *(_OWORD *)&self->_anon_318[72];
            *(_OWORD *)&self->_firstOutputRangePose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
            long long v24 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
            self->_firstOutputRangePose.var0.__val_.optional<double> lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
            *(_OWORD *)&self->_firstOutputRangePose.var0.__val_.source.var0.__null_state_ = v24;
            *(_OWORD *)&self->_firstOutputRangePose.__engaged_ = v21;
            self->_anon_558[56] = self->_anon_3a8[56];
            *(_OWORD *)&self->_anon_4c8[72] = v23;
          }
        }
        if (self->_timeAtFirstArrow == -1.0)
        {
          if (!*((unsigned char *)a3 + 192)) {
            sub_10000AE44();
          }
          if (*((float *)a3 + 6) <= 2.0)
          {
            self->_timeAtFirstArrow = v5;
            int v25 = *((unsigned char *)a3 + 368) ? *((_DWORD *)a3 + 91) : 0;
            LODWORD(self->_timeAtEndOfSession) = v25;
            if (self->_timeAtLastLocationFromFindeeData != -1.0)
            {
              long long v26 = *(_OWORD *)&self->_lastPose.__engaged_;
              *(_OWORD *)&self->_anon_4c8[8] = *(_OWORD *)&self->_anon_3a8[8];
              long long v27 = *(_OWORD *)&self->_anon_3a8[40];
              *(_OWORD *)&self->_anon_4c8[24] = *(_OWORD *)&self->_anon_3a8[24];
              *(_OWORD *)&self->_anon_4c8[40] = v27;
              long long v28 = *(_OWORD *)&self->_anon_318[72];
              *(_OWORD *)&self->_armsReachPose.var0.__null_state_ = *(_OWORD *)&self->_lastPose.var0.__null_state_;
              long long v29 = *(_OWORD *)&self->_lastPose.var0.__val_.source.var0.__null_state_;
              self->_armsReachPose.var0.__val_.optional<double> lightEstimate = self->_lastPose.var0.__val_.lightEstimate;
              *(_OWORD *)&self->_armsReachPose.var0.__val_.source.var0.__null_state_ = v29;
              *(_OWORD *)&self->_armsReachPose.__engaged_ = v26;
              self->_anon_4c8[56] = self->_anon_3a8[56];
              *(_OWORD *)&self->_anon_438[72] = v28;
            }
          }
        }
      }
      if (self->_timeAtFirstPose != -1.0 && self->_timeAtFirstArrow == -1.0)
      {
        int firstOutputRangeAlgorithmSource = self->_firstOutputRangeAlgorithmSource;
        BOOL v8 = __CFADD__(firstOutputRangeAlgorithmSource, 1);
        int v31 = firstOutputRangeAlgorithmSource + 1;
        if (v8) {
          int v31 = 1;
        }
        self->_int firstOutputRangeAlgorithmSource = v31;
      }
    }
    *(double *)&self->_lastAngleError = v5;
    LOBYTE(self->_timeOfLastSplicedPoseErrorLogging) = 1;
  }
}

- (void)updateWithPeerLocationFromFMF
{
  if (LODWORD(self->_lifecycleTimeoutType) == 4)
  {
    double v3 = sub_100006C38();
    if (self->_timeAtFirstRawUWBRange == -1.0) {
      self->_timeAtFirstRawUWBRange = v3;
    }
    if (self->_timeAtFirstPeerLocation == -1.0) {
      self->_timeAtFirstPeerLocation = v3;
    }
  }
}

- (void)nearbyObjectUpdated:(id)a3
{
  id v4 = a3;
  double v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v14 = 138412546;
    long long v15 = bundleIdentifier;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] nearbyObjectUpdated: %@", (uint8_t *)&v14, 0x16u);
  }
  [v4 distance];
  if (v7 == NINearbyObjectDistanceNotAvailable)
  {
    BOOL v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      int v9 = self->_bundleIdentifier;
      int v14 = 138412290;
      long long v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#ni-ca,[%@] nearby object does not contain distance", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    [v4 distance];
    double v11 = v10;
    if (LOBYTE(self->_timeSpentVisible))
    {
      double firstDistance = self->_firstDistance;
      double lastDistance = self->_lastDistance;
      if (firstDistance <= v11) {
        double firstDistance = v11;
      }
      *(double *)&self->_receivedDistance = v11;
      self->_double firstDistance = firstDistance;
      if (lastDistance < v11) {
        double v11 = lastDistance;
      }
      self->_double lastDistance = v11;
    }
    else
    {
      self->_timeSpentNotVisible = v11;
      *(double *)&self->_receivedDistance = v11;
      self->_double firstDistance = v11;
      self->_double lastDistance = v11;
      LOBYTE(self->_timeSpentVisible) = 1;
    }
  }
}

- (void)lifecycleTimeoutBeforeTrackingForDiscoveryToken:(id)a3
{
  id v4 = a3;
  double v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v8 = 138412546;
    int v9 = bundleIdentifier;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] lifecycleTimeoutBeforeTrackingForDiscoveryToken: %@", (uint8_t *)&v8, 0x16u);
  }
  double maxDistance = self->_maxDistance;
  *(void *)&self->_double maxDistance = @"Before Tracking";
}

- (void)lifecycleTimeoutAfterTrackingForDiscoveryToken:(id)a3
{
  id v4 = a3;
  double v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v8 = 138412546;
    int v9 = bundleIdentifier;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "#ni-ca,[%@] lifecycleTimeoutAfterTrackingForDiscoveryToken: %@", (uint8_t *)&v8, 0x16u);
  }
  double maxDistance = self->_maxDistance;
  *(void *)&self->_double maxDistance = @"After Tracking";
}

- (void)backgroundContinuationDiscoveryTimeout
{
  double v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v6 = 138412290;
    float v7 = bundleIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ni-ca,[%@] backgroundContinuationDiscoveryTimeout", (uint8_t *)&v6, 0xCu);
  }
  double minDistance = self->_minDistance;
  *(void *)&self->_double minDistance = @"Discovery";
}

- (void)backgroundContinuationInteractionTimeout
{
  double v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    int v6 = 138412290;
    float v7 = bundleIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "#ni-ca,[%@] backgroundContinuationInteractionTimeout", (uint8_t *)&v6, 0xCu);
  }
  double minDistance = self->_minDistance;
  *(void *)&self->_double minDistance = @"Interaction";
}

- (void)_updateMinMaxRangeAndRSSI:(double)a3 uwbRSSI:(double)a4 nbRSSI:(optional<double>)a5
{
  if (self->_m2 == -1.0)
  {
    self->_m2 = a3;
    self->_firstDistance_finding = a4;
  }
  if (self->_firstUWBRSSI == 0.0 && a5.__engaged_)
  {
    *(double *)&self->_acquisitionReason = a5.var0.__val_;
    self->_firstUWBRSSI = a5.var0.__val_;
  }
  self->_firstNBRSSI = a3;
  double lastNBRSSI = self->_lastNBRSSI;
  if (lastNBRSSI <= a3) {
    double lastNBRSSI = a3;
  }
  self->_double lastNBRSSI = lastNBRSSI;
  double minDistance_finding = self->_minDistance_finding;
  if (minDistance_finding >= a4) {
    double minDistance_finding = a4;
  }
  self->_double minDistance_finding = minDistance_finding;
  int8x16_t v8 = *(int8x16_t *)&self->_maxDistance_finding;
  v9.f64[0] = self->_maxDistance_finding;
  v9.f64[1] = a3;
  v10.f64[1] = self->_maxNBRSSI;
  v10.f64[0] = a4;
  self->_lastDistance_finding = a4;
  int8x16_t v11 = (int8x16_t)vcgtq_f64(v9, v10);
  v9.f64[0] = a4;
  *(int8x16_t *)&self->_maxDistance_finding = vbslq_s8(v11, v8, (int8x16_t)v9);
  if (a5.__engaged_)
  {
    double val = a5.var0.__val_;
    self->_firstUWBRSSI = a5.var0.__val_;
    double maxUWBRSSI = self->_maxUWBRSSI;
    if (maxUWBRSSI >= a5.var0.__val_) {
      double maxUWBRSSI = a5.var0.__val_;
    }
    self->_double maxUWBRSSI = maxUWBRSSI;
    if (self->_lastUWBRSSI > a5.var0.__val_) {
      double val = self->_lastUWBRSSI;
    }
    self->_lastUWBRSSI = val;
  }
}

- (double)_finderTimeFromFirstPoseTo:(double)a3
{
  double v3 = -1.0;
  if (a3 != -1.0)
  {
    double timePeerLocationFromFindeeData = self->_timePeerLocationFromFindeeData;
    if (timePeerLocationFromFindeeData != -1.0) {
      return a3 - timePeerLocationFromFindeeData;
    }
  }
  return v3;
}

- (id)_algorithmSourceToString:(int)a3
{
  if (a3 > 7) {
    return @"None";
  }
  else {
    return off_100846DC8[a3];
  }
}

- (void)_calculateStraightLineDistance
{
  if (self->_anon_318[56])
  {
    float32x4_t v2 = *(float32x4_t *)&self->_firstPose.__engaged_;
    if (self->_anon_438[56])
    {
      float32x4_t v3 = vsubq_f32(v2, *(float32x4_t *)&self->_firstArrowPose.__engaged_);
      float32x4_t v4 = vmulq_f32(v3, v3);
      *(double *)&self->_anon_558[72] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).f32[0]);
    }
    if (self->_anon_558[56])
    {
      float32x4_t v5 = vsubq_f32(v2, *(float32x4_t *)&self->_firstOutputRangePose.__engaged_);
      float32x4_t v6 = vmulq_f32(v5, v5);
      self->_firstArrowStraightLineDistance = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    }
    if (self->_anon_4c8[56])
    {
      float32x4_t v7 = vsubq_f32(v2, *(float32x4_t *)&self->_armsReachPose.__engaged_);
      float32x4_t v8 = vmulq_f32(v7, v7);
      *(double *)&self->_anon_558[80] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).f32[0]);
    }
    if (self->_anon_3a8[56])
    {
      float32x4_t v9 = vsubq_f32(*(float32x4_t *)&self->_firstPose.var0.__val_.source.var0.__null_state_, *(float32x4_t *)&self->_lastPose.var0.__val_.source.var0.__null_state_);
      *(double *)&self->_anon_af8[80] = sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v9, v9)));
    }
  }
  else
  {
    float64x2_t v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int8x16_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#ni-ca,Unable to calculate straight line distance between finder and findee (first pose doesn't have value)", v11, 2u);
    }
  }
}

- (void)_onVIOReset
{
  if (self->_anon_648[136]) {
    self->_anon_648[136] = 0;
  }
  if (LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance)) {
    LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 0;
  }
  if (self->_anon_778[136]) {
    self->_anon_778[136] = 0;
  }
  if (LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance)) {
    LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 0;
  }
  *(void *)&self->_anon_648[152] = 0xBFF0000000000000;
  if (self->_anon_8a8[136]) {
    self->_anon_8a8[136] = 0;
  }
  if (LOBYTE(self->_armsReachUserMovedDistance.traveledDistance)) {
    LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 0;
  }
  *(void *)&self->_anon_8a8[152] = 0xBFF0000000000000;
  if (self->_anon_9d8[136]) {
    self->_anon_9d8[136] = 0;
  }
  if (LOBYTE(self->_totalUserMovedDistance.traveledDistance)) {
    LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 0;
  }
  *(void *)&self->_anon_9d8[152] = 0xBFF0000000000000;
  if (self->_anon_438[56]) {
    self->_anon_438[56] = 0;
  }
  if (self->_anon_558[56]) {
    self->_anon_558[56] = 0;
  }
  if (self->_anon_4c8[56]) {
    self->_anon_4c8[56] = 0;
  }
  if (self->_anon_318[56]) {
    self->_anon_318[56] = 0;
  }
  self->_firstArrowStraightLineDistance = -1.0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_anon_558[72] = _Q0;
  *(void *)&self->_anon_af8[80] = 0xBFF0000000000000;
  *(_OWORD *)&self->_anon_dc8[56] = 0u;
  self->_double deltaVSourceTime = 0.0;
}

- (double)_deltaDistanceFromVIOPoses:(optional<nearby:(optional<nearby::algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 :
{
  double result = 0.0;
  if (a3[2].var0.__val_.lightEstimate.var0.__null_state_)
  {
    if (a4[2].var0.__val_.lightEstimate.var0.__null_state_)
    {
      float32x4_t v5 = vsubq_f32(*(float32x4_t *)&a4[1].var0.__val_.trackingState, *(float32x4_t *)&a3[1].var0.__val_.trackingState);
      float32x4_t v6 = vmulq_f32(v5, v5);
      return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v6, 2), vaddq_f32(v6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v6.f32, 1))).f32[0]);
    }
  }
  return result;
}

- (BOOL)_isSemiStaticFromVIO:(optional<nearby:(optional<nearby:(double)a5 :algorithms::common::Pose> *)a4 :algorithms::common::Pose> *)a3 ::
{
  if (!a3[2].var0.__val_.lightEstimate.var0.__null_state_) {
    return 0;
  }
  if (!a4[2].var0.__val_.lightEstimate.var0.__null_state_) {
    return 0;
  }
  long long v6 = *(_OWORD *)&a3[2].var0.__null_state_;
  v17[6] = *(_OWORD *)&a3[1].var0.__val_.odometryAvailability.var0.__null_state_;
  v17[7] = v6;
  v17[8] = a3[2].var0.__val_.lightEstimate;
  long long v7 = *(_OWORD *)&a3->__engaged_;
  v17[2] = *(_OWORD *)&a3->var0.__val_.source.var0.__null_state_;
  v17[3] = v7;
  long long v8 = *(_OWORD *)&a3[1].var0.__val_.lightEstimate.__engaged_;
  v17[4] = *(_OWORD *)&a3[1].var0.__val_.trackingState;
  v17[5] = v8;
  optional<double> lightEstimate = a3->var0.__val_.lightEstimate;
  v17[0] = *(_OWORD *)&a3->var0.__null_state_;
  v17[1] = lightEstimate;
  long long v10 = *(_OWORD *)&a4[2].var0.__null_state_;
  v16[6] = *(_OWORD *)&a4[1].var0.__val_.odometryAvailability.var0.__null_state_;
  v16[7] = v10;
  v16[8] = a4[2].var0.__val_.lightEstimate;
  long long v11 = *(_OWORD *)&a4->__engaged_;
  v16[2] = *(_OWORD *)&a4->var0.__val_.source.var0.__null_state_;
  v16[3] = v11;
  long long v12 = *(_OWORD *)&a4[1].var0.__val_.lightEstimate.__engaged_;
  v16[4] = *(_OWORD *)&a4[1].var0.__val_.trackingState;
  v16[5] = v12;
  optional<double> v13 = a4->var0.__val_.lightEstimate;
  v16[0] = *(_OWORD *)&a4->var0.__null_state_;
  v16[1] = v13;
  [(NIServerAnalyticsManager *)self _deltaDistanceFromVIOPoses:v17 :v16];
  return v14 / a5 < 0.15;
}

- (BOOL)_isPDRAvailable:(PDRInput *)a3
{
  return a3->deltaPosX.__engaged_ && a3->deltaPosY.__engaged_;
}

- (void)_calculateIOMetrics:(double)a3
{
  double timeAtLastIOUpdate = self->_timeAtLastIOUpdate;
  if (timeAtLastIOUpdate > 0.0) {
    *(double *)&self->_anon_af8[72] = (self->_timePDRAndVIOWasAvailable - timeAtLastIOUpdate) / timeAtLastIOUpdate;
  }
  double v4 = *(double *)&self->_anon_9d8[176];
  if (v4 <= 0.0)
  {
    double stdSpeedFromVIO = self->_stdSpeedFromVIO;
  }
  else
  {
    self->_radialDisplacementFromVIO = timeAtLastIOUpdate / v4;
    self->_meanSpeedFromVIO = (self->_timePDRAndVIOWasAvailable - timeAtLastIOUpdate) / v4;
    double stdSpeedFromVIO = self->_stdSpeedFromVIO;
    self->_pdrSSDetectionTruePositiveRate = stdSpeedFromVIO / v4;
  }
  if (stdSpeedFromVIO > 0.0) {
    self->_timeSSFromIOAndSSFromVIO = self->_timeSSFromVIO / stdSpeedFromVIO;
  }
  double meanSpeedFromVIOError = self->_meanSpeedFromVIOError;
  if (meanSpeedFromVIOError > 0.0) {
    self->_timeSSFromIOAndNotSSFromVIO = self->_timeNotSSFromVIO / meanSpeedFromVIOError;
  }
  double pdrSSDetectionFalsePositiveRate = self->_pdrSSDetectionFalsePositiveRate;
  if (pdrSSDetectionFalsePositiveRate > 2.0) {
    self->_radialDisplacementError = self->_numberOfPDRUpdates / pdrSSDetectionFalsePositiveRate;
  }
}

- (VectorAggregateErrors)_calculateErrorStatsFromVector:(SEL)a3
{
  if (a4->__end_ == a4->__begin_) {
    sub_10040E910();
  }
  double result = (VectorAggregateErrors *)std::__sort<std::__less<float,float> &,float *>();
  begin = a4->__begin_;
  end = a4->__end_;
  uint64_t v9 = (char *)end - (char *)a4->__begin_;
  unint64_t v10 = v9 >> 2;
  unint64_t v11 = (unint64_t)(v9 >> 2) >> 1;
  if ((v9 & 4) != 0) {
    float v12 = begin[v11];
  }
  else {
    float v12 = (float)(begin[v11 - 1] + begin[v11]) * 0.5;
  }
  float v13 = begin[(int)((double)v10 * 0.95)];
  if (begin == end)
  {
    float v17 = 0.0 / (float)v10;
    double v18 = 0.0;
  }
  else
  {
    float v14 = 0.0;
    long long v15 = a4->__begin_;
    do
    {
      float v16 = *v15++;
      float v14 = v14 + v16;
    }
    while (v15 != end);
    float v17 = v14 / (float)v10;
    double v18 = 0.0;
    do
    {
      float v19 = *begin++;
      double v18 = v18 + (float)(v19 * v19);
    }
    while (begin != end);
  }
  retstr->var0 = v17;
  retstr->var1 = sqrt(v18 / (double)v10 - (float)(v17 * v17));
  retstr->var2 = v12;
  retstr->var3 = v13;
  retstr->var4 = v10;
  return result;
}

- (void)_calculatePoseSplicingMetrics
{
  std::__sort<std::__less<float,float> &,float *>();
  uint64_t v3 = *(void *)&self->_timeOfLastPDRUpdate.__engaged_;
  double val = self->_timeOfLastPDRUpdate.var0.__val_;
  unint64_t v5 = (v3 - *(void *)&val) >> 2;
  unint64_t v6 = v5 >> 1;
  if (((v3 - LODWORD(val)) & 4) != 0) {
    float v7 = *(float *)(*(void *)&val + 4 * v6);
  }
  else {
    float v7 = (float)(*(float *)(*(void *)&val + 4 * v6 - 4) + *(float *)(*(void *)&val + 4 * v6)) * 0.5;
  }
  if (*(void *)&val == v3)
  {
    double v11 = 0.0;
    float v8 = 0.0;
  }
  else
  {
    float v8 = 0.0;
    double v9 = self->_timeOfLastPDRUpdate.var0.__val_;
    do
    {
      float v10 = **(float **)&v9;
      *(void *)&v9 += 4;
      float v8 = v8 + v10;
    }
    while (*(void *)&v9 != v3);
    double v11 = 0.0;
    double v12 = self->_timeOfLastPDRUpdate.var0.__val_;
    do
    {
      float v13 = **(float **)&v12;
      *(void *)&v12 += 4;
      double v11 = v11 + (float)(v13 * v13);
    }
    while (*(void *)&v12 != v3);
  }
  float v14 = *(float *)(*(void *)&val + 4 * (int)((double)v5 * 0.95));
  long long v15 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    float v16 = v8 / (float)v5;
    int v17 = 134218752;
    double v18 = v16;
    __int16 v19 = 2048;
    double v20 = sqrt(v11 / (double)v5 - (float)(v16 * v16));
    __int16 v21 = 2048;
    double v22 = v7;
    __int16 v23 = 2048;
    double v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#ni-ca,DoT error, mean: %f, std: %f, median: %f, 95th: %f", (uint8_t *)&v17, 0x2Au);
  }
}

- (void)_submitFindingSessionEndStats
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  double v4 = +[NSNumber numberWithDouble:self->_m2];
  [v3 setObject:v4 forKey:@"FirstDistance"];

  unint64_t v5 = +[NSNumber numberWithDouble:self->_firstNBRSSI];
  [v3 setObject:v5 forKey:@"LastDistance"];

  unint64_t v6 = +[NSNumber numberWithDouble:*(double *)&self->_acquisitionReason];
  [v3 setObject:v6 forKey:@"FirstNBRSSI"];

  float v7 = +[NSNumber numberWithDouble:self->_firstUWBRSSI];
  [v3 setObject:v7 forKey:@"LastNBRSSI"];

  float v8 = +[NSNumber numberWithDouble:self->_maxUWBRSSI];
  [v3 setObject:v8 forKey:@"MinNBRSSI"];

  double v9 = +[NSNumber numberWithDouble:self->_lastUWBRSSI];
  [v3 setObject:v9 forKey:@"MaxNBRSSI"];

  float v10 = +[NSNumber numberWithDouble:self->_firstDistance_finding];
  [v3 setObject:v10 forKey:@"FirstUWBRSSI"];

  double v11 = +[NSNumber numberWithDouble:self->_lastDistance_finding];
  [v3 setObject:v11 forKey:@"LastUWBRSSI"];

  double v12 = +[NSNumber numberWithDouble:self->_minDistance_finding];
  [v3 setObject:v12 forKey:@"MinUWBRSSI"];

  float v13 = +[NSNumber numberWithDouble:self->_maxDistance_finding];
  [v3 setObject:v13 forKey:@"MaxUWBRSSI"];

  if (LODWORD(self->_lifecycleTimeoutType) == 4) {
    +[NSNumber numberWithInt:1];
  }
  else {
  float v14 = +[NSNumber numberWithInt:2];
  }
  [v3 setObject:v14 forKey:@"RangingRole"];

  id v15 = [v3 mutableCopy];
  float v16 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    bundleIdentifier = self->_bundleIdentifier;
    double v18 = [v15 description];
    *(_DWORD *)buf = 138412802;
    __int16 v21 = bundleIdentifier;
    __int16 v22 = 2112;
    CFStringRef v23 = @"com.apple.nearbyinteraction.findingsession.end";
    __int16 v24 = 2112;
    int v25 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);
  }
  id v19 = v15;
  AnalyticsSendEventLazy();
}

- (void)_sessionStoppedWithTimestamp:(double)a3
{
  if (!LOBYTE(self->_bundleIdAsStdString.__r_.var0))
  {
    __int16 v21 = qword_1008ABDE0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO)) {
      return;
    }
    bundleIdentifier = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = bundleIdentifier;
    CFStringRef v23 = "#ni-ca,[%@] Session already stopped. Ignore duplicate call.";
    goto LABEL_20;
  }
  LOBYTE(self->_bundleIdAsStdString.__r_.var0) = 0;
  int64_t var0 = self->_bundleIdAsStdString.var0;
  double v6 = a3 - self->_runTimestamp;
  uint64_t v7 = 72;
  if (!self->_isRunning) {
    uint64_t v7 = 80;
  }
  *(double *)((char *)&self->super.isa + v7) = *(double *)((char *)&self->super.isa + v7) + v6;
  double timeAtLastLocationUpdate = self->_timeAtLastLocationUpdate;
  double pdrTimeAtFirstPDRUpdate = self->_pdrTimeAtFirstPDRUpdate;
  double timeFindeeWasWalkingOrUnknown = self->_timeFindeeWasWalkingOrUnknown;
  self->_timeFindeeWasStatic = a3 - *(double *)&self->_numberOfWalkingOrkUnknown;
  std::mutex::lock(&stru_10089D170);
  --byte_1008A00B8;
  p_int lifecycleTimeoutType = &self->_lifecycleTimeoutType;
  *(void *)buf = &self->_lifecycleTimeoutType;
  double v12 = sub_10003AE18((uint64_t)&xmmword_1008A0068, (int *)&self->_lifecycleTimeoutType, (uint64_t)&unk_1004BC2F8, (_DWORD **)buf);
  --*((unsigned char *)v12 + 20);
  if (self->_bundleIdentifier)
  {
    if (*((char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0)
    {
      if (self->_bundleIdAsStdString.__r_.__value_.var0.var1.__size_) {
        goto LABEL_7;
      }
    }
    else if (*((unsigned char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23))
    {
LABEL_7:
      *(void *)buf = &self->_bundleIdAsStdString;
      float v13 = sub_10003B03C((uint64_t)&xmmword_1008A0090, (unsigned __int8 *)&self->_bundleIdAsStdString, (uint64_t)&unk_1004BC2F8, (long long **)buf);
      --v13[40];
      goto LABEL_8;
    }
    __assert_rtn("-[NIServerAnalyticsManager _sessionStoppedWithTimestamp:]", "NIServerAnalyticsManager.mm", 2075, "!_bundleIdAsStdString.empty()");
  }
LABEL_8:
  std::mutex::unlock(&stru_10089D170);
  if (!self->_bundleIdentifier)
  {
    __int16 v21 = qword_1008ABDE0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO)) {
      return;
    }
    __int16 v24 = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v24;
    CFStringRef v23 = "#ni-ca,[%@] Not logging summary event without bundle identifier.";
    goto LABEL_20;
  }
  if (!*(_DWORD *)p_lifecycleTimeoutType)
  {
    __int16 v21 = qword_1008ABDE0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v25 = self->_bundleIdentifier;
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v25;
    CFStringRef v23 = "#ni-ca,[%@] Not logging summary event for unspecified session types.";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v23, buf, 0xCu);
    return;
  }
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:self->_bundleIdentifier forKey:@"appBundleID"];
  id v15 = +[NSNumber numberWithDouble:a3 - *(double *)&var0];
  [v14 setObject:v15 forKey:@"totalDuration"];

  float v16 = +[NSNumber numberWithDouble:self->_visibilityUpdateTimestamp];
  [v14 setObject:v16 forKey:@"backgroundDuration"];

  int v17 = +[NSNumber numberWithInt:1];
  [v14 setObject:v17 forKey:@"sessionCount"];

  double v18 = +[NSNumber numberWithInt:LODWORD(self->_backgroundContinuationTimeoutType)];
  [v14 setObject:v18 forKey:@"configuredBackgroundMode"];

  [v14 setObject:*(void *)&self->_maxDistance forKey:@"lifecycleTimeout"];
  id v19 = +[NSNumber numberWithBool:LOBYTE(self->_sessionType)];
  [v14 setObject:v19 forKey:@"isCameraAssistanceEnabled"];

  CFStringRef v20 = @"Accessory";
  switch(*(_DWORD *)p_lifecycleTimeoutType)
  {
    case 0:
      __assert_rtn("-[NIServerAnalyticsManager _sessionStoppedWithTimestamp:]", "NIServerAnalyticsManager.mm", 2118, "false");
    case 1:
      CFStringRef v20 = @"Peer";
      goto LABEL_23;
    case 2:
      goto LABEL_23;
    case 3:
      CFStringRef v20 = @"Findee";
      goto LABEL_23;
    case 4:
      CFStringRef v20 = @"Finder";
LABEL_23:
      [v14 setObject:v20 forKey:@"configType"];
      break;
    default:
      break;
  }
  if (BYTE1(self->_sessionType))
  {
    long long v26 = +[NSNumber numberWithInt:BYTE2(self->_sessionType)];
    [v14 setObject:v26 forKey:@"configuredAccessoryDataRate"];
  }
  if (LOBYTE(self->_timeSpentVisible))
  {
    long long v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20, self->_timeSpentNotVisible);
    [v14 setObject:v27 forKey:@"firstDistance"];

    long long v28 = +[NSNumber numberWithDouble:*(double *)&self->_receivedDistance];
    [v14 setObject:v28 forKey:@"lastDistance"];

    long long v29 = +[NSNumber numberWithDouble:self->_lastDistance];
    [v14 setObject:v29 forKey:@"minDistance"];

    long long v30 = +[NSNumber numberWithDouble:self->_firstDistance];
    [v14 setObject:v30 forKey:@"maxDistance"];
  }
  if (self->_backgroundContinuationTimeoutType == (NSString *)1) {
    [v14 setObject:*(void *)&self->_minDistance forKey:@"sessionContinuationTimeout"];
  }
  id v297 = [v14 mutableCopy];
  int v31 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    long long v32 = self->_bundleIdentifier;
    id v33 = [v297 description];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v32;
    __int16 v327 = 2112;
    CFStringRef v328 = @"com.apple.nearbyinteraction.sessionV2.summary";
    __int16 v329 = 2112;
    double v330 = *(double *)&v33;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);
  }
  v321 = _NSConcreteStackBlock;
  uint64_t v322 = 3221225472;
  v323 = sub_100039CE4;
  v324 = &unk_1008465D8;
  id v34 = v297;
  id v325 = v34;
  AnalyticsSendEventLazy();
  if (!LOBYTE(self->_sessionType)) {
    goto LABEL_43;
  }
  id v35 = objc_alloc_init((Class)NSMutableDictionary);
  [v35 setObject:self->_bundleIdentifier forKey:@"appBundleID"];
  int v36 = *(_DWORD *)p_lifecycleTimeoutType;
  if (*(_DWORD *)p_lifecycleTimeoutType == 1)
  {
    CFStringRef v37 = @"Peer";
  }
  else
  {
    if (v36 != 2)
    {
      if (!v36) {
        __assert_rtn("-[NIServerAnalyticsManager _sessionStoppedWithTimestamp:]", "NIServerAnalyticsManager.mm", 2163, "false");
      }
      goto LABEL_40;
    }
    CFStringRef v37 = @"Accessory";
  }
  [v35 setObject:v37 forKey:@"configType"];
LABEL_40:
  long long v38 = +[NSNumber numberWithDouble:*(double *)&self->_lastVIOPosition[14]];
  [v35 setObject:v38 forKey:@"DistanceMovedToHorizontalConvergence"];

  long long v39 = +[NSNumber numberWithDouble:self->_firstRangeMeasurementTime];
  [v35 setObject:v39 forKey:@"DistanceMovedToVerticalConvergence"];

  long long v40 = +[NSNumber numberWithInt:LODWORD(self->_timeToHorizontalConvergence)];
  [v35 setObject:v40 forKey:@"NumberOfInvalidPoseEvents"];

  long long v41 = +[NSNumber numberWithInt:LODWORD(self->_timeToVerticalConvergence)];
  [v35 setObject:v41 forKey:@"NumberOfLostConvergence"];

  long long v42 = +[NSNumber numberWithInt:HIDWORD(self->_timeToHorizontalConvergence)];
  [v35 setObject:v42 forKey:@"NumberOfLostHorizontalConvergence"];

  long long v43 = +[NSNumber numberWithDouble:self->_distanceMovedToVerticalConvergence];
  [v35 setObject:v43 forKey:@"RangeAtHorizontalConvergence"];

  long long v44 = +[NSNumber numberWithDouble:self->_totalDistanceMoved];
  [v35 setObject:v44 forKey:@"RangeAtVerticalConvergence"];

  long long v45 = +[NSNumber numberWithDouble:self->_rangeAtHorizontalConvergence];
  [v35 setObject:v45 forKey:@"TimeToHorizontalConvergence"];

  long long v46 = +[NSNumber numberWithDouble:self->_rangeAtVerticalConvergence];
  [v35 setObject:v46 forKey:@"TimeToVerticalConvergence"];

  unsigned int v47 = +[NSNumber numberWithDouble:self->_distanceMovedToHorizontalConvergence];
  [v35 setObject:v47 forKey:@"TotalDistanceMoved"];

  id v48 = [v35 mutableCopy];
  long long v49 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    long long v50 = self->_bundleIdentifier;
    id v51 = [v48 description];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v50;
    __int16 v327 = 2112;
    CFStringRef v328 = @"com.apple.nearbyinteraction.camereEnabledSession.summary";
    __int16 v329 = 2112;
    double v330 = *(double *)&v51;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);
  }
  v316 = _NSConcreteStackBlock;
  uint64_t v317 = 3221225472;
  v318 = sub_100039CEC;
  v319 = &unk_1008465D8;
  id v320 = v48;
  AnalyticsSendEventLazy();

LABEL_43:
  int v52 = *(_DWORD *)p_lifecycleTimeoutType;
  if (*(_DWORD *)p_lifecycleTimeoutType == 3)
  {
    if (LODWORD(self->_timeLocationFromWiFi) == -1)
    {
      long long v53 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "#ni-ca,Dummy findee CA event", buf, 2u);
      }
    }
    else
    {
      [(NIServerAnalyticsManager *)self _submitFindingSessionEndStats];
      long long v53 = objc_alloc_init((Class)NSMutableDictionary);
      [v53 setObject:self->_bundleIdentifier forKey:@"appBundleID"];
      int timeLocationFromWiFi_high = HIDWORD(self->_timeLocationFromWiFi);
      float v55 = 0.0;
      if (timeLocationFromWiFi_high != -1)
      {
        int timeLocationFromWiFi_low = LODWORD(self->_timeLocationFromWiFi);
        if (timeLocationFromWiFi_low) {
          float v55 = (float)timeLocationFromWiFi_high / (float)timeLocationFromWiFi_low;
        }
      }
      int v57 = +[NSNumber numberWithDouble:v55];
      [v53 setObject:v57 forKey:@"SessionWithBoundedDisplacement_percentage"];

      int timeLocationFromWiFi2_low = LODWORD(self->_timeLocationFromWiFi2);
      float v59 = 0.0;
      if (timeLocationFromWiFi2_low != -1)
      {
        int v60 = LODWORD(self->_timeLocationFromWiFi);
        if (v60) {
          float v59 = (float)timeLocationFromWiFi2_low / (float)v60;
        }
      }
      long long v61 = +[NSNumber numberWithDouble:v59];
      [v53 setObject:v61 forKey:@"SessionWithDeltaPositionPDR_percentage"];

      int numberOfBoundedDisplacementFromPeerData = self->_numberOfBoundedDisplacementFromPeerData;
      float v63 = 0.0;
      if (numberOfBoundedDisplacementFromPeerData != -1)
      {
        int v64 = LODWORD(self->_timeLocationFromWiFi);
        if (v64) {
          float v63 = (float)numberOfBoundedDisplacementFromPeerData / (float)v64;
        }
      }
      long long v65 = +[NSNumber numberWithDouble:v63];
      [v53 setObject:v65 forKey:@"SessionWithVIO_percentage"];

      int numberOfPeerData = self->_numberOfPeerData;
      float v67 = 0.0;
      if (numberOfPeerData != -1)
      {
        int v68 = LODWORD(self->_timeLocationFromWiFi);
        if (v68) {
          float v67 = (float)numberOfPeerData / (float)v68;
        }
      }
      long long v69 = +[NSNumber numberWithDouble:v67];
      [v53 setObject:v69 forKey:@"SessionWithDeltaVelocity_percentage"];

      int timeLocationFromWiFi2_high = HIDWORD(self->_timeLocationFromWiFi2);
      float v71 = 0.0;
      if (timeLocationFromWiFi2_high != -1)
      {
        int v72 = LODWORD(self->_timeLocationFromWiFi);
        if (v72) {
          float v71 = (float)timeLocationFromWiFi2_high / (float)v72;
        }
      }
      long long v73 = +[NSNumber numberWithDouble:v71];
      [v53 setObject:v73 forKey:@"SessionWithLocation_percentage"];

      int numberOfLocationFromPeerData = self->_numberOfLocationFromPeerData;
      float v75 = 0.0;
      if (numberOfLocationFromPeerData != -1)
      {
        int v76 = HIDWORD(self->_timeLocationFromWiFi);
        if (v76) {
          float v75 = (float)numberOfLocationFromPeerData / (float)v76;
        }
      }
      v77 = +[NSNumber numberWithDouble:v75];
      [v53 setObject:v77 forKey:@"Findee_Static_percentage"];

      int numberOfPDRFromPeerData = self->_numberOfPDRFromPeerData;
      float v79 = 0.0;
      if (numberOfPDRFromPeerData != -1)
      {
        int v80 = HIDWORD(self->_timeLocationFromWiFi);
        if (v80) {
          float v79 = (float)numberOfPDRFromPeerData / (float)v80;
        }
      }
      long long v81 = +[NSNumber numberWithDouble:v79];
      [v53 setObject:v81 forKey:@"Findee_SlowlyMoving_percentage"];

      int numberOfDeltaVelocityFromPeerData = self->_numberOfDeltaVelocityFromPeerData;
      float v83 = 0.0;
      if (numberOfDeltaVelocityFromPeerData != -1)
      {
        int v84 = HIDWORD(self->_timeLocationFromWiFi);
        if (v84) {
          float v83 = (float)numberOfDeltaVelocityFromPeerData / (float)v84;
        }
      }
      long long v85 = +[NSNumber numberWithDouble:v83];
      [v53 setObject:v85 forKey:@"Findee_WalkingOrUnknown_percentage"];

      if (self->_timeAtLastLocationUpdate != -1.0)
      {
        double v86 = a3 - timeAtLastLocationUpdate;
        double v87 = *(double *)&self->_lastLocationType;
        float v88 = 0.0;
        if (v87 != -1.0 && v86 != 0.0)
        {
          float v89 = v87;
          float v90 = v86;
          float v88 = v89 / v90;
        }
        long long v91 = +[NSNumber numberWithDouble:v88];
        [v53 setObject:v91 forKey:@"LocationFromAccessory_percentage"];

        double timeAtFirstLocationUpdate = self->_timeAtFirstLocationUpdate;
        BOOL v93 = timeAtFirstLocationUpdate == -1.0 || v86 == 0.0;
        float v94 = 0.0;
        if (!v93)
        {
          float v95 = timeAtFirstLocationUpdate;
          float v96 = v86;
          float v94 = v95 / v96;
        }
        v97 = +[NSNumber numberWithDouble:v94];
        [v53 setObject:v97 forKey:@"LocationFromCell_percentage"];

        double timeLocationFromAccessory = self->_timeLocationFromAccessory;
        BOOL v99 = timeLocationFromAccessory == -1.0 || v86 == 0.0;
        float v100 = 0.0;
        if (!v99)
        {
          float v101 = timeLocationFromAccessory;
          float v102 = v86;
          float v100 = v101 / v102;
        }
        long long v103 = +[NSNumber numberWithDouble:v100];
        [v53 setObject:v103 forKey:@"LocationFromCompensated_percentage"];

        double timeLocationFromCell = self->_timeLocationFromCell;
        BOOL v105 = timeLocationFromCell == -1.0 || v86 == 0.0;
        float v106 = 0.0;
        if (!v105)
        {
          float v107 = timeLocationFromCell;
          float v108 = v86;
          float v106 = v107 / v108;
        }
        long long v109 = +[NSNumber numberWithDouble:v106];
        [v53 setObject:v109 forKey:@"LocationFromGPS_percentage"];

        double timeLocationFromCompensated = self->_timeLocationFromCompensated;
        BOOL v111 = timeLocationFromCompensated == -1.0 || v86 == 0.0;
        float v112 = 0.0;
        if (!v111)
        {
          float v113 = timeLocationFromCompensated;
          float v114 = v86;
          float v112 = v113 / v114;
        }
        long long v115 = +[NSNumber numberWithDouble:v112];
        [v53 setObject:v115 forKey:@"LocationFromGPSCoarse_percentage"];

        double v116 = self->_timeAtFirstLocationUpdate;
        BOOL v117 = v116 == -1.0 || v86 == 0.0;
        float v118 = 0.0;
        if (!v117)
        {
          float v119 = v116;
          float v120 = v86;
          float v118 = v119 / v120;
        }
        long long v121 = +[NSNumber numberWithDouble:v118];
        [v53 setObject:v121 forKey:@"LocationFromCell_percentage"];

        double timeLocationFromGPS = self->_timeLocationFromGPS;
        BOOL v123 = timeLocationFromGPS == -1.0 || v86 == 0.0;
        float v124 = 0.0;
        if (!v123)
        {
          float v125 = timeLocationFromGPS;
          float v126 = v86;
          float v124 = v125 / v126;
        }
        v127 = +[NSNumber numberWithDouble:v124];
        [v53 setObject:v127 forKey:@"LocationFromLAC_percentage"];

        double timeLocationFromGPSCoarse = self->_timeLocationFromGPSCoarse;
        BOOL v129 = timeLocationFromGPSCoarse == -1.0 || v86 == 0.0;
        float v130 = 0.0;
        if (!v129)
        {
          float v131 = timeLocationFromGPSCoarse;
          float v132 = v86;
          float v130 = v131 / v132;
        }
        v133 = +[NSNumber numberWithDouble:v130];
        [v53 setObject:v133 forKey:@"LocationFromLOIOverride_percentage"];

        double timeLocationFromLAC = self->_timeLocationFromLAC;
        BOOL v135 = timeLocationFromLAC == -1.0 || v86 == 0.0;
        float v136 = 0.0;
        if (!v135)
        {
          float v137 = timeLocationFromLAC;
          float v138 = v86;
          float v136 = v137 / v138;
        }
        v139 = +[NSNumber numberWithDouble:v136];
        [v53 setObject:v139 forKey:@"LocationFromMCC_percentage"];

        double timeLocationFromLOIOverride = self->_timeLocationFromLOIOverride;
        BOOL v141 = timeLocationFromLOIOverride == -1.0 || v86 == 0.0;
        float v142 = 0.0;
        if (!v141)
        {
          float v143 = timeLocationFromLOIOverride;
          float v144 = v86;
          float v142 = v143 / v144;
        }
        v145 = +[NSNumber numberWithDouble:v142];
        [v53 setObject:v145 forKey:@"LocationFromPipeline_percentage"];

        double timeLocationFromMCC = self->_timeLocationFromMCC;
        BOOL v147 = timeLocationFromMCC == -1.0 || v86 == 0.0;
        float v148 = 0.0;
        if (!v147)
        {
          float v149 = timeLocationFromMCC;
          float v150 = v86;
          float v148 = v149 / v150;
        }
        v151 = +[NSNumber numberWithDouble:v148];
        [v53 setObject:v151 forKey:@"LocationFromUnknown_percentage"];

        double timeLocationFromPipeline = self->_timeLocationFromPipeline;
        BOOL v153 = timeLocationFromPipeline == -1.0 || v86 == 0.0;
        float v154 = 0.0;
        if (!v153)
        {
          float v155 = timeLocationFromPipeline;
          float v156 = v86;
          float v154 = v155 / v156;
        }
        v157 = +[NSNumber numberWithDouble:v154];
        [v53 setObject:v157 forKey:@"LocationFromWiFi_percentage"];

        double timeLocationFromUnknown = self->_timeLocationFromUnknown;
        BOOL v159 = timeLocationFromUnknown == -1.0 || v86 == 0.0;
        float v160 = 0.0;
        if (!v159)
        {
          float v161 = timeLocationFromUnknown;
          float v162 = v86;
          float v160 = v161 / v162;
        }
        v163 = +[NSNumber numberWithDouble:v160];
        [v53 setObject:v163 forKey:@"LocationFromWiFi2_percentage"];
      }
      if (self->_timeFindeeWasWalkingOrUnknown != -1.0)
      {
        double distanceTraveledFromPDR = self->_distanceTraveledFromPDR;
        float v165 = 0.0;
        if (distanceTraveledFromPDR != -1.0 && pdrTimeAtFirstPDRUpdate - timeFindeeWasWalkingOrUnknown != 0.0)
        {
          float v166 = distanceTraveledFromPDR;
          float v167 = pdrTimeAtFirstPDRUpdate - timeFindeeWasWalkingOrUnknown;
          float v165 = v166 / v167;
        }
        v168 = +[NSNumber numberWithDouble:v165];
        [v53 setObject:v168 forKey:@"PDR_indicates_static_percentage"];
      }
      if (*(double *)&self->_numberOfWalkingOrkUnknown != -1.0)
      {
        v169 = +[NSNumber numberWithDouble:*(double *)&self->_lastMotionCategory];
        [v53 setObject:v169 forKey:@"TimeFindeeWasStatic"];

        v170 = +[NSNumber numberWithDouble:self->_timeAtLastBoundedDisplacementUpdate];
        [v53 setObject:v170 forKey:@"TimeFindeeWasSlowlyMoving"];

        v171 = +[NSNumber numberWithDouble:self->_timeFindeeWasSlowlyMoving];
        [v53 setObject:v171 forKey:@"TimeFindeeWasWalkingOrUnknown"];

        v172 = +[NSNumber numberWithDouble:self->_timeFindeeWasStatic];
        [v53 setObject:v172 forKey:@"TimeToSessionEnd"];
      }
      v173 = +[NSNumber numberWithDouble:self->_timeToSessionEnd];
      [v53 setObject:v173 forKey:@"DistanceTraveledFromPDR"];

      unsigned int numberOfSlowlyMoving = self->_numberOfSlowlyMoving;
      if (numberOfSlowlyMoving == -1) {
        uint64_t v175 = 0;
      }
      else {
        uint64_t v175 = numberOfSlowlyMoving;
      }
      v176 = +[NSNumber numberWithInt:v175];
      [v53 setObject:v176 forKey:@"NumberOfMissedRanges"];

      unsigned int numberOfVIOFromPeerData = self->_numberOfVIOFromPeerData;
      if (numberOfVIOFromPeerData == -1) {
        uint64_t v178 = 0;
      }
      else {
        uint64_t v178 = numberOfVIOFromPeerData;
      }
      v179 = +[NSNumber numberWithInt:v178];
      [v53 setObject:v179 forKey:@"NumberOfSuccessfulRanges"];

      int v180 = self->_numberOfVIOFromPeerData;
      float v181 = 0.0;
      if (v180 != -1)
      {
        int v182 = self->_numberOfSlowlyMoving + v180;
        if (v182) {
          float v181 = (float)v180 / (float)v182;
        }
      }
      v183 = +[NSNumber numberWithDouble:v181];
      [v53 setObject:v183 forKey:@"SuccesfulRangesToTotalRangingAttempts_percentage"];

      if (self->_anon_9d8[169])
      {
        v184 = +[NSNumber numberWithBool:self->_anon_9d8[168]];
        [v53 setObject:v184 forKey:@"FinderIsPhone"];
      }
      id v185 = [v53 mutableCopy];
      v186 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
      {
        v187 = self->_bundleIdentifier;
        id v188 = [v185 description];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v187;
        __int16 v327 = 2112;
        CFStringRef v328 = @"com.apple.nearbyinteraction.peopleFindingSession.FindeeSummary";
        __int16 v329 = 2112;
        double v330 = *(double *)&v188;
        _os_log_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);
      }
      v311 = _NSConcreteStackBlock;
      uint64_t v312 = 3221225472;
      v313 = sub_100039CF4;
      v314 = &unk_1008465D8;
      id v315 = v185;
      AnalyticsSendEventLazy();
    }
    int v52 = *(_DWORD *)p_lifecycleTimeoutType;
  }
  if (v52 == 4)
  {
    [(NIServerAnalyticsManager *)self _submitFindingSessionEndStats];
    if (self->_timePeerLocationFromFindeeData == -1.0)
    {
      v189 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_INFO, "#ni-ca,Dummy finder CA event", buf, 2u);
      }
    }
    else
    {
      v189 = objc_alloc_init((Class)NSMutableDictionary);
      [v189 setObject:self->_bundleIdentifier forKey:@"appBundleID"];
      [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:a3];
      double v191 = v190;
      if (self->_timeAtFirstValidPose != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v192 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v189 setObject:v192 forKey:@"TimeToFirstOutputRange"];
      }
      if (self->_timeAtFirstRawUWBRange != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v193 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v189 setObject:v193 forKey:@"TimeToFirstPeerLocation"];
      }
      if (self->_timeAtFirstPeerLocation != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v194 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v189 setObject:v194 forKey:@"TimeToFirstPeerLocationFromFMF"];
      }
      if (self->_timeAtFirstSelfLocation != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v195 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v189 setObject:v195 forKey:@"TimeToFirstPeerLocationFromFindeeData"];
      }
      if (self->_timeAtArmsLength != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v196 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v189 setObject:v196 forKey:@"TimeToFirstRawUWBRange"];
      }
      if (self->_timeAtFirstPose != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v197 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v189 setObject:v197 forKey:@"TimeToFirstArrow"];
      }
      if (self->_timeAtFirstArrow != -1.0)
      {
        -[NIServerAnalyticsManager _finderTimeFromFirstPoseTo:](self, "_finderTimeFromFirstPoseTo:");
        v198 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v189 setObject:v198 forKey:@"TimeToArmsReach"];
      }
      [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_timeAtLastLocationFromFindeeData];
      v199 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v189 setObject:v199 forKey:@"TimeToFirstPose"];

      [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:*(double *)&self->_numberOfWalkingOrkUnknown];
      v200 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v189 setObject:v200 forKey:@"TimeToFirstFindeeData"];

      [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_timeAtFirstFindeeData];
      v201 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v189 setObject:v201 forKey:@"TimeToFirstSelfLocation"];

      [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_timeAtFirstPeerLocationFromFindeeData];
      v202 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v189 setObject:v202 forKey:@"TimeToFirstPDRFromFindeeData"];

      [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_timeAtFirstPeerLocationFromFMF];
      v203 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v189 setObject:v203 forKey:@"TimeToFirstVIOFromFindeeData"];

      [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_timeAtFirstPDRFromFindeeData];
      v204 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v189 setObject:v204 forKey:@"TimeToFirstDeltaVelocityFromFindeeData"];

      [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_timeAtFirstVIOFromFindeeData];
      v205 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v189 setObject:v205 forKey:@"TimeToFirstStaticFromFindeeData"];

      v206 = +[NSNumber numberWithDouble:v191];
      [v189 setObject:v206 forKey:@"TimeToEndSession"];

      v207 = [(NIServerAnalyticsManager *)self _algorithmSourceToString:LODWORD(self->_timeAtFirstStaticFromFindeeData)];
      [v189 setObject:v207 forKey:@"FirstArrowAlgorithmSource"];

      v208 = [(NIServerAnalyticsManager *)self _algorithmSourceToString:HIDWORD(self->_timeAtFirstStaticFromFindeeData)];
      [v189 setObject:v208 forKey:@"FirstOutputRangeAlgorithmSource"];

      v209 = [(NIServerAnalyticsManager *)self _algorithmSourceToString:LODWORD(self->_timeAtEndOfSession)];
      [v189 setObject:v209 forKey:@"ArmsReachAlgorithmSource"];

      int firstArrowAlgorithmSource = self->_firstArrowAlgorithmSource;
      float v211 = 0.0;
      if (firstArrowAlgorithmSource != -1)
      {
        int firstOutputRangeAlgorithmSource = self->_firstOutputRangeAlgorithmSource;
        if (firstOutputRangeAlgorithmSource) {
          float v211 = (float)firstArrowAlgorithmSource / (float)firstOutputRangeAlgorithmSource;
        }
      }
      v213 = +[NSNumber numberWithDouble:v211];
      [v189 setObject:v213 forKey:@"ArrowAvailabilityAfterFirstArrow"];

      unsigned int timeAtEndOfSession_high = HIDWORD(self->_timeAtEndOfSession);
      if (timeAtEndOfSession_high == -1) {
        uint64_t v215 = 0;
      }
      else {
        uint64_t v215 = timeAtEndOfSession_high;
      }
      v216 = +[NSNumber numberWithInt:v215];
      [v189 setObject:v216 forKey:@"NumberOfArrowRevokes"];

      unsigned int armsReachAlgorithmSource = self->_armsReachAlgorithmSource;
      if (armsReachAlgorithmSource == -1) {
        uint64_t v218 = 0;
      }
      else {
        uint64_t v218 = armsReachAlgorithmSource;
      }
      v219 = +[NSNumber numberWithInt:v218];
      [v189 setObject:v219 forKey:@"NumberOfVIOResets"];

      int numberOfArrowRevokes = self->_numberOfArrowRevokes;
      float v221 = 0.0;
      if (numberOfArrowRevokes != -1)
      {
        int numberOfArrowAvailabilityAfterFirstArrow = self->_numberOfArrowAvailabilityAfterFirstArrow;
        if (numberOfArrowAvailabilityAfterFirstArrow) {
          float v221 = (float)numberOfArrowRevokes / (float)numberOfArrowAvailabilityAfterFirstArrow;
        }
      }
      v223 = +[NSNumber numberWithDouble:v221];
      [v189 setObject:v223 forKey:@"RatioOfSuccessfulPeerDataToTotalNumRange"];

      v224 = +[NSNumber numberWithBool:LOBYTE(self->_maxYCoordinateFindee)];
      [v189 setObject:v224 forKey:@"DidFinderChangeFloors"];

      v225 = +[NSNumber numberWithBool:BYTE1(self->_maxYCoordinateFindee)];
      [v189 setObject:v225 forKey:@"DidFindeeChangeFloors"];

      if (self->_numberOfArrowAvailabilityAfterFirstArrow >= 1)
      {
        v226 = +[NSNumber numberWithDouble:self->_lastNBRSSI];
        [v189 setObject:v226 forKey:@"MaxRawRangeValueDuringSession"];

        v227 = +[NSNumber numberWithDouble:self->_maxNBRSSI];
        [v189 setObject:v227 forKey:@"MinimumRange"];

        v228 = +[NSNumber numberWithDouble:self->_m2];
        [v189 setObject:v228 forKey:@"FirstRawRangeValueDuringSession"];

        v229 = +[NSNumber numberWithDouble:self->_firstNBRSSI];
        [v189 setObject:v229 forKey:@"LastRange"];

        v230 = +[NSNumber numberWithDouble:self->_maxRawRangeValue];
        [v189 setObject:v230 forKey:@"RangeAtFirstPose"];

        v231 = +[NSNumber numberWithDouble:self->_minRawRangeValue];
        [v189 setObject:v231 forKey:@"RangeAtFirstArrow"];

        v232 = +[NSNumber numberWithBool:vabdd_f64(self->_firstNBRSSI, self->_maxRawRangeValue) < 2.0];
        [v189 setObject:v232 forKey:@"SessionEndedWithNoRange"];
      }
      if (self->_armsReachAlgorithmSource == -1)
      {
        [(NIServerAnalyticsManager *)self _calculateStraightLineDistance];
        v234 = +[NSNumber numberWithDouble:*(double *)&self->_anon_558[72]];
        [v189 setObject:v234 forKey:@"StraightLineDistanceToFirstArrow"];

        v235 = +[NSNumber numberWithDouble:self->_firstArrowStraightLineDistance];
        [v189 setObject:v235 forKey:@"StraightLineDistanceToFirstArrow"];

        v236 = +[NSNumber numberWithDouble:*(double *)&self->_anon_558[80]];
        [v189 setObject:v236 forKey:@"StraightLineDistanceToArmsReach"];

        v237 = +[NSNumber numberWithDouble:*(double *)&self->_anon_af8[80]];
        [v189 setObject:v237 forKey:@"RadialDisplacementVIO"];

        v238 = +[NSNumber numberWithDouble:*(double *)&self->_anon_648[152]];
        [v189 setObject:v238 forKey:@"UserMovedDistanceToFirstArrow"];

        v239 = +[NSNumber numberWithDouble:*(double *)&self->_anon_778[152]];
        [v189 setObject:v239 forKey:@"UserMovedDistanceToFirstOutputRange"];

        v240 = +[NSNumber numberWithDouble:*(double *)&self->_anon_8a8[152]];
        [v189 setObject:v240 forKey:@"UserMovedDistanceToArmsReach"];

        v241 = +[NSNumber numberWithDouble:*(double *)&self->_anon_9d8[152]];
        [v189 setObject:v241 forKey:@"TotalUserMovedDistance"];

        [(NIServerAnalyticsManager *)self _calculateIOMetrics:v191];
        v242 = +[NSNumber numberWithDouble:self->_radialDisplacementError];
        [v189 setObject:v242 forKey:@"PDRSpeedErrorStandardDeviation"];

        v243 = +[NSNumber numberWithDouble:*(double *)&self->_anon_af8[72]];
        [v189 setObject:v243 forKey:@"PathLengthPDRVsVIOError"];

        v244 = +[NSNumber numberWithDouble:self->_pathLengthError];
        [v189 setObject:v244 forKey:@"RadialDisplacementError"];

        v245 = +[NSNumber numberWithDouble:self->_radialDisplacementFromVIO];
        [v189 setObject:v245 forKey:@"MeanSpeedFromVIO"];

        v246 = +[NSNumber numberWithDouble:self->_meanSpeedFromVIO];
        [v189 setObject:v246 forKey:@"MeanSpeedFromVIOError"];

        v247 = +[NSNumber numberWithDouble:self->_timeSSFromIOAndSSFromVIO];
        [v189 setObject:v247 forKey:@"PDRStationaryDetectionTruePositiveRate"];

        v248 = +[NSNumber numberWithDouble:self->_timeSSFromIOAndNotSSFromVIO];
        [v189 setObject:v248 forKey:@"PDRStationaryDetectionTrueNegativeRate"];

        v233 = +[NSNumber numberWithDouble:self->_pdrSSDetectionTruePositiveRate];
        [v189 setObject:v233 forKey:@"TimeSSFromVIO_percentage"];
      }
      else
      {
        v233 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v233, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_INFO, "#ni-ca,Unable to send user distances between finder and findee (we had VIO reset(s))", buf, 2u);
        }
      }

      if (LOBYTE(self->_vioPathLength))
      {
        [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_noOdometryAvailableTime];
        v249 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        [v189 setObject:v249 forKey:@"TimeToFirstIOPoseAfterFindButtonPressed"];

        v250 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v250, OS_LOG_TYPE_DEFAULT))
        {
          [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_timeAtLastLocationFromFindeeData];
          if (!LOBYTE(self->_vioPathLength)) {
            sub_10000AE44();
          }
          uint64_t v252 = v251;
          [(NIServerAnalyticsManager *)self _finderTimeFromFirstPoseTo:self->_noOdometryAvailableTime];
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v252;
          __int16 v327 = 2048;
          CFStringRef v328 = v253;
          _os_log_impl((void *)&_mh_execute_header, v250, OS_LOG_TYPE_DEFAULT, "#ni-ca,pose times, vio: %f, io: %f", buf, 0x16u);
        }
      }
      double val = self->_lastSolutionTime.var0.__val_;
      double v255 = *(double *)&self->_lastSolutionTime.__engaged_;
      double vioAvailableTime = self->_vioAvailableTime;
      double ioSourceTime = self->_ioSourceTime;
      double v258 = val + v255 + vioAvailableTime + ioSourceTime;
      double v259 = val / v258;
      double v260 = v255 / v258;
      double v261 = vioAvailableTime / v258;
      double v262 = ioSourceTime / v258;
      v263 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v263, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218752;
        *(double *)&uint8_t buf[4] = v259;
        __int16 v327 = 2048;
        CFStringRef v328 = *(const __CFString **)&v260;
        __int16 v329 = 2048;
        double v330 = v261;
        __int16 v331 = 2048;
        double v332 = v262;
        _os_log_impl((void *)&_mh_execute_header, v263, OS_LOG_TYPE_DEFAULT, "#ni-ca,odometry source ratio, VIO: %f, IO: %f, DeltaV: %f, None: %f", buf, 0x2Au);
      }

      v264 = +[NSNumber numberWithDouble:v259];
      [v189 setObject:v264 forKey:@"OdometrySourceVIO"];

      v265 = +[NSNumber numberWithDouble:v260];
      [v189 setObject:v265 forKey:@"OdometrySourceIO"];

      v266 = +[NSNumber numberWithDouble:v261];
      [v189 setObject:v266 forKey:@"OdometrySourceDeltaV"];

      v267 = +[NSNumber numberWithDouble:v262];
      [v189 setObject:v267 forKey:@"OdometrySourceNone"];

      value = self->_deltaAngleErrorHistory.__end_cap_.__value_;
      end = self->_deltaAngleErrorHistory.__end_;
      if ((unint64_t)((char *)value - (char *)end) >= 0x29)
      {
        unint64_t v310 = 0;
        long long v308 = 0u;
        long long v309 = 0u;
        v306 = 0;
        uint64_t v307 = 0;
        __p = 0;
        sub_10003B584(&__p, end, (uint64_t)value, value - end);
        [(NIServerAnalyticsManager *)self _calculateErrorStatsFromVector:&__p];
        if (__p)
        {
          v306 = __p;
          operator delete(__p);
        }
        v270 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v270, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134219008;
          *(void *)&uint8_t buf[4] = v308;
          __int16 v327 = 2048;
          CFStringRef v328 = (const __CFString *)*((void *)&v308 + 1);
          __int16 v329 = 2048;
          double v330 = *(double *)&v309;
          __int16 v331 = 2048;
          double v332 = *((double *)&v309 + 1);
          __int16 v333 = 2048;
          unint64_t v334 = v310;
          _os_log_impl((void *)&_mh_execute_header, v270, OS_LOG_TYPE_DEFAULT, "#ni-ca,point errors mean: %f, std: %f, median: %f, 95th: %f, n: %zu", buf, 0x34u);
        }

        v271 = +[NSNumber numberWithDouble:*(double *)&v308];
        [v189 setObject:v271 forKey:@"PointToPointErrorMean"];

        v272 = +[NSNumber numberWithDouble:*((double *)&v308 + 1)];
        [v189 setObject:v272 forKey:@"PointToPointErrorStd"];

        v273 = +[NSNumber numberWithDouble:*(double *)&v309];
        [v189 setObject:v273 forKey:@"PointToPointErrorMedian"];

        v274 = +[NSNumber numberWithDouble:*((double *)&v309 + 1)];
        [v189 setObject:v274 forKey:@"PointToPointError95th"];

        v275 = +[NSNumber numberWithDouble:(double)v310];
        [v189 setObject:v275 forKey:@"PointToPointErrorN"];
      }
      v276 = self->_angleErrorHistory.__end_cap_.__value_;
      v277 = self->_angleErrorHistory.__end_;
      if ((unint64_t)((char *)v276 - (char *)v277) >= 0x29)
      {
        unint64_t v310 = 0;
        long long v308 = 0u;
        long long v309 = 0u;
        v303 = 0;
        uint64_t v304 = 0;
        v302 = 0;
        sub_10003B584(&v302, v277, (uint64_t)v276, v276 - v277);
        [(NIServerAnalyticsManager *)self _calculateErrorStatsFromVector:&v302];
        if (v302)
        {
          v303 = v302;
          operator delete(v302);
        }
        v278 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v278, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134219008;
          *(void *)&uint8_t buf[4] = v308;
          __int16 v327 = 2048;
          CFStringRef v328 = (const __CFString *)*((void *)&v308 + 1);
          __int16 v329 = 2048;
          double v330 = *(double *)&v309;
          __int16 v331 = 2048;
          double v332 = *((double *)&v309 + 1);
          __int16 v333 = 2048;
          unint64_t v334 = v310;
          _os_log_impl((void *)&_mh_execute_header, v278, OS_LOG_TYPE_DEFAULT, "#ni-ca,delta dot errors mean: %f, std: %f, median: %f, 95th: %f, n: %zu", buf, 0x34u);
        }

        v279 = +[NSNumber numberWithDouble:*(double *)&v308];
        [v189 setObject:v279 forKey:@"IODirectionOfTravelErrorDeltaDegreesMean"];

        v280 = +[NSNumber numberWithDouble:*((double *)&v308 + 1)];
        [v189 setObject:v280 forKey:@"IODirectionOfTravelErrorDeltaDegreesStd"];

        v281 = +[NSNumber numberWithDouble:*(double *)&v309];
        [v189 setObject:v281 forKey:@"IODirectionOfTravelErrorDeltaDegreesMedian"];

        v282 = +[NSNumber numberWithDouble:*((double *)&v309 + 1)];
        [v189 setObject:v282 forKey:@"IODirectionOfTravelErrorDeltaDegrees95th"];

        v283 = +[NSNumber numberWithDouble:(double)v310];
        [v189 setObject:v283 forKey:@"IODirectionOfTravelErrorDeltaDegreesN"];
      }
      uint64_t v284 = *(void *)&self->_timeOfLastPDRUpdate.__engaged_;
      double v285 = self->_timeOfLastPDRUpdate.var0.__val_;
      if ((unint64_t)(v284 - *(void *)&v285) >= 0x29)
      {
        unint64_t v310 = 0;
        long long v308 = 0u;
        long long v309 = 0u;
        v300 = 0;
        uint64_t v301 = 0;
        v299 = 0;
        sub_10003B584(&v299, *(const void **)&v285, v284, (v284 - *(void *)&v285) >> 2);
        [(NIServerAnalyticsManager *)self _calculateErrorStatsFromVector:&v299];
        if (v299)
        {
          v300 = v299;
          operator delete(v299);
        }
        v286 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134219008;
          *(void *)&uint8_t buf[4] = v308;
          __int16 v327 = 2048;
          CFStringRef v328 = (const __CFString *)*((void *)&v308 + 1);
          __int16 v329 = 2048;
          double v330 = *(double *)&v309;
          __int16 v331 = 2048;
          double v332 = *((double *)&v309 + 1);
          __int16 v333 = 2048;
          unint64_t v334 = v310;
          _os_log_impl((void *)&_mh_execute_header, v286, OS_LOG_TYPE_DEFAULT, "#ni-ca,dot errors mean: %f, std: %f, median: %f, 95th: %f, n: %zu", buf, 0x34u);
        }

        v287 = +[NSNumber numberWithDouble:*(double *)&v308];
        [v189 setObject:v287 forKey:@"IODirectionOfTravelErrorDegreesMean"];

        v288 = +[NSNumber numberWithDouble:*((double *)&v308 + 1)];
        [v189 setObject:v288 forKey:@"IODirectionOfTravelErrorDegreesStd"];

        v289 = +[NSNumber numberWithDouble:*(double *)&v309];
        [v189 setObject:v289 forKey:@"IODirectionOfTravelErrorDegreesMedian"];

        v290 = +[NSNumber numberWithDouble:*((double *)&v309 + 1)];
        [v189 setObject:v290 forKey:@"IODirectionOfTravelErrorDegrees95th"];

        v291 = +[NSNumber numberWithDouble:(double)v310];
        [v189 setObject:v291 forKey:@"IODirectionOfTravelErrorDegreesN"];
      }
      if (self->_anon_9d8[171])
      {
        v292 = +[NSNumber numberWithBool:self->_anon_9d8[170]];
        [v189 setObject:v292 forKey:@"FindeeIsPhone"];
      }
      id v293 = [v189 mutableCopy];
      v294 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v294, OS_LOG_TYPE_INFO))
      {
        v295 = self->_bundleIdentifier;
        id v296 = [v293 description];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v295;
        __int16 v327 = 2112;
        CFStringRef v328 = @"com.apple.nearbyinteraction.peopleFindingSession.FinderSummary";
        __int16 v329 = 2112;
        double v330 = *(double *)&v296;
        _os_log_impl((void *)&_mh_execute_header, v294, OS_LOG_TYPE_INFO, "#ni-ca,[%@] send analytics event %@:\n%@\n", buf, 0x20u);
      }
      id v298 = v293;
      AnalyticsSendEventLazy();
    }
  }
}

- (void).cxx_destruct
{
  end = self->_deltaAngleErrorHistory.__end_;
  if (end)
  {
    self->_deltaAngleErrorHistory.__end_cap_.__value_ = end;
    operator delete(end);
  }
  double v4 = self->_angleErrorHistory.__end_;
  if (v4)
  {
    self->_angleErrorHistory.__end_cap_.__value_ = v4;
    operator delete(v4);
  }
  double val = self->_timeOfLastPDRUpdate.var0.__val_;
  if (val != 0.0)
  {
    *(double *)&self->_timeOfLastPDRUpdate.__engaged_ = val;
    operator delete(*(void **)&val);
  }
  sub_10003AC1C(&self->_pdrAligner._rotatedVioPoseHistory.__start_);
  sub_10003AC1C(&self->_pdrAligner._poseHistory.__start_);
  objc_storeStrong((id *)&self->_minDistance, 0);
  objc_storeStrong((id *)&self->_maxDistance, 0);
  if (*((char *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_bundleIdAsStdString.__r_.__value_.var0.var1.__data_);
  }

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)self->_bundleIdAsStdString.__r_.__value_.var0.var0.__data_ = 0uLL;
  *((void *)&self->_bundleIdAsStdString.__r_.__value_.var0.var1 + 2) = 0;
  LOBYTE(self->_numberOfLostVerticalConvergence) = 0;
  *((unsigned char *)&self->_numberOfLostVerticalConvergence + 4) = 0;
  LOBYTE(self->_timeAtFirstPeerData) = 0;
  BYTE4(self->_timeAtFirstPeerData) = 0;
  LOBYTE(self->_numberOfVIOResets) = 0;
  self->_anon_318[56] = 0;
  self->_anon_318[72] = 0;
  self->_anon_3a8[56] = 0;
  self->_anon_3a8[72] = 0;
  self->_anon_438[56] = 0;
  self->_anon_438[72] = 0;
  self->_anon_4c8[56] = 0;
  self->_anon_4c8[72] = 0;
  self->_anon_558[56] = 0;
  LOBYTE(self->_firstOutputRangeStraightLineDistance) = 0;
  LOBYTE(self->_firstArrowUserMovedDistance.traveledDistance) = 0;
  self->_anon_648[8] = 0;
  self->_anon_648[136] = 0;
  self->_anon_648[168] = 0;
  LOBYTE(self->_firstOutputRangeUserMovedDistance.traveledDistance) = 0;
  self->_anon_778[8] = 0;
  self->_anon_778[136] = 0;
  self->_anon_778[168] = 0;
  LOBYTE(self->_armsReachUserMovedDistance.traveledDistance) = 0;
  self->_anon_8a8[8] = 0;
  self->_anon_8a8[136] = 0;
  self->_anon_8a8[168] = 0;
  LOBYTE(self->_totalUserMovedDistance.traveledDistance) = 0;
  self->_anon_9d8[8] = 0;
  self->_anon_9d8[136] = 0;
  LOBYTE(self->_vioPathLengthWhenPDRIsAvailable) = 0;
  self->_anon_af8[56] = 0;
  BYTE4(self->_maxYCoordinateFindee) = 0;
  LOBYTE(self->_minYCoordinateFindee) = 0;
  *(_DWORD *)&self->_anon_9d8[168] = 0;
  sub_100387EA4((uint64_t)&self->_rangeAtFirstArrow);
  self->_previousVioIsNotAvailable = 0;
  self->_previousAdjustedRotatedVioPosition.var0.__null_state_ = 0;
  self->_anon_e42[14] = 0;
  self->_anon_e42[22] = 0;
  BYTE4(self->_pointToPointErrorHistory.__end_) = 0;
  self->_lastAngleError.var0.__null_state_ = 0;
  LOBYTE(self->_timeOfLastSplicedPoseErrorLogging) = 0;
  LOBYTE(self->_noOdometryAvailableTime) = 0;
  LOBYTE(self->_vioPathLength) = 0;
  self->_timeOfLastPDRUpdate = 0u;
  *(_OWORD *)&self->_angleErrorHistory.__begin_ = 0u;
  *(_OWORD *)&self->_angleErrorHistory.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_deltaAngleErrorHistory.__end_ = 0u;
  *(_OWORD *)((char *)&self->_deltaAngleErrorHistory.__end_cap_.__value_ + 1) = 0u;
  return self;
}

@end