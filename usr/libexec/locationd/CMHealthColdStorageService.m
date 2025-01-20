@interface CMHealthColdStorageService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)checkDeferral:(id)a3;
- (CMHealthColdStorageService)init;
- (id).cxx_construct;
- (id)syncgetFetchColdStorageConfiguration;
- (int)getTotalDBSizeInMB;
- (int64_t)getHealthColdStorageDbCleanupActivityInterval;
- (void)beginService;
- (void)endService;
- (void)logAnalytics:(id)a3;
- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onDbCleanupActivity:(id)a3;
- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4;
- (void)onSyncActivity:(id)a3;
- (void)performDbCleanUpOnActivity:(id)a3;
- (void)performSyncWithCompletion:(id)a3 activity:(id)a4;
- (void)queryHealthKitWithGroup:(group *)a3;
- (void)registerDatabaseAtURL:(id)a3 tableName:(id)a4 isClassB:(BOOL)a5 sourceDevice:(int)a6 cloudKitDelegate:(id)a7;
- (void)resetAnalytics;
- (void)sendAnalytics;
- (void)setupDbCleanupActivity;
- (void)setupSyncActivity;
@end

@implementation CMHealthColdStorageService

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
  if (qword_102485188 != -1) {
    dispatch_once(&qword_102485188, &stru_10230F248);
  }
  return (id)qword_102485180;
}

- (CMHealthColdStorageService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CMHealthColdStorageService;
  return [(CMHealthColdStorageService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CMHealthColdStorageServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CMHealthColdStorageServiceClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_102485198 != -1) {
    dispatch_once(&qword_102485198, &stru_10230F268);
  }
  return byte_102485190;
}

- (void)beginService
{
  LOBYTE(v5[0]) = 0;
  sub_10006ACBC(buf, "ColdStorageManagerEnableCloudKit", (unsigned __int8 *)v5, 0);
  int v2 = buf[1];
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_10230F418);
  }
  objc_super v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning CMHealthColdStorageService, CloudKit sync: %d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v5[0] = 67109120;
    v5[1] = v2;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  operator new();
}

- (void)endService
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_10230F418);
  }
  objc_super v3 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down CMHealthColdStorageService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService endService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  value = self->fDataProtectionClient.__ptr_.__value_;
  if (value) {
    [*((id *)value + 2) unregister:*((void *)value + 1) forNotification:0];
  }
  unint64_t v5 = self->fFitnessTrackingClient.__ptr_.__value_;
  if (v5)
  {
    [*((id *)v5 + 2) unregister:*((void *)v5 + 1) forNotification:0];
    [*((id *)self->fFitnessTrackingClient.__ptr_.__value_ + 2) unregister:*((void *)self->fFitnessTrackingClient.__ptr_.__value_ + 1) forNotification:6];
  }
}

- (void)onDataProtectionNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_10230F418);
  }
  v7 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "onDataProtectionNotification", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService onDataProtectionNotification:data:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  [(-[CMHealthColdStorageService universe](self, "universe")) silo];
  if (!*a3)
  {
    value = self->fManager.__ptr_.__value_;
    if (value) {
      sub_101006EEC(value, *(_DWORD *)a4 == 1);
    }
  }
}

- (void)onFitnessTrackingNotification:(const int *)a3 data:(const NotificationData *)a4
{
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_10230F418);
  }
  v7 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "onFitnessTrackingNotification", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v15 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]", "%s\n", v15);
    if (v15 != (char *)buf) {
      free(v15);
    }
  }
  [(-[CMHealthColdStorageService universe](self, "universe")) silo];
  if (*a3 == 6)
  {
    int v8 = *(_DWORD *)a4;
    if (*(_DWORD *)a4)
    {
      if (v8 == 2)
      {
        value = self->fManager.__ptr_.__value_;
        __int16 v10 = 0;
      }
      else
      {
        if (v8 != 1) {
          return;
        }
        value = self->fManager.__ptr_.__value_;
        __int16 v10 = 1;
      }
      sub_101008D1C((uint64_t)value, v10);
    }
    else
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_10230F418);
      }
      v14 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[Service] Received an unknown Watch.app Fitness Tracking state", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_10230F418);
        }
        v13 = (uint8_t *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]", "%s\n");
        goto LABEL_29;
      }
    }
  }
  else
  {
    if (!*a3)
    {
      sub_101008974((uint64_t)self->fManager.__ptr_.__value_, *((unsigned __int8 *)a4 + 3));
      return;
    }
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v11 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_FAULT))
    {
      int v12 = *a3;
      *(_DWORD *)buf = 67109120;
      int v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "FitnessTracking: Unexpected notification type %d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_10230F418);
      }
      v13 = (uint8_t *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageService onFitnessTrackingNotification:data:]", "%s\n");
