@interface MRIDSCompanionConnection
+ (id)sharedManager;
- (BOOL)_sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 replyID:(id)a9 response:(id)a10;
- (BOOL)isConnected;
- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8;
- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 response:(id)a9;
- (IDSDevice)device;
- (MRDeviceInfo)deviceInfo;
- (MRIDSCompanionConnection)init;
- (NSString)description;
- (id)_configurationFromDestination:(id)a3 session:(id)a4;
- (id)deviceDebugName;
- (id)name;
- (unint64_t)_generateMessageID;
- (void)_maybeDeviceConnectionStatusChanged;
- (void)handleDidReceiveResetConnectionRequest;
- (void)initializeService;
- (void)removeMessageHandlerForType:(id)a3;
- (void)removeMessageHandlerForType:(id)a3 destination:(id)a4 session:(id)a5;
- (void)resetConnection;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setDevice:(id)a3;
- (void)setMessageHandler:(id)a3 forType:(id)a4;
- (void)setMessageHandler:(id)a3 forType:(id)a4 destination:(id)a5 session:(id)a6;
@end

@implementation MRIDSCompanionConnection

+ (id)sharedManager
{
  if (sharedManager___once != -1) {
    dispatch_once(&sharedManager___once, &__block_literal_global_26);
  }
  v2 = (void *)sharedManager___manager_0;

  return v2;
}

uint64_t __41__MRIDSCompanionConnection_sharedManager__block_invoke()
{
  sharedManager___manager_0 = objc_alloc_init(MRIDSCompanionConnection);

  return MEMORY[0x1F41817F8]();
}

- (MRIDSCompanionConnection)init
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)MRIDSCompanionConnection;
  v2 = [(MRIDSCompanionConnection *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaremote.MRIDSCompanionConnection.idsQueue", v3);
    idsQueue = v2->_idsQueue;
    v2->_idsQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediaremote.MRIDSCompanionConnection.calloutQueue", v6);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v2);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __32__MRIDSCompanionConnection_init__block_invoke;
    v19[3] = &unk_1E57D29B0;
    objc_copyWeak(&v20, &location);
    [(MRIDSCompanionConnection *)v2 setMessageHandler:v19 forType:@"Reset"];
    v9 = v2->_idsQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __32__MRIDSCompanionConnection_init__block_invoke_2;
    handler[3] = &unk_1E57D29D8;
    objc_copyWeak(&v18, &location);
    uint32_t v10 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &v2->_firstUnlockToken, v9, handler);
    if (v10)
    {
      v11 = _MRLogForCategory(9uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v24 = v10;
        _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Failed to register for first unlock notification (status = %d)", buf, 8u);
      }
    }
    if (softLinkMKBDeviceUnlockedSinceBoot[0]() == 1)
    {
      v12 = _MRLogForCategory(9uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Device unlocked since boot", buf, 2u);
      }

      v13 = v2->_idsQueue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __32__MRIDSCompanionConnection_init__block_invoke_58;
      v15[3] = &unk_1E57D0518;
      v16 = v2;
      dispatch_async(v13, v15);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__MRIDSCompanionConnection_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleDidReceiveResetConnectionRequest];
}

