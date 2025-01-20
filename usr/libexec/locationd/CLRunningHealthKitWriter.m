@interface CLRunningHealthKitWriter
- (CLRunningHealthKitWriter)init;
- (HKHealthStore)healthStore;
- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setHealthStore:(id)a3;
@end

@implementation CLRunningHealthKitWriter

- (CLRunningHealthKitWriter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLRunningHealthKitWriter;
  return [(CLRunningHealthKitWriter *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLRunningHealthKitWriter;
  [(CLRunningHealthKitWriter *)&v2 dealloc];
}

- (void)dataCollectorDidRequestCollectionThroughDate:(id)a3 completion:(id)a4
{
  if (qword_102419290 != -1) {
    dispatch_once(&qword_102419290, &stru_1022F77B8);
  }
  v6 = qword_102419298;
  if (os_log_type_enabled((os_log_t)qword_102419298, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[HealthKitWriter] Data collection requested through date %{public}@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419290 != -1) {
      dispatch_once(&qword_102419290, &stru_1022F77B8);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLRunningHealthKitWriter dataCollectorDidRequestCollectionThroughDate:completion:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  (*((void (**)(id, uint64_t, void))a4 + 2))(a4, 1, 0);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
}

@end