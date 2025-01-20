@interface VUARPAccessory
- (BOOL)addController;
- (BOOL)connectToUARP:(id *)a3;
- (BOOL)fullyStaged:(id)a3 error:(id *)a4;
- (BOOL)payloadData:(id)a3 offset:(unint64_t)a4 asset:(id)a5 error:(id *)a6;
- (BOOL)payloadDataComplete:(id)a3 error:(id *)a4;
- (BOOL)payloadReady:(id)a3 error:(id *)a4;
- (BOOL)removeController;
- (BOOL)uarpApplyStagedAssets:(id)a3 flags:(unsigned __int16 *)a4 error:(id *)a5;
- (BOOL)uarpAssetSolicited:(id)a3 tag:(UARP4ccTag *)a4 error:(id *)a5;
- (BOOL)uarpDynamicAssetOffered:(id)a3 asset:(uarpPlatformAsset *)a4 error:(id *)a5;
- (BOOL)uarpLastError:(unsigned int *)a3 lastAction:(unsigned int *)a4;
- (BOOL)uarpRescindAllAssets:(id)a3 error:(id *)a4;
- (BOOL)uarpSendMessage:(id)a3 controller:(id)a4 error:(id *)a5;
- (BOOL)uarpSuperBinaryOffered:(id)a3 asset:(uarpPlatformAsset *)a4 error:(id *)a5;
- (BOOL)uarpTransferPause:(id)a3 error:(id *)a4;
- (BOOL)uarpTransferResume:(id)a3 error:(id *)a4;
- (NSString)appleModelNumber;
- (NSString)hardwareVersion;
- (NSString)hwFusingType;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)serialNumber;
- (UARPAssetVersion)fwActiveVersion;
- (UARPAssetVersion)fwStagedVersion;
- (VUARPAccessory)init;
- (VUARPAccessory)initWithDelegate:(id)a3 options:(uarpPlatformOptionsObj *)a4;
- (uarpPlatformEndpoint)uarpEndpoint;
- (unint64_t)maxTxPayloadLength;
- (unsigned)recvMessage:(id)a3;
- (void)assetReleased:(id)a3;
- (void)disconnectFromUARP;
@end

@implementation VUARPAccessory

- (VUARPAccessory)init
{
  return 0;
}

- (VUARPAccessory)initWithDelegate:(id)a3 options:(uarpPlatformOptionsObj *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUARPAccessory;
  v7 = [(VUARPAccessory *)&v19 init];
  if (v7)
  {
    os_log_t v8 = os_log_create("com.apple.accessoryupdater.uarp", "virtualUARP");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.vuarp.accessory", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    objc_storeWeak((id *)&v7->_delegate, v6);
    v7->_uarpCallbacks.fRequestBuffer = sub_100013410;
    v7->_uarpCallbacks.fReturnBuffer = sub_100013454;
    v7->_uarpCallbacks.fRequestTransmitMsgBuffer = sub_100013464;
    v7->_uarpCallbacks.fReturnTransmitMsgBuffer = sub_1000134BC;
    v7->_uarpCallbacks.fSendMessage = sub_1000134CC;
    v7->_uarpCallbacks.fDataTransferPause = sub_100013588;
    v7->_uarpCallbacks.fDataTransferResume = sub_1000135B4;
    v7->_uarpCallbacks.fSuperBinaryOffered = sub_1000135E0;
    v7->_uarpCallbacks.fDynamicAssetOffered = sub_1000135F0;
    v7->_uarpCallbacks.fApplyStagedAssets = sub_100013600;
    v7->_uarpCallbacks.fManufacturerName = sub_100013630;
    v7->_uarpCallbacks.fModelName = sub_1000136C4;
    v7->_uarpCallbacks.fSerialNumber = sub_100013758;
    v7->_uarpCallbacks.fHardwareVersion = sub_100013820;
    v7->_uarpCallbacks.fActiveFirmwareVersion2 = sub_1000138B4;
    v7->_uarpCallbacks.fStagedFirmwareVersion2 = sub_100013924;
    v7->_uarpCallbacks.fLastError = sub_100013994;
    v7->_uarpCallbacks.fAssetSolicitation = sub_1000139F4;
    v7->_uarpCallbacks.fRescindAllAssets = sub_100013A24;
    long long v12 = *(_OWORD *)&a4->maxTxPayloadLength;
    long long v13 = *(_OWORD *)&a4->responseTimeout;
    *(_DWORD *)&v7->_uarpOptions.upgradeOnly = *(_DWORD *)&a4->upgradeOnly;
    *(_OWORD *)&v7->_uarpOptions.responseTimeout = v13;
    *(_OWORD *)&v7->_uarpOptions.maxTxPayloadLength = v12;
    v7->_vendor.callbacks.fAppleModelNumber = sub_100013A30;
    v7->_vendor.callbacks.fHwFusingType = sub_100013ACC;
    *(_WORD *)&v7->_vendor.supportsPersonalization = 0;
    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    assets = v7->_assets;
    v7->_assets = v14;

    v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    txAssets = v7->_txAssets;
    v7->_txAssets = v16;
  }
  return v7;
}

