@interface SACaseConnectionInfoProvider
- (BOOL)caseConnected;
- (SACaseConnectionInfoProvider)init;
- (unsigned)currentConnectedCaseId;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)dealloc;
- (void)setConnectedCaseId:(unsigned __int8)a3;
- (void)setCurrentConnectedCaseId:(unsigned __int8)a3;
@end

@implementation SACaseConnectionInfoProvider

- (SACaseConnectionInfoProvider)init
{
  v8.receiver = self;
  v8.super_class = (Class)SACaseConnectionInfoProvider;
  v2 = [(SACaseConnectionInfoProvider *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F340C0] sharedInstance];
    connectionInfoProvider = v2->_connectionInfoProvider;
    v2->_connectionInfoProvider = (ACCConnectionInfo *)v3;

    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(ACCConnectionInfo *)v2->_connectionInfoProvider registerDelegate:v2 withIdentifier:v6];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(ACCConnectionInfo *)self->_connectionInfoProvider registerDelegate:0 withIdentifier:v4];

  v5.receiver = self;
  v5.super_class = (Class)SACaseConnectionInfoProvider;
  [(SACaseConnectionInfoProvider *)&v5 dealloc];
}

- (BOOL)caseConnected
{
  return self->_connectedCaseConnectionUUID != 0;
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a6;
  id v10 = a7;
  uint64_t v11 = *MEMORY[0x263F341E8];
  v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F341E8]];
  v13 = [MEMORY[0x263EFF9D0] null];
  if (v12 == v13)
  {
    uint64_t v15 = 0;
  }
  else
  {
    v14 = [v9 objectForKeyedSubscript:v11];
    uint64_t v15 = [v14 unsignedCharValue];
  }
  v16 = SALoggingGeneral();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_4_2(v24, v15);
    _os_log_impl(&dword_25BF2A000, v16, OS_LOG_TYPE_DEFAULT, "[SACaseConnectionInfoProvider] Connected case with NFC type %{public}d", (uint8_t *)v24, 8u);
  }

  if ((v15 - 144) > 5 || (OUTLINED_FUNCTION_0_0(), v17))
  {
    v18 = SALoggingGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_0(v24);
      v19 = "[SACaseConnectionInfoProvider] Connected case with a mismatched NFC type";
      goto LABEL_12;
    }
  }
  else
  {
    v18 = SALoggingGeneral();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_0(v24);
      v19 = "[SACaseConnectionInfoProvider] Connected case with a matching NFC type";
LABEL_12:
      _os_log_impl(&dword_25BF2A000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)v24, 2u);
    }
  }

  if ((v15 - 144) <= 5)
  {
    OUTLINED_FUNCTION_0_0();
    if (!v17)
    {
      p_connectedCaseConnectionUUID = (uint64_t *)&self->_connectedCaseConnectionUUID;
      if (self->_connectedCaseConnectionUUID && (objc_msgSend(v10, "isEqualToString:") & 1) == 0)
      {
        v21 = SALoggingGeneral();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_66_8_66((uint64_t)v24, (uint64_t)v10, *p_connectedCaseConnectionUUID);
          _os_log_impl(&dword_25BF2A000, v21, OS_LOG_TYPE_DEFAULT, "[SACaseConnectionInfoProvider] Connected case with connection id %{public}@ while case with connection id %{public}@ is already connected!", (uint8_t *)v24, 0x16u);
        }
      }
      if (([(id)*p_connectedCaseConnectionUUID isEqualToString:v10] & 1) == 0)
      {
        v22 = SALoggingGeneral();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_1_8_66((uint64_t)v24, (uint64_t)v10);
          _os_log_impl(&dword_25BF2A000, v22, OS_LOG_TYPE_DEFAULT, "[SACaseConnectionInfoProvider] Connected case with connection id %{public}@", (uint8_t *)v24, 0xCu);
        }

        objc_storeStrong((id *)&self->_connectedCaseConnectionUUID, a7);
      }
      if (self->_currentConnectedCaseId != v15)
      {
        v23 = SALoggingGeneral();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_1_4_2(v24, v15);
          _os_log_impl(&dword_25BF2A000, v23, OS_LOG_TYPE_DEFAULT, "[SACaseConnectionInfoProvider] Connected case with NFC type %{public}d", (uint8_t *)v24, 8u);
        }

        [(SACaseConnectionInfoProvider *)self setConnectedCaseId:v15];
      }
    }
  }
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([v5 isEqualToString:self->_connectedCaseConnectionUUID])
  {
    v6 = SALoggingGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v8, (uint64_t)v5);
      _os_log_impl(&dword_25BF2A000, v6, OS_LOG_TYPE_DEFAULT, "[SACaseConnectionInfoProvider] Disconnected case with connection id %{public}@", v8, 0xCu);
    }

    connectedCaseConnectionUUID = self->_connectedCaseConnectionUUID;
    self->_connectedCaseConnectionUUID = 0;

    [(SACaseConnectionInfoProvider *)self setConnectedCaseId:0];
  }
}

- (void)setConnectedCaseId:(unsigned __int8)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_currentConnectedCaseId) {
    BOOL v3 = self->_currentConnectedCaseId == a3;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    int v4 = a3;
    v6 = SALoggingGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_2(v7, v4);
      _os_log_impl(&dword_25BF2A000, v6, OS_LOG_TYPE_DEFAULT, "[SACaseConnectionInfoProvider] Setting current connected case id %{public}d", v7, 8u);
    }

    self->_currentConnectedCaseId = v4;
  }
}

- (unsigned)currentConnectedCaseId
{
  return self->_currentConnectedCaseId;
}

- (void)setCurrentConnectedCaseId:(unsigned __int8)a3
{
  self->_currentConnectedCaseId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedCaseConnectionUUID, 0);
  objc_storeStrong((id *)&self->_connectionInfoProvider, 0);
}

@end