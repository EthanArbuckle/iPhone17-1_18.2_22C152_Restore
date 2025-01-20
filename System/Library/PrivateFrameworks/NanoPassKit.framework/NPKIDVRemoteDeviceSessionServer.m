@interface NPKIDVRemoteDeviceSessionServer
- (NPKIDVRemoteDeviceSessionServer)initWithConnection:(id)a3 eventsCoordinator:(id)a4 connectionCoordinator:(id)a5 preflightManager:(id)a6;
- (NPKIDVRemoteDeviceSessionServerDataSource)dataSource;
- (id)_checkCredentialProvisioningEntitlement;
- (id)_checkCredentialStoreBiometricsEntitlement;
- (id)_checkCredentialStoreEntitlementWithPartition:(id)a3;
- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6;
- (void)configureWithPartition:(id)a3 ackHandler:(id)a4;
- (void)confirmRemoteDeviceID:(id)a3 withCompletion:(id)a4;
- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5;
- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4;
- (void)credentialPreflightStatusForType:(unint64_t)a3 minOSVersion:(id)a4 completion:(id)a5;
- (void)deleteCredential:(id)a3 completion:(id)a4;
- (void)deleteGlobalAuthACLWithCompletion:(id)a3;
- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4;
- (void)fetchRemoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a3 completion:(id)a4;
- (void)generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 completion:(id)a5;
- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5;
- (void)getCASDCertificateWithCompletion:(id)a3;
- (void)nonceForAuthorizationTokenWithCompletion:(id)a3;
- (void)pairedWatchSEIDWithCompletion:(id)a3;
- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4;
- (void)propertiesOfCredential:(id)a3 completion:(id)a4;
- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8;
- (void)provisionedCredentialCountForType:(unint64_t)a3 completion:(id)a4;
- (void)registerForEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5;
- (void)setDataSource:(id)a3;
- (void)unregisterFromEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5;
- (void)updateProofingConfiguration:(id)a3 completion:(id)a4;
@end

@implementation NPKIDVRemoteDeviceSessionServer

- (NPKIDVRemoteDeviceSessionServer)initWithConnection:(id)a3 eventsCoordinator:(id)a4 connectionCoordinator:(id)a5 preflightManager:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NPKIDVRemoteDeviceSessionServer;
  v14 = [(PDXPCService *)&v17 initWithConnection:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventsCoordinator, a4);
    objc_storeStrong((id *)&v15->_connectionCoordinator, a5);
    objc_storeStrong((id *)&v15->_preflightManager, a6);
  }

  return v15;
}

- (void)confirmRemoteDeviceID:(id)a3 withCompletion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  v8 = [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator remoteDeviceID];
  v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    id v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested confirm deviceID:%@ actual deviceID:%@", (uint8_t *)&v19, 0x16u);
    }
  }
  if (!v8)
  {
    id v13 = pk_Payment_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      v15 = pk_Payment_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        id v20 = v6;
        _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to confirm given deviceID:%@, no active device is initialized", (uint8_t *)&v19, 0xCu);
      }
    }
    id v12 = NPKIDVRemoteDeviceSessionError(-1003, 0);
    goto LABEL_19;
  }
  if (v6 && ([v6 isEqualToString:v8] & 1) == 0)
  {
    v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412290;
        id v20 = v6;
        _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to confirm given deviceID:%@", (uint8_t *)&v19, 0xCu);
      }
    }
    id v12 = NPKIDVRemoteDeviceSessionError(-1002, 0);

LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  id v12 = 0;
LABEL_20:
  v7[2](v7, v8, v12);
}

- (void)credentialPreflightStatusForType:(unint64_t)a3 minOSVersion:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  v9 = (void (**)(id, void, void *))a5;
  BOOL v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    id v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      id v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested credential Preflight Status ForType:%@ minOSVersion:%@", buf, 0x16u);
    }
  }
  BOOL v14 = [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator remoteDeviceID];
  if (!v14)
  {
    BOOL v17 = pk_Payment_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      int v19 = pk_Payment_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Fail fetch credential Preflight Status, no active device is initialized", buf, 2u);
      }
    }
    uint64_t v20 = -1003;
    goto LABEL_18;
  }
  if (a3 != 1)
  {
    __int16 v21 = pk_Payment_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      uint64_t v23 = pk_Payment_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[NPKIDVRemoteDeviceSessionServer credentialPreflightStatusForType:minOSVersion:completion:]";
        _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: If you think the given credential type is correct you probably need to makes some code changes at %s", buf, 0xCu);
      }
    }
    uint64_t v20 = -1050;
