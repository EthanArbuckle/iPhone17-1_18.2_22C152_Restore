@interface CLVO2MaxSubscriptionAdapter
- (BOOL)valid;
- (CLVO2MaxSubscriptionAdapter)initWithSubscription:(void *)a3;
- (void)invalidate;
- (void)onRetrocomputeStatusUpdate:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLVO2MaxSubscriptionAdapter

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)onRetrocomputeStatusUpdate:(id)a3
{
  if (a3)
  {
    subscription = self->_subscription;
    sub_1001A37EC((uint64_t)subscription, (uint64_t)a3);
  }
  else
  {
    if (qword_102419220 != -1) {
      dispatch_once(&qword_102419220, &stru_102307A00);
    }
    v4 = qword_102419228;
    if (os_log_type_enabled((os_log_t)qword_102419228, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Attempting to notify nil retrocompute state", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419220 != -1) {
        dispatch_once(&qword_102419220, &stru_102307A00);
      }
      v5 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLVO2MaxSubscriptionAdapter onRetrocomputeStatusUpdate:]", "%s\n", v5);
      if (v5 != (char *)buf) {
        free(v5);
      }
    }
  }
}

- (CLVO2MaxSubscriptionAdapter)initWithSubscription:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLVO2MaxSubscriptionAdapter;
  v4 = [(CLVO2MaxSubscriptionAdapter *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_subscription = a3;
    [(CLVO2MaxSubscriptionAdapter *)v4 setValid:1];
  }
  return v5;
}

- (void)invalidate
{
  self->_subscription = 0;
}

@end