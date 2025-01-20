@interface UARPDFUUpdater
+ (UARPDFUUpdater)sharedInstance;
+ (id)matchingDictionaryForIdentifier:(id)a3 serialNumber:(id)a4;
- (BOOL)addAccessory:(id)a3 enableNotification:(BOOL)a4;
- (BOOL)applyStagedFirmwareForAccessories:(id)a3;
- (BOOL)connectUARPForUARPAccessory:(id)a3;
- (BOOL)disconnectUARPForUARPAccessory:(id)a3;
- (BOOL)getDfuModeForUARPAccessoryID:(id)a3;
- (BOOL)queryProperties:(id)a3 accessoryID:(id)a4;
- (BOOL)recvUarpMsgFromAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (BOOL)removeAccessory:(id)a3;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (BOOL)serviceInstance;
- (BOOL)setDfuModeAccessoryID:(id)a3;
- (GoldRestoreUARPStatusDelegate)goldRestoreDelegate;
- (NSString)uarpCaptureFileName;
- (UARPDFUUpdater)init;
- (id)createAccessoryFromService:(unsigned int)a3 identifier:(id)a4;
- (id)getAccessoriesForIdentifier:(id)a3;
- (id)getDfuAccessoryForSerialNumber:(id)a3;
- (id)getDfuAccessoryForUarpAccessory:(id)a3;
- (id)getDfuAccessoryForUarpAccessoryID:(id)a3;
- (void)accessoryTransferComplete:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)assetDownloadFailed:(id)a3 assetID:(id)a4;
- (void)assetNotFound:(id)a3 assetID:(id)a4;
- (void)assetOnLocalStorage:(id)a3 assetID:(id)a4;
- (void)assetTransferComplete:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)holdPowerAssertionForAccessory;
- (void)matchingService:(unsigned int)a3 identifier:(id)a4;
- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5;
- (void)queryFailedForAccessory:(id)a3 property:(unint64_t)a4 error:(int64_t)a5;
- (void)releasePowerAssertionForAccessory;
- (void)setGoldRestoreDelegate:(id)a3;
- (void)setServiceInstance:(BOOL)a3;
- (void)setUarpCaptureFileName:(id)a3;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)startUpdateForAccessories:(id)a3 assetID:(id)a4;
- (void)startUpdateForAccessory:(id)a3 assetID:(id)a4;
@end

@implementation UARPDFUUpdater

- (UARPDFUUpdater)init
{
  v24.receiver = self;
  v24.super_class = (Class)UARPDFUUpdater;
  v2 = [(UARPDFUUpdater *)&v24 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.accessoryupdater.uarp", "dfuUpdater");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100017C58(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    dfuOtpAccessories = v2->_dfuOtpAccessories;
    v2->_dfuOtpAccessories = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.accessoryupdater.uarpdfuotp.uarpMessage.queue", 0);
    uarpMessageQueue = v2->_uarpMessageQueue;
    v2->_uarpMessageQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.accessoryupdater.uarpdfuotp.accry.queue", 0);
    accessoriesQueue = v2->_accessoriesQueue;
    v2->_accessoriesQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.accessoryupdater.uarpdfuotp.delegate.queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v19;

    v21 = (UARPController *)objc_alloc_init((Class)UARPController);
    uarpController = v2->_uarpController;
    v2->_uarpController = v21;

    [(UARPController *)v2->_uarpController setDelegate:v2];
    v2->_powerAssertionID = 0;
  }
  return v2;
}

+ (UARPDFUUpdater)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004C60;
  block[3] = &unk_100024420;
  block[4] = a1;
  if (qword_10002AC88 != -1) {
    dispatch_once(&qword_10002AC88, block);
  }
  v2 = (void *)qword_10002AC80;
  return (UARPDFUUpdater *)v2;
}

+ (id)matchingDictionaryForIdentifier:(id)a3 serialNumber:(id)a4
{
  v4 = +[UARPUSBDFUAccessory matchingDictionaryForIdentifier:a3 serialNumber:a4];
  id v5 = [v4 mutableCopy];

  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IOMatchLaunchStream"];
  [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IOMatchAll"];
  return v5;
}

- (BOOL)recvUarpMsgFromAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uarpMessageQueue = self->_uarpMessageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004DE0;
  block[3] = &unk_100024448;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(uarpMessageQueue, block);

  return 1;
}

