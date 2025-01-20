@interface CLStepDistanceEstimator
- (BOOL)checkCoreAnalyticsPermissions:(BOOL)a3 rawPaceForLUT:(double)a4;
- (CLExtendedStepCountEntry)updateEntryDistanceAndPace:(SEL)a3;
- (CLStepDistanceEstimator)init;
- (double)computeWalkRunSigma:(double)a3;
- (id).cxx_construct;
- (void)checkToSendDistancePercentageCoreAnalytics:(double)a3 mobilityDistance:(double)a4 rawSpeed:(double)a5 rawDist:(double)a6;
- (void)feedBodyMetrics:(CLBodyMetrics *)a3;
- (void)sendDistancePercentageCoreAnalytics;
- (void)setGPSKValueTable:(shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)a3;
- (void)setMobilityKValueTable:(shared_ptr<CMMobilityCal::SpeedToKValueTable>)a3;
@end

@implementation CLStepDistanceEstimator

- (CLExtendedStepCountEntry)updateEntryDistanceAndPace:(SEL)a3
{
  double currentPace = a4->currentPace;
  BOOL v8 = currentPace == 0.0
    || self->_lastEntry.base.timestamp == 1.79769313e308
    || vabdd_f64(currentPace, self->_lastEntry.addition.rawPace) > self->_lastEntry.addition.rawPace * 0.15;
  double rawDistance = a4->rawDistance;
  unsigned int count = self->_lastEntry.base.count;
  unsigned int v11 = a4->count;
  unsigned int v12 = v11 - count;
  if (v11 >= count)
  {
    double activeTime = a4->activeTime;
    double v18 = self->_lastEntry.base.activeTime;
    if (activeTime <= v18) {
      double v16 = 0.0;
    }
    else {
      double v16 = activeTime - v18;
    }
    double v94 = v16;
    if (v16 <= 0.0)
    {
      double timestamp = self->_lastEntry.base.timestamp;
      if (a4->timestamp > timestamp) {
        double v16 = a4->timestamp - timestamp;
      }
      else {
        double v16 = 0.0;
      }
    }
  }
  else
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022EF140);
    }
    v13 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
    {
      unsigned int v14 = self->_lastEntry.base.count;
      unsigned int v15 = a4->count;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v14;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#Warning Step count went backwards (%u -> %u). locationd starting? Motion Co-processor reboot?", buf, 0xEu);
    }
    double v16 = 0.0;
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022EF140);
      }
      v85 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStepDistanceEstimator updateEntryDistanceAndPace:]", "%s\n", v85);
      if (v85 != buf) {
        free(v85);
      }
    }
    unsigned int v12 = 0;
    double v94 = 0.0;
  }
  double v20 = (double)v12;
  double v21 = rawDistance * (double)v12;
  a4->double rawDistance = v21;
  double v91 = rawDistance;
  BOOL v22 = rawDistance <= 0.0 || v12 == 0;
  double v23 = 0.0;
  BOOL v24 = v22 || v16 <= 0.0;
  double v25 = v16 / v21;
  if (v24) {
    double v25 = 0.0;
  }
  double v90 = v25;
  if (currentPace <= 0.0) {
    double v26 = v25;
  }
  else {
    double v26 = currentPace;
  }
  double v27 = 1.0;
  double v28 = 1.0;
  double v29 = 1.0;
  if (v26 > 0.0)
  {
    [+[CMPedometerTableRawSpeedToKValue sharedInstance] kValueForRawSpeed:1.0 / v26];
    double v28 = v30;
    ptr = self->_mobilitySpeedToKValueTable.__ptr_;
    if (ptr)
    {
      *(double *)buf = 1.0 / v26;
      v32 = (void *)(**(uint64_t (***)(SpeedToKValueTable *, unsigned char *))ptr)(ptr, buf);
      v33 = v32;
      BOOL v34 = v32 != 0;
      if (v32)
      {
        [v32 mean];
        double v27 = v35;
      }
      v36 = self->_gpsSpeedToKValueTable.__ptr_;
      if (!v36)
      {
        if (!v33) {
          goto LABEL_47;
        }
        goto LABEL_46;
      }
    }
    else
    {
      v36 = self->_gpsSpeedToKValueTable.__ptr_;
      if (!v36)
      {
LABEL_47:
        double v29 = 1.0;
        goto LABEL_48;
      }
      BOOL v34 = 0;
      v33 = 0;
    }
    *(double *)buf = 1.0 / v26;
    v37 = (void *)(**(uint64_t (***)(GPSRawSpeedToKValueTable *, unsigned char *))v36)(v36, buf);
    if (v37)
    {
      v38 = v37;
      [v37 mean];
      double v95 = v39;
      [v38 variance];
      double v29 = 1.0;
      if (!v34) {
        goto LABEL_48;
      }
      double v41 = v40;
      [v33 variance];
      double v92 = v42;
      [v38 variance];
      if (v43 > 0.0)
      {
        [v33 variance];
        if (v44 > 0.0)
        {
          double v29 = (v27 * (1.0 / v92) + 1.0 / v41 * v95) / (1.0 / v41 + 1.0 / v92);
          goto LABEL_48;
        }
      }
      goto LABEL_47;
    }
    double v29 = 1.0;
    if (!v34) {
      goto LABEL_48;
    }
LABEL_46:
    [v33 variance];
    goto LABEL_47;
  }
