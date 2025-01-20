@interface RDXPCListener
+ (id)sharedListener;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)xpcListener;
- (void)setXpcListener:(id)a3;
- (void)startListening;
- (void)stopListening;
@end

@implementation RDXPCListener

+ (id)sharedListener
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000874B0;
  block[3] = &unk_1000D4E28;
  block[4] = a1;
  if (qword_1000E41E0 != -1) {
    dispatch_once(&qword_1000E41E0, block);
  }
  v2 = (void *)qword_1000E41D8;

  return v2;
}

- (void)startListening
{
  id v2 = [(RDXPCListener *)self xpcListener];
  [v2 resume];
}

- (void)stopListening
{
  id v2 = [(RDXPCListener *)self xpcListener];
  [v2 suspend];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [v4 _xpcConnection];
  __xpc_connection_set_logging();

  v6 = +[RDClient clientWithXPCConnection:v4];
  if ([v6 hasEntitlement:@"com.apple.mobile.keybagd.bubbled.sync"])
  {
    if (qword_1000E4200 != -1) {
      dispatch_once(&qword_1000E4200, &stru_1000D5CD8);
    }
    v7 = (id)qword_1000E41F8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = 0;
      unsigned int v8 = sub_100055404(1);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v8 & 0xFFFFFFFE;
      }
      if (v9)
      {
        __int16 v36 = 0;
        v10 = (const char *)_os_log_send_and_compose_impl();
        v11 = (char *)v10;
        if (v10) {
          sub_100055434(v10);
        }
      }
      else
      {
        v11 = 0;
      }
      free(v11);
    }

    if (qword_1000E4200 != -1) {
      dispatch_once(&qword_1000E4200, &stru_1000D5CD8);
    }
    v19 = (id)qword_1000E41F8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = 0;
      unsigned int v20 = sub_100055404(1);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v21 = v20;
      }
      else {
        unsigned int v21 = v20 & 0xFFFFFFFE;
      }
      if (v21)
      {
        __int16 v36 = 0;
        v22 = (const char *)_os_log_send_and_compose_impl();
        v23 = (char *)v22;
        if (v22) {
          sub_100055434(v22);
        }
      }
      else
      {
        v23 = 0;
      }
      free(v23);
    }

    v24 = +[RDServer sharedServer];
    [v24 addBubbleClient:v6];

    v25 = +[RDClient sharedBubbleXPCInterface];
    [v4 setRemoteObjectInterface:v25];

    v26 = +[RDServer sharedBubbleXPCInterface];
    [v4 setExportedInterface:v26];

    v27 = +[RDServer sharedServer];
    [v4 setExportedObject:v27];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100087B48;
    v31[3] = &unk_1000D4F98;
    v16 = &v32;
    id v32 = v6;
    [v4 setInvalidationHandler:v31];
    v17 = v30;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v18 = sub_100087BA0;
  }
  else
  {
    v12 = +[RDServer sharedServer];
    [v12 addClient:v6];

    v13 = +[RDClient sharedXPCInterface];
    [v4 setRemoteObjectInterface:v13];

    v14 = +[RDServer sharedXPCInterface];
    [v4 setExportedInterface:v14];

    v15 = +[RDServer sharedServer];
    [v4 setExportedObject:v15];

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100087A98;
    v34[3] = &unk_1000D4F98;
    v16 = &v35;
    id v35 = v6;
    [v4 setInvalidationHandler:v34];
    v17 = v33;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v18 = sub_100087AF0;
  }
  v17[2] = v18;
  v17[3] = &unk_1000D4F98;
  v17[4] = v6;
  id v28 = v6;
  [v4 setInterruptionHandler:v17];

  [v4 resume];
  return 1;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (void).cxx_destruct
{
}

@end