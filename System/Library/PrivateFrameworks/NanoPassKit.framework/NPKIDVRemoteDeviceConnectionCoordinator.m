@interface NPKIDVRemoteDeviceConnectionCoordinator
- (NPKIDVRemoteDeviceConnectionCoordinator)init;
- (id)_outstandingRequestItemWithCompletion:(id)a3 errorHandler:(id)a4;
- (id)_safeQueue_outstandingRequestItemForIDSProtobuf:(id)a3;
- (id)_safeQueue_outstandingRequestItemForIDSProtobuf:(id)a3 remove:(BOOL)a4;
- (id)_safeQueue_outstandingRequestItemWithMessageIdentifier:(id)a3 remove:(BOOL)a4;
- (void)_inQueue_teardownCurrentRemoteDeviceConnection;
- (void)_safeQueue_resetCleanupTimerForOutstandingRequestItemWithMessageIdentifier:(id)a3;
- (void)_sendEstablishPrearmTrustRequest:(id)a3 item:(id)a4;
- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 priority:(int64_t)a5 queueIdentifier:(id)a6 requestItem:(id)a7;
- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 priority:(int64_t)a5 queueIdentifier:(id)a6 requestItem:(id)a7 timeout:(double)a8;
- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 queueIdentifier:(id)a5 requestItem:(id)a6;
- (void)addNotificationResponse:(id)a3;
- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6;
- (void)addObserver:(id)a3;
- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5;
- (void)createCredentialResponse:(id)a3;
- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4;
- (void)deleteCredential:(id)a3 withConfiguredPartitions:(id)a4 completion:(id)a5;
- (void)deleteCredentialResponse:(id)a3;
- (void)deleteGlobalAuthACLResponse:(id)a3;
- (void)deleteGlobalAuthACLWithCompletion:(id)a3;
- (void)establishPrearmTrustResponse:(id)a3;
- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4;
- (void)establishPrearmTrustV2Response:(id)a3;
- (void)fetchPartitionsCredentialIdentifiersResponse:(id)a3;
- (void)fetchPropertiesOfCredentialResponse:(id)a3;
- (void)generateCredentialSigningKeyResponse:(id)a3;
- (void)generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 withConfiguredPartitions:(id)a5 completion:(id)a6;
- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 withConfiguredPartitions:(id)a5 completion:(id)a6;
- (void)generatePresentmentKeysForCredentialResponse:(id)a3;
- (void)getCASDCertificateResponse:(id)a3;
- (void)getCASDCertificateWithCompletion:(id)a3;
- (void)handleHeartbeats:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)handlePrearmStatusUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)nonceForAuthorizationTokenResponse:(id)a3;
- (void)nonceForAuthorizationTokenWithCompletion:(id)a3;
- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4;
- (void)prearmCredentialWithAuthorizationTokenResponse:(id)a3;
- (void)propertiesOfCredential:(id)a3 withConfiguredPartitions:(id)a4 completion:(id)a5;
- (void)provisionCredentialResponse:(id)a3;
- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8;
- (void)removeObserver:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)startCurrentRemoteDeviceConnection;
- (void)teardownCurrentRemoteDeviceConnection;
- (void)updatePrearmStatus;
- (void)updateProofingConfiguration:(id)a3 completion:(id)a4;
- (void)updateProofingConfigurationResponse:(id)a3;
@end

@implementation NPKIDVRemoteDeviceConnectionCoordinator

- (NPKIDVRemoteDeviceConnectionCoordinator)init
{
  v12.receiver = self;
  v12.super_class = (Class)NPKIDVRemoteDeviceConnectionCoordinator;
  v2 = [(NPKIDVRemoteDeviceConnectionCoordinator *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.NanoPassKit.remoteDeviceConnection.IDSMessages", 0);
    IDSMessagesQueue = v2->_IDSMessagesQueue;
    v2->_IDSMessagesQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.NanoPassKit.remoteDeviceConnection.observer", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    outstandingRequestItems = v2->_outstandingRequestItems;
    v2->_outstandingRequestItems = v7;

    uint64_t v9 = objc_msgSend(MEMORY[0x263F088B0], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;
  }
  return v2;
}

- (void)startCurrentRemoteDeviceConnection
{
  IDSMessagesQueue = self->_IDSMessagesQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_startCurrentRemoteDeviceConnection__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(IDSMessagesQueue, block);
}

void __77__NPKIDVRemoteDeviceConnectionCoordinator_startCurrentRemoteDeviceConnection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will Start new IDV Remote Device IDS service", (uint8_t *)&v13, 2u);
    }
  }
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    dispatch_queue_t v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(*(void *)(a1 + 32) + 8);
        int v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: We currently have an existing IDS service:%@ we will teardown it first", (uint8_t *)&v13, 0xCu);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_inQueue_teardownCurrentRemoteDeviceConnection");
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.applepay.identitycredential"];
  [v9 setProtobufAction:sel_createCredentialResponse_ forIncomingResponsesOfType:1];
  [v9 setProtobufAction:sel_generateCredentialSigningKeyResponse_ forIncomingResponsesOfType:4];
  [v9 setProtobufAction:sel_generatePresentmentKeysForCredentialResponse_ forIncomingResponsesOfType:14];
  [v9 setProtobufAction:sel_deleteCredentialResponse_ forIncomingResponsesOfType:3];
  [v9 setProtobufAction:sel_fetchPropertiesOfCredentialResponse_ forIncomingResponsesOfType:2];
  [v9 setProtobufAction:sel_fetchPartitionsCredentialIdentifiersResponse_ forIncomingResponsesOfType:5];
  [v9 setProtobufAction:sel_nonceForAuthorizationTokenResponse_ forIncomingResponsesOfType:6];
  [v9 setProtobufAction:sel_prearmCredentialWithAuthorizationTokenResponse_ forIncomingResponsesOfType:7];
  [v9 setProtobufAction:sel_provisionCredentialResponse_ forIncomingResponsesOfType:12];
  [v9 setProtobufAction:sel_handlePrearmStatusUpdate_service_account_fromID_context_ forIncomingRequestsOfType:8];
  [v9 setProtobufAction:sel_establishPrearmTrustResponse_ forIncomingResponsesOfType:9];
  [v9 setProtobufAction:sel_establishPrearmTrustV2Response_ forIncomingResponsesOfType:16];
  [v9 setProtobufAction:sel_deleteGlobalAuthACLResponse_ forIncomingResponsesOfType:11];
  [v9 setProtobufAction:sel_getCASDCertificateResponse_ forIncomingResponsesOfType:15];
  [v9 setProtobufAction:sel_addNotificationResponse_ forIncomingResponsesOfType:13];
  [v9 setProtobufAction:sel_updateProofingConfigurationResponse_ forIncomingResponsesOfType:17];
  [v9 setProtobufAction:sel_handleHeartbeats_service_account_fromID_context_ forIncomingRequestsOfType:0xFFFFLL];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v9);
  [v9 addDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 16)];
  v10 = pk_Payment_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    objc_super v12 = pk_Payment_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did Start IDV Remote Device IDS service:%@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)teardownCurrentRemoteDeviceConnection
{
  IDSMessagesQueue = self->_IDSMessagesQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__NPKIDVRemoteDeviceConnectionCoordinator_teardownCurrentRemoteDeviceConnection__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_sync(IDSMessagesQueue, block);
}