void __32__MRIDSCompanionConnection_init__block_invoke_2(uint64_t a1)
{
  v2 = _MRLogForCategory(9uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v4 = 0;
    _os_log_impl(&dword_194F3C000, v2, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Received first unlock notification", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained initializeService];
}

uint64_t __32__MRIDSCompanionConnection_init__block_invoke_58(uint64_t a1)
{
  return [*(id *)(a1 + 32) initializeService];
}

- (void)initializeService
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  objc_msgSend(MEMORY[0x1E4F6AB90], "mr_sharedIDSCompanionService");
  v3 = (IDSService *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  self->_service = v3;

  [(IDSService *)self->_service addDelegate:self queue:self->_idsQueue];
  [(MRIDSCompanionConnection *)self _maybeDeviceConnectionStatusChanged];
  if (notify_is_valid_token(self->_firstUnlockToken))
  {
    int firstUnlockToken = self->_firstUnlockToken;
    notify_cancel(firstUnlockToken);
  }
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)MRIDSCompanionConnection;
  dispatch_queue_t v4 = [(MRIDSCompanionConnection *)&v9 description];
  v5 = (void *)[v3 initWithFormat:@"%@", v4];

  v6 = [(MRIDSCompanionConnection *)self deviceInfo];
  [v5 appendFormat:@"deviceInfo=%@", v6];

  dispatch_queue_t v7 = [(IDSService *)self->_service devices];
  [v5 appendFormat:@"IDSDevices=%@", v7];

  return (NSString *)v5;
}

- (void)setDevice:(id)a3
{
  dispatch_queue_t v4 = (IDSDevice *)a3;
  obj = self;
  objc_sync_enter(obj);
  device = obj->_device;
  obj->_device = v4;
  v6 = v4;

  deviceInfo = obj->_deviceInfo;
  obj->_deviceInfo = 0;

  objc_sync_exit(obj);
}

- (IDSDevice)device
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (MRDeviceInfo)deviceInfo
{
  id v3 = [(MRIDSCompanionConnection *)self device];
  dispatch_queue_t v4 = [v3 uniqueIDOverride];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 uniqueID];
  }
  dispatch_queue_t v7 = v6;

  v8 = [v3 name];
  objc_super v9 = [v3 productName];
  uint32_t v10 = self;
  objc_sync_enter(v10);
  deviceInfo = v10->_deviceInfo;
  if (v3 && !deviceInfo)
  {
    v12 = objc_alloc_init(MRDeviceInfo);
    v13 = v10->_deviceInfo;
    v10->_deviceInfo = v12;

    [(MRDeviceInfo *)v10->_deviceInfo setDeviceUID:v7];
    [(MRDeviceInfo *)v10->_deviceInfo setName:v8];
    if ([v9 containsString:@"Watch"]) {
      uint64_t v14 = 6;
    }
    else {
      uint64_t v14 = 1;
    }
    [(MRDeviceInfo *)v10->_deviceInfo setDeviceClass:v14];
    deviceInfo = v10->_deviceInfo;
  }
  v15 = deviceInfo;
  objc_sync_exit(v10);

  return v15;
}

- (id)name
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(IDSDevice *)v2->_device name];
  objc_sync_exit(v2);

  return v3;
}

- (id)deviceDebugName
{
  v2 = [(MRIDSCompanionConnection *)self device];
  id v3 = [NSString alloc];
  dispatch_queue_t v4 = [v2 uniqueID];
  v5 = [v2 name];
  id v6 = [v2 productName];
  dispatch_queue_t v7 = (void *)[v3 initWithFormat:@"%@-%@ (%@)", v4, v5, v6];

  return v7;
}

- (BOOL)isConnected
{
  v2 = [(MRIDSCompanionConnection *)self deviceInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)resetConnection
{
  if ([(MRIDSCompanionConnection *)self isConnected])
  {
    [(MRIDSCompanionConnection *)self sendMessage:0 type:@"Reset" destination:0 session:0 options:0 priority:300];
  }
}

- (BOOL)_sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 replyID:(id)a9 response:(id)a10
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v47 = a4;
  id v48 = a5;
  id v15 = a6;
  id v44 = a7;
  id v45 = a9;
  id v16 = a10;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unint64_t v18 = [(MRIDSCompanionConnection *)self _generateMessageID];
  v19 = [NSNumber numberWithUnsignedInteger:v18];
  [v17 setObject:v19 forKeyedSubscript:@"messageid"];

  [v17 setObject:v48 forKeyedSubscript:@"destination"];
  [v17 setObject:v15 forKeyedSubscript:@"session"];
  [v17 setObject:v46 forKeyedSubscript:@"data"];
  [v17 setObject:v47 forKeyedSubscript:@"type"];
  [v17 setObject:v45 forKeyedSubscript:@"replyid"];
  id v20 = _MRLogForCategory(9uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    StringRepresentation = (void *)MRDataCreateStringRepresentation(v46);
    *(_DWORD *)buf = 134219010;
    unint64_t v52 = v18;
    __int16 v53 = 2112;
    v54 = StringRepresentation;
    __int16 v55 = 2112;
    id v56 = v47;
    __int16 v57 = 2112;
    id v58 = v48;
    __int16 v59 = 2112;
    id v60 = v15;
    _os_log_impl(&dword_194F3C000, v20, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Message Sent<%lu>: data=%@ type=%@ destination=%@ session=%@", buf, 0x34u);
  }
  objc_super v22 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v44];
  uint64_t v23 = *MEMORY[0x1E4F6A9A0];
  uint32_t v24 = [v22 objectForKeyedSubscript:*MEMORY[0x1E4F6A9A0]];
  BOOL v25 = v24 == 0;

  if (v25)
  {
    [v22 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v23];
    v26 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6A8E0]];
    [v22 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F6AA10]];
  }
  objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6A9B0], a8);
  if (!self->_service)
  {
    v27 = _MRLogForCategory(9uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[MRIDSCompanionConnection _sendMessage:type:destination:session:options:priority:replyID:response:](v27);
    }
  }
  if (v16)
  {
    v28 = self;
    objc_sync_enter(v28);
    if (!v28->_responseHandlers)
    {
      v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      responseHandlers = v28->_responseHandlers;
      v28->_responseHandlers = v29;
    }
    v31 = (void *)[v16 copy];
    v32 = (void *)MEMORY[0x1997190F0]();
    v33 = v28->_responseHandlers;
    v34 = [NSNumber numberWithUnsignedInteger:v18];
    [(NSMutableDictionary *)v33 setObject:v32 forKeyedSubscript:v34];

    objc_sync_exit(v28);
  }
  service = self->_service;
  v36 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6A878]];
  id v49 = 0;
  id v50 = 0;
  char v37 = [(IDSService *)service sendMessage:v17 toDestinations:v36 priority:v43 options:v22 identifier:&v50 error:&v49];
  id v38 = v50;
  id v39 = v49;

  if ((v37 & 1) == 0)
  {
    v40 = _MRLogForCategory(9uLL);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[MRIDSCompanionConnection _sendMessage:type:destination:session:options:priority:replyID:response:]((uint64_t)v39, v40);
    }
  }
  return v37;
}

- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 response:(id)a9
{
  return [(MRIDSCompanionConnection *)self _sendMessage:a3 type:a4 destination:a5 session:a6 options:a7 priority:a8 replyID:0 response:a9];
}

- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8
{
  return [(MRIDSCompanionConnection *)self _sendMessage:a3 type:a4 destination:a5 session:a6 options:a7 priority:a8 replyID:0 response:0];
}

- (void)setMessageHandler:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  p_messageHandlers = (id *)&v8->_messageHandlers;
  if (!v8->_messageHandlers)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = *p_messageHandlers;
    id *p_messageHandlers = v10;
  }
  v12 = (void *)[v6 copy];
  v13 = (void *)MEMORY[0x1997190F0]();
  [*p_messageHandlers setObject:v13 forKeyedSubscript:v7];

  uint64_t v14 = _MRLogForCategory(9uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[MRIDSCompanionConnection setMessageHandler:forType:]();
  }

  objc_sync_exit(v8);
}

- (void)setMessageHandler:(id)a3 forType:(id)a4 destination:(id)a5 session:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = self;
  objc_sync_enter(v14);
  destinationMessageHandlers = v14->_destinationMessageHandlers;
  if (!destinationMessageHandlers)
  {
    id v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = v14->_destinationMessageHandlers;
    v14->_destinationMessageHandlers = v16;

    destinationMessageHandlers = v14->_destinationMessageHandlers;
  }
  id v18 = [(NSMutableDictionary *)destinationMessageHandlers objectForKeyedSubscript:v11];
  if (!v18)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)v14->_destinationMessageHandlers setObject:v18 forKeyedSubscript:v11];
  }
  v19 = (void *)[v10 copy];
  id v20 = [(MRIDSCompanionConnection *)v14 _configurationFromDestination:v12 session:v13];
  [v18 setObject:v19 forKeyedSubscript:v20];

  v21 = _MRLogForCategory(9uLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_super v22 = v14->_destinationMessageHandlers;
    int v23 = 138413058;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    v30 = v22;
    _os_log_debug_impl(&dword_194F3C000, v21, OS_LOG_TYPE_DEBUG, "[MRIDSCompanionConnection] Added destination handler for type=%@, destination=%@, session=%@, %@", (uint8_t *)&v23, 0x2Au);
  }

  objc_sync_exit(v14);
}

- (void)removeMessageHandlerForType:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_messageHandlers objectForKeyedSubscript:v4];

  if (v6)
  {
    [(NSMutableDictionary *)v5->_messageHandlers setObject:0 forKeyedSubscript:v4];
    id v7 = _MRLogForCategory(9uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[MRIDSCompanionConnection removeMessageHandlerForType:]();
    }
  }
  objc_sync_exit(v5);
}

