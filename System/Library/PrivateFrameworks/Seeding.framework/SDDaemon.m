@interface SDDaemon
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)appConnections;
- (NSNumber)userIdentifier;
- (NSXPCListener)listener;
- (id)_connectionForPid:(id)a3;
- (id)remoteObjectProxyForPID:(id)a3;
- (int)profileToken;
- (void)_releaseAppConnectionWithPid:(int)a3;
- (void)_startListeningForProfileChanges;
- (void)_stopListeningForProfileChanges;
- (void)_storeAppConnection:(id)a3;
- (void)_verifyCurrentDevice;
- (void)canDeviceEnrollInBetaUpdates:(id)a3 completion:(id)a4;
- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4;
- (void)checkIn;
- (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 completion:(id)a6;
- (void)dealloc;
- (void)deleteSeedingAppleAccountForDevice:(id)a3 completion:(id)a4;
- (void)enrollDevice:(id)a3 inProgram:(id)a4 completion:(id)a5;
- (void)enrollInProgramWithToken:(id)a3 completion:(id)a4;
- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4;
- (void)getCurrentDevice:(id)a3;
- (void)getCurrentPrimaryAppleIDForDevice:(id)a3 completion:(id)a4;
- (void)getCurrentSeedingAppleIDForDevice:(id)a3 completion:(id)a4;
- (void)getDevicesForPlatforms:(unint64_t)a3 completion:(id)a4;
- (void)invalidateDaemonCacheWithCompletion:(id)a3;
- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4;
- (void)isDeviceUsingSeedingAppleID:(id)a3 completion:(id)a4;
- (void)loadMDMConfigurationWithCompletion:(id)a3;
- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4;
- (void)setAppConnections:(id)a3;
- (void)setAppleAccountIdentifierFromAlternateDSID:(id)a3 forDevice:(id)a4 completion:(id)a5;
- (void)setListener:(id)a3;
- (void)setProfileToken:(int)a3;
- (void)setUserIdentifier:(id)a3;
- (void)start;
- (void)unenrollDevice:(id)a3 completion:(id)a4;
@end

@implementation SDDaemon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_daemon;
  return v2;
}

uint64_t __26__SDDaemon_sharedInstance__block_invoke()
{
  sharedInstance_daemon = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(SDDaemon *)self _stopListeningForProfileChanges];
  v3.receiver = self;
  v3.super_class = (Class)SDDaemon;
  [(SDDaemon *)&v3 dealloc];
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    v15 = "-[SDDaemon start]";
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  id v4 = +[SDAnalytics deviceIdentifier];
  v5 = +[SDBetaManager sharedManager];
  [v5 _migrateFromProfilesIfNeeded];

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.seeding.client"];
  [(SDDaemon *)self setListener:v6];

  id v7 = [NSString stringWithFormat:@"%@-listener-queue", @"com.apple.seeding.client"];
  v8 = dispatch_queue_create((const char *)[v7 cStringUsingEncoding:4], 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __17__SDDaemon_start__block_invoke;
  block[3] = &unk_1E6CD7D28;
  block[4] = self;
  dispatch_async(v8, block);

  if (_os_feature_enabled_impl())
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v10 = *MEMORY[0x1E4F28A30];
    v11 = [MEMORY[0x1E4F29130] defaultStore];
    id v12 = (id)[v9 addObserverForName:v10 object:v11 queue:0 usingBlock:&__block_literal_global_17];
  }
  if (_os_feature_enabled_impl()) {
    [(SDDaemon *)self _startListeningForProfileChanges];
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E4F14428], &__block_literal_global_23);
  [(SDDaemon *)self checkIn];
}

void __17__SDDaemon_start__block_invoke(uint64_t a1)
{
  v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __17__SDDaemon_start__block_invoke_cold_2(v2);
  }

  objc_super v3 = *(void **)(a1 + 32);
  id v4 = [v3 listener];
  [v4 setDelegate:v3];

  v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __17__SDDaemon_start__block_invoke_cold_1(v5);
  }

  v6 = [*(id *)(a1 + 32) listener];
  [v6 resume];
}

void __17__SDDaemon_start__block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_DEFAULT, "Got an iCKVS notification: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F29130] defaultStore];
  [v4 synchronize];
}

