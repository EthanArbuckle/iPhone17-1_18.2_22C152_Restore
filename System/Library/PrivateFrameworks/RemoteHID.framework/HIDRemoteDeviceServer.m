@interface HIDRemoteDeviceServer
- (BOOL)connectEndpoint:(id)a3;
- (BOOL)createRemoteDevice:(id)a3 deviceID:(unint64_t)a4 property:(id)a5;
- (BOOL)remoteDeviceGetReportHandler:(id)a3 packet:(id *)a4;
- (BOOL)remoteDeviceReportHandler:(id)a3 header:(id *)a4;
- (BOOL)remoteDeviceReportHandler:(id)a3 packet:(id *)a4;
- (BOOL)remoteDeviceSetReportHandler:(id)a3 packet:(id *)a4;
- (BOOL)remoteDeviceTimestampedReportHandler:(id)a3 device:(id)a4 packet:(id *)a5;
- (HIDRemoteDeviceServer)initWithQueue:(id)a3;
- (NSMutableDictionary)endpoints;
- (OS_dispatch_queue)queue;
- (id)description;
- (int)remoteDeviceGetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6;
- (int)remoteDeviceSetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6;
- (unint64_t)syncRemoteTimestamp:(unint64_t)a3 forEndpoint:(id)a4;
- (void)disconnectAll;
- (void)disconnectEndpoint:(id)a3;
- (void)endpointMessageHandler:(id)a3 data:(char *)a4 size:(unint64_t)a5;
- (void)endpointPacketHandler:(id)a3 packet:(id *)a4 transportVersion:(unsigned __int8)a5 side:(unsigned __int8)a6;
- (void)remoteDeviceConnectHandler:(id)a3 packet:(id *)a4 transportVersion:(unsigned __int8)a5 side:(unsigned __int8)a6;
@end

@implementation HIDRemoteDeviceServer

- (HIDRemoteDeviceServer)initWithQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HIDRemoteDeviceServer;
  v6 = [(HIDRemoteDeviceServer *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    endpoints = v7->_endpoints;
    v7->_endpoints = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.hid.RemoteHID", 0);
    asyncQueue = v7->_asyncQueue;
    v7->_asyncQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = [(HIDRemoteDeviceServer *)self endpoints];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__HIDRemoteDeviceServer_description__block_invoke;
  v11[3] = &unk_26474F608;
  id v12 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];

  v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HIDRemoteDeviceServer;
  v7 = [(HIDRemoteDeviceServer *)&v10 description];
  v8 = [v6 stringWithFormat:@"<HIDRemoteDeviceServer state:%@ %@>", v5, v7];

  return v8;
}

void __36__HIDRemoteDeviceServer_description__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)[a3 copyState];
  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)connectEndpoint:(id)a3
{
  id v4 = a3;
  [(HIDRemoteDeviceServer *)self disconnectEndpoint:v4];
  id v5 = [(HIDRemoteDeviceServer *)self endpoints];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "endpointID"));
  [v5 setObject:v4 forKeyedSubscript:v6];

  return 1;
}

- (void)disconnectEndpoint:(id)a3
{
  id v12 = a3;
  id v4 = [(HIDRemoteDeviceServer *)self endpoints];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "endpointID"));
  v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    v7 = [(HIDRemoteDeviceServer *)self endpoints];
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "endpointID"));
    v9 = [v7 objectForKeyedSubscript:v8];
    [v9 removeAllDevices];

    objc_super v10 = [(HIDRemoteDeviceServer *)self endpoints];
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "endpointID"));
    [v10 setObject:0 forKeyedSubscript:v11];
  }
}

