@interface SDUnlockTransport
- (IDSService)autoUnlockService;
- (NSMutableDictionary)completionHandlersByMessageIdentifier;
- (NSMutableDictionary)sendDatesByMessageIdentifier;
- (SDUnlockTransport)init;
- (id)activeDevice;
- (id)dataFromUUID:(id)a3;
- (id)idsDeviceForUniqueID:(id)a3;
- (id)sendAutoUnlockPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9;
- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
@end

@implementation SDUnlockTransport

- (SDUnlockTransport)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDUnlockTransport;
  v2 = [(SDUnlockTransport *)&v8 init];
  uint64_t v3 = +[NSMutableDictionary dictionary];
  completionHandlersByMessageIdentifier = v2->_completionHandlersByMessageIdentifier;
  v2->_completionHandlersByMessageIdentifier = (NSMutableDictionary *)v3;

  uint64_t v5 = +[NSMutableDictionary dictionary];
  sendDatesByMessageIdentifier = v2->_sendDatesByMessageIdentifier;
  v2->_sendDatesByMessageIdentifier = (NSMutableDictionary *)v5;

  return v2;
}

- (id)dataFromUUID:(id)a3
{
  v5[0] = 0;
  v5[1] = 0;
  [a3 getUUIDBytes:v5];
  uint64_t v3 = +[NSData dataWithBytes:v5 length:16];

  return v3;
}

- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = objc_opt_new();
  [v8 setVersion:1];
  v9 = [(SDUnlockTransport *)self dataFromUUID:v6];

  [v8 setSessionID:v9];
  [v8 setPayload:v7];

  v10 = [v8 data];

  return v10;
}

- (id)activeDevice
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SDUnlockTransport *)self autoUnlockService];
  uint64_t v3 = [v2 devices];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isActive])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)idsDeviceForUniqueID:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(SDUnlockTransport *)self autoUnlockService];
  id v6 = [v5 devices];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 uniqueIDOverride];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)sendAutoUnlockPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9
{
  uint64_t v12 = a5;
  id v15 = a4;
  id v16 = a6;
  long long v17 = v15;
  id v18 = v16;
  id v19 = a7;
  id v55 = a8;
  id v52 = a9;
  id v53 = v18;
  v54 = [(SDUnlockTransport *)self transferDataFromPayload:a3 sessionID:v18];
  unsigned int v20 = [v17 isEqualToString:IDSDefaultPairedDevice];
  if (v20)
  {
    v21 = [(SDUnlockTransport *)self activeDevice];
    if (!v21)
    {
      id v27 = 0;
      v28 = v55;
      goto LABEL_12;
    }
    id v22 = v19;
    v23 = (void *)IDSCopyIDForDevice();
    id v24 = objc_alloc((Class)NSMutableSet);
    v63 = v23;
    v25 = &v63;
  }
  else
  {
    id v22 = v19;
    v21 = [(SDUnlockTransport *)self idsDeviceForUniqueID:v17];
    v23 = (void *)IDSCopyIDForDevice();
    if (!v23)
    {
      v26 = auto_unlock_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1001BF270();
      }
      id v27 = 0;
      goto LABEL_11;
    }
    id v24 = objc_alloc((Class)NSMutableSet);
    v62 = v23;
    v25 = &v62;
  }
  v26 = +[NSArray arrayWithObjects:v25 count:1];
  id v27 = [v24 initWithArray:v26];
LABEL_11:
  v28 = v55;

  id v19 = v22;