- (void)matchingService:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100017CD0(log, v8, v9, v10, v11, v12, v13, v14);
  }
  id v15 = self->_log;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "-[UARPDFUUpdater matchingService:identifier:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_INFO, "%s: Instantiating detected accessory %@", (uint8_t *)&v19, 0x16u);
  }
  v16 = [(UARPDFUUpdater *)self createAccessoryFromService:v4 identifier:v6];
  if ([(UARPDFUUpdater *)self connectUARPForUARPAccessory:v16])
  {
    [(UARPDFUUpdater *)self addAccessory:v16 enableNotification:1];
    dispatch_queue_t v17 = self->_log;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "-[UARPDFUUpdater matchingService:identifier:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_INFO, "%s: Kicking off update for matched identifier %@", (uint8_t *)&v19, 0x16u);
    }
    [(UARPDFUUpdater *)self startUpdateForAccessory:v16 assetID:0];
  }
  else
  {
    v18 = self->_log;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "-[UARPDFUUpdater matchingService:identifier:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_INFO, "%s: Unable to initialize UARP for identifier %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (id)getAccessoriesForIdentifier:(id)a3
{
  uint64_t v4 = (const char *)a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  +[UARPUSBDFUAccessory matchingDictionaryForIdentifier:v4 serialNumber:0];
  io_iterator_t existing = 0;
  CFDictionaryRef v20 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v20, &existing))
  {
    uint64_t v6 = IOIteratorNext(existing);
    if (v6)
    {
      uint64_t v7 = v6;
      do
      {
        log = self->_log;
        if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v4;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Instantiating accessory found %@", buf, 0xCu);
        }
        uint64_t v9 = -[UARPDFUUpdater createAccessoryFromService:identifier:](self, "createAccessoryFromService:identifier:", v7, v4, v20);
        if (v9) {
          [v5 addObject:v9];
        }
        IOObjectRelease(v7);

        uint64_t v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    IOObjectRelease(existing);
  }
  uint64_t v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v4;
    __int16 v30 = 2112;
    id v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_INFO, "%@ accessories found  %@", buf, 0x16u);
  }
  __int16 v21 = (char *)v4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (-[UARPDFUUpdater connectUARPForUARPAccessory:](self, "connectUARPForUARPAccessory:", v16, v20, v21))
        {
          [(UARPDFUUpdater *)self addAccessory:v16 enableNotification:0];
        }
        else
        {
          dispatch_queue_t v17 = self->_log;
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v29 = "-[UARPDFUUpdater getAccessoriesForIdentifier:]";
            __int16 v30 = 2112;
            id v31 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "%s: Failed to initialize UARP layer for accessory (%@)", buf, 0x16u);
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v13);
  }

  v18 = +[NSArray arrayWithArray:v11];

  return v18;
}

- (void)holdPowerAssertionForAccessory
{
  if (self->_powerAssertionID)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100017DBC((os_log_t)log);
    }
  }
  else
  {
    uint64_t v4 = +[NSString stringWithFormat:@"com.apple.UARPPowerAssertion-USBDFU"];
    if ((createPowerAssertion() & 1) == 0 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100017D48();
    }
    id v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v7 = "-[UARPDFUUpdater holdPowerAssertionForAccessory]";
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, OS_LOG_TYPE_INFO, "%s: Power assertion held for %@", buf, 0x16u);
    }
    self->_powerAssertionID = 0;
  }
}

- (void)releasePowerAssertionForAccessory
{
  if (self->_powerAssertionID)
  {
    if ((releasePowerAssertion() & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_100017E84((os_log_t)log);
      }
    }
    uint64_t v4 = self->_log;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[UARPDFUUpdater releasePowerAssertionForAccessory]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v4, OS_LOG_TYPE_INFO, "%s: Power assertion released for USBDFU", (uint8_t *)&v6, 0xCu);
    }
    self->_powerAssertionID = 0;
  }
  else
  {
    id v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_100017E00((os_log_t)v5);
    }
  }
}

