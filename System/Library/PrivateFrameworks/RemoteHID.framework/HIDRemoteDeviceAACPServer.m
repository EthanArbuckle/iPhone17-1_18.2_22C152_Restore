@interface HIDRemoteDeviceAACPServer
- (BOOL)createRemoteDevice:(id)a3 deviceID:(unint64_t)a4 property:(id)a5;
- (HIDRemoteDeviceAACPServer)initWithQueue:(id)a3;
- (OS_dispatch_queue)btQueue;
- (id)description;
- (int)remoteDeviceGetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6;
- (int)remoteDeviceSetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6;
- (int)sendMessageBTDevice:(BTDeviceImpl *)a3 data:(char *)a4 size:(unint64_t)a5 transportVersion:(unsigned __int8)a6 side:(unsigned __int8)a7;
- (os_state_data_s)stateHandler:(os_state_hints_s *)a3;
- (unint64_t)syncRemoteTimestamp:(unint64_t)a3 forEndpoint:(id)a4;
- (void)activate;
- (void)addBTDevice:(BTDeviceImpl *)a3;
- (void)btAccessoryEventHandler:(BTDeviceImpl *)a3 event:(int)a4 state:(int)a5;
- (void)btDeviceMessageHandler:(BTDeviceImpl *)a3 type:(int)a4 data:(char *)a5 size:(unint64_t)a6;
- (void)btServiceEventHandler:(BTDeviceImpl *)a3 services:(unsigned int)a4 eventType:(int)a5 event:(unsigned int)a6 result:(int)a7;
- (void)btSessionCreate;
- (void)btSessionEventHandler:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5;
- (void)btSessionInit:(BTSessionImpl *)a3;
- (void)cancel;
- (void)removeBTDevice:(BTDeviceImpl *)a3;
- (void)setBtQueue:(id)a3;
@end

@implementation HIDRemoteDeviceAACPServer

- (HIDRemoteDeviceAACPServer)initWithQueue:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HIDRemoteDeviceAACPServer;
  v3 = [(HIDRemoteDeviceServer *)&v12 initWithQueue:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.hidrc.bluetooth", 0);
    btQueue = v3->_btQueue;
    v3->_btQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263EFF990] dataWithLength:1050];
    decodeBuff = v3->_decodeBuff;
    v3->_decodeBuff = (NSMutableData *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    endpointTimeSyncEnabled = v3->_endpointTimeSyncEnabled;
    v3->_endpointTimeSyncEnabled = v8;

    v10 = v3;
  }

  return v3;
}

- (id)description
{
  v2 = NSString;
  if (self->_timeSyncClock) {
    v3 = "YES";
  }
  else {
    v3 = "NO";
  }
  v7.receiver = self;
  v7.super_class = (Class)HIDRemoteDeviceAACPServer;
  dispatch_queue_t v4 = [(HIDRemoteDeviceServer *)&v7 description];
  v5 = [v2 stringWithFormat:@"<HIDRemoteDeviceAACPServer timeSync:%s %@>", v3, v4];

  return v5;
}

- (void)activate
{
  [(HIDRemoteDeviceAACPServer *)self btSessionCreate];
  v3.receiver = self;
  v3.super_class = (Class)HIDRemoteDeviceAACPServer;
  [(HIDRemoteDeviceServer *)&v3 activate];
}

- (void)cancel
{
  if (self->_session)
  {
    objc_storeStrong((id *)&self->_me, self);
    BTSessionDetachWithQueue();
  }
  objc_super v3 = [(HIDRemoteDeviceServer *)self endpoints];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__HIDRemoteDeviceAACPServer_cancel__block_invoke;
  v5[3] = &unk_26474F608;
  v5[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)HIDRemoteDeviceAACPServer;
  [(HIDRemoteDeviceServer *)&v4 cancel];
}

void __35__HIDRemoteDeviceAACPServer_cancel__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_super v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  objc_msgSend(v4, "removeBTDevice:", objc_msgSend(v6, "unsignedLongLongValue"));
}

- (void)btSessionCreate
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTSessionAttachWithQueue:%d", v2, v3, v4, v5, v6);
}

- (void)btSessionInit:(BTSessionImpl *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_session = a3;
  if (BTAccessoryManagerGetDefault())
  {
    uint64_t v4 = RemoteHIDLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer btSessionInit:].cold.5();
    }
