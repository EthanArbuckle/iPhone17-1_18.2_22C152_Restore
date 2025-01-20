@interface PTPInitiator
- (BOOL)allowKeepAwake;
- (BOOL)cancelOp;
- (BOOL)catalogingDone;
- (BOOL)closeSession;
- (BOOL)containsAccessRestrictedAppleDeviceStorage;
- (BOOL)deleteFile:(id)a3;
- (BOOL)deviceIsEnumerating;
- (BOOL)deviceIsPairedWithThisHost;
- (BOOL)deviceIsPasscodeLocked;
- (BOOL)iCloudPhotosEnabled;
- (BOOL)initiateCapture;
- (BOOL)isAccessRestrictedAppleDevice;
- (BOOL)isAppleDevice;
- (BOOL)needToReopenSession;
- (BOOL)openSession;
- (BOOL)orderAscending;
- (BOOL)prioritizeSpeed;
- (BOOL)readStorages;
- (BOOL)requestPending;
- (BOOL)resetDevice;
- (BOOL)resetDevicePropertyValueForProperty:(unsigned __int16)a3;
- (BOOL)sendHostMediaCapabilities;
- (BOOL)sendHostSupportsGroupNotifications;
- (BOOL)sessionOpen;
- (BOOL)setDeviceDateTime:(id)a3;
- (BOOL)setDevicePropertyValue:(id)a3 forProperty:(unsigned __int16)a4;
- (BOOL)start;
- (ICCameraDeviceNotificationProtocol)delegate;
- (NSMutableArray)eventQueue;
- (NSMutableArray)storages;
- (NSMutableDictionary)mobdevProperties;
- (NSString)appleSerialNumberString;
- (NSString)deviceSerialNumberString;
- (NSString)userAssignedDeviceName;
- (OS_dispatch_queue)mobdevPropertiesQueue;
- (OS_dispatch_queue)timerQueue;
- (OS_dispatch_source)timer;
- (OS_remote_device_browser)mobdevPropertiesBrowser;
- (PTPDeviceInfoDataset)deviceInfo;
- (PTPHostUSBTransport)transport;
- (PTPInitiator)initWithHostLocationID:(unsigned int)a3;
- (double)timeOffset;
- (id)cameraItemWithObjectID:(unint64_t)a3;
- (id)deviceDateTime;
- (id)devicePropertyDescDatasetForProperty:(unsigned __int16)a3;
- (id)devicePropertyValueForProperty:(unsigned __int16)a3;
- (id)executeTransaction:(id)a3 timeout:(double)a4;
- (id)fileSystemManifestForStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5;
- (id)metadataFromFile:(id)a3;
- (id)mobdevProps;
- (id)objectHandlesInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5;
- (id)objectInfo:(unsigned int)a3;
- (id)objectInfoDatasetForNextObjectGroupInStorage:(unsigned int)a3;
- (id)objectInfoDatasetForObjectsInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5 contentType:(int)a6;
- (id)partialDataFromFile:(id)a3 fromOffset:(unint64_t)a4 maxSize:(unint64_t)a5 actualSize:(unint64_t *)a6 useBuffer:(char *)a7;
- (id)refreshAssignedDeviceName;
- (id)storageForStorageID:(unsigned int)a3;
- (id)storageIDs;
- (id)storageInfo:(unsigned int)a3;
- (id)thumbDataFromFile:(id)a3 maxPixelSize:(unsigned int)a4 actualSize:(unsigned int *)a5 useBuffer:(char *)a6;
- (id)thumbDataFromFile:(id)a3 maxSize:(unsigned int)a4 actualSize:(unsigned int *)a5 useBuffer:(char *)a6;
- (int)transportConnectionStatus;
- (int64_t)enumerationOrder;
- (os_unfair_lock_s)mobdevPropertiesLock;
- (unint64_t)iCloudPhotosOptimizeStorageState;
- (unint64_t)icplOptimizeStorageState;
- (unint64_t)icplState;
- (unint64_t)objectCompressedSize64:(unsigned int)a3;
- (unsigned)copyPartialFile:(id)a3 fromOffset:(unint64_t)a4 size:(unint64_t)a5 to:(id)a6;
- (unsigned)deviceProductID;
- (unsigned)deviceStatus;
- (unsigned)deviceVendorID;
- (unsigned)enumeratedCount;
- (unsigned)numObjectsInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5;
- (unsigned)preflightCount;
- (unsigned)ptpObjectCount;
- (unsigned)transactionID;
- (void)addMobdevProperties:(id)a3;
- (void)cancel;
- (void)cancelTimerAndFireBlock:(id)a3;
- (void)dealloc;
- (void)deviceReset;
- (void)handleEvent:(id)a3;
- (void)issueCancelRequest:(unsigned int)a3;
- (void)notifyDeviceReady:(unint64_t)a3;
- (void)processUnhandledEvents;
- (void)sendContentsNotificationWithOrder:(int64_t)a3 toConnections:(id)a4;
- (void)sendPTPCommand:(id)a3 andPayload:(id)a4 withReply:(id)a5;
- (void)sentData:(id)a3;
- (void)sentData:(id)a3 responseCode:(id)a4;
- (void)setAppleSerialNumberString:(id)a3;
- (void)setCancelOp:(BOOL)a3;
- (void)setCatalogingDone:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceFinishedEnumerating;
- (void)setDeviceInfo:(id)a3;
- (void)setDeviceIsEnumerating;
- (void)setDeviceIsEnumerating:(BOOL)a3;
- (void)setDeviceIsPairedWithThisHost:(BOOL)a3;
- (void)setDeviceIsPasscodeLocked:(BOOL)a3;
- (void)setDeviceProductID:(unsigned __int16)a3;
- (void)setDeviceSerialNumberString:(id)a3;
- (void)setDeviceVendorID:(unsigned __int16)a3;
- (void)setEnumeratedCount:(unsigned int)a3;
- (void)setEnumerationOrder:(int64_t)a3;
- (void)setEventQueue:(id)a3;
- (void)setIcplOptimizeStorageState:(unint64_t)a3;
- (void)setIcplState:(unint64_t)a3;
- (void)setMobdevProperties:(id)a3;
- (void)setMobdevPropertiesBrowser:(id)a3;
- (void)setMobdevPropertiesLock:(os_unfair_lock_s)a3;
- (void)setMobdevPropertiesQueue:(id)a3;
- (void)setNeedToReopenSession:(BOOL)a3;
- (void)setOrderAscending:(BOOL)a3;
- (void)setRequestPending:(BOOL)a3;
- (void)setSessionOpen:(BOOL)a3;
- (void)setStorages:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerQueue:(id)a3;
- (void)setTransactionID:(unsigned int)a3;
- (void)setTransport:(id)a3;
- (void)setUserAssignedDeviceName:(id)a3;
- (void)startTimerWithInterval:(double)a3 andFireBlock:(id)a4;
- (void)stop;
- (void)updateCatalogingDone;
- (void)updateMobdevProps;
- (void)updatePropertiesOfMobileDeviceWithLocationID:(unsigned int)a3;
@end

@implementation PTPInitiator

- (PTPInitiator)initWithHostLocationID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v20.receiver = self;
  v20.super_class = (Class)PTPInitiator;
  v4 = [(PTPInitiator *)&v20 init];
  if (v4)
  {
    v5 = [[PTPHostUSBTransport alloc] initWithLocationID:v3 delegate:v4];
    transport = v4->_transport;
    v4->_transport = v5;

    v4->_transactionID = 0;
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    storages = v4->_storages;
    v4->_storages = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    eventQueue = v4->_eventQueue;
    v4->_eventQueue = v9;

    *(_OWORD *)&v4->_icplState = xmmword_10003BE60;
    v4->_enumerationOrder = -1;
    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mobdevProperties = v4->_mobdevProperties;
    v4->_mobdevProperties = v11;

    id v13 = +[NSString stringWithFormat:@"PTP-Enumeration-Timer-Queue:0x%08X", v3];
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    timerQueue = v4->_timerQueue;
    v4->_timerQueue = (OS_dispatch_queue *)v14;

    id v16 = +[NSString stringWithFormat:@"PTP-MobdevProperties-Queue:0x%08X", v3];
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    mobdevPropertiesQueue = v4->_mobdevPropertiesQueue;
    v4->_mobdevPropertiesQueue = (OS_dispatch_queue *)v17;

    v4->_mobdevPropertiesLock._os_unfair_lock_opaque = 0;
    if (!v4->_transport)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  __ICOSLogCreate();
  uint64_t v3 = @"PTPInitiator";
  if ((unint64_t)[@"PTPInitiator" length] >= 0x15)
  {
    v4 = [@"PTPInitiator" substringWithRange:0, 18];
    uint64_t v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = [(PTPInitiator *)self transport];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p | %16s - 0x%08X", self, "dealloc locID", [v5 locationID]);

  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v3;
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    id v24 = [(__CFString *)v8 UTF8String];
    __int16 v25 = 2114;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self->_transport];
  [(PTPHostUSBTransport *)self->_transport setDelegate:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = self->_storages;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      dispatch_queue_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:*(void *)(*((void *)&v18 + 1) + 8 * (void)v14)];
        dispatch_queue_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  [(PTPHostUSBTransport *)self->_transport abortPendingIO];
  transport = self->_transport;
  self->_transport = 0;

  if (self->_mobdevPropertiesBrowser)
  {
    remote_device_browser_cancel();
    mobdevPropertiesBrowser = self->_mobdevPropertiesBrowser;
    self->_mobdevPropertiesBrowser = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)PTPInitiator;
  [(PTPInitiator *)&v17 dealloc];
}

