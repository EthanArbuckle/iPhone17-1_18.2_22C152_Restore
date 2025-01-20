@interface PTPResponder
+ (void)catalogPath:(char *)a3 dirs:(int *)a4 media:(int *)a5 nonMedia:(int *)a6;
+ (void)getFilesystemMediaCountForDirectories:(int *)a3 media:(int *)a4 nonMedia:(int *)a5;
- (BOOL)handleSetHostMediaCapabilities:(id)a3;
- (BOOL)handleSetHostSupportedFormats:(id)a3;
- (BOOL)handleSetHostSupportsGroups:(id)a3;
- (BOOL)hostSupportsGroups;
- (BOOL)start;
- (BOOL)usingPeerMediaCapabilities;
- (NSString)guid;
- (NSString)name;
- (NSString)path;
- (OS_dispatch_queue)photoLibraryMediaQueryQueue;
- (PTPDeviceUSBTransport)transport;
- (PTPEventPacket)event;
- (PTPOperationRequestPacket)operationRequest;
- (PTPOperationResponsePacket)response;
- (PTPResponder)init;
- (PTPResponder)initWithName:(id)a3 path:(id)a4 andTransportType:(unsigned __int16)a5;
- (PTPVirtualCamera)virtualCamera;
- (id)delegate;
- (id)handleRequest:(id)a3;
- (id)usingLegacyOS;
- (id)usingMTP;
- (id)usingMacOS;
- (unsigned)canceledTransactionID;
- (unsigned)lastTransactionID;
- (unsigned)sessionID;
- (void)allowKeepAwake:(id)a3;
- (void)closeSession:(id)a3;
- (void)dealloc;
- (void)deleteObject:(id)a3;
- (void)getDeviceInfo:(id)a3;
- (void)getDevicePropDesc:(id)a3;
- (void)getDevicePropValue:(id)a3;
- (void)getNumDownloadableObjects:(id)a3;
- (void)getNumObjects:(id)a3;
- (void)getObject:(id)a3;
- (void)getObjectCompressedSize64:(id)a3;
- (void)getObjectHandles:(id)a3;
- (void)getObjectInfo:(id)a3;
- (void)getObjectInfoForNextObjectGroupInStorage:(id)a3;
- (void)getObjectInfoForObjectsInStorage:(id)a3;
- (void)getObjectMetadata:(id)a3;
- (void)getObjectPropDesc:(id)a3;
- (void)getObjectPropList:(id)a3;
- (void)getObjectPropValue:(id)a3;
- (void)getObjectPropsSupported:(id)a3;
- (void)getPartialObject64:(id)a3;
- (void)getPartialObject:(id)a3;
- (void)getStorageIDs:(id)a3;
- (void)getStorageInfo:(id)a3;
- (void)getThumb:(id)a3;
- (void)getUserAssignedDeviceName:(id)a3;
- (void)handleCancel:(id)a3;
- (void)handleData:(id)a3;
- (void)handleDeviceRemoval;
- (void)handleResetDevice:(id)a3;
- (void)handleUnsupportedRequest:(id)a3;
- (void)holdPowerAssertion;
- (void)openSession:(id)a3;
- (void)releasePowerAssertion;
- (void)removeVirtualCamera;
- (void)reportGroupAddedInStorage:(id)a3;
- (void)reportObjectAdded:(id)a3;
- (void)reportObjectDeleted:(id)a3;
- (void)reportStorageAdded:(id)a3;
- (void)reportStorageDeleted:(id)a3;
- (void)reportUserAssignedNameChange;
- (void)resetResponderSession;
- (void)resetUsingMTP;
- (void)runRunLoop;
- (void)sendEvent:(id)a3;
- (void)sendEventDeviceUnlocked;
- (void)sendRestartSessionEvent;
- (void)sentData:(id)a3 responseCode:(id)a4;
- (void)setCanceledTransactionID:(unsigned int)a3;
- (void)setDelegate:(id)a3;
- (void)setEvent:(id)a3;
- (void)setGuid:(id)a3;
- (void)setHostSupportsGroups:(BOOL)a3;
- (void)setLastTransactionID:(unsigned int)a3;
- (void)setName:(id)a3;
- (void)setOperationRequest:(id)a3;
- (void)setPath:(id)a3;
- (void)setPhotoLibraryMediaQueryQueue:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSessionID:(unsigned int)a3;
- (void)setTransport:(id)a3;
- (void)setUsingLegacyOS:(BOOL)a3;
- (void)setUsingMTP:(id)a3;
- (void)setUsingMacOS:(BOOL)a3;
- (void)setUsingPeerMediaCapabilities:(BOOL)a3;
- (void)setUsingWindows;
- (void)setVirtualCamera:(id)a3;
- (void)stop;
- (void)stopRunLoop;
- (void)transportActivated;
@end

@implementation PTPResponder

- (void)runRunLoop
{
  self->_keepRunningRunLoop = 1;
  while (self->_keepRunningRunLoop)
  {
    if ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 5.0, 0) - 1) <= 1)
    {
      __ICOSLogCreate();
      v3 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        v4 = [&stru_100048E60 substringWithRange:0, 18];
        v3 = [v4 stringByAppendingString:@".."];
      }
      v5 = +[NSString stringWithFormat:@"ptpResponder->runRunLoop has stopped\n"];
      v6 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v3;
        v8 = v6;
        int v9 = 136446466;
        id v10 = [(__CFString *)v7 UTF8String];
        __int16 v11 = 2114;
        v12 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
      }
      return;
    }
  }
}

- (PTPResponder)init
{
  return [(PTPResponder *)self initWithName:@"<undefined>" path:@"<undefined>" andTransportType:0];
}

- (PTPResponder)initWithName:(id)a3 path:(id)a4 andTransportType:(unsigned __int16)a5
{
  int v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PTPResponder;
  id v10 = [(PTPResponder *)&v30 init];
  if (v10)
  {
    CFUUIDRef v11 = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef v12 = CFUUIDCreateString(kCFAllocatorDefault, v11);
    guid = v10->_guid;
    v10->_guid = &v12->isa;

    CFRelease(v11);
    v14 = (NSString *)[objc_alloc((Class)NSString) initWithString:v8];
    name = v10->_name;
    v10->_name = v14;

    v16 = (NSString *)[objc_alloc((Class)NSString) initWithString:v9];
    path = v10->_path;
    v10->_path = v16;

    v10->_allowKeepAwake = 0;
    v10->_powerAssertionReleaseDelay = 1200.0;
    if (v5 == 1)
    {
      v18 = [[PTPDeviceUSBTransport alloc] initWithDelegate:v10];
      transport = v10->_transport;
      v10->_transport = v18;
    }
    if (v10->_transport)
    {
      dispatch_queue_t v20 = dispatch_queue_create("APTP Operation Queue", 0);
      photoLibraryMediaQueryQueue = v10->_photoLibraryMediaQueryQueue;
      v10->_photoLibraryMediaQueryQueue = (OS_dispatch_queue *)v20;
    }
    else
    {
      photoLibraryMediaQueryQueue = v10;
      id v10 = 0;
    }
  }
  __ICOSLogCreate();
  v22 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v23 = [&stru_100048E60 substringWithRange:0, 18];
    v22 = [v23 stringByAppendingString:@".."];
  }
  v24 = +[NSString stringWithFormat:@"USB Transport %p\n", v10];
  v25 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v22;
    v27 = v25;
    id v28 = [(__CFString *)v26 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v32 = v28;
    __int16 v33 = 2114;
    v34 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  return v10;
}

- (void)dealloc
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self->_transport];
  [(PTPResponder *)self removeVirtualCamera];
  [(PTPResponder *)self releasePowerAssertion];
  [(PTPDeviceUSBTransport *)self->_transport setDelegate:0];
  [(PTPDeviceUSBTransport *)self->_transport abortPendingIO];
  v3.receiver = self;
  v3.super_class = (Class)PTPResponder;
  [(PTPResponder *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
}

- (void)openSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  unsigned int v6 = [v4 parameter1];

  if (v5 || !v6)
  {
    v7 = [[PTPOperationResponsePacket alloc] initWithResponseCode:8221 transactionID:v5];
  }
  else
  {
    if (self->_sessionID)
    {
      v7 = [[PTPOperationResponsePacket alloc] initWithResponseCode:8222 transactionID:0 parameter1:self->_sessionID];
    }
    else
    {
      self->_sessionID = v6;
      v7 = [[PTPOperationResponsePacket alloc] initWithResponseCode:8193 transactionID:0];
      [(PTPVirtualCamera *)self->_virtualCamera openSession];
    }
    self->_lastTransactionID = 0;
  }
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v7];
  if (![(PTPResponder *)self usingPeerMediaCapabilities])
  {
    id v8 = [(PTPResponder *)self usingMTP];

    if (!v8)
    {
      id v9 = sub_10000B5F8();
      v11[0] = PLPTPHostCharacteristicsKeyMake;
      v11[1] = PLPTPHostCharacteristicsKeyOS;
      v12[0] = PLPTPHostCharacteristicMake_Microsoft;
      v12[1] = PLPTPHostCharacteristicOS_Windows;
      v11[2] = PLPTPHostCharacteristicsKeyTransport;
      v12[2] = PLPTPHostCharacteristicTransport_PTP;
      id v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
      [v9 setHostCharacteristics:v10];
    }
  }
}