- (void)_startListeningForProfileChanges
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_super v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    id v12 = "-[SDDaemon _startListeningForProfileChanges]";
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  int profileToken = self->_profileToken;
  p_int profileToken = &self->_profileToken;
  if (!profileToken)
  {
    id v6 = Log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_INFO, "Registering to listen for profile installations.", buf, 2u);
    }

    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.seeding"];
    v9 = @"EnableProfiles";
    uint64_t v10 = MEMORY[0x1E4F1CC38];
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v7 registerDefaults:v8];

    notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", p_profileToken, MEMORY[0x1E4F14428], &__block_literal_global_29);
    +[SDProfileUtilities removeSeedProfileIfRestricted];
  }
}

uint64_t __44__SDDaemon__startListeningForProfileChanges__block_invoke()
{
  v0 = Log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_1DD702000, v0, OS_LOG_TYPE_DEFAULT, "Detected installation of a profile, will try removing if it's a seed profile.", v2, 2u);
  }

  return +[SDProfileUtilities removeSeedProfileIfRestricted];
}

- (void)_stopListeningForProfileChanges
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136446210;
    id v6 = "-[SDDaemon _stopListeningForProfileChanges]";
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v5, 0xCu);
  }

  int profileToken = self->_profileToken;
  if (profileToken)
  {
    notify_cancel(profileToken);
    self->_int profileToken = 0;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 valueForEntitlement:@"com.apple.private.seeding.client"];
  v9 = v8;
  if (v8 && ([v8 BOOLValue] & 1) != 0)
  {

    int v10 = [v7 processIdentifier];
    v11 = Log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v10;
      _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_DEFAULT, "New connection from pid [%ld]", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    id v12 = +[SDDaemonCommon _allowListedXPCClientInterface];
    [v7 setRemoteObjectInterface:v12];

    uint64_t v13 = +[SDDaemonCommon _allowListedXPCServerInterface];
    [v7 setExportedInterface:v13];

    [v7 setExportedObject:self];
    v14 = [v7 description];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __47__SDDaemon_listener_shouldAcceptNewConnection___block_invoke;
    v28[3] = &unk_1E6CD7DB0;
    id v15 = v14;
    id v29 = v15;
    objc_copyWeak(&v30, (id *)buf);
    int v31 = v10;
    [v7 setInvalidationHandler:v28];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __47__SDDaemon_listener_shouldAcceptNewConnection___block_invoke_32;
    v24 = &unk_1E6CD7DB0;
    id v16 = v15;
    id v25 = v16;
    objc_copyWeak(&v26, (id *)buf);
    int v27 = v10;
    [v7 setInterruptionHandler:&v21];
    id WeakRetained = objc_loadWeakRetained((id *)buf);
    objc_msgSend(WeakRetained, "_storeAppConnection:", v7, v21, v22, v23, v24);

    [v7 resume];
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);
    BOOL v18 = 1;
  }
  else
  {
    v19 = Log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[SDDaemon listener:shouldAcceptNewConnection:](v7);
    }

    BOOL v18 = 0;
  }

  return v18;
}

void __47__SDDaemon_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was invalidated", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _releaseAppConnectionWithPid:*(unsigned int *)(a1 + 48)];
}

void __47__SDDaemon_listener_shouldAcceptNewConnection___block_invoke_32(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "connection [%{public}@] was interrupted", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _releaseAppConnectionWithPid:*(unsigned int *)(a1 + 48)];
}

- (void)_storeAppConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = [v4 processIdentifier];
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_DEFAULT, "Storing connection from PID [%i]", (uint8_t *)v10, 8u);
  }

  if ([v4 effectiveUserIdentifier])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "effectiveUserIdentifier"));
    [(SDDaemon *)self setUserIdentifier:v6];
  }
  uint64_t v7 = self;
  objc_sync_enter(v7);
  v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  v9 = [(SDDaemon *)v7 appConnections];
  [v9 setObject:v4 forKeyedSubscript:v8];

  objc_sync_exit(v7);
}

- (void)_releaseAppConnectionWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  objc_sync_enter(v4);
  int v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_DEFAULT, "Clearing connection [%i]", (uint8_t *)v8, 8u);
  }

  uint64_t v6 = [(SDDaemon *)v4 appConnections];
  uint64_t v7 = [NSNumber numberWithInt:v3];
  [v6 removeObjectForKey:v7];

  objc_sync_exit(v4);
}

- (id)_connectionForPid:(id)a3
{
  id v4 = a3;
  int v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(SDDaemon *)v5 appConnections];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  return v7;
}

