@interface RemoteNetworkQualityAssessment
- (RemoteNetworkQualityAssessment)initWithConfiguration:(id)a3;
- (void)getAvailableServersForDevice:(id)a3 withCompletionHandler:(id)a4;
- (void)rapportDiscoveryCompletionWithClient:(id)a3 deviceName:(id)a4;
- (void)rapportDiscoveryCompletionWithClient:(id)a3 deviceName:(id)a4 completionHandler:(id)a5;
- (void)rapportInvokeCompletionWithClient:(id)a3 deviceIdentifier:(id)a4;
- (void)rapportQueryCompletionWithClient:(id)a3 deviceIdentifier:(id)a4 completionHandler:(id)a5;
- (void)runAgainst:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation RemoteNetworkQualityAssessment

- (RemoteNetworkQualityAssessment)initWithConfiguration:(id)a3
{
  if (objc_opt_class())
  {
    v13.receiver = self;
    v13.super_class = (Class)RemoteNetworkQualityAssessment;
    v5 = [(RemoteNetworkQualityAssessment *)&v13 init];
    v6 = v5;
    if (v5)
    {
      if (a3)
      {
        v7 = objc_alloc_init(NetworkQualityConfiguration);
        config = v6->config;
        v6->config = v7;
      }
      else
      {
        config = v5->config;
        v5->config = 0;
      }

      dispatch_queue_t v10 = dispatch_queue_create("com.apple.networkquality.rapport", 0);
      dispatchQueue = v6->dispatchQueue;
      v6->dispatchQueue = (OS_dispatch_queue *)v10;
    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)rapportDiscoveryCompletionWithClient:(id)a3 deviceName:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v7 = [a3 activeDevices];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_super v13 = [v12 name];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          netqual_log_init();
          v19 = (void *)os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            v20 = v19;
            id v27 = [v12 identifier];
            uint64_t v21 = [v27 UTF8String];
            id v22 = [v12 name];
            uint64_t v23 = [v22 UTF8String];
            id v24 = [v12 model];
            uint64_t v25 = [v24 UTF8String];
            *(_DWORD *)buf = 136316162;
            v38 = "-[RemoteNetworkQualityAssessment rapportDiscoveryCompletionWithClient:deviceName:]";
            __int16 v39 = 1024;
            int v40 = 51;
            __int16 v41 = 2080;
            uint64_t v42 = v21;
            __int16 v43 = 2080;
            uint64_t v44 = v23;
            __int16 v45 = 2080;
            uint64_t v46 = v25;
            _os_log_impl(&dword_2192FE000, v20, OS_LOG_TYPE_DEFAULT, "%s:%u - Found ID=%s name=%s model=%s\n", buf, 0x30u);
          }
          id v26 = objc_alloc_init(MEMORY[0x263F62B78]);
          [v26 setDispatchQueue:self->dispatchQueue];
          [v26 setDestinationDevice:v12];
          [v26 setServiceType:@"com.apple.networkquality.invoke"];
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __82__RemoteNetworkQualityAssessment_rapportDiscoveryCompletionWithClient_deviceName___block_invoke;
          v28[3] = &unk_26439D498;
          v28[4] = self;
          id v29 = v26;
          v30 = v12;
          id v17 = v26;
          [v17 activateWithCompletion:v28];

          goto LABEL_15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v47 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  v7 = [NSString stringWithFormat:@"Failed to find the device %@", v6];
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    -[RemoteNetworkQualityAssessment rapportDiscoveryCompletionWithClient:deviceName:]();
  }
  completionHandler = (void (**)(id, void, void *))self->completionHandler;
  v16 = (void *)MEMORY[0x263F087E8];
  uint64_t v35 = *MEMORY[0x263F08320];
  v36 = v7;
  id v17 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  v18 = [v16 errorWithDomain:@"NetworkQualityErrorDomain" code:1009 userInfo:v17];
  completionHandler[2](completionHandler, 0, v18);

LABEL_15:
}

void __82__RemoteNetworkQualityAssessment_rapportDiscoveryCompletionWithClient_deviceName___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(void))(v2[3] + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) identifier];
    [v2 rapportInvokeCompletionWithClient:v4 deviceIdentifier:v5];
  }
}

- (void)rapportInvokeCompletionWithClient:(id)a3 deviceIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  config = self->config;
  id v13 = 0;
  uint64_t v9 = [MEMORY[0x263F08910] archivedDataWithRootObject:config requiringSecureCoding:1 error:&v13];
  id v10 = v13;
  if (v10)
  {
    (*((void (**)(void))self->completionHandler + 2))();
  }
  else
  {
    int v14 = @"config";
    v15[0] = v9;
    v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke;
    v12[3] = &unk_26439D4C0;
    v12[4] = self;
    [v6 sendRequestID:@"com.apple.networkquality.invoke" request:v11 destinationID:v7 options:0 responseHandler:v12];
  }
}

