@interface UARPUSBPDUpdater
+ (id)sharedInstance;
- (BOOL)applyStagedFirmwareForAccessories:(id)a3;
- (BOOL)needsApplyStagedFirmware:(id)a3;
- (BOOL)qAddAccessory:(id)a3;
- (BOOL)qConnectToCoreUARP:(id)a3;
- (BOOL)qCreateOrUpdatePowerAdapter:(id)a3 accessory:(id)a4 hardwareID:(id)a5;
- (BOOL)queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5;
- (BOOL)recvUarpMsgFromAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (BOOL)requestedPowerAdapterDiscovery;
- (BOOL)rescindStagedFirmwareForAccessories:(id)a3;
- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5;
- (GoldRestoreUARPStatusDelegate)goldRestoreDelegate;
- (NSString)uarpCaptureFileName;
- (UARPUSBPDUpdater)init;
- (id)gFindMagSafeAccessories:(id)a3;
- (id)gFindUSBCLightningAccessories:(id)a3;
- (id)getUARPAccessoryForUARPAccessoryID:(id)a3;
- (id)getUARPUSBPDAccessoryForUARPAccessory:(id)a3;
- (id)qCreateOrUpdateDongle:(unsigned int)a3 identifier:(id)a4;
- (id)qCreateOrUpdateMagSafeAccessory:(unsigned int)a3 identifier:(id)a4;
- (id)qCreateOrUpdatePowerAdapterAccessory:(id)a3 identifier:(id)a4;
- (id)qFindPowerAdapterAccessories:(id)a3;
- (id)qHpmForRID:(unsigned __int16)a3;
- (id)usbpdHardwareIdForPowerAdapter;
- (void)accessoryUnplugged:(id)a3;
- (void)assetAvailablityUpdateForAccessoryID:(id)a3 assetID:(id)a4;
- (void)assetDownloadFailed:(id)a3 assetID:(id)a4;
- (void)assetNotFound:(id)a3 assetID:(id)a4;
- (void)assetOnAssetServer:(id)a3 assetID:(id)a4;
- (void)assetOnDropbox:(id)a3 assetID:(id)a4;
- (void)assetOnLocalStorage:(id)a3 assetID:(id)a4;
- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)assetTransferComplete:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)bsdNotificationReceived:(id)a3;
- (void)disabledProductIdentifiers:(id)a3;
- (void)discoverHPMs;
- (void)dynamicAssetTransferComplete:(id)a3 assetID:(id)a4;
- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5;
- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6;
- (void)handleBsdNotificationPowerAdapter;
- (void)holdPowerAssertionForAccessory;
- (void)matchingService:(unsigned int)a3 identifier:(id)a4;
- (void)qAccessoryTransferComplete:(id)a3 assetID:(id)a4 status:(unint64_t)a5;
- (void)qAccessoryUnplugged:(id)a3;
- (void)qBsdNotificationReceivedPowerSource;
- (void)qCheckForUpdate:(id)a3 assetID:(id)a4;
- (void)qDisconnectDongle:(unsigned int)a3;
- (void)qDisconnectFromCoreUARP:(id)a3;
- (void)qEnumerateHPMsWithMagSafe;
- (void)qRemoveDisconnectedAccessories:(unsigned __int16)a3;
- (void)qShowUpdaterSets;
- (void)qSolicitDynamicAsset:(id)a3 assetID:(id)a4;
- (void)qSolicitDynamicAssetForUSBPDAccessory:(id)a3 assetID:(id)a4;
- (void)qSolicitDynamicAssetForUSBPDAccessory:(id)a3 assetTag:(id)a4;
- (void)qStartUpdateForUSBPDAccessory:(id)a3 assetID:(id)a4;
- (void)qUpdatePowerAdapter:(id)a3 identifier:(id)a4;
- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5;
- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5;
- (void)queryFailedForAccessory:(id)a3 property:(unint64_t)a4 error:(int64_t)a5;
- (void)releasePowerAssertionForAccessory;
- (void)setGoldRestoreDelegate:(id)a3;
- (void)setUarpCaptureFileName:(id)a3;
- (void)solicitDynamicAssetForAccessories:(id)a3 assetID:(id)a4;
- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4;
- (void)stopPacketCapture;
@end

@implementation UARPUSBPDUpdater

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004340;
  block[3] = &unk_100038580;
  block[4] = a1;
  if (qword_100041848 != -1) {
    dispatch_once(&qword_100041848, block);
  }
  v2 = (void *)qword_100041840;
  return v2;
}

- (UARPUSBPDUpdater)init
{
  v16.receiver = self;
  v16.super_class = (Class)UARPUSBPDUpdater;
  v2 = [(UARPUSBPDUpdater *)&v16 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    uarpUSBPDAccessories = v2->_uarpUSBPDAccessories;
    v2->_uarpUSBPDAccessories = v3;

    os_log_t v5 = os_log_create("com.apple.accessoryupdater.uarp", "usbpdUpdater");
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.accessoryupdater.usbpd.uarp.queue", 0);
    uarpQueue = v2->_uarpQueue;
    v2->_uarpQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.accessoryupdater.usbpd.hpm.queue", 0);
    hpmQueue = v2->_hpmQueue;
    v2->_hpmQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.accessoryupdater.usbpd.delegate.queue", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v11;

    v13 = (UARPController *)objc_alloc_init((Class)UARPController);
    uarpController = v2->_uarpController;
    v2->_uarpController = v13;

    [(UARPController *)v2->_uarpController setDelegate:v2];
    v2->_powerAdapterDelay = 8000000000;
    v2->_requestedPowerAdapterDiscovery = 0;
    [(UARPUSBPDUpdater *)v2 discoverHPMs];
  }
  return v2;
}

- (void)setUarpCaptureFileName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  uarpCaptureFileName = self->_uarpCaptureFileName;
  self->_uarpCaptureFileName = v4;

  if (self->_uarpCaptureFileName)
  {
    [(UARPController *)self->_uarpController stopPacketCapture];
    uarpController = self->_uarpController;
    dispatch_queue_t v7 = self->_uarpCaptureFileName;
    [(UARPController *)uarpController startPacketCapture:v7];
  }
}

- (NSString)uarpCaptureFileName
{
  return self->_uarpCaptureFileName;
}

- (void)stopPacketCapture
{
}

- (void)discoverHPMs
{
  hpmQueue = self->_hpmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000457C;
  block[3] = &unk_1000385A8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)hpmQueue, block);
}

- (void)qEnumerateHPMsWithMagSafe
{
  +[UARPMagSafeCable matchingDictionary:0];
  io_iterator_t existing = 0;
  CFDictionaryRef v3 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  if (IOServiceGetMatchingServices(kIOMasterPortDefault, v3, &existing)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = existing == 0;
  }
  if (!v4)
  {
    uint64_t v5 = IOIteratorNext(existing);
    if (v5)
    {
      uint64_t v6 = v5;
      do
      {
        dispatch_queue_t v7 = [(UARPUSBPDUpdater *)self qHpmForRID:(unsigned __int16)+[UARPMagSafeCable rid:v6]];
        v8 = v7;
        if (v7) {
          [v7 checkIfMagSafe:v6];
        }
        IOObjectRelease(v6);

        uint64_t v6 = IOIteratorNext(existing);
      }
      while (v6);
    }
    IOObjectRelease(existing);
  }
}

- (id)gFindMagSafeAccessories:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  +[UARPMagSafeCable matchingDictionary:0];
  io_iterator_t existing = 0;
  CFDictionaryRef v6 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
  if (IOServiceGetMatchingServices(kIOMasterPortDefault, v6, &existing)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = existing == 0;
  }
  if (!v7)
  {
    uint64_t v8 = IOIteratorNext(existing);
    if (v8)
    {
      uint64_t v9 = v8;
      do
      {
        v10 = [(UARPUSBPDUpdater *)self qCreateOrUpdateMagSafeAccessory:v9 identifier:v4];
        if (v10) {
          [v5 addObject:v10];
        }
        IOObjectRelease(v9);

        uint64_t v9 = IOIteratorNext(existing);
      }
      while (v9);
    }
    IOObjectRelease(existing);
  }

  return v5;
}

- (id)gFindUSBCLightningAccessories:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  CFDictionaryRef v6 = +[UARPSupportedAccessory findByAppleModelNumber:v4];
  BOOL v7 = [v6 hardwareID];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v9 = [v6 hardwareID];
    if ([v9 isUSBCLightning])
    {
      +[UARPMagSafeCable matchingDictionaryUSBCLightning:v9 launchStream:0];
      io_iterator_t existing = 0;
      CFDictionaryRef v10 = (const __CFDictionary *)(id)objc_claimAutoreleasedReturnValue();
      if (IOServiceGetMatchingServices(kIOMasterPortDefault, v10, &existing)) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = existing == 0;
      }
      if (!v11)
      {
        uint64_t v12 = IOIteratorNext(existing);
        if (v12)
        {
          uint64_t v13 = v12;
          do
          {
            v14 = [(UARPUSBPDUpdater *)self qCreateOrUpdateDongle:v13 identifier:v4];
            if (v14) {
              [v5 addObject:v14];
            }
            IOObjectRelease(v13);

            uint64_t v13 = IOIteratorNext(existing);
          }
          while (v13);
        }
        IOObjectRelease(existing);
      }
      id v15 = v5;
    }
    else
    {
      id v17 = v5;
    }
  }
  else
  {
    id v16 = v5;
  }

  return v5;
}