- (id)remoteObjectProxyForPID:(id)a3
{
  id v4 = a3;
  int v5 = [(SDDaemon *)self _connectionForPid:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__SDDaemon_remoteObjectProxyForPID___block_invoke;
  v9[3] = &unk_1E6CD7DD8;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __36__SDDaemon_remoteObjectProxyForPID___block_invoke(uint64_t a1)
{
  id v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __36__SDDaemon_remoteObjectProxyForPID___block_invoke_cold_1(a1);
  }
}

- (void)checkIn
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(SDDaemon *)self _verifyCurrentDevice];
  uint64_t v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = +[SDDevice _currentDevice];
    int v5 = [v4 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_DEFAULT, "Checking in device %@", buf, 0xCu);
  }
  id v6 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __19__SDDaemon_checkIn__block_invoke;
  handler[3] = &unk_1E6CD7E00;
  handler[4] = self;
  xpc_activity_register("com.apple.betaenrollmentd.verify", v6, handler);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E4F14428], &__block_literal_global_39);
}

void __19__SDDaemon_checkIn__block_invoke(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    int v5 = Log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_DEFAULT, "Verifying device enrollment on XPC Activity schedule.", v6, 2u);
    }

    [*(id *)(a1 + 32) _verifyCurrentDevice];
  }
  else if (!state)
  {
    id v4 = Log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "Verify activity checking in.", buf, 2u);
    }
  }
}

- (void)_verifyCurrentDevice
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = Log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136446210;
    int v5 = "-[SDDaemon _verifyCurrentDevice]";
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v4, 0xCu);
  }

  uint64_t v3 = +[SDBetaManager sharedManager];
  [v3 ensureThisRunsAfterMigration:&__block_literal_global_41];
}

void __32__SDDaemon__verifyCurrentDevice__block_invoke()
{
  id v0 = +[SDDevice _currentDevice];
  [v0 _verifyEnrollmentWithUserIdentifier:0 completion:&__block_literal_global_44];
}

void __32__SDDaemon__verifyCurrentDevice__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = Log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = @"NOT valid, unenrolling.";
    if (a2) {
      int v4 = @"valid";
    }
    int v5 = 138543362;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1DD702000, v3, OS_LOG_TYPE_DEFAULT, "Verified enrollment as %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)getCurrentDevice:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = Log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v10 = "-[SDDaemon getCurrentDevice:]";
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  int v5 = +[SDBetaManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__SDDaemon_getCurrentDevice___block_invoke;
  v7[3] = &unk_1E6CD7E48;
  id v8 = v3;
  id v6 = v3;
  [v5 ensureThisRunsAfterMigration:v7];
}

void __29__SDDaemon_getCurrentDevice___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[SDDevice _currentDevice];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)enrollDevice:(id)a3 inProgram:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = Log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v22 = "-[SDDaemon enrollDevice:inProgram:completion:]";
    _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  id v12 = +[SDBetaManager sharedManager];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke;
  v16[3] = &unk_1E6CD7E70;
  id v17 = v8;
  id v18 = v9;
  v19 = self;
  id v20 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [v12 ensureThisRunsAfterMigration:v16];
}

void __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) platform];
  if (v3 != [*(id *)(a1 + 40) platform])
  {
    uint64_t v7 = +[SDSeedingLogging fwHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_3(v2, (id *)(a1 + 40), v7);
    }

    id v8 = SDErrorForBetaManagerErrorType(5);
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_12;
  }
  int v4 = +[SDBetaManager sharedManager];
  char v5 = objc_msgSend(v4, "_isEnrollmentAllowedByDeviceManagement_legacy");

  if ((v5 & 1) == 0)
  {
    id v6 = Log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_2(v6);
    }
    goto LABEL_11;
  }
  if (+[SDMDMConfiguratorDaemon isBetaEnrollmentDisabled])
  {
    id v6 = Log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_1(v6);
    }
LABEL_11:

    uint64_t v10 = *(void *)(a1 + 56);
    id v8 = SDErrorForBetaManagerErrorType(13);
    id v9 = *(void (**)(void))(v10 + 16);
LABEL_12:
    v9();

    return;
  }
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = [*(id *)(a1 + 48) userIdentifier];
  [v11 _enrollInBetaProgram:v12 userIdentifier:v13];

  id v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
  v14();
}

- (void)getDevicesForPlatforms:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = +[SDBetaManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __46__SDDaemon_getDevicesForPlatforms_completion___block_invoke;
  v8[3] = &unk_1E6CD7E98;
  id v9 = v5;
  unint64_t v10 = a3;
  id v7 = v5;
  [v6 ensureThisRunsAfterMigration:v8];
}