LABEL_13:

    return;
  }
  if (BTAccessoryManagerAddCallbacks())
  {
    uint64_t v4 = RemoteHIDLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer btSessionInit:].cold.4();
    }
    goto LABEL_13;
  }
  if (BTServiceAddCallbacks())
  {
    uint64_t v4 = RemoteHIDLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer btSessionInit:]();
    }
    goto LABEL_13;
  }
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  if (BTLocalDeviceGetDefault())
  {
    uint64_t v4 = RemoteHIDLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer btSessionInit:]();
    }
    goto LABEL_13;
  }
  unint64_t v11 = 256;
  memset(v9, 170, sizeof(v9));
  if (BTLocalDeviceGetConnectedDevices())
  {
    uint64_t v5 = RemoteHIDLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer btSessionInit:]();
    }
  }
  else if (v11)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      unsigned int v10 = 0;
      BTDeviceGetConnectedServices();
      [(HIDRemoteDeviceAACPServer *)self btServiceEventHandler:v9[v6] services:v10 eventType:0 event:11 result:0];
      uint64_t v6 = v7;
    }
    while (v11 > v7++);
  }
}

- (void)btSessionEventHandler:(BTSessionImpl *)a3 event:(int)a4 result:(int)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v9 = RemoteHIDLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    v17 = a3;
    __int16 v18 = 1024;
    int v19 = a4;
    __int16 v20 = 1024;
    int v21 = a5;
    _os_log_impl(&dword_225713000, v9, OS_LOG_TYPE_DEFAULT, "btSessionEventHandler session:%p event:%d result:%d", buf, 0x18u);
  }

  if (a4 == 2)
  {
    self->_session = 0;
    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    unint64_t v11 = [(HIDRemoteDeviceAACPServer *)self btQueue];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__HIDRemoteDeviceAACPServer_btSessionEventHandler_event_result___block_invoke_2;
    v14[3] = &unk_26474F630;
    v14[4] = self;
    unint64_t v12 = v14;
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    me = self->_me;
    self->_me = 0;
  }
  else
  {
    if (a4) {
      return;
    }
    if (a5)
    {
      dispatch_time_t v10 = dispatch_time(0, 1000000000);
      unint64_t v11 = [(HIDRemoteDeviceAACPServer *)self btQueue];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __64__HIDRemoteDeviceAACPServer_btSessionEventHandler_event_result___block_invoke;
      v15[3] = &unk_26474F630;
      v15[4] = self;
      unint64_t v12 = v15;
LABEL_9:
      dispatch_after(v10, v11, v12);

      return;
    }
    [(HIDRemoteDeviceAACPServer *)self btSessionInit:a3];
  }
}

uint64_t __64__HIDRemoteDeviceAACPServer_btSessionEventHandler_event_result___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) btSessionCreate];
}

uint64_t __64__HIDRemoteDeviceAACPServer_btSessionEventHandler_event_result___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) btSessionCreate];
}

