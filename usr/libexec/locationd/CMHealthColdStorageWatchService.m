@interface CMHealthColdStorageWatchService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)checkDeferral:(id)a3;
- (CMHealthColdStorageWatchService)init;
- (id).cxx_construct;
- (void)beginService;
- (void)continueSync:(id)a3;
- (void)endService;
- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onSyncActivity:(id)a3;
- (void)resetAnalytics;
- (void)saveCurrentSyncProgress;
- (void)sendAnalytics;
- (void)sendCompanionData:(id)a3 activity:(id)a4;
- (void)setActivityAsDone:(id)a3;
- (void)setUpAggregationOnTimer;
- (void)setupSyncActivity;
@end

@implementation CMHealthColdStorageWatchService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247C660 != -1) {
    dispatch_once(&qword_10247C660, &stru_1022BD3E8);
  }
  return (id)qword_10247C658;
}

- (CMHealthColdStorageWatchService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMHealthColdStorageWatchService;
  return [(CMHealthColdStorageWatchService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CMHealthColdStorageWatchServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CMHealthColdStorageWatchServiceClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_10247C670 != -1) {
    dispatch_once(&qword_10247C670, &stru_1022BD408);
  }
  return byte_10247C668;
}

- (void)beginService
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022BD4C8);
  }
  objc_super v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting up CMHealthColdStorageWatchService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  self->fCurrentTableIndex = 0;
  self->fIterationCount = 0;
  [(CMHealthColdStorageWatchService *)self setupSyncActivity];
  self->fCompanionConnected = 0;
  sub_1000B2C0C();
}

- (void)endService
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022BD4C8);
  }
  objc_super v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CMHealthColdStorageWatchService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService endService]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  value = self->fCompanionClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:5];
    unint64_t v5 = self->fCompanionClient.__ptr_.__value_;
    self->fCompanionClient.__ptr_.__value_ = 0;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
    }
  }
  fAggregationTimer = self->fAggregationTimer;
  if (fAggregationTimer)
  {
    dispatch_source_cancel(fAggregationTimer);
    dispatch_release((dispatch_object_t)self->fAggregationTimer);
    self->fAggregationTimer = 0;
  }
}

- (void)setUpAggregationOnTimer
{
  sub_1005D2CA0((void **)self->fElevationGradeAggregator.__ptr_.__value_, 604800.0);
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "silo") queue]);
  self->fAggregationTimer = v3;
  dispatch_source_set_timer((dispatch_source_t)v3, 0, 0x4E94914F0000uLL, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1005D2F58;
  handler[3] = &unk_10229FED8;
  handler[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, handler);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void)onCompanionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [(-[CMHealthColdStorageWatchService universe](self, "universe")) silo];
  if (*a3 == 5)
  {
    self->fCompanionConnected = *(unsigned char *)a4;
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      int v8 = *a3;
      *(_DWORD *)buf = 67109120;
      int v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[WatchService] Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022BD4C8);
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageWatchService onCompanionNotification:data:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (void)sendCompanionData:(id)a3 activity:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005D3990;
  v8[3] = &unk_1022BD480;
  v8[4] = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSDictionary dictionaryWithDictionary:a3], 1, 0);
  v8[5] = self;
  v8[6] = a4;
  [objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "vendor") proxyForService:@"CLCompanionNotifier"] doAsync:v8;
  [a3 removeAllObjects];
}

