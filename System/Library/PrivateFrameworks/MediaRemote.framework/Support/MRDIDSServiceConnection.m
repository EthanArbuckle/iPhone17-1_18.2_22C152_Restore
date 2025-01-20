@interface MRDIDSServiceConnection
- (BOOL)isConnected;
- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8;
- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 response:(id)a9;
- (IDSDevice)device;
- (IDSService)idsService;
- (MRDIDSService)mrService;
- (MRDIDSServiceConnection)init;
- (MRDIDSServiceConnection)initWithDevice:(id)a3;
- (MRDIDSServiceConnection)initWithDeviceUID:(id)a3;
- (NSString)debugDescription;
- (NSString)deviceUID;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)_configurationFromDestination:(id)a3 session:(id)a4;
- (id)connectionHandler;
- (id)invalidationHandler;
- (unint64_t)_generateMessageID;
- (unint64_t)totalOutgoingMessageCount;
- (void)_maybeDeviceConnectionStatusChanged;
- (void)dealloc;
- (void)handleDidReceiveResetConnectionRequest;
- (void)handleIncomingMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 messageID:(id)a7 replyID:(id)a8;
- (void)removeMessageHandlerForType:(id)a3;
- (void)removeMessageHandlerForType:(id)a3 destination:(id)a4 session:(id)a5;
- (void)resetConnection;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setConnectionHandler:(id)a3;
- (void)setDevice:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMessageHandler:(id)a3 forType:(id)a4;
- (void)setMessageHandler:(id)a3 forType:(id)a4 destination:(id)a5 session:(id)a6;
- (void)setQueue:(id)a3;
@end

@implementation MRDIDSServiceConnection

- (MRDIDSServiceConnection)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRDIDSServiceConnection;
  v2 = [(MRDIDSServiceConnection *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaremote.MRDIDSServiceConnection", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[MRDIDSService sharedService];
    mrService = v2->_mrService;
    v2->_mrService = (MRDIDSService *)v6;

    uint64_t v8 = [(MRDIDSService *)v2->_mrService idsService];
    idsService = v2->_idsService;
    v2->_idsService = (IDSService *)v8;

    [(IDSService *)v2->_idsService addDelegate:v2 queue:v2->_queue];
  }
  return v2;
}

- (MRDIDSServiceConnection)initWithDevice:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueIDOverride];
  uint64_t v6 = [(MRDIDSServiceConnection *)self initWithDeviceUID:v5];

  if (v6) {
    [(MRDIDSServiceConnection *)v6 setDevice:v4];
  }

  return v6;
}

- (MRDIDSServiceConnection)initWithDeviceUID:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(MRDIDSServiceConnection *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_deviceUID, a3);
    objc_initWeak(&location, v7);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100157CFC;
    v12[3] = &unk_10041ED38;
    objc_copyWeak(&v13, &location);
    [(MRDIDSServiceConnection *)v7 setMessageHandler:v12 forType:MRIDSServiceMessageTypeResetConnection];
    queue = v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100157D3C;
    block[3] = &unk_100415CC8;
    objc_super v11 = v7;
    dispatch_async(queue, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  if (self->_serviceHandlerToken)
  {
    -[MRDIDSService removeHandler:](self->_mrService, "removeHandler:");
    id serviceHandlerToken = self->_serviceHandlerToken;
    self->_id serviceHandlerToken = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MRDIDSServiceConnection;
  [(MRDIDSServiceConnection *)&v4 dealloc];
}

- (NSString)debugDescription
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"<%@:%p {\n", objc_opt_class(), self];
  objc_super v4 = self;
  objc_sync_enter(v4);
  [v3 appendFormat:@" deviceUID = %@\n", v4->_deviceUID];
  id v5 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" device = %@\n", v5];

  [v3 appendFormat:@" service = %@\n", v4->_mrService];
  uint64_t v6 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" messageHandlers = %@\n", v6];

  v7 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" destinationMessageHandlers = %@\n", v7];

  uint64_t v8 = MRCreateIndentedDebugDescriptionFromObject();
  [v3 appendFormat:@" responseMessageHandlers = %@\n", v8];

  [v3 appendFormat:@" deviceMessageHandler = %@\n", v4->_serviceHandlerToken];
  id v9 = objc_retainBlock(v4->_invalidationHandler);
  [v3 appendFormat:@" invalidationHandler = %@\n", v9];

  id v10 = objc_retainBlock(v4->_connectionHandler);
  [v3 appendFormat:@" connectionHandler = %@\n", v10];

  objc_sync_exit(v4);
  [v3 appendFormat:@"}>"];

  return (NSString *)v3;
}

