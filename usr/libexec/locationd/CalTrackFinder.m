@interface CalTrackFinder
- (CalTrackFinder)init;
- (NSDate)timeEnd;
- (NSDate)timeEndGpsLocationSegment;
- (NSDate)timeStart;
- (NSDate)timeStartGpsLocationSegment;
- (NSMutableArray)gpsLocationBuffer;
- (NSMutableArray)gpsLocationBufferFiltered;
- (NSMutableArray)gpsOdometerBuffer;
- (NSMutableArray)pedometerBuffer;
- (double)_extremaRemovedMean:(double)a3[5];
- (double)distanceGps;
- (double)distanceRawPed;
- (double)steps;
- (id)_filterGpsLocationBuffer;
- (id)calTrackHandler;
- (int)gpsSource;
- (unint64_t)_removeAdditionalInconsistentSpeedPedometerEntries;
- (void)_calculateTimeStartEndDistanceGpsPed;
- (void)_clearBuffers;
- (void)_closeCurrentTrack;
- (void)_closeTrackCheckGpsLocation;
- (void)_closeTrackCheckGpsLocationFiltered;
- (void)_closeTrackCheckGpsOdometer;
- (void)_closeTrackCheckPedometer;
- (void)_updateGpsLocationBufferFiltered:(id)a3;
- (void)dealloc;
- (void)setCalTrackHandler:(id)a3;
- (void)setDistanceGps:(double)a3;
- (void)setDistanceRawPed:(double)a3;
- (void)setGpsLocationBuffer:(id)a3;
- (void)setGpsLocationBufferFiltered:(id)a3;
- (void)setGpsOdometerBuffer:(id)a3;
- (void)setGpsSource:(int)a3;
- (void)setPedometerBuffer:(id)a3;
- (void)setSteps:(double)a3;
- (void)setTimeEnd:(id)a3;
- (void)setTimeEndGpsLocationSegment:(id)a3;
- (void)setTimeStart:(id)a3;
- (void)setTimeStartGpsLocationSegment:(id)a3;
- (void)stop;
- (void)updateGpsLocationBuffer:(id)a3 gpsSource:(int)a4;
- (void)updateGpsOdometerBuffer:(CLOdometerEntry *)a3;
- (void)updatePedometerBuffer:(CLExtendedStepCountEntry *)a3;
@end

@implementation CalTrackFinder

- (CalTrackFinder)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalTrackFinder;
  v2 = [(CalTrackFinder *)&v6 init];
  if (v2)
  {
    *((void *)v2 + 3) = +[NSMutableArray arrayWithCapacity:5];
    *((void *)v2 + 4) = +[NSMutableArray arrayWithCapacity:2048];
    *((void *)v2 + 5) = +[NSMutableArray arrayWithCapacity:2048];
    *((void *)v2 + 6) = +[NSMutableArray arrayWithCapacity:1024];
    *((_DWORD *)v2 + 2) = 0;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *(_OWORD *)(v2 + 88) = 0u;
    *((void *)v2 + 13) = 0;
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    v3 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "initialize", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder init]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
  return (CalTrackFinder *)v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CalTrackFinder;
  [(CalTrackFinder *)&v3 dealloc];
}

- (void)stop
{
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_102311DA8);
  }
  objc_super v3 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CloseTrack,Stop", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder stop]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CalTrackFinder *)self _closeCurrentTrack];
}