- (void)addBTDevice:(BTDeviceImpl *)a3
{
  *(void *)&v18[5] = *MEMORY[0x263EF8340];
  int v16 = 0;
  int FeatureCapability = BTAccessoryManagerGetFeatureCapability();
  uint64_t v6 = RemoteHIDLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v18[0] = FeatureCapability;
    LOWORD(v18[1]) = 1024;
    *(_DWORD *)((char *)&v18[1] + 2) = v16;
    _os_log_impl(&dword_225713000, v6, OS_LOG_TYPE_INFO, "BTAccessoryManagerGetFeatureCapability:%d (FEATURE_SENSOR_DATA:%d)", buf, 0xEu);
  }

  if (BTAccessoryManagerRegisterCustomMessageClient())
  {
    RemoteHIDLog();
    unsigned int v7 = (HIDRemoteEndpoint *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer addBTDevice:].cold.4();
    }
    goto LABEL_19;
  }
  if (BTAccessoryManagerRegisterCustomMessageClient())
  {
    RemoteHIDLog();
    unsigned int v7 = (HIDRemoteEndpoint *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer addBTDevice:]();
    }
    goto LABEL_19;
  }
  if (BTAccessoryManagerRegisterCustomMessageClient())
  {
    RemoteHIDLog();
    unsigned int v7 = (HIDRemoteEndpoint *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer addBTDevice:]();
    }
    goto LABEL_19;
  }
  unsigned int v7 = [[HIDRemoteEndpoint alloc] initWithID:a3];
  v8 = [(HIDRemoteDeviceServer *)self endpoints];
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HIDRemoteEndpoint endpointID](v7, "endpointID"));
  dispatch_time_t v10 = [v8 objectForKeyedSubscript:v9];

  unint64_t v11 = RemoteHIDLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (!v12) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v18 = a3;
    uint64_t v13 = "HID AACP device:%p already connected";
  }
  else
  {
    if (!v12) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v18 = a3;
    uint64_t v13 = "HID AACP device:%p";
  }
  _os_log_impl(&dword_225713000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
LABEL_18:

  [(HIDRemoteDeviceServer *)self connectEndpoint:v7];
  v15[0] = 0xAAA00200AAAAAAAALL;
  [(HIDRemoteDeviceAACPServer *)self sendMessageBTDevice:a3 data:v15 size:8 transportVersion:0 side:0];
  [(HIDRemoteDeviceAACPServer *)self sendMessageBTDevice:a3 data:v15 size:8 transportVersion:1 side:0];
  if ([(HIDRemoteDeviceAACPServer *)self sendMessageBTDevice:a3 data:v15 size:8 transportVersion:1 side:1])
  {
    v14 = RemoteHIDLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer addBTDevice:]();
    }
  }
LABEL_19:
}

- (int)sendMessageBTDevice:(BTDeviceImpl *)a3 data:(char *)a4 size:(unint64_t)a5 transportVersion:(unsigned __int8)a6 side:(unsigned __int8)a7
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  if (a5 >= 8)
  {
    int v8 = a6;
    *(_DWORD *)a4 = 0;
    *(_WORD *)(a4 + 1) = ++generation;
    a4[3] = 2 * (a7 & 1);
    unint64_t v11 = RemoteHIDLogPackets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v29 = a3;
      __int16 v30 = 1040;
      int v31 = a5;
      __int16 v32 = 2096;
      v33 = a4;
      _os_log_debug_impl(&dword_225713000, v11, OS_LOG_TYPE_DEBUG, "[%p] send packet:%{RemoteHID:packet}.*P", buf, 0x1Cu);
    }

    if (!v8)
    {
      id v16 = 0;
LABEL_12:
      int v22 = BTAccessoryManagerSendCustomMessage();
      if (!v22) {
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    encodeHeader((uint64_t)a4, a5, 0, 0, &v26, 1);
    if (v12)
    {
      uint64_t v13 = (int *)(a4 + 4);
      encode((int *)a4 + 1, a5 - 4, 0, 0, &v27, 0, 1);
      if (v14)
      {
        v15 = [MEMORY[0x263EFF990] dataWithLength:v27 + v26];
        if (v15)
        {
          id v16 = v15;
          encodeHeader((uint64_t)a4, a5, (uint64_t (*)(uint64_t, char *, uint64_t))[v16 mutableBytes], (uint64_t (*)(uint64_t, char *, uint64_t))objc_msgSend(v16, "length"), &v26, 0);
          if (v17)
          {
            id v16 = v16;
            uint64_t v18 = [v16 mutableBytes];
            int v19 = (uint64_t (*)(uint64_t, char *, uint64_t))(v18 + v26);
            uint64_t v20 = [v16 length];
            encode(v13, a5 - 4, v19, (uint64_t (*)(uint64_t, char *, uint64_t))(v20 - v26), &v27, 0, 0);
            if (v21)
            {
              id v16 = v16;
              [v16 mutableBytes];
              [v16 length];
              goto LABEL_12;
            }
            v25 = RemoteHIDLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:]();
            }
          }
          else
          {
            v25 = RemoteHIDLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.4();
            }
          }
          goto LABEL_29;
        }
        v25 = RemoteHIDLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:]();
        }
      }
      else
      {
        v25 = RemoteHIDLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.5();
        }
      }
    }
    else
    {
      v25 = RemoteHIDLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:].cold.6();
      }
    }
    id v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  id v16 = 0;
LABEL_30:
  int v22 = 5;
LABEL_13:
  v23 = RemoteHIDLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:]();
  }

LABEL_16:
  return v22;
}