- (BOOL)start
{
  BOOL v3 = [(PTPHostUSBTransport *)self->_transport startInitiator];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PTPInitiator *)self setDeviceVendorID:[(PTPHostUSBTransport *)self->_transport vendorID]];
      [(PTPInitiator *)self setDeviceProductID:[(PTPHostUSBTransport *)self->_transport productID]];
      v4 = [(PTPHostUSBTransport *)self->_transport usbSerialNumberString];
      [(PTPInitiator *)self setDeviceSerialNumberString:v4];
    }
    v5 = [(PTPInitiator *)self deviceSerialNumberString];
    if ([v5 length] == (id)24 && -[PTPInitiator deviceVendorID](self, "deviceVendorID") == 1452)
    {
      v6 = [v5 substringWithRange:0, 8];
      v7 = [v5 substringFromIndex:9];
      v8 = +[NSString stringWithFormat:@"%@-%@", v6, v7];
      [(PTPInitiator *)self setDeviceSerialNumberString:v8];
    }
  }
  return v3;
}

- (void)stop
{
  __ICOSLogCreate();
  BOOL v3 = @"PTPInitiator";
  if ((unint64_t)[@"PTPInitiator" length] >= 0x15)
  {
    v4 = [@"PTPInitiator" substringWithRange:0, 18];
    BOOL v3 = [v4 stringByAppendingString:@".."];
  }
  v5 = [(PTPInitiator *)self transport];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%p | %16s - 0x%08X", self, "stopping locID", [v5 locationID]);

  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v3;
    v9 = v7;
    *(_DWORD *)buf = 136446466;
    id v11 = [(__CFString *)v8 UTF8String];
    __int16 v12 = 2114;
    uint64_t v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if ([(PTPInitiator *)self sessionOpen]) {
    [(PTPInitiator *)self closeSession];
  }
  [(PTPHostUSBTransport *)self->_transport stop];
}

- (void)cancel
{
  BOOL v3 = [[PTPCancelPacket alloc] initWithTransactionID:self->_transactionID];
  [(PTPHostUSBTransport *)self->_transport performSelector:"sendCancel:" withObject:v3];
}

- (int)transportConnectionStatus
{
  return [(PTPHostUSBTransport *)self->_transport connectionStatus];
}

- (id)refreshAssignedDeviceName
{
  if (self->_deviceVendorID == 1452)
  {
    BOOL v3 = [PTPOperationRequestPacket alloc];
    ++self->_transactionID;
    v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:", 36867);
    v5 = [[PTPTransaction alloc] initWithOperationRequestPacket:v4 txData:0 rxData:0 dataExpected:1];
    v6 = [(PTPInitiator *)self executeTransaction:v5 timeout:60.0];
    v7 = [(PTPTransaction *)v5 rxDataBuffer];
    if (v6 && [v6 responseCode] == 8193 && objc_msgSend(v7, "length"))
    {
      id v11 = [v7 headerOffsetBytes];
      v8 = sub_10002A6B8((const void **)&v11);
      [(PTPInitiator *)self setUserAssignedDeviceName:v8];
    }
    v9 = [(PTPInitiator *)self userAssignedDeviceName];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)handleEvent:(id)a3
{
  id v4 = a3;
  v5 = [(PTPInitiator *)self delegate];
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_10000F0B8;
  id v11 = &unk_10004C9E8;
  __int16 v12 = self;
  id v13 = v4;
  id v6 = v4;
  v7 = +[NSBlockOperation blockOperationWithBlock:&v8];
  [v5 addInteractiveOperation:v7, v8, v9, v10, v11, v12];
}

- (id)cameraItemWithObjectID:(unint64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_storages;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 cameraFileWithObjectID:a3];
        if (!v10)
        {
          uint64_t v10 = [v9 cameraFolderWithObjectID:a3];
          if (!v10) {
            continue;
          }
        }
        id v11 = (void *)v10;
        goto LABEL_13;
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      id v11 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_13:

  return v11;
}

- (void)processUnhandledEvents
{
  id v4 = [(PTPInitiator *)self transport];
  if ([v4 connected])
  {
    id v3 = [(NSMutableArray *)self->_eventQueue count];

    if (!v3) {
      return;
    }
    id v4 = [(NSMutableArray *)self->_eventQueue objectAtIndex:0];
    [(NSMutableArray *)self->_eventQueue removeObject:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PTPInitiator *)self performSelector:"handleEvent:" withObject:v4 afterDelay:0.0];
    }
  }
}

- (void)issueCancelRequest:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = +[NSNumber numberWithUnsignedInt:v3];
    [(PTPHostUSBTransport *)self->_transport performSelector:"cancelRequest:" withObject:v5];
  }
}

- (id)executeTransaction:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  [(PTPInitiator *)self setRequestPending:1];
  [(PTPInitiator *)self setCancelOp:0];
  uint64_t v7 = [v6 requestPacket];
  unsigned int v8 = [v7 operationCode];

  BOOL v10 = v8 - 4097 < 2 || v8 == 36875 || v8 == 36880;
  if (v10 || self->_sessionOpen)
  {
    id v11 = [(PTPHostUSBTransport *)self->_transport sendTransaction:v6 timeout:a4];
  }
  else
  {
    id v11 = 0;
  }
  [(PTPInitiator *)self setRequestPending:0];
  [(PTPInitiator *)self performSelector:"processUnhandledEvents" withObject:0 afterDelay:0.0];
  __ICOSLogCreate();
  __int16 v12 = +[NSString stringWithFormat:@"[PTPInitiator executeTransaction] response: %@\n", v11];
  long long v13 = +[NSString stringWithFormat:@"%@", v12];

  if (__ICLogTypeEnabled(4))
  {
    long long v14 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }

  return v11;
}

- (void)sentData:(id)a3
{
  id v3 = a3;
  __ICOSLogCreate();
  id v4 = +[NSString stringWithFormat:@"sentData: <PTPDataPacket %p> called\n", v3];

  if (__ICLogTypeEnabled(4))
  {
    id v5 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
}

- (void)sentData:(id)a3 responseCode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  __ICOSLogCreate();
  id v7 = [v5 intValue];

  unsigned int v8 = +[NSString stringWithFormat:@"sentData: <PTPDataPacket %p><ResponseCode %d> called\n", v6, v7];

  if (__ICLogTypeEnabled(4))
  {
    uint64_t v9 = _gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
}

- (PTPDeviceInfoDataset)deviceInfo
{
  deviceInfo = self->_deviceInfo;
  if (deviceInfo) {
    goto LABEL_38;
  }
  if (self->_sessionOpen)
  {
    uint64_t transactionID = self->_transactionID;
    self->_uint64_t transactionID = transactionID + 1;
  }
  else
  {
    uint64_t transactionID = 0;
  }
  id v5 = [[PTPOperationRequestPacket alloc] initWithOperationCode:4097 transactionID:transactionID dataPhaseInfo:1];
  id v6 = [[PTPTransaction alloc] initWithOperationRequestPacket:v5 txData:0 rxData:0 dataExpected:1];
  id v7 = 0;
  int v8 = 4;
  while (1)
  {
    uint64_t v9 = v7;
    id v7 = [(PTPInitiator *)self executeTransaction:v6 timeout:5.0];

    BOOL v10 = [(PTPTransaction *)v6 rxDataBuffer];
    if (v7)
    {
      if ([v7 responseCode] == 8193 && objc_msgSend(v10, "length")) {
        break;
      }
    }
    [(PTPInitiator *)self closeSession];
LABEL_12:
    [v10 setLength:0];

    if (!--v8 || self->_deviceInfo) {
      goto LABEL_14;
    }
  }
  id v11 = [PTPDeviceInfoDataset alloc];
  __int16 v12 = [NSMutableData dataWithBytes:[v10 headerOffsetBytes] length:[v10 length]];
  long long v13 = [(PTPDeviceInfoDataset *)v11 initWithMutableData:v12];
  long long v14 = self->_deviceInfo;
  self->_deviceInfo = v13;

  if (!self->_deviceInfo) {
    goto LABEL_12;
  }

LABEL_14:
  if ([(PTPInitiator *)self deviceVendorID] == 1452
    && [(PTPHostUSBTransport *)self->_transport type] == 2)
  {
    [(PTPInitiator *)self updateMobdevProps];
  }
  long long v15 = [(PTPDeviceInfoDataset *)self->_deviceInfo vendorExtensionDescription];
  unsigned __int8 v16 = [v15 isEqualToString:&stru_10004E2B0];

  if ((v16 & 1) == 0)
  {
    v33 = v6;
    uint64_t v17 = +[NSCharacterSet characterSetWithCharactersInString:@"&^"];
    long long v18 = [(PTPDeviceInfoDataset *)self->_deviceInfo vendorExtensionDescription];
    v32 = (void *)v17;
    long long v19 = [v18 componentsSeparatedByCharactersInSet:v17];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      id v22 = v21;
      id v23 = 0;
      id v24 = 0;
      uint64_t v25 = *(void *)v35;
      do
      {
        v26 = 0;
        v27 = v24;
        do
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v20);
          }
          v28 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v26);
          if (v23)
          {
            id v24 = v28;

            if ([v23 isEqualToString:@"ICPE"])
            {
              self->_icplState = (int)[v24 intValue];
            }
            else if ([v23 isEqualToString:@"CPLS"])
            {
              self->_icplOptimizeStorageState = (int)[v24 intValue];
            }
            else if ([v23 isEqualToString:@"ASN"])
            {
              v29 = (NSString *)[v24 copy];
              appleSerialNumberString = self->_appleSerialNumberString;
              self->_appleSerialNumberString = v29;
            }
            id v23 = 0;
            v27 = v24;
          }
          else
          {
            id v23 = [v28 copy];
            id v24 = v27;
          }
          v26 = (char *)v26 + 1;
        }
        while (v22 != v26);
        id v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v22);
    }
    else
    {
      id v23 = 0;
      id v24 = 0;
    }

    id v6 = v33;
  }

  deviceInfo = self->_deviceInfo;
