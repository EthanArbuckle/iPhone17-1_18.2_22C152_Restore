@interface SUInstaller
+ (id)purgeOptionsForDownloadOptions:(id)a3 spaceNeeded:(unint64_t)a4 completionQueue:(id)a5;
- (BOOL)_isUpdateReadyForInstallationWithOptions:(id)a3 error:(id *)a4 shouldRetry:(BOOL *)a5;
- (BOOL)isInstallRetrying;
- (BOOL)isInstallTonight;
- (BOOL)isInstallTonightScheduled;
- (BOOL)isInstalled;
- (BOOL)isInstallerReadyForInstallationWithOptions:(id)a3 error:(id *)a4 ShouldRetry:(BOOL *)a5;
- (BOOL)isInstalling;
- (BOOL)isUpdateReadyForInstallation:(id *)a3;
- (BOOL)verifyConstraintsMetForInstallationWithOptions:(id)a3 error:(id *)a4;
- (SUAutoUpdatePasscodePolicy)passcodePolicy;
- (SUInstallPolicy)installPolicy;
- (SUInstaller)initWithCore:(id)a3;
- (SUInvalidatable)installDeviceLockAssertion;
- (SUManagerCore)core;
- (unint64_t)getInstallationConstraintsForDownload:(id)a3 allowDiskCleanupIfNeeded:(BOOL)a4 forceDiskCleanupIfNeeded:(BOOL)a5 options:(id)a6;
- (void)_isUpdateReadyForInstallationWithOptions:(id)a3 forceCleanup:(BOOL)a4 withReplyHandler:(id)a5;
- (void)autoSUFailedWithError:(id)a3;
- (void)ensureSSOTokenIfNeededForInstall:(id)a3;
- (void)getInstallationConstraintsForDownload:(id)a3 allowDiskCleanupIfNeeded:(BOOL)a4 forceDiskCleanupIfNeeded:(BOOL)a5 options:(id)a6 completionQueue:(id)a7 completion:(id)a8;
- (void)installCompleted:(id)a3;
- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4;
- (void)isUpdateReadyForInstallationWithOptions:(id)a3 replyHandler:(id)a4;
- (void)managedInstallRequested;
- (void)setCore:(id)a3;
- (void)setInstallDeviceLockAssertion:(id)a3;
- (void)setInstallPolicy:(id)a3;
- (void)setInstallRetrying:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setInstalling:(BOOL)a3;
- (void)setIsInstallTonight:(BOOL)a3;
- (void)setIsInstallTonightScheduled:(BOOL)a3;
- (void)setPasscodePolicy:(id)a3;
- (void)updateInstallPolicyAutoUpdateEnabled:(BOOL)a3;
- (void)updateInstallPolicyClientName:(id)a3;
- (void)updateInstallPolicyDarkBootEnabled:(BOOL)a3;
- (void)updateInstallPolicyType:(unint64_t)a3;
@end

@implementation SUInstaller

- (SUInstaller)initWithCore:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUInstaller;
  v5 = [(SUInstaller *)&v27 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_core, v4);
    *(_DWORD *)&v6->_installing = 0;
    v6->_isInstallTonightScheduled = 0;
    passcodePolicy = v6->_passcodePolicy;
    v6->_passcodePolicy = 0;

    currentInstallOptions = v6->_currentInstallOptions;
    v6->_currentInstallOptions = 0;

    installDeviceLockAssertion = v6->_installDeviceLockAssertion;
    v6->_installDeviceLockAssertion = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_core);
    v11 = [WeakRetained state];
    uint64_t v12 = [v11 installPolicy];
    installPolicy = v6->_installPolicy;
    v6->_installPolicy = (SUInstallPolicy *)v12;

    if (!v6->_installPolicy)
    {
      v14 = [[SUInstallPolicy alloc] initWithInstallPolicyType:0];
      v15 = v6->_installPolicy;
      v6->_installPolicy = v14;
    }
    int out_token = -1;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__11;
    v24[4] = __Block_byref_object_dispose__11;
    v16 = v6;
    v25 = v16;
    v17 = (const char *)[(__CFString *)@"SUPreferencesChangedNotificationAutoUpdate" UTF8String];
    id v18 = objc_loadWeakRetained((id *)&v6->_core);
    v19 = [v18 workQueue];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __28__SUInstaller_initWithCore___block_invoke;
    handler[3] = &unk_26447DC18;
    v22 = v16;
    v23 = v24;
    notify_register_dispatch(v17, &out_token, v19, handler);

    _Block_object_dispose(v24, 8);
  }

  return v6;
}

void __28__SUInstaller_initWithCore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"%s: Got AutoUpdate preference change notification, reloading preferences", a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUInstaller initWithCore:]_block_invoke");
  id v18 = +[SUPreferences sharedInstance];
  [v18 reload];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v10 = [WeakRetained isAutoUpdateEnabled];

  SULogInfo(@"%s: Calling updateInstallPolicyAutoUpdateEnabled:%d", v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUInstaller initWithCore:]_block_invoke");
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) updateInstallPolicyAutoUpdateEnabled:v10];
}

- (BOOL)isInstalling
{
  v3 = [(SUInstaller *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_installing;
}

- (void)setInstalling:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_installing != v3)
  {
    self->_installing = v3;
    +[SUNetworkMonitor setHoldsWiFiAssertion:v3];
  }
}

