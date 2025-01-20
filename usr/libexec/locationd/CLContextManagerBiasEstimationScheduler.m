@interface CLContextManagerBiasEstimationScheduler
- (BOOL)isRefDataAvailableBetweenStartTime:(double)a3 andEndTime:(double)a4;
- (BOOL)shouldStartNewTrack:(unint64_t)a3;
- (CLContextManagerBiasEstimationScheduler)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (double)getTrackLengthSecondsForSource:(unint64_t)a3;
- (id).cxx_construct;
- (uint64_t)stepCountElevationNotification:(uint64_t)a3;
- (void)dealloc;
- (void)sendTrackAndScheduleNextTick:(double)a3;
- (void)sourceUpdated:(unint64_t)currentSource;
- (void)wetStateUpdated:(unint64_t)a3;
@end

@implementation CLContextManagerBiasEstimationScheduler

- (uint64_t)stepCountElevationNotification:(uint64_t)a3
{
  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    double v6 = *(double *)(a3 + 8);
    [v5 fStartTime];
    double v8 = v6 - v7;
    *(double *)(a1 + 80) = v8;
    double v9 = *(double *)(a1 + 88);
    if (v9 > 0.0 && v8 >= v9) {
      [(id)a1 sendTrackAndScheduleNextTick:*(double *)(a3 + 8)];
    }
  }
  sub_100096374((uint64_t)v15, (void *)(*(void *)(a1 + 24) + 48));
  if (v17)
  {
    v11 = (uint64_t *)(*(void *)(v15[1] + (((unint64_t)(v17 + v16 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                    + 16 * (v17 + v16 - 1));
    uint64_t v13 = *v11;
    v12 = (std::__shared_weak_count *)v11[1];
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [*(id *)(a1 + 16) updateEstimatedWeatherWithCumulativeAscendingDelta:*(unsigned int *)(a3 + 16) andDescendingDelta:*(unsigned int *)(a3 + 20) andIosTimestamp:*(double *)(a3 + 8)];
    [*(id *)(a1 + 16) updateBiasUncertaintyWithPressure:*(double *)(v13 + 8) * 1000.0 andTime:*(double *)(a3 + 8) andLat:1.79769313e308 andLon:1.79769313e308];
    if (v12) {
      sub_1000DB0A0(v12);
    }
  }
  return sub_1000DAF68(v15);
}

- (void)sourceUpdated:(unint64_t)currentSource
{
  if (-[CLContextManagerBiasEstimationScheduler shouldStartNewTrack:](self, "shouldStartNewTrack:"))
  {
    self->_currentSource = currentSource;
    if (!self->_currentTrack)
    {
      if (currentSource >= 0xA) {
        sub_10000EDDC("array::at");
      }
      v5 = (char *)self->super.fDataBuffers + 48 * currentSource;
      double v6 = **(double **)(*(void *)(v5[1] + (((unint64_t)(v5[5] + v5[4] - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
                       + 16 * (*((unsigned char *)v5 + 40) + *((unsigned char *)v5 + 32) - 1));
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230F130);
      }
      double v7 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        double v13 = v6;
        __int16 v14 = 1024;
        int v15 = currentSource;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "New reference data, starting track, TrackStartTime %f, reference type %d", buf, 0x12u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_10230F130);
        }
        v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler sourceUpdated:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
      [(CLBarometerCalibrationSourceAggregator *)self->super._sourceAggregator enableSources:&off_102398040 forContext:self];
      double v8 = [[CLBarometerCalibrationTrack alloc] initWithContextType:6 forNotification:2 startTime:v6];
      self->_currentTrack = v8;
      [(CLBarometerCalibrationTrack *)v8 fStartTime];
      self->_lastTrackEndTime = v9 + -0.1;
      currentSource = self->_currentSource;
    }
    [(CLContextManagerBiasEstimationScheduler *)self getTrackLengthSecondsForSource:currentSource];
    self->_waitPeriodSeconds = v10;
  }
}

- (BOOL)shouldStartNewTrack:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (CLContextManagerBiasEstimationScheduler)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CLContextManagerBiasEstimationScheduler;
  double v6 = [(CLBarometerCalibrationContextManager *)&v14 initWithUniverse:a3 delegate:a4 withBuffer:a5 withSourceAggregator:a6];
  double v7 = v6;
  if (v6)
  {
    v6->_currentTrack = 0;
    [(CLBarometerCalibrationSourceAggregator *)v6->super._sourceAggregator enableSources:&off_102398028 forContext:v6];
    v13[0] = 180;
    sub_10044FD20(buf, "BarometerCalibrationBiasEstimationTrackPeriod", v13, 0);
    double v8 = (double)*(int *)&buf[4];
    v7->_biasEstimationTrackPeriodSeconds = (double)*(int *)&buf[4];
    v7->_double biasEstimationTrackDataBufferSizeSeconds = v8 + v8;
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230F130);
    }
    double v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Bias Scheduler Context created", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230F130);
      }
      LOWORD(v13[0]) = 0;
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler initWithUniverse:delegate:withBuffer:withSourceAggregator:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    v7->_waitPeriodSeconds = -1.0;
    v7->_currentSource = 10;
    double biasEstimationTrackDataBufferSizeSeconds = v7->_biasEstimationTrackDataBufferSizeSeconds;
    *(void *)buf = 0;
    *(double *)&buf[8] = biasEstimationTrackDataBufferSizeSeconds;
    sub_1010BE9FC((uint64_t **)&v7->_trackLengthSecondsForSource, (unint64_t *)buf, (uint64_t *)buf);
    *(_OWORD *)buf = xmmword_101DA6530;
    sub_1010BE9FC((uint64_t **)&v7->_trackLengthSecondsForSource, (unint64_t *)buf, (uint64_t *)buf);
    v7->_lastWetStateTimestamp = 1.79769313e308;
  }
  return v7;
}

