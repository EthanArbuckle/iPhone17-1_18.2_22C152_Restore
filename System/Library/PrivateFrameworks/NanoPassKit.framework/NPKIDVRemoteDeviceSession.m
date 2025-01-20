@interface NPKIDVRemoteDeviceSession
+ (void)sessionForDeviceID:(id)a3 completion:(id)a4;
- (NPKIDVRemoteDeviceSession)init;
- (NSString)description;
- (NSString)deviceID;
- (id)_errorHandlerWithCompletion:(id)a3;
- (id)_remoteObjectProxyWithFailureHandler:(id)a3;
- (unint64_t)status;
- (void)_confirmRemoteDeviceID:(id)a3 withCompletion:(id)a4;
- (void)_generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 completion:(id)a5;
- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6;
- (void)configureWithPartition:(id)a3 ackHandler:(id)a4;
- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5;
- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4;
- (void)credentialPreflightStatusForType:(unint64_t)a3 completion:(id)a4;
- (void)credentialPreflightStatusForType:(unint64_t)a3 minOSVersion:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)deleteCredential:(id)a3 completion:(id)a4;
- (void)deleteGlobalAuthACLWithCompletion:(id)a3;
- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 completion:(id)a5;
- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4;
- (void)fetchRemoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a3 completion:(id)a4;
- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4;
- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4;
- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4;
- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5;
- (void)getCASDCertificateWithCompletion:(id)a3;
- (void)invalidateSession;
- (void)nonceForAuthorizationTokenWithCompletion:(id)a3;
- (void)pairedWatchSEIDWithCompletion:(id)a3;
- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4;
- (void)propertiesOfCredential:(id)a3 completion:(id)a4;
- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8;
- (void)provisionedCredentialCountForType:(unint64_t)a3 completion:(id)a4;
- (void)registerForEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5;
- (void)remoteService:(id)a3 didEstablishConnection:(id)a4;
- (void)remoteService:(id)a3 didInterruptConnection:(id)a4;
- (void)setDeviceID:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)unregisterFromEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5;
- (void)updateProofingConfiguration:(id)a3 completion:(id)a4;
@end

@implementation NPKIDVRemoteDeviceSession

- (NPKIDVRemoteDeviceSession)init
{
  v10.receiver = self;
  v10.super_class = (Class)NPKIDVRemoteDeviceSession;
  v2 = [(NPKIDVRemoteDeviceSession *)&v10 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_deviceIDLock._os_unfair_lock_opaque = 0;
    deviceID = v2->_deviceID;
    v2->_deviceID = (NSString *)@"NPKIDVRemoteDeviceSessionInvalidDeviceID";
    v2->_status = 0;

    id v5 = objc_alloc(MEMORY[0x263F5C2F0]);
    v6 = NPKIDVRemoteDeviceServiceSessionServerProtocolInterface();
    uint64_t v7 = [v5 initWithMachServiceName:@"com.apple.NanoPassbook.IDVRemoteDeviceService.session.server" remoteObjectInterface:v6 exportedObjectInterface:0 exportedObject:v3];
    remoteService = v3->_remoteService;
    v3->_remoteService = (PKXPCService *)v7;

    [(PKXPCService *)v3->_remoteService setDelegate:v3];
    [(PKXPCService *)v3->_remoteService setForceConnectionOnResume:1];
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[NPKIDVRemoteDeviceSession dealloc]";
      __int16 v9 = 2112;
      objc_super v10 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s, %@", buf, 0x16u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)NPKIDVRemoteDeviceSession;
  [(NPKIDVRemoteDeviceSession *)&v6 dealloc];
}

+ (void)sessionForDeviceID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__NPKIDVRemoteDeviceSession_sessionForDeviceID_completion___block_invoke;
  v10[3] = &unk_2644D56E8;
  id v11 = v6;
  id v9 = v6;
  [v8 _confirmRemoteDeviceID:v7 withCompletion:v10];
}

void __59__NPKIDVRemoteDeviceSession_sessionForDeviceID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__NPKIDVRemoteDeviceSession_sessionForDeviceID_completion___block_invoke_2;
  block[3] = &unk_2644D4100;
  id v8 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __59__NPKIDVRemoteDeviceSession_sessionForDeviceID_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (NSString)deviceID
{
  p_deviceIDLock = &self->_deviceIDLock;
  os_unfair_lock_lock(&self->_deviceIDLock);
  BOOL v4 = self->_deviceID;
  os_unfair_lock_unlock(p_deviceIDLock);
  return v4;
}

- (void)setDeviceID:(id)a3
{
  BOOL v4 = (NSString *)[a3 copy];
  os_unfair_lock_lock(&self->_deviceIDLock);
  deviceID = self->_deviceID;
  self->_deviceID = v4;

  os_unfair_lock_unlock(&self->_deviceIDLock);
}

- (void)_confirmRemoteDeviceID:(id)a3 withCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: requested confirm DeviceID:%@", buf, 0xCu);
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__NPKIDVRemoteDeviceSession__confirmRemoteDeviceID_withCompletion___block_invoke;
  v17[3] = &unk_2644D2AC8;
  id v18 = v6;
  id v11 = v7;
  id v19 = v11;
  id v12 = v6;
  id v13 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__NPKIDVRemoteDeviceSession__confirmRemoteDeviceID_withCompletion___block_invoke_60;
  v15[3] = &unk_2644D5710;
  v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [v13 confirmRemoteDeviceID:v12 withCompletion:v15];
}

