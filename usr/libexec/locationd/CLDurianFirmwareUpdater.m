@interface CLDurianFirmwareUpdater
- (BOOL)hasPreparedForFirmwareDownload;
- (CBCharacteristic)firmwareDownloadAssetsCharacteristic;
- (CBCharacteristic)firmwareDownloadAssetsReadyCharacteristic;
- (CBCharacteristic)firmwareDownloadCommandCharacteristic;
- (CBCharacteristic)firwmareDownloadStatusCharacteristic;
- (CBCharacteristic)personalizationBVERCharacteristic;
- (CBCharacteristic)personalizationBoardIDCharacteristic;
- (CBCharacteristic)personalizationBootNonceHashCharacteristic;
- (CBCharacteristic)personalizationChipIDCharacteristic;
- (CBCharacteristic)personalizationECIDCharacteristic;
- (CBCharacteristic)personalizationProdModeCharacteristic;
- (CBCharacteristic)personalizationSecDomainCharacteristic;
- (CBCharacteristic)personalizationSecModeCharacteristic;
- (CBPeripheral)peripheral;
- (CLDurianFirmwareAssetPacketizer)currentAssetPacketizer;
- (CLDurianFirmwareUpdater)initWithDelegate:(id)a3 peripheral:(id)a4;
- (CLDurianFirmwareUpdaterDelegate)delegate;
- (NSMutableArray)assetPacketizerQueue;
- (NSMutableDictionary)personalizationInformation;
- (const)_firmwareAssetTypeToString:(int)a3;
- (const)_firmwareDownloadCommandToString:(int)a3;
- (const)_firmwareDownloadStatusToString:(int)a3;
- (id)_createErrorForDownloadStatus:(int)a3;
- (void)_cleanup;
- (void)_handleDownloadStatusFromDevice:(id)a3;
- (void)_handlePersonalizationDataFromDevice:(id)a3;
- (void)_prepareForFirmwareDownload;
- (void)_readPersonalizationInformation;
- (void)_sendCommandToDevice:(int)a3;
- (void)_sendFirmwareAsset:(int)a3 assetData:(id)a4;
- (void)_sendLocalImageAssets:(id)a3;
- (void)_sendNextAsset;
- (void)_sendNextPacketToDevice:(id)a3;
- (void)abortFirmwareUpdate;
- (void)dealloc;
- (void)getPersonalizationInformation;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)setAssetPacketizerQueue:(id)a3;
- (void)setCurrentAssetPacketizer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirmwareDownloadAssetsCharacteristic:(id)a3;
- (void)setFirmwareDownloadAssetsReadyCharacteristic:(id)a3;
- (void)setFirmwareDownloadCommandCharacteristic:(id)a3;
- (void)setFirwmareDownloadStatusCharacteristic:(id)a3;
- (void)setHasPreparedForFirmwareDownload:(BOOL)a3;
- (void)setPeripheral:(id)a3;
- (void)setPersonalizationBVERCharacteristic:(id)a3;
- (void)setPersonalizationBoardIDCharacteristic:(id)a3;
- (void)setPersonalizationBootNonceHashCharacteristic:(id)a3;
- (void)setPersonalizationChipIDCharacteristic:(id)a3;
- (void)setPersonalizationECIDCharacteristic:(id)a3;
- (void)setPersonalizationInformation:(id)a3;
- (void)setPersonalizationProdModeCharacteristic:(id)a3;
- (void)setPersonalizationSecDomainCharacteristic:(id)a3;
- (void)setPersonalizationSecModeCharacteristic:(id)a3;
- (void)startFirmwareUpdate:(id)a3;
@end

@implementation CLDurianFirmwareUpdater

- (CLDurianFirmwareUpdater)initWithDelegate:(id)a3 peripheral:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLDurianFirmwareUpdater;
  v6 = [(CLDurianFirmwareUpdater *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(CLDurianFirmwareUpdater *)v6 setPeripheral:a4];
    [(CBPeripheral *)[(CLDurianFirmwareUpdater *)v7 peripheral] setDelegate:v7];
    [(CLDurianFirmwareUpdater *)v7 setDelegate:a3];
    v7->_personalizationInformation = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v7->_assetPacketizerQueue = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLDurianFirmwareUpdater;
  [(CLDurianFirmwareUpdater *)&v3 dealloc];
}

