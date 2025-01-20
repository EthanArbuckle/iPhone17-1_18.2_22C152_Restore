@interface NPKBiometricPassPreflightManager
- (NPKBiometricPassPreflightManager)initWithDataSource:(id)a3;
- (NPKBiometricPassPreflightManagerDataSource)dataSource;
- (void)preflightStatusForType:(unint64_t)a3 pairedDeviceMinOSVersion:(id)a4 completion:(id)a5;
@end

@implementation NPKBiometricPassPreflightManager

- (NPKBiometricPassPreflightManager)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NPKBiometricPassPreflightManager;
  v5 = [(NPKBiometricPassPreflightManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (void)preflightStatusForType:(unint64_t)a3 pairedDeviceMinOSVersion:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      *(_DWORD *)buf = 138412290;
      v29 = v13;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Start credential Preflight Status ForType:%@ minOSVersion", buf, 0xCu);
    }
  }
  if (!v8) {
    goto LABEL_8;
  }
  v14 = [(NPKBiometricPassPreflightManager *)self dataSource];
  v15 = [v14 biometricPassPreflightManagerPairedDeviceOSVersion:self];

  if (PKVersionCheck())
  {

LABEL_8:
    if (a3 == 1 && (NPKPairedOrPairingDeviceSupportsCredentialType(129) & 1) != 0)
    {
      v16 = [(NPKBiometricPassPreflightManager *)self dataSource];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __95__NPKBiometricPassPreflightManager_preflightStatusForType_pairedDeviceMinOSVersion_completion___block_invoke;
      v25[3] = &unk_2644D8D00;
      uint64_t v27 = 1;
      id v26 = v9;
      [v16 biometricPassPreflightManager:self provisionedCredentialCountsForType:1 completion:v25];

      v15 = v26;
    }
    else
    {
      v17 = pk_Payment_log();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        v19 = pk_Payment_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
          *(_DWORD *)buf = 138412290;
          v29 = v20;
          _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Paired device doesn't support credential type:%@", buf, 0xCu);
        }
      }
      v15 = NPKIDVRemoteDeviceSessionError(-1000, 0);
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v15);
    }
    goto LABEL_21;
  }
  v21 = pk_Payment_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

  if (v22)
  {
    v23 = pk_Payment_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v15;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Paired device with OSVersion:%@ doesn't fulfill minOSVersion:%@", buf, 0x16u);
    }
  }
  v24 = NPKIDVRemoteDeviceSessionError(-1000, 0);
  (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v24);

LABEL_21:
}

void __95__NPKBiometricPassPreflightManager_preflightStatusForType_pairedDeviceMinOSVersion_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[NPKSharedWebServiceProvider sharedWebServiceProvider];
  [v4 loadWebService];
  v5 = [v4 targetDevice];
  v6 = [v4 webService];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__NPKBiometricPassPreflightManager_preflightStatusForType_pairedDeviceMinOSVersion_completion___block_invoke_2;
  v8[3] = &unk_2644D8CD8;
  v7 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v7;
  [v5 paymentWebService:v6 validateAddBiometricPassPreconditionsWithCompletion:v8];
}

void __95__NPKBiometricPassPreflightManager_preflightStatusForType_pairedDeviceMinOSVersion_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = pk_Payment_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = pk_Payment_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSStringFromNPKIDVRemoteDeviceCredentialType(a1[5]);
      v11[0] = 67109634;
      v11[1] = a2;
      __int16 v12 = 2112;
      v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish credential Preflight Status:%d ForType:%@ error:%@", (uint8_t *)v11, 0x1Cu);
    }
  }
  uint64_t v10 = [[NPKIDVRemoteDeviceCredentialPreflightStatus alloc] initWithCredentialType:a1[5] provisionedPassesCount:a1[6] preflightSuccessful:a2];
  (*(void (**)(void))(a1[4] + 16))();
}

- (NPKBiometricPassPreflightManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPKBiometricPassPreflightManagerDataSource *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end