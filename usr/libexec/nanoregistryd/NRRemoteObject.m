@interface NRRemoteObject
+ (BOOL)messagesShouldHaveValidSender;
+ (id)trafficClassQueue;
- (BOOL)_updateDPDAndReturnYESIfChangeWithDevice:(id)a3;
- (BOOL)hasAccounts;
- (BOOL)isAlwaysConnected;
- (BOOL)isDisconnected;
- (BOOL)isIDSConnected;
- (BOOL)isIDSConnectedNotification;
- (BOOL)isIDSNearby;
- (BOOL)isIncomingMessageDeliveryQueueSuspended;
- (IDSService)service;
- (NRImmutableIDSDevice)defaultPairedDevice;
- (NRRemoteObject)initWithServiceName:(id)a3;
- (NRRemoteObject)initWithServiceName:(id)a3 andClientQueue:(id)a4;
- (NRRemoteObject)initWithServiceName:(id)a3 andClientQueue:(id)a4 andDelegate:(id)a5;
- (NRRemoteObject)initWithServiceName:(id)a3 isAlwaysConnected:(BOOL)a4 andClientQueue:(id)a5 andDelegate:(id)a6;
- (NRRemoteObjectDelegate)delegate;
- (NSMapTable)shortcutMessages;
- (NSPointerArray)connectivityObservers;
- (NSSet)deviceUniqueIdentifiers;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)incomingMessageDeliveryQueue;
- (id)_areAccountsAndDevicesPresent:(id)a3 andDevices:(id)a4;
- (id)_lookupDestinations:(id)a3;
- (id)_rawDefaultPairedDevice;
- (id)deprecatedIDSDeviceIdentifierForBTUUID:(id)a3;
- (id)idsDeviceIdentifierForBTUUID:(id)a3;
- (void)_fireIDSAvailableDelegateIfNeededWithIDSDevice:(id)a3;
- (void)_generateNearbyConnectedDelegateCalls;
- (void)_messageResponseTimeout:(id)a3;
- (void)_queueSendCloudMessage:(id)a3 type:(unsigned __int16)a4 responseToRequest:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 priority:(int64_t)a10 toDestinations:(id)a11 skipLookup:(BOOL)a12 didSend:(id)a13 andResponse:(id)a14;
- (void)_queueSendMessage:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 priority:(int64_t)a10 toIDSBTUUID:(id)a11 didSend:(id)a12 andResponse:(id)a13;
- (void)_resumeMessageDeliveryQueue;
- (void)_sendCloudMessage:(id)a3 type:(unsigned __int16)a4 responseToRequest:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 priority:(int64_t)a10 toDestinations:(id)a11 skipLookup:(BOOL)a12 didSend:(id)a13 andResponse:(id)a14;
- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 priority:(int64_t)a10 toIDSBTUUID:(id)a11 didSend:(id)a12 andResponse:(id)a13;
- (void)_setIDSConnected:(BOOL)a3;
- (void)_setIDSNearby:(BOOL)a3;
- (void)_storeProtobufAction:(SEL)a3 messageType:(unsigned __int16)a4 messageSendType:(int64_t)a5 connectedOnly:(BOOL)a6;
- (void)_suspendMessageDeliveryQueue;
- (void)_updateIDSDeviceUniqueIdentifiers;
- (void)_updateTrafficClassesWithClasses:(id)a3;
- (void)addConnectivityObserver:(id)a3;
- (void)dealloc;
- (void)handleIncomingMessage:(id)a3;
- (void)invalidate;
- (void)removeConnectivityObserver:(id)a3;
- (void)sendCloudRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 toDestinations:(id)a10 didSend:(id)a11 andResponse:(id)a12;
- (void)sendCloudResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 didSend:(id)a10;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 toIDSBTUUID:(id)a5;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 toIDSBTUUID:(id)a5 didSend:(id)a6;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 toIDSBTUUID:(id)a6 didSend:(id)a7;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 toIDSBTUUID:(id)a7 didSend:(id)a8;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 toIDSBTUUID:(id)a10 didSend:(id)a11 andResponse:(id)a12;
- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 didSend:(id)a10;
- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 didSend:(id)a10;
- (void)sendTinkerRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 toDestinations:(id)a10 didSend:(id)a11 andResponse:(id)a12;
- (void)sendTinkerResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 didSend:(id)a10;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)setAlwaysConnected:(BOOL)a3;
- (void)setAlwaysProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4;
- (void)setAlwaysProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4;
- (void)setClientQueue:(id)a3;
- (void)setConnectedProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4;
- (void)setConnectedProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4;
- (void)setConnectivityObservers:(id)a3;
- (void)setDefaultPairedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceUniqueIdentifiers:(id)a3;
- (void)setDisconnected:(BOOL)a3;
- (void)setHasAccounts:(BOOL)a3;
- (void)setIDSConnected:(BOOL)a3;
- (void)setIDSNearby:(BOOL)a3;
- (void)setIncomingMessageDeliveryQueue:(id)a3;
- (void)setIsAlwaysConnected:(BOOL)a3;
- (void)setIsIDSConnectedNotification:(BOOL)a3;
- (void)setIsIncomingMessageDeliveryQueueSuspended:(BOOL)a3;
- (void)setShortcutMessages:(id)a3;
- (void)updateTrafficClassesWithClasses:(id)a3;
@end

@implementation NRRemoteObject

- (BOOL)isIDSConnectedNotification
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BE3FC;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)defaultPairedDeviceQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsIDSConnectedNotification:(BOOL)a3
{
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BE488;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)defaultPairedDeviceQueue, v4);
}

- (BOOL)isIDSNearby
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BE544;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)defaultPairedDeviceQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isIDSConnected
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BE620;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)defaultPairedDeviceQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIDSNearby:(BOOL)a3
{
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BE6C8;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)defaultPairedDeviceQueue, v4);
}

- (void)setIDSConnected:(BOOL)a3
{
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BE750;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)defaultPairedDeviceQueue, v4);
}

- (void)_setIDSNearby:(BOOL)a3
{
  self->_isIDSNearby = a3;
  [(NRRemoteObject *)self _generateNearbyConnectedDelegateCalls];
}

- (void)_setIDSConnected:(BOOL)a3
{
  self->_isIDSConnected = a3;
  [(NRRemoteObject *)self _generateNearbyConnectedDelegateCalls];
}

- (void)_generateNearbyConnectedDelegateCalls
{
  if (self->_disconnected)
  {
    BOOL isIDSNearby = 0;
    BOOL isIDSConnected = 0;
  }
  else
  {
    BOOL isIDSNearby = self->_isIDSNearby;
    BOOL isIDSConnected = self->_isIDSConnected;
  }
  if (self->_wasIDSNearby != isIDSNearby)
  {
    BOOL v25 = isIDSConnected;
    self->_wasIDSNearby = isIDSNearby;
    BOOL v5 = [(NRRemoteObject *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      clientQueue = self->_clientQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000BEB30;
      block[3] = &unk_1001660F8;
      block[4] = self;
      BOOL v41 = isIDSNearby;
      dispatch_async((dispatch_queue_t)clientQueue, block);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v8 = [(NRRemoteObject *)self connectivityObservers];
    id v9 = [v8 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v37;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            v14 = self->_clientQueue;
            v34[0] = _NSConcreteStackBlock;
            v34[1] = 3221225472;
            v34[2] = sub_1000BEB88;
            v34[3] = &unk_100167BE0;
            v34[4] = v13;
            v34[5] = self;
            BOOL v35 = isIDSNearby;
            dispatch_async((dispatch_queue_t)v14, v34);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v10);
    }

    BOOL isIDSConnected = v25;
  }
  if (self->_wasIDSConnected != isIDSConnected)
  {
    self->_wasIDSConnected = isIDSConnected;
    v15 = [(NRRemoteObject *)self delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = self->_clientQueue;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000BEB98;
      v32[3] = &unk_1001660F8;
      v32[4] = self;
      BOOL v33 = isIDSConnected;
      dispatch_async((dispatch_queue_t)v17, v32);
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v18 = [(NRRemoteObject *)self connectivityObservers];
    id v19 = [v18 countByEnumeratingWithState:&v28 objects:v42 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * (void)j);
          if (objc_opt_respondsToSelector())
          {
            v24 = self->_clientQueue;
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_1000BEBF0;
            v26[3] = &unk_100167BE0;
            v26[4] = v23;
            v26[5] = self;
            BOOL v27 = isIDSConnected;
            dispatch_async((dispatch_queue_t)v24, v26);
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v28 objects:v42 count:16];
      }
      while (v20);
    }
  }
}

