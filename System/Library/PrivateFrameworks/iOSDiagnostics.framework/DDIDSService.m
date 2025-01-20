@interface DDIDSService
- (BOOL)_sendIDSMessage:(id)a3;
- (BOOL)hasDestination:(id)a3;
- (DAIDSMessageReceiver)receiver;
- (DDIDSService)initWithServiceType:(int64_t)a3;
- (IDSService)service;
- (NSMutableDictionary)messageStorage;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_destinationFromID:(id)a3;
- (id)_selfTokenFromID:(id)a3;
- (int64_t)type;
- (void)availableDestinationsWithCompletion:(id)a3;
- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setMessageStorage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceiver:(id)a3;
- (void)setService:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation DDIDSService

- (DDIDSService)initWithServiceType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DDIDSService;
  v3 = [(DDIDSService *)&v11 init];
  if (v3)
  {
    v4 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.iosdiagnostics"];
    service = v3->_service;
    v3->_service = v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Diagnostics.IDSDelegateQueue", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    [(IDSService *)v3->_service addDelegate:v3 queue:v3->_queue];
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageStorage = v3->_messageStorage;
    v3->_messageStorage = v8;
  }
  return v3;
}

- (void)sendMessage:(id)a3 data:(id)a4 toDestination:(id)a5 forceLocalDelivery:(BOOL)a6 expectsResponse:(BOOL)a7 response:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [[DDIDSOutgoingMessage alloc] initWithDestination:v15 message:v17 data:v16 forceLocalDelivery:v9 expectsResponse:v8 response:v14];

  [(DDIDSService *)self _sendIDSMessage:v18];
}

- (void)availableDestinationsWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  dispatch_queue_t v6 = [(DDIDSService *)self service];
  v7 = [v6 devices];

  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      objc_super v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [[DAIDSDestination alloc] initWithIDSDevice:*(void *)(*((void *)&v28 + 1) + 8 * (void)v11)];
        [v5 addObject:v12];

        objc_super v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  v13 = [(DDIDSService *)self service];
  id v14 = [v13 linkedDevicesWithRelationship:2];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v14;
  id v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v19);
        v21 = [DAIDSDestination alloc];
        v22 = -[DAIDSDestination initWithIDSDevice:](v21, "initWithIDSDevice:", v20, (void)v24);
        [v5 addObject:v22];

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }

  v23 = +[NSSet setWithArray:v5];
  v4[2](v4, v23);
}

- (BOOL)hasDestination:(id)a3
{
  id v4 = a3;
  v5 = [(DDIDSService *)self service];
  dispatch_queue_t v6 = [v5 linkedDevicesWithRelationship:2];

  v7 = [(DDIDSService *)self service];
  id v8 = [v7 devices];
  id v9 = [v8 arrayByAddingObjectsFromArray:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(v4, "isEqual:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v11;
}

- (BOOL)_sendIDSMessage:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  dispatch_queue_t v6 = [v4 peerResponseIdentifier];

  if (v6)
  {
    v7 = [v4 peerResponseIdentifier];
    [v5 setObject:v7 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
  }
  id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 expectsResponse]);
  [v5 setObject:v8 forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];

  [v5 setObject:&off_100019938 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
  id v9 = [(DDIDSService *)self service];
  id v10 = [v4 dictionary];
  id v11 = [v4 destination];
  uint64_t v12 = [v11 idsDestination];
  v13 = +[NSSet setWithObject:v12];
  id v31 = 0;
  id v32 = 0;
  unsigned int v14 = [v9 sendMessage:v10 toDestinations:v13 priority:300 options:v5 identifier:&v32 error:&v31];
  id v15 = v32;
  id v26 = v31;

  if (v14)
  {
    long long v16 = [(DDIDSService *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BE0C;
    block[3] = &unk_100018AB8;
    id v17 = v4;
    long long v28 = (void (**)(void, void, void, void, void))v17;
    id v18 = v15;
    id v29 = v18;
    long long v30 = self;
    dispatch_async(v16, block);

    v19 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v17 peerResponseIdentifier];
      *(_DWORD *)buf = 138412802;
      id v34 = v18;
      __int16 v35 = 2112;
      id v36 = v17;
      __int16 v37 = 2112;
      id v38 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[%@] > Outgoing message: %@, peer response identifier: %@", buf, 0x20u);
    }
    v21 = v28;
    v22 = v26;
    goto LABEL_11;
  }
  v23 = DiagnosticLogHandleForCategory();
  v22 = v26;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v4;
    __int16 v37 = 2112;
    id v38 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "[%@] Failed to send IDS message: %@, error: %@", buf, 0x20u);
  }

  long long v24 = [v4 response];

  if (v24)
  {
    v21 = [v4 response];
    ((void (**)(void, void, id, void, void))v21)[2](v21, 0, v26, 0, 0);
LABEL_11:
  }
  return v14;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  uint64_t v12 = [(DDIDSService *)self messageStorage];
  v13 = [v12 objectForKeyedSubscript:v10];

  unsigned int v14 = DiagnosticLogHandleForCategory();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      long long v16 = +[NSNumber numberWithBool:v8];
      int v23 = 138413058;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      long long v28 = v16;
      __int16 v29 = 2112;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Did send message %@, success: %@, error: %@", (uint8_t *)&v23, 0x2Au);
    }
    if (v8)
    {
      if ([v13 expectsResponse]) {
        goto LABEL_18;
      }
      id v17 = [(DDIDSService *)self messageStorage];
      [v17 removeObjectForKey:v10];
      goto LABEL_16;
    }
    id v18 = [(DDIDSService *)self messageStorage];
    [v18 removeObjectForKey:v10];

    objc_msgSend(v13, "setRetryCount:", (char *)objc_msgSend(v13, "retryCount") - 1);
    uint64_t v19 = (uint64_t)[v13 retryCount];
    id v17 = DiagnosticLogHandleForCategory();
    BOOL v20 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v19 < 1)
    {
      if (v20) {
        sub_10000DC44(v13, (uint64_t)v11, v17);
      }
LABEL_16:

      v21 = [v13 response];

      if (v21)
      {
        v22 = [v13 response];
        ((void (**)(void, BOOL, id, void, void))v22)[2](v22, v8, v11, 0, 0);
      }
      goto LABEL_18;
    }
    if (v20) {
      sub_10000DBB4(v13);
    }

    [(DDIDSService *)self _sendIDSMessage:v13];
  }
  else
  {
    if (v15)
    {
      int v23 = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%@] Invalid outgoing message", (uint8_t *)&v23, 0xCu);
    }
  }
