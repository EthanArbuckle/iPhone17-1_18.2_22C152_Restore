@interface EPBulkCharacteristicReaderWriter
- (BOOL)invalidated;
- (BOOL)shouldAttemptReadFromAdvertisedName:(id)a3 bluetoothDeviceID:(id)a4;
- (CBUUID)readCharacteristicUUID;
- (CBUUID)writeCharacteristicUUID;
- (EPBulkCharacteristicReaderWriter)initWithWriteCharacteristicUUID:(id)a3 readCharacteristicUUID:(id)a4 timeout:(double)a5;
- (EPCentralManager)central;
- (EPDiscoverer)discoverer;
- (NSMapTable)deviceEntries;
- (NSMapTable)readerDeviceLookup;
- (NSMutableSet)forceReadDevices;
- (double)timeout;
- (id)writeDataForAdvertisedName:(id)a3 bluetoothDeviceID:(id)a4;
- (void)characteristicReader:(id)a3 didFailWithError:(id)a4;
- (void)characteristicReader:(id)a3 didRead:(id)a4;
- (void)discoverer:(id)a3 deviceDidBecomeProximate:(id)a4;
- (void)discoverer:(id)a3 deviceDidBecomeUnproximate:(id)a4;
- (void)invalidate;
- (void)readDiscoveredDevice:(id)a3;
- (void)setCentral:(id)a3;
- (void)setDeviceEntries:(id)a3;
- (void)setDiscoverer:(id)a3;
- (void)setForceReadDevices:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setReadCharacteristicUUID:(id)a3;
- (void)setReaderDeviceLookup:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setWriteCharacteristicUUID:(id)a3;
- (void)update;
@end

@implementation EPBulkCharacteristicReaderWriter

- (EPBulkCharacteristicReaderWriter)initWithWriteCharacteristicUUID:(id)a3 readCharacteristicUUID:(id)a4 timeout:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)EPBulkCharacteristicReaderWriter;
  v11 = [(EPBulkCharacteristicReaderWriter *)&v30 init];
  v12 = v11;
  if (v11)
  {
    v11->_timeout = a5;
    objc_storeStrong((id *)&v11->_readCharacteristicUUID, a4);
    objc_storeStrong((id *)&v12->_writeCharacteristicUUID, a3);
    uint64_t v13 = objc_opt_new();
    forceReadDevices = v12->_forceReadDevices;
    v12->_forceReadDevices = (NSMutableSet *)v13;

    v15 = sub_1000A3CF0();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      v17 = sub_1000A3CF0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        v20 = [v9 UUIDString];
        v21 = [v10 UUIDString];
        *(_DWORD *)buf = 134218754;
        v32 = v12;
        __int16 v33 = 2112;
        v34 = v19;
        __int16 v35 = 2112;
        v36 = v20;
        __int16 v37 = 2112;
        v38 = v21;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPBulkCharacteristicReaderWriter[%p]: (%@) writing to %@ reading from %@", buf, 0x2Au);
      }
    }
    uint64_t v22 = +[NSMapTable strongToStrongObjectsMapTable];
    deviceEntries = v12->_deviceEntries;
    v12->_deviceEntries = (NSMapTable *)v22;

    if (v10)
    {
      uint64_t v24 = +[NSMapTable strongToStrongObjectsMapTable];
      readerDeviceLookup = v12->_readerDeviceLookup;
      v12->_readerDeviceLookup = (NSMapTable *)v24;
    }
    v26 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AFD6C;
    block[3] = &unk_1001655F8;
    v29 = v12;
    dispatch_async(v26, block);
  }
  return v12;
}

- (BOOL)shouldAttemptReadFromAdvertisedName:(id)a3 bluetoothDeviceID:(id)a4
{
  return 1;
}

- (id)writeDataForAdvertisedName:(id)a3 bluetoothDeviceID:(id)a4
{
  return 0;
}

