@interface SUSUISoftwareUpdateClientManager
- (BOOL)isAutoDownloadEnabled;
- (BOOL)isAutoInstallEnabled;
- (BOOL)isAutoInstallPreviousUserSettingsEnabled;
- (BOOL)isAutoUpdateArmedAndReady;
- (BOOL)isAutoUpdateScheduled;
- (BOOL)isAutomaticInstallSystemDataFilesEnabled;
- (BOOL)isRollingBack;
- (BOOL)isSecurityResponseEnabled;
- (BOOL)previousUserSpecifiedSecurityResponseEnabled;
- (SUManagerClient)suManagerClient;
- (SUSUISoftwareUpdateClientManager)initWithDelegate:(id)a3 completionQueue:(id)a4;
- (SUSUISoftwareUpdateClientManagerDelegate)delegate;
- (id)eligibleRollback;
- (void)_queue_cancelAutoInstall;
- (void)_queue_setAutoUpdateScheduled:(BOOL)a3;
- (void)_queue_setEligibleRollback:(id)a3;
- (void)_queue_setRollingBack:(BOOL)a3;
- (void)autoInstallOperationDidConsent:(id)a3;
- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResponse:(id)a4;
- (void)autoInstallOperationPasscodePolicyDidChange:(id)a3 passcodePolicyType:(unint64_t)a4;
- (void)autoInstallOperationWasCancelled:(id)a3;
- (void)cancelAutoInstall;
- (void)client:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5;
- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5;
- (void)client:(id)a3 downloadDidStart:(id)a4;
- (void)client:(id)a3 downloadProgressDidChange:(id)a4;
- (void)client:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4;
- (void)client:(id)a3 handleUIForDDMDeclaration:(id)a4;
- (void)client:(id)a3 inUserInteraction:(id)a4;
- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 installDidFinish:(id)a4;
- (void)client:(id)a3 installDidStart:(id)a4;
- (void)client:(id)a3 installTonightScheduled:(BOOL)a4 operationID:(id)a5;
- (void)client:(id)a3 rollbackDidFail:(id)a4 withError:(id)a5;
- (void)client:(id)a3 rollbackDidFinish:(id)a4;
- (void)client:(id)a3 rollbackDidStart:(id)a4;
- (void)client:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6;
- (void)client:(id)a3 scanRequestDidStartForOptions:(id)a4;
- (void)createInstallationKeybagWithOptions:(id)a3 completion:(id)a4;
- (void)currentAutoInstallOperation:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)destroyInstallationKeybag:(id)a3;
- (void)download:(id)a3;
- (void)enableAutoDownload:(BOOL)a3;
- (void)enableAutoInstall:(BOOL)a3;
- (void)enableAutoInstallPreviousUserSettings:(BOOL)a3;
- (void)enableAutomaticInstallSystemDataFiles:(BOOL)a3;
- (void)getDDMDeclaration:(id)a3;
- (void)installUpdateWithOptions:(id)a3 completion:(id)a4;
- (void)isClearingSpaceForDownload:(id)a3;
- (void)isDelayingUpdates:(id)a3;
- (void)isInstallationKeybagRequired:(id)a3;
- (void)isInstallationKeybagRequiredForDescriptor:(id)a3 result:(id)a4;
- (void)isScanning:(id)a3;
- (void)isUpdateReadyForInstallationWithOptions:(id)a3 completion:(id)a4;
- (void)purgeDownload:(id)a3;
- (void)queue_enableAutoInstallPreviousUserSettings:(BOOL)a3;
- (void)queue_enableAutomaticInstallSystemDataFiles:(BOOL)a3;
- (void)queue_setAutoDownloadEnabled:(BOOL)a3;
- (void)queue_setAutoInstallEnabled:(BOOL)a3;
- (void)queue_setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3;
- (void)queue_setSecurityResponseEnabled:(BOOL)a3;
- (void)rollbackUpdateWithOptions:(id)a3 completion:(id)a4;
- (void)scanforUpdatesWithOptions:(id)a3 completion:(id)a4;
- (void)setAutoUpdateScheduled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEligibleRollback:(id)a3;
- (void)setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3;
- (void)setRollingBack:(BOOL)a3 rollback:(id)a4;
- (void)setSecurityResponseEnabled:(BOOL)a3;
- (void)softwareUpdatePathRestriction:(id)a3;
- (void)startDownloadWithOptions:(id)a3 completion:(id)a4;
- (void)updateDownloadOptions:(id)a3 completion:(id)a4;
- (void)updatesDownloadable:(id)a3 alternateUpdate:(id)a4 completion:(id)a5;
@end

@implementation SUSUISoftwareUpdateClientManager

