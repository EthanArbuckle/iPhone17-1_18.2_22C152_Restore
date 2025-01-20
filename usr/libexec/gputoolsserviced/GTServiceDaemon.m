@interface GTServiceDaemon
- (BOOL)deviceIsHandledLocally:(id)a3;
- (GTServiceDaemon)init;
- (id)connectionForDeviceUDID:(id)a3;
- (id)connectionForServicePort:(unint64_t)a3;
- (unint64_t)currentRemoteRelayPid;
- (void)broadcastDisconnection:(id)a3 connectionId:(unint64_t)a4;
- (void)enterRunLoop;
- (void)handleConnection:(id)a3;
- (void)handleDisconnection:(id)a3;
- (void)handleMessage:(id)a3 fromConnection:(id)a4;
- (void)handleMessageBroadcast:(id)a3 fromConnection:(id)a4;
- (void)handleMessageDaemon:(id)a3 fromConnection:(id)a4;
- (void)patchMessage:(id)a3;
- (void)registerServices;
- (void)relayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5;
- (void)updateAndRelayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5;
- (void)updateMessage:(id)a3 sourceConnection:(id)a4;
- (void)updateMessagePath:(id)a3 sourceConnection:(id)a4;
@end

@implementation GTServiceDaemon

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceVendor, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connectionMap, 0);
  objc_storeStrong((id *)&self->_portToConnection, 0);
  objc_storeStrong((id *)&self->_portToDispatcher, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_daemonId, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (unint64_t)currentRemoteRelayPid
{
  return self->_currentRemoteRelayPid;
}

- (id)connectionForServicePort:(unint64_t)a3
{
  portToConnection = self->_portToConnection;
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  v5 = [(NSMutableDictionary *)portToConnection objectForKeyedSubscript:v4];

  return v5;
}

- (id)connectionForDeviceUDID:(id)a3
{
  if (!a3)
  {
    v11 = 0;
    goto LABEL_19;
  }
  v4 = [(GTServiceProvider *)self->_serviceProvider allServices];
  v5 = filteredArrayByService(v4, (Protocol *)&OBJC_PROTOCOL___GTRemoteDeviceRelay);

  if ([v5 count])
  {
    if ([v5 count] == (id)1)
    {
      portToConnection = self->_portToConnection;
      v7 = [v5 firstObject];
      v8 = [v7 serviceProperties];
      v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 servicePort]);
      v10 = [(NSMutableDictionary *)portToConnection objectForKeyedSubscript:v9];

      v11 = [[GTRelayedXPCConnection alloc] initWithConnection:v10 relayPort:self->_currentRemoteRelayPort relayPid:LODWORD(self->_currentRemoteRelayPid)];
LABEL_17:

      goto LABEL_18;
    }
    v10 = filteredArrayByPort(v5, self->_currentRemoteRelayPort);
    if ([v10 count])
    {
      if ([v10 count] != (id)1)
      {
        v17 = filteredArrayByPID(v10, self->_currentRemoteRelayPid);
        if ([v17 count])
        {
          [v17 count];
          v18 = self->_portToConnection;
          v19 = v17;
        }
        else
        {
          v18 = self->_portToConnection;
          v19 = v10;
        }
        v20 = [v19 firstObject];
        v21 = [v20 serviceProperties];
        v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v21 servicePort]);
        v23 = [(NSMutableDictionary *)v18 objectForKeyedSubscript:v22];

        v11 = [[GTRelayedXPCConnection alloc] initWithConnection:v23 relayPort:self->_currentRemoteRelayPort relayPid:LODWORD(self->_currentRemoteRelayPid)];
        goto LABEL_16;
      }
      v12 = self->_portToConnection;
      v13 = v10;
    }
    else
    {
      v12 = self->_portToConnection;
      v13 = v5;
    }
    v14 = [v13 firstObject];
    v15 = [v14 serviceProperties];
    v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v15 servicePort]);
    v17 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v16];

    v11 = [[GTRelayedXPCConnection alloc] initWithConnection:v17 relayPort:self->_currentRemoteRelayPort relayPid:LODWORD(self->_currentRemoteRelayPid)];
LABEL_16:

    goto LABEL_17;
  }
  v11 = 0;
LABEL_18:

LABEL_19:

  return v11;
}

