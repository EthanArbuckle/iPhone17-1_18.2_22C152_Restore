@interface SDDaemonClient
+ (id)sharedInstance;
- (BOOL)canCurrentDeviceEnrollInBetaProgram;
- (BOOL)isCurrentDeviceUsingSeedingAppleID;
- (NSXPCConnection)daemonConnection;
- (SDDaemonClient)init;
- (id)_SDErrorForDaemonClientErrorType;
- (id)deviceAppleIDUsernameForCurrentDevice;
- (id)getCurrentDeviceEnrolledBetaProgramSynchronously;
- (id)getCurrentDeviceSynchronously;
- (id)loadMDMConfigurationWithError:(id *)a3;
- (id)seedingAppleIDUsernameForCurrentDevice;
- (id)synchronousDaemonRemoteObjectProxy;
- (id)synchronousDaemonRemoteObjectProxyWithError:(id *)a3;
- (void)betaenrollmentdProxyObjectWithCompletion:(id)a3;
- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4;
- (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 error:(id *)a6;
- (void)deleteSeedingAppleAccountWithCompletion:(id)a3;
- (void)enrollDevice:(id)a3 inProgram:(id)a4 completion:(id)a5;
- (void)enrollInProgramWithToken:(id)a3 completion:(id)a4;
- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4;
- (void)getCurrentDevice:(id)a3;
- (void)getDevicesForPlatforms:(unint64_t)a3 completion:(id)a4;
- (void)initializeDaemonConnection;
- (void)invalidateCacheWithCompletion:(id)a3;
- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4;
- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4;
- (void)seedingAppleIDUsernameForCurrentDevice:(id)a3;
- (void)setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:(id)a3 completion:(id)a4;
- (void)setDaemonConnection:(id)a3;
- (void)unenrollDevice:(id)a3 completion:(id)a4;
@end

@implementation SDDaemonClient

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_client_1;
  return v2;
}

uint64_t __32__SDDaemonClient_sharedInstance__block_invoke()
{
  sharedInstance_client_1 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (SDDaemonClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)SDDaemonClient;
  v2 = [(SDDaemonClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SDDaemonClient *)v2 initializeDaemonConnection];
  }
  return v3;
}

- (void)initializeDaemonConnection
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_daemonConnection)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.seeding.client" options:4096];
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = (NSXPCConnection *)v3;

    objc_super v5 = +[SDDaemonCommon _allowListedXPCServerInterface];
    [(NSXPCConnection *)v2->_daemonConnection setRemoteObjectInterface:v5];

    v6 = +[SDDaemonCommon _allowListedXPCClientInterface];
    [(NSXPCConnection *)v2->_daemonConnection setExportedInterface:v6];

    [(NSXPCConnection *)v2->_daemonConnection setExportedObject:v2];
    objc_initWeak(&location, v2);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__SDDaemonClient_initializeDaemonConnection__block_invoke;
    v9[3] = &unk_1E6CD7F80;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)v2->_daemonConnection setInvalidationHandler:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__SDDaemonClient_initializeDaemonConnection__block_invoke_3;
    v7[3] = &unk_1E6CD7F80;
    objc_copyWeak(&v8, &location);
    [(NSXPCConnection *)v2->_daemonConnection setInterruptionHandler:v7];
    [(NSXPCConnection *)v2->_daemonConnection resume];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

void __44__SDDaemonClient_initializeDaemonConnection__block_invoke(uint64_t a1)
{
  v2 = Log_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __44__SDDaemonClient_initializeDaemonConnection__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDaemonConnection:0];
}

void __44__SDDaemonClient_initializeDaemonConnection__block_invoke_3(uint64_t a1)
{
  v2 = Log_2();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __44__SDDaemonClient_initializeDaemonConnection__block_invoke_3_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDaemonConnection:0];
}

- (void)betaenrollmentdProxyObjectWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_daemonConnection) {
    [(SDDaemonClient *)self initializeDaemonConnection];
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  objc_super v5 = [(SDDaemonClient *)self daemonConnection];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __59__SDDaemonClient_betaenrollmentdProxyObjectWithCompletion___block_invoke;
  v14 = &unk_1E6CD82E8;
  v16 = &v17;
  id v6 = v4;
  id v15 = v6;
  v7 = [v5 remoteObjectProxyWithErrorHandler:&v11];

  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F38ECAA8, v11, v12, v13, v14))
  {
    id v8 = v18;
    if (!*((unsigned char *)v18 + 24))
    {
      (*((void (**)(id, void *, void))v6 + 2))(v6, v7, 0);
      id v8 = v18;
    }
  }
  else
  {
    v9 = Log_2();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[SDDaemonClient betaenrollmentdProxyObjectWithCompletion:]();
    }

    id v8 = v18;
    if (!*((unsigned char *)v18 + 24))
    {
      id v10 = [(SDDaemonClient *)self _SDErrorForDaemonClientErrorType];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);

      id v8 = v18;
    }
    *((unsigned char *)v8 + 24) = 1;
  }
  *((unsigned char *)v8 + 24) = 1;

  _Block_object_dispose(&v17, 8);
}

