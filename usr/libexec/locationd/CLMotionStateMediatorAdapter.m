@interface CLMotionStateMediatorAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionStateMediatorAdapter)init;
- (id)syncgetActivityOverride;
- (void)adaptee;
- (void)addClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4;
- (void)beginService;
- (void)beginWorkoutSession:(WorkoutSettings *)a3 withOverview:(id)a4 enableWorkoutChangeDetection:(BOOL)a5;
- (void)currentWorkoutActiveStateWithReply:(id)a3;
- (void)didExitGeoFence;
- (void)didTimeoutGeoFence;
- (void)didUpdateWeather:(id)a3;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)endWorkoutSession:(WorkoutSettings *)a3;
- (void)lastKnownIndoorOutdoorStateWithReply:(id)a3;
- (void)onOutdoorUpdate:(id)a3;
- (void)onVisit:(id)a3;
- (void)pauseWorkout:(WorkoutSettings *)a3;
- (void)registerForWorkoutSessionUpdates:(id)a3;
- (void)removeClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4;
- (void)resumeWorkout:(WorkoutSettings *)a3;
- (void)setCurrentWorkoutType:(WorkoutSettings *)a3 isManualTransition:(BOOL)a4;
- (void)setWorkoutSuggestedStopTimeout:(double)a3;
- (void)triggerWorkoutLocationEventForTesting:(int64_t)a3 withReply:(id)a4;
- (void)unregisterForWorkoutSessionUpdates:(id)a3;
- (void)updateWorkoutReminderMuteSetting:(int64_t)a3 mute:(BOOL)a4;
- (void)userDismissedWorkoutAlert;
- (void)workoutSnapshotWithReply:(id)a3;
@end

@implementation CLMotionStateMediatorAdapter

- (void)onOutdoorUpdate:(id)a3
{
  v4 = [(CLMotionStateMediatorAdapter *)self adaptee];
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  sub_10003006C((uint64_t)v4, (uint64_t)v5);
}

- (void)adaptee
{
  result = [(CLNotifierServiceAdapter *)self notifier];
  if (result)
  {
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
  if (qword_10247C9C0 != -1) {
    dispatch_once(&qword_10247C9C0, &stru_1022C22C0);
  }
  return (id)qword_10247C9B8;
}

- (CLMotionStateMediatorAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLMotionStateMediatorAdapter;
  return [(CLMotionStateMediatorAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLMotionStateMediatorProtocol outboundProtocol:&OBJC_PROTOCOL___CLMotionStateMediatorClientProtocol];
}

- (void)beginService
{
  if (![(CLNotifierServiceAdapter *)self notifier]) {
    sub_101A6A4C4();
  }
}

- (void)endService
{
  v2 = *(void (**)(void))(*(void *)[(CLNotifierServiceAdapter *)self notifier] + 16);

  v2();
}

- (void)doAsync:(id)a3
{
  v4 = [(CLMotionStateMediatorAdapter *)self adaptee];
  unint64_t v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, [(CLMotionStateMediatorAdapter *)self adaptee]);
  unint64_t v5 = (void (*)(id))*((void *)a4 + 2);

  v5(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)onVisit:(id)a3
{
  uint64_t v4 = *((void *)[(CLMotionStateMediatorAdapter *)self adaptee] + 1046);
  if (v4)
  {
    sub_100D0970C(v4, a3);
  }
}

- (void)didUpdateWeather:(id)a3
{
  uint64_t v4 = (std::string *)*((void *)[(CLMotionStateMediatorAdapter *)self adaptee] + 1046);
  if (v4)
  {
    sub_100D092A0(v4, a3);
  }
}

- (void)addClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4
{
  v6 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_100692FC4((uint64_t)v6, (uint64_t)a3, a4);
}

- (void)removeClient:(id)a3 prepareSessionEndForSessionType:(int64_t)a4
{
  v6 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_100693264((uint64_t)v6, (uint64_t)a3, a4);
}

- (void)setWorkoutSuggestedStopTimeout:(double)a3
{
  uint64_t v4 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_1006935A8((uint64_t)v4, a3);
}

- (void)userDismissedWorkoutAlert
{
  v2 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_100693794((uint64_t)v2);
}

- (void)triggerWorkoutLocationEventForTesting:(int64_t)a3 withReply:(id)a4
{
  BOOL v5 = sub_100E61A10((uint64_t)[(CLMotionStateMediatorAdapter *)self adaptee] + 6624, a3);
  v6 = (void (*)(id, uint64_t))*((void *)a4 + 2);
  if (v5) {
    uint64_t v7 = 100;
  }
  else {
    uint64_t v7 = 108;
  }

  v6(a4, v7);
}

- (void)lastKnownIndoorOutdoorStateWithReply:(id)a3
{
  uint64_t v4 = [(CLMotionStateMediatorAdapter *)self adaptee];
  long long v5 = v4[635];
  uint64_t v6 = *((void *)v4 + 1272);
  (*((void (**)(id, long long *))a3 + 2))(a3, &v5);
}

- (void)didExitGeoFence
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1022C26A8);
  }
  objc_super v3 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc didExitGeoFence() received in adapter", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1022C26A8);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMotionStateMediatorAdapter didExitGeoFence]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_100693BBC((uint64_t)[(CLMotionStateMediatorAdapter *)self adaptee]);
}

