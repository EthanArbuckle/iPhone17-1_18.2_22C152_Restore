@interface OS_remote_device_browser
- (BOOL)canceled;
- (BOOL)canceling;
- (OS_dispatch_queue)cbq;
- (OS_xpc_object)connection;
- (id)callback;
- (unsigned)device_type;
- (void)dealloc;
- (void)setCallback:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCanceling:(BOOL)a3;
- (void)setCbq:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDevice_type:(unsigned int)a3;
@end

@implementation OS_remote_device_browser

- (void)dealloc
{
}

- (unsigned)device_type
{
  return self->_device_type;
}

- (void)setDevice_type:(unsigned int)a3
{
  self->_device_type = a3;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)cbq
{
  return self->_cbq;
}

- (void)setCbq:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (BOOL)canceling
{
  return self->_canceling;
}

- (void)setCanceling:(BOOL)a3
{
  self->_canceling = a3;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_cbq, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end