void __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  netqual_log_init();
  uint64_t v4 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v23 = "-[RemoteNetworkQualityAssessment rapportInvokeCompletionWithClient:deviceIdentifier:]_block_invoke";
    __int16 v24 = 1024;
    int v25 = 93;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl(&dword_2192FE000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - inResponse: %@", buf, 0x1Cu);
  }
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"results"];
    if (v5)
    {
      v17[0] = objc_opt_class();
      v17[1] = objc_opt_class();
      v17[2] = objc_opt_class();
      v17[3] = objc_opt_class();
      id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];
      id v7 = (void *)MEMORY[0x263F08928];
      uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:v6];
      id v16 = 0;
      uint64_t v9 = [v7 unarchivedObjectOfClasses:v8 fromData:v5 error:&v16];
      id v10 = v16;

      netqual_log_init();
      v11 = os_log_netqual;
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v23 = "-[RemoteNetworkQualityAssessment rapportInvokeCompletionWithClient:deviceIdentifier:]_block_invoke";
        __int16 v24 = 1024;
        int v25 = 118;
        __int16 v26 = 2112;
        id v27 = v9;
        _os_log_impl(&dword_2192FE000, v11, OS_LOG_TYPE_DEFAULT, "%s:%u - results: %@", buf, 0x1Cu);
      }
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();
    }
    else
    {
      netqual_log_init();
      if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
        __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke_cold_2();
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 24);
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08320];
      v19 = @"No response data available";
      id v10 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v6 = [v15 errorWithDomain:@"NetworkQualityErrorDomain" code:1010 userInfo:v10];
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v6);
    }
  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke_cold_1();
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 24);
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08320];
    uint64_t v21 = @"No response data available";
    id v5 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v10 = [v13 errorWithDomain:@"NetworkQualityErrorDomain" code:1010 userInfo:v5];
    (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v10);
  }
}

- (void)runAgainst:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x21D4880C0](a4);
  id completionHandler = self->completionHandler;
  self->id completionHandler = v7;

  id v9 = objc_alloc_init(MEMORY[0x263F62B78]);
  [v9 setDispatchQueue:self->dispatchQueue];
  [v9 setServiceType:@"com.apple.networkquality.query"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__RemoteNetworkQualityAssessment_runAgainst_withCompletionHandler___block_invoke;
  v12[3] = &unk_26439D498;
  v12[4] = self;
  id v13 = v9;
  id v14 = v6;
  id v10 = v6;
  id v11 = v9;
  [v11 activateWithCompletion:v12];
}

uint64_t __67__RemoteNetworkQualityAssessment_runAgainst_withCompletionHandler___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  if (a2) {
    return (*(uint64_t (**)(void))(v3[3] + 16))();
  }
  else {
    return [v3 rapportDiscoveryCompletionWithClient:a1[5] deviceName:a1[6]];
  }
}

- (void)rapportQueryCompletionWithClient:(id)a3 deviceIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __102__RemoteNetworkQualityAssessment_rapportQueryCompletionWithClient_deviceIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_26439D4E8;
  id v10 = v7;
  id v8 = v7;
  [a3 sendRequestID:@"com.apple.networkquality.query" request:MEMORY[0x263EFFA78] destinationID:a4 options:0 responseHandler:v9];
}

void __102__RemoteNetworkQualityAssessment_rapportQueryCompletionWithClient_deviceIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [a2 objectForKeyedSubscript:@"results"];
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v12[2] = objc_opt_class();
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
    id v5 = (void *)MEMORY[0x263F08928];
    id v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
    id v11 = 0;
    id v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v3 error:&v11];
    id v8 = v11;

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      __102__RemoteNetworkQualityAssessment_rapportQueryCompletionWithClient_deviceIdentifier_completionHandler___block_invoke_cold_1();
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"No response data available";
    id v3 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v4 = [v10 errorWithDomain:@"NetworkQualityErrorDomain" code:1010 userInfo:v3];
    (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v4);
  }
}