void __67__NPKIDVRemoteDeviceSession__confirmRemoteDeviceID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error during deviceID:%@ check", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __67__NPKIDVRemoteDeviceSession__confirmRemoteDeviceID_withCompletion___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pk_Payment_log();
  int v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      uint64_t v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412546;
        id v15 = v5;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Finish request confirmation DeviceID:%@, error:%@", (uint8_t *)&v14, 0x16u);
      }
    }
    [*(id *)(a1 + 32) invalidateSession];
    id v11 = 0;
  }
  else
  {
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      id v13 = pk_Payment_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Finish request confirmation DeviceID:%@", (uint8_t *)&v14, 0xCu);
      }
    }
    id v11 = *(id *)(a1 + 32);
    [*(id *)(a1 + 32) setDeviceID:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)credentialPreflightStatusForType:(unint64_t)a3 completion:(id)a4
{
}

- (void)credentialPreflightStatusForType:(unint64_t)a3 minOSVersion:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    BOOL v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      *(_DWORD *)buf = 138412546;
      v24 = v13;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested credential preflight status for type:%@ minOSVersion:%@", buf, 0x16u);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __86__NPKIDVRemoteDeviceSession_credentialPreflightStatusForType_minOSVersion_completion___block_invoke;
  v20[3] = &unk_2644D2AA0;
  unint64_t v22 = a3;
  id v14 = v9;
  id v21 = v14;
  id v15 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v20];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__NPKIDVRemoteDeviceSession_credentialPreflightStatusForType_minOSVersion_completion___block_invoke_62;
  v17[3] = &unk_2644D5738;
  id v18 = v14;
  unint64_t v19 = a3;
  void v17[4] = self;
  id v16 = v14;
  [v15 credentialPreflightStatusForType:a3 minOSVersion:v8 completion:v17];
}

void __86__NPKIDVRemoteDeviceSession_credentialPreflightStatusForType_minOSVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 40));
      int v10 = 138412546;
      BOOL v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error request credential preflight status for type:%@ error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
}

void __86__NPKIDVRemoteDeviceSession_credentialPreflightStatusForType_minOSVersion_completion___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pk_Payment_log();
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      BOOL v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        __int16 v12 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 48));
        int v18 = 138412802;
        unint64_t v19 = v12;
        __int16 v20 = 2112;
        id v21 = v5;
        __int16 v22 = 2112;
        id v23 = v6;
        id v13 = "Error: NPKIDVRemoteDeviceService: Finish request credential preflight status for type:%@ status:%@ error:%@";
        uint64_t v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 32;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v14, v15, v13, (uint8_t *)&v18, v16);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      BOOL v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 48));
        int v18 = 138412546;
        unint64_t v19 = v12;
        __int16 v20 = 2112;
        id v21 = v5;
        id v13 = "Notice: NPKIDVRemoteDeviceService: Finish request credential preflight status for type:%@ status:%@";
        uint64_t v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 22;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v6, v10);
}

- (void)pairedWatchSEIDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received request for device SEID", buf, 2u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__NPKIDVRemoteDeviceSession_pairedWatchSEIDWithCompletion___block_invoke;
  v13[3] = &unk_2644D2B90;
  id v8 = v4;
  id v14 = v8;
  BOOL v9 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__NPKIDVRemoteDeviceSession_pairedWatchSEIDWithCompletion___block_invoke_64;
  v11[3] = &unk_2644D5760;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 pairedWatchSEIDWithCompletion:v11];
}

void __59__NPKIDVRemoteDeviceSession_pairedWatchSEIDWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error during device SEID request: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

void __59__NPKIDVRemoteDeviceSession_pairedWatchSEIDWithCompletion___block_invoke_64(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  id v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      uint64_t v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412546;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v6;
        id v12 = "Error: NPKIDVRemoteDeviceService: Request for device SEID: %@ deviceSEID complete with error: %@";
        id v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 22;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v13, v14, v12, (uint8_t *)&v17, v15);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      uint64_t v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v5;
        id v12 = "Notice: NPKIDVRemoteDeviceService: Request for device SEID: %@ deviceSEID complete";
        id v13 = v11;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 12;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v6, v10);
}

- (void)provisionedCredentialCountForType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    BOOL v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received request for provisioned credential count of type: %@", buf, 0xCu);
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __74__NPKIDVRemoteDeviceSession_provisionedCredentialCountForType_completion___block_invoke;
  v17[3] = &unk_2644D2AA0;
  unint64_t v19 = a3;
  id v11 = v6;
  id v18 = v11;
  id v12 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __74__NPKIDVRemoteDeviceSession_provisionedCredentialCountForType_completion___block_invoke_65;
  v14[3] = &unk_2644D5788;
  id v15 = v11;
  unint64_t v16 = a3;
  v14[4] = self;
  id v13 = v11;
  [v12 provisionedCredentialCountForType:a3 completion:v14];
}

void __74__NPKIDVRemoteDeviceSession_provisionedCredentialCountForType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 40));
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error during provisioned credential count request of type %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v9 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, 0x7FFFFFFFFFFFFFFFLL, v9);
}

void __74__NPKIDVRemoteDeviceSession_provisionedCredentialCountForType_completion___block_invoke_65(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pk_Payment_log();
  uint64_t v7 = v6;
  if (v5)
  {
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 48));
        int v17 = 138412802;
        id v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = a2;
        __int16 v21 = 2112;
        id v22 = v5;
        __int16 v12 = "Error: NPKIDVRemoteDeviceService: Finished request for provisioned credential count of type:%@. Count:%lu error:%@";
        id v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
        uint32_t v15 = 32;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v13, v14, v12, (uint8_t *)&v17, v15);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v16 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 48));
        int v17 = 138412546;
        id v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = a2;
        __int16 v12 = "Notice: NPKIDVRemoteDeviceService: Finished request for provisioned credential count of type:%@. Count:%lu";
        id v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
        uint32_t v15 = 22;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v9);
}

