@interface CBWHBDiscoveryDaemon
- (CBDaemonServer)daemonServer;
- (CBWHBRouter)whbRouter;
- (NSArray)discoveryArray;
- (OS_dispatch_queue)dispatchQueue;
- (RPCompanionLinkClient)remoteClient;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)localDeviceForStableId:(id)a3;
- (id)optimalHostIdForStableId:(id)a3 result:(int *)a4;
- (void)_receivedWHBUpdateEvent:(id)a3 options:(id)a4;
- (void)_reportLostDevicesForController:(id)a3;
- (void)activate;
- (void)deviceFound:(id)a3 remoteController:(id)a4;
- (void)deviceLost:(id)a3 remoteController:(id)a4;
- (void)diagnosticControl:(id)a3;
- (void)invalidate;
- (void)remoteControllersChanged;
- (void)setDaemonServer:(id)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDiscoveryArray:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setRemoteClient:(id)a3;
@end

@implementation CBWHBDiscoveryDaemon

- (id)description
{
  return [(CBWHBDiscoveryDaemon *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned __int8 v3 = a3;
  uint64_t v29 = 0;
  v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10004CF1C;
  v33 = sub_10004CD60;
  id v34 = 0;
  id v5 = [(NSMutableDictionary *)self->_aggregateDeviceMap count];
  v6 = v30;
  id v28 = v30[5];
  v7 = [(id)objc_opt_class() description];
  id v16 = [(NSMutableDictionary *)self->_remoteControllerMap count];
  NSAppendPrintF_safe();
  objc_storeStrong(v6 + 5, v28);

  v8 = v30 + 5;
  if (v3 > 0x14u)
  {
    id v17 = v30[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v8, v17);
  }
  else
  {
    id v27 = v30[5];
    NSAppendPrintF_safe();
    objc_storeStrong(v8, v27);
    remoteControllerMap = self->_remoteControllerMap;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10008A6D4;
    v26[3] = &unk_100998650;
    v26[4] = &v29;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](remoteControllerMap, "enumerateKeysAndObjectsUsingBlock:", v26, v7, v16, v5);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    aggregateDeviceMap = self->_aggregateDeviceMap;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10008A724;
    v20[3] = &unk_100998678;
    v20[4] = &v29;
    v20[5] = &v22;
    int v21 = v3;
    [(NSMutableDictionary *)aggregateDeviceMap enumerateKeysAndObjectsUsingBlock:v20];
    if ((unint64_t)v5 > v23[3])
    {
      v11 = v30;
      id obj = v30[5];
      NSAppendPrintF_safe();
      objc_storeStrong(v11 + 5, obj);
    }
    v12 = v30;
    id v18 = v30[5];
    v15 = CUDescriptionWithLevel();
    NSAppendPrintF_safe();
    objc_storeStrong(v12 + 5, v18);

    _Block_object_dispose(&v22, 8);
  }
  id v13 = v30[5];
  _Block_object_dispose(&v29, 8);

  return v13;
}

- (void)activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_aggregateDiscoveryFlags = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unsigned __int8 v3 = self->_discoveryArray;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v9 = (unint64_t)[v8 discoveryFlags];
        self->_aggregateDiscoveryFlags |= (unint64_t)[v8 extraDiscoveryFlags] | v9;
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
  {
    id v16 = CUPrintFlags64();
    LogPrintF_safe();
  }
  v10 = self->_whbRouter;
  if (!v10)
  {
    v10 = objc_alloc_init(CBWHBRouter);
    objc_storeStrong((id *)&self->_whbRouter, v10);
    [(CBWHBRouter *)self->_whbRouter activate];
  }
  if (!self->_whbEventRegistered)
  {
    v11 = self->_remoteClient;
    if (!v11 && dword_1009F83A0 <= 90 && (dword_1009F83A0 != -1 || _LogCategory_Initialize())) {
      LogPrintF_safe();
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10008ABC8;
    v26[3] = &unk_1009986A0;
    v26[4] = v11;
    void v26[5] = self;
    [(RPCompanionLinkClient *)v11 registerEventID:@"com.apple.bluetooth.whbU", 0, v26, v16 options handler];
    self->_whbEventRegistered = 1;
  }
  v12 = self->_localDiscovery;
  if (!v12)
  {
    id v13 = objc_alloc_init((Class)CBDiscovery);
    objc_storeStrong((id *)&self->_localDiscovery, v13);
    [v13 setDispatchQueue:self->_dispatchQueue];
    [v13 setDiscoveryFlags:self->_aggregateDiscoveryFlags & 0xFFFFBFFFFFFFFFFFLL];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10008ABE8;
    v23[3] = &unk_100997370;
    id v14 = v13;
    id v24 = v14;
    uint64_t v25 = self;
    [v14 setDeviceFoundHandler:v23];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10008AC88;
    v20[3] = &unk_100997370;
    id v15 = v14;
    id v21 = v15;
    uint64_t v22 = self;
    [v15 setDeviceLostHandler:v20];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008ACA8;
    v17[3] = &unk_100997398;
    v12 = (CBDiscovery *)v15;
    id v18 = v12;
    v19 = self;
    [(CBDiscovery *)v12 activateWithCompletion:v17];
  }
  [(CBWHBDiscoveryDaemon *)self remoteControllersChanged];
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize())) {
    LogPrintF_safe();
  }
  [(CBDiscovery *)self->_localDiscovery invalidate];
  localDiscovery = self->_localDiscovery;
  self->_localDiscovery = 0;

  [(RPCompanionLinkClient *)self->_remoteClient deregisterEventID:@"com.apple.bluetooth.whbU"];
  self->_whbEventRegistered = 0;
  [(NSMutableDictionary *)self->_remoteControllerMap enumerateKeysAndObjectsUsingBlock:&stru_1009986E0];
  [(CBWHBRouter *)self->_whbRouter invalidate];
  whbRouter = self->_whbRouter;
  self->_whbRouter = 0;

  id deviceFoundHandler = self->_deviceFoundHandler;
  self->_id deviceFoundHandler = 0;

  id deviceLostHandler = self->_deviceLostHandler;
  self->_id deviceLostHandler = 0;

  remoteControllerMap = self->_remoteControllerMap;
  self->_remoteControllerMap = 0;
}