LABEL_18:
    v16 = NPKIDVRemoteDeviceSessionError(v20, 0);
    v9[2](v9, 0, v16);
    goto LABEL_19;
  }
  preflightManager = self->_preflightManager;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __92__NPKIDVRemoteDeviceSessionServer_credentialPreflightStatusForType_minOSVersion_completion___block_invoke;
  v24[3] = &unk_2644D2A50;
  uint64_t v26 = 1;
  v25 = v9;
  [(NPKBiometricPassPreflightManager *)preflightManager preflightStatusForType:1 pairedDeviceMinOSVersion:v8 completion:v24];
  v16 = v25;
LABEL_19:
}

void __92__NPKIDVRemoteDeviceSessionServer_credentialPreflightStatusForType_minOSVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 40));
      int v11 = 138412802;
      id v12 = v5;
      __int16 v13 = 2112;
      BOOL v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish credential Preflight Status:%@ ForType:%@ error:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provisionedCredentialCountForType:(unint64_t)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void, void *))a4;
  v7 = [(NPKIDVRemoteDeviceSessionServer *)self dataSource];

  if (v7)
  {
    BOOL v8 = [(NPKIDVRemoteDeviceSessionServer *)self dataSource];
    [v8 remoteDevicesSessionServer:self provisionedCredentialCountsForType:a3 completion:v6];
  }
  else
  {
    v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      int v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v15 = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unable to fetch provisioned credential count! No data source found.", v15, 2u);
      }
    }
    if (v6)
    {
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08320];
      v17[0] = @"No data source found";
      __int16 v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      BOOL v14 = [v12 errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:v13];

      v6[2](v6, 0, v14);
    }
  }
}

- (void)fetchRemoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void, void *))a4;
  v7 = [(NPKIDVRemoteDeviceSessionServer *)self dataSource];

  if (v7)
  {
    BOOL v8 = [(NPKIDVRemoteDeviceSessionServer *)self dataSource];
    [v8 remoteDevicesSessionServer:self remoteBiometricAuthenticationStatusForCredentialType:a3 completion:v6];
  }
  else
  {
    v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      int v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v15 = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unable to fetch remote biometric authentication status! No data source found.", v15, 2u);
      }
    }
    if (v6)
    {
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08320];
      v17[0] = @"No data source found";
      __int16 v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      BOOL v14 = [v12 errorWithDomain:@"com.apple.NPKErrorDomain" code:-1000 userInfo:v13];

      v6[2](v6, 0, v14);
    }
  }
}

- (void)registerForEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5
{
  BOOL v10 = (void (**)(id, unint64_t, void *))a5;
  unint64_t v8 = [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator registerEvents:a3 forServiceName:a4];
  if (v8 == 0xFFFFFFFF80000000)
  {
    v9 = NPKIDVRemoteDeviceSessionError(-1003, 0);
  }
  else
  {
    v9 = 0;
  }
  v10[2](v10, v8, v9);
}

- (void)unregisterFromEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5
{
  BOOL v10 = (void (**)(id, unint64_t, void *))a5;
  unint64_t v8 = [(NPKIDVRemoteDeviceServiceEventsCoordinator *)self->_eventsCoordinator unregisterEvents:a3 forServiceName:a4];
  if (v8 == 0xFFFFFFFF80000000)
  {
    v9 = NPKIDVRemoteDeviceSessionError(-1003, 0);
  }
  else
  {
    v9 = 0;
  }
  v10[2](v10, v8, v9);
}

- (void)getCASDCertificateWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested CASD certificate", v9, 2u);
    }
  }
  unint64_t v8 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreBiometricsEntitlement];
  if (v8) {
    v4[2](v4, 0, v8);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator getCASDCertificateWithCompletion:v4];
  }
}

- (void)pairedWatchSEIDWithCompletion:(id)a3
{
  v9 = (void (**)(id, void, void *))a3;
  v4 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreBiometricsEntitlement];
  if (v4)
  {
    v9[2](v9, 0, v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F57730] sharedInstance];
    BOOL v6 = [v5 getActivePairedDevice];

    v7 = [v6 valueForProperty:*MEMORY[0x263F57630]];
    if (v7)
    {
      ((void (**)(id, void *, void *))v9)[2](v9, v7, 0);
    }
    else
    {
      unint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"com.apple.nanopasskit.IDVRemoteDeviceSession.error" code:-1003 userInfo:0];
      v9[2](v9, 0, v8);
    }
  }
}

