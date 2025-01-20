@interface STIDSTransport
- (BOOL)cachedIDSAccountIsActive;
- (BOOL)isInvalid;
- (BOOL)isPayloadWithIdentifierValid:(id)a3 error:(id *)a4;
- (BOOL)isResumed;
- (IDSService)service;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)serviceQueue;
- (STIDSTransport)init;
- (STTransportDelegate)delegate;
- (void)_receivePayloadData:(id)a3 fromID:(id)a4 serverReceivedTime:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)resolveTransportDestinations:(id)a3 toLocal:(BOOL)a4 persistenceController:(id)a5 completion:(id)a6;
- (void)resume;
- (void)sendPayload:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)setCachedIDSAccountIsActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setResumed:(BOOL)a3;
- (void)setServiceQueue:(id)a3;
@end

@implementation STIDSTransport

- (STIDSTransport)init
{
  v10.receiver = self;
  v10.super_class = (Class)STIDSTransport;
  v2 = [(STIDSTransport *)&v10 init];
  if (v2)
  {
    v3 = _os_activity_create((void *)&_mh_execute_header, "STIDSTransport Initialize", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    uint64_t v4 = objc_opt_new();
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v4;

    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_operationQueue setName:@"com.apple.ScreenTimeAgent.ids-transport"];
    v6 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.digitalhealth"];
    service = v2->_service;
    v2->_service = v6;

    os_activity_scope_leave(&state);
  }
  v8 = +[STLog familyMessaging];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(state.opaque[0]) = 136446210;
    *(uint64_t *)((char *)state.opaque + 4) = (uint64_t)"-[STIDSTransport init]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nLeaving init", (uint8_t *)&state, 0xCu);
  }

  return v2;
}

- (void)dealloc
{
  if (![(STIDSTransport *)self isInvalid])
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2, self, @"STIDSTransport.m", 80, @"%@ must be invalidated before it's deallocated", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)STIDSTransport;
  [(STIDSTransport *)&v5 dealloc];
}

- (void)resume
{
  if ([(STIDSTransport *)self isInvalid])
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"STIDSTransport.m", 86, @"Invalid parameter not satisfying: %@", @"!self.isInvalid" object file lineNumber description];
  }
  [(STIDSTransport *)self setResumed:1];
  uint64_t v4 = [(STIDSTransport *)self operationQueue];
  [v4 setSuspended:0];

  objc_super v5 = self->_cachedIDSAccountIsActiveLock;
  objc_sync_enter(v5);
  dispatch_queue_t v6 = dispatch_queue_create((const char *)[@"com.apple.ScreenTimeAgent.ids-transport-delegate" UTF8String], 0);
  [(STIDSTransport *)self setServiceQueue:v6];

  v7 = [(STIDSTransport *)self service];
  v8 = [(STIDSTransport *)self serviceQueue];
  [v7 addDelegate:self queue:v8];

  v9 = [(STIDSTransport *)self service];
  objc_super v10 = [v9 accounts];
  v11 = +[NSString stringWithFormat:@"@max.%@", @"canSend"];
  v12 = [v10 valueForKeyPath:v11];

  -[STIDSTransport setCachedIDSAccountIsActive:](self, "setCachedIDSAccountIsActive:", [v12 BOOLValue]);
  objc_sync_exit(v5);

  v13 = +[STLog idsTransport];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v16 = "-[STIDSTransport resume]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s", buf, 0xCu);
  }
}

- (void)invalidate
{
  [(STIDSTransport *)self setInvalid:1];
  v3 = [(STIDSTransport *)self operationQueue];
  [v3 setSuspended:1];

  uint64_t v4 = [(STIDSTransport *)self service];
  [v4 removeDelegate:self];

  [(STIDSTransport *)self setServiceQueue:0];
  objc_super v5 = +[STLog idsTransport];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446210;
    v7 = "-[STIDSTransport invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s", (uint8_t *)&v6, 0xCu);
  }
}

