@interface STXPCEventObserver
- (NSDictionary)configuration;
- (NSString)identifier;
- (STXPCEventDispatcher)dispatcher;
- (STXPCEventObserver)initWithIdentifier:(id)a3 dispatcher:(id)a4;
- (id)handler;
- (void)setConfiguration:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation STXPCEventObserver

- (STXPCEventObserver)initWithIdentifier:(id)a3 dispatcher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"STXPCEventDispatcher.m", 22, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)STXPCEventObserver;
  v9 = [(STXPCEventObserver *)&v14 init];
  if (v9)
  {
    v10 = (NSString *)[v7 copy];
    identifier = v9->_identifier;
    v9->_identifier = v10;

    objc_storeWeak((id *)&v9->_dispatcher, v8);
  }

  return v9;
}

- (void)setConfiguration:(id)a3
{
  id v4 = a3;
  id v8 = [(STXPCEventObserver *)self dispatcher];
  id v5 = [v8 stream];
  [v5 UTF8String];
  id v6 = [(STXPCEventObserver *)self identifier];
  [v6 UTF8String];
  id v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_set_event();
}

- (NSDictionary)configuration
{
  v3 = [(STXPCEventObserver *)self dispatcher];
  id v4 = [v3 stream];
  [v4 UTF8String];
  id v5 = [(STXPCEventObserver *)self identifier];
  [v5 UTF8String];
  id v6 = (void *)xpc_copy_event();
  id v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();

  return (NSDictionary *)v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (STXPCEventDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);
  return (STXPCEventDispatcher *)WeakRetained;
}

- (void)setDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end