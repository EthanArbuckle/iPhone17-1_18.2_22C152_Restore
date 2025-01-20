@interface MSVXPCTestServer
+ (id)serviceInterface;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptNewConnections;
- (MSVXPCTestServer)initWithMessage:(id)a3;
- (NSString)message;
- (void)getMessageWithBlock:(id)a3;
- (void)sendMessage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNewConnectionInterruptionHandler:(id)a3;
- (void)setNewConnectionInvalidationHandler:(id)a3;
- (void)setShouldAcceptNewConnections:(BOOL)a3;
@end

@implementation MSVXPCTestServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

- (void)setShouldAcceptNewConnections:(BOOL)a3
{
  self->_shouldAcceptNewConnections = a3;
}

- (BOOL)shouldAcceptNewConnections
{
  return self->_shouldAcceptNewConnections;
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  NSLog(@"MSVXPCTestServer received connection %@", v5);
  v6 = +[MSVXPCTestServer serviceInterface];
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 setInterruptionHandler:self->_interruptionHandler];
  [v5 setInvalidationHandler:self->_invalidationHandler];
  [v5 activate];

  return self->_shouldAcceptNewConnections;
}

- (void)getMessageWithBlock:(id)a3
{
}

- (void)sendMessage:(id)a3
{
  self->_message = (NSString *)[a3 copy];
  _objc_release_x1();
}

- (void)setNewConnectionInvalidationHandler:(id)a3
{
  self->_invalidationHandler = objc_retainBlock(a3);
  _objc_release_x1();
}

- (void)setNewConnectionInterruptionHandler:(id)a3
{
  self->_interruptionHandler = objc_retainBlock(a3);
  _objc_release_x1();
}

- (MSVXPCTestServer)initWithMessage:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MSVXPCTestServer;
  id v5 = [(MSVXPCTestServer *)&v18 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    message = v5->_message;
    v5->_message = v6;

    v5->_shouldAcceptNewConnections = 1;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100001744;
    v16[3] = &unk_100004190;
    id v8 = v4;
    id v17 = v8;
    v9 = objc_retainBlock(v16);
    id invalidationHandler = v5->_invalidationHandler;
    v5->_id invalidationHandler = v9;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100001774;
    v14[3] = &unk_100004190;
    id v15 = v8;
    v11 = objc_retainBlock(v14);
    id interruptionHandler = v5->_interruptionHandler;
    v5->_id interruptionHandler = v11;
  }
  return v5;
}

+ (id)serviceInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSVXPCTestObjectInterface];
}

@end