- (void)removeMessageHandlerForType:(id)a3 destination:(id)a4 session:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  objc_sync_enter(v11);
  id v12 = [(MRIDSCompanionConnection *)v11 _configurationFromDestination:v9 session:v10];
  id v13 = [(NSMutableDictionary *)v11->_destinationMessageHandlers objectForKeyedSubscript:v8];
  uint64_t v14 = [v13 objectForKeyedSubscript:v12];

  if (v14)
  {
    id v15 = [(NSMutableDictionary *)v11->_destinationMessageHandlers objectForKeyedSubscript:v8];
    [v15 setObject:0 forKeyedSubscript:v12];

    id v16 = _MRLogForCategory(9uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      destinationMessageHandlers = v11->_destinationMessageHandlers;
      int v18 = 138413058;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      __int16 v25 = destinationMessageHandlers;
      _os_log_debug_impl(&dword_194F3C000, v16, OS_LOG_TYPE_DEBUG, "[MRIDSCompanionConnection] Remove destination handler for type=%@, destination=%@, session=%@, %@", (uint8_t *)&v18, 0x2Au);
    }
  }
  objc_sync_exit(v11);
}

- (void)handleDidReceiveResetConnectionRequest
{
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MRIDSCompanionConnection_handleDidReceiveResetConnectionRequest__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_async(calloutQueue, block);
}

void __66__MRIDSCompanionConnection_handleDidReceiveResetConnectionRequest__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MRIDSCompanionConnectionDeviceDidDisconnect" object:*(void *)(a1 + 32)];

  if ([*(id *)(a1 + 32) isConnected])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"MRIDSCompanionConnectionDeviceDidConnect" object:*(void *)(a1 + 32)];
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  char v37 = [v14 objectForKeyedSubscript:@"type"];
  id v39 = [v14 objectForKeyedSubscript:@"destination"];
  id v38 = [v14 objectForKeyedSubscript:@"session"];
  v41 = [v14 objectForKeyedSubscript:@"data"];
  v40 = [v14 objectForKeyedSubscript:@"messageid"];
  id v17 = [v14 objectForKeyedSubscript:@"replyid"];
  v36 = [[MRIDSCompanionMessage alloc] initWithID:v40 data:v41];
  int v18 = _MRLogForCategory(9uLL);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    StringRepresentation = (void *)MRDataCreateStringRepresentation(v41);
    *(_DWORD *)buf = 138413570;
    v54 = v40;
    __int16 v55 = 2112;
    id v56 = StringRepresentation;
    __int16 v57 = 2112;
    id v58 = v37;
    __int16 v59 = 2112;
    id v60 = v39;
    __int16 v61 = 2112;
    v62 = v38;
    __int16 v63 = 2112;
    v64 = v17;
    _os_log_impl(&dword_194F3C000, v18, OS_LOG_TYPE_DEFAULT, "[MRIDSCompanionConnection] Message received<%@>: data=%@ type=%@ destination=%@ session=%@ replyID=%@", buf, 0x3Eu);
  }
  if ([(IDSDevice *)self->_device isConnected])
  {
    __int16 v20 = self;
    objc_sync_enter(v20);
    id v21 = [(NSMutableDictionary *)v20->_messageHandlers objectForKeyedSubscript:v37];
    __int16 v22 = [(NSMutableDictionary *)v20->_destinationMessageHandlers objectForKeyedSubscript:v37];
    id v23 = [(MRIDSCompanionConnection *)v20 _configurationFromDestination:v39 session:v38];
    v35 = [v22 objectForKeyedSubscript:v23];

    if (v17)
    {
      __int16 v24 = [(NSMutableDictionary *)v20->_responseHandlers objectForKeyedSubscript:v17];
      [(NSMutableDictionary *)v20->_responseHandlers setObject:0 forKeyedSubscript:v17];
    }
    else
    {
      __int16 v24 = 0;
    }

    objc_sync_exit(v20);
    if (v24)
    {
      dispatch_queue_t queue = v17;
      id v25 = v16;
      id v26 = v15;
      id v27 = v13;
      id v28 = v12;
      calloutQueue = v20->_calloutQueue;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke;
      v50[3] = &unk_1E57D0DB8;
      v30 = &v52;
      id v52 = v24;
      uint64_t v31 = (id *)&v51;
      v51 = v36;
      v32 = v50;
    }
    else
    {
      if (v21)
      {
        queuea = v20->_calloutQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke_2;
        block[3] = &unk_1E57D2A00;
        id v49 = v21;
        id v46 = v36;
        id v47 = v39;
        id v48 = v38;
        dispatch_async(queuea, block);
      }
      if (!v35) {
        goto LABEL_16;
      }
      dispatch_queue_t queue = v17;
      id v25 = v16;
      id v26 = v15;
      id v27 = v13;
      id v28 = v12;
      calloutQueue = v20->_calloutQueue;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke_3;
      v42[3] = &unk_1E57D0DB8;
      v30 = &v44;
      id v44 = v35;
      uint64_t v31 = (id *)&v43;
      uint64_t v43 = v36;
      v32 = v42;
    }
    dispatch_async(calloutQueue, v32);

    id v12 = v28;
    id v13 = v27;
    id v15 = v26;
    id v16 = v25;
    id v17 = queue;

LABEL_16:
    goto LABEL_17;
  }
  id v21 = _MRLogForCategory(9uLL);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[MRIDSCompanionConnection service:account:incomingMessage:fromID:context:](v21);
  }
