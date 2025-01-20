@interface SDBetaEnrollmentHelper
+ (id)sharedInstance;
- (BOOL)isPreReleaseInstallationAllowed;
- (NSXPCConnection)daemonConnection;
- (SDBetaEnrollmentHelper)init;
- (id)fetchBetaEnrollmentTokensWithError:(id *)a3;
- (id)loadMDMConfigurationWithError:(id *)a3;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithCompletion:(id)a3;
- (id)synchronousDaemonRemoteObjectProxyWithError:(id *)a3;
- (id)synchronousRemoteObjectProxy;
- (void)addFBAHelpMenu:(id)a3;
- (void)addFBASymlink:(id)a3;
- (void)connectToDaemon;
- (void)removeBetaEnrollmentData;
- (void)removeFBAHelpMenu:(id)a3;
- (void)removeSeedEnrollmentCookie:(id)a3;
- (void)saveMDMConfiguration:(id)a3 withError:(id *)a4;
- (void)setDaemonConnection:(id)a3;
- (void)setupAssistant_enrollInProgramWithBetaEnrollmentToken:(id)a3 completion:(id)a4;
@end

@implementation SDBetaEnrollmentHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_client_0;
  return v2;
}

uint64_t __40__SDBetaEnrollmentHelper_sharedInstance__block_invoke()
{
  sharedInstance_client_0 = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (SDBetaEnrollmentHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)SDBetaEnrollmentHelper;
  v2 = [(SDBetaEnrollmentHelper *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SDBetaEnrollmentHelper *)v2 connectToDaemon];
  }
  return v3;
}

- (void)connectToDaemon
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_daemonConnection)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.seeding.enrollment-helper" options:4096];
    daemonConnection = v2->_daemonConnection;
    v2->_daemonConnection = (NSXPCConnection *)v3;

    objc_super v5 = SDHelperDaemonInterface();
    [(NSXPCConnection *)v2->_daemonConnection setRemoteObjectInterface:v5];

    objc_initWeak(&location, v2);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke;
    v8[3] = &unk_1E6CD7F80;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)v2->_daemonConnection setInvalidationHandler:v8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_66;
    v6[3] = &unk_1E6CD7F80;
    objc_copyWeak(&v7, &location);
    [(NSXPCConnection *)v2->_daemonConnection setInterruptionHandler:v6];
    [(NSXPCConnection *)v2->_daemonConnection resume];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);
}

void __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke(uint64_t a1)
{
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDaemonConnection:0];
}

void __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_66(uint64_t a1)
{
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_66_cold_1(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setDaemonConnection:0];
}

- (id)remoteObjectProxyWithCompletion:(id)a3
{
  id v4 = a3;
  if (!self->_daemonConnection) {
    [(SDBetaEnrollmentHelper *)self connectToDaemon];
  }
  objc_super v5 = [(SDBetaEnrollmentHelper *)self daemonConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__SDBetaEnrollmentHelper_remoteObjectProxyWithCompletion___block_invoke;
  v9[3] = &unk_1E6CD7F38;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __58__SDBetaEnrollmentHelper_remoteObjectProxyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__SDBetaEnrollmentHelper_remoteObjectProxyWithCompletion___block_invoke_cold_1(v3);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (id)remoteObjectProxy
{
  return [(SDBetaEnrollmentHelper *)self remoteObjectProxyWithCompletion:0];
}

- (id)synchronousRemoteObjectProxy
{
  if (!self->_daemonConnection) {
    [(SDBetaEnrollmentHelper *)self connectToDaemon];
  }
  id v3 = [(SDBetaEnrollmentHelper *)self daemonConnection];
  id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_69];

  return v4;
}

void __54__SDBetaEnrollmentHelper_synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = Log_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __54__SDBetaEnrollmentHelper_synchronousRemoteObjectProxy__block_invoke_cold_1(v2);
  }
}

- (id)synchronousDaemonRemoteObjectProxyWithError:(id *)a3
{
  if (!self->_daemonConnection) {
    [(SDBetaEnrollmentHelper *)self connectToDaemon];
  }
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  uint64_t v5 = [(SDBetaEnrollmentHelper *)self daemonConnection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke;
  v11[3] = &unk_1E6CD7FC8;
  v11[4] = &v12;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];

  id v7 = v13;
  if (a3)
  {
    v8 = (void *)v13[5];
    if (v8)
    {
      *a3 = v8;
      id v7 = v13;
    }
  }
  if (v7[5]) {
    id v9 = 0;
  }
  else {
    id v9 = v6;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = Log_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke_cold_1(v3);
  }

  uint64_t v5 = [v3 copy];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)addFBASymlink:(id)a3
{
  id v4 = a3;
  id v5 = [(SDBetaEnrollmentHelper *)self remoteObjectProxy];
  [v5 addFBASymlink:v4];
}

- (void)addFBAHelpMenu:(id)a3
{
  id v4 = a3;
  id v5 = [(SDBetaEnrollmentHelper *)self remoteObjectProxy];
  [v5 addFBAHelpMenu:v4];
}