LABEL_48:
  double v45 = a4->rawDistance;
  double v88 = v29;
  double v89 = v27;
  double v96 = v28 * v45;
  a4->double distance = v28 * v45;
  a4->distanceMobility = v27 * v45;
  a4->distanceFused = v29 * v45;
  a4->double currentPace = currentPace / v28;
  double v93 = fabs(v28 + -1.0);
  if (v93 <= 0.000001) {
    unsigned __int8 v46 = 3;
  }
  else {
    unsigned __int8 v46 = 2;
  }
  *(&a4->falseStepDetectorState.data + 2) = v46;
  v47 = +[CMPedometerTableStepCadenceToStrideLength sharedInstance];
  v48 = v47;
  double currentCadence = a4->currentCadence;
  double v50 = v20 / v16;
  if (v16 <= 0.0) {
    double v50 = 0.0;
  }
  double v87 = v50;
  if (currentCadence <= 0.0) {
    double v51 = v50;
  }
  else {
    double v51 = a4->currentCadence;
  }
  if (v51 > 0.0)
  {
    [(CMPedometerTableStepCadenceToStrideLength *)v47 strideLengthForStepCadence:v51];
    double v23 = v52;
  }
  unsigned int v53 = [(CMPedometerTableStepCadenceToStrideLength *)v48 isCalibrationAvailableForStepCadence:v51];
  BOOL v54 = v53;
  double v55 = v23 * v20;
  if (v12) {
    BOOL v56 = a4->pedometerArmConstrainedState == 0;
  }
  else {
    BOOL v56 = 1;
  }
  unsigned int v57 = !v56;
  if (v23 > 0.0) {
    uint64_t v58 = v57;
  }
  else {
    uint64_t v58 = 0;
  }
  double v59 = v94;
  if (v58 == 1)
  {
    a4->double distance = v55;
    double v60 = 0.0;
    if (v51 > 0.0) {
      double v60 = 1.0 / (v51 * v23);
    }
    a4->double currentPace = v60;
    if (v53) {
      unsigned __int8 v61 = 4;
    }
    else {
      unsigned __int8 v61 = 5;
    }
    *(&a4->falseStepDetectorState.data + 2) = v61;
  }
  else
  {
    double v60 = a4->currentPace;
  }
  a4->accelerometerPace.double calibrated = v60;
  if (v60 != 0.0)
  {
    [(CLStepDistanceEstimator *)self computeWalkRunSigma:1.0 / v60 * 2.23693991];
    double calibrated = a4->accelerometerPace.calibrated;
    a4->accelerometerPace.lowerBound = calibrated / (v63 + 1.0);
    a4->accelerometerPace.upperBound = calibrated / (1.0 - v63);
  }
  double totalCalibratedDistanceMobility = self->_totalCalibratedDistanceMobility;
  self->_totalCalibratedDistance = a4->distance + self->_totalCalibratedDistance;
  self->_double totalCalibratedDistanceMobility = a4->distanceMobility + totalCalibratedDistanceMobility;
  self->_totalCalibratedDistanceFused = a4->distanceFused + self->_totalCalibratedDistanceFused;
  if ([(CLStepDistanceEstimator *)self checkCoreAnalyticsPermissions:v58 rawPaceForLUT:v26])
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022EF140);
    }
    v65 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "Distance Estimate, not in arm constrain and looking to send core analytics.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022EF140);
      }
      v86 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStepDistanceEstimator updateEntryDistanceAndPace:]", "%s\n", v86);
      if (v86 != buf) {
        free(v86);
      }
    }
    [(CLStepDistanceEstimator *)self checkToSendDistancePercentageCoreAnalytics:self->_totalCalibratedDistance mobilityDistance:self->_totalCalibratedDistanceMobility rawSpeed:1.0 / v26 rawDist:a4->rawDistance];
  }
  if (self->_supportsFirstStepTime) {
    p_firstStepTime = (CLExtendedStepCountEntry *)&a4->firstStepTime;
  }
  else {
    p_firstStepTime = &self->_lastEntry;
  }
  double startTime = p_firstStepTime->startTime;
  if (self->_supportsFirstStepTime) {
    double v68 = v94 + a4->firstStepTime;
  }
  else {
    double v68 = a4->startTime;
  }
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022EF140);
  }
  v69 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
  {
    double v71 = a4->timestamp;
    double v70 = a4->startTime;
    double distance = a4->distance;
    double v73 = a4->currentPace;
    int pedometerArmConstrainedState = a4->pedometerArmConstrainedState;
    unsigned int pushCount = a4->pushCount;
    int v76 = *((unsigned __int8 *)&a4->falseStepDetectorState.falseStepDetectorState + 1);
    *(_DWORD *)buf = 134223872;
    *(double *)&buf[4] = v70;
    *(_WORD *)&buf[12] = 2048;
    double v98 = v71;
    __int16 v99 = 2048;
    double v100 = startTime;
    __int16 v101 = 2048;
    double v102 = v68;
    __int16 v103 = 1024;
    unsigned int v104 = v12;
    __int16 v105 = 2048;
    double v106 = distance;
    __int16 v107 = 2048;
    double v108 = v73;
    __int16 v109 = 2048;
    double v110 = v91;
    __int16 v111 = 2048;
    double v112 = v94;
    __int16 v113 = 2048;
    double v114 = currentPace;
    __int16 v115 = 2048;
    double v116 = v90;
    __int16 v117 = 1024;
    BOOL v118 = v8;
    __int16 v119 = 2048;
    double v120 = currentCadence;
    __int16 v121 = 2048;
    double v122 = v87;
    __int16 v123 = 2048;
    double v124 = v28;
    __int16 v125 = 2048;
    double v126 = v89;
    __int16 v127 = 2048;
    double v128 = v88;
    __int16 v129 = 1024;
    int v130 = pedometerArmConstrainedState;
    __int16 v131 = 2048;
    double v132 = v23;
    __int16 v133 = 1024;
    int v134 = v58;
    __int16 v135 = 1024;
    unsigned int v136 = pushCount;
    __int16 v137 = 1024;
    int v138 = v76;
    __int16 v139 = 2048;
    double v140 = v55;
    __int16 v141 = 2048;
    double v142 = v96;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_INFO, "startTime,%f,timestamp,%f,firstStepTime,%f,lastStepTime,%f,stepsDelta,%u,calibratedDistanceDelta,%f,calibratedPace,%f,rawStrideLength,%f,activeTimeDelta,%f,rawPaceCurrent,%f,rawPaceActive,%f,rawPaceDidJump,%d,stepCadenceCurrent,%f,stepCadenceActive,%f,kValue,%f,kValueMobility,%f,KValueFused,%f,pedometerArmConstrainedState,%d,strideLengthFromStepCadence,%f,useStrideLengthFromStepCadence,%d,pushCount,%u,falseStepsSuppressed,%d,stepCadenceDeltaDistance,%.3f,energyDeltaDistance,%.3f,", buf, 0xDAu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022EF140);
    }
    v84 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStepDistanceEstimator updateEntryDistanceAndPace:]", "%s\n", v84);
    if (v84 != buf) {
      free(v84);
    }
  }
  *(_OWORD *)&retstr->addition.rawPaceDidJump = 0u;
  *(_OWORD *)&retstr->addition.lastStepTime = 0u;
  *(_OWORD *)&retstr->addition.incrementalSteps = 0u;
  *(_OWORD *)&retstr->addition.stepCadenceDeltaDistance = 0u;
  *(_OWORD *)&retstr->addition.energyDeltaDistance = 0u;
  long long v77 = *(_OWORD *)&a4->accelerometerPace.lowerBound;
  *(_OWORD *)&retstr->base.isOdometerDistance = *(_OWORD *)&a4->isOdometerDistance;
  *(_OWORD *)&retstr->base.accelerometerPace.lowerBound = v77;
  long long v78 = *(_OWORD *)&a4->elevationDescended;
  *(_OWORD *)&retstr->base.unsigned int pushCount = *(_OWORD *)&a4->pushCount;
  *(_OWORD *)&retstr->base.elevationDescended = v78;
  long long v79 = *(_OWORD *)&a4->floorsAscended;
  *(_OWORD *)&retstr->base.distanceMobility = *(_OWORD *)&a4->distanceMobility;
  *(_OWORD *)&retstr->base.floorsAscended = v79;
  long long v80 = *(_OWORD *)&a4->recordId;
  *(_OWORD *)&retstr->base.double currentCadence = *(_OWORD *)&a4->currentCadence;
  *(_OWORD *)&retstr->base.recordId = v80;
  *(_OWORD *)&retstr->base.double timestamp = *(_OWORD *)&a4->timestamp;
  long long v81 = *(_OWORD *)&a4->distance;
  *(_OWORD *)&retstr->base.firstStepTime = *(_OWORD *)&a4->firstStepTime;
  double v82 = a4->startTime;
  retstr->double startTime = v82;
  *(_OWORD *)&retstr->base.double distance = v81;
  *(_OWORD *)&retstr->addition.totalCalibratedDistance = *(_OWORD *)&self->_totalCalibratedDistance;
  retstr->addition.totalCalibratedDistanceFused = self->_totalCalibratedDistanceFused;
  retstr->addition.rawPace = currentPace;
  retstr->addition.incrementalSteps = v12;
  if (!self->_supportsFirstStepTime) {
    double v59 = v82 - self->_lastEntry.startTime;
  }
  retstr->addition.incrementalActiveTime = v59;
  retstr->addition.lastStepTime = v68;
  retstr->addition.odometerSpeed = -1.0;
  retstr->addition.rawPaceDidJump = v8;
  retstr->addition.calibratedDistance = a4->distance;
  retstr->addition.stepCadenceDeltaDistance = v55;
  retstr->addition.stepCadenceIsCalibrated = v54;
  retstr->addition.energyDeltaDistance = v96;
  retstr->addition.energyIsCalibrated = v93 > 0.000001;
  retstr->addition.timestampOfFirstStep = 0;
  retstr->addition.timestampOfLastStepStrict = 0;
  retstr->addition.firstStepTime = startTime;
  return (CLExtendedStepCountEntry *)memcpy(&self->_lastEntry, retstr, sizeof(self->_lastEntry));
}

