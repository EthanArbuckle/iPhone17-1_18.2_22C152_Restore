@interface CLBarometerCalibrationBiasEstimator
+ (void)getLocationSampleAltitudeAndUncertainty:(void *)a3 andRefAltitude:(double *)a4 andRefUncertainty:(double *)a5;
- (BOOL)getLastPressureSample:(double *)a3;
- (BOOL)isIHAAuthorized;
- (BOOL)updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5;
- (BiasEstimatorLocation)centroidOfLocationVector:(const void *)a3;
- (CLBarometerCalibrationBiasEstimator)initWithUniverse:(id)a3 delegate:(id)a4 buffers:(void *)a5 contextManager:(id)a6;
- (CLBarometerCalibrationPressureData)getClosestEntryToRefTime:(double)a3 inPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>;
- (double)crossEntropyOfreference:(ReferencePairedWithPressure *)a3;
- (double)getAbsoluteAltitudeUncertainty;
- (id).cxx_construct;
- (id)copyCurrentBias;
- (int)selectReferenceWithReference:(void *)a3 withBaroElevation:(double)a4 betweenStartTime:(double)a5 andEndTime:(double)a6;
- (void)announceMostRecentForcedGPS:(double)a3;
- (void)computeMeanSeaLevelPressureWithRebasingLocationData:(id)a3 referenceMap:(void *)a4 andLocationType:(int)a5;
- (void)cumulateReference:(void *)a3 andRefAltitude:(double)a4 andRefVariance:(double)a5 andBaroElevation:(double)a6 andType:(int)a7;
- (void)dealloc;
- (void)rebaseSignificantElevationWithEndTime:(double)a3;
- (void)retrieveBiasInfo;
- (void)saveBiasInfo;
- (void)sendRebaseAnalyticsWithAltitudeError:(double)a3 andUncertainty:(double)a4 andRefUncertainty:(double)a5 andDemAvailable:(BOOL)a6 andWorkout:(BOOL)a7 andReferenceSource:(int)a8 andCorrection:(double)a9 andDistance:(double)a10;
- (void)sendVisitExitAnalyticsWithDuration:(double)a3 andRebaseEvent:(void *)a4 andUncertaintyAtEntry:(double)a5;
- (void)sendVisitExitWifiImprovementAnalyticsEventWithDuration:(double)a3 uncertaintyAtVisitEntry:(double)a4 uncertaintyAtVisitExit:(double)a5 timeDiffBtwArrivalAndLastRebase:(double)a6;
- (void)updateBiasUncertaintyWithAbsSigElevation:(double)a3 withCompanion:(BOOL)a4;
- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6;
- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5;
- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5;
- (void)updateHistoricalMslpArray:(id)a3;
- (void)updateLoiInfo:(const void *)a3;
- (void)updatePressureUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6;
- (void)updateVisitState:(BOOL)a3 arrivalTime:(double)a4 departureTime:(double)a5;
@end

@implementation CLBarometerCalibrationBiasEstimator

- (void)updateEstimatedWeatherWithCumulativeAscendingDelta:(unsigned int)a3 andDescendingDelta:(unsigned int)a4 andIosTimestamp:(double)a5
{
  double Current = CFAbsoluteTimeGetCurrent();
  double previousCumulativeDeltaIOSTime = self->_previousCumulativeDeltaIOSTime;
  if (previousCumulativeDeltaIOSTime == 1.79769313e308)
  {
    self->_offSetAscendedDelta = a3;
    self->_offSetDescendedDelta = a4;
    double previousCumulativeDeltaIOSTime = a5;
    self->_double previousCumulativeDeltaIOSTime = a5;
  }
  if (vabdd_f64(a5, previousCumulativeDeltaIOSTime) > 18.0) {
    sub_1008AFE94((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
  }
  sub_1000BE33C((unsigned __int16 *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, a3 - self->_offSetAscendedDelta, a4 - self->_offSetDescendedDelta, 1000, (int)[(CLBarometerCalibrationContextClient *)self->_delegate isInVisit], a5);
  self->_double weatherEstimateInMeter = *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)
                                - *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82);
  self->_double previousCumulativeDeltaIOSTime = a5;
  double v25 = 0.0;
  if ([(CLBarometerCalibrationBiasEstimator *)self getLastPressureSample:&v25])
  {
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator minPressure];
    if (v11 == 1.79769313e308
      || ([(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator maxPressure],
          v12 == 1.79769313e308))
    {
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator setMinPressure:v25];
      double v13 = v25;
LABEL_9:
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator setMaxPressure:v13];
      goto LABEL_10;
    }
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator minPressure];
    if (v18 > v25) {
      -[CLMeanSeaLevelPressureEstimator setMinPressure:](self->_meanSeaLevelPressureEstimator, "setMinPressure:");
    }
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator maxPressure];
    double v20 = v19;
    double v13 = v25;
    if (v20 < v25) {
      goto LABEL_9;
    }
  }
LABEL_10:
  if (vabdd_f64(Current, a5) < 10.0 && vabdd_f64(Current, self->_lastTimestampSavedRecovery) > 180.0) {
    [(CLBarometerCalibrationBiasEstimator *)self saveBiasInfo];
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  v14 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    double weatherEstimateInMeter = self->_weatherEstimateInMeter;
    double v16 = *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)
        - *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82);
    double v17 = self->_previousCumulativeDeltaIOSTime;
    *(_DWORD *)buf = 134219008;
    double v37 = weatherEstimateInMeter;
    __int16 v38 = 2048;
    double v39 = v16;
    __int16 v40 = 2048;
    double v41 = v17;
    __int16 v42 = 2048;
    double v43 = (double)a3;
    __int16 v44 = 2048;
    double v45 = (double)a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "weatherEstimateWithRebase is %f weatherEstimateFromSigElevation is %f timestamp is %f cumulativeAscendingDelta is %f cumulativeDescendingDelta is %f", buf, 0x34u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v21 = self->_weatherEstimateInMeter;
    double v22 = *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)
        - *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82);
    double v23 = self->_previousCumulativeDeltaIOSTime;
    int v26 = 134219008;
    double v27 = v21;
    __int16 v28 = 2048;
    double v29 = v22;
    __int16 v30 = 2048;
    double v31 = v23;
    __int16 v32 = 2048;
    double v33 = (double)a3;
    __int16 v34 = 2048;
    double v35 = (double)a4;
    v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateEstimatedWeatherWithCumulativeAscendingDelta:andDescendingDelta:andIosTimestamp:]", "%s\n", v24);
    if (v24 != (char *)buf) {
      free(v24);
    }
  }
}

- (BOOL)getLastPressureSample:(double *)a3
{
  sub_100096374((uint64_t)v9, (void *)self->_dataBuffers + 6);
  uint64_t v4 = v11;
  if (v11)
  {
    v5 = (uint64_t *)(*(void *)(v9[1] + (((unint64_t)(v11 + v10 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                   + 16 * (v11 + v10 - 1));
    uint64_t v7 = *v5;
    v6 = (std::__shared_weak_count *)v5[1];
    if (v6)
    {
      atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
      *a3 = *(double *)(v7 + 8) * 1000.0;
      sub_1000DB0A0(v6);
    }
    else
    {
      *a3 = *(double *)(v7 + 8) * 1000.0;
    }
  }
  sub_1000DAF68(v9);
  return v4 != 0;
}

- (void)updatePressureUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
  if (a5 != 1.79769313e308 && a6 != 1.79769313e308)
  {
    double latitude = self->_biasLocation.latitude;
    if (latitude != 1.79769313e308)
    {
      double v13 = fabs(sub_1000A3D9C(latitude, self->_biasLocation.longitude, a5, a6));
      self->_double pressureUncertainty = self->_pressureUncertainty + v13 * 0.00200000009;
      self->_double distanceTraveled = v13;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      v14 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        double distanceTraveled = self->_distanceTraveled;
        double pressureUncertainty = self->_pressureUncertainty;
        *(_DWORD *)buf = 134218496;
        *(double *)__int16 v40 = distanceTraveled;
        *(_WORD *)&v40[8] = 2048;
        *(double *)&v40[10] = distanceTraveled * 0.00200000009;
        *(_WORD *)&v40[18] = 2048;
        *(double *)&v40[20] = pressureUncertainty;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "updated pressure uncertainty due to distance %f by %f uncertainty now is %f", buf, 0x20u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        double v37 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v37);
        if (v37 != (char *)buf) {
          free(v37);
        }
      }
    }
    self->_biasLocation.double latitude = a5;
    self->_biasLocation.longitude = a6;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v17 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)__int16 v40 = a5;
      *(_WORD *)&v40[8] = 2048;
      *(double *)&v40[10] = a6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "updated bias location latitude %f longitude %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      __int16 v34 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v34);
      if (v34 != (char *)buf) {
        free(v34);
      }
    }
  }
  if (self->_biasUncertaintyTimestamp < a4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (vabdd_f64(Current, a4) < 10.0)
    {
      self->_BOOL inVisitStatus = [(CLBarometerCalibrationContextClient *)self->_delegate isInVisit];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v19 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        BOOL inVisitStatus = self->_inVisitStatus;
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)__int16 v40 = inVisitStatus;
        *(_WORD *)&v40[4] = 2048;
        *(double *)&v40[6] = a4;
        *(_WORD *)&v40[14] = 2048;
        *(double *)&v40[16] = Current;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "updated visit status for bias estimator, %d, step count timestamp, %f, current time, %f", buf, 0x1Cu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        __int16 v38 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v38);
        if (v38 != (char *)buf) {
          free(v38);
        }
      }
    }
    if (*((_DWORD *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 154)) {
      double v21 = 0.0277777778;
    }
    else {
      double v21 = dbl_101D2A490[!self->_inVisitStatus];
    }
    float v22 = a3;
    BOOL v23 = sub_1001C1F30(v22, 101320.0) < 3000.0;
    double v24 = 0.05;
    if (v23) {
      double v24 = v21;
    }
    if (a4 - self->_biasUncertaintyTimestamp <= 60.0) {
      double v25 = v24;
    }
    else {
      double v25 = 0.0;
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    int v26 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      int v27 = *((_DWORD *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 154);
      BOOL v28 = self->_inVisitStatus;
      float v29 = sub_1001C1F30(v22, 101320.0);
      *(_DWORD *)buf = 134218752;
      *(double *)__int16 v40 = v25;
      *(_WORD *)&v40[8] = 1024;
      *(_DWORD *)&v40[10] = v27;
      *(_WORD *)&v40[14] = 1024;
      *(_DWORD *)&v40[16] = v28;
      *(_WORD *)&v40[20] = 2048;
      *(double *)&v40[22] = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "updated weather drift due to time, %f, sig elev state, %d, inVisit, %d, altitude %f", buf, 0x22u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      sub_1001C1F30(v22, 101320.0);
      double v35 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
    }
    self->_double pressureUncertainty = self->_pressureUncertainty + v25 * (a4 - self->_biasUncertaintyTimestamp);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    __int16 v30 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      double biasTimestamp = self->_biasTimestamp;
      double biasUncertaintyTimestamp = self->_biasUncertaintyTimestamp;
      double v33 = self->_pressureUncertainty;
      *(_DWORD *)buf = 134219008;
      *(double *)__int16 v40 = a4;
      *(_WORD *)&v40[8] = 2048;
      *(double *)&v40[10] = biasTimestamp;
      *(_WORD *)&v40[18] = 2048;
      *(double *)&v40[20] = biasUncertaintyTimestamp;
      *(_WORD *)&v40[28] = 2048;
      double v41 = v25 * (a4 - biasUncertaintyTimestamp);
      __int16 v42 = 2048;
      double v43 = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "updated pressure uncertainty due to time: timestamp %f _biasTimestamp %f _biasUncertaintyTimestamp %f by %f uncertainty now is %f", buf, 0x34u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      v36 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updatePressureUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }
    self->_double biasUncertaintyTimestamp = a4;
  }
}

- (void)updateBiasUncertaintyWithPressure:(double)a3 andTime:(double)a4 andLat:(double)a5 andLon:(double)a6
{
  if (self->_biasUncertaintyTimestamp == 1.79769313e308)
  {
    sub_100096374((uint64_t)buf, (void *)self->_dataBuffers + 6);
    if (!*((void *)&v49 + 1))
    {
      sub_1000DAF68(buf);
      return;
    }
    uint64_t v11 = *(void *)(*(void *)&v46[4] + (((unint64_t)v49 >> 5) & 0x7FFFFFFFFFFFFF8))
        + 16 * v49;
    double v13 = *(double **)v11;
    double v12 = *(std::__shared_weak_count **)(v11 + 8);
    if (v12)
    {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      self->_double biasUncertaintyTimestamp = *v13;
      self->_float biasPressure = v13[1] * 1000.0;
      sub_1000DB0A0(v12);
    }
    else
    {
      self->_double biasUncertaintyTimestamp = *v13;
      self->_float biasPressure = v13[1] * 1000.0;
    }
    sub_1000DAF68(buf);
  }
  [(CLBarometerCalibrationBiasEstimator *)self updatePressureUncertaintyWithPressure:a3 andTime:a4 andLat:a5 andLon:a6];
  float v14 = a3;
  double v15 = sub_1001C1428(v14, 0.0065, 288.15);
  double v16 = fabs(self->_pressureUncertainty);
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  double v17 = v16 * v15;
  double v18 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    float v19 = a3;
    float v20 = sub_1001C1428(v19, 0.0065, 288.15);
    double v21 = fabs(self->_pressureUncertainty);
    *(_DWORD *)buf = 134218752;
    *(double *)v46 = v17;
    *(_WORD *)&v46[8] = 2048;
    *(double *)&v46[10] = v20;
    __int16 v47 = 2048;
    double v48 = v21;
    LOWORD(v49) = 2048;
    *(double *)((char *)&v49 + 2) = a3;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "term1 %f, dElevationdPresure(pmeas) %f std::abs(_pressureUncertainty) %f pmeas %f", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    float v39 = a3;
    sub_1001C1428(v39, 0.0065, 288.15);
    __int16 v40 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v40);
    if (v40 != (char *)buf) {
      free(v40);
    }
  }
  float biasPressure = self->_biasPressure;
  double v23 = sub_10006CC8C(biasPressure);
  double v24 = vabdd_f64(a3, self->_biasPressure);
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  double v25 = v24 * v23;
  int v26 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    float v27 = self->_biasPressure;
    float v28 = sub_10006CC8C(v27);
    double v29 = vabdd_f64(a3, self->_biasPressure);
    *(_DWORD *)buf = 134218496;
    *(double *)v46 = v25;
    *(_WORD *)&v46[8] = 2048;
    *(double *)&v46[10] = v28;
    __int16 v47 = 2048;
    double v48 = v29;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "term2 %f, slopeDiffDElevationDPressure(pbias) %f std::abs(pressure - _biasPressure) %f", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    float v41 = self->_biasPressure;
    sub_10006CC8C(v41);
    __int16 v42 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v42);
    if (v42 != (char *)buf) {
      free(v42);
    }
  }
  float v30 = a3;
  double v31 = sub_10006CC8C(v30);
  double v32 = fabs(self->_pressureUncertainty);
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  double v33 = v32 * v31;
  __int16 v34 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    float v35 = sub_10006CC8C(v14);
    double v36 = fabs(self->_pressureUncertainty);
    *(_DWORD *)buf = 134218496;
    *(double *)v46 = v33;
    *(_WORD *)&v46[8] = 2048;
    *(double *)&v46[10] = v35;
    __int16 v47 = 2048;
    double v48 = v36;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "term3 %f, slopeDiffDElevationDPressure(pmeas) %f std::abs(_pressureUncertainty %f", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    sub_10006CC8C(v14);
    double v43 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v43);
    if (v43 != (char *)buf) {
      free(v43);
    }
  }
  self->_double biasUncertainty = fabs(v33) + fabs(v25) + fabs(v17) + self->_biasUncertaintyAtRebase;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  double v37 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    double biasUncertainty = self->_biasUncertainty;
    *(_DWORD *)buf = 134217984;
    *(double *)v46 = biasUncertainty;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "total bias uncertainty %f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    __int16 v44 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithPressure:andTime:andLat:andLon:]", "%s\n", v44);
    if (v44 != (char *)buf) {
      free(v44);
    }
  }
}

- (void)saveBiasInfo
{
  if (self->_biasTimestamp != 1.79769313e308)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(CLBarometerCalibrationBiasEstimator *)self getAbsoluteAltitudeUncertainty];
    double v26 = v3;
    double v6 = sub_1008B00B0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v3, v4, v5);
    if (v6 == 1.79769313e308) {
      double v6 = -800.0;
    }
    double v25 = v6;
    uint64_t v7 = sub_1000A6958();
    sub_10016332C(v7, "CLBarometerCalibration_Timestamp", &Current);
    uint64_t v8 = sub_1000A6958();
    p_bias = &self->_bias;
    sub_10016332C(v8, "CLBarometerCalibratio_Bias", &self->_bias);
    uint64_t v10 = sub_1000A6958();
    sub_10016332C(v10, "CLBarometerCalibration_Uncertainty", &v26);
    uint64_t v11 = sub_1000A6958();
    p_double weatherEstimateInMeter = &self->_weatherEstimateInMeter;
    sub_10016332C(v11, "CLBarometerCalibration_Weather", &self->_weatherEstimateInMeter);
    uint64_t v13 = sub_1000A6958();
    sub_10016332C(v13, "CLBarometerCalibration_SignificantElevation", &v25);
    uint64_t v14 = sub_1000A6958();
    p_float biasPressure = &self->_biasPressure;
    sub_10016332C(v14, "CLBarometerCalibration_BiasPressure", &self->_biasPressure);
    uint64_t v16 = *(void *)sub_1000A6958();
    (*(void (**)(void))(v16 + 944))();
    self->_lastTimestampSavedRecovery = Current;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v17 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)p_bias;
      uint64_t v19 = *(void *)p_weatherEstimateInMeter;
      uint64_t v20 = *(void *)p_biasPressure;
      *(_DWORD *)buf = 134219264;
      double v41 = Current;
      __int16 v42 = 2048;
      uint64_t v43 = v18;
      __int16 v44 = 2048;
      double v45 = v26;
      __int16 v46 = 2048;
      uint64_t v47 = v19;
      __int16 v48 = 2048;
      double v49 = v25;
      __int16 v50 = 2048;
      uint64_t v51 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "saving rebase info to cache, timestamp %f, bias, %f, uncertainty, %f, weather estimate, %f, sig elevation, %f, pressure, %f", buf, 0x3Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      uint64_t v21 = *(void *)p_bias;
      uint64_t v22 = *(void *)p_weatherEstimateInMeter;
      uint64_t v23 = *(void *)p_biasPressure;
      int v28 = 134219264;
      double v29 = Current;
      __int16 v30 = 2048;
      uint64_t v31 = v21;
      __int16 v32 = 2048;
      double v33 = v26;
      __int16 v34 = 2048;
      uint64_t v35 = v22;
      __int16 v36 = 2048;
      double v37 = v25;
      __int16 v38 = 2048;
      uint64_t v39 = v23;
      double v24 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator saveBiasInfo]", "%s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
  }
}