LABEL_18:
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  v13 = [(DDIDSService *)self _destinationFromID:v11];
  if (v13)
  {
    unsigned int v14 = [[DDIDSIncomingMessage alloc] initWithIncomingDictionary:v10 destination:v13];
    if (!v14)
    {
      BOOL v15 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v12 outgoingResponseIdentifier];
        *(_DWORD *)buf = 138412546;
        v41 = v24;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%@] Invalid incoming message: %@", buf, 0x16u);
      }
      goto LABEL_20;
    }
    BOOL v15 = [v12 incomingResponseIdentifier];
    if (v15)
    {
      long long v16 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v15;
        __int16 v42 = 2112;
        id v43 = v10;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%@] < Incoming response message: %@", buf, 0x16u);
      }

      id v17 = [(DDIDSService *)self messageStorage];
      id v18 = [v17 objectForKeyedSubscript:v15];

      uint64_t v19 = [(DDIDSService *)self messageStorage];
      [v19 removeObjectForKey:v15];

      BOOL v20 = [v18 response];

      if (v20)
      {
        uint64_t v21 = [v18 response];
        v22 = [(DDIDSIncomingMessage *)v14 message];
        int v23 = [(DDIDSIncomingMessage *)v14 data];
        (*(void (**)(uint64_t, uint64_t, void, void *, void *))(v21 + 16))(v21, 1, 0, v22, v23);
      }
      else
      {
        uint64_t v21 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_DEFAULT, "[%@] No response handler for message. Dropping response.", buf, 0xCu);
        }
      }
    }
    else
    {
      __int16 v25 = [(DDIDSService *)self receiver];
      char v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0)
      {
LABEL_20:

        goto LABEL_21;
      }
      __int16 v27 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        long long v28 = [v12 outgoingResponseIdentifier];
        __int16 v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 expectsPeerResponse]);
        *(_DWORD *)buf = 138412802;
        v41 = v28;
        __int16 v42 = 2112;
        id v43 = v10;
        __int16 v44 = 2112;
        v45 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[%@] < New incoming message: %@, expects response: %@", buf, 0x20u);
      }
      id v34 = [(DDIDSService *)self receiver];
      id v30 = [(DDIDSIncomingMessage *)v14 message];
      id v31 = [(DDIDSIncomingMessage *)v14 data];
      id v32 = [(DDIDSIncomingMessage *)v14 destination];
      unsigned int v33 = [v12 expectsPeerResponse];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10000C5CC;
      v35[3] = &unk_100018AE0;
      id v36 = v14;
      id v37 = v12;
      id v38 = v10;
      v39 = self;
      [v34 receiveMessage:v30 data:v31 fromDestination:v32 expectsResponse:v33 response:v35];

      id v18 = v36;
    }

    goto LABEL_20;
  }
  DiagnosticLogHandleForCategory();
  unsigned int v14 = (DDIDSIncomingMessage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR)) {
    sub_10000DD00(v12);
  }
LABEL_21:
}

- (id)_destinationFromID:(id)a3
{
  id v4 = [(DDIDSService *)self _selfTokenFromID:a3];
  v5 = [(DDIDSService *)self service];
  dispatch_queue_t v6 = [v5 linkedDevicesWithRelationship:2];

  v7 = [(DDIDSService *)self service];
  BOOL v8 = [v7 devices];
  id v9 = [v8 arrayByAddingObjectsFromArray:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v22 != v13) {
        objc_enumerationMutation(v10);
      }
      BOOL v15 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
      long long v16 = (void *)IDSCopyForDevice();
      unsigned __int8 v17 = objc_msgSend(v16, "isEqualToString:", v4, (void)v21);

      if (v17) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v18 = v15;

    if (!v18) {
      goto LABEL_12;
    }
    uint64_t v19 = [[DAIDSDestination alloc] initWithIDSDevice:v18];
  }
  else
  {
LABEL_9:

    id v18 = 0;
LABEL_12:
    uint64_t v19 = 0;
  }

  return v19;
}

- (id)_selfTokenFromID:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (([v3 containsString:@"self-token:"] & 1) == 0)
  {
    id v5 = [v3 mutableCopy];
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"token", @"self-token", 1, 0, objc_msgSend(v5, "length"));
    id v4 = [v5 copy];
  }

  return v4;
}

- (NSString)description
{
  v2 = [(DDIDSService *)self service];
  id v3 = [v2 description];
  id v4 = +[NSString stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

- (DAIDSMessageReceiver)receiver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);

  return (DAIDSMessageReceiver *)WeakRetained;
}

- (void)setReceiver:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)messageStorage
{
  return self->_messageStorage;
}

- (void)setMessageStorage:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageStorage, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_destroyWeak((id *)&self->_receiver);
}

@end