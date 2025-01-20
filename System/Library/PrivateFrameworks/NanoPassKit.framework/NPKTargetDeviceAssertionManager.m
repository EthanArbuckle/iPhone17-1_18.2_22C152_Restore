@interface NPKTargetDeviceAssertionManager
- (IDSService)transportationService;
- (NPKTargetDeviceAssertionManager)initWithTransportationService:(id)a3;
- (NSMutableDictionary)assertTypesUUIDsMap;
- (NSMutableDictionary)outstandingAssertionStatusUpdaters;
- (id)_IDSSendOptions;
- (id)_outstandingAssertionStatusUpdaterWithRequest:(id)a3 assertionType:(unint64_t)a4 assertionUUID:(id)a5;
- (id)_removeOutstandingAssertionStatusUpdaterWithUUID:(id)a3;
- (id)_sendAssertionRequest:(id)a3;
- (id)acquireAssertionOfType:(unint64_t)a3;
- (id)assertionsUUIDsOfType:(unint64_t)a3;
- (void)_addOutstandingAssertionStatusUpdater:(id)a3 withAssertType:(int)a4;
- (void)invalidateAssertionWithUUID:(id)a3;
- (void)setAssertTypesUUIDsMap:(id)a3;
- (void)setOutstandingAssertionStatusUpdaters:(id)a3;
@end

@implementation NPKTargetDeviceAssertionManager

- (NPKTargetDeviceAssertionManager)initWithTransportationService:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPKTargetDeviceAssertionManager;
  v6 = [(NPKTargetDeviceAssertionManager *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transportationService, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.NanoPassKit.TargetDevice.AssertionManager", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    outstandingAssertionStatusUpdaters = v7->_outstandingAssertionStatusUpdaters;
    v7->_outstandingAssertionStatusUpdaters = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    assertTypesUUIDsMap = v7->_assertTypesUUIDsMap;
    v7->_assertTypesUUIDsMap = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (id)acquireAssertionOfType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263F08C38] UUID];
  v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    dispatch_queue_t v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v18 = a3;
      __int16 v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Remote Assertion - Request acquire assertion of type:%lu with UUID:%@", buf, 0x16u);
    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__NPKTargetDeviceAssertionManager_acquireAssertionOfType___block_invoke;
  block[3] = &unk_2644D3288;
  unint64_t v16 = a3;
  id v10 = v5;
  id v14 = v10;
  objc_super v15 = self;
  dispatch_async(internalQueue, block);
  id v11 = v10;

  return v11;
}

void __58__NPKTargetDeviceAssertionManager_acquireAssertionOfType___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = protobufAssertionTypeWithPKAssertionType(*(void *)(a1 + 48));
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = objc_alloc_init(NPKProtoAssertionRequest);
    [(NPKProtoAssertionRequest *)v4 setAssertionType:v3];
    id v5 = [*(id *)(a1 + 32) UUIDString];
    [(NPKProtoAssertionRequest *)v4 setRequestUUIDString:v5];

    [(NPKProtoAssertionRequest *)v4 setPending:1];
    v6 = [*(id *)(a1 + 40) _sendAssertionRequest:v4];
    if (v6)
    {
      BOOL v7 = [*(id *)(a1 + 40) _outstandingAssertionStatusUpdaterWithRequest:v4 assertionType:*(void *)(a1 + 48) assertionUUID:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) _addOutstandingAssertionStatusUpdater:v7 withAssertType:v3];
    }
    else
    {
      id v10 = pk_Payment_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

      if (v11)
      {
        uint64_t v12 = pk_Payment_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          if (v3 == 1)
          {
            v13 = @"Provisioning";
          }
          else if (v3 == 2)
          {
            v13 = @"ProvisioningRequiringUpgradedPasscode";
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 138412290;
          objc_super v15 = v13;
          _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: Remote Assertion - Failed to send Assertion request type:%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    dispatch_queue_t v8 = pk_Payment_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (!v9) {
      return;
    }
    pk_Payment_log();
    v4 = (NPKProtoAssertionRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super.super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v15 = @"Unknown";
      _os_log_impl(&dword_21E92F000, &v4->super.super.super, OS_LOG_TYPE_ERROR, "Error: Remote Assertion - Unknown assertion request type:%@", buf, 0xCu);
    }
  }
}

- (void)invalidateAssertionWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Remote Assertion - Request to invalidate assertion with UUID:%@", buf, 0xCu);
    }
  }
  internalQueue = self->_internalQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__NPKTargetDeviceAssertionManager_invalidateAssertionWithUUID___block_invoke;
  v10[3] = &unk_2644D2E08;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(internalQueue, v10);
}

void __63__NPKTargetDeviceAssertionManager_invalidateAssertionWithUUID___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _removeOutstandingAssertionStatusUpdaterWithUUID:*(void *)(a1 + 40)];
  if (v6)
  {
    uint64_t v2 = objc_alloc_init(NPKProtoAssertionRequest);
    -[NPKProtoAssertionRequest setAssertionType:](v2, "setAssertionType:", [v6 assertType]);
    uint64_t v3 = [v6 assertionUUID];
    id v4 = [v3 UUIDString];
    [(NPKProtoAssertionRequest *)v2 setRequestUUIDString:v4];

    [(NPKProtoAssertionRequest *)v2 setPending:0];
    id v5 = (id)[*(id *)(a1 + 32) _sendAssertionRequest:v2];
  }
}

- (id)assertionsUUIDsOfType:(unint64_t)a3
{
  uint64_t v4 = protobufAssertionTypeWithPKAssertionType(a3);
  if (v4 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = off_2644D4E88[(int)v4];
  }
  id v6 = [(NPKTargetDeviceAssertionManager *)self assertTypesUUIDsMap];
  BOOL v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    uint64_t v8 = [v7 copy];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263EFF8C0] array];
  }
  id v9 = (void *)v8;

  return v9;
}