- (void)matchingService:(unsigned int)a3 identifier:(id)a4
{
  id v6 = a4;
  hpmQueue = self->_hpmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004AB4;
  block[3] = &unk_1000385D0;
  unsigned int v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)hpmQueue, block);
}

- (void)bsdNotificationReceived:(id)a3
{
  if ([a3 isEqualToString:kUARPStringBsdNotificationPowerAdapter])
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      id v6 = "-[UARPUSBPDUpdater bsdNotificationReceived:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Force check for power adapters because power adapter notification", (uint8_t *)&v5, 0xCu);
    }
    [(UARPUSBPDUpdater *)self handleBsdNotificationPowerAdapter];
  }
}

- (id)qFindPowerAdapterAccessories:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  CFDictionaryRef v6 = IOPSCopyExternalPowerAdapterDetails();
  CFDictionaryRef v7 = v6;
  if (v6)
  {
    CFDictionaryRef v25 = v6;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v8 = self->_hpms;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v13 setSopType:0];
          v14 = [(UARPUSBPDUpdater *)self qCreateOrUpdatePowerAdapterAccessory:v13 identifier:v4];
          if (v14)
          {
            log = self->_log;
            if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v31 = v4;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "No accessory found for %@", buf, 0xCu);
            }
            [v5 addObject:v14];
          }
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v10);
    }

    CFDictionaryRef v7 = v25;
  }
  else
  {
    id v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG)) {
      sub_100021D44(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }

  return v5;
}

- (void)qBsdNotificationReceivedPowerSource
{
  CFDictionaryRef v3 = IOPSCopyExternalPowerAdapterDetails();
  CFDictionaryRef v4 = v3;
  log = self->_log;
  if (v3)
  {
    CFDictionaryRef v22 = v3;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      long long v29 = "-[UARPUSBPDUpdater qBsdNotificationReceivedPowerSource]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Look for power adapters on all HPMs that don't have MagSafe", buf, 0xCu);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    CFDictionaryRef v6 = self->_hpms;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unsigned int v12 = [v11 hasMagSafe];
          uint64_t v13 = self->_log;
          BOOL v14 = os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO);
          if (v12)
          {
            if (v14)
            {
              *(_DWORD *)buf = 138412290;
              long long v29 = (const char *)v11;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_INFO, "Skip check (MagSafe) for power adapter on HPM %@", buf, 0xCu);
            }
          }
          else
          {
            if (v14)
            {
              *(_DWORD *)buf = 138412290;
              long long v29 = (const char *)v11;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_INFO, "Check for power adapter on HPM %@", buf, 0xCu);
            }
            [v11 setSopType:0];
            [(UARPUSBPDUpdater *)self qUpdatePowerAdapter:v11 identifier:0];
          }
        }
        id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    CFDictionaryRef v4 = v22;
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
  {
    sub_100021DBC(log, v15, v16, v17, v18, v19, v20, v21);
  }
}

- (BOOL)requestedPowerAdapterDiscovery
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  hpmQueue = self->_hpmQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005250;
  v5[3] = &unk_1000385F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)hpmQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)handleBsdNotificationPowerAdapter
{
  if ([(UARPUSBPDUpdater *)self requestedPowerAdapterDiscovery])
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[UARPUSBPDUpdater handleBsdNotificationPowerAdapter]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Power adapter poll already requested", buf, 0xCu);
    }
  }
  else
  {
    hpmQueue = self->_hpmQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000053C0;
    block[3] = &unk_1000385A8;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)hpmQueue, block);
    dispatch_time_t v5 = dispatch_time(0, self->_powerAdapterDelay);
    uint64_t v6 = self->_hpmQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000548C;
    v7[3] = &unk_1000385A8;
    v7[4] = self;
    dispatch_after(v5, (dispatch_queue_t)v6, v7);
  }
}

- (id)qCreateOrUpdateMagSafeAccessory:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43[0] = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "qCreateOrUpdateMagSafeAccessory for identifier %@", buf, 0xCu);
  }
  uint64_t v8 = +[UARPSupportedAccessory findByAppleModelNumber:v6];
  char v9 = [v8 hardwareID];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v43[0] = v9;
      CFDictionaryRef v22 = "qCreateOrUpdateMagSafeAccessory hwid is not usbpd %@";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
    }
LABEL_22:
    long long v23 = 0;
    goto LABEL_34;
  }
  unsigned __int8 v10 = [v9 isMagSafeCable];
  uint64_t v11 = self->_log;
  BOOL v12 = os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO);
  if ((v10 & 1) == 0)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      v43[0] = v9;
      CFDictionaryRef v22 = "qCreateOrUpdateMagSafeAccessory hwid is not usb-c lightning %@";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "MagSafe notification", buf, 2u);
  }
  unsigned __int16 v13 = (unsigned __int16)+[UARPMagSafeCable rid:v4];
  BOOL v14 = self->_log;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v43[0]) = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_INFO, "MagSafe notification on %d", buf, 8u);
  }
  uint64_t v15 = [(UARPUSBPDUpdater *)self qHpmForRID:v13];
  if (!v15) {
    goto LABEL_32;
  }
  uint64_t v16 = self->_log;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43[0] = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_INFO, "MagSafe notification on %@", buf, 0xCu);
  }
  uint64_t v17 = [v15 sopPrimeDelegate];

  if (!v17)
  {
    uint64_t v20 = [[UARPMagSafeCable alloc] initWithHPM:v15 service:v4 location:1];
    [v15 setSopPrimeDelegate:v20];
    if (!v20) {
      goto LABEL_15;
    }
LABEL_24:
    unsigned __int16 v41 = v13;
    long long v24 = [v15 sopPrimeDelegate];
    unsigned __int8 v25 = [v24 isActive];

    if ((v25 & 1) == 0)
    {
      v30 = self->_log;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43[0] = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_INFO, "MagSafe (not active); remove accessories %@",
          buf,
          0xCu);
      }
      [(UARPUSBPDUpdater *)self qRemoveDisconnectedAccessories:v41];

      goto LABEL_32;
    }
    [v15 setSopType:1];
    id v26 = objc_msgSend(objc_alloc((Class)UARPAccessoryHardwareUSBPD), "initWithVendorID:productID:usbpdClass:locationType:", (unsigned __int16)-[UARPMagSafeCable vendorID](v20, "vendorID"), (unsigned __int16)-[UARPMagSafeCable productID](v20, "productID"), 0, 1);
    long long v27 = +[UARPSupportedAccessory findByHardwareID:v26];
    if (v27)
    {
      if (![(UARPMagSafeCable *)v20 requiresAuthentication]
        || [(UARPMagSafeCable *)v20 isAuthenticated])
      {
        long long v28 = [UARPUSBPDAccessory alloc];
        long long v29 = [v27 identifier];
        long long v23 = [(UARPUSBPDAccessory *)v28 initWithHardwareID:v26 identifier:v29 vuarpDelegate:v20 hpmDelegate:v20];

LABEL_43:
        goto LABEL_33;
      }
      v39 = self->_log;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v33 = v39;
        v40 = +[UARPMagSafeCable authenticationStatusToString:](UARPMagSafeCable, "authenticationStatusToString:", +[UARPMagSafeCable authenticationStatus:v4]);
        *(_DWORD *)buf = 136315138;
        v43[0] = v40;
        v36 = "MagSafe (needs auth) auth state is %s";
        v37 = v33;
        uint32_t v38 = 12;
        goto LABEL_41;
      }
    }
    else
    {
      v32 = self->_log;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = v32;
        int v34 = (unsigned __int16)[(UARPMagSafeCable *)v20 vendorID];
        unsigned __int16 v35 = (unsigned __int16)[(UARPMagSafeCable *)v20 productID];
        *(_DWORD *)buf = 67109376;
        LODWORD(v43[0]) = v34;
        WORD2(v43[0]) = 1024;
        *(_DWORD *)((char *)v43 + 6) = v35;
        v36 = "MagSafe (not active); unsupported VID=0x%04x PID=0x%04x";
        v37 = v33;
        uint32_t v38 = 14;
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, v36, buf, v38);
      }
    }
    long long v23 = 0;
    goto LABEL_43;
  }
  uint64_t v18 = [v15 sopPrimeDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v20 = [v15 sopPrimeDelegate];
    [(UARPMagSafeCable *)v20 updateWithService:v4];
    if (v20) {
      goto LABEL_24;
    }
  }
LABEL_15:
  uint64_t v21 = self->_log;
  if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_INFO, "MagSafe notification but no MagSafe on this RID?", buf, 2u);
  }
LABEL_32:
  long long v23 = 0;
LABEL_33:

LABEL_34:
  return v23;
}

