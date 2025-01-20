@interface CLPredictedWalkDistanceServiceWatch
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLPredictedWalkDistanceServiceWatch)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)onAddBout:(CLPredictedWalkDistanceBoutEntry *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4;
- (void)setUpAggregationOnTimer;
@end

@implementation CLPredictedWalkDistanceServiceWatch

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
  if (qword_10247E5E8 != -1) {
    dispatch_once(&qword_10247E5E8, &stru_1022CD7A8);
  }
  return (id)qword_10247E5E0;
}

- (CLPredictedWalkDistanceServiceWatch)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLPredictedWalkDistanceServiceWatch;
  return [(CLPredictedWalkDistanceServiceWatch *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLPredictedWalkDistanceServiceWatchProtocol outboundProtocol:&OBJC_PROTOCOL___CLPredictedWalkDistanceServiceWatchClientProtocol];
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)beginService
{
  if (qword_102419200 != -1) {
    dispatch_once(&qword_102419200, &stru_1022CD7C8);
  }
  objc_super v3 = qword_102419208;
  if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Starting up CLPredictedWalkDistanceServiceWatch", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022CD7C8);
    }
    __int16 v8 = 0;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceWatch beginService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  unsigned __int8 v7 = 0;
  sub_1003B23B4(&v7, buf);
  shared_ptr<CLPredictedWalkDistanceBoutRecorderDb> v4 = *(shared_ptr<CLPredictedWalkDistanceBoutRecorderDb> *)buf;
  memset(buf, 0, sizeof(buf));
  cntrl = self->fBoutDb.__cntrl_;
  self->fBoutDb = v4;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (*(void *)&buf[8]) {
      sub_1000DB0A0(*(std::__shared_weak_count **)&buf[8]);
    }
  }
  operator new();
}

- (void)endService
{
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }
  shared_ptr<CLPredictedWalkDistanceBoutRecorderDb> v4 = self->fStepCountClient.__ptr_.__value_;
  if (v4)
  {
    uint64_t v6 = *((void *)v4 + 1);
    unint64_t v5 = (void *)*((void *)v4 + 2);
    [v5 unregister:v6 forNotification:0];
  }
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3, a4, a5, a6, a7].silo;
  value = self->fBoutDetector.__ptr_.__value_;

  sub_1005B2208((uint64_t)value, (CLMotionActivity *)((char *)a4 + 8));
}

- (void)onStepCountNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3 silo];
  value = self->fBoutDetector.__ptr_.__value_;

  sub_1005B2AF8((uint64_t)value, (uint64_t)a4);
}

- (void)onAddBout:(CLPredictedWalkDistanceBoutEntry *)a3
{
  if (qword_102419200 != -1) {
    dispatch_once(&qword_102419200, &stru_1022CD7C8);
  }
  unint64_t v5 = qword_102419208;
  if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to send ids message from watch to phone", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022CD7C8);
    }
    __int16 v8 = 0;
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceWatch onAddBout:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10086BE78;
  v7[3] = &unk_1022CA588;
  v7[4] = +[NSData dataWithBytes:a3 length:120];
  [objc_msgSend(-[CLPredictedWalkDistanceServiceWatch universe](self, "universe"), "vendor") proxyForService:@"CLCompanionNotifier"] doAsync:v7];
}

- (void)onUserInfoUpdate:(const int *)a3 data:(const NotificationData *)a4
{
  [self.universe.silo];
  if (*a3 == 2)
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022CD7C8);
    }
    unsigned __int8 v7 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLPredictedWalkDistanceServiceWatch: Received user info update", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022CD7C8);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceWatch onUserInfoUpdate:data:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    sub_1005B4770((uint64_t)self->fBoutDetector.__ptr_.__value_, (long long *)a4);
  }
  else
  {
    if (qword_102419200 != -1) {
      dispatch_once(&qword_102419200, &stru_1022CD7C8);
    }
    __int16 v8 = qword_102419208;
    if (os_log_type_enabled((os_log_t)qword_102419208, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *a3;
      *(_DWORD *)buf = 67109120;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning Unhandled notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419200 != -1) {
        dispatch_once(&qword_102419200, &stru_1022CD7C8);
      }
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLPredictedWalkDistanceServiceWatch onUserInfoUpdate:data:]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
  }
}

- (void)setUpAggregationOnTimer
{
  sub_1003A8D3C((void **)self->fBoutAggregator.__ptr_.__value_, 259200.0);
  int v10 = 86400;
  uint64_t v3 = sub_1000D3E78();
  sub_10006B564(v3, &v8);
  sub_10006EF84(v8, "P6MWDAggregationTimeInterval", &v10);
  if (v9) {
    sub_1000DB0A0(v9);
  }
  uint64_t v4 = 1000000000 * v10;
  unint64_t v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)[objc_msgSend(-[CLPredictedWalkDistanceServiceWatch universe](self, "universe"), "silo") queue]);
  self->fAggregationTimer = v5;
  dispatch_source_set_timer((dispatch_source_t)v5, 0, v4, 0xDF8475800uLL);
  fAggregationTimer = self->fAggregationTimer;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10086C328;
  v7[3] = &unk_10229FED8;
  v7[4] = self;
  dispatch_source_set_event_handler(fAggregationTimer, v7);
  dispatch_resume((dispatch_object_t)self->fAggregationTimer);
}

- (void).cxx_destruct
{
  sub_1003B273C((uint64_t *)&self->fBoutAggregator, 0);
  cntrl = self->fBoutDb.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  value = self->fBoutDetector.__ptr_.__value_;
  self->fBoutDetector.__ptr_.__value_ = 0;
  if (value) {
    sub_10086C678((uint64_t)&self->fBoutDetector, value);
  }
  unint64_t v5 = self->fUserInfoClient.__ptr_.__value_;
  self->fUserInfoClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = self->fStepCountClient.__ptr_.__value_;
  self->fStepCountClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *))(*(void *)v6 + 8))(v6);
  }
  unsigned __int8 v7 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v7)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)v7 + 8);
    v8();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end