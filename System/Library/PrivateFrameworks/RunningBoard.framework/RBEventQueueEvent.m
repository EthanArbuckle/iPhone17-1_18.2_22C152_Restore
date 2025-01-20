@interface RBEventQueueEvent
- (double)eventTime;
- (id)action;
- (id)context;
- (id)description;
- (int64_t)compare:(id)a3;
- (void)setAction:(id)a3;
- (void)setContext:(id)a3;
- (void)setEventTime:(double)a3;
@end

@implementation RBEventQueueEvent

- (int64_t)compare:(id)a3
{
  double eventTime = self->_eventTime;
  double v4 = *((double *)a3 + 2);
  if (eventTime < v4) {
    return -1;
  }
  else {
    return eventTime > v4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong(&self->_context, 0);
}

- (id)context
{
  return self->_context;
}

- (void)setEventTime:(double)a3
{
  self->_double eventTime = a3;
}

- (void)setContext:(id)a3
{
}

- (void)setAction:(id)a3
{
}

- (double)eventTime
{
  return self->_eventTime;
}

- (id)description
{
  id v3 = [NSString alloc];
  double v4 = [(id)objc_opt_class() description];
  v5 = (void *)[v3 initWithFormat:@"<%@| context:%@ eventTime:%.2f>", v4, self->_context, *(void *)&self->_eventTime];

  return v5;
}

- (id)action
{
  return self->_action;
}

@end