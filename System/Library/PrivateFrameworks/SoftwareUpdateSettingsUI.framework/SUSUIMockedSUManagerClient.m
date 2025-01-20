@interface SUSUIMockedSUManagerClient
- (BOOL)createInstallationKeybagWithOptions:(id)a3;
- (BOOL)isAutoUpdateScheduled;
- (BOOL)isAutomaticDownloadEnabled;
- (BOOL)isAutomaticUpdateV2Enabled;
- (BOOL)isInstallationKeybagRequired;
- (BOOL)isInstallationKeybagRequiredForDescriptor:(id)a3;
- (BOOL)isSplatOnlyUpdateInstalled;
- (BOOL)isSplatOnlyUpdateRollbackAllowed:(id *)a3;
- (BOOL)securityResponseRollbackSuggested:(id)a3 error:(id *)a4;
- (BOOL)setLastRollbackDescriptor:(id)a3;
- (BOOL)writeKeepAliveFile;
- (SUSUIMockedSUManagerClient)initWithDelegate:(id)a3 queue:(id)a4 clientType:(int)a5;
- (id)controllerStrategy;
- (id)getDocumentationDataForInstalledUpdateType:(int)a3 error:(id *)a4;
- (void)areUpdatesDownloadableWithOptions:(id)a3 alternateUpdateOptions:(id)a4 preferredUpdateDownloadable:(BOOL *)a5 alternateUpdateDownloadable:(BOOL *)a6 preferredUpdateError:(id *)a7 alternateUpdateError:(id *)a8;
- (void)autoScanAndDownloadIfAvailable:(id)a3;
- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4;
- (void)currentPasscodePolicy:(id)a3;
- (void)delayEndDate:(id)a3;
- (void)descriptors:(id)a3;
- (void)destroyInstallationKeybag;
- (void)deviceHasSufficientSpaceForDownloads:(id)a3;
- (void)download:(id)a3;
- (void)downloadAndInstallState:(id)a3;
- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4;
- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3;
- (void)getMandatorySoftwareUpdateDictionary:(id)a3;
- (void)installUpdate:(id)a3;
- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4;
- (void)isAutoUpdateEnabled:(id)a3;
- (void)isAutoUpdateScheduled:(id)a3;
- (void)isClearingSpaceForDownload:(id)a3;
- (void)isDelayingUpdates:(id)a3;
- (void)isDownloading:(id)a3;
- (void)isRollingBack:(id)a3;
- (void)isScanning:(id)a3;
- (void)isUpdateReadyForInstallation:(id)a3;
- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4;
- (void)pauseDownload:(id)a3;
- (void)presentAutoUpdateBanner:(id)a3;
- (void)previousRollbackWithOptions:(id)a3 withResult:(id)a4;
- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)recordSUAnalyticsEvent:(id)a3;
- (void)resumeDownload:(id)a3;
- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4;
- (void)scanForUpdates:(id)a3 withScanResults:(id)a4;
- (void)scheduleRollbackRebootForLater:(id)a3;
- (void)setMandatorySoftwareUpdateDictionary:(id)a3;
- (void)slaVersion:(id)a3;
- (void)softwareUpdatePathRestriction:(id)a3;
- (void)startDownload:(id)a3;
- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4;
- (void)submitSUAnalyticsEvent:(id)a3;
- (void)submitSUAnalyticsEventsWithName:(id)a3;
- (void)updateDownloadOptions:(id)a3 withResult:(id)a4;
- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5;
@end

@implementation SUSUIMockedSUManagerClient

- (SUSUIMockedSUManagerClient)initWithDelegate:(id)a3 queue:(id)a4 clientType:(int)a5
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  int v13 = a5;
  v5 = v16;
  v16 = 0;
  v12.receiver = v5;
  v12.super_class = (Class)SUSUIMockedSUManagerClient;
  v11 = [(SUManagerClient *)&v12 initWithDelegate:location[0] queue:v14 clientType:a5];
  v16 = v11;
  objc_storeStrong((id *)&v16, v11);
  if (v11)
  {
    [(SUManagerClient *)v16 invalidate];
    if (location[0])
    {
      id v8 = +[SUSUITestAutomationManager sharedManager];
      [v8 addResponderDelegate:location[0] forServiceType:0];
    }
  }
  v7 = v16;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v16, 0);
  return v7;
}

