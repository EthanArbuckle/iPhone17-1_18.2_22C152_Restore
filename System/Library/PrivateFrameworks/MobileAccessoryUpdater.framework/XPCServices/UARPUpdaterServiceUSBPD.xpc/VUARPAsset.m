@interface VUARPAsset
- (BOOL)assetMetaDataComplete:(id)a3 error:(id *)a4;
- (BOOL)assetMetaDataTLV:(id)a3 type:(unsigned int)a4 length:(unsigned int)a5 value:(char *)a6 error:(id *)a7;
- (BOOL)assetReady:(id)a3 error:(id *)a4;
- (BOOL)getBytesAtOffset:(unsigned int)a3 accessory:(id)a4 buffer:(void *)a5 length:(unsigned __int16)a6 bytesCopied:(unsigned __int16 *)a7;
- (BOOL)payloadData:(id)a3 data:(id)a4 offset:(unsigned int)a5 error:(id *)a6;
- (BOOL)payloadDataComplete:(id)a3 error:(id *)a4;
- (BOOL)payloadMetaDataComplete:(id)a3 error:(id *)a4;
- (BOOL)payloadMetaDataTLV:(id)a3 type:(unsigned int)a4 length:(unsigned int)a5 value:(char *)a6 error:(id *)a7;
- (BOOL)payloadReady:(id)a3 error:(id *)a4;
- (BOOL)setBytesAtOffset:(unsigned int)a3 accessory:(id)a4 buffer:(void *)a5 length:(unsigned __int16)a6;
- (NSURL)url;
- (UARPAssetTag)assetTag;
- (UARPAssetTag)payloadAssetTag;
- (UARPAssetVersion)assetVersion;
- (VUARPAsset)init;
- (VUARPAsset)initWithLayer2Asset:(uarpPlatformAsset *)a3 controller:(id)a4;
- (id)initSolicitedDynamicAsset:(id)a3 controller:(id)a4;
- (uarpPlatformAsset)uarpAsset;
- (uarpPlatformAssetCallbacks)uarpCallbacks;
- (unint64_t)payloadIndex;
- (void)abandonAsset:(id)a3 reason:(unsigned __int16)a4;
- (void)corrupted:(id)a3;
- (void)orphaned:(id)a3;
- (void)rescinded:(id)a3;
- (void)setCallbacks;
@end

@implementation VUARPAsset

- (VUARPAsset)init
{
  return 0;
}

- (VUARPAsset)initWithLayer2Asset:(uarpPlatformAsset *)a3 controller:(id)a4
{
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUARPAsset;
  v8 = [(VUARPAsset *)&v12 init];
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "virtualUARP");
    log = v8->_log;
    v8->_log = (OS_os_log *)v9;

    v8->_uarpAssetInternal = a3;
    [(VUARPAsset *)v8 setCallbacks];
    objc_storeStrong((id *)&v8->_uarpController, a4);
  }

  return v8;
}

- (id)initSolicitedDynamicAsset:(id)a3 controller:(id)a4
{
  id v7 = a3;
  v8 = [(VUARPAsset *)self initWithLayer2Asset:0 controller:a4];
  os_log_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assetTag, a3);
    uint64_t v10 = uarpDynamicAssetURL();
    url = v9->_url;
    v9->_url = (NSURL *)v10;
  }
  return v9;
}

