@interface CRCarKitIAPRemoteServiceAgent
- (BOOL)_lock_wiredCarPlaySimulatorActive;
- (CRCarKitIAPRemoteServiceAgent)initWithDelegate:(id)a3;
- (CRCarPlaySimulatorDelegate)delegate;
- (NSString)connectionUUID;
- (NSString)endpointUUID;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)lockdownQueue;
- (OS_dispatch_queue)rxpcQueue;
- (OS_dispatch_source)lockdownSource;
- (OS_xpc_remote_connection)rxpcConnection;
- (OS_xpc_remote_connection)rxpcListener;
- (_lockdown_connection)lock_lockdownConnection;
- (os_unfair_lock_s)lock;
- (void)_cleanup;
- (void)_cleanupACCTransport;
- (void)_closeXPCConnection;
- (void)_handleLockdownConnection:(_lockdown_connection *)a3 info:(__CFDictionary *)a4;
- (void)_handleReads;
- (void)_handleReadsWithBlock:(id)a3;
- (void)_sendData:(const char *)a3 length:(unint64_t)a4;
- (void)_setupACCTransportClient;
- (void)_setupXPCEventHandler;
- (void)_startListeners;
- (void)setConnection:(id)a3;
- (void)setConnectionUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLock_lockdownConnection:(_lockdown_connection *)a3;
- (void)setLockdownQueue:(id)a3;
- (void)setLockdownSource:(id)a3;
- (void)setRxpcConnection:(id)a3;
- (void)setRxpcListener:(id)a3;
- (void)setRxpcQueue:(id)a3;
@end

@implementation CRCarKitIAPRemoteServiceAgent

- (CRCarKitIAPRemoteServiceAgent)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRCarKitIAPRemoteServiceAgent;
  v5 = [(CRCarKitIAPRemoteServiceAgent *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.carkit.remote_xpc_handler_queue", 0);
    rxpcQueue = v6->_rxpcQueue;
    v6->_rxpcQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.carkitd.receive", 0);
    lockdownQueue = v6->_lockdownQueue;
    v6->_lockdownQueue = (OS_dispatch_queue *)v9;

    [(CRCarKitIAPRemoteServiceAgent *)v6 _startListeners];
  }

  return v6;
}

- (_lockdown_connection)lock_lockdownConnection
{
  return self->_lock_lockdownConnection;
}

- (void)setLock_lockdownConnection:(_lockdown_connection *)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  self->_lock_lockdownConnection = a3;
  BOOL v5 = [(CRCarKitIAPRemoteServiceAgent *)self _lock_wiredCarPlaySimulatorActive];
  id v6 = [(CRCarKitIAPRemoteServiceAgent *)self delegate];
  [v6 setCarPlaySimulatorActive:v5];
}

- (void)setRxpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_rxpcConnection, a3);
  os_unfair_lock_lock(&self->_lock);
  BOOL v4 = [(CRCarKitIAPRemoteServiceAgent *)self _lock_wiredCarPlaySimulatorActive];
  os_unfair_lock_unlock(&self->_lock);
  id v5 = [(CRCarKitIAPRemoteServiceAgent *)self delegate];
  [v5 setCarPlaySimulatorActive:v4];
}

- (BOOL)_lock_wiredCarPlaySimulatorActive
{
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcConnection];

  return v3 || [(CRCarKitIAPRemoteServiceAgent *)self lock_lockdownConnection] != 0;
}