- (void)closeSession:(id)a3
{
  id v4 = [a3 transactionID];
  id v5 = v4;
  if (!self->_sessionID) {
    goto LABEL_4;
  }
  if (v4 > self->_lastTransactionID)
  {
    [(PTPVirtualCamera *)self->_virtualCamera closeSession];
    self->_lastTransactionID = 0;
    self->_sessionID = 0;
LABEL_4:
    uint64_t v6 = 8193;
    goto LABEL_6;
  }
  uint64_t v6 = 8196;
LABEL_6:
  v7 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v6 transactionID:v5];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v7];
}

- (void)getDeviceInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  if (self->_sessionID && v5 <= self->_lastTransactionID)
  {
    __ICOSLogCreate();
    v13 = @"getDeviceInfo";
    if ((unint64_t)[@"getDeviceInfo" length] >= 0x15)
    {
      v14 = [[@"getDeviceInfo" substringWithRange:0, 18];
      v13 = [v14 stringByAppendingString:@".."];
    }
    v15 = +[NSString stringWithFormat:@"responder[session: %d, : transaction: %d], request[transaction: %d]", self->_sessionID, self->_lastTransactionID, v6];
    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v13;
      v18 = v16;
      *(_DWORD *)buf = 136446466;
      id v21 = [(__CFString *)v17 UTF8String];
      __int16 v22 = 2114;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }
    [(PTPResponder *)self resetResponderSession];
    uint64_t v12 = 8196;
    goto LABEL_14;
  }
  v7 = [(PTPVirtualCamera *)self->_virtualCamera deviceInfoDataset];
  if (v7)
  {
    id v8 = [PTPDataPacket alloc];
    id v9 = [v4 operationCode];
    id v10 = [v7 content];
    CFUUIDRef v11 = [(PTPDataPacket *)v8 initWithOperationCode:v9 transactionID:v6 andData:v10];

    [(PTPDeviceUSBTransport *)self->_transport sendData:v11];
  }
  if (self->_sessionID) {
    self->_lastTransactionID = v6;
  }

  if (!v7)
  {
    uint64_t v12 = 8198;
LABEL_14:
    v19 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v12 transactionID:v6];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v19];
  }
}

- (void)getStorageIDs:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  if (!self->_sessionID)
  {
    uint64_t v10 = 8195;
LABEL_6:
    CFUUIDRef v11 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v10 transactionID:v5];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v11];

    goto LABEL_7;
  }
  if (v5 <= self->_lastTransactionID)
  {
    uint64_t v10 = 8196;
    goto LABEL_6;
  }
  self->_lastTransactionID = v5;
  v7 = [(PTPVirtualCamera *)self->_virtualCamera allStorageIDs];
  id v8 = [objc_alloc((Class)NSMutableData) initWithLength:4 * [v7 count] + 4];
  uint64_t v12 = (unsigned int *)[v8 mutableBytes];
  sub_10001F544(&v12, v7);
  id v9 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v6, v8);
  [(PTPDeviceUSBTransport *)self->_transport sendData:v9];

LABEL_7:
}

- (void)getStorageInfo:(id)a3
{
  id v13 = a3;
  id v4 = [v13 transactionID];
  id v5 = v4;
  if (self->_sessionID)
  {
    if (v4 <= self->_lastTransactionID)
    {
      uint64_t v12 = 8196;
    }
    else
    {
      self->_lastTransactionID = v4;
      uint64_t v6 = -[PTPVirtualCamera storageInfoDatasetForStorageID:](self->_virtualCamera, "storageInfoDatasetForStorageID:", [v13 parameter1]);
      if (v6)
      {
        v7 = (PTPOperationResponsePacket *)v6;
        id v8 = [PTPDataPacket alloc];
        id v9 = [v13 operationCode];
        uint64_t v10 = [(PTPOperationResponsePacket *)v7 content];
        CFUUIDRef v11 = [(PTPDataPacket *)v8 initWithOperationCode:v9 transactionID:v5 andData:v10];

        [(PTPDeviceUSBTransport *)self->_transport sendData:v11];
        goto LABEL_9;
      }
      uint64_t v12 = 8200;
    }
  }
  else
  {
    uint64_t v12 = 8195;
  }
  v7 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v12 transactionID:v5];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v7];
LABEL_9:
}

- (void)getNumObjects:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  if (!self->_sessionID)
  {
    v15 = [PTPOperationResponsePacket alloc];
    uint64_t v16 = 8195;
LABEL_8:
    v14 = [(PTPOperationResponsePacket *)v15 initWithResponseCode:v16 transactionID:v6];
    goto LABEL_9;
  }
  if (v5 <= self->_lastTransactionID)
  {
    v15 = [PTPOperationResponsePacket alloc];
    uint64_t v16 = 8196;
    goto LABEL_8;
  }
  id v7 = [v4 parameter1];
  unsigned __int16 v8 = (unsigned __int16)[v4 parameter2];
  id v9 = [v4 parameter3];
  unsigned __int16 v17 = 0;
  self->_lastTransactionID = v6;
  uint64_t v10 = [(PTPVirtualCamera *)self->_virtualCamera objectHandlesInStorage:v7 forObjectFormatCode:v8 inAssociation:v9 responseCode:&v17];
  CFUUIDRef v11 = v10;
  id v12 = 0;
  if (v17 == 8193) {
    id v12 = [v10 count];
  }
  id v13 = [PTPOperationResponsePacket alloc];
  v14 = [(PTPOperationResponsePacket *)v13 initWithResponseCode:v17 transactionID:v6 parameter1:v12];

LABEL_9:
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v14];
}

+ (void)getFilesystemMediaCountForDirectories:(int *)a3 media:(int *)a4 nonMedia:(int *)a5
{
  uint64_t v38 = 0;
  unsigned int v37 = 0;
  [a1 catalogPath:"/var/mobile/Media/DCIM/" dirs:(char *)&v38 + 4 media:&v38 nonMedia:&v37];
  [a1 catalogPath:"/var/mobile/Media/PhotoData/CPLAssets/" dirs:(char *)&v38 + 4 media:&v38 nonMedia:&v37];
  __ICOSLogCreate();
  id v9 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    uint64_t v10 = [&stru_100048E60 substringWithRange:0, 18];
    id v9 = [v10 stringByAppendingString:@".."];
  }
  CFUUIDRef v11 = +[NSString stringWithFormat:@"------- [%9s] --------", "File System"];
  id v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v9;
    v14 = v12;
    id v15 = [(__CFString *)v13 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v40 = v15;
    __int16 v41 = 2114;
    v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  uint64_t v16 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    unsigned __int16 v17 = [&stru_100048E60 substringWithRange:0, 18];
    uint64_t v16 = [v17 stringByAppendingString:@".."];
  }
  v18 = +[NSString stringWithFormat:@"[%9d] Directories", HIDWORD(v38)];
  v19 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v20 = v16;
    id v21 = v19;
    id v22 = [(__CFString *)v20 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v40 = v22;
    __int16 v41 = 2114;
    v42 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  v23 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v24 = [&stru_100048E60 substringWithRange:0, 18];
    v23 = [v24 stringByAppendingString:@".."];
  }
  v25 = +[NSString stringWithFormat:@"[%9d] Asset(s)", v38];
  v26 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v27 = v23;
    id v28 = v26;
    id v29 = [(__CFString *)v27 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v40 = v29;
    __int16 v41 = 2114;
    v42 = v25;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  objc_super v30 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    v31 = [&stru_100048E60 substringWithRange:0, 18];
    objc_super v30 = [v31 stringByAppendingString:@".."];
  }
  id v32 = +[NSString stringWithFormat:@"[%9d] Non-Media", v37];
  __int16 v33 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v30;
    v35 = v33;
    id v36 = [(__CFString *)v34 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v40 = v36;
    __int16 v41 = 2114;
    v42 = v32;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  if (a3) {
    *a3 = HIDWORD(v38);
  }
  if (a4) {
    *a4 = v38;
  }
  if (a5) {
    *a5 = v37;
  }
}

- (void)getNumDownloadableObjects:(id)a3
{
  uint64_t v18 = 0;
  HIDWORD(v17) = 0;
  id v4 = a3;
  +[PTPResponder getFilesystemMediaCountForDirectories:(char *)&v18 + 4 media:&v18 nonMedia:(char *)&v17 + 4];
  [(PTPResponder *)self setUsingLegacyOS:1];
  id v5 = [v4 transactionID];

  if (!self->_sessionID)
  {
    v14 = [PTPOperationResponsePacket alloc];
    uint64_t v15 = 8195;
LABEL_6:
    id v13 = [(PTPOperationResponsePacket *)v14 initWithResponseCode:v15 transactionID:v5];
    goto LABEL_7;
  }
  if (v5 <= self->_lastTransactionID)
  {
    v14 = [PTPOperationResponsePacket alloc];
    uint64_t v15 = 8196;
    goto LABEL_6;
  }
  uint64_t v6 = v18;
  uint64_t v7 = HIDWORD(v18);
  unsigned __int16 v8 = [(PTPVirtualCamera *)self->_virtualCamera ptpSecurityModel];
  uint64_t v9 = [v8 shouldRemovePlaceholderStorage] ^ 1;

  uint64_t v10 = [(PTPVirtualCamera *)self->_virtualCamera ptpSecurityModel];
  id v11 = [v10 hostIsTrusted];

  self->_lastTransactionID = v5;
  id v12 = [PTPOperationResponsePacket alloc];
  LODWORD(v17) = 0;
  id v13 = [(PTPOperationResponsePacket *)v12 initWithResponseCode:8193 transactionID:v5 parameter1:v6 parameter2:v7 parameter3:v9 parameter4:v11 parameter5:v17];
LABEL_7:
  uint64_t v16 = v13;
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v13];
}