- (void)removeFBAHelpMenu:(id)a3
{
  id v4 = a3;
  id v5 = [(SDBetaEnrollmentHelper *)self remoteObjectProxy];
  [v5 removeFBAHelpMenu:v4];
}

- (BOOL)isPreReleaseInstallationAllowed
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  id v2 = [(SDBetaEnrollmentHelper *)self synchronousRemoteObjectProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SDBetaEnrollmentHelper_isPreReleaseInstallationAllowed__block_invoke;
  v4[3] = &unk_1E6CD7FF0;
  v4[4] = &v5;
  [v2 isPreReleaseInstallationAllowed:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __57__SDBetaEnrollmentHelper_isPreReleaseInstallationAllowed__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)removeSeedEnrollmentCookie:(id)a3
{
  id v4 = a3;
  id v5 = [(SDBetaEnrollmentHelper *)self remoteObjectProxy];
  [v5 removeSeedEnrollmentCookie:v4];
}

- (void)removeBetaEnrollmentData
{
  id v2 = [(SDBetaEnrollmentHelper *)self synchronousRemoteObjectProxy];
  [v2 removeBetaEnrollmentData:&__block_literal_global_72];
}

void __50__SDBetaEnrollmentHelper_removeBetaEnrollmentData__block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = Log_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __50__SDBetaEnrollmentHelper_removeBetaEnrollmentData__block_invoke_cold_1(v2);
    }
  }
}

- (void)setupAssistant_enrollInProgramWithBetaEnrollmentToken:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SDBetaEnrollmentHelper *)self remoteObjectProxyWithCompletion:v6];
  objc_msgSend(v8, "setupAssistant_enrollInProgramWithBetaEnrollmentToken:completion:", v7, v6);
}

- (id)fetchBetaEnrollmentTokensWithError:(id *)a3
{
  id v4 = -[SDBetaEnrollmentHelper synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:");
  id v5 = v4;
  if (*a3) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4 == 0;
  }
  if (v6)
  {
    id v7 = (id)objc_opt_new();
  }
  else
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy_;
    uint64_t v14 = __Block_byref_object_dispose_;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__SDBetaEnrollmentHelper_fetchBetaEnrollmentTokensWithError___block_invoke;
    v9[3] = &unk_1E6CD8018;
    void v9[4] = &v10;
    [v4 fetchBetaEnrollmentTokens:v9];
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  return v7;
}

uint64_t __61__SDBetaEnrollmentHelper_fetchBetaEnrollmentTokensWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F1CAD0] setWithArray:a2];
  return MEMORY[0x1F41817F8]();
}

- (void)saveMDMConfiguration:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(SDBetaEnrollmentHelper *)self synchronousDaemonRemoteObjectProxyWithError:a4];
  id v8 = v7;
  if (*a4) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy_;
    v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__SDBetaEnrollmentHelper_saveMDMConfiguration_withError___block_invoke;
    v11[3] = &unk_1E6CD7FC8;
    v11[4] = &v12;
    [v7 saveMDMConfiguration:v6 withCompletion:v11];
    uint64_t v10 = (void *)v13[5];
    if (v10) {
      *a4 = v10;
    }
    _Block_object_dispose(&v12, 8);
  }
}

void __57__SDBetaEnrollmentHelper_saveMDMConfiguration_withError___block_invoke(uint64_t a1, void *a2)
{
}

- (id)loadMDMConfigurationWithError:(id *)a3
{
  id v4 = -[SDBetaEnrollmentHelper synchronousDaemonRemoteObjectProxyWithError:](self, "synchronousDaemonRemoteObjectProxyWithError:");
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
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    id v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __56__SDBetaEnrollmentHelper_loadMDMConfigurationWithError___block_invoke;
    v10[3] = &unk_1E6CD8040;
    v10[4] = &v17;
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

void __56__SDBetaEnrollmentHelper_loadMDMConfigurationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
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

void __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD702000, log, OS_LOG_TYPE_DEBUG, "fbahelperd connection invalidated", v1, 2u);
}

void __41__SDBetaEnrollmentHelper_connectToDaemon__block_invoke_66_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD702000, log, OS_LOG_TYPE_DEBUG, "fbahelperd connection interrupted", v1, 2u);
}

void __58__SDBetaEnrollmentHelper_remoteObjectProxyWithCompletion___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Failed to get remote object proxy to root helper: %{public}@.", v4, v5, v6, v7, 2u);
}

void __54__SDBetaEnrollmentHelper_synchronousRemoteObjectProxy__block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Failed to get synchronous remote object proxy to root helper: %{public}@.", v4, v5, v6, v7, 2u);
}

void __70__SDBetaEnrollmentHelper_synchronousDaemonRemoteObjectProxyWithError___block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "Failed to get synchronous remote object proxy to betaenrollmentd: %{public}@", v4, v5, v6, v7, 2u);
}

void __50__SDBetaEnrollmentHelper_removeBetaEnrollmentData__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD702000, log, OS_LOG_TYPE_ERROR, "Failed to remove Beta enrollment data", v1, 2u);
}

@end