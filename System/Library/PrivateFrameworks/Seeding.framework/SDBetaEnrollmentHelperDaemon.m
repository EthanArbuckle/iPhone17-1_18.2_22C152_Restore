@interface SDBetaEnrollmentHelperDaemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCConnection)connection;
- (void)addFBAHelpMenu:(id)a3;
- (void)addFBASymlink:(id)a3;
- (void)fetchBetaEnrollmentTokens:(id)a3;
- (void)isPreReleaseInstallationAllowed:(id)a3;
- (void)loadMDMConfigurationWithCompletion:(id)a3;
- (void)removeBetaEnrollmentData:(id)a3;
- (void)removeFBAHelpMenu:(id)a3;
- (void)removeSeedEnrollmentCookie:(id)a3;
- (void)saveMDMConfiguration:(id)a3 withCompletion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setupAssistant_enrollInProgramWithBetaEnrollmentToken:(id)a3 completion:(id)a4;
- (void)start;
@end

@implementation SDBetaEnrollmentHelperDaemon

- (void)start
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.seeding.enrollment-helper"];
  [v3 setDelegate:self];
  [v3 resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valueForEntitlement:@"com.apple.seeding.client-helper"];
  v9 = v8;
  if (v8 && ([v8 BOOLValue] & 1) != 0)
  {

    int v10 = [v7 processIdentifier];
    v11 = Log_3();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = v10;
      _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_DEFAULT, "New connection from pid [%ld]", buf, 0xCu);
    }

    v12 = SDHelperDaemonInterface();
    [v7 setExportedInterface:v12];

    [v7 setExportedObject:self];
    objc_initWeak((id *)buf, self);
    v13 = [v7 description];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __67__SDBetaEnrollmentHelperDaemon_listener_shouldAcceptNewConnection___block_invoke;
    v25[3] = &unk_1E6CD8950;
    id v14 = v13;
    id v26 = v14;
    objc_copyWeak(&v27, (id *)buf);
    [v7 setInvalidationHandler:v25];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __67__SDBetaEnrollmentHelperDaemon_listener_shouldAcceptNewConnection___block_invoke_1;
    v22 = &unk_1E6CD8950;
    id v15 = v14;
    id v23 = v15;
    objc_copyWeak(&v24, (id *)buf);
    [v7 setInterruptionHandler:&v19];
    -[SDBetaEnrollmentHelperDaemon setConnection:](self, "setConnection:", v7, v19, v20, v21, v22);
    [v7 resume];
    objc_destroyWeak(&v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
    BOOL v16 = 1;
  }
  else
  {
    v17 = Log_3();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SDBetaEnrollmentHelperDaemon listener:shouldAcceptNewConnection:](v7, v17);
    }

    BOOL v16 = 0;
  }

  return v16;
}

void __67__SDBetaEnrollmentHelperDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = Log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was invalidated", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setConnection:0];
}

void __67__SDBetaEnrollmentHelperDaemon_listener_shouldAcceptNewConnection___block_invoke_1(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = Log_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was interrupted", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setConnection:0];
}

- (void)addFBAHelpMenu:(id)a3
{
}

- (void)removeFBAHelpMenu:(id)a3
{
}

- (void)addFBASymlink:(id)a3
{
}

- (void)isPreReleaseInstallationAllowed:(id)a3
{
  id v4 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v4, +[SDSeedProgramManager _canEnrollInBetaSoftware]);
}

- (void)removeSeedEnrollmentCookie:(id)a3
{
  id v4 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v4, +[SDSeedProgramManager _removeSeedEnrollmentCookie]);
}

- (void)removeBetaEnrollmentData:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t))a3;
  id v4 = Log_3();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Deleting beta enrollment data", v6, 2u);
  }

  int v5 = +[SDBetaManager sharedManager];
  [v5 _deleteBetaProgram];

  v3[2](v3, 1);
}

- (void)setupAssistant_enrollInProgramWithBetaEnrollmentToken:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[SDBetaManager sharedManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__SDBetaEnrollmentHelperDaemon_setupAssistant_enrollInProgramWithBetaEnrollmentToken_completion___block_invoke;
  v9[3] = &unk_1E6CD84F0;
  id v10 = v5;
  id v8 = v5;
  [v7 enrollInProgramWithToken:v6 userIdentifier:0 completion:v9];
}

void __97__SDBetaEnrollmentHelperDaemon_setupAssistant_enrollInProgramWithBetaEnrollmentToken_completion___block_invoke(uint64_t a1, unint64_t a2)
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

- (void)fetchBetaEnrollmentTokens:(id)a3
{
  uint64_t v3 = (void (**)(id, id))a3;
  uint64_t v4 = +[SDPersistence betaEnrollmentTokensFromOldLocation];
  id v5 = [v4 allObjects];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  v3[2](v3, v8);
}

- (void)saveMDMConfiguration:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = +[SDPersistence saveMDMConfiguration:a3];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)loadMDMConfigurationWithCompletion:(id)a3
{
  id v6 = 0;
  uint64_t v3 = (void (**)(id, id, void *))a3;
  uint64_t v4 = +[SDPersistence loadMDMConfigurationWithError:&v6];
  id v5 = v6;
  v3[2](v3, v5, v4);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = (int)[a1 processIdentifier];
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "A client [%ld] tried to use Seeding.fmwk but is not entitled.", (uint8_t *)&v3, 0xCu);
}

@end