- (void)diagnosticControl:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  [(RPCompanionLinkClient *)self->_remoteClient sendEventID:@"com.apple.bluetooth.whbU" event:v5 destinationID:RPDestinationIdentifierSameHome options:0 completion:0];
}

- (void)_reportLostDevicesForController:(id)a3
{
  id v4 = a3;
  [v4 controllerID];

  id v5 = [v4 activatedDiscovery];
  uint64_t v6 = [v5 discoveredDevices];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CBWHBDiscoveryDaemon deviceLost:remoteController:](self, "deviceLost:remoteController:", *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), v4, (void)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)remoteControllersChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unsigned __int8 v3 = [(RPCompanionLinkClient *)self->_remoteClient activeDevices];
  id v4 = 0;
  id v5 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v9 = [v8 serviceTypes];
        unsigned int v10 = [v9 containsObject:@"com.apple.bluetooth.remote"];

        if (v10)
        {
          v11 = [v8 idsDeviceIdentifier];
          if (v11)
          {
            if (!v4) {
              id v4 = objc_alloc_init((Class)NSMutableDictionary);
            }
            [v4 setObject:v8 forKeyedSubscript:v11];
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v5);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  long long v25 = 0u;
  long long v12 = [(NSMutableDictionary *)self->_remoteControllerMap allKeys];
  int v13 = 0;
  id v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * (void)j);
        id v18 = [v4 objectForKeyedSubscript:v17];

        if (!v18)
        {
          v19 = [(NSMutableDictionary *)self->_remoteControllerMap objectForKeyedSubscript:v17];
          [(NSMutableDictionary *)self->_remoteControllerMap setObject:0 forKeyedSubscript:v17];
          [(CBWHBRouter *)self->_whbRouter hostConnectionInterruptedOn:v17];
          [(CBWHBDiscoveryDaemon *)self _reportLostDevicesForController:v19];
          [v19 invalidate];

          ++v13;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v14);
  }

  remoteControllerMap = self->_remoteControllerMap;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008B460;
  v24[3] = &unk_100998708;
  v24[4] = self;
  [(NSMutableDictionary *)remoteControllerMap enumerateKeysAndObjectsUsingBlock:v24];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008B474;
  v21[3] = &unk_100998730;
  v21[4] = self;
  v21[5] = v22;
  [v4 enumerateKeysAndObjectsUsingBlock:v21];
  if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
  {
    [(NSMutableDictionary *)self->_remoteControllerMap count];
    LogPrintF_safe();
  }
  _Block_object_dispose(v22, 8);
}

- (void)deviceFound:(id)a3 remoteController:(id)a4
{
  id v22 = a3;
  uint64_t v6 = [a4 controllerID];
  id v7 = (void *)v6;
  id v8 = @"CBLocalHostID";
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  id v9 = v8;

  if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
  {
    id v20 = v22;
    id v21 = v9;
    LogPrintF_safe();
  }
  unsigned int v10 = [v22 stableIdentifier:v20, v21];
  if (v10)
  {
    [v22 setLastSeenTicks:mach_absolute_time()];
    [v22 setRemoteHostID:v9];
    v11 = [(NSMutableDictionary *)self->_aggregateDeviceMap objectForKeyedSubscript:v10];
    if (!v11)
    {
      v11 = objc_alloc_init(CBWHBAggregateDevice);
      aggregateDeviceMap = self->_aggregateDeviceMap;
      if (!aggregateDeviceMap)
      {
        int v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v14 = self->_aggregateDeviceMap;
        self->_aggregateDeviceMap = v13;

        aggregateDeviceMap = self->_aggregateDeviceMap;
      }
      [(NSMutableDictionary *)aggregateDeviceMap setObject:v11 forKeyedSubscript:v10];
    }
    id v15 = [(CBWHBAggregateDevice *)v11 deviceControllerMap];
    if (!v15)
    {
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      [(CBWHBAggregateDevice *)v11 setDeviceControllerMap:v15];
    }
    [(CBWHBRouter *)self->_whbRouter deviceFound:v22];
    if ((self->_aggregateDiscoveryFlags & 0x200100000) != 0
      && ((unint64_t)[v22 discoveryFlags] & 0x1400000) != 0
      && ((unint64_t)[v22 changeFlags] & 0x1000000000000) != 0
      || ([v15 objectForKeyedSubscript:v9],
          id v16 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v17 = [v16 isEquivalentToCBDevice:v22 compareFlags:1],
          v16,
          (v17 & 1) == 0))
    {
      [(CBWHBAggregateDevice *)v11 setLatestDevice:v22];
      [v15 setObject:v22 forKeyedSubscript:v9];
      id v18 = objc_retainBlock(self->_deviceFoundHandler);
      v19 = v18;
      if (v18) {
        (*((void (**)(id, id))v18 + 2))(v18, v22);
      }
    }
  }
}