- (void)readDiscoveredDevice:(id)a3
{
  [(NSMutableSet *)self->_forceReadDevices addObject:a3];
  v4 = +[EPFactory queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AFE24;
  block[3] = &unk_1001655F8;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (void)update
{
  if (self->_invalidated)
  {
    discoverer = self->_discoverer;
    self->_discoverer = 0;

    central = self->_central;
    self->_central = 0;

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v5 = self->_deviceEntries;
    id v6 = [(NSMapTable *)v5 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v59;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v59 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [(NSMapTable *)self->_deviceEntries objectForKey:*(void *)(*((void *)&v58 + 1) + 8 * i)];
          v11 = [v10 reader];
          [v11 invalidate];

          v12 = [v10 writer];
          [v12 invalidate];
        }
        id v7 = [(NSMapTable *)v5 countByEnumeratingWithState:&v58 objects:v64 count:16];
      }
      while (v7);
    }
LABEL_37:

    [(NSMapTable *)self->_deviceEntries removeAllObjects];
    [(NSMapTable *)self->_readerDeviceLookup removeAllObjects];
    return;
  }
  if (!self->_central)
  {
    uint64_t v13 = +[EPFactory sharedFactory];
    v14 = (EPCentralManager *)[v13 newCentralManagerWithDelegate:self];
    v15 = self->_central;
    self->_central = v14;
  }
  if (!self->_discoverer)
  {
    BOOL v16 = +[EPFactory sharedFactory];
    [v16 setDiscovererDeviceUUIDs:0];

    v17 = +[EPFactory sharedFactory];
    [v17 setDiscovererShouldScanForProximity:0];

    v18 = +[EPFactory sharedFactory];
    v19 = (EPDiscoverer *)[v18 newDiscovererWithDelegate:self];
    v20 = self->_discoverer;
    self->_discoverer = v19;

    v21 = [(EPDiscoverer *)self->_discoverer proximateDevices];
    id v22 = [v21 copy];

    v23 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000B0354;
    block[3] = &unk_100165530;
    id v56 = v22;
    v57 = self;
    id v24 = v22;
    dispatch_async(v23, block);
  }
  if ((id)[(EPResource *)self->_central availability] != (id)1)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v5 = self->_deviceEntries;
    id v37 = [(NSMapTable *)v5 countByEnumeratingWithState:&v44 objects:v62 count:16];
    if (v37)
    {
      id v38 = v37;
      uint64_t v39 = *(void *)v45;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(void *)v45 != v39) {
            objc_enumerationMutation(v5);
          }
          v41 = -[NSMapTable objectForKey:](self->_deviceEntries, "objectForKey:", *(void *)(*((void *)&v44 + 1) + 8 * (void)j), (void)v44);
          v42 = [v41 reader];
          [v42 invalidate];

          v43 = [v41 writer];
          [v43 invalidate];
        }
        id v38 = [(NSMapTable *)v5 countByEnumeratingWithState:&v44 objects:v62 count:16];
      }
      while (v38);
    }
    goto LABEL_37;
  }
  v25 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v26 = [(EPDiscoverer *)self->_discoverer proximateDevices];
  id v27 = [v26 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v52;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(void *)v52 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v51 + 1) + 8 * (void)k);
        v32 = [v31 uuid];
        __int16 v33 = [v32 UUIDString];

        v34 = [v31 name];
        if (v33
          && (__int16 v35 = v33,
              ([(NSMutableSet *)self->_forceReadDevices containsObject:v33] & 1) != 0)
          || v34
          && (__int16 v35 = v34, [(NSMutableSet *)self->_forceReadDevices containsObject:v34]))
        {
          [v25 addObject:v31];
          [(NSMutableSet *)self->_forceReadDevices removeObject:v35];
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v28);
  }

  if ([v25 count])
  {
    v36 = +[EPFactory queue];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1000B044C;
    v48[3] = &unk_100165530;
    id v49 = v25;
    v50 = self;
    dispatch_async(v36, v48);
  }
}

- (void)discoverer:(id)a3 deviceDidBecomeProximate:(id)a4
{
  id v5 = a4;
  if (self->_invalidated) {
    goto LABEL_25;
  }
  id v6 = [(NSMapTable *)self->_deviceEntries objectForKey:v5];
  id v7 = v6;
  if (self->_readCharacteristicUUID)
  {
    uint64_t v8 = [v6 reader];

    if (!v8)
    {
      id v37 = [v5 name];
      id v38 = [v5 uuid];
      unsigned __int8 v39 = [(EPBulkCharacteristicReaderWriter *)self shouldAttemptReadFromAdvertisedName:v37 bluetoothDeviceID:v38];

      if (v39)
      {
        int v9 = 1;
        goto LABEL_5;
      }
      v48 = sub_1000A3CF0();
      BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);

      int v9 = 0;
      if (!v49) {
        goto LABEL_5;
      }
      v50 = sub_1000A3CF0();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        long long v51 = [v5 name];
        long long v52 = [v5 uuid];
        long long v53 = [v52 UUIDString];
        *(_DWORD *)buf = 138412546;
        long long v59 = v51;
        __int16 v60 = 2112;
        long long v61 = v53;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "EPBulkCharacteristicReaderWriter: subclass read check- ignoring BT device %@ %@", buf, 0x16u);
      }
    }
  }
  int v9 = 0;