- (void)removeBTDevice:(BTDeviceImpl *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = RemoteHIDLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    uint64_t v18 = a3;
    _os_log_impl(&dword_225713000, v5, OS_LOG_TYPE_DEFAULT, "HID AACP device remove:%p", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v6 = [(HIDRemoteDeviceServer *)self endpoints];
  unsigned int v7 = [NSNumber numberWithUnsignedLongLong:a3];
  int v8 = [v6 objectForKeyedSubscript:v7];
  [(HIDRemoteDeviceServer *)self disconnectEndpoint:v8];

  endpointTimeSyncEnabled = self->_endpointTimeSyncEnabled;
  dispatch_time_t v10 = [NSNumber numberWithUnsignedLongLong:a3];
  unint64_t v11 = [(NSMutableDictionary *)endpointTimeSyncEnabled objectForKeyedSubscript:v10];

  if ([MEMORY[0x263EFFA88] isEqual:v11])
  {
    int v12 = BTAccessoryManagerRemoteTimeSyncEnable();
    if (v12)
    {
      int v13 = v12;
      char v14 = RemoteHIDLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134218240;
        uint64_t v18 = a3;
        __int16 v19 = 1024;
        int v20 = v13;
        _os_log_impl(&dword_225713000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't disable timesync for device:%p status:%d", (uint8_t *)&v17, 0x12u);
      }
    }
    v15 = self->_endpointTimeSyncEnabled;
    id v16 = [NSNumber numberWithUnsignedLongLong:a3];
    [(NSMutableDictionary *)v15 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:v16];
  }
}

- (void)btDeviceMessageHandler:(BTDeviceImpl *)a3 type:(int)a4 data:(char *)a5 size:(unint64_t)a6
{
  *(void *)&v28[13] = *MEMORY[0x263EF8340];
  unint64_t v11 = [(HIDRemoteDeviceServer *)self endpoints];
  int v12 = [NSNumber numberWithUnsignedLongLong:a3];
  int v13 = [v11 objectForKeyedSubscript:v12];

  uint64_t v22 = 0;
  if (v13)
  {
    if (a4 != 0x100000)
    {
LABEL_6:
      id v16 = RemoteHIDLogPackets();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = mach_absolute_time();
        *(_DWORD *)buf = 134219010;
        v24 = a3;
        __int16 v25 = 1024;
        *(_DWORD *)uint64_t v26 = a4;
        *(_WORD *)&v26[4] = 2048;
        *(void *)&v26[6] = v17;
        __int16 v27 = 1040;
        *(_DWORD *)v28 = a6;
        v28[2] = 2096;
        *(void *)&v28[3] = a5;
        _os_log_debug_impl(&dword_225713000, v16, OS_LOG_TYPE_DEBUG, "[%p] receive packet - type:0x%x timestamp:%lld packet:%{RemoteHID:packet}.*P", buf, 0x2Cu);
      }

      [(HIDRemoteDeviceServer *)self endpointMessageHandler:v13 data:a5 size:a6];
      goto LABEL_9;
    }
    decodeHeader((uint64_t)a5, a6, (uint64_t)[(NSMutableData *)self->_decodeBuff mutableBytes], [(NSMutableData *)self->_decodeBuff length]);
    if (v14)
    {
      decode((uint64_t)a5, a6, (uint64_t)([(NSMutableData *)self->_decodeBuff mutableBytes] + 4), [(NSMutableData *)self->_decodeBuff length] - 4, &v22, 0);
      if (v15)
      {
        a5 = [(NSMutableData *)self->_decodeBuff mutableBytes];
        a6 = v22 + 4;
        goto LABEL_6;
      }
      __int16 v19 = RemoteHIDLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[HIDRemoteDeviceAACPServer btDeviceMessageHandler:type:data:size:]();
      }
    }
    else
    {
      __int16 v19 = RemoteHIDLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[HIDRemoteDeviceAACPServer btDeviceMessageHandler:type:data:size:]();
      }
    }

    int v20 = RemoteHIDLogPackets();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = mach_absolute_time();
      *(_DWORD *)buf = 134218754;
      v24 = a3;
      __int16 v25 = 2048;
      *(void *)uint64_t v26 = v21;
      *(_WORD *)&v26[8] = 1040;
      *(_DWORD *)&v26[10] = a6;
      __int16 v27 = 2096;
      *(void *)v28 = a5;
      _os_log_error_impl(&dword_225713000, v20, OS_LOG_TYPE_ERROR, "[%p] encoded packet - timestamp:%lld packet:%{RemoteHID:encodedpacket}.*P", buf, 0x26u);
    }
  }
  else
  {
    uint64_t v18 = RemoteHIDLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer btDeviceMessageHandler:type:data:size:]((uint64_t)a3, v18);
    }
  }