uint64_t __80__NPKIDVRemoteDeviceConnectionCoordinator_teardownCurrentRemoteDeviceConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inQueue_teardownCurrentRemoteDeviceConnection");
}

- (void)_inQueue_teardownCurrentRemoteDeviceConnection
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_IDSMessagesQueue);
  if ([(NSMutableDictionary *)self->_outstandingRequestItems count])
  {
    BOOL v3 = pk_Payment_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      dispatch_queue_t v5 = pk_Payment_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        outstandingRequestItems = self->_outstandingRequestItems;
        int v15 = 138412290;
        v16 = outstandingRequestItems;
        _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: outstandingRequestItems is not empty:%@. expected to timeout eventually.", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      remoteDeviceIDSService = self->_remoteDeviceIDSService;
      int v15 = 138412290;
      v16 = remoteDeviceIDSService;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Will teardownIDV Remote Device IDS service:%@", (uint8_t *)&v15, 0xCu);
    }
  }
  [self->_remoteDeviceIDSService removeDelegate:self];
  BOOL v11 = self->_remoteDeviceIDSService;
  self->_remoteDeviceIDSService = 0;

  objc_super v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did teardownIDV Remote Device IDS service", (uint8_t *)&v15, 2u);
    }
  }
}

- (void)createCredentialResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_queue_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      v19 = "-[NPKIDVRemoteDeviceConnectionCoordinator createCredentialResponse:]";
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v18, 0x16u);
    }
  }
  BOOL v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    v10 = [NPKIDVRemoteDeviceProtoCreateCredentialResponse alloc];
    BOOL v11 = [v4 data];
    objc_super v12 = [(NPKIDVRemoteDeviceProtoCreateCredentialResponse *)v10 initWithData:v11];

    BOOL v13 = [(NPKIDVRemoteDeviceProtoCreateCredentialResponse *)v12 errorData];
    v14 = objc_opt_class();
    int v15 = NPKSecureUnarchiveObject(v13, v14);

    v16 = [v8 completion];
    uint64_t v17 = [(NPKIDVRemoteDeviceProtoCreateCredentialResponse *)v12 credentialIdentifier];
    ((void (**)(void, void *, void *))v16)[2](v16, v17, v15);
  }
}

- (void)createCredentialInPartition:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    BOOL v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[NPKIDVRemoteDeviceConnectionCoordinator createCredentialInPartition:options:completion:]";
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  v14 = objc_alloc_init(NPKIDVRemoteDeviceProtoCreateCredentialRequest);
  [(NPKIDVRemoteDeviceProtoCreateCredentialRequest *)v14 setPartitionIdentifier:v10];

  int v15 = NPKSecureArchiveObject(v9);

  [(NPKIDVRemoteDeviceProtoCreateCredentialRequest *)v14 setCredentialOptionsData:v15];
  v16 = (void *)MEMORY[0x223C37380](v8);
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __90__NPKIDVRemoteDeviceConnectionCoordinator_createCredentialInPartition_options_completion___block_invoke;
  v26 = &unk_2644D2B90;
  id v27 = v8;
  id v17 = v8;
  int v18 = (void *)MEMORY[0x223C37380](&v23);
  v19 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v16 errorHandler:v18];

  __int16 v20 = NSString;
  id v21 = [MEMORY[0x263F08C38] UUID];
  uint64_t v22 = [v20 stringWithFormat:@"CreateCredential-%@", v21, v23, v24, v25, v26];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v14 withType:1 queueIdentifier:v22 requestItem:v19];
}

void __90__NPKIDVRemoteDeviceConnectionCoordinator_createCredentialInPartition_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while creating credential:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generateCredentialSigningKeyResponse:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315394;
      id v21 = "-[NPKIDVRemoteDeviceConnectionCoordinator generateCredentialSigningKeyResponse:]";
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v20, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    id v10 = [NPKIDVRemoteDeviceProtoGenerateKeyResponse alloc];
    BOOL v11 = [v4 data];
    BOOL v12 = [(NPKIDVRemoteDeviceProtoGenerateKeyResponse *)v10 initWithData:v11];

    BOOL v13 = [(NPKIDVRemoteDeviceProtoGenerateKeyResponse *)v12 signingKeyData];
    getDCCredentialCryptoKeyClass();
    v14 = objc_opt_class();
    int v15 = NPKSecureUnarchiveObject(v13, v14);

    v16 = [(NPKIDVRemoteDeviceProtoGenerateKeyResponse *)v12 errorData];
    id v17 = objc_opt_class();
    int v18 = NPKSecureUnarchiveObject(v16, v17);

    v19 = [v8 completion];
    ((void (**)(void, void *, void *))v19)[2](v19, v15, v18);
  }
}

- (void)generateKeyWithType:(unint64_t)a3 credentialIdentifier:(id)a4 withConfiguredPartitions:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  BOOL v13 = pk_Payment_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    int v15 = pk_Payment_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[NPKIDVRemoteDeviceConnectionCoordinator generateKeyWithType:credentialIdentifier:withConfiguredPartitions:completion:]";
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  v16 = objc_alloc_init(NPKIDVRemoteDeviceProtoGenerateKeyRequest);
  [(NPKIDVRemoteDeviceProtoGenerateKeyRequest *)v16 setCredentialIdentifier:v12];
  id v17 = NSStringFromNPKIDVRemoteDeviceCredentialStorageKeyType(a3);
  [(NPKIDVRemoteDeviceProtoGenerateKeyRequest *)v16 setKeyTypeString:v17];

  int v18 = [v11 allObjects];

  v19 = (void *)[v18 mutableCopy];
  [(NPKIDVRemoteDeviceProtoGenerateKeyRequest *)v16 setConfiguredPartitionsIdentifiers:v19];

  int v20 = (void *)MEMORY[0x223C37380](v10);
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  id v27 = __120__NPKIDVRemoteDeviceConnectionCoordinator_generateKeyWithType_credentialIdentifier_withConfiguredPartitions_completion___block_invoke;
  v28 = &unk_2644D2B90;
  id v29 = v10;
  id v21 = v10;
  __int16 v22 = (void *)MEMORY[0x223C37380](&v25);
  id v23 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v20 errorHandler:v22];

  uint64_t v24 = [NSString stringWithFormat:@"GenerateCredentialKey-%@", v12, v25, v26, v27, v28];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v16 withType:4 queueIdentifier:v24 requestItem:v23];
}

void __120__NPKIDVRemoteDeviceConnectionCoordinator_generateKeyWithType_credentialIdentifier_withConfiguredPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while Generating signing key:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generatePresentmentKeysForCredentialResponse:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[NPKIDVRemoteDeviceConnectionCoordinator generatePresentmentKeysForCredentialResponse:]";
      __int16 v35 = 2112;
      id v36 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", buf, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    id v10 = [NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse alloc];
    id v11 = [v4 data];
    id v12 = [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse *)v10 initWithData:v11];

    id v13 = objc_alloc(MEMORY[0x263EFF980]);
    BOOL v14 = [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse *)v12 presentmentKeysDatas];
    int v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v16 = [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse *)v12 presentmentKeysDatas];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v28 + 1) + 8 * v20);
          getDCCredentialCryptoKeyClass();
          __int16 v22 = objc_opt_class();
          id v23 = NPKSecureUnarchiveObject(v21, v22);
          [v15 safelyAddObject:v23];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v18);
    }

    uint64_t v24 = [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysResponse *)v12 errorData];
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = NPKSecureUnarchiveObject(v24, v25);

    id v27 = [v8 completion];
    ((void (**)(void, void *, void *))v27)[2](v27, v15, v26);
  }
}

