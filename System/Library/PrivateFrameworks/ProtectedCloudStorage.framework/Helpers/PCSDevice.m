@interface PCSDevice
- (BOOL)_onQueue_isReachable;
- (BOOL)isActivePairedDevice;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReachable;
- (BOOL)isTombstone;
- (BOOL)supportsNewProtocol;
- (BOOL)supportsPCSKeySync;
- (BOOL)syncingIsRestricted;
- (NRDevice)nrDevice;
- (NSHashTable)observers;
- (NSString)UUID;
- (NSString)buildVersion;
- (NSString)idsDeviceIdentifier;
- (NSString)model;
- (NSString)osVersion;
- (NSString)serialNumber;
- (NSString)watchSize;
- (NSUUID)pairingID;
- (OS_dispatch_queue)internalQueue;
- (PCSDevice)init;
- (PCSDevice)initWithIDSDevice:(id)a3;
- (unint64_t)hash;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setIsActivePairedDevice:(BOOL)a3;
- (void)setIsConnected:(BOOL)a3;
- (void)setIsTombstone:(BOOL)a3;
- (void)setSyncingIsRestricted:(BOOL)a3;
- (void)updateIDSDevice:(id)a3;
@end

@implementation PCSDevice

- (PCSDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)PCSDevice;
  v2 = [(PCSDevice *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ProtectedCloudStorage.device_internal_queue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (PCSDevice)initWithIDSDevice:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(PCSDevice *)self init];
  if (!v5) {
    goto LABEL_6;
  }
  if (!v4)
  {
    uint64_t v16 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      v17 = "Got nil IDSDevice";
      v18 = v16;
      uint32_t v19 = 2;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  uint64_t v6 = IDSCopyIDForDevice();
  idsDeviceIdentifier = v5->_idsDeviceIdentifier;
  v5->_idsDeviceIdentifier = (NSString *)v6;

  objc_super v8 = [(PCSDevice *)v5 idsDeviceIdentifier];

  if (!v8)
  {
    uint64_t v20 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v4;
      v17 = "Failed to get IDS Device Identifier for %@";
LABEL_13:
      v18 = v20;
      uint32_t v19 = 12;
      goto LABEL_14;
    }
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  [(PCSDevice *)v5 updateIDSDevice:v4];
  v9 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v10 = [v9 deviceForIDSDevice:v4];
  nrDevice = v5->_nrDevice;
  v5->_nrDevice = (NRDevice *)v10;

  v12 = [(PCSDevice *)v5 nrDevice];

  if (!v12)
  {
    uint64_t v20 = qword_100040ED8;
    if (os_log_type_enabled((os_log_t)qword_100040ED8, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v4;
      v17 = "Failed to get NRDevice from IDS device %@";
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  v13 = +[PCSPairedSyncDelegate sharedSyncDelegate];
  v14 = [(PCSDevice *)v5 pairingID];
  -[PCSDevice setSyncingIsRestricted:](v5, "setSyncingIsRestricted:", [v13 syncingIsRestrictedForPairingID:v14]);

LABEL_6:
  v15 = v5;
LABEL_16:

  return v15;
}

- (void)updateIDSDevice:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(PCSDevice *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010514;
  v7[3] = &unk_100038C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(PCSDevice *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000108C4;
  v7[3] = &unk_100038C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(PCSDevice *)self internalQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000109CC;
  v7[3] = &unk_100038C70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (NSUUID)pairingID
{
  v2 = [(PCSDevice *)self nrDevice];
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyPairingID];

  return (NSUUID *)v3;
}

- (BOOL)supportsPCSKeySync
{
  v2 = [(PCSDevice *)self nrDevice];
  NRWatchOSVersionForRemoteDevice();
  char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();

  return IsGreaterThanOrEqual;
}

- (BOOL)supportsNewProtocol
{
  v2 = [(PCSDevice *)self nrDevice];
  NRWatchOSVersionForRemoteDevice();

  return NRVersionIsGreaterThanOrEqual();
}

- (BOOL)_onQueue_isReachable
{
  BOOL v3 = [(PCSDevice *)self isConnected];
  if (v3)
  {
    LOBYTE(v3) = [(PCSDevice *)self isActivePairedDevice];
  }
  return v3;
}

- (BOOL)isReachable
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(PCSDevice *)self internalQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010C24;
  v5[3] = &unk_100038BF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (NSString)model
{
  BOOL v3 = [(PCSDevice *)self nrDevice];
  id v4 = [v3 valueForProperty:NRDevicePropertyModelNumber];

  dispatch_queue_t v5 = [(PCSDevice *)self nrDevice];
  uint64_t v6 = [v5 valueForProperty:NRDevicePropertyRegionInfo];

  if (!v6) {
    uint64_t v6 = &stru_100039C58;
  }
  if ([v4 length])
  {
    v7 = +[NSString stringWithFormat:@"%@%@", v4, v6];
  }
  else
  {
    v7 = @"N/A";
  }

  return (NSString *)v7;
}

- (NSString)watchSize
{
  v2 = [(PCSDevice *)self nrDevice];
  BOOL v3 = [v2 valueForProperty:NRDevicePropertyProductType];

  unsigned int v4 = NRDeviceSizeForProductType();
  if (v4 > 2) {
    CFStringRef v5 = @"Unhandled";
  }
  else {
    CFStringRef v5 = off_100039048[(__int16)v4];
  }

  return &v5->isa;
}

- (NSString)buildVersion
{
  v2 = [(PCSDevice *)self nrDevice];
  BOOL v3 = [v2 valueForProperty:NRDevicePropertySystemBuildVersion];

  return (NSString *)v3;
}

- (NSString)osVersion
{
  v2 = [(PCSDevice *)self nrDevice];
  BOOL v3 = [v2 valueForProperty:NRDevicePropertySystemVersion];

  return (NSString *)v3;
}

- (NSString)serialNumber
{
  v2 = [(PCSDevice *)self nrDevice];
  BOOL v3 = [v2 valueForProperty:NRDevicePropertySerialNumber];

  return (NSString *)v3;
}

- (NSString)UUID
{
  v2 = [(PCSDevice *)self nrDevice];
  BOOL v3 = [v2 valueForProperty:NRDevicePropertyUDID];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  v2 = [(PCSDevice *)self idsDeviceIdentifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (PCSDevice *)a3;
  if (v4 == self)
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFStringRef v5 = [(PCSDevice *)v4 idsDeviceIdentifier];
      uint64_t v6 = [(PCSDevice *)self idsDeviceIdentifier];
      unsigned __int8 v7 = [v5 isEqualToString:v6];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }

  return v7;
}

- (NRDevice)nrDevice
{
  return (NRDevice *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)idsDeviceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isActivePairedDevice
{
  return self->_isActivePairedDevice;
}

- (void)setIsActivePairedDevice:(BOOL)a3
{
  self->_isActivePairedDevice = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isTombstone
{
  return self->_isTombstone;
}

- (void)setIsTombstone:(BOOL)a3
{
  self->_isTombstone = a3;
}

- (BOOL)syncingIsRestricted
{
  return self->_syncingIsRestricted;
}

- (void)setSyncingIsRestricted:(BOOL)a3
{
  self->_syncingIsRestricted = a3;
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)internalQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_nrDevice, 0);
}

@end