- (void)getPersonalizationInformation
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331F50);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - getting personalization information\"}", (uint8_t *)v4, 0x12u);
  }
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] discoverServices:0];
}

- (void)startFirmwareUpdate:(id)a3
{
}

- (void)abortFirmwareUpdate
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331F50);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289282;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    __int16 v7 = 1026;
    unsigned int v8 = [(CLDurianFirmwareUpdater *)self hasPreparedForFirmwareDownload];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - aborting firmware transfer\", \"has prepared firmware download\":%{public}d}", (uint8_t *)v4, 0x18u);
  }
  [(CLDurianFirmwareUpdater *)self _cleanup];
  if ([(CLDurianFirmwareUpdater *)self hasPreparedForFirmwareDownload]) {
    [(CLDurianFirmwareUpdater *)self _sendCommandToDevice:2];
  }
  else {
    [(CLDurianFirmwareUpdaterDelegate *)[(CLDurianFirmwareUpdater *)self delegate] didAbortFirmwareUpdate];
  }
}

- (void)_sendFirmwareAsset:(int)a3 assetData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  [(NSMutableArray *)[(CLDurianFirmwareUpdater *)self assetPacketizerQueue] addObject:[[CLDurianFirmwareAssetPacketizer alloc] initWithAssetType:*(void *)&a3 assetData:a4 maxPacketSize:[(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] maximumWriteValueLengthForType:1]]];
  if ([(CLDurianFirmwareUpdater *)self currentAssetPacketizer])
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331F50);
    }
    v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68289538;
      v7[1] = 0;
      __int16 v8 = 2082;
      objc_super v9 = "";
      __int16 v10 = 2082;
      v11 = [(CLDurianFirmwareUpdater *)self _firmwareAssetTypeToString:v4];
      __int16 v12 = 2082;
      v13 = [(CLDurianFirmwareUpdater *)self _firmwareAssetTypeToString:[(CLDurianFirmwareAssetPacketizer *)[(CLDurianFirmwareUpdater *)self currentAssetPacketizer] assetType]];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - queueing transfer request as transfer is in progress\", \"requested asset\":%{public, location:escape_only}s, \"current asset\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x26u);
    }
  }
  else
  {
    [(CLDurianFirmwareUpdater *)self _sendNextAsset];
  }
}

- (void)_prepareForFirmwareDownload
{
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] setNotifyValue:1 forCharacteristic:[(CLDurianFirmwareUpdater *)self firwmareDownloadStatusCharacteristic]];
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] setNotifyValue:1 forCharacteristic:[(CLDurianFirmwareUpdater *)self firmwareDownloadAssetsReadyCharacteristic]];

  [(CLDurianFirmwareUpdater *)self _sendCommandToDevice:0];
}

- (void)_readPersonalizationInformation
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331F50);
  }
  objc_super v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - reading personalization information\"}", (uint8_t *)v4, 0x12u);
  }
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] readValueForCharacteristic:[(CLDurianFirmwareUpdater *)self personalizationChipIDCharacteristic]];
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] readValueForCharacteristic:[(CLDurianFirmwareUpdater *)self personalizationBoardIDCharacteristic]];
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] readValueForCharacteristic:[(CLDurianFirmwareUpdater *)self personalizationECIDCharacteristic]];
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] readValueForCharacteristic:[(CLDurianFirmwareUpdater *)self personalizationSecDomainCharacteristic]];
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] readValueForCharacteristic:[(CLDurianFirmwareUpdater *)self personalizationSecModeCharacteristic]];
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] readValueForCharacteristic:[(CLDurianFirmwareUpdater *)self personalizationProdModeCharacteristic]];
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] readValueForCharacteristic:[(CLDurianFirmwareUpdater *)self personalizationBootNonceHashCharacteristic]];
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] readValueForCharacteristic:[(CLDurianFirmwareUpdater *)self personalizationBVERCharacteristic]];
}

