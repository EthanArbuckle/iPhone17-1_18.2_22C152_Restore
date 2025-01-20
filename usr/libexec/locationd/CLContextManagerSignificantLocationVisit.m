@interface CLContextManagerSignificantLocationVisit
+ (BOOL)isInsideSanctionedFloorTransitionPolygon:(CLLocationCoordinate2D)a3;
+ (BOOL)isInsideSanctionedPolygon:(CLLocationCoordinate2D)a3;
- (BOOL)duringVisit;
- (BOOL)hasPressureChangeFrom:(double)a3 to:(double)a4;
- (BOOL)isDeparture:(id)a3;
- (BOOL)isEntry:(id)a3;
- (BOOL)shouldSubmit:(int64_t)a3 calibrationType:(unint64_t)a4;
- (BOOL)shouldTriggerFloorTransitionHarvest:(float)a3 atTime:(double)a4;
- (BOOL)valid;
- (CLContextManagerSignificantLocationVisit)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (CLLocationCoordinate2D)currentVisitLocation;
- (double)currentVisitHorizontalUncertainty;
- (double)timeUserGetCloseToVisitLocation;
- (id).cxx_construct;
- (void)cleanup;
- (void)dealloc;
- (void)onVisit:(id)a3;
- (void)sendTrackFrom:(double)a3 to:(double)a4 location:(CLLocationCoordinate2D)a5 horrUnc:(double)a6 type:(unint64_t)a7;
- (void)setCurrentVisitHorizontalUncertainty:(double)a3;
- (void)setCurrentVisitLocation:(CLLocationCoordinate2D)a3;
- (void)setDuringVisit:(BOOL)a3;
- (void)setValid:(BOOL)a3;
- (void)sourceUpdated:(unint64_t)a3;
- (void)startBuffering;
- (void)stopBuffering;
@end

@implementation CLContextManagerSignificantLocationVisit

- (void)sourceUpdated:(unint64_t)a3
{
  if (a3 != 1 || !self->_duringVisit) {
    return;
  }
  sub_100096374((uint64_t)v30, (void *)self->super.fDataBuffers + 6);
  uint64_t v4 = *(void *)(v30[1] + (((unint64_t)(v32 + v31 - 1) >> 5) & 0x7FFFFFFFFFFFFF8))
     + 16 * (v32 + v31 - 1);
  v6 = *(double **)v4;
  v5 = *(std::__shared_weak_count **)(v4 + 8);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*v6 <= 0.0)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230D3B8);
    }
    uint64_t v13 = qword_1024191E8;
    if (!os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_49;
    }
    double v15 = *v6;
    double v14 = v6[1];
    *(_DWORD *)buf = 68289539;
    int v34 = 0;
    __int16 v35 = 2082;
    v36 = "";
    __int16 v37 = 2049;
    double v38 = v14;
    __int16 v39 = 2050;
    double v40 = v15;
    v10 = "{\"msg%{public}.0s\":\"received invalid pressure / time from source aggregator\", \"pressure\":\"%{private}5f\""
          ", \"time_s\":\"%{public}.09f\"}";
    v11 = v13;
    uint32_t v12 = 38;
    goto LABEL_20;
  }
  double v7 = v6[1];
  if (*v6 == 1.79769313e308 || v7 == 1.79769313e308)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230D3B8);
    }
    uint64_t v9 = qword_1024191E8;
    if (!os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_49;
    }
    *(_DWORD *)buf = 68289026;
    int v34 = 0;
    __int16 v35 = 2082;
    v36 = "";
    v10 = "{\"msg%{public}.0s\":\"received DBL_MAX pressure / TIME from source aggregator\"}";