- (void)generatePresentmentKeysForCredential:(id)a3 numKeys:(int64_t)a4 withConfiguredPartitions:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = NPKPairedOrPairingDevice();
  BOOL v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E63BF630-F388-4DCC-B73A-40EFB659A4C2"];
  char v15 = [v13 supportsCapability:v14];

  if (a4 == 1 || (v15 & 1) == 0)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __124__NPKIDVRemoteDeviceConnectionCoordinator_generatePresentmentKeysForCredential_numKeys_withConfiguredPartitions_completion___block_invoke;
    v30[3] = &unk_2644D3138;
    id v31 = v10;
    v16 = (NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)v10;
    uint64_t v24 = (void *)MEMORY[0x223C37380](v30);
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self generateKeyWithType:3 credentialIdentifier:v12 withConfiguredPartitions:v11 completion:v24];

    id v20 = v31;
  }
  else
  {
    v16 = objc_alloc_init(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest);
    [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)v16 setCredentialIdentifier:v12];

    uint64_t v17 = [v11 allObjects];

    uint64_t v18 = (void *)[v17 mutableCopy];
    [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)v16 setConfiguredPartitionsIdentifiers:v18];

    [(NPKIDVRemoteDeviceProtoGeneratePresentmentKeysRequest *)v16 setNumKeys:a4];
    uint64_t v19 = (void *)MEMORY[0x223C37380](v10);
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    id v27 = __124__NPKIDVRemoteDeviceConnectionCoordinator_generatePresentmentKeysForCredential_numKeys_withConfiguredPartitions_completion___block_invoke_2;
    long long v28 = &unk_2644D2B90;
    id v29 = v10;
    id v20 = v10;
    id v21 = (void *)MEMORY[0x223C37380](&v25);
    __int16 v22 = -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v19, v21, v25, v26, v27, v28);

    id v23 = [NSString stringWithFormat:@"GenerateCredentialKey-PresentmentKeys"];
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v16 withType:14 queueIdentifier:v23 requestItem:v22];
  }
}

void __124__NPKIDVRemoteDeviceConnectionCoordinator_generatePresentmentKeysForCredential_numKeys_withConfiguredPartitions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 32);
  v9[0] = a2;
  BOOL v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 arrayWithObjects:v9 count:1];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v8, v6);
}

void __124__NPKIDVRemoteDeviceConnectionCoordinator_generatePresentmentKeysForCredential_numKeys_withConfiguredPartitions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while generating presentment keys:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteCredentialResponse:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      uint64_t v18 = "-[NPKIDVRemoteDeviceConnectionCoordinator deleteCredentialResponse:]";
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v17, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    id v10 = [NPKIDVRemoteDeviceProtoDeleteCredentialResponse alloc];
    id v11 = [v4 data];
    id v12 = [(NPKIDVRemoteDeviceProtoDeleteCredentialResponse *)v10 initWithData:v11];

    id v13 = [(NPKIDVRemoteDeviceProtoDeleteCredentialResponse *)v12 errorData];
    BOOL v14 = objc_opt_class();
    char v15 = NPKSecureUnarchiveObject(v13, v14);

    v16 = [v8 completion];
    ((void (**)(void, void *))v16)[2](v16, v15);
  }
}

- (void)deleteCredential:(id)a3 withConfiguredPartitions:(id)a4 completion:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v28 = "-[NPKIDVRemoteDeviceConnectionCoordinator deleteCredential:withConfiguredPartitions:completion:]";
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  BOOL v14 = objc_alloc_init(NPKIDVRemoteDeviceProtoDeleteCredentialRequest);
  [(NPKIDVRemoteDeviceProtoDeleteCredentialRequest *)v14 setCredentialIdentifier:v10];
  char v15 = [v9 allObjects];

  v16 = (void *)[v15 mutableCopy];
  [(NPKIDVRemoteDeviceProtoDeleteCredentialRequest *)v14 setConfiguredPartitionsIdentifiers:v16];

  int v17 = (void *)MEMORY[0x223C37380](v8);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __96__NPKIDVRemoteDeviceConnectionCoordinator_deleteCredential_withConfiguredPartitions_completion___block_invoke;
  uint64_t v25 = &unk_2644D2B90;
  id v26 = v8;
  id v18 = v8;
  __int16 v19 = (void *)MEMORY[0x223C37380](&v22);
  id v20 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v17 errorHandler:v19];

  uint64_t v21 = [NSString stringWithFormat:@"DeleteCredential-%@", v10, v22, v23, v24, v25];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v14 withType:3 queueIdentifier:v21 requestItem:v20];
}

void __96__NPKIDVRemoteDeviceConnectionCoordinator_deleteCredential_withConfiguredPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while deleting credential:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPropertiesOfCredentialResponse:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[NPKIDVRemoteDeviceConnectionCoordinator fetchPropertiesOfCredentialResponse:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", buf, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    id v11 = [NPKIDVRemoteDeviceProtoCredentialPropertiesResponse alloc];
    BOOL v12 = [v4 data];
    id v13 = [(NPKIDVRemoteDeviceProtoCredentialPropertiesResponse *)v11 initWithData:v12];

    BOOL v14 = [(NPKIDVRemoteDeviceProtoCredentialPropertiesResponse *)v13 credentialPropertiesData];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2050000000;
    char v15 = (void *)getDCCredentialPropertiesClass_softClass;
    uint64_t v26 = getDCCredentialPropertiesClass_softClass;
    if (!getDCCredentialPropertiesClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getDCCredentialPropertiesClass_block_invoke;
      long long v28 = &unk_2644D30F8;
      uint64_t v29 = &v23;
      __getDCCredentialPropertiesClass_block_invoke((uint64_t)buf);
      char v15 = (void *)v24[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v23, 8);
    int v17 = objc_opt_class();
    id v18 = NPKSecureUnarchiveObject(v14, v17);

    __int16 v19 = [(NPKIDVRemoteDeviceProtoCredentialPropertiesResponse *)v13 errorData];
    id v20 = objc_opt_class();
    uint64_t v21 = NPKSecureUnarchiveObject(v19, v20);

    uint64_t v22 = [v8 completion];
    ((void (**)(void, void *, void *))v22)[2](v22, v18, v21);
  }
}

- (void)propertiesOfCredential:(id)a3 withConfiguredPartitions:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = pk_Payment_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v30 = "-[NPKIDVRemoteDeviceConnectionCoordinator propertiesOfCredential:withConfiguredPartitions:completion:]";
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  BOOL v14 = objc_alloc_init(NPKIDVRemoteDeviceProtoCredentialPropertiesRequest);
  [(NPKIDVRemoteDeviceProtoCredentialPropertiesRequest *)v14 setCredentialIdentifier:v10];

  char v15 = [v9 allObjects];

  id v16 = (void *)[v15 mutableCopy];
  [(NPKIDVRemoteDeviceProtoCredentialPropertiesRequest *)v14 setConfiguredPartitionsIdentifiers:v16];

  int v17 = (void *)MEMORY[0x223C37380](v8);
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __102__NPKIDVRemoteDeviceConnectionCoordinator_propertiesOfCredential_withConfiguredPartitions_completion___block_invoke;
  id v27 = &unk_2644D2B90;
  id v28 = v8;
  id v18 = v8;
  __int16 v19 = (void *)MEMORY[0x223C37380](&v24);
  id v20 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v17 errorHandler:v19];

  uint64_t v21 = NSString;
  uint64_t v22 = [MEMORY[0x263F08C38] UUID];
  uint64_t v23 = [v21 stringWithFormat:@"CredentialProperties-%@", v22, v24, v25, v26, v27];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v14 withType:2 queueIdentifier:v23 requestItem:v20];
}