- (BOOL)queryProperties:(id)a3 accessoryID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessoryID:v7];
  if (v8)
  {
    id v23 = v7;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_100017F08();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v24 = v6;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uarpController = self->_uarpController;
          id v16 = objc_msgSend(v14, "unsignedIntegerValue", v23);
          dispatch_queue_t v17 = [v8 uarpAccessory];
          id v18 = [(UARPController *)uarpController queryProperty:v16 forAccessory:v17];

          if (v18)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              CFDictionaryRef v20 = log;
              [v14 unsignedIntegerValue];
              uint64_t v21 = UARPAccessoryPropertyToString();
              *(_DWORD *)buf = 136315650;
              __int16 v30 = "-[UARPDFUUpdater queryProperties:accessoryID:]";
              __int16 v31 = 2080;
              uint64_t v32 = v21;
              __int16 v33 = 2048;
              id v34 = v18;
              _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Query Property %s failed with error %ld", buf, 0x20u);
            }
            -[UARPDFUUpdater queryFailedForAccessory:property:error:](self, "queryFailedForAccessory:property:error:", v8, [v14 unsignedIntegerValue], v18);
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v11);
    }

    id v7 = v23;
    id v6 = v24;
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100017F7C();
  }

  return v8 != 0;
}

- (BOOL)getDfuModeForUARPAccessoryID:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100017FF0(log, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessoryID:v4];
  unsigned __int8 v14 = [v13 dfuModeActive];

  return v14;
}

- (BOOL)setDfuModeAccessoryID:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100018068(log, v6, v7, v8, v9, v10, v11, v12);
  }
  id v13 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessoryID:v4];
  if ([v13 requiresPowerAssertion])
  {
    unsigned __int8 v14 = self->_log;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      id v18 = "-[UARPDFUUpdater setDfuModeAccessoryID:]";
      __int16 v19 = 2112;
      CFDictionaryRef v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_INFO, "%s: accessory = %@, requires power assertion", (uint8_t *)&v17, 0x16u);
    }
    [(UARPDFUUpdater *)self holdPowerAssertionForAccessory];
  }
  BOOL v15 = [v13 setDfuMode] == 0;
  [(UARPDFUUpdater *)self releasePowerAssertionForAccessory];

  return v15;
}

- (void)startUpdateForAccessories:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000180E0(log, v9, v10, v11, v12, v13, v14, v15);
  }
  id v16 = self->_log;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v32 = "Starting update";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v6;
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v28;
    *(void *)&long long v19 = 136315394;
    long long v26 = v19;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v17);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v24 = -[UARPDFUUpdater getDfuAccessoryForUarpAccessoryID:](self, "getDfuAccessoryForUarpAccessoryID:", v23, v26, (void)v27);
        if (v24)
        {
          [(UARPDFUUpdater *)self startUpdateForAccessory:v24 assetID:v7];
        }
        else
        {
          long long v25 = self->_log;
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v26;
            uint64_t v32 = "-[UARPDFUUpdater startUpdateForAccessories:assetID:]";
            __int16 v33 = 2112;
            uint64_t v34 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_ERROR, "%s: Unknown UARPAccessoryID %@, dropping it", buf, 0x16u);
          }
        }
      }
      id v20 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }
}

- (BOOL)applyStagedFirmwareForAccessories:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100018158(log, v6, v7, v8, v9, v10, v11, v12);
  }
  uint64_t v13 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v14 = v4;
  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v30;
    *(void *)&long long v16 = 136315394;
    long long v28 = v16;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v14);
        }
        id v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v21 = -[UARPDFUUpdater getDfuAccessoryForUarpAccessoryID:](self, "getDfuAccessoryForUarpAccessoryID:", v20, v28, (void)v29);
        long long v22 = v21;
        if (v21)
        {
          uint64_t v23 = [v21 uarpAccessory];
          [v13 addObject:v23];

          if ([v22 requiresPowerAssertion])
          {
            id v24 = self->_log;
            if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v28;
              uint64_t v34 = "-[UARPDFUUpdater applyStagedFirmwareForAccessories:]";
              __int16 v35 = 2112;
              v36 = v22;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_INFO, "%s: accessory = %@, requires power assertion", buf, 0x16u);
            }
            [(UARPDFUUpdater *)self holdPowerAssertionForAccessory];
          }
        }
        else
        {
          long long v25 = self->_log;
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            uint64_t v34 = "-[UARPDFUUpdater applyStagedFirmwareForAccessories:]";
            __int16 v35 = 2112;
            v36 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v25, OS_LOG_TYPE_ERROR, "%s: Unknown UARPAccessoryID %@", buf, 0x16u);
          }
        }
      }
      id v17 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v17);
  }

  unsigned __int8 v26 = [(UARPController *)self->_uarpController applyStagedFirmwareOnAccessoryList:v13 withUserIntent:1];
  return v26;
}

