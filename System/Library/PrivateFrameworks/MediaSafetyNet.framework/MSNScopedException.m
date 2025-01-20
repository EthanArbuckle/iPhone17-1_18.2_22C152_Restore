@interface MSNScopedException
- (MSNScopedException)initWithConnection:(id)a3 exception:(id)a4;
- (NSString)exception;
- (NSXPCConnection)connection;
- (void)setConnection:(id)a3;
- (void)setException:(id)a3;
@end

@implementation MSNScopedException

- (MSNScopedException)initWithConnection:(id)a3 exception:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSNScopedException;
  v9 = [(MSNScopedException *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_exception, a4);
  }

  return v10;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (NSString)exception
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setException:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exception, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end