- (id)usbpdHardwareIdForPowerAdapter
{
  CFDictionaryRef v3 = IOPSCopyExternalPowerAdapterDetails();
  log = self->_log;
  BOOL v5 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      sub_100021FA8();
    }
    unsigned __int16 v13 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"Manufacturer"];
    BOOL v14 = v13;
    if (v13)
    {
      if ([v13 isEqualToString:kUARPSupportedAccessoryKeyVendorNameApple])
      {
        uint64_t v15 = [(__CFDictionary *)v3 objectForKeyedSubscript:@"Model"];
        uint64_t v16 = self->_log;
        BOOL v17 = os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v17)
          {
            int v28 = 136315650;
            long long v29 = "-[UARPUSBPDUpdater usbpdHardwareIdForPowerAdapter]";
            __int16 v30 = 2112;
            id v31 = v14;
            __int16 v32 = 2112;
            v33 = v15;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_INFO, "%s: Found Power Adapter %@ %@", (uint8_t *)&v28, 0x20u);
          }
          id v18 = objc_msgSend(objc_alloc((Class)UARPAccessoryHardwareUSBPD), "initWithVendorID:productID:usbpdClass:locationType:", 1452, (unsigned __int16)strtoul((const char *)objc_msgSend(v15, "UTF8String"), 0, 16), 1, 0);
        }
        else
        {
          if (v17)
          {
            int v28 = 136315138;
            long long v29 = "-[UARPUSBPDUpdater usbpdHardwareIdForPowerAdapter]";
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_INFO, "%s: No Model String", (uint8_t *)&v28, 0xCu);
          }
          id v18 = 0;
        }

        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_100021F24();
      }
    }
    else
    {
      uint64_t v19 = self->_log;
      if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR)) {
        sub_100021EAC(v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    id v18 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (v5) {
    sub_100021E34(log, v6, v7, v8, v9, v10, v11, v12);
  }
  id v18 = 0;
LABEL_23:

  return v18;
}

- (id)qCreateOrUpdatePowerAdapterAccessory:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412290;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Check Power Adapter on %@", (uint8_t *)&v26, 0xCu);
  }
  uint64_t v9 = [(UARPUSBPDUpdater *)self usbpdHardwareIdForPowerAdapter];
  if (v9)
  {
    uint64_t v10 = +[UARPSupportedAccessory findByHardwareID:v9];
    uint64_t v11 = v10;
    if (v10)
    {
      if (!v7
        || ([v10 identifier],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            unsigned int v13 = [v7 isEqualToString:v12],
            v12,
            v13))
      {
        BOOL v14 = [v11 hardwareID];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([(UARPUSBPDUpdater *)self qCreateOrUpdatePowerAdapter:v6 accessory:v11 hardwareID:v14])
          {
            uint64_t v15 = [UARPUSBPDAccessory alloc];
            uint64_t v16 = [v11 identifier];
            BOOL v17 = [v6 sopDelegate];
            id v18 = [v6 sopDelegate];
            uint64_t v19 = [(UARPUSBPDAccessory *)v15 initWithHardwareID:v14 identifier:v16 vuarpDelegate:v17 hpmDelegate:v18];

LABEL_19:
            goto LABEL_20;
          }
          uint64_t v24 = self->_log;
          if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_INFO))
          {
            int v26 = 138412290;
            id v27 = v6;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v24, OS_LOG_TYPE_INFO, "No supported Power Adapter found on %@", (uint8_t *)&v26, 0xCu);
          }
        }
        uint64_t v19 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412290;
        id v27 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_INFO, "No supported power adapter (by supported accessory) on this HPM %@", (uint8_t *)&v26, 0xCu);
      }
    }
    uint64_t v19 = 0;
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v20 = self->_log;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = v20;
    unsigned int v22 = [v6 rid];
    int v26 = 67109120;
    LODWORD(v27) = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Not supported power adapter (by hardware id) on this HPM %u", (uint8_t *)&v26, 8u);
  }
  uint64_t v19 = 0;
LABEL_21:

  return v19;
}

- (void)qUpdatePowerAdapter:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = [(UARPUSBPDUpdater *)self qCreateOrUpdatePowerAdapterAccessory:v6 identifier:a4];
  log = self->_log;
  BOOL v9 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Found a supported power adapter, check for update %@", (uint8_t *)&v10, 0xCu);
    }
    [(UARPUSBPDUpdater *)self qAddAccessory:v7];
    [(UARPUSBPDUpdater *)self qCheckForUpdate:v7 assetID:0];
  }
  else
  {
    if (v9)
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Power Adapter not supported; ignoring notification on %@",
        (uint8_t *)&v10,
        0xCu);
    }
    -[UARPUSBPDUpdater qRemoveDisconnectedAccessories:](self, "qRemoveDisconnectedAccessories:", [v6 rid]);
  }
}

- (BOOL)qCreateOrUpdatePowerAdapter:(id)a3 accessory:(id)a4 hardwareID:(id)a5
{
  uint64_t v8 = (UARPPowerAdapter *)a3;
  id v9 = a4;
  id v10 = a5;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412290;
    int v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Check Power Adapter on %@", (uint8_t *)&v25, 0xCu);
  }
  if (![(UARPPowerAdapter *)v8 hasChargePassthru])
  {
    [(UARPPowerAdapter *)v8 checkConnection:0];
    if (([(UARPPowerAdapter *)v8 connected] & 1) == 0)
    {
      id v18 = self->_log;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        int v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_INFO, "Power Adapter (not connected); remove accessories %@",
          (uint8_t *)&v25,
          0xCu);
      }
      [(UARPUSBPDUpdater *)self qRemoveDisconnectedAccessories:[(UARPPowerAdapter *)v8 rid]];
      goto LABEL_16;
    }
    unsigned int v13 = [(UARPPowerAdapter *)v8 sopDelegate];

    if (v13)
    {
      BOOL v14 = [(UARPPowerAdapter *)v8 sopDelegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_10;
      }
      uint64_t v16 = [(UARPPowerAdapter *)v8 sopDelegate];
      if (!v16) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v16 = -[UARPPowerAdapter initWithHPM:supportsAccMode7:]([UARPPowerAdapter alloc], "initWithHPM:supportsAccMode7:", v8, [v9 supportsAccMode7]);
      [(UARPPowerAdapter *)v8 setSopDelegate:v16];
      if (!v16)
      {
LABEL_10:
        BOOL v17 = self->_log;
        if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412290;
          int v26 = v8;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_INFO, "No supported power adapter on this HPM %@", (uint8_t *)&v25, 0xCu);
        }
        uint64_t v16 = 0;
        goto LABEL_27;
      }
    }
    if ([(UARPPowerAdapter *)v8 probeVDOs:0])
    {
      [(UARPPowerAdapter *)v16 updateWithHPM:v8];
      uint64_t v20 = self->_log;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412290;
        int v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_INFO, "Updated power adapter info %@", (uint8_t *)&v25, 0xCu);
      }
      unsigned __int16 v21 = (unsigned __int16)[(UARPPowerAdapter *)v16 vendorID];
      if ([v10 vendorID] == v21)
      {
        unsigned __int16 v22 = (unsigned __int16)[(UARPPowerAdapter *)v16 productID];
        if ([v10 productID] == v22)
        {
          BOOL v19 = 1;
LABEL_28:

          goto LABEL_29;
        }
      }
      uint64_t v23 = self->_log;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412546;
        int v26 = v16;
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_INFO, "Mismatched power adapter <%@>, expected <%@>", (uint8_t *)&v25, 0x16u);
      }
      [(UARPPowerAdapter *)v8 setSopDelegate:0];
    }
LABEL_27:
    BOOL v19 = 0;
    goto LABEL_28;
  }
  uint64_t v12 = self->_log;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412290;
    int v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_INFO, "Power Adapter behind a passthru dongle, skipping %@", (uint8_t *)&v25, 0xCu);
  }
LABEL_16:
  BOOL v19 = 0;
LABEL_29:

  return v19;
}

- (id)qCreateOrUpdateDongle:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41[0] = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "qCreateOrUpdateDongle for identifier %@", buf, 0xCu);
  }
  uint64_t v8 = +[UARPSupportedAccessory findByAppleModelNumber:v6];
  id v9 = [v8 hardwareID];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v19 = self->_log;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41[0] = v9;
      uint64_t v20 = "qCreateOrUpdateDongle hwid is not usbpd %@";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_INFO, v20, buf, 0xCu);
    }
LABEL_20:
    unsigned __int16 v21 = 0;
    goto LABEL_32;
  }
  if (([v9 isUSBCLightning] & 1) == 0)
  {
    BOOL v19 = self->_log;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41[0] = v9;
      uint64_t v20 = "qCreateOrUpdateDongle hwid is not usb-c lightning %@";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  unsigned __int16 v10 = (unsigned __int16)+[UARPMagSafeCable rid:v4];
  id v11 = self->_log;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41[0]) = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "Dongle notification on %d", buf, 8u);
  }
  uint64_t v12 = [(UARPUSBPDUpdater *)self qHpmForRID:v10];
  if (!v12) {
    goto LABEL_30;
  }
  unsigned int v13 = self->_log;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v41[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_INFO, "Dongle notification on %@", buf, 0xCu);
  }
  BOOL v14 = [v12 sopDelegate];

  if (!v14)
  {
    BOOL v17 = [[UARPMagSafeCable alloc] initWithHPM:v12 service:v4 location:0];
    [v12 setSopDelegate:v17];
    if (!v17) {
      goto LABEL_13;
    }
LABEL_22:
    unsigned __int16 v39 = v10;
    unsigned __int16 v22 = [v12 sopDelegate];
    unsigned __int8 v23 = [v22 isActive];

    if ((v23 & 1) == 0)
    {
      id v28 = self->_log;
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v41[0] = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_INFO, "Dongle (not active); remove accessories %@",
          buf,
          0xCu);
      }
      [(UARPUSBPDUpdater *)self qRemoveDisconnectedAccessories:v39];

      goto LABEL_30;
    }
    [v12 setSopType:0];
    id v24 = objc_msgSend(objc_alloc((Class)UARPAccessoryHardwareUSBPD), "initWithVendorID:productID:usbpdClass:locationType:", (unsigned __int16)-[UARPMagSafeCable vendorID](v17, "vendorID"), (unsigned __int16)-[UARPMagSafeCable productID](v17, "productID"), 2, 0);
    int v25 = +[UARPSupportedAccessory findByHardwareID:v24];
    if (v25)
    {
      if (![(UARPMagSafeCable *)v17 requiresAuthentication]
        || [(UARPMagSafeCable *)v17 isAuthenticated])
      {
        int v26 = [UARPUSBPDAccessory alloc];
        __int16 v27 = [v25 identifier];
        unsigned __int16 v21 = [(UARPUSBPDAccessory *)v26 initWithHardwareID:v24 identifier:v27 vuarpDelegate:v17 hpmDelegate:v17];

LABEL_41:
        goto LABEL_31;
      }
      v37 = self->_log;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        id v31 = v37;
        uint32_t v38 = +[UARPMagSafeCable authenticationStatusToString:](UARPMagSafeCable, "authenticationStatusToString:", +[UARPMagSafeCable authenticationStatus:v4]);
        *(_DWORD *)buf = 136315138;
        v41[0] = v38;
        int v34 = "Dongle (needs auth) auth state is %s";
        unsigned __int16 v35 = v31;
        uint32_t v36 = 12;
        goto LABEL_39;
      }
    }
    else
    {
      __int16 v30 = self->_log;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = v30;
        int v32 = (unsigned __int16)[(UARPMagSafeCable *)v17 vendorID];
        unsigned __int16 v33 = (unsigned __int16)[(UARPMagSafeCable *)v17 productID];
        *(_DWORD *)buf = 67109376;
        LODWORD(v41[0]) = v32;
        WORD2(v41[0]) = 1024;
        *(_DWORD *)((char *)v41 + 6) = v33;
        int v34 = "Dongle (not active); unsupported VID=0x%04x PID=0x%04x";
        unsigned __int16 v35 = v31;
        uint32_t v36 = 14;
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, v34, buf, v36);
      }
    }
    unsigned __int16 v21 = 0;
    goto LABEL_41;
  }
  uint64_t v15 = [v12 sopDelegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v17 = [v12 sopDelegate];
    [(UARPMagSafeCable *)v17 updateWithService:v4];
    if (v17) {
      goto LABEL_22;
    }
  }