- (CLBarometerCalibrationBiasEstimator)initWithUniverse:(id)a3 delegate:(id)a4 buffers:(void *)a5 contextManager:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)CLBarometerCalibrationBiasEstimator;
  v9 = [(CLBarometerCalibrationBiasEstimator *)&v11 init];
  if (v9)
  {
    v9->_delegate = (CLBarometerCalibrationContextClient *)a4;
    v9->_universe = (CLIntersiloUniverse *)a3;
    v9->_dataBuffers = a5;
    *(_OWORD *)&v9->_float biasPressure = xmmword_101D2A440;
    *(_OWORD *)&v9->_double biasUncertaintyTimestamp = xmmword_101D2A450;
    v9->_estimatedMeanSeaLevelPressure = 101325.0;
    *(_OWORD *)&v9->_double weatherEstimateInMeter = xmmword_101D2A460;
    *(_OWORD *)&v9->_previousBiasTimestamp = xmmword_101D2A430;
    v9->_double pressureUncertainty = 0.0;
    v9->_double distanceTraveled = 0.0;
    *(_OWORD *)&v9->_distanceSinceLastRebase = xmmword_101D2A470;
    *(void *)&v9->_offSetAscendedDelta = 0;
    v9->_double previousCumulativeDeltaIOSTime = 1.79769313e308;
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  self->_delegate = 0;
  self->_universe = 0;
  self->_meanSeaLevelPressureEstimator = 0;
  self->_queriedMeanSeaLevelPressureData = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLBarometerCalibrationBiasEstimator;
  [(CLBarometerCalibrationBiasEstimator *)&v3 dealloc];
}

