@interface CMStrideCalibrator
- (BOOL)checkValidTrack:(id)a3 associatedEntry:(const CLStepDistance *)a4;
- (BOOL)inOutdoorPedestrianSession;
- (BOOL)isAuthorizedForLocation;
- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3;
- (BOOL)outOfSession;
- (BOOL)queryStrideLengthTracks:(void *)a3;
- (id).cxx_construct;
- (id)calibrationTrackCallback;
- (id)copyHistory;
- (id)initInUniverse:(id)a3 stepCountDb:(shared_ptr<CLStepCountRecorderDb>)a4;
- (int64_t)currentSession;
- (shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)getSpdToKTable;
- (void)addLatestCalData:(id)a3;
- (void)attemptForcedLocation;
- (void)checkForLocationStateTransition;
- (void)checkLocationAuthorization;
- (void)checkTimeToSendNewCAGPSCalibration;
- (void)dealloc;
- (void)feedBodyMetrics:(CLBodyMetrics *)a3;
- (void)fsm:(id)a3 didTransitionFromState:(int)a4 toState:(int)a5;
- (void)fsm:(id)a3 didUpdateLocationAtTime:(double)a4;
- (void)fsm:(id)a3 didYieldTrack:(id)a4;
- (void)onLocationNotification:(const int *)a3 data:(const void *)a4;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onMotionStateNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onRunningFormMetrics:(const FormMetrics *)a3;
- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)quitForcedLocationState;
- (void)sendGPSCoreAnalyticsAndUpdateTime;
- (void)setCalibrationTrackCallback:(id)a3;
- (void)setSession:(int64_t)a3;
- (void)setupCLNotifiers;
- (void)startElevationSpectatorUpdates;
- (void)startElevationUpdates;
- (void)startGpsOdometerSpectatorUpdates;
- (void)startGpsOdometerUpdates;
- (void)startLeechingLocation;
- (void)startLocationUpdates;
- (void)stopElevationSpectatorUpdates;
- (void)stopElevationUpdates;
- (void)stopGpsOdometerSpectatorUpdates;
- (void)stopGpsOdometerUpdates;
- (void)stopLeechingLocation;
- (void)stopLocationUpdates;
- (void)strideCalibrationDatabase:(id)a3 didInsertEntry:(CLStrideCalEntry *)a4;
- (void)teardownCLNotifiers;
- (void)tick:(double)a3;
- (void)tickleArrow;
- (void)updateCalibrationBins:(double)a3;
- (void)updateUserHeight:(int64_t)a3;
@end

@implementation CMStrideCalibrator

- (void)checkTimeToSendNewCAGPSCalibration
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    v4 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      double lastGPSCalibrationUpdateTime = self->lastGPSCalibrationUpdateTime;
      *(_DWORD *)buf = 134218496;
      double v10 = lastGPSCalibrationUpdateTime;
      __int16 v11 = 2048;
      double v12 = Current;
      __int16 v13 = 2048;
      double v14 = Current - lastGPSCalibrationUpdateTime;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Checking send time in checkTimeToSendNewCAGPSCalibration: LastTime: %0.3f, CurrentTime: %0.3f, Difference: %0.3f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkTimeToSendNewCAGPSCalibration]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    if (Current - self->lastGPSCalibrationUpdateTime >= 28800.0) {
      [(CMStrideCalibrator *)self sendGPSCoreAnalyticsAndUpdateTime];
    }
  }
  else
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    v6 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Not sending gps core analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkTimeToSendNewCAGPSCalibration]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
  {
    [(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer feedStepCountUpdate:a4];
    [(CMStrideCalibrator *)self tick:*((double *)a4 + 2)];
    fStrideCalLocationFSM = self->fStrideCalLocationFSM;
    [(CMStrideCalLocationFSM *)fStrideCalLocationFSM feedPedometerData:a4];
  }
}