- (BOOL)isDisconnected
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BECAC;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)defaultPairedDeviceQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSSet)deviceUniqueIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_1000BEDB0;
  id v10 = sub_1000BEDC0;
  id v11 = 0;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BEDC8;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)defaultPairedDeviceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (void)setDeviceUniqueIdentifiers:(id)a3
{
  id v4 = a3;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BEE74;
  v7[3] = &unk_100165530;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)defaultPairedDeviceQueue, v7);
}

- (BOOL)hasAccounts
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BF074;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)defaultPairedDeviceQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setHasAccounts:(BOOL)a3
{
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BF100;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)defaultPairedDeviceQueue, v4);
}

- (void)setDisconnected:(BOOL)a3
{
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BF194;
  v4[3] = &unk_1001660F8;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)defaultPairedDeviceQueue, v4);
}

- (BOOL)isAlwaysConnected
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  idsQueue = self->_idsQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BF72C;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)idsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setIsAlwaysConnected:(BOOL)a3
{
  idsQueue = self->_idsQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BF7B8;
  v4[3] = &unk_1001660F8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)idsQueue, v4);
}

- (NRImmutableIDSDevice)defaultPairedDevice
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_1000BEDB0;
  id v10 = sub_1000BEDC0;
  id v11 = 0;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BF8C8;
  v5[3] = &unk_1001668D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)defaultPairedDeviceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NRImmutableIDSDevice *)v3;
}

- (id)_rawDefaultPairedDevice
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_1000BEDB0;
  id v10 = sub_1000BEDC0;
  id v11 = 0;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BFA1C;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)defaultPairedDeviceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setDefaultPairedDevice:(id)a3
{
  id v4 = a3;
  defaultPairedDeviceQueue = self->_defaultPairedDeviceQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BFAC8;
  v7[3] = &unk_100165530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)defaultPairedDeviceQueue, v7);
}

- (NRRemoteObjectDelegate)delegate
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_1000BEDB0;
  id v10 = sub_1000BEDC0;
  id v11 = 0;
  delegateQueue = self->_delegateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BFC18;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)delegateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NRRemoteObjectDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BFCFC;
  v7[3] = &unk_100165530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)delegateQueue, v7);
}

- (void)addConnectivityObserver:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BFDA0;
  v7[3] = &unk_100165530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)delegateQueue, v7);
}

- (void)removeConnectivityObserver:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BFE7C;
  v7[3] = &unk_100165530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)delegateQueue, v7);
}

- (NSPointerArray)connectivityObservers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_1000BEDB0;
  id v10 = sub_1000BEDC0;
  id v11 = 0;
  delegateQueue = self->_delegateQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C0004;
  v5[3] = &unk_100165840;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)delegateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSPointerArray *)v3;
}

- (void)setConnectivityObservers:(id)a3
{
  id v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C00EC;
  v7[3] = &unk_100165530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)delegateQueue, v7);
}

- (NRRemoteObject)initWithServiceName:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Init NRRemoteObject: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  id v8 = [(NRRemoteObject *)self initWithServiceName:v4 andClientQueue:0];

  return v8;
}

- (NRRemoteObject)initWithServiceName:(id)a3 andClientQueue:(id)a4
{
  return [(NRRemoteObject *)self initWithServiceName:a3 andClientQueue:0 andDelegate:0];
}

- (NRRemoteObject)initWithServiceName:(id)a3 andClientQueue:(id)a4 andDelegate:(id)a5
{
  return [(NRRemoteObject *)self initWithServiceName:a3 isAlwaysConnected:0 andClientQueue:a4 andDelegate:a5];
}

- (NRRemoteObject)initWithServiceName:(id)a3 isAlwaysConnected:(BOOL)a4 andClientQueue:(id)a5 andDelegate:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v66.receiver = self;
  v66.super_class = (Class)NRRemoteObject;
  id v13 = [(NRRemoteObject *)&v66 init];
  if (v13)
  {
    v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      char v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v17 = @"NO";
        if (v8) {
          CFStringRef v17 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        id v68 = v10;
        __int16 v69 = 2112;
        CFStringRef v70 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Init NRRemoteObject (name: %@, alwaysConnected: %@)", buf, 0x16u);
      }
    }
    *((unsigned char *)v13 + 85) = v8;
    id v18 = [v10 copy];
    id v19 = (void *)*((void *)v13 + 4);
    *((void *)v13 + 4) = v18;

    id v20 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v21 = (void *)*((void *)v13 + 1);
    *((void *)v13 + 1) = v20;

    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v23 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v22;

    id v24 = objc_alloc_init((Class)NSMutableDictionary);
    BOOL v25 = (void *)*((void *)v13 + 3);
    *((void *)v13 + 3) = v24;

    uint64_t v26 = +[NSPointerArray weakObjectsPointerArray];
    BOOL v27 = (void *)*((void *)v13 + 14);
    *((void *)v13 + 14) = v26;

    uint64_t v28 = +[NSMapTable weakToStrongObjectsMapTable];
    long long v29 = (void *)*((void *)v13 + 18);
    *((void *)v13 + 18) = v28;

    long long v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v31 = v10;
    dispatch_queue_t v32 = dispatch_queue_create((const char *)[v31 UTF8String], v30);
    BOOL v33 = (void *)*((void *)v13 + 5);
    *((void *)v13 + 5) = v32;

    id v60 = v11;
    if (v11)
    {
      id v34 = v11;
      id v35 = (id)*((void *)v13 + 15);
      *((void *)v13 + 15) = v34;
    }
    else
    {
      id v35 = [v31 stringByAppendingString:@".client"];
      dispatch_queue_t v36 = dispatch_queue_create((const char *)[v35 UTF8String], v30);
      long long v37 = (void *)*((void *)v13 + 15);
      *((void *)v13 + 15) = v36;
    }
    id v38 = [v31 stringByAppendingString:@".incomingDeliveryQueue"];
    dispatch_queue_t v39 = dispatch_queue_create_with_target_V2((const char *)[v38 UTF8String], v30, *((dispatch_queue_t *)v13 + 15));
    v40 = (void *)*((void *)v13 + 17);
    *((void *)v13 + 17) = v39;

    id v41 = [v31 stringByAppendingString:@".delegate"];
    dispatch_queue_t v42 = dispatch_queue_create((const char *)[v41 UTF8String], v30);
    v43 = (void *)*((void *)v13 + 6);
    *((void *)v13 + 6) = v42;

    id v59 = v12;
    objc_storeWeak((id *)v13 + 13, v12);
    v44 = *((void *)v13 + 5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C06F8;
    block[3] = &unk_1001655F8;
    v45 = (id *)v13;
    v65 = v45;
    dispatch_sync(v44, block);
    id v46 = [v31 stringByAppendingString:@".DPD"];
    dispatch_queue_t v47 = dispatch_queue_create((const char *)[v46 UTF8String], v30);
    id v48 = v45[7];
    v45[7] = v47;

    id v49 = [objc_alloc((Class)IDSService) initWithService:*((void *)v13 + 4)];
    id v50 = v45[16];
    v45[16] = v49;

    id v51 = objc_alloc_init((Class)NSMutableDictionary);
    id v52 = v45[9];
    v45[9] = v51;

    [v45 registerProtobufHandlers];
    [v45[16] addDelegate:v45 queue:*((void *)v13 + 5)];
    [v45 setDisconnected:1];
    v53 = [v45 defaultPairedDevice];
    v54 = *((void *)v13 + 5);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000C070C;
    v61[3] = &unk_100165530;
    v62 = v45;
    id v63 = v53;
    id v55 = v53;
    dispatch_async(v54, v61);
    v56 = nr_daemon_log();
    LODWORD(v53) = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);

    if (v53)
    {
      v57 = nr_daemon_log();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v68 = v31;
        _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Created IDS service %@", buf, 0xCu);
      }
    }
    id v12 = v59;
    id v11 = v60;
  }

  return (NRRemoteObject *)v13;
}

- (void)_suspendMessageDeliveryQueue
{
  if (!self->_isIncomingMessageDeliveryQueueSuspended)
  {
    self->_isIncomingMessageDeliveryQueueSuspended = 1;
    dispatch_suspend((dispatch_object_t)self->_incomingMessageDeliveryQueue);
  }
}

- (void)_resumeMessageDeliveryQueue
{
  if (self->_isIncomingMessageDeliveryQueueSuspended)
  {
    self->_isIncomingMessageDeliveryQueueSuspended = 0;
    dispatch_resume((dispatch_object_t)self->_incomingMessageDeliveryQueue);
  }
}