- (BOOL)isInstalled
{
  BOOL v3 = [(SUInstaller *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_installed;
}

- (void)setInstalled:(BOOL)a3
{
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  self->_installed = a3;
}

- (BOOL)isInstallTonight
{
  BOOL v3 = [(SUInstaller *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_isInstallTonight;
}

- (void)setIsInstallTonight:(BOOL)a3
{
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  self->_isInstallTonight = a3;
}

- (BOOL)isInstallTonightScheduled
{
  BOOL v3 = [(SUInstaller *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  return self->_isInstallTonightScheduled;
}

- (void)setIsInstallTonightScheduled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if (self->_isInstallTonightScheduled != v3)
  {
    SULogInfo(@"%s: Setting isInstallTonightScheduled to %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUInstaller setIsInstallTonightScheduled:]");
    self->_isInstallTonightScheduled = v3;
    uint64_t v14 = [(SUInstaller *)self core];
    uint64_t v15 = [v14 delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      uint64_t v17 = [(SUInstaller *)self core];
      id v18 = [v17 externWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __44__SUInstaller_setIsInstallTonightScheduled___block_invoke;
      block[3] = &unk_26447CD98;
      block[4] = self;
      BOOL v20 = v3;
      dispatch_async(v18, block);
    }
  }
}

void __44__SUInstaller_setIsInstallTonightScheduled___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  v2 = [v3 delegate];
  [v2 installTonightScheduled:*(unsigned __int8 *)(a1 + 40)];
}

- (SUAutoUpdatePasscodePolicy)passcodePolicy
{
  id v3 = [(SUInstaller *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  passcodePolicy = self->_passcodePolicy;
  return passcodePolicy;
}

- (void)setPasscodePolicy:(id)a3
{
  id v4 = (SUAutoUpdatePasscodePolicy *)a3;
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  passcodePolicy = self->_passcodePolicy;
  self->_passcodePolicy = v4;
}

- (SUInstallPolicy)installPolicy
{
  id v3 = [(SUInstaller *)self core];
  id v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  installPolicy = self->_installPolicy;
  return installPolicy;
}

- (void)setInstallPolicy:(id)a3
{
  id v4 = (SUInstallPolicy *)a3;
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  installPolicy = self->_installPolicy;
  self->_installPolicy = v4;
}

- (void)updateInstallPolicyType:(unint64_t)a3
{
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if ([(SUInstallPolicy *)self->_installPolicy type] != a3)
  {
    [(SUInstallPolicy *)self->_installPolicy _setType:a3];
    uint64_t v7 = [(SUInstaller *)self core];
    uint64_t v8 = [v7 state];
    [v8 setInstallPolicy:self->_installPolicy];

    uint64_t v9 = [(SUInstaller *)self core];
    uint64_t v10 = [v9 state];
    [v10 save];

    uint64_t v11 = [(SUInstaller *)self core];
    uint64_t v12 = [v11 delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = self->_installPolicy;
      uint64_t v15 = [(SUInstaller *)self core];
      char v16 = [v15 externWorkQueue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __39__SUInstaller_updateInstallPolicyType___block_invoke;
      v18[3] = &unk_26447C8C8;
      v18[4] = self;
      v19 = v14;
      uint64_t v17 = v14;
      dispatch_async(v16, v18);
    }
  }
}

void __39__SUInstaller_updateInstallPolicyType___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  v2 = [v3 delegate];
  [v2 installPolicyDidChange:*(void *)(a1 + 40)];
}

- (void)updateInstallPolicyAutoUpdateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if ([(SUInstallPolicy *)self->_installPolicy autoUpdateEnabled] != v3)
  {
    [(SUInstallPolicy *)self->_installPolicy _setAutoUpdateEnabled:v3];
    uint64_t v7 = [(SUInstaller *)self core];
    uint64_t v8 = [v7 state];
    [v8 setInstallPolicy:self->_installPolicy];

    uint64_t v9 = [(SUInstaller *)self core];
    uint64_t v10 = [v9 state];
    [v10 save];

    uint64_t v11 = [(SUInstaller *)self core];
    uint64_t v12 = [v11 delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = self->_installPolicy;
      uint64_t v15 = [(SUInstaller *)self core];
      char v16 = [v15 externWorkQueue];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __52__SUInstaller_updateInstallPolicyAutoUpdateEnabled___block_invoke;
      v18[3] = &unk_26447C8C8;
      v18[4] = self;
      v19 = v14;
      uint64_t v17 = v14;
      dispatch_async(v16, v18);
    }
  }
}

void __52__SUInstaller_updateInstallPolicyAutoUpdateEnabled___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  v2 = [v3 delegate];
  [v2 installPolicyDidChange:*(void *)(a1 + 40)];
}

- (void)updateInstallPolicyDarkBootEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(SUInstaller *)self core];
  v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  if ([(SUInstallPolicy *)self->_installPolicy useDarkBoot] != v3)
  {
    [(SUInstallPolicy *)self->_installPolicy _setDarkBoolEnabled:v3];
    uint64_t v7 = [(SUInstaller *)self core];
    uint64_t v8 = [v7 state];
    [v8 setInstallPolicy:self->_installPolicy];

    uint64_t v9 = [(SUInstaller *)self core];
    uint64_t v10 = [v9 state];
    [v10 save];

    uint64_t v11 = [(SUInstaller *)self core];
    uint64_t v12 = [v11 delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      uint64_t v14 = [(SUInstaller *)self core];
      uint64_t v15 = [v14 externWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __50__SUInstaller_updateInstallPolicyDarkBootEnabled___block_invoke;
      block[3] = &unk_26447C878;
      block[4] = self;
      dispatch_async(v15, block);
    }
  }
}

void __50__SUInstaller_updateInstallPolicyDarkBootEnabled___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = v1[3];
  id v4 = [v1 core];
  BOOL v3 = [v4 delegate];
  [v3 installPolicyDidChange:v2];
}

- (void)updateInstallPolicyClientName:(id)a3
{
  id v4 = a3;
  v5 = [(SUInstaller *)self core];
  uint64_t v6 = [v5 workQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  uint64_t v7 = [(SUInstallPolicy *)self->_installPolicy clientName];
  LOBYTE(v6) = [v7 isEqualToString:v4];

  if (v6)
  {
    int v8 = [v4 isEqualToString:@"dmd"];

    if (v8)
    {
      [(SUInstaller *)self managedInstallRequested];
    }
  }
  else
  {
    [(SUInstallPolicy *)self->_installPolicy _setClientName:v4];

    uint64_t v9 = [(SUInstaller *)self core];
    uint64_t v10 = [v9 state];
    [v10 setInstallPolicy:self->_installPolicy];

    uint64_t v11 = [(SUInstaller *)self core];
    uint64_t v12 = [v11 state];
    [v12 save];

    char v13 = [(SUInstaller *)self core];
    uint64_t v14 = [v13 delegate];
    char v15 = objc_opt_respondsToSelector();

    if (v15)
    {
      char v16 = [(SUInstaller *)self core];
      uint64_t v17 = [v16 externWorkQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __45__SUInstaller_updateInstallPolicyClientName___block_invoke;
      block[3] = &unk_26447C878;
      block[4] = self;
      dispatch_async(v17, block);
    }
  }
}

void __45__SUInstaller_updateInstallPolicyClientName___block_invoke(uint64_t a1)
{
  v1 = *(id **)(a1 + 32);
  id v2 = v1[3];
  id v4 = [v1 core];
  BOOL v3 = [v4 delegate];
  [v3 installPolicyDidChange:v2];
}

- (BOOL)isInstallerReadyForInstallationWithOptions:(id)a3 error:(id *)a4 ShouldRetry:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v9 = [(SUInstaller *)self core];
  uint64_t v10 = [v9 workQueue];
  dispatch_assert_queue_V2(v10);

  if (a5) {
    *a5 = 1;
  }
  uint64_t v11 = [(SUInstaller *)self core];
  uint64_t v12 = [v11 downloadAsset];
  if (!v12)
  {

    goto LABEL_8;
  }
  char v13 = (void *)v12;
  uint64_t v14 = [(SUInstaller *)self core];
  char v15 = [v14 download];

  if (!v15)
  {
LABEL_8:
    v48 = 0;
    +[SUUtility assignError:&v48 withCode:3];
    v19 = v48;
    goto LABEL_9;
  }
  char v16 = [(SUInstaller *)self core];
  int v17 = [v16 isScanning];

  if (v17)
  {
    v47 = 0;
    +[SUUtility assignError:&v47 withCode:13];
    id v18 = v47;
    goto LABEL_15;
  }
  v28 = [(SUInstaller *)self core];
  int v29 = [v28 isDownloading];

  if (!v29)
  {
    if ([(SUInstaller *)self isInstalling])
    {
      v45 = 0;
      +[SUUtility assignError:&v45 withCode:14];
      v19 = v45;
    }
    else if ([(SUInstaller *)self isInstalled])
    {
      v44 = 0;
      +[SUUtility assignError:&v44 withCode:42];
      v19 = v44;
    }
    else
    {
      v32 = [(SUInstaller *)self core];
      v33 = [v32 downloadAsset];
      v34 = [v33 getLocalUrl];
      id v27 = [v34 path];

      if (v27)
      {
        SULogInfo(@"isInstallerReadyForInstallationWithOptions? YES", v35, v36, v37, v38, v39, v40, v41, v42);
        BOOL v30 = 1;
        goto LABEL_19;
      }
      v43 = 0;
      +[SUUtility assignError:&v43 withCode:18];
      v19 = v43;
    }
LABEL_9:
    id v27 = v19;
    if (a5) {
      *a5 = 0;
    }
    if (!a4) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v46 = 0;
  +[SUUtility assignError:&v46 withCode:11];
  id v18 = v46;
LABEL_15:
  id v27 = v18;
  if (a4)
  {
LABEL_16:
    if (v27)
    {
      *a4 = [v27 errorWithExtendedUserInfoFromOptions:v8];
    }
  }
LABEL_18:
  SULogInfo(@"isInstallerReadyForInstallationWithOptions? NO due to %@", v20, v21, v22, v23, v24, v25, v26, (uint64_t)v27);
  BOOL v30 = 0;
LABEL_19:

  return v30;
}

- (void)getInstallationConstraintsForDownload:(id)a3 allowDiskCleanupIfNeeded:(BOOL)a4 forceDiskCleanupIfNeeded:(BOOL)a5 options:(id)a6 completionQueue:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = dispatch_queue_create("com.apple.softwareupdateservicesd.installationConstraintQueue", 0);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __138__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options_completionQueue_completion___block_invoke;
  v23[3] = &unk_26447DC68;
  v23[4] = self;
  id v24 = v14;
  BOOL v28 = a4;
  BOOL v29 = a5;
  id v26 = v16;
  id v27 = v17;
  id v25 = v15;
  id v19 = v16;
  id v20 = v17;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(v18, v23);
}

void __138__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options_completionQueue_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getInstallationConstraintsForDownload:*(void *)(a1 + 40) allowDiskCleanupIfNeeded:*(unsigned __int8 *)(a1 + 72) forceDiskCleanupIfNeeded:*(unsigned __int8 *)(a1 + 73) options:*(void *)(a1 + 48)];
  BOOL v3 = *(void **)(a1 + 64);
  if (v3)
  {
    id v4 = *(NSObject **)(a1 + 56);
    if (v4)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __138__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options_completionQueue_completion___block_invoke_2;
      v6[3] = &unk_26447DC40;
      uint64_t v7 = v3;
      uint64_t v8 = v2;
      dispatch_async(v4, v6);
    }
    else
    {
      v5 = (void (*)(void))v3[2];
      v5();
    }
  }
}

uint64_t __138__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options_completionQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

- (unint64_t)getInstallationConstraintsForDownload:(id)a3 allowDiskCleanupIfNeeded:(BOOL)a4 forceDiskCleanupIfNeeded:(BOOL)a5 options:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [[SUInstallationConstraintObserver alloc] initWithDownload:v10 andInstallOptions:v11];
  uint64_t v13 = -[SUComposedInstallationConstraintMonitor unsatisfiedConstraintsWithIgnorableConstraints:](v12, "unsatisfiedConstraintsWithIgnorableConstraints:", [v11 ignorableConstraints]);
  unint64_t v14 = v13;
  if (!v8 || (v13 & 4) == 0) {
    goto LABEL_12;
  }
  v50 = v11;
  id v15 = self;
  id v16 = [(SUInstallationConstraintObserver *)v12 monitorOfClass:objc_opt_class()];
  uint64_t v17 = [v16 deltaSpaceNeeded];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v19 = v18;
  double v20 = *(double *)&getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_REQUEST_TIME;
  uint64_t v21 = getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_DESCRIPTOR;
  id v22 = [v10 descriptor];
  LOBYTE(v21) = [(id)v21 isEqual:v22];

  if ((v21 & 1) == 0)
  {
    uint64_t v30 = [v10 descriptor];
    v31 = (void *)getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_DESCRIPTOR;
    getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_DESCRIPTOR = v30;

LABEL_8:
    v32 = [NSNumber numberWithUnsignedLongLong:v17];
    SULogInfo(@"Insufficient disk space detected for installation - attempting to free: %@ bytes", v33, v34, v35, v36, v37, v38, v39, (uint64_t)v32);

    uint64_t v40 = [v10 downloadOptions];
    uint64_t v41 = [v10 descriptor];
    uint64_t v42 = [v41 installationSize];
    [(SUInstaller *)v15 core];
    v44 = v43 = v16;
    v45 = [v44 workQueue];
    v46 = +[SUInstaller purgeOptionsForDownloadOptions:v40 spaceNeeded:v42 completionQueue:v45];

    id v16 = v43;
    v51[0] = MEMORY[0x263EF8330];
    v51[1] = 3221225472;
    v51[2] = __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke;
    v51[3] = &unk_26447DC90;
    v51[4] = v15;
    id v52 = v10;
    id v11 = v50;
    id v53 = v50;
    +[SUSpace makeRoomForUpdate:v46 completion:v51];
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options____LAST_REQUEST_TIME = v47;

    goto LABEL_9;
  }
  if (a5 || vabdd_f64(v19, v20) > 10.0) {
    goto LABEL_8;
  }
  SULogInfo(@"Insufficient disk space detected for installation but ignoring attempt to free space because we're within buffer from a prior attempt to do so.", v23, v24, v25, v26, v27, v28, v29, v49);
  id v11 = v50;
LABEL_9:
  [v16 refreshConstraints];
  if (![v16 deltaSpaceNeeded]) {
    v14 &= ~4uLL;
  }

LABEL_12:
  [(SUInstallationConstraintObserver *)v12 invalidate];

  return v14;
}