- (void)updateAndRelayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(GTServiceDaemon *)self updateMessage:v10 sourceConnection:v9];
  [(GTServiceDaemon *)self relayMessage:v10 fromConnection:v9 toConnection:v8];
}

- (void)relayMessage:(id)a3 fromConnection:(id)a4 toConnection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (MessageHasReply(v8))
  {
    gt_xpc_dictionary_create_reply(v8);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001BEE0;
    v12[3] = &unk_100034EE0;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = self;
    id v15 = v10;
    id v16 = v9;
    id v11 = v13;
    [v15 sendMessage:v8 replyHandler:v12];
  }
  else
  {
    [v10 sendMessage:v8];
  }
}

- (void)updateMessage:(id)a3 sourceConnection:(id)a4
{
  id v6 = a3;
  [(GTServiceDaemon *)self updateMessagePath:v6 sourceConnection:a4];
  [(GTServiceDaemon *)self patchMessage:v6];
}

- (void)patchMessage:(id)a3
{
  id v4 = a3;
  if (xpc_dictionary_get_flag(v4, "_flags", 5))
  {
    v5 = xpc_dictionary_get_value(v4, "response");

    if (v5)
    {
      uint64_t v6 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v4, "response", v6);
      if (nsobject)
      {
        id v8 = objc_alloc((Class)NSSet);
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_opt_class();
        id v13 = [v8 initWithObjects:v9, v10, v11, v12, objc_opt_class(), 0];
        v14 = [nsobject data];
        id v15 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v13 fromData:v14 error:0];
        id v16 = [v15 mutableCopy];

        if (v16)
        {
          v17 = [v16 objectForKeyedSubscript:@"archiveURL"];
          v18 = v17;
          if (v17)
          {
            v19 = [v17 host];
            unsigned int v20 = [v19 isEqualToString:@"localhost"];

            if (v20)
            {
              v21 = +[NSURLComponents componentsWithURL:v18 resolvingAgainstBaseURL:1];
              v22 = +[GTDeviceProperties uniqueDeviceID];
              [v21 setHost:v22];

              v23 = [v21 URL];
              [v16 setObject:v23 forKeyedSubscript:@"archiveURL"];

              id v28 = 0;
              v24 = +[NSKeyedArchiver archivedDataWithRootObject:v16 requiringSecureCoding:1 error:&v28];
              id v25 = v28;
              [nsobject setData:v24];

              v26 = [nsobject data];

              if (!v26)
              {
                log = self->_log;
                if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v30 = v25;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "Failed to patch message, %@", buf, 0xCu);
                }
                [nsobject setError:v25];
              }
              xpc_dictionary_set_nsobject(v4, "response", (uint64_t)nsobject);
            }
          }
        }
      }
    }
  }
}

- (void)updateMessagePath:(id)a3 sourceConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MessageRecordsPathHistory(v6))
  {
    uint64_t v10 = 0;
    if ([(GTConnectionMap *)self->_connectionMap retrieveId:&v10 forConnection:v7])
    {
      MessagePathPush(v6, v10);
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "Missing ID for active connection", v9, 2u);
      }
    }
  }
}

- (void)handleMessageBroadcast:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (MessageVisit(v6, [(NSString *)self->_daemonId UTF8String]))
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Handle broadcast", buf, 2u);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v9 = self->_portToDispatcher;
    id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v31;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [(NSMutableDictionary *)self->_portToDispatcher objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          [v14 dispatchMessage:v6 replyConnection:v7];
        }
        id v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v11);
    }

    *(void *)buf = 0;
    if ([(GTConnectionMap *)self->_connectionMap retrieveId:buf forConnection:v7])
    {
      [(GTServiceDaemon *)self updateMessage:v6 sourceConnection:v7];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v15 = [(GTConnectionMap *)self->_connectionMap connections];
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        do
        {
          for (j = 0; j != v17; j = (char *)j + 1)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            unsigned int v20 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
            v21 = [v20 connection];
            v22 = [v7 connection];

            if (v21 != v22) {
              [(GTServiceDaemon *)self relayMessage:v6 fromConnection:v7 toConnection:v20];
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v25 objects:v34 count:16];
        }
        while (v17);
      }
    }
    else
    {
      v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v24 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "Missing ID for active connection", v24, 2u);
      }
    }
  }
}

