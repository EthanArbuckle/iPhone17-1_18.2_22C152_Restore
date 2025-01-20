@interface XPCNSServiceListener
- (BOOL)XPCServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)serviceName;
- (XPCNSServiceListener)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5;
- (XPCNSServiceListenerDelegate)delegate;
- (void)XPCServiceListener:(id)a3 didReceiveNewConnection:(id)a4;
- (void)shutDownCompletionBlock:(id)a3;
- (void)start;
@end

@implementation XPCNSServiceListener

- (void).cxx_destruct
{
}

- (XPCNSServiceListenerDelegate)delegate
{
  return self->_delegate;
}

- (void)XPCServiceListener:(id)a3 didReceiveNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [[XPCNSServiceConnection alloc] initWithXPCServiceConnection:v5];

  [(XPCNSServiceListenerDelegate *)self->_delegate XPCNSServiceListener:self didReceiveNewConnection:v6];
}

- (BOOL)XPCServiceListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if (objc_opt_respondsToSelector()) {
    char v6 = [(XPCNSServiceListenerDelegate *)self->_delegate XPCNSServiceListener:self shouldReceiveNewConnection:v5];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (NSString)serviceName
{
  return [(XPCServiceListener *)self->_serviceListener serviceName];
}

- (void)shutDownCompletionBlock:(id)a3
{
}

- (void)start
{
}

- (XPCNSServiceListener)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (XPCNSServiceListenerDelegate *)a5;
  v15.receiver = self;
  v15.super_class = (Class)XPCNSServiceListener;
  v11 = [(XPCNSServiceListener *)&v15 init];
  if (v11)
  {
    v12 = [[XPCServiceListener alloc] initWithServiceName:v8 queue:v9 delegate:v11];
    serviceListener = v11->_serviceListener;
    v11->_serviceListener = v12;

    v11->_delegate = v10;
  }

  return v11;
}

@end