- (void)configureWithPartition:(id)a3 ackHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v6 = (NSSet *)a3;
  v7 = (void (**)(id, void *))a4;
  unint64_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      int v19 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested configure Credential store partitions:%@", (uint8_t *)&v18, 0xCu);
    }
  }
  if ([(NSSet *)self->_partitions count])
  {
    int v11 = pk_Payment_log();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      __int16 v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        partitions = self->_partitions;
        int v18 = 138412290;
        int v19 = partitions;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Session is already configured with partitions:%@. We don't allow to configure it multiple times", (uint8_t *)&v18, 0xCu);
      }
    }
    __int16 v15 = NPKIDVRemoteDeviceSessionError(-1000, 0);
    v7[2](v7, v15);
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263EFFA08] setWithArray:v6];
    uint64_t v17 = self->_partitions;
    self->_partitions = v16;

    v7[2](v7, 0);
  }
}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void, void *))a5;
  int v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    __int16 v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested create credential in partition:%@ with options:%@", buf, 0x16u);
    }
  }
  id v16 = v8;
  BOOL v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
  __int16 v15 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreEntitlementWithPartition:v14];

  if (v15) {
    v10[2](v10, 0, v15);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator createCredentialInPartition:v8 options:v9 completion:v10];
  }
}

- (void)generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  BOOL v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a3);
      int v15 = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested generate Key of type:%@ For Credential:%@", (uint8_t *)&v15, 0x16u);
    }
  }
  BOOL v14 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreEntitlementWithPartition:0];
  if (v14) {
    v9[2](v9, 0, v14);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator generateKeyWithType:a3 credentialIdentifier:v8 withConfiguredPartitions:self->_partitions completion:v9];
  }
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  BOOL v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested generate presentent keys for Credential:%@", (uint8_t *)&v14, 0xCu);
    }
  }
  __int16 v13 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreEntitlementWithPartition:0];
  if (v13) {
    v9[2](v9, 0, v13);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator generatePresentmentKeysForCredential:v8 numKeys:a4 withConfiguredPartitions:self->_partitions completion:v9];
  }
}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested delete Credential:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  BOOL v11 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreEntitlementWithPartition:0];
  if (v11) {
    v7[2](v7, v11);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator deleteCredential:v6 withConfiguredPartitions:self->_partitions completion:v7];
  }
}

- (void)propertiesOfCredential:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested fetch properties Of Credential:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  BOOL v11 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreEntitlementWithPartition:0];
  if (v11) {
    v7[2](v7, 0, v11);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator propertiesOfCredential:v6 withConfiguredPartitions:self->_partitions completion:v7];
  }
}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    BOOL v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested fetch credential Identifiers In Partitions:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  BOOL v11 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreEntitlementWithPartition:v6];
  if (v11) {
    v7[2](v7, 0, v11);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator credentialIdentifiersInPartitions:v6 completion:v7];
  }
}

- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, void, void *))a8;
  uint64_t v19 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialProvisioningEntitlement];
  if (v19)
  {
    v18[2](v18, 0, v19);
  }
  else
  {
    id v20 = pk_Payment_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      BOOL v22 = pk_Payment_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
        *(_DWORD *)buf = 138412546;
        v33 = v23;
        __int16 v34 = 2112;
        id v35 = v15;
        _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested provision credential type:%@ identifier:%@", buf, 0x16u);
      }
    }
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __134__NPKIDVRemoteDeviceSessionServer_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
    __int16 v29 = &unk_2644D2A78;
    id v24 = v15;
    id v30 = v24;
    uint64_t v31 = v18;
    v25 = (void *)MEMORY[0x223C37380](&v26);
    -[NPKIDVRemoteDeviceConnectionCoordinator provisionCredentialWithType:metadata:credentialIdentifier:attestations:supplementalData:completion:](self->_connectionCoordinator, "provisionCredentialWithType:metadata:credentialIdentifier:attestations:supplementalData:completion:", a3, v14, v24, v16, v17, v25, v26, v27, v28, v29);
  }
}