- (void)continueSync:(id)a3
{
  if (!-[CMHealthColdStorageWatchService checkDeferral:](self, "checkDeferral:"))
  {
    id v5 = +[NSMutableDictionary dictionary];
    self->fLastBatchSize = 0;
    uint64_t fCurrentTableIndex = self->fCurrentTableIndex;
    if (fCurrentTableIndex <= 4)
    {
      id v7 = v5;
      switch(dword_101D24208[fCurrentTableIndex])
      {
        case 1:
          unint64_t v8 = sub_1010AA344((uint64_t)self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 2:
          unint64_t v8 = sub_1010A9EE0((uint64_t)self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 3:
          unint64_t v8 = sub_1010A9AB0(self->fHRRSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 4:
          unint64_t v8 = sub_100B4A6C4(self->fPredWalkDistanceSyncManager.__ptr_.__value_, v5, 0x30D40u);
          goto LABEL_9;
        case 5:
          unint64_t v8 = sub_1009A0354((uint64_t)self->fElevationGradeSyncManager.__ptr_.__value_, v5, 0x30D40u);
LABEL_9:
          int v9 = v8;
          if (v8)
          {
            if (qword_102419300 != -1) {
              dispatch_once(&qword_102419300, &stru_1022BD4C8);
            }
            v10 = qword_102419308;
            if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
            {
              int fIterationCount = self->fIterationCount;
              self->int fIterationCount = fIterationCount + 1;
              *(_DWORD *)buf = 67240192;
              int v20 = fIterationCount;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[WatchService] Sending companion data iteration:(%{public}d)", buf, 8u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419300 != -1) {
                dispatch_once(&qword_102419300, &stru_1022BD4C8);
              }
              ++self->fIterationCount;
              v16 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v16);
              if (v16 != (char *)buf) {
                free(v16);
              }
            }
            self->fLastBatchSize = v9;
            [(CMHealthColdStorageWatchService *)self sendCompanionData:v7 activity:a3];
          }
          else
          {
            LODWORD(fCurrentTableIndex) = self->fCurrentTableIndex;
LABEL_17:
            self->uint64_t fCurrentTableIndex = fCurrentTableIndex + 1;
            if (qword_102419300 != -1) {
              dispatch_once(&qword_102419300, &stru_1022BD4C8);
            }
            v12 = qword_102419308;
            if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
            {
              int v13 = self->fCurrentTableIndex;
              *(_DWORD *)buf = 67109120;
              int v20 = v13;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[WatchService] Advancing to next table: %d", buf, 8u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419300 != -1) {
                dispatch_once(&qword_102419300, &stru_1022BD4C8);
              }
              v17 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v17);
              if (v17 != (char *)buf) {
                free(v17);
              }
            }
            if (self->fCurrentTableIndex > 4u)
            {
              if (qword_102419300 != -1) {
                dispatch_once(&qword_102419300, &stru_1022BD4C8);
              }
              v15 = qword_102419308;
              if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[WatchService] Data transfer completed", buf, 2u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_102419300 != -1) {
                  dispatch_once(&qword_102419300, &stru_1022BD4C8);
                }
                v18 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService continueSync:]", "%s\n", v18);
                if (v18 != (char *)buf) {
                  free(v18);
                }
              }
              [(CMHealthColdStorageWatchService *)self setActivityAsDone:a3];
            }
            else
            {
              [(CMHealthColdStorageWatchService *)self continueSync:a3];
            }
          }
          break;
        default:
          goto LABEL_17;
      }
    }
  }
}

- (void)saveCurrentSyncProgress
{
  uint64_t fCurrentTableIndex = self->fCurrentTableIndex;
  if (fCurrentTableIndex <= 4)
  {
    switch(dword_101D24208[fCurrentTableIndex])
    {
      case 1:
        sub_1010AABCC((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRSH;
        goto LABEL_8;
      case 2:
        sub_1010AA9BC((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRIWH;
        goto LABEL_8;
      case 3:
        sub_1010AA7AC((uint64_t)self->fHRRSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_HRRIHH;
        goto LABEL_8;
      case 4:
        sub_100B4AB34((uint64_t)self->fPredWalkDistanceSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_PWDBH;
        goto LABEL_8;
      case 5:
        sub_1009A0750((uint64_t)self->fElevationGradeSyncManager.__ptr_.__value_);
        p_fLastBatchSize = &self->fLastBatchSize;
        p_numRecordsSync_HRRSH = &self->fStats.numRecordsSync_EGH;
LABEL_8:
        *p_numRecordsSync_HRRSH += *p_fLastBatchSize;
        break;
      default:
        return;
    }
  }
}

- (void)setupSyncActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  sub_101A2AFB4(v5, "CMHealthColdStorageCompanionSyncActivityInterval", &XPC_ACTIVITY_INTERVAL_8_HOURS, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1005D45B8;
  handler[3] = &unk_1022BD4A8;
  handler[4] = self;
  void handler[5] = [[-[CMHealthColdStorageWatchService universe](self, "universe") vendor] proxyForService:@"CMHealthColdStorageWatchService"];
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageWatchSync", v3, handler);
  xpc_release(v3);
}

- (void)onSyncActivity:(id)a3
{
  if (a3)
  {
    xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
    if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
    {
      if (self->fCompanionConnected)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1005D4DC0;
        v12[3] = &unk_10229FEB0;
        v12[4] = self;
        v12[5] = a3;
        [objc_msgSend(-[CMHealthColdStorageWatchService universe](self, "universe"), "silo") async:v12];
      }
      else
      {
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_1022BD4C8);
        }
        v10 = qword_102419308;
        if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WatchService] Cannot send data, companion not nearby", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419300 != -1) {
            dispatch_once(&qword_102419300, &stru_1022BD4C8);
          }
          LOWORD(v13) = 0;
          int v11 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService onSyncActivity:]", "%s\n", v11);
          if (v11 != (char *)buf) {
            free(v11);
          }
        }
        [(CMHealthColdStorageWatchService *)self setActivityAsDone:a3];
      }
      return;
    }
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    unint64_t v8 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      __int16 v19 = 2048;
      xpc_activity_state_t v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[WatchService] Unexpected activity (%s) state: %ld", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022BD4C8);
      }
      int v13 = 136315394;
      v14 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      __int16 v15 = 2048;
      xpc_activity_state_t v16 = v6;
LABEL_22:
      int v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageWatchService onSyncActivity:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    id v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[WatchService] Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022BD4C8);
      }
      int v13 = 136315138;
      v14 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      goto LABEL_22;
    }
  }
}