LABEL_13:
  id v18 = self->_log;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_INFO, "Dongle notification but no Dongle on this RID?", buf, 2u);
  }
LABEL_30:
  unsigned __int16 v21 = 0;
LABEL_31:

LABEL_32:
  return v21;
}

- (void)qDisconnectDongle:(unsigned int)a3
{
  unsigned __int16 v4 = (unsigned __int16)+[UARPMagSafeCable rid:*(void *)&a3];
  BOOL v5 = [(UARPUSBPDUpdater *)self qHpmForRID:v4];
  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Disconnect dongle notification on %@", (uint8_t *)&v7, 0xCu);
    }
    [(UARPUSBPDUpdater *)self qRemoveDisconnectedAccessories:v4];
  }
}

- (void)qCheckForUpdate:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_10002201C(log, v9, v10, v11, v12, v13, v14, v15);
  }
  if ([(UARPUSBPDUpdater *)self qConnectToCoreUARP:v6])
  {
    [(UARPUSBPDUpdater *)self qStartUpdateForUSBPDAccessory:v6 assetID:v7];
  }
  else
  {
    uint64_t v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      id v18 = "-[UARPUSBPDUpdater qCheckForUpdate:assetID:]";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_INFO, "%s: Not [safe to be] connected %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)qSolicitDynamicAsset:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100022094(log, v9, v10, v11, v12, v13, v14, v15);
  }
  if ([(UARPUSBPDUpdater *)self qConnectToCoreUARP:v6])
  {
    [(UARPUSBPDUpdater *)self qSolicitDynamicAssetForUSBPDAccessory:v6 assetID:v7];
  }
  else
  {
    uint64_t v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      id v18 = "-[UARPUSBPDUpdater qSolicitDynamicAsset:assetID:]";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_INFO, "%s: Not [safe to be] connected %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (BOOL)qAddAccessory:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    disabledIdentifiers = self->_disabledIdentifiers;
    *(_DWORD *)buf = 136315394;
    v52 = "-[UARPUSBPDUpdater qAddAccessory:]";
    __int16 v53 = 2112;
    *(void *)v54 = disabledIdentifiers;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Disabled accessories %@", buf, 0x16u);
  }
  id v7 = self->_disabledIdentifiers;
  uint64_t v8 = [v4 identifier];
  uint64_t v9 = [(NSDictionary *)v7 objectForKeyedSubscript:v8];
  unsigned int v10 = [v9 BOOLValue];

  uint64_t v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = v11;
    uint64_t v13 = [v4 identifier];
    uint64_t v14 = (void *)v13;
    uint64_t v15 = "NO";
    v52 = "-[UARPUSBPDUpdater qAddAccessory:]";
    *(_DWORD *)buf = 136315650;
    if (v10) {
      uint64_t v15 = "YES";
    }
    __int16 v53 = 2112;
    *(void *)v54 = v13;
    *(_WORD *)&v54[8] = 2080;
    *(void *)&v54[10] = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s: Disabled state for %@ is %s", buf, 0x20u);
  }
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_10002210C();
    }
LABEL_29:
    BOOL v38 = 0;
  }
  else
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v16 = self->_uarpUSBPDAccessories;
    id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v47;
      id v20 = "-[UARPUSBPDUpdater qAddAccessory:]";
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v47 != v19) {
            objc_enumerationMutation(v16);
          }
          unsigned __int16 v22 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          unsigned __int8 v23 = self->_log;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v52 = v20;
            __int16 v53 = 2112;
            *(void *)v54 = v22;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_INFO, "%s: Checking against entry in set %@", buf, 0x16u);
          }
          unsigned int v24 = [v22 vendorID];
          if (v24 == [v4 vendorID])
          {
            unsigned int v25 = [v22 productID];
            if (v25 == [v4 productID])
            {
              int v26 = [v22 hpmDelegate];
              id v45 = [v26 routerID];
              __int16 v27 = [v4 hpmDelegate];
              id v28 = v18;
              uint64_t v29 = v19;
              id v30 = v4;
              id v31 = self;
              int v32 = v16;
              unsigned __int16 v33 = v20;
              id v34 = [v27 routerID];

              BOOL v35 = v45 == v34;
              id v20 = v33;
              uint64_t v16 = v32;
              self = v31;
              id v4 = v30;
              uint64_t v19 = v29;
              id v18 = v28;
              if (v35)
              {
                v43 = self->_log;
                if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v52 = v20;
                  __int16 v53 = 2112;
                  *(void *)v54 = v4;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_INFO, "%s: Duplicate accessory, not adding to list %@", buf, 0x16u);
                }

                goto LABEL_29;
              }
            }
          }
        }
        id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    uint32_t v36 = self->_log;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[UARPUSBPDUpdater qAddAccessory:]";
      __int16 v53 = 2112;
      *(void *)v54 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_INFO, "%s: Adding USB-PD Accessory %@", buf, 0x16u);
    }
    [(NSMutableArray *)self->_uarpUSBPDAccessories addObject:v4];
    v37 = self->_log;
    BOOL v38 = 1;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      uarpUSBPDAccessories = self->_uarpUSBPDAccessories;
      v40 = v37;
      unsigned int v41 = [(NSMutableArray *)uarpUSBPDAccessories count];
      v42 = self->_uarpUSBPDAccessories;
      *(_DWORD *)buf = 136315650;
      v52 = "-[UARPUSBPDUpdater qAddAccessory:]";
      __int16 v53 = 1024;
      *(_DWORD *)v54 = v41;
      *(_WORD *)&v54[4] = 2112;
      *(void *)&v54[6] = v42;
      BOOL v38 = 1;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s: USB-PD Accessory Set (%d) is %@", buf, 0x1Cu);
    }
  }

  return v38;
}