- (void)handleMessageDaemon:(id)a3 fromConnection:(id)a4
{
  xpc_object_t xdict = a3;
  id v5 = a4;
  if (xpc_dictionary_get_uint64(xdict, "_daemon") == 1)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    id v7 = objc_opt_new();
    xpc_dictionary_set_nsobject(reply, "processInfo", (uint64_t)v7);
  }
  else
  {
    if (!MessageHasReply(xdict)) {
      goto LABEL_6;
    }
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
  }
  [v5 sendMessage:reply];

LABEL_6:
}

- (void)handleMessage:(id)a3 fromConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v29 = 0;
  BOOL IsValid = MessageIsValid(v6, &v29);
  id v9 = v29;
  if (IsValid)
  {
    self->_currentRemoteRelayPort = xpc_dictionary_get_uint64(v6, "_remoteDeviceRelayPort");
    self->_currentRemoteRelayPid = xpc_dictionary_get_uint64(v6, "_remoteDeviceRelayPid");
    if (xpc_dictionary_get_flag(v6, "_flags", 3))
    {
      [(GTServiceDaemon *)self handleMessageDaemon:v6 fromConnection:v7];
      goto LABEL_26;
    }
    if (xpc_dictionary_get_flag(v6, "_flags", 1))
    {
      [(GTServiceDaemon *)self handleMessageBroadcast:v6 fromConnection:v7];
      goto LABEL_26;
    }
    if (MessageIsStreamReply(v6))
    {
      uint64_t v11 = MessagePathPop(v6);
      connectionMap = self->_connectionMap;
      id v28 = 0;
      unsigned int v13 = [(GTConnectionMap *)connectionMap retrieveConnection:&v28 forId:v11];
      id v14 = v28;
      if (!v13)
      {
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v33 = v11;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "Missing connection for ID: %llu", buf, 0xCu);
        }
        goto LABEL_25;
      }
      goto LABEL_17;
    }
    if (![(GTServiceDaemon *)self deviceIsHandledLocally:v6])
    {
      sub_10001CBBC(v6);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [(GTServiceDaemon *)self connectionForDeviceUDID:v14];
      if (v16)
      {
        id v17 = (void *)v16;
        [(GTServiceDaemon *)self updateAndRelayMessage:v6 fromConnection:v7 toConnection:v16];
        goto LABEL_24;
      }
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "_port");
    portToConnection = self->_portToConnection;
    unsigned int v20 = +[NSNumber numberWithUnsignedLongLong:uint64];
    id v14 = [(NSMutableDictionary *)portToConnection objectForKeyedSubscript:v20];

    if (v14)
    {
LABEL_17:
      [(GTServiceDaemon *)self updateAndRelayMessage:v6 fromConnection:v7 toConnection:v14];
LABEL_25:

      goto LABEL_26;
    }
    portToDispatcher = self->_portToDispatcher;
    v22 = +[NSNumber numberWithUnsignedLongLong:uint64];
    id v17 = [(NSMutableDictionary *)portToDispatcher objectForKeyedSubscript:v22];

    if (v17)
    {
      [v17 dispatchMessage:v6 replyConnection:v7];
    }
    else
    {
      v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v33 = uint64;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEBUG, "Message unhandled - servicePort:%llu", buf, 0xCu);
      }
      if (MessageHasReply(v6))
      {
        v24 = gt_xpc_dictionary_create_reply(v6);
        NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
        long long v25 = +[NSString stringWithFormat:@"Target destination for message doesn't exist"];
        long long v31 = v25;
        long long v26 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        long long v27 = +[NSError errorWithDomain:@"com.apple.gputools.transport" code:2 userInfo:v26];

        xpc_dictionary_set_nserror(v24, "_error", v27);
        [v7 sendMessage:v24];
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  id v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "Invalid message", buf, 2u);
  }
LABEL_26:
}