- (void)fetchRemoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      *(_DWORD *)buf = 138412290;
      __int16 v21 = v10;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received request for remote biometric authentication status of type: %@", buf, 0xCu);
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __98__NPKIDVRemoteDeviceSession_fetchRemoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke;
  v17[3] = &unk_2644D2AA0;
  unint64_t v19 = a3;
  id v11 = v6;
  id v18 = v11;
  __int16 v12 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98__NPKIDVRemoteDeviceSession_fetchRemoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke_67;
  v14[3] = &unk_2644D57B0;
  id v15 = v11;
  unint64_t v16 = a3;
  v14[4] = self;
  id v13 = v11;
  [v12 fetchRemoteBiometricAuthenticationStatusForCredentialType:a3 completion:v14];
}

void __98__NPKIDVRemoteDeviceSession_fetchRemoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 40));
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error during remote biometric authentication status request of type %@: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
}

void __98__NPKIDVRemoteDeviceSession_fetchRemoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pk_Payment_log();
  uint64_t v7 = v6;
  if (v5)
  {
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 48));
        __int16 v12 = NSStringFromBOOL();
        int v18 = 138412802;
        unint64_t v19 = v11;
        __int16 v20 = 2112;
        __int16 v21 = v12;
        __int16 v22 = 2112;
        id v23 = v5;
        id v13 = "Error: NPKIDVRemoteDeviceService: Finished request for remote biometric authentication status of type:%@. "
              "Trust lost:%@ error:%@";
        uint64_t v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 32;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v14, v15, v13, (uint8_t *)&v18, v16);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = NSStringFromNPKIDVRemoteDeviceCredentialType(*(void *)(a1 + 48));
        __int16 v12 = NSStringFromBOOL();
        int v18 = 138412546;
        unint64_t v19 = v11;
        __int16 v20 = 2112;
        __int16 v21 = v12;
        id v13 = "Notice: NPKIDVRemoteDeviceService: Finished request for remote biometric authentication status of type:%@. Trust lost:%@";
        uint64_t v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 22;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, v5, v9);
}

- (void)registerForEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    __int16 v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested register for events:%@ with serviceName:%@", buf, 0x16u);
    }
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __87__NPKIDVRemoteDeviceSession_registerForEvents_withRemoteProcessServiceName_completion___block_invoke;
  v23[3] = &unk_2644D57D8;
  unint64_t v26 = a3;
  id v14 = v8;
  id v24 = v14;
  id v15 = v9;
  id v25 = v15;
  uint32_t v16 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v23];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __87__NPKIDVRemoteDeviceSession_registerForEvents_withRemoteProcessServiceName_completion___block_invoke_69;
  v19[3] = &unk_2644D5800;
  __int16 v21 = self;
  id v22 = v15;
  id v20 = v14;
  id v17 = v15;
  id v18 = v14;
  [v16 registerForEvents:a3 withRemoteProcessServiceName:v18 completion:v19];
}

void __87__NPKIDVRemoteDeviceSession_registerForEvents_withRemoteProcessServiceName_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a1[6]);
      uint64_t v8 = a1[4];
      int v11 = 138412802;
      __int16 v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error request register for events:%@ with serviceName:%@ error:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v9 = a1[5];
  int v10 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, unint64_t, void *))(v9 + 16))(v9, 0xFFFFFFFF80000000, v10);
}

void __87__NPKIDVRemoteDeviceSession_registerForEvents_withRemoteProcessServiceName_completion___block_invoke_69(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pk_Payment_log();
  uint64_t v7 = v6;
  if (v5)
  {
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a2);
        uint64_t v12 = *(void *)(a1 + 32);
        int v19 = 138412802;
        id v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        __int16 v23 = 2112;
        id v24 = v5;
        __int16 v13 = "Error: NPKIDVRemoteDeviceService: Finish request register for events with currentEvents:%@ serviceName:%@ error:%@";
        uint64_t v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 32;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v14, v15, v13, (uint8_t *)&v19, v16);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a2);
        uint64_t v18 = *(void *)(a1 + 32);
        int v19 = 138412546;
        id v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        __int16 v13 = "Notice: NPKIDVRemoteDeviceService: Finish request register for events with currentEvents:%@ serviceName:%@";
        uint64_t v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 22;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, unint64_t, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v5, v9);
}

- (void)unregisterFromEvents:(unint64_t)a3 withRemoteProcessServiceName:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  int v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a3);
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested unregister for events:%@ with serviceName:%@", buf, 0x16u);
    }
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __90__NPKIDVRemoteDeviceSession_unregisterFromEvents_withRemoteProcessServiceName_completion___block_invoke;
  v23[3] = &unk_2644D57D8;
  unint64_t v26 = a3;
  id v14 = v8;
  id v24 = v14;
  id v15 = v9;
  id v25 = v15;
  uint32_t v16 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v23];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __90__NPKIDVRemoteDeviceSession_unregisterFromEvents_withRemoteProcessServiceName_completion___block_invoke_70;
  v19[3] = &unk_2644D5800;
  __int16 v21 = self;
  id v22 = v15;
  id v20 = v14;
  id v17 = v15;
  id v18 = v14;
  [v16 unregisterFromEvents:a3 withRemoteProcessServiceName:v18 completion:v19];
}

void __90__NPKIDVRemoteDeviceSession_unregisterFromEvents_withRemoteProcessServiceName_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a1[6]);
      uint64_t v8 = a1[4];
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error request unregister for events:%@ with serviceName:%@ error:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v9 = a1[5];
  int v10 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, unint64_t, void *))(v9 + 16))(v9, 0xFFFFFFFF80000000, v10);
}