- (BOOL)qConnectToCoreUARP:(id)a3
{
  id v4 = (char *)a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Connect to CoreUARP %@", buf, 0xCu);
  }
  id v6 = self->_log;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v56 = "-[UARPUSBPDUpdater qConnectToCoreUARP:]";
    __int16 v57 = 2112;
    v58 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_INFO, "%s: Connect to CoreUARP %@", buf, 0x16u);
  }
  id v7 = [v4 identifier];
  uint64_t v8 = +[UARPSupportedAccessory findByAppleModelNumber:v7];

  uint64_t v9 = [v4 uarpAccessoryID];

  if (!v9)
  {
    unsigned int v10 = +[NSString stringWithFormat:@"%s", UARPAccessoryHardwareFusingToString()];
    id v11 = objc_alloc((Class)UARPAccessoryID);
    uint64_t v12 = [v8 identifier];
    id v13 = [v11 initWithModelNumber:v12];
    [v4 setUarpAccessoryID:v13];

    uint64_t v14 = [v4 vuarpDelegate];
    uint64_t v15 = [v14 serialNumber];
    uint64_t v16 = [v4 uarpAccessoryID];
    [v16 setSerialNumber:v15];

    id v17 = [v4 vuarpDelegate];
    id v18 = [v17 activeFwVersion];
    uint64_t v19 = [v18 versionString];
    id v20 = [v4 uarpAccessoryID];
    [v20 setFirmwareVersion:v19];

    unsigned __int16 v21 = [v4 uarpAccessoryID];
    [v21 setHwFusingType:v10];

    id v22 = [v8 capabilities];
    unsigned __int8 v23 = [v4 uarpAccessoryID];
    [v23 setCapability:v22];

    unsigned int v24 = [v4 vuarpDelegate];
    id v25 = [v24 uarpMaxPayloadSize];
    int v26 = [v4 vuarpDelegate];
    objc_msgSend(v4, "connectToVUARP:payloadWindowLength:delegate:", v25, objc_msgSend(v26, "uarpPayloadWindowSize"), self);
  }
  __int16 v27 = [v4 uarpAccessory];

  if (!v27)
  {
    id v28 = [objc_alloc((Class)UARPUpdaterServicePreferences) initWithDomain:@"com.apple.uarpupdaterserviceusbpd"];
    uint64_t v29 = [v4 identifier];
    id v30 = [v4 uarpAccessoryID];
    id v31 = [v30 serialNumber];
    int v32 = [v28 uuidForAccessory:v29 serialNumber:v31 error:0];

    id v33 = objc_alloc((Class)UARPAccessory);
    id v34 = [v8 hardwareID];
    id v35 = [v33 initWithHardwareID:v34 uuid:v32];
    [v4 setUarpAccessory:v35];

    uint32_t v36 = [v4 uarpAccessory];
    [v36 setDownloadOnCellularAllowed:0];

    v37 = [v4 uarpAccessory];
    [v37 setAutoDownloadAllowed:0];

    BOOL v38 = [v4 uarpAccessoryID];
    id v39 = [v38 capability];
    v40 = [v4 uarpAccessory];
    [v40 setCapability:v39];

    unsigned int v41 = [v4 uarpAccessoryID];
    v42 = [v41 serialNumber];
    v43 = [v4 uarpAccessory];
    [v43 setSerialNumber:v42];

    v44 = [v4 uarpAccessoryID];
    id v45 = [v44 firmwareVersion];
    long long v46 = [v4 uarpAccessory];
    [v46 setFirmwareVersion:v45];

    long long v47 = [v4 uarpAccessoryID];
    long long v48 = [v47 hwFusingType];
    long long v49 = [v4 uarpAccessory];
    [v49 setHwFusingType:v48];

    uarpController = self->_uarpController;
    v51 = [v4 uarpAccessory];
    [(UARPController *)uarpController addAccessory:v51 assetID:0];

    v52 = self->_uarpController;
    __int16 v53 = [v4 uarpAccessory];
    [(UARPController *)v52 accessoryReachable:v53];
  }
  return 1;
}

- (void)qStartUpdateForUSBPDAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setNeedsTransferFirmware:1];
  uint64_t v8 = [v6 identifier];
  uint64_t v9 = +[UARPSupportedAccessory findByAppleModelNumber:v8];

  if ([v9 supportsLogs]) {
    [v6 setNeedsTransferLogs:1];
  }
  if ([v9 supportsAnalytics]) {
    [v6 setNeedsTransferAnalytics:1];
  }
  if ([v9 autoAppliesStagedFirmware]) {
    [v6 setAutoAppliesStagedFirmware:1];
  }
  if ([v9 updateRequiresPowerAssertion]) {
    [v6 setRequiresPowerAssertion:1];
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[UARPUSBPDUpdater qStartUpdateForUSBPDAccessory:assetID:]";
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: usbpd = %@", (uint8_t *)&v16, 0x16u);
  }
  id v11 = self->_log;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[UARPUSBPDUpdater qStartUpdateForUSBPDAccessory:assetID:]";
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "%s: assetID = %@", (uint8_t *)&v16, 0x16u);
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100022268();
  }
  if ([(NSMutableArray *)self->_uarpUSBPDAccessories containsObject:v6])
  {
    id v12 = v7;
    if (!v12) {
      id v12 = [objc_alloc((Class)UARPAssetID) initWithLocationType:3 remoteURL:0];
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000221F4();
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_100022180();
    }
    uarpController = self->_uarpController;
    uint64_t v14 = [v6 uarpAccessory];
    [(UARPController *)uarpController changeAssetLocation:v14 assetID:v12];
  }
  else
  {
    uint64_t v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315394;
      id v17 = "-[UARPUSBPDUpdater qStartUpdateForUSBPDAccessory:assetID:]";
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_INFO, "%s: Accessory not in updater set %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)qSolicitDynamicAssetForUSBPDAccessory:(id)a3 assetTag:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uarpDynamicAssetURL();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [objc_alloc((Class)UARPAssetID) initWithLocationType:10 assetTag:v6 url:v9];

  [(UARPUSBPDUpdater *)self qSolicitDynamicAssetForUSBPDAccessory:v7 assetID:v8];
}

- (void)qSolicitDynamicAssetForUSBPDAccessory:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Solicit Dynamic Asset usbpd <%@> assetID <%@>", (uint8_t *)&v12, 0x16u);
  }
  if ([(NSMutableArray *)self->_uarpUSBPDAccessories containsObject:v6])
  {
    uarpController = self->_uarpController;
    unsigned int v10 = [v6 uarpAccessory];
    [(UARPController *)uarpController solicitDynamicAsset:v10 assetID:v7];
  }
  else
  {
    id v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "Cannot solicit dynamic asset, accessory not in set %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)qDisconnectFromCoreUARP:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Disconnect from CoreUARP; %@",
      (uint8_t *)&v8,
      0xCu);
  }
  uarpController = self->_uarpController;
  id v7 = [v4 uarpAccessory];
  [(UARPController *)uarpController removeAccessory:v7];

  [v4 disconnectFromVUARP];
}

- (void)qAccessoryTransferComplete:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    id v11 = log;
    int v12 = [v9 tag];
    *(_DWORD *)buf = 138412802;
    v63 = v12;
    __int16 v64 = 2080;
    uint64_t v65 = UARPFirmwareStagingCompletionStatusToString();
    __int16 v66 = 2112;
    id v67 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "accessory asset transfer <tag=%@> complete with status <%s> %@", buf, 0x20u);
  }
  if (!v9)
  {
    [v8 setNeedsTransferFirmware:0];
    id v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "-[UARPUSBPDUpdater qAccessoryTransferComplete:assetID:status:]";
      __int16 v64 = 2112;
      uint64_t v65 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_INFO, "%s: accessory no longer needs firmware <%@>", buf, 0x16u);
    }
  }
  __int16 v14 = (char *)uarpAssetTagStructLogs();
  id v15 = [objc_alloc((Class)UARPAssetTag) initWithChar1:*v14 char2:v14[1] char3:v14[2] char4:v14[3]];
  int v16 = [v9 tag];
  unsigned int v17 = [v16 isEqual:v15];

  if (v17)
  {
    [v8 setNeedsTransferLogs:0];
    __int16 v18 = self->_log;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "-[UARPUSBPDUpdater qAccessoryTransferComplete:assetID:status:]";
      __int16 v64 = 2112;
      uint64_t v65 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v18, OS_LOG_TYPE_INFO, "%s: accessory no longer needs LOGS %@", buf, 0x16u);
    }
    if (!a5)
    {
      id v19 = +[NSFileManager defaultManager];
      id v58 = 0;
      unsigned __int8 v20 = [v19 createDirectoryAtPath:@"/var/tmp/aud/uarp/updaterservice/usbpd" withIntermediateDirectories:1 attributes:0 error:&v58];
      id v21 = v58;

      if (v20)
      {
        id v56 = v21;
        v55 = +[NSURL fileURLWithPath:@"/var/tmp/aud/uarp/updaterservice/usbpd"];
        id v22 = [objc_alloc((Class)UARPDyanamicAssetLogManager) initWithBaseURL:v55];
        unsigned __int8 v23 = [v9 localURL];
        id v57 = 0;
        v54 = v22;
        unsigned __int8 v24 = [v22 newLog:v23 error:&v57];
        id v25 = v57;

        if ((v24 & 1) == 0 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          sub_1000222E0();
        }

        id v21 = v56;
      }
      else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      {
        sub_100022348();
      }
    }
  }
  int v26 = (char *)uarpAssetTagStructAnalytics();
  id v27 = [objc_alloc((Class)UARPAssetTag) initWithChar1:*v26 char2:v26[1] char3:v26[2] char4:v26[3]];
  id v28 = [v9 tag];
  unsigned int v29 = [v28 isEqual:v27];

  if (v29)
  {
    [v8 setNeedsTransferAnalytics:0];
    id v30 = self->_log;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "-[UARPUSBPDUpdater qAccessoryTransferComplete:assetID:status:]";
      __int16 v64 = 2112;
      uint64_t v65 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v30, OS_LOG_TYPE_INFO, "%s: accessory no longer needs TICS %@", buf, 0x16u);
    }
    if (!a5)
    {
      id v31 = objc_alloc((Class)UARPDynamicAssetAnalyticsEvent);
      int v32 = [v9 localURL];
      id v33 = [v31 initWithURL:v32];

      if ([v33 decomposeUARP]) {
        [v33 send];
      }
    }
  }
  if ([v8 needsTransferLogs])
  {
    id v34 = self->_log;
    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_INFO, "Soliciting LOGS for %@", buf, 0xCu);
    }
    id v35 = self;
    id v36 = v8;
    id v37 = v15;
LABEL_33:
    [(UARPUSBPDUpdater *)v35 qSolicitDynamicAssetForUSBPDAccessory:v36 assetTag:v37];
    goto LABEL_34;
  }
  if ([v8 needsTransferAnalytics])
  {
    BOOL v38 = self->_log;
    if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v63 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v38, OS_LOG_TYPE_INFO, "Soliciting TICS for %@", buf, 0xCu);
    }
    id v35 = self;
    id v36 = v8;
    id v37 = v27;
    goto LABEL_33;
  }
  if ([v8 isMagSafeCable])
  {
    if (![(UARPUSBPDUpdater *)self needsApplyStagedFirmware:v8])
    {
      id v45 = [v8 hpmDelegate];
      unsigned __int16 v46 = (unsigned __int16)[v45 routerID];

      [(UARPUSBPDUpdater *)self qRemoveDisconnectedAccessories:v46];
      v40 = [(UARPUSBPDUpdater *)self qHpmForRID:v46];
      long long v47 = self->_log;
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v40;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v47, OS_LOG_TYPE_INFO, "Check for power adapter on HPM %@", buf, 0xCu);
      }
      [v40 setSopType:0];
      [(UARPUSBPDUpdater *)self qUpdatePowerAdapter:v40 identifier:0];
      goto LABEL_59;
    }
    uarpController = self->_uarpController;
    v40 = [v8 uarpAccessory];
    v61 = v40;
    unsigned int v41 = &v61;