void __102__NPKIDVRemoteDeviceConnectionCoordinator_propertiesOfCredential_withConfiguredPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while fetching credential properties:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPartitionsCredentialIdentifiersResponse:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315394;
      uint64_t v21 = "-[NPKIDVRemoteDeviceConnectionCoordinator fetchPartitionsCredentialIdentifiersResponse:]";
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v20, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    id v10 = [NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse alloc];
    id v11 = [v4 data];
    BOOL v12 = [(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse *)v10 initWithData:v11];

    id v13 = [(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse *)v12 partitionsCredentialIdentifiersData];
    BOOL v14 = objc_opt_class();
    char v15 = NPKSecureUnarchiveObject(v13, v14);

    id v16 = [(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersResponse *)v12 errorData];
    int v17 = objc_opt_class();
    id v18 = NPKSecureUnarchiveObject(v16, v17);

    __int16 v19 = [v8 completion];
    ((void (**)(void, void *, void *))v19)[2](v19, v15, v18);
  }
}

- (void)credentialIdentifiersInPartitions:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v26 = "-[NPKIDVRemoteDeviceConnectionCoordinator credentialIdentifiersInPartitions:completion:]";
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  id v11 = objc_alloc_init(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest);
  BOOL v12 = (void *)[v7 mutableCopy];

  [(NPKIDVRemoteDeviceProtoPartitionsCredentialIdentifiersRequest *)v11 setPartitionsIdentifiers:v12];
  id v13 = (void *)MEMORY[0x223C37380](v6);
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  __int16 v22 = __88__NPKIDVRemoteDeviceConnectionCoordinator_credentialIdentifiersInPartitions_completion___block_invoke;
  id v23 = &unk_2644D2B90;
  id v24 = v6;
  id v14 = v6;
  char v15 = (void *)MEMORY[0x223C37380](&v20);
  id v16 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v13 errorHandler:v15];

  int v17 = NSString;
  id v18 = [MEMORY[0x263F08C38] UUID];
  __int16 v19 = [v17 stringWithFormat:@"partitionsCredentialsIdentifiers-%@", v18, v20, v21, v22, v23];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v11 withType:5 queueIdentifier:v19 requestItem:v16];
}

void __88__NPKIDVRemoteDeviceConnectionCoordinator_credentialIdentifiersInPartitions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while fetching partition's credential identifiers:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)provisionCredentialResponse:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315394;
      uint64_t v21 = "-[NPKIDVRemoteDeviceConnectionCoordinator provisionCredentialResponse:]";
      __int16 v22 = 2112;
      id v23 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v20, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    id v10 = [NPKIDVRemoteDeviceProtoProvisionCredentialResponse alloc];
    id v11 = [v4 data];
    BOOL v12 = [(NPKIDVRemoteDeviceProtoProvisionCredentialResponse *)v10 initWithData:v11];

    if ([(NPKIDVRemoteDeviceProtoProvisionCredentialResponse *)v12 hasSecureElementPassData])
    {
      id v13 = [(NPKIDVRemoteDeviceProtoProvisionCredentialResponse *)v12 secureElementPassData];
      id v14 = objc_opt_class();
      char v15 = NPKSecureUnarchiveObject(v13, v14);
    }
    else
    {
      char v15 = 0;
    }
    if ([(NPKIDVRemoteDeviceProtoProvisionCredentialResponse *)v12 hasErrorData])
    {
      id v16 = [(NPKIDVRemoteDeviceProtoProvisionCredentialResponse *)v12 errorData];
      int v17 = objc_opt_class();
      id v18 = NPKSecureUnarchiveObject(v16, v17);
    }
    else
    {
      id v18 = 0;
    }
    __int16 v19 = [v8 completion];
    ((void (**)(void, void *, void *))v19)[2](v19, v15, v18);
  }
}

- (void)provisionCredentialWithType:(unint64_t)a3 metadata:(id)a4 credentialIdentifier:(id)a5 attestations:(id)a6 supplementalData:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  __int16 v19 = objc_alloc_init(NPKIDVRemoteDeviceProtoProvisionCredentialRequest);
  int v20 = v19;
  if (!a3)
  {
    uint64_t v21 = 0;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v21 = 1;
LABEL_5:
    [(NPKIDVRemoteDeviceProtoProvisionCredentialRequest *)v19 setCredentialType:v21];
  }
  __int16 v22 = NPKSecureArchiveObject(v14);
  [(NPKIDVRemoteDeviceProtoProvisionCredentialRequest *)v20 setMetadataData:v22];

  [(NPKIDVRemoteDeviceProtoProvisionCredentialRequest *)v20 setCredentialIdentifier:v15];
  id v23 = NPKSecureArchiveObject(v18);

  [(NPKIDVRemoteDeviceProtoProvisionCredentialRequest *)v20 setAttestationsData:v23];
  [(NPKIDVRemoteDeviceProtoProvisionCredentialRequest *)v20 setSupplementalData:v17];

  uint64_t v24 = (void *)MEMORY[0x223C37380](v16);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __142__NPKIDVRemoteDeviceConnectionCoordinator_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke;
  v32[3] = &unk_2644D2AC8;
  id v33 = v15;
  id v34 = v16;
  id v25 = v16;
  id v26 = v15;
  uint64_t v27 = (void *)MEMORY[0x223C37380](v32);
  id v28 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v24 errorHandler:v27];

  uint64_t v29 = NSString;
  uint64_t v30 = [MEMORY[0x263F08C38] UUID];
  uint64_t v31 = [v29 stringWithFormat:@"credentialProvisioning-%@", v30];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v20 withType:12 queueIdentifier:v31 requestItem:v28];
}

void __142__NPKIDVRemoteDeviceConnectionCoordinator_provisionCredentialWithType_metadata_credentialIdentifier_attestations_supplementalData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while provisioning credential with identifier:%@ error:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)nonceForAuthorizationTokenResponse:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[NPKIDVRemoteDeviceConnectionCoordinator nonceForAuthorizationTokenResponse:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", buf, 0x16u);
    }
  }
  int v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    id v11 = [NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse alloc];
    uint64_t v12 = [v4 data];
    id v13 = [(NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse *)v11 initWithData:v12];

    id v14 = [(NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse *)v13 nonceData];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2050000000;
    id v15 = (void *)getDCCredentialNonceClass_softClass;
    uint64_t v26 = getDCCredentialNonceClass_softClass;
    if (!getDCCredentialNonceClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getDCCredentialNonceClass_block_invoke;
      id v28 = &unk_2644D30F8;
      uint64_t v29 = &v23;
      __getDCCredentialNonceClass_block_invoke((uint64_t)buf);
      id v15 = (void *)v24[3];
    }
    id v16 = v15;
    _Block_object_dispose(&v23, 8);
    id v17 = objc_opt_class();
    id v18 = NPKSecureUnarchiveObject(v14, v17);

    __int16 v19 = [(NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenResponse *)v13 errorData];
    int v20 = objc_opt_class();
    uint64_t v21 = NPKSecureUnarchiveObject(v19, v20);

    __int16 v22 = [v8 completion];
    ((void (**)(void, void *, void *))v22)[2](v22, v18, v21);
  }
}

- (void)nonceForAuthorizationTokenWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[NPKIDVRemoteDeviceConnectionCoordinator nonceForAuthorizationTokenWithCompletion:]";
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  int v8 = objc_alloc_init(NPKIDVRemoteDeviceProtoNonceForAuthorizationTokenRequest);
  uint64_t v9 = (void *)MEMORY[0x223C37380](v4);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __84__NPKIDVRemoteDeviceConnectionCoordinator_nonceForAuthorizationTokenWithCompletion___block_invoke;
  v13[3] = &unk_2644D2B90;
  id v14 = v4;
  id v10 = v4;
  id v11 = (void *)MEMORY[0x223C37380](v13);
  uint64_t v12 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v9 errorHandler:v11];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v8 withType:6 priority:300 queueIdentifier:@"nonceForAuthorizationToken" requestItem:v12];
}

void __84__NPKIDVRemoteDeviceConnectionCoordinator_nonceForAuthorizationTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while fetching nonce for authentication token error:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prearmCredentialWithAuthorizationTokenResponse:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      id v18 = "-[NPKIDVRemoteDeviceConnectionCoordinator prearmCredentialWithAuthorizationTokenResponse:]";
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v17, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    id v10 = [NPKIDVRemoteDeviceProtoPrearmCredentialResponse alloc];
    id v11 = [v4 data];
    uint64_t v12 = [(NPKIDVRemoteDeviceProtoPrearmCredentialResponse *)v10 initWithData:v11];

    id v13 = [(NPKIDVRemoteDeviceProtoPrearmCredentialResponse *)v12 errorData];
    id v14 = objc_opt_class();
    id v15 = NPKSecureUnarchiveObject(v13, v14);

    id v16 = [v8 completion];
    ((void (**)(void, void *))v16)[2](v16, v15);
  }
}

- (void)prearmCredentialWithAuthorizationToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(NPKIDVRemoteDeviceProtoPrearmCredentialRequest);
  uint64_t v9 = NPKSecureArchiveObject(v7);

  [(NPKIDVRemoteDeviceProtoPrearmCredentialRequest *)v8 setAuthorizationTokenData:v9];
  id v10 = (void *)MEMORY[0x223C37380](v6);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __93__NPKIDVRemoteDeviceConnectionCoordinator_prearmCredentialWithAuthorizationToken_completion___block_invoke;
  v14[3] = &unk_2644D2B90;
  id v15 = v6;
  id v11 = v6;
  uint64_t v12 = (void *)MEMORY[0x223C37380](v14);
  id v13 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v10 errorHandler:v12];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v8 withType:7 priority:300 queueIdentifier:@"prearmCredentialWithAuthorizationToken" requestItem:v13];
}

void __93__NPKIDVRemoteDeviceConnectionCoordinator_prearmCredentialWithAuthorizationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while pre-arming credential with authentication token error:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)establishPrearmTrustResponse:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      id v18 = "-[NPKIDVRemoteDeviceConnectionCoordinator establishPrearmTrustResponse:]";
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v17, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    id v10 = [NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse alloc];
    id v11 = [v4 data];
    uint64_t v12 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse *)v10 initWithData:v11];

    if ([(NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse *)v12 hasErrorData])
    {
      id v13 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustResponse *)v12 errorData];
      id v14 = objc_opt_class();
      id v15 = NPKSecureUnarchiveObject(v13, v14);
    }
    else
    {
      id v15 = 0;
    }
    id v16 = [v8 completion];
    ((void (**)(void, void *))v16)[2](v16, v15);
  }
}

- (void)establishPrearmTrustV2Response:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[NPKIDVRemoteDeviceConnectionCoordinator establishPrearmTrustV2Response:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", buf, 0x16u);
    }
  }
  id v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];
  BOOL v10 = v9 == 0;

  if (!v10)
  {
    id v11 = [NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response alloc];
    uint64_t v12 = [v4 data];
    id v13 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response *)v11 initWithData:v12];

    if ([(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response *)v13 hasErrorData])
    {
      id v14 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response *)v13 errorData];
      id v15 = objc_opt_class();
      id v16 = NPKSecureUnarchiveObject(v14, v15);
    }
    else
    {
      id v16 = 0;
    }
    int v17 = [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Response *)v13 attestationData];
    uint64_t v23 = 0;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2050000000;
    id v18 = (void *)getDCCredentialAttestationClass_softClass;
    uint64_t v26 = getDCCredentialAttestationClass_softClass;
    if (!getDCCredentialAttestationClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getDCCredentialAttestationClass_block_invoke;
      id v28 = &unk_2644D30F8;
      uint64_t v29 = &v23;
      __getDCCredentialAttestationClass_block_invoke((uint64_t)buf);
      id v18 = (void *)v24[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v23, 8);
    id v20 = objc_opt_class();
    uint64_t v21 = NPKSecureUnarchiveObject(v17, v20);

    objc_msgSend(v8, "completion", v23);
    __int16 v22 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void *, void *))v22)[2](v22, v21, v16);
  }
}

- (void)establishPrearmTrustV2:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = NPKPairedOrPairingDevice();
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"E63BF630-F388-4DCC-B73A-40EFB659A4C2"];
  int v10 = [v8 supportsCapability:v9];

  if (v10)
  {
    id v11 = (void *)MEMORY[0x223C37380](v6);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke;
    v26[3] = &unk_2644D2B90;
    uint64_t v12 = &v27;
    id v27 = v6;
    id v13 = v6;
    id v14 = (void *)MEMORY[0x223C37380](v26);
    id v15 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v11 errorHandler:v14];

    id v16 = objc_alloc_init(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request);
    int v17 = NPKSecureArchiveObject(v7);

    [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustV2Request *)v16 setTrustData:v17];
    [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v16 withType:16 queueIdentifier:@"establishPrearmTrustV2" requestItem:v15];
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke_148;
    v24[3] = &unk_2644D2B90;
    uint64_t v12 = &v25;
    id v25 = v6;
    id v18 = v6;
    id v19 = (void *)MEMORY[0x223C37380](v24);
    id v20 = (void *)MEMORY[0x223C37380]();
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke_2;
    v22[3] = &unk_2644D2B90;
    id v23 = v19;
    id v16 = v19;
    uint64_t v21 = (void *)MEMORY[0x223C37380](v22);
    id v15 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v20 errorHandler:v21];

    [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendEstablishPrearmTrustRequest:v7 item:v15];
  }
}

void __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while establishing prearm trust, error:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__NPKIDVRemoteDeviceConnectionCoordinator_establishPrearmTrustV2_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while establishing prearm trust, error:%@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendEstablishPrearmTrustRequest:(id)a3 item:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = objc_alloc_init(NPKIDVRemoteDeviceProtoEstablishPrearmTrustRequest);
  id v8 = NPKSecureArchiveObject(v7);

  [(NPKIDVRemoteDeviceProtoEstablishPrearmTrustRequest *)v9 setTrustData:v8];
  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v9 withType:9 queueIdentifier:@"establishPrearmTrust" requestItem:v6];
}