- (void)updateGpsLocationBuffer:(id)a3 gpsSource:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (qword_102419650 != -1) {
    dispatch_once(&qword_102419650, &stru_102311DC8);
  }
  v7 = qword_102419658;
  if (os_log_type_enabled((os_log_t)qword_102419658, OS_LOG_TYPE_DEBUG))
  {
    [a3 coordinate];
    uint64_t v9 = v8;
    [a3 coordinate];
    uint64_t v11 = v10;
    [a3 horizontalAccuracy];
    uint64_t v13 = v12;
    [a3 speed];
    uint64_t v15 = v14;
    [a3 course];
    uint64_t v17 = v16;
    [a3 altitude];
    uint64_t v19 = v18;
    [a3 verticalAccuracy];
    uint64_t v21 = v20;
    [objc_msgSend(a3, "timestamp") timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 136317698;
    v29 = "CL-GPS-UnfilteredMultipleSources";
    __int16 v30 = 1024;
    *(_DWORD *)v31 = 1;
    *(_WORD *)&v31[4] = 2048;
    *(void *)&v31[6] = v9;
    __int16 v32 = 2048;
    uint64_t v33 = v11;
    __int16 v34 = 2048;
    uint64_t v35 = v13;
    __int16 v36 = 2048;
    uint64_t v37 = v15;
    __int16 v38 = 2048;
    uint64_t v39 = v17;
    __int16 v40 = 2048;
    uint64_t v41 = v19;
    __int16 v42 = 2048;
    uint64_t v43 = v21;
    __int16 v44 = 2048;
    uint64_t v45 = v22;
    __int16 v46 = 1024;
    int v47 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestamp,%0.3f,Source,%d", buf, 0x68u);
  }
  if (sub_10013D1A0(117, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419650 != -1) {
      dispatch_once(&qword_102419650, &stru_102311DC8);
    }
    [a3 coordinate];
    [a3 coordinate];
    [a3 horizontalAccuracy];
    [a3 speed];
    [a3 course];
    [a3 altitude];
    [a3 verticalAccuracy];
    [objc_msgSend(a3, "timestamp") timeIntervalSinceReferenceDate];
    v26 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("LOCATION", 1, 0, 2, "-[CalTrackFinder updateGpsLocationBuffer:gpsSource:]", "%s\n", v26);
    if (v26 != (char *)buf) {
      free(v26);
    }
  }
  if (![(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] count]
    || (objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "lastObject"), "timestamp")), v23 >= 0.01))
  {
    -[CalTrackFinder setTimeEndGpsLocationSegment:](self, "setTimeEndGpsLocationSegment:", [a3 timestamp]);
    if ([(CalTrackFinder *)self gpsSource] != v4)
    {
      if ([(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] count]) {
        [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] removeAllObjects];
      }
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      v24 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v25 = [(CalTrackFinder *)self gpsSource];
        *(_DWORD *)buf = 134218240;
        v29 = (const char *)v25;
        __int16 v30 = 2048;
        *(void *)v31 = v4;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsSourceChange,GpsSourceOld,%ld,GpsSourceNew,%ld", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_102311DA8);
        }
        [(CalTrackFinder *)self gpsSource];
        v27 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder updateGpsLocationBuffer:gpsSource:]", "%s\n", v27);
        if (v27 != (char *)buf) {
          free(v27);
        }
      }
      [(CalTrackFinder *)self _closeCurrentTrack];
    }
    [(CalTrackFinder *)self setGpsSource:v4];
    if ([(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] count] == (id)5) {
      [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] removeObjectAtIndex:0];
    }
    if (![(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] count]) {
      -[CalTrackFinder setTimeStartGpsLocationSegment:](self, "setTimeStartGpsLocationSegment:", [a3 timestamp]);
    }
    [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] addObject:a3];
    [(CalTrackFinder *)self _closeTrackCheckGpsLocation];
    if ([(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] count] == (id)5) {
      [(CalTrackFinder *)self _updateGpsLocationBufferFiltered:[(CalTrackFinder *)self _filterGpsLocationBuffer]];
    }
  }
}

- (void)_updateGpsLocationBufferFiltered:(id)a3
{
  if (![(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] count]
    || (objc_msgSend(objc_msgSend(a3, "timestamp"), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "lastObject"), "timestamp")), v5 >= 0.01))
  {
    [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] addObject:a3];
    [(CalTrackFinder *)self _closeTrackCheckGpsLocationFiltered];
  }
}

- (void)updateGpsOdometerBuffer:(CLOdometerEntry *)a3
{
  double v5 = [(CalTrackFinder *)self gpsOdometerBuffer];
  objc_sync_enter(v5);
  if ([(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] count]
    && (objc_super v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->startTime), -[NSDate timeIntervalSinceDate:](v6, "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"), "date")), v7 < 0.01))
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    uint64_t v16 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Suppressing duplicate GPS Odometer Entry from CalTrack %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      int v19 = 138412290;
      uint64_t v20 = v6;
      uint64_t v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder updateGpsOdometerBuffer:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    objc_sync_exit(v5);
  }
  else
  {
    uint64_t v8 = [CMGpsOdometerEntry alloc];
    long long v9 = *(_OWORD *)&a3->slope;
    v18[8] = *(_OWORD *)&a3->gpsCourseRadians;
    v18[9] = v9;
    CLOdometerTrackProximityInfo trackProximityInfo = a3->trackProximityInfo;
    v18[10] = *(_OWORD *)&a3->batchedLocationFixType;
    v18[11] = trackProximityInfo;
    long long v11 = *(_OWORD *)&a3->quality;
    v18[4] = *(_OWORD *)&a3->timestampGps;
    v18[5] = v11;
    long long v12 = *(_OWORD *)&a3->smoothedGPSAltitude;
    v18[6] = *(_OWORD *)&a3->groundAltitude;
    v18[7] = v12;
    long long v13 = *(_OWORD *)&a3->accuracy;
    v18[0] = *(_OWORD *)&a3->startTime;
    v18[1] = v13;
    long long v14 = *(_OWORD *)&a3->odometer;
    v18[2] = *(_OWORD *)&a3->speed;
    v18[3] = v14;
    uint64_t v15 = [(CMGpsOdometerEntry *)v8 initWithOdometerEntry:v18];
    [(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] addObject:v15];

    objc_sync_exit(v5);
    [(CalTrackFinder *)self _closeTrackCheckGpsOdometer];
  }
}