LABEL_12:

  if (v27)
  {
    v29 = +[NSMutableDictionary dictionary];
    v30 = v29;
    if (v28)
    {
      [v29 setObject:v28 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    }
    else
    {
      v35 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
      [v30 setObject:v35 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    }
    [v30 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    if (v19) {
      [v30 setObject:v19 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    }
    id v51 = v19;
    if (v20) {
      [v30 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionForceLocalDeliveryKey];
    }
    [(SDUnlockTransport *)self updateSendOptions:v30];
    id v36 = [objc_alloc((Class)IDSProtobuf) initWithProtobufData:v54 type:v12 isResponse:0];
    uint64_t v37 = v12;
    kdebug_trace();
    v38 = [(SDUnlockTransport *)self autoUnlockService];
    id v56 = 0;
    id v57 = 0;
    v50 = v36;
    LODWORD(v36) = [v38 sendProtobuf:v36 toDestinations:v27 priority:300 options:v30 identifier:&v57 error:&v56];
    id v31 = v57;
    id v32 = v56;

    v34 = v53;
    id v39 = [objc_alloc((Class)NSString) initWithFormat:@"type: %d, sessionID: %ld, destinations: %@", v37, v53, v27];
    v40 = auto_unlock_log();
    v41 = v40;
    if (v36)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v59 = v39;
        __int16 v60 = 2112;
        id v61 = v31;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Sending %@, identifier: %@", buf, 0x16u);
      }

      v42 = +[NSDate date];
      v43 = [(SDUnlockTransport *)self sendDatesByMessageIdentifier];
      [v43 setObject:v42 forKeyedSubscript:v31];

      v33 = v52;
      if (v52)
      {
        id v49 = v39;
        id v44 = [v52 copy];
        id v45 = objc_retainBlock(v44);
        [(SDUnlockTransport *)self completionHandlersByMessageIdentifier];
        v47 = v46 = v17;
        [v47 setObject:v45 forKeyedSubscript:v31];

        long long v17 = v46;
        v34 = v53;

        id v39 = v49;
      }
      [(SDUnlockTransport *)self handleSuccessfulMessageSentWithIdentifier:v31 sessionID:v34];
    }
    else
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1001BF208();
      }

      v33 = v52;
      if (v52) {
        (*((void (**)(id, void, id))v52 + 2))(v52, 0, v32);
      }
    }

    id v19 = v51;
    v28 = v55;
  }
  else
  {
    v30 = auto_unlock_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v59 = v17;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No destinations for device ID: %@", buf, 0xCu);
    }
    id v31 = 0;
    id v32 = 0;
    v33 = v52;
    v34 = v53;
  }

  return v31;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v10 = a5;
  id v11 = a7;
  kdebug_trace();
  uint64_t v12 = auto_unlock_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    long long v14 = objc_opt_new();
    id v15 = [(SDUnlockTransport *)self sendDatesByMessageIdentifier];
    id v16 = [v15 objectForKeyedSubscript:v10];
    [v14 timeIntervalSinceDate:v16];
    int v22 = 138413058;
    CFStringRef v23 = v13;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 2048;
    uint64_t v27 = v17;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "success = %@, identifier = %@, time = %.2f, error = %@", (uint8_t *)&v22, 0x2Au);
  }
  id v18 = [(SDUnlockTransport *)self sendDatesByMessageIdentifier];
  [v18 removeObjectForKey:v10];

  id v19 = [(SDUnlockTransport *)self completionHandlersByMessageIdentifier];
  unsigned int v20 = [v19 objectForKeyedSubscript:v10];

  if (v20)
  {
    ((void (**)(void, BOOL, id))v20)[2](v20, v8, v11);
    v21 = [(SDUnlockTransport *)self completionHandlersByMessageIdentifier];
    [v21 removeObjectForKey:v10];
  }
}

- (IDSService)autoUnlockService
{
  return self->_autoUnlockService;
}

- (NSMutableDictionary)completionHandlersByMessageIdentifier
{
  return self->_completionHandlersByMessageIdentifier;
}

- (NSMutableDictionary)sendDatesByMessageIdentifier
{
  return self->_sendDatesByMessageIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDatesByMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlersByMessageIdentifier, 0);

  objc_storeStrong((id *)&self->_autoUnlockService, 0);
}

@end