- (SUSUISoftwareUpdateClientManager)initWithDelegate:(id)a3 completionQueue:(id)a4
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  v4 = v42;
  v42 = 0;
  v39.receiver = v4;
  v39.super_class = (Class)SUSUISoftwareUpdateClientManager;
  v19 = [(SUSUISoftwareUpdateClientManager *)&v39 init];
  v42 = v19;
  objc_storeStrong((id *)&v42, v19);
  if (v19)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SoftwareUpdateSettings.ClientManagerWorkQueue", 0);
    workQueue = v42->_workQueue;
    v42->_workQueue = (OS_dispatch_queue *)v5;

    objc_storeWeak((id *)&v42->_delegate, location[0]);
    objc_storeStrong((id *)&v42->_completionQueue, v40);
    if (!v42->_completionQueue)
    {
      v7 = (OS_dispatch_queue *)MEMORY[0x263EF83A0];
      completionQueue = v42->_completionQueue;
      v42->_completionQueue = v7;
    }
    v14 = +[SUSUIServiceManager sharedInstance];
    Class v38 = [(SUSUIServiceManager *)v14 classForService:objc_opt_class()];

    id v9 = [v38 alloc];
    uint64_t v10 = [v9 initWithDelegate:v42 queue:v42->_completionQueue clientType:1];
    suClient = v42->_suClient;
    v42->_suClient = (SUManagerClient *)v10;

    v42->_autoUpdateScheduled = 0;
    v42->_rollingBack = 0;
    objc_storeStrong((id *)&v42->_rollbackDescriptor, 0);
    v15 = v42->_suClient;
    uint64_t v32 = MEMORY[0x263EF8330];
    int v33 = -1073741824;
    int v34 = 0;
    v35 = __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke;
    v36 = &unk_264840358;
    v37 = v42;
    [(SUManagerClient *)v15 isAutoUpdateScheduled:&v32];
    v16 = v42->_suClient;
    uint64_t v26 = MEMORY[0x263EF8330];
    int v27 = -1073741824;
    int v28 = 0;
    v29 = __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke_274;
    v30 = &unk_264840380;
    v31 = v42;
    [(SUManagerClient *)v16 isRollingBack:&v26];
    v17 = v42->_suClient;
    uint64_t v20 = MEMORY[0x263EF8330];
    int v21 = -1073741824;
    int v22 = 0;
    v23 = __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke_276;
    v24 = &unk_2648403A8;
    v25 = v42;
    [(SUManagerClient *)v17 eligibleRollbackWithOptions:0 withResult:&v20];
    objc_storeStrong((id *)&v25, 0);
    objc_storeStrong((id *)&v31, 0);
    objc_storeStrong((id *)&v37, 0);
  }
  v13 = v42;
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v42, 0);
  return v13;
}

void __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke(NSObject *a1, char a2, id obj)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if (location)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)location);
      _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "Error checking isAutoUpdateScheduled: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  [(objc_class *)a1[4].isa setAutoUpdateScheduled:v6 & 1];
  objc_storeStrong(&location, 0);
}

void __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke_274(NSObject *a1, char a2, id obj, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v10 = a1;
  char v9 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  oslog[1] = a1;
  if (v7)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v11, (uint64_t)v7);
      _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "Error checking isRollingBack: %@", v11, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  [(objc_class *)a1[4].isa setRollingBack:v9 & 1 rollback:location];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

void __69__SUSUISoftwareUpdateClientManager_initWithDelegate_completionQueue___block_invoke_276(NSObject *a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = 0;
  objc_storeStrong(&v6, a3);
  oslog[1] = a1;
  if (v6)
  {
    oslog[0] = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v6);
      _os_log_impl(&dword_228401000, oslog[0], OS_LOG_TYPE_DEFAULT, "Error checking eligibleRollbackWithOptions: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  [(objc_class *)a1[4].isa setEligibleRollback:location[0]];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)dealloc
{
  id v6 = self;
  SEL v5 = a2;
  v2 = [(SUManagerClient *)self->_suClient delegate];
  BOOL v3 = v2 != (SUManagerClientDelegate *)v6;

  if (!v3) {
    [(SUManagerClient *)v6->_suClient setDelegate:0];
  }
  [(SUManagerClient *)v6->_suClient invalidate];
  v4.receiver = v6;
  v4.super_class = (Class)SUSUISoftwareUpdateClientManager;
  [(SUSUISoftwareUpdateClientManager *)&v4 dealloc];
}

- (SUManagerClient)suManagerClient
{
  v17[2] = self;
  v17[1] = (id)a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  int v13 = 838860800;
  int v14 = 48;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17[0] = 0;
  queue = self->_workQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  v8 = __51__SUSUISoftwareUpdateClientManager_suManagerClient__block_invoke;
  uint64_t v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  id v4 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);
  return (SUManagerClient *)v4;
}

void __51__SUSUISoftwareUpdateClientManager_suManagerClient__block_invoke(uint64_t a1)
{
}

- (void)scanforUpdatesWithOptions:(id)a3 completion:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  uint64_t v9 = __73__SUSUISoftwareUpdateClientManager_scanforUpdatesWithOptions_completion___block_invoke;
  uint64_t v10 = &unk_26483BD60;
  uint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __73__SUSUISoftwareUpdateClientManager_scanforUpdatesWithOptions_completion___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "scanForUpdates:withScanResults:", a1[5], a1[6], a1, a1);
}

- (void)isScanning:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __47__SUSUISoftwareUpdateClientManager_isScanning___block_invoke;
  int v8 = &unk_2648403F8;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __47__SUSUISoftwareUpdateClientManager_isScanning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "isScanning:", *(void *)(a1 + 40), a1, a1);
}

- (void)softwareUpdatePathRestriction:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __66__SUSUISoftwareUpdateClientManager_softwareUpdatePathRestriction___block_invoke;
  int v8 = &unk_2648403F8;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __66__SUSUISoftwareUpdateClientManager_softwareUpdatePathRestriction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "softwareUpdatePathRestriction:", *(void *)(a1 + 40), a1, a1);
}

- (void)isDelayingUpdates:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __54__SUSUISoftwareUpdateClientManager_isDelayingUpdates___block_invoke;
  int v8 = &unk_2648403F8;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __54__SUSUISoftwareUpdateClientManager_isDelayingUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "isDelayingUpdates:", *(void *)(a1 + 40), a1, a1);
}