void __59__SDDaemonClient_betaenrollmentdProxyObjectWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __59__SDDaemonClient_betaenrollmentdProxyObjectWithCompletion___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v5 + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = 1;
}

- (id)synchronousDaemonRemoteObjectProxy
{
  return [(SDDaemonClient *)self synchronousDaemonRemoteObjectProxyWithError:0];
}

- (id)synchronousDaemonRemoteObjectProxyWithError:(id *)a3
{
  if (!self->_daemonConnection) {
    [(SDDaemonClient *)self initializeDaemonConnection];
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v5 = [(SDDaemonClient *)self daemonConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__SDDaemonClient_synchronousDaemonRemoteObjectProxyWithError___block_invoke;
  v12[3] = &unk_1E6CD7FC8;
  v12[4] = &v13;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v12];

  v7 = v14;
  if (a3)
  {
    id v8 = (void *)v14[5];
    if (v8)
    {
      *a3 = v8;
      v7 = v14;
    }
  }
  if (v7[5]) {
    goto LABEL_7;
  }
  if ([v6 conformsToProtocol:&unk_1F38ECAA8])
  {
    id v9 = v6;
  }
  else
  {
    id v10 = Log_2();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[SDDaemonClient synchronousDaemonRemoteObjectProxyWithError:]();
    }

    if (!a3)
    {
LABEL_7:
      id v9 = 0;
      goto LABEL_14;
    }
    [(SDDaemonClient *)self _SDErrorForDaemonClientErrorType];
    id v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __62__SDDaemonClient_synchronousDaemonRemoteObjectProxyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke_cold_1(v3);
  }

  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)getCurrentDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SDDaemonClient_getCurrentDevice___block_invoke;
  v6[3] = &unk_1E6CD8310;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v6];
}

void __35__SDDaemonClient_getCurrentDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    id v7 = [*(id *)(a1 + 32) _SDErrorForDaemonClientErrorType];
    id v5 = [v7 description];
    uint64_t v6 = +[SDDevice blankDeviceWithErrorMessage:v5];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    [a2 getCurrentDevice:v4];
  }
}

- (id)getCurrentDeviceSynchronously
{
  v2 = [(SDDaemonClient *)self synchronousDaemonRemoteObjectProxy];
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__0;
  id v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__SDDaemonClient_getCurrentDeviceSynchronously__block_invoke;
  v5[3] = &unk_1E6CD8338;
  v5[4] = &v6;
  [v2 getCurrentDevice:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__SDDaemonClient_getCurrentDeviceSynchronously__block_invoke(uint64_t a1, void *a2)
{
}

- (void)enrollDevice:(id)a3 inProgram:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __52__SDDaemonClient_enrollDevice_inProgram_completion___block_invoke;
  v14[3] = &unk_1E6CD8360;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v14];
}

uint64_t __52__SDDaemonClient_enrollDevice_inProgram_completion___block_invoke(void *a1, void *a2, uint64_t a3)
{
  if (!a2 || a3) {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  else {
    return [a2 enrollDevice:a1[4] inProgram:a1[5] completion:a1[6]];
  }
}

- (void)getDevicesForPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__SDDaemonClient_getDevicesForPlatforms_completion___block_invoke;
  v8[3] = &unk_1E6CD8388;
  id v9 = v6;
  unint64_t v10 = a3;
  id v7 = v6;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v8];
}

uint64_t __52__SDDaemonClient_getDevicesForPlatforms_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return [a2 getDevicesForPlatforms:*(void *)(a1 + 40) completion:*(void *)(a1 + 32)];
  }
}

- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SDDaemonClient_queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke;
  v8[3] = &unk_1E6CD8388;
  id v9 = v6;
  unint64_t v10 = a3;
  id v7 = v6;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v8];
}

uint64_t __73__SDDaemonClient_queryProgramsForSystemAccountsWithPlatforms_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return [a2 queryProgramsForSystemAccountsWithPlatforms:*(void *)(a1 + 40) completion:*(void *)(a1 + 32)];
  }
}

- (BOOL)canCurrentDeviceEnrollInBetaProgram
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v3 = [(SDDaemonClient *)self synchronousDaemonRemoteObjectProxy];
  uint64_t v4 = [(SDDaemonClient *)self getCurrentDeviceSynchronously];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__SDDaemonClient_canCurrentDeviceEnrollInBetaProgram__block_invoke;
  v6[3] = &unk_1E6CD7FF0;
  v6[4] = &v7;
  [v3 canDeviceEnrollInBetaUpdates:v4 completion:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

uint64_t __53__SDDaemonClient_canCurrentDeviceEnrollInBetaProgram__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__SDDaemonClient_isDeviceEnrolledInBetaProgram_completion___block_invoke;
  v10[3] = &unk_1E6CD83B0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v10];
}

