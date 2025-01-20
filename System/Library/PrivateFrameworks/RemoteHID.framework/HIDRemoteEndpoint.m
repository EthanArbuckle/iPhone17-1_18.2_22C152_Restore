@interface HIDRemoteEndpoint
- (HIDRemoteEndpoint)initWithID:(unint64_t)a3;
- (id)copyState;
- (id)getDevice:(unint64_t)a3;
- (unint64_t)endpointID;
- (unsigned)primarySide;
- (void)addDevice:(id)a3;
- (void)removeAllDevices;
- (void)removeDevice:(id)a3;
- (void)removeDeviceID:(unint64_t)a3;
- (void)setEndpointID:(unint64_t)a3;
- (void)setPrimarySide:(unsigned __int8)a3;
@end

@implementation HIDRemoteEndpoint

- (HIDRemoteEndpoint)initWithID:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HIDRemoteEndpoint;
  v4 = [(HIDRemoteEndpoint *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_endpointID = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    devices = v5->_devices;
    v5->_devices = v6;

    uint64_t v8 = objc_opt_new();
    prevDeviceLog = v5->_prevDeviceLog;
    v5->_prevDeviceLog = (NSMutableArray *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)getDevice:(unint64_t)a3
{
  devices = self->_devices;
  v4 = [NSNumber numberWithUnsignedLongLong:a3];
  v5 = [(NSMutableDictionary *)devices objectForKeyedSubscript:v4];

  return v5;
}

- (void)addDevice:(id)a3
{
  id v6 = a3;
  -[HIDRemoteEndpoint removeDeviceID:](self, "removeDeviceID:", [v6 deviceID]);
  devices = self->_devices;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "deviceID"));
  [(NSMutableDictionary *)devices setObject:v6 forKeyedSubscript:v5];

  objc_msgSend(v6, "setEndpointID:", -[HIDRemoteEndpoint endpointID](self, "endpointID"));
}

- (void)removeDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    devices = self->_devices;
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "deviceID"));
    uint64_t v8 = [(NSMutableDictionary *)devices objectForKeyedSubscript:v7];

    if (v8)
    {
      v9 = RemoteHIDLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        v17 = v5;
        __int16 v18 = 2048;
        unint64_t v19 = [(HIDRemoteEndpoint *)self endpointID];
        _os_log_impl(&dword_225713000, v9, OS_LOG_TYPE_DEFAULT, "Remove device:%@ for endpoint:%llu", (uint8_t *)&v16, 0x16u);
      }

      if ((unint64_t)[(NSMutableArray *)self->_prevDeviceLog count] >= 0x32) {
        [(NSMutableArray *)self->_prevDeviceLog removeObjectAtIndex:0];
      }
      prevDeviceLog = self->_prevDeviceLog;
      v11 = [v5 description];
      [(NSMutableArray *)prevDeviceLog addObject:v11];

      [v5 cancel];
    }
  }
  v13 = self->_devices;
  p_devices = (uint64_t *)&self->_devices;
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "deviceID"));
  [(NSMutableDictionary *)v13 setObject:0 forKeyedSubscript:v14];

  v15 = RemoteHIDLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[HIDRemoteEndpoint removeDevice:](p_devices, v15);
  }
}

- (void)removeDeviceID:(unint64_t)a3
{
  devices = self->_devices;
  id v6 = [NSNumber numberWithUnsignedLongLong:a3];
  v5 = [(NSMutableDictionary *)devices objectForKeyedSubscript:v6];
  [(HIDRemoteEndpoint *)self removeDevice:v5];
}

- (void)removeAllDevices
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = RemoteHIDLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v7 = [(HIDRemoteEndpoint *)self endpointID];
    _os_log_impl(&dword_225713000, v3, OS_LOG_TYPE_DEFAULT, "Removing all devices for endpoint:%llu", buf, 0xCu);
  }

  devices = self->_devices;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__HIDRemoteEndpoint_removeAllDevices__block_invoke;
  v5[3] = &unk_26474F608;
  v5[4] = self;
  [(NSMutableDictionary *)devices enumerateKeysAndObjectsUsingBlock:v5];
  [(NSMutableDictionary *)self->_devices removeAllObjects];
}

void __37__HIDRemoteEndpoint_removeAllDevices__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  id v7 = a3;
  if ((unint64_t)[v4 count] >= 0x32) {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectAtIndex:0];
  }
  v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = [v7 description];
  [v5 addObject:v6];

  [v7 cancel];
}

- (id)copyState
{
  v3 = objc_opt_new();
  id v4 = objc_opt_new();
  devices = self->_devices;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __30__HIDRemoteEndpoint_copyState__block_invoke;
  v9[3] = &unk_26474F608;
  id v10 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)devices enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HIDRemoteEndpoint endpointID](self, "endpointID"));
  [v3 setObject:v7 forKeyedSubscript:@"EndpointID"];

  [v3 setObject:v6 forKeyedSubscript:@"RemoteDevices"];
  [v3 setObject:self->_prevDeviceLog forKeyedSubscript:@"PreviousRemoteDevices"];

  return v3;
}

void __30__HIDRemoteEndpoint_copyState__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 description];
  [v3 addObject:v4];
}

- (unint64_t)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(unint64_t)a3
{
  self->_endpointID = a3;
}

- (unsigned)primarySide
{
  return self->_primarySide;
}

- (void)setPrimarySide:(unsigned __int8)a3
{
  self->_primarySide = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevDeviceLog, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

- (void)removeDevice:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_225713000, a2, OS_LOG_TYPE_DEBUG, "Remaining devices:%@", (uint8_t *)&v3, 0xCu);
}

@end