LABEL_9:
}

- (void)btServiceEventHandler:(BTDeviceImpl *)a3 services:(unsigned int)a4 eventType:(int)a5 event:(unsigned int)a6 result:(int)a7
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v13 = RemoteHIDLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14[0] = 67109888;
    v14[1] = a4;
    __int16 v15 = 1024;
    int v16 = a5;
    __int16 v17 = 1024;
    unsigned int v18 = a6;
    __int16 v19 = 1024;
    int v20 = a7;
    _os_log_debug_impl(&dword_225713000, v13, OS_LOG_TYPE_DEBUG, "btServiceEventHandler services:0x%x eventType:%d event:%d result:%d", (uint8_t *)v14, 0x1Au);
  }

  if ((a4 & 0x80000) != 0)
  {
    if (a6 != 11 || a7 | a5)
    {
      if (a5 == 1 && a6 == 12) {
        [(HIDRemoteDeviceAACPServer *)self removeBTDevice:a3];
      }
    }
    else
    {
      [(HIDRemoteDeviceAACPServer *)self addBTDevice:a3];
    }
  }
}

- (void)btAccessoryEventHandler:(BTDeviceImpl *)a3 event:(int)a4 state:(int)a5
{
  *(void *)&v23[5] = *MEMORY[0x263EF8340];
  v9 = RemoteHIDLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v21 = a3;
    __int16 v22 = 1024;
    *(_DWORD *)v23 = a4;
    v23[2] = 1024;
    *(_DWORD *)&v23[3] = a5;
    _os_log_impl(&dword_225713000, v9, OS_LOG_TYPE_INFO, "btAccessoryEventHandler device:%p event:%d state:%d", buf, 0x18u);
  }

  if (a4 == 8)
  {
    unsigned int v18 = RemoteHIDLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = a3;
      _os_log_impl(&dword_225713000, v18, OS_LOG_TYPE_DEFAULT, "TIMESYNC_NOT_AVAILABLE device:%p", buf, 0xCu);
    }

    timeSyncClock = self->_timeSyncClock;
    self->_timeSyncClock = 0;
  }
  else if (a4 == 7)
  {
    dispatch_time_t v10 = RemoteHIDLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = a3;
      _os_log_impl(&dword_225713000, v10, OS_LOG_TYPE_DEFAULT, "TIMESYNC_AVAILABLE device:%p", buf, 0xCu);
    }

    if (!self->_coreTimeSyncManager)
    {
      unint64_t v11 = [MEMORY[0x263F7F258] sharedClockManager];
      coreTimeSyncManager = self->_coreTimeSyncManager;
      self->_coreTimeSyncManager = v11;

      if (!self->_coreTimeSyncManager)
      {
        __int16 v17 = RemoteHIDLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[HIDRemoteDeviceAACPServer btAccessoryEventHandler:event:state:]();
        }
        goto LABEL_23;
      }
    }
    int TimeSyncId = BTAccessoryManagerGetTimeSyncId();
    char v14 = RemoteHIDLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v21 = a3;
      __int16 v22 = 2048;
      *(void *)v23 = 0;
      _os_log_impl(&dword_225713000, v14, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetTimeSyncId device:%p tsID:0x%llx", buf, 0x16u);
    }

    if (TimeSyncId)
    {
      __int16 v17 = RemoteHIDLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[HIDRemoteDeviceAACPServer btAccessoryEventHandler:event:state:]();
      }
      goto LABEL_23;
    }
    __int16 v15 = [(TSClockManager *)self->_coreTimeSyncManager clockWithClockIdentifier:0];
    int v16 = self->_timeSyncClock;
    self->_timeSyncClock = v15;

    if (!self->_timeSyncClock)
    {
      __int16 v17 = RemoteHIDLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[HIDRemoteDeviceAACPServer btAccessoryEventHandler:event:state:]();
      }