- (void)updatePedometerBuffer:(CLExtendedStepCountEntry *)a3
{
  if (a3->addition.firstStepTime >= 0.01 && a3->addition.lastStepTime >= 0.01)
  {
    if (![(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count]
      || (-[NSDate timeIntervalSinceDate:](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3->base.startTime), "timeIntervalSinceDate:", objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"), "date")), v5 >= 0.01))
    {
      objc_super v6 = [CMPedometerEntry alloc];
      memcpy(v8, a3, sizeof(v8));
      double v7 = [(CMPedometerEntry *)v6 initWithStepEntry:v8];
      [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] addObject:v7];

      [(CalTrackFinder *)self _closeTrackCheckPedometer];
    }
  }
}

- (id)_filterGpsLocationBuffer
{
  id v3 = [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] objectAtIndexedSubscript:2];
  for (uint64_t i = 0; i != 5; ++i)
  {
    [[-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "objectAtIndexedSubscript:", i) coordinate];
    v63[i] = v5;
    [[-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "objectAtIndexedSubscript:", i) coordinate];
    v62[i] = v6;
  }
  [(CalTrackFinder *)self _extremaRemovedMean:v63];
  double v8 = v7;
  [(CalTrackFinder *)self _extremaRemovedMean:v62];
  double v10 = v9;
  id v11 = objc_alloc((Class)CLLocation);
  [v3 altitude];
  double v13 = v12;
  [v3 horizontalAccuracy];
  double v15 = v14;
  [v3 verticalAccuracy];
  double v17 = v16;
  [v3 course];
  double v19 = v18;
  [v3 speed];
  id v21 = [v11 initWithCoordinate:objc_msgSend(v3, "timestamp") altitude:v8 horizontalAccuracy:v10 verticalAccuracy:v13 course:v15 speed:v17 timestamp:v19];
  if (qword_102419650 != -1) {
    dispatch_once(&qword_102419650, &stru_102311DC8);
  }
  uint64_t v22 = qword_102419658;
  if (os_log_type_enabled((os_log_t)qword_102419658, OS_LOG_TYPE_DEBUG))
  {
    [v21 coordinate];
    uint64_t v24 = v23;
    [v21 coordinate];
    uint64_t v26 = v25;
    [v21 horizontalAccuracy];
    uint64_t v28 = v27;
    [v21 speed];
    uint64_t v30 = v29;
    [v21 course];
    uint64_t v32 = v31;
    [v21 altitude];
    uint64_t v34 = v33;
    [v21 verticalAccuracy];
    uint64_t v36 = v35;
    [objc_msgSend(v21, "timestamp") timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 136317698;
    uint64_t v41 = "CL-GPS-Filtered";
    __int16 v42 = 1024;
    int v43 = 1;
    __int16 v44 = 2048;
    uint64_t v45 = v24;
    __int16 v46 = 2048;
    uint64_t v47 = v26;
    __int16 v48 = 2048;
    uint64_t v49 = v28;
    __int16 v50 = 2048;
    uint64_t v51 = v30;
    __int16 v52 = 2048;
    uint64_t v53 = v32;
    __int16 v54 = 2048;
    uint64_t v55 = v34;
    __int16 v56 = 2048;
    uint64_t v57 = v36;
    __int16 v58 = 2048;
    uint64_t v59 = v37;
    __int16 v60 = 1024;
    unsigned int v61 = [(CalTrackFinder *)self gpsSource];
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Type,%s,Pos,%d,%+.10f,%+.10f,Accuracy,%.3f,Speed,%0.3f,Course,%0.3f,Altitude,%0.3f,VerticalAccuracy,%0.3f,Timestamp,%0.3f,Source,%d", buf, 0x68u);
  }
  if (sub_10013D1A0(117, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419650 != -1) {
      dispatch_once(&qword_102419650, &stru_102311DC8);
    }
    [v21 coordinate];
    [v21 coordinate];
    [v21 horizontalAccuracy];
    [v21 speed];
    [v21 course];
    [v21 altitude];
    [v21 verticalAccuracy];
    [objc_msgSend(v21, "timestamp") timeIntervalSinceReferenceDate];
    [(CalTrackFinder *)self gpsSource];
    uint64_t v39 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("LOCATION", 1, 0, 2, "-[CalTrackFinder _filterGpsLocationBuffer]", "%s\n", v39);
    if (v39 != (char *)buf) {
      free(v39);
    }
  }
  return v21;
}

- (double)_extremaRemovedMean:(double)a3[5]
{
  uint64_t v3 = 0;
  int v4 = 0;
  int v5 = 0;
  do
  {
    double v6 = a3[v3];
    if (v6 >= a3[v5]) {
      int v5 = v3;
    }
    if (v6 < a3[v4]) {
      int v4 = v3;
    }
    ++v3;
  }
  while (v3 != 5);
  uint64_t v7 = 0;
  a3[v5] = 0.0;
  a3[v4] = 0.0;
  double v8 = 0.0;
  do
    double v8 = v8 + a3[v7++];
  while (v7 != 5);
  return v8 / 3.0;
}

- (void)_calculateTimeStartEndDistanceGpsPed
{
  [(CalTrackFinder *)self setTimeStart:0];
  [(CalTrackFinder *)self setTimeEnd:0];
  [(CalTrackFinder *)self setDistanceGps:0.0];
  [(CalTrackFinder *)self setDistanceRawPed:0.0];
  [(CalTrackFinder *)self setSteps:0.0];
  uint64_t v3 = +[NSArray arrayWithArray:[(CalTrackFinder *)self pedometerBuffer]];
  if ([(NSArray *)v3 count])
  {
    id v4 = [[-[NSArray firstObject](v3, "firstObject") firstStepTime];
    id v5 = [[-[NSArray lastObject](v3, "lastObject") lastStepTime];
    if (v4)
    {
      double v6 = v5;
      if (v5)
      {
        [v4 timeIntervalSinceReferenceDate];
        double v8 = v7;
        [v6 timeIntervalSinceReferenceDate];
        if (v8 < v9)
        {
          double v10 = +[NSArray arrayWithArray:[(CalTrackFinder *)self gpsLocationBufferFiltered]];
          if ([(NSArray *)v10 count])
          {
            long long v91 = 0u;
            long long v92 = 0u;
            long long v89 = 0u;
            long long v90 = 0u;
            id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v89 objects:v96 count:16];
            if (v11)
            {
              uint64_t v12 = *(void *)v90;
              while (2)
              {
                for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v90 != v12) {
                    objc_enumerationMutation(v10);
                  }
                  double v14 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                  [objc_msgSend(v14, "timestamp") timeIntervalSinceReferenceDate];
                  double v16 = v15;
                  [v4 timeIntervalSinceReferenceDate];
                  if (v16 >= v17)
                  {
                    [objc_msgSend(v14, "timestamp") timeIntervalSinceReferenceDate];
                    double v19 = v18;
                    [v6 timeIntervalSinceReferenceDate];
                    if (v19 <= v20)
                    {
                      id v11 = [v14 timestamp];
                      goto LABEL_17;
                    }
                  }
                }
                id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v89 objects:v96 count:16];
                if (v11) {
                  continue;
                }
                break;
              }
            }
LABEL_17:
            long long v87 = 0u;
            long long v88 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            id v21 = [(NSArray *)v10 reverseObjectEnumerator];
            id v22 = [(NSEnumerator *)v21 countByEnumeratingWithState:&v85 objects:v95 count:16];
            if (v22)
            {
              id v23 = v22;
              uint64_t v24 = *(void *)v86;
              v76 = v3;
              while (2)
              {
                for (j = 0; j != v23; j = (char *)j + 1)
                {
                  if (*(void *)v86 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v85 + 1) + 8 * (void)j);
                  [objc_msgSend(v26, "timestamp") timeIntervalSinceReferenceDate];
                  double v28 = v27;
                  [v4 timeIntervalSinceReferenceDate];
                  if (v28 >= v29)
                  {
                    [objc_msgSend(v26, "timestamp") timeIntervalSinceReferenceDate];
                    double v31 = v30;
                    [v6 timeIntervalSinceReferenceDate];
                    if (v31 <= v32)
                    {
                      id v33 = [v26 timestamp];
                      if (v11)
                      {
                        uint64_t v34 = v33;
                        if (v33)
                        {
                          [v11 timeIntervalSinceReferenceDate];
                          double v36 = v35;
                          [v34 timeIntervalSinceReferenceDate];
                          if (v36 < v37)
                          {
                            __int16 v38 = +[NSMutableArray arrayWithCapacity:2048];
                            long long v81 = 0u;
                            long long v82 = 0u;
                            long long v83 = 0u;
                            long long v84 = 0u;
                            id v39 = [(NSArray *)v10 countByEnumeratingWithState:&v81 objects:v94 count:16];
                            if (v39)
                            {
                              id v40 = v39;
                              uint64_t v41 = *(void *)v82;
                              do
                              {
                                for (k = 0; k != v40; k = (char *)k + 1)
                                {
                                  if (*(void *)v82 != v41) {
                                    objc_enumerationMutation(v10);
                                  }
                                  int v43 = *(void **)(*((void *)&v81 + 1) + 8 * (void)k);
                                  [objc_msgSend(v43, "timestamp") timeIntervalSinceReferenceDate];
                                  double v45 = v44;
                                  [v11 timeIntervalSinceReferenceDate];
                                  if (v45 >= v46)
                                  {
                                    [objc_msgSend(v43, "timestamp") timeIntervalSinceReferenceDate];
                                    double v48 = v47;
                                    [v34 timeIntervalSinceReferenceDate];
                                    if (v48 <= v49) {
                                      [(NSMutableArray *)v38 addObject:v43];
                                    }
                                  }
                                }
                                id v40 = [(NSArray *)v10 countByEnumeratingWithState:&v81 objects:v94 count:16];
                              }
                              while (v40);
                            }
                            if ((unint64_t)[(NSMutableArray *)v38 count] >= 2)
                            {
                              +[CLPolygonSimplifier simplifiedLength:v38 threshold:6.7];
                              -[CalTrackFinder setDistanceGps:](self, "setDistanceGps:");
                              [(CalTrackFinder *)self setTimeStart:v11];
                              [(CalTrackFinder *)self setTimeEnd:v34];
                              long long v79 = 0u;
                              long long v80 = 0u;
                              long long v77 = 0u;
                              long long v78 = 0u;
                              id v50 = [(NSArray *)v76 countByEnumeratingWithState:&v77 objects:v93 count:16];
                              double v51 = 0.0;
                              double v52 = 0.0;
                              double v53 = 0.0;
                              if (v50)
                              {
                                id v54 = v50;
                                uint64_t v55 = *(void *)v78;
                                do
                                {
                                  for (m = 0; m != v54; m = (char *)m + 1)
                                  {
                                    if (*(void *)v78 != v55) {
                                      objc_enumerationMutation(v76);
                                    }
                                    uint64_t v57 = *(void **)(*((void *)&v77 + 1) + 8 * (void)m);
                                    [objc_msgSend(v57, "firstStepTime") timeIntervalSinceReferenceDate];
                                    double v59 = v58;
                                    [(NSDate *)[(CalTrackFinder *)self timeStart] timeIntervalSinceReferenceDate];
                                    if (v59 >= v60)
                                    {
                                      [objc_msgSend(v57, "lastStepTime") timeIntervalSinceReferenceDate];
                                      double v62 = v61;
                                      [(NSDate *)[(CalTrackFinder *)self timeEnd] timeIntervalSinceReferenceDate];
                                      if (v62 <= v63)
                                      {
                                        [v57 speedCurrent];
                                        double v65 = v64;
                                        [v57 deltaActiveTime];
                                        double v51 = v51 + v65 * v66;
                                        [v57 deltaActiveTime];
                                        double v52 = v52 + v67;
                                        [v57 stepCadenceCurrent];
                                        double v69 = v68;
                                        [v57 deltaActiveTime];
                                        double v53 = v53 + v69 * v70;
                                      }
                                    }
                                  }
                                  id v54 = [(NSArray *)v76 countByEnumeratingWithState:&v77 objects:v93 count:16];
                                }
                                while (v54);
                              }
                              [(NSDate *)[(CalTrackFinder *)self timeEnd] timeIntervalSinceDate:[(CalTrackFinder *)self timeStart]];
                              if (v52 <= 0.01) {
                                double v72 = 0.0;
                              }
                              else {
                                double v72 = v51 / v52;
                              }
                              double v73 = v72 * v71;
                              if (v52 <= 0.01) {
                                double v74 = 0.0;
                              }
                              else {
                                double v74 = v53 / v52;
                              }
                              [(CalTrackFinder *)self setDistanceRawPed:v73];
                              [(NSDate *)[(CalTrackFinder *)self timeEnd] timeIntervalSinceDate:[(CalTrackFinder *)self timeStart]];
                              [(CalTrackFinder *)self setSteps:v74 * v75];
                            }
                          }
                        }
                      }
                      return;
                    }
                  }
                }
                id v23 = [(NSEnumerator *)v21 countByEnumeratingWithState:&v85 objects:v95 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }
    }
  }
}

- (void)_closeTrackCheckGpsLocation
{
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] count] >= 2)
  {
    [objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "lastObject"), "timestamp") timeIntervalSinceDate:[objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder gpsLocationBuffer](self, "gpsLocationBuffer"), "count") - 2), "timestamp")];
    double v4 = v3;
    if (v3 > 2.5)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      id v5 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v8 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsLocationEntryTimeOut,TimeSinceLastEntry,%0.2f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_102311DA8);
        }
        double v6 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsLocation]", "%s\n", v6);
        if (v6 != (char *)buf) {
          free(v6);
        }
      }
      [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBuffer] removeAllObjects];
      [(CalTrackFinder *)self _closeCurrentTrack];
    }
  }
}