LABEL_5:
  if (self->_writeCharacteristicUUID)
  {
    id v10 = [v7 writer];

    if (!v10)
    {
      v40 = [v5 name];
      v41 = [v5 uuid];
      v11 = [(EPBulkCharacteristicReaderWriter *)self writeDataForAdvertisedName:v40 bluetoothDeviceID:v41];

      if (v11) {
        goto LABEL_8;
      }
      v42 = sub_1000A3CF0();
      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

      if (v43)
      {
        long long v44 = sub_1000A3CF0();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          long long v45 = [v5 name];
          long long v46 = [v5 uuid];
          long long v47 = [v46 UUIDString];
          *(_DWORD *)buf = 138412546;
          long long v59 = v45;
          __int16 v60 = 2112;
          long long v61 = v47;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "EPBulkCharacteristicReaderWriter: subclass write check- ignoring BT device %@ %@", buf, 0x16u);
        }
      }
    }
  }
  v11 = 0;
LABEL_8:
  if (v9)
  {
    v12 = sub_1000A3CF0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      v14 = sub_1000A3CF0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v5 name];
        BOOL v16 = [v5 uuid];
        v17 = [v16 UUIDString];
        *(_DWORD *)buf = 138412546;
        long long v59 = v15;
        __int16 v60 = 2112;
        long long v61 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "EPBulkCharacteristicReaderWriter: Reading characteristic on BT device %@ %@", buf, 0x16u);
      }
    }
    if (!v7)
    {
      id v7 = (id)objc_opt_new();
      [v7 setDevice:v5];
    }
    id v18 = [v5 newObserverWithDelegate:0];
    v19 = [EPCharacteristicReader alloc];
    double timeout = self->_timeout;
    v21 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
    id v22 = [(EPCharacteristicReader *)v19 initWithDelegate:self timeout:v18 peripheral:v21 serviceUUID:self->_readCharacteristicUUID characteristicUUID:timeout];
    [v7 setReader:v22];

    [(NSMapTable *)self->_deviceEntries setObject:v7 forKey:v5];
    readerDeviceLookup = self->_readerDeviceLookup;
    id v24 = [v7 reader];
    [(NSMapTable *)readerDeviceLookup setObject:v5 forKey:v24];
  }
  if (v11)
  {
    v25 = sub_1000A3CF0();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      id v27 = sub_1000A3CF0();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [v5 name];
        uint64_t v29 = [v5 uuid];
        objc_super v30 = [v29 UUIDString];
        *(_DWORD *)buf = 138412546;
        long long v59 = v28;
        __int16 v60 = 2112;
        long long v61 = v30;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "EPBulkCharacteristicReaderWriter: Writing characteristic on BT device %@ %@", buf, 0x16u);
      }
    }
    if (!v7)
    {
      id v7 = (id)objc_opt_new();
      [v7 setDevice:v5];
    }
    id v31 = [v5 newObserverWithDelegate:0];
    v32 = [EPCharacteristicWriter alloc];
    __int16 v33 = +[CBUUID UUIDWithString:@"9AA4730F-B25C-4CC3-B821-C931559FC196"];
    v34 = [(EPCharacteristicWriter *)v32 initWithPeripheral:v31 serviceUUID:v33 characteristicUUID:self->_writeCharacteristicUUID];
    [v7 setWriter:v34];

    [(NSMapTable *)self->_deviceEntries setObject:v7 forKey:v5];
    __int16 v35 = [v7 writer];
    double v36 = self->_timeout;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1000B0C78;
    v54[3] = &unk_1001682E0;
    id v7 = v7;
    id v55 = v7;
    id v56 = self;
    id v57 = v5;
    [v35 writeData:v11 timeout:&stru_100168F30 begin:v54 completion:v36];
  }
LABEL_25:
}

