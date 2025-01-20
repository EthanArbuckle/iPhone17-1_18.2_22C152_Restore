@interface CSDClientManager
- (BOOL)isClientAllowed:(id)a3;
- (BOOL)isLocalClientActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)supportsClientAssertions;
- (CSDClient)currentClient;
- (CSDClientManager)initWithSerialQueue:(id)a3;
- (NSArray)clients;
- (NSMapTable)clientsByObject;
- (NSString)machServiceName;
- (NSString)requiredConnectionCapability;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (id)_connectionEndedHandlerForXPCClient:(id)a3 withCustomBlock:(id)a4;
- (id)_updatedQOSBlockForBlock:(id)a3;
- (id)_xpcClientForConnection:(id)a3;
- (id)asynchronousExportedObjectProxy;
- (id)clientsEntitledForCapability:(id)a3;
- (id)clientsPassingTest:(id)a3;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)synchronousExportedObjectProxy;
- (void)_performBlock:(id)a3 onClients:(id)a4;
- (void)_performBlock:(id)a3 onClients:(id)a4 coalescedByIdentifier:(id)a5;
- (void)addClient:(id)a3;
- (void)addLocalClientObject:(id)a3;
- (void)dealloc;
- (void)filterClientsEntitledForCapability:(id)a3 andPerformBlock:(id)a4;
- (void)filterClientsUsingPredicate:(id)a3 andPerformBlock:(id)a4;
- (void)filterClientsUsingPredicate:(id)a3 andPerformBlock:(id)a4 coalescedByIdentifier:(id)a5;
- (void)handleInvocation:(id)a3 synchronously:(BOOL)a4;
- (void)invalidate;
- (void)performBlockOnClients:(id)a3;
- (void)performBlockOnClients:(id)a3 coalescedByIdentifier:(id)a4;
- (void)performBlockOnQueue:(id)a3;
- (void)performBlockOnQueue:(id)a3 andWait:(BOOL)a4;
- (void)removeClient:(id)a3;
- (void)removeLocalClientObject:(id)a3;
- (void)setAsynchronousExportedObjectProxy:(id)a3;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLocalClientActive:(BOOL)a3;
- (void)setMachServiceName:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
- (void)setRequiredConnectionCapability:(id)a3;
- (void)setSupportsClientAssertions:(BOOL)a3;
- (void)setSynchronousExportedObjectProxy:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)startListeningOnMachServiceWithName:(id)a3;
@end

@implementation CSDClientManager

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(CSDClientManager *)self machServiceName];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "machServiceName: %@ newConnection: %@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v18 = 0;
  v10 = [(CSDClientManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008C7C;
  block[3] = &unk_100505DC0;
  block[4] = self;
  id v15 = v7;
  v16 = buf;
  id v11 = v7;
  dispatch_sync(v10, block);

  BOOL v12 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);

  return v12;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (BOOL)isClientAllowed:(id)a3
{
  id v4 = a3;
  v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDClientManager *)self requiredConnectionCapability];
  if (v6)
  {
    id v7 = [(CSDClientManager *)self requiredConnectionCapability];
    unsigned __int8 v8 = [v4 isEntitledForCapability:v7];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (NSString)requiredConnectionCapability
{
  return self->_requiredConnectionCapability;
}

- (void)addClient:(id)a3
{
  id v4 = a3;
  v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(CSDClientManager *)self clientsByObject];
  id v6 = [v4 object];
  [v7 setObject:v4 forKey:v6];
}

