@interface UARPService
+ (id)UUID;
- (BOOL)isSendingData;
- (BOOL)uarpOverAACP;
- (CBCharacteristic)uarpDataControlPointCharacteristic;
- (NSMutableArray)txDataQueue;
- (NSMutableData)recvDataMessage;
- (NSURL)loggingSuperbinaryURL;
- (UARPAccessory)uarpAccessory;
- (UARPAssetID)uarpAssetID;
- (UARPService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (id)_createPacket:(unint64_t)a3 payloadOffset:(unint64_t)a4 payloadLength:(unint64_t)a5 payload:(id)a6;
- (id)_extractPayload:(id)a3;
- (id)_packetizeData:(id)a3;
- (int64_t)opportunisticRefCount;
- (unint64_t)maxPayloadSize;
- (unsigned)_extractHeader:(id)a3;
- (void)_parseRecvdAACPData:(id)a3;
- (void)_parseRecvdData:(id)a3;
- (void)_prepareForFirmwareDownload;
- (void)assetSolicitationComplete;
- (void)decOpportunisticConnection;
- (void)incOpportunisticConnection;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)recvDataOverAACP:(id)a3;
- (void)sendData:(id)a3;
- (void)setIsSendingData:(BOOL)a3;
- (void)setLoggingSuperbinaryURL:(id)a3;
- (void)setMaxPayloadSize:(unint64_t)a3;
- (void)setOpportunisticRefCount:(int64_t)a3;
- (void)setRecvDataMessage:(id)a3;
- (void)setTxDataQueue:(id)a3;
- (void)setUarpAccessory:(id)a3;
- (void)setUarpAssetID:(id)a3;
- (void)setUarpDataControlPointCharacteristic:(id)a3;
- (void)setUarpOverAACP:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation UARPService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDUnifiedAccessoryRestoreProtocolServiceString];
}

- (UARPService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)UARPService;
  id v7 = a4;
  v8 = [(ClientService *)&v16 initWithManager:a3 peripheral:v7 service:a5];
  v9 = v8;
  if (v8) {
    -[ClientService setIsPrimary:](v8, "setIsPrimary:", 1, v16.receiver, v16.super_class);
  }
  v10 = +[UARPServiceUARPControllerManager instance];
  v11 = [v7 identifier];

  -[UARPService setUarpOverAACP:](v9, "setUarpOverAACP:", [v10 getAndRemoveFromUARPTransportDict:v11]);
  v12 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    unsigned int v14 = [(UARPService *)v9 uarpOverAACP];
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "UARPService: setting uarpOverAACP to %u", buf, 8u);
  }
  return v9;
}

- (void)start
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting UARP procedure", buf, 2u);
  }
  v15.receiver = self;
  v15.super_class = (Class)UARPService;
  [(ClientService *)&v15 start];
  v4 = +[UARPServiceUARPControllerManager instance];
  if (([v4 tapToRadarIsOngoing] & 1) == 0)
  {

    goto LABEL_7;
  }
  v5 = +[LoggingManager instance];
  v6 = [(ClientService *)self peripheral];
  id v7 = [v6 identifier];
  unsigned int v8 = [v5 wasUUIDRequestedForLogRetrieval:v7];

  if (!v8)
  {
LABEL_7:
    v9 = +[CattManager instance];
    v10 = [(ClientService *)self peripheral];
    [v9 setOpportunisticConnection:v10];
    goto LABEL_8;
  }
  v9 = +[CattManager instance];
  v10 = [(ClientService *)self peripheral];
  [v9 removeOpportunisticConnection:v10];
LABEL_8:

  v11 = +[CBUUID UUIDWithString:CBUUIDUARPDataControlPointCharacteristicString];
  v17 = v11;
  v12 = +[NSArray arrayWithObjects:&v17 count:1];

  v13 = [(ClientService *)self peripheral];
  unsigned int v14 = [(ClientService *)self service];
  [v13 discoverCharacteristics:v12 forService:v14];
}

