@interface W5BluetoothController
- (BOOL)isAvailable;
- (BOOL)isConnectable;
- (BOOL)isDiscoverable;
- (BOOL)isScanning;
- (BOOL)powerOn;
- (W5BluetoothController)init;
- (id)__ios__deviceList;
- (id)address;
- (id)devices;
- (id)updatedBluetoothCallback;
- (void)__ios__handleBTAdvertisingNotification:(id)a3;
- (void)__ios__handleBTAvailabilityNotification:(id)a3;
- (void)__ios__handleBTConnectabiliyNotification:(id)a3;
- (void)__ios__handleBTDiscoveryNotification:(id)a3;
- (void)__ios__handleBTPowerNotification:(id)a3;
- (void)dealloc;
- (void)setUpdatedBluetoothCallback:(id)a3;
- (void)startEventMonitoring;
- (void)stopEventMonitoring;
@end

@implementation W5BluetoothController

- (W5BluetoothController)init
{
  v7.receiver = self;
  v7.super_class = (Class)W5BluetoothController;
  v2 = [(W5BluetoothController *)&v7 init];
  if (v2
    && (v3 = dispatch_queue_create("com.apple.wifivelocityd.bt", 0), (v2->_queue = (OS_dispatch_queue *)v3) != 0)
    && (dispatch_queue_set_specific(v3, &v2->_queue, (void *)1, 0),
        v4 = (CBCentralManager *)objc_alloc_init((Class)CBCentralManager),
        (v2->_centralManager = v4) != 0))
  {
    +[BluetoothManager setSharedInstanceQueue:v2->_queue];
    [+[BluetoothManager sharedInstance] maskLocalDeviceEvents:0xFFFFFFFFLL];
    int v5 = 10;
    do
    {
      if ([+[BluetoothManager sharedInstance] available])break; {
      usleep(0x30D40u);
      }
      --v5;
    }
    while (v5);
  }
  else
  {

    return 0;
  }
  return v2;
}

- (void)setUpdatedBluetoothCallback:(id)a3
{
  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedBluetoothCallback = [a3 copy];
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100055978;
    v6[3] = &unk_1000DDC08;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  v4.receiver = self;
  v4.super_class = (Class)W5BluetoothController;
  [(W5BluetoothController *)&v4 dealloc];
}

- (void)startEventMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055AA4;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopEventMonitoring
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055C4C;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)powerOn
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055D70;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)address
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = sub_100055EBC;
  v10 = sub_100055ECC;
  uint64_t v11 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055ED8;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDiscoverable
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055FDC;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isConnectable
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000560DC;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isAvailable
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000561DC;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isScanning
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000562DC;
  block[3] = &unk_1000DD348;
  block[4] = &v6;
  dispatch_sync(queue, block);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)__ios__handleBTAvailabilityNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000563A8;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTPowerNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000564AC;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTConnectabiliyNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000565B0;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTDiscoveryNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000566B4;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__ios__handleBTAdvertisingNotification:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000567B8;
  block[3] = &unk_1000DDC80;
  block[4] = self;
  dispatch_async(queue, block);
}

- (id)__ios__deviceList
{
  id v3 = +[NSMutableArray array];
  id v4 = +[NSMutableDictionary dictionary];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = [[-[CBCentralManager sharedPairingAgent](self->_centralManager) sharedPairingAgent] retrievePairedPeers];
  id v6 = [v5 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        if ([v10 name])
        {
          uint64_t v11 = objc_alloc_init(W5BluetoothDeviceInternal);
          [(W5BluetoothDeviceInternal *)v11 setPeripheral:v10 centralManager:self->_centralManager];
          [v4 setObject:v11 forKeyedSubscript:[v10 name]];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v7);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v12 = [(CBCentralManager *)self->_centralManager retrieveConnectedPeripheralsWithServices:0 allowAll:1];
  id v13 = [v12 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
        if ([v17 name])
        {
          v18 = objc_alloc_init(W5BluetoothDeviceInternal);
          [(W5BluetoothDeviceInternal *)v18 setPeripheral:v17 centralManager:self->_centralManager];
          [v4 setObject:v18 forKeyedSubscript:[v17 name]];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v14);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v19 = [+[BluetoothManager sharedInstance] pairedDevices];
  id v20 = [v19 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v47 + 1) + 8 * (void)k);
        if ([v24 name])
        {
          v25 = (W5BluetoothDeviceInternal *)[v4 objectForKeyedSubscript:[v24 name]];
          if (!v25) {
            v25 = objc_alloc_init(W5BluetoothDeviceInternal);
          }
          [(W5BluetoothDeviceInternal *)v25 setBluetoothDevice:v24];
          [v4 setObject:v25 forKeyedSubscript:[v24 name]];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v21);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v26 = [+[BluetoothManager sharedInstance] connectedDevices];
  id v27 = [v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (m = 0; m != v28; m = (char *)m + 1)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v43 + 1) + 8 * (void)m);
        if ([v31 name])
        {
          v32 = (W5BluetoothDeviceInternal *)[v4 objectForKeyedSubscript:[v31 name]];
          if (!v32) {
            v32 = objc_alloc_init(W5BluetoothDeviceInternal);
          }
          [(W5BluetoothDeviceInternal *)v32 setBluetoothDevice:v31];
          [v4 setObject:v32 forKeyedSubscript:[v31 name]];
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v28);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v33 = [v4 allValues];
  id v34 = [v33 countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v40;
    do
    {
      for (n = 0; n != v35; n = (char *)n + 1)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(v33);
        }
        [v3 addObject:[*(id *)(*((void *)&v39 + 1) + 8 * (void)n) device]];
      }
      id v35 = [v33 countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v35);
  }
  return [v3 copy];
}

- (id)devices
{
  id v2 = [[-[W5BluetoothController __ios__deviceList](self, "__ios__deviceList") copy];

  return v2;
}

- (id)updatedBluetoothCallback
{
  return self->_updatedBluetoothCallback;
}

@end