- (void)assetTransferComplete:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[UARPDFUUpdater assetTransferComplete:assetID:status:]";
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Asset Staging complete = %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessoryID:v8];
  if (v11)
  {
    [(UARPDFUUpdater *)self accessoryTransferComplete:v11 assetID:v9 status:a5];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000181D0();
  }
}

- (void)startUpdateForAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000182D0(log, v9, v10, v11, v12, v13, v14, v15);
  }
  long long v16 = [v6 identifier];
  id v17 = +[UARPSupportedAccessory findByAppleModelNumber:v16];

  if ([v17 updateRequiresPowerAssertion]) {
    [v6 setRequiresPowerAssertion:1];
  }
  if (self->_serviceInstance)
  {
    uint64_t v18 = [v6 uarpAccessory];
    long long v19 = [v18 getID];
    [(UARPDFUUpdater *)self queryProperties:&off_100024D38 accessoryID:v19];

    [v6 waitForQueriesCompletion:&off_100024D38];
  }
  id v20 = v7;
  id v21 = v20;
  if (!v20) {
    id v21 = [objc_alloc((Class)UARPAssetID) initWithLocationType:3 remoteURL:0];
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100018244();
  }
  uarpController = self->_uarpController;
  uint64_t v23 = [v6 uarpAccessory];
  [(UARPController *)uarpController changeAssetLocation:v23 assetID:v21];
}

- (id)getDfuAccessoryForUarpAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000061E4;
  long long v16 = sub_1000061F4;
  id v17 = 0;
  accessoriesQueue = self->_accessoriesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000061FC;
  block[3] = &unk_100024470;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessoriesQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getDfuAccessoryForUarpAccessoryID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000061E4;
  long long v16 = sub_1000061F4;
  id v17 = 0;
  accessoriesQueue = self->_accessoriesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000064F0;
  block[3] = &unk_100024470;
  block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessoriesQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getDfuAccessoryForSerialNumber:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1000061E4;
  long long v16 = sub_1000061F4;
  id v17 = 0;
  if (v4)
  {
    accessoriesQueue = self->_accessoriesQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006804;
    block[3] = &unk_100024470;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(accessoriesQueue, block);
    id v7 = (id)v13[5];
  }
  else
  {
    id v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)createAccessoryFromService:(unsigned int)a3 identifier:(id)a4
{
  id v6 = a4;
  CFMutableDictionaryRef properties = 0;
  IORegistryEntryCreateCFProperties(a3, &properties, kCFAllocatorDefault, 0);
  if (properties)
  {
    id v7 = CFDictionaryGetValue(properties, @"kUSBProductString");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = CFDictionaryGetValue(properties, @"kUSBSerialNumberString");
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = CFDictionaryGetValue(properties, @"bcdDevice");
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        CFRelease(properties);
        if (isKindOfClass)
        {
          v13[0] = (unsigned __int16)[v9 unsignedIntValue] >> 12;
          v13[1] = ([v9 unsignedIntValue] >> 8) & 0xF;
          v13[2] = [v9 unsignedIntValue] >> 4;
          LOBYTE(v14) = [v9 unsignedIntValue] & 0xF;
          int v14 = v14;
          uint64_t v11 = [[UARPUSBDFUAccessory alloc] initWithIdentifier:v6 serialNumber:v8 fwVersion:v13];
        }
        else
        {
          uint64_t v11 = 0;
        }
      }
      else
      {
        CFRelease(properties);
        uint64_t v11 = 0;
      }
    }
    else
    {
      CFRelease(properties);
      uint64_t v11 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000184A4();
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)connectUARPForUARPAccessory:(id)a3
{
  id v4 = a3;
  int v12 = 0;
  memset(v11, 0, sizeof(v11));
  [v4 connectUarpController:self options:v11];
  uarpController = self->_uarpController;
  id v6 = [v4 uarpAccessory];
  LOBYTE(uarpController) = [(UARPController *)uarpController addAccessory:v6 assetID:0];

  if ((uarpController & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000185A8();
    }
    goto LABEL_8;
  }
  id v7 = self->_uarpController;
  id v8 = [v4 uarpAccessory];
  LOBYTE(v7) = [(UARPController *)v7 accessoryReachable:v8];

  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100018534();
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

- (BOOL)disconnectUARPForUARPAccessory:(id)a3
{
  uarpController = self->_uarpController;
  id v5 = a3;
  id v6 = [v5 uarpAccessory];
  [(UARPController *)uarpController accessoryUnreachable:v6];

  id v7 = self->_uarpController;
  id v8 = [v5 uarpAccessory];
  [(UARPController *)v7 removeAccessory:v8];

  [v5 disconnectUarpController];
  return 1;
}

- (BOOL)addAccessory:(id)a3 enableNotification:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    accessoriesQueue = self->_accessoriesQueue;
    uint64_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    uint64_t v13 = sub_100006EAC;
    int v14 = &unk_100024498;
    uint64_t v15 = self;
    id v9 = v6;
    id v16 = v9;
    dispatch_sync(accessoriesQueue, &v11);
    if (v4) {
      objc_msgSend(v9, "enableDisconnectCallback:reference:", sub_100006F7C, self, v11, v12, v13, v14, v15);
    }
  }
  return v7 != 0;
}