- (void)dealloc
{
  if (self->_isIncomingMessageDeliveryQueueSuspended) {
    dispatch_resume((dispatch_object_t)self->_incomingMessageDeliveryQueue);
  }
  v3.receiver = self;
  v3.super_class = (Class)NRRemoteObject;
  [(NRRemoteObject *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      v14 = serviceName;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating NRRemoteObject service %@", buf, 0xCu);
    }
  }
  [(NRRemoteObject *)self setDefaultPairedDevice:0];
  idsQueue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0A74;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)idsQueue, block);
  [(NRRemoteObject *)self setDelegate:0];
  [(NRRemoteObject *)self setConnectivityObservers:0];
  BOOL v8 = nr_daemon_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = nr_daemon_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_serviceName;
      *(_DWORD *)buf = 138412290;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Invalidating NRRemoteObject service %@- complete", buf, 0xCu);
    }
  }
}

+ (BOOL)messagesShouldHaveValidSender
{
  return 0;
}

- (void)handleIncomingMessage:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = self->_serviceName;
      BOOL v9 = [v4 type];
      id v10 = [v4 data];
      id v11 = [v10 length];
      unsigned int v12 = [v4 isResponse];
      id v13 = &__kCFBooleanFalse;
      if (v12) {
        id v13 = &__kCFBooleanTrue;
      }
      *(_DWORD *)buf = 138413058;
      v74 = serviceName;
      __int16 v75 = 2048;
      v76 = v9;
      __int16 v77 = 2048;
      unint64_t v78 = (unint64_t)v11;
      __int16 v79 = 2112;
      id v80 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%@): IDS message received type=%ld length=%ld response=%@", buf, 0x2Au);
    }
  }
  if (![(id)objc_opt_class() messagesShouldHaveValidSender]) {
    goto LABEL_9;
  }
  service = self->_service;
  BOOL v15 = [v4 context];
  char v16 = [v15 fromID];
  CFStringRef v17 = [(IDSService *)service linkedDeviceForFromID:v16 withRelationship:3];

  if (v17)
  {
LABEL_9:
    id v18 = [v4 context];
    id v19 = [v18 incomingResponseIdentifier];

    if (![v4 isResponse] || !v19) {
      goto LABEL_21;
    }
    id v20 = [(NSMutableDictionary *)self->_idsSendIDToTimer objectForKeyedSubscript:v19];
    [v20 invalidate];
    [(NSMutableDictionary *)self->_idsSendIDToTimer removeObjectForKey:v19];
    uint64_t v21 = [(NSMutableDictionary *)self->_idsSendIDToResponseHandler objectForKeyedSubscript:v19];
    id v22 = nr_daemon_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      if (v23)
      {
        id v24 = nr_daemon_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v25 = self->_serviceName;
          *(_DWORD *)buf = 138412546;
          v74 = v25;
          __int16 v75 = 2114;
          v76 = v19;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "(%@): matched response %{public}@, executing block", buf, 0x16u);
        }
      }
      [(NSMutableDictionary *)self->_idsSendIDToResponseHandler removeObjectForKey:v19];
      uint64_t v26 = [(NSMapTable *)self->_shortcutMessages objectForKey:v4];
      unsigned int v27 = [v26 BOOLValue];
      uint64_t v28 = 136;
      if (v27) {
        uint64_t v28 = 120;
      }
      long long v29 = *(NSObject **)((char *)&self->super.isa + v28);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C185C;
      block[3] = &unk_1001669A0;
      v72 = v21;
      id v70 = v4;
      v71 = self;
      dispatch_async(v29, block);

      long long v30 = v72;
    }
    else
    {
      if (!v23) {
        goto LABEL_20;
      }
      long long v30 = nr_daemon_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v58 = self->_serviceName;
        *(_DWORD *)buf = 138412546;
        v74 = v58;
        __int16 v75 = 2114;
        v76 = v19;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "(%@): no ack block found for response %{public}@, ignoring", buf, 0x16u);
      }
    }

LABEL_20:
LABEL_21:
    if ([v4 isResponse]) {
      uint64_t v31 = 0x10000;
    }
    else {
      uint64_t v31 = 0;
    }
    dispatch_queue_t v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v31 | [v4 type]);
    BOOL v33 = [(NSMutableDictionary *)self->_idsRequestMessageTypeToSelector objectForKeyedSubscript:v32];
    id v34 = v33;
    if (v33)
    {
      id v35 = [v33 method];
      dispatch_queue_t v36 = nr_daemon_log();
      BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);

      if (v35)
      {
        if (v37)
        {
          id v38 = nr_daemon_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v39 = self->_serviceName;
            id v63 = NSStringFromSelector((SEL)[v34 selector]);
            unint64_t v61 = [v4 type];
            v64 = [v4 data];
            id v60 = [v64 length];
            unsigned int v40 = [v4 isResponse];
            id v41 = &__kCFBooleanFalse;
            if (v40) {
              id v41 = &__kCFBooleanTrue;
            }
            id v59 = v41;
            v62 = [v4 context];
            dispatch_queue_t v42 = [v62 fromID];
            *(_DWORD *)buf = 138413570;
            v74 = v39;
            __int16 v75 = 2114;
            v76 = v63;
            __int16 v77 = 2048;
            unint64_t v78 = v61;
            __int16 v79 = 2048;
            id v80 = v60;
            __int16 v81 = 2112;
            v82 = v59;
            __int16 v83 = 2114;
            v84 = v42;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "(%@): Calling selector %{public}@ for type=%ld length=%ld response=%@ messageSource=%{public}@", buf, 0x3Eu);
          }
        }
        if (([v34 connected] & 1) == 0) {
          [(NSMapTable *)self->_shortcutMessages setObject:&__kCFBooleanTrue forKey:v4];
        }
        unsigned int v43 = [v34 connected];
        uint64_t v44 = 120;
        if (v43) {
          uint64_t v44 = 136;
        }
        v45 = *(NSObject **)((char *)&self->super.isa + v44);
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_1000C193C;
        v65[3] = &unk_1001683A8;
        id v68 = v35;
        v65[4] = self;
        id v66 = v34;
        id v67 = v4;
        dispatch_async(v45, v65);

        goto LABEL_48;
      }
      if (v37)
      {
        id v48 = nr_daemon_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          id v49 = self->_serviceName;
          id v50 = [v4 type];
          id v51 = [v4 data];
          id v52 = [v51 length];
          unsigned int v55 = [v4 isResponse];
          v54 = &__kCFBooleanFalse;
          if (v55) {
            v54 = &__kCFBooleanTrue;
          }
LABEL_46:
          *(_DWORD *)buf = 138413058;
          v74 = v49;
          __int16 v75 = 2048;
          v76 = v50;
          __int16 v77 = 2048;
          unint64_t v78 = (unint64_t)v52;
          __int16 v79 = 2112;
          id v80 = v54;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "(%@): No selector found for type=%ld length=%ld response=%@", buf, 0x2Au);

          goto LABEL_47;
        }
        goto LABEL_47;
      }
    }
    else
    {
      id v46 = nr_daemon_log();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);

      if (v47)
      {
        id v48 = nr_daemon_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          id v49 = self->_serviceName;
          id v50 = [v4 type];
          id v51 = [v4 data];
          id v52 = [v51 length];
          unsigned int v53 = [v4 isResponse];
          v54 = &__kCFBooleanFalse;
          if (v53) {
            v54 = &__kCFBooleanTrue;
          }
          goto LABEL_46;
        }
LABEL_47:
      }
    }
LABEL_48:

    goto LABEL_49;
  }
  v56 = nr_daemon_log();
  BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_ERROR);

  if (!v57) {
    goto LABEL_50;
  }
  id v19 = nr_daemon_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1000FB438((uint64_t)self, v4);
  }
LABEL_49:

LABEL_50:
}

- (void)_storeProtobufAction:(SEL)a3 messageType:(unsigned __int16)a4 messageSendType:(int64_t)a5 connectedOnly:(BOOL)a6
{
  BOOL v6 = a6;
  unsigned int v8 = a4;
  unsigned int v12 = objc_alloc_init(NRPBSelectorItem);
  [(NRPBSelectorItem *)v12 setSelector:a3];
  if (a3) {
    [(NRPBSelectorItem *)v12 setMethod:[(NRRemoteObject *)self methodForSelector:a3]];
  }
  [(NRPBSelectorItem *)v12 setConnected:v6];
  id v11 = +[NSNumber numberWithInteger:v8 | (unint64_t)(a5 << 16)];
  [(NSMutableDictionary *)self->_idsRequestMessageTypeToSelector setObject:v12 forKeyedSubscript:v11];
}

- (void)setConnectedProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  [(NRRemoteObject *)self _storeProtobufAction:a3 messageType:a4 messageSendType:0 connectedOnly:1];
  id v6 = [(NRRemoteObject *)self service];
  [v6 setProtobufAction:"handleIncomingMessage:" forIncomingRequestsOfType:v4];
}