void __134__NPKIDVRemoteDeviceSessionServer_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 138412802;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v5;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish provision credential with identifier:%@ secureElementPass:%@ error:%@", (uint8_t *)&v12, 0x20u);
    }
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);
  }
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested nonce for authentication token", v9, 2u);
    }
  }
  BOOL v8 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreBiometricsEntitlement];
  if (v8) {
    v4[2](v4, 0, v8);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator nonceForAuthorizationTokenWithCompletion:v4];
  }
}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested pre-arm credential with authentication token:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v11 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreBiometricsEntitlement];
  if (v11) {
    v7[2](v7, v11);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator prearmCredentialWithAuthorizationToken:v6 completion:v7];
  }
}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Server requested establish trust V2 with Key:%@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v11 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreBiometricsEntitlement];
  if (v11) {
    v7[2](v7, 0, v11);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator establishPrearmTrustV2:v6 completion:v7];
  }
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested delete global auth ACL", v9, 2u);
    }
  }
  BOOL v8 = [(NPKIDVRemoteDeviceSessionServer *)self _checkCredentialStoreBiometricsEntitlement];
  if (v8) {
    v4[2](v4, v8);
  }
  else {
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self->_connectionCoordinator deleteGlobalAuthACLWithCompletion:v4];
  }
}

- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  int v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    uint64_t v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSStringFromNPKIDVRemoteDeviceNotificationType(a3);
      __int16 v16 = NSStringFromNPKIDVRemoteDeviceDocumentType(a4);
      *(_DWORD *)buf = 138412802;
      __int16 v29 = v15;
      __int16 v30 = 2112;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      id v33 = v10;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested add notification type:%@ document type:%@ issuerName:%@", buf, 0x20u);
    }
  }
  id v17 = [(PDXPCService *)self connection];
  uint64_t v18 = [v17 valueForEntitlement:@"com.apple.NanoPassbook.IDVRemoteDeviceService.extendedReviewNotification"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v18 BOOLValue])
  {
    connectionCoordinator = self->_connectionCoordinator;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __94__NPKIDVRemoteDeviceSessionServer_addNotificationWithType_documentType_issuerName_completion___block_invoke;
    v25[3] = &unk_2644D2AA0;
    unint64_t v27 = a3;
    id v26 = v11;
    [(NPKIDVRemoteDeviceConnectionCoordinator *)connectionCoordinator addNotificationWithType:a3 documentType:a4 issuerName:v10 completion:v25];
    id v20 = v26;
  }
  else
  {
    id v20 = NPKIDVRemoteDeviceSessionError(-1000, 0);
    BOOL v21 = pk_Payment_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

    if (v22)
    {
      uint64_t v23 = pk_Payment_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v24 = NSStringFromNPKIDVRemoteDeviceNotificationType(a3);
        *(_DWORD *)buf = 138412546;
        __int16 v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v20;
        _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error Requesting add notification type:%@ error:%@", buf, 0x16u);
      }
    }
    if (v11) {
      (*((void (**)(id, void *))v11 + 2))(v11, v20);
    }
  }
}

void __94__NPKIDVRemoteDeviceSessionServer_addNotificationWithType_documentType_issuerName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = pk_Payment_log();
  id v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6) {
      goto LABEL_10;
    }
    v7 = pk_Payment_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    BOOL v8 = NSStringFromNPKIDVRemoteDeviceNotificationType(*(void *)(a1 + 40));
    int v15 = 138412546;
    __int16 v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    BOOL v9 = "Error: NPKIDVRemoteDeviceService: Fail Requesting add notification type:%@ error:%@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_8;
  }
  BOOL v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v13) {
    goto LABEL_10;
  }
  v7 = pk_Payment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = NSStringFromNPKIDVRemoteDeviceNotificationType(*(void *)(a1 + 40));
    int v15 = 138412290;
    __int16 v16 = v8;
    BOOL v9 = "Notice: NPKIDVRemoteDeviceService: Finish Requesting add notification type:%@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v10, v11, v9, (uint8_t *)&v15, v12);
  }
LABEL_9:

LABEL_10:
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  }
}

- (void)updateProofingConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested to update proofing configuration: %@", buf, 0xCu);
    }
  }
  connectionCoordinator = self->_connectionCoordinator;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__NPKIDVRemoteDeviceSessionServer_updateProofingConfiguration_completion___block_invoke;
  v14[3] = &unk_2644D2AC8;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  [(NPKIDVRemoteDeviceConnectionCoordinator *)connectionCoordinator updateProofingConfiguration:v13 completion:v14];
}