LABEL_29:
      if (v13 != buf) {
        free(v13);
      }
    }
  }
}

- (void)registerDatabaseAtURL:(id)a3 tableName:(id)a4 isClassB:(BOOL)a5 sourceDevice:(int)a6 cloudKitDelegate:(id)a7
{
  if (a4 && a3 && self->fManager.__ptr_.__value_)
  {
    uint64_t v9 = *(void *)&a6;
    id v12 = [a3 absoluteString];
    sub_1002E9328(__dst, [v12 UTF8String], (size_t)[v12 lengthOfBytesUsingEncoding:4]);
    sub_1002E9328(__p, [a4 UTF8String], (size_t)[a4 lengthOfBytesUsingEncoding:4]);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v13 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
    {
      v14 = __p;
      if (v20 < 0) {
        v14 = (void **)__p[0];
      }
      v15 = __dst;
      if (v22 < 0) {
        v15 = (void **)__dst[0];
      }
      *(_DWORD *)buf = 136315394;
      v28 = v14;
      __int16 v29 = 2080;
      v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Service] Adding DB for table %s in %s", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_10230F418);
      }
      v16 = __p;
      if (v20 < 0) {
        v16 = (void **)__p[0];
      }
      int v17 = __dst;
      if (v22 < 0) {
        int v17 = (void **)__dst[0];
      }
      int v23 = 136315394;
      v24 = v16;
      __int16 v25 = 2080;
      v26 = v17;
      v18 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService registerDatabaseAtURL:tableName:isClassB:sourceDevice:cloudKitDelegate:]", "%s\n", v18);
      if (v18 != (char *)buf) {
        free(v18);
      }
    }
    sub_10100636C((uint64_t)self->fManager.__ptr_.__value_, (uint64_t)__dst, (std::string::size_type)__p, a5, v9, (uint64_t)a7, 0);
  }
}

- (id)syncgetFetchColdStorageConfiguration
{
  sub_10053B70C(2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  objc_super v3 = +[NSString stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v6[0] = CMColdStorageDatabasePath;
  v7[0] = [(NSString *)v3 stringByAppendingPathComponent:@"cold_encryptedB.db"];
  v7[1] = &off_102398058;
  v6[1] = CMColdStorageCardioTableNames;
  v6[2] = CMColdStorageMobilityTableNames;
  v7[2] = &off_102398070;
  return +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
}

- (void)setupSyncActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.locationd.Motion.ColdStorage");
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1);
  sub_101A2AFB4(v5, "HealthColdStorageSyncActivityInterval", &XPC_ACTIVITY_INTERVAL_1_DAY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, value);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1010C2B50;
  v4[3] = &unk_1022B9CD0;
  v4[4] = [[objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "vendor") proxyForService:@"CMHealthColdStorageService"];
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageSync", v3, v4);
  xpc_release(v3);
}

- (void)onSyncActivity:(id)a3
{
  if (!a3)
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "com.apple.locationd.Motion.ColdStorageSync";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    int v11 = 136315138;
    id v12 = "com.apple.locationd.Motion.ColdStorageSync";
LABEL_22:
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageService onSyncActivity:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
    return;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1010C31EC;
    v10[3] = &unk_1022B4250;
    v10[4] = a3;
    [(CMHealthColdStorageService *)self performSyncWithCompletion:v10 activity:a3];
    return;
  }
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_10230F418);
  }
  int v8 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "com.apple.locationd.Motion.ColdStorageSync";
    __int16 v17 = 2048;
    xpc_activity_state_t v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[Service] Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    int v11 = 136315394;
    id v12 = "com.apple.locationd.Motion.ColdStorageSync";
    __int16 v13 = 2048;
    xpc_activity_state_t v14 = v6;
    goto LABEL_22;
  }
}

