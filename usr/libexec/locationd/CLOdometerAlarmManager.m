@interface CLOdometerAlarmManager
+ (id)getSilo;
- (CLOdometerAlarm)currentlyScheduled;
- (CLOdometerAlarm)firstAlarm;
- (CLOdometerAlarmManager)init;
- (double)lastOdometer;
- (id).cxx_construct;
- (void)addAlarm:(id)a3;
- (void)beginService;
- (void)endService;
- (void)handleLocationData:(const void *)a3;
- (void)handleOdometer:(double)a3;
- (void)handleOdometerData:(const void *)a3;
- (void)removeAlarm:(id)a3;
- (void)reschedule;
- (void)reset;
- (void)setCurrentlyScheduled:(id)a3;
- (void)setLastOdometer:(double)a3;
@end

@implementation CLOdometerAlarmManager

+ (id)getSilo
{
  if (qword_1024852C0 != -1) {
    dispatch_once(&qword_1024852C0, &stru_102310EE8);
  }
  return (id)qword_1024852B8;
}

- (CLOdometerAlarmManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLOdometerAlarmManager;
  return [(CLOdometerAlarmManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLOdometerAlarmManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLOdometerAlarmManagerClientProtocol];
}

- (void)beginService
{
  self->fAlarms = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  [(CLOdometerAlarmManager *)self universe];
  sub_100681630();
}

- (void)endService
{
  value = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  v4 = self->fGpsClient.__ptr_.__value_;
  self->fGpsClient.__ptr_.__value_ = 0;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8))(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)CLOdometerAlarmManager;
  [(CLOdometerAlarmManager *)&v5 dealloc];
}

- (void)addAlarm:(id)a3
{
  objc_sync_enter(self);
  [(NSMutableArray *)self->fAlarms addObject:a3];
  [(NSMutableArray *)self->fAlarms sortUsingComparator:&stru_102310F08];
  [(CLOdometerAlarmManager *)self reschedule];

  objc_sync_exit(self);
}

- (void)removeAlarm:(id)a3
{
  objc_sync_enter(self);
  [(NSMutableArray *)self->fAlarms removeObject:a3];
  [(CLOdometerAlarmManager *)self reschedule];

  objc_sync_exit(self);
}

- (void)reschedule
{
  objc_super v3 = [(CLOdometerAlarmManager *)self firstAlarm];
  if (v3 != [(CLOdometerAlarmManager *)self currentlyScheduled])
  {
    if (v3)
    {
      __asm { FMOV            V0.2D, #-1.0 }
      sub_10012F770();
    }
    [*((id *)self->fGpsClient.__ptr_.__value_ + 2) unregister:*((void *)self->fGpsClient.__ptr_.__value_ + 1) forNotification:16];
    [(CLOdometerAlarmManager *)self setCurrentlyScheduled:0];
  }
}

- (void)handleLocationData:(const void *)a3
{
  objc_sync_enter(self);
  double v5 = *((double *)a3 + 20);
  uint64_t v6 = *((void *)a3 + 100);
  double v7 = v5;
  if (v6) {
    double v7 = *(double *)sub_1000E9360(v6);
  }
  if (v7 >= 0.0)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_102310F28);
    }
    v11 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v18 = v7;
      __int16 v19 = 2048;
      double v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "BATCH: received locations w/ odometer: %f, %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_102310F28);
      }
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
    }
    [(CLOdometerAlarmManager *)self lastOdometer];
    if (v7 >= v12)
    {
      [(CLOdometerAlarmManager *)self handleOdometer:v5];
    }
    else
    {
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_102310F28);
      }
      v13 = qword_102419638;
      if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEFAULT))
      {
        [(CLOdometerAlarmManager *)self lastOdometer];
        *(_DWORD *)buf = 134218240;
        double v18 = v14;
        __int16 v19 = 2048;
        double v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#Warning BATCH: odometer ran from %f to %f", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419630 != -1) {
          dispatch_once(&qword_102419630, &stru_102310F28);
        }
        [(CLOdometerAlarmManager *)self lastOdometer];
        v16 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v16);
        if (v16 != (char *)buf) {
          free(v16);
        }
      }
      [(CLOdometerAlarmManager *)self reset];
    }
  }
  else if ([(NSMutableArray *)self->fAlarms count])
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_102310F28);
    }
    v8 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&v9 = COERCE_DOUBLE(sub_10003E9A4(*((_DWORD *)a3 + 24)));
      *(_DWORD *)buf = 136315138;
      double v18 = *(double *)&v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning BATCH: Received a location (%s) without an odometer while odometer alarm was set", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_102310F28);
      }
      sub_10003E9A4(*((_DWORD *)a3 + 24));
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  objc_sync_exit(self);
}

- (void)handleOdometerData:(const void *)a3
{
  objc_sync_enter(self);
  if (*((double *)a3 + 104) <= 0.0)
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_102310F28);
    }
    double v7 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *((void *)a3 + 104);
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#Warning BATCH: odometer reset: %.2f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_102310F28);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleOdometerData:]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [(CLOdometerAlarmManager *)self reset];
  }
  else
  {
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_102310F28);
    }
    double v5 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *((void *)a3 + 104);
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BATCH: received odometer: %f", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_102310F28);
      }
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLOdometerAlarmManager handleOdometerData:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [(CLOdometerAlarmManager *)self handleOdometer:*((double *)a3 + 104)];
  }
  objc_sync_exit(self);
}

- (void)handleOdometer:(double)a3
{
  while ([(CLOdometerAlarmManager *)self firstAlarm])
  {
    [[(CLOdometerAlarmManager *)self firstAlarm] odometerTarget];
    if (v5 >= a3) {
      break;
    }
    global_queue = dispatch_get_global_queue(0, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1010EA87C;
    v7[3] = &unk_1022A56E0;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    dispatch_async(global_queue, v7);
    [(NSMutableArray *)self->fAlarms removeObjectAtIndex:0];
  }
  [(CLOdometerAlarmManager *)self setLastOdometer:a3];
  [(CLOdometerAlarmManager *)self reschedule];
}

- (void)reset
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  fAlarms = self->fAlarms;
  id v4 = [(NSMutableArray *)fAlarms countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(fAlarms);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1010EAA30;
        block[3] = &unk_10229FED8;
        block[4] = v8;
        dispatch_async(global_queue, block);
      }
      id v5 = [(NSMutableArray *)fAlarms countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->fAlarms removeAllObjects];
  [(CLOdometerAlarmManager *)self setLastOdometer:0.0];
}

- (CLOdometerAlarm)firstAlarm
{
  result = (CLOdometerAlarm *)[(NSMutableArray *)self->fAlarms count];
  if (result)
  {
    fAlarms = self->fAlarms;
    return (CLOdometerAlarm *)[(NSMutableArray *)fAlarms objectAtIndex:0];
  }
  return result;
}

- (CLOdometerAlarm)currentlyScheduled
{
  return self->currentlyScheduled;
}

- (void)setCurrentlyScheduled:(id)a3
{
  self->currentlyScheduled = (CLOdometerAlarm *)a3;
}

- (double)lastOdometer
{
  return self->lastOdometer;
}

- (void)setLastOdometer:(double)a3
{
  self->lastOdometer = a3;
}

- (void).cxx_destruct
{
  value = self->fGpsClient.__ptr_.__value_;
  self->fGpsClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  id v4 = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0;
  if (v4)
  {
    id v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end