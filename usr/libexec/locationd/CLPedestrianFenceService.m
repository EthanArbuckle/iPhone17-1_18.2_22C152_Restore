@interface CLPedestrianFenceService
+ (BOOL)isAvailable;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLPedestrianFenceAnalyticsManager)analyticsManager;
- (CLPedestrianFenceService)init;
- (CLTimer)intervalTimer;
- (NSMutableSet)clientsInSession;
- (id).cxx_construct;
- (id)sessionForClient:(id)a3;
- (id)sessionForFence:(id)a3;
- (int)insertFence:(id)a3 inSession:(id)a4;
- (void)beginService;
- (void)clearFence:(id)a3 forClient:(id)a4;
- (void)clearFence:(id)a3 inSession:(id)a4;
- (void)dealloc;
- (void)endService;
- (void)endSessionForClient:(id)a3;
- (void)forceClearAllFences;
- (void)forceClearFence:(id)a3;
- (void)getSupportedFenceTypesWithReply:(id)a3;
- (void)odometryClient:(id)a3 requestInterval:(id)a4;
- (void)onInertialOdometryAnalyticsData:(const InertialOdometryAnalytics *)a3;
- (void)onIntervalTimerCreateEventAndIncrementPacket:(BOOL)a3;
- (void)onPedestrianFenceExitData:(const PedestrianFenceExit *)a3;
- (void)sendStatusForFences:(id)a3 setBefore:(double)a4;
- (void)sessionEndPowerLog:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setClientsInSession:(id)a3;
- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5;
- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5 wake:(BOOL)a6;
- (void)setIntervalTimer:(id)a3;
- (void)simulateFence:(id)a3 forClient:(id)a4 withExitAfterDelay:(double)a5 wake:(BOOL)a6;
- (void)startSessionForClient:(id)a3;
- (void)startSessionForClient:(id)a3 withIdentifier:(id)a4;
- (void)teardownClient:(id)a3;
- (void)toggleIntervalTimer;
- (void)toggleSession;
- (void)toggleSession:(BOOL)a3;
@end

@implementation CLPedestrianFenceService

+ (BOOL)isAvailable
{
  if (_os_feature_enabled_impl())
  {
    sub_100103240();
    if (sub_10016CDA0()) {
      return 1;
    }
    sub_100103240();
    if (sub_10073F6BC()) {
      return 1;
    }
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    v5 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }
    BOOL v6 = sub_10013D1A0(115, 0);
    BOOL result = 0;
    if (v6)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 == -1) {
        goto LABEL_19;
      }
      goto LABEL_22;
    }
  }
  else
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    v3 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Pedestrian fence not enabled", buf, 2u);
    }
    BOOL v4 = sub_10013D1A0(115, 0);
    BOOL result = 0;
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 == -1)
      {
LABEL_19:
        v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "+[CLPedestrianFenceService isAvailable]", "%s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
        return 0;
      }
LABEL_22:
      dispatch_once(&qword_1024192D0, &stru_102323C48);
      goto LABEL_19;
    }
  }
  return result;
}

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
  if (qword_1024878A0 != -1) {
    dispatch_once(&qword_1024878A0, &stru_102323C00);
  }
  return (id)qword_102487898;
}

- (CLPedestrianFenceService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceService;
  return [(CLPedestrianFenceService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLPedestrianFenceServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLPedestrianFenceServiceClientProtocol];
}

- (void)dealloc
{
  self->_clientsInSession = 0;
  self->_analyticsManager = 0;
  [(CLTimer *)self->_intervalTimer invalidate];

  self->_intervalTimer = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceService;
  [(CLPedestrianFenceService *)&v3 dealloc];
}

- (void)beginService
{
  [self universe].silo
  if (!self->_fenceExitDispatcher.__ptr_.__value_)
  {
    [self universe].silo
    operator new();
  }
  if (!self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_)
  {
    [self universe].silo
    operator new();
  }
  self->_sequenceNumber = 1;
  -[CLPedestrianFenceService setIntervalTimer:[objc_msgSend(-[CLPedestrianFenceService universe](self, "universe"), "silo") newTimer]];
  [(CLPedestrianFenceService *)self setClientsInSession:objc_alloc_init((Class)NSMutableSet)];
  [(CLPedestrianFenceService *)self setAnalyticsManager:objc_alloc_init(CLPedestrianFenceAnalyticsManager)];

  [(CLPedestrianFenceService *)self toggleSession:0];
}

- (void)endService
{
  [(-[CLPedestrianFenceService universe](self, "universe")) silo];
  if (self->_fenceExitDispatcher.__ptr_.__value_)
  {
    uint64_t v3 = sub_10058D9A0(0);
    sub_1009D26C4(v3, 46, (uint64_t)self->_fenceExitDispatcher.__ptr_.__value_);
    value = self->_fenceExitDispatcher.__ptr_.__value_;
    self->_fenceExitDispatcher.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
    }
  }
  if (self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_)
  {
    uint64_t v5 = sub_10058D9A0(0);
    sub_1009D26C4(v5, 49, (uint64_t)self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_);
    BOOL v6 = self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_;
    self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_ = 0;
    if (v6) {
      (*(void (**)(Dispatcher *))(*(void *)v6 + 8))(v6);
    }
  }

  [(CLPedestrianFenceService *)self toggleSession:0];
}