LABEL_15:
    v11 = v9;
    uint32_t v12 = 18;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
    goto LABEL_49;
  }
  *(float *)&double v7 = v7;
  if (-[CLContextManagerSignificantLocationVisit shouldTriggerFloorTransitionHarvest:atTime:](self, "shouldTriggerFloorTransitionHarvest:atTime:", v7))
  {
    if (self->useSanctionedPolygons
      && ([(CLContextManagerSignificantLocationVisit *)self currentVisitLocation],
          !+[CLContextManagerSignificantLocationVisit isInsideSanctionedFloorTransitionPolygon:](CLContextManagerSignificantLocationVisit, "isInsideSanctionedFloorTransitionPolygon:")))
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230D3B8);
      }
      uint64_t v9 = qword_1024191E8;
      if (!os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 68289026;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      v10 = "{\"msg%{public}.0s\":\"floor transition is not inside sanctioned polygons\"}";
    }
    else
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230D3B8);
      }
      v17 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        int v34 = 0;
        __int16 v35 = 2082;
        v36 = "";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"trigger floor transition harvest\"}", buf, 0x12u);
      }
      if ([(CLContextManagerSignificantLocationVisit *)self shouldSubmit:-1 calibrationType:4])
      {
        double v18 = *v6;
        [(CLContextManagerSignificantLocationVisit *)self timeUserGetCloseToVisitLocation];
        double v20 = v19;
        double v21 = v18 + -600.0;
        if (v19 >= 0.0)
        {
          if (v19 > v21)
          {
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_10230D3B8);
            }
            v23 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68289538;
              int v34 = 0;
              __int16 v35 = 2082;
              v36 = "";
              __int16 v37 = 2050;
              double v38 = v21;
              __int16 v39 = 2050;
              double v40 = v20;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"truncate period before user moved into close radius of the visit\", \"defaultStartTimestamp_s\":\"%{public}.09f\", \"timeUserBecomesCloseToSLV_s\":\"%{public}.09f\"}", buf, 0x26u);
            }
            double v21 = v20;
          }
        }
        else
        {
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_10230D3B8);
          }
          v22 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68289026;
            int v34 = 0;
            __int16 v35 = 2082;
            v36 = "";
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"no locations indicating user moved into close radius of the visit\"}", buf, 0x12u);
          }
        }
        double v24 = *v6;
        [(CLContextManagerSignificantLocationVisit *)self currentVisitLocation];
        double v26 = v25;
        double v28 = v27;
        [(CLContextManagerSignificantLocationVisit *)self currentVisitHorizontalUncertainty];
        -[CLContextManagerSignificantLocationVisit sendTrackFrom:to:location:horrUnc:type:](self, "sendTrackFrom:to:location:horrUnc:type:", 4, v21, v24, v26, v28, v29);
        sub_100939FB8((uint64_t)&self->_floorTransitionDetector);
        goto LABEL_49;
      }
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230D3B8);
      }
      uint64_t v9 = qword_1024191E8;
      if (!os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 68289026;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      v10 = "{\"msg%{public}.0s\":\"number of submissions exceeded for floor transition traces, submission denied\"}";
    }
    goto LABEL_15;
  }
LABEL_49:
  if (v5) {
    sub_1000DB0A0(v5);
  }
  sub_1000DAF68(v30);
}

- (CLContextManagerSignificantLocationVisit)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CLContextManagerSignificantLocationVisit;
  v6 = [(CLBarometerCalibrationContextManager *)&v13 initWithUniverse:a3 delegate:a4 withBuffer:a5 withSourceAggregator:a6];
  double v7 = v6;
  if (v6)
  {
    v8 = (CLRoutineMonitorServiceProtocol *)[[-[CLIntersiloUniverse vendor](v6->super._universe, "vendor") proxyForService:@"CLRoutineMonitor"];
    v7->_routineMonitorProxy = v8;
    if (v8)
    {
      [(CLRoutineMonitorServiceProtocol *)v8 registerDelegate:v7 inSilo:[(CLIntersiloUniverse *)v7->super._universe silo]];
      [(CLRoutineMonitorServiceProtocol *)v7->_routineMonitorProxy setDelegateEntityName:"CLBarometerCalibration"];
      [(CLRoutineMonitorServiceProtocol *)v7->_routineMonitorProxy startLeechingVisitsForClient:v7];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230D3B8);
      }
      uint64_t v9 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SignificantLocationVisit notification enabled\"}", buf, 0x12u);
      }
      v7->_valid = 1;
      v7->_duringVisit = 0;
      v7->lastSLVUpdateTimestamp = CFAbsoluteTimeGetCurrent();
      v7->lastFloorTransitionUpdateTimestamp = CFAbsoluteTimeGetCurrent();
      v7->numWorkSubmissions = 0;
      v7->numUnknownSubmissions = 0;
      sub_100103240();
      unsigned __int8 v12 = sub_10073E30C() ^ 1;
      sub_10006ACBC(buf, "BarometerCalibrationEnableSanctionedPolygons", &v12, 0);
      v7->useSanctionedPolygons = buf[1];
      [(CLContextManagerSignificantLocationVisit *)v7 startBuffering];
      long long v15 = 0u;
      long long v16 = 0u;
      memset(buf, 0, sizeof(buf));
      sub_101070CD4(&v7->_floorTransitionDetector.fBuffer.__map_.__first_, buf);
      *(_OWORD *)&v7->_floorTransitionDetector.fInTransition = v16;
      sub_1000D80C4(buf);
    }
    else
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230D3B8);
      }
      v10 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&uint8_t buf[4] = 0;
        *(_WORD *)&buf[8] = 2082;
        *(void *)&buf[10] = "";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"SignificantLocationVisit notification disabled\"}", buf, 0x12u);
      }
      v7->_valid = 0;
      v7->_duringVisit = 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLContextManagerSignificantLocationVisit;
  [(CLBarometerCalibrationContextManager *)&v3 dealloc];
}