- (BOOL)deviceIsHandledLocally:(id)a3
{
  id v4 = a3;
  id v5 = sub_10001CBBC(v4);
  if (!v5
    || [(NSString *)self->_deviceUDID isEqualToString:v5]
    || (xpc_dictionary_get_flag(v4, "_flags", 4) & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    id v8 = [(GTServiceProvider *)self->_serviceProvider allServices];
    id v9 = filteredArrayByService(v8, (Protocol *)&OBJC_PROTOCOL___GTSimulatorDeviceBrowser);
    if ([v9 count])
    {
      BOOL v6 = 0;
    }
    else
    {
      id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
      BOOL v6 = v10 != 0;
    }
  }

  return v6;
}

- (void)broadcastDisconnection:(id)a3 connectionId:(unint64_t)a4
{
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v31 = a4;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Broadcast Disconnection of Connection ID %lu", buf, 0xCu);
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_flag(empty, "_flags", 1);
  xpc_dictionary_set_flag(empty, "_flags", 2);
  xpc_dictionary_set_string(empty, "_cmd", "broadcastDisconnect");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = self->_portToDispatcher;
  id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [(NSMutableDictionary *)self->_portToDispatcher objectForKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v14 dispatchMessage:empty replyConnection:v6];
      }
      id v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v11);
  }

  MessagePathPush(empty, a4);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = [(GTConnectionMap *)self->_connectionMap connections];
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) sendMessage:empty];
      }
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

- (void)handleDisconnection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connection];
  id v6 = xpc_copy_description(v5);

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Connection: Disconnect:%s", (uint8_t *)&v9, 0xCu);
  }
  free(v6);
  id v8 = [(NSMutableDictionary *)self->_portToConnection allKeysForObject:v4];
  [(GTServiceProvider *)self->_serviceProvider disconnectServicePorts:v8];
  [(NSMutableDictionary *)self->_portToConnection removeObjectsForKeys:v8];
  [(GTServiceDaemon *)self broadcastDisconnection:v4 connectionId:[(GTConnectionMap *)self->_connectionMap remove:v4]];
}

