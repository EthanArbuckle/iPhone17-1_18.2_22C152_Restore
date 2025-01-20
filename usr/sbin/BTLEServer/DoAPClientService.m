@interface DoAPClientService
+ (id)UUID;
- (BOOL)isEventIndicatorNotificationEnabled;
- (BOOL)isSendDataNotificationEnabled;
- (BOOL)isStartStreamingNotificationEnabled;
- (BOOL)isStopStreamingNotificationEnabled;
- (CBCharacteristic)EventIndicatorCharacteristic;
- (CBCharacteristic)SelectedCodecCharacteristic;
- (CBCharacteristic)SendDataCharacteristic;
- (CBCharacteristic)StartStreamingCharacteristic;
- (CBCharacteristic)StopStreamingCharacteristic;
- (CBCharacteristic)SupportedCodecsCharacteristic;
- (DoAPClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5;
- (NSMutableArray)codecList;
- (NSMutableArray)doapDevices;
- (id)uuidToString:(id)a3;
- (void)createDoAPDevice;
- (void)dealloc;
- (void)destroyDoAPDevice;
- (void)doapDeviceDidStop;
- (void)eventIndicator:(id)a3;
- (void)handleInputData:(id)a3 targetDevice:(id)a4;
- (void)notifyDidStartIfEverythingReady;
- (void)parseTLVCodecList:(char *)a3 dataLength:(unsigned __int8)a4 streamID:(unsigned __int16)a5;
- (void)parseTLVCodecValue:(char *)a3 dataLength:(unsigned __int8)a4 codecStruct:(id *)a5;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)selectCodec:(id)a3;
- (void)setCodecList:(id)a3;
- (void)setDoapDevices:(id)a3;
- (void)setEventIndicatorCharacteristic:(id)a3;
- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4;
- (void)setIsEventIndicatorNotificationEnabled:(BOOL)a3;
- (void)setIsSendDataNotificationEnabled:(BOOL)a3;
- (void)setIsStartStreamingNotificationEnabled:(BOOL)a3;
- (void)setIsStopStreamingNotificationEnabled:(BOOL)a3;
- (void)setNotificationEnabled:(id)a3;
- (void)setSelectedCodecCharacteristic:(id)a3;
- (void)setSendDataCharacteristic:(id)a3;
- (void)setStartStreamingCharacteristic:(id)a3;
- (void)setStopStreamingCharacteristic:(id)a3;
- (void)setSupportedCodecsCharacteristic:(id)a3;
- (void)start;
- (void)startStreaming:(id)a3;
- (void)stop;
- (void)stopStreaming:(id)a3;
- (void)writeData:(id)a3 forCharacteristic:(id)a4 withResponse:(BOOL)a5;
@end

@implementation DoAPClientService

+ (id)UUID
{
  return +[CBUUID UUIDWithString:CBUUIDDoAPServiceString];
}

- (DoAPClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)DoAPClientService;
  v5 = [(ClientService *)&v12 initWithManager:a3 peripheral:a4 service:a5];
  v6 = v5;
  if (v5)
  {
    [(ClientService *)v5 setIsPrimary:1];
    [(ClientService *)v6 setPriority:3];
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    codecList = v6->_codecList;
    v6->_codecList = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    doapDevices = v6->_doapDevices;
    v6->_doapDevices = v9;

    v6->_isStartStreamingNotificationEnabled = 0;
    v6->_isStopStreamingNotificationEnabled = 0;
    v6->_isSendDataNotificationEnabled = 0;
    v6->_isEventIndicatorNotificationEnabled = 0;
  }
  return v6;
}

- (void)start
{
  v12.receiver = self;
  v12.super_class = (Class)DoAPClientService;
  [(ClientService *)&v12 start];
  v3 = +[CBUUID UUIDWithString:CBUUIDSupportedCodecsCharacteristicString];
  v13[0] = v3;
  v4 = +[CBUUID UUIDWithString:CBUUIDSelectedCodecCharacteristicString];
  v13[1] = v4;
  v5 = +[CBUUID UUIDWithString:CBUUIDStartStreamingCharacteristicString];
  v13[2] = v5;
  v6 = +[CBUUID UUIDWithString:CBUUIDStopStreamingCharacteristicString];
  v13[3] = v6;
  v7 = +[CBUUID UUIDWithString:CBUUIDSendDataCharacteristicString];
  v13[4] = v7;
  v8 = +[CBUUID UUIDWithString:CBUUIDEventIndicatorCharacteristicString];
  v13[5] = v8;
  v9 = +[NSArray arrayWithObjects:v13 count:6];

  v10 = [(ClientService *)self peripheral];
  v11 = [(ClientService *)self service];
  [v10 discoverCharacteristics:v9 forService:v11];
}

