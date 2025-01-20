@interface RMConnectionListener
- (BOOL)isEndpointConnectionAllowed:(id)a3;
- (NSMutableArray)connections;
- (NSString)deprecatedEntitlement;
- (NSString)entitlement;
- (NSString)tccService;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)listener;
- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 messageHandlerConstructor:(id)a5;
- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6;
- (id)_initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6;
- (id)messageHandlerConstructor;
- (void)endpointWasInterrupted:(id)a3;
- (void)endpointWasInvalidated:(id)a3;
- (void)invalidate;
- (void)setConnections:(id)a3;
- (void)setDeprecatedEntitlement:(id)a3;
- (void)setEntitlement:(id)a3;
- (void)setListener:(id)a3;
- (void)setMessageHandlerConstructor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTccService:(id)a3;
- (void)startListeningForService:(id)a3;
- (void)traverseEndpointsAsynchronously:(id)a3;
@end

@implementation RMConnectionListener

- (id)_initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RMConnectionListener;
  v14 = [(RMConnectionListener *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(RMConnectionListener *)v14 setQueue:v10];
    v16 = objc_opt_new();
    [(RMConnectionListener *)v15 setConnections:v16];

    [(RMConnectionListener *)v15 setMessageHandlerConstructor:v13];
    [(RMConnectionListener *)v15 setEntitlement:v11];
    [(RMConnectionListener *)v15 setTccService:v12];
  }

  return v15;
}

- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 messageHandlerConstructor:(id)a5
{
  return (RMConnectionListener *)[(RMConnectionListener *)self _initWithQueue:a3 entitlement:a4 tccService:0 messageHandlerConstructor:a5];
}

- (RMConnectionListener)initWithQueue:(id)a3 entitlement:(id)a4 tccService:(id)a5 messageHandlerConstructor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v11)
  {
    if (v12)
    {
      v14 = v13;
      v15 = [(RMConnectionListener *)self _initWithQueue:v10 entitlement:v11 tccService:v12 messageHandlerConstructor:v13];

      return v15;
    }
  }
  else
  {
    sub_100015F10();
  }
  sub_100016034();
  return (RMConnectionListener *)sub_10000BC80();
}

- (BOOL)isEndpointConnectionAllowed:(id)a3
{
  v4 = (id *)a3;
  v5 = [(RMConnectionListener *)self entitlement];

  if (v5)
  {
    v6 = [(RMConnectionListener *)self entitlement];
    LODWORD(v5) = sub_100008660(v4, v6);
  }
  v7 = [(RMConnectionListener *)self tccService];

  if (v7)
  {
    v8 = [(RMConnectionListener *)self entitlement];

    if (!v8) {
      sub_100016158();
    }
    v9 = [(RMConnectionListener *)self tccService];
    LODWORD(v7) = sub_100008D68((BOOL)v4, v9);
  }
  if (qword_10002C528 != -1) {
    dispatch_once(&qword_10002C528, &stru_100024DE8);
  }
  id v10 = qword_10002C530;
  if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "NO";
    if (v5) {
      id v12 = "YES";
    }
    else {
      id v12 = "NO";
    }
    if (v7) {
      id v11 = "YES";
    }
    int v27 = 136446466;
    v28 = v12;
    __int16 v29 = 2082;
    *(void *)v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client status: Entitled: %{public}s Authorized: %{public}s", (uint8_t *)&v27, 0x16u);
  }
  if (((v5 | v7) & 1) == 0)
  {
    id v13 = [(RMConnectionListener *)self entitlement];

    if (v13)
    {
      uint64_t v14 = [(RMConnectionListener *)self entitlement];
      if (!v14) {
        goto LABEL_25;
      }
      v15 = (void *)v14;
      v16 = [(RMConnectionListener *)self deprecatedEntitlement];

      if (!v16
        || ([(RMConnectionListener *)self deprecatedEntitlement],
            v17 = objc_claimAutoreleasedReturnValue(),
            BOOL v18 = sub_100008660(v4, v17),
            v17,
            !v18))
      {
LABEL_25:
        BOOL v25 = 0;
        goto LABEL_26;
      }
      if (qword_10002C528 != -1) {
        dispatch_once(&qword_10002C528, &stru_100024DE8);
      }
      v19 = (void *)qword_10002C530;
      if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_ERROR))
      {
        v20 = v19;
        sub_100008DC8(v4);
        v21 = (char *)objc_claimAutoreleasedReturnValue();
        unsigned int v22 = sub_100008E14(v4);
        v23 = [(RMConnectionListener *)self deprecatedEntitlement];
        v24 = [(RMConnectionListener *)self entitlement];
        int v27 = 138544131;
        v28 = v21;
        __int16 v29 = 1025;
        *(_DWORD *)v30 = v22;
        *(_WORD *)&v30[4] = 2114;
        *(void *)&v30[6] = v23;
        __int16 v31 = 2114;
        v32 = v24;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Client %{public}@ (%{private}d) uses deprecated entitlement %{public}@: please use %{public}@ instead", (uint8_t *)&v27, 0x26u);
      }
    }
  }
  BOOL v25 = 1;