- (void)performSyncWithCompletion:(id)a3 activity:(id)a4
{
  [self universe].silo
  v7 = dispatch_group_create();
  sub_1010078FC((uint64_t)self->fManager.__ptr_.__value_, &v15);
  shared_ptr<CLHealthColdStorageStats> v8 = v15;
  shared_ptr<CLHealthColdStorageStats> v15 = (shared_ptr<CLHealthColdStorageStats>)0;
  cntrl = self->fStats.__cntrl_;
  self->fStats = v8;
  if (cntrl)
  {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
    if (v15.__cntrl_) {
      sub_1000DB0A0((std::__shared_weak_count *)v15.__cntrl_);
    }
  }
  dispatch_object_t v18 = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  [(CMHealthColdStorageService *)self queryHealthKitWithGroup:&v18];
  if (v18) {
    dispatch_release(v18);
  }
  v15.__ptr_ = 0;
  v15.__cntrl_ = (__shared_weak_count *)&v15;
  uint64_t v16 = 0x2020000000;
  int v17 = 100;
  xpc_activity_state_t v14 = v7;
  if (v7)
  {
    dispatch_retain(v7);
    dispatch_group_enter(v7);
  }
  id v10 = [[-[CMHealthColdStorageService universe](self, "universe") silo];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3321888768;
  v12[2] = sub_1010C38EC;
  v12[3] = &unk_10230F2B8;
  v12[4] = self;
  v12[5] = a4;
  v12[6] = &v15;
  dispatch_group_t group = v7;
  if (v7)
  {
    dispatch_retain(v7);
    dispatch_group_enter(group);
  }
  [v10 async:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1010C3A74;
  v11[3] = &unk_10230F2F0;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v15;
  dispatch_group_notify(v7, (dispatch_queue_t)[objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "silo") queue], v11);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
  if (v7)
  {
    dispatch_group_leave(v7);
    dispatch_release(v7);
    _Block_object_dispose(&v15, 8);
    dispatch_release(v7);
  }
  else
  {
    _Block_object_dispose(&v15, 8);
  }
}

- (BOOL)checkDeferral:(id)a3
{
  if (a3)
  {
    BOOL should_defer = xpc_activity_should_defer((xpc_activity_t)a3);
    if (should_defer)
    {
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_10230F418);
      }
      unint64_t v5 = qword_102419308;
      if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        __int16 v13 = "com.apple.locationd.Motion.ColdStorageSync";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Service] Cancelling (%{public}s) early due to deferral.", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_10230F418);
        }
        id v10 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v10);
        if (v10 != (char *)buf) {
          free(v10);
        }
      }
      if (xpc_activity_set_state((xpc_activity_t)a3, 3))
      {
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_10230F418);
        }
        xpc_activity_state_t v6 = qword_102419308;
        if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[Service] Activity deferred", buf, 2u);
        }
        if (!sub_10013D1A0(115, 2)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_10230F418);
        }
        v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v7);
        if (v7 == (char *)buf) {
          goto LABEL_24;
        }
      }
      else
      {
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_10230F418);
        }
        shared_ptr<CLHealthColdStorageStats> v8 = qword_102419308;
        if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_FAULT))
        {
          xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
          *(_DWORD *)buf = 134349056;
          __int16 v13 = (const char *)state;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[Service] Failed to defer activity. Current state is %{public}ld", buf, 0xCu);
        }
        if (!sub_10013D1A0(115, 0)) {
          goto LABEL_24;
        }
        bzero(buf, 0x65CuLL);
        if (qword_102419300 != -1) {
          dispatch_once(&qword_102419300, &stru_10230F418);
        }
        xpc_activity_get_state((xpc_activity_t)a3);
        v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageService checkDeferral:]", "%s\n", v7);
        if (v7 == (char *)buf) {
          goto LABEL_24;
        }
      }
      free(v7);
LABEL_24:
      LOBYTE(should_defer) = 1;
    }
  }
  else
  {
    LOBYTE(should_defer) = 0;
  }
  return should_defer;
}

- (int64_t)getHealthColdStorageDbCleanupActivityInterval
{
  int64_t v6 = XPC_ACTIVITY_INTERVAL_4_HOURS;
  sub_101A2AFB4(v5, "HealthColdStorageDbCleanupActivityInterval", &v6, 0);
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_10230F418);
  }
  int v2 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HealthColdStorage: Db Vacuum interval, %lld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    int v7 = 134217984;
    int64_t v8 = v6;
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService getHealthColdStorageDbCleanupActivityInterval]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  return v6;
}

- (void)setupDbCleanupActivity
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_GROUP_NAME, "com.apple.locationd.Motion.ColdStorage");
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_INTERVAL, [(CMHealthColdStorageService *)self getHealthColdStorageDbCleanupActivityInterval]);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_5_MIN);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_4_HOURS);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1010C42C0;
  handler[3] = &unk_1022B9CD0;
  handler[4] = [objc_msgSend(-[CMHealthColdStorageService universe](self, "universe"), "vendor") proxyForService:@"CMHealthColdStorageService"];
  xpc_activity_register("com.apple.locationd.Motion.ColdStorageDbCleanup", v3, handler);
  xpc_release(v3);
}

- (void)performDbCleanUpOnActivity:(id)a3
{
  [(-[CMHealthColdStorageService universe](self, "universe", a3)) silo];
  int64_t value = self->fManager.__ptr_.__value_;

  sub_101008D34((uint64_t)value);
}