- (void)download:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __45__SUSUISoftwareUpdateClientManager_download___block_invoke;
  int v8 = &unk_2648403F8;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __45__SUSUISoftwareUpdateClientManager_download___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "download:", *(void *)(a1 + 40), a1, a1);
}

- (void)updatesDownloadable:(id)a3 alternateUpdate:(id)a4 completion:(id)a5
{
  uint64_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  queue = v20->_workQueue;
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = __83__SUSUISoftwareUpdateClientManager_updatesDownloadable_alternateUpdate_completion___block_invoke;
  id v12 = &unk_264840420;
  id v13 = v20;
  id v14 = location[0];
  id v15 = v18;
  id v16 = v17;
  dispatch_async(queue, &v8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __83__SUSUISoftwareUpdateClientManager_updatesDownloadable_alternateUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = a1;
  uint64_t v23 = a1;
  char v22 = 0;
  char v21 = 0;
  id v20 = 0;
  id v19 = 0;
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v18 = 0;
  id v17 = 0;
  [v2 areUpdatesDownloadableWithOptions:v3 alternateUpdateOptions:v4 preferredUpdateDownloadable:&v22 alternateUpdateDownloadable:&v21 preferredUpdateError:&v18 alternateUpdateError:&v17];
  objc_storeStrong(&v20, v18);
  objc_storeStrong(&v19, v17);
  if (*(void *)(a1 + 56))
  {
    queue = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v7 = MEMORY[0x263EF8330];
    int v8 = -1073741824;
    int v9 = 0;
    int v10 = __83__SUSUISoftwareUpdateClientManager_updatesDownloadable_alternateUpdate_completion___block_invoke_2;
    uint64_t v11 = &unk_26483BB30;
    id v14 = *(id *)(a1 + 56);
    char v15 = v22 & 1;
    char v16 = v21 & 1;
    id v12 = v20;
    id v13 = v19;
    dispatch_async(queue, &v7);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
}

uint64_t __83__SUSUISoftwareUpdateClientManager_updatesDownloadable_alternateUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned char *)(a1 + 56) & 1);
}

- (void)startDownloadWithOptions:(id)a3 completion:(id)a4
{
  char v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __72__SUSUISoftwareUpdateClientManager_startDownloadWithOptions_completion___block_invoke;
  int v10 = &unk_26483BD60;
  uint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __72__SUSUISoftwareUpdateClientManager_startDownloadWithOptions_completion___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "startDownloadWithOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (void)updateDownloadOptions:(id)a3 completion:(id)a4
{
  char v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __69__SUSUISoftwareUpdateClientManager_updateDownloadOptions_completion___block_invoke;
  int v10 = &unk_26483BD60;
  uint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __69__SUSUISoftwareUpdateClientManager_updateDownloadOptions_completion___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "updateDownloadOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (void)isClearingSpaceForDownload:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __63__SUSUISoftwareUpdateClientManager_isClearingSpaceForDownload___block_invoke;
  int v8 = &unk_2648403F8;
  int v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __63__SUSUISoftwareUpdateClientManager_isClearingSpaceForDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "isClearingSpaceForDownload:", *(void *)(a1 + 40), a1, a1);
}

- (BOOL)isAutoDownloadEnabled
{
  id v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  workQueue = self->_workQueue;
  uint64_t block = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __57__SUSUISoftwareUpdateClientManager_isAutoDownloadEnabled__block_invoke;
  int v9 = &unk_26483C080;
  id v10 = &v11;
  dispatch_sync(workQueue, &block);
  char v4 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __57__SUSUISoftwareUpdateClientManager_isAutoDownloadEnabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x263F78218] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isAutomaticDownloadEnabled] & 1;
}

- (void)enableAutoDownload:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __55__SUSUISoftwareUpdateClientManager_enableAutoDownload___block_invoke;
  int v8 = &unk_26483BE00;
  int v9 = self;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __55__SUSUISoftwareUpdateClientManager_enableAutoDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setAutoDownloadEnabled:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_setAutoDownloadEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = (id)[MEMORY[0x263F78218] sharedInstance];
  [v3 enableAutomaticDownload:v4];
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 completion:(id)a4
{
  SEL v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __87__SUSUISoftwareUpdateClientManager_isUpdateReadyForInstallationWithOptions_completion___block_invoke;
  BOOL v10 = &unk_26483BD60;
  BOOL v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __87__SUSUISoftwareUpdateClientManager_isUpdateReadyForInstallationWithOptions_completion___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "isUpdateReadyForInstallationWithOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (void)installUpdateWithOptions:(id)a3 completion:(id)a4
{
  SEL v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __72__SUSUISoftwareUpdateClientManager_installUpdateWithOptions_completion___block_invoke;
  BOOL v10 = &unk_26483BD60;
  BOOL v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __72__SUSUISoftwareUpdateClientManager_installUpdateWithOptions_completion___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "installUpdateWithInstallOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (void)currentAutoInstallOperation:(BOOL)a3 completion:(id)a4
{
  SEL v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  queue = v16->_workQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke;
  int v9 = &unk_264840498;
  BOOL v10 = v16;
  BOOL v12 = v14;
  id v11 = location;
  dispatch_async(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke(uint64_t a1)
{
  v5[2] = (id)a1;
  v5[1] = (id)a1;
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  char v2 = *(unsigned char *)(a1 + 48);
  v5[0] = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(v3, "currentAutoInstallOperation:withResult:", v2 & 1);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v25 = 0;
  objc_storeStrong(&v25, a3);
  v24[1] = a1;
  if (location[0] && !v25)
  {
    id v4 = (void *)*((void *)a1[4] + 3);
    id v3 = location[0];
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    id v13 = __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_4;
    BOOL v14 = &unk_264840448;
    id v15 = a1[4];
    id v16 = location[0];
    id v17 = a1[5];
    [v4 _consentAutoInstallOperation:v3 withResult:&v10];
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    int v18 = 0;
  }
  else
  {
    if (a1[5]) {
      (*((void (**)(void))a1[5] + 2))();
    }
    id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 7);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      queue = *((void *)a1[4] + 2);
      uint64_t v19 = MEMORY[0x263EF8330];
      int v20 = -1073741824;
      int v21 = 0;
      char v22 = __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_3;
      uint64_t v23 = &unk_26483BA90;
      v24[0] = a1[4];
      dispatch_async(queue, &v19);
      objc_storeStrong(v24, 0);
    }
    int v18 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 32);
  id v4 = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "manager:autoUpdateScheduleStateChanged:autoInstallOperation:", v2, v3 & 1);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_4(uint64_t a1, char a2, id obj)
{
  uint64_t v17 = a1;
  char v16 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v14[1] = (id)a1;
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 40) != 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained setDelegate:*(void *)(a1 + 32)];

  if (*(void *)(a1 + 40))
  {
    if (v16) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    [*(id *)(a1 + 40) setAgreementStatus:v3];
  }
  if (*(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    queue = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v9 = MEMORY[0x263EF8330];
    int v10 = -1073741824;
    int v11 = 0;
    int v12 = __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_5;
    id v13 = &unk_26483BA90;
    v14[0] = *(id *)(a1 + 32);
    dispatch_async(queue, &v9);
    objc_storeStrong(v14, 0);
  }
  objc_storeStrong(&location, 0);
}

void __75__SUSUISoftwareUpdateClientManager_currentAutoInstallOperation_completion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 32);
  id v4 = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "manager:autoUpdateScheduleStateChanged:autoInstallOperation:", v2, v3 & 1);
}