void __90__NPKIDVRemoteDeviceSession_unregisterFromEvents_withRemoteProcessServiceName_completion___block_invoke_70(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = pk_Payment_log();
  uint64_t v7 = v6;
  if (v5)
  {
    BOOL v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a2);
        uint64_t v12 = *(void *)(a1 + 32);
        int v19 = 138412802;
        id v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = v12;
        __int16 v23 = 2112;
        id v24 = v5;
        __int16 v13 = "Error: NPKIDVRemoteDeviceService: Finish request unregister for events with currentEvents:%@ serviceName:%@ error:%@";
        uint64_t v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 32;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v14, v15, v13, (uint8_t *)&v19, v16);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a2);
        uint64_t v18 = *(void *)(a1 + 32);
        int v19 = 138412546;
        id v20 = v11;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        __int16 v13 = "Notice: NPKIDVRemoteDeviceService: Finish request unregister for events with currentEvents:%@ serviceName:%@";
        uint64_t v14 = v10;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 22;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, unint64_t, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, v5, v9);
}

- (void)configureWithPartition:(id)a3 ackHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    int v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested configure Credential store partitions:%@", buf, 0xCu);
    }
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __63__NPKIDVRemoteDeviceSession_configureWithPartition_ackHandler___block_invoke;
  v17[3] = &unk_2644D2AC8;
  id v18 = v6;
  id v11 = v7;
  id v19 = v11;
  id v12 = v6;
  __int16 v13 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__NPKIDVRemoteDeviceSession_configureWithPartition_ackHandler___block_invoke_71;
  v15[3] = &unk_2644D5828;
  v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [v13 configureWithPartition:v12 ackHandler:v15];
}

void __63__NPKIDVRemoteDeviceSession_configureWithPartition_ackHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error configuring Credential store partitions %@ with error:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void __63__NPKIDVRemoteDeviceSession_configureWithPartition_ackHandler___block_invoke_71(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v7 = pk_Payment_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v14 = 138412290;
    id v15 = v3;
    uint64_t v8 = "Error: NPKIDVRemoteDeviceService: Fail configure Credential store partitions with error:%@";
    int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 12;
    goto LABEL_8;
  }
  BOOL v12 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v7 = pk_Payment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    uint64_t v8 = "Notice: NPKIDVRemoteDeviceService: Finish configure Credential store partitions";
    int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 2;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v9, v10, v8, (uint8_t *)&v14, v11);
  }
LABEL_9:

LABEL_10:
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint32_t v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    uint64_t v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested create credential in partition:%@ with options:%@", buf, 0x16u);
    }
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __76__NPKIDVRemoteDeviceSession_createCredentialInPartition_options_completion___block_invoke;
  v20[3] = &unk_2644D2AC8;
  id v21 = v8;
  id v14 = v10;
  id v22 = v14;
  id v15 = v8;
  uint64_t v16 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __76__NPKIDVRemoteDeviceSession_createCredentialInPartition_options_completion___block_invoke_72;
  v18[3] = &unk_2644D5760;
  v18[4] = self;
  id v19 = v14;
  id v17 = v14;
  [v16 createCredentialInPartition:v15 options:v9 completion:v18];
}

void __76__NPKIDVRemoteDeviceSession_createCredentialInPartition_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error creating Credential in Partition %@ with error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
}

void __76__NPKIDVRemoteDeviceSession_createCredentialInPartition_options_completion___block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v6;
        uint64_t v11 = "Error: NPKIDVRemoteDeviceService: Fail create credential in partition with error:%@";
        __int16 v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v12, v13, v11, (uint8_t *)&v15, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      int v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v5;
        uint64_t v11 = "Notice: NPKIDVRemoteDeviceService: Finish create credential in partition with identifier:%@";
        __int16 v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5);
}

- (void)generateKeySigningKeyForCredential:(id)a3 completion:(id)a4
{
}

- (void)generateDeviceEncryptionKeyForCredential:(id)a3 completion:(id)a4
{
}

- (void)generatePresentmentKeyForCredential:(id)a3 completion:(id)a4
{
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    __int16 v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested generate presentment keys for credential:%@", buf, 0xCu);
    }
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __85__NPKIDVRemoteDeviceSession_generatePresentmentKeysForCredential_numKeys_completion___block_invoke;
  v22[3] = &unk_2644D2AC8;
  id v13 = v8;
  id v23 = v13;
  id v14 = v9;
  id v24 = v14;
  int v15 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v22];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __85__NPKIDVRemoteDeviceSession_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_73;
  v18[3] = &unk_2644D5850;
  id v20 = self;
  id v21 = v14;
  id v19 = v13;
  id v16 = v14;
  id v17 = v13;
  [v15 generatePresentmentKeysForCredential:v17 numKeys:a4 completion:v18];
}

void __85__NPKIDVRemoteDeviceSession_generatePresentmentKeysForCredential_numKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error generating presentment keys for credential:%@ with error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
}

void __85__NPKIDVRemoteDeviceSession_generatePresentmentKeysForCredential_numKeys_completion___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      uint64_t v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v19 = 138412546;
        uint64_t v20 = v12;
        __int16 v21 = 2112;
        id v22 = v6;
        id v13 = "Error: NPKIDVRemoteDeviceService: Failed to generate presentment keys for credential:%@ with error:%@";
        uint64_t v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 22;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v14, v15, v13, (uint8_t *)&v19, v16);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      uint64_t v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        int v19 = 138412290;
        uint64_t v20 = v18;
        id v13 = "Notice: NPKIDVRemoteDeviceService: Finish generating presentment keys of for credential:%@";
        uint64_t v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 12;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v10);
}

- (void)_generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a3);
      *(_DWORD *)buf = 138412546;
      __int16 v29 = v13;
      __int16 v30 = 2112;
      id v31 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested generate Key of type:%@ For Credential:%@", buf, 0x16u);
    }
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __82__NPKIDVRemoteDeviceSession__generateKeyWithType_credentialIdentifier_completion___block_invoke;
  v24[3] = &unk_2644D57D8;
  unint64_t v27 = a3;
  id v14 = v8;
  id v25 = v14;
  id v15 = v9;
  id v26 = v15;
  uint32_t v16 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v24];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __82__NPKIDVRemoteDeviceSession__generateKeyWithType_credentialIdentifier_completion___block_invoke_75;
  v19[3] = &unk_2644D5878;
  id v22 = v15;
  unint64_t v23 = a3;
  id v20 = v14;
  __int16 v21 = self;
  id v17 = v15;
  id v18 = v14;
  [v16 generateKeyWithType:a3 credentialIdentifier:v18 completion:v19];
}