- (void)updateCalibrationBins:(double)a3
{
  id v43 = +[NSMutableArray array];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  fLatestCalDataArray = self->fLatestCalDataArray;
  id v6 = [(NSMutableArray *)fLatestCalDataArray countByEnumeratingWithState:&v49 objects:v63 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v50;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v50 != v7) {
          objc_enumerationMutation(fLatestCalDataArray);
        }
        v9 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v8);
        [objc_msgSend(objc_msgSend(objc_msgSend(v9, "track"), "start"), "timeIntervalSinceReferenceDate");
        double v11 = v10;
        [objc_msgSend(objc_msgSend(objc_msgSend(v9, "track"), "stop"), "timeIntervalSinceReferenceDate");
        double v13 = v12;
        double v14 = a3 - v12;
        if (a3 - v12 >= 60.0)
        {
          [(CMStrideCalibrationElevationBuffer *)self->fElevationBuffer updateGradient:v9];
          [v43 addObject:v9];
          if (v14 < 1800.0)
          {
            if (qword_102419030 != -1) {
              dispatch_once(&qword_102419030, &stru_1022CF7C8);
            }
            v15 = qword_102419038;
            if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
            {
              id v16 = [[objc_msgSend(v9, "description") UTF8String];
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = v16;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = a3;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "CalData, %s, stepEntryEpochTime, %f", buf, 0x16u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419030 != -1) {
                dispatch_once(&qword_102419030, &stru_1022CF7C8);
              }
              id v39 = [[objc_msgSend(v9, "description") UTF8String];
              int v53 = 136315394;
              *(void *)v54 = v39;
              *(_WORD *)&v54[8] = 2048;
              double v55 = a3;
              v40 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v40);
              if (v40 != buf) {
                free(v40);
              }
            }
            uint64_t v48 = 0;
            long long v47 = 0u;
            memset(v46, 0, sizeof(v46));
            sub_1015797B4((uint64_t)self->fStepCountDb.__ptr_, 1, (uint64_t)v46, v11, v13);
            if ([v9 gradientValidity])
            {
              if (!-[CMStrideCalibrator checkValidTrack:associatedEntry:](self, "checkValidTrack:associatedEntry:", [v9 track], v46))goto LABEL_48; {
              if (qword_102419030 != -1)
              }
                dispatch_once(&qword_102419030, &stru_1022CF7C8);
              v17 = qword_102419038;
              if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v47;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = DWORD1(v47);
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "FloorsAscended,%d,FloorsDescended,%d", buf, 0xEu);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419030 != -1) {
                  dispatch_once(&qword_102419030, &stru_1022CF7C8);
                }
                int v53 = 67109376;
                *(_DWORD *)v54 = v47;
                *(_WORD *)&v54[4] = 1024;
                *(_DWORD *)&v54[6] = DWORD1(v47);
                v41 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v41);
                if (v41 != buf) {
                  free(v41);
                }
              }
              [objc_msgSend(v9, "track") distanceRawPed];
              double v19 = v18;
              sub_100103240();
              if (sub_10010145C()) {
                unsigned int v20 = [(CMStrideCalibrator *)self inOutdoorPedestrianSession];
              }
              else {
                unsigned int v20 = 0;
              }
              sub_100103240();
              BOOL v23 = sub_100106424();
              double v24 = v19 / (v13 - v11);
              if (!v23) {
                goto LABEL_36;
              }
              if (![(CMStrideCalibrator *)self inOutdoorPedestrianSession])
              {
                BOOL v23 = [(CMStrideCalibrator *)self outOfSession];
                if (v23) {
                  BOOL v23 = [+[CMPedometerTableRawSpeedToKValue sharedInstance] isRawSpeedRun:v24];
                }
LABEL_36:
                if ((v20 | v23) != 1) {
                  goto LABEL_48;
                }
              }
              double v25 = COERCE_DOUBLE([-[CMStrideCalibrationRunningFormBuffer strideLengthFromStartDate:endDate:](self->fFormBuffer, "strideLengthFromStartDate:endDate:", objc_msgSend(objc_msgSend(v9, "track"), "start"), objc_msgSend(objc_msgSend(v9, "track"), "stop"))]);
              uint64_t v27 = v26;
              -[CMPedometerTableRawSpeedToKValue updateBinsWithTrack:](+[CMPedometerTableRawSpeedToKValue sharedInstance](CMPedometerTableRawSpeedToKValue, "sharedInstance"), "updateBinsWithTrack:", [v9 track]);
              -[CMPedometerTableStepCadenceToStrideLength updateBinsWithTrack:](+[CMPedometerTableStepCadenceToStrideLength sharedInstance](CMPedometerTableStepCadenceToStrideLength, "sharedInstance"), "updateBinsWithTrack:", [v9 track]);
              ptr = self->fGPSCalibrationTable.__ptr_;
              if (ptr) {
                sub_10039F9E4((uint64_t)ptr, [v9 track]);
              }
              [(CMStrideCalibrator *)self sendGPSCoreAnalyticsAndUpdateTime];
              uint64_t v62 = 0;
              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              *(_OWORD *)&buf[16] = 0u;
              long long v57 = 0u;
              *(void *)buf = 0;
              *(double *)&buf[8] = v11;
              [+[CMPedometerTableRawSpeedToKValue sharedInstance] kValueForRawSpeed:v24];
              *(void *)&buf[24] = v29;
              [objc_msgSend(v9, "track") distanceGps];
              double v31 = v30;
              [objc_msgSend(v9, "track") distanceRawPed];
              long long v57 = COERCE_UNSIGNED_INT64(v31 / v32);
              *(double *)&long long v58 = v13;
              [objc_msgSend(v9, "track") distanceGps];
              *((void *)&v58 + 1) = v33;
              [objc_msgSend(v9, "track") steps];
              LODWORD(v59) = (int)v34;
              DWORD1(v59) = [v9 session];
              *((double *)&v59 + 1) = v24;
              [v9 gradient];
              *(void *)&long long v60 = v35;
              unsigned int v36 = [[[v9 track] gpsSource];
              double v37 = v25;
              DWORD2(v60) = v36;
              *(void *)&long long v61 = 0;
              if ((v27 & (unint64_t)&_mh_execute_header) == 0) {
                double v37 = 0.0;
              }
              *((double *)&v61 + 1) = v37;
              LODWORD(v62) = v27;
              if (self->fLogPedometer)
              {
                sub_1017633A0((uint64_t)buf, (uint64_t)&v53);
                if (qword_10248AF88 != -1) {
                  dispatch_once(&qword_10248AF88, &stru_1022CF7E8);
                }
                if (qword_10248AF90) {
                  operator new();
                }
                PB::Base::~Base((PB::Base *)&v53);
              }
              fDatabase = self->fDatabase;
              v44[4] = v59;
              v44[5] = v60;
              v44[6] = v61;
              uint64_t v45 = v62;
              v44[0] = *(_OWORD *)buf;
              v44[1] = *(_OWORD *)&buf[16];
              v44[2] = v57;
              v44[3] = v58;
              [(CMStrideCalibrationDatabase *)fDatabase addEntry:v44];
              [(CMStrideCalibrationStats *)self->fStats awdMotionFitnessStrideCalibration:buf];
              [(CMStrideCalibrationStats *)self->fStats awdLogDistance:0 status:@"Yay!" description:*((double *)v46 + 1)];
              goto LABEL_48;
            }
            [(CMStrideCalibrationStats *)self->fStats awdLogDistance:4 status:@"GradientOutOfBounds" description:*((double *)v46 + 1)];
            if (qword_102419030 != -1) {
              dispatch_once(&qword_102419030, &stru_1022CF7C8);
            }
            v21 = qword_102419038;
            if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              *(double *)&uint8_t buf[4] = v11;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v13;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "SessionMetrics,Fail,Gradient,DistanceFusion,startTime,%f,endTime,%f", buf, 0x16u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419030 != -1) {
                dispatch_once(&qword_102419030, &stru_1022CF7C8);
              }
              int v53 = 134218240;
              *(double *)v54 = v11;
              *(_WORD *)&v54[8] = 2048;
              double v55 = v13;
              v22 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator updateCalibrationBins:]", "%s\n", v22);
              if (v22 != buf) {
                free(v22);
              }
            }
          }
        }
