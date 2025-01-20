@interface ULClientProcessConnection
- (NSString)description;
- (NSString)signingIdentity;
- (NSUUID)connectionToken;
- (NSUUID)serviceIdentifier;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (ULClientProcessConnection)initWithXPCConnection:(id)a3 delegate:(id)a4 serviceHandling:(id)a5 legacyServiceHandling:(id)a6 diagnosticsHandling:(id)a7 queue:(id)a8;
- (ULClientProcessConnectionDelegate)delegate;
- (ULLogicDiagnosticsHandling)diagnosticsHandling;
- (ULLogicLegacyServiceHandling)legacyServiceHandling;
- (ULLogicServiceHandling)serviceHandling;
- (ULXPCResponseProtocol)remoteObjectProxy;
- (void)connectWithServiceIdentifier:(id)a3 legacyServiceIdentifier:(id)a4 andRequestIdentifier:(id)a5;
- (void)createCustomLocationOfInterestAtCurrentLocationWithConfiguration:(id)a3;
- (void)dealloc;
- (void)deleteServiceWithIdentifier:(id)a3 reply:(id)a4;
- (void)disconnectWithRequestIdentifier:(id)a3;
- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5;
- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6;
- (void)exportDatabaseWithReply:(id)a3;
- (void)getMicroLocationInternalVersionWithReply:(id)a3;
- (void)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5;
- (void)labelRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4 withReturnIdentifier:(id)a5;
- (void)purgeDatabaseWithReply:(id)a3;
- (void)queryServicesWithReply:(id)a3;
- (void)removeCustomLocationOfInterestWithIdentifier:(id)a3;
- (void)requestAllModelsLearningWithRequestIdentifier:(id)a3;
- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3;
- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3;
- (void)requestObservationWithRequestIdentifier:(id)a3;
- (void)requestPredictionWithRequestIdentifier:(id)a3;
- (void)setConnectionToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiagnosticsHandling:(id)a3;
- (void)setLegacyServiceHandling:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setServiceHandling:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setSigningIdentity:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)startUpdatingWithConfiguration:(id)a3 withRequestIdentifier:(id)a4;
- (void)stopUpdatingWithRequestIdentifier:(id)a3;
@end

@implementation ULClientProcessConnection

- (ULClientProcessConnection)initWithXPCConnection:(id)a3 delegate:(id)a4 serviceHandling:(id)a5 legacyServiceHandling:(id)a6 diagnosticsHandling:(id)a7 queue:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)ULClientProcessConnection;
  v20 = [(ULClientProcessConnection *)&v34 init];
  if (v20)
  {
    if (!+[ULServerEntitlements allowConnection:v14])
    {
      v27 = 0;
      goto LABEL_6;
    }
    v21 = [v14 signingIdentity];
    [(ULClientProcessConnection *)v20 setSigningIdentity:v21];

    v22 = [MEMORY[0x263F08C38] UUID];
    [(ULClientProcessConnection *)v20 setConnectionToken:v22];

    v23 = [MEMORY[0x263F557F8] responseInterface];
    [v14 setRemoteObjectInterface:v23];

    v24 = [MEMORY[0x263F557F8] requestInterface];
    [v14 setExportedInterface:v24];

    v25 = (void *)[objc_alloc(MEMORY[0x263F55820]) initWithObject:v20];
    [v14 setExportedObject:v25];

    objc_initWeak(&location, v20);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __124__ULClientProcessConnection_initWithXPCConnection_delegate_serviceHandling_legacyServiceHandling_diagnosticsHandling_queue___block_invoke;
    v31[3] = &unk_2653F9200;
    objc_copyWeak(&v32, &location);
    [v14 setInterruptionHandler:v31];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __124__ULClientProcessConnection_initWithXPCConnection_delegate_serviceHandling_legacyServiceHandling_diagnosticsHandling_queue___block_invoke_4;
    v29[3] = &unk_2653F9200;
    objc_copyWeak(&v30, &location);
    [v14 setInvalidationHandler:v29];
    v26 = [v14 remoteObjectProxy];
    [(ULClientProcessConnection *)v20 setRemoteObjectProxy:v26];

    [(ULClientProcessConnection *)v20 setXpcConnection:v14];
    [(ULClientProcessConnection *)v20 setDelegate:v15];
    [(ULClientProcessConnection *)v20 setServiceHandling:v16];
    [(ULClientProcessConnection *)v20 setLegacyServiceHandling:v17];
    [(ULClientProcessConnection *)v20 setDiagnosticsHandling:v18];
    [(ULClientProcessConnection *)v20 setQueue:v19];
    [v14 resume];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  v27 = v20;
LABEL_6:

  return v27;
}