void __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) core];
    uint64_t v7 = [v6 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke_2;
    block[3] = &unk_26447C8C8;
    BOOL v8 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v22 = v8;
    dispatch_async(v7, block);
  }
  else
  {
    if ([*(id *)(a1 + 48) automaticInstallation])
    {
      id v16 = [*(id *)(a1 + 32) core];
      uint64_t v17 = [v16 workQueue];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke_3;
      v19[3] = &unk_26447C8C8;
      double v18 = *(void **)(a1 + 40);
      v19[4] = *(void *)(a1 + 32);
      id v20 = v18;
      dispatch_async(v17, v19);
    }
    SULogInfo(@"Failed to make room for install: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v5);
  }
}

void __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [*(id *)(a1 + 40) descriptor];
  [v3 dismissInsufficientDiskSpaceFollowupForUpdate:v2 orForce:0];
}

void __111__SUInstaller_getInstallationConstraintsForDownload_allowDiskCleanupIfNeeded_forceDiskCleanupIfNeeded_options___block_invoke_3(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInstalled] & 1) == 0
    && ([*(id *)(a1 + 32) isInstalling] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) core];
    uint64_t v2 = [*(id *)(a1 + 40) descriptor];
    [v3 showInsufficientDiskSpaceFollowupForUpdate:v2];
  }
}

