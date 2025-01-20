@interface TILexiconServer
+ (id)sharedLexiconServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (TILexiconServer)init;
- (void)dealloc;
@end

@implementation TILexiconServer

+ (id)sharedLexiconServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B040;
  block[3] = &unk_10001C7E8;
  block[4] = a1;
  if (qword_100026E48 != -1) {
    dispatch_once(&qword_100026E48, block);
  }
  v2 = (void *)qword_100026E40;
  return v2;
}

- (TILexiconServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)TILexiconServer;
  v2 = [(TILexiconServer *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TextInput.lexicon-server", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc((Class)NSXPCListener);
    v7 = (NSXPCListener *)[v6 initWithMachServiceName:TILexiconServiceName];
    listener = v2->_listener;
    v2->_listener = v7;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener _setQueue:v2->_dispatchQueue];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TILexiconServer;
  [(TILexiconServer *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 _xpcConnection];
  v7 = (void *)xpc_connection_copy_bundle_id();

  if (v7)
  {
    v8 = +[NSString stringWithUTF8String:v7];
    free(v7);
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_alloc_init(TILexiconDataHandler);
  [(TILexiconDataHandler *)v9 setBundleID:v8];
  [v5 setExportedObject:v9];
  objc_super v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TILexiconRequestHandler];
  [v5 setExportedInterface:v10];

  v11 = [(TILexiconServer *)self dispatchQueue];
  [v5 _setQueue:v11];

  [v5 resume];
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end