- (void)getSupportedFenceTypesWithReply:(id)a3
{
  sub_100103240();
  if (sub_10016CDA0()) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  sub_100103240();
  uint64_t v5 = v4 | sub_10073F6BC();
  BOOL v6 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v6(a3, v5);
}

- (void)startSessionForClient:(id)a3
{
}

- (void)startSessionForClient:(id)a3 withIdentifier:(id)a4
{
  if (+[CLPedestrianFenceService isAvailable])
  {
    if ([(CLPedestrianFenceService *)self sessionForClient:a3])
    {
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      v7 = qword_1024192D8;
      if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v14 = [a3 description];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Session already started for client %{private}@", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 0)) {
        return;
      }
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      [a3 description];
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService startSessionForClient:withIdentifier:]", "%s\n", v8);
      if (v8 == (char *)buf) {
        return;
      }
LABEL_24:
      free(v8);
      return;
    }
    v10 = [CLPedestrianFenceSession alloc];
    [+[NSDate date] timeIntervalSince1970];
    v12 = [(CLPedestrianFenceSession *)v10 initWithClient:a3 identifier:a4 atTime:v11 atMonotonicTime:sub_10016C458()];
    [(NSMutableSet *)[(CLPedestrianFenceService *)self clientsInSession] addObject:v12];

    [(CLPedestrianFenceAnalyticsManager *)[(CLPedestrianFenceService *)self analyticsManager] startSessionForClient:a4 sequenceNumber:self->_sequenceNumber];
    [(CLPedestrianFenceService *)self toggleIntervalTimer];
    [(CLPedestrianFenceService *)self toggleSession];
  }
  else
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    v9 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService startSessionForClient:withIdentifier:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        goto LABEL_24;
      }
    }
  }
}

- (void)endSessionForClient:(id)a3
{
  if (-[CLPedestrianFenceService sessionForClient:](self, "sessionForClient:"))
  {
    [(CLPedestrianFenceService *)self teardownClient:a3];
  }
  else
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    uint64_t v5 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v8 = [a3 description];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "No session for client %{private}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      [a3 description];
      BOOL v6 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService endSessionForClient:]", "%s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
}

- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5
{
}

- (void)setFence:(id)a3 forClient:(id)a4 withRadius:(float)a5 wake:(BOOL)a6
{
  BOOL v6 = a6;
  if (+[CLPedestrianFenceService isAvailable])
  {
    double v11 = [(CLPedestrianFenceService *)self sessionForClient:a4];
    if (v11)
    {
      if (a5 > 0.0 && a5 <= 1000.0)
      {
        v12 = v11;
        unsigned int v13 = [(CLPedestrianFenceService *)self insertFence:a3 inSession:v11];
        if (v13 != -1)
        {
          unsigned int v14 = v13;
          if (qword_1024192D0 != -1) {
            dispatch_once(&qword_1024192D0, &stru_102323C48);
          }
          v15 = qword_1024192D8;
          if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138544130;
            double v27 = *(double *)&a3;
            __int16 v28 = 1026;
            unsigned int v29 = v14;
            __int16 v30 = 2050;
            double v31 = a5;
            __int16 v32 = 1026;
            BOOL v33 = v6;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Setting pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d,radius,%{public}f,shouldWake,%{public}d", buf, 0x22u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024192D0 != -1) {
              dispatch_once(&qword_1024192D0, &stru_102323C48);
            }
            v25 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]", "%s\n", v25);
            if (v25 != (char *)buf) {
              free(v25);
            }
          }
          uint64_t v16 = sub_10058D9A0(0);
          sub_1005959AC(v16, v14, v6, a5);
          ++v12[6];
          v17 = objc_alloc_init(CLPedestrianFenceMetadata);
          [(CLPedestrianFenceMetadata *)v17 setTimeFenceStart:sub_10016C458()];
          [(CLPedestrianFenceMetadata *)v17 setFenceID:a3];
          -[CLPedestrianFenceMetadata setClientIdentifier:](v17, "setClientIdentifier:", [v12 clientIdentifier]);
          *(float *)&double v18 = a5;
          [(CLPedestrianFenceMetadata *)v17 setRadius:v18];
          [objc_msgSend(v12, "fenceMetadata") setObject:v17 forKeyedSubscript:a3];
        }
        return;
      }
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      v22 = qword_1024192D8;
      if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        double v27 = a5;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Invalid fence radius: %{public}f", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192D0 != -1) {
          dispatch_once(&qword_1024192D0, &stru_102323C48);
        }
        v24 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]", "%s\n", v24);
        if (v24 != (char *)buf) {
          free(v24);
        }
      }
      id v20 = a4;
      uint64_t v21 = 1;
    }
    else
    {
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      v19 = qword_1024192D8;
      if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Must be in session to set a fence", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192D0 != -1) {
          dispatch_once(&qword_1024192D0, &stru_102323C48);
        }
        v23 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService setFence:forClient:withRadius:wake:]", "%s\n", v23);
        if (v23 != (char *)buf) {
          free(v23);
        }
      }
      id v20 = a4;
      uint64_t v21 = 4;
    }
    [v20 didFailWithError:v21];
    return;
  }

  [a4 didFailWithError:0];
}