- (void)setCallbacks
{
  self->_uarpCallbacksInternal.fAssetReady = sub_10000E9A0;
  self->_uarpCallbacksInternal.fAssetMetaDataTLV = sub_10000E9B0;
  self->_uarpCallbacksInternal.fAssetMetaDataComplete = sub_10000E9CC;
  self->_uarpCallbacksInternal.fAssetMetaDataProcessingError = nullsub_1;
  self->_uarpCallbacksInternal.fPayloadReady = sub_10000E9E0;
  self->_uarpCallbacksInternal.fPayloadMetaDataTLV = sub_10000E9F0;
  self->_uarpCallbacksInternal.fPayloadMetaDataComplete = sub_10000EA0C;
  self->_uarpCallbacksInternal.fPayloadMetaDataProcessingError = nullsub_2;
  self->_uarpCallbacksInternal.fPayloadData = sub_10000EA20;
  self->_uarpCallbacksInternal.fPayloadDataComplete = sub_10000EAD4;
  self->_uarpCallbacksInternal.fAssetGetBytesAtOffset2 = sub_10000EB44;
  self->_uarpCallbacksInternal.fAssetSetBytesAtOffset2 = sub_10000EB80;
  self->_uarpCallbacksInternal.fAssetRescinded = sub_10000EBBC;
  self->_uarpCallbacksInternal.fAssetCorrupt = sub_10000EBCC;
  self->_uarpCallbacksInternal.fAssetOrphaned = sub_10000EBD8;
  self->_uarpCallbacksInternal.fAssetReleased2 = j__objc_msgSend_assetReleased_;
  self->_uarpCallbacksInternal.fAssetProcessingNotification2 = sub_10000EBE8;
  self->_uarpCallbacksInternal.fAssetProcessingNotificationAck = 0;
}

- (uarpPlatformAsset)uarpAsset
{
  return self->_uarpAssetInternal;
}

- (uarpPlatformAssetCallbacks)uarpCallbacks
{
  return &self->_uarpCallbacksInternal;
}

- (UARPAssetVersion)assetVersion
{
  id v2 = [objc_alloc((Class)UARPAssetVersion) initWithMajorVersion:self->_uarpAssetInternal->var0.var3.major minorVersion:self->_uarpAssetInternal->var0.var3.minor releaseVersion:self->_uarpAssetInternal->var0.var3.release buildVersion:self->_uarpAssetInternal->var0.var3.build];
  return (UARPAssetVersion *)v2;
}

- (BOOL)assetReady:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (uarpPlatformEndpointAssetRequestMetaData([v6 uarpEndpoint], self->_uarpAssetInternal) == 40)BOOL v7 = -[VUARPAsset assetMetaDataComplete:error:](self, "assetMetaDataComplete:error:", v6, a4); {
  else
  }
    BOOL v7 = 1;

  return v7;
}

- (BOOL)assetMetaDataTLV:(id)a3 type:(unsigned int)a4 length:(unsigned int)a5 value:(char *)a6 error:(id *)a7
{
  id v11 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109632;
    v14[1] = a4;
    __int16 v15 = 1024;
    unsigned int v16 = a5;
    __int16 v17 = 2048;
    v18 = a6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Asset TLV T = 0x%08x, L = %d, V = %p", (uint8_t *)v14, 0x18u);
  }
  if (a4 == -858619645 && a5 == 4 && *(_DWORD *)a6) {
    self->_ignoreVersion = 1;
  }

  return 1;
}

- (BOOL)assetMetaDataComplete:(id)a3 error:(id *)a4
{
  id v5 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    id v11 = "-[VUARPAsset assetMetaDataComplete:error:]";
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Checking version of asset %@", (uint8_t *)&v10, 0x16u);
  }
  self->_payloadIndex = 0;
  unsigned int v7 = uarpPlatformEndpointAssetSetPayloadIndex((uint64_t)[v5 uarpEndpoint], (uint64_t)self->_uarpAssetInternal, self->_payloadIndex);
  if (v7)
  {
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000239C8(v8, v7);
    }
  }

  return v7 == 0;
}

- (BOOL)payloadReady:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 payloadReady:self error:a4])
  {
    if (uarpPlatformEndpointPayloadRequestMetaData([v6 uarpEndpoint], self->_uarpAssetInternal) == 40)BOOL v7 = -[VUARPAsset payloadMetaDataComplete:error:](self, "payloadMetaDataComplete:error:", v6, a4); {
    else
    }
      BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)payloadMetaDataTLV:(id)a3 type:(unsigned int)a4 length:(unsigned int)a5 value:(char *)a6 error:(id *)a7
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109632;
    v11[1] = a4;
    __int16 v12 = 1024;
    unsigned int v13 = a5;
    __int16 v14 = 2048;
    __int16 v15 = a6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Payload TLV T = 0x%08x, L = %d, V = %p", (uint8_t *)v11, 0x18u);
  }
  return 1;
}