- (void)stop
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping UARP procedure", buf, 2u);
  }
  v4 = +[UARPServiceUARPControllerManager instance];
  v5 = [(UARPService *)self uarpAccessory];
  [v4 unregisterUARPService:self withUARPAccessory:v5];

  v6.receiver = self;
  v6.super_class = (Class)UARPService;
  [(ClientService *)&v6 stop];
}

- (void)_prepareForFirmwareDownload
{
  v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_prepareForFirmwareDownload", v10, 2u);
  }
  v4 = [(ClientService *)self peripheral];
  v5 = (char *)[v4 maximumWriteValueLengthForType:0];

  [(UARPService *)self setMaxPayloadSize:v5 - 1];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  [(UARPService *)self setTxDataQueue:v6];

  id v7 = objc_alloc_init((Class)NSMutableData);
  [(UARPService *)self setRecvDataMessage:v7];

  unsigned int v8 = [(ClientService *)self peripheral];
  v9 = [(UARPService *)self uarpDataControlPointCharacteristic];
  [v8 setNotifyValue:1 forCharacteristic:v9];
}

- (void)sendData:(id)a3
{
  id v4 = a3;
  if ([(UARPService *)self uarpOverAACP])
  {
    v5 = +[BTLEXpcServer instance];
    v29[0] = @"kUARPDeviceUUID";
    id v6 = [(ClientService *)self peripheral];
    id v7 = [v6 identifier];
    unsigned int v8 = [v7 UUIDString];
    v29[1] = @"kUARPData";
    v30[0] = v8;
    v30[1] = v4;
    v9 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    [v5 sendMsg:@"UARPDataOverAACP" args:v9];
  }
  else
  {
    v5 = [(UARPService *)self _packetizeData:v4];
    v10 = [(UARPService *)self txDataQueue];
    [v10 addObjectsFromArray:v5];

    if ([(UARPService *)self isSendingData])
    {
LABEL_9:

      goto LABEL_10;
    }
    [(UARPService *)self setIsSendingData:1];
    v11 = [(UARPService *)self txDataQueue];
    v12 = [v11 firstObject];

    v13 = [(UARPService *)self txDataQueue];
    [v13 removeObjectAtIndex:0];

    unsigned int v14 = [(ClientService *)self peripheral];
    objc_super v15 = [(UARPService *)self uarpDataControlPointCharacteristic];
    [v14 writeValue:v12 forCharacteristic:v15 type:0];
  }
  objc_super v16 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    v5 = [(ClientService *)self peripheral];
    unsigned int v18 = [v5 identifier];
    v19 = [v18 UUIDString];
    id v20 = [v4 length];
    unsigned int v21 = [(UARPService *)self uarpOverAACP];
    v22 = "GATT";
    int v23 = 138412802;
    v24 = v19;
    if (v21) {
      v22 = "AACP";
    }
    __int16 v25 = 2048;
    id v26 = v20;
    __int16 v27 = 2080;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "sendData - peripheral:%@ length:%lu profile: %s", (uint8_t *)&v23, 0x20u);

    goto LABEL_9;
  }
LABEL_10:
}

- (void)recvDataOverAACP:(id)a3
{
}

- (id)_packetizeData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  unint64_t v6 = [(UARPService *)self maxPayloadSize];
  if (v6 >= (unint64_t)[v4 length])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 0;
    do
    {
      unsigned int v8 = [(UARPService *)self _createPacket:0 payloadOffset:v7 payloadLength:[(UARPService *)self maxPayloadSize] payload:v4];
      [v5 addObject:v8];
      v7 += [(UARPService *)self maxPayloadSize];

      v9 = (char *)[(UARPService *)self maxPayloadSize] + v7;
    }
    while (v9 < [v4 length]);
  }
  v10 = -[UARPService _createPacket:payloadOffset:payloadLength:payload:](self, "_createPacket:payloadOffset:payloadLength:payload:", 1, v7, (char *)[v4 length] - v7, v4);
  [v5 addObject:v10];

  return v5;
}