uint64_t __59__SDDaemonClient_isDeviceEnrolledInBetaProgram_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [a2 isDeviceEnrolledInBetaProgram:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__SDDaemonClient_enrolledBetaProgramForDevice_completion___block_invoke;
  v10[3] = &unk_1E6CD83B0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v10];
}

uint64_t __58__SDDaemonClient_enrolledBetaProgramForDevice_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [a2 enrolledBetaProgramForDevice:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (id)getCurrentDeviceEnrolledBetaProgramSynchronously
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v3 = [(SDDaemonClient *)self synchronousDaemonRemoteObjectProxy];
  uint64_t v4 = [(SDDaemonClient *)self getCurrentDeviceSynchronously];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__SDDaemonClient_getCurrentDeviceEnrolledBetaProgramSynchronously__block_invoke;
  v7[3] = &unk_1E6CD83D8;
  void v7[4] = &v8;
  [v3 enrolledBetaProgramForDevice:v4 completion:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __66__SDDaemonClient_getCurrentDeviceEnrolledBetaProgramSynchronously__block_invoke(uint64_t a1, void *a2)
{
}

- (void)unenrollDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__SDDaemonClient_unenrollDevice_completion___block_invoke;
  v10[3] = &unk_1E6CD83B0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v10];
}

uint64_t __44__SDDaemonClient_unenrollDevice_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [a2 unenrollDevice:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__SDDaemonClient_canFileFeedbackOnDevice_completion___block_invoke;
  v10[3] = &unk_1E6CD83B0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v10];
}

uint64_t __53__SDDaemonClient_canFileFeedbackOnDevice_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [a2 canFileFeedbackOnDevice:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

- (id)seedingAppleIDUsernameForCurrentDevice
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v3 = [(SDDaemonClient *)self synchronousDaemonRemoteObjectProxy];
  uint64_t v4 = [(SDDaemonClient *)self getCurrentDeviceSynchronously];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice__block_invoke;
  v7[3] = &unk_1E6CD8400;
  void v7[4] = &v8;
  [v3 getCurrentSeedingAppleIDForDevice:v4 completion:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
}

- (void)seedingAppleIDUsernameForCurrentDevice:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke;
  v6[3] = &unk_1E6CD8478;
  id v7 = v4;
  id v5 = v4;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v6];
}

void __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke_2;
    v7[3] = &unk_1E6CD8450;
    id v8 = v5;
    id v9 = *(id *)(a1 + 32);
    [v8 getCurrentDevice:v7];
  }
}

void __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke_3;
  v4[3] = &unk_1E6CD8428;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 getCurrentSeedingAppleIDForDevice:a2 completion:v4];
}

uint64_t __57__SDDaemonClient_seedingAppleIDUsernameForCurrentDevice___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)deviceAppleIDUsernameForCurrentDevice
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v3 = [(SDDaemonClient *)self synchronousDaemonRemoteObjectProxy];
  id v4 = [(SDDaemonClient *)self getCurrentDeviceSynchronously];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SDDaemonClient_deviceAppleIDUsernameForCurrentDevice__block_invoke;
  v7[3] = &unk_1E6CD84A0;
  void v7[4] = &v8;
  [v3 getCurrentPrimaryAppleIDForDevice:v4 completion:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __55__SDDaemonClient_deviceAppleIDUsernameForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
}

- (void)setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke;
  v10[3] = &unk_1E6CD83B0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v10];
}

void __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke_2;
    v7[3] = &unk_1E6CD84C8;
    id v8 = v5;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    [v8 getCurrentDevice:v7];
  }
}

void __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke_3;
  v5[3] = &unk_1E6CD7F38;
  id v6 = *(id *)(a1 + 48);
  [v3 setAppleAccountIdentifierFromAlternateDSID:v4 forDevice:a2 completion:v5];
}

uint64_t __88__SDDaemonClient_setAppleAccountIdentifierWithAlternateDSIDForCurrentDevice_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteSeedingAppleAccountWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke;
  v6[3] = &unk_1E6CD8478;
  id v7 = v4;
  id v5 = v4;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v6];
}

void __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke_2;
    v7[3] = &unk_1E6CD8450;
    id v8 = v5;
    id v9 = *(id *)(a1 + 32);
    [v8 getCurrentDevice:v7];
  }
}

void __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke_3;
  v4[3] = &unk_1E6CD7F38;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 deleteSeedingAppleAccountForDevice:a2 completion:v4];
}