- (void)getObjectHandles:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  unsigned __int16 v16 = 8195;
  if (!self->_sessionID) {
    goto LABEL_7;
  }
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v16 = 8196;
LABEL_7:
    v14 = [PTPOperationResponsePacket alloc];
    id v11 = [(PTPOperationResponsePacket *)v14 initWithResponseCode:v16 transactionID:v6];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v11];
    goto LABEL_8;
  }
  id v7 = [v4 parameter1];
  unsigned __int16 v8 = (unsigned __int16)[v4 parameter2];
  id v9 = [v4 parameter3];
  self->_lastTransactionID = v6;
  uint64_t v10 = [(PTPVirtualCamera *)self->_virtualCamera objectHandlesInStorage:v7 forObjectFormatCode:v8 inAssociation:v9 responseCode:&v16];
  id v11 = v10;
  if (v16 != 8193)
  {

    goto LABEL_7;
  }
  id v12 = [objc_alloc((Class)NSMutableData) initWithLength:4 * [-[PTPOperationResponsePacket count](v10, "count") + 4];
  uint64_t v15 = (unsigned int *)[v12 mutableBytes];
  sub_10001F544(&v15, v11);
  id v13 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v6, v12);
  [(PTPDeviceUSBTransport *)self->_transport sendData:v13];

LABEL_8:
}

- (void)getObjectInfo:(id)a3
{
  id v13 = a3;
  id v4 = [v13 transactionID];
  id v5 = v4;
  if (self->_sessionID)
  {
    if (v4 <= self->_lastTransactionID)
    {
      uint64_t v12 = 8196;
    }
    else
    {
      self->_lastTransactionID = v4;
      uint64_t v6 = -[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self->_virtualCamera, "objectInfoDatasetForObjectHandle:", [v13 parameter1]);
      if (v6)
      {
        id v7 = (PTPOperationResponsePacket *)v6;
        unsigned __int16 v8 = [PTPDataPacket alloc];
        id v9 = [v13 operationCode];
        uint64_t v10 = [(PTPOperationResponsePacket *)v7 content];
        id v11 = [(PTPDataPacket *)v8 initWithOperationCode:v9 transactionID:v5 andData:v10];

        [(PTPDeviceUSBTransport *)self->_transport sendData:v11];
        goto LABEL_9;
      }
      uint64_t v12 = 8201;
    }
  }
  else
  {
    uint64_t v12 = 8195;
  }
  id v7 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v12 transactionID:v5];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v7];
LABEL_9:
}

- (void)getObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  unsigned __int16 v22 = 8195;
  if (!self->_sessionID) {
    goto LABEL_15;
  }
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v22 = 8196;
LABEL_15:
    dispatch_queue_t v20 = [PTPOperationResponsePacket alloc];
    unsigned __int16 v16 = [(PTPOperationResponsePacket *)v20 initWithResponseCode:v22 transactionID:v6];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v16];
    goto LABEL_16;
  }
  int v21 = 0;
  self->_lastTransactionID = v5;
  id v7 = -[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self->_virtualCamera, "objectInfoDatasetForObjectHandle:", [v4 parameter1]);
  __ICOSLogCreate();
  unsigned __int16 v8 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v9 = [[&stru_100048E60 substringWithRange:0, 18];
    unsigned __int16 v8 = [v9 stringByAppendingString:@".."];
  }
  uint64_t v10 = [v7 filename];
  id v11 = +[NSString stringWithFormat:@"--- >getObject: %@", v10];

  uint64_t v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v8;
    v14 = v12;
    *(_DWORD *)buf = 136446466;
    id v24 = [(__CFString *)v13 UTF8String];
    __int16 v25 = 2114;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  uint64_t v15 = -[PTPVirtualCamera dataSourceForObjectHandle:responseCode:size:](self->_virtualCamera, "dataSourceForObjectHandle:responseCode:size:", [v4 parameter1], &v22, &v21);
  unsigned __int16 v16 = (PTPOperationResponsePacket *)v15;
  if (v22 != 8193 || !v15)
  {
    __int16 v19 = 8199;
LABEL_14:
    unsigned __int16 v22 = v19;

    goto LABEL_15;
  }
  uint64_t v17 = -[PTPDataPacket initWithOperationCode:transactionID:andDataSource:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andDataSource:", [v4 operationCode], v6, v15);
  if (!v17)
  {
    __int16 v19 = 8221;
    goto LABEL_14;
  }
  uint64_t v18 = v17;
  [(PTPDeviceUSBTransport *)self->_transport sendData:v17];

LABEL_16:
}

