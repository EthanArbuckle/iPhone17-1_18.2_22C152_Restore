@interface CBStackConnectDeviceRequest
- (CBConnection)connection;
- (OS_dispatch_source)timer;
- (id)completionHandler;
- (unint64_t)startTicks;
- (void)setCompletionHandler:(id)a3;
- (void)setConnection:(id)a3;
- (void)setStartTicks:(unint64_t)a3;
- (void)setTimer:(id)a3;
@end

@implementation CBStackConnectDeviceRequest

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (CBConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end