@interface CHPKAnalyticsServer
+ (id)sharedAnalyticsServer;
- (BOOL)isListening;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CHPKAnalyticsServer)init;
- (NSXPCListener)listener;
- (void)dealloc;
- (void)resumeConnectionIfIdle;
- (void)setIsListening:(BOOL)a3;
- (void)setListener:(id)a3;
@end

@implementation CHPKAnalyticsServer

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CHPKAnalyticsServer;
  [(CHPKAnalyticsServer *)&v3 dealloc];
}

+ (id)sharedAnalyticsServer
{
  if (qword_10002B110 == -1)
  {
    v2 = (void *)qword_10002B108;
  }
  else
  {
    dispatch_once(&qword_10002B110, &stru_100024B30);
    v2 = (void *)qword_10002B108;
  }
  return v2;
}

- (CHPKAnalyticsServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)CHPKAnalyticsServer;
  v2 = [(CHPKAnalyticsServer *)&v6 init];
  if (v2)
  {
    objc_super v3 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.handwritingd.pkanalytics"];
    listener = v2->_listener;
    v2->_listener = v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v2->_isListening = 0;
  }
  return v2;
}

- (void)resumeConnectionIfIdle
{
  if (![(CHPKAnalyticsServer *)self isListening])
  {
    objc_super v3 = [(CHPKAnalyticsServer *)self listener];
    [v3 resume];

    [(CHPKAnalyticsServer *)self setIsListening:1];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  listener = self->_listener;
  if (listener == a3)
  {
    v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CHPKRemoteAnalyticsProtocol];
    [v6 setExportedInterface:v8];
  }
  v9 = +[CHPKPersistentAnalyticsController sharedInstance];
  [v6 setExportedObject:v9];

  [v6 resume];
  return listener == a3;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (void)setIsListening:(BOOL)a3
{
  self->_isListening = a3;
}

- (void).cxx_destruct
{
}

@end