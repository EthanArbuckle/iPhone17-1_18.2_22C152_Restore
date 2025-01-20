@interface STTransportPayloadManager
- (BOOL)isInvalid;
- (BOOL)isResumed;
- (BOOL)shouldSetupLocalTransport;
- (NSOperationQueue)operationQueue;
- (STLocalIDSTransport)localTransport;
- (STPersistenceControllerProtocol)persistenceController;
- (STTransport)transport;
- (STTransportPayloadManager)initWithTransport:(id)a3 localTransport:(id)a4 persistenceController:(id)a5;
- (STTransportPayloadManagerDelegate)delegate;
- (void)_forwardPayloadToLocalTransport:(id)a3;
- (void)_operation:(id)a3 cancelledDidChange:(BOOL)a4;
- (void)_operation:(id)a3 executingDidChange:(BOOL)a4;
- (void)_operation:(id)a3 finishedDidChange:(BOOL)a4;
- (void)_processEnqueuedPayloads;
- (void)_sendPayload:(id)a3;
- (void)_updatePayloadUUID:(id)a3 toState:(unint64_t)a4 context:(id)a5;
- (void)enqueuePayload:(id)a3;
- (void)invalidate;
- (void)localTransport:(id)a3 didReceivePayload:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setResumed:(BOOL)a3;
- (void)setShouldSetupLocalTransport:(BOOL)a3;
- (void)transport:(id)a3 didReceiveData:(id)a4 altURI:(id)a5 appleID:(id)a6 serverReceivedTime:(id)a7;
- (void)transport:(id)a3 didReceiveUpdatedState:(unint64_t)a4 forPayloadUUID:(id)a5 context:(id)a6 error:(id)a7;
@end

@implementation STTransportPayloadManager

- (STTransportPayloadManager)initWithTransport:(id)a3 localTransport:(id)a4 persistenceController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)STTransportPayloadManager;
  v12 = [(STTransportPayloadManager *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transport, a3);
    [(STTransport *)v13->_transport setDelegate:v13];
    objc_storeStrong((id *)&v13->_localTransport, a4);
    [(STLocalIDSTransport *)v13->_localTransport setDelegate:v13];
    objc_storeStrong((id *)&v13->_persistenceController, a5);
    uint64_t v14 = objc_opt_new();
    operationQueue = v13->_operationQueue;
    v13->_operationQueue = (NSOperationQueue *)v14;

    [(NSOperationQueue *)v13->_operationQueue setMaxConcurrentOperationCount:1];
    v16 = v13->_operationQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10008ED0C;
    v20[3] = &unk_1002FB6A8;
    id v21 = v11;
    [(NSOperationQueue *)v16 addOperationWithBlock:v20];
    uint64_t v17 = objc_opt_new();
    queuedProcessQueueOperations = v13->_queuedProcessQueueOperations;
    v13->_queuedProcessQueueOperations = (NSMutableSet *)v17;
  }
  return v13;
}

- (void)resume
{
  if ([(STTransportPayloadManager *)self isInvalid])
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"STTransportPayloadManager.m", 95, @"Invalid parameter not satisfying: %@", @"!self.isInvalid" object file lineNumber description];
  }
  [(STTransportPayloadManager *)self setResumed:1];
  v4 = [(STTransportPayloadManager *)self operationQueue];
  [v4 setSuspended:0];

  v5 = [(STTransportPayloadManager *)self transport];
  [v5 resume];

  v6 = +[STLog payloadManager];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v9 = "-[STTransportPayloadManager resume]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s", buf, 0xCu);
  }
}