- (BOOL)createRemoteDevice:(id)a3 deviceID:(unint64_t)a4 property:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F41DF0]];
  [v9 setObject:&unk_26D8E31C0 forKeyedSubscript:@"ReportInterval"];
  objc_super v10 = [v9 objectForKeyedSubscript:@"SerialNumber"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v12 = [NSString alloc];
    id v13 = [v9 objectForKeyedSubscript:@"SerialNumber"];
    uint64_t v14 = [v13 bytes];
    v15 = [v9 objectForKeyedSubscript:@"SerialNumber"];
    v16 = objc_msgSend(v12, "initWithBytes:length:encoding:", v14, objc_msgSend(v15, "length") - 1, 4);
    [v9 setObject:v16 forKeyedSubscript:@"SerialNumber"];
  }
  v17 = [[HIDRemoteDevice alloc] initWithProperties:v9];
  if (v17)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v17);
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke;
    v30[3] = &unk_26474F6D0;
    objc_copyWeak(&v31, &location);
    v30[4] = self;
    [(HIDUserDevice *)v17 setSetReportHandler:v30];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_135;
    v28[3] = &unk_26474F6F8;
    objc_copyWeak(&v29, &location);
    v28[4] = self;
    [(HIDUserDevice *)v17 setGetReportHandler:v28];
    v18 = [v9 objectForKeyedSubscript:@"VersionNumber"];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if (v19)
    {
      v20 = [v9 objectForKeyedSubscript:@"VersionNumber"];
      -[HIDRemoteDevice setTransportVersion:](v17, "setTransportVersion:", [v20 unsignedIntegerValue]);
    }
    v21 = [v9 objectForKeyedSubscript:@"Side"];
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass();

    if (v22)
    {
      v23 = [v9 objectForKeyedSubscript:@"Side"];
      -[HIDRemoteDevice setSide:](v17, "setSide:", [v23 unsignedIntegerValue]);
    }
    [(HIDRemoteDevice *)v17 setDeviceID:a4];
    v24 = [(HIDRemoteDeviceServer *)self queue];
    [(HIDUserDevice *)v17 setDispatchQueue:v24];

    [(HIDUserDevice *)v17 activate];
    [v8 addDevice:v17];
    v25 = RemoteHIDLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v17;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v9;
      _os_log_impl(&dword_225713000, v25, OS_LOG_TYPE_DEFAULT, "Create device:%@ for endpoint:%@ property:%@", buf, 0x20u);
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  else
  {
    v26 = RemoteHIDLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer createRemoteDevice:deviceID:property:]();
    }
  }
  return v17 != 0;
}

uint64_t __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  if (WeakRetained)
  {
    uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytes:a4 length:a5];
    id v12 = (void *)v25[5];
    v25[5] = v11;

    id v13 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_129;
    block[3] = &unk_26474F6A8;
    id v14 = WeakRetained;
    uint64_t v22 = a2;
    uint64_t v23 = a3;
    v21 = &v24;
    uint64_t v15 = *(void *)(a1 + 32);
    id v19 = v14;
    uint64_t v20 = v15;
    dispatch_async(v13, block);

    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = 3758097088;
  }
  _Block_object_dispose(&v24, 8);

  return v16;
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_129(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  v26[0] = &v25;
  v26[1] = 0x2020000000;
  int v27 = -1431655766;
  v2 = RemoteHIDLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) deviceID];
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 67109890;
    int v29 = v3;
    __int16 v30 = 2048;
    *(void *)id v31 = v5;
    *(_WORD *)&v31[8] = 2048;
    *(void *)&v31[10] = v4;
    __int16 v32 = 2112;
    uint64_t v33 = v6;
    _os_log_impl(&dword_225713000, v2, OS_LOG_TYPE_INFO, "[device:%d] setReport type:%ld reportID:%ld report:%@", buf, 0x26u);
  }

  [*(id *)(a1 + 32) setLastSetReportStatus:3758097084];
  [*(id *)(a1 + 32) setWaitForReport:1];
  unint64_t v7 = 0;
  while (1)
  {
    id v8 = [*(id *)(a1 + 40) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_130;
    block[3] = &unk_26474F680;
    uint64_t v22 = &v25;
    int8x16_t v19 = *(int8x16_t *)(a1 + 32);
    id v9 = (id)v19.i64[0];
    int8x16_t v21 = vextq_s8(v19, v19, 8uLL);
    long long v24 = *(_OWORD *)(a1 + 56);
    uint64_t v23 = *(void *)(a1 + 48);
    dispatch_async(v8, block);

    objc_super v10 = [*(id *)(a1 + 32) semaphore];
    dispatch_time_t v11 = dispatch_time(0, 200000000);
    intptr_t v12 = dispatch_semaphore_wait(v10, v11);

    if (v12)
    {
      *(_DWORD *)(v26[0] + 24) = -536870186;
      [*(id *)(a1 + 32) setLastSetReportStatus:3758097110];
    }
    if (!*(_DWORD *)(v26[0] + 24)) {
      break;
    }
    id v13 = RemoteHIDLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = [*(id *)(a1 + 32) deviceID];
      int v15 = *(_DWORD *)(v26[0] + 24);
      uint64_t v16 = (const char *)&unk_22571F456;
      if (v7 < 2) {
        uint64_t v16 = ", retrying";
      }
      *(_DWORD *)buf = 67109634;
      int v29 = v14;
      __int16 v30 = 1024;
      *(_DWORD *)id v31 = v15;
      *(_WORD *)&v31[4] = 2080;
      *(void *)&v31[6] = v16;
      _os_log_error_impl(&dword_225713000, v13, OS_LOG_TYPE_ERROR, "[device:%d] remoteDeviceSetReport:0x%x%s", buf, 0x18u);
    }

    if (++v7 == 3) {
      goto LABEL_14;
    }
  }