LABEL_38:

  return deviceInfo;
}

- (id)mobdevProps
{
  id v3 = +[NSMutableDictionary dictionary];
  os_unfair_lock_lock(&self->_mobdevPropertiesLock);
  [v3 addEntriesFromDictionary:self->_mobdevProperties];
  os_unfair_lock_unlock(&self->_mobdevPropertiesLock);

  return v3;
}

- (void)addMobdevProperties:(id)a3
{
  if (a3)
  {
    p_mobdevPropertiesLock = &self->_mobdevPropertiesLock;
    id v5 = a3;
    os_unfair_lock_lock(p_mobdevPropertiesLock);
    [(NSMutableDictionary *)self->_mobdevProperties addEntriesFromDictionary:v5];

    os_unfair_lock_unlock(p_mobdevPropertiesLock);
  }
}

- (void)updateMobdevProps
{
  id v3 = [(PTPInitiator *)self mobdevProps];
  id v4 = [v3 count];

  if (!v4)
  {
    id v5 = [(PTPInitiator *)self transport];
    -[PTPInitiator updatePropertiesOfMobileDeviceWithLocationID:](self, "updatePropertiesOfMobileDeviceWithLocationID:", [v5 locationID]);
  }
}

- (void)updatePropertiesOfMobileDeviceWithLocationID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  __ICOSLogCreate();
  id v5 = @"RemoteServices";
  if ((unint64_t)[@"RemoteServices" length] >= 0x15)
  {
    id v6 = [@"RemoteServices" substringWithRange:0, 18];
    id v5 = [v6 stringByAppendingString:@".."];
  }
  id v7 = +[NSString stringWithFormat:@"%@: 0x%08X", @"Monitoring", v3];
  int v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v5;
    BOOL v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v25 = [(__CFString *)v9 UTF8String];
    __int16 v26 = 2114;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v11 = [(PTPInitiator *)self mobdevPropertiesBrowser];

  if (v11)
  {
    __ICOSLogCreate();
    __int16 v12 = @"RemoteServices";
    if ((unint64_t)[@"RemoteServices" length] >= 0x15)
    {
      long long v13 = [@"RemoteServices" substringWithRange:0, 18];
      __int16 v12 = [v13 stringByAppendingString:@".."];
    }
    long long v14 = +[NSString stringWithFormat:@"Already Browsing: 0x%08X", v3];
    long long v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = v12;
      unsigned __int8 v16 = v15;
      id v17 = [(__CFString *)v12 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v25 = v17;
      __int16 v26 = 2114;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v12 = (__CFString *)xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v12, "DeviceType", "ncm-device");
    dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
    long long v19 = [(PTPInitiator *)self mobdevPropertiesQueue];
    long long v14 = v18;
    started = (void *)remote_device_start_browsing_matching();
    [(PTPInitiator *)self setMobdevPropertiesBrowser:started];

    dispatch_time_t v21 = dispatch_time(0, 2000000000);
    dispatch_semaphore_wait(v14, v21);
    id v22 = [(PTPInitiator *)self mobdevPropertiesBrowser];

    if (v22)
    {
      id v23 = [(PTPInitiator *)self mobdevPropertiesBrowser];
      remote_device_browser_cancel();

      [(PTPInitiator *)self setMobdevPropertiesBrowser:0];
    }
  }
}

- (BOOL)iCloudPhotosEnabled
{
  if (self->_icplState == 2 && [(NSMutableArray *)self->_storages count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_storages objectAtIndex:0];
    self->_icplState = [v3 locked];
  }
  return self->_icplState == 1;
}

- (unint64_t)iCloudPhotosOptimizeStorageState
{
  return self->_icplOptimizeStorageState;
}

- (NSString)appleSerialNumberString
{
  return self->_appleSerialNumberString;
}

- (id)devicePropertyDescDatasetForProperty:(unsigned __int16)a3
{
  id v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4116);
  id v6 = [[PTPTransaction alloc] initWithOperationRequestPacket:v5 txData:0 rxData:0 dataExpected:1];
  id v7 = [(PTPInitiator *)self executeTransaction:v6 timeout:60.0];
  int v8 = [(PTPTransaction *)v6 rxDataBuffer];
  if (v7 && [v7 responseCode] == 8193 && objc_msgSend(v8, "length"))
  {
    uint64_t v9 = [PTPDevicePropDescDataset alloc];
    BOOL v10 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", [v8 headerOffsetBytes], [v8 length]);
    id v11 = [(PTPDevicePropDescDataset *)v9 initWithMutableData:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)devicePropertyValueForProperty:(unsigned __int16)a3
{
  id v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4117);
  id v6 = [[PTPTransaction alloc] initWithOperationRequestPacket:v5 txData:0 rxData:0 dataExpected:1];
  id v7 = [(PTPInitiator *)self executeTransaction:v6 timeout:60.0];
  int v8 = [(PTPTransaction *)v6 rxDataBuffer];
  if (v7 && [v7 responseCode] == 8193 && objc_msgSend(v8, "length")) {
    id v9 = [v8 copy];
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)setDevicePropertyValue:(id)a3 forProperty:(unsigned __int16)a4
{
  id v5 = a3;
  id v6 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v7 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v6, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4118);
  int v8 = [[PTPDataPacket alloc] initWithOperationCode:4118 transactionID:self->_transactionID andData:v5];

  id v9 = [[PTPTransaction alloc] initWithOperationRequestPacket:v7 txData:v8 rxData:0 dataExpected:0];
  BOOL v10 = [(PTPInitiator *)self executeTransaction:v9 timeout:60.0];
  id v11 = v10;
  if (v10) {
    BOOL v12 = [v10 responseCode] == 8193;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)resetDevicePropertyValueForProperty:(unsigned __int16)a3
{
  id v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4119);
  id v6 = [[PTPTransaction alloc] initWithOperationRequestPacket:v5 txData:0 rxData:0 dataExpected:0];
  id v7 = [(PTPInitiator *)self executeTransaction:v6 timeout:60.0];
  int v8 = v7;
  if (v7) {
    BOOL v9 = [v7 responseCode] == 8193;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)resetDevice
{
  uint64_t v3 = [[PTPOperationRequestPacket alloc] initWithOperationCode:4112 transactionID:0 dataPhaseInfo:1];
  id v4 = [[PTPTransaction alloc] initWithOperationRequestPacket:v3 txData:0 rxData:0 dataExpected:0];
  id v5 = [(PTPInitiator *)self executeTransaction:v4 timeout:60.0];
  id v6 = v5;
  if (v5 && [v5 responseCode] == 8193)
  {
    self->_sessionOpen = 0;
    self->_uint64_t transactionID = 0;
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)startTimerWithInterval:(double)a3 andFireBlock:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(PTPInitiator *)self timerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000117AC;
  block[3] = &unk_10004CA60;
  double v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)cancelTimerAndFireBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PTPInitiator *)self timerQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011A7C;
  v7[3] = &unk_10004C958;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)setDeviceIsEnumerating
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100011B58;
  v2[3] = &unk_10004CA38;
  v2[4] = self;
  [(PTPInitiator *)self startTimerWithInterval:v2 andFireBlock:0.25];
}

- (void)setDeviceFinishedEnumerating
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100011CE4;
  v2[3] = &unk_10004CA38;
  v2[4] = self;
  [(PTPInitiator *)self cancelTimerAndFireBlock:v2];
}

- (BOOL)openSession
{
  if (self->_sessionOpen) {
    return 1;
  }
  [(PTPInitiator *)self sendHostSupportsGroupNotifications];
  [(PTPInitiator *)self sendHostMediaCapabilities];
  self->_uint64_t transactionID = 0;
  id v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4098);
  id v6 = [[PTPTransaction alloc] initWithOperationRequestPacket:v5 txData:0 rxData:0 dataExpected:0];
  BOOL v7 = [(PTPInitiator *)self executeTransaction:v6 timeout:1800.0];
  id v8 = v7;
  if (v7
    && ([v7 responseCode] == 8193 || objc_msgSend(v8, "responseCode") == 8222))
  {
    self->_BOOL sessionOpen = 1;
    if (self->_deviceVendorID == 1452) {
      [(PTPInitiator *)self allowKeepAwake];
    }
  }
  BOOL sessionOpen = self->_sessionOpen;

  return sessionOpen;
}