void __46__SDDaemon_getDevicesForPlatforms_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[SDDevice _devicesMatchingPlatforms:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)queryProgramsForSystemAccountsWithPlatforms:(unint64_t)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = Log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 136446210;
    id v9 = "-[SDDaemon queryProgramsForSystemAccountsWithPlatforms:completion:]";
    _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  id v7 = +[SDBetaManager sharedManager];
  [v7 _queryProgramsForSystemAccountsWithPlatforms:a3 completion:v5];
}

- (void)canDeviceEnrollInBetaUpdates:(id)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, uint64_t))a4;
  id v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136446210;
    id v9 = "-[SDDaemon canDeviceEnrollInBetaUpdates:completion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = +[SDBetaManager sharedManager];
  uint64_t v7 = [v6 _canCurrentDeviceEnrollInBetaUpdates];

  v4[2](v4, v7);
}

- (void)isDeviceEnrolledInBetaProgram:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = Log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    id v15 = "-[SDDaemon isDeviceEnrolledInBetaProgram:completion:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  int v8 = +[SDBetaManager sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__SDDaemon_isDeviceEnrolledInBetaProgram_completion___block_invoke;
  v11[3] = &unk_1E6CD7EC0;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 ensureThisRunsAfterMigration:v11];
}

uint64_t __53__SDDaemon_isDeviceEnrolledInBetaProgram_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _isEnrolled];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)unenrollDevice:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = Log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v17 = "-[SDDaemon unenrollDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  id v9 = +[SDBetaManager sharedManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__SDDaemon_unenrollDevice_completion___block_invoke;
  v12[3] = &unk_1E6CD7EE8;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 ensureThisRunsAfterMigration:v12];
}

uint64_t __38__SDDaemon_unenrollDevice_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) userIdentifier];
  [v2 _unenrollWithUserIdentifier:v3];

  int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v4();
}

- (void)canFileFeedbackOnDevice:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = Log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    id v15 = "-[SDDaemon canFileFeedbackOnDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  int v8 = +[SDBetaManager sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__SDDaemon_canFileFeedbackOnDevice_completion___block_invoke;
  v11[3] = &unk_1E6CD7F10;
  id v12 = v5;
  id v13 = v6;
  id v9 = v5;
  id v10 = v6;
  [v8 ensureThisRunsAfterMigration:v11];
}

uint64_t __47__SDDaemon_canFileFeedbackOnDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) _canFileFeedback];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(v1 + 16);
  return v3(v1, v2, 0);
}

- (void)enrolledBetaProgramForDevice:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "-[SDDaemon enrolledBetaProgramForDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  id v6 = +[SDBetaManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __52__SDDaemon_enrolledBetaProgramForDevice_completion___block_invoke;
  v8[3] = &unk_1E6CD7E48;
  id v9 = v4;
  id v7 = v4;
  [v6 ensureThisRunsAfterMigration:v8];
}

void __52__SDDaemon_enrolledBetaProgramForDevice_completion___block_invoke(uint64_t a1)
{
  id v2 = +[SDBetaManager _currentBetaProgram];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCurrentSeedingAppleIDForDevice:(id)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void))a4;
  id v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136446210;
    id v9 = "-[SDDaemon getCurrentSeedingAppleIDForDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = +[SDBetaManager sharedManager];
  id v7 = [v6 _seedingAppleIDUsername];
  v4[2](v4, v7, 0);
}

- (void)getCurrentPrimaryAppleIDForDevice:(id)a3 completion:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a4;
  id v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136446210;
    id v9 = "-[SDDaemon getCurrentPrimaryAppleIDForDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = +[SDBetaManager sharedManager];
  id v7 = [v6 _deviceAppleIDUsername];
  v4[2](v4, v7);
}

- (void)setAppleAccountIdentifierFromAlternateDSID:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = a3;
  int v8 = Log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    id v14 = "-[SDDaemon setAppleAccountIdentifierFromAlternateDSID:forDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v8, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  id v9 = +[SDBetaManager sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__SDDaemon_setAppleAccountIdentifierFromAlternateDSID_forDevice_completion___block_invoke;
  v11[3] = &unk_1E6CD7F38;
  id v12 = v6;
  id v10 = v6;
  [v9 _saveAppleAccountIdentifierWithAlternateDSID:v7 completion:v11];
}

