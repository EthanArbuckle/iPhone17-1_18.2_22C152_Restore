@interface INDaemonConnection
- (BOOL)clearAllRegistrationDigestsWithError:(id *)a3;
- (BOOL)registerAccount:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 error:(id *)a5;
- (BOOL)unregisterAccount:(id)a3 fromiCloudNotificationsWithError:(id *)a4;
- (INDaemonConnection)init;
- (id)daemonWithErrorHandler:(id)a3;
- (id)diagnosticReport;
- (id)synchronousDaemonWithErrorHandler:(id)a3;
- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4;
- (void)dealloc;
- (void)diagnosticReport;
- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4;
- (void)getCacheDataForLink:(id)a3 completion:(id)a4;
- (void)iCloudServerOfferForAccount:(id)a3 options:(id)a4 completion:(id)a5;
- (void)init;
- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4;
- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4;
- (void)registerAccount:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5;
- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4;
- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 completion:(id)a4;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)teardownOffersForAccount:(id)a3 withCompletion:(id)a4;
- (void)unregisterAccount:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4;
- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:(id)a3;
- (void)updateOfferForAccount:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7;
@end

@implementation INDaemonConnection

- (void).cxx_destruct
{
}

void __26__INDaemonConnection_init__block_invoke_6()
{
  v0 = _INLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __26__INDaemonConnection_init__block_invoke_6_cold_1();
  }
}

void __26__INDaemonConnection_init__block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_224FEF000, v0, OS_LOG_TYPE_ERROR, "Connection to ind invalidated!", v1, 2u);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_224FEF000, v0, v1, "Closing connection to ind...", v2, v3, v4, v5, v6);
}

void __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint8_t v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke_34_cold_1(a2, (uint64_t)v5, v6);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (INDaemonConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)INDaemonConnection;
  uint64_t v2 = [(INDaemonConnection *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ind.xpc" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    id v5 = +[INDaemonInterface XPCInterface];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_8];
    uint8_t v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[INDaemonConnection init]();
    }

    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  uint64_t v7 = self;
  v21 = v7;
  objc_super v8 = _INLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v23 = a3;
    _os_log_impl(&dword_224FEF000, v8, OS_LOG_TYPE_DEFAULT, "Received notification of device storage level %ld", buf, 0xCu);
  }

  connection = v7->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke;
  v17[3] = &unk_2647134F0;
  id v10 = v6;
  id v18 = v10;
  v19 = v20;
  v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
  v12 = _INLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection diagnosticReport]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke_34;
  v14[3] = &unk_264713518;
  id v13 = v10;
  id v15 = v13;
  v16 = v20;
  [v11 notifyDeviceStorageLevel:a3 completion:v14];

  _Block_object_dispose(v20, 8);
}

void __26__INDaemonConnection_init__block_invoke()
{
  os_log_t v0 = _INLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __26__INDaemonConnection_init__block_invoke_cold_1();
  }
}

- (BOOL)registerAccount:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __77__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_error___block_invoke;
  v29[3] = &unk_264713428;
  v29[4] = &v36;
  v29[5] = &v30;
  v9 = (void *)MEMORY[0x22A628E60](v29);
  connection = self->_connection;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __77__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_error___block_invoke_2;
  v27[3] = &unk_264713450;
  id v11 = v9;
  id v28 = v11;
  v12 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v27];
  id v13 = _INLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection registerAccount:foriCloudNotificationsWithReason:error:](v13, v14, v15, v16, v17, v18, v19, v20);
  }

  v21 = [v8 identifier];
  [v12 registerAccountWithID:v21 foriCloudNotificationsWithReason:a4 completion:v11];

  if (a5) {
    *a5 = (id) v31[5];
  }
  v22 = _INLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v37 + 24)) {
      int64_t v23 = @"YES";
    }
    else {
      int64_t v23 = @"NO";
    }
    uint64_t v24 = v31[5];
    *(_DWORD *)buf = 138412546;
    v41 = v23;
    __int16 v42 = 2112;
    uint64_t v43 = v24;
    _os_log_impl(&dword_224FEF000, v22, OS_LOG_TYPE_DEFAULT, "Registration result (%@) with error: %@", buf, 0x16u);
  }

  BOOL v25 = *((unsigned char *)v37 + 24) != 0;
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v25;
}