- (id)_createPacket:(unint64_t)a3 payloadOffset:(unint64_t)a4 payloadLength:(unint64_t)a5 payload:(id)a6
{
  unint64_t v13 = a3;
  id v8 = a6;
  id v9 = objc_alloc_init((Class)NSMutableData);
  v10 = +[NSData dataWithBytes:&v13 length:1];
  [v9 appendData:v10];
  v11 = [v8 subdataWithRange:a4, a5];

  [v9 appendData:v11];

  return v9;
}

- (void)_parseRecvdAACPData:(id)a3
{
  id v4 = a3;
  id v5 = [(UARPService *)self recvDataMessage];
  [v5 appendData:v4];

  unint64_t v6 = +[UARPServiceUARPControllerManager instance];
  uint64_t v7 = [v6 uarpController];
  id v8 = [(UARPService *)self uarpAccessory];
  id v9 = [(UARPService *)self recvDataMessage];
  [v7 recvDataFromAccessory:v8 data:v9 error:0];

  id v10 = [(UARPService *)self recvDataMessage];
  [v10 setLength:0];
}

- (void)_parseRecvdData:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(UARPService *)self _extractHeader:v4];
  id v12 = [(UARPService *)self _extractPayload:v4];

  unint64_t v6 = [(UARPService *)self recvDataMessage];
  [v6 appendData:v12];

  if (v5)
  {
    uint64_t v7 = +[UARPServiceUARPControllerManager instance];
    id v8 = [v7 uarpController];
    id v9 = [(UARPService *)self uarpAccessory];
    id v10 = [(UARPService *)self recvDataMessage];
    [v8 recvDataFromAccessory:v9 data:v10 error:0];

    v11 = [(UARPService *)self recvDataMessage];
    [v11 setLength:0];
  }
}

- (unsigned)_extractHeader:(id)a3
{
  unsigned __int8 v6 = 0;
  v3 = [a3 subdataWithRange:0, 1];
  [v3 getBytes:&v6 length:1];
  unsigned __int8 v4 = v6;

  return v4;
}