- (BOOL)isAutoInstallEnabled
{
  uint64_t v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  int v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  workQueue = self->_workQueue;
  uint64_t block = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __56__SUSUISoftwareUpdateClientManager_isAutoInstallEnabled__block_invoke;
  uint64_t v9 = &unk_26483C080;
  int v10 = &v11;
  dispatch_sync(workQueue, &block);
  char v4 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __56__SUSUISoftwareUpdateClientManager_isAutoInstallEnabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x263F78218] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 isAutomaticUpdateV2Enabled] & 1;
}

- (void)enableAutoInstall:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __54__SUSUISoftwareUpdateClientManager_enableAutoInstall___block_invoke;
  int v8 = &unk_26483BE00;
  uint64_t v9 = self;
  BOOL v10 = v11;
  dispatch_sync(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __54__SUSUISoftwareUpdateClientManager_enableAutoInstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setAutoInstallEnabled:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_setAutoInstallEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = (id)[MEMORY[0x263F78218] sharedInstance];
  [v3 enableAutomaticUpdateV2:v4];
}

- (BOOL)isAutoInstallPreviousUserSettingsEnabled
{
  uint64_t v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  workQueue = self->_workQueue;
  uint64_t block = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __76__SUSUISoftwareUpdateClientManager_isAutoInstallPreviousUserSettingsEnabled__block_invoke;
  uint64_t v9 = &unk_26483C080;
  BOOL v10 = &v11;
  dispatch_sync(workQueue, &block);
  char v4 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __76__SUSUISoftwareUpdateClientManager_isAutoInstallPreviousUserSettingsEnabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x263F78218] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 previousUserSpecifiedAutomaticUpdateV2Enabled] & 1;
}

- (void)enableAutoInstallPreviousUserSettings:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __74__SUSUISoftwareUpdateClientManager_enableAutoInstallPreviousUserSettings___block_invoke;
  int v8 = &unk_26483BE00;
  uint64_t v9 = self;
  BOOL v10 = v11;
  dispatch_sync(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __74__SUSUISoftwareUpdateClientManager_enableAutoInstallPreviousUserSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutoInstallPreviousUserSettings:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutoInstallPreviousUserSettings:(BOOL)a3
{
  BOOL v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = (id)[MEMORY[0x263F78218] sharedInstance];
  [v3 enablePreviousUserSpecifiedAutomaticUpdateV2:v4];
}

- (BOOL)isSecurityResponseEnabled
{
  uint64_t v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  workQueue = self->_workQueue;
  uint64_t block = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __61__SUSUISoftwareUpdateClientManager_isSecurityResponseEnabled__block_invoke;
  uint64_t v9 = &unk_26483C080;
  BOOL v10 = &v11;
  dispatch_sync(workQueue, &block);
  char v4 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __61__SUSUISoftwareUpdateClientManager_isSecurityResponseEnabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x263F78218] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 autoInstallSecurityResponse] & 1;
}

- (void)setSecurityResponseEnabled:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __63__SUSUISoftwareUpdateClientManager_setSecurityResponseEnabled___block_invoke;
  int v8 = &unk_26483BE00;
  uint64_t v9 = self;
  BOOL v10 = v11;
  dispatch_sync(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __63__SUSUISoftwareUpdateClientManager_setSecurityResponseEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setSecurityResponseEnabled:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_setSecurityResponseEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = (id)[MEMORY[0x263F78218] sharedInstance];
  [v3 enableAutoInstallSecurityResponse:v4];
}