- (void)isScanning:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUIMockedSUManagerClient *)v11 controllerStrategy];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __41__SUSUIMockedSUManagerClient_isScanning___block_invoke;
  id v8 = &unk_2648408D8;
  id v9 = location[0];
  objc_msgSend(v3, "isScanning:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __41__SUSUIMockedSUManagerClient_isScanning___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v16 = a1;
  char v15 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v13 = a1;
  if (*(void *)(a1 + 32))
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = __41__SUSUIMockedSUManagerClient_isScanning___block_invoke_2;
    id v9 = &unk_26483BC98;
    id v11 = *(id *)(a1 + 32);
    char v12 = v15 & 1;
    id v10 = location;
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __41__SUSUIMockedSUManagerClient_isScanning___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

- (void)scanForUpdates:(id)a3 withScanResults:(id)a4
{
  char v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v6 = [(SUSUIMockedSUManagerClient *)v15 controllerStrategy];
  id v5 = location[0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __61__SUSUIMockedSUManagerClient_scanForUpdates_withScanResults___block_invoke;
  id v11 = &unk_264840BC8;
  id v12 = v13;
  objc_msgSend(v6, "scanForUpdates:withScanResults:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __61__SUSUIMockedSUManagerClient_scanForUpdates_withScanResults___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  if (a1[4])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v6 = MEMORY[0x263EF8330];
    int v7 = -1073741824;
    int v8 = 0;
    int v9 = __61__SUSUIMockedSUManagerClient_scanForUpdates_withScanResults___block_invoke_2;
    id v10 = &unk_26483BE50;
    v13[0] = a1[4];
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

uint64_t __61__SUSUIMockedSUManagerClient_scanForUpdates_withScanResults___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)autoScanAndDownloadIfAvailable:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (void (**)(id, void))location[0];
  id v4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78360] code:0 userInfo:0];
  v3[2](v3, 0);

  objc_storeStrong(location, 0);
}

- (void)isClearingSpaceForDownload:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, void, void))location[0] + 2))(location[0], 0, 0);
  objc_storeStrong(location, 0);
}

- (void)descriptors:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (void (**)(id, void))location[0];
  id v4 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F78360] code:0 userInfo:0];
  v3[2](v3, 0);

  objc_storeStrong(location, 0);
}

- (id)getDocumentationDataForInstalledUpdateType:(int)a3 error:(id *)a4
{
  return 0;
}

- (void)isDownloading:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)startDownload:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  char v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v6 = [(SUSUIMockedSUManagerClient *)v15 controllerStrategy];
  id v5 = location[0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __66__SUSUIMockedSUManagerClient_startDownloadWithOptions_withResult___block_invoke;
  id v11 = &unk_2648408D8;
  id v12 = v13;
  objc_msgSend(v6, "startDownloadWithOptions:withResult:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __66__SUSUIMockedSUManagerClient_startDownloadWithOptions_withResult___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v16 = a1;
  char v15 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v13 = a1;
  if (*(void *)(a1 + 32))
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    int v8 = __66__SUSUIMockedSUManagerClient_startDownloadWithOptions_withResult___block_invoke_2;
    int v9 = &unk_26483BC98;
    id v11 = *(id *)(a1 + 32);
    char v12 = v15 & 1;
    id v10 = location;
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __66__SUSUIMockedSUManagerClient_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

- (void)pauseDownload:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)resumeDownload:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = __63__SUSUIMockedSUManagerClient_updateDownloadOptions_withResult___block_invoke;
  id v10 = &unk_26483BAE0;
  id v11 = v12;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

uint64_t __63__SUSUIMockedSUManagerClient_updateDownloadOptions_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
}

