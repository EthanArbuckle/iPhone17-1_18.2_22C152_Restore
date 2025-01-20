@interface JSATimer
- (JSManagedValue)onTimeoutManagedValue;
- (JSValue)onTimeout;
- (NSNumber)delay;
- (OS_dispatch_source)source;
- (void)cancel;
- (void)dealloc;
- (void)schedule;
- (void)setDelay:(id)a3;
- (void)setOnTimeout:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation JSATimer

- (void)dealloc
{
  v3 = [(JSManagedValue *)self->_onTimeoutManagedValue value];
  v4 = [v3 context];
  v5 = [v4 virtualMachine];
  [v5 removeManagedReference:self->_onTimeoutManagedValue withOwner:self];

  v6.receiver = self;
  v6.super_class = (Class)JSATimer;
  [(JSATimer *)&v6 dealloc];
}

- (void)schedule
{
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  [(JSATimer *)self setSource:v3];
  delay = self->_delay;
  if (!delay)
  {
    self->_delay = (NSNumber *)&off_B9B08;

    delay = self->_delay;
  }
  [(NSNumber *)delay doubleValue];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_source_set_timer(v3, v6, v7, 0x5F5E100uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_14A54;
  handler[3] = &unk_B2000;
  handler[4] = self;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(v3);
}

- (void)cancel
{
  v3 = [(JSATimer *)self source];

  if (v3)
  {
    v4 = [(JSATimer *)self source];
    dispatch_source_cancel(v4);

    [(JSATimer *)self setSource:0];
  }
}

- (JSValue)onTimeout
{
  return [(JSManagedValue *)self->_onTimeoutManagedValue value];
}

- (void)setOnTimeout:(id)a3
{
  onTimeoutManagedValue = self->_onTimeoutManagedValue;
  id v5 = a3;
  dispatch_time_t v6 = [(JSManagedValue *)onTimeoutManagedValue value];
  uint64_t v7 = [v6 context];
  v8 = [v7 virtualMachine];
  [v8 removeManagedReference:self->_onTimeoutManagedValue withOwner:self];

  v9 = +[JSManagedValue managedValueWithValue:v5 andOwner:self];

  v10 = self->_onTimeoutManagedValue;
  self->_onTimeoutManagedValue = v9;
}

- (NSNumber)delay
{
  return self->_delay;
}

- (void)setDelay:(id)a3
{
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (JSManagedValue)onTimeoutManagedValue
{
  return self->_onTimeoutManagedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onTimeoutManagedValue, 0);
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_delay, 0);
}

@end