- (id)copyCurrentBias
{
  objc_super v3 = objc_opt_new();
  [v3 setTimestamp:self->_biasTimestamp];
  [v3 setBiasInMeters:self->_bias];
  if ([(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator getMeanSeaLevelArrayCount])
  {
    [(CLBarometerCalibrationBiasEstimator *)self getAbsoluteAltitudeUncertainty];
  }
  else
  {
    double v4 = 500.0;
  }
  [v3 setUncertaintyInMeters:v4];
  [v3 setEstimatedMeanSeaLevelPressure:self->_estimatedMeanSeaLevelPressure];
  [v3 setEstimatedUncertainty:self->_estimatedAbsoluteAltitudeUncertainty];
  [v3 setWeatherEstimateInMeter:*((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 79)- *((double *)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ + 82)];
  [v3 setPreviousCumulativeDeltaIOSTime:(unint64_t)self->_previousCumulativeDeltaIOSTime];
  [v3 setStatusInfo:0];
  return v3;
}

- (CLBarometerCalibrationPressureData)getClosestEntryToRefTime:(double)a3 inPressureQueue:()deque<std:(std::allocator<std::shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>>> *)a4 :shared_ptr<CLBarometerCalibration_Types::CLBarometerCalibrationData>
{
  begin = a4->__map_.__begin_;
  if (a4->__map_.__end_ != begin)
  {
    unint64_t start = a4->__start_;
    double v6 = &begin[start >> 8];
    uint64_t v7 = (char *)*v6 + 16 * start;
    uint64_t v8 = *(uint64_t *)((char *)begin + (((a4->__size_.__value_ + start) >> 5) & 0x7FFFFFFFFFFFFF8))
       + 16 * (LOBYTE(a4->__size_.__value_) + start);
    if (v7 != (char *)v8)
    {
      double v10 = 1.79769313e308;
      *(double *)&uint64_t v11 = 1.79769313e308;
      double v12 = 1.79769313e308;
      while (1)
      {
        uint64_t v14 = *(void *)v7;
        uint64_t v13 = (std::__shared_weak_count *)*((void *)v7 + 1);
        if (v13) {
          atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        double v15 = vabdd_f64(a3, *(double *)v14);
        if (v15 < v10 && v15 <= 5.0) {
          break;
        }
        if (v15 <= v10) {
          goto LABEL_14;
        }
        int v17 = 0;
        if (v13) {
          goto LABEL_15;
        }
LABEL_16:
        if (v17)
        {
          v7 += 16;
          if (v7 - (unsigned char *)*v6 == 4096)
          {
            uint64_t v18 = (char *)v6[1];
            ++v6;
            uint64_t v7 = v18;
          }
          if (v7 != (char *)v8) {
            continue;
          }
        }
        if (v10 != 1.79769313e308) {
          goto LABEL_29;
        }
        goto LABEL_23;
      }
      uint64_t v11 = *(uint64_t *)(v14 + 8);
      double v12 = *(double *)v14;
      double v10 = v15;
LABEL_14:
      int v17 = 1;
      if (!v13) {
        goto LABEL_16;
      }
LABEL_15:
      sub_1000DB0A0(v13);
      goto LABEL_16;
    }
  }
  *(double *)&uint64_t v11 = 1.79769313e308;
LABEL_23:
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  uint64_t v19 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "pressure too far from reference data", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator getClosestEntryToRefTime:inPressureQueue:]", "%s\n", v24);
    if (v24 != (char *)buf) {
      free(v24);
    }
  }
  double v12 = 1.79769313e308;
LABEL_29:
  double v20 = 1.79769313e308;
  double v21 = v12;
  double v22 = *(double *)&v11;
  double v23 = 1.79769313e308;
  result.var3 = v23;
  result.var2 = v20;
  result.var1 = v22;
  result.var0 = v21;
  return result;
}

- (double)getAbsoluteAltitudeUncertainty
{
  return fmin(self->_biasUncertainty, 500.0);
}

- (double)crossEntropyOfreference:(ReferencePairedWithPressure *)a3
{
  double v5 = 1.0;
  double v6 = (a3->var0.var0 - a3->var1.var0) * (a3->var0.var0 - a3->var1.var0);
  if (!self->_inVisitStatus) {
    double v5 = v6 / (v6 + *(double *)&qword_10247CDD8);
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  uint64_t v7 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inVisitStatus = self->_inVisitStatus;
    *(_DWORD *)buf = 136315906;
    double v15 = "crossEntropyWeighting";
    __int16 v16 = 2048;
    double v17 = v5;
    __int16 v18 = 2080;
    uint64_t v19 = "inVisitStatus";
    __int16 v20 = 1024;
    BOOL v21 = inVisitStatus;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "cross entropy weighting,%s,%f,%s,%d", buf, 0x26u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    uint64_t v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator crossEntropyOfreference:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  double var1 = a3->var0.var1;
  double v10 = log(var1 * 17.0794684);
  double v11 = a3->var1.var1;
  return v10 + v5 * ((v6 + var1) / v11 + log(v11 / var1) + -1.0);
}

+ (void)getLocationSampleAltitudeAndUncertainty:(void *)a3 andRefAltitude:(double *)a4 andRefUncertainty:(double *)a5
{
  uint64_t v5 = *(void *)a3;
  uint64_t v6 = 24;
  if (*(double *)(*(void *)a3 + 120) > 0.0) {
    uint64_t v6 = 112;
  }
  *a4 = *(double *)(v5 + v6);
  uint64_t v7 = 40;
  if (*(double *)(v5 + 120) > 0.0) {
    uint64_t v7 = 120;
  }
  *a5 = *(double *)(v5 + v7);
}

- (void)cumulateReference:(void *)a3 andRefAltitude:(double)a4 andRefVariance:(double)a5 andBaroElevation:(double)a6 andType:(int)a7
{
  int v25 = a7;
  if (a5 <= 9.0 || a7 != 4)
  {
    double v12 = (char *)a3 + 8;
    uint64_t v13 = (char *)*((void *)a3 + 1);
    if (!v13) {
      goto LABEL_15;
    }
    uint64_t v14 = (char *)a3 + 8;
    do
    {
      int v15 = *((_DWORD *)v13 + 8);
      BOOL v16 = v15 < a7;
      if (v15 >= a7) {
        double v17 = (char **)v13;
      }
      else {
        double v17 = (char **)(v13 + 8);
      }
      if (!v16) {
        uint64_t v14 = v13;
      }
      uint64_t v13 = *v17;
    }
    while (*v17);
    if (v14 == v12 || *((_DWORD *)v14 + 8) > a7) {
LABEL_15:
    }
      uint64_t v14 = (char *)a3 + 8;
    if (a5 > 0.0 && v14 == v12)
    {
      int v24 = 0;
      memset(v23, 0, sizeof(v23));
      sub_1006CDDC4((uint64_t **)a3, &v25, &v25, (uint64_t)v23);
    }
    if (a5 > 0.0)
    {
      uint64_t v19 = sub_1000A43BC((uint64_t)a3, &v25);
      *(double *)uint64_t v19 = *(double *)v19 + a4;
      __int16 v20 = sub_1000A43BC((uint64_t)a3, &v25);
      *((double *)v20 + 1) = *((double *)v20 + 1) + a5;
      BOOL v21 = sub_1000A43BC((uint64_t)a3, &v25);
      *((double *)v21 + 2) = *((double *)v21 + 2) + a6;
      double v22 = sub_1000A43BC((uint64_t)a3, &v25);
      ++*((_DWORD *)v22 + 8);
    }
  }
}

- (BiasEstimatorLocation)centroidOfLocationVector:(const void *)a3
{
  objc_super v3 = *(double **)a3;
  double v4 = (double *)*((void *)a3 + 1);
  if (*(double **)a3 == v4) {
    goto LABEL_14;
  }
  unint64_t v5 = 0;
  double v6 = 0.0;
  double v7 = 0.0;
  do
  {
    if (*v3 != 1.79769313e308)
    {
      double v8 = v3[1];
      if (v8 != 1.79769313e308)
      {
        double v6 = v6 + *v3;
        double v7 = v7 + v8;
        ++v5;
      }
    }
    v3 += 2;
  }
  while (v3 != v4);
  if (!v5)
  {
LABEL_14:
    double v10 = 1.79769313e308;
    double v11 = 1.79769313e308;
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v16 = v6 / (double)v5;
      __int16 v17 = 2048;
      double v18 = v7 / (double)v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "new centroid: latitude %f, longitude %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v10 = v6 / (double)v5;
      double v11 = v7 / (double)v5;
      uint64_t v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator centroidOfLocationVector:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    else
    {
      double v10 = v6 / (double)v5;
      double v11 = v7 / (double)v5;
    }
  }
  double v12 = v10;
  double v13 = v11;
  result.longitude = v13;
  result.double latitude = v12;
  return result;
}

- (BOOL)updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
  p_dataBuffers = &self->_dataBuffers;
  sub_100096374((uint64_t)&v183, (void *)self->_dataBuffers);
  sub_100096374((uint64_t)&v178, (void *)*p_dataBuffers + 6);
  double v10 = 0.0;
  double v11 = &qword_102419000;
  if (v185 == v184
    || (double v12 = (void *)(v184 + 8 * (v186 >> 8)),
        double v13 = (double **)(*v12 + 16 * v186),
        uint64_t v14 = *(void *)(v184 + (((v187 + v186) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v187 + v186),
        v13 == (double **)v14))
  {
    int v90 = 0;
    int v91 = 0;
    int v92 = 0;
    double v16 = 0;
    double v93 = 0.0;
    double v94 = 0.0;
    double v95 = 0.0;
    double v170 = 0.0;
    double v172 = 0.0;
    goto LABEL_83;
  }
  unint64_t v171 = 0;
  uint64_t v168 = 0;
  int v173 = 0;
  int v15 = 0;
  double v16 = 0;
  double v169 = 0.0;
  double v166 = 0.0;
  double v167 = 0.0;
  double v165 = 0.0;
  double v170 = 0.0;
  double v172 = 0.0;
  double v17 = 0.0;
  double v18 = 0.0;
  do
  {
    uint64_t v19 = *v13;
    double v20 = **v13;
    if (v20 < a3 || v20 >= a4) {
      goto LABEL_37;
    }
    double v22 = (std::__shared_weak_count *)v13[1];
    v176 = *v13;
    v177 = v22;
    if (v22) {
      atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (*((_DWORD *)v19 + 25) == 1) {
      v173 += (*((unsigned __int16 *)v19 + 65) >> 1) & 1;
    }
    if (v180 != v179)
    {
      double v23 = (void *)(v179 + 8 * (v181 >> 8));
      uint64_t v24 = *v23 + 16 * v181;
      uint64_t v25 = *(void *)(v179 + (((v182 + v181) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v182 + v181);
      if (v24 != v25)
      {
        double v26 = 1.79769313e308;
        do
        {
          float v27 = *(double **)v24;
          double v28 = vabdd_f64(**v13, **(double **)v24);
          if (v28 < v26 && v28 <= 5.0)
          {
            __int16 v30 = *(std::__shared_weak_count **)(v24 + 8);
            if (v30) {
              atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            if (v16) {
              sub_1000DB0A0(v16);
            }
            double v16 = v30;
            int v15 = v27;
            double v26 = v28;
          }
          v24 += 16;
          if (v24 - *v23 == 4096)
          {
            uint64_t v31 = v23[1];
            ++v23;
            uint64_t v24 = v31;
          }
        }
        while (v24 != v25);
        if (v26 != 1.79769313e308)
        {
          float v37 = v15[1] * 1000.0;
          double v11 = &qword_102419000;
          float v38 = sub_1001C1F30(v37, 101320.0);
          double v174 = -1.0;
          double v175 = 1.79769313e308;
          +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:&v176 andRefAltitude:&v175 andRefUncertainty:&v174];
          if ((*((_DWORD *)v176 + 25) & 0x80000000) == 0 && **v13 < a5)
          {
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            uint64_t v39 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
            {
              int v40 = *((_DWORD *)v176 + 25);
              uint64_t v41 = *(void *)*v13;
              uint64_t v42 = *(void *)v15;
              uint64_t v43 = *((void *)v176 + 4);
              uint64_t v45 = *((void *)v176 + 6);
              uint64_t v44 = *((void *)v176 + 7);
              *(_DWORD *)buf = 136319490;
              v207 = "type";
              __int16 v208 = 1024;
              *(_DWORD *)v209 = v40;
              *(_WORD *)&v209[4] = 2080;
              *(void *)&v209[6] = "locTime";
              *(_WORD *)&v209[14] = 2048;
              *(void *)&v209[16] = v41;
              *(_WORD *)&v209[24] = 2080;
              *(void *)&v209[26] = "pressureTime";
              *(_WORD *)&v209[34] = 2048;
              *(void *)&v209[36] = v42;
              *(_WORD *)&v209[44] = 2080;
              *(void *)&v209[46] = "locationAlt";
              *(_WORD *)&v209[54] = 2048;
              *(double *)&v209[56] = v175;
              *(_WORD *)&v209[64] = 2080;
              *(void *)&v209[66] = "pressureAlt";
              *(_WORD *)&v209[74] = 2048;
              *(double *)&v209[76] = v38;
              *(_WORD *)&v209[84] = 2080;
              *(void *)&v209[86] = "locVerticalUnc";
              *(_WORD *)&v209[94] = 2048;
              *(double *)&v209[96] = v174;
              *(_WORD *)&v209[104] = 2080;
              *(void *)&v209[106] = "locHorizontalUnc";
              *(_WORD *)&v209[114] = 2048;
              *(void *)&v209[116] = v43;
              __int16 v210 = 2080;
              v211 = "demAlt";
              __int16 v212 = 2048;
              *(void *)v213 = v45;
              *(_WORD *)&v213[8] = 2080;
              *(void *)&v213[10] = "demVerticalUnc";
              *(_WORD *)&v213[18] = 2048;
              *(void *)&v213[20] = v44;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0xB2u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_1022C4A70);
              }
              int v70 = *((_DWORD *)v176 + 25);
              uint64_t v71 = *(void *)*v13;
              uint64_t v72 = *(void *)v15;
              uint64_t v73 = *((void *)v176 + 4);
              uint64_t v75 = *((void *)v176 + 6);
              uint64_t v74 = *((void *)v176 + 7);
              int v188 = 136319490;
              v189 = "type";
              __int16 v190 = 1024;
              *(_DWORD *)v191 = v70;
              *(_WORD *)&v191[4] = 2080;
              *(void *)&v191[6] = "locTime";
              *(_WORD *)&v191[14] = 2048;
              *(void *)&v191[16] = v71;
              *(_WORD *)&v191[24] = 2080;
              *(void *)&v191[26] = "pressureTime";
              *(_WORD *)&v191[34] = 2048;
              *(void *)&v191[36] = v72;
              *(_WORD *)&v191[44] = 2080;
              *(void *)&v191[46] = "locationAlt";
              *(_WORD *)&v191[54] = 2048;
              *(double *)&v191[56] = v175;
              *(_WORD *)&v191[64] = 2080;
              *(void *)&v191[66] = "pressureAlt";
              *(_WORD *)&v191[74] = 2048;
              *(double *)&v191[76] = v38;
              *(_WORD *)&v191[84] = 2080;
              *(void *)&v191[86] = "locVerticalUnc";
              *(_WORD *)&v191[94] = 2048;
              *(double *)&v191[96] = v174;
              *(_WORD *)&v191[104] = 2080;
              *(void *)&v191[106] = "locHorizontalUnc";
              *(_WORD *)&v191[114] = 2048;
              *(void *)&v191[116] = v73;
              __int16 v192 = 2080;
              v193 = "demAlt";
              __int16 v194 = 2048;
              *(void *)v195 = v75;
              *(_WORD *)&v195[8] = 2080;
              *(void *)&v195[10] = "demVerticalUnc";
              *(_WORD *)&v195[18] = 2048;
              *(void *)&v195[20] = v74;
              v76 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v76);
              if (v76 != (char *)buf) {
                free(v76);
              }
            }
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            __int16 v46 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v47 = *((void *)v176 + 1);
              uint64_t v48 = *((void *)v176 + 2);
              uint64_t v49 = *((void *)v176 + 8);
              uint64_t v50 = *((void *)v176 + 9);
              uint64_t v51 = *((void *)v176 + 10);
              uint64_t v52 = *((void *)v176 + 11);
              int v53 = *((_DWORD *)v176 + 24);
              int v54 = *((_DWORD *)v176 + 26);
              uint64_t v55 = *((void *)v176 + 3);
              double v56 = v176[5];
              double v57 = v176[14];
              uint64_t v58 = *((void *)v176 + 15);
              *(_DWORD *)buf = 136321026;
              v207 = "lat";
              __int16 v208 = 2048;
              *(void *)v209 = v47;
              *(_WORD *)&v209[8] = 2080;
              *(void *)&v209[10] = "lon";
              *(_WORD *)&v209[18] = 2048;
              *(void *)&v209[20] = v48;
              *(_WORD *)&v209[28] = 2080;
              *(void *)&v209[30] = "slope";
              *(_WORD *)&v209[38] = 2048;
              *(void *)&v209[40] = v49;
              *(_WORD *)&v209[48] = 2080;
              *(void *)&v209[50] = "maxAbsSlope";
              *(_WORD *)&v209[58] = 2048;
              *(void *)&v209[60] = v50;
              *(_WORD *)&v209[68] = 2080;
              *(void *)&v209[70] = "speed";
              *(_WORD *)&v209[78] = 2048;
              *(void *)&v209[80] = v51;
              *(_WORD *)&v209[88] = 2080;
              *(void *)&v209[90] = "speedAccuracy";
              *(_WORD *)&v209[98] = 2048;
              *(void *)&v209[100] = v52;
              *(_WORD *)&v209[108] = 2080;
              *(void *)&v209[110] = "environment";
              *(_WORD *)&v209[118] = 1024;
              *(_DWORD *)&v209[120] = v53;
              __int16 v210 = 2080;
              v211 = "matchQuality";
              __int16 v212 = 1024;
              *(_DWORD *)v213 = v54;
              *(_WORD *)&v213[4] = 2080;
              *(void *)&v213[6] = "altitude";
              *(_WORD *)&v213[14] = 2048;
              *(void *)&v213[16] = v55;
              *(_WORD *)&v213[24] = 2080;
              *(void *)&v213[26] = "verticalAccuracy";
              __int16 v214 = 2048;
              double v215 = v56;
              __int16 v216 = 2080;
              v217 = "rawAltitude";
              __int16 v218 = 2048;
              double v219 = v57;
              __int16 v220 = 2080;
              v221 = "rawVerticalAccuracy";
              __int16 v222 = 2048;
              uint64_t v223 = v58;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "unused location data,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0xEAu);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_1022C4A70);
              }
              uint64_t v77 = *((void *)v176 + 1);
              uint64_t v78 = *((void *)v176 + 2);
              uint64_t v79 = *((void *)v176 + 8);
              uint64_t v80 = *((void *)v176 + 9);
              uint64_t v81 = *((void *)v176 + 10);
              uint64_t v82 = *((void *)v176 + 11);
              int v83 = *((_DWORD *)v176 + 24);
              int v84 = *((_DWORD *)v176 + 26);
              uint64_t v85 = *((void *)v176 + 3);
              double v86 = v176[5];
              double v87 = v176[14];
              uint64_t v88 = *((void *)v176 + 15);
              int v188 = 136321026;
              v189 = "lat";
              __int16 v190 = 2048;
              *(void *)v191 = v77;
              *(_WORD *)&v191[8] = 2080;
              *(void *)&v191[10] = "lon";
              *(_WORD *)&v191[18] = 2048;
              *(void *)&v191[20] = v78;
              *(_WORD *)&v191[28] = 2080;
              *(void *)&v191[30] = "slope";
              *(_WORD *)&v191[38] = 2048;
              *(void *)&v191[40] = v79;
              *(_WORD *)&v191[48] = 2080;
              *(void *)&v191[50] = "maxAbsSlope";
              *(_WORD *)&v191[58] = 2048;
              *(void *)&v191[60] = v80;
              *(_WORD *)&v191[68] = 2080;
              *(void *)&v191[70] = "speed";
              *(_WORD *)&v191[78] = 2048;
              *(void *)&v191[80] = v81;
              *(_WORD *)&v191[88] = 2080;
              *(void *)&v191[90] = "speedAccuracy";
              *(_WORD *)&v191[98] = 2048;
              *(void *)&v191[100] = v82;
              *(_WORD *)&v191[108] = 2080;
              *(void *)&v191[110] = "environment";
              *(_WORD *)&v191[118] = 1024;
              *(_DWORD *)&v191[120] = v83;
              __int16 v192 = 2080;
              v193 = "matchQuality";
              __int16 v194 = 1024;
              *(_DWORD *)v195 = v84;
              *(_WORD *)&v195[4] = 2080;
              *(void *)&v195[6] = "altitude";
              *(_WORD *)&v195[14] = 2048;
              *(void *)&v195[16] = v85;
              *(_WORD *)&v195[24] = 2080;
              *(void *)&v195[26] = "verticalAccuracy";
              __int16 v196 = 2048;
              double v197 = v86;
              __int16 v198 = 2080;
              v199 = "rawAltitude";
              __int16 v200 = 2048;
              double v201 = v87;
              __int16 v202 = 2080;
              v203 = "rawVerticalAccuracy";
              __int16 v204 = 2048;
              uint64_t v205 = v88;
              v89 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v89);
              if (v89 != (char *)buf) {
                free(v89);
              }
            }
          }
          double v59 = v176[1];
          if (v59 != 1.79769313e308)
          {
            double v60 = v176[2];
            BOOL v61 = v60 == 1.79769313e308;
            double v62 = v17 + v59;
            double v63 = v18 + v60;
            if (!v61)
            {
              double v18 = v63;
              double v17 = v62;
            }
            unint64_t v64 = v171;
            if (!v61) {
              unint64_t v64 = v171 + 1;
            }
            unint64_t v171 = v64;
          }
          if (*((_DWORD *)v176 + 25) == 1)
          {
            double v65 = v176[7];
            if (v65 > 0.0)
            {
              ++HIDWORD(v168);
              double v166 = v166 + v65;
              double v167 = v167 + v176[6];
              double v165 = v165 + v175;
              double v169 = v169 + v38;
              double v170 = v170 + v174;
              double v172 = v172 + v15[1] * 1000.0;
              LODWORD(v168) = v168 + (*((_WORD *)v176 + 65) & 1);
            }
          }
          goto LABEL_35;
        }
        double v11 = &qword_102419000;
      }
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    __int16 v32 = v11[61];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      double v33 = *(const char **)*v13;
      uint64_t v34 = **(void **)(*(void *)(v179 + ((v181 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v181);
      uint64_t v35 = **(void **)(*(void *)(v179 + (((v181 + v182 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                        + 16 * (v181 + v182 - 1));
      *(_DWORD *)buf = 134219264;
      v207 = v33;
      __int16 v208 = 2048;
      *(void *)v209 = v34;
      *(_WORD *)&v209[8] = 2048;
      *(void *)&v209[10] = v35;
      *(_WORD *)&v209[18] = 2048;
      *(double *)&v209[20] = a3;
      *(_WORD *)&v209[28] = 2048;
      *(double *)&v209[30] = a4;
      *(_WORD *)&v209[38] = 2048;
      *(double *)&v209[40] = a5;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "pressure too far from reference data,locationTime,%f,firstPsTime,%f,lastPsTime,%f,startTime,%f,endTime,%f,nextTrackStartTime,%f", buf, 0x3Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      v66 = *(const char **)*v13;
      uint64_t v67 = **(void **)(*(void *)(v179 + ((v181 >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * v181);
      uint64_t v68 = **(void **)(*(void *)(v179 + (((v181 + v182 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                        + 16 * (v181 + v182 - 1));
      int v188 = 134219264;
      v189 = v66;
      __int16 v190 = 2048;
      *(void *)v191 = v67;
      *(_WORD *)&v191[8] = 2048;
      *(void *)&v191[10] = v68;
      *(_WORD *)&v191[18] = 2048;
      *(double *)&v191[20] = a3;
      *(_WORD *)&v191[28] = 2048;
      *(double *)&v191[30] = a4;
      *(_WORD *)&v191[38] = 2048;
      *(double *)&v191[40] = a5;
      v69 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v69);
      if (v69 != (char *)buf) {
        free(v69);
      }
    }
LABEL_35:
    if (v177) {
      sub_1000DB0A0(v177);
    }
LABEL_37:
    v13 += 2;
    if ((double **)((char *)v13 - *v12) == (double **)4096)
    {
      __int16 v36 = (double **)v12[1];
      ++v12;
      double v13 = v36;
    }
  }
  while (v13 != (double **)v14);
  if (v171)
  {
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator setCurrentLatitude:v17 / (double)v171];
    double v10 = v169;
    int v91 = v168;
    int v90 = HIDWORD(v168);
    double v94 = v166;
    double v93 = v167;
    double v95 = v165;
    int v92 = v173;
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator setCurrentLongitude:v18 / (double)v171];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    v96 = v11[61];
    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator currentLatitude];
      v98 = v97;
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator currentLongitude];
      *(_DWORD *)buf = 134218240;
      v207 = v98;
      __int16 v208 = 2048;
      *(void *)v209 = v99;
      _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "update mean sea level pressure location,lat,%f,lon,%f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator currentLatitude];
      v162 = v161;
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator currentLongitude];
      int v188 = 134218240;
      v189 = v162;
      __int16 v190 = 2048;
      *(void *)v191 = v163;
      v164 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v164);
      if (v164 != (char *)buf) {
        free(v164);
      }
      double v11 = &qword_102419000;
      double v10 = v169;
      int v91 = v168;
      int v90 = HIDWORD(v168);
      double v94 = v166;
      double v93 = v167;
      double v95 = v165;
      int v92 = v173;
    }
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator refreshHistoricalMeanSeaLevelPressureWithStartTime:a4 + -10800.0 andEndTime:a4];
  }
  else
  {
    double v10 = v169;
    int v91 = v168;
    int v90 = HIDWORD(v168);
    double v94 = v166;
    double v93 = v167;
    double v95 = v165;
    int v92 = v173;
  }
LABEL_83:
  self->_BOOL inOutdoorWorkoutStatus = v92 > 119;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  v100 = v11[61];
  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
  {
    BOOL inOutdoorWorkoutStatus = self->_inOutdoorWorkoutStatus;
    *(_DWORD *)buf = 136316930;
    v207 = "inOutdoorWorkoutPoint";
    __int16 v208 = 1024;
    *(_DWORD *)v209 = v92;
    *(_WORD *)&v209[4] = 2080;
    *(void *)&v209[6] = "inOutdoorWorkoutStatus";
    *(_WORD *)&v209[14] = 1024;
    *(_DWORD *)&v209[16] = inOutdoorWorkoutStatus;
    *(_WORD *)&v209[20] = 2080;
    *(void *)&v209[22] = "trackStartTime";
    *(_WORD *)&v209[30] = 2048;
    *(double *)&v209[32] = a3;
    *(_WORD *)&v209[40] = 2080;
    *(void *)&v209[42] = "trackEndTime";
    *(_WORD *)&v209[50] = 2048;
    *(double *)&v209[52] = a4;
    _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "in outdoor workout info,%s,%u,%s,%d,%s,%f,%s,%f", buf, 0x4Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    BOOL v146 = self->_inOutdoorWorkoutStatus;
    int v188 = 136316930;
    v189 = "inOutdoorWorkoutPoint";
    __int16 v190 = 1024;
    *(_DWORD *)v191 = v92;
    *(_WORD *)&v191[4] = 2080;
    *(void *)&v191[6] = "inOutdoorWorkoutStatus";
    *(_WORD *)&v191[14] = 1024;
    *(_DWORD *)&v191[16] = v146;
    *(_WORD *)&v191[20] = 2080;
    *(void *)&v191[22] = "trackStartTime";
    *(_WORD *)&v191[30] = 2048;
    *(double *)&v191[32] = a3;
    *(_WORD *)&v191[40] = 2080;
    *(void *)&v191[42] = "trackEndTime";
    *(_WORD *)&v191[50] = 2048;
    *(double *)&v191[52] = a4;
    v147 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v147);
    if (v147 != (char *)buf) {
      free(v147);
    }
  }
  if (!v90)
  {
LABEL_102:
    BOOL v122 = 0;
    if (!v16) {
      goto LABEL_104;
    }
LABEL_103:
    sub_1000DB0A0(v16);
    goto LABEL_104;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  v102 = v11[61];
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v207 = "GPSBasedDEMPoints";
    __int16 v208 = 1024;
    *(_DWORD *)v209 = v90;
    *(_WORD *)&v209[4] = 2080;
    *(void *)&v209[6] = "underDEMPoints";
    *(_WORD *)&v209[14] = 1024;
    *(_DWORD *)&v209[16] = v91;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "under Dem or latched high data points check,%s,%d,%s,%d", buf, 0x22u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    int v188 = 136315906;
    v189 = "GPSBasedDEMPoints";
    __int16 v190 = 1024;
    *(_DWORD *)v191 = v90;
    *(_WORD *)&v191[4] = 2080;
    *(void *)&v191[6] = "underDEMPoints";
    *(_WORD *)&v191[14] = 1024;
    *(_DWORD *)&v191[16] = v91;
    v148 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v148);
    if (v148 != (char *)buf) {
      free(v148);
    }
  }
  v103 = objc_opt_new();
  [v103 setTimestamp:a4];
  if (v90 == v91)
  {
    double v104 = v10 / (double)v91;
    double v105 = v93 / (double)v91;
    double v106 = v94 / (double)v91;
    double bias = self->_bias;
    double weatherEstimateInMeter = self->_weatherEstimateInMeter;
    self->_double biasUncertaintyAtRebase = v106;
    double v109 = v172 / (double)v91;
    self->_double bias = v105 - v104;
    self->_float biasPressure = v109;
    float v110 = v105;
    float v111 = v109;
    float v112 = sub_1014BE5D0(v110, v111);
    self->_estimatedAbsoluteAltitudeUncertainty = v106;
    self->_estimatedMeanSeaLevelPressure = v112;
    float biasPressure = self->_biasPressure;
    float v114 = v105;
    [v103 setUncertainty:v106 * sub_1014BE664(v114, biasPressure)];
    [v103 setMeanSeaLevelPressure:self->_estimatedMeanSeaLevelPressure];
    double v115 = v104 + bias - weatherEstimateInMeter - v105;
    uint64_t v116 = 4294967294;
    goto LABEL_105;
  }
  double v104 = v10 / (double)v90;
  double v117 = v93 / (double)v90;
  double v118 = v95 / (double)v90;
  double v119 = v170 / (double)v90;
  double v120 = v104 + self->_bias - self->_weatherEstimateInMeter;
  if (v120 <= v117 + 100.0 || v120 <= v119 + v118)
  {

    goto LABEL_102;
  }
  self->_double biasUncertaintyAtRebase = v119;
  double v124 = v172 / (double)v90;
  self->_double bias = v118 - v104;
  self->_float biasPressure = v124;
  float v125 = v118;
  float v126 = v124;
  float v127 = sub_1014BE5D0(v125, v126);
  self->_estimatedAbsoluteAltitudeUncertainty = v119;
  self->_estimatedMeanSeaLevelPressure = v127;
  float v128 = self->_biasPressure;
  float v129 = v118;
  [v103 setUncertainty:v119 * sub_1014BE664(v129, v128)];
  [v103 setMeanSeaLevelPressure:self->_estimatedMeanSeaLevelPressure];
  double v115 = v120 - v118;
  uint64_t v116 = 4294967293;
LABEL_105:
  self->_forceCalibrate = 1;
  [(CLBarometerCalibrationBiasEstimator *)self updateHistoricalMslpArray:v103];
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  v130 = v11[61];
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
  {
    [v103 meanSeaLevelPressure];
    uint64_t v132 = v131;
    [v103 uncertainty];
    uint64_t v134 = v133;
    [v103 timestamp];
    *(_DWORD *)buf = 136317954;
    v207 = "type";
    __int16 v208 = 1024;
    *(_DWORD *)v209 = v116;
    *(_WORD *)&v209[4] = 2080;
    *(void *)&v209[6] = "meanSeaLevelPressure";
    *(_WORD *)&v209[14] = 2048;
    *(void *)&v209[16] = v132;
    *(_WORD *)&v209[24] = 2080;
    *(void *)&v209[26] = "uncertainty";
    *(_WORD *)&v209[34] = 2048;
    *(void *)&v209[36] = v134;
    *(_WORD *)&v209[44] = 2080;
    *(void *)&v209[46] = "timestamp";
    *(_WORD *)&v209[54] = 2048;
    *(void *)&v209[56] = v135;
    *(_WORD *)&v209[64] = 2080;
    *(void *)&v209[66] = "startAt";
    *(_WORD *)&v209[74] = 2048;
    *(double *)&v209[76] = a3;
    *(_WORD *)&v209[84] = 2080;
    *(void *)&v209[86] = "endAt";
    *(_WORD *)&v209[94] = 2048;
    *(double *)&v209[96] = a4;
    _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_DEFAULT, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x76u);
  }
  v136 = &qword_102419000;
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    [v103 meanSeaLevelPressure];
    uint64_t v150 = v149;
    [v103 uncertainty];
    uint64_t v152 = v151;
    [v103 timestamp];
    int v188 = 136317954;
    v189 = "type";
    __int16 v190 = 1024;
    *(_DWORD *)v191 = v116;
    *(_WORD *)&v191[4] = 2080;
    *(void *)&v191[6] = "meanSeaLevelPressure";
    *(_WORD *)&v191[14] = 2048;
    *(void *)&v191[16] = v150;
    *(_WORD *)&v191[24] = 2080;
    *(void *)&v191[26] = "uncertainty";
    *(_WORD *)&v191[34] = 2048;
    *(void *)&v191[36] = v152;
    *(_WORD *)&v191[44] = 2080;
    *(void *)&v191[46] = "timestamp";
    *(_WORD *)&v191[54] = 2048;
    *(void *)&v191[56] = v153;
    *(_WORD *)&v191[64] = 2080;
    *(void *)&v191[66] = "startAt";
    *(_WORD *)&v191[74] = 2048;
    *(double *)&v191[76] = a3;
    *(_WORD *)&v191[84] = 2080;
    *(void *)&v191[86] = "endAt";
    *(_WORD *)&v191[94] = 2048;
    *(double *)&v191[96] = a4;
    v154 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v154);
    if (v154 != (char *)buf) {
      free(v154);
    }
    v136 = &qword_102419000;
  }

  self->_double biasTimestamp = a4;
  self->_double pressureUncertainty = 0.0;
  self->_double distanceTraveled = 0.0;
  self->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  sub_1008B045C((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
  [(CLBarometerCalibrationBiasEstimator *)self rebaseSignificantElevationWithEndTime:a4];
  [(CLBarometerCalibrationBiasEstimator *)self updateBiasUncertaintyWithAbsSigElevation:0 withCompanion:sub_1008B00B0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v137, v138, v139)];
  [(CLBarometerCalibrationBiasEstimator *)self sendRebaseAnalyticsWithAltitudeError:1 andUncertainty:self->_inOutdoorWorkoutStatus andRefUncertainty:v116 andDemAvailable:v115 andWorkout:self->_biasUncertainty andReferenceSource:self->_biasUncertaintyAtRebase andCorrection:v115 andDistance:self->_distanceSinceLastRebase];
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  v140 = v136[61];
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
  {
    double v141 = self->_bias;
    double biasUncertaintyAtRebase = self->_biasUncertaintyAtRebase;
    double biasUncertainty = self->_biasUncertainty;
    double v144 = self->_weatherEstimateInMeter;
    BOOL v145 = self->_inOutdoorWorkoutStatus;
    *(_DWORD *)buf = 136320514;
    v207 = "type";
    __int16 v208 = 1024;
    *(_DWORD *)v209 = v116;
    *(_WORD *)&v209[4] = 2080;
    *(void *)&v209[6] = "newBias";
    *(_WORD *)&v209[14] = 2048;
    *(double *)&v209[16] = v141;
    *(_WORD *)&v209[24] = 2080;
    *(void *)&v209[26] = "newBiasUncertainty";
    *(_WORD *)&v209[34] = 2048;
    *(double *)&v209[36] = biasUncertaintyAtRebase;
    *(_WORD *)&v209[44] = 2080;
    *(void *)&v209[46] = "oldBaroAltitude";
    *(_WORD *)&v209[54] = 2048;
    *(double *)&v209[56] = v104;
    *(_WORD *)&v209[64] = 2080;
    *(void *)&v209[66] = "oldRefAltitude";
    *(_WORD *)&v209[74] = 2048;
    *(double *)&v209[76] = v104 + v141;
    *(_WORD *)&v209[84] = 2080;
    *(void *)&v209[86] = "oldBaroUncertainty";
    *(_WORD *)&v209[94] = 2048;
    *(double *)&v209[96] = biasUncertainty;
    *(_WORD *)&v209[104] = 2080;
    *(void *)&v209[106] = "oldRefUncertainty";
    *(_WORD *)&v209[114] = 2048;
    *(double *)&v209[116] = biasUncertaintyAtRebase;
    __int16 v210 = 2080;
    v211 = "weatherEstimateInMeter";
    __int16 v212 = 2048;
    *(double *)v213 = v144;
    *(_WORD *)&v213[8] = 2080;
    *(void *)&v213[10] = "inOutdoorWorkout";
    *(_WORD *)&v213[18] = 1024;
    *(_DWORD *)&v213[20] = v145;
    *(_WORD *)&v213[24] = 2080;
    *(void *)&v213[26] = "calculatedFromTrackStartAt";
    __int16 v214 = 2048;
    double v215 = a3;
    __int16 v216 = 2080;
    v217 = "endAt";
    __int16 v218 = 2048;
    double v219 = a4;
    _os_log_impl((void *)&_mh_execute_header, v140, OS_LOG_TYPE_DEFAULT, "pressure height rebase to,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%d,%s,%f,%s,%f", buf, 0xD6u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v155 = self->_bias;
    double v156 = self->_biasUncertaintyAtRebase;
    double v157 = self->_biasUncertainty;
    double v158 = self->_weatherEstimateInMeter;
    BOOL v159 = self->_inOutdoorWorkoutStatus;
    int v188 = 136320514;
    v189 = "type";
    __int16 v190 = 1024;
    *(_DWORD *)v191 = v116;
    *(_WORD *)&v191[4] = 2080;
    *(void *)&v191[6] = "newBias";
    *(_WORD *)&v191[14] = 2048;
    *(double *)&v191[16] = v155;
    *(_WORD *)&v191[24] = 2080;
    *(void *)&v191[26] = "newBiasUncertainty";
    *(_WORD *)&v191[34] = 2048;
    *(double *)&v191[36] = v156;
    *(_WORD *)&v191[44] = 2080;
    *(void *)&v191[46] = "oldBaroAltitude";
    *(_WORD *)&v191[54] = 2048;
    *(double *)&v191[56] = v104;
    *(_WORD *)&v191[64] = 2080;
    *(void *)&v191[66] = "oldRefAltitude";
    *(_WORD *)&v191[74] = 2048;
    *(double *)&v191[76] = v104 + v155;
    *(_WORD *)&v191[84] = 2080;
    *(void *)&v191[86] = "oldBaroUncertainty";
    *(_WORD *)&v191[94] = 2048;
    *(double *)&v191[96] = v157;
    *(_WORD *)&v191[104] = 2080;
    *(void *)&v191[106] = "oldRefUncertainty";
    *(_WORD *)&v191[114] = 2048;
    *(double *)&v191[116] = v156;
    __int16 v192 = 2080;
    v193 = "weatherEstimateInMeter";
    __int16 v194 = 2048;
    *(double *)v195 = v158;
    *(_WORD *)&v195[8] = 2080;
    *(void *)&v195[10] = "inOutdoorWorkout";
    *(_WORD *)&v195[18] = 1024;
    *(_DWORD *)&v195[20] = v159;
    *(_WORD *)&v195[24] = 2080;
    *(void *)&v195[26] = "calculatedFromTrackStartAt";
    __int16 v196 = 2048;
    double v197 = a3;
    __int16 v198 = 2080;
    v199 = "endAt";
    __int16 v200 = 2048;
    double v201 = a4;
    v160 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v160);
    if (v160 != (char *)buf) {
      free(v160);
    }
  }
  self->_forceCalibrate = 0;
  BOOL v122 = 1;
  if (v16) {
    goto LABEL_103;
  }
LABEL_104:
  sub_1000DAF68(&v178);
  sub_1000DAF68(&v183);
  return v122;
}

- (void)updateElevationBiasBetweenStartTime:(double)a3 andEndTime:(double)a4 andNextTrackStartTime:(double)a5
{
  double v5 = a4;
  double v6 = a3;
  if (a4 - a3 <= 1800.0)
  {
    double v10 = self;
    p_dataBuffers = &self->_dataBuffers;
    sub_100096374((uint64_t)&v305, (void *)self->_dataBuffers);
    sub_100096374((uint64_t)&v300, (void *)*p_dataBuffers + 6);
    sub_100096374((uint64_t)&v295, (void *)v10->_dataBuffers + 24);
    double v294 = 0.0;
    if (![(CLBarometerCalibrationBiasEstimator *)v10 getLastPressureSample:&v294])
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      int v70 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(double *)v331 = v6;
        *(_WORD *)&v331[8] = 2048;
        *(double *)&v331[10] = v5;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "filtered pressure queue is empty,startTime,%f,endTime,%f", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        int v310 = 134218240;
        *(double *)v311 = v6;
        *(_WORD *)&v311[8] = 2048;
        *(double *)&v311[10] = v5;
        uint64_t v71 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v71);
        if (v71 != (char *)buf) {
          free(v71);
        }
      }
      goto LABEL_246;
    }
    [(CLMeanSeaLevelPressureEstimator *)v10->_meanSeaLevelPressureEstimator setNumberOfTrackEndedBtwRefresh:[(CLMeanSeaLevelPressureEstimator *)v10->_meanSeaLevelPressureEstimator numberOfTrackEndedBtwRefresh]+ 1];
    if ([(CLBarometerCalibrationBiasEstimator *)v10 updateElevationBiasUnderDEMOrLatchedHighBetweenStartTime:v6 andEndTime:v5 andNextTrackStartTime:a5])
    {
LABEL_246:
      sub_1000DAF68(&v295);
      sub_1000DAF68(&v300);
      sub_1000DAF68(&v305);
      return;
    }
    __p = 0;
    v292 = 0;
    v293 = 0;
    v274 = v10;
    double v271 = v6;
    double v272 = v5;
    if (v297 == v296
      || (double v12 = (void *)(v296 + 8 * (v298 >> 8)),
          uint64_t v13 = *v12 + 16 * v298,
          uint64_t v14 = *(void *)(v296 + (((v299 + v298) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v299 + v298),
          v13 == v14))
    {
      int v15 = 0;
      double v16 = 0;
      goto LABEL_96;
    }
    int v277 = 0;
    int v15 = 0;
    double v16 = 0;
    double v17 = 0.0;
    double v18 = &qword_102419000;
    double v19 = 0.0;
    double v275 = 0.0;
    double v276 = 0.0;
    double v20 = 0.0;
    uint64_t v278 = *(void *)(v296 + (((v299 + v298) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v299 + v298);
    while (1)
    {
      BOOL v21 = *(double **)v13;
      double v22 = **(double **)v13;
      if (v22 >= v6 && v22 < v5) {
        break;
      }
LABEL_64:
      v13 += 16;
      if (v13 - *v12 == 4096)
      {
        uint64_t v56 = v12[1];
        ++v12;
        uint64_t v13 = v56;
      }
      if (v13 == v14)
      {
        if (v277)
        {
          double v144 = v274;
          BOOL v145 = objc_opt_new();
          double v146 = (double)v277;
          v274->_double biasTimestamp = v5;
          double v147 = v275 / (double)v277;
          v274->_double bias = v17 / (double)v277;
          v274->_float biasPressure = v147;
          v274->_double biasUncertaintyAtRebase = v20 / (double)v277;
          double v148 = v276 / (double)v277;
          float v149 = v148;
          *(float *)&double v147 = v147;
          float v150 = sub_1014BE5D0(v149, *(float *)&v147);
          v274->_double estimatedAbsoluteAltitudeUncertainty = v274->_biasUncertaintyAtRebase;
          v274->_estimatedMeanSeaLevelPressure = v150;
          float biasPressure = v274->_biasPressure;
          float v152 = v148;
          [v145 setUncertainty:v274->_biasUncertaintyAtRebase * sub_1014BE664(v152, biasPressure)];
          [v145 setMeanSeaLevelPressure:v274->_estimatedMeanSeaLevelPressure];
          [v145 setTimestamp:v5];
          v274->_companionRebase = 1;
          [(CLBarometerCalibrationBiasEstimator *)v274 updateHistoricalMslpArray:v145];
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          uint64_t v153 = v18[61];
          if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
          {
            [v145 meanSeaLevelPressure];
            uint64_t v155 = v154;
            [v145 uncertainty];
            uint64_t v157 = v156;
            [v145 timestamp];
            *(_DWORD *)buf = 136317954;
            *(void *)v331 = "type";
            *(_WORD *)&v331[8] = 1024;
            *(_DWORD *)&v331[10] = -1;
            *(_WORD *)&v331[14] = 2080;
            *(void *)&v331[16] = "meanSeaLevelPressure";
            *(_WORD *)&v331[24] = 2048;
            *(void *)&v331[26] = v155;
            *(_WORD *)&v331[34] = 2080;
            *(void *)&v331[36] = "uncertainty";
            *(_WORD *)&v331[44] = 2048;
            *(void *)&v331[46] = v157;
            *(_WORD *)&v331[54] = 2080;
            *(void *)&v331[56] = "timestamp";
            __int16 v332 = 2048;
            double v333 = v158;
            __int16 v334 = 2080;
            *(void *)v335 = "startAt";
            *(_WORD *)&v335[8] = 2048;
            *(double *)&v335[10] = v6;
            *(_WORD *)&v335[18] = 2080;
            *(void *)&v335[20] = "endAt";
            __int16 v336 = 2048;
            double v337 = v5;
            _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_DEFAULT, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x76u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            [v145 meanSeaLevelPressure];
            uint64_t v256 = v255;
            [v145 uncertainty];
            uint64_t v258 = v257;
            [v145 timestamp];
            int v310 = 136317954;
            *(void *)v311 = "type";
            *(_WORD *)&v311[8] = 1024;
            *(_DWORD *)&v311[10] = -1;
            *(_WORD *)&v311[14] = 2080;
            *(void *)&v311[16] = "meanSeaLevelPressure";
            *(_WORD *)&v311[24] = 2048;
            *(void *)&v311[26] = v256;
            *(_WORD *)&v311[34] = 2080;
            *(void *)&v311[36] = "uncertainty";
            *(_WORD *)&v311[44] = 2048;
            *(void *)&v311[46] = v258;
            *(_WORD *)&v311[54] = 2080;
            *(void *)&v311[56] = "timestamp";
            __int16 v312 = 2048;
            double v313 = v259;
            __int16 v314 = 2080;
            *(void *)v315 = "startAt";
            *(_WORD *)&v315[8] = 2048;
            *(double *)&v315[10] = v271;
            *(_WORD *)&v315[18] = 2080;
            *(void *)&v315[20] = "endAt";
            __int16 v316 = 2048;
            double v317 = v272;
            v260 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v260);
            if (v260 != (char *)buf) {
              free(v260);
            }
            double v144 = v274;
            double v18 = &qword_102419000;
            double v6 = v271;
            double v5 = v272;
          }

          v144->_double pressureUncertainty = 0.0;
          v144->_double distanceTraveled = 0.0;
          v144->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
          sub_1008B045C((uint64_t)v144->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          BOOL v159 = v18[61];
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
          {
            double bias = v144->_bias;
            double biasUncertaintyAtRebase = v144->_biasUncertaintyAtRebase;
            double biasUncertainty = v144->_biasUncertainty;
            double weatherEstimateInMeter = v144->_weatherEstimateInMeter;
            BOOL inOutdoorWorkoutStatus = v144->_inOutdoorWorkoutStatus;
            *(_DWORD *)buf = 67111680;
            *(_DWORD *)v331 = -1;
            *(_WORD *)&v331[4] = 2048;
            *(double *)&v331[6] = bias;
            *(_WORD *)&v331[14] = 2048;
            *(double *)&v331[16] = biasUncertaintyAtRebase;
            *(_WORD *)&v331[24] = 2048;
            *(double *)&v331[26] = v19 / v146;
            *(_WORD *)&v331[34] = 2048;
            *(double *)&v331[36] = v276 / (double)v277;
            *(_WORD *)&v331[44] = 2048;
            *(double *)&v331[46] = biasUncertainty;
            *(_WORD *)&v331[54] = 2048;
            *(double *)&v331[56] = biasUncertaintyAtRebase;
            __int16 v332 = 2048;
            double v333 = weatherEstimateInMeter;
            __int16 v334 = 1024;
            *(_DWORD *)v335 = inOutdoorWorkoutStatus;
            *(_WORD *)&v335[4] = 2048;
            *(double *)&v335[6] = v6;
            *(_WORD *)&v335[14] = 2048;
            *(double *)&v335[16] = v5;
            _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", buf, 0x68u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            double v261 = v274->_bias;
            double v262 = v274->_biasUncertaintyAtRebase;
            double v263 = v274->_biasUncertainty;
            double v264 = v274->_weatherEstimateInMeter;
            BOOL v265 = v274->_inOutdoorWorkoutStatus;
            int v310 = 67111680;
            *(_DWORD *)v311 = -1;
            *(_WORD *)&v311[4] = 2048;
            *(double *)&v311[6] = v261;
            *(_WORD *)&v311[14] = 2048;
            *(double *)&v311[16] = v262;
            *(_WORD *)&v311[24] = 2048;
            *(double *)&v311[26] = v19 / v146;
            *(_WORD *)&v311[34] = 2048;
            *(double *)&v311[36] = v276 / (double)v277;
            *(_WORD *)&v311[44] = 2048;
            *(double *)&v311[46] = v263;
            *(_WORD *)&v311[54] = 2048;
            *(double *)&v311[56] = v262;
            __int16 v312 = 2048;
            double v313 = v264;
            __int16 v314 = 1024;
            *(_DWORD *)v315 = v265;
            *(_WORD *)&v315[4] = 2048;
            *(double *)&v315[6] = v271;
            *(_WORD *)&v315[14] = 2048;
            *(double *)&v315[16] = v272;
            v266 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v266);
            if (v266 != (char *)buf) {
              free(v266);
            }
            double v144 = v274;
            double v18 = &qword_102419000;
            double v5 = v272;
          }
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          double v165 = v18[61];
          if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
          {
            double v166 = v144->_bias;
            double v167 = v144->_biasPressure;
            double biasTimestamp = v144->_biasTimestamp;
            *(_DWORD *)buf = 134219008;
            *(double *)v331 = v166;
            *(_WORD *)&v331[8] = 2048;
            *(double *)&v331[10] = v19 / v146;
            *(_WORD *)&v331[18] = 2048;
            *(double *)&v331[20] = v276 / (double)v277;
            *(_WORD *)&v331[28] = 2048;
            *(double *)&v331[30] = v167;
            *(_WORD *)&v331[38] = 2048;
            *(double *)&v331[40] = biasTimestamp;
            _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_DEFAULT, "new bias calculated from companion is %f, average baroAlt %f, average companion alt %f, average pressure %f, timestamp %f", buf, 0x34u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            double v267 = v274->_bias;
            double v268 = v274->_biasPressure;
            double v269 = v274->_biasTimestamp;
            int v310 = 134219008;
            *(double *)v311 = v267;
            *(_WORD *)&v311[8] = 2048;
            *(double *)&v311[10] = v19 / v146;
            *(_WORD *)&v311[18] = 2048;
            *(double *)&v311[20] = v276 / (double)v277;
            *(_WORD *)&v311[28] = 2048;
            *(double *)&v311[30] = v268;
            *(_WORD *)&v311[38] = 2048;
            *(double *)&v311[40] = v269;
            v270 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v270);
            if (v270 != (char *)buf) {
              free(v270);
            }
            double v144 = v274;
            double v5 = v272;
          }
          [(CLBarometerCalibrationBiasEstimator *)v144 rebaseSignificantElevationWithEndTime:v5];
          [(CLBarometerCalibrationBiasEstimator *)v144 updateBiasUncertaintyWithAbsSigElevation:1 withCompanion:sub_1008B00B0((uint64_t)v144->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v169, v170, v171)];
          id v172 = [(CLBarometerCalibrationContextClient *)v144->_delegate latestAbsoluteAltitude];
          int v173 = v172;
          if (v172)
          {
            [v172 timestamp];
            if (v174 != 1.79769313e308)
            {
              [v173 altitude];
              double v176 = v175;
              double v177 = v144->_biasUncertainty;
              double v178 = v144->_biasUncertaintyAtRebase;
              BOOL v179 = v144->_inOutdoorWorkoutStatus;
              [v173 altitude];
              [(CLBarometerCalibrationBiasEstimator *)v144 sendRebaseAnalyticsWithAltitudeError:0 andUncertainty:v179 andRefUncertainty:0xFFFFFFFFLL andDemAvailable:v176 - v148 andWorkout:v177 andReferenceSource:v178 andCorrection:v180 - v148 andDistance:v144->_distanceSinceLastRebase];
            }
          }
          v144->_companionRebase = 0;
          goto LABEL_242;
        }
        double v10 = v274;
LABEL_96:
        v289 = 0;
        uint64_t v290 = 0;
        v287[1] = 0;
        v288 = &v289;
        v286 = v287;
        v287[0] = 0;

        v10->_queriedMeanSeaLevelPressureData = (CLMeanSeaLevelPressureData *)[(CLMeanSeaLevelPressureEstimator *)v10->_meanSeaLevelPressureEstimator getEstimatedMeanSeaLevelPressure];
        uint64_t v72 = &qword_102419000;
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        uint64_t v73 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          [(CLMeanSeaLevelPressureData *)v10->_queriedMeanSeaLevelPressureData meanSeaLevelPressure];
          uint64_t v75 = v74;
          [(CLMeanSeaLevelPressureData *)v10->_queriedMeanSeaLevelPressureData uncertainty];
          uint64_t v77 = v76;
          [(CLMeanSeaLevelPressureData *)v10->_queriedMeanSeaLevelPressureData timestamp];
          *(_DWORD *)buf = 136316418;
          *(void *)v331 = "meanSeaLevelPressure";
          *(_WORD *)&v331[8] = 2048;
          *(void *)&v331[10] = v75;
          *(_WORD *)&v331[18] = 2080;
          *(void *)&v331[20] = "uncertainty";
          *(_WORD *)&v331[28] = 2048;
          *(void *)&v331[30] = v77;
          *(_WORD *)&v331[38] = 2080;
          *(void *)&v331[40] = "timestamp";
          *(_WORD *)&v331[48] = 2048;
          *(void *)&v331[50] = v78;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "query mean sea level pressure,%s,%f,%s,%f,%s,%f", buf, 0x3Eu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          [(CLMeanSeaLevelPressureData *)v274->_queriedMeanSeaLevelPressureData meanSeaLevelPressure];
          uint64_t v238 = v237;
          [(CLMeanSeaLevelPressureData *)v274->_queriedMeanSeaLevelPressureData uncertainty];
          uint64_t v240 = v239;
          [(CLMeanSeaLevelPressureData *)v274->_queriedMeanSeaLevelPressureData timestamp];
          int v310 = 136316418;
          *(void *)v311 = "meanSeaLevelPressure";
          *(_WORD *)&v311[8] = 2048;
          *(void *)&v311[10] = v238;
          *(_WORD *)&v311[18] = 2080;
          *(void *)&v311[20] = "uncertainty";
          *(_WORD *)&v311[28] = 2048;
          *(void *)&v311[30] = v240;
          *(_WORD *)&v311[38] = 2080;
          *(void *)&v311[40] = "timestamp";
          *(_WORD *)&v311[48] = 2048;
          *(void *)&v311[50] = v241;
          v242 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v242);
          if (v242 != (char *)buf) {
            free(v242);
          }
          double v10 = v274;
          double v6 = v271;
          double v5 = v272;
        }
        if (v307 != v306)
        {
          uint64_t v79 = (void *)(v306 + 8 * (v308 >> 8));
          uint64_t v80 = (double **)(*v79 + 16 * v308);
          uint64_t v81 = *(void *)(v306 + (((v309 + v308) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v309 + v308);
          if (v80 != (double **)v81)
          {
            BOOL v279 = 0;
            while (1)
            {
              double v82 = **v80;
              if (v82 >= v6 && v82 < v5) {
                break;
              }
LABEL_148:
              v80 += 2;
              if ((double **)((char *)v80 - *v79) == (double **)4096)
              {
                v101 = (double **)v79[1];
                ++v79;
                uint64_t v80 = v101;
              }
              if (v80 == (double **)v81) {
                goto LABEL_179;
              }
            }
            int v84 = (std::__shared_weak_count *)v80[1];
            v284 = *v80;
            v285 = v84;
            if (v84) {
              atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            double v282 = -1.0;
            double v283 = 1.79769313e308;
            +[CLBarometerCalibrationBiasEstimator getLocationSampleAltitudeAndUncertainty:&v284 andRefAltitude:&v283 andRefUncertainty:&v282];
            if (v282 <= 0.0 && v284[7] <= 0.0)
            {
              if (v72[60] != -1) {
                dispatch_once(&qword_1024191E0, &stru_1022C4A70);
              }
              double v94 = qword_1024191E8;
              if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
              {
                double v95 = *v284;
                uint64_t v96 = *((void *)v284 + 6);
                *(_DWORD *)buf = 134218496;
                *(double *)v331 = v95;
                *(_WORD *)&v331[8] = 2048;
                *(double *)&v331[10] = v283;
                *(_WORD *)&v331[18] = 2048;
                *(void *)&v331[20] = v96;
                _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "individual bias error: reference Uncertainty < 0 and no DEMS, location timestamp %f, location altitude %f, location DEMS %f", buf, 0x20u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (v72[60] != -1) {
                  dispatch_once(&qword_1024191E0, &stru_1022C4A70);
                }
                uint64_t v97 = *(void *)v284;
                uint64_t v98 = *((void *)v284 + 6);
                int v310 = 134218496;
                *(void *)v311 = v97;
                *(_WORD *)&v311[8] = 2048;
                *(double *)&v311[10] = v283;
                *(_WORD *)&v311[18] = 2048;
                *(void *)&v311[20] = v98;
                uint64_t v99 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v99);
                if (v99 != (char *)buf) {
                  free(v99);
                }
                double v10 = v274;
                uint64_t v72 = &qword_102419000;
                double v6 = v271;
                double v5 = v272;
              }
            }
            else
            {
              if (v302 == v301) {
                goto LABEL_141;
              }
              uint64_t v85 = (void *)(v301 + 8 * (v303 >> 8));
              uint64_t v86 = *v85 + 16 * v303;
              uint64_t v87 = *(void *)(v301 + (((v304 + v303) >> 5) & 0x7FFFFFFFFFFFFF8))
                  + 16 * (v304 + v303);
              if (v86 == v87)
              {
                double v10 = v274;
                uint64_t v72 = &qword_102419000;
LABEL_141:
                if (v72[60] != -1) {
                  dispatch_once(&qword_1024191E0, &stru_1022C4A70);
                }
                v100 = qword_1024191E8;
                if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "pressure too far from reference data", buf, 2u);
                }
                if (sub_10013D1A0(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (v72[60] != -1) {
                    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
                  }
                  LOWORD(v310) = 0;
                  double v124 = (char *)_os_log_send_and_compose_impl();
                  sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v124);
                  if (v124 != (char *)buf) {
                    free(v124);
                  }
                }
              }
              else
              {
                double v88 = 1.79769313e308;
                do
                {
                  v89 = *(double **)v86;
                  double v90 = vabdd_f64(**v80, **(double **)v86);
                  if (v90 < v88 && v90 <= 5.0)
                  {
                    int v92 = *(std::__shared_weak_count **)(v86 + 8);
                    if (v92) {
                      atomic_fetch_add_explicit(&v92->__shared_owners_, 1uLL, memory_order_relaxed);
                    }
                    if (v16) {
                      sub_1000DB0A0(v16);
                    }
                    double v16 = v92;
                    int v15 = v89;
                    double v88 = v90;
                  }
                  v86 += 16;
                  if (v86 - *v85 == 4096)
                  {
                    uint64_t v93 = v85[1];
                    ++v85;
                    uint64_t v86 = v93;
                  }
                }
                while (v86 != v87);
                uint64_t v72 = &qword_102419000;
                if (v88 == 1.79769313e308)
                {
                  double v10 = v274;
                  goto LABEL_141;
                }
                uint64_t v103 = *((void *)v284 + 1);
                uint64_t v102 = *((void *)v284 + 2);
                double v104 = v292;
                double v10 = v274;
                if (v292 >= v293)
                {
                  double v106 = (char *)__p;
                  uint64_t v107 = (v292 - (unsigned char *)__p) >> 4;
                  unint64_t v108 = v107 + 1;
                  if ((unint64_t)(v107 + 1) >> 60) {
                    sub_1001D7FD4();
                  }
                  uint64_t v109 = v293 - (unsigned char *)__p;
                  if ((v293 - (unsigned char *)__p) >> 3 > v108) {
                    unint64_t v108 = v109 >> 3;
                  }
                  if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFF0) {
                    unint64_t v110 = 0xFFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v110 = v108;
                  }
                  if (v110)
                  {
                    float v111 = (char *)sub_1000C571C((uint64_t)&v293, v110);
                    double v106 = (char *)__p;
                    double v104 = v292;
                  }
                  else
                  {
                    float v111 = 0;
                  }
                  float v112 = &v111[16 * v107];
                  *(void *)float v112 = v103;
                  *((void *)v112 + 1) = v102;
                  v113 = v112;
                  uint64_t v72 = &qword_102419000;
                  if (v104 != v106)
                  {
                    do
                    {
                      *((_OWORD *)v113 - 1) = *((_OWORD *)v104 - 1);
                      v113 -= 16;
                      v104 -= 16;
                    }
                    while (v104 != v106);
                    double v106 = (char *)__p;
                  }
                  double v105 = v112 + 16;
                  __p = v113;
                  v292 = v112 + 16;
                  v293 = &v111[16 * v110];
                  if (v106) {
                    operator delete(v106);
                  }
                }
                else
                {
                  *(void *)v292 = v103;
                  *((void *)v104 + 1) = v102;
                  double v105 = v104 + 16;
                }
                v292 = v105;
                float v114 = v15[1] * 1000.0;
                float v115 = sub_1001C1F30(v114, 101320.0);
                double v116 = v15[1];
                [(CLMeanSeaLevelPressureData *)v274->_queriedMeanSeaLevelPressureData meanSeaLevelPressure];
                float v117 = v116 * 1000.0;
                float v119 = v118;
                float v120 = sub_1001C1F30(v117, v119);
                v121 = v284;
                double v122 = v284[7];
                BOOL v279 = v122 > 0.0;
                if (!v274->_inOutdoorWorkoutStatus || (*((_WORD *)v284 + 65) & 2) != 0)
                {
                  double v123 = v115;
                  if ((*((_DWORD *)v284 + 25) & 0x80000000) == 0)
                  {
                    -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:](v274, "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:", &v288, v283, v282, v123);
                    [(CLBarometerCalibrationBiasEstimator *)v274 cumulateReference:&v286 andRefAltitude:*((unsigned int *)v284 + 25) andRefVariance:v283 andBaroElevation:v282 andType:v120];
                    v121 = v284;
                    double v122 = v284[7];
                  }
                  if (v122 > 0.0)
                  {
                    -[CLBarometerCalibrationBiasEstimator cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:](v274, "cumulateReference:andRefAltitude:andRefVariance:andBaroElevation:andType:", &v288, 14, v121[6]);
                    [(CLBarometerCalibrationBiasEstimator *)v274 cumulateReference:&v286 andRefAltitude:14 andRefVariance:v284[6] andBaroElevation:v284[7] andType:v120];
                  }
                }
              }
            }
            if (v285) {
              sub_1000DB0A0(v285);
            }
            goto LABEL_148;
          }
        }
        BOOL v279 = 0;
