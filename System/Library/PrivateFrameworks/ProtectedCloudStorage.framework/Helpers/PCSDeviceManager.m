@interface PCSDeviceManager
+ (id)sharedManager;
- (NSArray)allDevices;
- (NSMutableDictionary)devices;
- (OS_dispatch_queue)internalQueue;
- (PCSDevice)activePairedDevice;
- (PCSDeviceManager)init;
- (PCSDeviceManagerDelegate)delegate;
- (id)currentActivePairedDevice;
- (id)deviceForIDSIdentifier:(id)a3;
- (id)deviceForPairingID:(id)a3;
- (void)setActivePairedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updatedIDSDevices:(id)a3;
@end

@implementation PCSDeviceManager

+ (id)sharedManager
{
  if (qword_100040E60 != -1) {
    dispatch_once(&qword_100040E60, &stru_1000390A8);
  }
  v2 = (void *)qword_100040E58;
  return v2;
}

- (PCSDeviceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)PCSDeviceManager;
  v2 = [(PCSDeviceManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    devices = v2->_devices;
    v2->_devices = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appconduitd.PCSDeviceManager.internal", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (id)currentActivePairedDevice
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100011E94;
  v14 = sub_100011EA4;
  id v15 = 0;
  uint64_t v3 = [(PCSDeviceManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011EAC;
  block[3] = &unk_100038BF8;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(v3, block);

  v4 = (void *)v11[5];
  if (!v4)
  {
    dispatch_queue_t v5 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No active paired device", v8, 2u);
    }
    v4 = (void *)v11[5];
  }
  id v6 = v4;
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)deviceForIDSIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100011E94;
  v18 = sub_100011EA4;
  id v19 = 0;
  dispatch_queue_t v5 = [(PCSDeviceManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000120D0;
  block[3] = &unk_100038E28;
  v13 = &v14;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(v5, block);

  v7 = (void *)v15[5];
  if (!v7)
  {
    objc_super v8 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No IDS Device registered with identifier %@", buf, 0xCu);
    }
    v7 = (void *)v15[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)deviceForPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100011E94;
  v18 = sub_100011EA4;
  id v19 = 0;
  dispatch_queue_t v5 = [(PCSDeviceManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012310;
  block[3] = &unk_1000390D0;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  v13 = &v14;
  dispatch_sync(v5, block);

  v7 = (void *)v15[5];
  if (!v7)
  {
    objc_super v8 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to find device with pairing ID %@", buf, 0xCu);
    }
    v7 = (void *)v15[5];
  }
  id v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (NSArray)allDevices
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100011E94;
  v11 = sub_100011EA4;
  id v12 = 0;
  uint64_t v3 = [(PCSDeviceManager *)self internalQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012574;
  v6[3] = &unk_100038BF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)updatedIDSDevices:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(PCSDeviceManager *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012690;
  v7[3] = &unk_100038C70;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (PCSDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PCSDeviceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)devices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (PCSDevice)activePairedDevice
{
  return (PCSDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActivePairedDevice:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_activePairedDevice, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end