LABEL_14:
  int v17 = [*(id *)(a1 + 32) lastSetReportStatus];
  *(_DWORD *)(v26[0] + 24) = v17;
  [*(id *)(a1 + 32) setWaitForReport:0];
  if (*(_DWORD *)(v26[0] + 24))
  {
    v18 = RemoteHIDLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_129_cold_1([*(id *)(a1 + 32) deviceID], (uint64_t)v26, buf, v18);
    }
  }
  _Block_object_dispose(&v25, 8);
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_130(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) remoteDeviceSetReport:*(void *)(a1 + 40) type:*(void *)(a1 + 64) reportID:*(unsigned __int8 *)(a1 + 72) report:*(void *)(*(void *)(*(void *)(a1 + 56) + 8)+ 40)];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v2 = [*(id *)(a1 + 40) semaphore];
    dispatch_semaphore_signal(v2);
  }
}

uint64_t __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_135(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, size_t *a5)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_time_t v11 = RemoteHIDLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v27[0] = 67109632;
      v27[1] = [WeakRetained deviceID];
      __int16 v28 = 2048;
      uint64_t v29 = a2;
      __int16 v30 = 2048;
      uint64_t v31 = a3;
      _os_log_impl(&dword_225713000, v11, OS_LOG_TYPE_INFO, "[device:%d] getReport type:%ld reportID:%ld", (uint8_t *)v27, 0x1Cu);
    }

    intptr_t v12 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:a4 length:*a5 freeWhenDone:0];
    id v13 = (void *)[v12 mutableCopy];
    [WeakRetained setLastGetReport:0];
    [WeakRetained setWaitForReport:1];
    uint64_t v14 = [*(id *)(a1 + 32) remoteDeviceGetReport:WeakRetained type:a2 reportID:a3 report:v13];
    if (v14)
    {
      uint64_t v25 = v14;
      long long v24 = RemoteHIDLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_135_cold_3(WeakRetained);
      }
    }
    else
    {
      int v15 = [WeakRetained semaphore];
      dispatch_time_t v16 = dispatch_time(0, 1000000000);
      intptr_t v17 = dispatch_semaphore_wait(v15, v16);

      if (v17)
      {
        long long v24 = RemoteHIDLog();
        uint64_t v25 = 3758097110;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_135_cold_2(WeakRetained);
        }
      }
      else
      {
        v18 = [WeakRetained lastGetReport];

        if (v18)
        {
          unint64_t v19 = [v12 length];
          uint64_t v20 = [WeakRetained lastGetReport];
          unint64_t v21 = [v20 length];

          if (v19 >= v21) {
            size_t v22 = v21;
          }
          else {
            size_t v22 = v19;
          }
          *a5 = v22;
          uint64_t v23 = (void *)[v12 bytes];
          long long v24 = [WeakRetained lastGetReport];
          memcpy(v23, (const void *)[v24 bytes], *a5);
          uint64_t v25 = 0;
        }
        else
        {
          long long v24 = RemoteHIDLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_135_cold_1(WeakRetained);
          }
          uint64_t v25 = 3758097084;
        }
      }
    }

    [WeakRetained setWaitForReport:0];
  }
  else
  {
    uint64_t v25 = 3758097088;
  }

  return v25;
}

