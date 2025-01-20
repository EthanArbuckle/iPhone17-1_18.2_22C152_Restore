@interface MSDIDSHandler
- (BOOL)isDeviceReachable;
- (BOOL)sendAck:(BOOL)a3 forRequest:(id)a4 andMessageType:(unsigned __int16)a5 completionHandler:(id)a6;
- (BOOL)sendRequestMessageOfType:(unsigned __int16)a3 withPayload:(id)a4 andResponseHandler:(id)a5;
- (BOOL)sendResponseMessageOfType:(unsigned __int16)a3 withPayload:(id)a4 forRequest:(id)a5 andCompletionHandler:(id)a6;
- (IDSService)idsService;
- (MSDIDSHandler)initWithDelegate:(id)a3;
- (MSDIDSHandlerDelegate)delegate;
- (NSMutableDictionary)responseHandlers;
- (OS_dispatch_queue)idsServiceQueue;
- (id)getPairedDevice;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setIdsServiceQueue:(id)a3;
- (void)setIsDeviceReachable:(BOOL)a3;
- (void)setResponseHandlers:(id)a3;
- (void)start;
@end

@implementation MSDIDSHandler

- (MSDIDSHandler)initWithDelegate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDIDSHandler;
  v6 = [(MSDIDSHandler *)&v10 init];
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [(MSDIDSHandler *)v6 setResponseHandlers:v7];

    if (([v5 conformsToProtocol:&OBJC_PROTOCOL___MSDIDSHandlerDelegate] & 1) == 0)
    {
      v9 = +[NSAssertionHandler currentHandler];
      [v9 handleFailureInMethod:a2 object:v6 file:@"MSDIDSHandler.m" lineNumber:48 description:@"Delegate does not conform to MSDIDSHandlerDelegate protocol."];
    }
    [(MSDIDSHandler *)v6 setDelegate:v5];
    [(MSDIDSHandler *)v6 setIsDeviceReachable:1];
  }

  return v6;
}

- (void)start
{
  id v3 = [objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.mobilestoredemo"];
  [(MSDIDSHandler *)self setIdsService:v3];

  dispatch_queue_t v4 = dispatch_queue_create("com.apple.msdidsservicequeue", 0);
  [(MSDIDSHandler *)self setIdsServiceQueue:v4];

  id v6 = [(MSDIDSHandler *)self getPairedDevice];
  id v5 = [(MSDIDSHandler *)self delegate];
  [v5 didUpdateDeviceReachability:[v6 isConnected]];
}

- (BOOL)sendAck:(BOOL)a3 forRequest:(id)a4 andMessageType:(unsigned __int16)a5 completionHandler:(id)a6
{
  uint64_t v6 = a5;
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  v13 = +[NSNumber numberWithBool:v8];
  [v12 setObject:v13 forKey:@"RequestResult"];

  LOBYTE(v6) = [(MSDIDSHandler *)self sendResponseMessageOfType:v6 withPayload:v12 forRequest:v11 andCompletionHandler:v10];
  return v6;
}

- (BOOL)sendRequestMessageOfType:(unsigned __int16)a3 withPayload:(id)a4 andResponseHandler:(id)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "About to send request of type: %ld to paired device.", buf, 0xCu);
  }

  id v26 = v8;
  if (v8)
  {
    id v30 = 0;
    id v8 = +[NSJSONSerialization dataWithJSONObject:v8 options:0 error:&v30];
    id v11 = v30;
  }
  else
  {
    id v11 = 0;
  }
  v27 = v8;
  id v12 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v8 type:v6 isResponse:0];
  id v13 = objc_alloc((Class)NSMutableDictionary);
  v31[0] = IDSSendMessageOptionTimeoutKey;
  v31[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v32[0] = &off_100162090;
  v32[1] = &__kCFBooleanTrue;
  v31[2] = IDSSendMessageOptionFireAndForgetKey;
  v32[2] = &__kCFBooleanTrue;
  v14 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  id v15 = [v13 initWithDictionary:v14];

  if (v9) {
    [v15 setObject:&__kCFBooleanTrue forKey:IDSSendMessageOptionExpectsPeerResponseKey];
  }
  v16 = self;
  v17 = [(MSDIDSHandler *)self idsService];
  v18 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v28 = v11;
  id v29 = 0;
  unsigned __int8 v19 = [v17 sendProtobuf:v12 toDestinations:v18 priority:300 options:v15 identifier:&v29 error:&v28];
  id v20 = v29;
  id v21 = v28;

  if ((v19 & 1) == 0)
  {
    v23 = sub_100068600();
    v22 = v26;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1000CCB88((uint64_t)v20, (uint64_t)v21, v23);
    }
    goto LABEL_11;
  }
  v22 = v26;
  if (v9)
  {
    v23 = [(MSDIDSHandler *)v16 responseHandlers];
    id v24 = objc_retainBlock(v9);
    [v23 setObject:v24 forKey:v20];

LABEL_11:
  }

  return v19;
}