- (void)stop
{
  [(DoAPClientService *)self destroyDoAPDevice];
  v3.receiver = self;
  v3.super_class = (Class)DoAPClientService;
  [(ClientService *)&v3 stop];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DoAPClientService;
  [(DoAPClientService *)&v4 dealloc];
}

- (void)parseTLVCodecValue:(char *)a3 dataLength:(unsigned __int8)a4 codecStruct:(id *)a5
{
  if (a4)
  {
    unsigned int v6 = a4;
    int v8 = 0;
    unint64_t v9 = a4;
    while (2)
    {
      unsigned int v10 = a3[v8];
      unsigned __int8 v11 = v8 + 2;
      switch(a3[v8])
      {
        case 1:
          if (v6 <= v11)
          {
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
              sub_100071EF8();
            }
          }
          else
          {
            unsigned __int8 v12 = v8 + 3;
            unsigned __int16 v13 = a3[(v8 + 2)];
            a5->unsigned int var1 = v13;
            if (v6 > (v8 + 3))
            {
              v8 += 4;
              a5->unsigned int var1 = v13 | (a3[v12] << 8);
              uint64_t v14 = qword_1000CD178;
              if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_39;
              }
              unsigned int var1 = a5->var1;
              *(_DWORD *)buf = 67109120;
              unsigned int v39 = var1;
              v16 = v14;
              v17 = "kDoAPCodecAttributeIDSampleFrequency %u";
              goto LABEL_38;
            }
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
              sub_100071E90();
            }
          }
          break;
        case 2:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var2 = a3[v11];
            uint64_t v19 = qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var2 = a5->var2;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var2;
            v16 = v19;
            v17 = "kDoAPCodecAttributeIDChannel %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100071F60();
          }
          break;
        case 3:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var3 = a3[v11];
            uint64_t v21 = qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var3 = a5->var3;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var3;
            v16 = v21;
            v17 = "kDoAPCodecAttributeIDAllocMethod %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100071FC8();
          }
          break;
        case 4:
          if ((unint64_t)(v8 + 2) + 4 < v9)
          {
            a5->unsigned int var4 = a3[(v8 + 2)] | (a3[(v8 + 2)
                                                                                           + 1] << 8) | (a3[(v8 + 2) + 2] << 16) | (a3[(v8 + 2) + 3] << 24);
            v8 += 6;
            uint64_t v23 = qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var4 = a5->var4;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var4;
            v16 = v23;
            v17 = "kDoAPCodecAttributeIDBitrate %u";
            goto LABEL_38;
          }
          v37 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100072030(v6, (v8 + 2), v37);
          }
          break;
        case 5:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var5 = a3[v11];
            uint64_t v25 = qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var5 = a5->var5;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var5;
            v16 = v25;
            v17 = "kDoAPCodecAttributeIDBlocks %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_1000720B0();
          }
          break;
        case 6:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var6 = a3[v11];
            uint64_t v27 = qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var6 = a5->var6;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var6;
            v16 = v27;
            v17 = "kDoAPCodecAttributeIDSubbands %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100072118();
          }
          break;
        case 7:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var7 = a3[v11];
            uint64_t v29 = qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var7 = a5->var7;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var7;
            v16 = v29;
            v17 = "kDoAPCodecAttributeIDMinBitpool %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100072180();
          }
          break;
        case 8:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var8 = a3[v11];
            uint64_t v31 = qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var8 = a5->var8;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var8;
            v16 = v31;
            v17 = "kDoAPCodecAttributeIDMaxBitpool %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_1000721E8();
          }
          break;
        case 9:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var9 = a3[v11];
            uint64_t v33 = qword_1000CD178;
            if (!os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_39;
            }
            unsigned int var9 = a5->var9;
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = var9;
            v16 = v33;
            v17 = "kDoAPCodecAttributeIDObjectType %u";
            goto LABEL_38;
          }
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_100072250();
          }
          break;
        case 10:
          if (v6 > v11)
          {
            v8 += 3;
            a5->unsigned int var10 = a3[v11];
            uint64_t v35 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
            {
              unsigned int var10 = a5->var10;
              *(_DWORD *)buf = 67109120;
              unsigned int v39 = var10;
              v16 = v35;
              v17 = "kDoAPCodecAttributeIDVBR %u";
LABEL_38:
              _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v17, buf, 8u);
            }
            goto LABEL_39;
          }
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
            sub_1000722B8();
          }
          break;
        default:
          v18 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            unsigned int v39 = v10;
            _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error wrong DoAP attributeID %u", buf, 8u);
          }
          v8 += 2;