- (BOOL)previousUserSpecifiedSecurityResponseEnabled
{
  uint64_t v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  workQueue = self->_workQueue;
  uint64_t block = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __80__SUSUISoftwareUpdateClientManager_previousUserSpecifiedSecurityResponseEnabled__block_invoke;
  uint64_t v9 = &unk_26483C080;
  BOOL v10 = &v11;
  dispatch_sync(workQueue, &block);
  char v4 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __80__SUSUISoftwareUpdateClientManager_previousUserSpecifiedSecurityResponseEnabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x263F78218] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 previousUserSpecifiedAutoInstallSecurityResponse] & 1;
}

- (void)setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __83__SUSUISoftwareUpdateClientManager_setPreviousUserSpecifiedSecurityResponseStatus___block_invoke;
  int v8 = &unk_26483BE00;
  uint64_t v9 = self;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __83__SUSUISoftwareUpdateClientManager_setPreviousUserSpecifiedSecurityResponseStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setPreviousUserSpecifiedSecurityResponseStatus:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3
{
  BOOL v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = (id)[MEMORY[0x263F78218] sharedInstance];
  [v3 enablePreviousUserSpecifiedAutoInstallSecurityResponse:v4];
}

- (BOOL)isAutomaticInstallSystemDataFilesEnabled
{
  uint64_t v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  workQueue = self->_workQueue;
  uint64_t block = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __76__SUSUISoftwareUpdateClientManager_isAutomaticInstallSystemDataFilesEnabled__block_invoke;
  uint64_t v9 = &unk_26483C080;
  BOOL v10 = &v11;
  dispatch_sync(workQueue, &block);
  char v4 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __76__SUSUISoftwareUpdateClientManager_isAutomaticInstallSystemDataFilesEnabled__block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x263F78218] sharedInstance];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 autoInstallSystemAndDataFiles] & 1;
}

- (void)enableAutomaticInstallSystemDataFiles:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __74__SUSUISoftwareUpdateClientManager_enableAutomaticInstallSystemDataFiles___block_invoke;
  int v8 = &unk_26483BE00;
  uint64_t v9 = self;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __74__SUSUISoftwareUpdateClientManager_enableAutomaticInstallSystemDataFiles___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_enableAutomaticInstallSystemDataFiles:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)queue_enableAutomaticInstallSystemDataFiles:(BOOL)a3
{
  BOOL v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = (id)[MEMORY[0x263F78218] sharedInstance];
  [v3 enableAutoInstallSystemAndDataFiles:v4];
}

- (BOOL)isAutoUpdateArmedAndReady
{
  uint64_t v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = self->_workQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __61__SUSUISoftwareUpdateClientManager_isAutoUpdateArmedAndReady__block_invoke;
  uint64_t v9 = &unk_2648404C0;
  v10[0] = self;
  v10[1] = &v11;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

void __61__SUSUISoftwareUpdateClientManager_isAutoUpdateArmedAndReady__block_invoke(uint64_t a1)
{
  char v5 = 0;
  char v3 = 0;
  LOBYTE(v2) = 0;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
    char v5 = 1;
    LOBYTE(v2) = 0;
    if (([WeakRetained isCanceled] & 1) == 0)
    {
      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
      char v3 = 1;
      int v2 = [v4 isExpired] ^ 1;
    }
  }
  if (v3) {

  }
  if (v5) {
  if (v2)
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (BOOL)isAutoUpdateScheduled
{
  uint64_t v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = self->_workQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __57__SUSUISoftwareUpdateClientManager_isAutoUpdateScheduled__block_invoke;
  uint64_t v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __57__SUSUISoftwareUpdateClientManager_isAutoUpdateScheduled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32) & 1;
  return result;
}

- (void)setAutoUpdateScheduled:(BOOL)a3
{
  int v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __59__SUSUISoftwareUpdateClientManager_setAutoUpdateScheduled___block_invoke;
  int v8 = &unk_26483BE00;
  uint64_t v9 = self;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

uint64_t __59__SUSUISoftwareUpdateClientManager_setAutoUpdateScheduled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAutoUpdateScheduled:", *(unsigned char *)(a1 + 40) & 1, a1, a1);
}

- (void)_queue_setAutoUpdateScheduled:(BOOL)a3
{
  int v21 = self;
  SEL v20 = a2;
  BOOL v19 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v21->_autoUpdateScheduled != v19)
  {
    v21->_autoUpdateScheduled = v19;
    if (v21->_autoUpdateScheduled)
    {
      suClient = v21->_suClient;
      uint64_t v13 = MEMORY[0x263EF8330];
      int v14 = -1073741824;
      int v15 = 0;
      SEL v16 = __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke;
      uint64_t v17 = &unk_2648404E8;
      int v18 = v21;
      [(SUManagerClient *)suClient currentAutoInstallOperation:0 withResult:&v13];
      objc_storeStrong((id *)&v18, 0);
    }
    else
    {
      objc_storeWeak((id *)&v21->_autoInstallOperation, 0);
      id WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        queue = v21->_completionQueue;
        uint64_t v7 = MEMORY[0x263EF8330];
        int v8 = -1073741824;
        int v9 = 0;
        BOOL v10 = __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_4;
        BOOL v11 = &unk_26483BA90;
        SEL v12 = v21;
        dispatch_async(queue, &v7);
        objc_storeStrong((id *)&v12, 0);
      }
    }
  }
}

void __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v13 = 0;
  objc_storeStrong(&v13, a3);
  v12[1] = a1;
  queue = *((void *)a1[4] + 1);
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_2;
  BOOL v10 = &unk_26483BAB8;
  id v11 = a1[4];
  v12[0] = location[0];
  dispatch_async(queue, &v6);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_2(id *a1)
{
  v11[2] = a1;
  v11[1] = a1;
  objc_storeWeak((id *)a1[4] + 6, a1[5]);
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 6);
  [WeakRetained setDelegate:a1[4]];

  id v4 = objc_loadWeakRetained((id *)a1[4] + 7);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    queue = *((void *)a1[4] + 2);
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    int v9 = __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_3;
    BOOL v10 = &unk_26483BA90;
    v11[0] = a1[4];
    dispatch_async(queue, &v6);
    objc_storeStrong(v11, 0);
  }
}