- (void)setConnectedProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  if (a3) {
    [(NRRemoteObject *)self _storeProtobufAction:a3 messageType:a4 messageSendType:1 connectedOnly:1];
  }
  id v6 = [(NRRemoteObject *)self service];
  [v6 setProtobufAction:"handleIncomingMessage:" forIncomingResponsesOfType:v4];
}

- (void)setAlwaysProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  [(NRRemoteObject *)self _storeProtobufAction:a3 messageType:a4 messageSendType:0 connectedOnly:0];
  id v6 = [(NRRemoteObject *)self service];
  [v6 setProtobufAction:"handleIncomingMessage:" forIncomingRequestsOfType:v4];
}

- (void)setAlwaysProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  if (a3) {
    [(NRRemoteObject *)self _storeProtobufAction:a3 messageType:a4 messageSendType:1 connectedOnly:0];
  }
  id v6 = [(NRRemoteObject *)self service];
  [v6 setProtobufAction:"handleIncomingMessage:" forIncomingResponsesOfType:v4];
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 toIDSBTUUID:(id)a5
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 toIDSBTUUID:(id)a5 didSend:(id)a6
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 toIDSBTUUID:(id)a6 didSend:(id)a7
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 toIDSBTUUID:(id)a7 didSend:(id)a8
{
}

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 toIDSBTUUID:(id)a10 didSend:(id)a11 andResponse:(id)a12
{
}

- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 didSend:(id)a10
{
  unsigned int v28 = a4;
  id v15 = a10;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a3;
  id v21 = objc_alloc((Class)NSUUID);
  id v26 = [v19 protobuf];
  id v22 = [v26 context];
  BOOL v23 = [v22 outgoingResponseIdentifier];
  id v24 = [v21 initWithUUIDString:v23];
  BOOL v25 = [v19 idsBTUUID];

  [(NRRemoteObject *)self _sendMessage:v20 type:v28 requestUUID:v24 withTimeout:v18 withResponseTimeout:0 withDescription:v17 onlyOneFor:v16 priority:a9 toIDSBTUUID:v25 didSend:v15 andResponse:0];
}

- (void)sendResponse:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 didSend:(id)a10
{
}

- (void)_sendMessage:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 priority:(int64_t)a10 toIDSBTUUID:(id)a11 didSend:(id)a12 andResponse:(id)a13
{
  id v35 = a3;
  id v34 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  id v23 = a12;
  id v24 = a13;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_idsQueue);
  queue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C21CC;
  block[3] = &unk_1001693C0;
  void block[4] = self;
  id v39 = v35;
  unsigned __int16 v49 = a4;
  id v40 = v34;
  id v41 = v18;
  id v42 = v19;
  id v43 = v20;
  id v47 = v24;
  int64_t v48 = a10;
  id v44 = v21;
  id v45 = v22;
  id v46 = v23;
  id v25 = v24;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v20;
  id v30 = v19;
  id v31 = v18;
  id v32 = v34;
  id v33 = v35;
  dispatch_async(queue, block);
}

- (void)sendCloudRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 toDestinations:(id)a10 didSend:(id)a11 andResponse:(id)a12
{
  LOBYTE(v12) = 0;
  [(NRRemoteObject *)self _sendCloudMessage:a3 type:a4 responseToRequest:0 withTimeout:a5 withResponseTimeout:a6 withDescription:a7 onlyOneFor:a8 priority:a9 toDestinations:a10 skipLookup:v12 didSend:a11 andResponse:a12];
}

- (void)sendCloudResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 didSend:(id)a10
{
  LOBYTE(v10) = 0;
  [(NRRemoteObject *)self _sendCloudMessage:a3 type:a4 responseToRequest:a5 withTimeout:a6 withResponseTimeout:0 withDescription:a7 onlyOneFor:a8 priority:a9 toDestinations:0 skipLookup:v10 didSend:a10 andResponse:0];
}

- (void)sendTinkerRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withResponseTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 toDestinations:(id)a10 didSend:(id)a11 andResponse:(id)a12
{
  LOBYTE(v12) = 1;
  [(NRRemoteObject *)self _sendCloudMessage:a3 type:a4 responseToRequest:0 withTimeout:a5 withResponseTimeout:a6 withDescription:a7 onlyOneFor:a8 priority:a9 toDestinations:a10 skipLookup:v12 didSend:a11 andResponse:a12];
}

- (void)sendTinkerResponse:(id)a3 type:(unsigned __int16)a4 withRequest:(id)a5 withTimeout:(id)a6 withDescription:(id)a7 onlyOneFor:(id)a8 priority:(int64_t)a9 didSend:(id)a10
{
  LOBYTE(v10) = 1;
  [(NRRemoteObject *)self _sendCloudMessage:a3 type:a4 responseToRequest:a5 withTimeout:a6 withResponseTimeout:0 withDescription:a7 onlyOneFor:a8 priority:a9 toDestinations:0 skipLookup:v10 didSend:a10 andResponse:0];
}

- (void)_sendCloudMessage:(id)a3 type:(unsigned __int16)a4 responseToRequest:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 priority:(int64_t)a10 toDestinations:(id)a11 skipLookup:(BOOL)a12 didSend:(id)a13 andResponse:(id)a14
{
  id v36 = a3;
  id v35 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a11;
  id v24 = a13;
  id v25 = a14;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_idsQueue);
  queue = self->_idsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C253C;
  block[3] = &unk_1001693E8;
  void block[4] = self;
  id v40 = v36;
  unsigned __int16 v50 = a4;
  id v41 = v35;
  id v42 = v19;
  id v43 = v20;
  id v44 = v21;
  id v48 = v25;
  int64_t v49 = a10;
  id v45 = v22;
  id v46 = v23;
  BOOL v51 = a12;
  id v47 = v24;
  id v26 = v25;
  id v27 = v24;
  id v28 = v23;
  id v29 = v22;
  id v30 = v21;
  id v31 = v20;
  id v32 = v19;
  id v33 = v35;
  id v34 = v36;
  dispatch_async(queue, block);
}

- (void)_messageResponseTimeout:(id)a3
{
  id v4 = a3;
  idsQueue = self->_idsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C2628;
  v7[3] = &unk_100165530;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)idsQueue, v7);
}