void __74__NPKIDVRemoteDeviceSessionServer_updateProofingConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = pk_Payment_log();
  id v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6) {
      goto LABEL_10;
    }
    id v7 = pk_Payment_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    int v16 = 138412546;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v3;
    BOOL v9 = "Error: NPKIDVRemoteDeviceService: Failed to update proofing configuration (%@). Error: %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_8;
  }
  BOOL v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v13) {
    goto LABEL_10;
  }
  id v7 = pk_Payment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v16 = 138412290;
    uint64_t v17 = v14;
    BOOL v9 = "Notice: NPKIDVRemoteDeviceService: Finished updating proofing configuration (%@)";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v10, v11, v9, (uint8_t *)&v16, v12);
  }
LABEL_9:

LABEL_10:
  uint64_t v15 = *(void *)(a1 + 40);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);
  }
}

- (id)_checkCredentialProvisioningEntitlement
{
  v2 = [(PDXPCService *)self connection];
  id v3 = [v2 valueForEntitlement:@"com.apple.NanoPassbook.IDVRemoteDeviceService.credentialprovisioning"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue])
  {
    v4 = 0;
  }
  else
  {
    v4 = NPKIDVRemoteDeviceSessionError(-1000, 0);
  }

  return v4;
}

- (id)_checkCredentialStoreBiometricsEntitlement
{
  v2 = [(PDXPCService *)self connection];
  id v3 = [v2 valueForEntitlement:@"com.apple.idcredentials.biometrics"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue])
  {
    v4 = 0;
  }
  else
  {
    v4 = NPKIDVRemoteDeviceSessionError(-1000, 0);
  }

  return v4;
}

- (id)_checkCredentialStoreEntitlementWithPartition:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v4 = (NSSet *)a3;
  id v5 = [(PDXPCService *)self connection];
  BOOL v6 = [v5 valueForEntitlement:@"com.apple.idcredentials.storage"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
  }
  else
  {
    id v7 = 0;
  }
  if ([(NSSet *)self->_partitions count])
  {
    if ([v7 containsObject:@"*"] && !PKIsInternalInstall())
    {
      id v24 = pk_Payment_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        BOOL v13 = pk_Payment_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v27) = 0;
          __int16 v18 = "Error: NPKIDVRemoteDeviceService: WildCard entitlement only allowed at internal builds";
          id v19 = v13;
          uint32_t v20 = 2;
          goto LABEL_25;
        }
        goto LABEL_26;
      }
    }
    else if ([(NSSet *)v4 count] {
           && ([MEMORY[0x263EFFA08] setWithArray:v4],
    }
               uint64_t v8 = objc_claimAutoreleasedReturnValue(),
               char v9 = [v8 isSubsetOfSet:self->_partitions],
               v8,
               (v9 & 1) == 0))
    {
      BOOL v21 = pk_Payment_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (v22)
      {
        BOOL v13 = pk_Payment_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          partitions = self->_partitions;
          int v27 = 138412546;
          v28 = v4;
          __int16 v29 = 2112;
          __int16 v30 = partitions;
          __int16 v18 = "Error: NPKIDVRemoteDeviceService: Partitions:%@ must be part of the configured partitions:%@";
          id v19 = v13;
          uint32_t v20 = 22;
          goto LABEL_25;
        }
LABEL_26:
        uint64_t v14 = -1000;
LABEL_27:

        goto LABEL_29;
      }
    }
    else
    {
      if ([(NSSet *)self->_partitions isSubsetOfSet:v7])
      {
        id v10 = 0;
        goto LABEL_30;
      }
      uint64_t v15 = pk_Payment_log();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        BOOL v13 = pk_Payment_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = self->_partitions;
          int v27 = 138412290;
          v28 = v17;
          __int16 v18 = "Error: NPKIDVRemoteDeviceService: Missing entitlement for some of the configured partitions:%@";
          id v19 = v13;
          uint32_t v20 = 12;
LABEL_25:
          _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v27, v20);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    uint64_t v14 = -1000;
    goto LABEL_29;
  }
  os_log_type_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

  if (v12)
  {
    BOOL v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: no partitions set", (uint8_t *)&v27, 2u);
    }
    uint64_t v14 = -1101;
    goto LABEL_27;
  }
  uint64_t v14 = -1101;
LABEL_29:
  id v10 = NPKIDVRemoteDeviceSessionError(v14, 0);
LABEL_30:

  return v10;
}

- (NPKIDVRemoteDeviceSessionServerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (NPKIDVRemoteDeviceSessionServerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_partitions, 0);
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_connectionCoordinator, 0);
  objc_storeStrong((id *)&self->_eventsCoordinator, 0);
}

@end