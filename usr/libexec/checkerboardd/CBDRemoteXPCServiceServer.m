@interface CBDRemoteXPCServiceServer
- (CBDRemoteXPCServiceServer)initWithAllowedMessageClasses:(id)a3;
- (CBDRemoteXPCServiceServerDelegate)delegate;
- (NSSet)allowedClasses;
- (OS_dispatch_queue)messageQueue;
- (OS_dispatch_queue)serviceQueue;
- (OS_xpc_remote_connection)listener;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (void)_dispatchReceivedMessage:(id)a3 event:(id)a4 client:(id)a5;
- (void)_handleError:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)_sendReply:(id)a3 event:(id)a4 client:(id)a5;
- (void)invalidate;
- (void)resume;
- (void)setAllowedClasses:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setListener:(id)a3;
- (void)setMessageQueue:(id)a3;
- (void)setServiceQueue:(id)a3;
@end

@implementation CBDRemoteXPCServiceServer

- (CBDRemoteXPCServiceServer)initWithAllowedMessageClasses:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CBDRemoteXPCServiceServer;
  v6 = [(CBDRemoteXPCServiceServer *)&v14 init];
  v7 = v6;
  if (v6)
  {
    listener = v6->_listener;
    v6->_listener = 0;

    objc_storeStrong((id *)&v7->_allowedClasses, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.checkerboard.easyrider.xpc_listener", 0);
    serviceQueue = v7->_serviceQueue;
    v7->_serviceQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.checkerboard.easyrider.message_handler", 0);
    messageQueue = v7->_messageQueue;
    v7->_messageQueue = (OS_dispatch_queue *)v11;
  }
  return v7;
}

- (void)resume
{
  v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "start remote service", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006C98;
  v11[3] = &unk_100010468;
  objc_copyWeak(&v12, buf);
  v4 = objc_retainBlock(v11);
  id v5 = [(CBDRemoteXPCServiceServer *)self listener];

  if (!v5)
  {
    v6 = [(CBDRemoteXPCServiceServer *)self serviceQueue];
    remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener();
    [(CBDRemoteXPCServiceServer *)self setListener:remote_service_listener];

    v8 = [(CBDRemoteXPCServiceServer *)self listener];
    xpc_remote_connection_set_event_handler();

    dispatch_queue_t v9 = [(CBDRemoteXPCServiceServer *)self listener];
    xpc_remote_connection_set_local_service_version();

    v10 = [(CBDRemoteXPCServiceServer *)self listener];
    xpc_remote_connection_activate();
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);
}

- (void)invalidate
{
  v3 = [(CBDRemoteXPCServiceServer *)self listener];

  if (v3)
  {
    [(CBDRemoteXPCServiceServer *)self setListener:0];
  }
}

- (void)_handleError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 == &_xpc_error_connection_invalid)
  {
    objc_super v14 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000B198(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    v22 = [(CBDRemoteXPCServiceServer *)self invalidationHandler];

    if (v22)
    {
      uint64_t v23 = [(CBDRemoteXPCServiceServer *)self invalidationHandler];
LABEL_14:
      v33 = (void *)v23;
      (*(void (**)(void))(v23 + 16))();
    }
  }
  else
  {
    if (v4 != &_xpc_error_connection_interrupted)
    {
      v6 = xpc_copy_description(v4);
      v7 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000B208((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
      }

      free(v6);
      goto LABEL_15;
    }
    v24 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10000B1D0(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    v32 = [(CBDRemoteXPCServiceServer *)self interruptionHandler];

    if (v32)
    {
      uint64_t v23 = [(CBDRemoteXPCServiceServer *)self interruptionHandler];
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = xpc_dictionary_get_remote_connection(v4);
  v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to decode XPC object...", buf, 2u);
  }

  v7 = [(CBDRemoteXPCServiceServer *)self allowedClasses];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007218;
  v8[3] = &unk_100010490;
  id v9 = v5;
  uint64_t v10 = self;
  id v11 = v4;
  +[NSKeyedUnarchiver unarchiveObjectFromXPCObject:v11 allowedClasses:v7 completion:v8];
}

- (void)_dispatchReceivedMessage:(id)a3 event:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CBDRemoteXPCServiceServer *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(CBDRemoteXPCServiceServer *)self messageQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000749C;
    v15[3] = &unk_1000104E0;
    uint64_t v16 = v8;
    uint64_t v17 = self;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v13, v15);

    objc_super v14 = v16;
  }
  else
  {
    objc_super v14 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000B318((uint64_t)v8, self);
    }
  }
}

- (void)_sendReply:(id)a3 event:(id)a4 client:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(a4);
  +[NSKeyedArchiver archiveObject:v8 toXPCObject:reply];

  id v10 = xpc_copy_description(reply);
  id v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2080;
    uint64_t v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending reply to %@: %s", (uint8_t *)&v12, 0x16u);
  }

  free(v10);
  xpc_remote_connection_send_message();
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (CBDRemoteXPCServiceServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CBDRemoteXPCServiceServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_remote_connection)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (OS_dispatch_queue)messageQueue
{
  return self->_messageQueue;
}

- (void)setMessageQueue:(id)a3
{
}

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (void)setAllowedClasses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClasses, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_interruptionHandler, 0);

  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end