- (uarpPlatformEndpoint)uarpEndpoint
{
  return &self->_uarpAccessoryInternal;
}

- (BOOL)addController
{
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100024808();
  }
  return uarpPlatformRemoteEndpointAdd((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)[(VUARPController *)self->_remoteEndpoint uarpRemoteEndpoint], (long long *)&self->_uarpOptions, (uint64_t)self->_remoteEndpoint) == 0;
}

- (BOOL)removeController
{
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_100024880();
  }
  return uarpPlatformRemoteEndpointRemove((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)[(VUARPController *)self->_remoteEndpoint uarpRemoteEndpoint]) == 0;
}

- (BOOL)connectToUARP:(id *)a3
{
  v4 = objc_alloc_init(VUARPController);
  remoteEndpoint = self->_remoteEndpoint;
  self->_remoteEndpoint = v4;

  int v6 = uarpPlatformEndpointInit((char *)&self->_uarpAccessoryInternal, (uint64_t)self, 0, (long long *)&self->_uarpOptions, &self->_uarpCallbacks, (uint64_t)&self->_vendor, (uint64_t)uarpPlatformEndpointCallbackAppleSpecific);
  if (!v6) {
    [(VUARPAccessory *)self addController];
  }
  return v6 == 0;
}

- (void)disconnectFromUARP
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013D30;
  block[3] = &unk_1000385A8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (unint64_t)maxTxPayloadLength
{
  return self->_uarpOptions.maxTxPayloadLength;
}