- (id)_sendAssertionRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    BOOL v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 assertionType];
      if (v8 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v9 = off_2644D4E88[(int)v8];
      }
      id v10 = [v4 requestUUIDString];
      *(_DWORD *)buf = 138412546;
      v22 = v9;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Remote Assertion - Sending assertion request of type:%@ UUID:%@", buf, 0x16u);
    }
  }
  id v11 = objc_alloc(MEMORY[0x263F4A228]);
  uint64_t v12 = [v4 data];
  id v13 = (void *)[v11 initWithProtobufData:v12 type:59 isResponse:0];

  uint64_t v14 = [(NPKTargetDeviceAssertionManager *)self transportationService];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __57__NPKTargetDeviceAssertionManager__sendAssertionRequest___block_invoke;
  v19[3] = &unk_2644D29D0;
  id v20 = v4;
  id v15 = v4;
  uint64_t v16 = [(NPKTargetDeviceAssertionManager *)self _IDSSendOptions];
  v17 = NPKProtoSendWithOptions(v14, v13, 200, 0, 0, v19, v16);

  return v17;
}

void __57__NPKTargetDeviceAssertionManager__sendAssertionRequest___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) assertionType];
      if (v5 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
        BOOL v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v6 = off_2644D4E88[(int)v5];
      }
      BOOL v7 = [*(id *)(a1 + 32) requestUUIDString];
      *(_DWORD *)buf = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v7;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Remote Assertion - Failed to sendAssertionrequest of type:%@ UUID:%@", buf, 0x16u);
    }
  }
}

- (id)_IDSSendOptions
{
  v7[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F49F08];
  v6[0] = *MEMORY[0x263F49ED8];
  v6[1] = v2;
  v7[0] = MEMORY[0x263EFFA88];
  v7[1] = MEMORY[0x263EFFA88];
  uint64_t v3 = *MEMORY[0x263F49F80];
  v6[2] = *MEMORY[0x263F49F60];
  v6[3] = v3;
  v7[2] = @"AssertRequest";
  v7[3] = &unk_26D0439D0;
  id v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  return v4;
}

- (id)_outstandingAssertionStatusUpdaterWithRequest:(id)a3 assertionType:(unint64_t)a4 assertionUUID:(id)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F4A228];
  id v9 = a5;
  id v10 = a3;
  id v11 = [v8 alloc];
  uint64_t v12 = [v10 data];

  id v13 = (void *)[v11 initWithProtobufData:v12 type:59 isResponse:0];
  uint64_t v14 = [(NPKTargetDeviceAssertionManager *)self _IDSSendOptions];
  if (a4 == 6) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = 12;
  }
  uint64_t v16 = [NPKOutstandingAssertionStatusUpdater alloc];
  v17 = [(NPKTargetDeviceAssertionManager *)self transportationService];
  unint64_t v18 = [(NPKIDSHeartbeat *)v16 initWithPendingStatusProtobuf:v13 service:v17 priority:200 maxUpdates:v15 responseIdentifier:0 sendOptions:v14 queue:30.0 updateInterval:self->_internalQueue];

  [(NPKOutstandingAssertionStatusUpdater *)v18 setAssertType:protobufAssertionTypeWithPKAssertionType(a4)];
  [(NPKOutstandingAssertionStatusUpdater *)v18 setAssertionUUID:v9];

  return v18;
}

- (void)_addOutstandingAssertionStatusUpdater:(id)a3 withAssertType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  BOOL v6 = [(NPKTargetDeviceAssertionManager *)self outstandingAssertionStatusUpdaters];
  BOOL v7 = [v13 assertionUUID];
  [v6 setObject:v13 forKeyedSubscript:v7];

  if (v4 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = off_2644D4E88[(int)v4];
  }
  id v9 = [(NPKTargetDeviceAssertionManager *)self assertTypesUUIDsMap];
  id v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10)
  {
    id v10 = [MEMORY[0x263EFF980] array];
    id v11 = [(NPKTargetDeviceAssertionManager *)self assertTypesUUIDsMap];
    [v11 setObject:v10 forKeyedSubscript:v8];
  }
  uint64_t v12 = [v13 assertionUUID];
  [v10 addObject:v12];
}

- (id)_removeOutstandingAssertionStatusUpdaterWithUUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  uint64_t v5 = [(NPKTargetDeviceAssertionManager *)self outstandingAssertionStatusUpdaters];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    [v6 invalidate];
    BOOL v7 = [(NPKTargetDeviceAssertionManager *)self outstandingAssertionStatusUpdaters];
    [v7 removeObjectForKey:v4];

    uint64_t v8 = [v6 assertType];
    if (v8 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = off_2644D4E88[(int)v8];
    }
    id v10 = [(NPKTargetDeviceAssertionManager *)self assertTypesUUIDsMap];
    id v11 = [v10 objectForKeyedSubscript:v9];
    [v11 removeObject:v4];
  }
  return v6;
}

- (IDSService)transportationService
{
  return self->_transportationService;
}

- (NSMutableDictionary)outstandingAssertionStatusUpdaters
{
  return self->_outstandingAssertionStatusUpdaters;
}

- (void)setOutstandingAssertionStatusUpdaters:(id)a3
{
}

- (NSMutableDictionary)assertTypesUUIDsMap
{
  return self->_assertTypesUUIDsMap;
}

- (void)setAssertTypesUUIDsMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertTypesUUIDsMap, 0);
  objc_storeStrong((id *)&self->_outstandingAssertionStatusUpdaters, 0);
  objc_storeStrong((id *)&self->_transportationService, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end