LABEL_48:
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v42 = [(NSMutableArray *)fLatestCalDataArray countByEnumeratingWithState:&v49 objects:v63 count:16];
      id v6 = v42;
    }
    while (v42);
  }
  [(NSMutableArray *)self->fLatestCalDataArray removeObjectsInArray:v43];
}

- (void)tick:(double)a3
{
  [(CMStrideCalibrator *)self updateCalibrationBins:a3];
  [(CMStrideCalibrator *)self checkForLocationStateTransition];

  [(CMStrideCalibrator *)self checkTimeToSendNewCAGPSCalibration];
}

- (BOOL)outOfSession
{
  return self->fCurrentSession == 0;
}

- (BOOL)inOutdoorPedestrianSession
{
  return (self->fCurrentSession < 0x19uLL) & (0x1028000u >> self->fCurrentSession);
}

- (void)checkForLocationStateTransition
{
  int v3 = [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM locationState];
  if ([(CMStrideCalibrator *)self inOutdoorPedestrianSession] && v3 <= 2)
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    v4 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      int64_t fCurrentSession = self->fCurrentSession;
      *(_DWORD *)buf = 134218242;
      int64_t v14 = fCurrentSession;
      __int16 v15 = 2080;
      id v16 = [[+[CMWorkout workoutName:](CMWorkout, "workoutName:", fCurrentSession) UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "ForcingLocationDueToGizmoRequest,session,%ld,%s", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      [+[CMWorkout workoutName:](CMWorkout, "workoutName:", self->fCurrentSession) UTF8String];
      double v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM requestTransitionToLocationState:3];
  }
  else
  {
    sub_100103240();
    if ((sub_10010145C() & 1) == 0
      && [(CMStrideCalibrator *)self outOfSession]
      && [(CMStrideCalibrationActivityBuffer *)self->fActivityBuffer isRunningStateInWindow])
    {
      if (v3 >= 2)
      {
        if (v3 > 2) {
          return;
        }
      }
      else if ([(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer stepsInWindow] >= 0xB)
      {
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        id v6 = qword_102419038;
        if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v7 = [(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer stepsInWindow];
          *(_DWORD *)buf = 67109120;
          LODWORD(v14) = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "StepRunNotification,Pass,LeechingLocation,Steps,%d", buf, 8u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419030 != -1) {
            dispatch_once(&qword_102419030, &stru_1022CF7C8);
          }
          [(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer stepsInWindow];
          double v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v12);
          if (v12 != (char *)buf) {
            free(v12);
          }
        }
        [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM requestTransitionToLocationState:2];
      }
      if ([(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer stepsInWindow] >= 0x65)
      {
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        v8 = qword_102419038;
        if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v9 = [(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer stepsInWindow];
          *(_DWORD *)buf = 67109120;
          LODWORD(v14) = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "StepRunNotification,Pass,AttemptingToForceLocation,Steps,%d", buf, 8u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419030 != -1) {
            dispatch_once(&qword_102419030, &stru_1022CF7C8);
          }
          [(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer stepsInWindow];
          double v11 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkForLocationStateTransition]", "%s\n", v11);
          if (v11 != (char *)buf) {
            free(v11);
          }
        }
        [(CMStrideCalibrator *)self attemptForcedLocation];
      }
    }
  }
}