- (BOOL)sendResponseMessageOfType:(unsigned __int16)a3 withPayload:(id)a4 forRequest:(id)a5 andCompletionHandler:(id)a6
{
  uint64_t v8 = a3;
  id v10 = a4;
  id v11 = a5;
  id v32 = a6;
  id v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "About to send response of type: %ld to paired device.", buf, 0xCu);
  }

  id v30 = v10;
  if (v10)
  {
    id v35 = 0;
    id v13 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:&v35];
    id v14 = v35;
  }
  else
  {
    id v13 = 0;
    id v14 = 0;
  }
  id v15 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v13 type:v8 isResponse:1];
  id v16 = objc_alloc((Class)NSMutableDictionary);
  v36[0] = IDSSendMessageOptionTimeoutKey;
  v36[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v37[0] = &off_100162090;
  v37[1] = &__kCFBooleanTrue;
  v36[2] = IDSSendMessageOptionFireAndForgetKey;
  v36[3] = IDSSendMessageOptionPeerResponseIdentifierKey;
  v37[2] = &__kCFBooleanTrue;
  v37[3] = v11;
  v31 = v11;
  v36[4] = IDSSendMessageOptionWantsClientAcknowledgementKey;
  v37[4] = &__kCFBooleanTrue;
  v17 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:5];
  id v18 = [v16 initWithDictionary:v17];

  unsigned __int8 v19 = self;
  id v20 = [(MSDIDSHandler *)self idsService];
  id v21 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  id v33 = v14;
  id v34 = 0;
  unsigned __int8 v22 = [v20 sendProtobuf:v15 toDestinations:v21 priority:300 options:v18 identifier:&v34 error:&v33];
  id v23 = v34;
  id v24 = v33;

  if ((v22 & 1) == 0)
  {
    v27 = sub_100068600();
    v25 = v30;
    id v26 = v32;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1000CCC10((uint64_t)v23, v24);
    }
    goto LABEL_9;
  }
  v25 = v30;
  id v26 = v32;
  if (v32)
  {
    v27 = [(MSDIDSHandler *)v19 responseHandlers];
    id v28 = objc_retainBlock(v32);
    [v27 setObject:v28 forKey:v23];

    id v26 = v32;
LABEL_9:
  }
  return v22;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  if (!a6)
  {
    id v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CCCA4((uint64_t)v10, v11);
    }

    id v13 = [(MSDIDSHandler *)self responseHandlers];
    id v14 = [v13 objectForKey:v10];

    if (v14)
    {
      v14[2](v14, 0);
      id v15 = [(MSDIDSHandler *)self responseHandlers];
      [v15 removeObjectForKey:v10];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10 = a5;
  id v7 = [(MSDIDSHandler *)self responseHandlers];
  uint64_t v8 = [v7 objectForKey:v10];

  if (v8)
  {
    v8[2](v8, 1);
    id v9 = [(MSDIDSHandler *)self responseHandlers];
    [v9 removeObjectForKey:v10];
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v7 = [(MSDIDSHandler *)self getPairedDevice];
  unsigned int v5 = [v7 isConnected];
  if (v5 != [(MSDIDSHandler *)self isDeviceReachable])
  {
    -[MSDIDSHandler setIsDeviceReachable:](self, "setIsDeviceReachable:", [v7 isConnected]);
    uint64_t v6 = [(MSDIDSHandler *)self delegate];
    [v6 didUpdateDeviceReachability:[self isDeviceReachable]];
  }
}

- (id)getPairedDevice
{
  v2 = [(MSDIDSHandler *)self idsService];
  id v3 = [v2 devices];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "isDefaultPairedDevice", (void)v10))
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (OS_dispatch_queue)idsServiceQueue
{
  return self->_idsServiceQueue;
}

- (void)setIdsServiceQueue:(id)a3
{
}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
}

- (MSDIDSHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MSDIDSHandlerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isDeviceReachable
{
  return self->_isDeviceReachable;
}

- (void)setIsDeviceReachable:(BOOL)a3
{
  self->_isDeviceReachable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_idsServiceQueue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end