void __82__NPKIDVRemoteDeviceSession__generateKeyWithType_credentialIdentifier_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a1[6]);
      uint64_t v8 = a1[4];
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error generating Key of type:%@ For Credential:%@ with error:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v9 = a1[5];
  uint64_t v10 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
}

void __82__NPKIDVRemoteDeviceSession__generateKeyWithType_credentialIdentifier_completion___block_invoke_75(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      int v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a1[7]);
        uint64_t v13 = a1[4];
        int v20 = 138412802;
        __int16 v21 = v12;
        __int16 v22 = 2112;
        uint64_t v23 = v13;
        __int16 v24 = 2112;
        id v25 = v6;
        uint64_t v14 = "Error: NPKIDVRemoteDeviceService: Fail generating Key of type:%@ For Credential:%@ with error:%@";
        __int16 v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
        uint32_t v17 = 32;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v15, v16, v14, (uint8_t *)&v20, v17);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v18 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      int v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a1[7]);
        uint64_t v19 = a1[4];
        int v20 = 138412546;
        __int16 v21 = v12;
        __int16 v22 = 2112;
        uint64_t v23 = v19;
        uint64_t v14 = "Notice: NPKIDVRemoteDeviceService: Finish generate Key of type:%@ For Credential:%@";
        __int16 v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        uint32_t v17 = 22;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id, id, uint64_t))(a1[6] + 16))(a1[6], v5, v6, v10);
}

- (void)deleteCredential:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested delete Credential:%@", buf, 0xCu);
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __57__NPKIDVRemoteDeviceSession_deleteCredential_completion___block_invoke;
  v19[3] = &unk_2644D2B90;
  id v11 = v7;
  id v20 = v11;
  uint64_t v12 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v19];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__NPKIDVRemoteDeviceSession_deleteCredential_completion___block_invoke_77;
  v15[3] = &unk_2644D58A0;
  uint32_t v17 = self;
  id v18 = v11;
  id v16 = v6;
  id v13 = v11;
  id v14 = v6;
  [v12 deleteCredential:v14 completion:v15];
}

void __57__NPKIDVRemoteDeviceSession_deleteCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error deleting Credential with error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void __57__NPKIDVRemoteDeviceSession_deleteCredential_completion___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      uint64_t v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = v3;
        uint64_t v8 = "Error: NPKIDVRemoteDeviceService: Fail deleting Credential with error:%@";
        int v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v9, v10, v8, (uint8_t *)&v13, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v11 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      uint64_t v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void **)(a1 + 32);
        int v13 = 138412290;
        id v14 = v12;
        uint64_t v8 = "Notice: NPKIDVRemoteDeviceService: Finish delete Credential:%@";
        int v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v3);
}

- (void)propertiesOfCredential:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    os_log_type_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested fetch properties Of Credential:%@", buf, 0xCu);
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__NPKIDVRemoteDeviceSession_propertiesOfCredential_completion___block_invoke;
  v19[3] = &unk_2644D2B90;
  id v11 = v7;
  id v20 = v11;
  uint64_t v12 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v19];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __63__NPKIDVRemoteDeviceSession_propertiesOfCredential_completion___block_invoke_78;
  v15[3] = &unk_2644D58C8;
  uint32_t v17 = self;
  id v18 = v11;
  id v16 = v6;
  id v13 = v11;
  id v14 = v6;
  [v12 propertiesOfCredential:v14 completion:v15];
}

void __63__NPKIDVRemoteDeviceSession_propertiesOfCredential_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error fetching properties Of Credential with error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

void __63__NPKIDVRemoteDeviceSession_propertiesOfCredential_completion___block_invoke_78(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        id v17 = v6;
        uint64_t v11 = "Error: NPKIDVRemoteDeviceService: Fail fetching properties Of Credential with error:%@";
        uint64_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v12, v13, v11, (uint8_t *)&v16, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void **)(a1 + 32);
        int v16 = 138412290;
        id v17 = v15;
        uint64_t v11 = "Notice: NPKIDVRemoteDeviceService: Finish fetch properties Of Credential:%@";
        uint64_t v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5);
}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested fetch credential Identifiers In Partitions:%@", buf, 0xCu);
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __74__NPKIDVRemoteDeviceSession_credentialIdentifiersInPartitions_completion___block_invoke;
  v19[3] = &unk_2644D2B90;
  id v11 = v7;
  id v20 = v11;
  uint64_t v12 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v19];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__NPKIDVRemoteDeviceSession_credentialIdentifiersInPartitions_completion___block_invoke_80;
  v15[3] = &unk_2644D58F0;
  id v17 = self;
  id v18 = v11;
  id v16 = v6;
  id v13 = v11;
  id v14 = v6;
  [v12 credentialIdentifiersInPartitions:v14 completion:v15];
}

void __74__NPKIDVRemoteDeviceSession_credentialIdentifiersInPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error fetching credential Identifiers In Partitions with error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

void __74__NPKIDVRemoteDeviceSession_credentialIdentifiersInPartitions_completion___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      uint64_t v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        int v19 = 138412546;
        uint64_t v20 = v12;
        __int16 v21 = 2112;
        id v22 = v6;
        id v13 = "Error: NPKIDVRemoteDeviceService: Fail fetching credential identifiers in partitions %@ with error:%@";
        id v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
        uint32_t v16 = 22;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v14, v15, v13, (uint8_t *)&v19, v16);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      uint64_t v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        int v19 = 138412290;
        uint64_t v20 = v18;
        id v13 = "Notice: NPKIDVRemoteDeviceService: Finish fetch credential identifiers in partitions:%@";
        id v14 = v11;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 12;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5, v6, v10);
}