LABEL_179:
        if (v290)
        {
          [(CLBarometerCalibrationBiasEstimator *)v10 centroidOfLocationVector:&__p];
          double v127 = v126;
          double v128 = v125;
          if (v126 != 1.79769313e308)
          {
            double latitude = v10->_biasLocation.latitude;
            if (latitude != 1.79769313e308) {
              v10->_distanceSinceLastRebase = fabs(sub_1000A3D9C(latitude, v10->_biasLocation.longitude, v127, v125));
            }
          }
          [(CLBarometerCalibrationBiasEstimator *)v10 updateBiasUncertaintyWithPressure:v294 andTime:0.0 andLat:v127 andLon:v128];
          [(CLBarometerCalibrationBiasEstimator *)v10 getAbsoluteAltitudeUncertainty];
          double v131 = v130;
          uint64_t v132 = v288;
          if (v288 == &v289)
          {
            uint64_t v134 = 0;
          }
          else
          {
            double v133 = log(v130 * (v130 * 17.0794684));
            uint64_t v134 = 0;
            do
            {
              double v135 = (double)*((int *)v132 + 18);
              double v136 = *((double *)v132 + 6) * *((double *)v132 + 6) / v135 / v135;
              *((double *)v132 + 5) = *((double *)v132 + 5) / v135;
              *((double *)v132 + 6) = v136;
              double v137 = *((double *)v132 + 7) / v135;
              *((double *)v132 + 7) = v137;
              double v138 = v137 + v10->_bias;
              *((double *)v132 + 7) = v138;
              *((double *)v132 + 7) = v138 - v10->_weatherEstimateInMeter;
              *((double *)v132 + 8) = v131 * v131;
              v281 = v132[9];
              long long v139 = *(_OWORD *)(v132 + 7);
              v280[0] = *(_OWORD *)(v132 + 5);
              v280[1] = v139;
              [(CLBarometerCalibrationBiasEstimator *)v10 crossEntropyOfreference:v280];
              if (v133 >= v140)
              {
                uint64_t v134 = *((unsigned int *)v132 + 8);
                double v133 = v140;
              }
              double v141 = v132[1];
              if (v141)
              {
                do
                {
                  v142 = (void **)v141;
                  double v141 = (void *)*v141;
                }
                while (v141);
              }
              else
              {
                do
                {
                  v142 = (void **)v132[2];
                  BOOL v143 = *v142 == v132;
                  uint64_t v132 = v142;
                }
                while (!v143);
              }
              uint64_t v132 = v142;
            }
            while (v142 != &v289);
          }
          unint64_t v181 = v289;
          if (!v289) {
            goto LABEL_224;
          }
          uint64_t v182 = (double *)&v289;
          do
          {
            uint64_t v183 = (double *)v181;
            uint64_t v184 = v182;
            int v185 = *((_DWORD *)v181 + 8);
            unint64_t v186 = (double *)(v181 + 1);
            if (v185 >= (int)v134)
            {
              unint64_t v186 = v183;
              uint64_t v182 = v183;
            }
            unint64_t v181 = *(void **)v186;
          }
          while (v181);
          if (v182 == (double *)&v289) {
            goto LABEL_224;
          }
          if (v185 < (int)v134) {
            uint64_t v183 = v184;
          }
          if ((int)v134 >= *((_DWORD *)v183 + 8))
          {
            double v213 = v10->_bias;
            float v214 = v182[7] + v10->_weatherEstimateInMeter - v213;
            v10->_float biasPressure = sub_1014BE58C(v214, 101320.0);
            double v215 = v10->_bias + v182[8] * (v182[5] - v182[7]) / (v182[8] + v182[6]);
            v10->_double bias = v215 - v10->_weatherEstimateInMeter;
            v10->_double biasUncertaintyAtRebase = sqrt(v182[8] * v182[6] / (v182[8] + v182[6]));
            v10->_double pressureUncertainty = 0.0;
            v10->_double distanceTraveled = 0.0;
            v10->_double biasTimestamp = v5;
            sub_1008B045C((uint64_t)v10->_fSignificantElevationEstimatorRebase.__ptr_.__value_);
            [(CLBarometerCalibrationBiasEstimator *)v10 rebaseSignificantElevationWithEndTime:v5];
            [(CLBarometerCalibrationBiasEstimator *)v10 updateBiasUncertaintyWithAbsSigElevation:0 withCompanion:sub_1008B00B0((uint64_t)v10->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v216, v217, v218)];
            [(CLBarometerCalibrationBiasEstimator *)v10 sendRebaseAnalyticsWithAltitudeError:v279 andUncertainty:v10->_inOutdoorWorkoutStatus andRefUncertainty:v134 andDemAvailable:v182[5] - v182[7] andWorkout:sqrt(v182[8]) andReferenceSource:sqrt(v182[6]) andCorrection:v215 - v213 andDistance:v10->_distanceSinceLastRebase];
            if (v72[60] != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            double v219 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
            {
              double v220 = v10->_bias;
              double v221 = v10->_biasUncertaintyAtRebase;
              __int16 v222 = (void *)*((void *)v182 + 7);
              uint64_t v223 = (void *)*((void *)v182 + 5);
              double v224 = sqrt(v182[8]);
              double v225 = v182[6];
              double v226 = v10->_weatherEstimateInMeter;
              BOOL v227 = v10->_inOutdoorWorkoutStatus;
              *(_DWORD *)buf = 67111680;
              *(_DWORD *)v331 = v134;
              *(_WORD *)&v331[4] = 2048;
              *(double *)&v331[6] = v220;
              *(_WORD *)&v331[14] = 2048;
              *(double *)&v331[16] = v221;
              *(_WORD *)&v331[24] = 2048;
              *(void *)&v331[26] = v222;
              *(_WORD *)&v331[34] = 2048;
              *(void *)&v331[36] = v223;
              *(_WORD *)&v331[44] = 2048;
              *(double *)&v331[46] = v224;
              *(_WORD *)&v331[54] = 2048;
              *(void *)&v331[56] = sqrt(v225);
              __int16 v332 = 2048;
              double v333 = v226;
              __int16 v334 = 1024;
              *(_DWORD *)v335 = v227;
              *(_WORD *)&v335[4] = 2048;
              *(double *)&v335[6] = v6;
              *(_WORD *)&v335[14] = 2048;
              *(double *)&v335[16] = v5;
              _os_log_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_DEFAULT, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", buf, 0x68u);
            }
            if (!sub_10013D1A0(115, 2)) {
              goto LABEL_229;
            }
            bzero(buf, 0x65CuLL);
            if (v72[60] != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            double v228 = v274->_bias;
            double v229 = v274->_biasUncertaintyAtRebase;
            v230 = (void *)*((void *)v182 + 7);
            v231 = (void *)*((void *)v182 + 5);
            double v232 = sqrt(v182[8]);
            double v233 = v182[6];
            double v234 = v274->_weatherEstimateInMeter;
            BOOL v235 = v274->_inOutdoorWorkoutStatus;
            int v310 = 67111680;
            *(_DWORD *)v311 = v134;
            *(_WORD *)&v311[4] = 2048;
            *(double *)&v311[6] = v228;
            *(_WORD *)&v311[14] = 2048;
            *(double *)&v311[16] = v229;
            *(_WORD *)&v311[24] = 2048;
            *(void *)&v311[26] = v230;
            *(_WORD *)&v311[34] = 2048;
            *(void *)&v311[36] = v231;
            *(_WORD *)&v311[44] = 2048;
            *(double *)&v311[46] = v232;
            *(_WORD *)&v311[54] = 2048;
            *(void *)&v311[56] = sqrt(v233);
            __int16 v312 = 2048;
            double v313 = v234;
            __int16 v314 = 1024;
            *(_DWORD *)v315 = v235;
            *(_WORD *)&v315[4] = 2048;
            *(double *)&v315[6] = v271;
            *(_WORD *)&v315[14] = 2048;
            *(double *)&v315[16] = v272;
            v236 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v236);
          }
          else
          {
LABEL_224:
            if (v72[60] != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            uint64_t v187 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
            {
              double v188 = v10->_bias;
              double v189 = v10->_weatherEstimateInMeter;
              BOOL v190 = v10->_inOutdoorWorkoutStatus;
              *(_DWORD *)buf = 67111680;
              *(_DWORD *)v331 = v134;
              *(_WORD *)&v331[4] = 2048;
              *(double *)&v331[6] = v188;
              *(_WORD *)&v331[14] = 2048;
              *(double *)&v331[16] = v131;
              *(_WORD *)&v331[24] = 2048;
              *(void *)&v331[26] = 0xBFF0000000000000;
              *(_WORD *)&v331[34] = 2048;
              *(void *)&v331[36] = 0xBFF0000000000000;
              *(_WORD *)&v331[44] = 2048;
              *(void *)&v331[46] = 0xBFF0000000000000;
              *(_WORD *)&v331[54] = 2048;
              *(void *)&v331[56] = 0xBFF0000000000000;
              __int16 v332 = 2048;
              double v333 = v189;
              __int16 v334 = 1024;
              *(_DWORD *)v335 = v190;
              *(_WORD *)&v335[4] = 2048;
              *(double *)&v335[6] = v6;
              *(_WORD *)&v335[14] = 2048;
              *(double *)&v335[16] = v5;
              _os_log_impl((void *)&_mh_execute_header, v187, OS_LOG_TYPE_DEFAULT, "pressure height rebase to,type,%d,newBias,%f,newBiasUncertainty,%f,oldBaroAltitude,%f,oldRefAltitude,%f,oldBaroUncertainty,%f,oldRefUncertainty,%f,weatherEstimateInMeter,%f,inOutdoorWorkout,%d,calculatedFromTrackStartAt,%f,endAt,%f", buf, 0x68u);
            }
            if (!sub_10013D1A0(115, 2)) {
              goto LABEL_229;
            }
            bzero(buf, 0x65CuLL);
            if (v72[60] != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            double v252 = v274->_bias;
            double v253 = v274->_weatherEstimateInMeter;
            BOOL v254 = v274->_inOutdoorWorkoutStatus;
            int v310 = 67111680;
            *(_DWORD *)v311 = v134;
            *(_WORD *)&v311[4] = 2048;
            *(double *)&v311[6] = v252;
            *(_WORD *)&v311[14] = 2048;
            *(double *)&v311[16] = v131;
            *(_WORD *)&v311[24] = 2048;
            *(void *)&v311[26] = 0xBFF0000000000000;
            *(_WORD *)&v311[34] = 2048;
            *(void *)&v311[36] = 0xBFF0000000000000;
            *(_WORD *)&v311[44] = 2048;
            *(void *)&v311[46] = 0xBFF0000000000000;
            *(_WORD *)&v311[54] = 2048;
            *(void *)&v311[56] = 0xBFF0000000000000;
            __int16 v312 = 2048;
            double v313 = v253;
            __int16 v314 = 1024;
            *(_DWORD *)v315 = v254;
            *(_WORD *)&v315[4] = 2048;
            *(double *)&v315[6] = v271;
            *(_WORD *)&v315[14] = 2048;
            *(double *)&v315[16] = v272;
            v236 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v236);
          }
          if (v236 != (char *)buf) {
            free(v236);
          }
          double v10 = v274;
          uint64_t v72 = &qword_102419000;
          double v6 = v271;
          double v5 = v272;
        }
LABEL_229:
        double v191 = v294;
        [(CLMeanSeaLevelPressureData *)v10->_queriedMeanSeaLevelPressureData meanSeaLevelPressure];
        float v192 = v191;
        float v194 = v193;
        float v195 = sub_1001C1F30(v192, v194);
        [(CLMeanSeaLevelPressureData *)v10->_queriedMeanSeaLevelPressureData meanSeaLevelPressure];
        v10->_estimatedMeanSeaLevelPressure = v196;
        float v197 = v294;
        float v198 = v196;
        sub_1014BE614(v197, v198);
        float v200 = v199;
        [(CLMeanSeaLevelPressureData *)v10->_queriedMeanSeaLevelPressureData uncertainty];
        v10->_double estimatedAbsoluteAltitudeUncertainty = v201 * v200;
        if (v72[60] != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        __int16 v202 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          [(CLMeanSeaLevelPressureData *)v10->_queriedMeanSeaLevelPressureData uncertainty];
          double estimatedAbsoluteAltitudeUncertainty = v10->_estimatedAbsoluteAltitudeUncertainty;
          *(_DWORD *)buf = 136315906;
          *(void *)v331 = "estimatedMslpUncertainty";
          *(_WORD *)&v331[8] = 2048;
          *(void *)&v331[10] = v204;
          *(_WORD *)&v331[18] = 2080;
          *(void *)&v331[20] = "estimatedAbsoluteAltitudeUncertainty";
          *(_WORD *)&v331[28] = 2048;
          *(double *)&v331[30] = estimatedAbsoluteAltitudeUncertainty;
          _os_log_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_DEFAULT, "mslp uncertainty to altitude uncertainty,%s,%f,%s,%f", buf, 0x2Au);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (v72[60] != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          [(CLMeanSeaLevelPressureData *)v274->_queriedMeanSeaLevelPressureData uncertainty];
          double v243 = v274->_estimatedAbsoluteAltitudeUncertainty;
          int v310 = 136315906;
          *(void *)v311 = "estimatedMslpUncertainty";
          *(_WORD *)&v311[8] = 2048;
          *(void *)&v311[10] = v244;
          *(_WORD *)&v311[18] = 2080;
          *(void *)&v311[20] = "estimatedAbsoluteAltitudeUncertainty";
          *(_WORD *)&v311[28] = 2048;
          *(double *)&v311[30] = v243;
          v245 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v245);
          if (v245 != (char *)buf) {
            free(v245);
          }
          double v10 = v274;
          uint64_t v72 = &qword_102419000;
          double v6 = v271;
          double v5 = v272;
        }
        id v205 = (id)[(CLBarometerCalibrationBiasEstimator *)v10 selectReferenceWithReference:&v286 withBaroElevation:v195 betweenStartTime:v6 andEndTime:v5];
        v206 = objc_opt_new();
        [v206 setTimestamp:v5];
        [(CLBarometerCalibrationBiasEstimator *)v10 computeMeanSeaLevelPressureWithRebasingLocationData:v206 referenceMap:&v286 andLocationType:v205];
        if (v205) {
          [(CLBarometerCalibrationBiasEstimator *)v10 updateHistoricalMslpArray:v206];
        }
        if (v72[60] != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        v207 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          [v206 meanSeaLevelPressure];
          uint64_t v209 = v208;
          [v206 uncertainty];
          uint64_t v211 = v210;
          [v206 timestamp];
          *(_DWORD *)buf = 136317954;
          *(void *)v331 = "type";
          *(_WORD *)&v331[8] = 1024;
          *(_DWORD *)&v331[10] = v205;
          *(_WORD *)&v331[14] = 2080;
          *(void *)&v331[16] = "meanSeaLevelPressure";
          *(_WORD *)&v331[24] = 2048;
          *(void *)&v331[26] = v209;
          *(_WORD *)&v331[34] = 2080;
          *(void *)&v331[36] = "uncertainty";
          *(_WORD *)&v331[44] = 2048;
          *(void *)&v331[46] = v211;
          *(_WORD *)&v331[54] = 2080;
          *(void *)&v331[56] = "timestamp";
          __int16 v332 = 2048;
          double v333 = v212;
          __int16 v334 = 2080;
          *(void *)v335 = "startAt";
          *(_WORD *)&v335[8] = 2048;
          *(double *)&v335[10] = v6;
          *(_WORD *)&v335[18] = 2080;
          *(void *)&v335[20] = "endAt";
          __int16 v336 = 2048;
          double v337 = v5;
          _os_log_impl((void *)&_mh_execute_header, v207, OS_LOG_TYPE_DEFAULT, "update mean sea level pressure array with location data after rebasing,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x76u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (v72[60] != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          [v206 meanSeaLevelPressure];
          uint64_t v247 = v246;
          [v206 uncertainty];
          uint64_t v249 = v248;
          [v206 timestamp];
          int v310 = 136317954;
          *(void *)v311 = "type";
          *(_WORD *)&v311[8] = 1024;
          *(_DWORD *)&v311[10] = v205;
          *(_WORD *)&v311[14] = 2080;
          *(void *)&v311[16] = "meanSeaLevelPressure";
          *(_WORD *)&v311[24] = 2048;
          *(void *)&v311[26] = v247;
          *(_WORD *)&v311[34] = 2080;
          *(void *)&v311[36] = "uncertainty";
          *(_WORD *)&v311[44] = 2048;
          *(void *)&v311[46] = v249;
          *(_WORD *)&v311[54] = 2080;
          *(void *)&v311[56] = "timestamp";
          __int16 v312 = 2048;
          double v313 = v250;
          __int16 v314 = 2080;
          *(void *)v315 = "startAt";
          *(_WORD *)&v315[8] = 2048;
          *(double *)&v315[10] = v271;
          *(_WORD *)&v315[18] = 2080;
          *(void *)&v315[20] = "endAt";
          __int16 v316 = 2048;
          double v317 = v272;
          v251 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v251);
          if (v251 != (char *)buf) {
            free(v251);
          }
        }

        sub_1000F5BB0((uint64_t)&v286, v287[0]);
        sub_1000F5BB0((uint64_t)&v288, v289);
LABEL_242:
        if (v16) {
          sub_1000DB0A0(v16);
        }
        if (__p)
        {
          v292 = (char *)__p;
          operator delete(__p);
        }
        goto LABEL_246;
      }
    }
    uint64_t v24 = *(std::__shared_weak_count **)(v13 + 8);
    if (v24) {
      atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    uint64_t v25 = v18[61];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      double v27 = *v21;
      uint64_t v26 = *((void *)v21 + 1);
      *(_DWORD *)buf = 134218240;
      *(void *)v331 = v26;
      *(_WORD *)&v331[8] = 2048;
      *(double *)&v331[10] = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "companion data found,altitude,%f,timestamp,%f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v58 = *v21;
      uint64_t v57 = *((void *)v21 + 1);
      int v310 = 134218240;
      *(void *)v311 = v57;
      *(_WORD *)&v311[8] = 2048;
      *(double *)&v311[10] = v58;
      double v59 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v59);
      if (v59 != (char *)buf) {
        free(v59);
      }
    }
    if (v302 != v301)
    {
      double v28 = (void *)(v301 + 8 * (v303 >> 8));
      uint64_t v29 = *v28 + 16 * v303;
      uint64_t v30 = *(void *)(v301 + (((v304 + v303) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v304 + v303);
      if (v29 == v30)
      {
        double v18 = &qword_102419000;
      }
      else
      {
        double v31 = 1.79769313e308;
        do
        {
          __int16 v32 = *(double **)v29;
          double v33 = vabdd_f64(*v21, **(double **)v29);
          if (v33 < v31 && v33 <= 5.0)
          {
            uint64_t v35 = *(std::__shared_weak_count **)(v29 + 8);
            if (v35) {
              atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            if (v16) {
              sub_1000DB0A0(v16);
            }
            double v16 = v35;
            int v15 = v32;
            double v31 = v33;
          }
          v29 += 16;
          if (v29 - *v28 == 4096)
          {
            uint64_t v36 = v28[1];
            ++v28;
            uint64_t v29 = v36;
          }
        }
        while (v29 != v30);
        double v18 = &qword_102419000;
        if (v31 != 1.79769313e308)
        {
          double v37 = v17;
          double v38 = v21[1];
          double v39 = v15[1];
          float v40 = v39 * 1000.0;
          uint64_t v14 = v278;
          float v41 = sub_1001C1F30(v40, 101320.0);
          double v42 = v21[1];
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          double v273 = v20;
          double v43 = v41;
          double v44 = v42 - v43;
          uint64_t v45 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
          {
            double v46 = *v21;
            uint64_t v47 = *((void *)v21 + 1);
            uint64_t v48 = *(void *)v15;
            *(_DWORD *)buf = 134219008;
            *(double *)v331 = v44;
            *(_WORD *)&v331[8] = 2048;
            *(double *)&v331[10] = v46;
            *(_WORD *)&v331[18] = 2048;
            *(void *)&v331[20] = v47;
            *(_WORD *)&v331[28] = 2048;
            *(void *)&v331[30] = v48;
            *(_WORD *)&v331[38] = 2048;
            *(double *)&v331[40] = v43;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "individual bias calculated: %f, companion timestamp %f,  companion altitude %f, pressure timestamp %f, pressure altitude %f", buf, 0x34u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            double v61 = *v21;
            uint64_t v62 = *((void *)v21 + 1);
            uint64_t v63 = *(void *)v15;
            int v310 = 134219008;
            *(double *)v311 = v44;
            *(_WORD *)&v311[8] = 2048;
            *(double *)&v311[10] = v61;
            *(_WORD *)&v311[18] = 2048;
            *(void *)&v311[20] = v62;
            *(_WORD *)&v311[28] = 2048;
            *(void *)&v311[30] = v63;
            *(_WORD *)&v311[38] = 2048;
            *(double *)&v311[40] = v43;
            unint64_t v64 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v64);
            if (v64 != (char *)buf) {
              free(v64);
            }
            uint64_t v14 = v278;
          }
          double v49 = v21[2];
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          uint64_t v50 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v51 = *(void *)v15;
            double v52 = *v21;
            double v53 = v21[1];
            double v54 = v21[2];
            *(_DWORD *)buf = 136319490;
            *(void *)v331 = "type";
            *(_WORD *)&v331[8] = 1024;
            *(_DWORD *)&v331[10] = -1;
            *(_WORD *)&v331[14] = 2080;
            *(void *)&v331[16] = "locTime";
            *(_WORD *)&v331[24] = 2048;
            *(double *)&v331[26] = v52;
            *(_WORD *)&v331[34] = 2080;
            *(void *)&v331[36] = "pressureTime";
            *(_WORD *)&v331[44] = 2048;
            *(void *)&v331[46] = v51;
            *(_WORD *)&v331[54] = 2080;
            *(void *)&v331[56] = "locationAlt";
            __int16 v332 = 2048;
            double v333 = v53;
            __int16 v334 = 2080;
            *(void *)v335 = "pressureAlt";
            *(_WORD *)&v335[8] = 2048;
            *(double *)&v335[10] = v43;
            *(_WORD *)&v335[18] = 2080;
            *(void *)&v335[20] = "locVerticalUnc";
            __int16 v336 = 2048;
            double v337 = v54;
            __int16 v338 = 2080;
            v339 = "locHorizontalUnc";
            __int16 v340 = 2048;
            uint64_t v341 = 0;
            __int16 v342 = 2080;
            v343 = "demAlt";
            __int16 v344 = 2048;
            uint64_t v345 = 0;
            __int16 v346 = 2080;
            v347 = "demVerticalUnc";
            __int16 v348 = 2048;
            uint64_t v349 = 0;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "individual location data,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0xB2u);
          }
          ++v277;
          double v275 = v275 + v39 * 1000.0;
          double v276 = v276 + v38;
          double v19 = v19 + v43;
          double v17 = v37 + v44;
          double v20 = v273 + v49;
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            uint64_t v65 = *(void *)v15;
            double v66 = *v21;
            double v67 = v21[1];
            double v68 = v21[2];
            int v310 = 136319490;
            *(void *)v311 = "type";
            *(_WORD *)&v311[8] = 1024;
            *(_DWORD *)&v311[10] = -1;
            *(_WORD *)&v311[14] = 2080;
            *(void *)&v311[16] = "locTime";
            *(_WORD *)&v311[24] = 2048;
            *(double *)&v311[26] = v66;
            *(_WORD *)&v311[34] = 2080;
            *(void *)&v311[36] = "pressureTime";
            *(_WORD *)&v311[44] = 2048;
            *(void *)&v311[46] = v65;
            *(_WORD *)&v311[54] = 2080;
            *(void *)&v311[56] = "locationAlt";
            __int16 v312 = 2048;
            double v313 = v67;
            __int16 v314 = 2080;
            *(void *)v315 = "pressureAlt";
            *(_WORD *)&v315[8] = 2048;
            *(double *)&v315[10] = v43;
            *(_WORD *)&v315[18] = 2080;
            *(void *)&v315[20] = "locVerticalUnc";
            __int16 v316 = 2048;
            double v317 = v68;
            __int16 v318 = 2080;
            v319 = "locHorizontalUnc";
            __int16 v320 = 2048;
            uint64_t v321 = 0;
            __int16 v322 = 2080;
            v323 = "demAlt";
            __int16 v324 = 2048;
            uint64_t v325 = 0;
            __int16 v326 = 2080;
            v327 = "demVerticalUnc";
            __int16 v328 = 2048;
            uint64_t v329 = 0;
            v69 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v69);
            if (v69 != (char *)buf) {
              free(v69);
            }
            double v6 = v271;
            double v5 = v272;
            uint64_t v14 = v278;
          }
          else
          {
            double v6 = v271;
            double v5 = v272;
          }
LABEL_62:
          if (v24) {
            sub_1000DB0A0(v24);
          }
          goto LABEL_64;
        }
      }
      uint64_t v14 = v278;
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    uint64_t v55 = v18[61];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "pressure too far from companion data", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      LOWORD(v310) = 0;
      double v60 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v60);
      if (v60 != (char *)buf) {
        free(v60);
      }
    }
    goto LABEL_62;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  double v7 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(double *)v331 = v6;
    *(_WORD *)&v331[8] = 2048;
    *(double *)&v331[10] = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "track is too old, don't rebase,startTime,%f,endTime,%f", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    int v310 = 134218240;
    *(double *)v311 = v6;
    *(_WORD *)&v311[8] = 2048;
    *(double *)&v311[10] = v5;
    double v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateElevationBiasBetweenStartTime:andEndTime:andNextTrackStartTime:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
}