- (void)cleanup
{
  [(CLRoutineMonitorServiceProtocol *)self->_routineMonitorProxy stopLeechingVisitsForClient:self];

  [(CLContextManagerSignificantLocationVisit *)self stopBuffering];
}

- (void)startBuffering
{
}

- (void)stopBuffering
{
}

- (void)onVisit:(id)a3
{
  if (-[CLContextManagerSignificantLocationVisit isEntry:](self, "isEntry:"))
  {
    self->_duringVisit = 1;
    [a3 coordinate];
    -[CLContextManagerSignificantLocationVisit setCurrentVisitLocation:](self, "setCurrentVisitLocation:");
    [a3 horizontalAccuracy];
    -[CLContextManagerSignificantLocationVisit setCurrentVisitHorizontalUncertainty:](self, "setCurrentVisitHorizontalUncertainty:");
  }
  else if ([(CLContextManagerSignificantLocationVisit *)self isDeparture:a3])
  {
    self->_duringVisit = 0;
  }
  if (!self->useSanctionedPolygons) {
    goto LABEL_8;
  }
  [a3 coordinate];
  if (+[CLContextManagerSignificantLocationVisit isInsideSanctionedPolygon:](CLContextManagerSignificantLocationVisit, "isInsideSanctionedPolygon:"))
  {
    [(CLContextManagerSignificantLocationVisit *)self startBuffering];
LABEL_8:
    id v5 = objc_alloc((Class)CLLocation);
    [a3 coordinate];
    double v7 = v6;
    [a3 coordinate];
    id v8 = [v5 initWithLatitude:v7];
    routineMonitorProxy = self->_routineMonitorProxy;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10106F7A8;
    v11[3] = &unk_10229FF50;
    v11[4] = self;
    v11[5] = a3;
    [(CLRoutineMonitorServiceProtocol *)routineMonitorProxy fetchLocationOfInterestAtLocation:v8 withReply:v11];

    return;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  v10 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v13 = 0;
    __int16 v14 = 2082;
    long long v15 = "";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"received visit not inside sanctioned polygons\"}", buf, 0x12u);
  }
}

- (BOOL)isEntry:(id)a3
{
  if (a3)
  {
    unsigned int v4 = [a3 hasArrivalDate];
    if (v4) {
      LOBYTE(v4) = [a3 hasDepartureDate] ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isDeparture:(id)a3
{
  if (!a3 || ![a3 hasArrivalDate]) {
    return 0;
  }

  return [a3 hasDepartureDate];
}

- (BOOL)shouldSubmit:(int64_t)a3 calibrationType:(unint64_t)a4
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  double v7 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    int numWorkSubmissions = self->numWorkSubmissions;
    int numUnknownSubmissions = self->numUnknownSubmissions;
    int v19 = 68290050;
    __int16 v21 = 2082;
    int v20 = 0;
    v22 = "";
    __int16 v23 = 1026;
    *(_DWORD *)double v24 = numWorkSubmissions;
    *(_WORD *)&v24[4] = 1026;
    *(_DWORD *)&v24[6] = numUnknownSubmissions;
    *(_WORD *)double v25 = 2050;
    *(void *)&v25[2] = a3;
    __int16 v26 = 2050;
    unint64_t v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"number of submissions so far. \", \"numWorkSubmissions\":%{public}d, \"numUnknownSubmissions\":%{public}d, \"loiType\":%{public}ld, \"calibrationType\":%{public}ld}", (uint8_t *)&v19, 0x32u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (a4 == 4) {
    goto LABEL_22;
  }
  if (a4 == 3)
  {
    double v11 = self->lastSLVUpdateTimestamp + 86400.0;
    if (Current >= v11)
    {
      if (Current > v11)
      {
        do
        {
          double v17 = v11;
          double v11 = v11 + 86400.0;
        }
        while (Current > v11);
        self->lastSLVUpdateTimestamp = v17;
      }
      self->int numWorkSubmissions = 0;
      self->int numUnknownSubmissions = 0;
      goto LABEL_22;
    }
    if (a3 == -1)
    {
      uint64_t v12 = 73;
      unsigned int v13 = self->numUnknownSubmissions;
      unsigned int v14 = *((_DWORD *)sub_101069E58() + 1);
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_23;
      }
      uint64_t v12 = 72;
      unsigned int v13 = self->numWorkSubmissions;
      unsigned int v14 = *((_DWORD *)sub_101069E58() + 2);
    }
    if (v14 > v13)
    {
      ++*((unsigned char *)&self->super.super.isa + v12);
LABEL_22:
      LOBYTE(v16) = 1;
      return v16;
    }
LABEL_23:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  long long v15 = qword_1024191E8;
  BOOL v16 = os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    int v19 = 68289538;
    int v20 = 0;
    __int16 v21 = 2082;
    v22 = "";
    __int16 v23 = 2050;
    *(void *)double v24 = a3;
    *(_WORD *)&v24[8] = 2050;
    *(void *)double v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Warning,Requested unsupported harvest type\", \"loiType\":%{public}ld, \"calibrationType\":%{public}ld}", (uint8_t *)&v19, 0x26u);
    goto LABEL_23;
  }
  return v16;
}