- (void)_setupACCTransportClient
{
  [(CRCarKitIAPRemoteServiceAgent *)self _cleanupACCTransport];
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up transport", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003A300;
  v11[3] = &unk_1000BE4E0;
  objc_copyWeak(&v12, buf);
  BOOL v4 = objc_retainBlock(v11);
  id v5 = sub_10003A38C();
  id v6 = [v5 sharedClient];
  dispatch_queue_t v7 = [v6 createConnectionWithType:1 andIdentifier:0];
  [(CRCarKitIAPRemoteServiceAgent *)self setConnectionUUID:v7];

  v8 = [v5 sharedClient];
  dispatch_queue_t v9 = [(CRCarKitIAPRemoteServiceAgent *)self connectionUUID];
  v10 = [v8 createEndpointWithTransportType:8 andProtocol:4 andIdentifier:0 andDataOutHandler:v4 forConnectionWithUUID:v9 publishConnection:1];
  [(CRCarKitIAPRemoteServiceAgent *)self setEndpointUUID:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

- (void)_handleLockdownConnection:(_lockdown_connection *)a3 info:(__CFDictionary *)a4
{
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting new lockdown connection", (uint8_t *)buf, 2u);
  }

  [(CRCarKitIAPRemoteServiceAgent *)self _setupACCTransportClient];
  os_unfair_lock_lock(&self->_lock);
  [(CRCarKitIAPRemoteServiceAgent *)self setLock_lockdownConnection:a3];
  os_unfair_lock_unlock(&self->_lock);
  objc_initWeak(buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003A5A8;
  v7[3] = &unk_1000BD740;
  objc_copyWeak(&v8, buf);
  [(CRCarKitIAPRemoteServiceAgent *)self _handleReadsWithBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)_handleReads
{
  bzero(v11, 0x400uLL);
  os_unfair_lock_lock(&self->_lock);
  [(CRCarKitIAPRemoteServiceAgent *)self lock_lockdownConnection];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v3 = lockdown_recv();
  if (v3 < 0)
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100073D40();
    }

    [(CRCarKitIAPRemoteServiceAgent *)self _cleanup];
  }
  else
  {
    BOOL v4 = +[NSData dataWithBytes:v11 length:v3];
    id v5 = [sub_10003A38C() sharedClient];
    id v6 = [(CRCarKitIAPRemoteServiceAgent *)self endpointUUID];
    [v5 processIncomingData:v4 forEndpointWithUUID:v6];

    dispatch_queue_t v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received bytes: %ld", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_startListeners
{
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10003AA24;
  v31[3] = &unk_1000BE508;
  objc_copyWeak(&v32, &location);
  uint64_t v3 = objc_retainBlock(v31);
  BOOL v4 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcQueue];
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener();
  [(CRCarKitIAPRemoteServiceAgent *)self setRxpcListener:remote_service_listener];

  id v6 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcListener];

  if (v6)
  {
    dispatch_queue_t v7 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcListener];
    xpc_remote_connection_set_event_handler();

    id v8 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcListener];
    xpc_remote_connection_activate();
  }
  else
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100073E58(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10003AAC0;
  v29[3] = &unk_1000BE530;
  objc_copyWeak(&v30, &location);
  v16 = objc_retainBlock(v29);
  v17 = [(CRCarKitIAPRemoteServiceAgent *)self lockdownQueue];
  int v18 = lockdown_checkin_xpc();

  if (v18)
  {
    v19 = CarGeneralLogging();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100073DE0(v18, v19);
    }

    v20 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcListener];

    if (!v20)
    {
      v21 = CarGeneralLogging();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100073DA8(v21, v22, v23, v24, v25, v26, v27, v28);
      }
    }
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

- (void)_sendData:(const char *)a3 length:(unint64_t)a4
{
  dispatch_queue_t v7 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcConnection];

  if (v7)
  {
    id v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_data(v20, "payload", a3, a4);
    id v8 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcConnection];
    xpc_remote_connection_send_message();
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ([(CRCarKitIAPRemoteServiceAgent *)self lock_lockdownConnection])
    {
      uint64_t v10 = lockdown_send();
      os_unfair_lock_unlock(&self->_lock);
      if (v10 < 0)
      {
        uint64_t v11 = CarGeneralLogging();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100073E90(v11, v12, v13, v14, v15, v16, v17, v18);
        }

        [(CRCarKitIAPRemoteServiceAgent *)self _cleanup];
      }
    }
    else
    {
      v19 = CarGeneralLogging();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "lockdown connection does not exist", buf, 2u);
      }

      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (void)_closeXPCConnection
{
  uint64_t v3 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcConnection];

  if (v3)
  {
    BOOL v4 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcConnection];
    xpc_remote_connection_cancel();

    [(CRCarKitIAPRemoteServiceAgent *)self setRxpcConnection:0];
  }
}