- (BOOL)isUpdateReadyForInstallation:(id *)a3
{
  SULogDebug(@"%s is called", (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"-[SUInstaller isUpdateReadyForInstallation:]");
  return [(SUInstaller *)self _isUpdateReadyForInstallationWithOptions:0 error:a3 shouldRetry:0];
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v14 = a3;
  SULogDebug(@"%s is called with options = %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUInstaller isUpdateReadyForInstallationWithOptions:replyHandler:]");
  [(SUInstaller *)self _isUpdateReadyForInstallationWithOptions:v14 forceCleanup:0 withReplyHandler:v6];
}

- (BOOL)_isUpdateReadyForInstallationWithOptions:(id)a3 error:(id *)a4 shouldRetry:(BOOL *)a5
{
  id v8 = a3;
  uint64_t v9 = [(SUInstaller *)self core];
  uint64_t v10 = [v9 workQueue];
  dispatch_assert_queue_V2(v10);

  if ([(SUInstaller *)self isInstallerReadyForInstallationWithOptions:v8 error:a4 ShouldRetry:a5])
  {
    BOOL v11 = [(SUInstaller *)self verifyConstraintsMetForInstallationWithOptions:v8 error:a4];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_isUpdateReadyForInstallationWithOptions:(id)a3 forceCleanup:(BOOL)a4 withReplyHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(SUInstaller *)self core];
  uint64_t v11 = [v10 workQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v11);

  unsigned __int8 v21 = 0;
  id v20 = 0;
  LOBYTE(v11) = [(SUInstaller *)self isInstallerReadyForInstallationWithOptions:v8 error:&v20 ShouldRetry:&v21];
  id v12 = v20;
  if (v11)
  {
    uint64_t v13 = [(SUInstaller *)self core];
    id v14 = [v13 download];

    uint64_t v15 = [(SUInstaller *)self core];
    id v16 = [v15 workQueue];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __86__SUInstaller__isUpdateReadyForInstallationWithOptions_forceCleanup_withReplyHandler___block_invoke;
    v17[3] = &unk_26447DCB8;
    v17[4] = self;
    id v18 = v8;
    id v19 = v9;
    [(SUInstaller *)self getInstallationConstraintsForDownload:v14 allowDiskCleanupIfNeeded:1 forceDiskCleanupIfNeeded:v6 options:v18 completionQueue:v16 completion:v17];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, v21, v12);
  }
}

void __86__SUInstaller__isUpdateReadyForInstallationWithOptions_forceCleanup_withReplyHandler___block_invoke(void *a1)
{
  unsigned __int8 v8 = 0;
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  uint64_t v4 = [v2 _isUpdateReadyForInstallationWithOptions:v3 error:&v7 shouldRetry:&v8];
  id v5 = v7;
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, void, id))(v6 + 16))(v6, v4, v8, v5);
  }
}

- (BOOL)verifyConstraintsMetForInstallationWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SUInstaller *)self core];
  unsigned __int8 v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(SUInstaller *)self core];
  uint64_t v10 = [v9 download];
  uint64_t v11 = [(SUInstaller *)self getInstallationConstraintsForDownload:v10 allowDiskCleanupIfNeeded:0 forceDiskCleanupIfNeeded:0 options:v6];

  if (v11)
  {
    id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v20 = [NSNumber numberWithInteger:v11];
    [v19 setSafeObject:v20 forKey:@"SUInstallationConstraintsUnmet"];

    unsigned __int8 v21 = NSNumber;
    id v22 = [(SUInstaller *)self installPolicy];
    uint64_t v23 = [v22 clientName];
    uint64_t v24 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v23, "isEqualToString:", @"dmd"));
    [v19 setSafeObject:v24 forKey:@"SUMDMInstallationRequest"];

    uint64_t v25 = SUStringFromInstallationConstraints(v11);
    [v19 setSafeObject:v25 forKey:*MEMORY[0x263F07F80]];

    uint64_t v26 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:20 userInfo:v19];
    uint64_t v27 = [(SUInstaller *)self core];
    [v27 reportPostponedEvent:v26 withStatus:@"installNotReady" withAdditionalMetrics:v19];

    uint64_t v28 = SUStringFromInstallationConstraints(v11);
    SULogInfo(@"Is ready for installation?  No due to constraints unmet: %@", v29, v30, v31, v32, v33, v34, v35, (uint64_t)v28);

    if (a4) {
      *a4 = v26;
    }
    uint64_t v36 = [(SUInstaller *)self core];
    uint64_t v37 = [v36 state];
    uint64_t v38 = [v26 description];
    [v37 setDdmPersistedErrorDescription:v38];

    notify_post((const char *)[(id)*MEMORY[0x263F77C08] UTF8String]);
  }
  else
  {
    SULogInfo(@"Is ready for installation?  YES", v12, v13, v14, v15, v16, v17, v18, v40);
  }
  return v11 == 0;
}