- (id)_xpcClientForConnection:(id)a3
{
  id v4 = a3;
  v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [CSDXPCClient alloc];
  id v7 = [(CSDClientManager *)self queue];
  unsigned __int8 v8 = [(CSDXPCClient *)v6 initWithConnection:v4 queue:v7];

  [(CSDXPCClient *)v8 setSupportsClientAssertions:[(CSDClientManager *)self supportsClientAssertions]];
  v9 = [(CSDClientManager *)self remoteObjectInterface];
  [v4 setRemoteObjectInterface:v9];

  v10 = [(CSDClientManager *)self exportedInterface];
  [v4 setExportedInterface:v10];

  id v11 = [(CSDClientManager *)self exportedObject];
  [v4 setExportedObject:v11];

  BOOL v12 = [(CSDClientManager *)self interruptionHandler];
  v13 = [(CSDClientManager *)self _connectionEndedHandlerForXPCClient:v8 withCustomBlock:v12];
  [v4 setInterruptionHandler:v13];

  v14 = [(CSDClientManager *)self invalidationHandler];
  id v15 = [(CSDClientManager *)self _connectionEndedHandlerForXPCClient:v8 withCustomBlock:v14];
  [v4 setInvalidationHandler:v15];

  v16 = [(CSDClientManager *)self queue];
  [v4 _setQueue:v16];

  return v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_connectionEndedHandlerForXPCClient:(id)a3 withCustomBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v8);

  objc_initWeak(&location, v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001E5174;
  v12[3] = &unk_10050A6F8;
  v12[4] = self;
  objc_copyWeak(&v14, &location);
  id v13 = v6;
  id v9 = v6;
  v10 = objc_retainBlock(v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v10;
}

- (BOOL)supportsClientAssertions
{
  return self->_supportsClientAssertions;
}

- (NSXPCInterface)remoteObjectInterface
{
  v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  remoteObjectInterface = self->_remoteObjectInterface;

  return remoteObjectInterface;
}

- (id)invalidationHandler
{
  v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_retainBlock(self->_invalidationHandler);

  return v4;
}

- (id)interruptionHandler
{
  v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_retainBlock(self->_interruptionHandler);

  return v4;
}

- (id)exportedObject
{
  v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id exportedObject = self->_exportedObject;

  return exportedObject;
}

- (NSXPCInterface)exportedInterface
{
  v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  exportedInterface = self->_exportedInterface;

  return exportedInterface;
}

- (CSDClient)currentClient
{
  id v4 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v4);

  if (![(CSDClientManager *)self isLocalClientActive])
  {
    id v13 = +[NSXPCConnection currentConnection];
    if (v13)
    {
      id v14 = [(CSDClientManager *)self clientsByObject];
      BOOL v12 = [v14 objectForKey:v13];

      if (v12)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v15 = +[NSString stringWithFormat:@"We have an active XPC connection but no corresponding CSDClient"];
      NSLog(@"** TUAssertion failure: %@", v15);

      if (_TUAssertShouldCrashApplication())
      {
        v16 = +[NSAssertionHandler currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"CSDClientManager.m" lineNumber:136 description:@"We have an active XPC connection but no corresponding CSDClient"];
      }
    }
    BOOL v12 = 0;
    goto LABEL_17;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(CSDClientManager *)self clientsByObject];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
      id v11 = [(CSDClientManager *)self clientsByObject];
      BOOL v12 = [v11 objectForKey:v10];

      if (![v12 isRemote]) {
        break;
      }

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    BOOL v12 = 0;
  }

LABEL_18:

  return (CSDClient *)v12;
}

- (NSMapTable)clientsByObject
{
  return self->_clientsByObject;
}

- (BOOL)isLocalClientActive
{
  v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_localClientActive;
}

- (CSDClientManager)initWithSerialQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDClientManager;
  id v6 = [(CSDClientManager *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    dispatch_queue_set_specific((dispatch_queue_t)v7->_queue, [(CSDClientManager *)v7 queueContext], [(CSDClientManager *)v7 queueContext], 0);
    uint64_t v8 = +[NSMapTable strongToStrongObjectsMapTable];
    clientsByObject = v7->_clientsByObject;
    v7->_clientsByObject = (NSMapTable *)v8;
  }
  return v7;
}

- (void)dealloc
{
  dispatch_queue_set_specific((dispatch_queue_t)self->_queue, [(CSDClientManager *)self queueContext], 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)CSDClientManager;
  [(CSDClientManager *)&v3 dealloc];
}