- (void)elementsOfCredential:(id)a3 elementIdentifiers:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = (void (**)(id, void, void *))a5;
  uint64_t v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    uint64_t v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Requested fetch credential elements:%@ of credential:%@. THIS METHOD IS NOT LONGER SUPPORTED", (uint8_t *)&v14, 0x16u);
    }
  }
  id v13 = NPKIDVRemoteDeviceSessionError(-1000, 0);
  v9[2](v9, 0, v13);
}

- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a4;
  int v19 = pk_Payment_log();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

  if (v20)
  {
    __int16 v21 = pk_Payment_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = NSStringFromNPKIDVRemoteDeviceCredentialType(a3);
      *(_DWORD *)buf = 138412546;
      v37 = v22;
      __int16 v38 = 2112;
      id v39 = v14;
      _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested provision credential type:%@ credential Identifier:%@", buf, 0x16u);
    }
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __128__NPKIDVRemoteDeviceSession_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
  v32[3] = &unk_2644D57D8;
  unint64_t v35 = a3;
  id v23 = v14;
  id v33 = v23;
  id v24 = v15;
  id v34 = v24;
  id v25 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v32];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __128__NPKIDVRemoteDeviceSession_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke_82;
  v28[3] = &unk_2644D5918;
  id v30 = v24;
  unint64_t v31 = a3;
  id v29 = v23;
  id v26 = v24;
  id v27 = v23;
  [v25 provisionCredentialWithType:a3 metadata:v18 credentialIdentifier:v27 attestations:v17 supplementalData:v16 completion:v28];
}

void __128__NPKIDVRemoteDeviceSession_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = NSStringFromNPKIDVRemoteDeviceCredentialType(a1[6]);
      uint64_t v8 = a1[4];
      int v11 = 138412802;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error provisioning credential type:%@ credential Identifier:%@ with error:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  uint64_t v9 = a1[5];
  uint64_t v10 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);
}

void __128__NPKIDVRemoteDeviceSession_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke_82(void *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = pk_Payment_log();
  uint64_t v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      int v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = NSStringFromNPKIDVRemoteDeviceCredentialType(a1[6]);
        uint64_t v13 = a1[4];
        int v19 = 138412802;
        BOOL v20 = v12;
        __int16 v21 = 2112;
        uint64_t v22 = v13;
        __int16 v23 = 2112;
        id v24 = v6;
        uint64_t v14 = "Error: NPKIDVRemoteDeviceService: Fail provisioning credential type:%@ credential Identifier:%@ with error:%@";
        __int16 v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v15, v16, v14, (uint8_t *)&v19, 0x20u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      int v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = NSStringFromNPKIDVRemoteDeviceCredentialType(a1[6]);
        uint64_t v18 = a1[4];
        int v19 = 138412802;
        BOOL v20 = v12;
        __int16 v21 = 2112;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        id v24 = v5;
        uint64_t v14 = "Notice: NPKIDVRemoteDeviceService: Finish provisioning credential type:%@ credential Identifier:%@ secureElementPass:%@";
        __int16 v15 = v11;
        os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id, id, uint64_t))(a1[5] + 16))(a1[5], v5, v6, v10);
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested nonce for Authentication Token", buf, 2u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __70__NPKIDVRemoteDeviceSession_nonceForAuthorizationTokenWithCompletion___block_invoke;
  v13[3] = &unk_2644D2B90;
  id v8 = v4;
  id v14 = v8;
  BOOL v9 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__NPKIDVRemoteDeviceSession_nonceForAuthorizationTokenWithCompletion___block_invoke_84;
  v11[3] = &unk_2644D5940;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 nonceForAuthorizationTokenWithCompletion:v11];
}

void __70__NPKIDVRemoteDeviceSession_nonceForAuthorizationTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error fetching nonce for Authentication Token with error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

void __70__NPKIDVRemoteDeviceSession_nonceForAuthorizationTokenWithCompletion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  id v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v6;
        uint64_t v11 = "Error: NPKIDVRemoteDeviceService: Fail fetching nonce for Authentication Token with error:%@";
        id v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v12, v13, v11, (uint8_t *)&v15, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v5;
        uint64_t v11 = "Notice: NPKIDVRemoteDeviceService: Finish fetch nonce:%@ for Authentication Token";
        id v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5);
}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested pre-arm credential with authenticationToken:%@", buf, 0xCu);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__NPKIDVRemoteDeviceSession_prearmCredentialWithAuthorizationToken_completion___block_invoke;
  v16[3] = &unk_2644D2B90;
  id v11 = v7;
  id v17 = v11;
  id v12 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__NPKIDVRemoteDeviceSession_prearmCredentialWithAuthorizationToken_completion___block_invoke_86;
  v14[3] = &unk_2644D5828;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 prearmCredentialWithAuthorizationToken:v6 completion:v14];
}

void __79__NPKIDVRemoteDeviceSession_prearmCredentialWithAuthorizationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error pre-arming credential with authentication token, error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void __79__NPKIDVRemoteDeviceSession_prearmCredentialWithAuthorizationToken_completion___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      uint64_t v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138412290;
        id v14 = v3;
        id v8 = "Error: NPKIDVRemoteDeviceService: Fail pre-arming credential with authentication token, error:%@";
        int v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v11 = 12;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v9, v10, v8, (uint8_t *)&v13, v11);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v12 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      uint64_t v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        id v8 = "Notice: NPKIDVRemoteDeviceService: Finish pre-arming credential with authentication token";
        int v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        uint32_t v11 = 2;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3);
}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    os_log_type_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested establish trust V2 with Key:%@", buf, 0xCu);
    }
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__NPKIDVRemoteDeviceSession_establishPrearmTrustV2_completion___block_invoke;
  v16[3] = &unk_2644D2B90;
  id v11 = v7;
  id v17 = v11;
  BOOL v12 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__NPKIDVRemoteDeviceSession_establishPrearmTrustV2_completion___block_invoke_87;
  v14[3] = &unk_2644D5968;
  v14[4] = self;
  id v15 = v11;
  id v13 = v11;
  [v12 establishPrearmTrustV2:v6 completion:v14];
}