- (void)updateHistoricalMslpArray:(id)a3
{
  BOOL v5 = *(_WORD *)&self->_inOutdoorWorkoutStatus || self->_loiRebase || self->_forceCalibrate;
  if (self->_forceCalibrate) {
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator cleanHistoricalMslpArrayForForceRebase:a3];
  }
  if (v5 || ![(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator inVisitStatus])
  {
    if ([(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator updateHistoricalMslpArray:a3 from:0])
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v7 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [a3 timestamp];
        uint64_t v9 = v8;
        [a3 meanSeaLevelPressure];
        uint64_t v11 = v10;
        [a3 uncertainty];
        uint64_t v13 = v12;
        [a3 pressureMeasurement];
        *(_DWORD *)buf = 134218752;
        uint64_t v17 = v9;
        __int16 v18 = 2048;
        uint64_t v19 = v11;
        __int16 v20 = 2048;
        uint64_t v21 = v13;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "mslp from ap,timestamp,%f,mslp,%f,uncertainty,%f,pressureMeasurement,%f", buf, 0x2Au);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        [a3 timestamp];
        [a3 meanSeaLevelPressure];
        [a3 uncertainty];
        [a3 pressureMeasurement];
        int v15 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateHistoricalMslpArray:]", "%s\n", v15);
        if (v15 != (char *)buf) {
          free(v15);
        }
      }
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator setNumberOfRebaseBtwRefresh:[(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator numberOfRebaseBtwRefresh]+ 1];
      self->_lastRebaseTimestamp = CFAbsoluteTimeGetCurrent();
    }
  }
  else
  {
    meanSeaLevelPressureEstimator = self->_meanSeaLevelPressureEstimator;
    [(CLMeanSeaLevelPressureEstimator *)meanSeaLevelPressureEstimator updateInVisitRebasedMslp:a3];
  }
}