- (BOOL)closeSession
{
  uint64_t v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:", 4099);
  id v5 = [[PTPTransaction alloc] initWithOperationRequestPacket:v4 txData:0 rxData:0 dataExpected:0];
  id v6 = [(PTPInitiator *)self executeTransaction:v5 timeout:60.0];
  BOOL v7 = v6;
  if (v6 && [v6 responseCode] == 8193)
  {
    self->_BOOL sessionOpen = 0;
    self->_uint64_t transactionID = 0;
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)storageIDs
{
  uint64_t v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:", 4100);
  id v5 = [[PTPTransaction alloc] initWithOperationRequestPacket:v4 txData:0 rxData:0 dataExpected:1];
  id v6 = [(PTPInitiator *)self executeTransaction:v5 timeout:60.0];
  BOOL v7 = [(PTPTransaction *)v5 rxDataBuffer];
  if (v6 && [v6 responseCode] == 8193 && objc_msgSend(v7, "length"))
  {
    id v10 = (unsigned int *)[v7 headerOffsetBytes];
    BOOL v8 = sub_10002ABD4(&v10, (unint64_t)[v7 length] + (void)v10);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)storageInfo:(unsigned int)a3
{
  id v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4101);
  id v6 = [[PTPTransaction alloc] initWithOperationRequestPacket:v5 txData:0 rxData:0 dataExpected:1];
  BOOL v7 = [(PTPInitiator *)self executeTransaction:v6 timeout:60.0];
  BOOL v8 = [(PTPTransaction *)v6 rxDataBuffer];
  if (v7 && [v7 responseCode] == 8193 && objc_msgSend(v8, "length"))
  {
    BOOL v9 = [PTPStorageInfoDataset alloc];
    id v10 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", [v8 headerOffsetBytes], [v8 length]);
    double v11 = [(PTPStorageInfoDataset *)v9 initWithMutableData:v10];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (BOOL)readStorages
{
  v2 = self;
  [(PTPInitiator *)self setCatalogingDone:0];
  uint64_t v3 = +[NSMutableArray array];
  [(PTPInitiator *)v2 storageIDs];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v55;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v55 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if ((unsigned __int16)[v8 longValue])
        {
          BOOL v9 = -[PTPInitiator storageForStorageID:](v2, "storageForStorageID:");

          if (!v9) {
            [v3 addObject:v8];
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v5);
  }
  id v10 = [v3 count];
  if (v10)
  {
    id v44 = v10;
    __ICOSLogCreate();
    double v11 = @"storages";
    if ((unint64_t)[@"storages" length] >= 0x15)
    {
      BOOL v12 = [@"storages" substringWithRange:0, 18];
      double v11 = [v12 stringByAppendingString:@".."];
    }
    v45 = v3;
    long long v13 = [v3 description];
    long long v14 = +[NSString stringWithFormat:@"[PTPInitiator readStorages] storageIDs: %@\n", v13];
    long long v15 = +[NSString stringWithFormat:@"%@", v14];

    unsigned __int8 v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v11;
      dispatch_semaphore_t v18 = v16;
      id v19 = [(__CFString *)v17 UTF8String];
      *(_DWORD *)buf = 136446466;
      id v60 = v19;
      __int16 v61 = 2114;
      v62 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v46 = v3;
    id v49 = [v46 countByEnumeratingWithState:&v50 objects:v58 count:16];
    uint64_t v20 = 0;
    if (v49)
    {
      uint64_t v21 = *(void *)v51;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v46);
          }
          id v23 = [*(id *)(*((void *)&v50 + 1) + 8 * (void)j) longValue];
          if ((_WORD)v23)
          {
            id v24 = [[PTPCameraStorage alloc] initWithStorageID:v23 initiator:v2];
            id v25 = [(PTPInitiator *)v2 storageInfo:v23];
            [(PTPCameraItem *)v24 setInfo:v25];

            __int16 v26 = [(PTPCameraStorage *)v24 prime];
            [(NSMutableArray *)v2->_storages addObject:v24];
            unint64_t v27 = [(PTPCameraStorage *)v24 enumerateContent:v26 withOrder:v2->_enumerationOrder];
            __ICOSLogCreate();
            v28 = @"(prime)ptpObjectCount";
            if ((unint64_t)[@"(prime)ptpObjectCount" length] >= 0x15)
            {
              v29 = [@"(prime)ptpObjectCount" substringWithRange:0, 18];
              v28 = [v29 stringByAppendingString:@".."];
            }
            v30 = +[NSString stringWithFormat:@"0x%08X:%lu", v23, [(PTPCameraStorage *)v24 ptpObjectCount]];
            v31 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v32 = v28;
              v47 = v28;
              v33 = v26;
              unint64_t v34 = v27;
              long long v35 = v2;
              uint64_t v36 = v20;
              uint64_t v37 = v21;
              v38 = v32;
              v39 = v31;
              v40 = v38;
              uint64_t v21 = v37;
              uint64_t v20 = v36;
              v2 = v35;
              unint64_t v27 = v34;
              __int16 v26 = v33;
              v28 = v47;
              id v41 = [(__CFString *)v40 UTF8String];
              *(_DWORD *)buf = 136446466;
              id v60 = v41;
              __int16 v61 = 2114;
              v62 = v30;
              _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            v20 += v27;
          }
        }
        id v49 = [v46 countByEnumeratingWithState:&v50 objects:v58 count:16];
      }
      while (v49);
    }

    [(PTPInitiator *)v2 notifyDeviceReady:v20];
    [(PTPInitiator *)v2 updateCatalogingDone];
    id v10 = v44;
    uint64_t v3 = v45;
  }
  BOOL v42 = v10 != 0;

  return v42;
}

- (id)storageForStorageID:(unsigned int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_storages;
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
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "storageID", (void)v12) == a3)
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

- (unsigned)numObjectsInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5
{
  id v6 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  uint64_t v7 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v6, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 4102);
  BOOL v8 = [[PTPTransaction alloc] initWithOperationRequestPacket:v7 txData:0 rxData:0 dataExpected:0];
  BOOL v9 = [(PTPInitiator *)self executeTransaction:v8 timeout:60.0];
  id v10 = v9;
  if (v9 && [v9 responseCode] == 8193) {
    unsigned int v11 = [v10 parameter1];
  }
  else {
    unsigned int v11 = 0;
  }

  return v11;
}