LABEL_23:
    }
  }
}

- (int)remoteDeviceSetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  unint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF990]), "initWithLength:", objc_msgSend(v10, "length") + 9);
  int v12 = RemoteHIDLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 134218498;
    uint64_t v22 = [v9 deviceID];
    __int16 v23 = 2048;
    int64_t v24 = a4;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_debug_impl(&dword_225713000, v12, OS_LOG_TYPE_DEBUG, "remoteDeviceSetReport deviceID:0x%llx type:%ld report:%@", (uint8_t *)&v21, 0x20u);
  }

  id v13 = v11;
  uint64_t v14 = [v13 bytes];
  id v15 = v10;
  memcpy((void *)(v14 + 9), (const void *)[v15 bytes], objc_msgSend(v15, "length"));
  *(_DWORD *)(v14 + 4) = *(_DWORD *)(v14 + 4) & 0xFFFFFF80 | [v9 deviceID] & 0x7F;
  *(_DWORD *)(v14 + 4) = *(_DWORD *)(v14 + 4) & 0xFF80007F | (([v15 length] << 7) + 640) & 0x1FF80 | 0x60000;
  *(unsigned char *)(v14 + 8) = a4;
  uint64_t v16 = [v9 endpointID];
  id v17 = v13;
  if (-[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:](self, "sendMessageBTDevice:data:size:transportVersion:side:", v16, [v17 bytes], objc_msgSend(v17, "length"), objc_msgSend(v9, "transportVersion"), objc_msgSend(v9, "side")))
  {
    int v20 = RemoteHIDLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer remoteDeviceSetReport:type:reportID:report:]();
    }

    int v18 = -536870212;
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

- (BOOL)createRemoteDevice:(id)a3 deviceID:(unint64_t)a4 property:(id)a5
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  [v9 setObject:@"BT-AACP" forKeyedSubscript:@"Transport"];
  [v9 setObject:&unk_26D8E31A8 forKeyedSubscript:@"RequestTimeout"];
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v45 + 15) = v10;
  long long v44 = v10;
  v45[0] = v10;
  long long v42 = v10;
  long long v43 = v10;
  long long v40 = v10;
  long long v41 = v10;
  long long v38 = v10;
  long long v39 = v10;
  long long v36 = v10;
  long long v37 = v10;
  long long v34 = v10;
  long long v35 = v10;
  long long v32 = v10;
  long long v33 = v10;
  long long v31 = v10;
  [v8 endpointID];
  if (!BTDeviceGetAddressString())
  {
    memset(buf, 170, 6);
    if (!BTDeviceAddressFromString())
    {
      unint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:6];
      [v9 setObject:v11 forKeyedSubscript:@"BT_ADDR"];
    }
  }
  int v12 = [v9 objectForKeyedSubscript:@"TimeSyncEnabled"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 unsignedIntValue])
  {
    endpointTimeSyncEnabled = self->_endpointTimeSyncEnabled;
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "endpointID"));
    id v15 = [(NSMutableDictionary *)endpointTimeSyncEnabled objectForKeyedSubscript:v14];

    if ([MEMORY[0x263EFFA88] isEqual:v15])
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v16 = [v8 endpointID];
    int v17 = BTAccessoryManagerRemoteTimeSyncEnable();
    if (v17)
    {
      int v18 = v17;
      __int16 v19 = RemoteHIDLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v16;
        __int16 v29 = 1024;
        int v30 = v18;
        int v20 = "Couldn't enable timesync for device:%p status:%d";
        int v21 = v19;
        uint32_t v22 = 18;
LABEL_12:
        _os_log_impl(&dword_225713000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
    else
    {
      __int16 v23 = self->_endpointTimeSyncEnabled;
      int64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "endpointID"));
      [(NSMutableDictionary *)v23 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v24];

      __int16 v19 = RemoteHIDLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v16;
        int v20 = "Enabled timesync for device:%p";
        int v21 = v19;
        uint32_t v22 = 12;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
LABEL_15:
  v27.receiver = self;
  v27.super_class = (Class)HIDRemoteDeviceAACPServer;
  BOOL v25 = [(HIDRemoteDeviceServer *)&v27 createRemoteDevice:v8 deviceID:a4 property:v9];

  return v25;
}