- (id)initInUniverse:(id)a3 stepCountDb:(shared_ptr<CLStepCountRecorderDb>)a4
{
  ptr = a4.__ptr_;
  sub_100103240();
  if (sub_100106424() || (sub_100103240(), (sub_10010145C() & 1) != 0))
  {
    v30.receiver = self;
    v30.super_class = (Class)CMStrideCalibrator;
    unsigned int v7 = [(CMStrideCalibrator *)&v30 init];
    if (!v7) {
      return v7;
    }
    *((void *)v7 + 11) = a3;
    uint64_t v9 = *(void *)ptr;
    uint64_t v8 = *((void *)ptr + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    double v10 = (std::__shared_weak_count *)*((void *)v7 + 22);
    *((void *)v7 + 21) = v9;
    *((void *)v7 + 22) = v8;
    if (v10) {
      sub_1000DB0A0(v10);
    }
    *((void *)v7 + 35) = 0;
    [+[CMPedometerTableRawSpeedToKValue sharedInstance] logBins];
    [+[CMPedometerTableStepCadenceToStrideLength sharedInstance] logBins];
    double v11 = objc_alloc_init(CMStrideCalLocationFSM);
    *((void *)v7 + 19) = v11;
    [(CMStrideCalLocationFSM *)v11 setDelegate:v7];
    *(_OWORD *)(v7 + 184) = xmmword_101D51660;
    *(_OWORD *)(v7 + 200) = unk_101D51670;
    *(_OWORD *)(v7 + 216) = xmmword_101D51680;
    *(_OWORD *)(v7 + 228) = *(long long *)((char *)&xmmword_101D51680 + 12);
    sub_100103240();
    if (sub_10010145C())
    {
      LOBYTE(v25[0]) = 1;
      unsigned __int8 v29 = 1;
      sub_1008B35D4((unsigned __int8 *)v25, &v29, buf);
      long long v12 = *(_OWORD *)buf;
      memset(buf, 0, sizeof(buf));
      double v13 = (std::__shared_weak_count *)*((void *)v7 + 33);
      *((_OWORD *)v7 + 16) = v12;
      if (!v13) {
        goto LABEL_20;
      }
      sub_1000DB0A0(v13);
      int64_t v14 = *(std::__shared_weak_count **)&buf[8];
      if (!*(void *)&buf[8]) {
        goto LABEL_20;
      }
    }
    else
    {
      int64_t v14 = (std::__shared_weak_count *)*((void *)v7 + 33);
      *((void *)v7 + 32) = 0;
      *((void *)v7 + 33) = 0;
      if (!v14)
      {
LABEL_20:
        *((CFAbsoluteTime *)v7 + 31) = CFAbsoluteTimeGetCurrent();
        *((void *)v7 + 14) = objc_alloc_init(CMStrideCalibrationElevationBuffer);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        id v16 = qword_102419038;
        if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "AutomaticStrideCalibration,Pass,CreatingDaemonCacheForCalibrationBins", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419030 != -1) {
            dispatch_once(&qword_102419030, &stru_1022CF7C8);
          }
          LOWORD(v26) = 0;
          v22 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v22);
          if (v22 != (char *)buf) {
            free(v22);
          }
        }
        sub_100103240();
        if (sub_10010145C())
        {
          *((void *)v7 + 17) = objc_alloc_init(CMStrideCalibrationStats);
        }
        else
        {
          sub_100103240();
          if ((sub_1000A16E8() & 0x2000000) != 0)
          {
            *((void *)v7 + 13) = objc_alloc_init(CMStrideCalibrationActivityBuffer);
            id v17 = [objc_msgSend(*((id *)v7 + 11), "silo") newTimer];
            *((void *)v7 + 12) = v17;
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_1008B1094;
            v28[3] = &unk_10229FED8;
            v28[4] = v7;
            [v17 setHandler:v28];
          }
        }
        sub_100103240();
        if ((sub_1000A16E8() & 0x2000000) != 0)
        {
          *((void *)v7 + 20) = objc_alloc_init((Class)NSMutableArray);
          *((void *)v7 + 16) = objc_alloc_init(CMStrideCalibrationStepCountBuffer);
          double v18 = -[CMStrideCalibrationDatabase initWithSilo:]([CMStrideCalibrationDatabase alloc], "initWithSilo:", [*((id *)v7 + 11) silo]);
          *((void *)v7 + 18) = v18;
          [(CMStrideCalibrationDatabase *)v18 setDelegate:v7];
          [*((id *)v7 + 18) registerStrideCalDbForColdStorage:[objc_msgSend(*((id *)v7 + 11), "vendor"), "proxyForService:", @"CMHealthColdStorageService"]];
        }
        if (+[CMStrideCalibrationRunningFormBuffer isAvailable])
        {
          *((void *)v7 + 15) = objc_alloc_init(CMStrideCalibrationRunningFormBuffer);
        }
        [v7 setupCLNotifiers];
        v7[288] = 0;
        uint64_t v19 = sub_1000D3E78();
        sub_10006B564(v19, &v26);
        sub_1000D2988(v26, "MotionLoggerLogPedometer", (BOOL *)v7 + 288);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        unsigned int v20 = qword_102419038;
        if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "AutomaticStrideCalibration,Success,AllChecksPassed", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419030 != -1) {
            dispatch_once(&qword_102419030, &stru_1022CF7C8);
          }
          v25[0] = 0;
          BOOL v23 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v23);
          if (v23 != (char *)buf) {
            free(v23);
          }
        }
        if (v27) {
          sub_1000DB0A0(v27);
        }
        return v7;
      }
    }
    sub_1000DB0A0(v14);
    goto LABEL_20;
  }
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022CF7C8);
  }
  __int16 v15 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Not companion or watch. Returning.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    LOWORD(v26) = 0;
    double v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator initInUniverse:stepCountDb:]", "%s\n", v24);
    if (v24 != (char *)buf) {
      free(v24);
    }
  }
  return 0;
}

- (void)dealloc
{
  [(CMStrideCalibrator *)self teardownCLNotifiers];
  [(CLTimer *)self->fStopOpportunisticCalibrationTimer invalidate];

  self->fStopOpportunisticCalibrationTimer = 0;
  cntrl = self->fStepCountDb.__cntrl_;
  self->fStepCountDb.__ptr_ = 0;
  self->fStepCountDb.__cntrl_ = 0;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  v4.receiver = self;
  v4.super_class = (Class)CMStrideCalibrator;
  [(CMStrideCalibrator *)&v4 dealloc];
}

- (void)setSession:(int64_t)a3
{
  if (self->fCurrentSession != a3)
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    v5 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      int64_t fCurrentSession = self->fCurrentSession;
      *(_DWORD *)buf = 134218240;
      int64_t v9 = fCurrentSession;
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setSession,oldSession,%ld,newSession,%ld", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      unsigned int v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator setSession:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    self->int64_t fCurrentSession = a3;
    if (![(CMStrideCalibrator *)self inOutdoorPedestrianSession]) {
      [(CMStrideCalibrator *)self quitForcedLocationState];
    }
    [(CMStrideCalibrator *)self checkForLocationStateTransition];
  }
}

- (BOOL)isCalibrationConvergedMedianForSpeed:(double)a3
{
  return [(CMStrideCalibrationDatabase *)self->fDatabase isCalibrationConvergedMedianForSpeed:a3];
}

- (void)addLatestCalData:(id)a3
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022CF7C8);
  }
  v5 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = [[objc_msgSend(a3, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "A new calData is added: %s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    [objc_msgSend(a3, "description") UTF8String];
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator addLatestCalData:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [(NSMutableArray *)self->fLatestCalDataArray addObject:a3];
}

- (int64_t)currentSession
{
  return self->fCurrentSession;
}

- (void)attemptForcedLocation
{
  if (![(CMStrideCalibrator *)self outOfSession]) {
    sub_101A72B34();
  }
  double Current = CFAbsoluteTimeGetCurrent();
  double v13 = Current;
  uint64_t v4 = sub_1000A6958();
  if (sub_1000A699C(v4, "StrideCalibrationLastCalibration", &v13) && Current - v13 < 2400.0)
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    v5 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v17 = Current - v13;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationSuccess,TimeSinceLastCalibrationSuccess,%0.3f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      int v14 = 134217984;
      double v15 = Current - v13;
LABEL_32:
      __int16 v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator attemptForcedLocation]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  else
  {
    uint64_t v6 = sub_1000A6958();
    if (sub_1000A699C(v6, "StrideCalibrationLastCalibrationAttempt", &v13) && Current - v13 < 1200.0)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      unsigned int v7 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v17 = Current - v13;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastCalibrationAttempt,TimeSinceLastCalibrationAttempt,%0.3f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        int v14 = 134217984;
        double v15 = Current - v13;
        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v8 = sub_1000A6958();
      if (sub_1000A699C(v8, "LastStrideCalibrationConverge", &v13) && Current - v13 < 2592000.0)
      {
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        int64_t v9 = qword_102419038;
        if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          double v17 = Current - v13;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "AttemptForcedLocation,Fail,NotSufficientTimeSinceLastConverged,TimeSinceLastCalibrationAttempt,%0.3f", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419030 != -1) {
            dispatch_once(&qword_102419030, &stru_1022CF7C8);
          }
          int v14 = 134217984;
          double v15 = Current - v13;
          goto LABEL_32;
        }
      }
      else
      {
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        int64_t v11 = qword_102419038;
        if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "AttemptForcedLocation,Success,AllChecksPassed", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419030 != -1) {
            dispatch_once(&qword_102419030, &stru_1022CF7C8);
          }
          LOWORD(v14) = 0;
          long long v12 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator attemptForcedLocation]", "%s\n", v12);
          if (v12 != (char *)buf) {
            free(v12);
          }
        }
        [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM requestTransitionToLocationState:3];
      }
    }
  }
}