- (void)didTimeoutGeoFence
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1022C26A8);
  }
  objc_super v3 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc didTimeout() received in adapter", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1022C26A8);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLMotionStateMediatorAdapter didTimeoutGeoFence]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_100693F3C((uint64_t)[(CLMotionStateMediatorAdapter *)self adaptee]);
}

- (id)syncgetActivityOverride
{
  sub_10069418C((uint64_t)[(CLMotionStateMediatorAdapter *)self adaptee], &v6);
  uint64_t v4 = v6;
  long long v5 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v2 = sub_10069423C(&v4);
  if (v5) {
    sub_1000DB0A0(v5);
  }
  if (v7) {
    sub_1000DB0A0(v7);
  }
  return v2;
}

- (void)registerForWorkoutSessionUpdates:(id)a3
{
  uint64_t v4 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_10069432C((uint64_t)v4, (uint64_t)a3);
}

- (void)unregisterForWorkoutSessionUpdates:(id)a3
{
  uint64_t v4 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_100694508((uint64_t)v4, (uint64_t)a3);
}

- (void)beginWorkoutSession:(WorkoutSettings *)a3 withOverview:(id)a4 enableWorkoutChangeDetection:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = [(CLMotionStateMediatorAdapter *)self adaptee];
  (*((void (**)(void **__return_ptr, id))a4 + 2))(v9, a4);
  sub_100694778((uint64_t)v8, a3->var0, (uint64_t)v9, v5);
  sub_1004F6960(v11);
  if (v10 < 0) {
    operator delete(v9[2]);
  }
}

- (void)setCurrentWorkoutType:(WorkoutSettings *)a3 isManualTransition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_100694E9C((uint64_t)v6, a3->var0, v4);
}

- (void)endWorkoutSession:(WorkoutSettings *)a3
{
  BOOL v4 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_1006923EC((uint64_t)v4, a3->var0);
}

- (void)pauseWorkout:(WorkoutSettings *)a3
{
  BOOL v4 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_10069515C((uint64_t)v4, a3->var0);
}

- (void)resumeWorkout:(WorkoutSettings *)a3
{
  BOOL v4 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_100695370((uint64_t)v4, a3->var0);
}