- (void)rapportDiscoveryCompletionWithClient:(id)a3 deviceName:(id)a4 completionHandler:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = [a3 activeDevices];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v16 = [v15 name];
        int v17 = [v16 isEqualToString:v8];

        if (v17)
        {
          netqual_log_init();
          uint64_t v21 = (void *)os_log_netqual;
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
          {
            id v22 = v21;
            id v31 = [v15 identifier];
            uint64_t v23 = [v31 UTF8String];
            id v24 = [v15 name];
            id v25 = v9;
            __int16 v26 = self;
            uint64_t v27 = [v24 UTF8String];
            id v28 = [v15 model];
            uint64_t v29 = [v28 UTF8String];
            *(_DWORD *)buf = 136316162;
            __int16 v43 = "-[RemoteNetworkQualityAssessment rapportDiscoveryCompletionWithClient:deviceName:completionHandler:]";
            __int16 v44 = 1024;
            int v45 = 198;
            __int16 v46 = 2080;
            uint64_t v47 = v23;
            __int16 v48 = 2080;
            uint64_t v49 = v27;
            self = v26;
            id v9 = v25;
            __int16 v50 = 2080;
            uint64_t v51 = v29;
            _os_log_impl(&dword_2192FE000, v22, OS_LOG_TYPE_DEFAULT, "%s:%u - Found ID=%s name=%s model=%s\n", buf, 0x30u);
          }
          id v30 = objc_alloc_init(MEMORY[0x263F62B78]);
          [v30 setDispatchQueue:self->dispatchQueue];
          [v30 setDestinationDevice:v15];
          [v30 setServiceType:@"com.apple.networkquality.query"];
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __100__RemoteNetworkQualityAssessment_rapportDiscoveryCompletionWithClient_deviceName_completionHandler___block_invoke;
          v32[3] = &unk_26439D510;
          v32[4] = self;
          id v33 = v30;
          long long v34 = v15;
          id v35 = v9;
          id v19 = v30;
          [v19 activateWithCompletion:v32];

          uint64_t v20 = v35;
          goto LABEL_15;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v52 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v10 = [NSString stringWithFormat:@"Failed to find the device %@", v8];
  netqual_log_init();
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
    -[RemoteNetworkQualityAssessment rapportDiscoveryCompletionWithClient:deviceName:completionHandler:]();
  }
  uint64_t v18 = (void *)MEMORY[0x263F087E8];
  uint64_t v40 = *MEMORY[0x263F08320];
  __int16 v41 = v10;
  id v19 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  uint64_t v20 = [v18 errorWithDomain:@"NetworkQualityErrorDomain" code:1009 userInfo:v19];
  (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v20);
LABEL_15:
}

void __100__RemoteNetworkQualityAssessment_rapportDiscoveryCompletionWithClient_deviceName_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) identifier];
    [v4 rapportQueryCompletionWithClient:v5 deviceIdentifier:v6 completionHandler:*(void *)(a1 + 56)];
  }
}

- (void)getAvailableServersForDevice:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F62B78]);
  [v8 setDispatchQueue:self->dispatchQueue];
  [v8 setServiceType:@"com.apple.networkquality.query"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __85__RemoteNetworkQualityAssessment_getAvailableServersForDevice_withCompletionHandler___block_invoke;
  void v12[3] = &unk_26439D510;
  v12[4] = self;
  id v13 = v8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v6;
  id v10 = v8;
  id v11 = v7;
  [v10 activateWithCompletion:v12];
}

uint64_t __85__RemoteNetworkQualityAssessment_getAvailableServersForDevice_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) rapportDiscoveryCompletionWithClient:*(void *)(a1 + 40) deviceName:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->completionHandler, 0);
  objc_storeStrong((id *)&self->dispatchQueue, 0);

  objc_storeStrong((id *)&self->config, 0);
}

- (void)rapportDiscoveryCompletionWithClient:deviceName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2192FE000, v0, OS_LOG_TYPE_ERROR, "%s:%u - %@", (uint8_t *)v1, 0x1Cu);
}

void __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_2192FE000, v0, v1, "%s:%u - No 'results' object returned", v2, v3, v4, v5, 2u);
}

void __85__RemoteNetworkQualityAssessment_rapportInvokeCompletionWithClient_deviceIdentifier___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_2192FE000, v0, v1, "%s:%u - No 'results' object found in response", v2, v3, v4, v5, 2u);
}

void __102__RemoteNetworkQualityAssessment_rapportQueryCompletionWithClient_deviceIdentifier_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_2192FE000, v0, v1, "%s:%u - No 'results' object returned", v2, v3, v4, v5, 2u);
}

- (void)rapportDiscoveryCompletionWithClient:deviceName:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2192FE000, v0, OS_LOG_TYPE_ERROR, "%s:%u - %@", (uint8_t *)v1, 0x1Cu);
}

@end