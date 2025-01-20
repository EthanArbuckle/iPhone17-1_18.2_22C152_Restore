@interface CLMiLoConnectionSubscriptionAdapter
- (BOOL)valid;
- (CLMiLoConnectionSubscriptionAdapter)initWithMiLoConnectionSubscription:(void *)a3;
- (void)onMiLoConnectionStatusEventUpdate:(id)a3;
- (void)onMiLoDebugResponse:(id)a3;
- (void)onMiLoGenericEvent:(id)a3;
- (void)onMiLoObservationMetaInfo:(id)a3;
- (void)onMiLoPredictionEventUpdate:(id)a3;
- (void)onMiLoServiceEventUpdate:(id)a3;
- (void)setSubscription:(void *)a3;
- (void)setValid:(BOOL)a3;
- (void)subscription;
@end

@implementation CLMiLoConnectionSubscriptionAdapter

- (CLMiLoConnectionSubscriptionAdapter)initWithMiLoConnectionSubscription:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMiLoConnectionSubscriptionAdapter;
  result = [(CLMiLoConnectionSubscriptionAdapter *)&v5 init];
  if (result) {
    result->_subscription = a3;
  }
  return result;
}

- (void)onMiLoServiceEventUpdate:(id)a3
{
  v4 = sub_1005C79D8(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022BD230);
    }
    v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v5[1];
      v8[0] = 68289282;
      v8[1] = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 1026;
      int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiloServiceEventUpdate\", \"miloServiceEventType data\":%{public}d}", (uint8_t *)v8, 0x18u);
    }
    sub_1005C7A38((uint64_t)self->_subscription, v5);
  }
}

- (void)onMiLoPredictionEventUpdate:(id)a3
{
  v4 = sub_1005C836C(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022BD230);
    }
    v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiloPredictionEventUpdate\"}", (uint8_t *)v7, 0x12u);
    }
    sub_1005C83CC((uint64_t)self->_subscription, v5);
  }
}

- (void)onMiLoDebugResponse:(id)a3
{
  v4 = (uint64_t *)sub_1005C854C(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022BD230);
    }
    v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiLoDebugResponse\"}", (uint8_t *)v7, 0x12u);
    }
    sub_1005C85AC((uint64_t)self->_subscription, v5);
  }
}

- (void)onMiLoConnectionStatusEventUpdate:(id)a3
{
  v4 = sub_1005C87F0(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022BD230);
    }
    v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiLoConnectionStatusEventUpdate\"}", (uint8_t *)v7, 0x12u);
    }
    sub_1005C888C((uint64_t)self->_subscription, v5);
  }
}

- (void)onMiLoObservationMetaInfo:(id)a3
{
  v4 = (uint64_t *)sub_1005C8A28(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022BD230);
    }
    v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *v5;
      v8[0] = 68289282;
      v8[1] = 0;
      __int16 v9 = 2082;
      v10 = "";
      __int16 v11 = 1026;
      int v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiLoRecordingMetaInfo\", \"event type\":%{public}d}", (uint8_t *)v8, 0x18u);
    }
    sub_1005C8A88((uint64_t)self->_subscription, (uint64_t)v5);
  }
}

- (void)onMiLoGenericEvent:(id)a3
{
  v4 = (uint64_t *)sub_1005C8D54(a3);
  if (v4)
  {
    objc_super v5 = v4;
    if (qword_102419450 != -1) {
      dispatch_once(&qword_102419450, &stru_1022BD230);
    }
    v6 = qword_102419458;
    if (os_log_type_enabled((os_log_t)qword_102419458, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289026;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"onMiLoGenericEventResponse\"}", (uint8_t *)v7, 0x12u);
    }
    sub_1005C8DB4((uint64_t)self->_subscription, v5);
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(void *)a3
{
  self->_subscription = a3;
}

@end