- (void)installCompleted:(id)a3
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SUInstaller *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  notify_post((const char *)[(id)*MEMORY[0x263F77C10] UTF8String]);
  id v7 = [(SUInstaller *)self core];
  unsigned __int8 v8 = [v7 state];
  id v9 = v8;
  uint64_t v10 = (void *)MEMORY[0x263F55A90];
  uint64_t v11 = off_26447C000;
  if (v4)
  {
    uint64_t v12 = [v4 description];
    [v9 setDdmPersistedErrorDescription:v12];

    notify_post((const char *)[(id)*MEMORY[0x263F77C08] UTF8String]);
    if (![(SUInstaller *)self isInstallRetrying])
    {
      id v20 = [v4 domain];
      if ([v20 isEqualToString:*v10])
      {
        uint64_t v21 = [v4 code];

        if (v21 == 20)
        {
          id v22 = [(SUInstaller *)self core];
          uint64_t v23 = [v22 download];

          [(SUInstaller *)self setInstallRetrying:1];
          uint64_t v24 = +[SUUtility taskQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __32__SUInstaller_installCompleted___block_invoke;
          block[3] = &unk_26447CD70;
          id v125 = v23;
          v126 = self;
          id v25 = v4;
          id v127 = v25;
          id v26 = v23;
          dispatch_async(v24, block);

LABEL_47:
          goto LABEL_48;
        }
      }
      else
      {
      }
    }
    SULogInfo(@"Installation error: %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v4);
    uint64_t v28 = [v4 domain];
    int v29 = [v28 isEqualToString:@"com.apple.softwareupdateservices.errors"];

    if (v29 && ([v4 code] == 78 || objc_msgSend(v4, "code") == 64))
    {
      SULogInfo(@"Installation error is fatal, clean update", v30, v31, v32, v33, v34, v35, v36, v110);
      int v27 = 1;
    }
    else
    {
      int v27 = 0;
    }
    id v25 = +[SUUtility errorRemovingUserInfoKey:@"InstallOptions" originalError:v4];

    if ((v27 & 1) == 0)
    {
      uint64_t v37 = [(SUInstaller *)self core];
      [v37 reportPostponedEvent:v25 withStatus:*MEMORY[0x263F77F08]];
    }
    id v7 = [v25 domain];
    if ([v7 isEqualToString:*v10])
    {
      uint64_t v38 = [v25 code];

      if (v38 != 26) {
        goto LABEL_19;
      }
      id v7 = [(SUInstaller *)self core];
      [v7 setLastStashbagPersistedDate:0];
    }
  }
  else
  {
    [v8 setDdmPersistedError:0];

    int v27 = 0;
    id v25 = 0;
  }

LABEL_19:
  [(SUInstaller *)self setInstallRetrying:0];
  if (self->_installDeviceLockAssertion)
  {
    SULogInfo(@"releasing lock assertion", v39, v40, v41, v42, v43, v44, v45, v110);
    [(SUInvalidatable *)self->_installDeviceLockAssertion invalidate];
    installDeviceLockAssertion = self->_installDeviceLockAssertion;
    self->_installDeviceLockAssertion = 0;
  }
  if (v25)
  {
    uint64_t v47 = [v25 domain];
    if ([v47 isEqualToString:*v10])
    {
      uint64_t v48 = [v25 code];

      if (v48 != 26)
      {
LABEL_26:
        uint64_t v49 = [(SUInstaller *)self installPolicy];
        v50 = [v49 clientName];
        int v51 = [v50 isEqualToString:@"dmd"];

        if (v51)
        {
          v131[0] = MEMORY[0x263EFFA88];
          v130[0] = @"SUMDMInstallationRequest";
          v130[1] = @"SUAutomaticInstallation";
          id v52 = objc_msgSend(NSNumber, "numberWithBool:", -[SUInstallOptions automaticInstallation](self->_currentInstallOptions, "automaticInstallation"));
          v131[1] = v52;
          id v53 = NSDictionary;
          v54 = (void **)v131;
          v55 = (__CFString **)v130;
          uint64_t v56 = 2;
        }
        else
        {
          v128 = @"SUAutomaticInstallation";
          id v52 = objc_msgSend(NSNumber, "numberWithBool:", -[SUInstallOptions automaticInstallation](self->_currentInstallOptions, "automaticInstallation"));
          v129 = v52;
          id v53 = NSDictionary;
          v54 = &v129;
          v55 = &v128;
          uint64_t v56 = 1;
        }
        v85 = [v53 dictionaryWithObjects:v54 forKeys:v55 count:v56];
        id v86 = +[SUUtility translateError:v25 withAddedUserInfo:v85];

        SULogInfo(@"Installation failed with error: %@", v87, v88, v89, v90, v91, v92, v93, (uint64_t)v86);
        v94 = [(SUInstaller *)self core];
        v95 = [v94 delegate];
        char v96 = objc_opt_respondsToSelector();

        if (v96)
        {
          v97 = [(SUInstaller *)self core];
          v98 = [v97 download];
          v99 = [v98 descriptor];

          v100 = [(SUInstaller *)self core];
          v101 = [v100 externWorkQueue];
          v113[0] = MEMORY[0x263EF8330];
          v113[1] = 3221225472;
          v113[2] = __32__SUInstaller_installCompleted___block_invoke_3_368;
          v113[3] = &unk_26447CD70;
          v113[4] = self;
          id v114 = v99;
          id v86 = v86;
          id v115 = v86;
          id v102 = v99;
          dispatch_async(v101, v113);
        }
        goto LABEL_45;
      }
      uint64_t v47 = [(SUInstaller *)self core];
      [v47 clearKeybagStash];
    }

    goto LABEL_26;
  }
  int v111 = v27;
  self->_installed = 1;
  v57 = [(SUInstaller *)self core];
  v58 = [v57 state];
  v59 = [MEMORY[0x263EFF910] now];
  [v58 setAppliedTime:v59];

  v60 = [(SUInstaller *)self core];
  v61 = [v60 state];
  [v61 save];

  v62 = +[SUAlertPresentationManager sharedInstance];
  [v62 dismissAlertsOfClass:objc_opt_class() animated:1];

  v63 = [(SUInstaller *)self core];
  [v63 reportOTAInstalledEvent];

  SULogInfo(@"Clearing badge after successful install", v64, v65, v66, v67, v68, v69, v70, v110);
  v71 = [(SUInstaller *)self core];
  [v71 clearBadgeAndBanner];

  v72 = [(SUInstaller *)self core];
  v73 = [v72 download];
  v112 = [v73 descriptor];

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  v74 = [(SUInstaller *)self core];
  v75 = [v74 observers];
  v76 = [v75 allObjects];

  uint64_t v77 = [v76 countByEnumeratingWithState:&v120 objects:v132 count:16];
  if (v77)
  {
    uint64_t v78 = v77;
    uint64_t v79 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v78; ++i)
      {
        if (*(void *)v121 != v79) {
          objc_enumerationMutation(v76);
        }
        uint64_t v81 = *(void *)(*((void *)&v120 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          [(SUInstaller *)self core];
          v83 = v82 = self;
          v84 = [v83 externWorkQueue];
          v118[0] = MEMORY[0x263EF8330];
          v118[1] = 3221225472;
          v118[2] = __32__SUInstaller_installCompleted___block_invoke_361;
          v118[3] = &unk_26447C8C8;
          v118[4] = v81;
          id v119 = v112;
          dispatch_async(v84, v118);

          self = v82;
        }
      }
      uint64_t v78 = [v76 countByEnumeratingWithState:&v120 objects:v132 count:16];
    }
    while (v78);
  }

  v103 = [(SUInstaller *)self core];
  v104 = [v103 delegate];
  char v105 = objc_opt_respondsToSelector();

  if (v105)
  {
    v106 = [(SUInstaller *)self core];
    v107 = [v106 externWorkQueue];
    v116[0] = MEMORY[0x263EF8330];
    v116[1] = 3221225472;
    v116[2] = __32__SUInstaller_installCompleted___block_invoke_2_362;
    v116[3] = &unk_26447C8C8;
    v116[4] = self;
    id v86 = v112;
    id v117 = v86;
    dispatch_async(v107, v116);

    uint64_t v11 = off_26447C000;
    id v25 = 0;
  }
  else
  {
    uint64_t v11 = off_26447C000;
    id v25 = 0;
    id v86 = v112;
  }
  int v27 = v111;
LABEL_45:

  [(__objc2_class *)v11[83] setCacheable:1];
  currentInstallOptions = self->_currentInstallOptions;
  self->_currentInstallOptions = 0;

  [(SUInstaller *)self setInstalling:0];
  if (v27)
  {
    v109 = [(SUInstaller *)self core];
    [v109 clearKeybagStash];

    id v26 = [(SUInstaller *)self core];
    [v26 cleanupPreviousDownloadState];
    goto LABEL_47;
  }
LABEL_48:
}