LABEL_58:
    v52 = +[NSArray arrayWithObjects:v41 count:1];
    [(UARPController *)uarpController applyStagedFirmwareOnAccessoryList:v52 withUserIntent:0];

LABEL_59:
    goto LABEL_34;
  }
  if ([v8 isPowerAdapter])
  {
    v42 = self->_log;
    BOOL v43 = os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_INFO);
    if (a5)
    {
      if (!v43) {
        goto LABEL_51;
      }
      *(_WORD *)buf = 0;
      v44 = "No power adapter update, remove everything on this RID";
    }
    else
    {
      if (!v43) {
        goto LABEL_51;
      }
      *(_WORD *)buf = 0;
      v44 = "Power adapter will restart";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v42, OS_LOG_TYPE_INFO, v44, buf, 2u);
LABEL_51:
    long long v48 = self->_log;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      long long v49 = v48;
      unsigned int v50 = [v8 supportsAccMode7];
      *(_DWORD *)buf = 67109120;
      LODWORD(v63) = v50;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "power adapter supports accmode7 %d", buf, 8u);
    }
    if ([(UARPUSBPDUpdater *)self needsApplyStagedFirmware:v8]
      && [v8 supportsAccMode7])
    {
      v51 = self->_log;
      if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v51, OS_LOG_TYPE_INFO, "Apply staged assets to power adapter", buf, 2u);
      }
      uarpController = self->_uarpController;
      v40 = [v8 uarpAccessory];
      v60 = v40;
      unsigned int v41 = &v60;
      goto LABEL_58;
    }
    goto LABEL_34;
  }
  if (![v8 isUSBCLightning]) {
    goto LABEL_34;
  }
  if ([(UARPUSBPDUpdater *)self needsApplyStagedFirmware:v8])
  {
    uarpController = self->_uarpController;
    v40 = [v8 uarpAccessory];
    v59 = v40;
    unsigned int v41 = &v59;
    goto LABEL_58;
  }
  __int16 v53 = self->_log;
  if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v63 = (const char *)v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v53, OS_LOG_TYPE_INFO, "Dongle doesn't need to apply firmware %@", buf, 0xCu);
  }
  [(UARPUSBPDUpdater *)self qAccessoryUnplugged:v8];
LABEL_34:
}

- (void)qAccessoryUnplugged:(id)a3
{
  id v4 = [a3 hpmDelegate];
  unsigned __int16 v5 = (unsigned __int16)[v4 routerID];

  [(UARPUSBPDUpdater *)self qRemoveDisconnectedAccessories:v5];
}

- (void)qRemoveDisconnectedAccessories:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  id v29 = objc_alloc_init((Class)NSMutableArray);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v40) = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Remove disconnected accessories on RID %d", buf, 8u);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = self->_uarpUSBPDAccessories;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v46 count:16];
  unsigned int v28 = v3;
  if (v7)
  {
    id v8 = v7;
    int v30 = 0;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        int v12 = [v11 hpmDelegate];
        id v13 = [v12 routerID];

        if (v13 == (id)v3)
        {
          __int16 v14 = self->_log;
          if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v40 = (const char *)v11;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_INFO, "mark accessory for removal %@", buf, 0xCu);
          }
          [v29 addObject:v11];
        }
        else
        {
          v30 |= [v11 requiresPowerAssertion];
        }
      }
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v30) = 0;
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = v29;
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v45 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        unsigned __int8 v20 = *(const char **)(*((void *)&v31 + 1) + 8 * (void)j);
        id v21 = self->_log;
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v20;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_INFO, "remove accessory %@", buf, 0xCu);
        }
        [(NSMutableArray *)self->_uarpUSBPDAccessories removeObject:v20];
        id v22 = self->_log;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uarpUSBPDAccessories = self->_uarpUSBPDAccessories;
          unsigned __int8 v24 = v22;
          unsigned int v25 = [(NSMutableArray *)uarpUSBPDAccessories count];
          int v26 = self->_uarpUSBPDAccessories;
          *(_DWORD *)buf = 136315650;
          v40 = "-[UARPUSBPDUpdater qRemoveDisconnectedAccessories:]";
          __int16 v41 = 1024;
          unsigned int v42 = v25;
          __int16 v43 = 2112;
          v44 = v26;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s: USB-PD Accessory Set (%d) is %@", buf, 0x1Cu);
        }
        [(UARPUSBPDUpdater *)self qDisconnectFromCoreUARP:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v31 objects:v45 count:16];
    }
    while (v17);
  }

  if ((v30 & 1) == 0) {
    [(UARPUSBPDUpdater *)self releasePowerAssertionForAccessory];
  }
  id v27 = [(UARPUSBPDUpdater *)self qHpmForRID:v28];
  [v27 setSopDelegate:0];
  [v27 setSopPrimeDelegate:0];
  [(UARPUSBPDUpdater *)self qShowUpdaterSets];
}

- (id)qHpmForRID:(unsigned __int16)a3
{
  int v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_hpms;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "rid", (void)v12) == v3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)qShowUpdaterSets
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    uarpUSBPDAccessories = self->_uarpUSBPDAccessories;
    id v5 = log;
    unsigned int v6 = [(NSMutableArray *)uarpUSBPDAccessories count];
    uint64_t v7 = self->_uarpUSBPDAccessories;
    int v10 = 67109378;
    LODWORD(v11[0]) = v6;
    WORD2(v11[0]) = 2112;
    *(void *)((char *)v11 + 6) = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "USB-PD Accessory Set (%d) is %@", (uint8_t *)&v10, 0x12u);
  }
  id v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
  {
    hpms = self->_hpms;
    int v10 = 138412290;
    v11[0] = hpms;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v8, OS_LOG_TYPE_INFO, "HPM Set is %@", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)queryProperties:(id)a3 accessoryID:(id)a4 goldrestoreQuery:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  int v10 = [(UARPUSBPDUpdater *)self getUARPAccessoryForUARPAccessoryID:v9];
  id v11 = v10;
  if (v10)
  {
    if (v5) {
      [v10 setGoldrestoreQueryInProgress:1];
    }
    id v26 = v9;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      sub_1000223B0();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v27 = v8;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uarpController = self->_uarpController;
          id v19 = objc_msgSend(v17, "unsignedIntegerValue", v26);
          unsigned __int8 v20 = [v11 uarpAccessory];
          id v21 = [(UARPController *)uarpController queryProperty:v19 forAccessory:v20];

          if (v21)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              unsigned __int8 v23 = log;
              [v17 unsignedIntegerValue];
              uint64_t v24 = UARPAccessoryPropertyToString();
              *(_DWORD *)buf = 136315650;
              long long v33 = "-[UARPUSBPDUpdater queryProperties:accessoryID:goldrestoreQuery:]";
              __int16 v34 = 2080;
              uint64_t v35 = v24;
              __int16 v36 = 2048;
              id v37 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Query Property %s failed with error %ld", buf, 0x20u);
            }
            -[UARPUSBPDUpdater queryFailedForAccessory:property:error:](self, "queryFailedForAccessory:property:error:", v11, [v17 unsignedIntegerValue], v21);
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v14);
    }

    id v9 = v26;
    id v8 = v27;
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022424();
  }

  return v11 != 0;
}

- (void)queryFailedForAccessory:(id)a3 property:(unint64_t)a4 error:(int64_t)a5
{
  id v11 = a3;
  id v8 = +[NSError errorWithDomain:kUARPErrorDomain code:a5 userInfo:0];
  switch(a4)
  {
    case 0uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 manufacturer:0 error:v8];
      goto LABEL_12;
    case 1uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 modelName:0 error:v8];
      goto LABEL_12;
    case 2uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 serialNumber:0 error:v8];
      goto LABEL_12;
    case 3uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 hardwareVersion:0 error:v8];
      goto LABEL_12;
    case 4uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 firmwareVersion:0 error:v8];
      goto LABEL_12;
    case 5uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 stagedFirmwareVersion:0 error:v8];
      goto LABEL_12;
    case 6uLL:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 stats:0 error:v8];
      goto LABEL_12;
    case 0xBuLL:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 appleModelNumber:0 error:v8];
      goto LABEL_12;
    case 0xCuLL:
      int v10 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v10 hwFusingType:0 error:v8];

      goto LABEL_11;
    case 0xDuLL:
LABEL_11:
      id v9 = [v11 uarpAccessory];
      [(UARPUSBPDUpdater *)self queryCompleteForAccessory:v9 friendlyName:0 error:v8];
LABEL_12:

      break;
    default:
      break;
  }
}

- (BOOL)applyStagedFirmwareForAccessories:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v8 = 136315394;
    long long v19 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = -[UARPUSBPDUpdater getUARPAccessoryForUARPAccessoryID:](self, "getUARPAccessoryForUARPAccessoryID:", v12, v19, (void)v20);
        id v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 uarpAccessory];
          [v5 addObject:v15];
        }
        else
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            unsigned int v25 = "-[UARPUSBPDUpdater applyStagedFirmwareForAccessories:]";
            __int16 v26 = 2112;
            uint64_t v27 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "%s: Unknown UARPAccessoryID %@", buf, 0x16u);
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);
  }

  unsigned __int8 v17 = [(UARPController *)self->_uarpController applyStagedFirmwareOnAccessoryList:v5 withUserIntent:1];
  return v17;
}