- (void)onDbCleanupActivity:(id)a3
{
  if (!a3)
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    uint64_t v9 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Invalid xpc activity (%s).", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 == -1)
    {
LABEL_29:
      int64_t v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageService onDbCleanupActivity:]", "%s\n", v8);
      if (v8 == (char *)buf) {
        return;
      }
      goto LABEL_30;
    }
LABEL_31:
    dispatch_once(&qword_102419300, &stru_10230F418);
    goto LABEL_29;
  }
  xpc_activity_state_t state = xpc_activity_get_state((xpc_activity_t)a3);
  if (state == 4 || (xpc_activity_state_t v6 = state, state == 2))
  {
    [(CMHealthColdStorageService *)self performDbCleanUpOnActivity:a3];
    if (xpc_activity_get_state((xpc_activity_t)a3) == 3 || xpc_activity_set_state((xpc_activity_t)a3, 5)) {
      return;
    }
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    int v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
      __int16 v13 = 2050;
      xpc_activity_state_t v14 = xpc_activity_get_state((xpc_activity_t)a3);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "[Service] Failed to mark (%s) activity as done. Current state is %{public}ld", buf, 0x16u);
    }
    if (!sub_10013D1A0(115, 0)) {
      return;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    xpc_activity_get_state((xpc_activity_t)a3);
    int64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageService onDbCleanupActivity:]", "%s\n", v8);
    if (v8 == (char *)buf) {
      return;
    }
LABEL_30:
    free(v8);
    return;
  }
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_10230F418);
  }
  int64_t v10 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "com.apple.locationd.Motion.ColdStorageDbCleanup";
    __int16 v13 = 2048;
    xpc_activity_state_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "[Service] Unexpected activity (%s) state: %ld", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419300 == -1) {
      goto LABEL_29;
    }
    goto LABEL_31;
  }
}

- (void)resetAnalytics
{
  ptr = self->fStats.__ptr_;
  *(void *)ptr = 0;
  *((void *)ptr + 1) = 0;
  *((_DWORD *)ptr + 4) = 0;
  sub_1000DB264((uint64_t)ptr + 24, *((char **)ptr + 4));
  *((void *)ptr + 3) = (char *)ptr + 32;
  *((void *)ptr + 5) = 0;
  *((void *)ptr + 4) = 0;
  v4 = self->fStats.__ptr_;
  *((_DWORD *)v4 + 13) = 0;
  *((_DWORD *)v4 + 14) = 0;
}

- (void)logAnalytics:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1010C4DD8;
  v10[3] = &unk_10230F318;
  v10[4] = v4;
  void v10[5] = v5;
  v10[6] = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v10];
  if (qword_102419300 != -1) {
    dispatch_once(&qword_102419300, &stru_10230F418);
  }
  int v7 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    xpc_activity_state_t v14 = "";
    __int16 v15 = 2114;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"[Service::logAnalytics]\", \"Daily additions\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
  }
  int64_t v8 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    xpc_activity_state_t v14 = "";
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"[Service::logAnalytics]\", \"Daily purges\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
  }
  uint64_t v9 = qword_102419308;
  if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v12 = 0;
    __int16 v13 = 2082;
    xpc_activity_state_t v14 = "";
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"[Service::logAnalytics]\", \"Other\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
}