- (BOOL)uarpSendMessage:(id)a3 controller:(id)a4 error:(id *)a5
{
  id v7 = a3;
  os_log_t v8 = (VUARPController *)a4;
  remoteEndpoint = self->_remoteEndpoint;
  if (remoteEndpoint == v8)
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_100013E88;
    v21[4] = sub_100013E98;
    id v22 = +[NSData dataWithData:v7];
    queue = self->_queue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100013EA0;
    v20[3] = &unk_1000387A0;
    v20[4] = self;
    v20[5] = v21;
    dispatch_async((dispatch_queue_t)queue, v20);
    _Block_object_dispose(v21, 8);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000248F8(log, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  return remoteEndpoint == v8;
}

- (BOOL)uarpTransferPause:(id)a3 error:(id *)a4
{
  v5 = (VUARPController *)a3;
  int v6 = v5;
  remoteEndpoint = self->_remoteEndpoint;
  if (remoteEndpoint == v5)
  {
    [(VUARPController *)v5 pauseDataTransfer];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000249F4(log, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return remoteEndpoint == v6;
}

- (BOOL)uarpTransferResume:(id)a3 error:(id *)a4
{
  v5 = (VUARPController *)a3;
  int v6 = v5;
  remoteEndpoint = self->_remoteEndpoint;
  if (remoteEndpoint == v5)
  {
    [(VUARPController *)v5 resumeDataTransfer];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100024A6C(log, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  return remoteEndpoint == v6;
}

- (BOOL)uarpSuperBinaryOffered:(id)a3 asset:(uarpPlatformAsset *)a4 error:(id *)a5
{
  id v7 = (VUARPController *)a3;
  if (self->_remoteEndpoint == v7)
  {
    uint64_t v17 = [[VUARPAsset alloc] initWithLayer2Asset:a4 controller:self->_remoteEndpoint];
    [(NSMutableArray *)self->_assets addObject:v17];
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
    {
      remoteEndpoint = self->_remoteEndpoint;
      *(_DWORD *)buf = 138412802;
      v29 = v17;
      __int16 v30 = 2112;
      v31 = self;
      __int16 v32 = 2112;
      v33 = remoteEndpoint;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "Asset %@ offered to accessory %@ from controller %@", buf, 0x20u);
    }
    char v27 = 0;
    *(_WORD *)buf = 0;
    p_uarpAccessoryInternal = &self->_uarpAccessoryInternal;
    BOOL v16 = 0;
    if (uarpPlatformEndpointAssetIsAcceptable(&self->_uarpAccessoryInternal._options.maxTxPayloadLength, (uint64_t)a4, &v27, (__int16 *)buf))goto LABEL_24; {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    unsigned __int8 v21 = [WeakRetained vuarpStageAllowed];

    if (v21)
    {
      if (v27)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
          sub_100024BB4();
        }
        if (!uarpPlatformEndpointAssetAccept((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)[(VUARPController *)self->_remoteEndpoint uarpRemoteEndpoint], (uint64_t)a4, (uint64_t)v17, [(VUARPAsset *)v17 uarpCallbacks]))
        {
          id v22 = objc_loadWeakRetained((id *)&self->_delegate);
          unsigned __int8 v23 = [v22 vuarpAssetOffered];

          if (v23)
          {
            BOOL v16 = 1;
            self->_isStaging = 1;
LABEL_24:

            goto LABEL_25;
          }
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            sub_100024B4C();
          }
        }
        BOOL v16 = 0;
        goto LABEL_24;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_100024C28();
      }
      *(_WORD *)buf = 3584;
      char v27 = 0;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100024AE4();
    }
    v24 = [(VUARPController *)self->_remoteEndpoint uarpRemoteEndpoint];
    BOOL v16 = uarpPlatformEndpointAssetDeny((uint64_t)p_uarpAccessoryInternal, (uint64_t)v24, (uint64_t)a4, *(unsigned __int16 *)buf, (uint64_t)v17, [(VUARPAsset *)v17 uarpCallbacks]) == 0;
    goto LABEL_24;
  }
  os_log_t v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    sub_100024C90(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  BOOL v16 = 0;
LABEL_25:

  return v16;
}

- (BOOL)uarpDynamicAssetOffered:(id)a3 asset:(uarpPlatformAsset *)a4 error:(id *)a5
{
  id v7 = (VUARPController *)a3;
  os_log_t v8 = v7;
  remoteEndpoint = self->_remoteEndpoint;
  if (remoteEndpoint == v7)
  {
    uarpPlatformEndpointAssetDeny((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)[(VUARPController *)v7 uarpRemoteEndpoint], (uint64_t)a4, 3072, 0, 0);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100024D08(log, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  return remoteEndpoint == v8;
}

- (BOOL)uarpApplyStagedAssets:(id)a3 flags:(unsigned __int16 *)a4 error:(id *)a5
{
  id v7 = (VUARPController *)a3;
  if (self->_remoteEndpoint == v7)
  {
    if (self->_isStaging)
    {
      *a4 = 5;
      BOOL v16 = 1;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned int v18 = [WeakRetained vuarpApplyStagedAssets];

      BOOL v16 = v18 == 1;
      *a4 = v18;
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100024D80(log, v9, v10, v11, v12, v13, v14, v15);
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)uarpAssetSolicited:(id)a3 tag:(UARP4ccTag *)a4 error:(id *)a5
{
  id v7 = (VUARPController *)a3;
  if (self->_remoteEndpoint == v7)
  {
    uint64_t v17 = uarpAssetTagStructLogs();
    if (uarp4ccCompare(&a4->var0, (unsigned __int8 *)v17))
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_100024F60(log, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      v26 = uarpAssetTagStructAnalytics();
      BOOL v27 = uarp4ccCompare(&a4->var0, (unsigned __int8 *)v26);
      v28 = self->_log;
      BOOL v29 = os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR);
      if (!v27)
      {
        if (v29) {
          sub_100025050(v28, v30, v31, v32, v33, v34, v35, v36);
        }
        uarpPlatformEndpointDynamicAssetSolicitationDeny((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)[(VUARPController *)self->_remoteEndpoint uarpRemoteEndpoint], a4, 3072);
        goto LABEL_4;
      }
      if (v29) {
        sub_100024FD8(v28, v30, v31, v32, v33, v34, v35, v36);
      }
    }
    id v37 = [objc_alloc((Class)UARPAssetTag) initWithChar1:(char)a4->var0 char2:(char)a4->var1 char3:(char)a4->var2 char4:(char)a4->var3];
    id v38 = [[VUARPAsset alloc] initSolicitedDynamicAsset:v37 controller:self->_remoteEndpoint];
    [(NSMutableArray *)self->_txAssets addObject:v38];
    uarpPlatformEndpointPrepareDynamicAsset((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)-[VUARPController uarpRemoteEndpoint](self->_remoteEndpoint, "uarpRemoteEndpoint"), (uint64_t)v38, a4, (uint64_t)[v38 uarpCallbacks]);
    if (v39)
    {
      v40 = self->_log;
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR)) {
        sub_100024EE8(v40, v41, v42, v43, v44, v45, v46, v47);
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v49 = [WeakRetained vuarpDynamicAssetSolicited:v38];

      if (v49)
      {
        if (!uarpPlatformEndpointOfferAsset((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)[(VUARPController *)self->_remoteEndpoint uarpRemoteEndpoint], (uint64_t)v38))
        {
          BOOL v16 = 1;
          goto LABEL_25;
        }
        v50 = self->_log;
        if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_ERROR)) {
          sub_100024DF8(v50, v51, v52, v53, v54, v55, v56, v57);
        }
      }
      else
      {
        v58 = self->_log;
        if (os_log_type_enabled((os_log_t)v58, OS_LOG_TYPE_ERROR)) {
          sub_100024E70(v58, v59, v60, v61, v62, v63, v64, v65);
        }
        uarpPlatformEndpointDynamicAssetSolicitationDeny((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)[(VUARPController *)self->_remoteEndpoint uarpRemoteEndpoint], a4, 2304);
      }
    }
    BOOL v16 = 0;
LABEL_25:

    goto LABEL_26;
  }
  os_log_t v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    sub_1000250C8(v8, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_4:
  BOOL v16 = 0;
LABEL_26:

  return v16;
}

- (BOOL)uarpRescindAllAssets:(id)a3 error:(id *)a4
{
  v5 = (VUARPController *)a3;
  if (self->_remoteEndpoint == v5)
  {
    [(NSMutableArray *)self->_assets removeAllObjects];
    self->_isStaging = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v14 = [WeakRetained vuarpRescindStagedAssets];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100025140(log, v7, v8, v9, v10, v11, v12, v13);
    }
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)payloadReady:(id)a3 error:(id *)a4
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v5 payloadAssetTag];

  LOBYTE(v5) = [WeakRetained vuarpFirmwarePayloadReady:v7];
  return (char)v5;
}

- (BOOL)payloadData:(id)a3 offset:(unint64_t)a4 asset:(id)a5 error:(id *)a6
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v12 = [v9 payloadAssetTag];

  LOBYTE(a4) = [WeakRetained vuarpFirmwarePayloadData:v12 data:v10 offset:a4];
  return a4;
}

- (BOOL)payloadDataComplete:(id)a3 error:(id *)a4
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v7 = [v5 payloadAssetTag];

  LOBYTE(v5) = [WeakRetained vuarpFirmwarePayloadComplete:v7];
  return (char)v5;
}