LABEL_26:

  return v25;
}

- (void)startListeningForService:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 UTF8String];
  v6 = [(RMConnectionListener *)self queue];
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v5, v6, 1uLL);
  [(RMConnectionListener *)self setListener:mach_service];

  v8 = [(RMConnectionListener *)self listener];

  if (!v8) {
    sub_10001627C((uint64_t)v4);
  }
  if (qword_10002C528 != -1) {
    dispatch_once(&qword_10002C528, &stru_100024DE8);
  }
  v9 = qword_10002C530;
  if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registering handler for service: %{private}@", buf, 0xCu);
  }
  id v10 = [(RMConnectionListener *)self listener];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000C214;
  handler[3] = &unk_100024D60;
  handler[4] = self;
  xpc_connection_set_event_handler(v10, handler);

  id v11 = [(RMConnectionListener *)self listener];
  xpc_connection_resume(v11);

  if (qword_10002C528 != -1) {
    dispatch_once(&qword_10002C528, &stru_100024DE8);
  }
  id v12 = qword_10002C530;
  if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Listener started for service: %{private}@", buf, 0xCu);
  }
}

- (void)traverseEndpointsAsynchronously:(id)a3
{
  id v4 = a3;
  v5 = [(RMConnectionListener *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C748;
  v7[3] = &unk_100024D88;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)invalidate
{
  v3 = [(RMConnectionListener *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(RMConnectionListener *)self connections];
  id v5 = [v4 copy];

  [v5 enumerateObjectsUsingBlock:&stru_100024DC8];
  id v6 = [(RMConnectionListener *)self connections];
  [v6 removeAllObjects];

  v7 = [(RMConnectionListener *)self listener];
  xpc_connection_cancel(v7);

  [(RMConnectionListener *)self setListener:0];
}

- (void)endpointWasInterrupted:(id)a3
{
  id v3 = a3;
  if (qword_10002C528 != -1) {
    goto LABEL_13;
  }
  while (1)
  {
    id v4 = qword_10002C530;
    if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = &unk_10001F7FA;
      __int16 v11 = 2082;
      id v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "0";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Interruption events shouldn't be received by the daemon\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    if (qword_10002C528 != -1) {
      dispatch_once(&qword_10002C528, &stru_100024DE8);
    }
    id v5 = qword_10002C530;
    if (os_signpost_enabled((os_log_t)qword_10002C530))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = &unk_10001F7FA;
      __int16 v11 = 2082;
      id v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "0";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Interruption events shouldn't be received by the daemon", "{\"msg%{public}.0s\":\"Interruption events shouldn't be received by the daemon\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    if (qword_10002C528 != -1) {
      dispatch_once(&qword_10002C528, &stru_100024DE8);
    }
    id v6 = qword_10002C530;
    if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      int v8 = 0;
      __int16 v9 = 2082;
      id v10 = &unk_10001F7FA;
      __int16 v11 = 2082;
      id v12 = "assert";
      __int16 v13 = 2081;
      uint64_t v14 = "0";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Interruption events shouldn't be received by the daemon\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    abort_report_np();
LABEL_13:
    dispatch_once(&qword_10002C528, &stru_100024DE8);
  }
}

- (void)endpointWasInvalidated:(id)a3
{
  id v12 = (id *)a3;
  id v4 = [(RMConnectionListener *)self queue];
  dispatch_assert_queue_V2(v4);

  sub_100015E14(v12, 0);
  id v5 = sub_100014DC4(v12);

  if (v5)
  {
    id v6 = [(RMConnectionListener *)self connections];
    v7 = [RMConnectionHandlerInternal alloc];
    int v8 = sub_100014DC4(v12);
    __int16 v9 = sub_10000B90C((id *)&v7->super.isa, v12, v8);
    [v6 removeObject:v9];
  }
  else
  {
    id v10 = (RMConnectionListener *)sub_10001641C();
    [(RMConnectionListener *)v10 deprecatedEntitlement];
  }
}

- (NSString)deprecatedEntitlement
{
  return self->_deprecatedEntitlement;
}

- (void)setDeprecatedEntitlement:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (id)messageHandlerConstructor
{
  return self->_messageHandlerConstructor;
}

- (void)setMessageHandlerConstructor:(id)a3
{
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
}

- (NSString)tccService
{
  return self->_tccService;
}

- (void)setTccService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccService, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong(&self->_messageHandlerConstructor, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_deprecatedEntitlement, 0);
}

@end