- (void)_closeTrackCheckGpsLocationFiltered
{
  if ([(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] count])
  {
    [[-[NSMutableArray lastObject](-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered"), "lastObject") horizontalAccuracy];
    double v4 = v3;
    if (v3 > 24.0)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      id v5 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsFilteredHorizontalAccuracyOutOfBounds,HorizontalAccuracy,%0.2f", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_28;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1)
      {
LABEL_32:
        id v11 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsLocationFiltered]", "%s\n", v11);
        if (v11 != (char *)buf) {
          free(v11);
        }
LABEL_28:
        [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] removeLastObject];
        goto LABEL_29;
      }
LABEL_34:
      dispatch_once(&qword_102419030, &stru_102311DA8);
      goto LABEL_32;
    }
  }
  if ([(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] count])
  {
    [(-[CalTrackFinder gpsLocationBufferFiltered](self, "gpsLocationBufferFiltered")) lastObject].speed
    double v7 = v6;
    if (v6 <= 0.0 || v6 > 13.0)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v10 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsFilteredSpeedOutOfBounds,Speed,%0.2f", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_28;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1) {
        goto LABEL_32;
      }
      goto LABEL_34;
    }
  }
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] count] < 0x800)return; {
  if (qword_102419030 != -1)
  }
    dispatch_once(&qword_102419030, &stru_102311DA8);
  double v8 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CloseTrack,NumSamplesMaxGpsFilteredLocation,NumSamples,%d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] count];
    double v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsLocationFiltered]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
