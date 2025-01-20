@interface POServiceLoginManagerConnection
+ (id)xpcQueue;
- (BOOL)_connectToService;
- (NSXPCConnection)xpcConnection;
- (POServiceLoginManagerConnection)init;
- (POServiceLoginManagerConnection)initWithUid:(unsigned int)a3;
- (unsigned)uid;
- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5;
- (void)completeRotationKeyForKeyType:(int64_t)a3 completion:(id)a4;
- (void)copyDeviceAttestationCertificateWithCompletion:(id)a3;
- (void)dealloc;
- (void)deviceRegistrationsNeedsRepairWithCompletion:(id)a3;
- (void)invalidate;
- (void)isDeviceRegisteredWithCompletion:(id)a3;
- (void)isUserRegisteredWithCompletion:(id)a3;
- (void)loginConfigurationWithCompletion:(id)a3;
- (void)loginUserNameWithCompletion:(id)a3;
- (void)presentRegistrationViewControllerWithCompletion:(id)a3;
- (void)registrationTokenWithCompletion:(id)a3;
- (void)resetDeviceKeysWithCompletion:(id)a3;
- (void)resetUserSecureEnclaveKeyWithCompletion:(id)a3;
- (void)rotateKeyForKeyType:(int64_t)a3 completion:(id)a4;
- (void)secIdentityProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4;
- (void)secKeyProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4;
- (void)setCertificateData:(id)a3 keyType:(int64_t)a4 completion:(id)a5;
- (void)setLoginConfiguration:(id)a3 completion:(id)a4;
- (void)setLoginUserName:(id)a3 completion:(id)a4;
- (void)setRegistrationToken:(id)a3 completion:(id)a4;
- (void)setSsoTokens:(id)a3 completion:(id)a4;
- (void)setUid:(unsigned int)a3;
- (void)setUserLoginConfiguration:(id)a3 completion:(id)a4;
- (void)setXpcConnection:(id)a3;
- (void)ssoTokensWithCompletion:(id)a3;
- (void)userLoginConfigurationWithCompletion:(id)a3;
- (void)userNeedsReauthenticationWithCompletion:(id)a3;
- (void)userRegistrationsNeedsRepairWithCompletion:(id)a3;
@end

@implementation POServiceLoginManagerConnection

+ (id)xpcQueue
{
  if (xpcQueue_onceToken_0 != -1) {
    dispatch_once(&xpcQueue_onceToken_0, &__block_literal_global_5);
  }
  v2 = (void *)xpcQueue_queue_0;

  return v2;
}

uint64_t __43__POServiceLoginManagerConnection_xpcQueue__block_invoke()
{
  xpcQueue_queue_0 = (uint64_t)dispatch_queue_create("com.apple.PlatformPSSO.login-manager-queue", 0);

  return MEMORY[0x270F9A758]();
}

- (POServiceLoginManagerConnection)initWithUid:(unsigned int)a3
{
  v5 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(POServiceLoginManagerConnection *)(uint64_t)self initWithUid:v5];
  }

  v9.receiver = self;
  v9.super_class = (Class)POServiceLoginManagerConnection;
  v6 = [(POServiceLoginManagerConnection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_uid = a3;
    [(POServiceLoginManagerConnection *)v6 _connectToService];
  }
  return v7;
}

- (POServiceLoginManagerConnection)init
{
  return [(POServiceLoginManagerConnection *)self initWithUid:0xFFFFFFFFLL];
}

- (void)dealloc
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (void)invalidate
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_230E51000, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