void __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 32);
  id v4 = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "manager:autoUpdateScheduleStateChanged:autoInstallOperation:", v2, v3 & 1);
}

void __66__SUSUISoftwareUpdateClientManager__queue_setAutoUpdateScheduled___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 32);
  id v4 = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "manager:autoUpdateScheduleStateChanged:autoInstallOperation:", v2, v3 & 1);
}

- (void)cancelAutoInstall
{
  v8[2] = self;
  v8[1] = (id)a2;
  queue = self->_workQueue;
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  uint64_t v6 = __53__SUSUISoftwareUpdateClientManager_cancelAutoInstall__block_invoke;
  int v7 = &unk_26483BA90;
  v8[0] = self;
  dispatch_async(queue, &v3);
  objc_storeStrong(v8, 0);
}

uint64_t __53__SUSUISoftwareUpdateClientManager_cancelAutoInstall__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cancelAutoInstall", a1, a1);
}

- (void)_queue_cancelAutoInstall
{
  int v8 = self;
  location[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  location[0] = _SUSUILoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_impl(&dword_228401000, log, type, "Canceling auto install", v5, 2u);
  }
  objc_storeStrong(location, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_autoInstallOperation);
  [WeakRetained cancel];

  [(SUSUISoftwareUpdateClientManager *)v8 _queue_setAutoUpdateScheduled:0];
}

- (id)eligibleRollback
{
  v17[2] = self;
  v17[1] = (id)a2;
  uint64_t v11 = 0;
  SEL v12 = &v11;
  int v13 = 838860800;
  int v14 = 48;
  int v15 = __Block_byref_object_copy_;
  SEL v16 = __Block_byref_object_dispose_;
  v17[0] = 0;
  queue = self->_workQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __52__SUSUISoftwareUpdateClientManager_eligibleRollback__block_invoke;
  int v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  id v4 = (id)v12[5];
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(v17, 0);
  return v4;
}

void __52__SUSUISoftwareUpdateClientManager_eligibleRollback__block_invoke(uint64_t a1)
{
}

- (void)setEligibleRollback:(id)a3
{
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __56__SUSUISoftwareUpdateClientManager_setEligibleRollback___block_invoke;
  int v8 = &unk_26483BAB8;
  int v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __56__SUSUISoftwareUpdateClientManager_setEligibleRollback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEligibleRollback:", *(void *)(a1 + 40), a1, a1);
}

- (void)_queue_setEligibleRollback:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2((dispatch_queue_t)v5->_workQueue);
  if (([(SURollbackDescriptor *)v5->_rollbackDescriptor isEqual:location[0]] & 1) == 0)
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v6, (uint64_t)location[0]);
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "Settings eligibleRollback to: %@", v6, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_storeStrong((id *)&v5->_rollbackDescriptor, location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)rollbackUpdateWithOptions:(id)a3 completion:(id)a4
{
  SEL v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __73__SUSUISoftwareUpdateClientManager_rollbackUpdateWithOptions_completion___block_invoke;
  id v10 = &unk_26483BD60;
  uint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __73__SUSUISoftwareUpdateClientManager_rollbackUpdateWithOptions_completion___block_invoke(void *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "rollbackUpdateWithOptions:withResult:", a1[5], a1[6], a1, a1);
}

- (BOOL)isRollingBack
{
  uint64_t v17 = self;
  SEL v16 = a2;
  uint64_t v11 = 0;
  id v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  queue = self->_workQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __49__SUSUISoftwareUpdateClientManager_isRollingBack__block_invoke;
  int v9 = &unk_2648403D0;
  v10[1] = &v11;
  v10[0] = self;
  dispatch_sync(queue, &v5);
  char v4 = *((unsigned char *)v12 + 24);
  objc_storeStrong(v10, 0);
  _Block_object_dispose(&v11, 8);
  return v4 & 1;
}

uint64_t __49__SUSUISoftwareUpdateClientManager_isRollingBack__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 33) & 1;
  return result;
}

- (void)setRollingBack:(BOOL)a3 rollback:(id)a4
{
  SEL v16 = self;
  SEL v15 = a2;
  BOOL v14 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  queue = v16->_workQueue;
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  int v8 = __60__SUSUISoftwareUpdateClientManager_setRollingBack_rollback___block_invoke;
  int v9 = &unk_26483EAA0;
  id v10 = v16;
  BOOL v12 = v14;
  id v11 = location;
  dispatch_async(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

void __60__SUSUISoftwareUpdateClientManager_setRollingBack_rollback___block_invoke(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_queue_setRollingBack:", *(unsigned char *)(a1 + 48) & 1);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    queue = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    int v8 = __60__SUSUISoftwareUpdateClientManager_setRollingBack_rollback___block_invoke_2;
    int v9 = &unk_26483EAA0;
    id v10 = *(id *)(a1 + 32);
    char v12 = *(unsigned char *)(a1 + 48) & 1;
    id v11 = *(id *)(a1 + 40);
    dispatch_async(queue, &v5);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v10, 0);
  }
}

void __60__SUSUISoftwareUpdateClientManager_setRollingBack_rollback___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 56));
  [WeakRetained manager:*(void *)(a1 + 32) rollingBackStateChanged:*(unsigned char *)(a1 + 48) & 1 rollback:*(void *)(a1 + 40)];
}

