@interface SASBluetoothEndpointUtility
- (BOOL)isConnectedToBluetoothVehicle;
- (NSString)_endpointType;
- (SASBluetoothEndpointUtility)init;
- (void)_registerListenersAndSetEndpointTypeWithNotification:(id)a3;
- (void)_setEndpointType:(id)a3;
- (void)_setEndpointTypeWithNotification:(id)a3;
- (void)dealloc;
- (void)isConnectedToBluetoothVehicle;
@end

@implementation SASBluetoothEndpointUtility

void __64__SASBluetoothEndpointUtility__setEndpointTypeWithNotification___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
    v3 = [v2 pickableRoutesForCategory:*MEMORY[0x1E4F4E6C0] andMode:@"SpeechRecognition"];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
    v6 = (os_log_t *)MEMORY[0x1E4F4E360];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v21;
      v9 = (void *)MEMORY[0x1E4F74DE0];
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        v12 = objc_msgSend(v11, "objectForKeyedSubscript:", *v9, (void)v20);
        char v13 = [v12 BOOLValue];

        if (v13) {
          break;
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F74CF8]];

      if (v14) {
        goto LABEL_14;
      }
    }
    else
    {
LABEL_10:
    }
    id v14 = (id)*MEMORY[0x1E4F74D20];
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      __64__SASBluetoothEndpointUtility__setEndpointTypeWithNotification___block_invoke_cold_1();
    }
LABEL_14:
    v15 = objc_msgSend(WeakRetained, "_endpointType", (void)v20);
    char v16 = [v15 isEqualToString:v14];

    if ((v16 & 1) == 0)
    {
      os_log_t v17 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = [WeakRetained _endpointType];
        *(_DWORD *)buf = 136315650;
        v25 = "-[SASBluetoothEndpointUtility _setEndpointTypeWithNotification:]_block_invoke";
        __int16 v26 = 2112;
        v27 = v19;
        __int16 v28 = 2112;
        id v29 = v14;
        _os_log_impl(&dword_1D9588000, v18, OS_LOG_TYPE_DEFAULT, "%s Endpoint type changed, from %@ to %@.", buf, 0x20u);
      }
      [WeakRetained _setEndpointType:v14];
    }
  }
}

void __64__SASBluetoothEndpointUtility__setEndpointTypeWithNotification___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D9588000, v0, OS_LOG_TYPE_ERROR, "%s Endpoint type is not found from AVSystemController, setting it to %@.", (uint8_t *)v1, 0x16u);
}

- (NSString)_endpointType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)_setEndpointTypeWithNotification:(id)a3
{
  objc_initWeak(&location, self);
  serialBluetoothEndpointQueue = self->_serialBluetoothEndpointQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SASBluetoothEndpointUtility__setEndpointTypeWithNotification___block_invoke;
  v5[3] = &unk_1E6B675D8;
  objc_copyWeak(&v6, &location);
  dispatch_async(serialBluetoothEndpointQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (SASBluetoothEndpointUtility)init
{
  v6.receiver = self;
  v6.super_class = (Class)SASBluetoothEndpointUtility;
  uint64_t v2 = [(SASBluetoothEndpointUtility *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.siri.SerialBluetoothEndpointQueue", 0);
    serialBluetoothEndpointQueue = v2->_serialBluetoothEndpointQueue;
    v2->_serialBluetoothEndpointQueue = (OS_dispatch_queue *)v3;

    [(SASBluetoothEndpointUtility *)v2 _registerListenersAndSetEndpointTypeWithNotification:0];
  }
  return v2;
}

- (BOOL)isConnectedToBluetoothVehicle
{
  endpointType = self->_endpointType;
  if (endpointType)
  {
    uint64_t v3 = *MEMORY[0x1E4F74D38];
    return [(NSString *)endpointType isEqualToString:v3];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
      -[SASBluetoothEndpointUtility isConnectedToBluetoothVehicle](v5);
    }
    return 0;
  }
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  endpointType = self->_endpointType;
  self->_endpointType = 0;

  v5.receiver = self;
  v5.super_class = (Class)SASBluetoothEndpointUtility;
  [(SASBluetoothEndpointUtility *)&v5 dealloc];
}

- (void)_registerListenersAndSetEndpointTypeWithNotification:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 removeObserver:self];

  objc_super v5 = [MEMORY[0x1E4F74F60] sharedAVSystemController];
  objc_super v6 = (void *)MEMORY[0x1E4F74A80];
  uint64_t v7 = (void *)MEMORY[0x1E4F74C60];
  uint64_t v8 = *MEMORY[0x1E4F74C60];
  v21[0] = *MEMORY[0x1E4F74A80];
  v21[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  uint64_t v10 = *MEMORY[0x1E4F74EB0];
  id v18 = 0;
  char v11 = [v5 setAttribute:v9 forKey:v10 error:&v18];
  id v12 = v18;
  char v13 = (os_log_t *)MEMORY[0x1E4F4E360];
  if ((v11 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
    -[SASBluetoothEndpointUtility _registerListenersAndSetEndpointTypeWithNotification:]();
  }
  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v14 addObserver:self selector:sel__registerListenersAndSetEndpointTypeWithNotification_ name:*MEMORY[0x1E4F74E28] object:v5];

  v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 addObserver:self selector:sel__setEndpointTypeWithNotification_ name:*v6 object:v5];

  char v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:self selector:sel__setEndpointTypeWithNotification_ name:*v7 object:v5];

  [(SASBluetoothEndpointUtility *)self _setEndpointTypeWithNotification:0];
  os_log_t v17 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v20 = "-[SASBluetoothEndpointUtility _registerListenersAndSetEndpointTypeWithNotification:]";
    _os_log_impl(&dword_1D9588000, v17, OS_LOG_TYPE_INFO, "%s Registered AVSystemController listeners", buf, 0xCu);
  }
}

- (void)_setEndpointType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointType, 0);
  objc_storeStrong((id *)&self->_serialBluetoothEndpointQueue, 0);
}

- (void)isConnectedToBluetoothVehicle
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[SASBluetoothEndpointUtility isConnectedToBluetoothVehicle]";
  _os_log_error_impl(&dword_1D9588000, log, OS_LOG_TYPE_ERROR, "%s This should hopefully not happen, endpointType not initialized before called, returning as not Bluetooth.", (uint8_t *)&v1, 0xCu);
}

- (void)_registerListenersAndSetEndpointTypeWithNotification:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D9588000, v0, OS_LOG_TYPE_ERROR, "%s Failed to subscribe to AVSystemController notifications due to error: %@", (uint8_t *)v1, 0x16u);
}

@end