- (void)simulateFence:(id)a3 forClient:(id)a4 withExitAfterDelay:(double)a5 wake:(BOOL)a6
{
  BOOL v6 = a6;
  if (+[CLPedestrianFenceService isAvailable])
  {
    id v11 = [(CLPedestrianFenceService *)self sessionForClient:a4];
    if (v11)
    {
      if (a5 > 60.0 || a5 < 0.0)
      {
        if (qword_1024192D0 != -1) {
          dispatch_once(&qword_1024192D0, &stru_102323C48);
        }
        double v18 = qword_1024192D8;
        if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Invalid delay set", buf, 2u);
        }
        if (sub_10013D1A0(115, 0))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024192D0 != -1) {
            dispatch_once(&qword_1024192D0, &stru_102323C48);
          }
          id v20 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]", "%s\n", v20);
          if (v20 != (char *)buf) {
            free(v20);
          }
        }
      }
      else
      {
        unsigned int v12 = [(CLPedestrianFenceService *)self insertFence:a3 inSession:v11];
        if (v12 != -1)
        {
          unsigned int v13 = v12;
          if (qword_1024192D0 != -1) {
            dispatch_once(&qword_1024192D0, &stru_102323C48);
          }
          unsigned int v14 = qword_1024192D8;
          if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
          {
            float v15 = a5;
            *(_DWORD *)buf = 138544130;
            id v23 = a3;
            __int16 v24 = 1026;
            unsigned int v25 = v13;
            __int16 v26 = 2050;
            double v27 = v15;
            __int16 v28 = 1026;
            BOOL v29 = v6;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Simulating fence exit: fenceID,%{public}@,fenceIndex,%{public}d,delay,%{public}f,shouldWake,%{public}d", buf, 0x22u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024192D0 != -1) {
              dispatch_once(&qword_1024192D0, &stru_102323C48);
            }
            uint64_t v21 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]", "%s\n", v21);
            if (v21 != (char *)buf) {
              free(v21);
            }
          }
          uint64_t v16 = sub_10058D9A0(0);
          sub_100595A24(v16, v13, v6, a5);
        }
      }
    }
    else
    {
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      v17 = qword_1024192D8;
      if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Must be in session to set a fence", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024192D0 != -1) {
          dispatch_once(&qword_1024192D0, &stru_102323C48);
        }
        v19 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService simulateFence:forClient:withExitAfterDelay:wake:]", "%s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
      [a4 didFailWithError:4];
    }
  }
  else
  {
    [a4 didFailWithError:0];
  }
}

- (void)forceClearFence:(id)a3
{
  id v5 = -[CLPedestrianFenceService sessionForFence:](self, "sessionForFence:");
  if (v5)
  {
    BOOL v6 = v5;
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    v7 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Force clearing fence %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService forceClearFence:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [objc_msgSend(v6, "client") didExitFence:a3];
    [(CLPedestrianFenceService *)self clearFence:a3 inSession:v6];
  }
  else
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    id v8 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v12 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No fence %{public}@ to force clear", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService forceClearFence:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
}