- (id)objectHandlesInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5
{
  id v6 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  uint64_t v7 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v6, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 4103);
  BOOL v8 = [[PTPTransaction alloc] initWithOperationRequestPacket:v7 txData:0 rxData:0 dataExpected:1];
  BOOL v9 = [(PTPInitiator *)self executeTransaction:v8 timeout:60.0];
  id v10 = [(PTPTransaction *)v8 rxDataBuffer];
  unsigned int v11 = v10;
  if (v9
    && [v10 length]
    && ([v9 responseCode] == 8193 || objc_msgSend(v9, "responseCode") == 8201))
  {
    long long v14 = (unsigned int *)[v11 headerOffsetBytes];
    long long v12 = sub_10002ABD4(&v14, (unint64_t)[v11 length] + (void)v14);
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (id)objectInfo:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v6 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v5, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4104);
  uint64_t v7 = [[PTPTransaction alloc] initWithOperationRequestPacket:v6 txData:0 rxData:0 dataExpected:1];
  BOOL v8 = [(PTPInitiator *)self executeTransaction:v7 timeout:60.0];
  BOOL v9 = [(PTPTransaction *)v7 rxDataBuffer];
  if (v8 && [v8 responseCode] == 8193 && objc_msgSend(v9, "length"))
  {
    id v10 = [[PTPObjectInfoDataset alloc] initWithBytes:[v9 headerOffsetBytes] length:[v9 length]];
    [(PTPObjectInfoDataset *)v10 setObjectHandle:v3];
    unsigned int v11 = [(PTPInitiator *)self initiator];
    long long v12 = [v11 deviceInfo];

    if ([v12 standardVersion] >= 0x6E)
    {
      long long v13 = [(PTPInitiator *)self initiator];
      unsigned int v14 = [v13 deviceVendorID];

      if (v14 == 1452)
      {
        if (v10) {
          [(PTPObjectInfoDataset *)v10 setObjectCompressedSize:[(PTPInitiator *)self objectCompressedSize64:[(PTPObjectInfoDataset *)v10 objectHandle]]];
        }
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (unint64_t)objectCompressedSize64:(unsigned int)a3
{
  id v4 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v5 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v4, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 36870);
  id v6 = [[PTPTransaction alloc] initWithOperationRequestPacket:v5 txData:0 rxData:0 dataExpected:1];
  uint64_t v7 = [(PTPInitiator *)self executeTransaction:v6 timeout:60.0];
  BOOL v8 = [(PTPTransaction *)v6 rxDataBuffer];
  if (v7 && [v7 responseCode] == 8193 && objc_msgSend(v8, "length"))
  {
    unsigned int v11 = [v8 headerOffsetBytes];
    unint64_t v9 = sub_10002A6A4(&v11);
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)objectInfoDatasetForObjectsInStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5 contentType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  if (v6 == 2) {
    __int16 v9 = -28667;
  }
  else {
    __int16 v9 = 0;
  }
  if (v6 == 1) {
    unsigned __int16 v10 = -28670;
  }
  else {
    unsigned __int16 v10 = v9;
  }
  unsigned int v11 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v25 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v11, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", v10);
  long long v12 = [[PTPTransaction alloc] initWithOperationRequestPacket:v25 txData:0 rxData:0 dataExpected:1];
  long long v13 = [(PTPInitiator *)self executeTransaction:v12 timeout:60.0];
  unsigned int v14 = [(PTPTransaction *)v12 rxDataBuffer];
  if (v13)
  {
    if ([v13 responseCode] == 8193)
    {
      id v15 = [v14 length];
      if (v15)
      {
        unint64_t v16 = (unint64_t)v15;
        id v17 = (unsigned int *)[v14 headerOffsetBytes];
        if (v16 >= 9)
        {
          dispatch_semaphore_t v18 = v17;
          do
          {
            unint64_t v19 = v18[1];
            BOOL v20 = v16 - 8 >= v19;
            unint64_t v16 = v16 - 8 - v19;
            if (!v20) {
              break;
            }
            uint64_t v21 = *v18;
            id v22 = [[PTPObjectInfoDataset alloc] initWithBytes:v18 length:(v19 + 8) contentType:v6];
            id v23 = v22;
            if (v22)
            {
              [(PTPObjectInfoDataset *)v22 setObjectHandle:v21];
              [v8 addObject:v23];
            }
            dispatch_semaphore_t v18 = (unsigned int *)((char *)v18 + v19 + 8);
          }
          while (v16 > 8);
        }
      }
    }
  }
  if (![v8 count])
  {

    id v8 = 0;
  }

  return v8;
}

- (id)fileSystemManifestForStorage:(unsigned int)a3 objectFormatCode:(unsigned int)a4 association:(unsigned int)a5
{
  id v6 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v7 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v8 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v7, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 4131);
  __int16 v9 = [[PTPTransaction alloc] initWithOperationRequestPacket:v8 txData:0 rxData:0 dataExpected:1];
  unsigned __int16 v10 = [(PTPInitiator *)self executeTransaction:v9 timeout:60.0];
  unsigned int v11 = [(PTPTransaction *)v9 rxDataBuffer];
  if (v10)
  {
    if ([v10 responseCode] == 8193)
    {
      uint64_t v12 = (uint64_t)[v11 length];
      if (v12 >= 1)
      {
        unint64_t v13 = v12;
        long long v56 = v9;
        long long v57 = v8;
        id v58 = v6;
        long long v54 = v11;
        unsigned int v14 = (unsigned int *)[v11 mutableBytes];
        uint64_t v15 = *v14;
        __int16 v61 = v14 + 2;
        __ICOSLogCreate();
        unint64_t v16 = @"FilesystemMaifest";
        if ((unint64_t)[@"FilesystemMaifest" length] >= 0x15)
        {
          id v17 = [@"FilesystemMaifest" substringWithRange:0, 18];
          unint64_t v16 = [v17 stringByAppendingString:@".."];
        }
        long long v55 = v10;
        dispatch_semaphore_t v18 = &CFAllocatorReallocate_ptr;
        unint64_t v19 = +[NSString stringWithFormat:@"Num Objects: %X", v15];
        BOOL v20 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = v16;
          id v22 = v20;
          *(_DWORD *)buf = 136446466;
          id v63 = [(__CFString *)v21 UTF8String];
          __int16 v64 = 2114;
          v65 = v19;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        if (v13 >= 0x11)
        {
          uint64_t v23 = v13 - 8;
          CFStringRef v24 = @"..";
          CFStringRef v25 = @"Name: %s";
          __int16 v26 = &stru_10004E2B0;
          do
          {
            sub_10002A650(&v61);
            sub_10002A650(&v61);
            sub_10002A5D4(&v61);
            sub_10002A5D4(&v61);
            sub_10002A6A4(&v61);
            sub_10002A650(&v61);
            sub_10002A5D4(&v61);
            sub_10002A650(&v61);
            sub_10002A650(&v61);
            unint64_t v27 = sub_10002A8B0((const void **)&v61);
            id v60 = [v27 length];
            __ICOSLogCreate();
            v28 = v26;
            if ((unint64_t)[(__CFString *)v26 length] >= 0x15)
            {
              v29 = -[__CFString substringWithRange:](v26, "substringWithRange:", 0, 18);
              v28 = [v29 stringByAppendingString:v24];
            }
            v30 = v18[218];
            id v59 = v27;
            v31 = [v30 stringWithFormat:v25, [v59 UTF8String]];
            v32 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              id v33 = v28;
              unint64_t v34 = v32;
              id v35 = [v33 UTF8String];
              *(_DWORD *)buf = 136446466;
              id v63 = v35;
              __int16 v64 = 2114;
              v65 = v31;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            uint64_t v36 = sub_10002A8B0((const void **)&v61);
            id v37 = [v36 length];
            __ICOSLogCreate();
            v38 = v26;
            if ((unint64_t)[(__CFString *)v26 length] >= 0x15)
            {
              v39 = -[__CFString substringWithRange:](v26, "substringWithRange:", 0, 18);
              v38 = [v39 stringByAppendingString:v24];
            }
            v40 = v18[218];
            id v41 = v36;
            BOOL v42 = [v40 stringWithFormat:@"Mod: %s", [v41 UTF8String]];
            v43 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              id v44 = v37;
              uint64_t v45 = v23;
              CFStringRef v46 = v25;
              CFStringRef v47 = v24;
              v48 = v26;
              id v49 = v38;
              long long v50 = v43;
              long long v51 = v49;
              __int16 v26 = v48;
              CFStringRef v24 = v47;
              CFStringRef v25 = v46;
              uint64_t v23 = v45;
              id v37 = v44;
              id v52 = [v51 UTF8String];
              *(_DWORD *)buf = 136446466;
              id v63 = v52;
              __int16 v64 = 2114;
              v65 = v42;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
            }
            uint64_t v23 = v23 - 2 * ((uint64_t)v60 + (void)v37) - 38;

            dispatch_semaphore_t v18 = &CFAllocatorReallocate_ptr;
          }
          while (v23 > 8);
        }
        id v8 = v57;
        id v6 = v58;
        unsigned __int16 v10 = v55;
        __int16 v9 = v56;
        unsigned int v11 = v54;
      }
    }
  }
  if (![v6 count])
  {

    id v6 = 0;
  }

  return v6;
}

- (id)objectInfoDatasetForNextObjectGroupInStorage:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  uint64_t v7 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v6, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 36879);
  id v8 = [[PTPTransaction alloc] initWithOperationRequestPacket:v7 txData:0 rxData:0 dataExpected:1];
  __int16 v9 = [(PTPInitiator *)self executeTransaction:v8 timeout:60.0];
  uint64_t v36 = [(PTPTransaction *)v8 rxDataBuffer];
  if (v9)
  {
    if ([v9 responseCode] == 8193)
    {
      id v10 = [v36 length];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = [v36 headerOffsetBytes];
        unsigned int v14 = (unsigned int *)(v12 + 1);
        uint64_t v13 = *v12;
        __ICOSLogCreate();
        uint64_t v15 = @"AssetGroup";
        if ((unint64_t)[@"AssetGroup" length] >= 0x15)
        {
          unint64_t v16 = [@"AssetGroup" substringWithRange:0, 18];
          uint64_t v15 = [v16 stringByAppendingString:@".."];
        }
        unint64_t v17 = (unint64_t)v11 - 8;
        dispatch_semaphore_t v18 = +[NSString stringWithFormat:@"Received: %llu on 0x%08X", v13, v3];
        unint64_t v19 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v20 = v15;
          uint64_t v21 = v19;
          *(_DWORD *)buf = 136446466;
          id v38 = [(__CFString *)v20 UTF8String];
          __int16 v39 = 2114;
          v40 = v18;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }
        if (v17 >= 9)
        {
          while (1)
          {
            unint64_t v22 = v14[1];
            unint64_t v23 = v17 - 8;
            BOOL v24 = v17 - 8 >= v22;
            unint64_t v17 = v17 - 8 - v22;
            if (!v24) {
              break;
            }
            uint64_t v25 = *v14;
            __int16 v26 = [[PTPObjectInfoDataset alloc] initWithBytes:v14 length:(v22 + 8) contentType:2];
            unint64_t v27 = v26;
            if (v26)
            {
              [(PTPObjectInfoDataset *)v26 setObjectHandle:v25];
              [v5 addObject:v27];
            }
            unsigned int v14 = (unsigned int *)((char *)v14 + v22 + 8);

            if (v17 <= 8) {
              goto LABEL_20;
            }
          }
          __ICOSLogCreate();
          v28 = @"objInfoFail";
          if ((unint64_t)[@"objInfoFail" length] >= 0x15)
          {
            v29 = [@"objInfoFail" substringWithRange:0, 18];
            v28 = [v29 stringByAppendingString:@".."];
          }
          v30 = +[NSString stringWithFormat:@"%lu:%u", v23, v22];
          v31 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v32 = v28;
            id v33 = v31;
            id v34 = [(__CFString *)v32 UTF8String];
            *(_DWORD *)buf = 136446466;
            id v38 = v34;
            __int16 v39 = 2114;
            v40 = v30;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
          }
        }
      }
    }
  }
LABEL_20:
  if (![v5 count])
  {

    id v5 = 0;
  }

  return v5;
}

- (id)partialDataFromFile:(id)a3 fromOffset:(unint64_t)a4 maxSize:(unint64_t)a5 actualSize:(unint64_t *)a6 useBuffer:(char *)a7
{
  id v9 = a3;
  id v10 = [(PTPInitiator *)self deviceInfo];
  id v11 = [(PTPInitiator *)self deviceInfo];
  uint64_t v12 = [v11 operationsSupported];
  uint64_t v13 = +[NSNumber numberWithUnsignedShort:36871];
  if ([v12 containsObject:v13]
    && [(PTPInitiator *)self deviceVendorID] == 1452)
  {
    unsigned int v14 = v10;

LABEL_5:
    unint64_t v18 = sub_10002161C(a5);
    unint64_t v19 = [PTPWrappedBytes alloc];
    if (a7) {
      BOOL v20 = [(PTPWrappedBytes *)v19 initWithBytes:a7 capacity:v18];
    }
    else {
      BOOL v20 = [(PTPWrappedBytes *)v19 initWithCapacity:0];
    }
    BOOL v24 = (PTPOperationRequestPacket *)v20;
    v29 = v14;
    if ([(PTPInitiator *)self copyPartialFile:v9 fromOffset:a4 size:a5 to:v20] == 8193)
    {
      id v30 = [(PTPOperationRequestPacket *)v24 length];
      *a6 = (unint64_t)v30;
      if (v30)
      {
        id v31 = [(PTPOperationRequestPacket *)v24 headerOffsetBytes];
        if (a7) {
          +[NSData dataWithBytesNoCopy:v31 length:*(unsigned int *)a6 freeWhenDone:0];
        }
        else {
        v28 = +[NSData dataWithBytes:v31 length:[(PTPOperationRequestPacket *)v24 length]];
        }
      }
      else
      {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
      *a6 = 0;
    }
    goto LABEL_21;
  }
  unsigned int v14 = v10;
  uint64_t v15 = [v10 operationsSupported];
  unint64_t v16 = +[NSNumber numberWithUnsignedShort:4123];
  unsigned int v17 = [v15 containsObject:v16];

  if (v17) {
    goto LABEL_5;
  }
  unsigned int v21 = [v9 size];
  unint64_t v22 = [PTPOperationRequestPacket alloc];
  uint64_t transactionID = self->_transactionID;
  self->_uint64_t transactionID = transactionID + 1;
  BOOL v24 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v22, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4105, transactionID, 1, [v9 objHandle]);
  uint64_t v25 = [[PTPTransaction alloc] initWithOperationRequestPacket:v24 txData:0 rxData:0 dataExpected:1];
  __int16 v26 = [(PTPInitiator *)self executeTransaction:v25 timeout:60.0];
  unint64_t v27 = [(PTPTransaction *)v25 rxDataBuffer];
  if (v26 && [v26 responseCode] == 8193 && objc_msgSend(v27, "length") == (id)v21)
  {
    memcpy(a7 + 12, (char *)[v27 headerOffsetBytes] + a4, a5);
    *a6 = a5;
  }

  v28 = 0;
  v29 = v14;
LABEL_21:

  return v28;
}

