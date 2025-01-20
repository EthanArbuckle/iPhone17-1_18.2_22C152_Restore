@interface CLIndoorMaintenanceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CLIndoorMaintenanceDelegate)initWithService:(id)a3;
- (CLIndoorServiceDelegate)serviceDelegate;
- (OS_dispatch_queue)q;
- (void)clearTiles:(id)a3 withCallback:(id)a4;
- (void)eraseAllData:(id)a3;
- (void)numFloors:(id)a3;
- (void)prefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5;
- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3;
- (void)setQ:(id)a3;
- (void)setServiceDelegate:(id)a3;
- (void)shutdown;
@end

@implementation CLIndoorMaintenanceDelegate

- (CLIndoorMaintenanceDelegate)initWithService:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CLIndoorMaintenanceDelegate;
  v5 = [(CLIndoorMaintenanceDelegate *)&v10 init];
  if (v5
    && (dispatch_queue_t v6 = dispatch_queue_create("com.apple.pipelined.maintenance", 0),
        q = v5->_q,
        v5->_q = (OS_dispatch_queue *)v6,
        q,
        v5->_q))
  {
    v5->_shutdown = 0;
    objc_storeWeak((id *)&v5->_serviceDelegate, v4);
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)retrieveLocationRelevancyDurationWithCompletionHandler:(id)a3
{
  dispatch_queue_t v6 = (void (**)(double))a3;
  v3 = objc_alloc_init(CLIndoorTileEvictionPolicy);
  [(CLIndoorTileEvictionPolicy *)v3 maxModifiedAge];
  double v5 = v4;

  v6[2](v5);
}

- (void)prefetch:(id)a3 callback:(id)a4 when:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  v9 = (void (**)(void))a4;
  if (!+[Keybag afterFirstUserUnlock])
  {
    if (qword_10047BEF8 == -1)
    {
      v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        v9[2](v9);
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046AF78);
      v16 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
    }
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Attempt to request prefetch before first unlock - ignoring", (uint8_t *)&v17, 2u);
    goto LABEL_10;
  }
  objc_super v10 = +[NSSet setWithArray:v8];
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046AF78);
  }
  v11 = (id)qword_10047BF00;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v10 count];
    id v13 = [v8 count];
    v14 = [v8 description];
    int v17 = 134349571;
    id v18 = v12;
    __int16 v19 = 2050;
    id v20 = v13;
    __int16 v21 = 2113;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}lu/%{public}lu requests unique. Full request: %{private}@", (uint8_t *)&v17, 0x20u);
  }
  v15 = [(CLIndoorMaintenanceDelegate *)self serviceDelegate];
  [v15 prefetch:v10 callback:v9 when:v5];

LABEL_11:
}

- (void)eraseAllData:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  if (qword_10047BEF8 == -1)
  {
    dispatch_queue_t v6 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046AF78);
  dispatch_queue_t v6 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to eraseAllData", v11, 2u);
  }
LABEL_4:
  v5[2](v5);
  v7 = +[NSXPCConnection currentConnection];
  unsigned __int8 v8 = +[CLIndoorServiceDelegate validateEntitlement:@"maintenance" forConnection:v7 forSelector:a2];

  if (v8)
  {
    v9 = objc_alloc_init(CLIndoorTileEvictionPolicy);
    [(CLIndoorTileEvictionPolicy *)v9 setMaxModifiedAge:-1.79769313e308];
    objc_super v10 = [(CLIndoorMaintenanceDelegate *)self serviceDelegate];
    [v10 cancelPrefetch];
    [v10 clearTiles:v9];
    [v10 fullyVacuumAllDBs];
  }
}

- (void)clearTiles:(id)a3 withCallback:(id)a4
{
  id v7 = a3;
  unsigned __int8 v8 = (void (**)(void))a4;
  if (qword_10047BEF8 != -1) {
    dispatch_once(&qword_10047BEF8, &stru_10046AF78);
  }
  v9 = (id)qword_10047BF00;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_super v10 = [v7 description];
    int v14 = 138543362;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Request to evict tiles against policy %{public}@", (uint8_t *)&v14, 0xCu);
  }
  v8[2](v8);
  v11 = +[NSXPCConnection currentConnection];
  unsigned __int8 v12 = +[CLIndoorServiceDelegate validateEntitlement:@"maintenance" forConnection:v11 forSelector:a2];

  if (v12)
  {
    id v13 = [(CLIndoorMaintenanceDelegate *)self serviceDelegate];
    [v13 clearTiles:v7];
  }
}

- (void)shutdown
{
  if (qword_10047BEF8 == -1)
  {
    double v4 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046AF78);
  double v4 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Request to shutdown", buf, 2u);
  }
