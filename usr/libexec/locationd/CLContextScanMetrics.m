@interface CLContextScanMetrics
- (CLContextScanMetrics)initWithStartTime:(double)a3;
- (id)getMetricEventBins;
- (int)getFamiliarityEventFromIndex:(int)a3;
- (int)getModeValueForEvent:(int)a3;
- (void)addEvent:(int)a3 atTime:(double)a4;
- (void)associationEvent:(BOOL)a3 atTime:(double)a4;
- (void)dealloc;
- (void)hearbeatEventAtTime:(double)a3;
- (void)initializeModeTransitions:(double)a3;
- (void)motionEvent:(CLMotionActivity *)a3;
- (void)processEventsForTime:(double)a3;
- (void)scanEvents:(id)a3 atTime:(double)a4;
- (void)setModeString;
- (void)visitEvent:(id)a3 withFamiliarityIndex:(int)a4;
@end

@implementation CLContextScanMetrics

- (CLContextScanMetrics)initWithStartTime:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLContextScanMetrics;
  v4 = [(CLContextScanMetrics *)&v8 init];
  if (v4)
  {
    v5 = [[CLMetricEventBins alloc] initWithAnalyticsEvent:@"com.apple.locationd.context.wifiscanbins" binPeriod:30 atCurrentTime:a3];
    v4->_scanbins = v5;
    sub_100103240();
    [(CLMetricEventBins *)v5 setMetricDimensions:+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithBool:sub_100737DF0()], @"isSuperWsb")];
    [(CLMetricEventBins *)v4->_scanbins setIntervalDistributions:&off_102397D10];
    [(CLMetricEventBins *)v4->_scanbins setHourAmbiguity:4];
    v4->_lastScan = -1.0;
    v4->_lastEventHour = (int)(a3 / 3600.0);
    v4->_inVisit = 0;
    *(_WORD *)&v4->_isAssociated = 0;
    v4->_eventsInited = 0;
    v4->_events = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->_eventStart = a3;
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_1022F3B60);
    }
    v6 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms handler init\"}", buf, 0x12u);
    }
  }
  return v4;
}

- (void)dealloc
{
  [(NSMutableArray *)self->_events removeAllObjects];

  v3.receiver = self;
  v3.super_class = (Class)CLContextScanMetrics;
  [(CLContextScanMetrics *)&v3 dealloc];
}

- (void)scanEvents:(id)a3 atTime:(double)a4
{
  self->_lastScan = a4;
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F3B60);
  }
  v7 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    int v10 = "";
    __int16 v11 = 1026;
    unsigned int v12 = [a3 count];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms scan\", \"groups\":%{public}d}", (uint8_t *)v8, 0x18u);
  }
  [(CLContextScanMetrics *)self processEventsForTime:a4];
  [(CLMetricEventBins *)self->_scanbins processEventTimes:a3];
}

- (void)associationEvent:(BOOL)a3 atTime:(double)a4
{
  BOOL v5 = a3;
  v7 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F3B60);
  }
  objc_super v8 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 68289795;
    v12[1] = 0;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 1026;
    BOOL v16 = v5;
    __int16 v17 = 1026;
    int v18 = (int)a4;
    __int16 v19 = 2113;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms mode notify associate\", \"assoc\":%{public}hhd, \"t\":%{public}d, \"date\":%{private, location:escape_only}@}", (uint8_t *)v12, 0x28u);
  }
  int eventsInited = self->_eventsInited;
  if (eventsInited == 7)
  {
    if (v5) {
      uint64_t v10 = 10;
    }
    else {
      uint64_t v10 = 11;
    }
    [(CLContextScanMetrics *)self addEvent:v10 atTime:a4];
  }
  else
  {
    int v11 = eventsInited | 4;
    self->_int eventsInited = v11;
    self->_isAssociated = v5;
    if (v11 == 7) {
      [(CLContextScanMetrics *)self initializeModeTransitions:a4];
    }
  }
}