- (BOOL)checkCoreAnalyticsPermissions:(BOOL)a3 rawPaceForLUT:(double)a4
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    LOBYTE(v6) = a4 > 0.0 && !a3;
  }
  else
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022EF140);
    }
    v7 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Not sending distance estimate analytics, no IHA permission", buf, 2u);
    }
    BOOL v6 = sub_10013D1A0(115, 2);
    if (v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022EF140);
      }
      BOOL v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStepDistanceEstimator checkCoreAnalyticsPermissions:rawPaceForLUT:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (CLStepDistanceEstimator)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLStepDistanceEstimator;
  id v2 = [(CLStepDistanceEstimator *)&v7 init];
  v3 = (CLStepDistanceEstimator *)v2;
  if (v2)
  {
    *((void *)v2 + 2) = 0x7FEFFFFFFFFFFFFFLL;
    *((_DWORD *)v2 + 10) = -1;
    *((void *)v2 + 46) = 0;
    *((void *)v2 + 47) = 0;
    *((void *)v2 + 45) = 0;
    v4 = (std::__shared_weak_count *)*((void *)v2 + 42);
    v3->_mobilitySpeedToKValueTable.__ptr_ = 0;
    v3->_mobilitySpeedToKValueTable.__cntrl_ = 0;
    if (v4) {
      sub_1000DB0A0(v4);
    }
    cntrl = (std::__shared_weak_count *)v3->_gpsSpeedToKValueTable.__cntrl_;
    v3->_gpsSpeedToKValueTable.__ptr_ = 0;
    v3->_gpsSpeedToKValueTable.__cntrl_ = 0;
    if (cntrl) {
      sub_1000DB0A0(cntrl);
    }
    bzero(v3->_percentErrorCountsPerSpeedBin, 0xA84uLL);
    v3->_supportsFirstStepTime = (sub_1000A16E8() & 2) != 0;
  }
  return v3;
}

