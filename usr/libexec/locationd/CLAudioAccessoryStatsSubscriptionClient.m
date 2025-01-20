@interface CLAudioAccessoryStatsSubscriptionClient
- (BOOL)valid;
- (CLAudioAccessoryStatsSubscriptionClient)initWithSubscription:(CLAudioAccessoryStatsSubscription *)a3;
- (void)invalidate;
- (void)onUsageMetricsEvent:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLAudioAccessoryStatsSubscriptionClient

- (CLAudioAccessoryStatsSubscriptionClient)initWithSubscription:(CLAudioAccessoryStatsSubscription *)a3
{
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_1022D8A28);
  }
  v5 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_INFO))
  {
    (*((void (**)(void **__return_ptr, CLAudioAccessoryStatsSubscription *))a3->var0 + 3))(__p, a3);
    v6 = v16 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[HeadphoneUsage] SubscriptionClient - initWithSubscription (%s)", buf, 0xCu);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_1022D8A28);
    }
    (*((void (**)(unsigned char *__return_ptr, CLAudioAccessoryStatsSubscription *))a3->var0 + 3))(buf, a3);
    if (v12 >= 0) {
      v8 = buf;
    }
    else {
      v8 = *(unsigned char **)buf;
    }
    int v13 = 136315138;
    v14 = v8;
    v9 = (char *)_os_log_send_and_compose_impl();
    if (v12 < 0) {
      operator delete(*(void **)buf);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryStatsSubscriptionClient initWithSubscription:]", "%s\n", v9);
    if (v9 != (char *)__p) {
      free(v9);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)CLAudioAccessoryStatsSubscriptionClient;
  result = [(CLAudioAccessoryStatsSubscriptionClient *)&v10 init];
  if (result) {
    result->_subscription = a3;
  }
  result->_valid = 1;
  return result;
}

- (void)onUsageMetricsEvent:(id)a3
{
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_1022D8A28);
  }
  v5 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_INFO))
  {
    (*((void (**)(void **__return_ptr))self->_subscription->var0 + 3))(__p);
    v6 = v17 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[HeadphoneUsage] SubscriptionClient - onUsageMetricsEvent (%s)", buf, 0xCu);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_1022D8A28);
    }
    (*((void (**)(unsigned char *__return_ptr))self->_subscription->var0 + 3))(buf);
    if (v13 >= 0) {
      v9 = buf;
    }
    else {
      v9 = *(unsigned char **)buf;
    }
    int v14 = 136315138;
    v15 = v9;
    objc_super v10 = (char *)_os_log_send_and_compose_impl();
    if (v13 < 0) {
      operator delete(*(void **)buf);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryStatsSubscriptionClient onUsageMetricsEvent:]", "%s\n", v10);
    if (v10 != (char *)__p) {
      free(v10);
    }
  }
  if (a3)
  {
    subscription = self->_subscription;
    if (subscription) {
      sub_1009ED8E0((uint64_t)subscription, a3);
    }
  }
  else
  {
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_1022D8A28);
    }
    v8 = qword_1024190E8;
    if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__p[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[HeadphoneUsage] Service Client: Nil data received", (uint8_t *)__p, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1024190E0 != -1) {
        dispatch_once(&qword_1024190E0, &stru_1022D8A28);
      }
      *(_WORD *)buf = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLAudioAccessoryStatsSubscriptionClient onUsageMetricsEvent:]", "%s\n", v11);
      if (v11 != (char *)__p) {
        free(v11);
      }
    }
  }
}

- (void)invalidate
{
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_1022D8A28);
  }
  v3 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEFAULT))
  {
    (*((void (**)(void **__return_ptr))self->_subscription->var0 + 3))(__p);
    v4 = v12 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] SubscriptionClient - invalidate (%s)", buf, 0xCu);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_1022D8A28);
    }
    (*((void (**)(unsigned char *__return_ptr))self->_subscription->var0 + 3))(buf);
    if (v8 >= 0) {
      v5 = buf;
    }
    else {
      v5 = *(unsigned char **)buf;
    }
    int v9 = 136315138;
    objc_super v10 = v5;
    v6 = (char *)_os_log_send_and_compose_impl();
    if (v8 < 0) {
      operator delete(*(void **)buf);
    }
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryStatsSubscriptionClient invalidate]", "%s\n", v6);
    if (v6 != (char *)__p) {
      free(v6);
    }
  }
  self->_valid = 0;
  self->_subscription = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end