@interface CLContextManagerElevationProfile
- (CLContextManagerElevationProfile)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6;
- (RTRoutineManager)routineManager;
- (double)retrieveLastPushedTime;
- (void)_sendElevationsFromEstimates:(id)a3 startIndex:(unint64_t)a4 withCompletionBlock:(id)a5;
- (void)dealloc;
- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8;
- (void)getStoredVisit:(id)a3 betweenStartTime:(double)a4 andEndTime:(double)a5 withCompletionBlock:(id)a6;
- (void)saveLastPushedTime:(double)a3;
- (void)sendElevationsFromEstimates:(id)a3 withCompletionBlock:(id)a4;
- (void)setRoutineManager:(id)a3;
@end

@implementation CLContextManagerElevationProfile

- (CLContextManagerElevationProfile)initWithUniverse:(id)a3 delegate:(id)a4 withBuffer:(void *)a5 withSourceAggregator:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)CLContextManagerElevationProfile;
  v6 = [(CLContextManagerElevationProfileBase *)&v20 initWithUniverse:a3 delegate:a4 withBuffer:a5 withSourceAggregator:a6];
  v7 = v6;
  if (v6)
  {
    v19.receiver = v6;
    v19.super_class = (Class)CLContextManagerElevationProfile;
    [(CLContextManagerElevationProfileBase *)&v19 initElevationProfileEstimator:v6 withElevationDbInMemory:0];
    LOBYTE(v14) = 0;
    sub_10006ACBC(&v15, "ElevationVerbose", (unsigned __int8 *)&v14, 0);
    v7->_isVerboseLogging = v16;
    LOBYTE(v14) = 1;
    sub_10006ACBC(&v15, "EnableHistoricalElevationPushModel", (unsigned __int8 *)&v14, 0);
    v7->_pushModelEnabled = v16;
    sub_101A1F180(&v15, "MaxPushedElevationPeriod", &qword_101D9CFC0, 0);
    v7->_maxPushedElevationPeriod = v18;
    v7->_elevationProfileRoutineAdapter = objc_alloc_init(CLElevationProfileRoutineAdapter);
    v8 = (CLRoutineMonitorServiceProtocol *)[[-[CLIntersiloUniverse vendor](v7->super.super._universe, "vendor") proxyForService:@"CLRoutineMonitor"];
    v7->_routineMonitor = v8;
    [(CLRoutineMonitorServiceProtocol *)v8 registerDelegate:v7->_elevationProfileRoutineAdapter inSilo:[(CLIntersiloUniverse *)v7->super.super._universe silo]];
    v7->_routineManager = (RTRoutineManager *)objc_alloc_init((Class)RTRoutineManager);
    v7->_lastPushedTime = 0.0;
    [(CLContextManagerElevationProfile *)v7 retrieveLastPushedTime];
    v7->_lastPushedTime = v9;
    [(CLContextManagerElevationProfileBase *)v7 setRegisteredXPCTaskMSLP:0];
    [(CLContextManagerElevationProfileBase *)v7 setRegisteredXPCTaskElevationProfile:0];
    int v14 = 1155596288;
    sub_101A22680(&v15, "ElevationProfilePeriodSeconds", &v14, 0);
    double v10 = v17;
    v11 = (CLTimer *)[[-[CLIntersiloUniverse silo](v7->super.super._universe, "silo") newTimer];
    v7->_scheduleElevationProfile = v11;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1010111C8;
    v13[3] = &unk_1022A56E0;
    v13[4] = v7;
    *(double *)&v13[5] = v10;
    [(CLTimer *)v11 setHandler:v13];
    if (v7->_pushModelEnabled) {
      [(CLTimer *)v7->_scheduleElevationProfile setNextFireDelay:v10];
    }
  }
  return v7;
}

- (void)dealloc
{
  self->_routineMonitor = 0;
  self->_routineManager = 0;
  [(CLElevationProfileRoutineAdapter *)self->_elevationProfileRoutineAdapter invalidate];

  self->_elevationProfileRoutineAdapter = 0;
  [(CLTimer *)self->_scheduleElevationProfile invalidate];

  self->_scheduleElevationProfile = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLContextManagerElevationProfile;
  [(CLContextManagerElevationProfileBase *)&v3 dealloc];
}

- (void)getStoredVisit:(id)a3 betweenStartTime:(double)a4 andEndTime:(double)a5 withCompletionBlock:(id)a6
{
  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:](CLContextManagerElevationProfileBase, "isQueryValidWithStartTime:andEndTime:"))
  {
    v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a4];
    v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a5];
    id v13 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v11 endDate:v12];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230B438);
    }
    int v14 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      double v39 = COERCE_DOUBLE("startTime");
      __int16 v40 = 2048;
      double v41 = a4;
      __int16 v42 = 2080;
      v43 = "endTime";
      __int16 v44 = 2048;
      double v45 = a5;
      __int16 v46 = 2080;
      v47 = "startDate";
      __int16 v48 = 2112;
      v49 = v11;
      __int16 v50 = 2080;
      v51 = "endDate";
      __int16 v52 = 2112;
      v53 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "query routine visit with,%s,%f,%s,%f,%s,%@,%s,%@", buf, 0x52u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230B438);
      }
      int v22 = 136316930;
      double v23 = COERCE_DOUBLE("startTime");
      __int16 v24 = 2048;
      double v25 = a4;
      __int16 v26 = 2080;
      v27 = "endTime";
      __int16 v28 = 2048;
      double v29 = a5;
      __int16 v30 = 2080;
      v31 = "startDate";
      __int16 v32 = 2112;
      v33 = v11;
      __int16 v34 = 2080;
      v35 = "endDate";
      __int16 v36 = 2112;
      v37 = v12;
      objc_super v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    id v15 = objc_alloc((Class)RTStoredVisitFetchOptions);
    id v16 = [v15 initWithAscending:0 confidence:[NSNumber numberWithDouble:RTVisitConfidenceHigh] dateInterval:v13 limit:0 sources:[NSSet setWithObjects:&off_1023938F0, &off_102393908, 0]];
    routineMonitor = self->_routineMonitor;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_101011B60;
    v21[3] = &unk_10230B3A0;
    v21[4] = a3;
    v21[5] = a6;
    [(CLRoutineMonitorServiceProtocol *)routineMonitor fetchStoredVisitsWithOptions:v16 withReply:v21];
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230B438);
    }
    double v18 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      double v39 = a4;
      __int16 v40 = 2048;
      double v41 = a5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "query routine visit with unordered startTime,%f,endTime,%f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230B438);
      }
      int v22 = 134218240;
      double v23 = a4;
      __int16 v24 = 2048;
      double v25 = a5;
      objc_super v20 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:]", "%s\n", v20);
      if (v20 != (char *)buf) {
        free(v20);
      }
    }
    (*((void (**)(id, uint64_t))a6 + 2))(a6, 0x7FFFFFFFLL);
  }
}

