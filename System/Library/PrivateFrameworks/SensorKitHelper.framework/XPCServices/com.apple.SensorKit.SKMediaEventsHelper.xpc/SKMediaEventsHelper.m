@interface SKMediaEventsHelper
+ (void)initialize;
- (BMStream)stream;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (OS_dispatch_queue)q;
- (SKMediaEventsHelper)initWithQueue:(id)a3;
- (SKMediaEventsHelper)initWithQueue:(id)a3 listener:(id)a4;
- (SKTCCServiceObserver)TCCObserver;
- (void)authorizationRequestStatusForMediaEventsStreamWithReply:(id)a3;
- (void)dealloc;
- (void)resume;
- (void)setListener:(id)a3;
- (void)setQ:(id)a3;
- (void)setStream:(id)a3;
- (void)setTCCObserver:(id)a3;
- (void)writeMediaEvents:(id)a3 withTimestamp:(double)a4 reply:(id)a5;
@end

@implementation SKMediaEventsHelper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_1000089A8 = (uint64_t)os_log_create("com.apple.SensorKit", "SKMediaEventsHelper");
  }
}

- (SKMediaEventsHelper)initWithQueue:(id)a3
{
  v5 = +[NSXPCListener serviceListener];
  [(NSXPCListener *)v5 _setQueue:a3];
  return [(SKMediaEventsHelper *)self initWithQueue:a3 listener:v5];
}

- (SKMediaEventsHelper)initWithQueue:(id)a3 listener:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SKMediaEventsHelper;
  v6 = [(SKMediaEventsHelper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_q = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    v8 = (NSXPCListener *)a4;
    v7->_listener = v8;
    [(NSXPCListener *)v8 setDelegate:v7];
    v7->_stream = (BMStream *)objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "Messages"), "Media"), "Rendered");
    v7->_TCCObserver = objc_alloc_init(SKTCCServiceObserver);
  }
  return v7;
}

- (void)resume
{
  v2 = [(SKMediaEventsHelper *)self listener];
  [(NSXPCListener *)v2 resume];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  dispatch_release((dispatch_object_t)self->_q);

  v3.receiver = self;
  v3.super_class = (Class)SKMediaEventsHelper;
  [(SKMediaEventsHelper *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = qword_1000089A8;
  if (os_log_type_enabled((os_log_t)qword_1000089A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got a connection attempt on com.apple.SensorKit.SKMediaEventsHelper", v8, 2u);
  }
  objc_msgSend(a4, "setExportedInterface:", +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKMediaEventsHelperProtocol));
  [a4 setExportedObject:self];
  [a4 _setQueue:self->_q];
  [a4 resume];
  return 1;
}

- (void)authorizationRequestStatusForMediaEventsStreamWithReply:(id)a3
{
  BOOL v4 = [(SKTCCServiceObserver *)[(SKMediaEventsHelper *)self TCCObserver] isMediaEventsStreamAuthorized];
  v5 = (void (*)(id, BOOL, void))*((void *)a3 + 2);
  v5(a3, v4, 0);
}

- (void)writeMediaEvents:(id)a3 withTimestamp:(double)a4 reply:(id)a5
{
  if ([(SKTCCServiceObserver *)[(SKMediaEventsHelper *)self TCCObserver] isMediaEventsStreamAuthorized])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = [a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      id v21 = a5;
      int v10 = 0;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(a3);
          }
          uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          id v14 = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", v13, v21), "BOOLValue");
          id v15 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:a4 + (double)(v10 + (int)i + 1) * 0.000001];
          id v16 = [objc_alloc((Class)BMMessagesMediaRenderedMediaAttributes) initWithUUID:v13];
          id v17 = objc_alloc((Class)BMMessagesMediaRendered);
          id v28 = v16;
          id v18 = objc_msgSend(v17, "initWithAbsoluteTimestamp:mediaAttributes:isOnScreen:isFirstView:", v15, +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1), +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v14), 0);
          objc_msgSend(-[BMStream source](-[SKMediaEventsHelper stream](self, "stream"), "source"), "sendEvent:", v18);
        }
        id v9 = [a3 countByEnumeratingWithState:&v23 objects:v29 count:16];
        v10 += (int)i;
      }
      while (v9);
      v19 = 0;
      a5 = v21;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v20 = qword_1000089A8;
    if (os_log_type_enabled((os_log_t)qword_1000089A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Media Events stream is not authorized", buf, 2u);
    }
    v19 = +[NSError errorWithDomain:@"ErrorDomain" code:0 userInfo:0];
  }
  (*((void (**)(id, NSError *))a5 + 2))(a5, v19);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setListener:(id)a3
{
}

- (BMStream)stream
{
  return (BMStream *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStream:(id)a3
{
}

- (SKTCCServiceObserver)TCCObserver
{
  return (SKTCCServiceObserver *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTCCObserver:(id)a3
{
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
}

@end