- (void)invalidate
{
  v3 = [(STTransportPayloadManager *)self operationQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008F13C;
  v4[3] = &unk_1002FB6A8;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)enqueuePayload:(id)a3
{
  id v4 = a3;
  v5 = +[STLog payloadManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v17 = "-[STTransportPayloadManager enqueuePayload:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s", buf, 0xCu);
  }

  v6 = [STEnqueuePayloadOperation alloc];
  v7 = [(STTransportPayloadManager *)self persistenceController];
  v8 = [(STEnqueuePayloadOperation *)v6 initWithPayload:v4 persistenceController:v7];

  objc_initWeak((id *)buf, v8);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_10008F414;
  v13 = &unk_1002FE650;
  objc_copyWeak(&v15, (id *)buf);
  uint64_t v14 = self;
  [(STEnqueuePayloadOperation *)v8 setCompletionBlock:&v10];
  id v9 = [(STTransportPayloadManager *)self operationQueue];
  [v9 addOperation:v8];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)_processEnqueuedPayloads
{
  v3 = self->_queuedProcessQueueOperations;
  objc_sync_enter(v3);
  if ([(NSMutableSet *)self->_queuedProcessQueueOperations count])
  {
    id v4 = 0;
  }
  else
  {
    v5 = [STProcessPayloadQueueOperation alloc];
    v6 = [(STTransportPayloadManager *)self persistenceController];
    id v4 = [(STPersistenceOperation *)v5 initWithPersistenceController:v6];

    [(NSMutableSet *)self->_queuedProcessQueueOperations addObject:v4];
  }
  objc_sync_exit(v3);

  v7 = +[STLog payloadManager];
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = "-[STTransportPayloadManager _processEnqueuedPayloads]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nAdding process payload queue operation...", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v4);
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_10008F730;
    v13 = &unk_1002FE650;
    objc_copyWeak(&v15, (id *)buf);
    uint64_t v14 = self;
    [(STProcessPayloadQueueOperation *)v4 setCompletionBlock:&v10];
    [(STProcessPayloadQueueOperation *)v4 addObserver:self, @"cancelled", 1, "KVOContextSTTransportPayloadManager", v10, v11, v12, v13 forKeyPath options context];
    [(STProcessPayloadQueueOperation *)v4 addObserver:self forKeyPath:@"executing" options:1 context:"KVOContextSTTransportPayloadManager"];
    [(STProcessPayloadQueueOperation *)v4 addObserver:self forKeyPath:@"finished" options:1 context:"KVOContextSTTransportPayloadManager"];
    id v9 = [(STTransportPayloadManager *)self operationQueue];
    [v9 addOperation:v4];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136446210;
      uint64_t v17 = "-[STTransportPayloadManager _processEnqueuedPayloads]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nLast process payload queue operation hasn't had a chance to run, ignoring new request", buf, 0xCu);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == "KVOContextSTTransportPayloadManager")
  {
    if ([v10 isEqualToString:@"cancelled"])
    {
      v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      uint64_t v14 = +[NSNull null];

      if (v13 == v14)
      {

        v13 = 0;
      }
      -[STTransportPayloadManager _operation:cancelledDidChange:](self, "_operation:cancelledDidChange:", v11, [v13 BOOLValue]);
    }
    else if ([v10 isEqualToString:@"executing"])
    {
      v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      id v15 = +[NSNull null];

      if (v13 == v15)
      {

        v13 = 0;
      }
      -[STTransportPayloadManager _operation:executingDidChange:](self, "_operation:executingDidChange:", v11, [v13 BOOLValue]);
    }
    else
    {
      if (![v10 isEqualToString:@"finished"]) {
        goto LABEL_16;
      }
      v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
      v16 = +[NSNull null];

      if (v13 == v16)
      {

        v13 = 0;
      }
      -[STTransportPayloadManager _operation:finishedDidChange:](self, "_operation:finishedDidChange:", v11, [v13 BOOLValue]);
    }

    goto LABEL_16;
  }
  v17.receiver = self;
  v17.super_class = (Class)STTransportPayloadManager;
  [(STTransportPayloadManager *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_16:
}

- (void)_operation:(id)a3 cancelledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[STLog payloadManager];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446210;
    id v10 = "-[STTransportPayloadManager _operation:cancelledDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    BOOL v8 = self->_queuedProcessQueueOperations;
    objc_sync_enter(v8);
    [(NSMutableSet *)self->_queuedProcessQueueOperations removeObject:v6];
    objc_sync_exit(v8);
  }
}

- (void)_operation:(id)a3 executingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[STLog payloadManager];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446210;
    id v10 = "-[STTransportPayloadManager _operation:executingDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    BOOL v8 = self->_queuedProcessQueueOperations;
    objc_sync_enter(v8);
    [(NSMutableSet *)self->_queuedProcessQueueOperations removeObject:v6];
    objc_sync_exit(v8);
  }
}