- (void)getThumb:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 transactionID];
  unsigned int v6 = v5;
  __int16 v19 = 8195;
  if (!self->_sessionID) {
    goto LABEL_11;
  }
  if (v5 <= self->_lastTransactionID)
  {
    __int16 v19 = 8196;
LABEL_11:
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100023630;
    void v11[3] = &unk_100048D20;
    __int16 v13 = v19;
    unsigned int v12 = v6;
    v11[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
    goto LABEL_12;
  }
  if ([v4 numParameters] == 2) {
    id v7 = [v4 parameter2];
  }
  else {
    id v7 = 0;
  }
  self->_lastTransactionID = v6;
  unsigned __int16 v8 = -[PTPVirtualCamera thumbnailForObjectHandle:maxPixelSize:responseCode:](self->_virtualCamera, "thumbnailForObjectHandle:maxPixelSize:responseCode:", [v4 parameter1], v7, &v19);
  id v9 = v8;
  if (v19 != 8193 || !v8)
  {
    __int16 v19 = 8208;

    goto LABEL_11;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000235A8;
  block[3] = &unk_100048CF8;
  unsigned int v18 = v6;
  id v15 = v4;
  id v16 = v9;
  uint64_t v17 = self;
  id v10 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_12:
}

- (void)getObjectMetadata:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 transactionID];
  unsigned int v6 = v5;
  __int16 v18 = 8195;
  if (!self->_sessionID) {
    goto LABEL_8;
  }
  if (v5 <= self->_lastTransactionID)
  {
    __int16 v18 = 8196;
LABEL_8:
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000238C8;
    v10[3] = &unk_100048D20;
    __int16 v12 = v18;
    unsigned int v11 = v6;
    v10[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
    goto LABEL_9;
  }
  self->_lastTransactionID = v5;
  id v7 = -[PTPVirtualCamera embeddedMetadataForObjectHandle:responseCode:](self->_virtualCamera, "embeddedMetadataForObjectHandle:responseCode:", [v4 parameter1], &v18);
  unsigned __int16 v8 = v7;
  if (v18 != 8193 || !v7)
  {
    __int16 v18 = 8208;

    goto LABEL_8;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023840;
  block[3] = &unk_100048CF8;
  unsigned int v17 = v6;
  id v14 = v4;
  id v15 = v8;
  id v16 = self;
  id v9 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_9:
}

- (void)getPartialObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  unsigned __int16 v14 = 8195;
  if (!self->_sessionID) {
    goto LABEL_15;
  }
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v14 = 8196;
LABEL_15:
    __int16 v12 = [PTPOperationResponsePacket alloc];
    unsigned __int16 v8 = [(PTPOperationResponsePacket *)v12 initWithResponseCode:v14 transactionID:v6 parameter1:0];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v8];
    goto LABEL_16;
  }
  int v13 = 0;
  self->_lastTransactionID = v5;
  uint64_t v7 = -[PTPVirtualCamera dataSourceForObjectHandle:responseCode:size:](self->_virtualCamera, "dataSourceForObjectHandle:responseCode:size:", [v4 parameter1], &v14, &v13);
  unsigned __int16 v8 = (PTPOperationResponsePacket *)v7;
  if (v14 != 8193 || !v7)
  {
    unsigned __int16 v14 = 8199;
LABEL_14:

    goto LABEL_15;
  }
  id v9 = -[PTPDataPacket initWithOperationCode:transactionID:andDataSource:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andDataSource:", [v4 operationCode], v6, v7);
  if ([v4 parameter3] == -1)
  {
    unsigned int v11 = -[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self->_virtualCamera, "objectInfoDatasetForObjectHandle:", [v4 parameter1]);
    unsigned int v10 = [-[PTPDataPacket setRange:](v9, "setRange:", [v4 parameter2], objc_msgSend(v11, "objectCompressedSize64") - objc_msgSend(v4, "parameter2"));

    if (!v9)
    {
LABEL_13:
      unsigned __int16 v14 = 8221;

      goto LABEL_14;
    }
  }
  else
  {
    unsigned int v10 = [-[PTPDataPacket setRange:](v9, "setRange:", [v4 parameter2], [v4 parameter3]);
    if (!v9) {
      goto LABEL_13;
    }
  }
  if (v10) {
    goto LABEL_13;
  }
  [(PTPDeviceUSBTransport *)self->_transport sendData:v9];

LABEL_16:
}

- (void)getObjectInfoForObjectsInStorage:(id)a3
{
  id v4 = a3;
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10005E46C = 0;
  *(float *)&dword_10005E46C = (float)mach_absolute_time();
  id v5 = [v4 transactionID];
  unsigned __int16 v23 = 8195;
  id v6 = [v4 parameter1];
  if (!self->_sessionID) {
    goto LABEL_6;
  }
  int v7 = dword_10005E280;
  sub_100002688(1);
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v23 = 8196;
LABEL_6:
    unsigned int v11 = [PTPOperationResponsePacket alloc];
    __int16 v12 = [(PTPOperationResponsePacket *)v11 initWithResponseCode:v23 transactionID:v5];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v12];
    goto LABEL_22;
  }
  unsigned __int16 v8 = (unsigned __int16)[v4 parameter2];
  id v9 = [v4 parameter3];
  if ([v4 operationCode] == 36866)
  {
    uint64_t v10 = 1;
  }
  else if ([v4 operationCode] == 36869)
  {
    uint64_t v10 = 2;
  }
  else if ([v4 operationCode] == 4131)
  {
    uint64_t v10 = 3;
  }
  else
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  self->_lastTransactionID = v5;
  if (v6 == v7)
  {
    unsigned __int16 v23 = 8193;
    *(_DWORD *)buf = 0;
    int v13 = +[NSData dataWithBytes:buf length:4];
    goto LABEL_14;
  }
  uint64_t v14 = v8;
  id v15 = [(PTPVirtualCamera *)self->_virtualCamera pathObjectInfoForObjectsInStorage:v6 forObjectFormatCode:v14 inAssociation:v9 withContentType:v10 responseCode:&v23];
  if (v15)
  {
    if (v23 == 8193)
    {
LABEL_20:
      __int16 v12 = -[PTPDataPacket initWithOperationCode:transactionID:andFilepath:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andFilepath:", [v4 operationCode], v5, v15);
      [(PTPDataPacket *)v12 setUnlinkWhenDone:1];
      int v13 = v15;
      goto LABEL_21;
    }
    int v13 = 0;
    goto LABEL_28;
  }
  int v13 = [(PTPVirtualCamera *)self->_virtualCamera objectInfoForObjectsInStorage:v6 forObjectFormatCode:v14 inAssociation:v9 withContentType:v10 responseCode:&v23];
  if (v23 != 8193)
  {
LABEL_28:
    unsigned __int16 v23 = 8199;

    goto LABEL_6;
  }
LABEL_14:
  if (!v13)
  {
    id v15 = 0;
    goto LABEL_20;
  }
  __int16 v12 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v5, v13);
LABEL_21:

  [(PTPDeviceUSBTransport *)self->_transport sendData:v12];
LABEL_22:

  *(float *)&dword_10005E468 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005E46C)
                                             * (float)info.numer)
                                     / (float)info.denom)
                             / 1000000.0;
  __ICOSLogCreate();
  id v16 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    unsigned int v17 = [&stru_100048E60 substringWithRange:0, 18];
    id v16 = [v17 stringByAppendingString:@".."];
  }
  __int16 v18 = +[NSString stringWithFormat:@"[PTPResponder getObjectInfoForObjectsInStorage] spent %5.2fms building assets for ptpd storageID: 0x%x", *(float *)&dword_10005E468, v6];
  __int16 v19 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v20 = v16;
    int v21 = v19;
    id v22 = [(__CFString *)v20 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v26 = v22;
    __int16 v27 = 2114;
    id v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (void)getObjectCompressedSize64:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = objc_alloc_init((Class)NSMutableData);
  if (!self->_sessionID) {
    goto LABEL_5;
  }
  if (v5 <= self->_lastTransactionID)
  {
    uint64_t v10 = 8196;
    goto LABEL_7;
  }
  self->_lastTransactionID = v5;
  int v7 = -[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self->_virtualCamera, "objectInfoDatasetForObjectHandle:", [v4 parameter1]);
  if (!v7)
  {
LABEL_5:
    uint64_t v10 = 8195;
LABEL_7:
    unsigned int v11 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v10 transactionID:v5];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v11];

    goto LABEL_8;
  }
  unsigned __int16 v8 = v7;
  id v12 = [v7 objectCompressedSize64];
  [v6 appendBytes:&v12 length:8];
  id v9 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v5, v6);
  [(PTPDeviceUSBTransport *)self->_transport sendData:v9];

LABEL_8:
}

- (void)getPartialObject64:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  unsigned __int16 v22 = 8195;
  if (self->_sessionID)
  {
    if (v5 <= self->_lastTransactionID)
    {
      unsigned __int16 v22 = 8196;
    }
    else
    {
      int v21 = 0;
      id v7 = [v4 parameter3];
      uint64_t v8 = [v4 parameter2] | ((void)v7 << 32);
      id v9 = [v4 parameter5];
      uint64_t v10 = [v4 parameter4] | ((void)v9 << 32);
      __ICOSLogCreate();
      unsigned int v11 = &stru_100048E60;
      if ((unint64_t)[&stru_100048E60 length] >= 0x15)
      {
        id v12 = [&stru_100048E60 substringWithRange:0, 18];
        unsigned int v11 = [v12 stringByAppendingString:@".."];
      }
      int v13 = +[NSString stringWithFormat:@"Get Partial Object: Length:[%llu] Offset:[%llu] \n", v10, v8];
      uint64_t v14 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v11;
        id v16 = v14;
        *(_DWORD *)buf = 136446466;
        id v24 = [(__CFString *)v15 UTF8String];
        __int16 v25 = 2114;
        id v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      self->_lastTransactionID = v6;
      -[PTPVirtualCamera dataSourceForObjectHandle:responseCode:size:](self->_virtualCamera, "dataSourceForObjectHandle:responseCode:size:", [v4 parameter1], &v22, &v21);
      unsigned int v17 = (PTPOperationResponsePacket *)objc_claimAutoreleasedReturnValue();
      [(PTPOperationResponsePacket *)v17 setToggleHeaderOffset:1];
      if (v22 == 8193 && v17)
      {
        __int16 v18 = -[PTPDataPacket initWithOperationCode:transactionID:andDataSource:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andDataSource:", [v4 operationCode], v6, v17);
        __int16 v19 = v18;
        if (v18 && !-[PTPDataPacket setRange:](v18, "setRange:", v8, v10))
        {
          [(PTPDeviceUSBTransport *)self->_transport sendData:v19];

          goto LABEL_16;
        }
        unsigned __int16 v22 = 8221;
      }
      else
      {
        unsigned __int16 v22 = 8199;
      }
    }
  }
  dispatch_queue_t v20 = [PTPOperationResponsePacket alloc];
  unsigned int v17 = [(PTPOperationResponsePacket *)v20 initWithResponseCode:v22 transactionID:v6 parameter1:0];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v17];
LABEL_16:
}

- (void)getObjectInfoForNextObjectGroupInStorage:(id)a3
{
  id v4 = a3;
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  dword_10005E46C = 0;
  *(float *)&dword_10005E46C = (float)mach_absolute_time();
  id v5 = [v4 transactionID];
  unsigned __int16 v14 = 8195;
  id v6 = [v4 parameter1];
  if (!self->_sessionID) {
    goto LABEL_9;
  }
  id v7 = v6;
  int v8 = dword_10005E280;
  sub_100002688(1);
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v14 = 8196;
    goto LABEL_9;
  }
  self->_lastTransactionID = v5;
  if (v7 != v8)
  {
    uint64_t v10 = [(PTPVirtualCamera *)self->_virtualCamera objectInfoForNextObjectGroupInStorage:v7 responseCode:&v14];
    id v9 = v10;
    if (v14 == 8193) {
      goto LABEL_7;
    }
    unsigned __int16 v14 = 8199;

LABEL_9:
    id v12 = [PTPOperationResponsePacket alloc];
    id v9 = [(PTPOperationResponsePacket *)v12 initWithResponseCode:v14 transactionID:v5];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v9];
    goto LABEL_10;
  }
  unsigned __int16 v14 = 8193;
  uint64_t v13 = 0;
  id v9 = +[NSData dataWithBytes:&v13 length:8];
LABEL_7:
  unsigned int v11 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v5, v9);
  [(PTPDeviceUSBTransport *)self->_transport sendData:v11];

LABEL_10:
  *(float *)&dword_10005E468 = (float)((float)((float)((float)mach_absolute_time() - *(float *)&dword_10005E46C)
                                             * (float)info.numer)
                                     / (float)info.denom)
                             / 1000000.0;
}