- (void)dealloc
{
  [(CLBarometerCalibrationSourceAggregator *)self->super._sourceAggregator disableSources:&off_102398028 forContext:self];
  [(CLBarometerCalibrationSourceAggregator *)self->super._sourceAggregator disableSources:&off_102398040 forContext:self];
  v3.receiver = self;
  v3.super_class = (Class)CLContextManagerBiasEstimationScheduler;
  [(CLBarometerCalibrationContextManager *)&v3 dealloc];
}

- (double)getTrackLengthSecondsForSource:(unint64_t)a3
{
  unint64_t v4 = a3;
  v5 = &v4;
  return *((double *)sub_10017C9B0((uint64_t **)&self->_trackLengthSecondsForSource, &v4, (uint64_t)&unk_101D0B290, (uint64_t **)&v5)+ 5);
}

- (void)sendTrackAndScheduleNextTick:(double)a3
{
  [(CLBarometerCalibrationTrack *)self->_currentTrack setFEndTime:a3];
  double lastTrackEndTime = self->_lastTrackEndTime;
  [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime];
  uint64_t v6 = v5;
  double v7 = self->_lastTrackEndTime;
  [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime];
  if ([(CLContextManagerBiasEstimationScheduler *)self isRefDataAvailableBetweenStartTime:v7 andEndTime:v8])
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230F130);
    }
    double v9 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      double waitPeriodSeconds = self->_waitPeriodSeconds;
      *(_DWORD *)buf = 136315394;
      *(void *)v34 = "WaitPeriodInSeconds";
      *(_WORD *)&v34[8] = 2048;
      *(double *)&v34[10] = waitPeriodSeconds;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calibration track wait period,%s %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230F130);
      }
      v31 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler sendTrackAndScheduleNextTick:]", "%s\n", v31);
      if (v31 != (char *)buf) {
        free(v31);
      }
    }
    [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime];
    double v12 = v11 + self->_waitPeriodSeconds * -50.0 / 100.0;
    [(CLBarometerCalibrationTrack *)self->_currentTrack setFNextTrackStartTime:v12];
    double lastWetStateTimestamp = self->_lastWetStateTimestamp;
    [(CLBarometerCalibrationTrack *)self->_currentTrack fStartTime];
    if (lastWetStateTimestamp >= v14
      && (double v15 = self->_lastWetStateTimestamp,
          [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime],
          v15 <= v16))
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230F130);
      }
      v24 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [(CLBarometerCalibrationTrack *)self->_currentTrack fStartTime];
        uint64_t v26 = v25;
        [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime];
        double v27 = self->_lastWetStateTimestamp;
        *(_DWORD *)buf = 134218496;
        *(void *)v34 = v26;
        *(_WORD *)&v34[8] = 2048;
        *(void *)&v34[10] = v28;
        *(_WORD *)&v34[18] = 2048;
        *(double *)&v34[20] = v27;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Calibration track with start time %f, end time %f will not be submitted because device was wet at %f", buf, 0x20u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_27;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230F130);
      }
      [(CLBarometerCalibrationTrack *)self->_currentTrack fStartTime];
      [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime];
    }
    else
    {
      [(CLBarometerCalibrationContextClient *)self->super._delegate startTrack:self->_currentTrack];
      [(CLBarometerCalibrationContextClient *)self->super._delegate stopTrack:self->_currentTrack];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230F130);
      }
      uint64_t v17 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
      {
        [(CLBarometerCalibrationTrack *)self->_currentTrack fStartTime];
        uint64_t v19 = v18;
        [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime];
        uint64_t v21 = v20;
        [(CLBarometerCalibrationTrack *)self->_currentTrack fNextTrackStartTime];
        *(_DWORD *)buf = 136316418;
        *(void *)v34 = "startTime";
        *(_WORD *)&v34[8] = 2048;
        *(void *)&v34[10] = v19;
        *(_WORD *)&v34[18] = 2080;
        *(void *)&v34[20] = "endTime";
        *(_WORD *)&v34[28] = 2048;
        *(void *)&v34[30] = v21;
        __int16 v35 = 2080;
        v36 = "nextStartTime";
        __int16 v37 = 2048;
        uint64_t v38 = v22;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Calibration track submitted with,%s,%f,%s,%f,%s,%f", buf, 0x3Eu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_27;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230F130);
      }
      [(CLBarometerCalibrationTrack *)self->_currentTrack fStartTime];
      [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime];
      [(CLBarometerCalibrationTrack *)self->_currentTrack fNextTrackStartTime];
    }
    v32 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler sendTrackAndScheduleNextTick:]", "%s\n", v32);
    if (v32 != (char *)buf) {
      free(v32);
    }