- (void)forceClearAllFences
{
  if (qword_1024192D0 != -1) {
    dispatch_once(&qword_1024192D0, &stru_102323C48);
  }
  uint64_t v3 = qword_1024192D8;
  if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Force clearing all fences", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    __int16 v25 = 0;
    float v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService forceClearAllFences]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obj = [(CLPedestrianFenceService *)self clientsInSession];
  id v4 = [(NSMutableSet *)obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v9 = [[objc_msgSend(v8, "fenceIDToIndex") allKeys];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v26 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v18;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v18 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * (void)j);
              [objc_msgSend(v8, "client") didExitFence:v14];
              [(CLPedestrianFenceService *)self clearFence:v14 inSession:v8];
            }
            id v11 = [v9 countByEnumeratingWithState:&v17 objects:v26 count:16];
          }
          while (v11);
        }
      }
      id v5 = [(NSMutableSet *)obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v5);
  }
}

- (void)clearFence:(id)a3 forClient:(id)a4
{
  if (+[CLPedestrianFenceService isAvailable])
  {
    id v7 = [(CLPedestrianFenceService *)self sessionForClient:a4];
    if (v7)
    {
      [(CLPedestrianFenceService *)self clearFence:a3 inSession:v7];
    }
  }
  else
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    id v8 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Pedestrian fence not supported", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      id v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService clearFence:forClient:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [a4 didFailWithError:0];
  }
}

- (void)teardownClient:(id)a3
{
  if (qword_1024192D0 != -1) {
    dispatch_once(&qword_1024192D0, &stru_102323C48);
  }
  id v5 = qword_1024192D8;
  if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v22 = [a3 description];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Tearing down client %{private}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    int v19 = 138477827;
    id v20 = [a3 description];
    unsigned int v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService teardownClient:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  uint64_t v6 = [(CLPedestrianFenceService *)self sessionForClient:a3];
  if (v6)
  {
    id v7 = v6;
    id v8 = [[objc_msgSend(v6, "fenceIDToIndex") allKeys];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          [(CLPedestrianFenceService *)self clearFence:*(void *)(*((void *)&v14 + 1) + 8 * i) inSession:v7];
        }
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    -[CLPedestrianFenceAnalyticsManager endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:](-[CLPedestrianFenceService analyticsManager](self, "analyticsManager"), "endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:", [v7 clientIdentifier], self->_sequenceNumber, v7[2], sub_10016C458());
    [(CLPedestrianFenceService *)self sessionEndPowerLog:v7];
    [(NSMutableSet *)[(CLPedestrianFenceService *)self clientsInSession] removeObject:v7];
    [(CLPedestrianFenceService *)self toggleIntervalTimer];
    [(CLPedestrianFenceService *)self toggleSession];
  }
}

- (void)odometryClient:(id)a3 requestInterval:(id)a4
{
  id v7 = [(CLPedestrianFenceService *)self analyticsManager];
  [a4 doubleValue];
  -[CLPedestrianFenceAnalyticsManager odometryClient:requestInterval:sequenceNumber:](v7, "odometryClient:requestInterval:sequenceNumber:", a3, self->_sequenceNumber);
  [(CLPedestrianFenceService *)self toggleIntervalTimer];

  [(CLPedestrianFenceService *)self toggleSession];
}