- (void)motionEvent:(CLMotionActivity *)a3
{
  v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", *(double *)&a3[1].type, a10);
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F3B60);
  }
  __int16 v15 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = CLMotionActivity::isInVehicle(a3);
    int isWalking = CLMotionActivity::isWalking(a3);
    int v18 = (int)*(double *)&a3[1].type;
    v24[0] = 68290051;
    __int16 v25 = 2082;
    v24[1] = 0;
    v26 = "";
    __int16 v27 = 1026;
    int v28 = v16;
    __int16 v29 = 1026;
    int v30 = isWalking;
    __int16 v31 = 1026;
    int v32 = v18;
    __int16 v33 = 2113;
    v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms mode notify motion\", \"driving\":%{public}hhd, \"walking\":%{public}hhd, \"time\":%{public}d, \"date\":%{private, location:escape_only}@}", (uint8_t *)v24, 0x2Eu);
  }
  int eventsInited = self->_eventsInited;
  if (eventsInited == 7)
  {
    if (CLMotionActivity::isInVehicle(a3))
    {
      double v20 = *(double *)&a3[1].type;
      v21 = self;
      uint64_t v22 = 1;
    }
    else
    {
      int v23 = CLMotionActivity::isWalking(a3);
      double v20 = *(double *)&a3[1].type;
      if (v23)
      {
        v21 = self;
        uint64_t v22 = 2;
      }
      else
      {
        v21 = self;
        uint64_t v22 = 3;
      }
    }
    [(CLContextScanMetrics *)v21 addEvent:v22 atTime:v20];
  }
  else
  {
    self->_int eventsInited = eventsInited | 1;
    self->_isDriving = CLMotionActivity::isInVehicle(a3);
    self->_int isWalking = CLMotionActivity::isWalking(a3);
    if (self->_eventsInited == 7) {
      [(CLContextScanMetrics *)self initializeModeTransitions:*(double *)&a3[1].type];
    }
  }
}

- (void)visitEvent:(id)a3 withFamiliarityIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  unsigned int v7 = [a3 hasDepartureDate];
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F3B60);
  }
  objc_super v8 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 68290563;
    v16[1] = 0;
    __int16 v17 = 2082;
    int v18 = "";
    __int16 v19 = 2114;
    id v20 = [a3 arrivalDate];
    __int16 v21 = 2114;
    id v22 = [a3 departureDate];
    __int16 v23 = 2114;
    id v24 = [a3 detectionDate];
    __int16 v25 = 1026;
    unsigned int v26 = [a3 hasDepartureDate] ^ 1;
    __int16 v27 = 1026;
    int v28 = v4;
    __int16 v29 = 2113;
    id v30 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms mode notify visit\", \"arrive\":%{public, location:escape_only}@, \"end\":%{public, location:escape_only}@, \"detect\":%{public, location:escape_only}@, \"entry\":%{public}hhd, \"fi\":%{public}d, \"visit\":%{private, location:escape_only}@}", (uint8_t *)v16, 0x46u);
  }
  if (v7)
  {
    [objc_msgSend(a3, "departureDate") timeIntervalSinceReferenceDate];
    double v10 = v9;
    int eventsInited = self->_eventsInited;
    if (eventsInited == 7)
    {
      unsigned int v12 = self;
      uint64_t v13 = 9;
LABEL_10:
      [(CLContextScanMetrics *)v12 addEvent:v13 atTime:v10];
      return;
    }
  }
  else
  {
    [objc_msgSend(a3, "arrivalDate") timeIntervalSinceReferenceDate];
    double v10 = v14;
    int eventsInited = self->_eventsInited;
    if (eventsInited == 7)
    {
      uint64_t v13 = [(CLContextScanMetrics *)self getFamiliarityEventFromIndex:v4];
      unsigned int v12 = self;
      goto LABEL_10;
    }
  }
  int v15 = eventsInited | 2;
  self->_int eventsInited = v15;
  self->_inVisit = v7 ^ 1;
  self->_famIndex = v4;
  if (v15 == 7) {
    [(CLContextScanMetrics *)self initializeModeTransitions:v10];
  }
}

