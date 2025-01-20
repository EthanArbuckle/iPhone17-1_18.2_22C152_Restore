@interface CLWorkoutEffortService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4;
- (CLWorkoutEffortManagerCallbackAdapter)callbackAdapter;
- (CLWorkoutEffortService)init;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)manager;
- (void)notifyClients:(const Result *)a3;
- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onWorkoutEffortScoreUpdate:(const Result *)a3;
- (void)registerForAlgorithmSources;
- (void)registerForUpdates:(id)a3;
- (void)setCallbackAdapter:(CLWorkoutEffortManagerCallbackAdapter *)a3;
- (void)setClients:(id)a3;
- (void)setManager:(void *)a3;
- (void)setupManager;
- (void)teardownManager;
- (void)unregisterForAlgorithmSources;
- (void)unregisterForUpdates:(id)a3;
@end

@implementation CLWorkoutEffortService

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
  if (qword_1024875A0 != -1) {
    dispatch_once(&qword_1024875A0, &stru_102321EC0);
  }
  return (id)qword_102487598;
}

- (CLWorkoutEffortService)init
{
  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutEffortService;
  v2 = [(CLWorkoutEffortService *)&v5 initWithInboundProtocol:&OBJC_PROTOCOL___CLWorkoutEffortServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLWorkoutEffortServiceClientProtocol];
  v3 = v2;
  if (v2)
  {
    [(CLWorkoutEffortService *)v2 setClients:0];
    [(CLWorkoutEffortService *)v3 setCallbackAdapter:0];
  }
  return v3;
}

+ (BOOL)isSupported
{
  if (qword_1024875B0 != -1) {
    dispatch_once(&qword_1024875B0, &stru_102321EE0);
  }
  return byte_1024875A8;
}

- (void)beginService
{
}

- (void)setupManager
{
  if (![(CLWorkoutEffortService *)self manager]) {
    operator new();
  }
  if (qword_102419330 != -1) {
    dispatch_once(&qword_102419330, &stru_102321F50);
  }
  v3 = qword_102419338;
  if (os_log_type_enabled((os_log_t)qword_102419338, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up up manager", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419330 != -1) {
      dispatch_once(&qword_102419330, &stru_102321F50);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutEffortService setupManager]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLWorkoutEffortService *)self registerForAlgorithmSources];
}

- (void)teardownManager
{
  if ([(CLWorkoutEffortService *)self manager])
  {
    if (qword_102419330 != -1) {
      dispatch_once(&qword_102419330, &stru_102321F50);
    }
    v3 = qword_102419338;
    if (os_log_type_enabled((os_log_t)qword_102419338, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down manager", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419330 != -1) {
        dispatch_once(&qword_102419330, &stru_102321F50);
      }
      objc_super v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutEffortService teardownManager]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
    [(CLWorkoutEffortService *)self unregisterForAlgorithmSources];
    v4 = [(CLWorkoutEffortService *)self manager];
    if (v4)
    {
      sub_101380088(v4);
      operator delete();
    }
    [(CLWorkoutEffortService *)self setManager:0];
  }
}

- (void)endService
{
  [(CLWorkoutEffortService *)self setClients:0];
  [(CLWorkoutEffortService *)self teardownManager];
  v3 = [(CLWorkoutEffortService *)self callbackAdapter];
  if (v3) {
    (*((void (**)(CLWorkoutEffortManagerCallbackAdapter *))v3->var0 + 1))(v3);
  }

  [(CLWorkoutEffortService *)self setCallbackAdapter:0];
}

- (void)registerForAlgorithmSources
{
}

- (void)unregisterForAlgorithmSources
{
  value = self->fMotionStateMediatorClient.__ptr_.__value_;
  if (value)
  {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:2];
    v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
    self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
    if (v4) {
      (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
    }
  }
  fMotionStateMediatorProxy = self->fMotionStateMediatorProxy;
  if (fMotionStateMediatorProxy)
  {
    [(CLMotionStateMediatorProtocol *)fMotionStateMediatorProxy removeClient:CLISP_ME_TOKEN prepareSessionEndForSessionType:66];

    self->fMotionStateMediatorProxy = 0;
  }
  v6 = self->fNatalimetryClient.__ptr_.__value_;
  if (v6)
  {
    [*((id *)v6 + 2) unregister:*((void *)v6 + 1) forNotification:2];
    [*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2) unregister:*((void *)self->fNatalimetryClient.__ptr_.__value_ + 1) forNotification:11];
    [*((id *)self->fNatalimetryClient.__ptr_.__value_ + 2) unregister:*((void *)self->fNatalimetryClient.__ptr_.__value_ + 1) forNotification:10];
    v7 = self->fNatalimetryClient.__ptr_.__value_;
    self->fNatalimetryClient.__ptr_.__value_ = 0;
    if (v7)
    {
      v8 = *(void (**)(void))(*(void *)v7 + 8);
      v8();
    }
  }
}

