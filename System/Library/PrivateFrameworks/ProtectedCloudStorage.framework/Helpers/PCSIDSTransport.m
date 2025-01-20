@interface PCSIDSTransport
+ (id)transportWithIDSServiceName:(id)a3;
- (BOOL)serviceDelegateSet;
- (IDSService)service;
- (NSMutableDictionary)pendingReplies;
- (OS_dispatch_queue)internalQueue;
- (OS_os_transaction)transaction;
- (PCSIDSMessagingDelegate)delegate;
- (PCSIDSMessagingDeviceManager)deviceManager;
- (PCSIDSTransport)initWithServiceName:(id)a3;
- (id)copyLocalPairedDevices;
- (void)sendMessage:(id)a3 toDevice:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7 handleReply:(id)a8;
- (void)sendResponse:(id)a3 toMessage:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setServiceDelegateSet:(BOOL)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PCSIDSTransport

+ (id)transportWithIDSServiceName:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10000E7E8;
  v17 = sub_10000E7F8;
  id v18 = 0;
  if (qword_100040E40 != -1) {
    dispatch_once(&qword_100040E40, &stru_100038FB0);
  }
  v5 = qword_100040E30;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E85C;
  block[3] = &unk_100038FD8;
  id v10 = v4;
  v11 = &v13;
  id v12 = a1;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (PCSIDSTransport)initWithServiceName:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PCSIDSTransport;
  v5 = [(PCSIDSTransport *)&v17 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = objc_opt_new();
  pendingReplies = v5->_pendingReplies;
  v5->_pendingReplies = (NSMutableDictionary *)v6;

  dispatch_queue_t v8 = dispatch_queue_create("com.apple.ProtectedCloudStorage.IDSMessaging", 0);
  internalQueue = v5->_internalQueue;
  v5->_internalQueue = (OS_dispatch_queue *)v8;

  id v10 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:v4];
  service = v5->_service;
  v5->_service = v10;

  if (v5->_service)
  {
    id v12 = [(PCSIDSTransport *)v5 service];
    uint64_t v13 = [(PCSIDSTransport *)v5 internalQueue];
    [v12 addDelegate:v5 queue:v13];

LABEL_4:
    v14 = v5;
    goto LABEL_8;
  }
  uint64_t v15 = qword_100040ED8;
  if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to create IDSService for %@", buf, 0xCu);
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(PCSIDSTransport *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EB4C;
  v7[3] = &unk_100038C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setDeviceManager:(id)a3
{
  id v4 = a3;
  v5 = [(PCSIDSTransport *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000ECA4;
  v7[3] = &unk_100038C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)sendMessage:(id)a3 toDevice:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7 handleReply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(PCSIDSTransport *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EFF0;
  block[3] = &unk_100039000;
  id v27 = v16;
  id v28 = v17;
  double v29 = a6;
  id v24 = v15;
  v25 = self;
  int64_t v30 = a5;
  id v26 = v14;
  id v19 = v16;
  id v20 = v14;
  id v21 = v15;
  id v22 = v17;
  dispatch_async(v18, block);
}

- (void)sendResponse:(id)a3 toMessage:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 logDescription:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [v13 idsContext];
  unsigned __int8 v16 = [v15 expectsPeerResponse];

  if (v16)
  {
    id v17 = [(PCSIDSTransport *)self internalQueue];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000F640;
    v21[3] = &unk_100039028;
    double v26 = a6;
    id v22 = v13;
    v23 = self;
    id v24 = v12;
    int64_t v27 = a5;
    id v25 = v14;
    dispatch_async(v17, v21);
  }
  else
  {
    id v18 = (void *)qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v18;
      id v20 = [v13 message];
      *(_DWORD *)buf = 138412546;
      double v29 = v20;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Reply attempted to message that did not expect peer response: %@ -> %@", buf, 0x16u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = [v12 incomingResponseIdentifier];
  if (v13)
  {
    id v14 = [(PCSIDSTransport *)self pendingReplies];
    id v15 = [v14 objectForKeyedSubscript:v13];

    if (v15)
    {
      unsigned __int8 v16 = [[PCSIDSMessage alloc] initWithMessage:v10 idsContext:v12 fromID:v11];
      id v17 = (void *)qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        id v19 = [v12 incomingResponseIdentifier];
        id v20 = [v12 outgoingResponseIdentifier];
        int v30 = 138412546;
        id v31 = v19;
        __int16 v32 = 2112;
        v33 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received reply for message ID %@ with ID %@", (uint8_t *)&v30, 0x16u);
      }
      [(PCSIDSMessage *)v15 runReplyHandlerWithMessage:v16 error:0];
      goto LABEL_14;
    }
    int64_t v27 = (void *)qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      id v28 = v27;
      double v29 = [v12 outgoingResponseIdentifier];
      int v30 = 138412546;
      id v31 = v29;
      __int16 v32 = 2112;
      v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Got message with ID %@ with response ID %@, but no reply handler available", (uint8_t *)&v30, 0x16u);
    }
    id v25 = [(PCSIDSTransport *)self delegate];
    unsigned __int8 v16 = v25;
    double v26 = 0;
LABEL_13:
    [(PCSIDSMessage *)v25 incomingMessage:v26 fromDevice:v11];
LABEL_14:

    goto LABEL_15;
  }
  id v15 = [(PCSIDSTransport *)self delegate];
  id v21 = qword_100040ED8;
  BOOL v22 = os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v22)
    {
      v23 = v21;
      id v24 = [v12 outgoingResponseIdentifier];
      int v30 = 138412290;
      id v31 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received message with ID %@", (uint8_t *)&v30, 0xCu);
    }
    unsigned __int8 v16 = [[PCSIDSMessage alloc] initWithMessage:v10 idsContext:v12 fromID:v11];
    id v25 = v15;
    double v26 = v16;
    goto LABEL_13;
  }
  if (v22)
  {
    int v30 = 138412546;
    id v31 = v11;
    __int16 v32 = 2112;
    v33 = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Got message from %@ with id %@ with no delegate set", (uint8_t *)&v30, 0x16u);
  }