- (void)_setupXPCEventHandler
{
  objc_initWeak(&location, self);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  id v8 = sub_10003ADF4;
  uint64_t v9 = &unk_1000BE508;
  objc_copyWeak(&v10, &location);
  uint64_t v3 = objc_retainBlock(&v6);
  BOOL v4 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcConnection];

  if (v4)
  {
    id v5 = [(CRCarKitIAPRemoteServiceAgent *)self rxpcConnection];
    xpc_remote_connection_set_event_handler();
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_handleReadsWithBlock:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [(CRCarKitIAPRemoteServiceAgent *)self lock_lockdownConnection];
  unsigned int socket = lockdown_get_socket();
  os_unfair_lock_unlock(&self->_lock);
  if ((socket & 0x80000000) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    uint64_t v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10007400C(self, v11);
    }

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    uintptr_t v6 = socket;
    uint64_t v7 = [(CRCarKitIAPRemoteServiceAgent *)self lockdownQueue];
    dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v6, 0, v7);
    [(CRCarKitIAPRemoteServiceAgent *)self setLockdownSource:v8];

    objc_initWeak(&location, self);
    uint64_t v9 = [(CRCarKitIAPRemoteServiceAgent *)self lockdownSource];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003B2DC;
    handler[3] = &unk_1000BD7B8;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    dispatch_source_set_event_handler(v9, handler);

    id v10 = [(CRCarKitIAPRemoteServiceAgent *)self lockdownSource];
    dispatch_resume(v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)_cleanup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(CRCarKitIAPRemoteServiceAgent *)self lockdownSource];

  if (v4)
  {
    id v5 = [(CRCarKitIAPRemoteServiceAgent *)self lockdownSource];
    dispatch_source_cancel(v5);

    [(CRCarKitIAPRemoteServiceAgent *)self setLockdownSource:0];
  }
  [(CRCarKitIAPRemoteServiceAgent *)self lock_lockdownConnection];
  lockdown_disconnect();
  [(CRCarKitIAPRemoteServiceAgent *)self setLock_lockdownConnection:0];
  os_unfair_lock_unlock(p_lock);

  [(CRCarKitIAPRemoteServiceAgent *)self _cleanupACCTransport];
}

- (void)_cleanupACCTransport
{
  id v3 = sub_10003A38C();
  id v4 = [(CRCarKitIAPRemoteServiceAgent *)self endpointUUID];

  if (v4)
  {
    id v5 = CarGeneralLogging();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uintptr_t v6 = [(CRCarKitIAPRemoteServiceAgent *)self endpointUUID];
      int v18 = 138412290;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Destroying endpoint with UUID', %@", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v7 = [v3 sharedClient];
    dispatch_source_t v8 = [(CRCarKitIAPRemoteServiceAgent *)self endpointUUID];
    [v7 destroyEndpointWithUUID:v8];

    uint64_t v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(CRCarKitIAPRemoteServiceAgent *)self endpointUUID];
      uint64_t v11 = NSStringFromBOOL();
      int v18 = 138412546;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Destroying endpoint with UUID', %@. Successful?: %@", (uint8_t *)&v18, 0x16u);
    }
    [(CRCarKitIAPRemoteServiceAgent *)self setEndpointUUID:0];
  }
  uint64_t v12 = [(CRCarKitIAPRemoteServiceAgent *)self connectionUUID];

  if (v12)
  {
    id v13 = [v3 sharedClient];
    id v14 = [(CRCarKitIAPRemoteServiceAgent *)self connectionUUID];
    [v13 destroyConnectionWithUUID:v14];

    uint64_t v15 = CarGeneralLogging();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(CRCarKitIAPRemoteServiceAgent *)self connectionUUID];
      uint64_t v17 = NSStringFromBOOL();
      int v18 = 138412546;
      v19 = v16;
      __int16 v20 = 2112;
      v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Destroying connection with UUID', %@. Successful?: %@", (uint8_t *)&v18, 0x16u);
    }
    [(CRCarKitIAPRemoteServiceAgent *)self setConnectionUUID:0];
  }
}

- (CRCarPlaySimulatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRCarPlaySimulatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)rxpcQueue
{
  return self->_rxpcQueue;
}

- (void)setRxpcQueue:(id)a3
{
}

- (OS_xpc_remote_connection)rxpcListener
{
  return self->_rxpcListener;
}

- (void)setRxpcListener:(id)a3
{
}

- (OS_xpc_remote_connection)rxpcConnection
{
  return self->_rxpcConnection;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (OS_dispatch_queue)lockdownQueue
{
  return self->_lockdownQueue;
}

- (void)setLockdownQueue:(id)a3
{
}

- (OS_dispatch_source)lockdownSource
{
  return self->_lockdownSource;
}

- (void)setLockdownSource:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownSource, 0);
  objc_storeStrong((id *)&self->_lockdownQueue, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_rxpcConnection, 0);
  objc_storeStrong((id *)&self->_rxpcListener, 0);
  objc_storeStrong((id *)&self->_rxpcQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end