- (void)download:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v11;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __39__SUSUIMockedSUManagerClient_download___block_invoke;
  int v8 = &unk_264842418;
  id v9 = location[0];
  -[SUSUIMockedSUManagerClient downloadAndInstallState:](v3, "downloadAndInstallState:");
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __39__SUSUIMockedSUManagerClient_download___block_invoke(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v11 = 0;
  objc_storeStrong(&v11, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)downloadAndInstallState:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(SUSUIMockedSUManagerClient *)v11 controllerStrategy];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __54__SUSUIMockedSUManagerClient_downloadAndInstallState___block_invoke;
  int v8 = &unk_264842418;
  id v9 = location[0];
  objc_msgSend(v3, "downloadAndInstallState:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __54__SUSUIMockedSUManagerClient_downloadAndInstallState___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v22 = 0;
  objc_storeStrong(&v22, a3);
  id v21 = 0;
  objc_storeStrong(&v21, a4);
  id v20 = 0;
  objc_storeStrong(&v20, a5);
  v19[1] = a1;
  if (a1[4])
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v10 = MEMORY[0x263EF8330];
    int v11 = -1073741824;
    int v12 = 0;
    uint64_t v13 = __54__SUSUIMockedSUManagerClient_downloadAndInstallState___block_invoke_2;
    id v14 = &unk_264842440;
    v19[0] = a1[4];
    id v15 = location[0];
    id v16 = v22;
    id v17 = v21;
    id v18 = v20;
    dispatch_async(queue, &v10);

    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(v19, 0);
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

uint64_t __54__SUSUIMockedSUManagerClient_downloadAndInstallState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(a1 + 32));
}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v9 = [(SUSUIMockedSUManagerClient *)v19 controllerStrategy];
  id v7 = location[0];
  id v8 = v17;
  uint64_t v10 = MEMORY[0x263EF8330];
  int v11 = -1073741824;
  int v12 = 0;
  uint64_t v13 = __99__SUSUIMockedSUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
  id v14 = &unk_264842468;
  id v15 = v16;
  objc_msgSend(v9, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", v7, v8);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __99__SUSUIMockedSUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1, char a2, char a3, id obj, void *a5)
{
  uint64_t v11 = a1;
  char v10 = a2 & 1;
  char v9 = a3 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

- (void)deviceHasSufficientSpaceForDownloads:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4
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

- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4
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

- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  char v9 = __69__SUSUIMockedSUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke;
  char v10 = &unk_26483BAE0;
  id v11 = v12;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

uint64_t __69__SUSUIMockedSUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
}

- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
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

- (void)previousRollbackWithOptions:(id)a3 withResult:(id)a4
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

- (void)isRollingBack:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __44__SUSUIMockedSUManagerClient_isRollingBack___block_invoke;
  int v8 = &unk_26483BAE0;
  id v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __44__SUSUIMockedSUManagerClient_isRollingBack___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
}

- (void)scheduleRollbackRebootForLater:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (BOOL)isSplatOnlyUpdateInstalled
{
  return 1;
}

- (BOOL)isSplatOnlyUpdateRollbackAllowed:(id *)a3
{
  return 1;
}

- (BOOL)setLastRollbackDescriptor:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)securityResponseRollbackSuggested:(id)a3 error:(id *)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4
{
  int v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  objc_storeStrong(&location, 0);
}

- (void)currentPasscodePolicy:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)isAutoUpdateEnabled:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)isAutoUpdateScheduled:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = __52__SUSUIMockedSUManagerClient_isAutoUpdateScheduled___block_invoke;
  int v8 = &unk_26483BAE0;
  id v9 = location[0];
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __52__SUSUIMockedSUManagerClient_isAutoUpdateScheduled___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
}