LABEL_15:
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    id v12 = [(PCSIDSTransport *)self pendingReplies];
    id v13 = [v12 objectForKeyedSubscript:v10];

    if (v13)
    {
      [v13 runReplyHandlerWithMessage:0 error:v11];
    }
    else
    {
      id v14 = qword_100040ED8;
      if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412546;
        id v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error occurred sending message %@: %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(PCSIDSTransport *)self deviceManager];
  id v7 = v6;
  if (v6)
  {
    [v6 updatedIDSDevices:v5];
  }
  else
  {
    id v8 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Got devicesChanged with no manager set", v9, 2u);
    }
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(PCSIDSTransport *)self deviceManager];
  id v7 = v6;
  if (v6)
  {
    [v6 updatedIDSDevices:v5];
  }
  else
  {
    id v8 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Got connectedDevicesChanged with no manager set", v9, 2u);
    }
  }
}

- (id)copyLocalPairedDevices
{
  v2 = [(PCSIDSTransport *)self service];
  v3 = [v2 devices];

  if (v3)
  {
    id v4 = +[NSMutableArray array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "isLocallyPaired", (void)v14)
            && [v10 isConnected])
          {
            id v11 = [[PCSDevice alloc] initWithIDSDevice:v10];
            if (v11) {
              [v4 addObject:v11];
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if ([v4 count]) {
      id v12 = v4;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (PCSIDSMessagingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PCSIDSMessagingDelegate *)WeakRetained;
}

- (NSMutableDictionary)pendingReplies
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)serviceDelegateSet
{
  return self->_serviceDelegateSet;
}

- (void)setServiceDelegateSet:(BOOL)a3
{
  self->_serviceDelegateSet = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTransaction:(id)a3
{
}

- (PCSIDSMessagingDeviceManager)deviceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceManager);
  return (PCSIDSMessagingDeviceManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceManager);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pendingReplies, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end