uint64_t __58__SDDaemonClient_deleteSeedingAppleAccountWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isCurrentDeviceUsingSeedingAppleID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v3 = [(SDDaemonClient *)self synchronousDaemonRemoteObjectProxy];
  id v4 = [(SDDaemonClient *)self getCurrentDeviceSynchronously];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SDDaemonClient_isCurrentDeviceUsingSeedingAppleID__block_invoke;
  v6[3] = &unk_1E6CD7FF0;
  void v6[4] = &v7;
  [v3 isDeviceUsingSeedingAppleID:v4 completion:v6];

  LOBYTE(v3) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

uint64_t __52__SDDaemonClient_isCurrentDeviceUsingSeedingAppleID__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)invalidateCacheWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SDDaemonClient_invalidateCacheWithCompletion___block_invoke;
  v6[3] = &unk_1E6CD8478;
  id v7 = v4;
  id v5 = v4;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v6];
}

uint64_t __48__SDDaemonClient_invalidateCacheWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!a2 || a3) {
    return (*(uint64_t (**)(void, uint64_t))(v3 + 16))(*(void *)(a1 + 32), a3);
  }
  else {
    return [a2 invalidateDaemonCacheWithCompletion:v3];
  }
}

- (void)enrollInProgramWithToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__SDDaemonClient_enrollInProgramWithToken_completion___block_invoke;
  v10[3] = &unk_1E6CD8310;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(SDDaemonClient *)self betaenrollmentdProxyObjectWithCompletion:v10];
}

void __54__SDDaemonClient_enrollInProgramWithToken_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__SDDaemonClient_enrollInProgramWithToken_completion___block_invoke_2;
    v6[3] = &unk_1E6CD84F0;
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [a2 enrollInProgramWithToken:v5 completion:v6];
  }
}

void __54__SDDaemonClient_enrollInProgramWithToken_completion___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    SDMDMConfiguratorErrorWithType(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    uint64_t v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

- (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(SDDaemonClient *)self synchronousDaemonRemoteObjectProxyWithError:a6];
  id v13 = v12;
  if (*a6) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v12 == 0;
  }
  if (!v14)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__SDDaemonClient_configureWithOfferProgramTokens_requireProgramToken_enrollmentPolicy_error___block_invoke;
    v16[3] = &unk_1E6CD8518;
    v16[4] = &v17;
    [v12 configureWithOfferProgramTokens:v10 requireProgramToken:v11 enrollmentPolicy:a5 completion:v16];
    unint64_t v15 = v18[3];
    if (v15)
    {
      SDMDMConfiguratorErrorWithType(v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(&v17, 8);
  }
}

uint64_t __93__SDDaemonClient_configureWithOfferProgramTokens_requireProgramToken_enrollmentPolicy_error___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)loadMDMConfigurationWithError:(id *)a3
{
  uint64_t v4 = -[SDDaemonClient synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:");
  id v5 = v4;
  if (*a3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__0;
    v21 = __Block_byref_object_dispose__0;
    id v22 = 0;
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    BOOL v14 = __Block_byref_object_copy__0;
    unint64_t v15 = __Block_byref_object_dispose__0;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__SDDaemonClient_loadMDMConfigurationWithError___block_invoke;
    v10[3] = &unk_1E6CD8040;
    void v10[4] = &v17;
    v10[5] = &v11;
    [v4 loadMDMConfigurationWithCompletion:v10];
    id v8 = (void *)v18[5];
    if (v8)
    {
      id v7 = 0;
      *a3 = v8;
    }
    else
    {
      id v7 = (id)v12[5];
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }

  return v7;
}

void __48__SDDaemonClient_loadMDMConfigurationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_SDErrorForDaemonClientErrorType
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.seeding.daemon-client" code:0 userInfo:0];
}

- (NSXPCConnection)daemonConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDaemonConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __44__SDDaemonClient_initializeDaemonConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1DD702000, v0, OS_LOG_TYPE_DEBUG, "betaenrollmentd connection invalidated", v1, 2u);
}

void __44__SDDaemonClient_initializeDaemonConnection__block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1DD702000, v0, OS_LOG_TYPE_DEBUG, "betaenrollmentd connection interrupted", v1, 2u);
}

- (void)betaenrollmentdProxyObjectWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1DD702000, v0, OS_LOG_TYPE_FAULT, "Found a betaenrollmentdProxy that does not conform to SDDaemonXPCServer", v1, 2u);
}

void __59__SDDaemonClient_betaenrollmentdProxyObjectWithCompletion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Failed to get remote object proxy to betaenrollmentd: %{public}@.", v4, v5, v6, v7, 2u);
}

- (void)synchronousDaemonRemoteObjectProxyWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1DD702000, v0, OS_LOG_TYPE_FAULT, "Found a remoteObjectProxy that does not conform to SDDaemonXPCServer", v1, 2u);
}

@end