LABEL_29:
  [(CalTrackFinder *)self _closeCurrentTrack];
}

- (void)_closeTrackCheckGpsOdometer
{
  double v3 = [(CalTrackFinder *)self gpsOdometerBuffer];
  objc_sync_enter(v3);
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] count] >= 2)
  {
    [objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject") date timeIntervalSinceDate:[objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "count") - 2), "date")];
    double v5 = v4;
    if (v4 > 2.5)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v6 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CloseTrack,GpsOdometerEntryTimeOut,TimeSinceLastEntry,%0.2f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_102311DA8);
        }
        double v19 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
      [(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] removeLastObject];
      objc_sync_exit(v3);
      [(CalTrackFinder *)self _closeCurrentTrack];
      return;
    }
  }
  objc_sync_exit(v3);
  double v7 = [(CalTrackFinder *)self gpsOdometerBuffer];
  objc_sync_enter(v7);
  [objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"), "date") timeIntervalSinceDate:[objc_msgSend(-[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject"), "date")];
  if (v8 > 15.0)
  {
    [(-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer")) lastObject].dist;
    double v10 = v9;
    [[-[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject") dist];
    double v12 = v10 - v11;
    if (v12 > 200.0)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v13 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "CloseTrack,DistanceGpsRoughMax,DistanceGpsRough,%0.2f", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_30;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v18);
      if (v18 == (char *)buf) {
        goto LABEL_30;
      }
      goto LABEL_49;
    }
  }
  objc_sync_exit(v7);
  double v7 = [(CalTrackFinder *)self gpsOdometerBuffer];
  objc_sync_enter(v7);
  [objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "lastObject"), "date") timeIntervalSinceDate:[objc_msgSend(-[NSMutableArray firstObject](-[CalTrackFinder gpsOdometerBuffer](self, "gpsOdometerBuffer"), "firstObject"), "date")];
  double v15 = v14;
  if (v14 > 500.0)
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    double v16 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      double v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "CloseTrack,TimeSpanMax,Timespan,%0.2f", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_30;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    double v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v18);
    if (v18 == (char *)buf) {
      goto LABEL_30;
    }
    goto LABEL_49;
  }
  objc_sync_exit(v7);
  double v7 = [(CalTrackFinder *)self gpsOdometerBuffer];
  objc_sync_enter(v7);
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] count] >= 0x800)
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    double v17 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = [(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] count];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "CloseTrack,NumSamplesMaxGpsOdometer,NumSamples,%d", buf, 8u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_30;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    [(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] count];
    double v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckGpsOdometer]", "%s\n", v18);
    if (v18 == (char *)buf) {
      goto LABEL_30;
    }