- (void)_handlePersonalizationDataFromDevice:(id)a3
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331F50);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 68289283;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2113;
    id v12 = [a3 UUID];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - obtained personalization data\", \"personalizationCharacteristic\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
  }
  [-[NSMutableDictionary setObject:forKey:](-[CLDurianFirmwareUpdater personalizationInformation](self, "personalizationInformation"), "setObject:forKey:", [a3 value], [objc_msgSend(objc_msgSend(a3, "UUID"), "UUIDString")]);
  if ([(NSMutableDictionary *)[(CLDurianFirmwareUpdater *)self personalizationInformation] count] == (id)8)
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331F50);
    }
    v6 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 68289026;
      int v8 = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - obtained complete personalization information!\"}", (uint8_t *)&v7, 0x12u);
    }
    [(CLDurianFirmwareUpdaterDelegate *)[(CLDurianFirmwareUpdater *)self delegate] didGetPersonalizationInformation:[(CLDurianFirmwareUpdater *)self personalizationInformation]];
  }
}

- (void)_handleDownloadStatusFromDevice:(id)a3
{
  unsigned int v9 = 0;
  [a3 getBytes:&v9 length:1];
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331F50);
  }
  uint64_t v4 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v5 = [(CLDurianFirmwareUpdater *)self _firmwareDownloadStatusToString:v9];
    *(_DWORD *)buf = 68289282;
    int v11 = 0;
    __int16 v12 = 2082;
    v13 = "";
    __int16 v14 = 2082;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - received download status from device\", \"download status\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  switch(v9)
  {
    case 0u:
      [(CLDurianFirmwareUpdater *)self _sendNextAsset];
      break;
    case 1u:
      [(CLDurianFirmwareUpdater *)self _readPersonalizationInformation];
      break;
    case 2u:
      goto LABEL_16;
    case 3u:
      [(CLDurianFirmwareUpdater *)self _cleanup];
LABEL_16:
      int v8 = [(CLDurianFirmwareUpdater *)self delegate];
      [(CLDurianFirmwareUpdaterDelegate *)v8 didCompleteFirmwareUpdate:[(CLDurianFirmwareUpdater *)self _createErrorForDownloadStatus:v9]];
      break;
    case 4u:
      [(CLDurianFirmwareUpdater *)self _cleanup];
      [(CLDurianFirmwareUpdaterDelegate *)[(CLDurianFirmwareUpdater *)self delegate] didAbortFirmwareUpdate];
      break;
    default:
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331F50);
      }
      v6 = qword_102419398;
      if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289283;
        int v11 = 0;
        __int16 v12 = 2082;
        v13 = "";
        __int16 v14 = 2049;
        v15 = (const char *)v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian FWUpdate - received invalid status command\", \"status\":%{private}lu}", buf, 0x1Cu);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331F50);
        }
      }
      int v7 = qword_102419398;
      if (os_signpost_enabled((os_log_t)qword_102419398))
      {
        *(_DWORD *)buf = 68289283;
        int v11 = 0;
        __int16 v12 = 2082;
        v13 = "";
        __int16 v14 = 2049;
        v15 = (const char *)v9;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian FWUpdate - received invalid status command", "{\"msg%{public}.0s\":\"#durian FWUpdate - received invalid status command\", \"status\":%{private}lu}", buf, 0x1Cu);
      }
      break;
  }
}

- (void)_sendCommandToDevice:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v6 = a3;
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331F50);
  }
  __int16 v5 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v8 = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2082;
    __int16 v12 = [(CLDurianFirmwareUpdater *)self _firmwareDownloadCommandToString:v3];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - sending command to device\", \"command\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] writeValue:+[NSData dataWithBytes:&v6 length:1] forCharacteristic:[(CLDurianFirmwareUpdater *)self firmwareDownloadCommandCharacteristic] type:0];
}