- (BOOL)removeAccessory:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    accessoriesQueue = self->_accessoriesQueue;
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_100007234;
    uint64_t v12 = &unk_100024498;
    uint64_t v13 = self;
    id v7 = v4;
    id v14 = v7;
    dispatch_sync(accessoriesQueue, &v9);
    -[UARPDFUUpdater disconnectUARPForUARPAccessory:](self, "disconnectUARPForUARPAccessory:", v7, v9, v10, v11, v12, v13);
  }
  return v5 != 0;
}

- (void)queryFailedForAccessory:(id)a3 property:(unint64_t)a4 error:(int64_t)a5
{
  id v11 = a3;
  id v8 = +[NSError errorWithDomain:kUARPErrorDomain code:a5 userInfo:0];
  switch(a4)
  {
    case 0uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 manufacturer:0 error:v8];
      goto LABEL_12;
    case 1uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 modelName:0 error:v8];
      goto LABEL_12;
    case 2uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 serialNumber:0 error:v8];
      goto LABEL_12;
    case 3uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 hardwareVersion:0 error:v8];
      goto LABEL_12;
    case 4uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 firmwareVersion:0 error:v8];
      goto LABEL_12;
    case 5uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 stagedFirmwareVersion:0 error:v8];
      goto LABEL_12;
    case 6uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 stats:0 error:v8];
      goto LABEL_12;
    case 0xBuLL:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 appleModelNumber:0 error:v8];
      goto LABEL_12;
    case 0xCuLL:
      uint64_t v10 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v10 hwFusingType:0 error:v8];

      goto LABEL_11;
    case 0xDuLL:
LABEL_11:
      id v9 = [v11 uarpAccessory];
      [(UARPDFUUpdater *)self queryCompleteForAccessory:v9 friendlyName:0 error:v8];
LABEL_12:

      break;
    default:
      break;
  }
}

- (void)setUarpCaptureFileName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  uarpCaptureFileName = self->_uarpCaptureFileName;
  self->_uarpCaptureFileName = v4;

  if (self->_uarpCaptureFileName)
  {
    [(UARPController *)self->_uarpController stopPacketCapture];
    id v7 = self->_uarpCaptureFileName;
    uarpController = self->_uarpController;
    [(UARPController *)uarpController startPacketCapture:v7];
  }
}