- (BOOL)checkDeferral:(id)a3
{
  if (!a3)
  {
    LOBYTE(should_defer) = 0;
    return should_defer;
  }
  BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
  if (!should_defer) {
    return should_defer;
  }
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_1022BD4C8);
  }
  xpc_activity_state_t v6 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v15 = "com.apple.locationd.Motion.ColdStorageWatchSync";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[WatchService] Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  if (xpc_activity_set_state((xpc_activity_t)a3, 3))
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    id v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[WatchService] Activity deferred", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_24;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    unint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v8);
    if (v8 == (char *)buf) {
      goto LABEL_24;
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    int v9 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_FAULT))
    {
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      *(_DWORD *)buf = 134349056;
      __int16 v15 = (const char *)state;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "[WatchService] Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_24;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    xpc_activity_get_state((xpc_activity_t)a3);
    unint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageWatchService checkDeferral:]", "%s\n", v8);
    if (v8 == (char *)buf) {
      goto LABEL_24;
    }
  }
  free(v8);
LABEL_24:
  [(CMHealthColdStorageWatchService *)self sendAnalytics];
  self->uint64_t fCurrentTableIndex = 0;
  self->int fIterationCount = 0;
  fTransaction = self->fTransaction;
  if (fTransaction)
  {

    self->fTransaction = 0;
  }
  LOBYTE(should_defer) = 1;
  return should_defer;
}

- (void)setActivityAsDone:(id)a3
{
  [(CMHealthColdStorageWatchService *)self sendAnalytics];
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    id v5 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v9 = "com.apple.locationd.Motion.ColdStorageWatchSync";
      __int16 v10 = 2050;
      xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "[WatchService] failed to mark %{public}s activity as Done. Current state is %{public}ld", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022BD4C8);
      }
      xpc_activity_get_state((xpc_activity_t)a3);
      id v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageWatchService setActivityAsDone:]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
  self->uint64_t fCurrentTableIndex = 0;
  self->int fIterationCount = 0;
  fTransaction = self->fTransaction;
  if (fTransaction)
  {

    self->fTransaction = 0;
  }
}

- (void)sendAnalytics
{
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    v8[0] = @"NumErrors";
    v9[0] = +[NSNumber numberWithInt:self->fStats.numErrors];
    v8[1] = @"NumRecordsSync_EGH";
    v9[1] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_EGH];
    v8[2] = @"NumRecordsSync_HRRIHH";
    v9[2] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_HRRIHH];
    v8[3] = @"NumRecordsSync_HRRIWH";
    v9[3] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_HRRIWH];
    v8[4] = @"NumRecordsSync_HRRSH";
    v9[4] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_HRRSH];
    v8[5] = @"NumRecordsSync_PWDBH";
    v9[5] = +[NSNumber numberWithInt:self->fStats.numRecordsSync_PWDBH];
    xpc_object_t v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:6];
    AnalyticsSendEventLazy();
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    v4 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[WatchService] sent Core Analytics event: %@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022BD4C8);
      }
      id v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService sendAnalytics]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
    [(CMHealthColdStorageWatchService *)self resetAnalytics];
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_1022BD4C8);
    }
    id v5 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[WatchService] not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_1022BD4C8);
      }
      xpc_activity_state_t v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageWatchService sendAnalytics]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)resetAnalytics
{
  *(void *)&self->fStats.numRecordsSync_HRRIHH = 0;
  *(void *)&self->fStats.numRecordsSync_HRRSH = 0;
  *(void *)&self->fStats.numErrors = 0;
}

- (void).cxx_destruct
{
  sub_1003B273C((uint64_t *)&self->fElevationGradeAggregator, 0);
  cntrl = self->fElevationGradeRecorderDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  v4 = self->fBoutRecorderDb.__cntrl_;
  if (v4) {
    sub_1000DB0A0((std::__shared_weak_count *)v4);
  }
  id v5 = self->fSessionDb.__cntrl_;
  if (v5) {
    sub_1000DB0A0((std::__shared_weak_count *)v5);
  }
  xpc_activity_state_t v6 = self->fInputWRDb.__cntrl_;
  if (v6) {
    sub_1000DB0A0((std::__shared_weak_count *)v6);
  }
  id v7 = self->fInputHRDb.__cntrl_;
  if (v7) {
    sub_1000DB0A0((std::__shared_weak_count *)v7);
  }
  int64_t value = self->fCompanionClient.__ptr_.__value_;
  self->fCompanionClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  sub_1005D5C7C((uint64_t *)&self->fElevationGradeSyncManager, 0);
  int v9 = self->fPredWalkDistanceSyncManager.__ptr_.__value_;
  self->fPredWalkDistanceSyncManager.__ptr_.__value_ = 0;
  if (v9) {
    sub_1005D5C24((uint64_t)&self->fPredWalkDistanceSyncManager, (uint64_t)v9);
  }
  __int16 v10 = self->fHRRSyncManager.__ptr_.__value_;
  self->fHRRSyncManager.__ptr_.__value_ = 0;
  if (v10)
  {
    sub_1005D5BB4((uint64_t)&self->fHRRSyncManager, v10);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 15) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 21) = 0;
  return self;
}

@end