- (void)handlePrearmStatusUpdate:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = [NPKIDVRemoteDeviceProtoPrearmStatusUpdate alloc];
  int v10 = [v8 data];

  id v11 = [(NPKIDVRemoteDeviceProtoPrearmStatusUpdate *)v9 initWithData:v10];
  uint64_t v12 = [(NPKIDVRemoteDeviceProtoPrearmStatusUpdate *)v11 prearmStatus] + 1;
  if (v12 >= 4) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12 - 1;
  }
  id v14 = pk_Payment_log();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

  if (v15)
  {
    id v16 = pk_Payment_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = NSStringFromNPKIDVDeviceCredentialPrearmStatus(v13);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v17;
      _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received credential prearm status update:%@", buf, 0xCu);
    }
  }
  observerQueue = self->_observerQueue;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __99__NPKIDVRemoteDeviceConnectionCoordinator_handlePrearmStatusUpdate_service_account_fromID_context___block_invoke;
  v19[3] = &unk_2644D3160;
  v19[4] = self;
  v19[5] = v13;
  dispatch_async(observerQueue, v19);
}

void __99__NPKIDVRemoteDeviceConnectionCoordinator_handlePrearmStatusUpdate_service_account_fromID_context___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "remoteDeviceConnectionCoordinator:didReceivePrearmStatusUpdate:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)updatePrearmStatus
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      long long v8 = "-[NPKIDVRemoteDeviceConnectionCoordinator updatePrearmStatus]";
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v6 = objc_alloc_init(NPKIDVRemoteDeviceProtoUpdatePrearmStatusRequest);
  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v6 withType:18 queueIdentifier:@"updatePrearmStatus" requestItem:0];
}

- (void)deleteGlobalAuthACLResponse:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      id v18 = "-[NPKIDVRemoteDeviceConnectionCoordinator deleteGlobalAuthACLResponse:]";
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v17, 0x16u);
    }
  }
  long long v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  uint64_t v9 = [v8 completion];

  if (v9)
  {
    long long v10 = [NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLResponse alloc];
    id v11 = [v4 data];
    uint64_t v12 = [(NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLResponse *)v10 initWithData:v11];

    uint64_t v13 = [(NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLResponse *)v12 errorData];
    id v14 = objc_opt_class();
    BOOL v15 = NPKSecureUnarchiveObject(v13, v14);

    id v16 = [v8 completion];
    ((void (**)(void, void *))v16)[2](v16, v15);
  }
}

- (void)deleteGlobalAuthACLWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[NPKIDVRemoteDeviceConnectionCoordinator deleteGlobalAuthACLWithCompletion:]";
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  long long v8 = objc_alloc_init(NPKIDVRemoteDeviceProtoDeleteGlobalAuthACLRequest);
  uint64_t v9 = (void *)MEMORY[0x223C37380](v4);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__NPKIDVRemoteDeviceConnectionCoordinator_deleteGlobalAuthACLWithCompletion___block_invoke;
  v13[3] = &unk_2644D2B90;
  id v14 = v4;
  id v10 = v4;
  id v11 = (void *)MEMORY[0x223C37380](v13);
  uint64_t v12 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v9 errorHandler:v11];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v8 withType:11 queueIdentifier:@"deleteGlobalAuthACL" requestItem:v12];
}

void __77__NPKIDVRemoteDeviceConnectionCoordinator_deleteGlobalAuthACLWithCompletion___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while deleting global auth ACL error:%@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)getCASDCertificateResponse:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      id v20 = "-[NPKIDVRemoteDeviceConnectionCoordinator getCASDCertificateResponse:]";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v19, 0x16u);
    }
  }
  int v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  id v9 = [v8 completion];

  if (v9)
  {
    uint64_t v10 = [NPKIDVRemoteDeviceProtoCasdCertificateResponse alloc];
    id v11 = [v4 data];
    uint64_t v12 = [(NPKIDVRemoteDeviceProtoCasdCertificateResponse *)v10 initWithData:v11];

    uint64_t v13 = [(NPKIDVRemoteDeviceProtoCasdCertificateResponse *)v12 errorData];
    if (v13)
    {
      id v14 = [(NPKIDVRemoteDeviceProtoCasdCertificateResponse *)v12 errorData];
      BOOL v15 = objc_opt_class();
      id v16 = NPKSecureUnarchiveObject(v14, v15);
    }
    else
    {
      id v16 = 0;
    }

    uint64_t v17 = [v8 completion];
    id v18 = [(NPKIDVRemoteDeviceProtoCasdCertificateResponse *)v12 casdCertificate];
    ((void (**)(void, void *, void *))v17)[2](v17, v18, v16);
  }
}

- (void)getCASDCertificateWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(NPKIDVRemoteDeviceProtoCasdCertificateRequest);
  BOOL v6 = (void *)MEMORY[0x223C37380](v4);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__NPKIDVRemoteDeviceConnectionCoordinator_getCASDCertificateWithCompletion___block_invoke;
  v10[3] = &unk_2644D2B90;
  id v11 = v4;
  id v7 = v4;
  int v8 = (void *)MEMORY[0x223C37380](v10);
  id v9 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v6 errorHandler:v8];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v5 withType:15 queueIdentifier:@"getCASDCertificate" requestItem:v9];
}

void __76__NPKIDVRemoteDeviceConnectionCoordinator_getCASDCertificateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while retrieving CASD certificate. Error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addNotificationWithType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a5;
  uint64_t v12 = pk_Payment_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = pk_Payment_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v27 = "-[NPKIDVRemoteDeviceConnectionCoordinator addNotificationWithType:documentType:issuerName:completion:]";
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  BOOL v15 = objc_alloc_init(NPKIDVRemoteDeviceProtoNotificationRequest);
  [(NPKIDVRemoteDeviceProtoNotificationRequest *)v15 setIssuerName:v11];

  if (a3 <= 8) {
    [(NPKIDVRemoteDeviceProtoNotificationRequest *)v15 setNotificationType:a3];
  }
  if (a4 <= 2) {
    [(NPKIDVRemoteDeviceProtoNotificationRequest *)v15 setDocumentType:(a4 - 1)];
  }
  id v16 = (void *)MEMORY[0x223C37380](v10);
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __102__NPKIDVRemoteDeviceConnectionCoordinator_addNotificationWithType_documentType_issuerName_completion___block_invoke;
  uint64_t v23 = &unk_2644D2AA0;
  id v24 = v10;
  unint64_t v25 = a3;
  id v17 = v10;
  id v18 = (void *)MEMORY[0x223C37380](&v20);
  int v19 = -[NPKIDVRemoteDeviceConnectionCoordinator _outstandingRequestItemWithCompletion:errorHandler:](self, "_outstandingRequestItemWithCompletion:errorHandler:", v16, v18, v20, v21, v22, v23);

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v15 withType:13 queueIdentifier:@"addExtendedNotification" requestItem:v19];
}