- (void)deviceLost:(id)a3 remoteController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 controllerID];
  id v9 = (void *)v8;
  unsigned int v10 = @"CBLocalHostID";
  if (v8) {
    unsigned int v10 = (__CFString *)v8;
  }
  v11 = v10;

  if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
  {
    id v19 = v6;
    id v21 = v11;
    LogPrintF_safe();
  }
  long long v12 = [v6 stableIdentifier:v19, v21];
  if (v12)
  {
    int v13 = [(NSMutableDictionary *)self->_aggregateDeviceMap objectForKeyedSubscript:v12];
    id v14 = v13;
    if (v13)
    {
      id v15 = [v13 deviceControllerMap];
      id v16 = [v15 objectForKeyedSubscript:v11];
      [v15 setObject:0 forKeyedSubscript:v11];
      [v16 setRemoteHostID:v11];
      [(CBWHBRouter *)self->_whbRouter deviceLost:v16];
      id v17 = objc_retainBlock(self->_deviceLostHandler);
      id v18 = v17;
      if (v17) {
        (*((void (**)(id, void *))v17 + 2))(v17, v16);
      }
      if ([v15 count])
      {
        uint64_t v25 = 0;
        long long v26 = &v25;
        uint64_t v27 = 0x3032000000;
        long long v28 = sub_10004CF1C;
        long long v29 = sub_10004CD60;
        id v30 = 0;
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x2020000000;
        v24[3] = 0;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10008BB10;
        v23[3] = &unk_100998758;
        void v23[4] = &v25;
        v23[5] = v24;
        [v15 enumerateKeysAndObjectsUsingBlock:v23];
        if (!v26[5] && dword_1009F83A0 <= 115 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
        {
          id v20 = v6;
          id v22 = v11;
          LogPrintF_safe();
        }
        [v14 setLatestDevice:v26[5] latestDevice:v20 latestDevice:v22];
        _Block_object_dispose(v24, 8);
        _Block_object_dispose(&v25, 8);
      }
      else
      {
        [(NSMutableDictionary *)self->_aggregateDeviceMap setObject:0 forKeyedSubscript:v12];
      }
    }
  }
}

- (id)localDeviceForStableId:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  id v6 = [(NSMutableDictionary *)self->_aggregateDeviceMap objectForKeyedSubscript:v5];

  id v7 = [v6 deviceControllerMap];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"CBLocalHostID"];

  return v8;
}

- (id)optimalHostIdForStableId:(id)a3 result:(int *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  whbRouter = self->_whbRouter;
  if (!a4 || whbRouter)
  {
    uint64_t v8 = [(CBWHBRouter *)whbRouter optimalWHBHostForStableIdentifier:v6 result:a4];
  }
  else
  {
    uint64_t v8 = 0;
    *a4 = 1702;
  }

  return v8;
}

- (void)_receivedWHBUpdateEvent:(id)a3 options:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();

  if (v7)
  {
    uint64_t v8 = self->_whbRouter;
    if (v8)
    {
      if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
      {
        v11 = CUPrintNSObjectOneLine();
        LogPrintF_safe();

        -[CBWHBRouter receivedUpdateEvent:hostID:](v8, "receivedUpdateEvent:hostID:", v12, v7, v7, v11);
      }
      else
      {
        -[CBWHBRouter receivedUpdateEvent:hostID:](v8, "receivedUpdateEvent:hostID:", v12, v7, v9, v10);
      }
    }
    else if (dword_1009F83A0 <= 30 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else if (dword_1009F83A0 <= 90 && (dword_1009F83A0 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (CBDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (void)setDaemonServer:(id)a3
{
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (NSArray)discoveryArray
{
  return self->_discoveryArray;
}

- (void)setDiscoveryArray:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (RPCompanionLinkClient)remoteClient
{
  return self->_remoteClient;
}

- (void)setRemoteClient:(id)a3
{
}

- (CBWHBRouter)whbRouter
{
  return self->_whbRouter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whbRouter, 0);
  objc_storeStrong((id *)&self->_remoteClient, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryArray, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_remoteControllerMap, 0);
  objc_storeStrong((id *)&self->_localDiscovery, 0);

  objc_storeStrong((id *)&self->_aggregateDeviceMap, 0);
}

@end