- (BOOL)rescindStagedFirmwareForAccessories:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v21;
    *(void *)&long long v8 = 136315394;
    long long v19 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v13 = -[UARPUSBPDUpdater getUARPAccessoryForUARPAccessoryID:](self, "getUARPAccessoryForUARPAccessoryID:", v12, v19, (void)v20);
        id v14 = v13;
        if (v13)
        {
          uint64_t v15 = [v13 uarpAccessory];
          [v5 addObject:v15];
        }
        else
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            unsigned int v25 = "-[UARPUSBPDUpdater rescindStagedFirmwareForAccessories:]";
            __int16 v26 = 2112;
            uint64_t v27 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "%s: Unknown UARPAccessoryID %@", buf, 0x16u);
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);
  }

  unsigned __int8 v17 = [(UARPController *)self->_uarpController rescindStagedFirmwareOnAccessoryList:v5 withUserIntent:1];
  return v17;
}

- (void)solicitDynamicAssetForAccessories:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100022498();
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v24;
    *(void *)&long long v10 = 136315394;
    long long v19 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = -[UARPUSBPDUpdater getUARPAccessoryForUARPAccessoryID:](self, "getUARPAccessoryForUARPAccessoryID:", v14, v19);
        id v16 = v15;
        if (v15)
        {
          hpmQueue = self->_hpmQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000096F8;
          block[3] = &unk_100038620;
          block[4] = self;
          id v21 = v15;
          id v22 = v7;
          dispatch_async((dispatch_queue_t)hpmQueue, block);
        }
        else
        {
          log = self->_log;
          if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            long long v28 = "-[UARPUSBPDUpdater solicitDynamicAssetForAccessories:assetID:]";
            __int16 v29 = 2112;
            uint64_t v30 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "%s: Unknown UARPAccessoryID %@, dropping it", buf, 0x16u);
          }
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v11);
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
    long long v10 = [v6 availableFirmwareVersion];
    int v12 = 136315906;
    id v13 = "-[UARPUSBPDUpdater assetAvailablityUpdateForAccessoryID:assetID:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    unsigned __int8 v17 = v10;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s: accessory = %@, available version = %@, assetID = %@", (uint8_t *)&v12, 0x2Au);
  }
  id v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v6];
  if (v11)
  {
    if ([v7 downloadStatus] == (id)2)
    {
      [(UARPUSBPDUpdater *)self assetDownloadFailed:v11 assetID:v7];
    }
    else if ([v7 updateAvailabilityStatus] == (id)1)
    {
      [(UARPUSBPDUpdater *)self assetOnAssetServer:v11 assetID:v7];
    }
    else if ([v7 updateAvailabilityStatus] == (id)3)
    {
      [(UARPUSBPDUpdater *)self assetOnLocalStorage:v11 assetID:v7];
    }
    else if ([v7 updateAvailabilityStatus] == (id)4)
    {
      [(UARPUSBPDUpdater *)self assetOnDropbox:v11 assetID:v7];
    }
    else if ([v7 updateAvailabilityStatus] == (id)6)
    {
      [(UARPUSBPDUpdater *)self assetNotFound:v11 assetID:v7];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10002251C();
  }
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v24 = 136315906;
    long long v25 = "-[UARPUSBPDUpdater firmwareStagingComplete:assetID:withStatus:]";
    __int16 v26 = 2112;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: accessory=%@, assetID=%@, status=%lu", (uint8_t *)&v24, 0x2Au);
  }
  id v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  int v12 = v11;
  if (v11)
  {
    if (a5 == 31)
    {
      id v13 = [v11 hpmDelegate];
      unsigned __int8 v14 = [v13 isConnected];

      if (v14)
      {
        a5 = 31;
      }
      else
      {
        id v15 = self->_log;
        if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
          sub_100022604((uint64_t)v8, v15, v16, v17, v18, v19, v20, v21);
        }
        a5 = 3;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      goldRestoreDelegate = self->_goldRestoreDelegate;
      long long v23 = [v12 uarpAccessoryID];
      [(GoldRestoreUARPStatusDelegate *)goldRestoreDelegate firmwareStagingComplete:v23 withStatus:a5];
    }
    else if (a5 == 3)
    {
      [(UARPUSBPDUpdater *)self accessoryUnplugged:v12];
    }
    else
    {
      [(UARPUSBPDUpdater *)self assetTransferComplete:v12 assetID:0 status:a5];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022590();
  }
}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "-[UARPUSBPDUpdater stagedFirmwareApplicationComplete:withStatus:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: accessory=%@, status=%lu", (uint8_t *)&v11, 0x20u);
  }
  id v8 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v6];
  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      goldRestoreDelegate = self->_goldRestoreDelegate;
      long long v10 = [v8 uarpAccessoryID];
      [(GoldRestoreUARPStatusDelegate *)goldRestoreDelegate stagedFirmwareApplicationComplete:v10 withStatus:a4];
    }
    else
    {
      [(UARPUSBPDUpdater *)self accessoryUnplugged:v8];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022670();
  }
}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    int v12 = "-[UARPUSBPDUpdater stagedFirmwareRescindComplete:withStatus:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: accessory=%@, status=%lu", (uint8_t *)&v11, 0x20u);
  }
  id v8 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v6];
  if (v8)
  {
    if (objc_opt_respondsToSelector())
    {
      goldRestoreDelegate = self->_goldRestoreDelegate;
      long long v10 = [v8 uarpAccessoryID];
      [(GoldRestoreUARPStatusDelegate *)goldRestoreDelegate stagedFirmwareRescindComplete:v10 withStatus:a4];
    }
    else
    {
      [(UARPUSBPDUpdater *)self accessoryUnplugged:v8];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000226E4();
  }
}

- (void)assetSolicitationComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315906;
    __int16 v15 = "-[UARPUSBPDUpdater assetSolicitationComplete:assetID:withStatus:]";
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2048;
    unint64_t v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: accessory=%@, assetID=%@, status=%lu", (uint8_t *)&v14, 0x2Au);
  }
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      goldRestoreDelegate = self->_goldRestoreDelegate;
      __int16 v13 = [v11 uarpAccessoryID];
      [(GoldRestoreUARPStatusDelegate *)goldRestoreDelegate assetSolicitationComplete:v13 assetID:v9 withStatus:a5];
    }
    else if (a5 == 3)
    {
      [(UARPUSBPDUpdater *)self accessoryUnplugged:v11];
    }
    else
    {
      [(UARPUSBPDUpdater *)self assetTransferComplete:v11 assetID:v9 status:a5];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022758();
  }
}

- (void)queryCompleteForAccessory:(id)a3 manufacturer:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  int v12 = v11;
  if (v11)
  {
    if [v11 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000A0C8;
      v14[3] = &unk_100038648;
      v14[4] = self;
      id v15 = v12;
      id v16 = v9;
      id v17 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v14);
    }
    else
    {
      [v12 updateProperty:0 value:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000227CC();
  }
}

- (void)queryCompleteForAccessory:(id)a3 modelName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  int v12 = v11;
  if (v11)
  {
    if [v11 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000A28C;
      v14[3] = &unk_100038648;
      v14[4] = self;
      id v15 = v12;
      id v16 = v9;
      id v17 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v14);
    }
    else
    {
      [v12 updateProperty:1 value:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022840();
  }
}

- (void)queryCompleteForAccessory:(id)a3 firmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  int v12 = v11;
  if (v11)
  {
    if [v11 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000A450;
      v14[3] = &unk_100038648;
      v14[4] = self;
      id v15 = v12;
      id v16 = v9;
      id v17 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v14);
    }
    else
    {
      [v12 updateProperty:4 value:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_1000228B4();
  }
}

- (void)queryCompleteForAccessory:(id)a3 stagedFirmwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  int v12 = v11;
  if (v11)
  {
    if [v11 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000A614;
      v14[3] = &unk_100038648;
      v14[4] = self;
      id v15 = v12;
      id v16 = v9;
      id v17 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v14);
    }
    else
    {
      [v12 updateProperty:5 value:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022928();
  }
}

- (void)queryCompleteForAccessory:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  int v12 = v11;
  if (v11)
  {
    if [v11 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000A7C4;
      v14[3] = &unk_100038648;
      v14[4] = self;
      id v15 = v12;
      id v16 = v9;
      id v17 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v14);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_10002299C();
  }
}

- (void)queryCompleteForAccessory:(id)a3 hardwareVersion:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  int v12 = v11;
  if (v11)
  {
    if [v11 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000A974;
      v14[3] = &unk_100038648;
      v14[4] = self;
      id v15 = v12;
      id v16 = v9;
      id v17 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v14);
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022A10();
  }
}

- (void)queryCompleteForAccessory:(id)a3 serialNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  int v12 = v11;
  if (v11)
  {
    if [v11 goldrestoreQueryInProgress] && (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000AB38;
      v14[3] = &unk_100038648;
      v14[4] = self;
      id v15 = v12;
      id v16 = v9;
      id v17 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v14);
    }
    else
    {
      [v12 updateProperty:2 value:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022A84();
  }
}