- (void)setMobilityKValueTable:(shared_ptr<CMMobilityCal::SpeedToKValueTable>)a3
{
  v4 = *(SpeedToKValueTable **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_mobilitySpeedToKValueTable.__cntrl_;
  self->_mobilitySpeedToKValueTable.__ptr_ = v4;
  self->_mobilitySpeedToKValueTable.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (void)setGPSKValueTable:(shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)a3
{
  v4 = *(GPSRawSpeedToKValueTable **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_gpsSpeedToKValueTable.__cntrl_;
  self->_gpsSpeedToKValueTable.__ptr_ = v4;
  self->_gpsSpeedToKValueTable.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
}

- (void)feedBodyMetrics:(CLBodyMetrics *)a3
{
  long long v3 = *(_OWORD *)&a3->gender;
  long long v4 = *(_OWORD *)&a3->vo2max;
  long long v5 = *(_OWORD *)&a3->hronset;
  *(_OWORD *)&self->_bodyMetrics.runVo2max = *(_OWORD *)&a3->runVo2max;
  *(_OWORD *)&self->_bodyMetrics.vo2max = v4;
  *(_OWORD *)&self->_bodyMetrics.hronset = v5;
  *(_OWORD *)&self->_bodyMetrics.gender = v3;
}

- (double)computeWalkRunSigma:(double)a3
{
  if (a3 <= 4.0) {
    return 0.08;
  }
  if (a3 >= 5.0) {
    return 0.21;
  }
  return (a3 + -4.0) * 0.13 + 0.08;
}

- (void)checkToSendDistancePercentageCoreAnalytics:(double)a3 mobilityDistance:(double)a4 rawSpeed:(double)a5 rawDist:(double)a6
{
  double v8 = 0.0;
  if (a3 != 0.0) {
    double v8 = (a4 - a3) * 100.0 / a3;
  }
  double v9 = a3 / a6;
  if (a6 == 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = v9;
  }
  if (a6 == 0.0) {
    double v11 = 0.0;
  }
  else {
    double v11 = a4 / a6;
  }
  __p = 0;
  double v55 = 0;
  uint64_t v56 = 0;
  sub_1001DD364(&__p, (const void *)qword_102480958, qword_102480960, (qword_102480960 - qword_102480958) >> 3);
  uint64_t v12 = 0;
  if (v55 != __p)
  {
    unint64_t v13 = (v55 - (unsigned char *)__p) >> 3;
    if (v13 <= 1) {
      unint64_t v13 = 1;
    }
    while (*((double *)__p + v12) < a5)
    {
      if (v13 == ++v12)
      {
        LODWORD(v12) = v13;
        break;
      }
    }
  }
  double v51 = 0;
  double v52 = 0;
  uint64_t v53 = 0;
  sub_1001DD364(&v51, (const void *)qword_102480970, qword_102480978, (qword_102480978 - qword_102480970) >> 3);
  percentErrorCountsPerSpeedBin = self->_percentErrorCountsPerSpeedBin;
  unsigned int v15 = v51;
  double v16 = v52;
  if (v52 == v51)
  {
    percentErrorCountsPerSpeedBin[(int)v12][0].__elems_[0] = percentErrorCountsPerSpeedBin[(int)v12][0].__elems_[0]
                                                           + 1.0;
    if (!v16) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v17 = 0;
    unint64_t v18 = (v52 - v51) >> 3;
    if (v18 <= 1) {
      unint64_t v18 = 1;
    }
    while (*(double *)&v51[8 * v17] < v8)
    {
      if (v18 == ++v17)
      {
        LODWORD(v17) = v18;
        break;
      }
    }
    percentErrorCountsPerSpeedBin[(int)v12][(int)v17].__elems_[0] = percentErrorCountsPerSpeedBin[(int)v12][(int)v17].__elems_[0]
                                                                  + 1.0;
  }
  double v52 = v15;
  operator delete(v15);
LABEL_24:
  if (__p)
  {
    double v55 = __p;
    operator delete(__p);
  }
  v48 = 0;
  v49 = 0;
  uint64_t v50 = 0;
  sub_1001DD364(&v48, (const void *)qword_102480958, qword_102480960, (qword_102480960 - qword_102480958) >> 3);
  uint64_t v19 = 0;
  if (v49 != v48)
  {
    unint64_t v20 = (v49 - (unsigned char *)v48) >> 3;
    if (v20 <= 1) {
      unint64_t v20 = 1;
    }
    while (*((double *)v48 + v19) < a5)
    {
      if (v20 == ++v19)
      {
        LODWORD(v19) = v20;
        break;
      }
    }
  }
  double v45 = 0;
  unsigned __int8 v46 = 0;
  uint64_t v47 = 0;
  sub_1001DD364(&v45, (const void *)qword_102480970, qword_102480978, (qword_102480978 - qword_102480970) >> 3);
  double v21 = v45;
  BOOL v22 = v46;
  if (v46 == v45)
  {
    percentErrorCountsPerSpeedBin[(int)v19][0].__elems_[1] = v10
                                                           + percentErrorCountsPerSpeedBin[(int)v19][0].__elems_[1];
    if (!v22) {
      goto LABEL_41;
    }
  }
  else
  {
    uint64_t v23 = 0;
    unint64_t v24 = (v46 - v45) >> 3;
    if (v24 <= 1) {
      unint64_t v24 = 1;
    }
    while (*(double *)&v45[8 * v23] < v8)
    {
      if (v24 == ++v23)
      {
        LODWORD(v23) = v24;
        break;
      }
    }
    uint64_t v25 = (uint64_t)&percentErrorCountsPerSpeedBin[(int)v19][(int)v23];
    *(double *)(v25 + 8) = v10 + *(double *)(v25 + 8);
  }
  unsigned __int8 v46 = v21;
  operator delete(v21);
LABEL_41:
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }
  double v42 = 0;
  double v43 = 0;
  uint64_t v44 = 0;
  sub_1001DD364(&v42, (const void *)qword_102480958, qword_102480960, (qword_102480960 - qword_102480958) >> 3);
  if (v43 == v42)
  {
    int v28 = 0;
  }
  else
  {
    uint64_t v26 = 0;
    unint64_t v27 = (v43 - (unsigned char *)v42) >> 3;
    if (v27 <= 1) {
      unint64_t v27 = 1;
    }
    while (*((double *)v42 + v26) < a5)
    {
      if (v27 == ++v26)
      {
        LODWORD(v26) = v27;
        break;
      }
    }
    int v28 = v26;
  }
  double v39 = 0;
  double v40 = 0;
  uint64_t v41 = 0;
  sub_1001DD364(&v39, (const void *)qword_102480970, qword_102480978, (qword_102480978 - qword_102480970) >> 3);
  double v29 = v39;
  double v30 = v40;
  if (v40 == v39)
  {
    percentErrorCountsPerSpeedBin[v28][0].__elems_[2] = v11 + percentErrorCountsPerSpeedBin[v28][0].__elems_[2];
    if (!v30) {
      goto LABEL_60;
    }
  }
  else
  {
    uint64_t v31 = 0;
    unint64_t v32 = (v40 - v39) >> 3;
    if (v32 <= 1) {
      unint64_t v32 = 1;
    }
    while (*(double *)&v39[8 * v31] < v8)
    {
      if (v32 == ++v31)
      {
        LODWORD(v31) = v32;
        break;
      }
    }
    uint64_t v33 = (uint64_t)&percentErrorCountsPerSpeedBin[v28][(int)v31];
    *(double *)(v33 + 16) = v11 + *(double *)(v33 + 16);
  }
  double v40 = v29;
  operator delete(v29);
LABEL_60:
  if (v42)
  {
    double v43 = v42;
    operator delete(v42);
  }
  int entryCount = self->_entryCount;
  self->_int entryCount = entryCount + 1;
  if (entryCount >= 100)
  {
    self->_int entryCount = 0;
    [(CLStepDistanceEstimator *)self sendDistancePercentageCoreAnalytics];
    bzero(self->_percentErrorCountsPerSpeedBin, 0xA80uLL);
  }
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022EF140);
  }
  double v35 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
  {
    int v36 = self->_entryCount;
    *(_DWORD *)buf = 67109376;
    int v62 = v36;
    __int16 v63 = 2048;
    double v64 = v8;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Distance Estimate, checked to send Core Analytics event. Entry Count:%d, seen error: %f", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022EF140);
    }
    int v37 = self->_entryCount;
    int v57 = 67109376;
    int v58 = v37;
    __int16 v59 = 2048;
    double v60 = v8;
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStepDistanceEstimator checkToSendDistancePercentageCoreAnalytics:mobilityDistance:rawSpeed:rawDist:]", "%s\n", v38);
    if (v38 != (char *)buf) {
      free(v38);
    }
  }
}