- (BOOL)payloadMetaDataComplete:(id)a3 error:(id *)a4
{
  return uarpPlatformEndpointPayloadRequestData((uint64_t)[a3 uarpEndpoint], (uint64_t)self->_uarpAssetInternal) == 0;
}

- (BOOL)payloadData:(id)a3 data:(id)a4 offset:(unsigned int)a5 error:(id *)a6
{
  return [a3 payloadData:a4 offset:a5 asset:self error:a6];
}

- (BOOL)payloadDataComplete:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 payloadDataComplete:self error:a4]) {
    unsigned __int8 v7 = [v6 fullyStaged:self error:a4];
  }
  else {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)rescinded:(id)a3
{
  self->_isRescinded = 1;
}

- (void)orphaned:(id)a3
{
  self->_isOrphaned = 1;
}

- (void)corrupted:(id)a3
{
  self->_isCorrupted = 1;
}

- (void)abandonAsset:(id)a3 reason:(unsigned __int16)a4
{
  unsigned int v5 = uarpPlatformEndpointAssetAbandon((uint64_t)[a3 uarpEndpoint], (uint64_t)-[VUARPController uarpRemoteEndpoint](self->_uarpController, "uarpRemoteEndpoint"), (uint64_t)self->_uarpAssetInternal, a4);
  if (v5)
  {
    unsigned int v6 = v5;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      sub_100023A5C(log, v6);
    }
  }
}

- (BOOL)getBytesAtOffset:(unsigned int)a3 accessory:(id)a4 buffer:(void *)a5 length:(unsigned __int16)a6 bytesCopied:(unsigned __int16 *)a7
{
  unsigned int v8 = a6;
  __int16 v12 = +[NSFileHandle fileHandleForReadingFromURL:self->_url error:0];
  unsigned int v13 = v12;
  if (v12)
  {
    unsigned __int8 v14 = [v12 uarpSeekToOffset:a3 error:0];
    if ((v14 & 1) == 0 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100023AF0();
    }
    id v15 = [v13 uarpReadDataUpToLength:v8 error:0];
    memmove(a5, [v15 bytes], (size_t)objc_msgSend(v15, "length"));
    if (a7) {
      *a7 = (unsigned __int16)[v15 length];
    }
    [v13 uarpCloseAndReturnError:0];
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (BOOL)setBytesAtOffset:(unsigned int)a3 accessory:(id)a4 buffer:(void *)a5 length:(unsigned __int16)a6
{
  unsigned int v6 = a6;
  int v10 = +[NSFileHandle fileHandleForUpdatingURL:self->_url error:0];
  id v11 = v10;
  if (v10)
  {
    if (([v10 uarpSeekToOffset:a3 error:0] & 1) == 0
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_100023C00();
    }
    __int16 v12 = +[NSData dataWithBytes:a5 length:v6];
    unsigned __int8 v13 = [v11 uarpWriteData:v12 error:0];

    if ((v13 & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_100023B70((uint64_t *)&self->_url, log);
      }
    }
    [v11 uarpCloseAndReturnError:0];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (UARPAssetTag)assetTag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 264, 1);
}

- (unint64_t)payloadIndex
{
  return self->_payloadIndex;
}

- (UARPAssetTag)payloadAssetTag
{
  return (UARPAssetTag *)objc_getProperty(self, a2, 280, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 288, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_payloadAssetTag, 0);
  objc_storeStrong((id *)&self->_assetTag, 0);
  objc_storeStrong((id *)&self->_uarpController, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end