- (unint64_t)syncRemoteTimestamp:(unint64_t)a3 forEndpoint:(id)a4
{
  return 0;
}

- (int)remoteDeviceSetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6
{
  return -536870201;
}

- (int)remoteDeviceGetReport:(id)a3 type:(int64_t)a4 reportID:(unsigned __int8)a5 report:(id)a6
{
  return -536870201;
}

- (BOOL)remoteDeviceReportHandler:(id)a3 packet:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = ((unint64_t)a4->var0 >> 7) & 0x3FF;
  if (v6 > 5)
  {
    unint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:a4->var2 length:v6 - 5];
    id v12 = 0;
    char v8 = [v5 handleReport:v7 error:&v12];
    id v9 = v12;
    if ((v8 & 1) == 0)
    {
      objc_super v10 = RemoteHIDLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:]();
      }
    }
  }
  else
  {
    unint64_t v7 = RemoteHIDLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:]();
    }
    char v8 = 0;
  }

  return v8;
}

- (BOOL)remoteDeviceTimestampedReportHandler:(id)a3 device:(id)a4 packet:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ((*(_DWORD *)&a5->var0 & 0x1FF00u) <= 0x6FF)
  {
    objc_super v10 = RemoteHIDLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:]();
    }
LABEL_4:
    char v11 = 0;
    goto LABEL_11;
  }
  unint64_t v12 = [(HIDRemoteDeviceServer *)self syncRemoteTimestamp:*(void *)(&a5->var1 + 1) forEndpoint:v8];
  if (!v12)
  {
    objc_super v10 = RemoteHIDLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(&a5->var1 + 1);
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v17;
      _os_log_impl(&dword_225713000, v10, OS_LOG_TYPE_INFO, "Error syncing time with BT, dropping report! W2 TS:%llu", buf, 0xCu);
    }
    goto LABEL_4;
  }
  unint64_t v13 = v12;
  objc_super v10 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)&a5->var2 + 5 length:(((unint64_t)a5->var0 >> 7) & 0x3FF) - 13];
  id v18 = 0;
  char v11 = [v9 handleReport:v10 withTimestamp:v13 error:&v18];
  id v14 = v18;
  if ((v11 & 1) == 0)
  {
    int v15 = RemoteHIDLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:]();
    }
  }
LABEL_11:

  return v11;
}

- (BOOL)remoteDeviceReportHandler:(id)a3 header:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 getDevice:*(_DWORD *)a4 & 0x7FLL];
  if (!v7)
  {
    id v9 = RemoteHIDLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:header:]();
    }

    goto LABEL_11;
  }
  if ((*((unsigned char *)a4 + 2) & 0x10) != 0) {
    BOOL v8 = [(HIDRemoteDeviceServer *)self remoteDeviceTimestampedReportHandler:v6 device:v7 packet:a4];
  }
  else {
    BOOL v8 = [(HIDRemoteDeviceServer *)self remoteDeviceReportHandler:v7 packet:a4];
  }
  BOOL v10 = v8;
  objc_msgSend(v7, "setHandleReportCount:", objc_msgSend(v7, "handleReportCount") + 1);
  if (!v10)
  {
    objc_msgSend(v7, "setHandleReportError:", objc_msgSend(v7, "handleReportError") + 1);
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_12;
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)remoteDeviceSetReportHandler:(id)a3 packet:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  $BB3D4576025F56031F4E4DA6F5282AC4 var0 = a4->var0;
  if ((*(_DWORD *)&a4->var0 & 0x1FF80u) <= 0x27F)
  {
    BOOL v8 = RemoteHIDLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:]();
    }