- (void)_queueSendMessage:(id)a3 type:(unsigned __int16)a4 requestUUID:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 priority:(int64_t)a10 toIDSBTUUID:(id)a11 didSend:(id)a12 andResponse:(id)a13
{
  unsigned int v89 = a4;
  id v95 = a3;
  id v18 = a5;
  id v19 = a6;
  id v94 = a7;
  id v93 = a8;
  id v97 = a9;
  id v96 = a12;
  id v98 = a13;
  id v20 = "request";
  if (v18) {
    id v20 = "response";
  }
  v92 = v20;
  idsQueue = self->_idsQueue;
  id v22 = a11;
  dispatch_assert_queue_V2((dispatch_queue_t)idsQueue);
  id v23 = [(IDSService *)self->_service devicesForBTUUID:v22];

  uint64_t v24 = [v23 anyObject];

  v99 = (void *)v24;
  if (v24)
  {
    id v25 = +[NSMutableDictionary dictionary];
    id v26 = v25;
    id v86 = v19;
    if (v19)
    {
      [v25 setObject:v19 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
      [v19 doubleValue];
      id v28 = v95;
      id v29 = v97;
      if (v27 + -10.0 >= 0.00000011920929)
      {
        LODWORD(v19) = 0;
      }
      else
      {
        [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
        LODWORD(v19) = 1;
      }
    }
    else
    {
      id v47 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
      [v26 setObject:v47 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];

      id v28 = v95;
      id v29 = v97;
    }
    [v26 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
    if (v29) {
      [v26 setObject:v29 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
    }
    if (v18)
    {
      id v48 = [v18 UUIDString];
      [v26 setObject:v48 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
    }
    id v88 = v18;
    id v49 = objc_alloc((Class)IDSProtobuf);
    unsigned __int16 v50 = [v28 data];
    id v51 = [v49 initWithProtobufData:v50 type:v89 isResponse:v18 != 0];

    id v52 = [(NRRemoteObject *)self service];
    unsigned int v53 = (void *)IDSCopyIDForDevice();
    v54 = +[NSSet setWithObject:v53];
    id v112 = 0;
    id v113 = 0;
    v91 = v51;
    unsigned int v55 = [v52 sendProtobuf:v51 toDestinations:v54 priority:a10 options:v26 identifier:&v113 error:&v112];
    id v46 = v113;
    id v30 = v112;

    if (!v55 || v30)
    {
      if (v30) {
        char v66 = 1;
      }
      else {
        char v66 = v55;
      }
      if ((v66 & 1) == 0)
      {
        id v30 = +[NSError errorWithDomain:@"com.apple.nanoregistry.ids.failnoerror" code:1 userInfo:0];
      }
      id v67 = (objc_class *)objc_opt_class();
      id v68 = NSStringFromClass(v67);
      __int16 v69 = [v30 nr_safeDescription];
      id v59 = +[NSString stringWithFormat:@"Error sending %s %@ - %@", v92, v68, v69];

      id v70 = nr_daemon_log();
      LODWORD(v69) = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);

      id v18 = v88;
      if (v69)
      {
        v71 = nr_daemon_log();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v115 = v59;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }
      id v33 = v96;
      if (v96)
      {
        clientQueue = self->_clientQueue;
        v109[0] = _NSConcreteStackBlock;
        v109[1] = 3221225472;
        v109[2] = sub_1000C3208;
        v109[3] = &unk_100165A70;
        id v111 = v96;
        id v110 = v30;
        dispatch_async((dispatch_queue_t)clientQueue, v109);
      }
      if (v98)
      {
        v73 = self->_clientQueue;
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_1000C321C;
        v107[3] = &unk_100165D10;
        id v108 = v98;
        dispatch_async((dispatch_queue_t)v73, v107);
      }
    }
    else
    {
      id v33 = v96;
      if (v96)
      {
        id v56 = objc_retainBlock(v96);
        [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler setObject:v56 forKeyedSubscript:v46];
      }
      id v18 = v88;
      if (!v98
        || (id v57 = objc_retainBlock(v98),
            [(NSMutableDictionary *)self->_idsSendIDToResponseHandler setObject:v57 forKeyedSubscript:v46], v57, !v94))
      {
        id v30 = 0;
        goto LABEL_47;
      }
      v58 = +[NSString stringWithFormat:@"com.apple.%s.%@", v92, v46];
      id v59 = [v58 stringByReplacingOccurrencesOfString:@" " withString:@"-"];

      [v94 doubleValue];
      double v61 = v60;
      v62 = self->_idsQueue;
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_1000C3230;
      v105[3] = &unk_100165530;
      v105[4] = self;
      id v63 = v46;
      id v106 = v63;
      v64 = +[TimerFactory timerWithIdentifier:v59 delay:1 gracePeriod:v62 waking:v105 handlerQueue:v61 handlerBlock:0.0];
      id v65 = v63;
      id v33 = v96;
      [(NSMutableDictionary *)self->_idsSendIDToTimer setObject:v64 forKeyedSubscript:v65];

      id v30 = 0;
    }

LABEL_47:
    v74 = nr_daemon_log();
    BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);

    if (v75)
    {
      v76 = nr_daemon_log();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        int v85 = (int)v19;
        __int16 v77 = v93;
        if (!v93)
        {
          unint64_t v78 = (objc_class *)objc_opt_class();
          __int16 v77 = NSStringFromClass(v78);
        }
        __int16 v79 = [v28 data];
        id v80 = [v79 length];
        __int16 v81 = [v99 nsuuid];
        uint64_t v82 = [v81 UUIDString];
        __int16 v83 = (void *)v82;
        *(_DWORD *)buf = 136316418;
        v84 = "";
        v115 = v92;
        __int16 v116 = 2114;
        if (v85) {
          v84 = "fireAndForget is ON";
        }
        v117 = v77;
        __int16 v118 = 2048;
        id v119 = v80;
        __int16 v120 = 2114;
        uint64_t v121 = v82;
        __int16 v122 = 2114;
        id v123 = v46;
        __int16 v124 = 2080;
        v125 = v84;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Sent IDS %s %{public}@ bytes=%ld to %{public}@ got identifier: %{public}@ %s", buf, 0x3Eu);

        if (!v93) {
        id v28 = v95;
        }
        id v33 = v96;
        id v18 = v88;
      }
    }
    id v19 = v86;
    id v34 = v93;
    id v44 = v94;
    id v35 = v98;
    goto LABEL_58;
  }
  id v30 = +[NSError errorWithDomain:@"com.apple.nanoregistry.ids.nodefaultpaireddevice" code:2 userInfo:0];
  id v31 = nr_daemon_log();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

  id v28 = v95;
  id v33 = v96;
  id v34 = v93;
  id v35 = v98;
  if (v32)
  {
    id v36 = nr_daemon_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      id v87 = v18;
      v90 = v93;
      if (!v93)
      {
        BOOL v37 = (objc_class *)objc_opt_class();
        v90 = NSStringFromClass(v37);
      }
      id v38 = [v95 data];
      id v39 = [v38 length];
      id v40 = [0 nsuuid];
      id v41 = [v40 UUIDString];
      id v42 = [v30 nr_safeDescription];
      *(_DWORD *)buf = 136316162;
      v115 = v92;
      __int16 v116 = 2114;
      v117 = v90;
      __int16 v118 = 2048;
      id v119 = v39;
      __int16 v120 = 2114;
      uint64_t v121 = (uint64_t)v41;
      __int16 v122 = 2114;
      id v123 = v42;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Failed to send IDS %s %{public}@ bytes=%ld to %{public}@ because of %{public}@", buf, 0x34u);

      id v34 = v93;
      if (!v93) {

      }
      id v28 = v95;
      id v33 = v96;
      id v18 = v87;
      id v35 = v98;
    }
  }
  if (v33)
  {
    id v43 = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C323C;
    block[3] = &unk_100165A70;
    id v104 = v33;
    id v103 = v30;
    dispatch_async((dispatch_queue_t)v43, block);
  }
  id v44 = v94;
  if (v35)
  {
    id v45 = self->_clientQueue;
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_1000C3250;
    v100[3] = &unk_100165D10;
    id v101 = v35;
    dispatch_async((dispatch_queue_t)v45, v100);
    id v46 = v101;
LABEL_58:
  }
}

- (void)_queueSendCloudMessage:(id)a3 type:(unsigned __int16)a4 responseToRequest:(id)a5 withTimeout:(id)a6 withResponseTimeout:(id)a7 withDescription:(id)a8 onlyOneFor:(id)a9 priority:(int64_t)a10 toDestinations:(id)a11 skipLookup:(BOOL)a12 didSend:(id)a13 andResponse:(id)a14
{
  uint64_t v18 = a4;
  id v91 = a3;
  id v20 = a5;
  id v87 = a6;
  id v86 = a7;
  id v84 = a8;
  id v85 = a9;
  id v21 = a11;
  id v89 = a13;
  id v88 = a14;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  id v22 = "request";
  if (v20) {
    id v22 = "response";
  }
  uint64_t v82 = v22;
  if (v20)
  {
    id v23 = [v20 protobuf];
    uint64_t v24 = [v23 context];
    id v25 = [v24 fromID];
    uint64_t v26 = +[NSSet setWithObject:v25];

    v90 = (void *)v26;
  }
  else
  {
    v90 = v21;
  }
  double v27 = +[NSMutableDictionary dictionary];
  id v28 = v27;
  id v29 = v87;
  id v30 = v85;
  if (v87)
  {
    [v27 setObject:v87 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
    [v87 doubleValue];
    if (v31 + -10.0 < 0.00000011920929)
    {
      [v28 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionFireAndForgetKey];
      int v81 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    BOOL v32 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    [v28 setObject:v32 forKeyedSubscript:IDSSendMessageOptionTimeoutKey];
  }
  int v81 = 0;
LABEL_11:
  [v28 setObject:&__kCFBooleanFalse forKeyedSubscript:IDSSendMessageOptionEnforceRemoteTimeoutsKey];
  if (v85) {
    [v28 setObject:v85 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
  }
  if (v20)
  {
    id v33 = [v20 protobuf];
    id v34 = [v33 context];
    id v35 = [v34 outgoingResponseIdentifier];
    [v28 setObject:v35 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
  }
  id v36 = objc_alloc((Class)IDSProtobuf);
  BOOL v37 = [v91 data];
  id v38 = [v36 initWithProtobufData:v37 type:v18 isResponse:v20 != 0];

  if (v20 || a12)
  {
    id v39 = v90;
  }
  else
  {
    id v39 = [(NRRemoteObject *)self _lookupDestinations:v90];
  }
  id v40 = v39;
  __int16 v83 = v38;
  if (![v39 count])
  {
    unsigned int v55 = nr_daemon_log();
    BOOL v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT);

    id v57 = v89;
    if (v56)
    {
      v58 = nr_daemon_log();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        id v59 = v84;
        if (!v84)
        {
          double v60 = (objc_class *)objc_opt_class();
          id v59 = NSStringFromClass(v60);
        }
        double v61 = [v91 data];
        *(_DWORD *)buf = 136315906;
        v107 = v82;
        __int16 v108 = 2114;
        v109 = v59;
        __int16 v110 = 2048;
        id v111 = [v61 length];
        __int16 v112 = 2114;
        id v113 = v90;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Can't send IDS %s %{public}@ bytes=%ld to %{public}@ destinations not found", buf, 0x2Au);

        if (!v84) {
        id v57 = v89;
        }
      }
    }
    v62 = +[NSError errorWithDomain:@"com.apple.nanoregistry.ids.fail" code:2 userInfo:0];
    if (v57)
    {
      clientQueue = self->_clientQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C3CCC;
      block[3] = &unk_100165A70;
      id v96 = v57;
      id v95 = v62;
      dispatch_async((dispatch_queue_t)clientQueue, block);
    }
    if (v88)
    {
      v64 = self->_clientQueue;
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472;
      v92[2] = sub_1000C3CE0;
      v92[3] = &unk_100165D10;
      id v93 = v88;
      dispatch_async((dispatch_queue_t)v64, v92);
    }
    id v43 = 0;
    id v44 = 0;
    id v65 = v84;
    goto LABEL_64;
  }
  id v41 = [(NRRemoteObject *)self service];
  id v104 = 0;
  id v105 = 0;
  unsigned int v42 = [v41 sendProtobuf:v38 toDestinations:v40 priority:a10 options:v28 identifier:&v105 error:&v104];
  id v43 = v105;
  id v44 = v104;

  if (!v42 || v44)
  {
    if (v44) {
      char v66 = 1;
    }
    else {
      char v66 = v42;
    }
    if ((v66 & 1) == 0)
    {
      id v44 = +[NSError errorWithDomain:@"com.apple.nanoregistry.ids.failnoerror" code:1 userInfo:0];
    }
    id v67 = (objc_class *)objc_opt_class();
    id v68 = NSStringFromClass(v67);
    __int16 v69 = [v44 nr_safeDescription];
    id v48 = +[NSString stringWithFormat:@"Error sending %s %@ - %@", v82, v68, v69];

    id v70 = nr_daemon_log();
    LODWORD(v68) = os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT);

    if (v68)
    {
      v71 = nr_daemon_log();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v107 = v48;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
      }
    }
    if (v89)
    {
      v72 = self->_clientQueue;
      v101[0] = _NSConcreteStackBlock;
      v101[1] = 3221225472;
      v101[2] = sub_1000C3C98;
      v101[3] = &unk_100165A70;
      id v103 = v89;
      id v102 = v44;
      dispatch_async((dispatch_queue_t)v72, v101);
    }
    id v29 = v87;
    if (v88)
    {
      v73 = self->_clientQueue;
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472;
      v99[2] = sub_1000C3CAC;
      v99[3] = &unk_100165D10;
      id v100 = v88;
      dispatch_async((dispatch_queue_t)v73, v99);
    }
    goto LABEL_53;
  }
  id v29 = v87;
  if (v89)
  {
    id v45 = objc_retainBlock(v89);
    [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler setObject:v45 forKeyedSubscript:v43];
  }
  id v44 = v86;
  if (!v88)
  {
    id v44 = 0;
    goto LABEL_55;
  }
  id v46 = objc_retainBlock(v88);
  [(NSMutableDictionary *)self->_idsSendIDToResponseHandler setObject:v46 forKeyedSubscript:v43];

  if (v86)
  {
    id v47 = +[NSString stringWithFormat:@"com.apple.%s.%@", v82, v43];
    id v48 = [v47 stringByReplacingOccurrencesOfString:@" " withString:@"-"];

    [v86 doubleValue];
    double v50 = v49;
    idsQueue = self->_idsQueue;
    v97[0] = _NSConcreteStackBlock;
    v97[1] = 3221225472;
    v97[2] = sub_1000C3CC0;
    v97[3] = &unk_100165530;
    v97[4] = self;
    id v52 = v43;
    id v98 = v52;
    unsigned int v53 = +[TimerFactory timerWithIdentifier:v48 delay:1 gracePeriod:idsQueue waking:v97 handlerQueue:v50 handlerBlock:0.0];
    id v54 = v52;
    id v29 = v87;
    [(NSMutableDictionary *)self->_idsSendIDToTimer setObject:v53 forKeyedSubscript:v54];

    id v44 = 0;
LABEL_53:
  }
LABEL_55:
  v74 = nr_daemon_log();
  BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);

  if (!v75)
  {
    id v65 = v84;
    goto LABEL_66;
  }
  v62 = nr_daemon_log();
  id v65 = v84;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v76 = v84;
    if (!v84)
    {
      __int16 v77 = (objc_class *)objc_opt_class();
      v76 = NSStringFromClass(v77);
    }
    unint64_t v78 = [v91 data];
    id v79 = [v78 length];
    *(_DWORD *)buf = 136316418;
    id v80 = "";
    v107 = v82;
    __int16 v108 = 2114;
    if (v81) {
      id v80 = "fireAndForget is ON";
    }
    v109 = v76;
    __int16 v110 = 2048;
    id v111 = v79;
    __int16 v112 = 2114;
    id v113 = v90;
    __int16 v114 = 2114;
    id v115 = v43;
    __int16 v116 = 2080;
    v117 = v80;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Sent IDS %s %{public}@ bytes=%ld to %{public}@ got identifier: %{public}@ %s", buf, 0x3Eu);

    id v65 = v84;
    if (!v84) {

    }
    id v30 = v85;
  }