- (void)computeMeanSeaLevelPressureWithRebasingLocationData:(id)a3 referenceMap:(void *)a4 andLocationType:(int)a5
{
  if (!a5)
  {
    [a3 setMeanSeaLevelPressure:a3 a4:1.0];
    double v14 = -1.0;
LABEL_15:
    [a3 setUncertainty:v14];
    return;
  }
  uint64_t v8 = (char *)*((void *)a4 + 1);
  double v6 = (char *)a4 + 8;
  double v7 = v8;
  if (v8)
  {
    uint64_t v10 = (double *)v6;
    do
    {
      int v11 = *((_DWORD *)v7 + 8);
      BOOL v12 = v11 < a5;
      if (v11 >= a5) {
        uint64_t v13 = (char **)v7;
      }
      else {
        uint64_t v13 = (char **)(v7 + 8);
      }
      if (!v12) {
        uint64_t v10 = (double *)v7;
      }
      double v7 = *v13;
    }
    while (*v13);
    if (v10 != (double *)v6 && *((_DWORD *)v10 + 8) <= a5)
    {
      double v15 = v10[7];
      double v16 = v10[8];
      double v17 = v10[5];
      double v18 = v10[6];
      double v19 = (v15 * v18 + v16 * v17) / (v16 + v18);
      float v20 = v15;
      [(CLMeanSeaLevelPressureData *)self->_queriedMeanSeaLevelPressureData meanSeaLevelPressure];
      float v22 = v21;
      float v23 = sub_1014BE58C(v20, v22);
      self->_double estimatedAbsoluteAltitudeUncertainty = sqrt(v16 * v18 / (v16 + v18));
      float v24 = v19;
      self->_estimatedMeanSeaLevelPressure = sub_1014BE5D0(v24, v23);
      *(float *)&double v16 = v17;
      [a3 setMeanSeaLevelPressure:sub_1014BE5D0(*(float *)&v16, v23)];
      float v25 = v17;
      double v14 = sqrt(v18) * sub_1014BE664(v25, v23);
      goto LABEL_15;
    }
  }
}