LABEL_15:
    BOOL v11 = 0;
    goto LABEL_16;
  }
  if ((*(_DWORD *)&var0 & 0x200000) == 0)
  {
    BOOL v8 = RemoteHIDLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceSetReportHandler:packet:](v8);
    }
    goto LABEL_15;
  }
  id v9 = [v5 getDevice:*(unsigned char *)&var0 & 0x7F];
  BOOL v8 = v9;
  if (!v9)
  {
    unint64_t v12 = RemoteHIDLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:header:]();
    }

    goto LABEL_15;
  }
  uint64_t v10 = 0;
  if ((*(_DWORD *)&a4->var0 & 0x400000) != 0 && (*(_DWORD *)&a4->var0 & 0x1FF80u) >= 0x401) {
    uint64_t v10 = *(unsigned int *)a4->var2;
  }
  BOOL v11 = [v9 setReportHandler:a4->var1 reportID:0 status:v10] == 0;
LABEL_16:

  return v11;
}

- (BOOL)remoteDeviceGetReportHandler:(id)a3 packet:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  $BB3D4576025F56031F4E4DA6F5282AC4 var0 = a4->var0;
  if ((*(_DWORD *)&a4->var0 & 0x1FF80u) <= 0x27F)
  {
    BOOL v8 = RemoteHIDLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:]();
    }
LABEL_12:
    BOOL v10 = 0;
    goto LABEL_13;
  }
  if ((*(_DWORD *)&var0 & 0x200000) == 0)
  {
    BOOL v8 = RemoteHIDLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceSetReportHandler:packet:](v8);
    }
    goto LABEL_12;
  }
  id v9 = [v5 getDevice:*(unsigned char *)&var0 & 0x7F];
  BOOL v8 = v9;
  if (!v9)
  {
    BOOL v11 = RemoteHIDLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceReportHandler:header:]();
    }

    goto LABEL_12;
  }
  BOOL v10 = [v9 getReportHandler:a4->var1 reportID:0 report:a4->var2 reportLength:(((unint64_t)a4->var0 >> 7) & 0x3FF) - 5] == 0;
LABEL_13:

  return v10;
}

- (void)remoteDeviceConnectHandler:(id)a3 packet:(id *)a4 transportVersion:(unsigned __int8)a5 side:(unsigned __int8)a6
{
  int v6 = a6;
  uint64_t v7 = a5;
  id v10 = a3;
  unint64_t v11 = ((unint64_t)a4->var0 >> 7) & 0x3FF;
  if (v11 > 4)
  {
    unint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:a4->var1 length:v11 - 4];
    if ((unint64_t)[v12 length] >= 6
      && ((unint64_t v13 = v12, v14 = [v13 bytes], *(_DWORD *)v14 == 1836597052)
        ? (BOOL v15 = *(unsigned char *)(v14 + 4) == 108)
        : (BOOL v15 = 0),
          v15))
    {
      id v32 = 0;
      id v18 = [MEMORY[0x263F08AC0] propertyListWithData:v13 options:2 format:0 error:&v32];
      if (v32)
      {
        id v22 = v32;
        unint64_t v19 = [v22 description];
      }
      else
      {
        unint64_t v19 = 0;
      }
    }
    else
    {
      if ((unint64_t)[v12 length] < 4
        || (dispatch_time_t v16 = v12,
            uint64_t v17 = (unsigned __int16 *)[v16 bytes],
            *v17 ^ 0xD3 | *((unsigned __int8 *)v17 + 2)))
      {
        id v18 = 0;
        unint64_t v19 = @"Unrecognized data format";
        goto LABEL_12;
      }
      uint64_t v31 = 0;
      uint64_t v23 = v16;
      long long v24 = (const char *)[v23 bytes];
      size_t v25 = [v23 length];
      CFTypeRef v26 = IOCFUnserializeBinary(v24, v25, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0, (CFStringRef *)&v31);
      id v18 = (void *)v26;
      if (v26 && (CFTypeID v27 = CFGetTypeID(v26), v27 != CFDictionaryGetTypeID()))
      {
        CFRelease(v18);
        id v18 = 0;
        __int16 v28 = @"Unserialized data is not a dictionary";
      }
      else
      {
        __int16 v28 = 0;
      }
      if (v31) {
        unint64_t v19 = v31;
      }
      else {
        unint64_t v19 = v28;
      }
    }
    if (!v19 && v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [v18 mutableCopy];
        uint64_t v29 = [NSNumber numberWithUnsignedChar:v7];
        [v21 setObject:v29 forKeyedSubscript:@"VersionNumber"];

        if (v7)
        {
          if (v6 == 16) {
            __int16 v30 = &unk_26D8E31D8;
          }
          else {
            __int16 v30 = &unk_26D8E31C0;
          }
          [v21 setObject:v30, @"Side", v31 forKeyedSubscript];
        }
        -[HIDRemoteDeviceServer createRemoteDevice:deviceID:property:](self, "createRemoteDevice:deviceID:property:", v10, *(_DWORD *)&a4->var0 & 0x7FLL, v21, v31);
        unint64_t v19 = 0;
        goto LABEL_16;
      }
      unint64_t v19 = 0;
    }