- (unsigned)copyPartialFile:(id)a3 fromOffset:(unint64_t)a4 size:(unint64_t)a5 to:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [(PTPInitiator *)self deviceInfo];
  if ([v12 standardVersion] < 0x6E)
  {
  }
  else
  {
    unsigned int v13 = [(PTPInitiator *)self deviceVendorID];

    if (v13 == 1452)
    {
      unsigned int v14 = [PTPOperationRequestPacket alloc];
      uint64_t transactionID = self->_transactionID;
      self->_uint64_t transactionID = transactionID + 1;
      unint64_t v16 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:parameter4:parameter5:](v14, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:parameter4:parameter5:", 36871, transactionID, 1, [v10 objHandle], a4, HIDWORD(a4), a5);
      goto LABEL_6;
    }
  }
  unsigned int v17 = [PTPOperationRequestPacket alloc];
  uint64_t v18 = self->_transactionID;
  self->_uint64_t transactionID = v18 + 1;
  unint64_t v16 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:](v17, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:parameter3:", 4123, v18, 1, [v10 objHandle], a4, a5);
LABEL_6:
  unint64_t v19 = v16;
  BOOL v20 = [[PTPTransaction alloc] initWithOperationRequestPacket:v16 txData:0 rxData:v11 dataExpected:1];
  unsigned int v21 = [(PTPInitiator *)self executeTransaction:v20 timeout:60.0];
  unint64_t v22 = v21;
  if (v21) {
    unsigned __int16 v23 = (unsigned __int16)[v21 responseCode];
  }
  else {
    unsigned __int16 v23 = 8194;
  }

  return v23;
}

- (id)thumbDataFromFile:(id)a3 maxSize:(unsigned int)a4 actualSize:(unsigned int *)a5 useBuffer:(char *)a6
{
  id v8 = a3;
  id v9 = [v8 info];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 thumbCompressedSize])
  {
    id v10 = [PTPOperationRequestPacket alloc];
    uint64_t transactionID = self->_transactionID;
    self->_uint64_t transactionID = transactionID + 1;
    uint64_t v12 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v10, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4106, transactionID, 1, [v8 objHandle]);
    unsigned int v13 = [[PTPTransaction alloc] initWithOperationRequestPacket:v12 txData:0 rxData:0 dataExpected:1];
    unsigned int v14 = [(PTPInitiator *)self executeTransaction:v13 timeout:60.0];
    uint64_t v15 = [(PTPTransaction *)v13 rxDataBuffer];
    if (v14 && [v14 responseCode] == 8193)
    {
      unsigned int v16 = [v15 length];
      *a5 = v16;
      if (v16)
      {
        unsigned int v17 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v15 headerOffsetBytes], [v15 length]);
      }
      else
      {
        unsigned int v17 = 0;
      }
    }
    else
    {
      unsigned int v17 = 0;
      *a5 = 0;
    }
  }
  else
  {
    unsigned int v17 = 0;
  }

  return v17;
}

- (id)thumbDataFromFile:(id)a3 maxPixelSize:(unsigned int)a4 actualSize:(unsigned int *)a5 useBuffer:(char *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = [v10 info];
  uint64_t v12 = [(PTPInitiator *)self deviceInfo];
  unsigned int v13 = [v12 operationsSupported];
  unsigned int v14 = +[NSNumber numberWithUnsignedShort:36876];
  if (![v13 containsObject:v14])
  {

    goto LABEL_8;
  }
  int deviceVendorID = self->_deviceVendorID;

  if (deviceVendorID != 1452)
  {
LABEL_8:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 thumbCompressedSize])
    {
      if (v8 > 0xA0) {
        [v10 altThumbnaillForMaxPixelSize:v8];
      }
      else {
      unsigned __int16 v23 = [(PTPInitiator *)self thumbDataFromFile:v10 maxSize:5242880 actualSize:a5 useBuffer:a6];
      }
      uint64_t v18 = 0;
      BOOL v20 = 0;
      unsigned int v21 = 0;
    }
    else
    {
      uint64_t v18 = 0;
      BOOL v20 = 0;
      unsigned int v21 = 0;
      unsigned __int16 v23 = 0;
    }
    goto LABEL_17;
  }
  unsigned int v16 = [PTPOperationRequestPacket alloc];
  uint64_t transactionID = self->_transactionID;
  self->_uint64_t transactionID = transactionID + 1;
  uint64_t v18 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:](v16, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:", 36876, transactionID, 1, [v10 objHandle], v8);
  unint64_t v19 = [[PTPTransaction alloc] initWithOperationRequestPacket:v18 txData:0 rxData:0 dataExpected:1];
  BOOL v20 = [(PTPInitiator *)self executeTransaction:v19 timeout:60.0];
  unsigned int v21 = [(PTPTransaction *)v19 rxDataBuffer];
  if (v20 && [v20 responseCode] == 8193)
  {
    unsigned int v22 = [v21 length];
    *a5 = v22;
    if (v22)
    {
      unsigned __int16 v23 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v21 headerOffsetBytes], [v21 length]);
    }
    else
    {
      unsigned __int16 v23 = 0;
    }
  }
  else
  {
    unsigned __int16 v23 = 0;
    *a5 = 0;
  }

LABEL_17:
  id v24 = v23;

  return v24;
}