- (void)sendPayload:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[STLog familyMessaging];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = "-[STIDSTransport sendPayload:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nAttempting to send payload: %@", buf, 0x16u);
  }

  int v6 = +[MCProfileConnection sharedConnection];
  BOOL v7 = [v6 effectiveBoolValueForSetting:MCFeatureEnablingRestrictionsAllowed] == 2;

  if (v7)
  {
    v8 = +[STLog idsTransport];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v4 payloadType];
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[STIDSTransport sendPayload:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nRefusing to send IDS payload %{public}@, restrictions forbid Screen Time", buf, 0x16u);
    }
  }
  else
  {
    if (![(STIDSTransport *)self isResumed]) {
      [(STIDSTransport *)self resume];
    }
    if (![(STIDSTransport *)self cachedIDSAccountIsActive])
    {
      objc_super v10 = +[STLog idsTransport];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100260E94();
      }
    }
    v11 = +[STLog idsTransport];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446467;
      *(void *)&uint8_t buf[4] = "-[STIDSTransport sendPayload:]";
      *(_WORD *)&buf[12] = 2113;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nSending payload: %{private}@", buf, 0x16u);
    }

    v12 = [v4 destinations];
    v13 = [v12 valueForKeyPath:@"address"];
    v14 = +[NSSet setWithArray:v13];

    v15 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v8 = v14;
    v16 = (char *)[v8 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v44;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v8);
          }
          v19 = (void *)IDSCopyAddressDestinationForDestination();
          [v15 addObject:v19];
        }
        v16 = (char *)[v8 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v16);
    }

    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v52 = sub_100044138;
    v53 = sub_100044148;
    id v54 = (id)objc_opt_new();
    v21 = +[IDSIDQueryController sharedInstance];
    v22 = [v15 allObjects];
    v23 = [(STIDSTransport *)self serviceQueue];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100044150;
    v40[3] = &unk_1002FCAF8;
    v42 = buf;
    v24 = v20;
    v41 = v24;
    [v21 refreshIDStatusForDestinations:v22 service:@"com.apple.private.alloy.digitalhealth" listenerID:@"STAgent" queue:v23 completionBlock:v40];

    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    if ([*(id *)(*(void *)&buf[8] + 40) count])
    {
      v25 = +[STLog idsTransport];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = [*(id *)(*(void *)&buf[8] + 40) count];
        *(_DWORD *)v47 = 136446466;
        v48 = "-[STIDSTransport sendPayload:]";
        __int16 v49 = 2048;
        id v50 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nReachable destinations: %lu", v47, 0x16u);
      }

      v27 = [STSendPayloadWithIDSTransportOperation alloc];
      uint64_t v28 = *(void *)(*(void *)&buf[8] + 40);
      v29 = [(STIDSTransport *)self service];
      v30 = [(STSendPayloadWithIDSTransportOperation *)v27 initWithPayload:v4 destinations:v28 service:v29];

      v31 = [(STIDSTransport *)self operationQueue];
      [v31 addOperation:v30];

      v32 = [(STIDSTransport *)self operationQueue];
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100044274;
      v36[3] = &unk_1002FCB20;
      id v37 = v4;
      v33 = v30;
      v38 = v33;
      v39 = self;
      [v32 addOperationWithBlock:v36];

      v34 = v37;
    }
    else
    {
      v35 = +[STLog idsTransport];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_100260E10(v35);
      }

      v33 = [(STIDSTransport *)self delegate];
      v34 = [v4 UUID];
      [(STSendPayloadWithIDSTransportOperation *)v33 transport:self didReceiveUpdatedState:4 forPayloadUUID:v34 context:0 error:0];
    }

    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)isPayloadWithIdentifierValid:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [(STIDSTransport *)self service];
  LOBYTE(a4) = [v7 getProgressUpdateForIdentifier:v6 error:a4];

  return (char)a4;
}