LABEL_12:
    uint64_t v20 = RemoteHIDLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer remoteDeviceConnectHandler:packet:transportVersion:side:]();
    }

    uint64_t v21 = RemoteHIDLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[HIDRemoteDeviceServer remoteDeviceConnectHandler:packet:transportVersion:side:]((uint64_t)v12, v21);
    }
LABEL_16:

    goto LABEL_17;
  }
  unint64_t v12 = RemoteHIDLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[HIDRemoteDeviceServer remoteDeviceReportHandler:packet:]();
  }
LABEL_17:
}

- (void)endpointMessageHandler:(id)a3 data:(char *)a4 size:(unint64_t)a5
{
  id v8 = a3;
  id v9 = v8;
  if (a5 <= 7)
  {
    uint64_t v21 = RemoteHIDLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer endpointMessageHandler:data:size:]((uint64_t)a4, a5);
    }
  }
  else
  {
    id v10 = a4 + 4;
    int v11 = a4[3];
    if ((~v11 & 3) != 0) {
      unsigned int v12 = 1;
    }
    else {
      unsigned int v12 = 16;
    }
    if (v11) {
      unsigned int v13 = 1;
    }
    else {
      unsigned int v13 = 16;
    }
    int v14 = v11 & 2;
    if ((v11 & 2) != 0) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = v13;
    }
    if (v15 != [v8 primarySide])
    {
      [v9 setPrimarySide:v15];
      [v9 removeAllDevices];
    }
    dispatch_time_t v16 = &a4[a5];
    if (v14) {
      uint64_t v17 = 16;
    }
    else {
      uint64_t v17 = 1;
    }
    while (v10 + 4 <= v16)
    {
      unint64_t v18 = *(unsigned int *)v10;
      uint64_t v19 = (v18 >> 7) & 0x3FF;
      if (v19 < 4 || &v10[v19] > v16) {
        break;
      }
      *(_DWORD *)id v10 = v18 | (32 * v14);
      [(HIDRemoteDeviceServer *)self endpointPacketHandler:v9 packet:v10 transportVersion:*a4 side:v17];
      v10 += ((unint64_t)*(unsigned int *)v10 >> 7) & 0x3FF;
      if (v10 >= v16) {
        goto LABEL_22;
      }
    }
    uint64_t v21 = RemoteHIDLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[HIDRemoteDeviceServer endpointMessageHandler:data:size:]((uint64_t)a4, a5);
    }
  }

LABEL_22:
}

- (void)endpointPacketHandler:(id)a3 packet:(id *)a4 transportVersion:(unsigned __int8)a5 side:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  id v10 = a3;
  int v11 = RemoteHIDLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[HIDRemoteDeviceServer endpointPacketHandler:packet:transportVersion:side:](a4, v11);
  }

  switch((*(unsigned int *)a4 >> 17) & 7)
  {
    case 0u:
      [(HIDRemoteDeviceServer *)self remoteDeviceConnectHandler:v10 packet:a4 transportVersion:v7 side:v6];
      break;
    case 1u:
      [v10 removeDeviceID:*(_DWORD *)a4 & 0x7FLL];
      break;
    case 2u:
      [(HIDRemoteDeviceServer *)self remoteDeviceReportHandler:v10 header:a4];
      break;
    case 3u:
      [(HIDRemoteDeviceServer *)self remoteDeviceSetReportHandler:v10 packet:a4];
      break;
    case 4u:
      [(HIDRemoteDeviceServer *)self remoteDeviceGetReportHandler:v10 packet:a4];
      break;
    default:
      unsigned int v12 = RemoteHIDLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[HIDRemoteDeviceServer endpointPacketHandler:packet:transportVersion:side:]();
      }

      break;
  }
}