- (id)metadataFromFile:(id)a3
{
  id v4 = a3;
  id v5 = [PTPOperationRequestPacket alloc];
  uint64_t transactionID = self->_transactionID;
  self->_uint64_t transactionID = transactionID + 1;
  id v7 = [v4 objHandle];

  uint64_t v8 = [(PTPOperationRequestPacket *)v5 initWithOperationCode:36873 transactionID:transactionID dataPhaseInfo:1 parameter1:v7];
  id v9 = [[PTPTransaction alloc] initWithOperationRequestPacket:v8 txData:0 rxData:0 dataExpected:1];
  id v10 = [(PTPInitiator *)self executeTransaction:v9 timeout:60.0];
  id v11 = [(PTPTransaction *)v9 rxDataBuffer];
  if (v10 && [v10 responseCode] == 8193 && objc_msgSend(v11, "length"))
  {
    uint64_t v12 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v11 headerOffsetBytes], [v11 length]);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)initiateCapture
{
  uint64_t v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:parameter2:", 4110);
  id v5 = [[PTPTransaction alloc] initWithOperationRequestPacket:v4 txData:0 rxData:0 dataExpected:0];
  id v6 = [(PTPInitiator *)self executeTransaction:v5 timeout:60.0];
  id v7 = v6;
  if (v6) {
    BOOL v8 = [v6 responseCode] == 8193;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)deleteFile:(id)a3
{
  id v4 = a3;
  id v5 = [(PTPInitiator *)self deviceInfo];
  id v6 = [v5 operationsSupported];
  id v7 = +[NSNumber numberWithUnsignedShort:4107];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    id v9 = [PTPOperationRequestPacket alloc];
    uint64_t transactionID = self->_transactionID;
    self->_uint64_t transactionID = transactionID + 1;
    id v11 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v9, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4107, transactionID, 1, [v4 objHandle]);
    uint64_t v12 = [[PTPTransaction alloc] initWithOperationRequestPacket:v11 txData:0 rxData:0 dataExpected:0];
    unsigned int v13 = [(PTPInitiator *)self executeTransaction:v12 timeout:60.0];
    unsigned int v14 = v13;
    if (v13 && [v13 responseCode] == 8193)
    {
      uint64_t v15 = -[PTPInitiator storageForStorageID:](self, "storageForStorageID:", [v4 storageID]);
      if (v15) {
        [v15 removeCameraFileFromIndex:[v4 objHandle]];
      }

      BOOL v16 = 1;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)deviceDateTime
{
  uint64_t v3 = [(PTPInitiator *)self deviceInfo];
  id v4 = [v3 devicePropertiesSupported];
  id v5 = +[NSNumber numberWithUnsignedShort:20497];
  unsigned int v6 = [v4 containsObject:v5];

  if (v6)
  {
    id v7 = [PTPOperationRequestPacket alloc];
    ++self->_transactionID;
    unsigned int v8 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v7, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 4117);
    id v9 = [[PTPTransaction alloc] initWithOperationRequestPacket:v8 txData:0 rxData:0 dataExpected:1];
    id v10 = [(PTPInitiator *)self executeTransaction:v9 timeout:60.0];
    id v11 = [(PTPTransaction *)v9 rxDataBuffer];
    if (v10 && [v10 responseCode] == 8193 && objc_msgSend(v11, "length"))
    {
      id v21 = [v11 headerOffsetBytes];
      uint64_t v12 = sub_10002A6B8((const void **)&v21);
      if (v12)
      {
        id v13 = objc_alloc_init((Class)NSDateFormatter);
        [v13 setDateFormat:@"yyyyMMdd'T'HHmmss"];
        uint64_t v19 = 0;
        uint64_t v20 = 0;
        uint64_t v18 = 0;
        id v14 = v12;
        sscanf((const char *)[v14 UTF8String], "%04d%02d%02dT%02d%02d%02d", (char *)&v20 + 4, &v20, (char *)&v19 + 4, &v19, (char *)&v18 + 4, &v18);
        if ((unint64_t)[v14 length] < 0x10)
        {
          BOOL v16 = [v13 dateFromString:v14];
        }
        else
        {
          uint64_t v15 = [v14 substringToIndex:15];
          BOOL v16 = [v13 dateFromString:v15];
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (double)timeOffset
{
  v2 = [(PTPInitiator *)self deviceDateTime];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)setDeviceDateTime:(id)a3
{
  id v4 = a3;
  double v5 = [(PTPInitiator *)self deviceInfo];
  unsigned int v6 = [v5 devicePropertiesSupported];
  id v7 = +[NSNumber numberWithUnsignedShort:20497];
  unsigned int v8 = [v6 containsObject:v7];

  if (v8)
  {
    if (v4)
    {
      id v9 = v4;
    }
    else
    {
      id v9 = +[NSDate date];
    }
    id v11 = v9;
    uint64_t v12 = malloc_type_malloc(0x40uLL, 0xF293BE13uLL);
    uint64_t v18 = v12;
    id v13 = objc_alloc_init((Class)NSDateFormatter);
    [v13 setDateFormat:@"yyyyMMdd'T'HHmmss"];
    id v14 = [v13 stringFromDate:v11];
    sub_10002A7C0(&v18, v14);
    id v15 = objc_alloc((Class)NSData);
    id v16 = [v15 initWithBytesNoCopy:v12 length:v18 - v12 freeWhenDone:0];
    BOOL v10 = [(PTPInitiator *)self setDevicePropertyValue:v16 forProperty:20497];
    free(v12);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)sendPTPCommand:(id)a3 andPayload:(id)a4 withReply:(id)a5
{
  id v25 = a4;
  unsigned int v8 = (void (**)(id, void *))a5;
  id v9 = a3;
  BOOL v10 = [(PTPInitiator *)self delegate];
  [v10 holdPowerAssertion];

  id v11 = +[NSMutableDictionary dictionary];
  uint64_t v12 = [PTPOperationRequestPacket alloc];
  id v13 = v9;
  id v14 = [v13 bytes];

  id v15 = [(PTPOperationRequestPacket *)v12 initWithUSBBuffer:v14];
  id v16 = [v25 length];
  uint64_t transactionID = self->_transactionID;
  if (v16)
  {
    [(PTPOperationRequestPacket *)v15 setTransactionID:transactionID];
    [(PTPOperationRequestPacket *)v15 setDataPhaseInfo:2];
    uint64_t v18 = [[PTPDataPacket alloc] initWithOperationCode:[(PTPOperationRequestPacket *)v15 operationCode] transactionID:self->_transactionID andData:v25];
    uint64_t v19 = [[PTPTransaction alloc] initWithOperationRequestPacket:v15 txData:v18 rxData:0 dataExpected:0];
    uint64_t v20 = [(PTPInitiator *)self executeTransaction:v19 timeout:60.0];
    ++self->_transactionID;
  }
  else
  {
    self->_uint64_t transactionID = transactionID + 1;
    -[PTPOperationRequestPacket setTransactionID:](v15, "setTransactionID:");
    [(PTPOperationRequestPacket *)v15 setDataPhaseInfo:1];
    uint64_t v19 = [[PTPTransaction alloc] initWithOperationRequestPacket:v15 txData:0 rxData:0 dataExpected:1];
    uint64_t v20 = [(PTPInitiator *)self executeTransaction:v19 timeout:60.0];
    uint64_t v18 = [(PTPTransaction *)v19 rxDataBuffer];
    if (v20 && [v20 responseCode] == 8193 && -[PTPDataPacket length](v18, "length"))
    {
      id v24 = +[NSData dataWithBytes:[(PTPDataPacket *)v18 headerOffsetBytes] length:[(PTPDataPacket *)v18 length]];
      [v11 setObject:v24 forKey:@"ICPTPDataInBuffer"];
    }
  }

  if (v20)
  {
    id v21 = [v20 contentForUSB];
    unsigned int v22 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v21 bytes], [v21 length]);
    [v11 setObject:v22 forKey:@"ICPTPResponseBuffer"];
  }
  v8[2](v8, v11);
  unsigned __int16 v23 = [(PTPInitiator *)self delegate];
  [v23 releasePowerAssertion];
}

- (unsigned)deviceStatus
{
  return [(PTPHostUSBTransport *)self->_transport deviceStatus];
}

- (void)deviceReset
{
}

- (BOOL)isAccessRestrictedAppleDevice
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if ([(PTPInitiator *)self deviceVendorID] != 1452) {
    goto LABEL_6;
  }
  if (!self->_sessionOpen)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    double v5 = [(PTPInitiator *)self delegate];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014EB0;
    v12[3] = &unk_10004CA88;
    v12[4] = self;
    id v14 = &v15;
    unsigned int v6 = v4;
    id v13 = v6;
    id v7 = +[NSBlockOperation blockOperationWithBlock:v12];
    [v5 addInteractiveOperation:v7];

    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v8);

LABEL_6:
    id v9 = v16;
    goto LABEL_9;
  }
  BOOL v3 = self->_deviceIsPasscodeLocked || !self->_deviceIsPairedWithThisHost;
  id v9 = v16;
  *((unsigned char *)v16 + 24) = v3;
LABEL_9:
  char v10 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v15, 8);
  return v10;
}

- (BOOL)containsAccessRestrictedAppleDeviceStorage
{
  v2 = [(PTPInitiator *)self storageForStorageID:4277009102];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isAppleDevice
{
  return [(PTPInitiator *)self deviceVendorID] == 1452;
}

- (BOOL)prioritizeSpeed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned __int8 v3 = [WeakRetained prioritizeSpeed];

  return v3;
}

- (void)updateCatalogingDone
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned __int8 v3 = self->_storages;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v7), "catalogingDone", (void)v9))
        {
          uint64_t v8 = 0;
          goto LABEL_11;
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 1;
LABEL_11:

  [(PTPInitiator *)self setCatalogingDone:v8];
}

- (void)notifyDeviceReady:(unint64_t)a3
{
  if (a3) {
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  }
  else {
  id v4 = +[NSNumber numberWithUnsignedInt:[(PTPInitiator *)self preflightCount]];
  }
  v19[0] = @"ICDeviceStatus";
  v19[1] = @"ICANumberOfPreflightObjectsKey";
  v20[0] = @"ICDeviceIsReady";
  v20[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  uint64_t v6 = [(PTPInitiator *)self delegate];
  id v7 = [(PTPInitiator *)self delegate];
  uint64_t v8 = [v7 allConnections];
  [v6 sendStatusNotification:v5 toConnections:v8];

  __ICOSLogCreate();
  long long v9 = @"notifyDeviceReady";
  if ((unint64_t)[@"notifyDeviceReady" length] >= 0x15)
  {
    long long v10 = [@"notifyDeviceReady" substringWithRange:0, 18];
    long long v9 = [v10 stringByAppendingString:@".."];
  }
  long long v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d Preflighted", [v4 intValue]);
  long long v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v9;
    id v14 = v12;
    *(_DWORD *)buf = 136446466;
    id v16 = [(__CFString *)v13 UTF8String];
    __int16 v17 = 2114;
    char v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (void)sendContentsNotificationWithOrder:(int64_t)a3 toConnections:(id)a4
{
  id v6 = a4;
  id v7 = [(PTPInitiator *)self delegate];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015AD0;
  v10[3] = &unk_10004CAB0;
  v10[4] = self;
  id v11 = v6;
  int64_t v12 = a3;
  id v8 = v6;
  long long v9 = +[NSBlockOperation blockOperationWithBlock:v10];
  [v7 addInteractiveOperation:v9];
}

- (unsigned)ptpObjectCount
{
  id v2 = [(NSMutableArray *)self->_storages copy];
  LODWORD(v3) = [v2 count];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v2;
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
        unsigned __int8 v3 = (char *)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "ptpObjectCount", (void)v10)
           + v3;
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (unsigned)preflightCount
{
  id v2 = [(NSMutableArray *)self->_storages copy];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v2;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    LODWORD(v6) = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        id v6 = (char *)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "ptpObjectCount", (void)v10)
           + v6;
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LODWORD(v6) = 0;
  }

  return v6;
}