- (void)presentAutoUpdateBanner:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)isUpdateReadyForInstallation:(id)a3
{
  uint64_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, uint64_t, void))location[0] + 2))(location[0], 1, 0);
  [(SUSUIMockedSUManagerClient *)v4 isUpdateReadyForInstallationWithOptions:0 withResult:location[0]];
  objc_storeStrong(location, 0);
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v6 = [(SUSUIMockedSUManagerClient *)v15 controllerStrategy];
  id v5 = location[0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  char v10 = __81__SUSUIMockedSUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke;
  id v11 = &unk_2648408D8;
  id v12 = v13;
  objc_msgSend(v6, "isUpdateReadyForInstallationWithOptions:withResult:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __81__SUSUIMockedSUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v16 = a1;
  char v15 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v13 = a1;
  if (*(void *)(a1 + 32))
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    int v8 = __81__SUSUIMockedSUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2;
    int v9 = &unk_26483BC98;
    id v11 = *(id *)(a1 + 32);
    char v12 = v15 & 1;
    id v10 = location;
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __81__SUSUIMockedSUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

- (void)installUpdate:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, uint64_t, void))location[0] + 2))(location[0], 1, 0);
  objc_storeStrong(location, 0);
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  char v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v6 = [(SUSUIMockedSUManagerClient *)v15 controllerStrategy];
  id v5 = location[0];
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = -1073741824;
  int v9 = 0;
  id v10 = __73__SUSUIMockedSUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke;
  id v11 = &unk_2648408D8;
  id v12 = v13;
  objc_msgSend(v6, "installUpdateWithInstallOptions:withResult:", v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __73__SUSUIMockedSUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke(uint64_t a1, char a2, id obj)
{
  uint64_t v16 = a1;
  char v15 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v13 = a1;
  if (*(void *)(a1 + 32))
  {
    queue = MEMORY[0x263EF83A0];
    uint64_t v5 = MEMORY[0x263EF8330];
    int v6 = -1073741824;
    int v7 = 0;
    int v8 = __73__SUSUIMockedSUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke_2;
    int v9 = &unk_26483BC98;
    id v11 = *(id *)(a1 + 32);
    char v12 = v15 & 1;
    id v10 = location;
    dispatch_async(queue, &v5);

    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __73__SUSUIMockedSUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned char *)(a1 + 48) & 1);
}

- (BOOL)isInstallationKeybagRequired
{
  id v3 = [(SUSUIMockedSUManagerClient *)self controllerStrategy];
  char v4 = [v3 isInstallationKeybagRequiredForDescriptor:0];

  return v4 & 1;
}

- (BOOL)isInstallationKeybagRequiredForDescriptor:(id)a3
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(SUSUIMockedSUManagerClient *)v7 controllerStrategy];
  char v5 = [v4 isInstallationKeybagRequiredForDescriptor:location[0]];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)createInstallationKeybagWithOptions:(id)a3
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(SUSUIMockedSUManagerClient *)v7 controllerStrategy];
  char v5 = [v4 createInstallationKeybagWithOptions:location[0]];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)destroyInstallationKeybag
{
  id v2 = [(SUSUIMockedSUManagerClient *)self controllerStrategy];
  [v2 destroyInstallationKeybag];
}

- (void)slaVersion:(id)a3
{
  char v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)SUSUIMockedSUManagerClient;
  [(SUManagerClient *)&v3 slaVersion:location[0]];
  objc_storeStrong(location, 0);
}

- (void)softwareUpdatePathRestriction:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, void, void))location[0] + 2))(location[0], 0, 0);
  objc_storeStrong(location, 0);
}

- (void)isDelayingUpdates:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, void, void))location[0] + 2))(location[0], 0, 0);
  objc_storeStrong(location, 0);
}

