@interface BYBuddyDaemonGeneralClient
+ (id)factory;
- (BOOL)setupAssistantNeedsToRun;
- (BYBuddyDaemonGeneralClient)init;
- (id)_daemonConnection;
- (id)backupMetadata;
- (id)fetchAuthenticationContextForApplePay;
- (id)fetchAuthenticationContextForBiometric;
- (void)cancelDataMigratorDeferredExit;
- (void)deferDataMigratorExit;
- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5;
- (void)ensureShortLivedTokenUpgrade;
- (void)ensureSilentLoginUpgrade;
- (void)migrateWithStoredMigratorVersion:(unsigned int)a3 userDataDisposition:(unsigned int)a4;
- (void)observeFinishSetupTriggers;
- (void)performSilentICDPUpgrade;
- (void)startExpressSettingsUpload;
- (void)storeAuthenticationContextforApplyPay:(id)a3;
- (void)storeAuthenticationContextforBiometric:(id)a3;
@end

@implementation BYBuddyDaemonGeneralClient

+ (id)factory
{
  return &__block_literal_global_9;
}

BYBuddyDaemonGeneralClient *__37__BYBuddyDaemonGeneralClient_factory__block_invoke()
{
  v0 = objc_alloc_init(BYBuddyDaemonGeneralClient);
  return v0;
}

- (BYBuddyDaemonGeneralClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)BYBuddyDaemonGeneralClient;
  v2 = [(BYBuddyDaemonGeneralClient *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    connectionLock = v2->_connectionLock;
    v2->_connectionLock = (NSLock *)v3;

    [(NSLock *)v2->_connectionLock setName:@"BYBuddyXPCLock"];
  }
  return v2;
}

- (BOOL)setupAssistantNeedsToRun
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_5];

  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__BYBuddyDaemonGeneralClient_setupAssistantNeedsToRun__block_invoke_10;
  v5[3] = &unk_1E5D2C4B0;
  v5[4] = &v6;
  [v3 setupAssistantNeedsToRun:v5];
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return (char)v2;
}

void __54__BYBuddyDaemonGeneralClient_setupAssistantNeedsToRun__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    char v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "setupAssistantNeedsToRun: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

uint64_t __54__BYBuddyDaemonGeneralClient_setupAssistantNeedsToRun__block_invoke_10(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)ensureSilentLoginUpgrade
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_13];

  [v3 ensureSilentLoginUpgrade:&__block_literal_global_17];
}

void __54__BYBuddyDaemonGeneralClient_ensureSilentLoginUpgrade__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    char v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "ensureSilentLoginUpgrade: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __54__BYBuddyDaemonGeneralClient_ensureSilentLoginUpgrade__block_invoke_14()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "ensureSilentLoginUpgrade did complete", v1, 2u);
  }
}

- (void)ensureShortLivedTokenUpgrade
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_19];

  [v3 ensureShortLivedTokenUpgrade:&__block_literal_global_22];
}

void __58__BYBuddyDaemonGeneralClient_ensureShortLivedTokenUpgrade__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    char v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "ensureShortLivedTokenUpgrade: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __58__BYBuddyDaemonGeneralClient_ensureShortLivedTokenUpgrade__block_invoke_20()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "ensureShortLivedTokenUpgrade did complete", v1, 2u);
  }
}

- (id)backupMetadata
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_24];

  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__BYBuddyDaemonGeneralClient_backupMetadata__block_invoke_25;
  v6[3] = &unk_1E5D2C4D8;
  v6[4] = &v7;
  [v3 backupMetadata:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__BYBuddyDaemonGeneralClient_backupMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "backupMetadata: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __44__BYBuddyDaemonGeneralClient_backupMetadata__block_invoke_25(uint64_t a1, void *a2)
{
}

- (void)observeFinishSetupTriggers
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_28];

  [v3 observeFinishSetupTriggers:&__block_literal_global_31];
}

void __56__BYBuddyDaemonGeneralClient_observeFinishSetupTriggers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "observeFinishSetupTriggers: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __56__BYBuddyDaemonGeneralClient_observeFinishSetupTriggers__block_invoke_29()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "observeFinishSetupTriggers did complete", v1, 2u);
  }
}

- (void)performSilentICDPUpgrade
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_33];

  [v3 performSilentICDPUpgrade:&__block_literal_global_36];
}

void __54__BYBuddyDaemonGeneralClient_performSilentICDPUpgrade__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "performSilentICDPUpgrade: budd returned an error: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __54__BYBuddyDaemonGeneralClient_performSilentICDPUpgrade__block_invoke_34()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "performSilentICDPUpgrade did complete", v1, 2u);
  }
}

- (void)deferDataMigratorExit
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_38];

  [v3 deferDataMigratorExit:&__block_literal_global_41];
}

void __51__BYBuddyDaemonGeneralClient_deferDataMigratorExit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Deferring data migrator exit failed: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __51__BYBuddyDaemonGeneralClient_deferDataMigratorExit__block_invoke_39()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "Deferring data migrator exit completed", v1, 2u);
  }
}

- (void)cancelDataMigratorDeferredExit
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_43];

  [v3 cancelDataMigratorDeferredExit:&__block_literal_global_46];
}

void __60__BYBuddyDaemonGeneralClient_cancelDataMigratorDeferredExit__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Cancelling data migrator deferred exit failed: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __60__BYBuddyDaemonGeneralClient_cancelDataMigratorDeferredExit__block_invoke_44()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "Cancelling data migrator deferred exit completed", v1, 2u);
  }
}