- (void)setLocalClientActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_localClientActive != v3) {
    self->_localClientActive = v3;
  }
}

- (void)setRemoteObjectInterface:(id)a3
{
  id v4 = (NSXPCInterface *)a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  remoteObjectInterface = self->_remoteObjectInterface;
  self->_remoteObjectInterface = v4;
}

- (void)setExportedInterface:(id)a3
{
  id v4 = (NSXPCInterface *)a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  exportedInterface = self->_exportedInterface;
  self->_exportedInterface = v4;
}

- (void)setInterruptionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_retainBlock(v4);
  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = v6;
}

- (void)setInvalidationHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_retainBlock(v4);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v6;
}

- (id)asynchronousExportedObjectProxy
{
  BOOL v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id asynchronousExportedObjectProxy = self->_asynchronousExportedObjectProxy;

  return asynchronousExportedObjectProxy;
}

- (void)setAsynchronousExportedObjectProxy:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id asynchronousExportedObjectProxy = self->_asynchronousExportedObjectProxy;
  self->_id asynchronousExportedObjectProxy = v4;
}

- (id)synchronousExportedObjectProxy
{
  BOOL v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id synchronousExportedObjectProxy = self->_synchronousExportedObjectProxy;

  return synchronousExportedObjectProxy;
}

- (void)setSynchronousExportedObjectProxy:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id synchronousExportedObjectProxy = self->_synchronousExportedObjectProxy;
  self->_id synchronousExportedObjectProxy = v4;
}

- (void)setExportedObject:(id)a3
{
  id v11 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_exportedObject != v11)
  {
    objc_storeStrong(&self->_exportedObject, a3);
    if (self->_exportedObject)
    {
      id v6 = [[CSDClientManagerExportedObjectProxy alloc] initWithExportedObject:self->_exportedObject];
      [(CSDClientManagerExportedObjectProxy *)v6 setClientManager:self];
      id asynchronousExportedObjectProxy = self->_asynchronousExportedObjectProxy;
      self->_id asynchronousExportedObjectProxy = v6;
      uint64_t v8 = v6;

      uint64_t v9 = [[CSDClientManagerExportedObjectProxy alloc] initWithExportedObject:self->_exportedObject];
      [(CSDClientManagerExportedObjectProxy *)v9 setClientManager:self];
      [(CSDClientManagerExportedObjectProxy *)v9 setSynchronous:1];
      id synchronousExportedObjectProxy = self->_synchronousExportedObjectProxy;
      self->_id synchronousExportedObjectProxy = v9;
    }
  }
}

- (NSArray)clients
{
  BOOL v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDClientManager *)self clientsByObject];
  id v5 = NSAllMapTableValues(v4);

  return (NSArray *)v5;
}

- (void)startListeningOnMachServiceWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDClientManager *)self setMachServiceName:v4];
  id v6 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:v4];

  [(CSDClientManager *)self setXpcListener:v6];
  id v7 = [(CSDClientManager *)self xpcListener];
  [v7 setDelegate:self];

  id v8 = [(CSDClientManager *)self xpcListener];
  [v8 resume];
}

- (void)invalidate
{
  BOOL v3 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDClientManager *)self xpcListener];
  [v4 invalidate];

  [(CSDClientManager *)self setExportedObject:0];
  [(CSDClientManager *)self setAsynchronousExportedObjectProxy:0];

  [(CSDClientManager *)self setSynchronousExportedObjectProxy:0];
}

- (void)addLocalClientObject:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [CSDClient alloc];
  id v7 = [(CSDClientManager *)self queue];
  id v8 = [(CSDClient *)v6 initWithObject:v4 queue:v7];

  [(CSDClientManager *)self addClient:v8];
}

- (void)removeLocalClientObject:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDClientManager *)self clientsByObject];
  id v7 = [v6 objectForKey:v4];

  [(CSDClientManager *)self removeClient:v7];
}

- (void)removeClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(CSDClientManager *)self clientsByObject];
  id v6 = [v4 object];

  [v7 removeObjectForKey:v6];
}