LABEL_39:
          if (v6 > v8) {
            continue;
          }
          break;
      }
      break;
    }
  }
}

- (void)parseTLVCodecList:(char *)a3 dataLength:(unsigned __int8)a4 streamID:(unsigned __int16)a5
{
  if (a4)
  {
    uint64_t v5 = a5;
    unsigned int v6 = a4;
    int v9 = 0;
    while (1)
    {
      long long v15 = 0uLL;
      int v16 = 0;
      LOBYTE(v15) = a3[v9];
      unsigned int v10 = qword_1000CD178;
      if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v15;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "DoAPCodecType %u", buf, 8u);
      }
      if (v6 <= (v9 + 1)) {
        break;
      }
      int v11 = v9 + 2;
      uint64_t v12 = a3[v9 + 1];
      [(DoAPClientService *)self parseTLVCodecValue:&a3[(v9 + 2)] dataLength:v12 codecStruct:&v15];
      unsigned __int16 v13 = [[DoAPCodec alloc] initWithID:v5];
      *(_OWORD *)buf = v15;
      int v18 = v16;
      [(DoAPCodec *)v13 addCodec:buf];
      uint64_t v14 = [(DoAPClientService *)self codecList];
      [v14 addObject:v13];

      int v9 = v12 + v11;
      if (v6 <= (v12 + v11)) {
        return;
      }
    }
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100072320();
    }
  }
}

- (void)createDoAPDevice
{
  uint64_t v27 = [(DoAPClientService *)self SupportedCodecsCharacteristic];
  objc_super v3 = [v27 value];
  if (v3
    && [(DoAPClientService *)self isStartStreamingNotificationEnabled]
    && [(DoAPClientService *)self isStopStreamingNotificationEnabled]
    && [(DoAPClientService *)self isSendDataNotificationEnabled])
  {
    unsigned __int8 v4 = [(DoAPClientService *)self isEventIndicatorNotificationEnabled];

    if (v4)
    {
      uint64_t v5 = [(DoAPClientService *)self SupportedCodecsCharacteristic];
      unsigned int v6 = [v5 value];
      id v7 = [v6 length];

      if ((unint64_t)v7 >= 7)
      {
        int v8 = [(DoAPClientService *)self SupportedCodecsCharacteristic];
        id v9 = [v8 value];
        unsigned int v10 = (unsigned __int8 *)[v9 bytes];

        unsigned int v13 = *v10;
        int v11 = (unsigned __int16 *)(v10 + 1);
        unsigned int v12 = v13;
        uint64_t v14 = qword_1000CD178;
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
        {
          sub_1000723C8(v12, v14);
          if (!v12) {
            return;
          }
        }
        else if (!v12)
        {
          return;
        }
        int v15 = 0;
        do
        {
          uint64_t v16 = *v11;
          v17 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            int v31 = v16;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "DoAP StreamID 0x%02x", buf, 8u);
          }
          uint64_t v18 = *((unsigned __int8 *)v11 + 2);
          uint64_t v19 = qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            int v31 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "DoAPCodec list length is %u", buf, 8u);
          }
          int v11 = (unsigned __int16 *)((char *)v11 + 3);
          if (v18)
          {
            [(DoAPClientService *)self parseTLVCodecList:v11 dataLength:v18 streamID:v16];
            v20 = [(DoAPClientService *)self codecList];
            uint64_t v21 = +[DoAPDevice doapDeviceWithCodecs:v20 streamID:v16];

            if (v21)
            {
              [v21 setService:self];
              v22 = [(ClientService *)self peripheral];
              [v21 setPeripheral:v22];

              uint64_t v23 = [(DoAPClientService *)self doapDevices];
              [v23 addObject:v21];

              [v21 start];
            }
            else
            {
              uint64_t v25 = qword_1000CD178;
              if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
                sub_100072388(&v28, v29, v25);
              }
            }
            int v11 = (unsigned __int16 *)((char *)v11 + v18);
            v26 = [(DoAPClientService *)self codecList];
            [v26 removeAllObjects];
          }
          else
          {
            v24 = qword_1000CD178;
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              int v31 = v16;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "DoAP Error No codeclist for streamID%u", buf, 8u);
            }
          }
          ++v15;
        }
        while (v12 > v15);
      }
    }
  }
  else
  {
  }
}

- (void)destroyDoAPDevice
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(DoAPClientService *)self doapDevices];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      unsigned int v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) stop];
        unsigned int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)notifyDidStartIfEverythingReady
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(DoAPClientService *)self doapDevices];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      long long v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) state] != 2)
        {

          return;
        }
        long long v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  long long v8 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DoAPService didStart", v9, 2u);
  }
  [(ClientService *)self notifyDidStart];
}