- (void)handleConnection:(id)a3
{
  id v4 = a3;
  id v5 = xpc_copy_description(v4);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Connection: New:%s", buf, 0xCu);
  }
  free(v5);
  id v7 = dispatch_queue_create("com.apple.gputoolsserviced.connectionTarget", 0);
  xpc_connection_set_target_queue((xpc_connection_t)v4, v7);
  id v8 = [[GTEntitlementCheckingConnection alloc] initWithTransactionScopedXPCConnection:v4 messageQueue:self->_serialQueue];

  [(GTConnectionMap *)self->_connectionMap insert:v8];
  objc_initWeak((id *)buf, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001D254;
  v11[3] = &unk_100034E90;
  objc_copyWeak(&v12, (id *)buf);
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001D2BC;
  v9[3] = &unk_100034E90;
  objc_copyWeak(&v10, (id *)buf);
  v9[4] = self;
  [(GTLocalXPCConnection *)v8 activateWithMessageHandler:v11 andErrorHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)enterRunLoop
{
  mach_service = xpc_connection_create_mach_service("com.apple.gputools.service", (dispatch_queue_t)self->_serialQueue, 1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001D3A4;
  handler[3] = &unk_100034E68;
  handler[4] = self;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_activate(mach_service);
  dispatch_main();
}

- (void)registerServices
{
  id v29 = (id)objc_opt_new();
  v3 = objc_alloc_init(GTServiceProvider);
  serviceProvider = self->_serviceProvider;
  self->_serviceProvider = v3;

  id v5 = [[GTServiceProperties alloc] initWithProtocol:&OBJC_PROTOCOL___GTServiceProvider];
  [(GTServiceProperties *)v5 setVersion:2];
  [(GTServiceProvider *)self->_serviceProvider registerDefaultServiceProvider:v5 forProcess:v29];
  [(GTServiceVendor *)self->_serviceVendor addLocalService:self->_serviceProvider forPort:[(GTServiceProperties *)v5 servicePort]];
  id v6 = [[GTServiceProviderXPCDispatcher alloc] initWithService:self->_serviceProvider properties:v5];
  [(GTServiceProviderXPCDispatcher *)v6 setConnections:self->_portToConnection];
  portToDispatcher = self->_portToDispatcher;
  id v8 = +[NSNumber numberWithUnsignedLongLong:[(GTServiceProperties *)v5 servicePort]];
  [(NSMutableDictionary *)portToDispatcher setObject:v6 forKeyedSubscript:v8];

  int v9 = [[GTServiceProperties alloc] initWithProtocol:&OBJC_PROTOCOL___GTLaunchService];
  [(GTServiceProvider *)self->_serviceProvider registerService:v9 forProcess:v29];
  id v10 = [[GTLaunchService alloc] initWithServiceProvider:self->_serviceProvider];
  [(GTServiceVendor *)self->_serviceVendor addLocalService:v10 forPort:[(GTServiceProperties *)v9 servicePort]];
  id v11 = [[GTLaunchServiceXPCDispatcher alloc] initWithService:v10 properties:v9];
  id v12 = self->_portToDispatcher;
  unsigned int v13 = +[NSNumber numberWithUnsignedLongLong:[(GTServiceProperties *)v9 servicePort]];
  [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

  id v14 = [[GTServiceProperties alloc] initWithProtocol:&OBJC_PROTOCOL___GTDeviceCapabilities];
  [(GTServiceProvider *)self->_serviceProvider registerService:v14 forProcess:v29];
  id v15 = objc_alloc_init(GTDeviceCapabilities);
  [(GTServiceVendor *)self->_serviceVendor addLocalService:v15 forPort:[(GTServiceProperties *)v14 servicePort]];
  id v16 = [[GTDeviceCapabilitiesXPCDispatcher alloc] initWithService:v15 properties:v14];
  id v17 = self->_portToDispatcher;
  uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:[(GTServiceProperties *)v14 servicePort]];
  [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];

  v19 = [[GTServiceProperties alloc] initWithProtocol:&OBJC_PROTOCOL___GTURLAccessProvider];
  [(GTServiceProvider *)self->_serviceProvider registerService:v19 forProcess:v29];
  long long v20 = [[GTURLAccessProvider alloc] initWithServiceProvider:self->_serviceProvider connectionProvider:self serviceVendor:self->_serviceVendor];
  [(GTServiceVendor *)self->_serviceVendor addLocalService:v20 forPort:[(GTServiceProperties *)v19 servicePort]];
  long long v21 = [[GTURLAccessProviderXPCDispatcher alloc] initWithService:v20 properties:v19];
  long long v22 = self->_portToDispatcher;
  long long v23 = +[NSNumber numberWithUnsignedLongLong:[(GTServiceProperties *)v19 servicePort]];
  [(NSMutableDictionary *)v22 setObject:v21 forKeyedSubscript:v23];

  long long v24 = [[GTServiceProperties alloc] initWithProtocol:&OBJC_PROTOCOL___GTLoopbackService];
  [(GTServiceProvider *)self->_serviceProvider registerService:v24 forProcess:v29];
  long long v25 = objc_alloc_init(GTLoopbackService);
  [(GTServiceVendor *)self->_serviceVendor addLocalService:v25 forPort:[(GTServiceProperties *)v24 servicePort]];
  long long v26 = [[GTLoopbackServiceXPCDispatcher alloc] initWithService:v25 properties:v24];
  long long v27 = self->_portToDispatcher;
  id v28 = +[NSNumber numberWithUnsignedLongLong:[(GTServiceProperties *)v24 servicePort]];
  [(NSMutableDictionary *)v27 setObject:v26 forKeyedSubscript:v28];
}

- (GTServiceDaemon)init
{
  v23.receiver = self;
  v23.super_class = (Class)GTServiceDaemon;
  v2 = [(GTServiceDaemon *)&v23 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.gputools.transport", "ServiceDaemon");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    id v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Agent Launched", v22, 2u);
    }
    id v6 = +[NSUUID UUID];
    uint64_t v7 = [v6 UUIDString];
    daemonId = v2->_daemonId;
    v2->_daemonId = (NSString *)v7;

    uint64_t v9 = +[GTDeviceProperties uniqueDeviceID];
    deviceUDID = v2->_deviceUDID;
    v2->_deviceUDID = (NSString *)v9;

    id v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    portToConnection = v2->_portToConnection;
    v2->_portToConnection = v11;

    unsigned int v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    portToDispatcher = v2->_portToDispatcher;
    v2->_portToDispatcher = v13;

    id v15 = objc_alloc_init(GTConnectionMap);
    connectionMap = v2->_connectionMap;
    v2->_connectionMap = v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.gputoolsserviced.main", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v17;

    v19 = [[GTServiceVendor alloc] initWithConnectionProvider:v2];
    serviceVendor = v2->_serviceVendor;
    v2->_serviceVendor = v19;

    [(GTServiceDaemon *)v2 registerServices];
  }
  return v2;
}

@end