- (BOOL)fullyStaged:(id)a3 error:(id *)a4
{
  self->_isStaging = 0;
  p_delegate = &self->_delegate;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v8 = [v6 assetVersion];
  unsigned __int8 v9 = [WeakRetained vuarpAssetFullyStaged:v8];

  id v10 = [v6 uarpAsset];
  if (uarpPlatformEndpointAssetFullyStaged((uint64_t)&self->_uarpAccessoryInternal, (uint64_t)v10)) {
    return 0;
  }
  else {
    return v9;
  }
}

- (void)assetReleased:(id)a3
{
}

- (unsigned)recvMessage:(id)a3
{
  id v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_100013E88;
  v11[4] = sub_100013E98;
  id v12 = +[NSData dataWithData:v4];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014A40;
  block[3] = &unk_1000387C8;
  id v9 = v4;
  id v10 = v11;
  block[4] = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, block);

  _Block_object_dispose(v11, 8);
  return 0;
}

- (NSString)manufacturerName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained vuarpManufacturerName];

  return (NSString *)v3;
}

- (NSString)modelName
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained vuarpModelName];

  return (NSString *)v3;
}

- (NSString)serialNumber
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained vuarpSerialNumber];

  return (NSString *)v3;
}

- (NSString)hardwareVersion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained vuarpHardwareVersion];

  return (NSString *)v3;
}

- (UARPAssetVersion)fwActiveVersion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained vuarpActiveFirmwareVersion];

  return (UARPAssetVersion *)v3;
}

- (UARPAssetVersion)fwStagedVersion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained vuarpStagedFirmwareVersion];

  return (UARPAssetVersion *)v3;
}

- (NSString)appleModelNumber
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained vuarpAppleModelNumber];

  return (NSString *)v3;
}

- (NSString)hwFusingType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained vuarpHwFusingType];

  return (NSString *)v3;
}

- (BOOL)uarpLastError:(unsigned int *)a3 lastAction:(unsigned int *)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(a4) = [WeakRetained vuarpLastError:a3 lastAction:a4];

  return (char)a4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_txAssets, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end