- (id)clientsPassingTest:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDClientManager *)self clients];
  if (v4)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001E4A90;
    v10[3] = &unk_10050A6A8;
    id v11 = v4;
    id v7 = +[NSPredicate predicateWithBlock:v10];
    uint64_t v8 = [v6 filteredArrayUsingPredicate:v7];

    id v6 = (void *)v8;
  }

  return v6;
}

- (id)clientsEntitledForCapability:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1001936D0(v4);

  id v7 = [(CSDClientManager *)self clientsPassingTest:v6];

  return v7;
}

- (void)performBlockOnClients:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDClientManager *)self clients];
  [(CSDClientManager *)self _performBlock:v4 onClients:v6 coalescedByIdentifier:0];
}

- (void)filterClientsUsingPredicate:(id)a3 andPerformBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDClientManager *)self clientsPassingTest:v7];

  [(CSDClientManager *)self _performBlock:v6 onClients:v9 coalescedByIdentifier:0];
}

- (void)filterClientsEntitledForCapability:(id)a3 andPerformBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v8);

  sub_1001936D0(v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(CSDClientManager *)self filterClientsUsingPredicate:v9 andPerformBlock:v6];
}

- (void)performBlockOnClients:(id)a3 coalescedByIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDClientManager *)self clients];
  [(CSDClientManager *)self _performBlock:v7 onClients:v9 coalescedByIdentifier:v6];
}

- (void)filterClientsUsingPredicate:(id)a3 andPerformBlock:(id)a4 coalescedByIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(CSDClientManager *)self clientsPassingTest:v10];

  [(CSDClientManager *)self _performBlock:v9 onClients:v12 coalescedByIdentifier:v8];
}

- (void)performBlockOnQueue:(id)a3
{
}

- (void)performBlockOnQueue:(id)a3 andWait:(BOOL)a4
{
  BOOL v4 = a4;
  block = (void (**)(void))a3;
  specific = dispatch_get_specific([(CSDClientManager *)self queueContext]);
  if (specific == [(CSDClientManager *)self queueContext])
  {
    block[2]();
  }
  else
  {
    id v7 = [(CSDClientManager *)self queue];
    id v8 = v7;
    if (v4) {
      dispatch_sync(v7, block);
    }
    else {
      dispatch_async(v7, block);
    }
  }
}

- (void)_performBlock:(id)a3 onClients:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v8);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v13), "performBlock:", v6, (void)v14);
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)_performBlock:(id)a3 onClients:(id)a4 coalescedByIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDClientManager *)self queue];
  dispatch_assert_queue_V2(v11);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v10) {
          [v17 performBlock:v8 coalescedByIdentifier:v10];
        }
        else {
          objc_msgSend(v17, "performBlock:", v8, (void)v18);
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }
}

- (id)_updatedQOSBlockForBlock:(id)a3
{
  id v3 = a3;
  if (qos_class_self() >= QOS_CLASS_DEFAULT) {
    qos_class_t v4 = qos_class_self();
  }
  else {
    qos_class_t v4 = QOS_CLASS_DEFAULT;
  }
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v4, 0, v3);

  return v5;
}

- (void)handleInvocation:(id)a3 synchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1001E53E4;
  id v11 = &unk_100504F10;
  id v12 = self;
  id v13 = a3;
  id v6 = v13;
  id v7 = [(CSDClientManager *)v12 _updatedQOSBlockForBlock:&v8];
  objc_msgSend(v6, "retainArguments", v8, v9, v10, v11, v12);
  [(CSDClientManager *)self performBlockOnQueue:v7 andWait:v4];
}

- (void)setRequiredConnectionCapability:(id)a3
{
}

- (void)setSupportsClientAssertions:(BOOL)a3
{
  self->_supportsClientAssertions = a3;
}

- (void)setMachServiceName:(id)a3
{
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
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_clientsByObject, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_requiredConnectionCapability, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong(&self->_synchronousExportedObjectProxy, 0);
  objc_storeStrong(&self->_asynchronousExportedObjectProxy, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);

  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
}

@end