- (void)registerForUpdates:(id)a3
{
  v4 = [(CLWorkoutEffortService *)self clients];

  [(NSMutableSet *)v4 addObject:a3];
}

- (void)unregisterForUpdates:(id)a3
{
  v4 = [(CLWorkoutEffortService *)self clients];

  [(NSMutableSet *)v4 removeObject:a3];
}

- (void)notifyClients:(const Result *)a3
{
  long long v3 = *((_OWORD *)a3 + 1);
  long long v14 = *(_OWORD *)a3;
  long long v15 = v3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(CLWorkoutEffortService *)self clients];
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        long long v17 = v14;
        long long v18 = v15;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_101380230;
        v16[3] = &unk_102321F90;
        [v9 onWorkoutEffortScoreUpdate:[v16 copy]];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v10 objects:v19 count:16];
    }
    while (v6);
  }
}

- (BOOL)syncget_prepareSessionEndForSessionType:(int64_t)a3 atEndTime:(double)a4
{
  int v5 = a3;
  if (![(CLWorkoutEffortService *)self manager]) {
    return 1;
  }
  uint64_t v7 = [(CLWorkoutEffortService *)self manager];

  return sub_1015C57DC((uint64_t)v7, v5, a4);
}

- (void)onWorkoutEffortScoreUpdate:(const Result *)a3
{
  [self.universe silo];

  [(CLWorkoutEffortService *)self notifyClients:a3];
}

- (void)onMotionStateMediatorNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self universe:a3, a4, a5, a6, a7].silo;
  if (*a3 == 2)
  {
    if ([(CLWorkoutEffortService *)self manager])
    {
      long long v10 = [(CLWorkoutEffortService *)self manager];
      sub_1015C4DAC((uint64_t)v10, (long long *)a4);
    }
  }
  else
  {
    if (qword_1024192C0 != -1) {
      dispatch_once(&qword_1024192C0, &stru_102321F70);
    }
    long long v11 = qword_1024192C8;
    if (os_log_type_enabled((os_log_t)qword_1024192C8, OS_LOG_TYPE_ERROR))
    {
      int v12 = *a3;
      *(_DWORD *)buf = 67109120;
      int v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "CLWorkoutEffortService, unhandled CLMotionStateMediator notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024192C0 != -1) {
        dispatch_once(&qword_1024192C0, &stru_102321F70);
      }
      long long v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutEffortService onMotionStateMediatorNotification:data:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (void)onNatalimetryNotification:(const int *)a3 data:(const NotificationData *)a4
{
  [self.universe silo];
  int v7 = *a3;
  if (*a3 == 11)
  {
    if ([(CLWorkoutEffortService *)self manager])
    {
      v9 = [(CLWorkoutEffortService *)self manager];
      sub_1015C4BC4((uint64_t)v9, (double *)a4);
    }
  }
  else if (v7 == 10)
  {
    if ([(CLWorkoutEffortService *)self manager])
    {
      int v10 = *(unsigned char *)a4;
      long long v11 = [(CLWorkoutEffortService *)self manager];
      if (v10)
      {
        sub_1015C322C((uint64_t)v11);
      }
      else
      {
        sub_1015C3238((uint64_t)v11);
      }
    }
  }
  else if (v7 == 2)
  {
    if ([(CLWorkoutEffortService *)self manager])
    {
      v8 = [(CLWorkoutEffortService *)self manager];
      sub_1015C4C08((uint64_t)v8, (uint64_t)a4);
    }
  }
  else
  {
    if (qword_102419330 != -1) {
      dispatch_once(&qword_102419330, &stru_102321F50);
    }
    int v12 = qword_102419338;
    if (os_log_type_enabled((os_log_t)qword_102419338, OS_LOG_TYPE_ERROR))
    {
      int v13 = *a3;
      *(_DWORD *)buf = 67109120;
      int v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "CLWorkoutEffortService, unhandled CLNatalimetryNotifier notification type, %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419330 != -1) {
        dispatch_once(&qword_102419330, &stru_102321F50);
      }
      long long v14 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLWorkoutEffortService onNatalimetryNotification:data:]", "%s\n", v14);
      if (v14 != (char *)buf) {
        free(v14);
      }
    }
  }
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void)manager
{
  return self->_manager;
}

- (void)setManager:(void *)a3
{
  self->_manager = a3;
}

- (CLWorkoutEffortManagerCallbackAdapter)callbackAdapter
{
  return self->_callbackAdapter;
}

- (void)setCallbackAdapter:(CLWorkoutEffortManagerCallbackAdapter *)a3
{
  self->_callbackAdapter = a3;
}

- (void).cxx_destruct
{
  value = self->fNatalimetryClient.__ptr_.__value_;
  self->fNatalimetryClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  v4 = self->fMotionStateMediatorClient.__ptr_.__value_;
  self->fMotionStateMediatorClient.__ptr_.__value_ = 0;
  if (v4)
  {
    int v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end