void __32__SUInstaller_installCompleted___block_invoke(id *a1)
{
  uint64_t v2 = [a1[4] descriptor];
  uint64_t v3 = [v2 installationSize] + 10485760;

  id v4 = [a1[4] downloadOptions];
  id v5 = [a1[5] core];
  id v6 = [v5 workQueue];
  id v7 = +[SUInstaller purgeOptionsForDownloadOptions:v4 spaceNeeded:v3 completionQueue:v6];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __32__SUInstaller_installCompleted___block_invoke_2;
  v10[3] = &unk_26447DC90;
  id v11 = a1[6];
  int8x16_t v9 = *((int8x16_t *)a1 + 2);
  id v8 = (id)v9.i64[0];
  int8x16_t v12 = vextq_s8(v9, v9, 8uLL);
  +[SUSpace makeRoomForUpdate:v7 completion:v10];
}

void __32__SUInstaller_installCompleted___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  v43[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"InstallOptions"];

  if (a2)
  {
    SULogInfo(@"Cleaned up sufficient space to retry install", v8, v9, v10, v11, v12, v13, v14, v37);
    uint64_t v15 = [*(id *)(a1 + 40) core];
    uint64_t v16 = [v15 workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __32__SUInstaller_installCompleted___block_invoke_3;
    block[3] = &unk_26447C8C8;
    uint64_t v17 = *(void **)(a1 + 48);
    void block[4] = *(void *)(a1 + 40);
    id v41 = v17;
    dispatch_async(v16, block);

    uint64_t v18 = [*(id *)(a1 + 40) core];
    objc_msgSend(v7, "setManaged:", objc_msgSend(v18, "isManaged"));

    uint64_t v19 = [*(id *)(a1 + 40) core];
    id v20 = [v19 engine];
    [v20 installUpdate:v7];
  }
  else
  {
    if ([v7 automaticInstallation])
    {
      uint64_t v21 = [*(id *)(a1 + 40) core];
      id v22 = [v21 workQueue];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __32__SUInstaller_installCompleted___block_invoke_4;
      v38[3] = &unk_26447C8C8;
      uint64_t v23 = *(void **)(a1 + 48);
      v38[4] = *(void *)(a1 + 40);
      id v39 = v23;
      dispatch_async(v22, v38);
    }
    id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v24 setObject:&unk_26CEBD060 forKeyedSubscript:@"SUInstallationConstraintsUnmet"];
    [v24 setObject:v5 forKeyedSubscript:*MEMORY[0x263F08608]];
    id v25 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.softwareupdateservices.errors" code:20 userInfo:v24];
    id v26 = [*(id *)(a1 + 40) core];
    v43[0] = &unk_26CEBD060;
    uint64_t v27 = *MEMORY[0x263F07F80];
    v42[0] = @"SUInstallationConstraintsUnmet";
    v42[1] = v27;
    uint64_t v28 = SUStringFromInstallationConstraints(4);
    v43[1] = v28;
    int v29 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    [v26 reportPostponedEvent:v25 withStatus:@"installNotReady" withAdditionalMetrics:v29];

    SULogInfo(@"Failed to Clean up sufficient space to retry install: %@", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v25);
    [*(id *)(a1 + 40) installCompleted:v25];
  }
}

void __32__SUInstaller_installCompleted___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [*(id *)(a1 + 40) descriptor];
  [v3 dismissInsufficientDiskSpaceFollowupForUpdate:v2 orForce:0];
}

void __32__SUInstaller_installCompleted___block_invoke_4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isInstalled] & 1) == 0
    && ([*(id *)(a1 + 32) isInstalling] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) core];
    uint64_t v2 = [*(id *)(a1 + 40) descriptor];
    [v3 showInsufficientDiskSpaceFollowupForUpdate:v2];
  }
}

uint64_t __32__SUInstaller_installCompleted___block_invoke_361(uint64_t a1)
{
  return [*(id *)(a1 + 32) installDidFinish:*(void *)(a1 + 40)];
}

void __32__SUInstaller_installCompleted___block_invoke_2_362(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 installDidFinish:*(void *)(a1 + 40)];
}