- (void)disconnectAll
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_225713000, log, OS_LOG_TYPE_DEBUG, "DisconnectAll", v1, 2u);
}

uint64_t __38__HIDRemoteDeviceServer_disconnectAll__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnectEndpoint:");
}

- (NSMutableDictionary)endpoints
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_asyncQueue, 0);
}

- (void)createRemoteDevice:deviceID:property:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_225713000, v0, v1, "HIDUserDevice failed, property:%@", v2, v3, v4, v5, v6);
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_129_cold_1(int a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  int v4 = *(_DWORD *)(*(void *)a2 + 24);
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = v4;
  _os_log_error_impl(&dword_225713000, log, OS_LOG_TYPE_ERROR, "[device:%d] remoteDeviceSetReport:0x%x", buf, 0xEu);
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_135_cold_1(void *a1)
{
  [a1 deviceID];
  uint64_t v7 = [a1 lastGetReport];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_135_cold_2(void *a1)
{
  [a1 deviceID];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
}

void __62__HIDRemoteDeviceServer_createRemoteDevice_deviceID_property___block_invoke_135_cold_3(void *a1)
{
  [a1 deviceID];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xEu);
}

- (void)remoteDeviceReportHandler:packet:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "Invalid report size:%d", v2, v3, v4, v5, v6);
}

- (void)remoteDeviceReportHandler:packet:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_225713000, v0, v1, "handleReport:%@", v2, v3, v4, v5, v6);
}

- (void)remoteDeviceReportHandler:header:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "HID Device for deviceID:%d does not exist", v2, v3, v4, v5, v6);
}

- (void)remoteDeviceSetReportHandler:(os_log_t)log packet:.cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_225713000, log, OS_LOG_TYPE_ERROR, "Expected response", v1, 2u);
}

- (void)remoteDeviceConnectHandler:(uint64_t)a1 packet:(NSObject *)a2 transportVersion:side:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[[NSString alloc] initWithData:a1 encoding:1];
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_225713000, a2, OS_LOG_TYPE_DEBUG, "HIDPacketDevice config data:%@", v4, 0xCu);
}

- (void)remoteDeviceConnectHandler:packet:transportVersion:side:.cold.3()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0(&dword_225713000, v0, v1, "HIDPacketDevice de-serialization error:%@", v2, v3, v4, v5, v6);
}

- (void)endpointMessageHandler:(uint64_t)a1 data:(uint64_t)a2 size:.cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x263EFF8F8] dataWithBytes:a1 length:a2];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_225713000, v3, v4, "Invalid header - length:%zu data:%@", v5, v6, v7, v8, v9);
}

- (void)endpointMessageHandler:(uint64_t)a1 data:(uint64_t)a2 size:.cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [MEMORY[0x263EFF8F8] dataWithBytes:a1 length:a2];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_225713000, v3, v4, "Invalid message - length:%zu data:%@", v5, v6, v7, v8, v9);
}

- (void)endpointPacketHandler:packet:transportVersion:side:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_225713000, v0, v1, "Unsupported packet type:%u", v2, v3, v4, v5, v6);
}

- (void)endpointPacketHandler:(_DWORD *)a1 packet:(NSObject *)a2 transportVersion:side:.cold.2(_DWORD *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *a1 & 0x7F;
  int v3 = (*a1 >> 17) & 7;
  int v4 = (*a1 >> 7) & 0x3FF;
  v5[0] = 67109632;
  v5[1] = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_debug_impl(&dword_225713000, a2, OS_LOG_TYPE_DEBUG, "endpointPacketHandler deviceid:%u type:%d size:%u", (uint8_t *)v5, 0x14u);
}

@end