void __63__NPKIDVRemoteDeviceSession_establishPrearmTrustV2_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error establishing trust, error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

void __63__NPKIDVRemoteDeviceSession_establishPrearmTrustV2_completion___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  id v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412290;
        id v17 = v6;
        uint64_t v11 = "Error: NPKIDVRemoteDeviceService: Fail establishing trust, error:%@";
        BOOL v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        uint32_t v14 = 12;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v12, v13, v11, (uint8_t *)&v16, v14);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v15 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        uint64_t v11 = "Notice: NPKIDVRemoteDeviceService: Finish establishing trust";
        BOOL v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        uint32_t v14 = 2;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5);
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested delete global auth ACL", buf, 2u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__NPKIDVRemoteDeviceSession_deleteGlobalAuthACLWithCompletion___block_invoke;
  v13[3] = &unk_2644D2B90;
  id v8 = v4;
  id v14 = v8;
  BOOL v9 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__NPKIDVRemoteDeviceSession_deleteGlobalAuthACLWithCompletion___block_invoke_89;
  v11[3] = &unk_2644D5828;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 deleteGlobalAuthACLWithCompletion:v11];
}

void __63__NPKIDVRemoteDeviceSession_deleteGlobalAuthACLWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error deleting global auth ACL with error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void __63__NPKIDVRemoteDeviceSession_deleteGlobalAuthACLWithCompletion___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v7 = pk_Payment_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v14 = 138412290;
    id v15 = v3;
    id v8 = "Error: NPKIDVRemoteDeviceService: Fail delete global auth ACL with error:%@";
    int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 12;
    goto LABEL_8;
  }
  BOOL v12 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v7 = pk_Payment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    id v8 = "Notice: NPKIDVRemoteDeviceService: Finish delete global auth ACL";
    int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 2;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v9, v10, v8, (uint8_t *)&v14, v11);
  }
LABEL_9:

LABEL_10:
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (void)getCASDCertificateWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested get CASD certificate", buf, 2u);
    }
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__NPKIDVRemoteDeviceSession_getCASDCertificateWithCompletion___block_invoke;
  v13[3] = &unk_2644D2B90;
  id v8 = v4;
  id v14 = v8;
  int v9 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__NPKIDVRemoteDeviceSession_getCASDCertificateWithCompletion___block_invoke_90;
  v11[3] = &unk_2644D5990;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 getCASDCertificateWithCompletion:v11];
}

void __62__NPKIDVRemoteDeviceSession_getCASDCertificateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error retrieving CASD certificate with error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

void __62__NPKIDVRemoteDeviceSession_getCASDCertificateWithCompletion___block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = pk_Payment_log();
  id v8 = v7;
  if (v6)
  {
    BOOL v9 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        id v16 = v6;
        uint64_t v11 = "Error: NPKIDVRemoteDeviceService: Failed get CASD Certificate with error %@";
        id v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_21E92F000, v12, v13, v11, (uint8_t *)&v15, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v14 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      id v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        id v16 = v5;
        uint64_t v11 = "Notice: NPKIDVRemoteDeviceService: Finished get CASD Certificate: %@";
        id v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_8;
      }
LABEL_9:
    }
  }
  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5);
}

- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    BOOL v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVRemoteDeviceNotificationType(a3);
      int v15 = (char *)objc_claimAutoreleasedReturnValue();
      NSStringFromNPKIDVRemoteDeviceDocumentType(a4);
      id v16 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      unint64_t v31 = v15;
      __int16 v32 = 2112;
      id v33 = v16;
      __int16 v34 = 2112;
      uint64_t v35 = (uint64_t)v10;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested add notification type:%@ document type:%@ issuerName:%@", buf, 0x20u);
    }
  }
  if (a3 != 4 && !v10)
  {
    uint64_t v17 = pk_General_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v18)
    {
      id v19 = pk_General_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = NSStringFromNPKIDVRemoteDeviceNotificationType(a3);
        *(_DWORD *)buf = 136446978;
        unint64_t v31 = "-[NPKIDVRemoteDeviceSession addNotificationWithType:documentType:issuerName:completion:]";
        __int16 v32 = 2082;
        id v33 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/CoreIDV Connection/Host Process "
              "Classes/NPKIDVRemoteDeviceSession.m";
        __int16 v34 = 2048;
        uint64_t v35 = 612;
        __int16 v36 = 2112;
        v37 = v20;
        _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Can't have nil issue name for notification type:%@)", buf, 0x2Au);
      }
    }
    _NPKAssertAbort();
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __88__NPKIDVRemoteDeviceSession_addNotificationWithType_documentType_issuerName_completion___block_invoke;
  v27[3] = &unk_2644D2AA0;
  unint64_t v29 = a3;
  id v21 = v11;
  id v28 = v21;
  uint64_t v22 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v27];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__NPKIDVRemoteDeviceSession_addNotificationWithType_documentType_issuerName_completion___block_invoke_93;
  v24[3] = &unk_2644D59B8;
  id v25 = v21;
  unint64_t v26 = a3;
  void v24[4] = self;
  id v23 = v21;
  [v22 addNotificationWithType:a3 documentType:a4 issuerName:v10 completion:v24];
}

void __88__NPKIDVRemoteDeviceSession_addNotificationWithType_documentType_issuerName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = NSStringFromNPKIDVRemoteDeviceNotificationType(*(void *)(a1 + 40));
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error Requesting add notification type:%@ error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  BOOL v9 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