- (void)sendAnalytics
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1024851B8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1024851B8))
  {
    *(void *)buf = 0x3E800000000;
    int v97 = 10000;
    sub_100F4CFF0(qword_1024851A0, buf, 3uLL);
    __cxa_atexit((void (*)(void *))sub_100F4D074, qword_1024851A0, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_1024851B8);
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1024851D8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1024851D8))
  {
    *(void *)buf = &_mh_execute_header;
    int v97 = 2;
    sub_100F4CFF0(qword_1024851C0, buf, 3uLL);
    __cxa_atexit((void (*)(void *))sub_100F4D074, qword_1024851C0, (void *)&_mh_execute_header);
    __cxa_guard_release(&qword_1024851D8);
  }
  v99[0] = @"CountCKError_Others";
  v100[0] = +[NSNumber numberWithInt:*(_DWORD *)self->fStats.__ptr_];
  v99[1] = @"CountCKError_PrivateMissingManateeIdentity";
  v100[1] = +[NSNumber numberWithInt:*((unsigned int *)self->fStats.__ptr_ + 1)];
  v99[2] = @"CountCKError_ServerRecordChanged";
  v100[2] = +[NSNumber numberWithInt:*((unsigned int *)self->fStats.__ptr_ + 2)];
  v99[3] = @"CountCKError_UnknownItem";
  v100[3] = +[NSNumber numberWithInt:*((unsigned int *)self->fStats.__ptr_ + 3)];
  v99[4] = @"CountCKError_ZoneNotFound";
  v100[4] = +[NSNumber numberWithInt:*((unsigned int *)self->fStats.__ptr_ + 4)];
  v99[5] = @"NumDailyRecords_HRRIHH";
  ptr = self->fStats.__ptr_;
  sub_100134750(buf, "HRRecoveryInputHRHistory");
  v93[0] = buf;
  v100[5] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)ptr + 3, (const void **)buf, (uint64_t)&unk_101D0B290, (_OWORD **)v93)+ 14)];
  v99[6] = @"NumDailyRecords_HRRIWH";
  id v4 = self->fStats.__ptr_;
  sub_100134750(v93, "HRRecoveryInputWRHistory");
  v91[0] = v93;
  v100[6] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v4 + 3, (const void **)v93, (uint64_t)&unk_101D0B290, (_OWORD **)v91)+ 14)];
  v99[7] = @"NumDailyRecords_HRRSH";
  id v5 = self->fStats.__ptr_;
  sub_100134750(v91, "HRRecoverySessionHistory");
  v89[0] = v91;
  v100[7] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v5 + 3, (const void **)v91, (uint64_t)&unk_101D0B290, (_OWORD **)v89)+ 14)];
  v99[8] = @"NumDailyRecords_MBMH";
  id v6 = self->fStats.__ptr_;
  sub_100134750(v89, "MobilityBoutMetricsHistory");
  v87[0] = v89;
  v100[8] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v6 + 3, (const void **)v89, (uint64_t)&unk_101D0B290, (_OWORD **)v87)+ 14)];
  v99[9] = @"NumDailyRecords_PWDBH";
  int v7 = self->fStats.__ptr_;
  sub_100134750(v87, "PredictedWalkDistanceBoutHistory");
  v85[0] = v87;
  v100[9] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v7 + 3, (const void **)v87, (uint64_t)&unk_101D0B290, (_OWORD **)v85)+ 14)];
  v99[10] = @"NumDailyRecords_SCH";
  int64_t v8 = self->fStats.__ptr_;
  sub_100134750(v85, "StrideCalHistory");
  v83[0] = v85;
  v100[10] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v8 + 3, (const void **)v85, (uint64_t)&unk_101D0B290, (_OWORD **)v83)+ 14)];
  v99[11] = @"NumDailyRecords_WSSC";
  uint64_t v9 = self->fStats.__ptr_;
  sub_100134750(v83, "WalkingSpeedStrideCal");
  v81[0] = v83;
  v100[11] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v9 + 3, (const void **)v83, (uint64_t)&unk_101D0B290, (_OWORD **)v81)+ 14)];
  v99[12] = @"NumDailyRecords_SGMH";
  int64_t v10 = self->fStats.__ptr_;
  sub_100134750(v81, "SmoothedGaitMetricsHistory");
  v79[0] = v81;
  v100[12] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v10 + 3, (const void **)v81, (uint64_t)&unk_101D0B290, (_OWORD **)v79)+ 14)];
  v99[13] = @"NumDailyRecords_EGH";
  int v11 = self->fStats.__ptr_;
  sub_100134750(v79, "ElevationGradeHistory");
  v77[0] = v79;
  v100[13] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v11 + 3, (const void **)v79, (uint64_t)&unk_101D0B290, (_OWORD **)v77)+ 14)];
  v99[14] = @"NumDailyRecords_VOMH";
  int v12 = self->fStats.__ptr_;
  sub_100134750(v77, "VO2MaxHistory");
  v75[0] = v77;
  v100[14] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v12 + 3, (const void **)v77, (uint64_t)&unk_101D0B290, (_OWORD **)v75)+ 14)];
  v99[15] = @"NumDailyRecords_VOMIH";
  __int16 v13 = self->fStats.__ptr_;
  sub_100134750(v75, "VO2MaxInputHistory");
  v73[0] = v75;
  v100[15] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v13 + 3, (const void **)v75, (uint64_t)&unk_101D0B290, (_OWORD **)v73)+ 14)];
  v99[16] = @"NumDailyRecords_VOMSAH";
  xpc_activity_state_t v14 = self->fStats.__ptr_;
  sub_100134750(v73, "VO2MaxSessionAttributesHistory");
  v71[0] = v73;
  v100[16] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v14 + 3, (const void **)v73, (uint64_t)&unk_101D0B290, (_OWORD **)v71)+ 14)];
  v99[17] = @"NumDailyRecords_VOMSH";
  __int16 v15 = self->fStats.__ptr_;
  sub_100134750(v71, "VO2MaxSummaryHistory");
  v69[0] = v71;
  v100[17] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v15 + 3, (const void **)v71, (uint64_t)&unk_101D0B290, (_OWORD **)v69)+ 14)];
  v99[18] = @"NumPurgedDailyRecords_HRRIHH";
  id v16 = self->fStats.__ptr_;
  sub_100134750(v69, "HRRecoveryInputHRHistory");
  v67[0] = v69;
  v100[18] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v16 + 3, (const void **)v69, (uint64_t)&unk_101D0B290, (_OWORD **)v67)+ 15)];
  v99[19] = @"NumPurgedDailyRecords_HRRIWH";
  int v17 = self->fStats.__ptr_;
  sub_100134750(v67, "HRRecoveryInputWRHistory");
  v65[0] = v67;
  v100[19] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v17 + 3, (const void **)v67, (uint64_t)&unk_101D0B290, (_OWORD **)v65)+ 15)];
  v99[20] = @"NumPurgedDailyRecords_HRRSH";
  dispatch_object_t v18 = self->fStats.__ptr_;
  sub_100134750(v65, "HRRecoverySessionHistory");
  v63[0] = v65;
  v100[20] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v18 + 3, (const void **)v65, (uint64_t)&unk_101D0B290, (_OWORD **)v63)+ 15)];
  v99[21] = @"NumPurgedDailyRecords_MBMH";
  v19 = self->fStats.__ptr_;
  sub_100134750(v63, "MobilityBoutMetricsHistory");
  v61[0] = v63;
  v100[21] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v19 + 3, (const void **)v63, (uint64_t)&unk_101D0B290, (_OWORD **)v61)+ 15)];
  v99[22] = @"NumPurgedDailyRecords_PWDBH";
  char v20 = self->fStats.__ptr_;
  sub_100134750(v61, "PredictedWalkDistanceBoutHistory");
  v59[0] = v61;
  v100[22] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v20 + 3, (const void **)v61, (uint64_t)&unk_101D0B290, (_OWORD **)v59)+ 15)];
  v99[23] = @"NumPurgedDailyRecords_SCH";
  v21 = self->fStats.__ptr_;
  sub_100134750(v59, "StrideCalHistory");
  v57[0] = v59;
  v100[23] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v21 + 3, (const void **)v59, (uint64_t)&unk_101D0B290, (_OWORD **)v57)+ 15)];
  v99[24] = @"NumPurgedDailyRecords_WSSC";
  char v22 = self->fStats.__ptr_;
  sub_100134750(v57, "WalkingSpeedStrideCal");
  v55[0] = v57;
  v100[24] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v22 + 3, (const void **)v57, (uint64_t)&unk_101D0B290, (_OWORD **)v55)+ 15)];
  v99[25] = @"NumPurgedDailyRecords_SGMH";
  int v23 = self->fStats.__ptr_;
  sub_100134750(v55, "SmoothedGaitMetricsHistory");
  v53[0] = v55;
  v100[25] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v23 + 3, (const void **)v55, (uint64_t)&unk_101D0B290, (_OWORD **)v53)+ 15)];
  v99[26] = @"NumPurgedDailyRecords_EGH";
  v24 = self->fStats.__ptr_;
  sub_100134750(v53, "ElevationGradeHistory");
  v51[0] = v53;
  v100[26] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v24 + 3, (const void **)v53, (uint64_t)&unk_101D0B290, (_OWORD **)v51)+ 15)];
  v99[27] = @"NumPurgedDailyRecords_VOMH";
  __int16 v25 = self->fStats.__ptr_;
  sub_100134750(v51, "VO2MaxHistory");
  v49[0] = v51;
  v100[27] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v25 + 3, (const void **)v51, (uint64_t)&unk_101D0B290, (_OWORD **)v49)+ 15)];
  v99[28] = @"NumPurgedDailyRecords_VOMIH";
  v26 = self->fStats.__ptr_;
  sub_100134750(v49, "VO2MaxInputHistory");
  v47[0] = v49;
  v100[28] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v26 + 3, (const void **)v49, (uint64_t)&unk_101D0B290, (_OWORD **)v47)+ 15)];
  v99[29] = @"NumPurgedDailyRecords_VOMSAH";
  v27 = self->fStats.__ptr_;
  sub_100134750(v47, "VO2MaxSessionAttributesHistory");
  v45[0] = v47;
  v100[29] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v27 + 3, (const void **)v47, (uint64_t)&unk_101D0B290, (_OWORD **)v45)+ 15)];
  v99[30] = @"NumPurgedDailyRecords_VOMSH";
  v28 = self->fStats.__ptr_;
  sub_100134750(v45, "VO2MaxSummaryHistory");
  v95 = v45;
  v100[30] = +[NSNumber numberWithInt:*((unsigned int *)sub_1002A196C((uint64_t **)v28 + 3, (const void **)v45, (uint64_t)&unk_101D0B290, (_OWORD **)&v95)+ 15)];
  v99[31] = @"CKSyncEnabled";
  v100[31] = +[NSNumber numberWithInt:*((unsigned __int8 *)self->fStats.__ptr_ + 48)];
  v99[32] = @"DailyStepCounts";
  int v29 = *((_DWORD *)self->fStats.__ptr_ + 13);
  v43 = 0;
  uint64_t v44 = 0;
  v42 = 0;
  sub_10010F834(&v42, (const void *)qword_1024851A0[0], unk_1024851A8, (unk_1024851A8 - qword_1024851A0[0]) >> 2);
  if (v43 == v42)
  {
    unint64_t v30 = 0;
  }
  else
  {
    unint64_t v30 = 0;
    unint64_t v31 = (v43 - (unsigned char *)v42) >> 2;
    if (v31 <= 1) {
      unint64_t v31 = 1;
    }
    while (*((_DWORD *)v42 + v30) < v29)
    {
      if (v31 == ++v30)
      {
        unint64_t v30 = v31;
        break;
      }
    }
  }
  v100[32] = +[NSNumber numberWithInt:v30];
  v99[33] = @"OutdoorPedWorkoutCounts";
  int v32 = *((_DWORD *)self->fStats.__ptr_ + 14);
  v40 = 0;
  uint64_t v41 = 0;
  std::string __p = 0;
  sub_10010F834(&__p, (const void *)qword_1024851C0[0], unk_1024851C8, (unk_1024851C8 - qword_1024851C0[0]) >> 2);
  if (v40 == __p)
  {
    unint64_t v33 = 0;
  }
  else
  {
    unint64_t v33 = 0;
    unint64_t v34 = (v40 - (unsigned char *)__p) >> 2;
    if (v34 <= 1) {
      unint64_t v34 = 1;
    }
    while (*((_DWORD *)__p + v33) < v32)
    {
      if (v34 == ++v33)
      {
        unint64_t v33 = v34;
        break;
      }
    }
  }
  v100[33] = +[NSNumber numberWithInt:v33];
  v99[34] = @"TotalDbSizeMB";
  v100[34] = +[NSNumber numberWithInt:*((unsigned int *)self->fStats.__ptr_ + 15)];
  v35 = +[NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:35];
  if (__p)
  {
    v40 = __p;
    operator delete(__p);
  }
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  if (v46 < 0) {
    operator delete(v45[0]);
  }
  if (v48 < 0) {
    operator delete(v47[0]);
  }
  if (v50 < 0) {
    operator delete(v49[0]);
  }
  if (v52 < 0) {
    operator delete(v51[0]);
  }
  if (v54 < 0) {
    operator delete(v53[0]);
  }
  if (v56 < 0) {
    operator delete(v55[0]);
  }
  if (v58 < 0) {
    operator delete(v57[0]);
  }
  if (v60 < 0) {
    operator delete(v59[0]);
  }
  if (v62 < 0) {
    operator delete(v61[0]);
  }
  if (v64 < 0) {
    operator delete(v63[0]);
  }
  if (v66 < 0) {
    operator delete(v65[0]);
  }
  if (v68 < 0) {
    operator delete(v67[0]);
  }
  if (v70 < 0) {
    operator delete(v69[0]);
  }
  if (v72 < 0) {
    operator delete(v71[0]);
  }
  if (v74 < 0) {
    operator delete(v73[0]);
  }
  if (v76 < 0) {
    operator delete(v75[0]);
  }
  if (v78 < 0) {
    operator delete(v77[0]);
  }
  if (v80 < 0) {
    operator delete(v79[0]);
  }
  if (v82 < 0) {
    operator delete(v81[0]);
  }
  if (v84 < 0) {
    operator delete(v83[0]);
  }
  if (v86 < 0) {
    operator delete(v85[0]);
  }
  if (v88 < 0) {
    operator delete(v87[0]);
  }
  if (v90 < 0) {
    operator delete(v89[0]);
  }
  if (v92 < 0) {
    operator delete(v91[0]);
  }
  if (v94 < 0) {
    operator delete(v93[0]);
  }
  if (v98 < 0) {
    operator delete(*(void **)buf);
  }
  [(CMHealthColdStorageService *)self logAnalytics:v35];
  if (objc_opt_class()
    && (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isHealthDataSubmissionAllowed") & 1) != 0)
  {
    AnalyticsSendEventLazy();
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v36 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "HealthColdStorage, sent Core Analytics event.", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 == -1)
      {
LABEL_89:
        LOWORD(v93[0]) = 0;
        v38 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService sendAnalytics]", "%s\n", v38);
        if (v38 != (char *)buf) {
          free(v38);
        }
        return;
      }
LABEL_95:
      dispatch_once(&qword_102419300, &stru_10230F418);
      goto LABEL_89;
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    v37 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "HealthColdStorage, not sending analytics, no IHA permission", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419300 == -1) {
        goto LABEL_89;
      }
      goto LABEL_95;
    }
  }
}