- (void)setNotificationEnabled:(id)a3
{
  id v12 = a3;
  id v4 = +[CBUUID UUIDWithString:CBUUIDStartStreamingCharacteristicString];
  unsigned int v5 = [v12 isEqual:v4];

  if (v5)
  {
    [(DoAPClientService *)self setIsStartStreamingNotificationEnabled:1];
  }
  else
  {
    uint64_t v6 = +[CBUUID UUIDWithString:CBUUIDStopStreamingCharacteristicString];
    unsigned int v7 = [v12 isEqual:v6];

    if (v7)
    {
      [(DoAPClientService *)self setIsStopStreamingNotificationEnabled:1];
    }
    else
    {
      long long v8 = +[CBUUID UUIDWithString:CBUUIDSendDataCharacteristicString];
      unsigned int v9 = [v12 isEqual:v8];

      if (v9)
      {
        [(DoAPClientService *)self setIsSendDataNotificationEnabled:1];
      }
      else
      {
        long long v10 = +[CBUUID UUIDWithString:CBUUIDEventIndicatorCharacteristicString];
        unsigned int v11 = [v12 isEqual:v10];

        if (v11) {
          [(DoAPClientService *)self setIsEventIndicatorNotificationEnabled:1];
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v8 = a3;
  unsigned int v9 = v8;
  if (a5) {
    goto LABEL_2;
  }
  v51 = v8;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = [a4 characteristics];
  id v10 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v10)
  {
    id v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v56;
    uint64_t v53 = CBUUIDSupportedCodecsCharacteristicString;
    uint64_t v52 = CBUUIDSelectedCodecCharacteristicString;
    uint64_t v50 = CBUUIDStartStreamingCharacteristicString;
    uint64_t v48 = CBUUIDSendDataCharacteristicString;
    uint64_t v49 = CBUUIDStopStreamingCharacteristicString;
    uint64_t v47 = CBUUIDEventIndicatorCharacteristicString;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v14);
        uint64_t v16 = [(DoAPClientService *)self SupportedCodecsCharacteristic];
        if (v16)
        {
        }
        else
        {
          v17 = [v15 UUID];
          uint64_t v18 = +[CBUUID UUIDWithString:v53];
          unsigned int v19 = [v17 isEqual:v18];

          if (v19)
          {
            [(DoAPClientService *)self setSupportedCodecsCharacteristic:v15];
            v20 = [v15 value];

            if (!v20) {
              [v51 readValueForCharacteristic:v15];
            }
            goto LABEL_38;
          }
        }
        uint64_t v21 = [(DoAPClientService *)self SelectedCodecCharacteristic];
        if (v21)
        {
        }
        else
        {
          v22 = [v15 UUID];
          uint64_t v23 = +[CBUUID UUIDWithString:v52];
          unsigned int v24 = [v22 isEqual:v23];

          if (v24)
          {
            [(DoAPClientService *)self setSelectedCodecCharacteristic:v15];
            goto LABEL_38;
          }
        }
        uint64_t v25 = [(DoAPClientService *)self StartStreamingCharacteristic];
        if (v25)
        {
        }
        else
        {
          v26 = [v15 UUID];
          uint64_t v27 = +[CBUUID UUIDWithString:v50];
          unsigned int v28 = [v26 isEqual:v27];

          if (v28)
          {
            [(DoAPClientService *)self setStartStreamingCharacteristic:v15];
            if ((v12 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
        }
        uint64_t v29 = [(DoAPClientService *)self StopStreamingCharacteristic];
        if (v29)
        {
        }
        else
        {
          v30 = [v15 UUID];
          int v31 = +[CBUUID UUIDWithString:v49];
          unsigned int v32 = [v30 isEqual:v31];

          if (v32)
          {
            [(DoAPClientService *)self setStopStreamingCharacteristic:v15];
            if ((v12 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
        }
        uint64_t v33 = [(DoAPClientService *)self SendDataCharacteristic];
        if (v33)
        {
        }
        else
        {
          v34 = [v15 UUID];
          uint64_t v35 = +[CBUUID UUIDWithString:v48];
          unsigned int v36 = [v34 isEqual:v35];

          if (v36)
          {
            [(DoAPClientService *)self setSendDataCharacteristic:v15];
            if ((v12 & 1) == 0) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
        }
        v37 = [(DoAPClientService *)self EventIndicatorCharacteristic];
        if (v37)
        {
        }
        else
        {
          v38 = [v15 UUID];
          unsigned int v39 = +[CBUUID UUIDWithString:v47];
          unsigned int v40 = [v38 isEqual:v39];

          if (v40)
          {
            [(DoAPClientService *)self setEventIndicatorCharacteristic:v15];
            if (v12) {
              goto LABEL_22;
            }
LABEL_21:
            [v51 discoverDescriptorsForCharacteristic:v15];
LABEL_22:
            char v12 = 1;
          }
        }
LABEL_38:
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [obj countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v11);
  }

  v41 = [(DoAPClientService *)self SupportedCodecsCharacteristic];

  if (v41)
  {
    v42 = [(DoAPClientService *)self SelectedCodecCharacteristic];

    unsigned int v9 = v51;
    if (v42)
    {
      v43 = [(DoAPClientService *)self StartStreamingCharacteristic];

      if (v43)
      {
        v44 = [(DoAPClientService *)self StopStreamingCharacteristic];

        if (v44)
        {
          v45 = [(DoAPClientService *)self SendDataCharacteristic];

          if (v45)
          {
            v46 = [(DoAPClientService *)self EventIndicatorCharacteristic];

            if (!v46 && os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
              sub_100072548();
            }
          }
          else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            sub_100072514();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
        {
          sub_1000724E0();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
      {
        sub_1000724AC();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      sub_100072478();
    }
  }
  else
  {
    unsigned int v9 = v51;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
      sub_100072444();
    }
  }
LABEL_2:
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v7 = a4;
  if (!a5)
  {
    int v8 = _os_feature_enabled_impl();
    id v9 = [(DoAPClientService *)self SupportedCodecsCharacteristic];

    if (v8)
    {
      if (v9 != v7)
      {
        uint64_t v10 = [(DoAPClientService *)self StartStreamingCharacteristic];
        id v11 = v7;
        if ((id)v10 != v7)
        {
          char v12 = (void *)v10;
          uint64_t v13 = [(DoAPClientService *)self StopStreamingCharacteristic];
          uint64_t v14 = v7;
          if ((id)v13 != v7)
          {
            int v15 = (void *)v13;
            uint64_t v16 = [(DoAPClientService *)self SendDataCharacteristic];
            if ((id)v16 != v7)
            {
              v17 = (void *)v16;
              id v18 = [(DoAPClientService *)self EventIndicatorCharacteristic];

              if (v18 != v7) {
                goto LABEL_2;
              }
              goto LABEL_20;
            }

            uint64_t v14 = v15;
          }

          id v11 = v12;
        }

LABEL_20:
        unsigned int v28 = [v7 value];
        uint64_t v29 = +[DataInputStream inputStreamWithData:v28 byteOrder:1];

        unsigned __int16 v65 = 0;
        long long v55 = v29;
        [v29 readUint16:&v65];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id obj = [(DoAPClientService *)self doapDevices];
        id v30 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
        if (!v30) {
          goto LABEL_37;
        }
        id v31 = v30;
        uint64_t v32 = *(void *)v62;
        while (1)
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v62 != v32) {
              objc_enumerationMutation(obj);
            }
            v34 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            unsigned int v35 = [v34 streamID];
            int v36 = v65;
            id v37 = [(DoAPClientService *)self StopStreamingCharacteristic];

            if (v37 != v7)
            {
              id v38 = [(DoAPClientService *)self SendDataCharacteristic];

              if (v38 != v7)
              {
                unsigned int v39 = self;
                id v40 = [(DoAPClientService *)self EventIndicatorCharacteristic];

                if (v40 == v7
                  && ([v7 value],
                      v41 = objc_claimAutoreleasedReturnValue(),
                      id v42 = [v41 length],
                      v41,
                      (unint64_t)v42 >= 3))
                {
                  id v43 = [v7 value];
                  v44 = (unsigned __int8 *)[v43 bytes];

                  int v45 = v44[2];
                  self = v39;
                  if (v45 != 3 && v35 != v36) {
                    continue;
                  }
                }
                else
                {
                  self = v39;
                  if (v35 != v36) {
                    continue;
                  }
                }
              }
            }
            if ([v34 state] >= 2) {
              [(DoAPClientService *)self handleInputData:v7 targetDevice:v34];
            }
          }
          id v31 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
          if (!v31)
          {
LABEL_37:

            goto LABEL_2;
          }
        }
      }
LABEL_16:
      [(DoAPClientService *)self createDoAPDevice];
      goto LABEL_2;
    }
    if (v9 == v7) {
      goto LABEL_16;
    }
    uint64_t v19 = [(DoAPClientService *)self StartStreamingCharacteristic];
    v20 = v7;
    if ((id)v19 != v7)
    {
      uint64_t v21 = (void *)v19;
      uint64_t v22 = [(DoAPClientService *)self StopStreamingCharacteristic];
      uint64_t v23 = v7;
      if ((id)v22 != v7)
      {
        unsigned int v24 = (void *)v22;
        uint64_t v25 = [(DoAPClientService *)self SendDataCharacteristic];
        if ((id)v25 != v7)
        {
          v26 = (void *)v25;
          id v27 = [(DoAPClientService *)self EventIndicatorCharacteristic];

          if (v27 != v7) {
            goto LABEL_2;
          }
LABEL_41:
          v46 = [v7 value];
          uint64_t v47 = +[DataInputStream inputStreamWithData:v46 byteOrder:1];

          unsigned __int16 v65 = 0;
          [v47 readUint16:&v65];
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          uint64_t v48 = [(DoAPClientService *)self doapDevices];
          id v49 = [v48 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v49)
          {
            id v50 = v49;
            uint64_t v51 = *(void *)v58;
            do
            {
              for (j = 0; j != v50; j = (char *)j + 1)
              {
                if (*(void *)v58 != v51) {
                  objc_enumerationMutation(v48);
                }
                uint64_t v53 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
                unsigned int v54 = [v53 streamID];
                if (v54 == v65)
                {
                  if ([v53 state] >= 2) {
                    [(DoAPClientService *)self handleInputData:v7 targetDevice:v53];
                  }
                  goto LABEL_52;
                }
              }
              id v50 = [v48 countByEnumeratingWithState:&v57 objects:v66 count:16];
            }
            while (v50);
          }
LABEL_52:

          goto LABEL_2;
        }

        uint64_t v23 = v24;
      }

      v20 = v21;
    }

    goto LABEL_41;
  }
LABEL_2:
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)qword_1000CD178;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
    {
      char v12 = v11;
      uint64_t v13 = [v9 UUID];
      uint64_t v14 = [(DoAPClientService *)self uuidToString:v13];
      int v16 = 138412546;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "DoAP Error starting notifications on %@ characteristic: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
      sub_10007257C(v11, v9);
    }
    int v15 = [v9 UUID];
    [(DoAPClientService *)self setNotificationEnabled:v15];

    [(DoAPClientService *)self createDoAPDevice];
  }
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5) {
    goto LABEL_2;
  }
  uint64_t v10 = [(DoAPClientService *)self StartStreamingCharacteristic];
  id v11 = v9;
  if ((id)v10 != v9)
  {
    char v12 = (void *)v10;
    uint64_t v13 = [(DoAPClientService *)self StopStreamingCharacteristic];
    uint64_t v14 = v9;
    if ((id)v13 != v9)
    {
      int v15 = (void *)v13;
      uint64_t v16 = [(DoAPClientService *)self SendDataCharacteristic];
      if ((id)v16 != v9)
      {
        v17 = (void *)v16;
        id v18 = [(DoAPClientService *)self EventIndicatorCharacteristic];

        if (v18 != v9) {
          goto LABEL_2;
        }
        goto LABEL_11;
      }

      uint64_t v14 = v15;
    }

    id v11 = v12;
  }

LABEL_11:
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v19 = [v9 descriptors:self];
  id v20 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v39;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v19);
        }
        unsigned int v24 = [*(id *)(*((void *)&v38 + 1) + 8 * i) UUID];
        uint64_t v25 = +[CBUUID UUIDWithString:CBUUIDClientCharacteristicConfigurationString];
        unsigned __int8 v26 = [v24 isEqual:v25];

        if (v26)
        {

          unsigned int v28 = (void *)qword_1000CD178;
          if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
            sub_1000726F4(v28, v9);
          }
          uint64_t v29 = [v37 StartStreamingCharacteristic];

          if (v29)
          {
            id v30 = [v37 StartStreamingCharacteristic];
            [v8 setNotifyValue:1 forCharacteristic:v30];
          }
          id v31 = [v37 StopStreamingCharacteristic];

          if (v31)
          {
            uint64_t v32 = [v37 StopStreamingCharacteristic];
            [v8 setNotifyValue:1 forCharacteristic:v32];
          }
          uint64_t v33 = [v37 SendDataCharacteristic];

          if (v33)
          {
            v34 = [v37 SendDataCharacteristic];
            [v8 setNotifyValue:1 forCharacteristic:v34];
          }
          unsigned int v35 = [v37 EventIndicatorCharacteristic];

          if (v35)
          {
            int v36 = [v37 EventIndicatorCharacteristic];
            [v8 setNotifyValue:1 forCharacteristic:v36];
          }
          goto LABEL_2;
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  id v27 = (void *)qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
    sub_100072630(v27, v9);
  }
LABEL_2:
}

- (void)doapDeviceDidStop
{
  id v3 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPService didStop", buf, 2u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(DoAPClientService *)self doapDevices];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v11 + 1) + 8 * v8) state] != 8) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    id v9 = qword_1000CD178;
    if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Remove all DoAP devices", buf, 2u);
    }
    uint64_t v10 = [(DoAPClientService *)self codecList];
    [v10 removeAllObjects];

    id v4 = [(DoAPClientService *)self doapDevices];
    [v4 removeAllObjects];
  }
}

- (void)selectCodec:(id)a3
{
  id v4 = a3;
  id v5 = [(DoAPClientService *)self SelectedCodecCharacteristic];
  [(DoAPClientService *)self writeData:v4 forCharacteristic:v5 withResponse:0];
}

- (void)startStreaming:(id)a3
{
  id v4 = a3;
  id v5 = [(DoAPClientService *)self StartStreamingCharacteristic];
  [(DoAPClientService *)self writeData:v4 forCharacteristic:v5 withResponse:0];
}

- (void)stopStreaming:(id)a3
{
  id v4 = a3;
  id v5 = [(DoAPClientService *)self StopStreamingCharacteristic];
  [(DoAPClientService *)self writeData:v4 forCharacteristic:v5 withResponse:0];
}

- (void)eventIndicator:(id)a3
{
  id v4 = a3;
  id v5 = [(DoAPClientService *)self EventIndicatorCharacteristic];
  [(DoAPClientService *)self writeData:v4 forCharacteristic:v5 withResponse:0];
}

- (void)writeData:(id)a3 forCharacteristic:(id)a4 withResponse:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG))
  {
    sub_1000727A8();
    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!a5)
  {
LABEL_3:
    uint64_t v10 = [(ClientService *)self peripheral];
    [v10 writeValue:v8 forCharacteristic:v9 type:1];
  }