void __124__ULClientProcessConnection_initWithXPCConnection_delegate_serviceHandling_legacyServiceHandling_diagnosticsHandling_queue___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
    }
    v2 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      v4 = [WeakRetained signingIdentity];
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Connection interrupted for: %@", (uint8_t *)&v6, 0xCu);
    }
    v5 = [WeakRetained delegate];
    [v5 clientConnectionSeveredConnection:WeakRetained];
  }
}

void __124__ULClientProcessConnection_initWithXPCConnection_delegate_serviceHandling_legacyServiceHandling_diagnosticsHandling_queue___block_invoke_4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
    }
    v2 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = v2;
      v4 = [WeakRetained signingIdentity];
      int v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_25631F000, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated for: %@", (uint8_t *)&v6, 0xCu);
    }
    v5 = [WeakRetained delegate];
    [v5 clientConnectionSeveredConnection:WeakRetained];
  }
}

- (void)dealloc
{
  v3 = [(ULClientProcessConnection *)self xpcConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ULClientProcessConnection;
  [(ULClientProcessConnection *)&v4 dealloc];
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  objc_super v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  v7 = [(ULClientProcessConnection *)self signingIdentity];
  [v6 appendFormat:@", signingIdentity: %@", v7];

  uint64_t v8 = [(ULClientProcessConnection *)self connectionToken];
  [v6 appendFormat:@", connectionToken: %@", v8];

  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (void)deleteServiceWithIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ULClientProcessConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__ULClientProcessConnection_deleteServiceWithIdentifier_reply___block_invoke;
  block[3] = &unk_2653FA1A8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __63__ULClientProcessConnection_deleteServiceWithIdentifier_reply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v3;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "Deleting service:%@", (uint8_t *)&v10, 0xCu);
  }
  objc_super v4 = [*(id *)(a1 + 40) serviceHandling];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) signingIdentity];
  id v7 = [v4 deleteServiceWithIdentifier:v5 clientIdentifier:v6];

  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [v7 error];
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
}

- (void)queryServicesWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__ULClientProcessConnection_queryServicesWithReply___block_invoke;
  v7[3] = &unk_2653FA1D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __52__ULClientProcessConnection_queryServicesWithReply___block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "Query services", v6, 2u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) serviceHandling];
  id v4 = [*(id *)(a1 + 32) signingIdentity];
  uint64_t v5 = [v3 queryServicesForClient:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(ULClientProcessConnection *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __143__ULClientProcessConnection_getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke;
  v13[3] = &unk_2653FA1F8;
  BOOL v17 = a4;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __143__ULClientProcessConnection_getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  v2 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = NSNumber;
    uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
    id v6 = v2;
    id v7 = [v4 numberWithBool:v5];
    int v14 = 138412546;
    uint64_t v15 = v3;
    __int16 v16 = 2112;
    BOOL v17 = v7;
    _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation, information: %@, shouldForceRecording: %@", (uint8_t *)&v14, 0x16u);
  }
  id v8 = [*(id *)(a1 + 40) legacyServiceHandling];
  uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) signingIdentity];
  v13 = [v8 getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:v11 shouldForceRecording:v9 handler:v10 clientId:v12];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(ULClientProcessConnection *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __103__ULClientProcessConnection_donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke;
  v15[3] = &unk_2653FA220;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __103__ULClientProcessConnection_donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v11 = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "donateMicroLocationTruthTagWithTagUUID, tagUUID: %@, triggerUUID: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v5 = [*(id *)(a1 + 48) legacyServiceHandling];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [*(id *)(a1 + 48) signingIdentity];
  id v10 = [v5 donateMicroLocationTruthTagWithTagUUID:v6 correspondingToTriggerUUID:v7 handler:v8 clientId:v9];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(ULClientProcessConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__ULClientProcessConnection_donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke;
  block[3] = &unk_2653FA248;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

void __114__ULClientProcessConnection_donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v13 = 138412802;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "donateMicroLocationTruthTagWithTagUUIDforRecordingEventsBetweenDate, tagUUID: %@, startDate: %@, endDate: %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v6 = [*(id *)(a1 + 56) legacyServiceHandling];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = [*(id *)(a1 + 56) signingIdentity];
  id v12 = [v6 donateMicroLocationTruthTagWithTagUUID:v7 forRecordingEventsBetweenDate:v8 andDate:v10 handler:v9 clientId:v11];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__ULClientProcessConnection_requestCurrentMicroLocationWithAdditionalInformation___block_invoke;
  v7[3] = &unk_2653F9228;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __82__ULClientProcessConnection_requestCurrentMicroLocationWithAdditionalInformation___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "requestCurrentMicroLocationWithAdditionalInformation, localizationInformation: %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) legacyServiceHandling];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) signingIdentity];
  [v4 requestCurrentMicroLocationWithAdditionalInformation:v5 clientId:v6];
}

- (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__ULClientProcessConnection_requestMicroLocationRecordingScanWithAdditionalInformation___block_invoke;
  v7[3] = &unk_2653F9228;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __88__ULClientProcessConnection_requestMicroLocationRecordingScanWithAdditionalInformation___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "requestMicroLocationRecordingScanWithAdditionalInformation, recordingInformation: %@", (uint8_t *)&v7, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) legacyServiceHandling];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) signingIdentity];
  [v4 requestMicroLocationRecordingScanWithAdditionalInformation:v5 clientId:v6];
}

- (void)getMicroLocationInternalVersionWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__ULClientProcessConnection_getMicroLocationInternalVersionWithReply___block_invoke;
  v7[3] = &unk_2653FA1D0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __70__ULClientProcessConnection_getMicroLocationInternalVersionWithReply___block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "getMicroLocationInternalVersionWithReply", v5, 2u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) legacyServiceHandling];
  id v4 = [v3 getMicroLocationInternalVersion];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)connectWithServiceIdentifier:(id)a3 legacyServiceIdentifier:(id)a4 andRequestIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ULClientProcessConnection *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __103__ULClientProcessConnection_connectWithServiceIdentifier_legacyServiceIdentifier_andRequestIdentifier___block_invoke;
  v15[3] = &unk_2653F9278;
  id v16 = v9;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

void __103__ULClientProcessConnection_connectWithServiceIdentifier_legacyServiceIdentifier_andRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
    }
    uint64_t v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)__int16 v15 = 138412546;
      *(void *)&void v15[4] = v3;
      *(_WORD *)&v15[12] = 2112;
      *(void *)&v15[14] = v4;
      uint64_t v5 = "connectWithServiceIdentifier:%@ , withLegacyServiceIdentifier:%@";
      id v6 = v2;
      uint32_t v7 = 22;
LABEL_10:
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, v5, v15, v7);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
    }
    uint64_t v8 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)__int16 v15 = 138412290;
      *(void *)&void v15[4] = v9;
      uint64_t v5 = "connectWithServiceIdentifier:%@";
      id v6 = v8;
      uint32_t v7 = 12;
      goto LABEL_10;
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setServiceIdentifier:", *(void *)(a1 + 40), *(_OWORD *)v15, *(void *)&v15[16], v16);
  id v10 = [*(id *)(a1 + 48) serviceHandling];
  id v11 = [*(id *)(a1 + 48) serviceIdentifier];
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = [*(id *)(a1 + 48) signingIdentity];
  id v14 = [*(id *)(a1 + 48) connectionToken];
  [v10 connectWithServiceIdentifier:v11 legacyServiceIdentifier:v12 clientIdentifier:v13 connectionToken:v14 requestIdentifier:*(void *)(a1 + 56)];
}