- (void)_receivePayloadData:(id)a3 fromID:(id)a4 serverReceivedTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[MCProfileConnection sharedConnection];
  unsigned int v12 = [v11 effectiveBoolValueForSetting:MCFeatureEnablingRestrictionsAllowed];

  if (v12 == 2)
  {
    v13 = +[STLog idsTransport];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100260FF8(v13);
    }
  }
  else
  {
    v13 = IDSCopyRawAddressForDestination();
    v14 = +[STLog idsTransport];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136446979;
      uint64_t v17 = "-[STIDSTransport _receivePayloadData:fromID:serverReceivedTime:]";
      __int16 v18 = 2050;
      id v19 = [v8 length];
      __int16 v20 = 2113;
      id v21 = v9;
      __int16 v22 = 2113;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nReceived data of length: %{public}lu bytes, \nfromID: %{private}@, \nappleID: %{private}@", (uint8_t *)&v16, 0x2Au);
    }

    v15 = [(STIDSTransport *)self delegate];
    [v15 transport:self didReceiveData:v8 altURI:v9 appleID:v13 serverReceivedTime:v10];
  }
}

- (void)resolveTransportDestinations:(id)a3 toLocal:(BOOL)a4 persistenceController:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = +[STLog familyMessaging];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = "NO";
    v29 = "-[STIDSTransport resolveTransportDestinations:toLocal:persistenceController:completion:]";
    *(_DWORD *)buf = 136446722;
    if (v8) {
      v14 = "YES";
    }
    __int16 v30 = 2112;
    id v31 = v10;
    __int16 v32 = 2082;
    v33 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \ndestinations: %@, \ntoLocal: %{public}s", buf, 0x20u);
  }

  if (v10)
  {
    v15 = [STResolveIDSDestinationsOperation alloc];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004498C;
    v24[3] = &unk_1002FCB48;
    v25 = [(STResolveIDSDestinationsOperation *)v15 initWithDestinations:v10 toLocal:v8 organizationIdentifier:STOrganizationIdentifierFamily persistenceController:v11];
    id v26 = v12;
    id v16 = v12;
    uint64_t v17 = v25;
    __int16 v18 = +[NSBlockOperation blockOperationWithBlock:v24];
    id v19 = [(STIDSTransport *)self operationQueue];
    v27[0] = v17;
    v27[1] = v18;
    __int16 v20 = +[NSArray arrayWithObjects:v27 count:2];
    [v19 addOperations:v20 waitUntilFinished:0];
  }
  else
  {
    id v21 = [(STIDSTransport *)self operationQueue];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100044AC8;
    v22[3] = &unk_1002FCB70;
    id v23 = v12;
    uint64_t v17 = (STResolveIDSDestinationsOperation *)v12;
    [v21 addOperationWithBlock:v22];

    id v16 = v23;
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v9 = a6;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = +[STLog familyMessaging];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = +[NSNumber numberWithBool:v9];
    *(_DWORD *)buf = 136446979;
    uint64_t v28 = "-[STIDSTransport service:account:identifier:didSendWithSuccess:error:context:]";
    __int16 v29 = 2113;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v13;
    __int16 v33 = 2114;
    v34 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \naccount: %{private}@, \nidentifier: %{public}@, \ndidSendWithSuccess: %{public}@", buf, 0x2Au);
  }
  if (v14)
  {
    uint64_t v17 = +[STLog familyMessaging];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100261114();
    }
  }
  if (!v9)
  {
    __int16 v18 = +[STLog idsTransport];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10026107C();
    }
  }
  id v19 = [(STIDSTransport *)self operationQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100044D18;
  v22[3] = &unk_1002FCB98;
  BOOL v26 = v9;
  id v23 = v13;
  id v24 = v14;
  v25 = self;
  id v20 = v14;
  id v21 = v13;
  [v19 addOperationWithBlock:v22];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = +[STLog familyMessaging];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446979;
    id v19 = "-[STIDSTransport service:account:identifier:hasBeenDeliveredWithContext:]";
    __int16 v20 = 2113;
    id v21 = v9;
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \naccount: %{private}@, \nidentifier: %{public}@, \ncontext: %@", buf, 0x2Au);
  }

  id v13 = [(STIDSTransport *)self operationQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100044FD8;
  v15[3] = &unk_1002FB828;
  id v16 = v10;
  uint64_t v17 = self;
  id v14 = v10;
  [v13 addOperationWithBlock:v15];
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  id v12 = a6;
  id v13 = [v11 serverReceivedTime];
  id v14 = +[STLog idsTransport];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v11 outgoingResponseIdentifier];
    id v16 = [v10 length];
    uint64_t v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 fromServerStorage]);
    int v18 = 136447234;
    id v19 = "-[STIDSTransport service:account:incomingData:fromID:context:]";
    __int16 v20 = 2114;
    id v21 = v15;
    __int16 v22 = 2050;
    id v23 = v16;
    __int16 v24 = 2112;
    id v25 = v17;
    __int16 v26 = 2112;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \noutgoingResponseIdentifier: %{public}@, \ndata length: %{public}lu, \nfromServerStorage: %@, \nserverReceivedTime: %@", (uint8_t *)&v18, 0x34u);
  }
  [(STIDSTransport *)self _receivePayloadData:v10 fromID:v12 serverReceivedTime:v13];
}