- (NSString)uarpCaptureFileName
{
  return self->_uarpCaptureFileName;
}

- (void)assetDownloadFailed:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[UARPDFUUpdater assetDownloadFailed:assetID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: dfuotp = %@, assetID = %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007820;
    block[3] = &unk_100024448;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(delegateQueue, block);
  }
  [(UARPDFUUpdater *)self removeAccessory:v6];
}

- (void)assetNotFound:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[UARPDFUUpdater assetNotFound:assetID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: dfuotp = %@, assetID = %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007A0C;
    block[3] = &unk_100024448;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(delegateQueue, block);
  }
  [(UARPDFUUpdater *)self removeAccessory:v6];
}

- (void)assetOnLocalStorage:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[UARPDFUUpdater assetOnLocalStorage:assetID:]";
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Asset Found On Local Storage assetID = %@", buf, 0x16u);
  }
  if ([v6 requiresPowerAssertion])
  {
    id v9 = self->_log;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[UARPDFUUpdater assetOnLocalStorage:assetID:]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_INFO, "%s: accessory = %@, requires power assertion", buf, 0x16u);
    }
    [(UARPDFUUpdater *)self holdPowerAssertionForAccessory];
  }
  uint64_t v10 = [v6 uarpAccessory];
  id v12 = v10;
  id v11 = +[NSArray arrayWithObjects:&v12 count:1];

  [(UARPController *)self->_uarpController stageFirmwareUpdateOnAccessoryList:v11 withUserIntent:1];
}

- (void)accessoryTransferComplete:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v11 = log;
    id v12 = [v9 tag];
    *(_DWORD *)buf = 136315906;
    id v18 = "-[UARPDFUUpdater accessoryTransferComplete:assetID:status:]";
    __int16 v19 = 2112;
    id v20 = v12;
    __int16 v21 = 2080;
    uint64_t v22 = UARPFirmwareStagingCompletionStatusToString();
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s: accessory asset transfer <tag=%@> complete with status <%s> %@", buf, 0x2Au);
  }
  if (a5)
  {
    if ([(UARPDFUUpdater *)self removeAccessory:v8]) {
      [v8 disableDisconnectCallback];
    }
  }
  else
  {
    uarpController = self->_uarpController;
    id v14 = [v8 uarpAccessory];
    id v16 = v14;
    __int16 v15 = +[NSArray arrayWithObjects:&v16 count:1];
    [(UARPController *)uarpController applyStagedFirmwareOnAccessoryList:v15 withUserIntent:0];
  }
}

- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v9 = log;
    uint64_t v10 = [v6 availableFirmwareVersion];
    *(_DWORD *)id v16 = 136315906;
    *(void *)&v16[4] = "-[UARPDFUUpdater assetAvailablityUpdateForAccessoryID:assetID:]";
    *(_WORD *)&v16[12] = 2112;
    *(void *)&v16[14] = v6;
    *(_WORD *)&v16[22] = 2112;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: accessory = %@, available version = %@, assetID = %@", v16, 0x2Au);
  }
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v6];
  if (v11)
  {
    if ([v7 downloadStatus] == (id)2)
    {
      [(UARPDFUUpdater *)self assetDownloadFailed:v11 assetID:v7];
      goto LABEL_18;
    }
    if ([v7 updateAvailabilityStatus] == (id)6)
    {
      [(UARPDFUUpdater *)self assetNotFound:v11 assetID:v7];
      goto LABEL_18;
    }
    if ([v7 updateAvailabilityStatus] == (id)1)
    {
      id v12 = self->_log;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v16 = 136315394;
        *(void *)&v16[4] = "-[UARPDFUUpdater assetAvailablityUpdateForAccessoryID:assetID:]";
        *(_WORD *)&v16[12] = 2112;
        *(void *)&v16[14] = v7;
        uint64_t v13 = "%s: Asset found On Asset Server assetID = %@";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_INFO, v13, v16, 0x16u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    if ([v7 updateAvailabilityStatus] == (id)4)
    {
      id v12 = self->_log;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v16 = 136315394;
        *(void *)&v16[4] = "-[UARPDFUUpdater assetAvailablityUpdateForAccessoryID:assetID:]";
        *(_WORD *)&v16[12] = 2112;
        *(void *)&v16[14] = v7;
        uint64_t v13 = "%s: Asset found On Dropbox assetID = %@";
        goto LABEL_16;
      }
LABEL_17:
      uarpController = self->_uarpController;
      __int16 v15 = objc_msgSend(v11, "uarpAccessory", *(_OWORD *)v16, *(void *)&v16[16]);
      [(UARPController *)uarpController downloadAvailableFirmwareUpdate:v15 assetID:v7 withUserIntent:1];

      goto LABEL_18;
    }
    if ([v7 updateAvailabilityStatus] == (id)3) {
      [(UARPDFUUpdater *)self assetOnLocalStorage:v11 assetID:v7];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10001861C();
  }
LABEL_18:
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uarpMessageQueue = self->_uarpMessageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008114;
  block[3] = &unk_100024448;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(uarpMessageQueue, block);

  return 1;
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v10];
  log = self->_log;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      id v20 = "-[UARPDFUUpdater firmwareStagingProgress:assetID:bytesSent:bytesTotal:]";
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2048;
      double v26 = (float)((float)((float)a5 / (float)a6) * 100.0);
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "%s: accessory=%@, assetID=%@, progress=%f", buf, 0x2Au);
    }
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000834C;
      v15[3] = &unk_1000244C0;
      v15[4] = self;
      id v16 = v12;
      unint64_t v17 = a5;
      unint64_t v18 = a6;
      dispatch_async(delegateQueue, v15);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018690();
  }
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    unint64_t v17 = "-[UARPDFUUpdater firmwareStagingComplete:assetID:withStatus:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: accessory=%@, assetID=%@, status=%lu", buf, 0x2Au);
  }
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008578;
      block[3] = &unk_1000244E8;
      block[4] = self;
      id v14 = v11;
      unint64_t v15 = a5;
      dispatch_async(delegateQueue, block);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018704();
  }
}

- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_100008744;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024CA0, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018778();
  }
}

- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_100008910;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024CB8, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000187EC();
  }
}

- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_100008ADC;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024C70, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018860();
  }
}

- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_100008CA8;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024CD0, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000188D4();
  }
}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_100008E74;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024C88, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018948();
  }
}

- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_100009040;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024CE8, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000189BC();
  }
}

- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_10000920C;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024C40, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018A30();
  }
}

- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_1000093D8;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024C58, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018AA4();
  }
}

- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      unint64_t v15 = sub_1000095A4;
      id v16 = &unk_100024510;
      unint64_t v17 = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async(delegateQueue, &v13);
    }
    objc_msgSend(v11, "updateQueriesCompleted:", &off_100024D00, v13, v14, v15, v16, v17);
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018B18();
  }
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100018C00(log, v8, v9, v10, v11, v12, v13, v14);
  }
  unint64_t v15 = self->_log;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v22 = "-[UARPDFUUpdater stagedFirmwareApplicationComplete:withStatus:]";
    __int16 v23 = 2112;
    id v24 = v6;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_INFO, "%s: accessory=%@, status=%lu", buf, 0x20u);
  }
  id v16 = [(UARPDFUUpdater *)self getDfuAccessoryForUarpAccessory:v6];
  if (v16)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000097E4;
      block[3] = &unk_1000244E8;
      block[4] = self;
      id v19 = v16;
      unint64_t v20 = a4;
      dispatch_async(delegateQueue, block);
    }
    [(UARPDFUUpdater *)self removeAccessory:v16];
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100018B8C();
  }
}

- (GoldRestoreUARPStatusDelegate)goldRestoreDelegate
{
  return (GoldRestoreUARPStatusDelegate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setGoldRestoreDelegate:(id)a3
{
}

- (BOOL)serviceInstance
{
  return self->_serviceInstance;
}

- (void)setServiceInstance:(BOOL)a3
{
  self->_serviceInstance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goldRestoreDelegate, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_accessoriesQueue, 0);
  objc_storeStrong((id *)&self->_uarpMessageQueue, 0);
  objc_storeStrong((id *)&self->_dfuOtpAccessories, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
  objc_storeStrong((id *)&self->_uarpCaptureFileName, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end