- (void)queryHealthKitWithGroup:(group *)a3
{
  ptr = self->fStats.__ptr_;
  *((_DWORD *)ptr + 13) = 0;
  *((_DWORD *)ptr + 14) = 0;
  double Current = CFAbsoluteTimeGetCurrent();
  gr_name = a3->gr_name;
  __int16 v15 = gr_name;
  if (gr_name)
  {
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  double v8 = Current + -86400.0;
  uint64_t v9 = (id *)self->fHKQueryDelegate.__ptr_;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3321888768;
  v13[2] = sub_1010C64A8;
  v13[3] = &unk_10230F378;
  v13[4] = self;
  dispatch_group_t group = (dispatch_group_t)gr_name;
  if (gr_name)
  {
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter(group);
  }
  sub_1011993CC(v9, (uint64_t)v13, v8, Current);
  int64_t v10 = (id *)self->fHKQueryDelegate.__ptr_;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3321888768;
  v11[2] = sub_1010C6C64;
  v11[3] = &unk_10230F3E8;
  v11[4] = self;
  dispatch_group_t object = (dispatch_group_t)gr_name;
  if (gr_name)
  {
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter(object);
  }
  sub_10119BA5C(v10, (uint64_t)v11, v8, Current);
  if (object)
  {
    dispatch_group_leave(object);
    if (object) {
      dispatch_release(object);
    }
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
  if (gr_name)
  {
    dispatch_group_leave((dispatch_group_t)gr_name);
    dispatch_release((dispatch_object_t)gr_name);
  }
}

- (int)getTotalDBSizeInMB
{
  sub_10053B70C(2, __p);
  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v2 = __p;
  }
  else {
    int v2 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
  }
  xpc_object_t v3 = +[NSString stringWithUTF8String:v2];
  if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p[0].__r_.__value_.__l.__data_);
  }
  id v4 = [(NSString *)v3 stringByAppendingPathComponent:@"cold_encryptedB.db"];
  std::string::size_type v13 = 0;
  id v5 = [+[NSFileManager defaultManager] attributesOfItemAtPath:v4 error:&v13];
  if (v5) {
    BOOL v6 = v13 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    unint64_t v8 = [(NSDictionary *)v5 fileSize];
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    uint64_t v9 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_INFO))
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 138543618;
      *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
      WORD2(__p[0].__r_.__value_.__r.__words[1]) = 2050;
      *(std::string::size_type *)((char *)&__p[0].__r_.__value_.__r.__words[1] + 6) = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "getTotalDBSize(%{public}@) %{public}llu bytes", (uint8_t *)__p, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_10230F418);
      }
      int v14 = 138543618;
      __int16 v15 = v4;
      __int16 v16 = 2050;
      unint64_t v17 = v8;
      int v12 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CMHealthColdStorageService getTotalDBSizeInMB]", "%s\n", (const char *)v12);
      if (v12 != __p) {
        free(v12);
      }
    }
  }
  else
  {
    if (qword_102419300 != -1) {
      dispatch_once(&qword_102419300, &stru_10230F418);
    }
    int v7 = qword_102419308;
    if (os_log_type_enabled((os_log_t)qword_102419308, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p[0].__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to get total DB size: %@", (uint8_t *)__p, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_102419300 != -1) {
        dispatch_once(&qword_102419300, &stru_10230F418);
      }
      int v14 = 138412290;
      __int16 v15 = (NSString *)v13;
      int v11 = (std::string *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CMHealthColdStorageService getTotalDBSizeInMB]", "%s\n", (const char *)v11);
      if (v11 != __p) {
        free(v11);
      }
    }
    unint64_t v8 = 0;
  }
  return (int)((double)v8 / 1000000.0);
}

- (void).cxx_destruct
{
  cntrl = self->fStats.__cntrl_;
  if (cntrl) {
    sub_1000DB0A0((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->fHKQueryDelegate.__cntrl_;
  if (v4) {
    sub_1000DB0A0((std::__shared_weak_count *)v4);
  }
  int64_t value = self->fFitnessTrackingClient.__ptr_.__value_;
  self->fFitnessTrackingClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  BOOL v6 = self->fDataProtectionClient.__ptr_.__value_;
  self->fDataProtectionClient.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(Client *, SEL))(*(void *)v6 + 8))(v6, a2);
  }

  sub_1010C7994((uint64_t *)&self->fManager, 0);
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