- (void)setDevice:(id)a3
{
  objc_super v4 = (IDSDevice *)a3;
  id v5 = _MRLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(MRDIDSServiceConnection *)self device];
    v7 = [v6 uniqueIDOverride];
    *(_DWORD *)buf = 138412802;
    v17 = self;
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2112;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[MRDIDSServiceConnection] %@ Setting IDSDevice from %@ to %@", buf, 0x20u);
  }
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if (v8->_serviceHandlerToken)
  {
    -[MRDIDSService removeHandler:](v8->_mrService, "removeHandler:");
    id serviceHandlerToken = v8->_serviceHandlerToken;
    v8->_id serviceHandlerToken = 0;
  }
  if (v4)
  {
    objc_initWeak((id *)buf, v8);
    mrService = v8->_mrService;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100158188;
    v14[3] = &unk_10041ED60;
    objc_copyWeak(&v15, (id *)buf);
    uint64_t v11 = [(MRDIDSService *)mrService _addMessageHandlerForDevice:v4 handler:v14];
    id v12 = v8->_serviceHandlerToken;
    v8->_id serviceHandlerToken = (id)v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  device = v8->_device;
  v8->_device = v4;

  objc_sync_exit(v8);
}

- (IDSDevice)device
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_device;
  objc_sync_exit(v2);

  return v3;
}

- (NSString)name
{
  v2 = [(MRDIDSServiceConnection *)self device];
  id v3 = [v2 name];

  return (NSString *)v3;
}

- (BOOL)isConnected
{
  v2 = [(MRDIDSServiceConnection *)self device];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)resetConnection
{
  if ([(MRDIDSServiceConnection *)self isConnected])
  {
    uint64_t v3 = MRIDSServiceMessageTypeResetConnection;
    [(MRDIDSServiceConnection *)self sendMessage:0 type:v3 destination:0 session:0 options:0 priority:300];
  }
}

- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8
{
  return [(MRDIDSServiceConnection *)self sendMessage:a3 type:a4 destination:a5 session:a6 options:a7 priority:a8 response:0];
}

- (BOOL)sendMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 options:(id)a7 priority:(int64_t)a8 response:(id)a9
{
  mrService = self->_mrService;
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = [(MRDIDSServiceConnection *)self device];
  LOBYTE(a8) = [(MRDIDSService *)mrService _sendMessage:v22 device:v23 type:v21 destination:v20 session:v19 options:v18 priority:a8 replyID:0 response:v17];

  return a8;
}

- (void)setMessageHandler:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  objc_sync_enter(v8);
  if (!v8->_messageHandlers)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageHandlers = v8->_messageHandlers;
    v8->_messageHandlers = v9;
  }
  id v11 = [v6 copy];
  id v12 = objc_retainBlock(v11);
  [(NSMutableDictionary *)v8->_messageHandlers setObject:v12 forKeyedSubscript:v7];

  id v13 = _MRLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = v8->_messageHandlers;
    int v15 = 138412802;
    v16 = v8;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[MRDIDSServiceConnection] %@ Added handler for %@ %@", (uint8_t *)&v15, 0x20u);
  }

  objc_sync_exit(v8);
}

- (void)setMessageHandler:(id)a3 forType:(id)a4 destination:(id)a5 session:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  destinationMessageHandlers = v14->_destinationMessageHandlers;
  if (!destinationMessageHandlers)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    __int16 v17 = v14->_destinationMessageHandlers;
    v14->_destinationMessageHandlers = v16;

    destinationMessageHandlers = v14->_destinationMessageHandlers;
  }
  id v18 = [(NSMutableDictionary *)destinationMessageHandlers objectForKeyedSubscript:v11];
  if (!v18)
  {
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableDictionary *)v14->_destinationMessageHandlers setObject:v18 forKeyedSubscript:v11];
  }
  id v19 = [v10 copy];
  id v20 = [(MRDIDSServiceConnection *)v14 _configurationFromDestination:v12 session:v13];
  [v18 setObject:v19 forKeyedSubscript:v20];

  id v21 = _MRLogForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    id v22 = v14->_destinationMessageHandlers;
    int v23 = 138413058;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    id v28 = v13;
    __int16 v29 = 2112;
    v30 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[MRDIDSServiceConnection] Added destination handler for type=%@, destination=%@, session=%@, %@", (uint8_t *)&v23, 0x2Au);
  }

  objc_sync_exit(v14);
}

- (void)removeMessageHandlerForType:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_messageHandlers objectForKeyedSubscript:v4];

  if (v6)
  {
    [(NSMutableDictionary *)v5->_messageHandlers setObject:0 forKeyedSubscript:v4];
    id v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100331214((uint64_t)v4, (uint64_t *)&v5->_messageHandlers, v7);
    }
  }
  objc_sync_exit(v5);
}

- (void)removeMessageHandlerForType:(id)a3 destination:(id)a4 session:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  objc_sync_enter(v11);
  id v12 = [(MRDIDSServiceConnection *)v11 _configurationFromDestination:v9 session:v10];
  id v13 = [(NSMutableDictionary *)v11->_destinationMessageHandlers objectForKeyedSubscript:v8];
  v14 = [v13 objectForKeyedSubscript:v12];

  if (v14)
  {
    int v15 = [(NSMutableDictionary *)v11->_destinationMessageHandlers objectForKeyedSubscript:v8];
    [v15 setObject:0 forKeyedSubscript:v12];

    v16 = _MRLogForCategory();
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
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[MRDIDSServiceConnection] Remove destination handler for type=%@, destination=%@, session=%@, %@", (uint8_t *)&v18, 0x2Au);
    }
  }
  objc_sync_exit(v11);
}