- (void)quitForcedLocationState
{
  if ([(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM locationState] == 3)
  {
    uint64_t v3 = sub_1000A6958();
    *(void *)buf = CFAbsoluteTimeGetCurrent();
    sub_10016332C(v3, "StrideCalibrationLastCalibrationAttempt", buf);
    [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM requestTransitionToLocationState:2];
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    uint64_t v4 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Terminated forced calibration.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator quitForcedLocationState]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (shared_ptr<CMMobilityCal::GPSRawSpeedToKValueTable>)getSpdToKTable
{
  cntrl = self->fGPSCalibrationTable.__cntrl_;
  *v2 = self->fGPSCalibrationTable.__ptr_;
  v2[1] = (GPSRawSpeedToKValueTable *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (GPSRawSpeedToKValueTable *)self;
  return result;
}

- (void)strideCalibrationDatabase:(id)a3 didInsertEntry:(CLStrideCalEntry *)a4
{
  if ([a3 isCalibrationConvergedStdForBinWithSpeed:a4->speed])
  {
    uint64_t v6 = sub_1000A6958();
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    sub_10016332C(v6, "LastStrideCalibrationConverge", &Current);
  }
  [(CMStrideCalibrationStats *)self->fStats activityLoggerLogStrideCalEntry:a4];
  if ([(CMStrideCalibrator *)self calibrationTrackCallback])
  {
    unsigned int v7 = [(CMStrideCalibrator *)self calibrationTrackCallback];
    long long v8 = *(_OWORD *)&a4->percentGrade;
    v11[4] = *(_OWORD *)&a4->steps;
    v11[5] = v8;
    v11[6] = *(_OWORD *)&a4->timestamp;
    uint64_t v12 = *(void *)&a4->runningFormStrideLengthMetrics;
    long long v9 = *(_OWORD *)&a4->endTime;
    v11[2] = *(_OWORD *)&a4->kvalueTrack;
    v11[3] = v9;
    long long v10 = *(_OWORD *)&a4->pacebin;
    v11[0] = *(_OWORD *)&a4->recordId;
    v11[1] = v10;
    v7[2](v7, v11);
  }
}

- (void)fsm:(id)a3 didTransitionFromState:(int)a4 toState:(int)a5
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022CF7C8);
  }
  long long v8 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    int v11 = a4;
    __int16 v12 = 1024;
    int v13 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "LocationStateOld,%d,LocationStateNew,%d", buf, 0xEu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    long long v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator fsm:didTransitionFromState:toState:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  if (a5 <= 1)
  {
    [(CMStrideCalibrator *)self stopLeechingLocation];
    [(CMStrideCalibrator *)self stopGpsOdometerSpectatorUpdates];
    [(CMStrideCalibrator *)self stopElevationSpectatorUpdates];
    goto LABEL_11;
  }
  self->fLastGoodLocFix = CFAbsoluteTimeGetCurrent();
  [(CMStrideCalibrator *)self startLeechingLocation];
  [(CMStrideCalibrator *)self startGpsOdometerSpectatorUpdates];
  [(CMStrideCalibrator *)self startElevationSpectatorUpdates];
  if (a5 == 2)
  {
LABEL_11:
    [(CMStrideCalibrator *)self stopLocationUpdates];
    [(CMStrideCalibrator *)self stopGpsOdometerUpdates];
    [(CMStrideCalibrator *)self stopElevationUpdates];
    return;
  }
  [(CMStrideCalibrator *)self startLocationUpdates];
  [(CMStrideCalibrator *)self startGpsOdometerUpdates];
  [(CMStrideCalibrator *)self startElevationUpdates];
  if ([(CMStrideCalibrator *)self outOfSession]) {
    [(CLTimer *)self->fStopOpportunisticCalibrationTimer setNextFireDelay:360.0];
  }
}

- (void)fsm:(id)a3 didYieldTrack:(id)a4
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v6 = sub_1000A6958();
  sub_10016332C(v6, "StrideCalibrationLastCalibration", &Current);
  unsigned int v7 = [[CMStrideCalDataContainer alloc] initWithTrack:a4 session:[(CMStrideCalibrator *)self currentSession]];
  [(CMStrideCalibrator *)self addLatestCalData:v7];
}