- (int)selectReferenceWithReference:(void *)a3 withBaroElevation:(double)a4 betweenStartTime:(double)a5 andEndTime:(double)a6
{
  int v62 = 0;
  self->_loiRebase = 0;
  if (*((void *)a3 + 2))
  {
    double v10 = log(self->_estimatedAbsoluteAltitudeUncertainty * (self->_estimatedAbsoluteAltitudeUncertainty * 17.0794684));
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    int v11 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double estimatedAbsoluteAltitudeUncertainty = self->_estimatedAbsoluteAltitudeUncertainty;
      *(_DWORD *)buf = 136318978;
      uint64_t v96 = "type";
      __int16 v97 = 1024;
      int v98 = 0;
      __int16 v99 = 2080;
      v100 = "crossEntropy";
      __int16 v101 = 2048;
      double v102 = v10;
      __int16 v103 = 2080;
      double v104 = "fromBaroAlt";
      __int16 v105 = 2048;
      unint64_t v106 = 0xBFF0000000000000;
      __int16 v107 = 2080;
      unint64_t v108 = "fromRefAlt";
      __int16 v109 = 2048;
      unint64_t v110 = 0xBFF0000000000000;
      __int16 v111 = 2080;
      float v112 = "baroUncertainty";
      __int16 v113 = 2048;
      double v114 = estimatedAbsoluteAltitudeUncertainty;
      __int16 v115 = 2080;
      double v116 = "refUncertainty";
      __int16 v117 = 2048;
      double v118 = -1.0;
      __int16 v119 = 2080;
      float v120 = "trackStartTime";
      __int16 v121 = 2048;
      double v122 = a5;
      __int16 v123 = 2080;
      double v124 = "trackEndTime";
      __int16 v125 = 2048;
      double v126 = a6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x9Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v52 = self->_estimatedAbsoluteAltitudeUncertainty;
      int v63 = 136318978;
      unint64_t v64 = "type";
      __int16 v65 = 1024;
      int v66 = 0;
      __int16 v67 = 2080;
      double v68 = "crossEntropy";
      __int16 v69 = 2048;
      double v70 = v10;
      __int16 v71 = 2080;
      uint64_t v72 = "fromBaroAlt";
      __int16 v73 = 2048;
      unint64_t v74 = 0xBFF0000000000000;
      __int16 v75 = 2080;
      uint64_t v76 = "fromRefAlt";
      __int16 v77 = 2048;
      unint64_t v78 = 0xBFF0000000000000;
      __int16 v79 = 2080;
      uint64_t v80 = "baroUncertainty";
      __int16 v81 = 2048;
      double v82 = v52;
      __int16 v83 = 2080;
      int v84 = "refUncertainty";
      __int16 v85 = 2048;
      double v86 = -1.0;
      __int16 v87 = 2080;
      double v88 = "trackStartTime";
      __int16 v89 = 2048;
      double v90 = a5;
      __int16 v91 = 2080;
      int v92 = "trackEndTime";
      __int16 v93 = 2048;
      double v94 = a6;
      double v53 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]", "%s\n", v53);
      if (v53 != (char *)buf) {
        free(v53);
      }
    }
    uint64_t v13 = *(void **)a3;
    if (*(void **)a3 != (char *)a3 + 8)
    {
      do
      {
        double v14 = (double)*((int *)v13 + 18);
        double v15 = *((double *)v13 + 6) * *((double *)v13 + 6) / v14 / v14;
        *((double *)v13 + 5) = *((double *)v13 + 5) / v14;
        *((double *)v13 + 6) = v15;
        *((double *)v13 + 7) = *((double *)v13 + 7) / v14;
        *((double *)v13 + 8) = self->_estimatedAbsoluteAltitudeUncertainty * self->_estimatedAbsoluteAltitudeUncertainty;
        uint64_t v61 = v13[9];
        long long v16 = *(_OWORD *)(v13 + 7);
        v60[0] = *(_OWORD *)(v13 + 5);
        v60[1] = v16;
        [(CLBarometerCalibrationBiasEstimator *)self crossEntropyOfreference:v60];
        double v18 = v17;
        if (v10 >= v17)
        {
          int v62 = *((_DWORD *)v13 + 8);
          double v10 = v17;
        }
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        double v19 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = *((_DWORD *)v13 + 8);
          unint64_t v21 = v13[7];
          unint64_t v22 = v13[5];
          double v23 = sqrt(*((double *)v13 + 8));
          double v24 = *((double *)v13 + 6);
          *(_DWORD *)buf = 136318978;
          uint64_t v96 = "type";
          __int16 v97 = 1024;
          int v98 = v20;
          __int16 v99 = 2080;
          v100 = "crossEntropy";
          __int16 v101 = 2048;
          double v102 = v18;
          __int16 v103 = 2080;
          double v104 = "fromBaroAlt";
          __int16 v105 = 2048;
          unint64_t v106 = v21;
          __int16 v107 = 2080;
          unint64_t v108 = "fromRefAlt";
          __int16 v109 = 2048;
          unint64_t v110 = v22;
          __int16 v111 = 2080;
          float v112 = "baroUncertainty";
          __int16 v113 = 2048;
          double v114 = v23;
          __int16 v115 = 2080;
          double v116 = "refUncertainty";
          __int16 v117 = 2048;
          double v118 = sqrt(v24);
          __int16 v119 = 2080;
          float v120 = "trackStartTime";
          __int16 v121 = 2048;
          double v122 = a5;
          __int16 v123 = 2080;
          double v124 = "trackEndTime";
          __int16 v125 = 2048;
          double v126 = a6;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x9Eu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          int v28 = *((_DWORD *)v13 + 8);
          unint64_t v29 = v13[7];
          unint64_t v30 = v13[5];
          double v31 = sqrt(*((double *)v13 + 8));
          double v32 = *((double *)v13 + 6);
          int v63 = 136318978;
          unint64_t v64 = "type";
          __int16 v65 = 1024;
          int v66 = v28;
          __int16 v67 = 2080;
          double v68 = "crossEntropy";
          __int16 v69 = 2048;
          double v70 = v18;
          __int16 v71 = 2080;
          uint64_t v72 = "fromBaroAlt";
          __int16 v73 = 2048;
          unint64_t v74 = v29;
          __int16 v75 = 2080;
          uint64_t v76 = "fromRefAlt";
          __int16 v77 = 2048;
          unint64_t v78 = v30;
          __int16 v79 = 2080;
          uint64_t v80 = "baroUncertainty";
          __int16 v81 = 2048;
          double v82 = v31;
          __int16 v83 = 2080;
          int v84 = "refUncertainty";
          __int16 v85 = 2048;
          double v86 = sqrt(v32);
          __int16 v87 = 2080;
          double v88 = "trackStartTime";
          __int16 v89 = 2048;
          double v90 = a5;
          __int16 v91 = 2080;
          int v92 = "trackEndTime";
          __int16 v93 = 2048;
          double v94 = a6;
          double v33 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]", "%s\n", v33);
          if (v33 != (char *)buf) {
            free(v33);
          }
        }
        float v25 = (void *)v13[1];
        if (v25)
        {
          do
          {
            uint64_t v26 = v25;
            float v25 = (void *)*v25;
          }
          while (v25);
        }
        else
        {
          do
          {
            uint64_t v26 = (void *)v13[2];
            BOOL v27 = *v26 == (void)v13;
            uint64_t v13 = v26;
          }
          while (!v27);
        }
        uint64_t v13 = v26;
      }
      while (v26 != (void *)((char *)a3 + 8));
    }
  }
  if ([(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator inVisitStatus])
  {
    begin = self->_loiVisitAltitudes.__begin_;
    end = self->_loiVisitAltitudes.__end_;
    if (end != begin)
    {
      double v36 = log(self->_estimatedAbsoluteAltitudeUncertainty * (self->_estimatedAbsoluteAltitudeUncertainty * 17.0794684));
      double v37 = (int *)((char *)a3 + 8);
      do
      {
        NormalDistribution v57 = *begin;
        double v38 = self->_estimatedAbsoluteAltitudeUncertainty * self->_estimatedAbsoluteAltitudeUncertainty;
        *(double *)&long long v58 = a4;
        *((double *)&v58 + 1) = v38;
        LODWORD(v59) = 1;
        uint64_t v56 = v59;
        v55[0] = v57;
        v55[1] = v58;
        [(CLBarometerCalibrationBiasEstimator *)self crossEntropyOfreference:v55];
        double v40 = v39;
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        float v41 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136318978;
          uint64_t v96 = "type";
          __int16 v97 = 1024;
          int v98 = 13;
          __int16 v99 = 2080;
          v100 = "crossEntropy";
          __int16 v101 = 2048;
          double v102 = v40;
          __int16 v103 = 2080;
          double v104 = "fromBaroAlt";
          __int16 v105 = 2048;
          unint64_t v106 = v58;
          __int16 v107 = 2080;
          unint64_t v108 = "fromRefAlt";
          __int16 v109 = 2048;
          unint64_t v110 = *(void *)&v57.var0;
          __int16 v111 = 2080;
          float v112 = "baroUncertainty";
          __int16 v113 = 2048;
          double v114 = sqrt(*((double *)&v58 + 1));
          __int16 v115 = 2080;
          double v116 = "refUncertainty";
          __int16 v117 = 2048;
          double v118 = sqrt(v57.var1);
          __int16 v119 = 2080;
          float v120 = "trackStartTime";
          __int16 v121 = 2048;
          double v122 = a5;
          __int16 v123 = 2080;
          double v124 = "trackEndTime";
          __int16 v125 = 2048;
          double v126 = a6;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "altimeter2 cross entropy of,%s,%d,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f,%s,%f", buf, 0x9Eu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          int v63 = 136318978;
          unint64_t v64 = "type";
          __int16 v65 = 1024;
          int v66 = 13;
          __int16 v67 = 2080;
          double v68 = "crossEntropy";
          __int16 v69 = 2048;
          double v70 = v40;
          __int16 v71 = 2080;
          uint64_t v72 = "fromBaroAlt";
          __int16 v73 = 2048;
          unint64_t v74 = v58;
          __int16 v75 = 2080;
          uint64_t v76 = "fromRefAlt";
          __int16 v77 = 2048;
          unint64_t v78 = *(void *)&v57.var0;
          __int16 v79 = 2080;
          uint64_t v80 = "baroUncertainty";
          __int16 v81 = 2048;
          double v82 = sqrt(*((double *)&v58 + 1));
          __int16 v83 = 2080;
          int v84 = "refUncertainty";
          __int16 v85 = 2048;
          double v86 = sqrt(v57.var1);
          __int16 v87 = 2080;
          double v88 = "trackStartTime";
          __int16 v89 = 2048;
          double v90 = a5;
          __int16 v91 = 2080;
          int v92 = "trackEndTime";
          __int16 v93 = 2048;
          double v94 = a6;
          uint64_t v50 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator selectReferenceWithReference:withBaroElevation:betweenStartTime:andEndTime:]", "%s\n", v50);
          if (v50 != (char *)buf) {
            free(v50);
          }
        }
        if (v36 >= v40)
        {
          int v62 = 13;
          double v42 = *(char **)v37;
          if (!*(void *)v37) {
            goto LABEL_45;
          }
          double v43 = (int *)((char *)a3 + 8);
          do
          {
            int v44 = *((_DWORD *)v42 + 8);
            BOOL v45 = v44 < 13;
            if (v44 >= 13) {
              double v46 = (char **)v42;
            }
            else {
              double v46 = (char **)(v42 + 8);
            }
            if (!v45) {
              double v43 = (int *)v42;
            }
            double v42 = *v46;
          }
          while (*v46);
          if (v43 != v37 && v43[8] < 14)
          {
            uint64_t v47 = sub_1000A43BC((uint64_t)a3, &v62);
            int v48 = v59;
            long long v49 = v58;
            *(NormalDistribution *)uint64_t v47 = v57;
            *((_OWORD *)v47 + 1) = v49;
            *((_DWORD *)v47 + 8) = v48;
          }
          else
          {
LABEL_45:
            sub_1006CDDC4((uint64_t **)a3, &v62, &v62, (uint64_t)&v57);
          }
          self->_loiRebase = 1;
          double v36 = v40;
        }
        ++begin;
      }
      while (begin != end);
    }
  }
  return v62;
}

- (void)updateBiasUncertaintyWithAbsSigElevation:(double)a3 withCompanion:(BOOL)a4
{
  BOOL v4 = a4;
  sub_100096374((uint64_t)v20, (void *)self->_dataBuffers + 6);
  double v7 = (uint64_t *)(*(void *)(v20[1] + (((unint64_t)(v22 + v21 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                 + 16 * (v22 + v21 - 1));
  uint64_t v8 = *v7;
  uint64_t v9 = (std::__shared_weak_count *)v7[1];
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  float v10 = *(double *)(v8 + 8) * 1000.0;
  float v11 = sub_1001C1F30(v10, 101320.0);
  if (a3 != 1.79769313e308)
  {
    double v12 = v11;
    double bias = self->_bias;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v14 = bias + v12;
    double v15 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double biasUncertaintyAtRebase = self->_biasUncertaintyAtRebase;
      *(_DWORD *)buf = 136316418;
      double v36 = "takeMaxForPhone";
      __int16 v37 = 1024;
      BOOL v38 = v4;
      __int16 v39 = 2080;
      double v40 = "bayesianInferenceResult";
      __int16 v41 = 2048;
      double v42 = biasUncertaintyAtRebase;
      __int16 v43 = 2080;
      int v44 = "diffOfAbsSigElevationAndAbsAltitude";
      __int16 v45 = 2048;
      double v46 = vabdd_f64(a3, v14);
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "re-initialize bias uncertainty with,%s,%d,%s,%f,%s,%f", buf, 0x3Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v18 = self->_biasUncertaintyAtRebase;
      int v23 = 136316418;
      double v24 = "takeMaxForPhone";
      __int16 v25 = 1024;
      BOOL v26 = v4;
      __int16 v27 = 2080;
      int v28 = "bayesianInferenceResult";
      __int16 v29 = 2048;
      double v30 = v18;
      __int16 v31 = 2080;
      double v32 = "diffOfAbsSigElevationAndAbsAltitude";
      __int16 v33 = 2048;
      double v34 = vabdd_f64(a3, v14);
      double v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateBiasUncertaintyWithAbsSigElevation:withCompanion:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    double v17 = vabdd_f64(a3, v14);
    if (v4)
    {
      if (self->_biasUncertaintyAtRebase >= v17) {
        double v17 = self->_biasUncertaintyAtRebase;
      }
    }
    else
    {
      double v17 = v17 + self->_biasUncertaintyAtRebase;
    }
    self->_double biasUncertaintyAtRebase = v17;
  }
  if (v9) {
    sub_1000DB0A0(v9);
  }
  sub_1000DAF68(v20);
}

- (void)rebaseSignificantElevationWithEndTime:(double)a3
{
  if (([(CLBarometerCalibrationContextClient *)self->_delegate isInVisit] & 1) == 0)
  {
    double v11 = 0.0;
    if ([(CLBarometerCalibrationBiasEstimator *)self getLastPressureSample:&v11])
    {
      float v5 = v11;
      float v6 = sub_1001C1F30(v5, 101320.0);
      sub_1008B00F0((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, self->_bias + v6, self->_bias, v7, v8);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      uint64_t v9 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        double v17 = "endTrackTime";
        __int16 v18 = 2048;
        double v19 = a3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "significant elevation rebase: %s,%f", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        int v12 = 136315394;
        uint64_t v13 = "endTrackTime";
        __int16 v14 = 2048;
        double v15 = a3;
        float v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator rebaseSignificantElevationWithEndTime:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
    }
  }
}

- (void)updateLoiInfo:(const void *)a3
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if ([(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator inVisitStatus])
  {
    float v6 = *(char **)a3;
    uint64_t v7 = *((void *)a3 + 1);
    if (v7 == *(void *)a3)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v15 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFAbsoluteTime v18 = Current;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "receive visit in bias estimator with no loi,timestamp,%f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        long long v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateLoiInfo:]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
    }
    else
    {
      if (self->_enableLoiRebase && &self->_loiVisitAltitudes != a3)
      {
        sub_10027C3B4((char *)&self->_loiVisitAltitudes, v6, v7, (v7 - *(void *)a3) >> 4);
        float v6 = *(char **)a3;
        uint64_t v7 = *((void *)a3 + 1);
      }
      if ((char *)v7 != v6)
      {
        uint64_t v8 = 0;
        unint64_t v9 = 0;
        do
        {
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          float v10 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
          {
            double v11 = (uint64_t *)(*(void *)a3 + v8);
            uint64_t v13 = *v11;
            uint64_t v12 = v11[1];
            *(_DWORD *)buf = 134218496;
            CFAbsoluteTime v18 = Current;
            __int16 v19 = 2048;
            uint64_t v20 = v13;
            __int16 v21 = 2048;
            uint64_t v22 = v12;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "receive visit loi in bias estimator,timestamp,%f,loiAltitude,%f,loiVerticalVariance,%f", buf, 0x20u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C4A70);
            }
            __int16 v14 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateLoiInfo:]", "%s\n", v14);
            if (v14 != (char *)buf) {
              free(v14);
            }
          }
          ++v9;
          v8 += 16;
        }
        while (v9 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4);
      }
    }
  }
}

- (void)sendVisitExitWifiImprovementAnalyticsEventWithDuration:(double)a3 uncertaintyAtVisitEntry:(double)a4 uncertaintyAtVisitExit:(double)a5 timeDiffBtwArrivalAndLastRebase:(double)a6
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C4A70);
  }
  float v10 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    double v13 = a3;
    __int16 v14 = 2048;
    double v15 = a4;
    __int16 v16 = 2048;
    double v17 = a5;
    __int16 v18 = 2048;
    double v19 = a6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sent visit exit information to CoreAnalytics,visitDuration,%f,arrivalUncertainty,%f,exitUncertainty,%f,timeDiffBtwArrivalAndLastRebase,%f", buf, 0x2Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator sendVisitExitWifiImprovementAnalyticsEventWithDuration:uncertaintyAtVisitEntry:uncertaintyAtVisitExit:timeDiffBtwArrivalAndLastRebase:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  AnalyticsSendEventLazy();
}

- (void)updateVisitState:(BOOL)a3 arrivalTime:(double)a4 departureTime:(double)a5
{
  BOOL v7 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if ([(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator inVisitStatus] != v7)
  {
    meanSeaLevelPressureEstimator = self->_meanSeaLevelPressureEstimator;
    if (v7)
    {
      [(CLMeanSeaLevelPressureEstimator *)meanSeaLevelPressureEstimator setCumulativeStartTime:1.79769313e308];
    }
    else
    {
      [(CLMeanSeaLevelPressureEstimator *)meanSeaLevelPressureEstimator setFirstRefreshAfterVisit:1];
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator resetInVisitRebasedMslp];
      [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator setExitVisitTimestamp:a5];
      self->_loiVisitAltitudes.__end_ = self->_loiVisitAltitudes.__begin_;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v11 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator exitVisitTimestamp];
        *(_DWORD *)buf = 134217984;
        *(void *)double v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "received exit visit,timestamp,%f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator exitVisitTimestamp];
        double v34 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v34);
        if (v34 != (char *)buf) {
          free(v34);
        }
      }
    }
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator setInVisitStatus:v7];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v13 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)double v36 = v7;
      *(_WORD *)&v36[4] = 2048;
      *(CFAbsoluteTime *)&v36[6] = Current;
      *(_WORD *)&v36[14] = 2048;
      *(double *)&v36[16] = a4;
      *(_WORD *)&v36[24] = 2048;
      *(double *)&v36[26] = a5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "visit state changed,visitState,%d,timestamp,%f,arrival,%f,departure,%f", buf, 0x26u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v32 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v32);
      if (v32 != (char *)buf) {
        free(v32);
      }
    }
    [(CLMeanSeaLevelPressureEstimator *)self->_meanSeaLevelPressureEstimator saveInVisitStateToPlist];
  }
  id v14 = [(CLBarometerCalibrationContextClient *)self->_delegate latestAbsoluteAltitude];
  double v15 = v14;
  if (v7)
  {
    self->_lastVisitEntryTime = Current;
    if (v14)
    {
      [v14 timestamp];
      if (v16 != 1.79769313e308 && self->_lastRebaseTimestamp != 1.79769313e308)
      {
        [v15 accuracy];
        self->_double uncertaintyAtVisitEntry = v17;
        self->_double timeDiffBtwVisitEntryAndLastRebase = Current - self->_lastRebaseTimestamp;
        self->_double visitArrivalTimestamp = Current;
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        __int16 v18 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          double uncertaintyAtVisitEntry = self->_uncertaintyAtVisitEntry;
          double timeDiffBtwVisitEntryAndLastRebase = self->_timeDiffBtwVisitEntryAndLastRebase;
          double visitArrivalTimestamp = self->_visitArrivalTimestamp;
          *(_DWORD *)buf = 134218496;
          *(double *)double v36 = uncertaintyAtVisitEntry;
          *(_WORD *)&v36[8] = 2048;
          *(double *)&v36[10] = visitArrivalTimestamp;
          *(_WORD *)&v36[18] = 2048;
          *(double *)&v36[20] = timeDiffBtwVisitEntryAndLastRebase;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "record coreAnalytics event data,uncertaintyAtVisitEntry,%f,visitArrivalTimestamp,%f,timeDiffBtwVisitEntryAndLastRebase,%f", buf, 0x20u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          uint64_t v22 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v22);
          if (v22 != (char *)buf) {
            free(v22);
          }
        }
      }
    }
  }
  else
  {
    if (!v14
      || ([v14 timestamp], v23 == 1.79769313e308)
      || (double v24 = self->_visitArrivalTimestamp, v24 == 1.79769313e308))
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      int v28 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        double v29 = self->_visitArrivalTimestamp;
        *(_DWORD *)buf = 134217984;
        *(double *)double v36 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "fail to send visit exit event to CA,visitArrivalTimestamp,%f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        __int16 v33 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v33);
        if (v33 != (char *)buf) {
          free(v33);
        }
      }
    }
    else
    {
      double v25 = Current - v24;
      if (Current - v24 >= 0.0)
      {
        double v30 = self->_uncertaintyAtVisitEntry;
        [v15 accuracy];
        [(CLBarometerCalibrationBiasEstimator *)self sendVisitExitWifiImprovementAnalyticsEventWithDuration:v25 / 60.0 uncertaintyAtVisitEntry:v30 uncertaintyAtVisitExit:v31 timeDiffBtwArrivalAndLastRebase:self->_timeDiffBtwVisitEntryAndLastRebase / 60.0];
      }
      else
      {
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C4A70);
        }
        BOOL v26 = qword_1024191E8;
        if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "visit exit timestamp is earlier than visit entry timestamp.", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C4A70);
          }
          __int16 v27 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator updateVisitState:arrivalTime:departureTime:]", "%s\n", v27);
          if (v27 != (char *)buf) {
            free(v27);
          }
        }
      }
      if (a4 > 0.0) {
        [(CLBarometerCalibrationBiasEstimator *)self sendVisitExitAnalyticsWithDuration:&self->_firstRebaseEventInVisit andRebaseEvent:(a5 - a4) / 60.0 andUncertaintyAtEntry:self->_uncertaintyAtVisitEntry];
      }
    }
    self->_double visitArrivalTimestamp = 1.79769313e308;
  }
}