- (id)_extractPayload:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 subdataWithRange:1, [v3 length] - 1];

  return v4;
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v31 = v8;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didDiscoverCharacteristicsForService - peripheral:%@ service:%@ error:%@", buf, 0x20u);
  }
  if (!v10)
  {
    id v23 = v9;
    id v24 = v8;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = [v9 characteristics];
    id v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v26;
      uint64_t v16 = CBUUIDUARPDataControlPointCharacteristicString;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          unsigned int v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v19 = [(UARPService *)self uarpDataControlPointCharacteristic];
          if (v19)
          {
          }
          else
          {
            id v20 = [v18 UUID];
            unsigned int v21 = +[CBUUID UUIDWithString:v16];
            unsigned int v22 = [v20 isEqual:v21];

            if (v22)
            {
              [(UARPService *)self setUarpDataControlPointCharacteristic:v18];
              [(UARPService *)self _prepareForFirmwareDownload];
            }
          }
        }
        id v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v14);
    }

    [(ClientService *)self notifyDidStart];
    id v9 = v23;
    id v8 = v24;
    id v10 = 0;
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100076398((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
    unsigned int v18 = [(UARPService *)self txDataQueue];
    [v18 removeAllObjects];

    [(UARPService *)self setIsSendingData:0];
  }
  else
  {
    v19 = [(UARPService *)self txDataQueue];
    id v20 = [v19 firstObject];

    if (v20)
    {
      unsigned int v21 = [(UARPService *)self txDataQueue];
      [v21 removeObjectAtIndex:0];

      if ([(UARPService *)self uarpOverAACP])
      {
        unsigned int v22 = +[BTLEXpcServer instance];
        v40[0] = @"kUARPDeviceUUID";
        id v23 = [(ClientService *)self peripheral];
        id v24 = [v23 identifier];
        long long v25 = [v24 UUIDString];
        v40[1] = @"kUARPData";
        v41[0] = v25;
        v41[1] = v20;
        long long v26 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
        [v22 sendMsg:@"UARPDataOverAACP" args:v26];
      }
      else
      {
        unsigned int v22 = [(ClientService *)self peripheral];
        id v23 = [(UARPService *)self uarpDataControlPointCharacteristic];
        [v22 writeValue:v20 forCharacteristic:v23 type:0];
      }

      long long v27 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        long long v28 = v27;
        id v29 = [v20 length];
        unsigned int v30 = [(UARPService *)self uarpOverAACP];
        id v31 = "GATT";
        int v32 = 138413058;
        __int16 v34 = 2048;
        id v33 = v20;
        if (v30) {
          id v31 = "AACP";
        }
        id v35 = v29;
        __int16 v36 = 2112;
        uint64_t v37 = 0;
        __int16 v38 = 2080;
        v39 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "didWriteValueForCharacteristic - peripheral:%@ length:%lu error:%@ profile:%s", (uint8_t *)&v32, 0x2Au);
      }
    }
    else
    {
      [(UARPService *)self setIsSendingData:0];
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100076404((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    unsigned int v18 = [v9 value];
    [(UARPService *)self _parseRecvdData:v18];
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v43 = v8;
    __int16 v44 = 2112;
    id v45 = v9;
    __int16 v46 = 2112;
    id v47 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "didUpdateNotificationStateForCharacteristic - peripheral:%@ characteristic:%@ error:%@", buf, 0x20u);
  }
  if (!v10)
  {
    uint64_t v12 = [(ClientService *)self manager];
    uint64_t v13 = +[CBUUID UUIDWithString:CBUUIDDeviceInformationServiceString];
    uint64_t v14 = [v12 clientServiceForUUID:v13];

    id v15 = [objc_alloc((Class)UARPAccessoryHardwareBluetooth) initWithVendorIDSource:1 vendorID:[v14 vendorID] productID:[v14 productID] productVersion:[v14 productVersion]];
    id v16 = objc_alloc((Class)UARPAccessory);
    uint64_t v17 = [v8 identifier];
    id v18 = [v16 initWithHardwareID:v15 uuid:v17];
    [(UARPService *)self setUarpAccessory:v18];

    v19 = [(UARPService *)self uarpAccessory];
    [v19 setAutoDownloadAllowed:1];

    id v20 = [(UARPService *)self uarpAccessory];

    if (v20)
    {
      id v21 = [objc_alloc((Class)UARPAssetID) initWithLocationType:3 remoteURL:0];
      [(UARPService *)self setUarpAssetID:v21];

      unsigned int v22 = (void *)qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v22;
        id v24 = [(UARPService *)self uarpAccessory];
        long long v25 = [(UARPService *)self uarpAssetID];
        *(_DWORD *)buf = 138412546;
        id v43 = v24;
        __int16 v44 = 2112;
        id v45 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Created uarpAccessory:%@ uarpAssetID:%@", buf, 0x16u);
      }
      long long v26 = +[UARPServiceUARPControllerManager instance];
      long long v27 = [(UARPService *)self uarpAccessory];
      long long v28 = [(UARPService *)self uarpAssetID];
      unsigned int v29 = [v26 registerUARPService:self withUARPAccessory:v27 withUARPAssetID:v28];

      if (v29)
      {
        unsigned int v30 = [(ClientService *)self peripheral];
        id v31 = [v30 identifier];
        int v32 = [v31 UUIDString];
        id v33 = +[NSString stringWithFormat:@"log_%@.uarp", v32];

        __int16 v34 = +[UARPServiceUARPControllerManager instance];
        id v35 = [v34 uarpLogPath];
        __int16 v36 = +[NSURL fileURLWithPath:v35 isDirectory:1];
        uint64_t v37 = [v36 URLByAppendingPathComponent:v33 isDirectory:0];
        p_loggingSuperbinaryURL = (uint64_t *)&self->_loggingSuperbinaryURL;
        v39 = (void *)*p_loggingSuperbinaryURL;
        uint64_t *p_loggingSuperbinaryURL = v37;

        v40 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
          sub_1000764B4(p_loggingSuperbinaryURL, v40);
        }
      }
    }
    else
    {
      v41 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
        sub_100076470(v41);
      }
    }
  }
}

