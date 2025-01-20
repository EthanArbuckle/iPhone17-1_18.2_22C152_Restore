@interface RDCommServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RDCommServer)init;
@end

@implementation RDCommServer

- (RDCommServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)RDCommServer;
  v2 = [(RDCommServer *)&v14 init];
  if (v2)
  {
    v3 = objc_alloc_init(RDXPCHandler);
    server = v2->server;
    v2->server = v3;

    uint64_t v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RDXPCProtocol];
    interface = v2->interface;
    v2->interface = (NSXPCInterface *)v5;

    uint64_t v7 = objc_opt_class();
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
    [(NSXPCInterface *)v2->interface setClasses:v8 forSelector:"updatePeer:withEstimate:" argumentIndex:0 ofReply:0];
    if (v2->interface)
    {
      id v9 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.countryd.update"];
      v10 = v9;
      if (v9)
      {
        [v9 setDelegate:v2];
        if (qword_1000193A8 != -1) {
          dispatch_once(&qword_1000193A8, &stru_100014A78);
        }
        v11 = qword_1000193B0;
        if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68289026;
          int v16 = 0;
          __int16 v17 = 2082;
          v18 = "";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"listener is starting connection...\"}", buf, 0x12u);
        }
        [v10 resume];
        v12 = v2;
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedInterface:self->interface];
  [v5 setExportedObject:self->server];
  if (qword_1000193A8 != -1) {
    dispatch_once(&qword_1000193A8, &stru_100014A78);
  }
  v6 = qword_1000193B0;
  if (os_log_type_enabled((os_log_t)qword_1000193B0, OS_LOG_TYPE_INFO))
  {
    v8[0] = 68289026;
    v8[1] = 0;
    __int16 v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"listener is resuming connection...\"}", (uint8_t *)v8, 0x12u);
  }
  [v5 resume];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->interface, 0);

  objc_storeStrong((id *)&self->server, 0);
}

@end