- (void)_sendNextAsset
{
  if ([(NSMutableArray *)[(CLDurianFirmwareUpdater *)self assetPacketizerQueue] count])
  {
    [(CLDurianFirmwareUpdater *)self setCurrentAssetPacketizer:[(NSMutableArray *)[(CLDurianFirmwareUpdater *)self assetPacketizerQueue] objectAtIndex:0]];
    [(NSMutableArray *)[(CLDurianFirmwareUpdater *)self assetPacketizerQueue] removeObjectAtIndex:0];
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331F50);
    }
    uint64_t v3 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289282;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = "";
      __int16 v9 = 2082;
      __int16 v10 = [(CLDurianFirmwareUpdater *)self _firmwareAssetTypeToString:[(CLDurianFirmwareAssetPacketizer *)[(CLDurianFirmwareUpdater *)self currentAssetPacketizer] assetType]];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - sending asset\", \"assetType\":%{public, location:escape_only}s}", (uint8_t *)&v5, 0x1Cu);
    }
    [(CLDurianFirmwareUpdater *)self _sendNextPacketToDevice:[(CLDurianFirmwareUpdater *)self currentAssetPacketizer]];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331F50);
    }
    uint64_t v4 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 68289026;
      int v6 = 0;
      __int16 v7 = 2082;
      int v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - completed sending all assets! Committing\"}", (uint8_t *)&v5, 0x12u);
    }
    [(CLDurianFirmwareUpdater *)self _sendCommandToDevice:1];
  }
}

- (void)_sendNextPacketToDevice:(id)a3
{
  id v4 = [a3 getNextPacket];
  if (v4)
  {
    id v5 = v4;
    int v6 = [(CLDurianFirmwareUpdater *)self peripheral];
    __int16 v7 = [(CLDurianFirmwareUpdater *)self firmwareDownloadAssetsCharacteristic];
    [(CBPeripheral *)v6 writeValue:v5 forCharacteristic:v7 type:1];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331F50);
    }
    int v8 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 68289026;
      v9[1] = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - finished sending all packets\"}", (uint8_t *)v9, 0x12u);
    }
  }
}

- (void)_cleanup
{
  if (qword_102419390 != -1) {
    dispatch_once(&qword_102419390, &stru_102331F50);
  }
  uint64_t v3 = qword_102419398;
  if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    int v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - cleaning up firmware transfer!\"}", (uint8_t *)v4, 0x12u);
  }
  [(CLDurianFirmwareUpdater *)self setCurrentAssetPacketizer:0];
  [(CLDurianFirmwareUpdater *)self setAssetPacketizerQueue:0];
}

- (id)_createErrorForDownloadStatus:(int)a3
{
  if (a3 == 2) {
    return 0;
  }
  else {
    return +[NSError errorWithDomain:@"FirmwareUpdate" code:0 userInfo:0];
  }
}

- (void)_sendLocalImageAssets:(id)a3
{
  v24 = &off_1023952A0;
  v25 = +[NSURL fileURLWithPath:@"bldr.bin" isDirectory:0 relativeToURL:a3];
  v26[0] = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v22 = &off_1023952B8;
  v23 = +[NSURL fileURLWithPath:@"blsg.bin" isDirectory:0 relativeToURL:a3];
  v26[1] = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v20 = &off_1023952D0;
  v21 = +[NSURL fileURLWithPath:@"sftd.bin" isDirectory:0 relativeToURL:a3];
  v26[2] = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v18 = &off_1023952E8;
  v19 = +[NSURL fileURLWithPath:@"sdsg.bin" isDirectory:0 relativeToURL:a3];
  v26[3] = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  v16 = &off_102395300;
  v17 = +[NSURL fileURLWithPath:@"blap.bin" isDirectory:0 relativeToURL:a3];
  v26[4] = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  __int16 v14 = &off_102395318;
  v15 = +[NSURL fileURLWithPath:@"basg.bin" isDirectory:0 relativeToURL:a3];
  v26[5] = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  __int16 v12 = &off_102395330;
  v13 = +[NSURL fileURLWithPath:@"man.bin" isDirectory:0 relativeToURL:a3];
  v26[6] = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  __int16 v10 = &off_102395348;
  __int16 v11 = +[NSURL fileURLWithPath:@"diag.bin" isDirectory:0 relativeToURL:a3];
  v26[7] = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  int v8 = &off_102395360;
  __int16 v9 = +[NSURL fileURLWithPath:@"dgsg.bin" isDirectory:0 relativeToURL:a3];
  v26[8] = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  int v6 = &off_102395378;
  __int16 v7 = +[NSURL fileURLWithPath:@"r1md.bin" isDirectory:0 relativeToURL:a3];
  v26[9] = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1015F39A4;
  v5[3] = &unk_102331F30;
  v5[4] = self;
  [+[NSArray arrayWithObjects:v26 count:10] enumerateObjectsUsingBlock:v5];
}