- (void)incOpportunisticConnection
{
  if (![(UARPService *)self opportunisticRefCount])
  {
    id v3 = +[CattManager instance];
    unsigned __int8 v4 = [(ClientService *)self peripheral];
    [v3 removeOpportunisticConnection:v4];
  }
  [(UARPService *)self setOpportunisticRefCount:(char *)[(UARPService *)self opportunisticRefCount] + 1];
  unsigned __int8 v5 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = v5;
    int64_t v7 = [(UARPService *)self opportunisticRefCount];
    id v8 = [(UARPService *)self uarpAccessory];
    int v9 = 134218242;
    int64_t v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "incOpportunisticConnection refCount:%ld %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)decOpportunisticConnection
{
  [(UARPService *)self setOpportunisticRefCount:(char *)[(UARPService *)self opportunisticRefCount] - 1];
  id v3 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = v3;
    int64_t v5 = [(UARPService *)self opportunisticRefCount];
    unsigned __int8 v6 = [(UARPService *)self uarpAccessory];
    int v9 = 134218242;
    int64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "decOpportunisticConnection refCount:%ld %@", (uint8_t *)&v9, 0x16u);
  }
  if ([(UARPService *)self opportunisticRefCount] <= 0)
  {
    int64_t v7 = +[CattManager instance];
    id v8 = [(ClientService *)self peripheral];
    [v7 setOpportunisticConnection:v8];

    [(UARPService *)self setOpportunisticRefCount:0];
  }
}

- (void)assetSolicitationComplete
{
  v2 = +[NSFileManager defaultManager];
  v39 = objc_opt_new();
  id v3 = +[UARPServiceUARPControllerManager instance];
  unsigned __int8 v4 = [v3 uarpLogPath];
  int64_t v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];

  id v43 = [v5 URLByAppendingPathComponent:@"temp" isDirectory:1];
  __int16 v38 = v5;
  if (sub_100010B68()) {
    +[NSURL fileURLWithPath:@"/private/var/log/" isDirectory:1];
  }
  else {
  v41 = [v5 URLByDeletingLastPathComponent];
  }
  [v2 removeItemAtURL:v43 error:0];
  [v2 createDirectoryAtURL:v43 withIntermediateDirectories:1 attributes:0 error:0];
  id v6 = [objc_alloc((Class)UARPSuperBinaryAsset) initWithURL:self->_loggingSuperbinaryURL];
  id v50 = 0;
  uint64_t v37 = v6;
  [v6 decomposeToURL:v43 error:&v50];
  id v7 = v50;
  if (v7)
  {
    id v8 = v7;
    int v9 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100076530((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  id v16 = [v43 path];
  uint64_t v17 = [v2 contentsOfDirectoryAtPath:v16 error:0];

  id v18 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    buf.tm_sec = 138412290;
    *(void *)&buf.tm_min = v41;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "assetSolicitationComplete: Moving files to directory %@", (uint8_t *)&buf, 0xCu);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v17;
  id v19 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v47;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v47 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        memset(&buf, 0, sizeof(buf));
        time_t v45 = 0;
        time_t v45 = time(0);
        localtime_r(&v45, &buf);
        id v24 = [(ClientService *)self peripheral];
        long long v25 = [v24 identifier];
        long long v26 = [v25 UUIDString];
        long long v27 = +[NSString stringWithFormat:@"AccessoryUARP_%@_%04d-%02d-%02d-%02d-%02d-%02d_%@", v26, (buf.tm_year + 1900), (buf.tm_mon + 1), buf.tm_mday, buf.tm_hour, buf.tm_min, buf.tm_sec, v23];

        long long v28 = [v43 URLByAppendingPathComponent:v23 isDirectory:0];
        unsigned int v29 = [v41 URLByAppendingPathComponent:v27 isDirectory:0];
        [v2 removeItemAtURL:v29 error:0];
        unsigned int v30 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v51 = 138412546;
          v52 = v28;
          __int16 v53 = 2112;
          v54 = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "assetSolicitationComplete: Moving %@ to %@", v51, 0x16u);
        }
        id v44 = 0;
        [v2 moveItemAtURL:v28 toURL:v29 error:&v44];
        id v31 = v44;
        if (v31)
        {
          int v32 = v31;
          id v33 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v51 = 138412290;
            v52 = v32;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "assetSolicitationComplete: moveItemAtURL error %@", v51, 0xCu);
          }
        }
        else
        {
          int v32 = [v29 path];
          [v39 addObject:v32];
        }
      }
      id v20 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v20);
  }

  __int16 v34 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    loggingSuperbinaryURL = self->_loggingSuperbinaryURL;
    buf.tm_sec = 138412290;
    *(void *)&buf.tm_min = loggingSuperbinaryURL;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "assetSolicitationComplete: Adding superbinary LOGS asset %@", (uint8_t *)&buf, 0xCu);
  }
  __int16 v36 = [(NSURL *)self->_loggingSuperbinaryURL path];
  [v39 addObject:v36];

  [(UARPService *)self decOpportunisticConnection];
}