- (void)sendTrackFrom:(double)a3 to:(double)a4 location:(CLLocationCoordinate2D)a5 horrUnc:(double)a6 type:(unint64_t)a7
{
  double longitude = a5.longitude;
  double latitude = a5.latitude;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  unsigned int v14 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 68289539;
    v16[1] = 0;
    __int16 v17 = 2082;
    double v18 = "";
    __int16 v19 = 2049;
    double v20 = a3;
    __int16 v21 = 2049;
    double v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"Sending track to buffer\", \"start_s\":\"%{private}.09f\", \"end_s\":\"%{private}.09f\"}", (uint8_t *)v16, 0x26u);
  }
  id v15 = (id)objc_opt_new();
  [v15 setFNotification:0];
  [v15 setFType:a7];
  [v15 setFStartTime:a3];
  [v15 setFEndTime:a4];
  [v15 setFLocationCoordinates:latitude, longitude];
  [v15 setFLocationHorizontalUncertainty:a6];
  [(CLBarometerCalibrationContextClient *)self->super._delegate startTrack:v15];
  [(CLBarometerCalibrationContextClient *)self->super._delegate stopTrack:v15];
}

- (BOOL)hasPressureChangeFrom:(double)a3 to:(double)a4
{
  fDataBuffers = self->super.fDataBuffers;
  uint64_t v5 = fDataBuffers[7];
  if (fDataBuffers[8] == v5
    || (unint64_t v6 = fDataBuffers[10],
        double v7 = (void *)(v5 + 8 * (v6 >> 8)),
        uint64_t v8 = *v7 + 16 * v6,
        uint64_t v9 = *(void *)(v5 + (((fDataBuffers[11] + v6) >> 5) & 0x7FFFFFFFFFFFFF8))
           + 16 * (*((unsigned char *)fDataBuffers + 88) + v6),
        v8 == v9))
  {
    float v13 = 3.4028e38;
    float v12 = 1.1755e-38;
  }
  else
  {
    float v12 = 1.1755e-38;
    float v13 = 3.4028e38;
    do
    {
      id v15 = *(double **)v8;
      unsigned int v14 = *(std::__shared_weak_count **)(v8 + 8);
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (*v15 > a3 && *v15 < a4)
      {
        double v17 = v15[1];
        if (v17 < v13) {
          float v13 = v17;
        }
        if (v17 > v12) {
          float v12 = v17;
        }
      }
      if (v14) {
        sub_1000DB0A0(v14);
      }
      v8 += 16;
      if (v8 - *v7 == 4096)
      {
        uint64_t v18 = v7[1];
        ++v7;
        uint64_t v8 = v18;
      }
    }
    while (v8 != v9);
  }
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  __int16 v19 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    v21[0] = 68289283;
    v21[1] = 0;
    __int16 v22 = 2082;
    __int16 v23 = "";
    __int16 v24 = 2049;
    double v25 = (float)(v12 - v13);
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"pressure range check\", \"pressure change\":\"%{private}.6f\"}", (uint8_t *)v21, 0x1Cu);
  }
  return v12 > (float)(v13 + 0.005);
}