uint64_t __76__SDDaemon_setAppleAccountIdentifierFromAlternateDSID_forDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteSeedingAppleAccountForDevice:(id)a3 completion:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = "-[SDDaemon deleteSeedingAppleAccountForDevice:completion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
  }

  id v6 = +[SDBetaManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __58__SDDaemon_deleteSeedingAppleAccountForDevice_completion___block_invoke;
  v8[3] = &unk_1E6CD7F38;
  id v9 = v4;
  id v7 = v4;
  [v6 _deleteSeedingAppleAccountWithCompletion:v8];
}

uint64_t __58__SDDaemon_deleteSeedingAppleAccountForDevice_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)isDeviceUsingSeedingAppleID:(id)a3 completion:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a4;
  id v5 = Log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136446210;
    int v8 = "-[SDDaemon isDeviceUsingSeedingAppleID:completion:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = +[SDBetaManager sharedManager];
  v4[2](v4, [v6 _isUsingSeedingAppleID]);
}

- (void)invalidateDaemonCacheWithCompletion:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(id, void))a3;
  id v4 = Log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136446210;
    int v7 = "-[SDDaemon invalidateDaemonCacheWithCompletion:]";
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_INFO, "%{public}s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = +[SDBetaManager sharedManager];
  [v5 invalidateCache];

  v3[2](v3, 0);
}

- (void)enrollInProgramWithToken:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = Log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446467;
    id v10 = "-[SDDaemon enrollInProgramWithToken:completion:]";
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s token [%{private}@]", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = +[SDBetaManager sharedManager];
  [v8 enrollInProgramWithToken:v5 userIdentifier:0 completion:v6];
}

- (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 completion:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = Log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136446210;
    uint64_t v16 = "-[SDDaemon configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:completion:]";
    _os_log_impl(&dword_1DD702000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v15, 0xCu);
  }

  id v14 = [(SDDaemon *)self userIdentifier];
  +[SDMDMConfiguratorDaemon configureWithOfferProgramTokens:v12 requireProgramToken:v11 enrollmentPolicy:a5 userIdentifier:v14 completion:v10];
}

- (void)loadMDMConfigurationWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(id, id, void *))a3;
  id v4 = Log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v9 = "-[SDDaemon loadMDMConfigurationWithCompletion:]";
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  id v7 = 0;
  id v5 = +[SDPersistence loadMDMConfigurationWithError:&v7];
  id v6 = v7;
  v3[2](v3, v6, v5);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (NSMutableDictionary)appConnections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppConnections:(id)a3
{
}

- (NSNumber)userIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserIdentifier:(id)a3
{
}

- (int)profileToken
{
  return self->_profileToken;
}

- (void)setProfileToken:(int)a3
{
  self->_int profileToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_appConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

void __17__SDDaemon_start__block_invoke_cold_1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F29060] currentThread];
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_1DD702000, a1, OS_LOG_TYPE_DEBUG, "resuming listener from thread %@", (uint8_t *)&v3, 0xCu);
}

void __17__SDDaemon_start__block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  id v2 = @"com.apple.seeding.client";
  _os_log_debug_impl(&dword_1DD702000, log, OS_LOG_TYPE_DEBUG, "listening for service %@", (uint8_t *)&v1, 0xCu);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  [a1 processIdentifier];
  OUTLINED_FUNCTION_0(&dword_1DD702000, v1, v2, "A client [%ld] tried to use Seeding.fmwk but is not entitled.", v3, v4, v5, v6, 0);
}

void __36__SDDaemon_remoteObjectProxyForPID___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) stringValue];
  OUTLINED_FUNCTION_0(&dword_1DD702000, v2, v3, "XPC object could not be fetched for pid [%{public}@]", v4, v5, v6, v7, 2u);
}

void __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DD702000, log, OS_LOG_TYPE_ERROR, "Beta enrollment is restricted. Will not enroll in program.", v1, 2u);
}

void __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DD702000, log, OS_LOG_TYPE_ERROR, "Beta enrollment is restricted (legacy). Will not enroll in program.", v1, 2u);
}

void __46__SDDaemon_enrollDevice_inProgram_completion___block_invoke_cold_3(id *a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 platform];
  uint64_t v6 = [*a2 platform];
  int v7 = 134218240;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1DD702000, a3, OS_LOG_TYPE_ERROR, "Attempting to enroll device in a non-matching platform: device is [%ld] and program is [%ld].", (uint8_t *)&v7, 0x16u);
}

@end