void __77__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __77__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerAccount:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __82__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_completion___block_invoke;
  v26[3] = &unk_264713478;
  id v9 = v8;
  v26[4] = self;
  id v27 = v9;
  id v10 = a3;
  id v11 = (void *)MEMORY[0x22A628E60](v26);
  connection = self->_connection;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __82__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_completion___block_invoke_19;
  v24[3] = &unk_264713450;
  id v25 = v11;
  id v13 = v11;
  uint64_t v14 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v24];
  uint64_t v15 = _INLogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection registerAccount:foriCloudNotificationsWithReason:completion:](v15, v16, v17, v18, v19, v20, v21, v22);
  }

  int64_t v23 = [v10 identifier];

  [v14 registerAccountWithID:v23 foriCloudNotificationsWithReason:a4 completion:v13];
}

void __82__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"NO";
    if (a2) {
      uint64_t v7 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_224FEF000, v6, OS_LOG_TYPE_DEFAULT, "Registration result (%@) with error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

uint64_t __82__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_completion___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)unregisterAccount:(id)a3 fromiCloudNotificationsWithError:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  uint64_t v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __73__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithError___block_invoke;
  v27[3] = &unk_264713428;
  void v27[4] = &v34;
  v27[5] = &v28;
  uint64_t v7 = (void *)MEMORY[0x22A628E60](v27);
  connection = self->_connection;
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __73__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithError___block_invoke_2;
  v25[3] = &unk_264713450;
  id v9 = v7;
  id v26 = v9;
  id v10 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v25];
  __int16 v11 = _INLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection unregisterAccount:fromiCloudNotificationsWithError:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  uint64_t v19 = [v6 identifier];
  [v10 unregisterAccountWithID:v19 fromiCloudNotificationsWithCompletion:v9];

  if (a4) {
    *a4 = (id) v29[5];
  }
  uint64_t v20 = _INLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (*((unsigned char *)v35 + 24)) {
      uint64_t v21 = @"YES";
    }
    else {
      uint64_t v21 = @"NO";
    }
    uint64_t v22 = v29[5];
    *(_DWORD *)buf = 138412546;
    char v39 = v21;
    __int16 v40 = 2112;
    uint64_t v41 = v22;
    _os_log_impl(&dword_224FEF000, v20, OS_LOG_TYPE_DEFAULT, "Unregistration success: %@. Error: %@", buf, 0x16u);
  }

  BOOL v23 = *((unsigned char *)v35 + 24) != 0;
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v23;
}

void __73__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __73__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterAccount:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4
{
  id v6 = a4;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __78__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithCompletion___block_invoke;
  v24[3] = &unk_264713478;
  id v7 = v6;
  void v24[4] = self;
  id v25 = v7;
  id v8 = a3;
  id v9 = (void *)MEMORY[0x22A628E60](v24);
  connection = self->_connection;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __78__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithCompletion___block_invoke_20;
  v22[3] = &unk_264713450;
  id v23 = v9;
  id v11 = v9;
  uint64_t v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v22];
  uint64_t v13 = _INLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection unregisterAccount:fromiCloudNotificationsWithCompletion:](v13, v14, v15, v16, v17, v18, v19, v20);
  }

  uint64_t v21 = [v8 identifier];

  [v12 unregisterAccountWithID:v21 fromiCloudNotificationsWithCompletion:v11];
}

void __78__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_224FEF000, v6, OS_LOG_TYPE_DEFAULT, "Unregistration success: %@. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

uint64_t __78__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithCompletion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)teardownOffersForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __62__INDaemonConnection_teardownOffersForAccount_withCompletion___block_invoke;
  v19[3] = &unk_264713450;
  id v20 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v19];
  __int16 v11 = _INLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection teardownOffersForAccount:withCompletion:](v11, v12, v13, v14, v15, v16, v17, v18);
  }

  [v10 teardownOffersForAccount:v9 withCompletion:v8];
}