- (void)fsm:(id)a3 didUpdateLocationAtTime:(double)a4
{
  [(CMStrideCalibrator *)self tickleArrow];
  if ([(CMStrideCalibrator *)self outOfSession])
  {
    int v5 = [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM locationState];
    double Current = CFAbsoluteTimeGetCurrent();
    double v23 = Current;
    BOOL v7 = Current - self->fLastGoodLocFix > 30.0 && v5 == 3;
    int v8 = v7;
    if (v7)
    {
      [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM requestTransitionToLocationState:2];
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      long long v9 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        double v10 = Current - self->fLastGoodLocFix;
        *(_DWORD *)buf = 134217984;
        double v27 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "TrackClose,Pass,LocationTimeout,TimeSinceLastPosition,%0.3f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        double v11 = Current - self->fLastGoodLocFix;
        int v24 = 134217984;
        double v25 = v11;
        __int16 v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator fsm:didUpdateLocationAtTime:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
LABEL_20:
      p_fStepsBuffer = &self->fStepsBuffer;
      if ([(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer stepsInWindow] <= 0x63)
      {
        [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM requestTransitionToLocationState:2];
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        int v14 = qword_102419038;
        if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v15 = [(CMStrideCalibrationStepCountBuffer *)*p_fStepsBuffer stepsInWindow];
          *(_DWORD *)buf = 67109120;
          LODWORD(v27) = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "TrackClose,Pass,ForcedNotSufficientSteps,Steps,%d", buf, 8u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419030 != -1) {
            dispatch_once(&qword_102419030, &stru_1022CF7C8);
          }
          unsigned int v21 = [(CMStrideCalibrationStepCountBuffer *)*p_fStepsBuffer stepsInWindow];
          int v24 = 67109120;
          LODWORD(v25) = v21;
          v22 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator fsm:didUpdateLocationAtTime:]", "%s\n", v22);
          if (v22 != (char *)buf) {
            free(v22);
          }
        }
        int v8 = 1;
      }
      if ([(CMStrideCalibrationStepCountBuffer *)*p_fStepsBuffer stepsInWindow] >= 0xA)
      {
        if (!v8) {
          return;
        }
        goto LABEL_38;
      }
LABEL_28:
      [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM requestTransitionToLocationState:1];
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      id v16 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v17 = [(CMStrideCalibrationStepCountBuffer *)*p_fStepsBuffer stepsInWindow];
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "TrackClose,Pass,EnabledNotSufficientSteps,Steps,%d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022CF7C8);
        }
        unsigned int v18 = [(CMStrideCalibrationStepCountBuffer *)*p_fStepsBuffer stepsInWindow];
        int v24 = 67109120;
        LODWORD(v25) = v18;
        uint64_t v19 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator fsm:didUpdateLocationAtTime:]", "%s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
LABEL_38:
      uint64_t v20 = sub_1000A6958();
      sub_10016332C(v20, "StrideCalibrationLastCalibrationAttempt", &v23);
      return;
    }
    if (v5 >= 3) {
      goto LABEL_20;
    }
    if (v5 == 2)
    {
      p_fStepsBuffer = &self->fStepsBuffer;
      if ([(CMStrideCalibrationStepCountBuffer *)self->fStepsBuffer stepsInWindow] <= 9) {
        goto LABEL_28;
      }
    }
  }
}

- (BOOL)checkValidTrack:(id)a3 associatedEntry:(const CLStepDistance *)a4
{
  [objc_msgSend(a3, "start") timeIntervalSinceReferenceDate];
  double v8 = v7;
  [objc_msgSend(a3, "stop") timeIntervalSinceReferenceDate];
  double v10 = v9;
  [a3 distanceRawPed];
  if (v11 <= 0.0)
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    uint64_t v19 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v41 = v8;
      __int16 v42 = 2048;
      double v43 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "TrackCalibration,Fail,Pedometer distance is zero,startTime,%f,endTime,%f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      unsigned int v36 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v36);
      if (v36 != (char *)buf) {
        free(v36);
      }
    }
    fStats = self->fStats;
    double var1 = a4->var1;
    CFStringRef v22 = @"ZeroDistance";
    uint64_t v23 = 7;
    goto LABEL_22;
  }
  [a3 distanceRawPed];
  double v13 = v12 / (v10 - v8);
  if (![+[CMPedometerTableRawSpeedToKValue sharedInstance] isRawSpeedValid:v13])
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    int v24 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      double v41 = v13;
      __int16 v42 = 2048;
      double v43 = v8;
      __int16 v44 = 2048;
      double v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "TrackCalibration,Fail,rawSpeed %f out of bounds,startTime,%f,endTime,%f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022CF7C8);
      }
      double v37 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v37);
      if (v37 != (char *)buf) {
        free(v37);
      }
    }
    fStats = self->fStats;
    double var1 = a4->var1;
    CFStringRef v22 = @"SpeedOutOfBounds";
    uint64_t v23 = 6;
LABEL_22:
    [(CMStrideCalibrationStats *)fStats awdLogDistance:v23 status:v22 description:var1];
LABEL_23:
    LOBYTE(v25) = 0;
    return v25;
  }
  [a3 distanceGps];
  double v15 = v14;
  [a3 distanceRawPed];
  double v17 = v15 / v16;
  sub_100103240();
  if (sub_10010145C())
  {
    if (v17 <= 1.4 && v17 >= 0.5) {
      goto LABEL_27;
    }
  }
  else if (v17 <= 2.0 && v17 >= 0.666666667)
  {
LABEL_27:
    LOBYTE(v25) = 1;
    return v25;
  }
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022CF7C8);
  }
  uint64_t v26 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    double v41 = COERCE_DOUBLE([[objc_msgSend(a3, "description") UTF8String];
    __int16 v42 = 2048;
    double v43 = v17;
    __int16 v44 = 2048;
    double v45 = v13;
    __int16 v46 = 2048;
    double v47 = v8;
    __int16 v48 = 2048;
    double v49 = v10;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "TrackCalibration,Fail,KFactorOutOfBounds,%s,KFactor,%0.4f,RawSpeed,%f,startTime,%f,endTime,%f", buf, 0x34u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    [objc_msgSend(a3, "description") UTF8String];
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v38);
    if (v38 != (char *)buf) {
      free(v38);
    }
  }
  [(CMStrideCalibrationStats *)self->fStats awdLogDistance:5 status:@"GainOutOfBounds" description:a4->var1];
  [a3 distanceGps];
  double v28 = v27;
  unsigned __int8 v29 = self->fStats;
  double v30 = a4->var1;
  if (v28 >= 70.0)
  {
    [(CMStrideCalibrationStats *)v29 awdLogDistance:3 status:@"GainOutOfBounds" description:v30];
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    uint64_t v33 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      double v34 = a4->var1;
      *(_DWORD *)buf = 134218496;
      double v41 = v34;
      __int16 v42 = 2048;
      double v43 = v8;
      __int16 v44 = 2048;
      double v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "SessionMetrics,Fail,Pedometer,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f", buf, 0x20u);
    }
    BOOL v25 = sub_10013D1A0(115, 2);
    if (v25)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1) {
        goto LABEL_47;
      }
      goto LABEL_61;
    }
  }
  else
  {
    [(CMStrideCalibrationStats *)v29 awdLogDistance:2 status:@"GainOutOfBounds" description:v30];
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    double v31 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      double v32 = a4->var1;
      *(_DWORD *)buf = 134218496;
      double v41 = v32;
      __int16 v42 = 2048;
      double v43 = v8;
      __int16 v44 = 2048;
      double v45 = v10;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "SessionMetrics,Fail,GPS,GainOutOfBounds,DistanceFusion,%0.6f,startTime,%f,endTime,%f", buf, 0x20u);
    }
    BOOL v25 = sub_10013D1A0(115, 2);
    if (v25)
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1)
      {
LABEL_47:
        uint64_t v35 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator checkValidTrack:associatedEntry:]", "%s\n", v35);
        if (v35 != (char *)buf) {
          free(v35);
        }
        goto LABEL_23;
      }