- (CBCharacteristic)uarpDataControlPointCharacteristic
{
  return self->_uarpDataControlPointCharacteristic;
}

- (void)setUarpDataControlPointCharacteristic:(id)a3
{
}

- (unint64_t)maxPayloadSize
{
  return self->_maxPayloadSize;
}

- (void)setMaxPayloadSize:(unint64_t)a3
{
  self->_maxPayloadSize = a3;
}

- (BOOL)isSendingData
{
  return self->_isSendingData;
}

- (void)setIsSendingData:(BOOL)a3
{
  self->_isSendingData = a3;
}

- (NSMutableArray)txDataQueue
{
  return self->_txDataQueue;
}

- (void)setTxDataQueue:(id)a3
{
}

- (NSMutableData)recvDataMessage
{
  return self->_recvDataMessage;
}

- (void)setRecvDataMessage:(id)a3
{
}

- (UARPAccessory)uarpAccessory
{
  return self->_uarpAccessory;
}

- (void)setUarpAccessory:(id)a3
{
}

- (UARPAssetID)uarpAssetID
{
  return self->_uarpAssetID;
}

- (void)setUarpAssetID:(id)a3
{
}

- (NSURL)loggingSuperbinaryURL
{
  return self->_loggingSuperbinaryURL;
}

- (void)setLoggingSuperbinaryURL:(id)a3
{
}

- (int64_t)opportunisticRefCount
{
  return self->_opportunisticRefCount;
}

- (void)setOpportunisticRefCount:(int64_t)a3
{
  self->_opportunisticRefCount = a3;
}

- (BOOL)uarpOverAACP
{
  return self->_uarpOverAACP;
}

- (void)setUarpOverAACP:(BOOL)a3
{
  self->_uarpOverAACP = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingSuperbinaryURL, 0);
  objc_storeStrong((id *)&self->_uarpAssetID, 0);
  objc_storeStrong((id *)&self->_uarpAccessory, 0);
  objc_storeStrong((id *)&self->_recvDataMessage, 0);
  objc_storeStrong((id *)&self->_txDataQueue, 0);

  objc_storeStrong((id *)&self->_uarpDataControlPointCharacteristic, 0);
}

@end