uint64_t __62__INDaemonConnection_teardownOffersForAccount_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)clearAllRegistrationDigestsWithError:(id *)a3
{
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  id v32 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  void v25[4] = __Block_byref_object_dispose_;
  uint64_t v4 = self;
  id v26 = v4;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke;
  v24[3] = &unk_2647134A0;
  void v24[4] = &v33;
  void v24[5] = &v27;
  v24[6] = v25;
  id v5 = (void *)MEMORY[0x22A628E60](v24);
  connection = v4->_connection;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke_21;
  uint64_t v22 = &unk_264713450;
  id v7 = v5;
  id v23 = v7;
  id v8 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&v19];
  id v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection clearAllRegistrationDigestsWithError:](v9, v10, v11, v12, v13, v14, v15, v16);
  }

  objc_msgSend(v8, "clearAllRegistrationDigestsWithCompletion:", v7, v19, v20, v21, v22);
  if (a3) {
    *a3 = (id) v28[5];
  }
  char v17 = *((unsigned char *)v34 + 24);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

void __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke(void *a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _INLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = a2;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  uint64_t v10 = *(void *)(a1[6] + 8);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

uint64_t __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)diagnosticReport
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy_;
  uint64_t v19 = __Block_byref_object_dispose_;
  id v20 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  uint64_t v2 = self;
  uint64_t v14 = v2;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__INDaemonConnection_diagnosticReport__block_invoke;
  v12[3] = &unk_2647134C8;
  v12[4] = &v15;
  v12[5] = v13;
  uint64_t v3 = (void *)MEMORY[0x22A628E60](v12);
  connection = v2->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__INDaemonConnection_diagnosticReport__block_invoke_23;
  v10[3] = &unk_264713450;
  id v5 = v3;
  id v11 = v5;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  uint64_t v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection diagnosticReport]();
  }

  [v6 diagnosticReportWithCompletion:v5];
  id v8 = (id)v16[5];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __38__INDaemonConnection_diagnosticReport__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _INLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __38__INDaemonConnection_diagnosticReport__block_invoke_cold_1();
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

uint64_t __38__INDaemonConnection_diagnosticReport__block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateOfferForAccount:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  uint64_t v17 = self;
  id v32 = v17;
  uint64_t v18 = _INLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection updateOfferForAccount:offerId:buttonId:info:completion:]();
  }

  connection = v17->_connection;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke;
  v28[3] = &unk_2647134F0;
  id v20 = v16;
  id v29 = v20;
  uint64_t v30 = v31;
  uint64_t v21 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v28];
  uint64_t v22 = _INLogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection diagnosticReport]();
  }

  id v23 = [v12 identifier];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke_24;
  v25[3] = &unk_264713518;
  id v24 = v20;
  id v26 = v24;
  uint64_t v27 = v31;
  [v21 updateOfferForAccountWithID:v23 offerId:v13 buttonId:v14 info:v15 completion:v25];

  _Block_object_dispose(v31, 8);
}

void __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke_24_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)iCloudServerOfferForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = self;
  connection = v24->_connection;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __69__INDaemonConnection_iCloudServerOfferForAccount_options_completion___block_invoke;
  v20[3] = &unk_2647134F0;
  id v12 = v10;
  id v21 = v12;
  uint64_t v22 = v23;
  id v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  id v14 = _INLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection diagnosticReport]();
  }

  id v15 = [v8 identifier];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__INDaemonConnection_iCloudServerOfferForAccount_options_completion___block_invoke_25;
  v17[3] = &unk_264713540;
  id v16 = v12;
  id v18 = v16;
  uint64_t v19 = v23;
  [v13 iCloudServerOfferForAccountWithID:v15 options:v9 completion:v17];

  _Block_object_dispose(v23, 8);
}

void __69__INDaemonConnection_iCloudServerOfferForAccount_options_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __69__INDaemonConnection_iCloudServerOfferForAccount_options_completion___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _INLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_224FEF000, v7, OS_LOG_TYPE_DEFAULT, "iCloud offer: %@ error: %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  void v20[4] = __Block_byref_object_dispose_;
  uint64_t v8 = self;
  id v21 = v8;
  id v9 = _INLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection presentHiddenFreshmintWithContext:completion:]();
  }

  connection = v8->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke;
  v17[3] = &unk_2647134F0;
  id v11 = v7;
  id v18 = v11;
  uint64_t v19 = v20;
  __int16 v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_27;
  v14[3] = &unk_264713518;
  id v13 = v11;
  id v15 = v13;
  id v16 = v20;
  [v12 presentHiddenFreshmintWithContext:v6 completion:v14];

  _Block_object_dispose(v20, 8);
}