- (void)enrollInSeedProgramNamed:(id)a3 withAssetAudience:(id)a4 programID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_48];

  [v12 enrollInSeedProgramNamed:v10 withAssetAudience:v9 programID:v8 completion:&__block_literal_global_51];
}

void __83__BYBuddyDaemonGeneralClient_enrollInSeedProgramNamed_withAssetAudience_programID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      uint64_t v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      uint64_t v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      uint64_t v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Enroll in seed program named failed: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __83__BYBuddyDaemonGeneralClient_enrollInSeedProgramNamed_withAssetAudience_programID___block_invoke_49()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "Enroll in seed program completed", v1, 2u);
  }
}

- (void)storeAuthenticationContextforApplyPay:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_53];

    [v6 storeAuthenticationContextforApplyPay:v4 completion:&__block_literal_global_56_0];
  }
}

void __68__BYBuddyDaemonGeneralClient_storeAuthenticationContextforApplyPay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    id v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to store context for Apple Pay: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __68__BYBuddyDaemonGeneralClient_storeAuthenticationContextforApplyPay___block_invoke_54()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "Successfully stored context for Apple Pay", v1, 2u);
  }
}

- (id)fetchAuthenticationContextForApplePay
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_58];

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForApplePay__block_invoke_59;
  v6[3] = &unk_1E5D2C500;
  v6[4] = &v7;
  [v3 fetchAuthenticationContextForApplePay:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __67__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForApplePay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch Apple Pay context: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __67__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForApplePay__block_invoke_59(uint64_t a1, void *a2)
{
}

- (void)storeAuthenticationContextforBiometric:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
    id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_62];

    [v6 storeAuthenticationContextforBiometric:v4 completion:&__block_literal_global_65];
  }
}

void __69__BYBuddyDaemonGeneralClient_storeAuthenticationContextforBiometric___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to store context for biometric: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __69__BYBuddyDaemonGeneralClient_storeAuthenticationContextforBiometric___block_invoke_63()
{
  v0 = _BYLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A7DED000, v0, OS_LOG_TYPE_DEFAULT, "Successfully stored context for biometric", v1, 2u);
  }
}

- (id)fetchAuthenticationContextForBiometric
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_67];

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForBiometric__block_invoke_68;
  v6[3] = &unk_1E5D2C500;
  v6[4] = &v7;
  [v3 fetchAuthenticationContextForBiometric:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __68__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForBiometric__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch biometric context: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

void __68__BYBuddyDaemonGeneralClient_fetchAuthenticationContextForBiometric__block_invoke_68(uint64_t a1, void *a2)
{
}

- (void)startExpressSettingsUpload
{
  v2 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_70];

  [v3 startExpressSettingsUpload];
}

void __56__BYBuddyDaemonGeneralClient_startExpressSettingsUpload__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      uint64_t v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to start express settings upload: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

- (void)migrateWithStoredMigratorVersion:(unsigned int)a3 userDataDisposition:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [(BYBuddyDaemonGeneralClient *)self _daemonConnection];
  id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_72];

  [v7 migrateWithStoredMigratorVersion:v5 userDataDisposition:v4];
}

void __83__BYBuddyDaemonGeneralClient_migrateWithStoredMigratorVersion_userDataDisposition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _BYLoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (_BYIsInternalInstall())
    {
      int v5 = 0;
      id v6 = v3;
    }
    else if (v3)
    {
      id v7 = NSString;
      v2 = [v3 domain];
      id v6 = [v7 stringWithFormat:@"<Error domain: %@, code %ld>", v2, objc_msgSend(v3, "code")];
      int v5 = 1;
    }
    else
    {
      int v5 = 0;
      id v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v6;
    _os_log_error_impl(&dword_1A7DED000, v4, OS_LOG_TYPE_ERROR, "Failed to migrate with stored migration version: %{public}@", buf, 0xCu);
    if (v5)
    {
    }
  }
}

- (id)_daemonConnection
{
  [(NSLock *)self->_connectionLock lock];
  connection = self->_connection;
  if (!connection)
  {
    uint64_t v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.purplebuddy.budd.xpc" options:0];
    int v5 = self->_connection;
    self->_connection = v4;

    id v6 = self->_connection;
    id v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE5A960];
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    id v8 = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__BYBuddyDaemonGeneralClient__daemonConnection__block_invoke;
    v14[3] = &unk_1E5D2BA88;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v8 setInterruptionHandler:v14];
    uint64_t v9 = self->_connection;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__BYBuddyDaemonGeneralClient__daemonConnection__block_invoke_145;
    v12[3] = &unk_1E5D2BA88;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)v9 setInvalidationHandler:v12];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  uint64_t v10 = connection;
  [(NSLock *)self->_connectionLock unlock];
  return v10;
}

void __47__BYBuddyDaemonGeneralClient__daemonConnection__block_invoke(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Connection to budd was interrupted!", (uint8_t *)v6, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] lock];
    id v5 = v4[2];
    v4[2] = 0;

    [v4[1] unlock];
  }
}

void __47__BYBuddyDaemonGeneralClient__daemonConnection__block_invoke_145(uint64_t a1)
{
  v2 = _BYLoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 0;
    _os_log_impl(&dword_1A7DED000, v2, OS_LOG_TYPE_DEFAULT, "Connection to budd was invalidated.", (uint8_t *)v6, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[1] lock];
    id v5 = v4[2];
    v4[2] = 0;

    [v4[1] unlock];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
}

@end