LABEL_4:
}

- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = qword_1000CD178;
  if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DoAPService setHighPriorityLink %d", (uint8_t *)v9, 8u);
  }
  id v8 = [(ClientService *)self peripheral];
  [v8 setHighPriorityStream:v4 duration:v6];
}

- (void)handleInputData:(id)a3 targetDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 value];
  id v8 = (unsigned __int8 *)[v7 bytes];

  id v9 = [v5 value];
  unsigned int v10 = [v9 length];

  long long v11 = [v5 UUID];
  long long v12 = +[CBUUID UUIDWithString:CBUUIDStartStreamingCharacteristicString];
  unsigned int v13 = [v11 isEqual:v12];

  if (v13)
  {
    [v6 handleStartStreaming];
  }
  else
  {
    long long v14 = [v5 UUID];
    int v15 = +[CBUUID UUIDWithString:CBUUIDStopStreamingCharacteristicString];
    unsigned int v16 = [v14 isEqual:v15];

    if (v16)
    {
      if (v10 < 3)
      {
        if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
          sub_1000727E8();
        }
      }
      else
      {
        [v6 handleStopStreaming:v8[2]];
      }
    }
    else
    {
      v17 = [v5 UUID];
      id v18 = +[CBUUID UUIDWithString:CBUUIDSendDataCharacteristicString];
      unsigned int v19 = [v17 isEqual:v18];

      if (v19)
      {
        if (v10 > 4)
        {
          uint64_t v24 = *(unsigned __int16 *)(v8 + 3);
          unsigned int v25 = v10 - 5;
          unsigned __int8 v26 = qword_1000CD178;
          if (v25 == v24)
          {
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_DEBUG)) {
              sub_1000728B8((uint64_t)v8, v24, v26);
            }
            [v6 handleAudioData:v8 + 5 dataLength:v24];
          }
          else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
          {
            sub_100072944();
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
        {
          sub_100072850();
        }
      }
      else
      {
        id v20 = [v5 UUID];
        id v21 = +[CBUUID UUIDWithString:CBUUIDEventIndicatorCharacteristicString];
        unsigned int v22 = [v20 isEqual:v21];

        if (v22)
        {
          if (v10 < 3)
          {
            if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR)) {
              sub_1000729B8();
            }
          }
          else
          {
            if (v10 <= 4) {
              uint64_t v23 = 0;
            }
            else {
              uint64_t v23 = (char *)(v8 + 4);
            }
            [v6 handleEventIndicator:v8[2] eventValue:v23];
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1000CD178, OS_LOG_TYPE_ERROR))
        {
          sub_100072A20();
        }
      }
    }
  }
}