- (void)queryCompleteForAccessory:(id)a3 appleModelNumber:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10000AD58;
      v17[3] = &unk_100038648;
      v17[4] = self;
      id v18 = v11;
      id v19 = v9;
      id v20 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v17);
    }
    else
    {
      if (!v10)
      {
        __int16 v13 = [v11 uarpAccessoryID];
        int v14 = [v13 modelNumber];
        unsigned __int8 v15 = [v9 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            sub_100022B6C((uint64_t)v9, log, v11);
          }
        }
      }
      [v11 updateProperty:11 value:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022AF8();
  }
}

- (void)queryCompleteForAccessory:(id)a3 hwFusingType:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000AF0C;
      v13[3] = &unk_100038648;
      v13[4] = self;
      id v14 = v11;
      id v15 = v9;
      id v16 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:12 value:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022C3C();
  }
}

- (void)queryCompleteForAccessory:(id)a3 friendlyName:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v8];
  if (v11)
  {
    if (objc_opt_respondsToSelector())
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000B0C0;
      v13[3] = &unk_100038648;
      v13[4] = self;
      id v14 = v11;
      id v15 = v9;
      id v16 = v10;
      dispatch_async((dispatch_queue_t)delegateQueue, v13);
    }
    else
    {
      [v11 updateProperty:13 value:v9];
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100022CB0();
  }
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  int v12 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v10];
  if (!v12 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_100022D24();
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    id v20 = "-[UARPUSBPDUpdater firmwareStagingProgress:assetID:bytesSent:bytesTotal:]";
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
    v15[2] = sub_10000B300;
    v15[3] = &unk_100038670;
    v15[4] = self;
    id v16 = v12;
    unint64_t v17 = a5;
    unint64_t v18 = a6;
    dispatch_async((dispatch_queue_t)delegateQueue, v15);
  }
}

- (void)assetSolicitationProgress:(id)a3 assetID:(id)a4 bytesReceived:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  int v12 = [(UARPUSBPDUpdater *)self getUARPUSBPDAccessoryForUARPAccessory:v10];
  if (!v12 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_100022D98();
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    __int16 v21 = "-[UARPUSBPDUpdater assetSolicitationProgress:assetID:bytesReceived:bytesTotal:]";
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2048;
    double v27 = (float)((float)((float)a5 / (float)a6) * 100.0);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "%s: accessory=%@, assetID=%@, progress=%f", buf, 0x2Au);
  }
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B550;
    block[3] = &unk_100038698;
    block[4] = self;
    id v16 = v12;
    id v17 = v11;
    unint64_t v18 = a5;
    unint64_t v19 = a6;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uarpQueue = self->_uarpQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B67C;
  block[3] = &unk_100038620;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)uarpQueue, block);

  return 1;
}

- (BOOL)recvUarpMsgFromAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uarpQueue = self->_uarpQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B79C;
  block[3] = &unk_100038620;
  block[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)uarpQueue, block);

  return 1;
}

- (void)assetDownloadFailed:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[UARPUSBPDUpdater assetDownloadFailed:assetID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: usbpd = %@, assetID = %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B98C;
    block[3] = &unk_100038620;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }
  else if ([v7 updateAvailabilityStatus] == (id)6)
  {
    [(UARPUSBPDUpdater *)self assetTransferComplete:v6 assetID:0 status:4];
  }
}

- (void)assetOnAssetServer:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    id v12 = "-[UARPUSBPDUpdater assetOnAssetServer:assetID:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: usbpd = %@, assetID = %@", (uint8_t *)&v11, 0x20u);
  }
  uarpController = self->_uarpController;
  id v10 = [v6 uarpAccessory];
  [(UARPController *)uarpController downloadAvailableFirmwareUpdate:v10 assetID:v7 withUserIntent:1];
}

- (void)assetOnDropbox:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    id v12 = "-[UARPUSBPDUpdater assetOnDropbox:assetID:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: usbpd = %@, assetID = %@", (uint8_t *)&v11, 0x20u);
  }
  uarpController = self->_uarpController;
  id v10 = [v6 uarpAccessory];
  [(UARPController *)uarpController downloadAvailableFirmwareUpdate:v10 assetID:v7 withUserIntent:1];
}

- (void)assetNotFound:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[UARPUSBPDUpdater assetNotFound:assetID:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: usbpd = %@, assetID = %@", buf, 0x20u);
  }
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BD8C;
    block[3] = &unk_100038620;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)delegateQueue, block);
  }
  else if ([v7 updateAvailabilityStatus] == (id)6)
  {
    [(UARPUSBPDUpdater *)self assetTransferComplete:v6 assetID:0 status:4];
  }
}

- (void)assetOnLocalStorage:(id)a3 assetID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    __int16 v13 = "-[UARPUSBPDUpdater assetOnLocalStorage:assetID:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: usbpd = %@, assetID = %@", (uint8_t *)&v12, 0x20u);
  }
  if ([v6 requiresPowerAssertion])
  {
    id v9 = self->_log;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      __int16 v13 = "-[UARPUSBPDUpdater assetOnLocalStorage:assetID:]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_INFO, "%s: usbpd = %@, requires power assertion", (uint8_t *)&v12, 0x16u);
    }
    [(UARPUSBPDUpdater *)self holdPowerAssertionForAccessory];
  }
  id v10 = [v6 uarpAccessory];
  id v11 = +[NSArray arrayWithObject:v10];

  [(UARPController *)self->_uarpController stageFirmwareUpdateOnAccessoryList:v11 withUserIntent:1];
}

- (void)assetTransferComplete:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  hpmQueue = self->_hpmQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C04C;
  v13[3] = &unk_1000386C0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)hpmQueue, v13);
}

- (void)dynamicAssetTransferComplete:(id)a3 assetID:(id)a4
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100022E84();
  }
}

- (BOOL)needsApplyStagedFirmware:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      unint64_t v19 = "accessory staged firmware - nil usbpd";
LABEL_14:
      id v20 = log;
      goto LABEL_15;
    }
LABEL_16:
    BOOL v18 = 0;
    goto LABEL_17;
  }
  id v6 = [v4 stagedFwVersion];

  id v7 = self->_log;
  BOOL v8 = os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v8)
    {
      LOWORD(v22) = 0;
      unint64_t v19 = "accessory staged firmware - nil stagedFwVersion";
      id v20 = v7;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v22, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (v8)
  {
    id v9 = v7;
    id v10 = [v5 stagedFwVersion];
    int v22 = 138412546;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "usbpd staged firmware of <%@> %@", (uint8_t *)&v22, 0x16u);
  }
  id v11 = [v5 stagedFwVersion];
  unsigned __int8 v12 = [v11 isValid];

  log = self->_log;
  BOOL v14 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO);
  if ((v12 & 1) == 0)
  {
    if (v14)
    {
      LOWORD(v22) = 0;
      unint64_t v19 = "accessory staged firmware - not valid stagedFwVersion";
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if (v14)
  {
    id v15 = log;
    unint64_t v16 = [v5 vuarpDelegate];
    id v17 = [v16 stagedFwVersion];
    int v22 = 138412546;
    id v23 = v17;
    __int16 v24 = 2112;
    id v25 = v5;
    BOOL v18 = 1;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "vuarp staged firmware of <%@> %@", (uint8_t *)&v22, 0x16u);
  }
  else
  {
    BOOL v18 = 1;
  }
LABEL_17:

  return v18;
}

- (void)disabledProductIdentifiers:(id)a3
{
  id v4 = a3;
  hpmQueue = self->_hpmQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C48C;
  v7[3] = &unk_1000386E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)hpmQueue, v7);
}

- (id)getUARPAccessoryForUARPAccessoryID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10000C5FC;
  unint64_t v16 = sub_10000C60C;
  id v17 = 0;
  hpmQueue = self->_hpmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C614;
  block[3] = &unk_100038710;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)hpmQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getUARPUSBPDAccessoryForUARPAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10000C5FC;
  unint64_t v16 = sub_10000C60C;
  id v17 = 0;
  hpmQueue = self->_hpmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C908;
  block[3] = &unk_100038710;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)hpmQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)accessoryUnplugged:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100023058(log, v6, v7, v8, v9, v10, v11, v12);
  }
  hpmQueue = self->_hpmQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000CBB0;
  v15[3] = &unk_1000386E8;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  dispatch_sync((dispatch_queue_t)hpmQueue, v15);
}

- (void)holdPowerAssertionForAccessory
{
  if (self->_powerAssertionID)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100023144((os_log_t)log);
    }
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"com.apple.UARPPowerAssertion-USBPD"];
    if ((createPowerAssertion() & 1) == 0 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000230D0();
    }
    id v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v7 = "-[UARPUSBPDUpdater holdPowerAssertionForAccessory]";
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
        sub_100023200(log, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    uint64_t v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      __int16 v21 = "-[UARPUSBPDUpdater releasePowerAssertionForAccessory]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "%s: Power assertion released for USBPD", (uint8_t *)&v20, 0xCu);
    }
    self->_powerAssertionID = 0;
  }
  else
  {
    uint64_t v12 = self->_log;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR)) {
      sub_100023188(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (GoldRestoreUARPStatusDelegate)goldRestoreDelegate
{
  return (GoldRestoreUARPStatusDelegate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setGoldRestoreDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goldRestoreDelegate, 0);
  objc_storeStrong((id *)&self->_disabledIdentifiers, 0);
  objc_storeStrong((id *)&self->_uarpCaptureFileName, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_uarpQueue, 0);
  objc_storeStrong((id *)&self->_uarpUSBPDAccessories, 0);
  objc_storeStrong((id *)&self->_hpms, 0);
  objc_storeStrong((id *)&self->_hpmQueue, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
}

@end