LABEL_64:

LABEL_66:
}

- (id)_lookupDestinations:(id)a3
{
  id v4 = a3;
  BOOL v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Looking up cloud destinations %@", buf, 0xCu);
    }
  }
  id v8 = [(IDSService *)self->_service nr_mineTinkerDevices];
  BOOL v9 = +[NSMutableSet set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v29;
    *(void *)&long long v12 = 138412546;
    long long v27 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v10);
        }
        id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v17 = nr_daemon_log();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

        if (v18)
        {
          id v19 = nr_daemon_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [v16 uniqueIDOverride];
            *(_DWORD *)buf = v27;
            id v33 = v16;
            __int16 v34 = 2112;
            id v35 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Lookup: IDSDevice %@ uniqueIDOverride=%@", buf, 0x16u);
          }
        }
        id v21 = [v16 uniqueIDOverride:v27, v28];
        unsigned int v22 = [v4 containsObject:v21];

        if (v22)
        {
          id v23 = (void *)IDSCopyIDForDevice();
          if (v9) {
            [v9 addObject:v23];
          }
        }
      }
      id v13 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v13);
  }

  id v24 = [v9 count];
  if (v24 == [v4 count]) {
    id v25 = v9;
  }
  else {
    id v25 = 0;
  }

  return v25;
}

- (id)deprecatedIDSDeviceIdentifierForBTUUID:(id)a3
{
  objc_super v3 = [(IDSService *)self->_service devicesForBTUUID:a3];
  id v4 = [v3 anyObject];

  if (v4) {
    BOOL v5 = (void *)IDSCopyIDForDevice();
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)idsDeviceIdentifierForBTUUID:(id)a3
{
  objc_super v3 = [(IDSService *)self->_service devicesForBTUUID:a3];
  id v4 = [v3 anyObject];

  if (v4)
  {
    BOOL v5 = [v4 uniqueIDOverride];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_areAccountsAndDevicesPresent:(id)a3 andDevices:(id)a4
{
  id v6 = a4;
  id v7 = [a3 count];
  [(NRRemoteObject *)self setHasAccounts:v7 != 0];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v49;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if ([v13 isDefaultPairedDevice])
        {
          if (self->_alwaysConnected || [v13 pairingProtocolVersion] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if (v7) {
              goto LABEL_43;
            }
          }
          else
          {
            id v14 = [v13 maxCompatibilityVersion];
            if (v7 && v14 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
LABEL_43:
              id v15 = [[NRImmutableIDSDevice alloc] initWithIDSDevice:v13];
              long long v28 = v8;
              goto LABEL_44;
            }
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = [(NRRemoteObject *)self defaultPairedDevice];

  if (v15)
  {
    id v16 = nr_daemon_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      BOOL v18 = nr_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000FB4DC(v18);
      }
    }
    id v39 = v8;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v19 = [(IDSService *)self->_service accounts];
    id v20 = [v19 countByEnumeratingWithState:&v44 objects:v55 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
          id v25 = nr_daemon_log();
          BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

          if (v26)
          {
            long long v27 = nr_daemon_log();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v54 = v24;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "IDSAccount: %@", buf, 0xCu);
            }
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v44 objects:v55 count:16];
      }
      while (v21);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v28 = [*(id *)(v38 + 128) nr_mineTinkerDevices];
    id v29 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v41;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v41 != v31) {
            objc_enumerationMutation(v28);
          }
          uint64_t v33 = *(void *)(*((void *)&v40 + 1) + 8 * (void)k);
          __int16 v34 = nr_daemon_log();
          BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

          if (v35)
          {
            id v36 = nr_daemon_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v54 = v33;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "IDSDevice: %@", buf, 0xCu);
            }
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v30);
    }
    id v15 = 0;
    id v8 = v39;