LABEL_49:
    free(v18);
LABEL_30:
    objc_sync_exit(v7);
    [(CalTrackFinder *)self _closeCurrentTrack];
    return;
  }

  objc_sync_exit(v7);
}

- (void)_closeTrackCheckPedometer
{
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count] >= 2)
  {
    [objc_msgSend(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject"), "date") timeIntervalSinceDate:[objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") - 2), "date")];
    double v4 = v3;
    if (v3 > 3.84)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v5 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v23 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "CloseTrack,PedometerEntryTimeOut,TimeSinceLastEntry,%0.2f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_102311DA8);
        }
        double v20 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckPedometer]", "%s\n", v20);
        if (v20 != (char *)buf) {
          free(v20);
        }
      }
      [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
      goto LABEL_54;
    }
  }
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count] >= 2)
  {
    unsigned int v6 = [[-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer")) lastObject] deltaSteps];
    if (!(v6
         + objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "objectAtIndexedSubscript:", (char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count")- 2), "deltaSteps")))
    {
      [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
      [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v7 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CloseTrack,NoStepsForTwoPedometerEntries", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_54;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1) {
        goto LABEL_61;
      }
LABEL_63:
      dispatch_once(&qword_102419030, &stru_102311DA8);
LABEL_61:
      double v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeTrackCheckPedometer]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
      goto LABEL_54;
    }
  }
  if ([(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count])
  {
    [[-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject") speedCurrent];
    if (v8 <= 0.0)
    {
      [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v19 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "CloseTrack,PedometerSpeedCurrentZero", buf, 2u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_54;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1) {
        goto LABEL_61;
      }
      goto LABEL_63;
    }
  }
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count] >= 2)
  {
    [(-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject")) speedCurrent];
    double v10 = v9;
    [(-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer")) objectAtIndexedSubscript:((char *)-[NSMutableArray count](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "count") - 2) - 2] speedCurrent;
    double v12 = v11;
    double v13 = 0.0;
    if (v11 > 0.01) {
      double v13 = (v10 - v11) / v11;
    }
    if (fabs(v13) > 0.1)
    {
      [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v14 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        double v23 = v12;
        __int16 v24 = 2048;
        double v25 = v10;
        __int16 v26 = 2048;
        double v27 = v13 * 100.0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "CloseTrack,PedometerSpeedCurrentJump,SpeedCurrentPrev,%0.2f,SpeedCurrent,%0.2f,SpeedCurrentJumpPercent,%0.2f", buf, 0x20u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_54;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1) {
        goto LABEL_61;
      }
      goto LABEL_63;
    }
  }
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count] >= 2)
  {
    [[-[NSMutableArray lastObject](-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer"), "lastObject") pedometerArmConstrainedState];
    int v16 = (int)v15;
    if ((int)v15)
    {
      [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
      [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v17 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "CloseTrack,PedometerArmConstrainedState,%d", buf, 8u);
      }
      if (!sub_10013D1A0(115, 2)) {
        goto LABEL_54;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419030 == -1) {
        goto LABEL_61;
      }
      goto LABEL_63;
    }
  }
  if ((unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count] < 0x400) {
    return;
  }
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_102311DA8);
  }
  double v18 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count];
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "CloseTrack,NumSamplesMaxPedometer,NumSamples,%d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count];
    goto LABEL_61;
  }
LABEL_54:
  [(CalTrackFinder *)self _closeCurrentTrack];
}

- (void)_closeCurrentTrack
{
  *(double *)&unint64_t v3 = COERCE_DOUBLE((id)[(CalTrackFinder *)self _removeAdditionalInconsistentSpeedPedometerEntries]);
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_102311DA8);
  }
  double v4 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v69 = *(double *)&v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "CloseTrack,NumAdditionalPedometerEntriesRemoved,%ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    int v62 = 134217984;
    double v63 = *(double *)&v3;
    double v51 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v51);
    if (v51 != (char *)buf) {
      free(v51);
    }
  }
  [(CalTrackFinder *)self _calculateTimeStartEndDistanceGpsPed];
  double v5 = [CalibrationTrack alloc];
  unsigned int v6 = [(CalTrackFinder *)self timeStart];
  double v7 = [(CalTrackFinder *)self timeEnd];
  [(CalTrackFinder *)self distanceGps];
  double v9 = v8;
  [(CalTrackFinder *)self distanceRawPed];
  double v11 = v10;
  [(CalTrackFinder *)self steps];
  double v13 = [(CalibrationTrack *)v5 initWithStart:v6 stop:v7 distanceGps:[(CalTrackFinder *)self gpsSource] distanceRawPed:v9 steps:v11 gpsSource:v12];
  if (qword_102419030 != -1) {
    dispatch_once(&qword_102419030, &stru_102311DA8);
  }
  double v14 = qword_102419038;
  if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
  {
    [(NSDate *)[(CalTrackFinder *)self timeStartGpsLocationSegment] timeIntervalSinceReferenceDate];
    double v16 = v15;
    [(NSDate *)[(CalTrackFinder *)self timeEndGpsLocationSegment] timeIntervalSinceReferenceDate];
    double v18 = v17;
    double v19 = COERCE_DOUBLE([-[CalibrationTrack description](v13, "description") UTF8String]);
    *(_DWORD *)buf = 134218498;
    double v69 = v16;
    __int16 v70 = 2048;
    double v71 = v18;
    __int16 v72 = 2080;
    double v73 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "CloseTrack,TrackMetrics,TimeStartGpsLocationSegment,%0.2f,TimeEndGpsLocationSegment,%0.2f,%s", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    [(NSDate *)[(CalTrackFinder *)self timeStartGpsLocationSegment] timeIntervalSinceReferenceDate];
    double v53 = v52;
    [(NSDate *)[(CalTrackFinder *)self timeEndGpsLocationSegment] timeIntervalSinceReferenceDate];
    int v62 = 134218498;
    double v63 = v53;
    __int16 v64 = 2048;
    double v65 = v54;
    __int16 v66 = 2080;
    double v67 = COERCE_DOUBLE([-[CalibrationTrack description](v13, "description") UTF8String]);
    uint64_t v55 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v55);
    if (v55 != (char *)buf) {
      free(v55);
    }
  }
  [(CalTrackFinder *)self distanceGps];
  if (v20 >= 100.0)
  {
    [(CalTrackFinder *)self distanceGps];
    double v25 = v24;
    [(NSDate *)[(CalTrackFinder *)self timeEnd] timeIntervalSinceReferenceDate];
    double v27 = v26;
    [(NSDate *)[(CalTrackFinder *)self timeStart] timeIntervalSinceReferenceDate];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    double v29 = v25 / (v27 - v28);
    double v30 = [(CalTrackFinder *)self gpsLocationBufferFiltered];
    id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v31)
    {
      id v32 = v31;
      unint64_t v33 = 0;
      uint64_t v34 = *(void *)v58;
      double v35 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v32; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v58 != v34) {
            objc_enumerationMutation(v30);
          }
          double v37 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          [objc_msgSend(v37, "timestamp") timeIntervalSinceReferenceDate];
          double v39 = v38;
          [(NSDate *)[(CalTrackFinder *)self timeStart] timeIntervalSinceReferenceDate];
          if (v39 >= v40)
          {
            [objc_msgSend(v37, "timestamp") timeIntervalSinceReferenceDate];
            double v42 = v41;
            [(NSDate *)[(CalTrackFinder *)self timeEnd] timeIntervalSinceReferenceDate];
            if (v42 <= v43)
            {
              [v37 speed];
              double v35 = v35 + v44;
              ++v33;
            }
          }
        }
        id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v32);
      if (v33) {
        double v45 = v35 / (double)v33;
      }
      else {
        double v45 = 0.0;
      }
    }
    else
    {
      double v45 = 0.0;
    }
    double v46 = 1.0;
    if (v29 > 0.0) {
      double v46 = (v45 - v29) / v29;
    }
    if (fabs(v46) <= 0.2)
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v49 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "CloseTrack,Success", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_102311DA8);
        }
        LOWORD(v62) = 0;
        __int16 v56 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v56);
        if (v56 != (char *)buf) {
          free(v56);
        }
      }
      if ([(CalTrackFinder *)self calTrackHandler])
      {
        id v50 = [(CalTrackFinder *)self calTrackHandler];
        v50[2](v50, v13);
      }
    }
    else
    {
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      double v47 = qword_102419038;
      if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        double v69 = v45;
        __int16 v70 = 2048;
        double v71 = v29;
        __int16 v72 = 2048;
        double v73 = v46;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "CloseCurrentTrack,Fail,GpsSpeedDiscrepancyDetected,SpeedGpsRawMean,%0.2f,GpsDistanceOverTime,%0.2f,SpeedErrorPercent,%0.2f", buf, 0x20u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419030 != -1) {
          dispatch_once(&qword_102419030, &stru_102311DA8);
        }
        int v62 = 134218496;
        double v63 = v45;
        __int16 v64 = 2048;
        double v65 = v29;
        __int16 v66 = 2048;
        double v67 = v46;
        goto LABEL_45;
      }
    }
  }
  else
  {
    if (qword_102419030 != -1) {
      dispatch_once(&qword_102419030, &stru_102311DA8);
    }
    double v21 = qword_102419038;
    if (os_log_type_enabled((os_log_t)qword_102419038, OS_LOG_TYPE_DEBUG))
    {
      [(CalTrackFinder *)self distanceGps];
      *(_DWORD *)buf = 134217984;
      double v69 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "CloseTrack,Fail,DistanceGpsNotSufficient,DistanceGps,%0.2f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419030 != -1) {
        dispatch_once(&qword_102419030, &stru_102311DA8);
      }
      [(CalTrackFinder *)self distanceGps];
      int v62 = 134217984;
      double v63 = v23;
LABEL_45:
      double v48 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CalTrackFinder _closeCurrentTrack]", "%s\n", v48);
      if (v48 != (char *)buf) {
        free(v48);
      }
    }
  }
  [(CalTrackFinder *)self _clearBuffers];
}