- (double)timeUserGetCloseToVisitLocation
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  unsigned int v4 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    [(CLContextManagerSignificantLocationVisit *)self currentVisitLocation];
    double v6 = v5;
    [(CLContextManagerSignificantLocationVisit *)self currentVisitLocation];
    *(_DWORD *)buf = 68289539;
    int v38 = 0;
    __int16 v39 = 2082;
    double v40 = "";
    __int16 v41 = 2049;
    double v42 = v6;
    __int16 v43 = 2049;
    double v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"checking distance to visit\", \"visitLat\":\"%{private}7f\", \"visitLon\":\"%{private}7f\"}", buf, 0x26u);
  }
  [(CLContextManagerSignificantLocationVisit *)self currentVisitLocation];
  double v9 = v8;
  [(CLContextManagerSignificantLocationVisit *)self currentVisitLocation];
  if (sub_1000EF68C(v9, v10))
  {
    fDataBuffers = self->super.fDataBuffers;
    uint64_t v12 = fDataBuffers[1];
    double v13 = -1.0;
    if (fDataBuffers[2] != v12)
    {
      unint64_t v14 = fDataBuffers[4];
      id v15 = (void *)(v12 + 8 * (v14 >> 8));
      BOOL v16 = (double **)(*v15 + 16 * v14);
      uint64_t v17 = *(void *)(v12 + (((fDataBuffers[5] + v14) >> 5) & 0x7FFFFFFFFFFFFF8))
          + 16 * (*((unsigned char *)fDataBuffers + 40) + v14);
      if (v16 != (double **)v17)
      {
        char v18 = 0;
        while (1)
        {
          __int16 v19 = *v16;
          double v20 = (std::__shared_weak_count *)v16[1];
          if (v20) {
            atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          if (v19)
          {
            int v21 = 0;
            double v22 = v19[4];
            if (v22 > 0.0 && v22 < 66.0)
            {
              double v23 = v19[1];
              double v24 = v19[2];
              [(CLContextManagerSignificantLocationVisit *)self currentVisitLocation];
              double v26 = v25;
              [(CLContextManagerSignificantLocationVisit *)self currentVisitLocation];
              double v28 = sub_1000A3D9C(v23, v24, v26, v27);
              if (v28 <= 400.0)
              {
                if ((v18 & (v28 < 400.0)) == 1)
                {
                  double v2 = *v19;
                  char v18 = 1;
                  int v21 = 1;
                }
                else
                {
                  int v21 = 0;
                }
              }
              else
              {
                if (qword_1024191E0 != -1) {
                  dispatch_once(&qword_1024191E0, &stru_10230D3B8);
                }
                double v29 = qword_1024191E8;
                if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
                {
                  double v30 = *v19;
                  uint64_t v31 = *((void *)v19 + 1);
                  uint64_t v32 = *((void *)v19 + 2);
                  *(_DWORD *)buf = 68290051;
                  int v38 = 0;
                  __int16 v39 = 2082;
                  double v40 = "";
                  __int16 v41 = 2050;
                  double v42 = v30;
                  __int16 v43 = 2050;
                  double v44 = v28;
                  __int16 v45 = 2049;
                  uint64_t v46 = v31;
                  __int16 v47 = 2049;
                  uint64_t v48 = v32;
                  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"faraway location encountered\", \"time_s\":\"%{public}.09f\", \"distance\":\"%{public}.2f\", \"locLat\":\"%{private}7f\", \"locLon\":\"%{private}7f\"}", buf, 0x3Au);
                }
                int v21 = 7;
                char v18 = 1;
              }
            }
          }
          else
          {
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_10230D3B8);
            }
            v33 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 68289026;
              int v38 = 0;
              __int16 v39 = 2082;
              double v40 = "";
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"no location recorded\"}", buf, 0x12u);
            }
            int v21 = 6;
          }
          if (v20) {
            sub_1000DB0A0(v20);
          }
          if (v21 && v21 != 7) {
            break;
          }
          v16 += 2;
          if ((double **)((char *)v16 - *v15) == (double **)4096)
          {
            int v34 = (double **)v15[1];
            ++v15;
            BOOL v16 = v34;
          }
          if (v16 == (double **)v17) {
            return v13;
          }
        }
        if (v21 != 6) {
          return v2;
        }
      }
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230D3B8);
    }
    __int16 v35 = qword_1024191E8;
    double v13 = -1.0;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v38 = 0;
      __int16 v39 = 2082;
      double v40 = "";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Warning,invalid visit location, abort distance check\"}", buf, 0x12u);
    }
  }
  return v13;
}