- (const)_firmwareDownloadCommandToString:(int)a3
{
  if (a3 > 2) {
    return "UNKNOWN COMMAND";
  }
  else {
    return (&off_102331F70)[a3];
  }
}

- (const)_firmwareDownloadStatusToString:(int)a3
{
  if (a3 > 4) {
    return "UNKNOWN STATUS";
  }
  else {
    return (&off_102331F88)[a3];
  }
}

- (const)_firmwareAssetTypeToString:(int)a3
{
  if ((a3 - 1) > 9) {
    return "UNKNOWN ASSET TYPE";
  }
  else {
    return (&off_102331FB0)[a3 - 1];
  }
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a3 services];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v15;
    *(void *)&long long v7 = 68289283;
    long long v13 = v7;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        if (qword_102419390 != -1) {
          dispatch_once(&qword_102419390, &stru_102331F50);
        }
        __int16 v12 = qword_102419398;
        if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          int v19 = 0;
          __int16 v20 = 2082;
          v21 = "";
          __int16 v22 = 2113;
          uint64_t v23 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian FWUpdate - didDiscoverServices\", \"service\":%{private, location:escape_only}@}", buf, 0x1Cu);
        }
        [(CBPeripheral *)[(CLDurianFirmwareUpdater *)self peripheral] discoverCharacteristics:0 forService:v11];
        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v8);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [a4 characteristics:a3];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (-[CLDurianFirmwareUpdater firmwareDownloadAssetsCharacteristic](self, "firmwareDownloadAssetsCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6001-7D1C-4951-86AA-8D9728F8D66C")))
        {
          if (-[CLDurianFirmwareUpdater firwmareDownloadStatusCharacteristic](self, "firwmareDownloadStatusCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6002-7D1C-4951-86AA-8D9728F8D66C")))
          {
            if (-[CLDurianFirmwareUpdater firmwareDownloadCommandCharacteristic](self, "firmwareDownloadCommandCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6003-7D1C-4951-86AA-8D9728F8D66C")))
            {
              if (-[CLDurianFirmwareUpdater firmwareDownloadAssetsReadyCharacteristic](self, "firmwareDownloadAssetsReadyCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6004-7D1C-4951-86AA-8D9728F8D66C")))
              {
                if (-[CLDurianFirmwareUpdater personalizationChipIDCharacteristic](self, "personalizationChipIDCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6101-7D1C-4951-86AA-8D9728F8D66C")))
                {
                  if (-[CLDurianFirmwareUpdater personalizationBoardIDCharacteristic](self, "personalizationBoardIDCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6102-7D1C-4951-86AA-8D9728F8D66C")))
                  {
                    if (-[CLDurianFirmwareUpdater personalizationECIDCharacteristic](self, "personalizationECIDCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6103-7D1C-4951-86AA-8D9728F8D66C")))
                    {
                      if (-[CLDurianFirmwareUpdater personalizationSecDomainCharacteristic](self, "personalizationSecDomainCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6104-7D1C-4951-86AA-8D9728F8D66C")))
                      {
                        if (-[CLDurianFirmwareUpdater personalizationSecModeCharacteristic](self, "personalizationSecModeCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6105-7D1C-4951-86AA-8D9728F8D66C")))
                        {
                          if (-[CLDurianFirmwareUpdater personalizationProdModeCharacteristic](self, "personalizationProdModeCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6106-7D1C-4951-86AA-8D9728F8D66C")))
                          {
                            if (-[CLDurianFirmwareUpdater personalizationBootNonceHashCharacteristic](self, "personalizationBootNonceHashCharacteristic")|| !objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6107-7D1C-4951-86AA-8D9728F8D66C")))
                            {
                              if (!-[CLDurianFirmwareUpdater personalizationBVERCharacteristic](self, "personalizationBVERCharacteristic")&& objc_msgSend(objc_msgSend(v11, "UUID"), "isEqual:", +[CBUUID UUIDWithString:](CBUUID, "UUIDWithString:", @"7DFC6108-7D1C-4951-86AA-8D9728F8D66C")))
                              {
                                [(CLDurianFirmwareUpdater *)self setPersonalizationBVERCharacteristic:v11];
                              }
                            }
                            else
                            {
                              [(CLDurianFirmwareUpdater *)self setPersonalizationBootNonceHashCharacteristic:v11];
                            }
                          }
                          else
                          {
                            [(CLDurianFirmwareUpdater *)self setPersonalizationProdModeCharacteristic:v11];
                          }
                        }
                        else
                        {
                          [(CLDurianFirmwareUpdater *)self setPersonalizationSecModeCharacteristic:v11];
                        }
                      }
                      else
                      {
                        [(CLDurianFirmwareUpdater *)self setPersonalizationSecDomainCharacteristic:v11];
                      }
                    }
                    else
                    {
                      [(CLDurianFirmwareUpdater *)self setPersonalizationECIDCharacteristic:v11];
                    }
                  }
                  else
                  {
                    [(CLDurianFirmwareUpdater *)self setPersonalizationBoardIDCharacteristic:v11];
                  }
                }
                else
                {
                  [(CLDurianFirmwareUpdater *)self setPersonalizationChipIDCharacteristic:v11];
                }
              }
              else
              {
                [(CLDurianFirmwareUpdater *)self setFirmwareDownloadAssetsReadyCharacteristic:v11];
              }
            }
            else
            {
              [(CLDurianFirmwareUpdater *)self setFirmwareDownloadCommandCharacteristic:v11];
            }
          }
          else
          {
            [(CLDurianFirmwareUpdater *)self setFirwmareDownloadStatusCharacteristic:v11];
          }
        }
        else
        {
          [(CLDurianFirmwareUpdater *)self setFirmwareDownloadAssetsCharacteristic:v11];
        }
        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  if ([(CLDurianFirmwareUpdater *)self firwmareDownloadStatusCharacteristic]
    && [(CLDurianFirmwareUpdater *)self firmwareDownloadCommandCharacteristic]
    && [(CLDurianFirmwareUpdater *)self firmwareDownloadAssetsReadyCharacteristic]&& ![(CLDurianFirmwareUpdater *)self hasPreparedForFirmwareDownload])
  {
    [(CLDurianFirmwareUpdater *)self _prepareForFirmwareDownload];
    [(CLDurianFirmwareUpdater *)self setHasPreparedForFirmwareDownload:1];
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  if ([(CLDurianFirmwareUpdater *)self firwmareDownloadStatusCharacteristic] == a4)
  {
    id v12 = [a4 value];
    [(CLDurianFirmwareUpdater *)self _handleDownloadStatusFromDevice:v12];
  }
  else if ([(CLDurianFirmwareUpdater *)self firmwareDownloadAssetsReadyCharacteristic] == a4)
  {
    long long v13 = [(CLDurianFirmwareUpdater *)self currentAssetPacketizer];
    [(CLDurianFirmwareUpdater *)self _sendNextPacketToDevice:v13];
  }
  else if ([(CLDurianFirmwareUpdater *)self personalizationChipIDCharacteristic] == a4 {
         || [(CLDurianFirmwareUpdater *)self personalizationBoardIDCharacteristic] == a4|| [(CLDurianFirmwareUpdater *)self personalizationECIDCharacteristic] == a4|| [(CLDurianFirmwareUpdater *)self personalizationSecDomainCharacteristic] == a4|| [(CLDurianFirmwareUpdater *)self personalizationSecModeCharacteristic] == a4|| [(CLDurianFirmwareUpdater *)self personalizationProdModeCharacteristic] == a4|| [(CLDurianFirmwareUpdater *)self personalizationBootNonceHashCharacteristic] == a4|| [(CLDurianFirmwareUpdater *)self personalizationBVERCharacteristic] == a4)
  }
  {
    [(CLDurianFirmwareUpdater *)self _handlePersonalizationDataFromDevice:a4];
  }
  else
  {
    if (qword_102419390 != -1) {
      dispatch_once(&qword_102419390, &stru_102331F50);
    }
    uint64_t v9 = qword_102419398;
    if (os_log_type_enabled((os_log_t)qword_102419398, OS_LOG_TYPE_ERROR))
    {
      int v14 = 68289538;
      int v15 = 0;
      __int16 v16 = 2082;
      long long v17 = "";
      __int16 v18 = 2114;
      id v19 = [a3 identifier];
      __int16 v20 = 2114;
      id v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian FWUpdate - Received unexpected update value\", \"peripheralUUID\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v14, 0x26u);
      if (qword_102419390 != -1) {
        dispatch_once(&qword_102419390, &stru_102331F50);
      }
    }
    __int16 v10 = qword_102419398;
    if (os_signpost_enabled((os_log_t)qword_102419398))
    {
      id v11 = [a3 identifier];
      int v14 = 68289538;
      int v15 = 0;
      __int16 v16 = 2082;
      long long v17 = "";
      __int16 v18 = 2114;
      id v19 = v11;
      __int16 v20 = 2114;
      id v21 = a5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian FWUpdate - Received unexpected update value", "{\"msg%{public}.0s\":\"#durian FWUpdate - Received unexpected update value\", \"peripheralUUID\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v14, 0x26u);
    }
  }
}

- (CLDurianFirmwareUpdaterDelegate)delegate
{
  return (CLDurianFirmwareUpdaterDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CBPeripheral)peripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPeripheral:(id)a3
{
}

- (CBCharacteristic)firmwareDownloadAssetsCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFirmwareDownloadAssetsCharacteristic:(id)a3
{
}

- (CBCharacteristic)firmwareDownloadCommandCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFirmwareDownloadCommandCharacteristic:(id)a3
{
}

- (CBCharacteristic)firwmareDownloadStatusCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFirwmareDownloadStatusCharacteristic:(id)a3
{
}

- (CBCharacteristic)firmwareDownloadAssetsReadyCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFirmwareDownloadAssetsReadyCharacteristic:(id)a3
{
}

- (CBCharacteristic)personalizationChipIDCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPersonalizationChipIDCharacteristic:(id)a3
{
}

- (CBCharacteristic)personalizationBoardIDCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPersonalizationBoardIDCharacteristic:(id)a3
{
}

- (CBCharacteristic)personalizationECIDCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPersonalizationECIDCharacteristic:(id)a3
{
}

- (CBCharacteristic)personalizationSecDomainCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPersonalizationSecDomainCharacteristic:(id)a3
{
}

- (CBCharacteristic)personalizationSecModeCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPersonalizationSecModeCharacteristic:(id)a3
{
}

- (CBCharacteristic)personalizationProdModeCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPersonalizationProdModeCharacteristic:(id)a3
{
}

- (CBCharacteristic)personalizationBootNonceHashCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPersonalizationBootNonceHashCharacteristic:(id)a3
{
}

- (CBCharacteristic)personalizationBVERCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPersonalizationBVERCharacteristic:(id)a3
{
}

- (BOOL)hasPreparedForFirmwareDownload
{
  return self->_hasPreparedForFirmwareDownload;
}

- (void)setHasPreparedForFirmwareDownload:(BOOL)a3
{
  self->_hasPreparedForFirmwareDownload = a3;
}

- (NSMutableDictionary)personalizationInformation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPersonalizationInformation:(id)a3
{
}

- (NSMutableArray)assetPacketizerQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAssetPacketizerQueue:(id)a3
{
}

- (CLDurianFirmwareAssetPacketizer)currentAssetPacketizer
{
  return (CLDurianFirmwareAssetPacketizer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCurrentAssetPacketizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end