LABEL_17:
}

uint64_t __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __75__MRIDSCompanionConnection_service_account_incomingMessage_fromID_context___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_maybeDeviceConnectionStatusChanged
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  id v3 = [(IDSService *)self->_service devices];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v9 isDefaultPairedDevice] && objc_msgSend(v9, "isConnected"))
        {
          id v10 = v9;

          id v6 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }
  id v11 = [(MRIDSCompanionConnection *)self device];
  if (v6 != v11 && ([v6 isEqual:v11] & 1) == 0)
  {
    id v12 = [v11 name];

    id v13 = _MRLogForCategory(9uLL);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        id v15 = [v11 name];
        id v16 = [v6 name];
        *(_DWORD *)buf = 138544130;
        __int16 v29 = @"MRIDSCompanionConnection";
        __int16 v30 = 2114;
        uint64_t v31 = @"active paired device";
        __int16 v32 = 2112;
        v33 = v15;
        __int16 v34 = 2112;
        v35 = v16;
        _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ from <%@> to <%@>", buf, 0x2Au);

LABEL_20:
      }
    }
    else if (v14)
    {
      id v15 = [v6 name];
      *(_DWORD *)buf = 138543874;
      __int16 v29 = @"MRIDSCompanionConnection";
      __int16 v30 = 2114;
      uint64_t v31 = @"active paired device";
      __int16 v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_194F3C000, v13, OS_LOG_TYPE_DEFAULT, "Set: %{public}@ setting %{public}@ to <%@>", buf, 0x20u);
      goto LABEL_20;
    }

    [(MRIDSCompanionConnection *)self setDevice:v6];
    id v17 = @"MRIDSCompanionConnectionDeviceDidConnect";
    if (!v6) {
      id v17 = @"MRIDSCompanionConnectionDeviceDidDisconnect";
    }
    int v18 = v17;
    calloutQueue = self->_calloutQueue;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __63__MRIDSCompanionConnection__maybeDeviceConnectionStatusChanged__block_invoke;
    v21[3] = &unk_1E57D0790;
    __int16 v22 = v18;
    id v23 = self;
    __int16 v20 = v18;
    dispatch_async(calloutQueue, v21);
  }
}

void __63__MRIDSCompanionConnection__maybeDeviceConnectionStatusChanged__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*(void *)(a1 + 32) object:*(void *)(a1 + 40)];
}

- (unint64_t)_generateMessageID
{
  id v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_totalOutgoingMessageCount + 1;
  v2->_totalOutgoingMessageCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (id)_configurationFromDestination:(id)a3 session:(id)a4
{
  uint64_t v5 = (objc_class *)NSString;
  id v6 = (__CFString *)a4;
  uint64_t v7 = (__CFString *)a3;
  id v8 = [v5 alloc];
  id v9 = @"default";
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = @"default";
  }
  if (v6) {
    id v9 = v6;
  }
  id v11 = (void *)[v8 initWithFormat:@"%@-%@", v10, v9];

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_destinationMessageHandlers, 0);
  objc_storeStrong((id *)&self->_messageHandlers, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (void)_sendMessage:(uint64_t)a1 type:(NSObject *)a2 destination:session:options:priority:replyID:response:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "[MRIDSCompanionConnection] Error %@ sending message", (uint8_t *)&v2, 0xCu);
}

- (void)_sendMessage:(os_log_t)log type:destination:session:options:priority:replyID:response:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_194F3C000, log, OS_LOG_TYPE_FAULT, "Attempting to send IDS messages before first unlock", v1, 2u);
}

- (void)setMessageHandler:forType:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_194F3C000, v0, v1, "[MRIDSCompanionConnection] Added handler for %@ %@");
}

- (void)removeMessageHandlerForType:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_2(&dword_194F3C000, v0, v1, "[MRIDSCompanionConnection] Remove handler for type=%@, %@");
}

- (void)service:(os_log_t)log account:incomingMessage:fromID:context:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_194F3C000, log, OS_LOG_TYPE_ERROR, "[MRIDSCompanionConnection] Dropping message because sender device is not yet connected", v1, 2u);
}

@end