- (void)_queue_setRollingBack:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v7->_rollingBack != v5)
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        uint64_t v3 = @"YES";
      }
      else {
        uint64_t v3 = @"NO";
      }
      __os_log_helper_16_2_1_8_64((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "Setting rollingBack: %@", v8, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v7->_rollingBack = v5;
  }
}

- (void)purgeDownload:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __50__SUSUISoftwareUpdateClientManager_purgeDownload___block_invoke;
  int v8 = &unk_2648403F8;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __50__SUSUISoftwareUpdateClientManager_purgeDownload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "purgeDownload:", *(void *)(a1 + 40), a1, a1);
}

- (void)isInstallationKeybagRequired:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __65__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequired___block_invoke;
  int v8 = &unk_2648403F8;
  uint64_t v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __65__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequired___block_invoke(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  char v10 = 0;
  char v10 = [*(id *)(*(void *)(a1 + 32) + 24) isInstallationKeybagRequired] & 1;
  if (*(void *)(a1 + 40))
  {
    queue = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    int v6 = __65__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequired___block_invoke_2;
    int v7 = &unk_26483BDD8;
    id v8 = *(id *)(a1 + 40);
    char v9 = v10 & 1;
    dispatch_async(queue, &v3);
    objc_storeStrong(&v8, 0);
  }
}

uint64_t __65__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequired___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) & 1);
}

- (void)isInstallationKeybagRequiredForDescriptor:(id)a3 result:(id)a4
{
  SEL v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = __85__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequiredForDescriptor_result___block_invoke;
  char v10 = &unk_26483BD60;
  uint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __85__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequiredForDescriptor_result___block_invoke(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  char v10 = 0;
  char v10 = [*(id *)(*(void *)(a1 + 32) + 24) isInstallationKeybagRequiredForDescriptor:*(void *)(a1 + 40)] & 1;
  if (*(void *)(a1 + 48))
  {
    queue = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    uint64_t v6 = __85__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequiredForDescriptor_result___block_invoke_2;
    int v7 = &unk_26483BDD8;
    id v8 = *(id *)(a1 + 48);
    char v9 = v10 & 1;
    dispatch_async(queue, &v3);
    objc_storeStrong(&v8, 0);
  }
}

uint64_t __85__SUSUISoftwareUpdateClientManager_isInstallationKeybagRequiredForDescriptor_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned char *)(a1 + 40) & 1);
}

- (void)createInstallationKeybagWithOptions:(id)a3 completion:(id)a4
{
  SEL v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = v16->_workQueue;
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = __83__SUSUISoftwareUpdateClientManager_createInstallationKeybagWithOptions_completion___block_invoke;
  char v10 = &unk_26483BD60;
  uint64_t v11 = v16;
  id v12 = location[0];
  id v13 = v14;
  dispatch_async(queue, &v6);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __83__SUSUISoftwareUpdateClientManager_createInstallationKeybagWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  char v10 = 0;
  char v10 = [*(id *)(*(void *)(a1 + 32) + 24) createInstallationKeybagWithOptions:*(void *)(a1 + 40)] & 1;
  if (*(void *)(a1 + 48))
  {
    queue = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    uint64_t v6 = __83__SUSUISoftwareUpdateClientManager_createInstallationKeybagWithOptions_completion___block_invoke_2;
    int v7 = &unk_26483BDD8;
    id v8 = *(id *)(a1 + 48);
    char v9 = v10 & 1;
    dispatch_async(queue, &v3);
    objc_storeStrong(&v8, 0);
  }
}

void __83__SUSUISoftwareUpdateClientManager_createInstallationKeybagWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  char v2 = *(unsigned char *)(a1 + 40);
  char v3 = 0;
  if (v2)
  {
    (*(void (**)(uint64_t, void, void))(v1 + 16))(v1, *(unsigned char *)(a1 + 40) & 1, 0);
  }
  else
  {
    id v4 = (id)[MEMORY[0x263F78250] errorWithCode:82];
    char v3 = 1;
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, v2 & 1, v4);
  }
  if (v3) {
}
  }

- (void)destroyInstallationKeybag:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __62__SUSUISoftwareUpdateClientManager_destroyInstallationKeybag___block_invoke;
  id v8 = &unk_2648403F8;
  char v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __62__SUSUISoftwareUpdateClientManager_destroyInstallationKeybag___block_invoke(uint64_t a1)
{
  v8[2] = (id)a1;
  v8[1] = (id)a1;
  [*(id *)(*(void *)(a1 + 32) + 24) destroyInstallationKeybag];
  if (*(void *)(a1 + 40))
  {
    queue = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v3 = MEMORY[0x263EF8330];
    int v4 = -1073741824;
    int v5 = 0;
    int v6 = __62__SUSUISoftwareUpdateClientManager_destroyInstallationKeybag___block_invoke_2;
    int v7 = &unk_26483BAE0;
    v8[0] = *(id *)(a1 + 40);
    dispatch_async(queue, &v3);
    objc_storeStrong(v8, 0);
  }
}

uint64_t __62__SUSUISoftwareUpdateClientManager_destroyInstallationKeybag___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1);
}

- (void)getDDMDeclaration:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke;
  id v8 = &unk_2648403F8;
  char v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke(id *a1)
{
  v9[2] = a1;
  v9[1] = a1;
  char v2 = (void *)*((void *)a1[4] + 3);
  uint64_t v3 = MEMORY[0x263EF8330];
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke_2;
  int v7 = &unk_264840510;
  v9[0] = a1[5];
  id v8 = a1[4];
  objc_msgSend(v2, "getDDMDeclarationWithHandler:");
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
}