- (id)uuidToString:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[CBUUID UUIDWithString:CBUUIDSupportedCodecsCharacteristicString];
  unsigned __int8 v5 = [v3 isEqual:v4];

  if (v5)
  {
    CFStringRef v6 = @"SupportedCodecs";
  }
  else
  {
    id v7 = +[CBUUID UUIDWithString:CBUUIDSelectedCodecCharacteristicString];
    unsigned __int8 v8 = [v3 isEqual:v7];

    if (v8)
    {
      CFStringRef v6 = @"SelectedCodec";
    }
    else
    {
      id v9 = +[CBUUID UUIDWithString:CBUUIDStartStreamingCharacteristicString];
      unsigned __int8 v10 = [v3 isEqual:v9];

      if (v10)
      {
        CFStringRef v6 = @"StartStreaming";
      }
      else
      {
        long long v11 = +[CBUUID UUIDWithString:CBUUIDStopStreamingCharacteristicString];
        unsigned __int8 v12 = [v3 isEqual:v11];

        if (v12)
        {
          CFStringRef v6 = @"StopStreaming";
        }
        else
        {
          unsigned int v13 = +[CBUUID UUIDWithString:CBUUIDSendDataCharacteristicString];
          unsigned __int8 v14 = [v3 isEqual:v13];

          if (v14)
          {
            CFStringRef v6 = @"SendData";
          }
          else
          {
            int v15 = +[CBUUID UUIDWithString:CBUUIDEventIndicatorCharacteristicString];
            unsigned int v16 = [v3 isEqual:v15];

            if (v16) {
              CFStringRef v6 = @"EventIndicator";
            }
            else {
              CFStringRef v6 = @"Invalid UUID";
            }
          }
        }
      }
    }
  }

  return (id)v6;
}

