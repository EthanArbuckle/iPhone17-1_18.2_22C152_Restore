@interface SBAmbientChargerConnectionInfoProvider
- (BOOL)isChargerConnected;
- (NSString)currentConnectedChargerId;
- (SBAmbientChargerConnectionInfoProvider)initWithDelegate:(id)a3;
- (SBAmbientChargerConnectionInfoProviderDelegate)delegate;
- (void)_setCurrentConnectedChargerId:(id)a3;
- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointAttached:(id)a4 transportType:(int)a5 protocol:(int)a6 properties:(id)a7 forConnection:(id)a8;
- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointDetached:(id)a4 forConnection:(id)a5;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SBAmbientChargerConnectionInfoProvider

- (SBAmbientChargerConnectionInfoProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBAmbientChargerConnectionInfoProvider;
  v5 = [(SBAmbientChargerConnectionInfoProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[SBAccessoryConnectionInfoProvider sharedInstance];
    accessoryConnectionInfoProvider = v6->_accessoryConnectionInfoProvider;
    v6->_accessoryConnectionInfoProvider = (SBAccessoryConnectionInfoProvider *)v7;

    [(SBAccessoryConnectionInfoProvider *)v6->_accessoryConnectionInfoProvider addObserver:v6];
  }

  return v6;
}

- (void)dealloc
{
  [(SBAccessoryConnectionInfoProvider *)self->_accessoryConnectionInfoProvider removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientChargerConnectionInfoProvider;
  [(SBAmbientChargerConnectionInfoProvider *)&v3 dealloc];
}

- (BOOL)isChargerConnected
{
  return self->_connectedChargerConnectionUUID != 0;
}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointAttached:(id)a4 transportType:(int)a5 protocol:(int)a6 properties:(id)a7 forConnection:(id)a8
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  int v17 = [(SBAccessoryConnectionInfoProvider *)self->_accessoryConnectionInfoProvider accessoryConnectionType:v16];
  if (a5 == 12 && v17 == 4)
  {
    if (self->_connectedChargerConnectionUUID && (objc_msgSend(v16, "isEqualToString:") & 1) == 0)
    {
      v18 = SBLogAmbientChargerConnection();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SBAmbientChargerConnectionInfoProvider accessoryConnectionInfoProvider:accessoryEndpointAttached:transportType:protocol:properties:forConnection:]((uint64_t)v16, (uint64_t *)&self->_connectedChargerConnectionUUID, v18);
      }
    }
    if (![(NSString *)self->_connectedChargerConnectionUUID isEqualToString:v16])
    {
      v19 = SBLogAmbientChargerConnection();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v16;
        _os_log_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEFAULT, "Connected inductive charger with connection id %{public}@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_connectedChargerConnectionUUID, a8);
    }
    objc_initWeak((id *)buf, self);
    accessoryConnectionInfoProvider = self->_accessoryConnectionInfoProvider;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __148__SBAmbientChargerConnectionInfoProvider_accessoryConnectionInfoProvider_accessoryEndpointAttached_transportType_protocol_properties_forConnection___block_invoke;
    v21[3] = &unk_1E6AFD5B0;
    objc_copyWeak(&v22, (id *)buf);
    [(SBAccessoryConnectionInfoProvider *)accessoryConnectionInfoProvider accessoryInfoForEndpoint:v14 connection:v16 withReply:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __148__SBAmbientChargerConnectionInfoProvider_accessoryConnectionInfoProvider_accessoryEndpointAttached_transportType_protocol_properties_forConnection___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v5)
  {
    uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F5B180]];
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      uint64_t v10 = objc_opt_class();
      id v11 = v7;
      if (v10)
      {
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v13 = v12;

      if (v13)
      {
        id v14 = [WeakRetained currentConnectedChargerId];
        char v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          id v16 = SBLogAmbientChargerConnection();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138543362;
            id v19 = v13;
            _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "Connected inductive charger with accesory id %{public}@", (uint8_t *)&v18, 0xCu);
          }

          [WeakRetained _setCurrentConnectedChargerId:v13];
        }
LABEL_17:

        goto LABEL_18;
      }
    }
    int v17 = SBLogAmbientChargerConnection();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEFAULT, "Connected inductive charger does not have an accessory id!", (uint8_t *)&v18, 2u);
    }

    id v13 = 0;
    goto LABEL_17;
  }
LABEL_18:
}

- (void)accessoryConnectionInfoProvider:(id)a3 accessoryEndpointDetached:(id)a4 forConnection:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([v6 isEqualToString:self->_connectedChargerConnectionUUID])
  {
    uint64_t v7 = SBLogAmbientChargerConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Disconnected inductive charger with connection id %{public}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v8 = [(SBAmbientChargerConnectionInfoProvider *)self delegate];
    v9 = [(SBAmbientChargerConnectionInfoProvider *)self currentConnectedChargerId];
    [v8 chargerConnectionInfoProvider:self didDisconnectChargerWithId:v9];

    connectedChargerConnectionUUID = self->_connectedChargerConnectionUUID;
    self->_connectedChargerConnectionUUID = 0;

    currentConnectedChargerId = self->_currentConnectedChargerId;
    self->_currentConnectedChargerId = 0;
  }
}

- (void)_setCurrentConnectedChargerId:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  currentConnectedChargerId = self->_currentConnectedChargerId;
  if (!currentConnectedChargerId || ![(NSString *)currentConnectedChargerId isEqualToString:v5])
  {
    uint64_t v7 = SBLogAmbientChargerConnection();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "Setting current connected inductive charger id %{public}@", (uint8_t *)&v9, 0xCu);
    }

    objc_storeStrong((id *)&self->_currentConnectedChargerId, a3);
    uint64_t v8 = [(SBAmbientChargerConnectionInfoProvider *)self delegate];
    [v8 chargerConnectionInfoProvider:self didConnectChargerWithId:v5];
  }
}

- (SBAmbientChargerConnectionInfoProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAmbientChargerConnectionInfoProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)currentConnectedChargerId
{
  return self->_currentConnectedChargerId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConnectedChargerId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectedChargerConnectionUUID, 0);
  objc_storeStrong((id *)&self->_accessoryConnectionInfoProvider, 0);
}

- (void)accessoryConnectionInfoProvider:(os_log_t)log accessoryEndpointAttached:transportType:protocol:properties:forConnection:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Connected inductive charger with connection id %{public}@ while charger with connection id %{public}@ is already connected!", (uint8_t *)&v4, 0x16u);
}

@end