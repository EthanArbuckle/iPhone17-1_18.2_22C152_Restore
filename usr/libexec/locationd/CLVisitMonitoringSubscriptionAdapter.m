@interface CLVisitMonitoringSubscriptionAdapter
- (BOOL)valid;
- (CLVisitMonitoringSubscriptionAdapter)initWithSubscription:(void *)a3;
- (void)invalidate;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLVisitMonitoringSubscriptionAdapter

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (CLVisitMonitoringSubscriptionAdapter)initWithSubscription:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLVisitMonitoringSubscriptionAdapter;
  v4 = [(CLVisitMonitoringSubscriptionAdapter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_subscription = a3;
    [(CLVisitMonitoringSubscriptionAdapter *)v4 setValid:1];
  }
  return v5;
}

- (void)onVisit:(id)a3
{
  if (a3)
  {
    subscription = self->_subscription;
    sub_1014FA27C((uint64_t)subscription, a3);
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10232B598);
    }
    v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#slv Attempting to notify nil visit\"}", (uint8_t *)&v6, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10232B598);
      }
    }
    v5 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#slv Attempting to notify nil visit", "{\"msg%{public}.0s\":\"#slv Attempting to notify nil visit\"}", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (void)invalidate
{
}

- (BOOL)valid
{
  return self->_valid;
}

@end