- (void)isDeviceRegisteredWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__POServiceLoginManagerConnection_isDeviceRegisteredWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 isDeviceRegisteredWithCompletion:v6];
  }
  else if (v4)
  {
    v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __68__POServiceLoginManagerConnection_isDeviceRegisteredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)isUserRegisteredWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __66__POServiceLoginManagerConnection_isUserRegisteredWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 isUserRegisteredWithCompletion:v6];
  }
  else if (v4)
  {
    v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __66__POServiceLoginManagerConnection_isUserRegisteredWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)registrationTokenWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__POServiceLoginManagerConnection_registrationTokenWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 registrationTokenWithCompletion:v6];
  }
  else if (v4)
  {
    v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __67__POServiceLoginManagerConnection_registrationTokenWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setRegistrationToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    v8 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__POServiceLoginManagerConnection_setRegistrationToken_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 setRegistrationToken:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __67__POServiceLoginManagerConnection_setRegistrationToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)ssoTokensWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__POServiceLoginManagerConnection_ssoTokensWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 ssoTokensWithCompletion:v6];
  }
  else if (v4)
  {
    v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __59__POServiceLoginManagerConnection_ssoTokensWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setSsoTokens:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    v8 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__POServiceLoginManagerConnection_setSsoTokens_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 setSsoTokens:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __59__POServiceLoginManagerConnection_setSsoTokens_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)loginConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__POServiceLoginManagerConnection_loginConfigurationWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 loginConfigurationWithCompletion:v6];
  }
  else if (v4)
  {
    v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __68__POServiceLoginManagerConnection_loginConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setLoginConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    v8 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__POServiceLoginManagerConnection_setLoginConfiguration_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 setLoginConfiguration:v6 completion:v9];
  }
  else if (v7)
  {
    v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __68__POServiceLoginManagerConnection_setLoginConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setCertificateData:(id)a3 keyType:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    id v10 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__POServiceLoginManagerConnection_setCertificateData_keyType_completion___block_invoke;
    v14[3] = &unk_264BBECD0;
    id v11 = v9;
    id v15 = v11;
    v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];
    [v12 setCertificateData:v8 keyType:a4 completion:v11];
  }
  else if (v9)
  {
    id v13 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

void __73__POServiceLoginManagerConnection_setCertificateData_keyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)secKeyProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    id v7 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__POServiceLoginManagerConnection_secKeyProxyEndpointForKeyType_completion___block_invoke;
    v11[3] = &unk_264BBECD0;
    id v8 = v6;
    id v12 = v8;
    id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];
    [v9 secKeyProxyEndpointForKeyType:a3 completion:v8];
  }
  else if (v6)
  {
    id v10 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __76__POServiceLoginManagerConnection_secKeyProxyEndpointForKeyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)secIdentityProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    id v7 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __81__POServiceLoginManagerConnection_secIdentityProxyEndpointForKeyType_completion___block_invoke;
    v11[3] = &unk_264BBECD0;
    id v8 = v6;
    id v12 = v8;
    id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];
    [v9 secIdentityProxyEndpointForKeyType:a3 completion:v8];
  }
  else if (v6)
  {
    id v10 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __81__POServiceLoginManagerConnection_secIdentityProxyEndpointForKeyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    id v10 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __71__POServiceLoginManagerConnection_attestKey_clientDataHash_completion___block_invoke;
    v14[3] = &unk_264BBECD0;
    id v11 = v9;
    id v15 = v11;
    id v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];
    [v12 attestKey:a3 clientDataHash:v8 completion:v11];
  }
  else if (v9)
  {
    id v13 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

void __71__POServiceLoginManagerConnection_attestKey_clientDataHash_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)copyDeviceAttestationCertificateWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__POServiceLoginManagerConnection_copyDeviceAttestationCertificateWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 copyDeviceAttestationCertificateWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __82__POServiceLoginManagerConnection_copyDeviceAttestationCertificateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)userNeedsReauthenticationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__POServiceLoginManagerConnection_userNeedsReauthenticationWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 userNeedsReauthenticationWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __75__POServiceLoginManagerConnection_userNeedsReauthenticationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)deviceRegistrationsNeedsRepairWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __80__POServiceLoginManagerConnection_deviceRegistrationsNeedsRepairWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 deviceRegistrationsNeedsRepairWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __80__POServiceLoginManagerConnection_deviceRegistrationsNeedsRepairWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)userRegistrationsNeedsRepairWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__POServiceLoginManagerConnection_userRegistrationsNeedsRepairWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 userRegistrationsNeedsRepairWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __78__POServiceLoginManagerConnection_userRegistrationsNeedsRepairWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)presentRegistrationViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __83__POServiceLoginManagerConnection_presentRegistrationViewControllerWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];
    [v7 presentRegistrationViewControllerWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __83__POServiceLoginManagerConnection_presentRegistrationViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)resetDeviceKeysWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65__POServiceLoginManagerConnection_resetDeviceKeysWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 resetDeviceKeysWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __65__POServiceLoginManagerConnection_resetDeviceKeysWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)resetUserSecureEnclaveKeyWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__POServiceLoginManagerConnection_resetUserSecureEnclaveKeyWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 resetUserSecureEnclaveKeyWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __75__POServiceLoginManagerConnection_resetUserSecureEnclaveKeyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)loginUserNameWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __63__POServiceLoginManagerConnection_loginUserNameWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 loginUserNameWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __63__POServiceLoginManagerConnection_loginUserNameWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setLoginUserName:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    id v8 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __63__POServiceLoginManagerConnection_setLoginUserName_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 setLoginUserName:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __63__POServiceLoginManagerConnection_setLoginUserName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)userLoginConfigurationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    uint64_t v5 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__POServiceLoginManagerConnection_userLoginConfigurationWithCompletion___block_invoke;
    v9[3] = &unk_264BBECD0;
    id v6 = v4;
    id v10 = v6;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 userLoginConfigurationWithCompletion:v6];
  }
  else if (v4)
  {
    id v8 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

void __72__POServiceLoginManagerConnection_userLoginConfigurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setUserLoginConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    id v8 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__POServiceLoginManagerConnection_setUserLoginConfiguration_completion___block_invoke;
    v12[3] = &unk_264BBECD0;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v12];
    [v10 setUserLoginConfiguration:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __72__POServiceLoginManagerConnection_setUserLoginConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)rotateKeyForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    id v7 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__POServiceLoginManagerConnection_rotateKeyForKeyType_completion___block_invoke;
    v11[3] = &unk_264BBECD0;
    id v8 = v6;
    id v12 = v8;
    id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];
    [v9 rotateKeyForKeyType:a3 completion:v8];
  }
  else if (v6)
  {
    id v10 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __66__POServiceLoginManagerConnection_rotateKeyForKeyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)completeRotationKeyForKeyType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if ([(POServiceLoginManagerConnection *)self _connectToService])
  {
    id v7 = [(POServiceLoginManagerConnection *)self xpcConnection];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __76__POServiceLoginManagerConnection_completeRotationKeyForKeyType_completion___block_invoke;
    v11[3] = &unk_264BBECD0;
    id v8 = v6;
    id v12 = v8;
    id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v11];
    [v9 completeRotationKeyForKeyType:a3 completion:v8];
  }
  else if (v6)
  {
    id v10 = [MEMORY[0x263F5E610] internalErrorWithMessage:@"Failed to connect to PSSO service"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

void __76__POServiceLoginManagerConnection_completeRotationKeyForKeyType_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__POServiceConnection_getLoginTypeForUser_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (BOOL)_connectToService
{
  if (self->_xpcConnection)
  {
    id v3 = PO_LOG_POServiceLoginManagerConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      -[POServiceConnection _connectToService]();
    }

    return 1;
  }
  id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.PlatformSSO.service-login-manager-xpc" options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  if (self->_xpcConnection)
  {
    if ([(POServiceLoginManagerConnection *)self uid]) {
      [(NSXPCConnection *)self->_xpcConnection _setTargetUserIdentifier:[(POServiceLoginManagerConnection *)self uid]];
    }
    id v6 = [MEMORY[0x263F5E618] interfaceWithInternalProtocol:&unk_26E5D62F0];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__POServiceLoginManagerConnection__connectToService__block_invoke;
    v14[3] = &unk_264BBECF8;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__POServiceLoginManagerConnection__connectToService__block_invoke_96;
    v12[3] = &unk_264BBECF8;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v12];
    id v7 = self->_xpcConnection;
    id v8 = +[POServiceLoginManagerConnection xpcQueue];
    [(NSXPCConnection *)v7 _setQueue:v8];

    [(NSXPCConnection *)self->_xpcConnection resume];
    id v9 = PO_LOG_POServiceLoginManagerConnection();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[POServiceConnection _connectToService]();
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    return 1;
  }
  id v11 = PO_LOG_POServiceLoginManagerConnection();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[POServiceConnection _connectToService]();
  }

  return 0;
}

void __52__POServiceLoginManagerConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setXpcConnection:0];
    id v3 = PO_LOG_POServiceLoginManagerConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__POServiceConnection__connectToService__block_invoke_cold_1();
    }
  }
}

void __52__POServiceLoginManagerConnection__connectToService__block_invoke_96(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = PO_LOG_POServiceLoginManagerConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __40__POServiceConnection__connectToService__block_invoke_80_cold_1();
    }
  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithUid:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  id v4 = "-[POServiceLoginManagerConnection initWithUid:]";
  __int16 v5 = 1026;
  int v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_debug_impl(&dword_230E51000, log, OS_LOG_TYPE_DEBUG, "%s uid = %{public}d on %@", (uint8_t *)&v3, 0x1Cu);
}

@end