void __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_27_cold_1();
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  void v20[4] = __Block_byref_object_dispose_;
  id v21 = self;
  connection = v21->_connection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __61__INDaemonConnection_commonHeadersForRequest_withCompletion___block_invoke;
  v16[3] = &unk_264713568;
  id v9 = v7;
  id v18 = v9;
  id v10 = v6;
  id v17 = v10;
  uint64_t v19 = v20;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__INDaemonConnection_commonHeadersForRequest_withCompletion___block_invoke_28;
  v13[3] = &unk_264713590;
  id v12 = v9;
  id v14 = v12;
  id v15 = v20;
  [v11 commonHeadersForRequest:v10 withCompletion:v13];

  _Block_object_dispose(v20, 8);
}

void __61__INDaemonConnection_commonHeadersForRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) allHTTPHeaderFields];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void __61__INDaemonConnection_commonHeadersForRequest_withCompletion___block_invoke_28(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy_;
  void v10[4] = __Block_byref_object_dispose_;
  id v11 = self;
  uint64_t v5 = [(NSXPCConnection *)v11->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_31];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__INDaemonConnection_renewCredentialsWithCompletion___block_invoke_32;
  v7[3] = &unk_2647135D8;
  id v6 = v4;
  id v8 = v6;
  id v9 = v10;
  [v5 renewCredentialsWithCompletion:v7];

  _Block_object_dispose(v10, 8);
}

void __53__INDaemonConnection_renewCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_cold_1();
  }
}

void __53__INDaemonConnection_renewCredentialsWithCompletion___block_invoke_32(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  void v16[4] = __Block_byref_object_dispose_;
  id v17 = self;
  connection = v17->_connection;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke;
  id v13 = &unk_2647134F0;
  id v8 = v6;
  id v14 = v8;
  id v15 = v16;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&v10];
  objc_msgSend(v9, "remoteFreshmintFlowCompletedWithSuccess:error:", v4, 0, v10, v11, v12, v13);
  (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);

  _Block_object_dispose(v16, 8);
}

void __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  void v17[4] = __Block_byref_object_dispose_;
  id v18 = self;
  connection = v18->_connection;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __76__INDaemonConnection_appLaunchLinkDidPresentForBundleIdentifier_completion___block_invoke;
  id v14 = &unk_2647134F0;
  id v9 = v7;
  id v15 = v9;
  id v16 = v17;
  uint64_t v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&v11];
  objc_msgSend(v10, "appLaunchLinkDidPresentForBundleIdentifier:", v6, v11, v12, v13, v14);
  (*((void (**)(id, void))v9 + 2))(v9, 0);

  _Block_object_dispose(v17, 8);
}

void __76__INDaemonConnection_appLaunchLinkDidPresentForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (void)getCacheDataForLink:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  void v17[4] = __Block_byref_object_dispose_;
  id v18 = self;
  connection = v18->_connection;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  id v13 = __53__INDaemonConnection_getCacheDataForLink_completion___block_invoke;
  id v14 = &unk_2647134F0;
  id v9 = v7;
  id v15 = v9;
  id v16 = v17;
  uint64_t v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&v11];
  objc_msgSend(v10, "getCacheDataForLink:completion:", v6, v9, v11, v12, v13, v14);

  _Block_object_dispose(v17, 8);
}

void __53__INDaemonConnection_getCacheDataForLink_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

- (id)daemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__INDaemonConnection_daemonWithErrorHandler___block_invoke;
  v9[3] = &unk_264713600;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __45__INDaemonConnection_daemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)synchronousDaemonWithErrorHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__INDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_264713600;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __56__INDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy_;
  v18[4] = __Block_byref_object_dispose_;
  uint64_t v19 = self;
  connection = v19->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke;
  v15[3] = &unk_2647134F0;
  id v9 = v7;
  id v16 = v9;
  id v17 = v18;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke_35;
  v12[3] = &unk_2647134F0;
  id v11 = v9;
  id v13 = v11;
  id v14 = v18;
  [v10 displayDelayedOfferWithContext:v6 completion:v12];

  _Block_object_dispose(v18, 8);
}