- (void)hearbeatEventAtTime:(double)a3
{
  double lastScan = self->_lastScan;
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F3B60);
  }
  double v6 = a3 - lastScan;
  unsigned int v7 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    double v10 = "";
    __int16 v11 = 1026;
    int v12 = (int)v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms metric heartbeat\", \"delta\":%{public}d}", (uint8_t *)v8, 0x18u);
  }
  if (v6 > 2700.0)
  {
    [(CLContextScanMetrics *)self processEventsForTime:a3];
    [(CLMetricEventBins *)self->_scanbins updateToCurrentTime:a3];
  }
}

- (int)getModeValueForEvent:(int)a3
{
  switch(a3)
  {
    case 4:
      return 10;
    case 2:
      if (self->_inVisit)
      {
        int famIndex = self->_famIndex;
        if (famIndex >= 0) {
          int v5 = 7;
        }
        else {
          int v5 = 8;
        }
        if (famIndex <= 66) {
          int v6 = v5;
        }
        else {
          int v6 = 6;
        }
        if (famIndex <= 89) {
          int v7 = v6;
        }
        else {
          int v7 = 5;
        }
        if (famIndex <= 97) {
          return v7;
        }
        else {
          return 4;
        }
      }
      else
      {
        return 9;
      }
    case 1:
      if (self->_isDriving)
      {
        return 1;
      }
      else if (self->_isWalking)
      {
        return 2;
      }
      else
      {
        return 3;
      }
    default:
      return -1;
  }
}

- (void)setModeString
{
  if (self->_isDriving)
  {
    objc_super v3 = @"Driving";
  }
  else if (self->_inVisit)
  {
    if (self->_isAssociated) {
      CFStringRef v4 = @"Wifi";
    }
    else {
      CFStringRef v4 = &stru_10234F018;
    }
    int famIndex = self->_famIndex;
    if (famIndex < 98)
    {
      if (famIndex < 90)
      {
        if (famIndex < 67)
        {
          if (famIndex < 0) {
            objc_super v3 = @"InVisitUnknown";
          }
          else {
            objc_super v3 = +[NSString stringWithFormat:@"InVisitNovel%@", v4];
          }
        }
        else
        {
          objc_super v3 = +[NSString stringWithFormat:@"InVisitRare%@", v4];
        }
      }
      else
      {
        objc_super v3 = +[NSString stringWithFormat:@"InVisitOften%@", v4];
      }
    }
    else
    {
      objc_super v3 = +[NSString stringWithFormat:@"InVisitDaily%@", v4];
    }
  }
  else
  {
    if (self->_isWalking) {
      CFStringRef v6 = @"Walking";
    }
    else {
      CFStringRef v6 = &stru_10234F018;
    }
    objc_super v3 = +[NSString stringWithFormat:@"OutOfVisit%@", v6];
  }
  self->_modeString = &v3->isa;
}

- (void)initializeModeTransitions:(double)a3
{
  [(CLContextScanMetrics *)self setModeString];
  if (qword_102419550 != -1) {
    dispatch_once(&qword_102419550, &stru_1022F3B60);
  }
  int v5 = qword_102419558;
  if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = [(NSString *)self->_modeString UTF8String];
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2082;
    __int16 v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms mode init\", \"start\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  [(CLMetricEventBins *)self->_scanbins setRelatedModes:&off_102397D28 atTime:self->_modeString startingWith:1 andTransitions:a3];
}

- (void)addEvent:(int)a3 atTime:(double)a4
{
  int v5 = [[EventEntry alloc] initWithTime:*(void *)&a3 andEvent:a4];
  events = self->_events;

  [(NSMutableArray *)events addObject:v5];
}