LABEL_44:
  }

  return v15;
}

- (void)_updateTrafficClassesWithClasses:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NRRemoteObject *)self _rawDefaultPairedDevice];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() trafficClassQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C462C;
    block[3] = &unk_100165868;
    id v7 = v4;
    id v14 = v7;
    id v8 = v5;
    id v15 = v8;
    id v16 = self;
    dispatch_async(v6, block);

    if ([v7 shouldDropUnmatchingTraffic])
    {
      id v9 = [(id)objc_opt_class() trafficClassQueue];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000C486C;
      v10[3] = &unk_100165530;
      id v11 = v8;
      long long v12 = self;
      dispatch_async(v9, v10);
    }
  }
}

- (void)updateTrafficClassesWithClasses:(id)a3
{
  id v4 = a3;
  idsQueue = self->_idsQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C4AAC;
  v7[3] = &unk_100165530;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)idsQueue, v7);
}

- (BOOL)_updateDPDAndReturnYESIfChangeWithDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NRRemoteObject *)self _rawDefaultPairedDevice];

  if (v4 || !v5)
  {
    id v8 = [(NRRemoteObject *)self _rawDefaultPairedDevice];

    if ((!v4 || v8) && !v4)
    {
      BOOL v9 = 0;
      goto LABEL_9;
    }
    id v6 = self;
    id v7 = v4;
  }
  else
  {
    id v6 = self;
    id v7 = 0;
  }
  [(NRRemoteObject *)v6 setDefaultPairedDevice:v7];
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (void)_updateIDSDeviceUniqueIdentifiers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  objc_super v3 = +[NSMutableSet set];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(IDSService *)self->_service nr_mineTinkerDevices];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) uniqueIDOverride];
        if (v9) {
          [v3 addObject:v9];
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(NRRemoteObject *)self setDeviceUniqueIdentifiers:v3];
}

- (void)_fireIDSAvailableDelegateIfNeededWithIDSDevice:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_idsQueue);
  [(NRRemoteObject *)self setDefaultPairedDevice:v4];
  id v5 = [v4 nsuuid];
  if (v5)
  {
    id v6 = [v4 nsuuid];
    uint64_t v7 = [(NRRemoteObject *)self _rawDefaultPairedDevice];
    id v8 = [v7 nsuuid];
    unsigned int v9 = [v6 isEqual:v8] ^ 1;
  }
  else
  {
    unsigned int v9 = 0;
  }

  unsigned __int8 v10 = [(NRRemoteObject *)self _updateDPDAndReturnYESIfChangeWithDevice:v4];
  long long v11 = [(NRRemoteObject *)self defaultPairedDevice];
  if ([(NRRemoteObject *)self isDisconnected])
  {
    if (![(NRRemoteObject *)self isIDSConnectedNotification]) {
      goto LABEL_50;
    }
    [(NRRemoteObject *)self setIsIDSConnectedNotification:0];
    if (!self->_alwaysConnected) {
      [(NRRemoteObject *)self _suspendMessageDeliveryQueue];
    }
    unsigned int v47 = v9;
    long long v48 = v11;
    id v46 = v4;
    long long v12 = [(NRRemoteObject *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      clientQueue = self->_clientQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C5398;
      block[3] = &unk_1001655F8;
      void block[4] = self;
      dispatch_async((dispatch_queue_t)clientQueue, block);
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v15 = [(NRRemoteObject *)self connectivityObservers];
    id v16 = [v15 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v67;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v67 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v66 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v21 = self->_clientQueue;
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = sub_1000C53EC;
            v65[3] = &unk_100165530;
            v65[4] = v20;
            void v65[5] = self;
            dispatch_async((dispatch_queue_t)v21, v65);
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v17);
    }
    goto LABEL_48;
  }
  if ((v10 & 1) != 0
    || (((v11 == 0) ^ [(NRRemoteObject *)self isIDSConnectedNotification]) & 1) == 0)
  {
    unsigned __int8 v22 = [(NRRemoteObject *)self isIDSConnectedNotification];
    long long v48 = v11;
    unsigned int v47 = v9;
    if (v11)
    {
      [(NRRemoteObject *)self setIsIDSConnectedNotification:1];
      id v23 = [(NRRemoteObject *)self delegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        char v25 = v22 ^ 1;
        BOOL v26 = self->_clientQueue;
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_1000C53F8;
        v62[3] = &unk_100167BE0;
        char v64 = v25;
        v62[4] = self;
        id v63 = v4;
        dispatch_async((dispatch_queue_t)v26, v62);
      }
      long long v27 = v4;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v28 = [(NRRemoteObject *)self connectivityObservers];
      id v29 = [v28 countByEnumeratingWithState:&v58 objects:v74 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v59;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v59 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v58 + 1) + 8 * (void)j);
            if (objc_opt_respondsToSelector())
            {
              __int16 v34 = self->_clientQueue;
              v56[0] = _NSConcreteStackBlock;
              v56[1] = 3221225472;
              v56[2] = sub_1000C544C;
              v56[3] = &unk_100165868;
              v56[4] = v33;
              v56[5] = self;
              id v57 = v27;
              dispatch_async((dispatch_queue_t)v34, v56);
            }
          }
          id v30 = [v28 countByEnumeratingWithState:&v58 objects:v74 count:16];
        }
        while (v30);
      }

      [(NRRemoteObject *)self _resumeMessageDeliveryQueue];
      id v4 = v27;
      goto LABEL_49;
    }
    [(NRRemoteObject *)self setIsIDSConnectedNotification:0];
    if (!self->_alwaysConnected) {
      [(NRRemoteObject *)self _suspendMessageDeliveryQueue];
    }
    id v46 = v4;
    BOOL v35 = [(NRRemoteObject *)self delegate];
    char v36 = objc_opt_respondsToSelector();

    if (v36)
    {
      BOOL v37 = self->_clientQueue;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1000C545C;
      v54[3] = &unk_1001660F8;
      unsigned __int8 v55 = v22;
      v54[4] = self;
      dispatch_async((dispatch_queue_t)v37, v54);
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v15 = [(NRRemoteObject *)self connectivityObservers];
    id v38 = [v15 countByEnumeratingWithState:&v50 objects:v73 count:16];
    if (v38)
    {
      id v39 = v38;
      uint64_t v40 = *(void *)v51;
      do
      {
        for (k = 0; k != v39; k = (char *)k + 1)
        {
          if (*(void *)v51 != v40) {
            objc_enumerationMutation(v15);
          }
          uint64_t v42 = *(void *)(*((void *)&v50 + 1) + 8 * (void)k);
          if (objc_opt_respondsToSelector())
          {
            long long v43 = self->_clientQueue;
            v49[0] = _NSConcreteStackBlock;
            v49[1] = 3221225472;
            v49[2] = sub_1000C54B0;
            v49[3] = &unk_100165530;
            v49[4] = v42;
            v49[5] = self;
            dispatch_async((dispatch_queue_t)v43, v49);
          }
        }
        id v39 = [v15 countByEnumeratingWithState:&v50 objects:v73 count:16];
      }
      while (v39);
    }
LABEL_48:

    id v4 = v46;
LABEL_49:
    long long v11 = v48;
    unsigned int v9 = v47;
  }