- (void)service:(id)a3 account:(id)a4 incomingResourceAtURL:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = [v12 serverReceivedTime];
  id v14 = +[STLog idsTransport];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [v12 outgoingResponseIdentifier];
    id v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 fromServerStorage]);
    *(_DWORD *)buf = 136446978;
    __int16 v22 = "-[STIDSTransport service:account:incomingResourceAtURL:fromID:context:]";
    __int16 v23 = 2114;
    __int16 v24 = v15;
    __int16 v25 = 2112;
    __int16 v26 = v16;
    __int16 v27 = 2112;
    uint64_t v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \noutgoingResponseIdentifier: %{public}@, \nfromServerStorage: %@, \nserverReceivedTime: %@", buf, 0x2Au);
  }
  id v20 = 0;
  uint64_t v17 = +[NSData dataWithContentsOfURL:v10 options:0 error:&v20];
  id v18 = v20;
  if (v17)
  {
    [(STIDSTransport *)self _receivePayloadData:v17 fromID:v11 serverReceivedTime:v13];
  }
  else
  {
    id v19 = +[STLog idsTransport];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      sub_10026119C();
    }
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a3;
  BOOL v7 = (char *)a4;
  BOOL v8 = +[STLog idsTransport];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v26 = "-[STIDSTransport service:activeAccountsChanged:]";
    __int16 v27 = 2112;
    uint64_t v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nActive accounts changed: %@", buf, 0x16u);
  }

  id v9 = self->_cachedIDSAccountIsActiveLock;
  objc_sync_enter(v9);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    while (2)
    {
      id v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v13), "isActive", (void)v20))
        {

          unsigned int v15 = ![(STIDSTransport *)self cachedIDSAccountIsActive];
          uint64_t v14 = 1;
          goto LABEL_13;
        }
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v14 = 0;
  unsigned int v15 = 0;
LABEL_13:
  id v16 = +[STLog familyMessaging];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = "NO";
    if (v14) {
      uint64_t v17 = "YES";
    }
    *(_DWORD *)buf = 136446466;
    __int16 v26 = "-[STIDSTransport service:activeAccountsChanged:]";
    __int16 v27 = 2082;
    uint64_t v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nAt least one account is active: %{public}s", buf, 0x16u);
  }

  [(STIDSTransport *)self setCachedIDSAccountIsActive:v14];
  objc_sync_exit(v9);

  if (v15)
  {
    id v18 = +[STLog familyMessaging];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v26 = "-[STIDSTransport service:activeAccountsChanged:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nPosting notification: STIDSAccountDidBecomeActiveNotification", buf, 0xCu);
    }

    id v19 = +[NSNotificationCenter defaultCenter];
    [v19 postNotificationName:@"com.apple.remotemanagementd.ids-account.didBecomeActive" object:self];
  }
}

- (STTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STTransportDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (BOOL)isResumed
{
  return self->_resumed;
}

- (void)setResumed:(BOOL)a3
{
  self->_resumed = a3;
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (BOOL)cachedIDSAccountIsActive
{
  return self->_cachedIDSAccountIsActive;
}

- (void)setCachedIDSAccountIsActive:(BOOL)a3
{
  self->_cachedIDSAccountIsActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedIDSAccountIsActiveLock, 0);
}

@end