- (void)_operation:(id)a3 finishedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = +[STLog payloadManager];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446210;
    id v10 = "-[STTransportPayloadManager _operation:finishedDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    BOOL v8 = self->_queuedProcessQueueOperations;
    objc_sync_enter(v8);
    [(NSMutableSet *)self->_queuedProcessQueueOperations removeObject:v6];
    objc_sync_exit(v8);

    [v6 removeObserver:self forKeyPath:@"cancelled" context:"KVOContextSTTransportPayloadManager"];
    [v6 removeObserver:self forKeyPath:@"executing" context:"KVOContextSTTransportPayloadManager"];
    [v6 removeObserver:self forKeyPath:@"finished" context:"KVOContextSTTransportPayloadManager"];
  }
}

- (void)_sendPayload:(id)a3
{
  id v4 = a3;
  v5 = +[STLog payloadManager];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v26 = "-[STTransportPayloadManager _sendPayload:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s", buf, 0xCu);
  }

  [(STTransportPayloadManager *)self _forwardPayloadToLocalTransport:v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [v4 destinations];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = STUnifiedTransportPayloadDestinationTypePairedDevice;
    while (2)
    {
      id v10 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v10) type];
        unsigned int v12 = [v11 isEqualToString:v9];

        if (!v12)
        {

          v13 = +[STLog payloadManager];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            v26 = "-[STTransportPayloadManager _sendPayload:]";
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nPayload contains non paired device destination", buf, 0xCu);
          }

          objc_initWeak((id *)buf, self);
          uint64_t v14 = [(STTransportPayloadManager *)self transport];
          id v15 = [v4 destinations];
          v16 = [(STTransportPayloadManager *)self persistenceController];
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_1000901D8;
          v17[3] = &unk_1002FE678;
          id v18 = v4;
          objc_copyWeak(&v19, (id *)buf);
          [v14 resolveTransportDestinations:v15 toLocal:0 persistenceController:v16 completion:v17];

          objc_destroyWeak(&v19);
          objc_destroyWeak((id *)buf);
          goto LABEL_15;
        }
        id v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_15:
}

- (void)_updatePayloadUUID:(id)a3 toState:(unint64_t)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[STLog payloadManager];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 - 1 > 4) {
      CFStringRef v11 = @"unknown";
    }
    else {
      CFStringRef v11 = off_1002FE6C0[a4 - 1];
    }
    int v12 = 136446978;
    v13 = "-[STTransportPayloadManager _updatePayloadUUID:toState:context:]";
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    CFStringRef v17 = v11;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \npayloadUUID: %@, \nstate: %@, \ncontext: %@", (uint8_t *)&v12, 0x2Au);
  }

  [(STTransportPayloadManager *)self _processEnqueuedPayloads];
}

- (void)_forwardPayloadToLocalTransport:(id)a3
{
  id v4 = a3;
  v5 = [v4 payloadType];
  if ([v5 isEqualToString:@"RMUnifiedTransportPayloadTypeFamilySettings"])
  {
    id v6 = [(STTransportPayloadManager *)self localTransport];
    [v6 sendPayload:v4];
  }
  else if (([v5 isEqualToString:@"RMUnifiedTransportPayloadTypeBlueprints"] & 1) != 0 {
         || [v5 isEqualToString:@"RMUnifiedTransportPayloadTypeCheckinResponse"])
  }
  {
    v30 = v5;
    v31 = v4;
    id v7 = objc_msgSend(v4, "payloadDictionary", self);
    id v8 = [v7 mutableCopy];

    v29 = v8;
    id v9 = objc_msgSend(v8, "objectForKeyedSubscript:");
    id v10 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v36;
      uint64_t v15 = STBlueprintTypeDowntime;
      uint64_t v16 = STBlueprintTypeManagedUser;
      uint64_t v34 = STBlueprintTypeAlwaysAllowedApps;
      uint64_t v33 = STBlueprintTypeRestrictions;
      uint64_t v32 = STBlueprintTypeUsageLimitOverride;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          __int16 v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v19 = [v18 objectForKeyedSubscript:@"type"];
          if (([v19 isEqualToString:v15] & 1) != 0
            || ([v19 isEqualToString:v16] & 1) != 0
            || ([v19 isEqualToString:v34] & 1) != 0
            || ([v19 isEqualToString:v33] & 1) != 0
            || [v19 isEqualToString:v32])
          {
            [v10 addObject:v18];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v13);
    }

    if ([v10 count]) {
      long long v20 = v10;
    }
    else {
      long long v20 = 0;
    }
    [v8 setObject:v20 forKeyedSubscript:@"Blueprints"];
    long long v21 = [STUnifiedTransportPayload alloc];
    id v4 = v31;
    long long v22 = [v31 userInfo];
    v5 = v30;
    long long v23 = [(STUnifiedTransportPayload *)v21 initWithPayload:v8 type:v30 userInfo:v22];

    v24 = [(STUnifiedTransportPayload *)v23 payloadDictionary];
    v25 = [v24 allKeys];
    id v26 = [v25 count];

    if (v26)
    {
      v27 = [v28 localTransport];
      [v27 sendPayload:v23];
    }
    else
    {
      v27 = +[STLog payloadManager];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v40 = "-[STTransportPayloadManager _forwardPayloadToLocalTransport:]";
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \nSkipping forward to local transport -- filtering left nothing to send", buf, 0xCu);
      }
    }
  }
}