LABEL_50:
  if (v9)
  {
    if ([v11 isNearby])
    {
      v72 = v11;
      long long v44 = +[NSArray arrayWithObjects:&v72 count:1];
    }
    else
    {
      long long v44 = &__NSArray0__struct;
    }
    [(NRRemoteObject *)self service:self->_service linkedDevicesChanged:v44];
    if ([v11 isConnected])
    {
      v71 = v11;
      long long v45 = +[NSArray arrayWithObjects:&v71 count:1];
    }
    else
    {
      long long v45 = &__NSArray0__struct;
    }
    [(NRRemoteObject *)self service:self->_service connectedDevicesChanged:v45];
  }
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  if (self->_service == a3)
  {
    id v6 = a4;
    uint64_t v7 = [a3 nr_mineTinkerDevices];
    id v8 = [(NRRemoteObject *)self _areAccountsAndDevicesPresent:v6 andDevices:v7];

    [(NRRemoteObject *)self _fireIDSAvailableDelegateIfNeededWithIDSDevice:v8];
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = (IDSService *)a3;
  id v6 = [(IDSService *)v5 nr_mineTinkerDevices];
  if (self->_service == v5)
  {
    BOOL v26 = self;
    long long v27 = v5;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v25 = v6;
    id obj = v6;
    id v7 = [obj countByEnumeratingWithState:&v38 objects:v68 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v12 = nr_daemon_log();
          BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

          if (v13)
          {
            id v14 = nr_daemon_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              char v36 = [v11 nsuuid];
              id v15 = [v36 UUIDString];
              id v16 = [v11 uniqueIDOverride];
              BOOL v35 = [v11 service];
              __int16 v34 = [v11 name];
              uint64_t v33 = [v11 productBuildVersion];
              id v32 = [v11 minCompatibilityVersion];
              id v31 = [v11 maxCompatibilityVersion];
              id v30 = [v11 pairingProtocolVersion];
              if ([v11 isDefaultPairedDevice]) {
                CFStringRef v17 = @"YES";
              }
              else {
                CFStringRef v17 = @"NO";
              }
              CFStringRef v29 = v17;
              if ([v11 isActive]) {
                CFStringRef v18 = @"YES";
              }
              else {
                CFStringRef v18 = @"NO";
              }
              CFStringRef v28 = v18;
              id v19 = v8;
              if ([v11 isNearby]) {
                CFStringRef v20 = @"YES";
              }
              else {
                CFStringRef v20 = @"NO";
              }
              unsigned int v21 = [v11 isConnected];
              *(_DWORD *)buf = 138546434;
              if (v21) {
                CFStringRef v22 = @"YES";
              }
              else {
                CFStringRef v22 = @"NO";
              }
              long long v43 = v15;
              __int16 v44 = 2114;
              long long v45 = v16;
              __int16 v46 = 2048;
              unsigned int v47 = v11;
              __int16 v48 = 2114;
              long long v49 = v35;
              __int16 v50 = 2114;
              long long v51 = v34;
              __int16 v52 = 2114;
              long long v53 = v33;
              __int16 v54 = 2048;
              id v55 = v32;
              __int16 v56 = 2048;
              id v57 = v31;
              __int16 v58 = 2048;
              id v59 = v30;
              __int16 v60 = 2112;
              CFStringRef v61 = v29;
              __int16 v62 = 2112;
              CFStringRef v63 = v28;
              __int16 v64 = 2112;
              CFStringRef v65 = v20;
              id v8 = v19;
              __int16 v66 = 2112;
              CFStringRef v67 = v22;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "IDSDevice[%{public}@/%{public}@] %p: %{public}@: name: %{public}@ build: %{public}@ ppv: %lld-%lld (%lld) isDpd: %@ isActive: %@ nearby: %@ connected: %@", buf, 0x84u);
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v38 objects:v68 count:16];
      }
      while (v8);
    }

    id v5 = v27;
    id v23 = [(IDSService *)v27 accounts];
    char v24 = [(NRRemoteObject *)v26 _areAccountsAndDevicesPresent:v23 andDevices:obj];

    [(NRRemoteObject *)v26 _fireIDSAvailableDelegateIfNeededWithIDSDevice:v24];
    [(NRRemoteObject *)v26 _updateIDSDeviceUniqueIdentifiers];

    id v6 = v25;
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  long long v12 = [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler objectForKeyedSubscript:v10];
  if (v12)
  {
    [(NSMutableDictionary *)self->_idsSendIDToCompletionHandler removeObjectForKey:v10];
    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C5C30;
    block[3] = &unk_100165A70;
    id v33 = v12;
    id v32 = v11;
    dispatch_async((dispatch_queue_t)clientQueue, block);
  }
  if (v11 || !a6)
  {
    CFStringRef v17 = (void *)IDSErrorDomain;
    CFStringRef v18 = [v11 domain];
    if ([v17 isEqual:v18])
    {
      id v19 = [v11 code];

      if (v19 == (id)24)
      {
        CFStringRef v20 = nr_daemon_log();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

        if (!v21) {
          goto LABEL_18;
        }
        CFStringRef v22 = nr_daemon_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v10;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "IDS message %{public}@ was replaced by another message", buf, 0xCu);
        }
        goto LABEL_17;
      }
    }
    else
    {
    }
    id v23 = nr_daemon_log();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (!v24) {
      goto LABEL_18;
    }
    CFStringRef v22 = nr_daemon_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1000FB520(v11);
    }
LABEL_17:

LABEL_18:
    id v25 = [(NSMutableDictionary *)self->_idsSendIDToResponseHandler objectForKeyedSubscript:v10];
    id v16 = v25;
    if (v25)
    {
      idsSendIDToResponseHandler = self->_idsSendIDToResponseHandler;
      long long v27 = objc_retainBlock(v25);
      [(NSMutableDictionary *)idsSendIDToResponseHandler removeObjectForKey:v27];

      CFStringRef v28 = self->_clientQueue;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000C5C44;
      v29[3] = &unk_100165D10;
      id v16 = v16;
      id v30 = v16;
      dispatch_async((dispatch_queue_t)v28, v29);
    }
    goto LABEL_20;
  }
  id v14 = nr_daemon_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v16 = nr_daemon_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "IDS success sending request: %{public}@", buf, 0xCu);
    }
LABEL_20:
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  if (self->_service == a3)
  {
    id v10 = nr_daemon_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      long long v12 = nr_daemon_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "executing IDS acknowledgementBlock", buf, 2u);
      }
    }
    id v25 = v9;
    v9[2](v9);
    BOOL v13 = [(NRRemoteObject *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      clientQueue = self->_clientQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C5F8C;
      block[3] = &unk_100165530;
      void block[4] = self;
      id v35 = v8;
      dispatch_async((dispatch_queue_t)clientQueue, block);
    }
    id v16 = v8;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    CFStringRef v17 = [(NRRemoteObject *)self connectivityObservers];
    id v18 = [v17 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v31;
      do
      {
        BOOL v21 = 0;
        do
        {
          if (*(void *)v31 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * (void)v21);
          if (objc_opt_respondsToSelector())
          {
            id v23 = self->_clientQueue;
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_1000C6008;
            v28[3] = &unk_100165868;
            v28[4] = v22;
            v28[5] = self;
            id v29 = v16;
            dispatch_async((dispatch_queue_t)v23, v28);
          }
          BOOL v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v19);
    }

    idsQueue = self->_idsQueue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000C6078;
    v26[3] = &unk_100165530;
    v26[4] = self;
    id v8 = v16;
    id v27 = v16;
    dispatch_async((dispatch_queue_t)idsQueue, v26);

    uint64_t v9 = v25;
  }
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v5 = a3;
  id v6 = [v5 accounts];
  id v7 = [v5 nr_mineTinkerDevices];

  id v8 = [(NRRemoteObject *)self _areAccountsAndDevicesPresent:v6 andDevices:v7];

  [(NRRemoteObject *)self setDefaultPairedDevice:v8];
}

+ (id)trafficClassQueue
{
  if (qword_1001A13A8 != -1) {
    dispatch_once(&qword_1001A13A8, &stru_100169448);
  }
  v2 = (void *)qword_1001A13B0;

  return v2;
}

- (void)setAlwaysConnected:(BOOL)a3
{
  self->_alwaysConnected = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (IDSService)service
{
  return self->_service;
}

- (OS_dispatch_queue)incomingMessageDeliveryQueue
{
  return self->_incomingMessageDeliveryQueue;
}

- (void)setIncomingMessageDeliveryQueue:(id)a3
{
}

- (NSMapTable)shortcutMessages
{
  return self->_shortcutMessages;
}

- (void)setShortcutMessages:(id)a3
{
}

- (BOOL)isIncomingMessageDeliveryQueueSuspended
{
  return self->_isIncomingMessageDeliveryQueueSuspended;
}

- (void)setIsIncomingMessageDeliveryQueueSuspended:(BOOL)a3
{
  self->_isIncomingMessageDeliveryQueueSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutMessages, 0);
  objc_storeStrong((id *)&self->_incomingMessageDeliveryQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_connectivityObservers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultPairedDevice, 0);
  objc_storeStrong((id *)&self->_idsRequestMessageTypeToSelector, 0);
  objc_storeStrong((id *)&self->_deviceUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultPairedDeviceQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_idsSendIDToTimer, 0);
  objc_storeStrong((id *)&self->_idsSendIDToResponseHandler, 0);

  objc_storeStrong((id *)&self->_idsSendIDToCompletionHandler, 0);
}

@end