- (void)getUserAssignedDeviceName:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  if (!self->_sessionID)
  {
    uint64_t v12 = 8195;
LABEL_9:
    uint64_t v13 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v12 transactionID:v6];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v13];

    goto LABEL_10;
  }
  if (v5 <= self->_lastTransactionID)
  {
    uint64_t v12 = 8196;
    goto LABEL_9;
  }
  self->_lastTransactionID = v5;
  id v7 = [(PTPVirtualCamera *)self->_virtualCamera userAssignedName];
  id v8 = [v7 length];
  if (!v8
    || (id v9 = [objc_alloc((Class)NSMutableData) initWithLength:2 * (void)v8 + 3]) == 0)
  {

    uint64_t v12 = 8194;
    goto LABEL_9;
  }
  id v10 = v9;
  unsigned __int16 v14 = [v10 mutableBytes];
  sub_10001F2B8(&v14, v7);
  unsigned int v11 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v6, v10);
  [(PTPDeviceUSBTransport *)self->_transport sendData:v11];

LABEL_10:
}

- (void)deleteObject:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  unsigned __int16 v11 = 8195;
  if (self->_sessionID)
  {
    if (v5 <= self->_lastTransactionID)
    {
      __int16 v8 = 8196;
    }
    else
    {
      id v7 = [v4 parameter1];
      self->_lastTransactionID = v6;
      if (v7 != -1)
      {
        [(PTPVirtualCamera *)self->_virtualCamera deleteObjectWithObjectHandle:v7 responseCode:&v11];
        goto LABEL_8;
      }
      __int16 v8 = 8198;
    }
    unsigned __int16 v11 = v8;
  }
LABEL_8:
  id v9 = [PTPOperationResponsePacket alloc];
  id v10 = [(PTPOperationResponsePacket *)v9 initWithResponseCode:v11 transactionID:v6];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v10];
}

+ (void)catalogPath:(char *)a3 dirs:(int *)a4 media:(int *)a5 nonMedia:(int *)a6
{
  unsigned __int16 v11 = opendir(a3);
  if (v11)
  {
    uint64_t v12 = v11;
    for (i = readdir(v11); i; i = readdir(v12))
    {
      if (i->d_type == 4)
      {
        d_name = i->d_name;
        if (strcmp(i->d_name, "."))
        {
          if (strcmp(d_name, ".."))
          {
            ++*a4;
            snprintf(__str, 0x400uLL, "%s/%s", a3, d_name);
            [a1 catalogPath:__str dirs:a4 media:a5 nonMedia:a6];
          }
        }
      }
      else
      {
        id v15 = strrchr(i->d_name, 46);
        if (v15 && ((id v16 = v15, !strcmp(v15, ".AAE")) || !strcmp(v16, ".DBG"))) {
          ++*a6;
        }
        else {
          ++*a5;
        }
      }
    }
    closedir(v12);
  }
}

- (BOOL)handleSetHostMediaCapabilities:(id)a3
{
  id v4 = a3;
  [(PTPResponder *)self setUsingMacOS:1];
  id v5 = [v4 transactionID];

  if (self->_sessionID && v5 <= self->_lastTransactionID)
  {
    uint64_t v7 = 8196;
    goto LABEL_7;
  }
  unsigned int v6 = [(PTPDeviceUSBTransport *)self->_transport readBulkData];
  if (self->_sessionID)
  {
    self->_lastTransactionID = v5;
    if (v6)
    {
LABEL_5:
      uint64_t v7 = 8194;
LABEL_7:
      __int16 v8 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v7 transactionID:v5];
      [(PTPDeviceUSBTransport *)self->_transport sendResponse:v8];

      return 0;
    }
  }
  else if (v6)
  {
    goto LABEL_5;
  }
  return 1;
}

- (BOOL)handleSetHostSupportsGroups:(id)a3
{
  id v4 = a3;
  __ICOSLogCreate();
  id v5 = @"Group";
  if ((unint64_t)[@"Group" length] >= 0x15)
  {
    unsigned int v6 = [@"Group" substringWithRange:0, 18];
    id v5 = [v6 stringByAppendingString:@".."];
  }
  uint64_t v7 = +[NSString stringWithFormat:@"Setting Group"];
  __int16 v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v5;
    id v10 = v8;
    int v15 = 136446466;
    id v16 = [(__CFString *)v9 UTF8String];
    __int16 v17 = 2114;
    __int16 v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v15, 0x16u);
  }
  id v11 = [v4 transactionID];

  if (self->_sessionID && v11 <= self->_lastTransactionID)
  {
    uint64_t v12 = 8196;
  }
  else
  {
    [(PTPVirtualCamera *)self->_virtualCamera setHostSupportsGroups:1];
    if (self->_sessionID) {
      self->_lastTransactionID = v11;
    }
    uint64_t v12 = 8193;
  }
  uint64_t v13 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v12 transactionID:v11];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v13];

  return 0;
}

- (BOOL)handleSetHostSupportedFormats:(id)a3
{
  id v4 = a3;
  [(PTPResponder *)self setUsingWindows];
  id v5 = [v4 transactionID];

  if (self->_sessionID && v5 <= self->_lastTransactionID)
  {
    uint64_t v7 = 8196;
    goto LABEL_7;
  }
  unsigned int v6 = [(PTPDeviceUSBTransport *)self->_transport readBulkData];
  if (self->_sessionID)
  {
    self->_lastTransactionID = v5;
    if (v6)
    {
LABEL_5:
      uint64_t v7 = 8194;
LABEL_7:
      __int16 v8 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v7 transactionID:v5];
      [(PTPDeviceUSBTransport *)self->_transport sendResponse:v8];

      return 0;
    }
  }
  else if (v6)
  {
    goto LABEL_5;
  }
  return 1;
}

- (void)handleUnsupportedRequest:(id)a3
{
  id v4 = a3;
  __ICOSLogCreate();
  id v5 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    unsigned int v6 = [&stru_100048E60 substringWithRange:0, 18];
    id v5 = [v6 stringByAppendingString:@".."];
  }
  uint64_t v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[%x] -> Unsupported PTP Command Received", [v4 operationCode]);
  __int16 v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v5;
    id v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v13 = [(__CFString *)v9 UTF8String];
    __int16 v14 = 2114;
    int v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  id v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", 8197, [v4 transactionID]);
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v11];
}