- (BOOL)shouldTriggerFloorTransitionHarvest:(float)a3 atTime:(double)a4
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  double v7 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 68289539;
    int v14 = 0;
    __int16 v15 = 2082;
    BOOL v16 = "";
    __int16 v17 = 2049;
    double v18 = a3;
    __int16 v19 = 2050;
    double v20 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"received floor transition detection request\", \"pressure\":\"%{private}5f\", \"time_s\":\"%{public}.09f\"}", (uint8_t *)&v13, 0x26u);
  }
  p_floorTransitionDetector = &self->_floorTransitionDetector;
  sub_100939BC8((uint64_t)p_floorTransitionDetector, a3, a4);
  double v9 = sub_100939FB0((uint64_t)p_floorTransitionDetector);
  if (v9 == 0.0) {
    return 0;
  }
  double v11 = v9;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  uint64_t v12 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 68289283;
    int v14 = 0;
    __int16 v15 = 2082;
    BOOL v16 = "";
    __int16 v17 = 2049;
    double v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"floor transition detected\", \"transition time_s\":\"%{private}.09f\"}", (uint8_t *)&v13, 0x1Cu);
  }
  return a4 - v11 <= 600.0 && a4 - v11 >= 180.0;
}

+ (BOOL)isInsideSanctionedPolygon:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  double v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = 68289539;
    *(_WORD *)double v10 = 2082;
    *(void *)&v10[2] = "";
    __int16 v11 = 2049;
    CLLocationDegrees v12 = latitude;
    __int16 v13 = 2049;
    CLLocationDegrees v14 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"received request to resolve whether the following location is inside sanctioned polygons: \", \"lat\":\"%{private}6f\", \"lon\":\"%{private}6f\"}", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v9 = *(void *)&longitude;
  *(CLLocationDegrees *)double v10 = latitude;
  double v6 = &qword_102482CE0;
  uint64_t v7 = 7600;
  while (!sub_100E17CEC((double *)v6 + 3, (double *)&v9) || (sub_100E17B8C((long long **)v6, (long long *)&v9) & 1) == 0)
  {
    v6 += 10;
    v7 -= 80;
    if (!v7) {
      return 0;
    }
  }
  return 1;
}

+ (BOOL)isInsideSanctionedFloorTransitionPolygon:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230D3B8);
  }
  double v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = 68289539;
    *(_WORD *)uint64_t v9 = 2082;
    *(void *)&v9[2] = "";
    __int16 v10 = 2049;
    CLLocationDegrees v11 = latitude;
    __int16 v12 = 2049;
    CLLocationDegrees v13 = longitude;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"received request to resolve whether the following location is inside sanctioned floor transition polygons: \", \"lat\":\"%{private}6f\", \"lon\":\"%{private}6f\"}", (uint8_t *)&v8, 0x26u);
  }
  uint64_t v8 = *(void *)&longitude;
  *(CLLocationDegrees *)uint64_t v9 = latitude;
  unint64_t v6 = 0x1FFFFFFFFFFFFF60uLL;
  while (!sub_100E17CEC((double *)&qword_102484A78[v6 + 166], (double *)&v8)
       || (sub_100E17B8C((long long **)&qword_102484A78[v6 + 163], (long long *)&v8) & 1) == 0)
  {
    v6 += 10;
    if (!(v6 * 8)) {
      return 0;
    }
  }
  return 1;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)duringVisit
{
  return self->_duringVisit;
}

- (void)setDuringVisit:(BOOL)a3
{
  self->_duringVisit = a3;
}

- (CLLocationCoordinate2D)currentVisitLocation
{
  double latitude = self->_currentVisitLocation.latitude;
  double longitude = self->_currentVisitLocation.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCurrentVisitLocation:(CLLocationCoordinate2D)a3
{
  self->_currentVisitLocation = a3;
}

- (double)currentVisitHorizontalUncertainty
{
  return self->_currentVisitHorizontalUncertainty;
}

- (void)setCurrentVisitHorizontalUncertainty:(double)a3
{
  self->_currentVisitHorizontalUncertainty = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 17) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_WORD *)self + 64) = 0;
  return self;
}

@end