void __32__SUInstaller_installCompleted___block_invoke_3_368(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 installDidFail:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUInstaller *)self core];
  uint64_t v9 = [v8 workQueue];
  dispatch_assert_queue_V2(v9);

  notify_post((const char *)[(id)*MEMORY[0x263F77C10] UTF8String]);
  if (v6
    || (id v6 = (id)objc_opt_new(),
        SULogInfo(@"No installOptions provided, using the default value", v10, v11, v12, v13, v14, v15, v16, v28),
        v6))
  {
    -[SUInstaller updateInstallPolicyType:](self, "updateInstallPolicyType:", [v6 isRequired]);
    -[SUInstaller updateInstallPolicyDarkBootEnabled:](self, "updateInstallPolicyDarkBootEnabled:", [v6 isDarkBoot]);
    uint64_t v17 = [v6 clientName];
    [(SUInstaller *)self updateInstallPolicyClientName:v17];

    uint64_t v18 = [(SUInstaller *)self core];
    objc_msgSend(v6, "setManaged:", objc_msgSend(v18, "isManaged"));
  }
  int v29 = [(SUInstaller *)self installPolicy];
  SULogInfo(@"Starting SU Installation with install options: %@; policy: %@",
    v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    (uint64_t)v6);

  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke;
  v30[3] = &unk_26447DCE0;
  v30[4] = self;
  id v31 = v6;
  id v32 = v7;
  id v26 = v7;
  id v27 = v6;
  [(SUInstaller *)self _isUpdateReadyForInstallationWithOptions:v27 forceCleanup:1 withReplyHandler:v30];
}

void __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke(id *a1, char a2, uint64_t a3, void *a4)
{
  v85[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [a1[4] core];
  uint64_t v8 = [v7 workQueue];
  dispatch_assert_queue_V2(v8);

  if (a2)
  {
    [a1[4] ensureSSOTokenIfNeededForInstall:a1[5]];
    SULogInfo(@"Ready to install!", v16, v17, v18, v19, v20, v21, v22, v69);
    +[SUUtility setCacheable:0];
    [a1[4] setInstalling:1];
    objc_storeStrong((id *)a1[4] + 6, a1[5]);
    uint64_t v23 = +[SUKeybagInterface sharedInstance];
    char v24 = [v23 isPasscodeLocked];

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = +[SUKeybagInterface sharedInstance];
      uint64_t v26 = [v25 createPreventLockAssertionWithDuration:600.0];
      id v27 = a1[4];
      uint64_t v28 = (void *)v27[5];
      v27[5] = v26;
    }
    int v29 = [a1[4] core];
    uint64_t v30 = [v29 download];
    id v31 = [v30 descriptor];

    if ([v31 isSplatOnly])
    {
      id v32 = [MEMORY[0x263F77D98] sharedDevice];
      int v33 = [v32 hasSemiSplatActive];

      if (v33)
      {
        SULogInfo(@"Trying to install a Splat but an already-installed Splat was detected, rebooting...", v34, v35, v36, v37, v38, v39, v40, v70);
        id v41 = [a1[4] core];
        uint64_t v42 = [v41 workQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_4;
        block[3] = &unk_26447C878;
        void block[4] = a1[4];
        dispatch_async(v42, block);

        if (a1[6])
        {
          uint64_t v43 = [a1[4] core];
          uint64_t v44 = [v43 externWorkQueue];
          v74[0] = MEMORY[0x263EF8330];
          v74[1] = 3221225472;
          v74[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_5;
          v74[3] = &unk_26447D4F8;
          id v75 = a1[6];
          dispatch_async(v44, v74);
        }
      }
    }
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_6;
    v71[3] = &unk_26447C968;
    id v45 = a1[5];
    v71[4] = a1[4];
    id v72 = v45;
    id v73 = a1[6];
    v46 = (void (**)(void))MEMORY[0x223C18480](v71);
    v46[2]();

    uint64_t v47 = v72;
    goto LABEL_13;
  }
  SULogInfo(@"Installation error: download not ready for installation: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v6);
  uint64_t v48 = [a1[4] core];
  [v48 reportPostponedEvent:v6 withStatus:*MEMORY[0x263F77F38]];

  id v83 = 0;
  +[SUUtility assignError:&v83 withError:v6 translate:0];
  id v49 = v83;
  v84 = @"SUAutomaticInstallation";
  v50 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "automaticInstallation"));
  v85[0] = v50;
  uint64_t v51 = [NSDictionary dictionaryWithObjects:v85 forKeys:&v84 count:1];
  id v31 = +[SUUtility updateError:v49 withAdditionalUserInfo:v51];

  SULogDebug(@"%s: outError = %@", v52, v53, v54, v55, v56, v57, v58, (uint64_t)"-[SUInstaller installUpdateWithInstallOptions:withResult:]_block_invoke");
  v59 = [a1[4] core];
  v60 = [v59 delegate];
  LOBYTE(v51) = objc_opt_respondsToSelector();

  if (v51)
  {
    v61 = [a1[4] core];
    v62 = [v61 download];
    v63 = [v62 descriptor];

    uint64_t v64 = [a1[4] core];
    uint64_t v65 = [v64 externWorkQueue];
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_2;
    v80[3] = &unk_26447CD70;
    v80[4] = a1[4];
    id v81 = v63;
    id v82 = v31;
    id v66 = v63;
    dispatch_async(v65, v80);
  }
  if (a1[6])
  {
    uint64_t v67 = [a1[4] core];
    uint64_t v68 = [v67 externWorkQueue];
    v77[0] = MEMORY[0x263EF8330];
    v77[1] = 3221225472;
    v77[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_3;
    v77[3] = &unk_26447CFA0;
    id v79 = a1[6];
    id v31 = v31;
    id v78 = v31;
    dispatch_async(v68, v77);

    uint64_t v47 = v79;
LABEL_13:
  }
}

void __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 installDidFail:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) installCompleted:0];
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) core];
  id v3 = [v2 delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) core];
    id v6 = [v5 download];
    id v7 = [v6 descriptor];

    uint64_t v8 = [*(id *)(a1 + 32) core];
    uint64_t v9 = [v8 externWorkQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_7;
    block[3] = &unk_26447C8C8;
    void block[4] = *(void *)(a1 + 32);
    id v51 = v7;
    id v10 = v7;
    dispatch_async(v9, block);
  }
  uint64_t v11 = [*(id *)(a1 + 32) core];
  [v11 reporterFlushEvent];

  uint64_t v12 = [*(id *)(a1 + 32) core];
  uint64_t v13 = [v12 engine];
  uint64_t v14 = [*(id *)(a1 + 32) core];
  uint64_t v15 = (void *)[v14 newInstallTonightConfig];
  [v13 refreshInstallTonightConfig:v15];

  uint64_t v16 = +[SUPreferences sharedInstance];
  LODWORD(v13) = [v16 fakeInstallFailure];

  if (!v13)
  {
    int v29 = +[SUPreferences sharedInstance];
    if ([v29 skipDownload])
    {
    }
    else
    {
      uint64_t v37 = +[SUPreferences sharedInstance];
      int v38 = [v37 skipApply];

      if (!v38)
      {
        id v28 = [*(id *)(a1 + 32) core];
        uint64_t v42 = [v28 engine];
        [v42 installUpdate:*(void *)(a1 + 40)];

        goto LABEL_10;
      }
    }
    SULogInfo(@"SUSkipDownload or SUSkipApply is set, skip this apply phase and return YES.", v30, v31, v32, v33, v34, v35, v36, v45[0]);
    dispatch_time_t v39 = dispatch_time(0, 5000000000);
    uint64_t v40 = [*(id *)(a1 + 32) core];
    id v41 = [v40 workQueue];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_9;
    v47[3] = &unk_26447C878;
    v47[4] = *(void *)(a1 + 32);
    dispatch_after(v39, v41, v47);

    goto LABEL_11;
  }
  SULogInfo(@"SUFakeInstallFailure is set; faking an installation failure of SUErrorCodeInstallNotAllowable...",
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v45[0]);
  char v24 = +[SUUtility errorWithCode:106];
  dispatch_time_t v25 = dispatch_time(0, 5000000000);
  uint64_t v26 = [*(id *)(a1 + 32) core];
  id v27 = [v26 workQueue];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_8;
  v48[3] = &unk_26447C8C8;
  v48[4] = *(void *)(a1 + 32);
  id v49 = v24;
  id v28 = v24;
  dispatch_after(v25, v27, v48);