- (BOOL)sendHostSupportsGroupNotifications
{
  id v3 = [(PTPInitiator *)self deviceInfo];
  id v4 = [v3 operationsSupported];
  id v5 = +[NSNumber numberWithUnsignedShort:36880];
  if (![v4 containsObject:v5])
  {

    return 0;
  }
  unsigned int v6 = [(PTPInitiator *)self deviceVendorID];

  if (v6 != 1452) {
    return 0;
  }
  if (self->_sessionOpen)
  {
    uint64_t transactionID = self->_transactionID;
    self->_uint64_t transactionID = transactionID + 1;
  }
  else
  {
    uint64_t transactionID = 0;
  }
  long long v9 = [[PTPOperationRequestPacket alloc] initWithOperationCode:36880 transactionID:transactionID dataPhaseInfo:1];
  long long v10 = [[PTPTransaction alloc] initWithOperationRequestPacket:v9 txData:0 rxData:0 dataExpected:0];
  long long v11 = [(PTPInitiator *)self executeTransaction:v10 timeout:60.0];
  long long v12 = v11;
  if (v11 && [v11 responseCode] == 8193)
  {
    __ICOSLogCreate();
    long long v13 = @"PTPCaps";
    if ((unint64_t)[@"PTPCaps" length] >= 0x15)
    {
      id v14 = [[@"PTPCaps" substringWithRange:0, 18];
      long long v13 = [v14 stringByAppendingString:@".."];
    }
    uint64_t v15 = +[NSString stringWithFormat:@"Host Requested Groups Sent"];
    id v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = v13;
      char v18 = v16;
      int v20 = 136446466;
      id v21 = [(__CFString *)v17 UTF8String];
      __int16 v22 = 2114;
      unsigned __int16 v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v20, 0x16u);
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)sendHostMediaCapabilities
{
  id v3 = [(PTPInitiator *)self deviceInfo];
  id v4 = [v3 operationsSupported];
  id v5 = +[NSNumber numberWithUnsignedShort:36875];
  if (![v4 containsObject:v5])
  {

    return 0;
  }
  unsigned int v6 = [(PTPInitiator *)self deviceVendorID];

  if (v6 != 1452) {
    return 0;
  }
  uint64_t v36 = PFMediaCapabilitiesOptionsSortSourceEnumerationAscending;
  uint64_t v7 = +[NSNumber numberWithBool:[(PTPInitiator *)self orderAscending]];
  id v37 = v7;
  BOOL v8 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  long long v9 = +[PFMediaCapabilities capabilitiesForCurrentDeviceWithOptions:v8];

  long long v10 = [v9 opaqueRepresentation];
  if (v10)
  {
    if (self->_sessionOpen)
    {
      uint64_t transactionID = self->_transactionID;
      self->_uint64_t transactionID = transactionID + 1;
    }
    else
    {
      uint64_t transactionID = 0;
    }
    long long v13 = [[PTPOperationRequestPacket alloc] initWithOperationCode:36875 transactionID:transactionID dataPhaseInfo:2];
    __ICOSLogCreate();
    id v14 = @"Capabilities";
    if ((unint64_t)[@"Capabilities" length] >= 0x15)
    {
      uint64_t v15 = [@"Capabilities" substringWithRange:0, 18];
      id v14 = [v15 stringByAppendingString:@".."];
    }
    id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Sending Host Capabilities: [%lu]", (int)[v10 length]);
    __int16 v17 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      char v18 = v14;
      uint64_t v19 = v17;
      *(_DWORD *)buf = 136446466;
      id v33 = [(__CFString *)v18 UTF8String];
      __int16 v34 = 2114;
      id v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    int v20 = [[PTPDataPacket alloc] initWithOperationCode:36875 transactionID:transactionID andData:v10];
    id v21 = [[PTPTransaction alloc] initWithOperationRequestPacket:v13 txData:v20 rxData:0 dataExpected:0];
    __int16 v22 = [(PTPInitiator *)self executeTransaction:v21 timeout:60.0];
    unsigned __int16 v23 = v22;
    if (v22 && [v22 responseCode] == 8193)
    {
      __ICOSLogCreate();
      id v24 = @"Capabilities";
      if ((unint64_t)[@"Capabilities" length] >= 0x15)
      {
        id v25 = [@"Capabilities" substringWithRange:0, 18];
        id v24 = [v25 stringByAppendingString:@".."];
      }
      __int16 v26 = +[NSString stringWithFormat:@"Capabilities Sent"];
      unint64_t v27 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v28 = v24;
        v29 = v27;
        id v30 = [(__CFString *)v28 UTF8String];
        *(_DWORD *)buf = 136446466;
        id v33 = v30;
        __int16 v34 = 2114;
        id v35 = v26;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)allowKeepAwake
{
  if (self->_deviceVendorID != 1452) {
    return 0;
  }
  id v3 = [PTPOperationRequestPacket alloc];
  ++self->_transactionID;
  id v4 = -[PTPOperationRequestPacket initWithOperationCode:transactionID:dataPhaseInfo:parameter1:](v3, "initWithOperationCode:transactionID:dataPhaseInfo:parameter1:", 36868);
  id v5 = [[PTPTransaction alloc] initWithOperationRequestPacket:v4 txData:0 rxData:0 dataExpected:0];
  unsigned int v6 = [(PTPInitiator *)self executeTransaction:v5 timeout:60.0];
  uint64_t v7 = v6;
  if (v6) {
    BOOL v8 = [v6 responseCode] == 8193;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (ICCameraDeviceNotificationProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICCameraDeviceNotificationProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PTPHostUSBTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void)setDeviceInfo:(id)a3
{
}

- (unint64_t)icplState
{
  return self->_icplState;
}

- (void)setIcplState:(unint64_t)a3
{
  self->_icplState = a3;
}

- (unint64_t)icplOptimizeStorageState
{
  return self->_icplOptimizeStorageState;
}

- (void)setIcplOptimizeStorageState:(unint64_t)a3
{
  self->_icplOptimizeStorageState = a3;
}

- (unsigned)deviceVendorID
{
  return self->_deviceVendorID;
}

- (void)setDeviceVendorID:(unsigned __int16)a3
{
  self->_int deviceVendorID = a3;
}

- (unsigned)deviceProductID
{
  return self->_deviceProductID;
}

- (void)setDeviceProductID:(unsigned __int16)a3
{
  self->_deviceProductID = a3;
}

- (void)setAppleSerialNumberString:(id)a3
{
}

- (NSString)deviceSerialNumberString
{
  return self->_deviceSerialNumberString;
}

- (void)setDeviceSerialNumberString:(id)a3
{
}

- (NSString)userAssignedDeviceName
{
  return self->_userAssignedDeviceName;
}

- (void)setUserAssignedDeviceName:(id)a3
{
}

- (BOOL)deviceIsEnumerating
{
  return self->_deviceIsEnumerating;
}

- (void)setDeviceIsEnumerating:(BOOL)a3
{
  self->_deviceIsEnumerating = a3;
}

- (BOOL)requestPending
{
  return self->_requestPending;
}

- (void)setRequestPending:(BOOL)a3
{
  self->_requestPending = a3;
}

- (BOOL)deviceIsPairedWithThisHost
{
  return self->_deviceIsPairedWithThisHost;
}

- (void)setDeviceIsPairedWithThisHost:(BOOL)a3
{
  self->_deviceIsPairedWithThisHost = a3;
}

- (BOOL)deviceIsPasscodeLocked
{
  return self->_deviceIsPasscodeLocked;
}

- (void)setDeviceIsPasscodeLocked:(BOOL)a3
{
  self->_deviceIsPasscodeLocked = a3;
}

- (BOOL)orderAscending
{
  return self->_orderAscending;
}

- (void)setOrderAscending:(BOOL)a3
{
  self->_orderAscending = a3;
}

- (BOOL)sessionOpen
{
  return self->_sessionOpen;
}

- (void)setSessionOpen:(BOOL)a3
{
  self->_BOOL sessionOpen = a3;
}

- (BOOL)needToReopenSession
{
  return self->_needToReopenSession;
}

- (void)setNeedToReopenSession:(BOOL)a3
{
  self->_needToReopenSession = a3;
}

- (unsigned)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unsigned int)a3
{
  self->_uint64_t transactionID = a3;
}

- (BOOL)cancelOp
{
  return self->_cancelOp;
}

- (void)setCancelOp:(BOOL)a3
{
  self->_cancelOp = a3;
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (NSMutableArray)storages
{
  return self->_storages;
}

- (void)setStorages:(id)a3
{
}

- (int64_t)enumerationOrder
{
  return self->_enumerationOrder;
}

- (void)setEnumerationOrder:(int64_t)a3
{
  self->_enumerationOrder = a3;
}

- (unsigned)enumeratedCount
{
  return self->_enumeratedCount;
}

- (void)setEnumeratedCount:(unsigned int)a3
{
  self->_enumeratedCount = a3;
}

- (BOOL)catalogingDone
{
  return self->_catalogingDone;
}

- (void)setCatalogingDone:(BOOL)a3
{
  self->_catalogingDone = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
}

- (NSMutableDictionary)mobdevProperties
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMobdevProperties:(id)a3
{
}

- (OS_dispatch_queue)mobdevPropertiesQueue
{
  return self->_mobdevPropertiesQueue;
}

- (void)setMobdevPropertiesQueue:(id)a3
{
}

- (os_unfair_lock_s)mobdevPropertiesLock
{
  return self->_mobdevPropertiesLock;
}

- (void)setMobdevPropertiesLock:(os_unfair_lock_s)a3
{
  self->_mobdevPropertiesLock = a3;
}

- (OS_remote_device_browser)mobdevPropertiesBrowser
{
  return self->_mobdevPropertiesBrowser;
}

- (void)setMobdevPropertiesBrowser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobdevPropertiesBrowser, 0);
  objc_storeStrong((id *)&self->_mobdevPropertiesQueue, 0);
  objc_storeStrong((id *)&self->_mobdevProperties, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_storages, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_userAssignedDeviceName, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumberString, 0);
  objc_storeStrong((id *)&self->_appleSerialNumberString, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_transport, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end