- (id)handleRequest:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"[0x%x]", [v4 operationCode]);
  __ICOSLogCreate();
  id v6 = v5;
  uint64_t v7 = v6;
  if ((unint64_t)[v6 length] >= 0x15)
  {
    __int16 v8 = [v6 substringWithRange:0, 18];
    uint64_t v7 = [v8 stringByAppendingString:@".."];
  }
  id v9 = sub_10001F5EC((uint64_t)[v4 operationCode]);
  id v10 = +[NSString stringWithFormat:@"<op> %@", v9];

  id v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v7;
    id v13 = v11;
    *(_DWORD *)buf = 136446466;
    id v30 = [v12 UTF8String];
    __int16 v31 = 2114;
    id v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  unsigned int v14 = [v4 operationCode];
  if (!(!v16 & v15))
  {
    switch(v14)
    {
      case 0x1001u:
        [(PTPResponder *)self getDeviceInfo:v4];
        goto LABEL_46;
      case 0x1002u:
        [(PTPResponder *)self openSession:v4];
        goto LABEL_46;
      case 0x1003u:
        [(PTPResponder *)self closeSession:v4];
        if ([(PTPDeviceUSBTransport *)self->_transport type] == 3)
        {
          [(PTPResponder *)self performSelectorOnMainThread:"stop" withObject:0 waitUntilDone:0];
          [(PTPResponder *)self performSelectorOnMainThread:"stopRunLoop" withObject:0 waitUntilDone:0];
        }
        goto LABEL_46;
      case 0x1004u:
        [(PTPResponder *)self getStorageIDs:v4];
        goto LABEL_46;
      case 0x1005u:
        [(PTPResponder *)self getStorageInfo:v4];
        goto LABEL_46;
      case 0x1006u:
        [(PTPResponder *)self getNumObjects:v4];
        goto LABEL_46;
      case 0x1007u:
        [(PTPResponder *)self getObjectHandles:v4];
        goto LABEL_46;
      case 0x1008u:
        [(PTPResponder *)self getObjectInfo:v4];
        goto LABEL_46;
      case 0x1009u:
        [(PTPResponder *)self getObject:v4];
        goto LABEL_46;
      case 0x100Au:
        goto LABEL_14;
      case 0x100Bu:
        [(PTPResponder *)self deleteObject:v4];
        goto LABEL_46;
      case 0x100Cu:
      case 0x100Du:
      case 0x100Eu:
      case 0x100Fu:
      case 0x1011u:
      case 0x1012u:
      case 0x1013u:
      case 0x1017u:
      case 0x1018u:
      case 0x1019u:
      case 0x101Au:
      case 0x101Cu:
      case 0x101Du:
      case 0x101Eu:
      case 0x101Fu:
      case 0x1020u:
      case 0x1021u:
      case 0x1022u:
        goto LABEL_45;
      case 0x1010u:
        [(PTPResponder *)self handleResetDevice:v4];
        goto LABEL_46;
      case 0x1014u:
        [(PTPResponder *)self getDevicePropDesc:v4];
        goto LABEL_46;
      case 0x1015u:
        [(PTPResponder *)self getDevicePropValue:v4];
        goto LABEL_46;
      case 0x1016u:
        __int16 v19 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:]([PTPOperationResponsePacket alloc], "initWithResponseCode:transactionID:", 8193, [v4 transactionID]);
        [(PTPDeviceUSBTransport *)self->_transport sendResponse:v19];

        goto LABEL_46;
      case 0x101Bu:
        [(PTPResponder *)self getPartialObject:v4];
        goto LABEL_46;
      case 0x1023u:
        goto LABEL_13;
      default:
        JUMPOUT(0);
    }
  }
  switch(v14)
  {
    case 0x9001u:
      [(PTPResponder *)self getNumDownloadableObjects:v4];
      goto LABEL_46;
    case 0x9002u:
    case 0x9005u:
LABEL_13:
      [(PTPResponder *)self getObjectInfoForObjectsInStorage:v4];
      goto LABEL_46;
    case 0x9003u:
      [(PTPResponder *)self getUserAssignedDeviceName:v4];
      goto LABEL_46;
    case 0x9004u:
      [(PTPResponder *)self allowKeepAwake:v4];
      goto LABEL_46;
    case 0x9006u:
      [(PTPResponder *)self getObjectCompressedSize64:v4];
      goto LABEL_46;
    case 0x9007u:
      [(PTPResponder *)self getPartialObject64:v4];
      goto LABEL_46;
    case 0x9008u:
      [(PTPResponder *)self setUsingMTP:v4];
      goto LABEL_46;
    case 0x9009u:
      photoLibraryMediaQueryQueue = self->_photoLibraryMediaQueryQueue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100025440;
      v25[3] = &unk_100048778;
      v25[4] = self;
      id v26 = v4;
      dispatch_async((dispatch_queue_t)photoLibraryMediaQueryQueue, v25);
      __int16 v18 = v26;
      goto LABEL_36;
    case 0x900Au:
    case 0x900Du:
LABEL_45:
      [(PTPResponder *)self handleUnsupportedRequest:v4];
      goto LABEL_46;
    case 0x900Bu:
      BOOL v21 = [(PTPResponder *)self handleSetHostMediaCapabilities:v4];
      goto LABEL_39;
    case 0x900Cu:
LABEL_14:
      __int16 v17 = self->_photoLibraryMediaQueryQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100025434;
      block[3] = &unk_100048778;
      void block[4] = self;
      id v28 = v4;
      dispatch_async((dispatch_queue_t)v17, block);
      __int16 v18 = v28;
LABEL_36:

      goto LABEL_46;
    case 0x900Eu:
      BOOL v21 = [(PTPResponder *)self handleSetHostSupportedFormats:v4];
LABEL_39:
      BOOL v22 = v21;
      goto LABEL_47;
    case 0x900Fu:
      [(PTPResponder *)self getObjectInfoForNextObjectGroupInStorage:v4];
      goto LABEL_46;
    case 0x9010u:
      [(PTPResponder *)self handleSetHostSupportsGroups:v4];
      goto LABEL_46;
    default:
      switch(v14)
      {
        case 0x9801u:
          [(PTPResponder *)self getObjectPropsSupported:v4];
          break;
        case 0x9802u:
          [(PTPResponder *)self getObjectPropDesc:v4];
          break;
        case 0x9803u:
          [(PTPResponder *)self getObjectPropValue:v4];
          break;
        case 0x9805u:
          [(PTPResponder *)self getObjectPropList:v4];
          break;
        default:
          goto LABEL_45;
      }
LABEL_46:
      BOOL v22 = 0;
LABEL_47:
      unsigned __int16 v23 = +[NSNumber numberWithBool:v22];

      return v23;
  }
}

- (void)handleData:(id)a3
{
  id v14 = a3;
  unsigned int v4 = [v14 operationCode];
  if (v4 == 36878)
  {
    virtualCamera = self->_virtualCamera;
    id v9 = [v14 data];
    [(PTPVirtualCamera *)virtualCamera assignHostSupportedFormats:v9];

    id v10 = [PTPOperationResponsePacket alloc];
    uint64_t lastTransactionID = self->_lastTransactionID;
    uint64_t v12 = 8193;
  }
  else
  {
    if (v4 == 36875)
    {
      [(PTPResponder *)self setUsingPeerMediaCapabilities:1];
      id v5 = self->_virtualCamera;
      id v6 = [v14 data];
      [(PTPVirtualCamera *)v5 assignHostMediaCapabilities:v6];

      uint64_t v7 = [[PTPOperationResponsePacket alloc] initWithResponseCode:8193 transactionID:self->_lastTransactionID parameter1:MGGetBoolAnswer()];
      goto LABEL_7;
    }
    id v10 = [PTPOperationResponsePacket alloc];
    uint64_t lastTransactionID = self->_lastTransactionID;
    uint64_t v12 = 8217;
  }
  uint64_t v7 = [(PTPOperationResponsePacket *)v10 initWithResponseCode:v12 transactionID:lastTransactionID];
LABEL_7:
  id v13 = v7;
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v7];
}

- (void)handleCancel:(id)a3
{
  self->_canceledTransactionID = [a3 transactionID];
}

- (void)resetResponderSession
{
  self->_uint64_t lastTransactionID = 0;
  self->_sessionID = 0;
}

- (void)handleResetDevice:(id)a3
{
  id v4 = [a3 transactionID];
  __ICOSLogCreate();
  id v5 = @"Device Reset";
  if ((unint64_t)[@"Device Reset" length] >= 0x15)
  {
    id v6 = [[@"Device Reset" substringWithRange:0, 18];
    id v5 = [v6 stringByAppendingString:@".."];
  }
  uint64_t v7 = +[NSString stringWithFormat:@"responder[session: %d, : transaction: %d], request[transaction: %d]", self->_sessionID, self->_lastTransactionID, v4];
  __int16 v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v5;
    id v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v13 = [(__CFString *)v9 UTF8String];
    __int16 v14 = 2114;
    char v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  [(PTPResponder *)self resetResponderSession];
  id v11 = [[PTPOperationResponsePacket alloc] initWithResponseCode:8193 transactionID:v4];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v11];
}

- (void)handleDeviceRemoval
{
  __ICOSLogCreate();
  objc_super v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v4 = [[&stru_100048E60 substringWithRange:0, 18];
    objc_super v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = +[NSString stringWithFormat:@"--> Device Removed | Stopping RunLoop"];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v3;
    __int16 v8 = v6;
    int v9 = 136446466;
    id v10 = [(__CFString *)v7 UTF8String];
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(PTPResponder *)self performSelectorOnMainThread:"stop" withObject:0 waitUntilDone:0];
  [(PTPResponder *)self performSelectorOnMainThread:"stopRunLoop" withObject:0 waitUntilDone:0];
}

- (void)sentData:(id)a3 responseCode:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  unsigned int v7 = [v13 operationCode];
  id v8 = [v13 transactionID];
  int v9 = [PTPOperationResponsePacket alloc];
  id v10 = [v6 unsignedShortValue];

  if (v7 == 4123) {
    __int16 v11 = -[PTPOperationResponsePacket initWithResponseCode:transactionID:parameter1:](v9, "initWithResponseCode:transactionID:parameter1:", v10, v8, [v13 bytesTransferred]);
  }
  else {
    __int16 v11 = [(PTPOperationResponsePacket *)v9 initWithResponseCode:v10 transactionID:v8];
  }
  uint64_t v12 = v11;
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v11];
}

- (void)sendEvent:(id)a3
{
}

- (void)reportObjectAdded:(id)a3
{
  id v4 = a3;
  id v5 = [PTPEventPacket alloc];
  id v6 = [v4 unsignedIntValue];

  unsigned int v7 = [(PTPEventPacket *)v5 initWithEventCode:16386 transactionID:0xFFFFFFFFLL parameter1:v6];
  [(PTPResponder *)self sendEvent:v7];
}

- (void)reportObjectDeleted:(id)a3
{
  id v4 = a3;
  id v5 = [PTPEventPacket alloc];
  id v6 = [v4 unsignedIntValue];

  unsigned int v7 = [(PTPEventPacket *)v5 initWithEventCode:16387 transactionID:0xFFFFFFFFLL parameter1:v6];
  [(PTPResponder *)self sendEvent:v7];
}

- (void)reportStorageAdded:(id)a3
{
  id v4 = a3;
  id v5 = [PTPEventPacket alloc];
  id v6 = [v4 unsignedIntValue];

  unsigned int v7 = [(PTPEventPacket *)v5 initWithEventCode:16388 transactionID:0xFFFFFFFFLL parameter1:v6];
  [(PTPResponder *)self sendEvent:v7];
}

- (void)reportStorageDeleted:(id)a3
{
  id v4 = a3;
  id v5 = [PTPEventPacket alloc];
  id v6 = [v4 unsignedIntValue];

  unsigned int v7 = [(PTPEventPacket *)v5 initWithEventCode:16389 transactionID:0xFFFFFFFFLL parameter1:v6];
  [(PTPResponder *)self sendEvent:v7];
}

