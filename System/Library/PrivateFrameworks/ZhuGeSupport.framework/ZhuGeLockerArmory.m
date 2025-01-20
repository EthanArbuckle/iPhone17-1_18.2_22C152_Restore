@interface ZhuGeLockerArmory
- (NSXPCConnection)xpcConnection;
- (void)logHandler;
- (void)setLogHandler:(void *)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation ZhuGeLockerArmory

- (void)logHandler
{
  return self->_logHandler;
}

- (void)setLogHandler:(void *)a3
{
  self->_logHandler = a3;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end