void __88__NPKIDVRemoteDeviceSession_addNotificationWithType_documentType_issuerName_completion___block_invoke_93(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v7 = pk_Payment_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    uint64_t v8 = NSStringFromNPKIDVRemoteDeviceNotificationType(*(void *)(a1 + 48));
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v3;
    BOOL v9 = "Error: NPKIDVRemoteDeviceService: Fail Requesting add notification type:%@ error:%@";
    int v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_8;
  }
  BOOL v13 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v7 = pk_Payment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSStringFromNPKIDVRemoteDeviceNotificationType(*(void *)(a1 + 48));
    int v15 = 138412290;
    id v16 = v8;
    BOOL v9 = "Notice: NPKIDVRemoteDeviceService: Finish Requesting add notification type:%@";
    int v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 12;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v10, v11, v9, (uint8_t *)&v15, v12);
  }
LABEL_9:

LABEL_10:
  uint64_t v14 = *(void *)(a1 + 40);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  }
}

- (void)updateProofingConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    int v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Session - Requested to update proofing configuration: %@", buf, 0xCu);
    }
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __68__NPKIDVRemoteDeviceSession_updateProofingConfiguration_completion___block_invoke;
  v19[3] = &unk_2644D2B90;
  id v11 = v7;
  id v20 = v11;
  uint32_t v12 = [(NPKIDVRemoteDeviceSession *)self _remoteObjectProxyWithFailureHandler:v19];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__NPKIDVRemoteDeviceSession_updateProofingConfiguration_completion___block_invoke_94;
  v15[3] = &unk_2644D58A0;
  __int16 v17 = self;
  id v18 = v11;
  id v16 = v6;
  id v13 = v11;
  id v14 = v6;
  [v12 updateProofingConfiguration:v14 completion:v15];
}

void __68__NPKIDVRemoteDeviceSession_updateProofingConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error requesting to update proofing configuration. Error:%@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void __68__NPKIDVRemoteDeviceSession_updateProofingConfiguration_completion___block_invoke_94(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = v4;
  if (v3)
  {
    BOOL v6 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v7 = pk_Payment_log();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    int v14 = 138412290;
    id v15 = v3;
    uint64_t v8 = "Error: NPKIDVRemoteDeviceService: Session - Failed to update proofing configuration. Error: %@";
    int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    goto LABEL_8;
  }
  BOOL v11 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (!v11) {
    goto LABEL_10;
  }
  uint64_t v7 = pk_Payment_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint32_t v12 = *(void **)(a1 + 32);
    int v14 = 138412290;
    id v15 = v12;
    uint64_t v8 = "Notice: NPKIDVRemoteDeviceService: Session - Finished updating proofing configuration: %@";
    int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
    _os_log_impl(&dword_21E92F000, v9, v10, v8, (uint8_t *)&v14, 0xCu);
  }
LABEL_9:

LABEL_10:
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v3);
  }
}

- (unint64_t)status
{
  p_sessionStatusLock = &self->_sessionStatusLock;
  os_unfair_lock_lock(&self->_sessionStatusLock);
  unint64_t status = self->_status;
  os_unfair_lock_unlock(p_sessionStatusLock);
  return status;
}

- (void)setStatus:(unint64_t)a3
{
  p_sessionStatusLock = &self->_sessionStatusLock;
  os_unfair_lock_lock(&self->_sessionStatusLock);
  self->_unint64_t status = a3;
  os_unfair_lock_unlock(p_sessionStatusLock);
}

- (void)invalidateSession
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Invalidating session:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(NPKIDVRemoteDeviceSession *)self setStatus:1];
  remoteService = self->_remoteService;
  self->_remoteService = 0;
}

- (id)_remoteObjectProxyWithFailureHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  if ([(NPKIDVRemoteDeviceSession *)self status]
    || (remoteService = self->_remoteService,
        [(NPKIDVRemoteDeviceSession *)self _errorHandlerWithCompletion:v4],
        BOOL v11 = objc_claimAutoreleasedReturnValue(),
        [(PKXPCService *)remoteService remoteObjectProxyWithErrorHandler:v11],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v9))
  {
    BOOL v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

    if (v6)
    {
      int v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to obtain remote proxy object", v13, 2u);
      }
    }
    [(NPKIDVRemoteDeviceSession *)self invalidateSession];
    if (v4)
    {
      uint64_t v8 = NPKIDVRemoteDeviceSessionError(-1001, 0);
      v4[2](v4, v8);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__NPKIDVRemoteDeviceSession__errorHandlerWithCompletion___block_invoke;
  v13[3] = &unk_2644D2AC8;
  void v13[4] = self;
  id v14 = v4;
  id v5 = v4;
  BOOL v6 = (void *)MEMORY[0x223C37380](v13);
  BOOL v11 = (void *)MEMORY[0x223C37380](v6, v7, v8, v9, v10);

  return v11;
}

void __57__NPKIDVRemoteDeviceSession__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error on connection: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [*(id *)(a1 + 32) invalidateSession];
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)remoteService:(id)a3 didEstablishConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412802;
      uint32_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, remote service:%@ did establish connection:%@", (uint8_t *)&v11, 0x20u);
    }
  }
}

- (void)remoteService:(id)a3 didInterruptConnection:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412802;
      uint32_t v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@, remote service:%@ did interrupt connection:%@", (uint8_t *)&v11, 0x20u);
    }
  }
  [(NPKIDVRemoteDeviceSession *)self invalidateSession];
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_status) {
    BOOL v5 = @"NPKIDVRemoteDeviceSessionStatusInvalidated";
  }
  else {
    BOOL v5 = @"NPKIDVRemoteDeviceSessionStatusReady";
  }
  return (NSString *)[v3 stringWithFormat:@"<%@:%p> RemoteDeviceID:%@ status:%@", v4, self, self->_deviceID, v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end