- (void)disconnectWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ULClientProcessConnection_disconnectWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2653F9228;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__ULClientProcessConnection_disconnectWithRequestIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setServiceIdentifier:0];
  uint64_t v2 = [*(id *)(a1 + 32) serviceHandling];
  uint64_t v3 = [*(id *)(a1 + 32) connectionToken];
  id v4 = [*(id *)(a1 + 32) signingIdentity];
  [v2 disconnectWithConnectionToken:v3 clientIdentifier:v4 requestIdentifier:*(void *)(a1 + 40)];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  uint64_t v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "disconnect", v6, 2u);
  }
}

- (void)labelRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4 withReturnIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ULClientProcessConnection *)self queue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __93__ULClientProcessConnection_labelRequestIdentifier_withPlaceIdentifier_withReturnIdentifier___block_invoke;
  v15[3] = &unk_2653F9278;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __93__ULClientProcessConnection_labelRequestIdentifier_withPlaceIdentifier_withReturnIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) serviceHandling];
  uint64_t v3 = [*(id *)(a1 + 32) connectionToken];
  [v2 labelObservationForConnectionToken:v3 withRequestIdentifier:*(void *)(a1 + 40) andPlaceIdentifier:*(void *)(a1 + 48) andReturnIdentifier:*(void *)(a1 + 56)];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "labelRequestIdentifier:%@ withPlaceIdentifier:%@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)requestObservationWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__ULClientProcessConnection_requestObservationWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2653F9228;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__ULClientProcessConnection_requestObservationWithRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) serviceHandling];
  uint64_t v3 = [*(id *)(a1 + 32) connectionToken];
  id v4 = [*(id *)(a1 + 32) signingIdentity];
  [v2 requestObservationForConnectionToken:v3 clientIdentifier:v4 requestIdentifier:*(void *)(a1 + 40)];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  uint64_t v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "requestObservationWithRequestIdentifier:%@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)requestPredictionWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__ULClientProcessConnection_requestPredictionWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2653F9228;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __68__ULClientProcessConnection_requestPredictionWithRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) serviceHandling];
  uint64_t v3 = [*(id *)(a1 + 32) connectionToken];
  id v4 = [*(id *)(a1 + 32) signingIdentity];
  [v2 requestPredictionForConnectionToken:v3 clientIdentifier:v4 requestIdentifier:*(void *)(a1 + 40)];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  uint64_t v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "requestPredictionWithRequestIdentifier:%@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)startUpdatingWithConfiguration:(id)a3 withRequestIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ULClientProcessConnection *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__ULClientProcessConnection_startUpdatingWithConfiguration_withRequestIdentifier___block_invoke;
  block[3] = &unk_2653F9040;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __82__ULClientProcessConnection_startUpdatingWithConfiguration_withRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) serviceHandling];
  uint64_t v3 = [*(id *)(a1 + 32) connectionToken];
  [v2 startUpdatingForConnectionToken:v3 updateConfiguration:*(void *)(a1 + 40) requestIdentifier:*(void *)(a1 + 48)];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "startUpdatingWithConfiguration:%@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)stopUpdatingWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__ULClientProcessConnection_stopUpdatingWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2653F9228;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __63__ULClientProcessConnection_stopUpdatingWithRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serviceHandling];
  uint64_t v3 = [*(id *)(a1 + 32) connectionToken];
  [v2 stopUpdatingForConnectionToken:v3 requestIdentifier:*(void *)(a1 + 40)];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "stopUpdating", v5, 2u);
  }
}

- (void)createCustomLocationOfInterestAtCurrentLocationWithConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __94__ULClientProcessConnection_createCustomLocationOfInterestAtCurrentLocationWithConfiguration___block_invoke;
  v7[3] = &unk_2653F9228;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __94__ULClientProcessConnection_createCustomLocationOfInterestAtCurrentLocationWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serviceHandling];
  uint64_t v3 = [*(id *)(a1 + 32) connectionToken];
  [v2 createCustomLoiAtCurrentLocationForConnectionToken:v3 withConfiguration:*(void *)(a1 + 40)];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  id v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_DEFAULT, "createCustomLocationOfInterestAtCurrentLocationWithConfiguration", v5, 2u);
  }
}

- (void)removeCustomLocationOfInterestWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__ULClientProcessConnection_removeCustomLocationOfInterestWithIdentifier___block_invoke;
  v7[3] = &unk_2653F9228;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __74__ULClientProcessConnection_removeCustomLocationOfInterestWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) serviceHandling];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) connectionToken];
  [v2 removeCustomLoiWithIdentifier:v3 forConnectionToken:v4];

  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  uint64_t v5 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_25631F000, v5, OS_LOG_TYPE_DEFAULT, "removeCustomLocationOfInterestWithIdentifier: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)requestAllModelsLearningWithRequestIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__ULClientProcessConnection_requestAllModelsLearningWithRequestIdentifier___block_invoke;
  v7[3] = &unk_2653F9228;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __75__ULClientProcessConnection_requestAllModelsLearningWithRequestIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  uint64_t v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "requestAllModelsLearningWithRequestIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) diagnosticsHandling];
  uint64_t v5 = [*(id *)(a1 + 40) connectionToken];
  [v4 requestModelLearningForConnectionToken:v5 requestIdentifier:*(void *)(a1 + 32)];
}

- (void)exportDatabaseWithReply:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self xpcConnection];
  BOOL v6 = +[ULServerEntitlements allowPrivateDataAccess:v5];

  if (v6)
  {
    uint64_t v7 = [(ULClientProcessConnection *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__ULClientProcessConnection_exportDatabaseWithReply___block_invoke;
    block[3] = &unk_2653FA1D0;
    void block[4] = self;
    id v12 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"export database missing entitlements";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v10 = (void *)[v8 initWithDomain:@"ULClientProcessConnection" code:41 userInfo:v9];

    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v10);
  }
}

void __53__ULClientProcessConnection_exportDatabaseWithReply___block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  uint64_t v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "exportDatabaseWithReply", v8, 2u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) diagnosticsHandling];
  id v4 = [v3 exportDatabase];

  uint64_t v5 = *(void *)(a1 + 40);
  BOOL v6 = [v4 exportedURLs];
  uint64_t v7 = [v4 error];
  (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v6, v7);
}

- (void)purgeDatabaseWithReply:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ULClientProcessConnection *)self xpcConnection];
  BOOL v6 = +[ULServerEntitlements allowPrivateDataAccess:v5];

  if (v6)
  {
    uint64_t v7 = [(ULClientProcessConnection *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __52__ULClientProcessConnection_purgeDatabaseWithReply___block_invoke;
    block[3] = &unk_2653FA1D0;
    void block[4] = self;
    id v12 = v4;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"purge database missing entitlements";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v10 = (void *)[v8 initWithDomain:@"ULClientProcessConnection" code:41 userInfo:v9];

    (*((void (**)(id, void *))v4 + 2))(v4, v10);
  }
}

void __52__ULClientProcessConnection_purgeDatabaseWithReply___block_invoke(uint64_t a1)
{
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_96);
  }
  uint64_t v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_DEFAULT, "purgeDatabaseWithReply", v5, 2u);
  }
  uint64_t v3 = [*(id *)(a1 + 32) diagnosticsHandling];
  id v4 = [v3 purgeDatabase];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSUUID)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSUUID)connectionToken
{
  return self->_connectionToken;
}

- (void)setConnectionToken:(id)a3
{
}

- (NSString)signingIdentity
{
  return self->_signingIdentity;
}

- (void)setSigningIdentity:(id)a3
{
}

- (ULXPCResponseProtocol)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (ULLogicServiceHandling)serviceHandling
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceHandling);
  return (ULLogicServiceHandling *)WeakRetained;
}

- (void)setServiceHandling:(id)a3
{
}

- (ULLogicLegacyServiceHandling)legacyServiceHandling
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legacyServiceHandling);
  return (ULLogicLegacyServiceHandling *)WeakRetained;
}

- (void)setLegacyServiceHandling:(id)a3
{
}

- (ULLogicDiagnosticsHandling)diagnosticsHandling
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diagnosticsHandling);
  return (ULLogicDiagnosticsHandling *)WeakRetained;
}

- (void)setDiagnosticsHandling:(id)a3
{
}

- (ULClientProcessConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ULClientProcessConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_diagnosticsHandling);
  objc_destroyWeak((id *)&self->_legacyServiceHandling);
  objc_destroyWeak((id *)&self->_serviceHandling);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_signingIdentity, 0);
  objc_storeStrong((id *)&self->_connectionToken, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end