- (CBCharacteristic)SupportedCodecsCharacteristic
{
  return self->_SupportedCodecsCharacteristic;
}

- (void)setSupportedCodecsCharacteristic:(id)a3
{
}

- (CBCharacteristic)SelectedCodecCharacteristic
{
  return self->_SelectedCodecCharacteristic;
}

- (void)setSelectedCodecCharacteristic:(id)a3
{
}

- (CBCharacteristic)StartStreamingCharacteristic
{
  return self->_StartStreamingCharacteristic;
}

- (void)setStartStreamingCharacteristic:(id)a3
{
}

- (CBCharacteristic)StopStreamingCharacteristic
{
  return self->_StopStreamingCharacteristic;
}

- (void)setStopStreamingCharacteristic:(id)a3
{
}

- (CBCharacteristic)SendDataCharacteristic
{
  return self->_SendDataCharacteristic;
}

- (void)setSendDataCharacteristic:(id)a3
{
}

- (CBCharacteristic)EventIndicatorCharacteristic
{
  return self->_EventIndicatorCharacteristic;
}

- (void)setEventIndicatorCharacteristic:(id)a3
{
}

- (NSMutableArray)codecList
{
  return self->_codecList;
}

- (void)setCodecList:(id)a3
{
}

- (NSMutableArray)doapDevices
{
  return self->_doapDevices;
}