- (int)insertFence:(id)a3 inSession:(id)a4
{
  id v7 = -[CLPedestrianFenceService sessionForFence:](self, "sessionForFence:");
  if (!v7)
  {
    *(void *)&long long v24 = 0;
    *((void *)&v24 + 1) = &v24;
    uint64_t v25 = 0x3052000000;
    __int16 v26 = sub_100177FA0;
    double v27 = sub_100177700;
    id v28 = 0;
    id v28 = +[NSMutableSet set];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1013DF404;
    v17[3] = &unk_102323C28;
    v17[4] = &v24;
    [(NSMutableSet *)[(CLPedestrianFenceService *)self clientsInSession] enumerateObjectsUsingBlock:v17];
    uint64_t v11 = 0;
    do
    {
      if (!objc_msgSend(*(id *)(*((void *)&v24 + 1) + 40), "member:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11)))
      {
        [objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v11), a3)];
        _Block_object_dispose(&v24, 8);
        return [[[objc_msgSend(objc_msgSend(objc_msgSend(a4, "fenceIDToIndex")), "objectForKeyedSubscript:", a3) intValue];
      }
      uint64_t v11 = (v11 + 1);
    }
    while (v11 != 7);
    [objc_msgSend(a4, "client") didFailWithError:2];
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    uint64_t v12 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240450;
      LODWORD(v23[0]) = 7;
      WORD2(v23[0]) = 2114;
      *(void *)((char *)v23 + 6) = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Too many pedestrian fence clients (max %{public}d), ignoring fence request %{public}@", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      int v18 = 67240450;
      int v19 = 7;
      __int16 v20 = 2114;
      id v21 = a3;
      long long v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    _Block_object_dispose(&v24, 8);
    return -1;
  }
  id v8 = [v7 client];
  if (v8 != [a4 client])
  {
    [objc_msgSend(a4, "client") didFailWithError:3];
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    id v9 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23[0] = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Another client has already set a fence with ID %{public}@", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      LODWORD(v24) = 138543362;
      *(void *)((char *)&v24 + 4) = a3;
      id v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    return -1;
  }
  if (qword_1024192D0 != -1) {
    dispatch_once(&qword_1024192D0, &stru_102323C48);
  }
  long long v14 = qword_1024192D8;
  if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23[0] = a3;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Overwriting fence with ID %{public}@ for client", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    LODWORD(v24) = 138543362;
    *(void *)((char *)&v24 + 4) = a3;
    long long v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService insertFence:inSession:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  return [[[objc_msgSend(objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "objectForKeyedSubscript:", a3)) intValue];
}

- (void)clearFence:(id)a3 inSession:(id)a4
{
  id v6 = [objc_msgSend(a4, "fenceIDToIndex") objectForKey:a3];
  if (v6)
  {
    unsigned int v7 = [v6 intValue];
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    id v8 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v14 = a3;
      __int16 v15 = 1026;
      unsigned int v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing pedestrian fence: fenceID,%{public}@,fenceIndex,%{public}d", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      uint64_t v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService clearFence:inSession:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    uint64_t v9 = sub_10058D9A0(0);
    sub_1005959EC(v9, v7);
    [objc_msgSend(objc_msgSend(a4, "fenceIDToIndex"), "removeObjectForKey:", a3)];
    [objc_msgSend(a4, "fenceMetadata") removeObjectForKey:a3];
  }
  else
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    id v10 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No fence with ID: %{public}@ to clear", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192D0 != -1) {
        dispatch_once(&qword_1024192D0, &stru_102323C48);
      }
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService clearFence:inSession:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
  }
}

- (void)onPedestrianFenceExitData:(const PedestrianFenceExit *)a3
{
  if (!a3->var2)
  {
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    long long v17 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
    {
      _H0 = *(_WORD *)&a3[1].var2;
      __asm { FCVT            D0, H0 }
      int var1 = a3->var1;
      _H1 = *(_WORD *)&a3[1].var0;
      __asm { FCVT            D1, H1 }
      *(_DWORD *)buf = 134349568;
      v44 = _D0;
      __int16 v45 = 1026;
      *(_DWORD *)v46 = var1;
      *(_WORD *)&v46[4] = 2050;
      *(void *)&v46[6] = _D1;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Status][AOP] Cleared fence: radius,%{public}f,fenceIndex,%{public}u,displacement,%{public}f", buf, 0x1Cu);
    }
    if (!sub_10013D1A0(115, 2)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    _H0 = *(_WORD *)&a3[1].var2;
    __asm { FCVT            D0, H0 }
    int v28 = a3->var1;
    _H1 = *(_WORD *)&a3[1].var0;
    __asm { FCVT            D1, H1 }
    int v39 = 134349568;
    v40 = _D0;
    __int16 v41 = 1026;
    *(_DWORD *)v42 = v28;
    *(_WORD *)&v42[4] = 2050;
    *(void *)&v42[6] = _D1;
    unsigned int v16 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n");
LABEL_32:
    if (v16 != buf) {
      free(v16);
    }
    return;
  }
  id v5 = +[NSNumber numberWithUnsignedChar:a3->var1];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v6 = [(CLPedestrianFenceService *)self clientsInSession];
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v7)
  {
LABEL_16:
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    __int16 v15 = qword_1024192D8;
    if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "No client found for fence exit with fenceIndex %{public}@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    int v39 = 138543362;
    v40 = v5;
    unsigned int v16 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n");
    goto LABEL_32;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v35;
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v35 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
    id v12 = [[objc_msgSend(v11, "fenceIDToIndex") allKeysForObject:v5];
    if ([v12 count]) {
      break;
    }
    if (v8 == (id)++v10)
    {
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v8) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  unsigned int v13 = (NSNumber *)[v12 objectAtIndexedSubscript:0];
  if (v11) {
    _ZF = v13 == 0;
  }
  else {
    _ZF = 1;
  }
  if (_ZF) {
    goto LABEL_16;
  }
  double v31 = v13;
  if (qword_1024192D0 != -1) {
    dispatch_once(&qword_1024192D0, &stru_102323C48);
  }
  __int16 v32 = qword_1024192D8;
  if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v44 = v31;
    __int16 v45 = 2114;
    *(void *)v46 = v5;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Pedestrian fence exit notified: fenceID,%{public}@,fenceIndex,%{public}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    int v39 = 138543618;
    v40 = v31;
    __int16 v41 = 2114;
    *(void *)v42 = v5;
    BOOL v33 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService onPedestrianFenceExitData:]", "%s\n", v33);
    if (v33 != (char *)buf) {
      free(v33);
    }
  }
  [objc_msgSend(v11, "client") didExitFence:v31];
  [objc_msgSend(objc_msgSend(v11, "fenceIDToIndex"), "removeObjectForKey:", v31];
  [objc_msgSend(objc_msgSend(objc_msgSend(v11, "fenceMetadata"), "objectForKeyedSubscript:", v31), "setTimeFenceExit:", sub_10016C458());
  [-[CLPedestrianFenceService analyticsManager](self, "analyticsManager") processSingleFenceAnalyticsData:[v11 fenceMetadata][v11 fenceMetadata objectForKeyedSubscript:v31]];
  [objc_msgSend(v11, "fenceMetadata") removeObjectForKey:v31];
}

- (void)onInertialOdometryAnalyticsData:(const InertialOdometryAnalytics *)a3
{
  p_packetStartTimes = &self->_packetStartTimes;
  id v6 = (unint64_t *)(&a3->var4 + 1);
  left = self->_packetStartTimes.__tree_.__pair1_.__value_.__left_;
  double v8 = 0.0;
  double v9 = 0.0;
  if (left)
  {
    unint64_t v10 = *v6;
    while (1)
    {
      unint64_t v11 = left[4];
      if (v10 >= v11)
      {
        if (v11 >= v10)
        {
          *(void *)buf = &a3->var4 + 1;
          double v9 = *((double *)sub_10017C9B0((uint64_t **)&self->_packetStartTimes, v6, (uint64_t)&unk_101D0B290, (uint64_t **)buf)+ 5);
          sub_100700910((uint64_t)p_packetStartTimes, v6);
          break;
        }
        ++left;
      }
      left = (void *)*left;
      if (!left)
      {
        double v9 = 0.0;
        break;
      }
    }
  }
  id v12 = self->_packetStopTriggerTimes.__tree_.__pair1_.__value_.__left_;
  if (!v12) {
    goto LABEL_17;
  }
  unint64_t v13 = *v6;
  while (1)
  {
    unint64_t v14 = v12[4];
    if (v13 >= v14) {
      break;
    }
LABEL_14:
    id v12 = (void *)*v12;
    if (!v12) {
      goto LABEL_17;
    }
  }
  if (v14 < v13)
  {
    ++v12;
    goto LABEL_14;
  }
  *(void *)buf = v6;
  double v8 = *((double *)sub_10017C9B0((uint64_t **)&self->_packetStopTriggerTimes, v6, (uint64_t)&unk_101D0B290, (uint64_t **)buf)+ 5);
  sub_100700910((uint64_t)&self->_packetStopTriggerTimes, v6);
LABEL_17:
  [(CLPedestrianFenceAnalyticsManager *)[(CLPedestrianFenceService *)self analyticsManager] feedInertialOdometryPacket:a3 atTime:v9];
  unint64_t v15 = *(void *)(&a3->var4 + 1);
  if (v15 > self->_sequenceNumber) {
    self->_sequenceNumber = v15;
  }
  unsigned int v16 = +[NSMutableArray arrayWithCapacity:7];
  for (uint64_t i = 0; i != 14; i += 2)
  {
    LOWORD(_D0) = *(unsigned __int16 *)((char *)&a3->var19 + i + 1);
    __asm { FCVT            S0, H0 }
    [(NSMutableArray *)v16 addObject:+[NSNumber numberWithFloat:_D0]];
  }
  [(CLPedestrianFenceService *)self sendStatusForFences:v16 setBefore:v8];
  if (qword_1024192D0 != -1) {
    dispatch_once(&qword_1024192D0, &stru_102323C48);
  }
  long long v23 = qword_1024192D8;
  if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
  {
    int var1 = a3->var1;
    int var2 = a3->var2;
    int var3 = a3->var3;
    int var4 = a3->var4;
    *(_DWORD *)buf = 67240960;
    *(_DWORD *)&uint8_t buf[4] = var1;
    __int16 v30 = 1026;
    int v31 = var2;
    __int16 v32 = 1026;
    int v33 = var3;
    __int16 v34 = 1026;
    int v35 = var4;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Status][AOP] fencesMaskIsSet,%{public}u,fencesMaskWasSet,%{public}u,fencesMaskWasExited,%{public}u,fencesMaskWasCleared,%{public}u", buf, 0x1Au);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024192D0 != -1) {
      dispatch_once(&qword_1024192D0, &stru_102323C48);
    }
    int v28 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService onInertialOdometryAnalyticsData:]", "%s\n", v28);
    if (v28 != (char *)buf) {
      free(v28);
    }
  }
}