- (void)currentWorkoutActiveStateWithReply:(id)a3
{
  unsigned int v13 = 0;
  long long __src = 0u;
  memset(v38, 0, sizeof(v38));
  BOOL v4 = [(CLMotionStateMediatorAdapter *)self adaptee];
  long long v5 = *(_OWORD *)(v4 + 9640);
  long long v28 = *(_OWORD *)(v4 + 9656);
  long long v6 = *(_OWORD *)(v4 + 9688);
  long long v29 = *(_OWORD *)(v4 + 9672);
  long long v30 = v6;
  long long v7 = *(_OWORD *)(v4 + 9576);
  long long v24 = *(_OWORD *)(v4 + 9592);
  long long v8 = *(_OWORD *)(v4 + 9624);
  long long v25 = *(_OWORD *)(v4 + 9608);
  long long v26 = v8;
  long long v27 = v5;
  long long v9 = *(_OWORD *)(v4 + 9560);
  long long v21 = *(_OWORD *)(v4 + 9544);
  long long v22 = v9;
  int v20 = *((_DWORD *)v4 + 2225);
  uint64_t v31 = *((void *)v4 + 1213);
  long long v23 = v7;
  sub_1006ACE08((uint64_t)&v32, (uint64_t)(v4 + 8808));
  v12[0] = &v13;
  v12[1] = v39;
  v12[2] = &v36;
  sub_1006ADEA4((uint64_t)v12, (uint64_t)&v20);
  sub_100663B8C(v35);
  if (v34 < 0) {
    operator delete(__p);
  }
  uint64_t v10 = v13;
  v18[8] = v39[8];
  v18[9] = v39[9];
  uint64_t v19 = v40;
  v18[4] = v39[4];
  v18[5] = v39[5];
  v18[6] = v39[6];
  v18[7] = v39[7];
  v18[0] = v39[0];
  v18[1] = v39[1];
  v18[2] = v39[2];
  v18[3] = v39[3];
  long long v14 = v36;
  if (SHIBYTE(v38[0]) < 0)
  {
    sub_1000DC48C(&v15, (void *)__src, *((unint64_t *)&__src + 1));
  }
  else
  {
    long long v15 = __src;
    uint64_t v16 = v38[0];
  }
  sub_1006A7010((uint64_t)v17, &v38[1]);
  id v11 = sub_1006957E0(&v14);
  (*((void (**)(id, uint64_t, _OWORD *, id))a3 + 2))(a3, v10, v18, v11);
  sub_100663B8C(v17);
  if (SHIBYTE(v16) < 0) {
    operator delete((void *)v15);
  }
  sub_100663B8C(&v38[1]);
  if (SHIBYTE(v38[0]) < 0) {
    operator delete((void *)__src);
  }
}

- (void)workoutSnapshotWithReply:(id)a3
{
  BOOL v4 = [(CLMotionStateMediatorAdapter *)self adaptee];
  long long v5 = *(_OWORD *)(v4 + 10104);
  v13[12] = *(_OWORD *)(v4 + 10088);
  v13[13] = v5;
  long long v6 = *(_OWORD *)(v4 + 10136);
  v13[14] = *(_OWORD *)(v4 + 10120);
  v13[15] = v6;
  long long v7 = *(_OWORD *)(v4 + 10040);
  v13[8] = *(_OWORD *)(v4 + 10024);
  v13[9] = v7;
  long long v8 = *(_OWORD *)(v4 + 10072);
  v13[10] = *(_OWORD *)(v4 + 10056);
  v13[11] = v8;
  long long v9 = *(_OWORD *)(v4 + 9976);
  v13[4] = *(_OWORD *)(v4 + 9960);
  v13[5] = v9;
  long long v10 = *(_OWORD *)(v4 + 10008);
  v13[6] = *(_OWORD *)(v4 + 9992);
  v13[7] = v10;
  long long v11 = *(_OWORD *)(v4 + 9912);
  v13[0] = *(_OWORD *)(v4 + 9896);
  v13[1] = v11;
  long long v12 = *(_OWORD *)(v4 + 9944);
  v13[2] = *(_OWORD *)(v4 + 9928);
  v13[3] = v12;
  (*((void (**)(id, _OWORD *))a3 + 2))(a3, v13);
}

- (void)updateWorkoutReminderMuteSetting:(int64_t)a3 mute:(BOOL)a4
{
  BOOL v4 = a4;
  long long v6 = [(CLMotionStateMediatorAdapter *)self adaptee];

  sub_100695A5C(v6, a3, v4);
}

+ (BOOL)isSupported
{
  if (qword_10247C9D0 != -1) {
    dispatch_once(&qword_10247C9D0, &stru_1022C22E0);
  }
  return byte_10247C9C8;
}

@end