void __102__NPKIDVRemoteDeviceConnectionCoordinator_addNotificationWithType_documentType_issuerName_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = pk_Payment_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_Payment_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = NSStringFromNPKIDVRemoteDeviceNotificationType(*(void *)(a1 + 40));
      int v9 = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while adding notification type:%@ error:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)addNotificationResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    int v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      int v19 = "-[NPKIDVRemoteDeviceConnectionCoordinator addNotificationResponse:]";
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  int v9 = [v8 completion];

  if (v9)
  {
    id v10 = [NPKIDVRemoteDeviceProtoNotificationResponse alloc];
    __int16 v11 = [v4 data];
    id v12 = [(NPKIDVRemoteDeviceProtoNotificationResponse *)v10 initWithData:v11];

    uint64_t v13 = [(NPKIDVRemoteDeviceProtoNotificationResponse *)v12 errorData];
    if (v13)
    {
      id v14 = [(NPKIDVRemoteDeviceProtoNotificationResponse *)v12 errorData];
      BOOL v15 = objc_opt_class();
      id v16 = NPKSecureUnarchiveObject(v14, v15);
    }
    else
    {
      id v16 = 0;
    }

    id v17 = [v8 completion];
    ((void (**)(void, void *))v17)[2](v17, v16);
  }
}

- (void)updateProofingConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v28 = "-[NPKIDVRemoteDeviceConnectionCoordinator updateProofingConfiguration:completion:]";
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s", buf, 0xCu);
    }
  }
  __int16 v11 = objc_alloc_init(NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest);
  id v12 = v11;
  if (v6)
  {
    uint64_t v13 = NPKSecureArchiveObject(v6);
    [(NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest *)v12 setConfigurationData:v13];
  }
  else
  {
    [(NPKIDVRemoteDeviceProtoUpdateProofingConfigurationRequest *)v11 setConfigurationData:0];
  }
  id v14 = (void *)MEMORY[0x223C37380](v7);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __82__NPKIDVRemoteDeviceConnectionCoordinator_updateProofingConfiguration_completion___block_invoke;
  v24[3] = &unk_2644D2AC8;
  id v25 = v6;
  id v26 = v7;
  id v15 = v7;
  id v16 = v6;
  id v17 = (void *)MEMORY[0x223C37380](v24);
  int v18 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _outstandingRequestItemWithCompletion:v14 errorHandler:v17];

  int v19 = NSString;
  uint64_t v20 = [v16 credentialIdentifier];
  id v21 = (void *)v20;
  uint64_t v22 = &stru_26CFEBA18;
  if (v20) {
    uint64_t v22 = (__CFString *)v20;
  }
  uint64_t v23 = [v19 stringWithFormat:@"updateProofingConfiguration-%@", v22];

  [(NPKIDVRemoteDeviceConnectionCoordinator *)self _sendRequest:v12 withType:17 priority:200 queueIdentifier:v23 requestItem:v18 timeout:*MEMORY[0x263F4A150]];
}

void __82__NPKIDVRemoteDeviceConnectionCoordinator_updateProofingConfiguration_completion___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Error while updating proofing configuration:%@. Error:%@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)updateProofingConfigurationResponse:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      int v19 = "-[NPKIDVRemoteDeviceConnectionCoordinator updateProofingConfigurationResponse:]";
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s response:%@", (uint8_t *)&v18, 0x16u);
    }
  }
  uint64_t v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:v4];
  int v9 = [v8 completion];

  if (v9)
  {
    uint64_t v10 = [NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse alloc];
    __int16 v11 = [v4 data];
    id v12 = [(NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse *)v10 initWithData:v11];

    uint64_t v13 = [(NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse *)v12 errorData];
    if (v13)
    {
      id v14 = [(NPKIDVRemoteDeviceProtoUpdateProofingConfigurationResponse *)v12 errorData];
      id v15 = objc_opt_class();
      id v16 = NPKSecureUnarchiveObject(v14, v15);
    }
    else
    {
      id v16 = 0;
    }

    id v17 = [v8 completion];
    ((void (**)(void, void *))v17)[2](v17, v16);
  }
}

- (void)handleHeartbeats:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    __int16 v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v22 = "-[NPKIDVRemoteDeviceConnectionCoordinator handleHeartbeats:service:account:fromID:context:]";
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %s request:%@", buf, 0x16u);
    }
  }
  id v12 = [NPKIDVRemoteDeviceProtoHeartbeatRequest alloc];
  uint64_t v13 = [v8 data];
  id v14 = [(NPKIDVRemoteDeviceProtoHeartbeatRequest *)v12 initWithData:v13];

  id v15 = pk_Payment_log();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

  if (v16)
  {
    id v17 = pk_Payment_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = [(NPKIDVRemoteDeviceProtoHeartbeatRequest *)v14 inProgressResponseIdentifiers];
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v18;
      _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Received heartbeat for response identifiers:%@", buf, 0xCu);
    }
  }
  int v19 = [(NPKIDVRemoteDeviceProtoHeartbeatRequest *)v14 inProgressResponseIdentifiers];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__NPKIDVRemoteDeviceConnectionCoordinator_handleHeartbeats_service_account_fromID_context___block_invoke;
  v20[3] = &unk_2644D3188;
  v20[4] = self;
  [v19 enumerateObjectsUsingBlock:v20];
}

uint64_t __91__NPKIDVRemoteDeviceConnectionCoordinator_handleHeartbeats_service_account_fromID_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_safeQueue_resetCleanupTimerForOutstandingRequestItemWithMessageIdentifier:", a2);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__NPKIDVRemoteDeviceConnectionCoordinator_addObserver___block_invoke;
  v7[3] = &unk_2644D2E08;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __55__NPKIDVRemoteDeviceConnectionCoordinator_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Register observer:%@ at:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  return [*(id *)(*(void *)(a1 + 40) + 40) addObject:*(void *)(a1 + 32)];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__NPKIDVRemoteDeviceConnectionCoordinator_removeObserver___block_invoke;
  v7[3] = &unk_2644D2E08;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(observerQueue, v7);
}

uint64_t __58__NPKIDVRemoteDeviceConnectionCoordinator_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412546;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Remove observer:%@ at:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  return [*(id *)(*(void *)(a1 + 40) + 40) removeObject:*(void *)(a1 + 32)];
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: IDS service accounts changed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    uint64_t v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: IDS service devices changed: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  BOOL v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    int v18 = pk_Payment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138413314;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v14;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: IDS service incoming unhandled protobuf: %@ %@ %@ %@ %@", (uint8_t *)&v19, 0x34u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  BOOL v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    int v18 = pk_Payment_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v14;
      __int16 v29 = 1024;
      BOOL v30 = v8;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: IDS service did send with success: %@ %@ %@ %d %@", buf, 0x30u);
    }
  }
  if (!v8)
  {
    IDSMessagesQueue = self->_IDSMessagesQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __95__NPKIDVRemoteDeviceConnectionCoordinator_service_account_identifier_didSendWithSuccess_error___block_invoke;
    block[3] = &unk_2644D31B0;
    block[4] = self;
    id v21 = v14;
    id v22 = v15;
    dispatch_async(IDSMessagesQueue, block);
  }
}

void __95__NPKIDVRemoteDeviceConnectionCoordinator_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_safeQueue_outstandingRequestItemWithMessageIdentifier:remove:", *(void *)(a1 + 40), 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v4 errorHandler];

  if (v2)
  {
    BOOL v3 = [v4 errorHandler];
    v3[2](v3, *(void *)(a1 + 48));
  }
}

- (id)_outstandingRequestItemWithCompletion:(id)a3 errorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [[NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem alloc] initWithtimeoutQueue:self->_IDSMessagesQueue];
  [(NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *)v8 setCompletion:v7];

  [(NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *)v8 setErrorHandler:v6];
  return v8;
}

- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 queueIdentifier:(id)a5 requestItem:(id)a6
{
}

- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 priority:(int64_t)a5 queueIdentifier:(id)a6 requestItem:(id)a7
{
}

- (void)_sendRequest:(id)a3 withType:(unsigned __int16)a4 priority:(int64_t)a5 queueIdentifier:(id)a6 requestItem:(id)a7 timeout:(double)a8
{
  uint64_t v10 = a4;
  v45[4] = *MEMORY[0x263EF8340];
  id v13 = a6;
  id v14 = a7;
  id v15 = (objc_class *)MEMORY[0x263F4A228];
  id v16 = a3;
  id v17 = [v15 alloc];
  int v18 = [v16 data];

  int v19 = (void *)[v17 initWithProtobufData:v18 type:v10 isResponse:0];
  uint64_t v20 = *MEMORY[0x263F49F60];
  v44[0] = *MEMORY[0x263F49F80];
  v44[1] = v20;
  v45[0] = &unk_26D0439A0;
  v45[1] = v13;
  uint64_t v21 = *MEMORY[0x263F49EC0];
  v44[2] = *MEMORY[0x263F49F08];
  v44[3] = v21;
  v45[2] = MEMORY[0x263EFFA88];
  v45[3] = MEMORY[0x263EFFA88];
  id v22 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:4];
  __int16 v23 = pk_Payment_log();
  LODWORD(v18) = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v18)
  {
    id v24 = pk_Payment_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = [v19 npkDescription];
      *(_DWORD *)buf = 138412802;
      v39 = v25;
      __int16 v40 = 2112;
      id v41 = v13;
      __int16 v42 = 2112;
      v43 = @"com.apple.private.alloy.applepay.identitycredential";
      _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Sending protobuf:%@ queueIdentifier:%@ serviceIdentifier:%@", buf, 0x20u);
    }
  }
  IDSMessagesQueue = self->_IDSMessagesQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __110__NPKIDVRemoteDeviceConnectionCoordinator__sendRequest_withType_priority_queueIdentifier_requestItem_timeout___block_invoke;
  block[3] = &unk_2644D3200;
  block[4] = self;
  id v32 = v19;
  BOOL v37 = v14 != 0;
  id v33 = v14;
  id v34 = v22;
  id v35 = v13;
  int64_t v36 = a5;
  id v27 = v13;
  id v28 = v22;
  id v29 = v14;
  id v30 = v19;
  dispatch_async(IDSMessagesQueue, block);
}

void __110__NPKIDVRemoteDeviceConnectionCoordinator__sendRequest_withType_priority_queueIdentifier_requestItem_timeout___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 40);
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(a1 + 72);
  BOOL v5 = *(unsigned char *)(a1 + 80) != 0;
  id v6 = [*(id *)(a1 + 48) errorHandler];
  id v7 = NPKProtoSendWithOptions(v3, v2, v4, 0, v5, v6, *(void **)(a1 + 56));

  if (v7)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      objc_initWeak(&from, *(id *)(a1 + 48));
      [*(id *)(a1 + 48) setMessageIdentifier:v7];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __110__NPKIDVRemoteDeviceConnectionCoordinator__sendRequest_withType_priority_queueIdentifier_requestItem_timeout___block_invoke_185;
      v13[3] = &unk_2644D31D8;
      objc_copyWeak(&v14, &from);
      objc_copyWeak(&v15, (id *)location);
      [*(id *)(a1 + 48) setTimeoutHandler:v13];
      [*(id *)(a1 + 48) setOrResetCleanupTimer];
      [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(a1 + 48) forKeyedSubscript:v7];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak((id *)location);
    }
  }
  else
  {
    BOOL v8 = pk_Payment_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      uint64_t v10 = pk_Payment_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = [*(id *)(a1 + 40) npkDescription];
        uint64_t v12 = *(void *)(a1 + 64);
        *(_DWORD *)location = 138412546;
        *(void *)&location[4] = v11;
        __int16 v18 = 2112;
        uint64_t v19 = v12;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Fail to send protobuf:%@ queueIdentifier:%@", location, 0x16u);
      }
    }
  }
}

void __110__NPKIDVRemoteDeviceConnectionCoordinator__sendRequest_withType_priority_queueIdentifier_requestItem_timeout___block_invoke_185(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    uint64_t v4 = [WeakRetained messageIdentifier];

    if (v4)
    {
      BOOL v5 = pk_Payment_log();
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

      if (v6)
      {
        id v7 = pk_Payment_log();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v8 = [WeakRetained messageIdentifier];
          int v14 = 138412290;
          id v15 = v8;
          _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Warning: NPKIDVRemoteDeviceService: Timeout timer trigger for message with identifier %@", (uint8_t *)&v14, 0xCu);
        }
      }
      BOOL v9 = (void *)v3[3];
      uint64_t v10 = [WeakRetained messageIdentifier];
      [v9 removeObjectForKey:v10];
    }
  }
  id v11 = [WeakRetained errorHandler];

  if (v11)
  {
    uint64_t v12 = [WeakRetained errorHandler];
    id v13 = NPKIDVRemoteDeviceSessionError(-500, 0);
    ((void (**)(void, void *))v12)[2](v12, v13);
  }
}

- (id)_safeQueue_outstandingRequestItemWithMessageIdentifier:(id)a3 remove:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_IDSMessagesQueue);
  if (!v6)
  {
    BOOL v9 = pk_Payment_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        uint64_t v12 = "Error: NPKIDVRemoteDeviceService: Missing IDS Message identifier";
        id v13 = v11;
        uint32_t v14 = 2;
LABEL_11:
        _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v18, v14);
      }
LABEL_12:
    }
LABEL_13:
    BOOL v8 = 0;
    goto LABEL_14;
  }
  id v7 = [(NSMutableDictionary *)self->_outstandingRequestItems objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      id v11 = pk_Payment_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412290;
        id v19 = v6;
        uint64_t v12 = "Error: NPKIDVRemoteDeviceService: Could not find completion handler for received Message Identifier:%@";
        id v13 = v11;
        uint32_t v14 = 12;
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  BOOL v8 = v7;
  if (v4)
  {
    [v7 invalidateCleanupTimer];
    [(NSMutableDictionary *)self->_outstandingRequestItems removeObjectForKey:v6];
  }
LABEL_14:

  return v8;
}

- (void)_safeQueue_resetCleanupTimerForOutstandingRequestItemWithMessageIdentifier:(id)a3
{
  id v3 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemWithMessageIdentifier:a3 remove:0];
  [v3 setOrResetCleanupTimer];
}

- (id)_safeQueue_outstandingRequestItemForIDSProtobuf:(id)a3
{
  return [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemForIDSProtobuf:a3 remove:1];
}

- (id)_safeQueue_outstandingRequestItemForIDSProtobuf:(id)a3 remove:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 context];
  id v7 = [v6 incomingResponseIdentifier];

  BOOL v8 = [(NPKIDVRemoteDeviceConnectionCoordinator *)self _safeQueue_outstandingRequestItemWithMessageIdentifier:v7 remove:v4];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_outstandingRequestItems, 0);
  objc_storeStrong((id *)&self->_IDSMessagesQueue, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIDSService, 0);
}

@end