LABEL_4:
  uint64_t v5 = +[NSXPCConnection currentConnection];
  unsigned __int8 v6 = +[CLIndoorServiceDelegate validateEntitlement:@"maintenance" forConnection:v5 forSelector:a2];

  if ((v6 & 1) == 0) {
    return;
  }
  if (self->_shutdown)
  {
    if (qword_10047BEF8 == -1)
    {
      id v7 = qword_10047BF00;
      if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    dispatch_once(&qword_10047BEF8, &stru_10046AF78);
    id v7 = qword_10047BF00;
    if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
    {
LABEL_8:
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "request to shut down but already shutting down", v11, 2u);
    }
  }
LABEL_9:
  self->_shutdown = 1;
  unsigned __int8 v8 = [(CLIndoorMaintenanceDelegate *)self serviceDelegate];
  [v8 shutdown];
  if (qword_10047BEF8 != -1)
  {
    dispatch_once(&qword_10047BEF8, &stru_10046AF78);
    v9 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v9 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_WORD *)objc_super v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Requesting graceful shutdown when no transaction remains active", v10, 2u);
  }
LABEL_12:
  xpc_transaction_exit_clean();
}

- (void)numFloors:(id)a3
{
  uint64_t v5 = (void (**)(id, id))a3;
  if (qword_10047BEF8 == -1)
  {
    unsigned __int8 v6 = qword_10047BF00;
    if (!os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10047BEF8, &stru_10046AF78);
  unsigned __int8 v6 = qword_10047BF00;
  if (os_log_type_enabled((os_log_t)qword_10047BF00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)objc_super v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Request to return number of floors in the database", v10, 2u);
  }
LABEL_4:
  id v7 = +[NSXPCConnection currentConnection];
  unsigned __int8 v8 = +[CLIndoorServiceDelegate validateEntitlement:@"maintenance" forConnection:v7 forSelector:a2];

  if (v8)
  {
    v9 = [(CLIndoorMaintenanceDelegate *)self serviceDelegate];
    v5[2](v5, [v9 numFloors]);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  BOOL v7 = +[CLIndoorServiceDelegate validateEntitlement:@"maintenance" forConnection:v6 forSelector:a2];
  if (v7)
  {
    if (!self->_shutdown) {
      goto LABEL_7;
    }
    if (qword_10047BEF8 == -1)
    {
      unsigned __int8 v8 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
LABEL_6:

LABEL_7:
        if (qword_10047BEF8 == -1)
        {
          v9 = (id)qword_10047BF00;
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
LABEL_10:

            [v6 _setQueue:self->_q];
            v18[0] = objc_opt_class();
            v18[1] = objc_opt_class();
            v18[2] = objc_opt_class();
            v18[3] = objc_opt_class();
            v18[4] = objc_opt_class();
            v11 = +[NSArray arrayWithObjects:v18 count:5];
            unsigned __int8 v12 = +[NSSet setWithArray:v11];

            id v13 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CLIndoorMaintenanceProtocol];
            [v13 setClasses:v12 forSelector:"prefetch:callback:when:" argumentIndex:0 ofReply:0];
            [v6 setExportedInterface:v13];
            [v6 setExportedObject:self];
            [v6 setRemoteObjectInterface:0];
            objc_initWeak(&location, v6);
            objc_copyWeak(&to, &location);
            *(void *)&long long buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3321888768;
            id v20 = sub_100380D30;
            __int16 v21 = &unk_10046AF98;
            objc_copyWeak(&v22, &to);
            int v14 = objc_retainBlock(&buf);
            objc_destroyWeak(&v22);
            [v6 setInvalidationHandler:v14];

            objc_destroyWeak(&to);
            [v6 resume];
            objc_destroyWeak(&location);

            goto LABEL_11;
          }
        }
        else
        {
          dispatch_once(&qword_10047BEF8, &stru_10046AF78);
          v9 = (id)qword_10047BF00;
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
            goto LABEL_10;
          }
        }
        objc_super v10 = +[CLIndoorServiceDelegate versionString];
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "New XPC connection to pipelined maintenance %{public}@", (uint8_t *)&buf, 0xCu);

        goto LABEL_10;
      }
    }
    else
    {
      dispatch_once(&qword_10047BEF8, &stru_10046AF78);
      unsigned __int8 v8 = (id)qword_10047BF00;
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_6;
      }
    }
    LODWORD(buf) = 67240192;
    DWORD1(buf) = [v6 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Connection request from %{public}d postponing shutdown", (uint8_t *)&buf, 8u);
    goto LABEL_6;
  }
LABEL_11:

  return v7;
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void)setQ:(id)a3
{
}

- (CLIndoorServiceDelegate)serviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceDelegate);

  return (CLIndoorServiceDelegate *)WeakRetained;
}

- (void)setServiceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceDelegate);

  objc_storeStrong((id *)&self->_q, 0);
}

@end