- (void)delayEndDate:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, void))location[0] + 2))(location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)setMandatorySoftwareUpdateDictionary:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)getMandatorySoftwareUpdateDictionary:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, void))location[0] + 2))(location[0], 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isAutomaticUpdateV2Enabled
{
  return 1;
}

- (BOOL)isAutoUpdateScheduled
{
  return 0;
}

- (BOOL)isAutomaticDownloadEnabled
{
  return 1;
}

- (void)areUpdatesDownloadableWithOptions:(id)a3 alternateUpdateOptions:(id)a4 preferredUpdateDownloadable:(BOOL *)a5 alternateUpdateDownloadable:(BOOL *)a6 preferredUpdateError:(id *)a7 alternateUpdateError:(id *)a8
{
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v53 = 0;
  objc_storeStrong(&v53, a4);
  v52 = a5;
  v51 = a6;
  v50 = a7;
  v49 = a8;
  uint64_t v44 = 0;
  v45 = &v44;
  int v46 = 0x20000000;
  int v47 = 32;
  char v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  int v41 = 0x20000000;
  int v42 = 32;
  char v43 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  int v34 = 838860800;
  int v35 = 48;
  v36 = __Block_byref_object_copy__1;
  v37 = __Block_byref_object_dispose__1;
  id v38 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  int v27 = 838860800;
  int v28 = 48;
  v29 = __Block_byref_object_copy__1;
  v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  id v10 = [(SUSUIMockedSUManagerClient *)v55 controllerStrategy];
  uint64_t v16 = MEMORY[0x263EF8330];
  int v17 = -1073741824;
  int v18 = 0;
  v19 = __185__SUSUIMockedSUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke;
  id v20 = &unk_264842490;
  id v21 = &v44;
  id v22 = &v39;
  v23 = &v32;
  v24 = &v25;
  objc_msgSend(v10, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", location[0], v53);

  if (v52) {
    BOOL *v52 = v45[3] & 1;
  }
  if (v51) {
    BOOL *v51 = v40[3] & 1;
  }
  if (v50)
  {
    id v8 = (id) v33[5];
    id *v50 = v8;
  }
  if (v49)
  {
    id v9 = (id) v26[5];
    id *v49 = v9;
  }
  _Block_object_dispose(&v25, 8);
  objc_storeStrong(&v31, 0);
  _Block_object_dispose(&v32, 8);
  objc_storeStrong(&v38, 0);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v44, 8);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(location, 0);
}

void __185__SUSUIMockedSUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke(void *a1, char a2, char a3, id obj, void *a5)
{
  id v11 = a1;
  char v10 = a2 & 1;
  char v9 = a3 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  id v7 = 0;
  objc_storeStrong(&v7, a5);
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = v10 & 1;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v9 & 1;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), location);
  objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

- (BOOL)writeKeepAliveFile
{
  return 0;
}

- (void)recordSUAnalyticsEvent:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)submitSUAnalyticsEvent:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)submitSUAnalyticsEventsWithName:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)controllerStrategy
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16[2] = self;
  v16[1] = (id)a2;
  id v11 = +[SUSUITestAutomationManager sharedManager];
  id v10 = (id)[v11 currentSession];
  v16[0] = (id)[v10 strategyForServiceType:0];

  getSUSMKSoftwareUpdateServicesStrategyBaseClass_1();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v16[0];
  }
  else
  {
    id v15 = _SUSUIInternalLoggingFacility();
    char v14 = 16;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      log = v15;
      os_log_type_t type = v14;
      id v9 = +[SUSUITestAutomationManager sharedManager];
      id v8 = (id)[v9 currentSession];
      id v7 = (id)[v8 correlationId];
      id v4 = v7;
      id v13 = v4;
      id v12 = (id)objc_opt_class();
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v18, (uint64_t)v4, (uint64_t)v12);
      _os_log_error_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] The strategy class %@ doesn't inherit SUSMKSoftwareUpdateServicesStrategyBase.", v18, 0x16u);

      objc_storeStrong(&v12, 0);
      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v15, 0);
    id v17 = 0;
  }
  objc_storeStrong(v16, 0);
  id v2 = v17;
  return v2;
}

@end