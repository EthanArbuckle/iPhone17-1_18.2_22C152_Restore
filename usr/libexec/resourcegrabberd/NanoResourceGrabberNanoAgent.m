@interface NanoResourceGrabberNanoAgent
- (NSXPCConnection)connection;
- (NanoResourceGrabberNanoAgent)initWithConnection:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation NanoResourceGrabberNanoAgent

- (NanoResourceGrabberNanoAgent)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NanoResourceGrabberNanoAgent;
  v5 = [(NanoResourceGrabberNanoAgent *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v6;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end