- (void)toggleSession
{
  BOOL v3 = [(NSMutableSet *)[(CLPedestrianFenceService *)self clientsInSession] count] != 0;

  [(CLPedestrianFenceService *)self toggleSession:v3];
}

- (void)toggleSession:(BOOL)a3
{
  if (+[CLPedestrianFenceService isAvailable])
  {
    uint64_t v5 = sub_10058D9A0(0);
    sub_100595A68(v5, a3, self->_sequenceNumber);
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    p_sequenceNumber = &self->_sequenceNumber;
    *((CFAbsoluteTime *)sub_10017C9B0((uint64_t **)&self->_packetStartTimes, &self->_sequenceNumber, (uint64_t)&unk_101D0B290, (uint64_t **)&p_sequenceNumber)+ 5) = Current;
    double v7 = sub_10016C458();
    unint64_t v8 = self->_sequenceNumber - 1;
    p_sequenceNumber = &v8;
    *((double *)sub_10017C9B0((uint64_t **)&self->_packetStopTriggerTimes, &v8, (uint64_t)&unk_101D0B290, (uint64_t **)&p_sequenceNumber)+ 5) = v7;
    ++self->_sequenceNumber;
  }
}

- (id)sessionForClient:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CLPedestrianFenceService *)self clientsInSession];
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 client] == a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)sessionForFence:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CLPedestrianFenceService *)self clientsInSession];
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    double v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "fenceIDToIndex"), "objectForKey:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)sessionEndPowerLog:(id)a3
{
  v4[0] = @"sessionStartTime";
  v5[0] = +[NSNumber numberWithDouble:*((double *)a3 + 1)];
  v4[1] = @"sessionEndTime";
  [+[NSDate date] timeIntervalSince1970];
  v5[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v4[2] = @"identifier";
  v5[2] = [a3 clientIdentifier];
  v4[3] = @"numFences";
  v5[3] = +[NSNumber numberWithInt:*((unsigned int *)a3 + 6)];
  sub_1000FC494((uint64_t)+[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4], (uint64_t)"PedestrianFencePowerMetric");
}

- (void)toggleIntervalTimer
{
  unsigned __int8 v3 = [(CLPedestrianFenceAnalyticsManager *)[(CLPedestrianFenceService *)self analyticsManager] isAnySessionActive];
  id v4 = [(CLPedestrianFenceService *)self intervalTimer];
  if (v3)
  {
    [(CLTimer *)v4 nextFireDelay];
    if (v5 == 1.79769313e308)
    {
      [(CLPedestrianFenceService *)self onIntervalTimerCreateEventAndIncrementPacket:0];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1013E072C;
      v6[3] = &unk_10229FED8;
      v6[4] = self;
      [(CLTimer *)[(CLPedestrianFenceService *)self intervalTimer] setHandler:v6];
      [(CLTimer *)[(CLPedestrianFenceService *)self intervalTimer] setNextFireDelay:120.0 interval:120.0];
    }
  }
  else
  {
    [(CLTimer *)v4 invalidate];
  }
}

- (void)onIntervalTimerCreateEventAndIncrementPacket:(BOOL)a3
{
  BOOL v3 = a3;
  [(CLPedestrianFenceAnalyticsManager *)[(CLPedestrianFenceService *)self analyticsManager] createIntervalEventStartingAt:self->_sequenceNumber];
  if (v3)
  {
    [(CLPedestrianFenceService *)self toggleSession];
  }
}

- (void)sendStatusForFences:(id)a3 setBefore:(double)a4
{
  if ([a3 count] == (id)7)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obj = [(CLPedestrianFenceService *)self clientsInSession];
    id v40 = [(NSMutableSet *)obj countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v49;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v49 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = v6;
          uint64_t v7 = *(void **)(*((void *)&v48 + 1) + 8 * v6);
          id v8 = +[NSMutableDictionary dictionary];
          id v43 = +[NSMutableString string];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v9 = [v7 fenceIDToIndex];
          id v10 = [v9 countByEnumeratingWithState:&v44 objects:v60 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v45 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * i);
                id v15 = [[objc_msgSend(v7, "fenceMetadata") objectForKeyedSubscript:v14];
                unsigned int v16 = [[[objc_msgSend(objc_msgSend(v7, "fenceIDToIndex"), "objectForKeyedSubscript:", v14) unsignedIntValue];
                if (v15) {
                  BOOL v17 = v16 > 6;
                }
                else {
                  BOOL v17 = 1;
                }
                if (!v17)
                {
                  unsigned int v18 = v16;
                  [v15 timeFenceStart];
                  float v19 = 0.0;
                  if (v20 < a4)
                  {
                    [objc_msgSend(a3, "objectAtIndexedSubscript:", v18) floatValue];
                    float v19 = v21;
                  }
                  id v22 = [CLPedestrianFenceStatus alloc];
                  [v15 radius];
                  int v24 = v23;
                  double v25 = sub_10016C458();
                  [v15 timeFenceStart];
                  double v27 = v25 - v26;
                  LODWORD(v26) = v24;
                  *(float *)&double v28 = v19;
                  BOOL v29 = [(CLPedestrianFenceStatus *)v22 initWithRadius:v26 radialDisplacement:v28 duration:v27];
                  [v8 setObject:v29 forKeyedSubscript:v14];
                  [v15 radius];
                  double v31 = v30;
                  [(CLPedestrianFenceStatus *)v29 duration];
                  [v43 appendString:[NSString stringWithFormat:@"%@,radius,%f,displacement,%f,duration,%f,index,%@; ",
                      v14,
                      *(void *)&v31,
                      v19,
                      v32,
                      [objc_msgSend(v7, "fenceIDToIndex") objectForKeyedSubscript:v14]);
                }
              }
              id v11 = [v9 countByEnumeratingWithState:&v44 objects:v60 count:16];
            }
            while (v11);
          }
          [objc_msgSend(v7, "client") sessionStatusReport:v8];
          if ([v43 length])
          {
            if (qword_1024192D0 != -1) {
              dispatch_once(&qword_1024192D0, &stru_102323C48);
            }
            int v33 = qword_1024192D8;
            if (os_log_type_enabled((os_log_t)qword_1024192D8, OS_LOG_TYPE_DEFAULT))
            {
              id v34 = [v7 clientIdentifier];
              *(_DWORD *)buf = 138543618;
              id v57 = v34;
              __int16 v58 = 2114;
              id v59 = v43;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[Status] Session %{public}@: %{public}@", buf, 0x16u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024192D0 != -1) {
                dispatch_once(&qword_1024192D0, &stru_102323C48);
              }
              id v35 = [v7 clientIdentifier];
              int v52 = 138543618;
              id v53 = v35;
              __int16 v54 = 2114;
              id v55 = v43;
              long long v36 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPedestrianFenceService sendStatusForFences:setBefore:]", "%s\n", v36);
              if (v36 != (char *)buf) {
                free(v36);
              }
            }
          }
          ++v6;
        }
        while ((id)(v41 + 1) != v40);
        id v37 = [(NSMutableSet *)obj countByEnumeratingWithState:&v48 objects:v61 count:16];
        id v40 = v37;
      }
      while (v37);
    }
  }
}

- (NSMutableSet)clientsInSession
{
  return self->_clientsInSession;
}

- (void)setClientsInSession:(id)a3
{
}

- (CLPedestrianFenceAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (CLTimer)intervalTimer
{
  return self->_intervalTimer;
}

- (void)setIntervalTimer:(id)a3
{
}

- (void).cxx_destruct
{
  sub_1000F5BB0((uint64_t)&self->_packetStopTriggerTimes, (void *)self->_packetStopTriggerTimes.__tree_.__pair1_.__value_.__left_);
  sub_1000F5BB0((uint64_t)&self->_packetStartTimes, (void *)self->_packetStartTimes.__tree_.__pair1_.__value_.__left_);
  value = self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_;
  self->_inertialOdometryAnalyticsDispatcher.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Dispatcher *))(*(void *)value + 8))(value);
  }
  id v4 = self->_fenceExitDispatcher.__ptr_.__value_;
  self->_fenceExitDispatcher.__ptr_.__value_ = 0;
  if (v4)
  {
    double v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 3) = (char *)self + 32;
  *((void *)self + 8) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 6) = (char *)self + 56;
  return self;
}

@end