LABEL_61:
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
      goto LABEL_47;
    }
  }
  return v25;
}

- (void)sendGPSCoreAnalyticsAndUpdateTime
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022CF7C8);
  }
  uint64_t v3 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Correctly sending core analytics and updating latest time in gps calibration", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    int v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator sendGPSCoreAnalyticsAndUpdateTime]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  self->double lastGPSCalibrationUpdateTime = CFAbsoluteTimeGetCurrent();
  ptr = self->fGPSCalibrationTable.__ptr_;
  if (ptr) {
    sub_1003A0650((uint64_t)ptr, &self->fCLBodyMetrics.gender);
  }
}

- (void)updateUserHeight:(int64_t)a3
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022CF7C8);
  }
  int v5 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Correctly calling update user height in stride calibrator.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator updateUserHeight:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [(CMStrideCalibrationStats *)self->fStats updateUserHeight:a3];
}

- (void)feedBodyMetrics:(CLBodyMetrics *)a3
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_1022CF7C8);
  }
  int v5 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Correctly feeding body metrics in stride calibrator.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_1022CF7C8);
    }
    double v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator feedBodyMetrics:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  long long v6 = *(_OWORD *)&a3->gender;
  long long v7 = *(_OWORD *)&a3->vo2max;
  long long v8 = *(_OWORD *)&a3->hronset;
  *(_OWORD *)&self->fCLBodyMetrics.runVo2max = *(_OWORD *)&a3->runVo2max;
  *(_OWORD *)&self->fCLBodyMetrics.hronset = v8;
  *(_OWORD *)&self->fCLBodyMetrics.vo2max = v7;
  *(_OWORD *)&self->fCLBodyMetrics.gender = v6;
  [(CMStrideCalibrator *)self updateUserHeight:llroundf(a3->heightM * 100.0)];
}

- (id)copyHistory
{
  return [(CMStrideCalibrationDatabase *)self->fDatabase copyHistory];
}

- (BOOL)queryStrideLengthTracks:(void *)a3
{
  return [(CMStrideCalibrationDatabase *)self->fDatabase queryStrideLengthTracks:a3];
}

- (id)calibrationTrackCallback
{
  return self->_calibrationTrackCallback;
}

- (void)setCalibrationTrackCallback:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->fGPSCalibrationTable.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->fStepCountDb.__cntrl_;
  if (v4) {
    sub_1000DB0A0((std::__shared_weak_count *)v4);
  }
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  long long v6 = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  long long v7 = self->fMotionStateClient.__ptr_.__value_;
  self->fMotionStateClient.__ptr_.__value_ = 0;
  if (v7) {
    (*(void (**)(Client *, SEL))(*(void *)v7 + 8))(v7, a2);
  }
  long long v8 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (v8) {
    (*(void (**)(Client *, SEL))(*(void *)v8 + 8))(v8, a2);
  }
  double v9 = self->fStreamingAwareLocationClient.__ptr_.__value_;
  self->fStreamingAwareLocationClient.__ptr_.__value_ = 0;
  if (v9) {
    (*(void (**)(Client *, SEL))(*(void *)v9 + 8))(v9, a2);
  }
  double v10 = self->fServiceLocationClient.__ptr_.__value_;
  self->fServiceLocationClient.__ptr_.__value_ = 0;
  if (v10) {
    (*(void (**)(Client *, SEL))(*(void *)v10 + 8))(v10, a2);
  }
  double v11 = self->fOdometerClient.__ptr_.__value_;
  self->fOdometerClient.__ptr_.__value_ = 0;
  if (v11)
  {
    double v12 = *(void (**)(void))(*(void *)v11 + 8);
    v12();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 32) = 0;
  *((void *)self + 33) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

- (void)onMotionStateNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1) {
    [(CMStrideCalibrationActivityBuffer *)self->fActivityBuffer feedMotionStateData:a4];
  }
}

- (void)onOdometerNotification:(const int *)a3 data:(const NotificationData *)a4
{
  int v6 = *a3;
  if (*a3 == 7)
  {
    [(CMStrideCalibrationElevationBuffer *)self->fElevationBuffer feedElevationData:a4];
    int v6 = *a3;
  }
  if (v6 == 4)
  {
    fStrideCalLocationFSM = self->fStrideCalLocationFSM;
    [(CMStrideCalLocationFSM *)fStrideCalLocationFSM feedGpsOdometerData:a4];
  }
}

- (void)onLocationNotification:(const int *)a3 data:(const void *)a4
{
  [(CMStrideCalibrator *)self authorizeLocationInReplay];
  int v7 = *a3;
  if (*a3)
  {
    if (v7 == 14)
    {
      [(CMStrideCalibrator *)self checkLocationAuthorization];
    }
    else if (v7 == 5)
    {
      fStrideCalLocationFSM = self->fStrideCalLocationFSM;
      [(CMStrideCalLocationFSM *)fStrideCalLocationFSM feedLocationData:a4];
    }
    else
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_1022F5020);
      }
      double v9 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *a3;
        *(_DWORD *)buf = 67109120;
        int v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#Warning Received unhandled notification, %d", buf, 8u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_1022F5020);
        }
        double v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator(DataInput) onLocationNotification:data:]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
      }
    }
  }
}

