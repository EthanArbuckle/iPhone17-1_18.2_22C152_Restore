@interface ServiceConnection
- (void)dealloc;
- (void)didInvalidate;
@end

@implementation ServiceConnection

- (void)dealloc
{
  if (self)
  {
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    helper = self->_helper;
  }
  else
  {
    [0 invalidate];
    helper = 0;
  }
  [(STSXPCHelper *)helper invalidateWithCompletion:&stru_100054FD0];
  v4.receiver = self;
  v4.super_class = (Class)ServiceConnection;
  [(ServiceConnection *)&v4 dealloc];
}

- (void)didInvalidate
{
  if (self) {
    self = (ServiceConnection *)self->_xpcConnection;
  }
  [(ServiceConnection *)self invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helper, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end