- (void)processEventsForTime:(double)a3
{
  uint64_t v3 = (uint64_t)(a3 / 3600.0);
  if (self->_lastEventHour != v3)
  {
    double v5 = a3 + -1800.0;
    CFStringRef v6 = &qword_102419000;
    if (self->_eventStart <= a3 + -1800.0)
    {
      __int16 v9 = +[NSSortDescriptor sortDescriptorWithKey:@"time" ascending:1];
      events = self->_events;
      v61 = v9;
      id obj = [(NSMutableArray *)events sortedArrayUsingDescriptors:+[NSArray arrayWithObjects:&v61 count:1]];
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F3B60);
      }
      __int16 v11 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
      {
        int lastEventHour = self->_lastEventHour;
        int eventStart = (int)self->_eventStart;
        double v14 = self->_events;
        uint64_t buf = 68290562;
        __int16 v49 = 2082;
        v50 = "";
        __int16 v51 = 1026;
        int v52 = lastEventHour;
        __int16 v53 = 1026;
        *(_DWORD *)v54 = v3;
        *(_WORD *)&v54[4] = 1026;
        *(_DWORD *)&v54[6] = eventStart;
        __int16 v55 = 1026;
        int v56 = v3;
        __int16 v57 = 2114;
        v58 = v14;
        __int16 v59 = 2114;
        id v60 = obj;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms modeproc hour crossed\", \"last\":%{public}d, \"curr\":%{public}d, \"start\":%{public}d, \"end\":%{public}d, \"events\":%{public, location:escape_only}@, \"sorted\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x3Eu);
      }
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v15 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v44;
        int v18 = 0;
LABEL_13:
        uint64_t v19 = 0;
        int v41 = v18;
        int v40 = v18 + v16;
        while (2)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v43 + 1) + 8 * v19);
          [v20 time];
          double v22 = v21;
          unsigned int v23 = [v20 eventnum];
          if (v6[170] != -1) {
            dispatch_once(&qword_102419550, &stru_1022F3B60);
          }
          id v24 = qword_102419558;
          if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEBUG))
          {
            uint64_t buf = 68289538;
            __int16 v49 = 2082;
            v50 = "";
            __int16 v51 = 1026;
            int v52 = (int)v22;
            __int16 v53 = 1026;
            *(_DWORD *)v54 = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cms modeproc iter\", \"time\":%{public}d, \"event\":%{public}d}", (uint8_t *)&buf, 0x1Eu);
          }
          if (v22 <= v5)
          {
            __int16 v25 = v6;
            BOOL v26 = 0;
            int v27 = -1;
            if (v23 <= 0xB)
            {
              int v28 = 1 << v23;
              if (((1 << v23) & 0x3F0) != 0)
              {
                if (self->_isDriving)
                {
                  BOOL v26 = 0;
                }
                else
                {
                  BOOL inVisit = self->_inVisit;
                  unsigned int v31 = [(CLContextScanMetrics *)self getFamiliarityEventFromIndex:self->_famIndex];
                  BOOL v26 = self->_inVisit && v31 != v23 || inVisit != (v23 != 9);
                }
                int v27 = 2;
              }
              else if ((v28 & 0xE) != 0)
              {
                BOOL v29 = self->_isDriving != (v23 == 1);
                if (!self->_isDriving && !self->_inVisit && self->_isWalking != (v23 == 2)) {
                  BOOL v29 = 1;
                }
                BOOL v26 = v29;
                int v27 = 1;
              }
              else if ((v28 & 0xC00) != 0)
              {
                BOOL v26 = self->_inVisit && self->_isAssociated != (v23 == 10);
                int v27 = 4;
              }
            }
            if (v25[170] != -1) {
              dispatch_once(&qword_102419550, &stru_1022F3B60);
            }
            v34 = qword_102419558;
            if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t buf = 68289794;
              __int16 v49 = 2082;
              v50 = "";
              __int16 v51 = 1026;
              int v52 = v27;
              __int16 v53 = 1026;
              *(_DWORD *)v54 = (int)v22;
              *(_WORD *)&v54[4] = 1026;
              *(_DWORD *)&v54[6] = v23;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms modeproc update\", \"type\":%{public}d, \"time\":%{public}d, \"eventnum\":%{public}d}", (uint8_t *)&buf, 0x24u);
            }
            CFStringRef v6 = v25;
            switch(v23)
            {
              case 1u:
                self->_isDriving = 1;
                goto LABEL_55;
              case 2u:
                self->_isDriving = 0;
                self->_int isWalking = 1;
                if (!v26) {
                  goto LABEL_70;
                }
                goto LABEL_69;
              case 3u:
                self->_isDriving = 0;
LABEL_55:
                self->_int isWalking = 0;
                if (!v26) {
                  goto LABEL_70;
                }
                goto LABEL_69;
              case 4u:
                self->_BOOL inVisit = 1;
                int v35 = 98;
                goto LABEL_62;
              case 5u:
                self->_BOOL inVisit = 1;
                int v35 = 90;
                goto LABEL_62;
              case 6u:
                self->_BOOL inVisit = 1;
                int v35 = 67;
                goto LABEL_62;
              case 7u:
                self->_BOOL inVisit = 1;
                goto LABEL_65;
              case 8u:
                self->_BOOL inVisit = 1;
                int v35 = -1;
LABEL_62:
                self->_int famIndex = v35;
                if (!v26) {
                  goto LABEL_70;
                }
                goto LABEL_69;
              case 9u:
                self->_BOOL inVisit = 0;
LABEL_65:
                self->_int famIndex = 0;
                if (!v26) {
                  goto LABEL_70;
                }
                goto LABEL_69;
              case 0xAu:
                self->_isAssociated = 1;
                goto LABEL_68;
              case 0xBu:
                self->_isAssociated = 0;
                if (!v26) {
                  goto LABEL_70;
                }
                goto LABEL_69;
              default:
LABEL_68:
                if (v26)
                {
LABEL_69:
                  [(CLContextScanMetrics *)self setModeString];
                  [(CLMetricEventBins *)self->_scanbins updateRelatedModesTo:self->_modeString atTime:v22];
                }
LABEL_70:
                if (v16 != (id)++v19) {
                  continue;
                }
                id v36 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
                id v16 = v36;
                int v37 = v40;
                int v18 = v40;
                if (!v36) {
                  goto LABEL_78;
                }
                goto LABEL_13;
            }
          }
          break;
        }
        int v37 = v41 + v19;
      }
      else
      {
        int v37 = 0;
      }