- (void)transport:(id)a3 didReceiveData:(id)a4 altURI:(id)a5 appleID:(id)a6 serverReceivedTime:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a3;
  CFStringRef v17 = +[STLog payloadManager];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v34 = "-[STTransportPayloadManager transport:didReceiveData:altURI:appleID:serverReceivedTime:]";
    __int16 v35 = 2048;
    id v36 = [v12 length];
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[v1] %{public}s: \nReceived data: %lu bytes", buf, 0x16u);
  }

  id v18 = objc_alloc((Class)STUnifiedTransportPayloadDestination);
  id v19 = [v18 initWithAddress:v13 type:STUnifiedTransportPayloadDestinationTypeUser];
  id v32 = v19;
  long long v20 = +[NSArray arrayWithObjects:&v32 count:1];
  long long v21 = [(STTransportPayloadManager *)self persistenceController];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000909B8;
  v26[3] = &unk_1002FE6A0;
  id v27 = v12;
  id v28 = v13;
  id v29 = v14;
  id v30 = v15;
  v31 = self;
  id v22 = v15;
  id v23 = v14;
  id v24 = v13;
  id v25 = v12;
  [v16 resolveTransportDestinations:v20 toLocal:1 persistenceController:v21 completion:v26];
}

- (void)transport:(id)a3 didReceiveUpdatedState:(unint64_t)a4 forPayloadUUID:(id)a5 context:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = +[STLog familyMessaging];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v12 description];
    id v18 = (void *)v17;
    if (a4 - 1 > 4) {
      CFStringRef v19 = @"unknown";
    }
    else {
      CFStringRef v19 = off_1002FE6C0[a4 - 1];
    }
    int v21 = 136447490;
    id v22 = "-[STTransportPayloadManager transport:didReceiveUpdatedState:forPayloadUUID:context:error:]";
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    CFStringRef v26 = v19;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2114;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \ntransport: %@, \npayloadState: %@, \npayloadUUID: %@, \ncontext: %@, \nerror: %{public}@", (uint8_t *)&v21, 0x3Eu);
  }
  if (v13)
  {
    [(STTransportPayloadManager *)self _updatePayloadUUID:v13 toState:a4 context:v14];
  }
  else
  {
    long long v20 = +[STLog payloadManager];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1002683F8();
    }
  }
}

- (void)localTransport:(id)a3 didReceivePayload:(id)a4
{
  id v5 = a4;
  id v6 = [(STTransportPayloadManager *)self delegate];
  [v6 payloadManager:self didReceivePayload:v5];
}

- (STTransportPayloadManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STTransportPayloadManagerDelegate *)WeakRetained;
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

- (STTransport)transport
{
  return self->_transport;
}

- (STLocalIDSTransport)localTransport
{
  return (STLocalIDSTransport *)objc_getProperty(self, a2, 40, 1);
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (BOOL)shouldSetupLocalTransport
{
  return self->_shouldSetupLocalTransport;
}

- (void)setShouldSetupLocalTransport:(BOOL)a3
{
  self->_shouldSetupLocalTransport = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_localTransport, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queuedProcessQueueOperations, 0);
}

@end