void __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = (id)a1;
  if (*(void *)(a1 + 40))
  {
    queue = *(NSObject **)(*(void *)(a1 + 32) + 16);
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    char v9 = __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke_3;
    id v10 = &unk_26483BE50;
    v13[0] = *(id *)(a1 + 40);
    id v11 = location[0];
    id v12 = v14;
    dispatch_async(queue, &v6);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

uint64_t __54__SUSUISoftwareUpdateClientManager_getDDMDeclaration___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)client:(id)a3 scanRequestDidStartForOptions:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v4 manager:v10 scanRequestDidStartForOptions:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6
{
  SEL v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  id v12 = 0;
  objc_storeStrong(&v12, a6);
  dispatch_assert_queue_V2((dispatch_queue_t)v16->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v16->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v6 = objc_loadWeakRetained((id *)&v16->_delegate);
    [v6 manager:v16 scanRequestDidFinishForOptions:v14 results:v13 error:v12];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v4 manager:v10 downloadDidStart:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v4 manager:v10 downloadProgressDidChange:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  [(SUSUISoftwareUpdateClientManager *)v10 setAutoUpdateScheduled:0];
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v4 manager:v10 downloadWasInvalidatedForNewUpdatesAvailable:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v13->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v5 = objc_loadWeakRetained((id *)&v13->_delegate);
    [v5 manager:v13 downloadDidFinish:v11 withInstallPolicy:v10];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v13->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v5 = objc_loadWeakRetained((id *)&v13->_delegate);
    [v5 manager:v13 downloadDidFail:v11 withError:v10];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidStart:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v4 manager:v10 installDidStart:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  dispatch_assert_queue_V2((dispatch_queue_t)v13->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v5 = objc_loadWeakRetained((id *)&v13->_delegate);
    [v5 manager:v13 installDidFail:v11 withError:v10];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installDidFinish:(id)a4
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v10->_completionQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&v10->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v4 = objc_loadWeakRetained((id *)&v10->_delegate);
    [v4 manager:v10 installDidFinish:v8];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 installTonightScheduled:(BOOL)a4 operationID:(id)a5
{
  id v10 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  dispatch_assert_queue_V2(v10[2]);
  [(dispatch_queue_t *)v10 setAutoUpdateScheduled:v8];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidStart:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v8 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  dispatch_assert_queue_V2(v8[2]);
  os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_34_8_66((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:rollbackDidStart:]", (uint64_t)v6);
    _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(dispatch_queue_t *)v8 setRollingBack:1 rollback:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidFinish:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v8 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  dispatch_assert_queue_V2(v8[2]);
  os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_34_8_66((uint64_t)v9, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:rollbackDidFinish:]", (uint64_t)v6);
    _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(dispatch_queue_t *)v8 setRollingBack:0 rollback:v6];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 rollbackDidFail:(id)a4 withError:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  id v8 = 0;
  objc_storeStrong(&v8, a5);
  dispatch_assert_queue_V2(v11[2]);
  os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_34_8_66_8_64((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:rollbackDidFail:withError:]", (uint64_t)v9, (uint64_t)v8);
    _os_log_impl(&dword_228401000, oslog, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@\n Error: %@", v12, 0x20u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(dispatch_queue_t *)v11 setRollingBack:0 rollback:v9];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 inUserInteraction:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_completionQueue);
  id v8 = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_34((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:inUserInteraction:]");
    _os_log_impl(&dword_228401000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%{public}s", v12, 0xCu);
  }
  objc_storeStrong(&v8, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&v11->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v4 = objc_loadWeakRetained((id *)&v11->_delegate);
    [v4 manager:v11 inUserInteraction:v9];
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 handleUIForDDMDeclaration:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  dispatch_assert_queue_V2((dispatch_queue_t)v11->_completionQueue);
  id v8 = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_34_8_66((uint64_t)v12, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:handleUIForDDMDeclaration:]", (uint64_t)v9);
    _os_log_impl(&dword_228401000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%{public}s: %{public}@", v12, 0x16u);
  }
  objc_storeStrong(&v8, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&v11->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v4 = objc_loadWeakRetained((id *)&v11->_delegate);
    [v4 manager:v11 handleDDMDeclaration:v9];
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  BOOL v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)v14->_completionQueue);
  id v10 = _SUSUILoggingFacility();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_34_4_0((uint64_t)v15, (uint64_t)"-[SUSUISoftwareUpdateClientManager client:clearingSpaceForDownload:clearingSpace:]", v11);
    _os_log_impl(&dword_228401000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "%{public}s, clearing = %d", v15, 0x12u);
  }
  objc_storeStrong(&v10, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v5 = objc_loadWeakRetained((id *)&v14->_delegate);
    [v5 manager:v14 clearingSpaceForDownload:v12 clearingSpace:v11];
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationWasCancelled:(id)a3
{
  BOOL v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v11->_workQueue;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = __69__SUSUISoftwareUpdateClientManager_autoInstallOperationWasCancelled___block_invoke;
  id v8 = &unk_26483BA90;
  id v9 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __69__SUSUISoftwareUpdateClientManager_autoInstallOperationWasCancelled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAutoUpdateScheduled:", 0, a1, a1);
}

- (void)autoInstallOperationDidConsent:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResponse:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationPasscodePolicyDidChange:(id)a3 passcodePolicyType:(unint64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (SUSUISoftwareUpdateClientManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUSUISoftwareUpdateClientManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end