- (void)reportGroupAddedInStorage:(id)a3
{
  id v4 = a3;
  id v5 = [PTPEventPacket alloc];
  id v6 = [v4 unsignedIntValue];

  unsigned int v7 = [(PTPEventPacket *)v5 initWithEventCode:49156 transactionID:0xFFFFFFFFLL parameter1:v6];
  [(PTPResponder *)self sendEvent:v7];
}

- (void)reportUserAssignedNameChange
{
  objc_super v3 = [[PTPEventPacket alloc] initWithEventCode:49154 transactionID:0xFFFFFFFFLL];
  [(PTPResponder *)self sendEvent:v3];
}

- (BOOL)start
{
  __ICOSLogCreate();
  objc_super v3 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v4 = [&stru_100048E60 substringWithRange:0, 18];
    objc_super v3 = [v4 stringByAppendingString:@".."];
  }
  id v5 = +[NSString stringWithFormat:@"Starting Responder\n"];
  id v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = v3;
    id v8 = v6;
    *(_DWORD *)buf = 136446466;
    id v18 = [(__CFString *)v7 UTF8String];
    __int16 v19 = 2114;
    dispatch_queue_t v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  __ICOSLogCreate();
  int v9 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v10 = [&stru_100048E60 substringWithRange:0, 18];
    int v9 = [v10 stringByAppendingString:@".."];
  }
  __int16 v11 = +[NSString stringWithFormat:@"Built: %s %s\n", aNov102024, a032755];
  uint64_t v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v9;
    __int16 v14 = v12;
    id v15 = [(__CFString *)v13 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v18 = v15;
    __int16 v19 = 2114;
    dispatch_queue_t v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  return [(PTPDeviceUSBTransport *)self->_transport startResponder];
}

- (void)stop
{
}

- (void)stopRunLoop
{
  self->_keepRunningRunLoop = 0;
  Current = CFRunLoopGetCurrent();

  CFRunLoopStop(Current);
}

- (void)transportActivated
{
  objc_super v3 = [[PTPVirtualCamera alloc] initWithName:self->_name andPath:self->_path];
  virtualCamera = self->_virtualCamera;
  self->_virtualCamera = v3;

  self->_usingMTP = 0;
  id v5 = self->_virtualCamera;

  [(PTPVirtualCamera *)v5 setDelegate:self];
}

- (void)removeVirtualCamera
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026074;
  block[3] = &unk_100048750;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sendEventDeviceUnlocked
{
  objc_super v3 = [[PTPEventPacket alloc] initWithEventCode:49153 transactionID:0xFFFFFFFFLL];
  [(PTPResponder *)self sendEvent:v3];
}

- (void)sendRestartSessionEvent
{
  objc_super v3 = [[PTPEventPacket alloc] initWithEventCode:49155 transactionID:0xFFFFFFFFLL];
  [(PTPResponder *)self sendEvent:v3];
}

- (void)getDevicePropDesc:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  id v6 = v5;
  if (self->_sessionID)
  {
    if (v5 <= self->_lastTransactionID)
    {
      uint64_t v13 = 8196;
    }
    else
    {
      self->_uint64_t lastTransactionID = v5;
      uint64_t v7 = -[PTPVirtualCamera devicePropDescDatasetForProperty:](self->_virtualCamera, "devicePropDescDatasetForProperty:", (unsigned __int16)[v4 parameter1]);
      if (v7)
      {
        id v8 = (void *)v7;
        int v9 = [PTPDataPacket alloc];
        id v10 = [v4 operationCode];
        __int16 v11 = [v8 content];
        uint64_t v12 = [(PTPDataPacket *)v9 initWithOperationCode:v10 transactionID:v6 andData:v11];

        [(PTPDeviceUSBTransport *)self->_transport sendData:v12];
        goto LABEL_13;
      }
      uint64_t v13 = 8202;
    }
  }
  else
  {
    uint64_t v13 = 8195;
  }
  __int16 v14 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v13 transactionID:v6];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v14];
  __ICOSLogCreate();
  id v15 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    char v16 = [[&stru_100048E60 substringWithRange:0, 18];
    id v15 = [v16 stringByAppendingString:@".."];
  }
  __int16 v17 = +[NSString stringWithFormat:@"MTP* getDevicePropDesc - response:\n%@\n", v14];
  id v18 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v19 = v15;
    dispatch_queue_t v20 = v18;
    *(_DWORD *)buf = 136446466;
    id v22 = [(__CFString *)v19 UTF8String];
    __int16 v23 = 2114;
    id v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_13:
}

- (void)getDevicePropValue:(id)a3
{
  id v10 = a3;
  id v4 = [v10 transactionID];
  id v5 = v4;
  if (self->_sessionID)
  {
    if (v4 <= self->_lastTransactionID)
    {
      uint64_t v9 = 8196;
    }
    else
    {
      self->_uint64_t lastTransactionID = v4;
      uint64_t v6 = -[PTPVirtualCamera devicePropValueForProperty:](self->_virtualCamera, "devicePropValueForProperty:", (unsigned __int16)[v10 parameter1]);
      if (v6)
      {
        uint64_t v7 = (PTPOperationResponsePacket *)v6;
        id v8 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v10 operationCode], v5, v6);
        [(PTPDeviceUSBTransport *)self->_transport sendData:v8];

        goto LABEL_9;
      }
      uint64_t v9 = 8202;
    }
  }
  else
  {
    uint64_t v9 = 8195;
  }
  uint64_t v7 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v9 transactionID:v5];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v7];
LABEL_9:
}

- (void)getObjectPropsSupported:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  unsigned __int16 v18 = 8193;
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v18 = 8196;
  }
  else
  {
    unsigned __int16 v6 = (unsigned __int16)[v4 parameter1];
    self->_uint64_t lastTransactionID = v5;
    uint64_t v7 = [(PTPVirtualCamera *)self->_virtualCamera objectPropertiesSupportedForObjectFormatCode:v6 responseCode:&v18];
    id v8 = v7;
    if (v18 == 8193)
    {
      uint64_t v9 = (__CFString *)[objc_alloc((Class)NSMutableData) initWithLength:2 * [-[PTPOperationResponsePacket count](v7, "count") + 4]];
      *(void *)buf = [(__CFString *)v9 mutableBytes];
      sub_10001F49C((unsigned __int16 **)buf, v8);
      id v10 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v5, v9);
      [(PTPDeviceUSBTransport *)self->_transport sendData:v10];

      goto LABEL_11;
    }
  }
  __int16 v11 = [PTPOperationResponsePacket alloc];
  id v8 = [(PTPOperationResponsePacket *)v11 initWithResponseCode:v18 transactionID:v5];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v8];
  __ICOSLogCreate();
  uint64_t v9 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    uint64_t v12 = [&stru_100048E60 substringWithRange:0, 18];
    uint64_t v9 = [v12 stringByAppendingString:@".."];
  }
  uint64_t v13 = +[NSString stringWithFormat:@"getObjectPropsSupported - response:\n%@\n", v8];
  __int16 v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v9;
    char v16 = v14;
    id v17 = [(__CFString *)v15 UTF8String];
    *(_DWORD *)buf = 136446466;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v20 = 2114;
    BOOL v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_11:
}

- (void)getObjectPropValue:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  unsigned __int16 v18 = 8193;
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v18 = 8196;
  }
  else
  {
    id v6 = [v4 parameter1];
    unsigned __int16 v7 = (unsigned __int16)[v4 parameter2];
    self->_uint64_t lastTransactionID = v5;
    id v8 = [(PTPVirtualCamera *)self->_virtualCamera objectPropValueForHandle:v6 withObjectPropertyCode:v7 responseCode:&v18];
    uint64_t v9 = v8;
    if (v18 == 8193)
    {
      id v10 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v5, v8);
      [(PTPDeviceUSBTransport *)self->_transport sendData:v10];
      goto LABEL_11;
    }
  }
  __int16 v11 = [PTPOperationResponsePacket alloc];
  uint64_t v9 = [(PTPOperationResponsePacket *)v11 initWithResponseCode:v18 transactionID:v5];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v9];
  __ICOSLogCreate();
  id v10 = (PTPDataPacket *)&stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    uint64_t v12 = [&stru_100048E60 substringWithRange:0, 18];
    id v10 = [v12 stringByAppendingString:@".."];
  }
  uint64_t v13 = +[NSString stringWithFormat:@"getObjectPropValue - response:\n%@\n", v9];
  __int16 v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v10;
    char v16 = v14;
    id v17 = [(PTPDataPacket *)v15 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v20 = v17;
    __int16 v21 = 2114;
    id v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_11:
}