- (void)setDoapDevices:(id)a3
{
}

- (BOOL)isStartStreamingNotificationEnabled
{
  return self->_isStartStreamingNotificationEnabled;
}

- (void)setIsStartStreamingNotificationEnabled:(BOOL)a3
{
  self->_isStartStreamingNotificationEnabled = a3;
}

- (BOOL)isStopStreamingNotificationEnabled
{
  return self->_isStopStreamingNotificationEnabled;
}

- (void)setIsStopStreamingNotificationEnabled:(BOOL)a3
{
  self->_isStopStreamingNotificationEnabled = a3;
}

- (BOOL)isSendDataNotificationEnabled
{
  return self->_isSendDataNotificationEnabled;
}

- (void)setIsSendDataNotificationEnabled:(BOOL)a3
{
  self->_isSendDataNotificationEnabled = a3;
}

- (BOOL)isEventIndicatorNotificationEnabled
{
  return self->_isEventIndicatorNotificationEnabled;
}

- (void)setIsEventIndicatorNotificationEnabled:(BOOL)a3
{
  self->_isEventIndicatorNotificationEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doapDevices, 0);
  objc_storeStrong((id *)&self->_codecList, 0);
  objc_storeStrong((id *)&self->_EventIndicatorCharacteristic, 0);
  objc_storeStrong((id *)&self->_SendDataCharacteristic, 0);
  objc_storeStrong((id *)&self->_StopStreamingCharacteristic, 0);
  objc_storeStrong((id *)&self->_StartStreamingCharacteristic, 0);
  objc_storeStrong((id *)&self->_SelectedCodecCharacteristic, 0);

  objc_storeStrong((id *)&self->_SupportedCodecsCharacteristic, 0);
}

@end