- (void)handleDidReceiveResetConnectionRequest
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100158B10;
  block[3] = &unk_100415CC8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
}

- (void)handleIncomingMessage:(id)a3 type:(id)a4 destination:(id)a5 session:(id)a6 messageID:(id)a7 replyID:(id)a8
{
  id v32 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v31 = a7;
  id v17 = a8;
  int v18 = _MRLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v32 data];
    *(_DWORD *)buf = 138413826;
    v45 = self;
    __int16 v46 = 2112;
    id v47 = v31;
    __int16 v48 = 2112;
    v49 = v19;
    __int16 v50 = 2112;
    id v51 = v14;
    __int16 v52 = 2112;
    id v53 = v15;
    __int16 v54 = 2112;
    id v55 = v16;
    __int16 v56 = 2112;
    id v57 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[MRDIDSServiceConnection] %@ Message received<%@>: data=%@ type=%@ destination=%@ session=%@ replyID=%@", buf, 0x48u);
  }
  __int16 v20 = self;
  objc_sync_enter(v20);
  id v21 = [(NSMutableDictionary *)v20->_messageHandlers objectForKeyedSubscript:v14];
  __int16 v22 = [(NSMutableDictionary *)v20->_destinationMessageHandlers objectForKeyedSubscript:v14];
  id v23 = [(MRDIDSServiceConnection *)v20 _configurationFromDestination:v15 session:v16];
  __int16 v24 = [v22 objectForKeyedSubscript:v23];

  if (v17)
  {
    __int16 v25 = [(NSMutableDictionary *)v20->_responseHandlers objectForKeyedSubscript:v17];
    [(NSMutableDictionary *)v20->_responseHandlers setObject:0 forKeyedSubscript:v17];
  }
  else
  {
    __int16 v25 = 0;
  }

  objc_sync_exit(v20);
  if (v25)
  {
    queue = v20->_queue;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100158FF8;
    v41[3] = &unk_100417A50;
    __int16 v27 = &v43;
    id v43 = v25;
    id v28 = &v42;
    id v42 = v32;
    __int16 v29 = v41;
LABEL_12:
    dispatch_async(queue, v29);

    goto LABEL_13;
  }
  if (v21)
  {
    v30 = v20->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10015900C;
    block[3] = &unk_100419F78;
    id v40 = v21;
    id v37 = v32;
    id v38 = v15;
    id v39 = v16;
    dispatch_async(v30, block);
  }
  if (v24)
  {
    queue = v20->_queue;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100159024;
    v33[3] = &unk_100417A50;
    __int16 v27 = &v35;
    id v35 = v24;
    id v28 = &v34;
    id v34 = v32;
    __int16 v29 = v33;
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_maybeDeviceConnectionStatusChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(IDSService *)self->_idsService devices];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v8 = [v7 uniqueIDOverride];
        id v9 = [(MRDIDSServiceConnection *)self deviceUID];
        unsigned int v10 = [v8 isEqualToString:v9];

        if (v10)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v11 = [(MRDIDSServiceConnection *)self device];
  if (v4 != v11 && ([v4 isEqual:v11] & 1) == 0)
  {
    [(MRDIDSServiceConnection *)self setDevice:v4];
    id v12 = self;
    objc_sync_enter(v12);
    if (v4)
    {
      unint64_t v13 = (unint64_t)[v12->_connectionHandler copy];
      unint64_t v14 = 0;
    }
    else
    {
      unint64_t v14 = (unint64_t)[v12->_invalidationHandler copy];
      unint64_t v13 = 0;
    }
    objc_sync_exit(v12);

    if (v13 | v14)
    {
      queue = self->_queue;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1001592B0;
      v16[3] = &unk_10041ED88;
      id v17 = (id)v13;
      id v18 = (id)v14;
      dispatch_async((dispatch_queue_t)queue, v16);
    }
  }
}

- (unint64_t)_generateMessageID
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t v3 = v2->_totalOutgoingMessageCount + 1;
  v2->_totalOutgoingMessageCount = v3;
  objc_sync_exit(v2);

  return v3;
}

- (id)_configurationFromDestination:(id)a3 session:(id)a4
{
  uint64_t v5 = (__CFString *)a4;
  id v6 = (__CFString *)a3;
  id v7 = objc_alloc((Class)NSString);
  CFStringRef v8 = @"default";
  if (v6) {
    CFStringRef v9 = v6;
  }
  else {
    CFStringRef v9 = @"default";
  }
  if (v5) {
    CFStringRef v8 = v5;
  }
  id v10 = [v7 initWithFormat:@"%@-%@", v9, v8];

  return v10;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (MRDIDSService)mrService
{
  return self->_mrService;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)totalOutgoingMessageCount
{
  return self->_totalOutgoingMessageCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_mrService, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong(&self->_serviceHandlerToken, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
  objc_storeStrong((id *)&self->_destinationMessageHandlers, 0);

  objc_storeStrong((id *)&self->_messageHandlers, 0);
}

@end