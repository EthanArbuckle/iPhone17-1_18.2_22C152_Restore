@interface BKTouchDeliveryPolicyServer
+ (id)sharedServer;
- (BKSTouchDeliveryPolicy)_policy;
- (BKTouchDeliveryPolicyServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldCancelTouchesDeliveredToContextId:(unsigned int)a3 withInitialTouchTimestamp:(double)a4;
- (id)filterDestinations:(id)a3;
- (void)_queue_setPolicy:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)ipc_addPolicy:(id)a3;
- (void)run;
@end

@implementation BKTouchDeliveryPolicyServer

- (id)filterDestinations:(id)a3
{
  id v4 = a3;
  v24 = [(BKTouchDeliveryPolicyServer *)self _policy];
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v29;
    while (1)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(obj);
        }
        v12 = *(_DWORD **)(*((void *)&v28 + 1) + 8 * (void)v10);
        v13 = BKLogTouchDeliveryPolicy();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          if (v12)
          {
            int v17 = v12[2];
            if (v11) {
              goto LABEL_16;
            }
LABEL_22:
            int v18 = 0;
          }
          else
          {
            int v17 = 0;
            if (!v11) {
              goto LABEL_22;
            }
LABEL_16:
            int v18 = v11[2];
          }
          *(_DWORD *)buf = 67109376;
          int v33 = v17;
          __int16 v34 = 1024;
          int v35 = v18;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "host %X -> child %X", buf, 0xEu);
        }

        if (v11)
        {
          v25[0] = _NSConcreteStackBlock;
          v25[1] = 3221225472;
          v25[2] = sub_100009BAC;
          v25[3] = &unk_1000F92D0;
          v8 = v11;
          id v26 = v8;
          v27 = v12;
          v14 = [v24 reducePolicyToObjectWithBlock:v25];
          unsigned int v15 = [v14 BOOLValue];
          v16 = BKLogTouchDeliveryPolicy();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            if (v12) {
              int v19 = v12[2];
            }
            else {
              int v19 = 0;
            }
            int v20 = v8[2];
            *(_DWORD *)buf = 67109632;
            int v33 = v19;
            __int16 v34 = 1024;
            int v35 = v20;
            __int16 v36 = 1024;
            unsigned int v37 = v15;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%X -> %X: %{BOOL}u", buf, 0x14u);
          }

          if (!v15)
          {

            goto LABEL_27;
          }
          [v5 addObject:v12];
        }
        else
        {
          [v5 addObject:v12];
        }
        v8 = v12;

        v10 = (char *)v10 + 1;
        v11 = v8;
      }
      while (v7 != v10);
      id v21 = [obj countByEnumeratingWithState:&v28 objects:v38 count:16];
      id v7 = v21;
      if (!v21)
      {
LABEL_27:

        break;
      }
    }
  }

  return v5;
}

- (BOOL)shouldCancelTouchesDeliveredToContextId:(unsigned int)a3 withInitialTouchTimestamp:(double)a4
{
  id v6 = [(BKTouchDeliveryPolicyServer *)self _policy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100009B04;
  v10[3] = &unk_1000F9370;
  unsigned int v11 = a3;
  *(double *)&v10[4] = a4;
  id v7 = [v6 reducePolicyToObjectWithBlock:v10];
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (BKSTouchDeliveryPolicy)_policy
{
  return (BKSTouchDeliveryPolicy *)objc_getProperty(self, a2, 32, 1);
}

+ (id)sharedServer
{
  if (qword_1001231D0 != -1) {
    dispatch_once(&qword_1001231D0, &stru_1000F9140);
  }
  v2 = (void *)qword_1001231C8;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_assertionConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_setPolicy:(id)a3
{
}

- (void)ipc_addPolicy:(id)a3
{
  id v4 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A08E8;
  v10[3] = &unk_1000F91F8;
  v10[4] = self;
  id v5 = [v4 reducePolicyToObjectWithBlock:v10];
  id v6 = [(BKTouchDeliveryPolicyServer *)self _policy];
  id v7 = [v6 policyIncludingPolicy:v4];
  [(BKTouchDeliveryPolicyServer *)self _queue_setPolicy:v7];

  unsigned __int8 v8 = BKLogTouchDeliveryPolicy();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(BKTouchDeliveryPolicyServer *)self _policy];
    *(_DWORD *)buf = 138543618;
    id v12 = v4;
    __int16 v13 = 2114;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "TDPS server got new policy %{public}@, [self _policy] is now %{public}@", buf, 0x16u);
  }
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  if (sel_isEqual((SEL)[v7 selector], "ipc_addPolicy:"))
  {
    int v18 = 0;
    [v7 getArgument:&v18 atIndex:2];
    unsigned __int8 v8 = v18;
    __int16 v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    unsigned int v15 = sub_1000A0E40;
    v16 = &unk_1000F91F8;
    id v9 = v6;
    id v17 = v9;
    v10 = [v8 reducePolicyToObjectWithBlock:&v13];
    if (objc_msgSend(v10, "BOOLValue", v13, v14, v15, v16))
    {
      [v7 invoke];
    }
    else
    {
      unsigned int v11 = BKLogTouchDeliveryPolicy();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        [v9 processIdentifier];
        id v12 = BSProcessDescriptionForPID();
        *(_DWORD *)buf = 138543362;
        int v20 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "not allowing %{public}@ to include policies because it does not have appropriate permissions", buf, 0xCu);
      }
    }
  }
  else
  {
    [v7 invoke];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = BKLogTouchDeliveryPolicy();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    [v5 processIdentifier];
    id v7 = BSProcessDescriptionForPID();
    int v10 = 138543362;
    unsigned int v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TDPS server connection from %{public}@", (uint8_t *)&v10, 0xCu);
  }
  unsigned __int8 v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___BKSTouchDeliveryPolicyServerInterface];
  [v5 setExportedInterface:v8];

  [v5 setExportedObject:self];
  [v5 _setQueue:self->_queue];
  [v5 setDelegate:self];
  [v5 resume];

  return 1;
}

- (void)run
{
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BKTouchDeliveryPolicyServer;
  [(BKTouchDeliveryPolicyServer *)&v3 dealloc];
}

- (BKTouchDeliveryPolicyServer)init
{
  v13.receiver = self;
  v13.super_class = (Class)BKTouchDeliveryPolicyServer;
  v2 = [(BKTouchDeliveryPolicyServer *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[BKSTouchDeliveryPolicy policyByCombiningPolicies:&__NSArray0__struct];
    policy = v2->_policy;
    v2->_policy = (BKSTouchDeliveryPolicy *)v3;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;

    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    assertionConnections = v2->_assertionConnections;
    v2->_assertionConnections = v7;

    id v9 = objc_alloc((Class)NSXPCListener);
    int v10 = (NSXPCListener *)[v9 initWithMachServiceName:BKSTouchDeliveryPolicyServerMachServiceName];
    listener = v2->_listener;
    v2->_listener = v10;

    [(NSXPCListener *)v2->_listener _setQueue:v2->_queue];
    [(NSXPCListener *)v2->_listener setDelegate:v2];
  }
  return v2;
}

@end