- (int)remoteDeviceGetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6
{
  char v7 = a4;
  long long v10 = (objc_class *)MEMORY[0x263EFF990];
  id v11 = a6;
  id v12 = a3;
  id v13 = (id) [[v10 alloc] initWithLength:10];
  uint64_t v14 = [v13 bytes];
  *(_DWORD *)(v14 + 4) = *(_DWORD *)(v14 + 4) & 0xFF800000 | [v12 deviceID] & 0x7F | 0x80300;
  *(unsigned char *)(v14 + 8) = v7;
  *(unsigned char *)(v14 + 9) = a5;
  uint64_t v15 = [v12 endpointID];
  id v16 = v13;
  LODWORD(self) = -[HIDRemoteDeviceAACPServer sendMessageBTDevice:data:size:transportVersion:side:](self, "sendMessageBTDevice:data:size:transportVersion:side:", v15, [v16 bytes], objc_msgSend(v16, "length"), objc_msgSend(v12, "transportVersion"), objc_msgSend(v12, "side"));

  if (self)
  {
    __int16 v19 = RemoteHIDLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer remoteDeviceGetReport:type:reportID:report:]();
    }

    int v17 = -536870212;
  }
  else
  {
    int v17 = 0;
  }

  return v17;
}

- (unint64_t)syncRemoteTimestamp:(unint64_t)a3 forEndpoint:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  mach_timebase_info info = (mach_timebase_info)0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = mach_absolute_time();
  mach_timebase_info(&info);
  p_timeSyncClock = &self->_timeSyncClock;
  timeSyncClock = self->_timeSyncClock;
  if (timeSyncClock && [(TSUserFilteredClock *)timeSyncClock lockState] == 2)
  {
    unint64_t v9 = [(TSUserFilteredClock *)*p_timeSyncClock convertFromDomainToMachAbsoluteTime:a3];
    uint64_t numer = info.numer;
    unint64_t denom = info.denom;
    id v12 = RemoteHIDLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v14 = v9 - v6;
      if (v6 > v9) {
        unint64_t v14 = v6 - v9;
      }
      unint64_t v15 = v14 * numer;
      id v16 = "-";
      if (v6 > v9) {
        id v16 = "+";
      }
      *(_DWORD *)buf = 134219010;
      unint64_t v19 = a3;
      __int16 v20 = 2048;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      unint64_t v23 = v9;
      __int16 v24 = 2080;
      BOOL v25 = v16;
      __int16 v26 = 2048;
      unint64_t v27 = v15 / denom;
      _os_log_debug_impl(&dword_225713000, v12, OS_LOG_TYPE_DEBUG, "W2 btclk(ns):%llu local abs:%llu Synced ts:%llu remote->local latency(ns):%s%llu", buf, 0x34u);
    }
  }
  else
  {
    id v12 = RemoteHIDLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer syncRemoteTimestamp:forEndpoint:]((id *)p_timeSyncClock, v12);
    }
    unint64_t v9 = 0;
  }

  return v9;
}

- (os_state_data_s)stateHandler:(os_state_hints_s *)a3
{
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy_;
  __int16 v22 = __Block_byref_object_dispose_;
  id v23 = (id)0xAAAAAAAAAAAAAAAALL;
  id v23 = (id)objc_opt_new();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  id v17 = 0;
  if (a3->var2 - 4 < 0xFFFFFFFE)
  {
    char v7 = 0;
    long long v10 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [(HIDRemoteDeviceServer *)self endpoints];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __42__HIDRemoteDeviceAACPServer_stateHandler___block_invoke;
  void v15[3] = &unk_26474F658;
  v15[4] = v16;
  void v15[5] = &v18;
  [v5 enumerateKeysAndObjectsUsingBlock:v15];

  uint64_t v6 = v19[5];
  id v14 = 0;
  char v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v6 format:200 options:0 error:&v14];
  id v8 = v14;
  unint64_t v9 = v8;
  if (!v7)
  {
    long long v10 = 0;
    if (!v8) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  long long v10 = (os_state_data_s *)malloc_type_calloc(1uLL, [v7 length] + 200, 0x2C60EA41uLL);
  if (v10)
  {
    __strlcpy_chk();
    v10->var0 = 1;
    v10->var1.var1 = [v7 length];
    id v11 = v7;
    memcpy(v10->var4, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  }
  if (v9)
  {
LABEL_6:
    id v12 = RemoteHIDLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceAACPServer stateHandler:]((uint64_t)v9, v12);
    }
  }
LABEL_9:

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

uint64_t __42__HIDRemoteDeviceAACPServer_stateHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 copyState];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  char v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return [v7 addObject:v8];
}