LABEL_78:
      -[NSMutableArray removeObjectsInRange:](self->_events, "removeObjectsInRange:", 0, v37);
      if (v6[170] != -1) {
        dispatch_once(&qword_102419550, &stru_1022F3B60);
      }
      v38 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
      {
        v39 = self->_events;
        uint64_t buf = 68289538;
        __int16 v49 = 2082;
        v50 = "";
        __int16 v51 = 1026;
        int v52 = v37;
        __int16 v53 = 2114;
        *(void *)v54 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms modeproc end\", \"processed\":%{public}d, \"events\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x22u);
      }
      self->_int lastEventHour = v3;
    }
    else
    {
      self->_int lastEventHour = v3;
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_1022F3B60);
      }
      int v7 = qword_102419558;
      if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = (int)self->_eventStart;
        uint64_t buf = 68289538;
        __int16 v49 = 2082;
        v50 = "";
        __int16 v51 = 1026;
        int v52 = v8;
        __int16 v53 = 1026;
        *(_DWORD *)v54 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cms modeproc hour first\", \"start\":%{public}d, \"end\":%{public}d}", (uint8_t *)&buf, 0x1Eu);
      }
    }
  }
}

- (int)getFamiliarityEventFromIndex:(int)a3
{
  if (a3 >= 0) {
    int v3 = 7;
  }
  else {
    int v3 = 8;
  }
  if (a3 <= 66) {
    int v4 = v3;
  }
  else {
    int v4 = 6;
  }
  if (a3 <= 89) {
    int v5 = v4;
  }
  else {
    int v5 = 5;
  }
  if (a3 <= 97) {
    return v5;
  }
  else {
    return 4;
  }
}

- (id)getMetricEventBins
{
  return self->_scanbins;
}

@end