void __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _INLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

void __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke_35(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __89__INDaemonConnection_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion___block_invoke;
  v22[3] = &unk_264713478;
  id v7 = v6;
  void v22[4] = self;
  id v23 = v7;
  id v8 = (void *)MEMORY[0x22A628E60](v22);
  connection = self->_connection;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __89__INDaemonConnection_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion___block_invoke_36;
  v20[3] = &unk_264713450;
  id v21 = v8;
  id v10 = v8;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  uint64_t v12 = _INLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection registerDeviceForLoggedOutiCloudNotificationsWithReason:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  [v11 registerDeviceForLoggedOutiCloudNotificationsWithReason:a3 completion:v10];
}

void __89__INDaemonConnection_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_224FEF000, v6, OS_LOG_TYPE_DEFAULT, "Registration result (%@) with error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

uint64_t __89__INDaemonConnection_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:(id)a3
{
  id v4 = a3;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __85__INDaemonConnection_unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion___block_invoke;
  v20[3] = &unk_264713478;
  id v5 = v4;
  void v20[4] = self;
  id v21 = v5;
  id v6 = (void *)MEMORY[0x22A628E60](v20);
  connection = self->_connection;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __85__INDaemonConnection_unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion___block_invoke_37;
  v18[3] = &unk_264713450;
  id v19 = v6;
  id v8 = v6;
  int v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v18];
  id v10 = _INLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[INDaemonConnection unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:](v10, v11, v12, v13, v14, v15, v16, v17);
  }

  [v9 unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:9 completion:v8];
}

void __85__INDaemonConnection_unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _INLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_224FEF000, v6, OS_LOG_TYPE_DEFAULT, "Unregistration success: %@. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

uint64_t __85__INDaemonConnection_unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)init
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_224FEF000, v0, v1, "Resuming connection to ind...", v2, v3, v4, v5, v6);
}

void __26__INDaemonConnection_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_224FEF000, v0, OS_LOG_TYPE_ERROR, "Connection to ind interrupted!", v1, 2u);
}

- (void)registerAccount:(uint64_t)a3 foriCloudNotificationsWithReason:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerAccount:(uint64_t)a3 foriCloudNotificationsWithReason:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unregisterAccount:(uint64_t)a3 fromiCloudNotificationsWithError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unregisterAccount:(uint64_t)a3 fromiCloudNotificationsWithCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)teardownOffersForAccount:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)clearAllRegistrationDigestsWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_224FEF000, v0, v1, "Failed to clear registration cache with error: %@", v2, v3, v4, v5, v6);
}

- (void)diagnosticReport
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_224FEF000, v0, v1, "Sending message to daemon.", v2, v3, v4, v5, v6);
}

void __38__INDaemonConnection_diagnosticReport__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_224FEF000, v0, v1, "Failed to fetch diagnostic report with error: %@", v2, v3, v4, v5, v6);
}

- (void)updateOfferForAccount:offerId:buttonId:info:completion:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_224FEF000, v1, OS_LOG_TYPE_DEBUG, "Updating offer with Id: %@, buttonId: %@", v2, 0x16u);
}

void __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_224FEF000, v0, v1, "Updated offer with success: %d, error: %@");
}

- (void)presentHiddenFreshmintWithContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_224FEF000, v0, v1, "Received presentHiddenFreshmintWithContext %@", v2, v3, v4, v5, v6);
}

void __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_224FEF000, v0, v1, "Creating daemon failed with proxy error %@", v2, v3, v4, v5, v6);
}

void __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_27_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_224FEF000, v0, v1, "Presented Hidden Freshmint with success: %d, error: %@");
}

void __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke_34_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a1 & 1;
  LOWORD(v4) = 2114;
  *(void *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_5(&dword_224FEF000, a2, a3, "Device storage level change processed with success: %d, error: %{public}@", v3, (void)v4, HIWORD(a2), *MEMORY[0x263EF8340]);
}

void __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_224FEF000, v0, v1, "Failed to connect to ind with error: %@", v2, v3, v4, v5, v6);
}

void __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_224FEF000, v0, v1, "Failed to create daemon with proxy error [%@].", v2, v3, v4, v5, v6);
}

- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end