LABEL_10:
LABEL_11:
  if (*(void *)(a1 + 48))
  {
    uint64_t v43 = [*(id *)(a1 + 32) core];
    uint64_t v44 = [v43 externWorkQueue];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = (uint64_t)__58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_10;
    v45[3] = (uint64_t)&unk_26447D4F8;
    id v46 = *(id *)(a1 + 48);
    dispatch_async(v44, v45);
  }
}

void __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_7(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 installDidStart:*(void *)(a1 + 40)];
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) installCompleted:*(void *)(a1 + 40)];
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) installCompleted:0];
}

uint64_t __58__SUInstaller_installUpdateWithInstallOptions_withResult___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)managedInstallRequested
{
  id v3 = [(SUInstaller *)self core];
  char v4 = [v3 workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [(SUInstaller *)self core];
  id v6 = [v5 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = self->_installPolicy;
    uint64_t v9 = [(SUInstaller *)self core];
    id v10 = [v9 externWorkQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__SUInstaller_managedInstallRequested__block_invoke;
    v12[3] = &unk_26447C8C8;
    v12[4] = self;
    uint64_t v13 = v8;
    uint64_t v11 = v8;
    dispatch_async(v10, v12);
  }
}

void __38__SUInstaller_managedInstallRequested__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) core];
  uint64_t v2 = [v3 delegate];
  [v2 managedInstallationRequested:*(void *)(a1 + 40)];
}

- (void)autoSUFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SUInstaller *)self core];
  id v6 = [v5 workQueue];
  dispatch_assert_queue_V2(v6);

  char v7 = [(SUInstaller *)self core];
  uint64_t v8 = [v7 download];
  if (!v8)
  {
    id v18 = 0;
    goto LABEL_5;
  }
  uint64_t v9 = (void *)v8;
  id v10 = [(SUInstaller *)self core];
  uint64_t v11 = [v10 download];
  uint64_t v12 = [v11 descriptor];

  if (v12)
  {
    char v7 = [(SUInstaller *)self core];
    uint64_t v13 = [v7 download];
    uint64_t v14 = [v13 descriptor];
    id v18 = [v14 humanReadableUpdateName];

LABEL_5:
    goto LABEL_7;
  }
  id v18 = 0;
LABEL_7:
  uint64_t v15 = +[SUAlertPresentationManager sharedInstance];
  [v15 dismissAlertsOfClass:objc_opt_class() animated:1];

  uint64_t v16 = [[SUAutoInstallFailureAlertItem alloc] initWithError:v4 buildNumber:v18];
  uint64_t v17 = +[SUAlertPresentationManager sharedInstance];
  [v17 presentAlert:v16 animated:1];
}

- (void)ensureSSOTokenIfNeededForInstall:(id)a3
{
  id v25 = a3;
  id v3 = +[SUPreferences sharedInstance];
  char v4 = [v3 suppressSSOTokenInInstall];

  id v5 = v25;
  if ((v4 & 1) == 0)
  {
    CFBooleanRef v6 = (const __CFBoolean *)CFPreferencesCopyValue(@"EnableSso", @"com.apple.MobileSoftwareUpdate", @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
    if (v6)
    {
      CFBooleanRef v14 = v6;
      CFTypeID v15 = CFGetTypeID(v6);
      if (v15 == CFBooleanGetTypeID())
      {
        int Value = CFBooleanGetValue(v14);
        CFRelease(v14);
        if (Value)
        {
          if ([v25 automaticInstallation])
          {
            SULogInfo(@"%s: No need for sso token - install is not user-initiated", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUInstaller ensureSSOTokenIfNeededForInstall:]");
          }
          else
          {
            char v24 = +[SUAuthSSO sharedInstance];
            [v24 invokeSSOAuth];
          }
          goto LABEL_9;
        }
      }
      else
      {
        CFRelease(v14);
      }
    }
    SULogInfo(@"%s: No need for sso token - not enabled in MSU preferences", v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUInstaller ensureSSOTokenIfNeededForInstall:]");
LABEL_9:
    id v5 = v25;
  }
}

+ (id)purgeOptionsForDownloadOptions:(id)a3 spaceNeeded:(unint64_t)a4 completionQueue:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(SUSpacePurgeOptions);
  [(SUSpacePurgeOptions *)v9 setNeededBytes:a4];
  [(SUSpacePurgeOptions *)v9 setEnableCacheDelete:1];
  if ([v7 isAutoDownload]) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = [v7 isAppOffloadEnabled];
  }
  [(SUSpacePurgeOptions *)v9 setEnableAppOffload:v10];
  [(SUSpacePurgeOptions *)v9 setCacheDeleteUrgency:4];
  [(SUSpacePurgeOptions *)v9 setAppOffloadUrgency:4];
  [(SUSpacePurgeOptions *)v9 setCompletionQueue:v8];

  return v9;
}

- (SUManagerCore)core
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_core);
  return (SUManagerCore *)WeakRetained;
}

- (void)setCore:(id)a3
{
}

- (BOOL)isInstallRetrying
{
  return self->_installRetrying;
}

- (void)setInstallRetrying:(BOOL)a3
{
  self->_installRetrying = a3;
}

- (SUInvalidatable)installDeviceLockAssertion
{
  return self->_installDeviceLockAssertion;
}

- (void)setInstallDeviceLockAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentInstallOptions, 0);
  objc_storeStrong((id *)&self->_installDeviceLockAssertion, 0);
  objc_storeStrong((id *)&self->_passcodePolicy, 0);
  objc_storeStrong((id *)&self->_installPolicy, 0);
  objc_destroyWeak((id *)&self->_core);
}

@end