- (OS_dispatch_queue)btQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBtQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_btQueue, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_endpointTimeSyncEnabled, 0);
  objc_storeStrong((id *)&self->_timeSyncClock, 0);
  objc_storeStrong((id *)&self->_coreTimeSyncManager, 0);
  objc_storeStrong((id *)&self->_decodeBuff, 0);
}

- (void)btSessionInit:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTLocalDeviceGetConnectedDevices:%d", v2, v3, v4, v5, v6);
}

- (void)btSessionInit:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTLocalDeviceGetDefault:%d", v2, v3, v4, v5, v6);
}

- (void)btSessionInit:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTServiceAddCallbacks:%d", v2, v3, v4, v5, v6);
}

- (void)btSessionInit:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTAccessoryManagerAddCallbacks:%d", v2, v3, v4, v5, v6);
}

- (void)btSessionInit:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTAccessoryManagerGetDefault:%d", v2, v3, v4, v5, v6);
}

- (void)addBTDevice:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_225713000, v0, v1, "addDevice device:%p result:%d", v2, v3);
}

- (void)addBTDevice:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTAccessoryManagerRegisterCustomMessageClient 3:%d", v2, v3, v4, v5, v6);
}

- (void)addBTDevice:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTAccessoryManagerRegisterCustomMessageClient 2:%d", v2, v3, v4, v5, v6);
}

- (void)addBTDevice:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTAccessoryManagerRegisterCustomMessageClient 1:%d", v2, v3, v4, v5, v6);
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_225713000, v0, v1, "BTAccessoryManagerSendCustomMessage fail - device:%p result:%d", v2, v3);
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "encodedData alloc fail", v2, v3, v4, v5, v6);
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "encode fail", v2, v3, v4, v5, v6);
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "encodeHeader fail", v2, v3, v4, v5, v6);
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "encode size fail", v2, v3, v4, v5, v6);
}

- (void)sendMessageBTDevice:data:size:transportVersion:side:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "encodeHeader size fail", v2, v3, v4, v5, v6);
}

- (void)btDeviceMessageHandler:(uint64_t)a1 type:(NSObject *)a2 data:size:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225713000, a2, OS_LOG_TYPE_ERROR, "Unknown device:%p", (uint8_t *)&v2, 0xCu);
}

- (void)btDeviceMessageHandler:type:data:size:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "decode fail", v2, v3, v4, v5, v6);
}

- (void)btDeviceMessageHandler:type:data:size:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "decodeHeader fail", v2, v3, v4, v5, v6);
}

- (void)btAccessoryEventHandler:event:state:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "Couldn't create TSClockManager!", v2, v3, v4, v5, v6);
}

- (void)btAccessoryEventHandler:event:state:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_225713000, v0, v1, "Couldn't create TSUserFilteredClock!", v2, v3, v4, v5, v6);
}

- (void)btAccessoryEventHandler:event:state:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "BTAccessoryManagerGetTimeSyncId failed result:%d", v2, v3, v4, v5, v6);
}

- (void)remoteDeviceSetReport:type:reportID:report:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_225713000, v0, v1, "SetReport device:%p status:%d", v2, v3);
}

- (void)remoteDeviceGetReport:type:reportID:report:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_225713000, v0, v1, "GetReport device:%p status:%d", v2, v3);
}

- (void)syncRemoteTimestamp:(id *)a1 forEndpoint:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*a1 clockIdentifier];
  int v5 = [*a1 lockState];
  int v6 = 134218240;
  uint64_t v7 = v4;
  __int16 v8 = 1024;
  int v9 = v5;
  _os_log_error_impl(&dword_225713000, a2, OS_LOG_TYPE_ERROR, "Timesync: not locked, clockID: 0x%llx state: %d", (uint8_t *)&v6, 0x12u);
}

- (void)stateHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225713000, a2, OS_LOG_TYPE_ERROR, "Plist Serialization error %@", (uint8_t *)&v2, 0xCu);
}

@end