- (void)sendDistancePercentageCoreAnalytics
{
  p_bodyMetrics = &self->_bodyMetrics;
  long long v4 = *(_OWORD *)&self->_bodyMetrics.vo2max;
  v32[0] = *(_OWORD *)&self->_bodyMetrics.gender;
  v32[1] = v4;
  v33[0] = *(_OWORD *)&self->_bodyMetrics.hronset;
  *(_OWORD *)((char *)v33 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  int v25 = sub_10146C6F8((uint64_t)v32);
  long long v5 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v30[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v30[1] = v5;
  v31[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  int v6 = sub_1006D40B0((unsigned int *)v30);
  long long v7 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v28[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v28[1] = v7;
  v29[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  *(_OWORD *)((char *)v29 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  int v8 = sub_10146C7A4((uint64_t)v28);
  long long v9 = *(_OWORD *)&p_bodyMetrics->vo2max;
  v26[0] = *(_OWORD *)&p_bodyMetrics->gender;
  v26[1] = v9;
  v27[0] = *(_OWORD *)&p_bodyMetrics->hronset;
  *(_OWORD *)((char *)v27 + 12) = *(_OWORD *)&self->_bodyMetrics.runVo2max;
  int v10 = sub_10146C868((uint64_t)v26);
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022EF140);
  }
  double v11 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109888;
    int v53 = v25;
    __int16 v54 = 1024;
    int v55 = v6;
    __int16 v56 = 1024;
    int v57 = v8;
    __int16 v58 = 1024;
    int v59 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Distance Estimate, age: %d, gender: %d, bmi: %d, userheight: %d.", buf, 0x1Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022EF140);
    }
    int v34 = 67109888;
    int v35 = v25;
    __int16 v36 = 1024;
    int v37 = v6;
    __int16 v38 = 1024;
    int v39 = v8;
    __int16 v40 = 1024;
    int v41 = v10;
    uint64_t v23 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStepDistanceEstimator sendDistancePercentageCoreAnalytics]", "%s\n", v23);
    if (v23 != (char *)buf) {
      free(v23);
    }
  }
  uint64_t v12 = 0;
  unint64_t v13 = &self->_percentErrorCountsPerSpeedBin[0][0].__elems_[2];
  do
  {
    uint64_t v14 = 0;
    unint64_t v24 = v13;
    do
    {
      AnalyticsSendEventLazy();
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022EF140);
      }
      unsigned int v15 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = *((void *)v13 - 2);
        uint64_t v17 = *((void *)v13 - 1);
        uint64_t v18 = *(void *)v13;
        *(_DWORD *)buf = 67111168;
        int v53 = v25;
        __int16 v54 = 1024;
        int v55 = v14;
        __int16 v56 = 1024;
        int v57 = v6;
        __int16 v58 = 1024;
        int v59 = v12;
        __int16 v60 = 1024;
        int v61 = v8;
        __int16 v62 = 1024;
        int v63 = v10;
        __int16 v64 = 2048;
        uint64_t v65 = v16;
        __int16 v66 = 2048;
        uint64_t v67 = v17;
        __int16 v68 = 2048;
        uint64_t v69 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Distance Estimate, sent Core Analytics event. speedLB: - ageGroup %d | distancePercentageErrorBin: %d | gender: %d | speedBin: %d | userBmiBin: %d | userHeightBin: %d | countPerBin: %f | sumRatioGPStoRawDist: %f | sumRatioMobilitytoRawDist: %f", buf, 0x44u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022EF140);
        }
        uint64_t v19 = *((void *)v13 - 2);
        uint64_t v20 = *((void *)v13 - 1);
        uint64_t v21 = *(void *)v13;
        int v34 = 67111168;
        int v35 = v25;
        __int16 v36 = 1024;
        int v37 = v14;
        __int16 v38 = 1024;
        int v39 = v6;
        __int16 v40 = 1024;
        int v41 = v12;
        __int16 v42 = 1024;
        int v43 = v8;
        __int16 v44 = 1024;
        int v45 = v10;
        __int16 v46 = 2048;
        uint64_t v47 = v19;
        __int16 v48 = 2048;
        uint64_t v49 = v20;
        __int16 v50 = 2048;
        uint64_t v51 = v21;
        BOOL v22 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLStepDistanceEstimator sendDistancePercentageCoreAnalytics]", "%s\n", v22);
        if (v22 != (char *)buf) {
          free(v22);
        }
      }
      ++v14;
      v13 += 3;
    }
    while (v14 != 14);
    ++v12;
    unint64_t v13 = v24 + 42;
  }
  while (v12 != 8);
}

- (void).cxx_destruct
{
  cntrl = self->_gpsSpeedToKValueTable.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  long long v4 = self->_mobilitySpeedToKValueTable.__cntrl_;
  if (v4)
  {
    sub_1000DB0A0((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  return self;
}

@end