- (void)sendRebaseAnalyticsWithAltitudeError:(double)a3 andUncertainty:(double)a4 andRefUncertainty:(double)a5 andDemAvailable:(BOOL)a6 andWorkout:(BOOL)a7 andReferenceSource:(int)a8 andCorrection:(double)a9 andDistance:(double)a10
{
  float v18 = a3;
  float v19 = fabsf(v18);
  double v70 = 0;
  uint64_t v71 = 0;
  __int16 v69 = 0;
  sub_10010F834(&v69, (const void *)qword_10247CDF8, qword_10247CE00, (qword_10247CE00 - qword_10247CDF8) >> 2);
  sub_1003B1E08((uint64_t)&v69, &v72, v19);
  if (v69)
  {
    double v70 = v69;
    operator delete(v69);
  }
  int v66 = 0;
  uint64_t v67 = 0;
  __int16 v65 = 0;
  sub_10010F834(&v65, (const void *)qword_10247CDE0, qword_10247CDE8, (qword_10247CDE8 - qword_10247CDE0) >> 2);
  float v20 = a5;
  sub_1003B1E08((uint64_t)&v65, &v68, v20);
  if (v65)
  {
    int v66 = v65;
    operator delete(v65);
  }
  uint64_t v63 = 0;
  __p = 0;
  int v62 = 0;
  sub_10010F834(&__p, (const void *)qword_10247CDE0, qword_10247CDE8, (qword_10247CDE8 - qword_10247CDE0) >> 2);
  float v21 = a4;
  sub_1003B1E08((uint64_t)&__p, &v64, v21);
  if (__p)
  {
    int v62 = __p;
    operator delete(__p);
  }
  uint64_t v59 = 0;
  NormalDistribution v57 = 0;
  long long v58 = 0;
  sub_10010F834(&v57, (const void *)qword_10247CDF8, qword_10247CE00, (qword_10247CE00 - qword_10247CDF8) >> 2);
  float v22 = a9;
  sub_1003B1E08((uint64_t)&v57, &v60, fabsf(v22));
  if (v57)
  {
    long long v58 = v57;
    operator delete(v57);
  }
  if (self->_previousBiasTimestamp == 1.79769313e308)
  {
    float v23 = CFAbsoluteTimeGetCurrent() - self->_locationdStartTime;
    float v24 = fabsf(v23);
  }
  else
  {
    float v24 = -1.0;
  }
  uint64_t v55 = 0;
  double v53 = 0;
  double v54 = 0;
  sub_10010F834(&v53, (const void *)qword_10247CE10, qword_10247CE18, (qword_10247CE18 - qword_10247CE10) >> 2);
  sub_1003B1E08((uint64_t)&v53, &__src, v24);
  if (v53)
  {
    double v54 = v53;
    operator delete(v53);
  }
  float v25 = -1.0;
  if (self->_previousBiasTimestamp != 1.79769313e308)
  {
    float v26 = CFAbsoluteTimeGetCurrent() - self->_previousBiasTimestamp;
    float v25 = fabsf(v26);
  }
  uint64_t v51 = 0;
  long long v49 = 0;
  uint64_t v50 = 0;
  sub_10010F834(&v49, (const void *)qword_10247CE28, qword_10247CE30, (qword_10247CE30 - qword_10247CE28) >> 2);
  sub_1003B1E08((uint64_t)&v49, &v52, v25);
  if (v49)
  {
    uint64_t v50 = v49;
    operator delete(v49);
  }
  if (self->_lastVisitEntryTime == 1.79769313e308) {
    float v27 = -1.0;
  }
  else {
    float v27 = vabdd_f64(CFAbsoluteTimeGetCurrent(), self->_lastVisitEntryTime) / 60.0;
  }
  uint64_t v47 = 0;
  __int16 v45 = 0;
  double v46 = 0;
  sub_10010F834(&v45, (const void *)qword_10247CE40, qword_10247CE48, (qword_10247CE48 - qword_10247CE40) >> 2);
  sub_1003B1E08((uint64_t)&v45, &v48, v27);
  if (v45)
  {
    double v46 = v45;
    operator delete(v45);
  }
  double v42 = 0;
  uint64_t v43 = 0;
  __int16 v41 = 0;
  sub_10010F834(&v41, (const void *)qword_10247CE58, qword_10247CE60, (qword_10247CE60 - qword_10247CE58) >> 2);
  float v28 = a10;
  sub_1003B1E08((uint64_t)&v41, &v44, v28);
  if (v41)
  {
    double v42 = v41;
    operator delete(v41);
  }
  *(float32x2_t *)&long long v31 = vcvt_f32_f64((float64x2_t)self->_biasLocation);
  BYTE8(v31) = [(CLBarometerCalibrationContextClient *)self->_delegate isInVisit];
  BYTE9(v31) = a6;
  BOOL v29 = self->_lastForcedGpsTime != 1.79769313e308 && CFAbsoluteTimeGetCurrent() - self->_lastForcedGpsTime < 546.0;
  BYTE10(v31) = v29;
  HIDWORD(v31) = a8;
  LOBYTE(v32) = a7;
  HIBYTE(v32) = self->_previousBiasTimestamp == 1.79769313e308;
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000DC48C(&v33, v72.__r_.__value_.__l.__data_, v72.__r_.__value_.__l.__size_);
  }
  else {
    std::string v33 = v72;
  }
  if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000DC48C(&v34, __src.__r_.__value_.__l.__data_, __src.__r_.__value_.__l.__size_);
  }
  else {
    std::string v34 = __src;
  }
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000DC48C(&v35, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
  }
  else {
    std::string v35 = v68;
  }
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000DC48C(&v36, v64.__r_.__value_.__l.__data_, v64.__r_.__value_.__l.__size_);
  }
  else {
    std::string v36 = v64;
  }
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000DC48C(&v37, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
  }
  else {
    std::string v37 = v48;
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000DC48C(&v38, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
  }
  else {
    std::string v38 = v52;
  }
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000DC48C(&v39, v60.__r_.__value_.__l.__data_, v60.__r_.__value_.__l.__size_);
  }
  else {
    std::string v39 = v60;
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    sub_1000DC48C(&v40, v44.__r_.__value_.__l.__data_, v44.__r_.__value_.__l.__size_);
  }
  else {
    std::string v40 = v44;
  }
  if (self->_lastVisitEntryTime != 1.79769313e308)
  {
    *(_OWORD *)&self->_firstRebaseEventInVisit.double latitude = v31;
    *(_WORD *)&self->_firstRebaseEventInVisit.inOutdoorWorkout = v32;
    std::string::operator=((std::string *)&self->_firstRebaseEventInVisit.altitudeError_binned, &v33);
    std::string::operator=((std::string *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.var0, &v34);
    std::string::operator=((std::string *)&self->_anon_160[8], &v35);
    std::string::operator=((std::string *)&self->_anon_160[32], &v36);
    std::string::operator=((std::string *)&self->_anon_160[56], &v37);
    std::string::operator=((std::string *)&self->_anon_160[80], &v38);
    std::string::operator=((std::string *)&self->_anon_160[104], &v39);
    std::string::operator=((std::string *)&self->_anon_160[128], &v40);
  }
  sub_1006CD5E8((uint64_t)v30, &v31);
  AnalyticsSendEventLazy();
  self->_previousBiasTimestamp = self->_biasTimestamp;
  self->_lastVisitEntryTime = 1.79769313e308;
  self->_distanceSinceLastRebase = -1.0;
  sub_1006CD868((uint64_t)v30);
  sub_1006CD868((uint64_t)&v31);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__src.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v60.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v64.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v68.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v72.__r_.__value_.__l.__data_);
  }
}

- (void)sendVisitExitAnalyticsWithDuration:(double)a3 andRebaseEvent:(void *)a4 andUncertaintyAtEntry:(double)a5
{
  float v7 = a3;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  double v54 = 0;
  sub_10010F834(&v54, (const void *)qword_10247CE70, qword_10247CE78, (qword_10247CE78 - qword_10247CE70) >> 2);
  sub_1003B1E08((uint64_t)&v54, &v57, v7);
  if (v54)
  {
    uint64_t v55 = v54;
    operator delete(v54);
  }
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  long long v49 = 0;
  sub_10010F834(&v49, (const void *)qword_10247CDE0, qword_10247CDE8, (qword_10247CDE8 - qword_10247CDE0) >> 2);
  float v8 = a5;
  sub_1003B1E08((uint64_t)&v49, &v52, v8);
  if (v49)
  {
    uint64_t v50 = v49;
    operator delete(v49);
  }
  int rebaseSource = self->_firstRebaseEventInVisit.rebaseSource;
  if (SHIBYTE(v53) < 0)
  {
    sub_1000DC48C(&v35, (void *)v52, *((unint64_t *)&v52 + 1));
  }
  else
  {
    long long v35 = v52;
    uint64_t v36 = v53;
  }
  if ((char)self->_anon_160[55] < 0)
  {
    sub_1000DC48C(&v37, *(void **)&self->_anon_160[32], *(void *)&self->_anon_160[40]);
  }
  else
  {
    long long v37 = *(_OWORD *)&self->_anon_160[32];
    uint64_t v38 = *(void *)&self->_anon_160[48];
  }
  if (SHIBYTE(v58) < 0)
  {
    sub_1000DC48C(&v39, (void *)v57, *((unint64_t *)&v57 + 1));
  }
  else
  {
    long long v39 = v57;
    uint64_t v40 = v58;
  }
  if ((char)self->_anon_160[79] < 0)
  {
    sub_1000DC48C(&v41, *(void **)&self->_anon_160[56], *(void *)&self->_anon_160[64]);
  }
  else
  {
    long long v41 = *(_OWORD *)&self->_anon_160[56];
    uint64_t v42 = *(void *)&self->_anon_160[72];
  }
  if (*((char *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1 + 23) < 0)
  {
    sub_1000DC48C(&v43, self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1.__data_, self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1.__size_);
  }
  else
  {
    long long v43 = *(_OWORD *)self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var0.__data_;
    uint64_t v44 = *((void *)&self->_firstRebaseEventInVisit.altitudeError_binned.__r_.__value_.var0.var1 + 2);
  }
  if ((char)self->_anon_160[31] < 0)
  {
    sub_1000DC48C(&v45, *(void **)&self->_anon_160[8], *(void *)&self->_anon_160[16]);
  }
  else
  {
    long long v45 = *(_OWORD *)&self->_anon_160[8];
    uint64_t v46 = *(void *)&self->_anon_160[24];
  }
  if ((char)self->_anon_160[127] < 0)
  {
    sub_1000DC48C(&v47, *(void **)&self->_anon_160[104], *(void *)&self->_anon_160[112]);
  }
  else
  {
    long long v47 = *(_OWORD *)&self->_anon_160[104];
    uint64_t v48 = *(void *)&self->_anon_160[120];
  }
  v18[3] = _NSConcreteStackBlock;
  v18[4] = 3321888768;
  v18[5] = sub_1006CCCD4;
  v18[6] = &unk_1022C4A40;
  sub_1006CD90C((uint64_t)&v19, (uint64_t)&rebaseSource);
  AnalyticsSendEventLazy();
  *(_DWORD *)((char *)&v9 + 7) = 0;
  *(void *)&long long v9 = 0;
  HIDWORD(v9) = -10;
  __int16 v10 = 0;
  sub_100134750(v11, "NULL");
  sub_100134750(v12, "NULL");
  sub_100134750(v13, "NULL");
  sub_100134750(v14, "NULL");
  sub_100134750(v15, "NULL");
  sub_100134750(v16, "NULL");
  sub_100134750(v17, "NULL");
  sub_100134750(v18, "NULL");
  sub_1006CCE90((uint64_t)&self->_firstRebaseEventInVisit, &v9);
  sub_1006CD868((uint64_t)&v9);
  if (v33 < 0) {
    operator delete(__p);
  }
  if (v31 < 0) {
    operator delete(v30);
  }
  if (v29 < 0) {
    operator delete(v28);
  }
  if (v27 < 0) {
    operator delete(v26);
  }
  if (v25 < 0) {
    operator delete(v24);
  }
  if (v23 < 0) {
    operator delete(v22);
  }
  if (v21 < 0) {
    operator delete(v20);
  }
  if (SHIBYTE(v48) < 0) {
    operator delete((void *)v47);
  }
  if (SHIBYTE(v46) < 0) {
    operator delete((void *)v45);
  }
  if (SHIBYTE(v44) < 0) {
    operator delete((void *)v43);
  }
  if (SHIBYTE(v42) < 0) {
    operator delete((void *)v41);
  }
  if (SHIBYTE(v40) < 0) {
    operator delete((void *)v39);
  }
  if (SHIBYTE(v38) < 0) {
    operator delete((void *)v37);
  }
  if (SHIBYTE(v36) < 0) {
    operator delete((void *)v35);
  }
  if (SHIBYTE(v53) < 0) {
    operator delete((void *)v52);
  }
  if (SHIBYTE(v58) < 0) {
    operator delete((void *)v57);
  }
}

- (void)announceMostRecentForcedGPS:(double)a3
{
  self->_lastForcedGpsTime = a3;
}

- (void)retrieveBiasInfo
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v24 = 1.79769313e308;
  double v25 = 1.79769313e308;
  double v22 = 0.0;
  *(double *)&uint64_t v23 = 1.79769313e308;
  *(double *)&uint64_t v20 = 101325.0;
  double v21 = -800.0;
  uint64_t v4 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v4 + 936))();
  uint64_t v5 = sub_1000A6958();
  sub_1000A699C(v5, "CLBarometerCalibration_Timestamp", &v25);
  uint64_t v6 = sub_1000A6958();
  sub_1000A699C(v6, "CLBarometerCalibratio_Bias", &v24);
  uint64_t v7 = sub_1000A6958();
  sub_1000A699C(v7, "CLBarometerCalibration_Uncertainty", &v23);
  uint64_t v8 = sub_1000A6958();
  sub_1000A699C(v8, "CLBarometerCalibration_Weather", &v22);
  uint64_t v9 = sub_1000A6958();
  sub_1000A699C(v9, "CLBarometerCalibration_SignificantElevation", &v21);
  uint64_t v10 = sub_1000A6958();
  sub_1000A699C(v10, "CLBarometerCalibration_BiasPressure", &v20);
  double v11 = v25;
  if (v25 == 1.79769313e308 || Current - v25 >= self->_maxBiasAgeFromRecovery || (double v12 = v24, v24 == 1.79769313e308))
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    float v18 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "state is too old to be recovered", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      LOWORD(v26) = 0;
      goto LABEL_23;
    }
  }
  else
  {
    self->_double biasTimestamp = v25;
    double v13 = *(double *)&v20;
    self->_double bias = v12;
    self->_double biasPressure = v13;
    double v14 = *(double *)&v23;
    self->_double biasUncertaintyTimestamp = v11;
    self->_double biasUncertaintyAtRebase = v14;
    self->_double biasUncertainty = v14;
    sub_1008B0944((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v22);
    if (v21 != -800.0) {
      sub_1008B0950((uint64_t)self->_fSignificantElevationEstimatorRebase.__ptr_.__value_, v21);
    }
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C4A70);
    }
    double v15 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double biasPressure = self->_biasPressure;
      *(_DWORD *)buf = 134219264;
      double v39 = v25;
      __int16 v40 = 2048;
      double v41 = v24;
      __int16 v42 = 2048;
      uint64_t v43 = v23;
      __int16 v44 = 2048;
      double v45 = v22;
      __int16 v46 = 2048;
      double v47 = v21;
      __int16 v48 = 2048;
      double v49 = biasPressure;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "recovering from locationd crash, timestamp %f, bias, %f, uncertainty, %f, weather, %f, sig elev, %f, pressure, %f", buf, 0x3Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C4A70);
      }
      double v17 = self->_biasPressure;
      int v26 = 134219264;
      double v27 = v25;
      __int16 v28 = 2048;
      double v29 = v24;
      __int16 v30 = 2048;
      uint64_t v31 = v23;
      __int16 v32 = 2048;
      double v33 = v22;
      __int16 v34 = 2048;
      double v35 = v21;
      __int16 v36 = 2048;
      double v37 = v17;
LABEL_23:
      uint64_t v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLBarometerCalibrationBiasEstimator retrieveBiasInfo]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
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

- (void).cxx_destruct
{
  sub_1006CD868((uint64_t)&self->_firstRebaseEventInVisit);
  begin = self->_loiVisitAltitudes.__begin_;
  if (begin)
  {
    self->_loiVisitAltitudes.__end_ = begin;
    operator delete(begin);
  }
  value = self->_fSignificantElevationEstimatorRebase.__ptr_.__value_;
  p_fSignificantElevationEstimatorRebase = &self->_fSignificantElevationEstimatorRebase;
  uint64_t v4 = (uint64_t)value;
  p_fSignificantElevationEstimatorRebase->__ptr_.__value_ = 0;
  if (value)
  {
    sub_1006CDD68((uint64_t)p_fSignificantElevationEstimatorRebase, v4);
  }
}

- (id).cxx_construct
{
  self->_fSignificantElevationEstimatorRebase.__ptr_.__value_ = 0;
  self->_biasLocation = (BiasEstimatorLocation)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  self->_loiVisitAltitudes.__end_ = 0;
  self->_loiVisitAltitudes.__end_cap_.__value_ = 0;
  self->_loiVisitAltitudes.__begin_ = 0;
  sub_1006CDBC8((uint64_t)&self->_firstRebaseEventInVisit);
  return self;
}

@end