- (void)fetchLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andBatchSize:(unsigned int)a5 andLocationArray:(id)a6 andVisitSearchStartIndex:(int)a7 andCompletionBlock:(id)a8
{
  -[CLRoutineMonitorServiceProtocol enumerateStoredLocationsWithOptions:withReply:](self->_routineMonitor, "enumerateStoredLocationsWithOptions:withReply:", _NSConcreteStackBlock, 3221225472, sub_101012688, &unk_10230B3C8, self, a6, objc_autorelease(objc_msgSend(objc_alloc((Class)RTStoredLocationEnumerationOptions), "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", objc_autorelease(objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:",
              *(void *)&a5,
              a6,
              *(void *)&a7,
              a3),
            +[NSDate dateWithTimeIntervalSinceReferenceDate:a4])), a5, 0, 0.0)), a8);
}

- (void)_sendElevationsFromEstimates:(id)a3 startIndex:(unint64_t)a4 withCompletionBlock:(id)a5
{
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [a3 count];
  unint64_t v10 = a4;
  if (a4 <= 0xFFFFFFFFFFFFFF9BLL)
  {
    unint64_t v10 = a4;
    if ((unint64_t)v9 > a4)
    {
      unint64_t v10 = a4;
      unint64_t v11 = a4;
      do
      {
        [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) fCovariance];
        if (v12 >= 0.0)
        {
          [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) fCovariance];
          if (v13 >= 0.0)
          {
            [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) fCovariance];
            float v15 = v14;
            if (v11)
            {
              [objc_msgSend(a3, "objectAtIndexedSubscript:", v11 - 1) timestamp];
              double lastPushedTime = v16;
            }
            else
            {
              double lastPushedTime = self->_lastPushedTime;
            }
            [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
            double v19 = lastPushedTime;
            if (v18 - lastPushedTime > 15.36)
            {
              [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
              double v19 = v20 + -15.36;
            }
            [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
            if (v19 > v21)
            {
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_10230B438);
              }
              int v22 = qword_1024191E8;
              if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
              {
                double v23 = self->_lastPushedTime;
                [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
                *(_DWORD *)buf = 134350080;
                unint64_t v67 = v11;
                __int16 v68 = 2050;
                double v69 = lastPushedTime;
                __int16 v70 = 2050;
                double v71 = v23;
                __int16 v72 = 2050;
                double v73 = v24;
                __int16 v74 = 2050;
                double v75 = v19;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Elevation timestamp rolled back,iteration,%{public}lu,prevTimestamp,%{public}f,lastPushTime,%{public}f,endTime,%{public}f,beginTime,%{public}f", buf, 0x34u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1024191E0 != -1) {
                  dispatch_once(&qword_1024191E0, &stru_10230B438);
                }
                double v50 = self->_lastPushedTime;
                [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
                int v56 = 134350080;
                unint64_t v57 = v11;
                __int16 v58 = 2050;
                double v59 = lastPushedTime;
                __int16 v60 = 2050;
                double v61 = v50;
                __int16 v62 = 2050;
                double v63 = v51;
                __int16 v64 = 2050;
                double v65 = v19;
                __int16 v52 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile _sendElevationsFromEstimates:startIndex:withCompletionBlock:]", "%s\n", v52);
                if (v52 != (char *)buf) {
                  free(v52);
                }
              }
              [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
              double v19 = v25 + -15.36;
            }
            double v26 = sqrtf(v15);
            id v27 = objc_alloc((Class)NSDateInterval);
            __int16 v28 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v19];
            [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
            id v29 = [v27 initWithStartDate:v28 endDate:[NSDate dateWithTimeIntervalSinceReferenceDate:]];
            id v30 = objc_alloc((Class)RTElevation);
            [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) fState];
            id v32 = [v30 initWithElevation:v29 dateInterval:0 elevationUncertainty:v31 estimationStatus:v26];
            if (self->_isVerboseLogging)
            {
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_10230B438);
              }
              v33 = qword_1024191E8;
              if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
              {
                [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
                unint64_t v35 = v34;
                [v32 elevation];
                double v37 = v36;
                [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) fState];
                double v39 = v38;
                [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) fCovariance];
                *(_DWORD *)buf = 134219008;
                unint64_t v67 = v35;
                __int16 v68 = 2048;
                double v69 = v37;
                __int16 v70 = 2048;
                double v71 = v26;
                __int16 v72 = 2048;
                double v73 = v39;
                __int16 v74 = 2048;
                double v75 = sqrtf(v40);
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "send elevation profile back to client,timestamp,%f,elevation,%f,elevationUncertainty,%f,mslp,%f,mslpUncertainty,%f", buf, 0x34u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1024191E0 != -1) {
                  dispatch_once(&qword_1024191E0, &stru_10230B438);
                }
                [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) timestamp];
                unint64_t v43 = v42;
                [v32 elevation];
                double v45 = v44;
                [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) fState];
                double v47 = v46;
                [objc_msgSend(a3, "objectAtIndexedSubscript:", v11) fCovariance];
                int v56 = 134219008;
                unint64_t v57 = v43;
                __int16 v58 = 2048;
                double v59 = v45;
                __int16 v60 = 2048;
                double v61 = v26;
                __int16 v62 = 2048;
                double v63 = v47;
                __int16 v64 = 2048;
                double v65 = sqrtf(v48);
                v49 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile _sendElevationsFromEstimates:startIndex:withCompletionBlock:]", "%s\n", v49);
                if (v49 != (char *)buf) {
                  free(v49);
                }
              }
            }
            [v8 addObject:v32];

            unint64_t v10 = v11;
          }
        }
        ++v11;
        id v41 = [a3 count];
      }
      while (v11 < a4 + 100 && v11 < (unint64_t)v41);
    }
  }
  v53 = [[-[CLIntersiloUniverse silo](self->super.super._universe, "silo") queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_101013440;
  block[3] = &unk_10230B418;
  block[4] = self;
  block[5] = v8;
  block[8] = a4;
  block[9] = v10;
  block[6] = a3;
  block[7] = a5;
  dispatch_async(v53, block);
}

- (void)sendElevationsFromEstimates:(id)a3 withCompletionBlock:(id)a4
{
  if ([a3 count])
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230B438);
    }
    v7 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [a3 count];
      [objc_msgSend(a3, "firstObject") timestamp];
      uint64_t v10 = v9;
      [objc_msgSend(a3, "lastObject") timestamp];
      *(_DWORD *)buf = 134218496;
      id v16 = v8;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      __int16 v19 = 2048;
      uint64_t v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "pushing elevations,num,%lu,first timestamp,%f,last timestamp,%f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230B438);
      }
      [a3 count];
      [objc_msgSend(a3, "firstObject") timestamp];
      [objc_msgSend(a3, "lastObject") timestamp];
      float v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile sendElevationsFromEstimates:withCompletionBlock:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    [(CLContextManagerElevationProfile *)self _sendElevationsFromEstimates:a3 startIndex:0 withCompletionBlock:a4];
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230B438);
    }
    float v12 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = [a3 count];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pushing elevations,num,%lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_10230B438);
      }
      [a3 count];
      float v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile sendElevationsFromEstimates:withCompletionBlock:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (void)saveLastPushedTime:(double)a3
{
  double v7 = a3;
  uint64_t v3 = sub_1000A6958();
  sub_10016332C(v3, "CLElevationProfile_LastPushedTimestamp", &v7);
  uint64_t v4 = *(void *)sub_1000A6958();
  (*(void (**)(void))(v4 + 944))();
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230B438);
  }
  v5 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "saved elevation profile push time,%{public}f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230B438);
    }
    int v8 = 134349056;
    double v9 = v7;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile saveLastPushedTime:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (double)retrieveLastPushedTime
{
  double v6 = 0.0;
  uint64_t v2 = sub_1000A6958();
  sub_1000A699C(v2, "CLElevationProfile_LastPushedTimestamp", &v6);
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_10230B438);
  }
  uint64_t v3 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "retrieved elevation profile push time,%{public}f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_10230B438);
    }
    int v7 = 134349056;
    double v8 = v6;
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLContextManagerElevationProfile retrieveLastPushedTime]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  return v6;
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

@end