- (void)characteristicReader:(id)a3 didRead:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMapTable *)self->_readerDeviceLookup objectForKey:v6];
  int v9 = sub_1000A3CF0();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    v11 = sub_1000A3CF0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v8 name];
      BOOL v13 = [v8 uuid];
      v14 = [v13 UUIDString];
      int v25 = 138412802;
      BOOL v26 = v12;
      __int16 v27 = 2112;
      id v28 = v14;
      __int16 v29 = 2048;
      id v30 = [v7 length];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "EPBulkCharacteristicReaderWriter: Read characteristic from BT device %@ %@ %ld bytes", (uint8_t *)&v25, 0x20u);
    }
  }
  if (v8)
  {
    v15 = [(NSMapTable *)self->_deviceEntries objectForKey:v8];
    BOOL v16 = v15;
    if (v15)
    {
      v17 = [v15 reader];
      if (v17)
      {
      }
      else
      {
        id v18 = [v16 writer];

        if (!v18) {
          [(NSMapTable *)self->_deviceEntries removeObjectForKey:v8];
        }
      }
      v19 = [v16 reader];
      [v19 invalidate];

      [v16 setReader:0];
      [(NSMapTable *)self->_readerDeviceLookup removeObjectForKey:v6];
      v20 = v7;
      if (!v7) {
        v20 = objc_opt_new();
      }
      v21 = [v16 device];
      id v22 = [v21 name];
      v23 = [v16 device];
      id v24 = [v23 uuid];
      [(EPBulkCharacteristicReaderWriter *)self readResult:v20 advertisedName:v22 bluetoothDeviceID:v24];

      if (!v7) {
    }
      }
  }
}

- (void)characteristicReader:(id)a3 didFailWithError:(id)a4
{
  id v5 = a3;
  id v6 = [(NSMapTable *)self->_readerDeviceLookup objectForKey:v5];
  id v7 = sub_1000A3CF0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    int v9 = sub_1000A3CF0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [v6 name];
      v11 = [v6 uuid];
      v12 = [v11 UUIDString];
      int v22 = 138412546;
      v23 = v10;
      __int16 v24 = 2112;
      int v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "EPBulkCharacteristicReaderWriter: Failed to read characteristic from BT device %@ %@", (uint8_t *)&v22, 0x16u);
    }
  }
  if (v6)
  {
    BOOL v13 = [(NSMapTable *)self->_deviceEntries objectForKey:v6];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 reader];
      if (v15)
      {
      }
      else
      {
        BOOL v16 = [v14 writer];

        if (!v16) {
          [(NSMapTable *)self->_deviceEntries removeObjectForKey:v6];
        }
      }
      v17 = [v14 reader];
      [v17 invalidate];

      [v14 setReader:0];
      [(NSMapTable *)self->_readerDeviceLookup removeObjectForKey:v5];
      id v18 = [v14 device];
      v19 = [v18 name];
      v20 = [v14 device];
      v21 = [v20 uuid];
      [(EPBulkCharacteristicReaderWriter *)self readResult:0 advertisedName:v19 bluetoothDeviceID:v21];
    }
  }
}

- (void)discoverer:(id)a3 deviceDidBecomeUnproximate:(id)a4
{
  id v11 = a4;
  id v5 = -[NSMapTable objectForKey:](self->_deviceEntries, "objectForKey:");
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 writer];
    [v7 invalidate];

    BOOL v8 = [v6 reader];
    [v8 invalidate];

    [(NSMapTable *)self->_deviceEntries removeObjectForKey:v11];
    readerDeviceLookup = self->_readerDeviceLookup;
    BOOL v10 = [v6 reader];
    [(NSMapTable *)readerDeviceLookup removeObjectForKey:v10];
  }
}

- (void)invalidate
{
  v3 = sub_1000A3CF0();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = sub_1000A3CF0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EPBulkCharacteristicWriter: invalidate call", v6, 2u);
    }
  }
  self->_invalidated = 1;
  [(EPBulkCharacteristicReaderWriter *)self update];
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSMapTable)deviceEntries
{
  return self->_deviceEntries;
}

- (void)setDeviceEntries:(id)a3
{
}

- (NSMapTable)readerDeviceLookup
{
  return self->_readerDeviceLookup;
}

- (void)setReaderDeviceLookup:(id)a3
{
}

- (EPDiscoverer)discoverer
{
  return self->_discoverer;
}

- (void)setDiscoverer:(id)a3
{
}

- (CBUUID)readCharacteristicUUID
{
  return self->_readCharacteristicUUID;
}

- (void)setReadCharacteristicUUID:(id)a3
{
}

- (CBUUID)writeCharacteristicUUID
{
  return self->_writeCharacteristicUUID;
}

- (void)setWriteCharacteristicUUID:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (NSMutableSet)forceReadDevices
{
  return self->_forceReadDevices;
}

- (void)setForceReadDevices:(id)a3
{
}

- (EPCentralManager)central
{
  return self->_central;
}

- (void)setCentral:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_central, 0);
  objc_storeStrong((id *)&self->_forceReadDevices, 0);
  objc_storeStrong((id *)&self->_writeCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_readCharacteristicUUID, 0);
  objc_storeStrong((id *)&self->_discoverer, 0);
  objc_storeStrong((id *)&self->_readerDeviceLookup, 0);

  objc_storeStrong((id *)&self->_deviceEntries, 0);
}

@end