- (void)onRunningFormMetrics:(const FormMetrics *)a3
{
}

- (void)setupCLNotifiers
{
}

- (void)teardownCLNotifiers
{
  fServiceLocationProvider = self->fServiceLocationProvider;
  if (fServiceLocationProvider) {
    (*(void (**)(void *, SEL))(*(void *)fServiceLocationProvider + 8))(fServiceLocationProvider, a2);
  }
  self->fServiceLocationProvider = 0;
  [(CLStreamingAwareLocationProviderProtocol *)self->fStreamingAwareProxy releaseAccuracyEnablementAssertionForClient:CLISP_ME_TOKEN];

  self->fStreamingAwareProxy = 0;
  self->fClientAuthorizationCache = 0;
}

- (void)startElevationUpdates
{
}

- (void)stopElevationUpdates
{
}

- (void)startElevationSpectatorUpdates
{
}

- (void)stopElevationSpectatorUpdates
{
}

- (void)startGpsOdometerSpectatorUpdates
{
}

- (void)stopGpsOdometerSpectatorUpdates
{
}

- (void)startGpsOdometerUpdates
{
}

- (void)stopGpsOdometerUpdates
{
}

- (void)startLocationUpdates
{
  [(CLStreamingAwareLocationProviderProtocol *)self->fStreamingAwareProxy takeAccuracyEnablementAssertionForClient:CLISP_ME_TOKEN withDesiredAccuracy:-1.0];
  value = self->fStreamingAwareLocationClient.__ptr_.__value_;
  uint64_t v5 = *((void *)value + 1);
  uint64_t v4 = (void *)*((void *)value + 2);

  [v4 register:v5 forNotification:0 registrationInfo:0];
}

- (void)stopLocationUpdates
{
  [*((id *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 2) unregister:*((void *)self->fStreamingAwareLocationClient.__ptr_.__value_ + 1) forNotification:0];
  fStreamingAwareProxy = self->fStreamingAwareProxy;
  uint64_t v4 = CLISP_ME_TOKEN;

  [(CLStreamingAwareLocationProviderProtocol *)fStreamingAwareProxy releaseAccuracyEnablementAssertionForClient:v4];
}

- (void)startLeechingLocation
{
}

- (void)stopLeechingLocation
{
}

- (void)tickleArrow
{
}

- (void)checkLocationAuthorization
{
  unsigned int v3 = [(CMStrideCalibrator *)self isAuthorizedForLocation];
  fStrideCalLocationFSM = self->fStrideCalLocationFSM;
  if (v3)
  {
    if ([(CMStrideCalLocationFSM *)fStrideCalLocationFSM locationState] <= 0)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102319CF8);
      }
      uint64_t v5 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "EnableLocationServices,Success,AllChecksPassed", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_102319CF8);
        }
        int v6 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator(CLNotifiers) checkLocationAuthorization]", "%s\n", v6);
        if (v6 != (char *)buf) {
          free(v6);
        }
      }
      [(CMStrideCalLocationFSM *)self->fStrideCalLocationFSM requestTransitionToLocationState:1];
    }
  }
  else
  {
    [(CMStrideCalLocationFSM *)fStrideCalLocationFSM requestTransitionToLocationState:0];
  }
}

- (BOOL)isAuthorizedForLocation
{
  unsigned __int8 v2 = [[-[CLClientAuthorizationCacheProtocol syncgetAuthorizationContextIfClientIsNonZonal:](self->fClientAuthorizationCache, "syncgetAuthorizationContextIfClientIsNonZonal:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.locationd.bundle-/System/Library/LocationBundles/MotionCalibration.bundle")) isAuthorizedForServiceTypeMask:16];
  if (v2)
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102319CF8);
    }
    unsigned int v3 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "EnableLocationServices,Success", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1)
      {
LABEL_16:
        int v6 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator(CLNotifiers) isAuthorizedForLocation]", "%s\n", v6);
        if (v6 != (char *)buf) {
          free(v6);
        }
        return v2;
      }
LABEL_18:
      dispatch_once(&qword_102419030, &stru_102319CF8);
      goto LABEL_16;
    }
  }
  else
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102319CF8);
    }
    uint64_t v4 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "EnableLocationServices,Fail,PedometerCalibrationLocationServicesDisabled", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1) {
        goto LABEL_16;
      }
      goto LABEL_18;
    }
  }
  return v2;
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (*a3 == 1)
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102319CF8);
    }
    double v9 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      int v10 = *((_DWORD *)a4 + 2);
      int v11 = *(_DWORD *)a4;
      id v12 = +[CMWorkout workoutName:*((void *)a4 + 18)];
      uint64_t v13 = *((void *)a4 + 39);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v10;
      __int16 v16 = 1024;
      int v17 = v11;
      __int16 v18 = 2112;
      id v19 = v12;
      __int16 v20 = 2048;
      uint64_t v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "StrideCal - Register tracks activity %d, override action, %d, session, %@, mode, %ld", buf, 0x22u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102319CF8);
      }
      +[CMWorkout workoutName:*((void *)a4 + 18)];
      double v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMStrideCalibrator(Callbacks) onMotionStateMediatorNotification:data:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    if (*(_DWORD *)a4 == 1 && !*((void *)a4 + 39))
    {
      [(CMStrideCalibrator *)self setSession:*((void *)a4 + 18)];
      *(void *)buf = self->fCurrentSession;
      sub_10124808C();
    }
    if (!*(_DWORD *)a4)
    {
      [(CMStrideCalibrator *)self setSession:0];
      [*((id *)self->fCompanionClient.__ptr_.__value_ + 2) unregister:*((void *)self->fCompanionClient.__ptr_.__value_ + 1) forNotification:0];
      [(CMStrideCalibrationStats *)self->fStats endSessionMetrics:*((double *)a4 + 11)];
      [(CMStrideCalibrationStats *)self->fStats setReadyForSubmission];
    }
  }
}

@end