LABEL_27:
    [(CLBarometerCalibrationTrack *)self->_currentTrack fEndTime];
    self->_double lastTrackEndTime = v29;

    self->_currentTrack = [[CLBarometerCalibrationTrack alloc] initWithContextType:6 forNotification:2 startTime:v12];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230F130);
    }
    v30 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)v34 = 0;
      *(_WORD *)&v34[4] = 2082;
      *(void *)&v34[6] = "";
      *(_WORD *)&v34[14] = 2050;
      *(double *)&v34[16] = v12;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Starting new track\", \"TrackStartTime_s\":\"%{public}.09f\"}", buf, 0x1Cu);
    }
    return;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230F130);
  }
  v23 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)v34 = 0;
    *(_WORD *)&v34[4] = 2082;
    *(void *)&v34[6] = "";
    *(_WORD *)&v34[14] = 2050;
    *(double *)&v34[16] = lastTrackEndTime;
    *(_WORD *)&v34[24] = 2050;
    *(void *)&v34[26] = v6;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"No new data, don't start a new track between\", \"TrackStartTime_s\":\"%{public}.09f\", \"TrackStopTime_s\":\"%{public}.09f\"}", buf, 0x26u);
  }

  self->_currentTrack = 0;
  self->_double waitPeriodSeconds = -1.0;
  [(CLBarometerCalibrationSourceAggregator *)self->super._sourceAggregator disableSources:&off_102398040 forContext:self];
}

- (BOOL)isRefDataAvailableBetweenStartTime:(double)a3 andEndTime:(double)a4
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = [&off_102398028 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *(void *)v29;
  do
  {
    uint64_t v9 = 0;
    while (2)
    {
      if (*(void *)v29 != v8) {
        objc_enumerationMutation(&off_102398028);
      }
      unint64_t v10 = (unint64_t)[*(id *)(*((void *)&v28 + 1) + 8 * v9) integerValue];
      if (v10 >= 0xA) {
        sub_10000EDDC("array::at");
      }
      sub_100096374((uint64_t)&v23, (void *)self->super.fDataBuffers + 6 * v10);
      uint64_t v11 = v24;
      uint64_t v12 = v25;
      double v13 = (void *)(v24 + 8 * (v26 >> 8));
      if (v25 == v24) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = *v13 + 16 * v26;
      }
      while (1)
      {
        uint64_t v15 = v12 == v11
            ? 0
            : *(void *)(v11 + (((v27 + v26) >> 5) & 0x7FFFFFFFFFFFFF8)) + 16 * (v27 + v26);
        if (v14 == v15) {
          break;
        }
        uint64_t v17 = *(double **)v14;
        double v16 = *(std::__shared_weak_count **)(v14 + 8);
        if (v16)
        {
          atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
          double v18 = *v17;
          sub_1000DB0A0(v16);
          if (v18 >= a3 && v18 < a4) {
            goto LABEL_31;
          }
        }
        else if (*v17 >= a3 && *v17 < a4)
        {
LABEL_31:
          sub_1000DAF68(&v23);
          return 1;
        }
        v14 += 16;
        if (v14 - *v13 == 4096)
        {
          uint64_t v21 = v13[1];
          ++v13;
          uint64_t v14 = v21;
        }
        uint64_t v11 = v24;
        uint64_t v12 = v25;
      }
      sub_1000DAF68(&v23);
      if ((id)++v9 != v7) {
        continue;
      }
      break;
    }
    id v7 = [&off_102398028 countByEnumeratingWithState:&v28 objects:v32 count:16];
    BOOL result = 0;
  }
  while (v7);
  return result;
}

- (void)wetStateUpdated:(unint64_t)a3
{
  if (a3 == 1)
  {
    self->_double lastWetStateTimestamp = CFAbsoluteTimeGetCurrent();
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230F130);
    }
    unint64_t v4 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      double lastWetStateTimestamp = self->_lastWetStateTimestamp;
      *(_DWORD *)buf = 134217984;
      double v8 = lastWetStateTimestamp;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "biasEstimationScheduler, lastWetTimestamp updated to %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230F130);
      }
      uint64_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerBiasEstimationScheduler wetStateUpdated:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 13) = (char *)self + 112;
  return self;
}

@end