- (void)getObjectPropList:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  unsigned __int16 v21 = 8193;
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v21 = 8196;
  }
  else
  {
    id v6 = [v4 parameter1];
    id v7 = [v4 parameter2];
    id v8 = [v4 parameter3];
    id v9 = [v4 parameter4];
    id v10 = [v4 parameter5];
    self->_uint64_t lastTransactionID = v5;
    __int16 v11 = [(PTPVirtualCamera *)self->_virtualCamera objectPropListForHandle:v6 withObjectFormatCode:v7 andPropertyCode:v8 andPropertyGroup:v9 andDepth:v10 responseCode:&v21];
    uint64_t v12 = v11;
    if (v21 == 8193)
    {
      uint64_t v13 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v5, v11);
      [(PTPDeviceUSBTransport *)self->_transport sendData:v13];
      goto LABEL_11;
    }
  }
  __int16 v14 = [PTPOperationResponsePacket alloc];
  uint64_t v12 = [(PTPOperationResponsePacket *)v14 initWithResponseCode:v21 transactionID:v5];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v12];
  __ICOSLogCreate();
  uint64_t v13 = (PTPDataPacket *)&stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v15 = [&stru_100048E60 substringWithRange:0, 18];
    uint64_t v13 = [v15 stringByAppendingString:@".."];
  }
  char v16 = +[NSString stringWithFormat:@"getObjectPropList - response:\n%@\n", v12];
  id v17 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int16 v18 = v13;
    __int16 v19 = v17;
    id v20 = [(PTPDataPacket *)v18 UTF8String];
    *(_DWORD *)buf = 136446466;
    id v23 = v20;
    __int16 v24 = 2114;
    __int16 v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
LABEL_11:
}

- (void)getObjectPropDesc:(id)a3
{
  id v4 = a3;
  id v5 = [v4 transactionID];
  unsigned __int16 v11 = 8193;
  if (v5 <= self->_lastTransactionID)
  {
    unsigned __int16 v11 = 8196;
LABEL_6:
    id v10 = [PTPOperationResponsePacket alloc];
    id v8 = [(PTPOperationResponsePacket *)v10 initWithResponseCode:v11 transactionID:v5];
    [(PTPDeviceUSBTransport *)self->_transport sendResponse:v8];
    goto LABEL_7;
  }
  unsigned __int16 v6 = (unsigned __int16)[v4 parameter1];
  self->_uint64_t lastTransactionID = v5;
  id v7 = [(PTPVirtualCamera *)self->_virtualCamera objectPropDescForObjectPropertyCode:v6 responseCode:&v11];
  id v8 = v7;
  if (v11 != 8193)
  {

    goto LABEL_6;
  }
  id v9 = -[PTPDataPacket initWithOperationCode:transactionID:andData:]([PTPDataPacket alloc], "initWithOperationCode:transactionID:andData:", [v4 operationCode], v5, v7);
  [(PTPDeviceUSBTransport *)self->_transport sendData:v9];

LABEL_7:
}

- (id)usingMacOS
{
  return +[NSNumber numberWithBool:self->_usingMacOS];
}

- (void)setUsingMacOS:(BOOL)a3
{
  self->_usingMacOS = a3;
  objc_super v3 = sub_10000B5F8();
  v5[0] = PLPTPHostCharacteristicsKeyMake;
  v5[1] = PLPTPHostCharacteristicsKeyOS;
  v6[0] = PLPTPHostCharacteristicMake_Apple;
  v6[1] = PLPTPHostCharacteristicOS_macOS;
  v5[2] = PLPTPHostCharacteristicsKeyTransport;
  v6[2] = PLPTPHostCharacteristicTransport_PTP;
  id v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v3 setHostCharacteristics:v4];
}

- (void)setUsingLegacyOS:(BOOL)a3
{
  if (!self->_usingMacOS) {
    self->_usingLegacyOS = a3;
  }
}

- (id)usingLegacyOS
{
  return +[NSNumber numberWithBool:self->_usingLegacyOS];
}

- (id)usingMTP
{
  return +[NSNumber numberWithBool:self->_usingMTP];
}

- (void)resetUsingMTP
{
  self->_usingMTP = 0;
}

- (void)setUsingMTP:(id)a3
{
  id v4 = a3;
  sub_100002688(1);
  __ICOSLogCreate();
  id v5 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    unsigned __int16 v6 = [&stru_100048E60 substringWithRange:0, 18];
    id v5 = [v6 stringByAppendingString:@".."];
  }
  id v7 = +[NSString stringWithFormat:@"MTP Split Packet Transfer\n"];
  id v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v5;
    id v10 = v8;
    *(_DWORD *)buf = 136446466;
    id v19 = [(__CFString *)v9 UTF8String];
    __int16 v20 = 2114;
    unsigned __int16 v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
  self->_usingMTP = [v4 parameter1] != 0;
  unsigned __int16 v11 = [PTPOperationResponsePacket alloc];
  id v12 = [v4 transactionID];

  uint64_t v13 = [(PTPOperationResponsePacket *)v11 initWithResponseCode:8193 transactionID:v12];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v13];
  __int16 v14 = sub_10000B5F8();
  v16[0] = PLPTPHostCharacteristicsKeyMake;
  v16[1] = PLPTPHostCharacteristicsKeyOS;
  v17[0] = PLPTPHostCharacteristicMake_Microsoft;
  v17[1] = PLPTPHostCharacteristicOS_Windows;
  v16[2] = PLPTPHostCharacteristicsKeyTransport;
  v17[2] = PLPTPHostCharacteristicTransport_MTP;
  id v15 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
  [v14 setHostCharacteristics:v15];
}

- (void)setUsingWindows
{
  sub_100002688(1);
  self->_usingMTP = 1;
  objc_super v3 = sub_10000B5F8();
  v5[0] = PLPTPHostCharacteristicsKeyMake;
  v5[1] = PLPTPHostCharacteristicsKeyOS;
  v6[0] = PLPTPHostCharacteristicMake_Microsoft;
  v6[1] = PLPTPHostCharacteristicOS_Windows;
  v5[2] = PLPTPHostCharacteristicsKeyTransport;
  v6[2] = PLPTPHostCharacteristicTransport_MTP;
  id v4 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  [v3 setHostCharacteristics:v4];
}

- (void)allowKeepAwake:(id)a3
{
  id v4 = [a3 transactionID];
  if (self->_sessionID)
  {
    if (v4 <= self->_lastTransactionID)
    {
      uint64_t v5 = 8196;
    }
    else
    {
      self->_allowKeepAwake = 1;
      uint64_t v5 = 8193;
    }
  }
  else
  {
    uint64_t v5 = 8195;
  }
  unsigned __int16 v6 = [[PTPOperationResponsePacket alloc] initWithResponseCode:v5 transactionID:v4];
  [(PTPDeviceUSBTransport *)self->_transport sendResponse:v6];
  __ICOSLogCreate();
  id v7 = &stru_100048E60;
  if ((unint64_t)[&stru_100048E60 length] >= 0x15)
  {
    id v8 = [[&stru_100048E60 substringWithRange:0, 18];
    id v7 = [v8 stringByAppendingString:@".."];
  }
  id v9 = +[NSString stringWithFormat:@"allowKeepAwake - response:\n%@\n", v6];
  id v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int16 v11 = v7;
    id v12 = v10;
    *(_DWORD *)buf = 136446466;
    id v14 = [(__CFString *)v11 UTF8String];
    __int16 v15 = 2114;
    char v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }
}

- (void)holdPowerAssertion
{
  if (self->_allowKeepAwake)
  {
    [(PTPResponder *)self releasePowerAssertion];
    self->_cpPowerAssertion = (void *)CPPowerAssertionCreate();
  }
}

- (void)releasePowerAssertion
{
  cpPowerAssertion = self->_cpPowerAssertion;
  if (cpPowerAssertion)
  {
    CFRelease(cpPowerAssertion);
    self->_cpPowerAssertion = 0;
  }
}

- (PTPDeviceUSBTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (PTPVirtualCamera)virtualCamera
{
  return self->_virtualCamera;
}

- (void)setVirtualCamera:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (unsigned)lastTransactionID
{
  return self->_lastTransactionID;
}

- (void)setLastTransactionID:(unsigned int)a3
{
  self->_uint64_t lastTransactionID = a3;
}

- (unsigned)canceledTransactionID
{
  return self->_canceledTransactionID;
}

- (void)setCanceledTransactionID:(unsigned int)a3
{
  self->_canceledTransactionID = a3;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (PTPOperationRequestPacket)operationRequest
{
  return self->_operationRequest;
}

- (void)setOperationRequest:(id)a3
{
}

- (PTPOperationResponsePacket)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (PTPEventPacket)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (BOOL)hostSupportsGroups
{
  return self->_hostSupportsGroups;
}

- (void)setHostSupportsGroups:(BOOL)a3
{
  self->_hostSupportsGroups = a3;
}

- (BOOL)usingPeerMediaCapabilities
{
  return self->_usingPeerMediaCapabilities;
}

- (void)setUsingPeerMediaCapabilities:(BOOL)a3
{
  self->_usingPeerMediaCapabilities = a3;
}

- (OS_dispatch_queue)photoLibraryMediaQueryQueue
{
  return self->_photoLibraryMediaQueryQueue;
}

- (void)setPhotoLibraryMediaQueryQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryMediaQueryQueue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_operationRequest, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_virtualCamera, 0);

  objc_storeStrong((id *)&self->_transport, 0);
}

@end