- (unint64_t)_removeAdditionalInconsistentSpeedPedometerEntries
{
  uint64_t v3 = -1;
  for (unint64_t i = 1; ; ++i)
  {
    id v5 = (unint64_t)[(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count] <= 8
       ? [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count]
       : (id)8;
    if ((unint64_t)v5 <= i - 1) {
      break;
    }
    unsigned int v6 = (char *)[(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count] + v3;
    [(-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer")) objectAtIndexedSubscript:v6].speedCurrent
    double v7 = 1.0;
    if (v8 > 0.01)
    {
      [(-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer")) objectAtIndexedSubscript:v6].speedInstant;
      double v10 = v9;
      [-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer") objectAtIndexedSubscript:v6].speedCurrent;
      double v12 = v10 - v11;
      [[-[CalTrackFinder pedometerBuffer](self, "pedometerBuffer") objectAtIndexedSubscript:v6] speedCurrent];
      double v7 = v12 / v13;
    }
    if (fabs(v7) < 0.1) {
      break;
    }
    [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
    --v3;
  }
  if ([(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count]) {
    [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
  }
  else {
    --i;
  }
  if ([(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count])
  {
    ++i;
    [(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] removeLastObject];
  }
  return i;
}

- (void)_clearBuffers
{
  if ([(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] count]) {
    [(NSMutableArray *)[(CalTrackFinder *)self gpsLocationBufferFiltered] removeAllObjects];
  }
  uint64_t v3 = [(CalTrackFinder *)self gpsOdometerBuffer];
  objc_sync_enter(v3);
  if ([(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] count]) {
    [(NSMutableArray *)[(CalTrackFinder *)self gpsOdometerBuffer] removeAllObjects];
  }
  objc_sync_exit(v3);
  if ([(NSMutableArray *)[(CalTrackFinder *)self pedometerBuffer] count])
  {
    double v4 = [(CalTrackFinder *)self pedometerBuffer];
    [(NSMutableArray *)v4 removeAllObjects];
  }
}

- (id)calTrackHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCalTrackHandler:(id)a3
{
}

- (NSMutableArray)gpsLocationBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGpsLocationBuffer:(id)a3
{
}

- (NSMutableArray)gpsLocationBufferFiltered
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGpsLocationBufferFiltered:(id)a3
{
}

- (NSMutableArray)gpsOdometerBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setGpsOdometerBuffer:(id)a3
{
}

- (NSMutableArray)pedometerBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPedometerBuffer:(id)a3
{
}

- (NSDate)timeStart
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeStart:(id)a3
{
}

- (NSDate)timeEnd
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimeEnd:(id)a3
{
}

- (NSDate)timeStartGpsLocationSegment
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTimeStartGpsLocationSegment:(id)a3
{
}

- (NSDate)timeEndGpsLocationSegment
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTimeEndGpsLocationSegment:(id)a3
{
}

- (double)distanceGps
{
  return self->_distanceGps;
}

- (void)setDistanceGps:(double)a3
{
  self->_distanceGps = a3;
}

- (double)distanceRawPed
{
  return self->_distanceRawPed;
}

- (void)setDistanceRawPed:(double)a3
{
  self->_distanceRawPed = a3;
}

- (double)steps
{
  return self->_steps;
}

- (void)setSteps:(double)a3
{
  self->_steps = a3;
}

- (int)gpsSource
{
  return self->_gpsSource;
}

- (void)setGpsSource:(int)a3
{
  self->_gpsSource = a3;
}

@end