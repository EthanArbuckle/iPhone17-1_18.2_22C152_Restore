@interface ICQUsageStorageController
+ (id)storageAvailableSpecifier;
+ (id)storageUsedSpecifier;
+ (id)systemSizeAvailable:(id)a3;
+ (id)systemSizeUsed:(id)a3;
- (BOOL)delayUsagePopulation;
- (BOOL)mediaCache:(id)a3 hasGroups:(id)a4;
- (BOOL)openedFromSoftwareUpdate;
- (BOOL)shouldDeferPushForSpecifierID:(id)a3;
- (BOOL)storageExpired;
- (Class)usageDetailControllerForBundleID:(id)a3;
- (ICQUsageStorageController)init;
- (id)_specifierForApp:(id)a3;
- (id)_specifierForBundle:(id)a3;
- (id)controllerForSpecifier:(id)a3;
- (id)specifiers;
- (id)stringWithAppSizeForSpecifier:(id)a3;
- (id)tapToRadarURLForAttributes:(id)a3;
- (void)addStorageSpecifiers:(id)a3 completed:(BOOL)a4;
- (void)checkForPendingUpdate;
- (void)dealloc;
- (void)didUnlock;
- (void)handleURL:(id)a3;
- (void)prepareForSnapshot;
- (void)refreshSoftwareUpdateRequiredSpace;
- (void)reloadSpecifiers;
- (void)reloadStorageSummary;
- (void)removeStorageSpecifier:(id)a3;
- (void)setDelayUsagePopulation:(BOOL)a3;
- (void)setOpenedFromSoftwareUpdate:(BOOL)a3;
- (void)sizeChangedForSpecifier:(id)a3;
- (void)snapshotAndReportDiskSpace;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICQUsageStorageController

- (id)tapToRadarURLForAttributes:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__ICQUsageStorageController_BugReporting__tapToRadarURLForAttributes___block_invoke;
  v10[3] = &unk_264921AB8;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  id v7 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v7 setScheme:@"tap-to-radar"];
  [v7 setHost:@"new"];
  [v7 setQueryItems:v6];
  v8 = [v7 URL];

  return v8;
}

void __70__ICQUsageStorageController_BugReporting__tapToRadarURLForAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x263F08BD0] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

- (void)snapshotAndReportDiskSpace
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(ICQUsageStorageController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:0];

  v5 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v5];
  id v7 = [(ICQUsageStorageController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  [v5 startAnimating];
  v15[0] = 0;
  if (!DiskSpaceDiagnosticsLibraryCore_frameworkLibrary)
  {
    v15[1] = MEMORY[0x263EF8330];
    v15[2] = 3221225472;
    v15[3] = __DiskSpaceDiagnosticsLibraryCore_block_invoke;
    v15[4] = &__block_descriptor_40_e5_v8__0l;
    v15[5] = v15;
    long long v16 = xmmword_264921B28;
    uint64_t v17 = 0;
    DiskSpaceDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
    v8 = (void *)v15[0];
    if (DiskSpaceDiagnosticsLibraryCore_frameworkLibrary)
    {
      if (!v15[0]) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v13 = v15[0];
      v8 = (void *)abort_report_np();
    }
    free(v8);
  }
LABEL_4:
  v9 = objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:", &unk_26E0839A8, v13);
  v10 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.FilesystemMetadataSnapshotService"];
  [v10 setRemoteObjectInterface:v9];
  [v10 resume];
  id v11 = [v10 remoteObjectProxy];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke;
  v14[3] = &unk_264921B08;
  v14[4] = self;
  id v12 = (id)[v11 generateFilesystemMetadataSnapshotWithOptions:0 reply:v14];
}

void __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke_cold_1((uint64_t)v6, v7);
    }

    v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"FILESYSTEM_METADATA_SNAPSHOT_FAIL_TITLE" value:&stru_26DFF2C90 table:@"Localizable"];

    v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"FILESYSTEM_METADATA_SNAPSHOT_FAIL_MESSAGE" value:&stru_26DFF2C90 table:@"Localizable"];
  }
  else
  {
    v9 = 0;
    id v11 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke_70;
  block[3] = &unk_264921AE0;
  block[4] = *(void *)(a1 + 32);
  id v17 = v6;
  id v18 = v9;
  id v19 = v11;
  id v20 = v5;
  id v12 = v5;
  id v13 = v11;
  id v14 = v9;
  id v15 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke_70(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:@"Radar" style:0 target:*(void *)(a1 + 32) action:sel_snapshotAndReportDiskSpace];
  v3 = [*(id *)(a1 + 32) navigationItem];
  [v3 setRightBarButtonItem:v2];

  id v4 = [*(id *)(a1 + 32) navigationItem];
  id v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:1];

  if (*(void *)(a1 + 40))
  {
    id v6 = (void *)MEMORY[0x263F82400];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"DIAGNOSTICS_ALERT_OK" value:&stru_26DFF2C90 table:@"Localizable"];
    id v11 = [v6 actionWithTitle:v8 style:0 handler:0];

    v9 = [MEMORY[0x263F82418] alertControllerWithTitle:*(void *)(a1 + 48) message:*(void *)(a1 + 56) preferredStyle:1];
    [v9 addAction:v11];
    [*(id *)(a1 + 32) presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    id v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:7];
    [v11 setObject:@"[Disk Space]: " forKeyedSubscript:@"Title"];
    [v11 setObject:@"Purple Performance" forKeyedSubscript:@"ComponentName"];
    [v11 setObject:@"1.0" forKeyedSubscript:@"ComponentVersion"];
    [v11 setObject:@"223755" forKeyedSubscript:@"ComponentID"];
    [v11 setObject:@"Other Bug" forKeyedSubscript:@"Classification"];
    [v11 setObject:@"Always" forKeyedSubscript:@"Reproducibility"];
    [v11 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"Attachments"];
    v9 = [*(id *)(a1 + 32) tapToRadarURLForAttributes:v11];
    v10 = [MEMORY[0x263F01880] defaultWorkspace];
    [v10 openURL:v9];
  }
}

- (ICQUsageStorageController)init
{
  v12.receiver = self;
  v12.super_class = (Class)ICQUsageStorageController;
  v2 = [(ICQUsageStorageController *)&v12 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_prepareForSnapshot name:@"preferencesPrepareForSnapshotNotification" object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_didEnterForeground name:*MEMORY[0x263F833B8] object:0];

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_appDeletionComplete name:@"AppDeletionCompleted" object:0];

    uint64_t v6 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    appsStorageGroup = v2->_appsStorageGroup;
    v2->_appsStorageGroup = (PSSpecifier *)v6;

    [(PSSpecifier *)v2->_appsStorageGroup setProperty:@"STORAGE_GROUP" forKey:*MEMORY[0x263F60138]];
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    deferredUsageApps = v2->_deferredUsageApps;
    v2->_deferredUsageApps = v8;

    v10 = +[ICQUsageStorageMonitor sharedMonitor];
    [v10 registerUsageStorageClient];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[ICQUsageStorageMonitor sharedMonitor];
  [v3 flushViews];

  id v4 = +[ICQUsageStorageMonitor sharedMonitor];
  [v4 deregisterUsageStorageClient];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)ICQUsageStorageController;
  [(ICQUsageStorageController *)&v6 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQUsageStorageController;
  [(ICQUsageStorageController *)&v4 viewWillAppear:a3];
  if (([(ICQUsageStorageController *)self isMovingToParentViewController] & 1) == 0)
  {
    [(ICQUsageStorageController *)self reloadStorageSummary];
    [(ICQUsageStorageController *)self checkForPendingUpdate];
  }
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)ICQUsageStorageController;
  [(ICQUsageStorageController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"STORAGE" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  [(ICQUsageStorageController *)self setTitle:v4];

  if (CPIsInternalDevice())
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:@"Radar" style:0 target:self action:sel_snapshotAndReportDiskSpace];
    objc_super v6 = [(ICQUsageStorageController *)self navigationItem];
    [v6 setRightBarButtonItem:v5];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICQUsageStorageController;
  [(ICQUsageStorageController *)&v5 viewDidDisappear:a3];
  if ([(ICQUsageStorageController *)self isMovingFromParentViewController])
  {
    objc_super v4 = +[ICQUsageStorageMonitor sharedMonitor];
    [v4 clearUsageDataCache];
  }
}

- (void)reloadSpecifiers
{
  v3 = +[ICQUsageStorageMonitor sharedMonitor];
  [v3 clearUsageDataCache];

  self->_storageLookupInProgress = 0;
  [(NSMutableArray *)self->_deferredUsageApps removeAllObjects];
  photosSpecifier = self->_photosSpecifier;
  self->_photosSpecifier = 0;

  storageAvailableSpecifier = self->_storageAvailableSpecifier;
  self->_storageAvailableSpecifier = 0;

  storageUsedSpecifier = self->_storageUsedSpecifier;
  self->_storageUsedSpecifier = 0;

  self->_updateRequiredBytes = 0;
  updateName = self->_updateName;
  self->_updateName = 0;

  v8.receiver = self;
  v8.super_class = (Class)ICQUsageStorageController;
  [(ICQUsageStorageController *)&v8 reloadSpecifiers];
}

- (void)checkForPendingUpdate
{
  if (self->_openedFromSoftwareUpdate && !self->_SUManager)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v3 = (void *)getSUManagerClientClass_softClass;
    uint64_t v20 = getSUManagerClientClass_softClass;
    if (!getSUManagerClientClass_softClass)
    {
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      id v14 = __getSUManagerClientClass_block_invoke;
      id v15 = &unk_264921E58;
      long long v16 = &v17;
      __getSUManagerClientClass_block_invoke((uint64_t)&v12);
      v3 = (void *)v18[3];
    }
    objc_super v4 = v3;
    _Block_object_dispose(&v17, 8);
    objc_super v5 = (SUManagerClient *)[[v4 alloc] initWithDelegate:0 clientType:1];
    SUManager = self->_SUManager;
    self->_SUManager = v5;
  }
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  objc_super v7 = (void *)getSUScanOptionsClass_softClass;
  uint64_t v20 = getSUScanOptionsClass_softClass;
  if (!getSUScanOptionsClass_softClass)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    id v14 = __getSUScanOptionsClass_block_invoke;
    id v15 = &unk_264921E58;
    long long v16 = &v17;
    __getSUScanOptionsClass_block_invoke((uint64_t)&v12);
    objc_super v7 = (void *)v18[3];
  }
  objc_super v8 = v7;
  _Block_object_dispose(&v17, 8);
  id v9 = objc_alloc_init(v8);
  [v9 setForced:1];
  [v9 setIdentifier:@"com.apple.Preferences.usage_settings"];
  v10 = self->_SUManager;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__ICQUsageStorageController_checkForPendingUpdate__block_invoke;
  v11[3] = &unk_264921F78;
  v11[4] = self;
  [(SUManagerClient *)v10 scanForUpdates:v9 withResult:v11];
}

void __50__ICQUsageStorageController_checkForPendingUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = v3;
  if (v3)
  {
    objc_super v5 = *(void **)(*(void *)(a1 + 32) + 1432);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__ICQUsageStorageController_checkForPendingUpdate__block_invoke_2;
    v8[3] = &unk_264921F50;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v6;
    uint64_t v10 = v7;
    [v5 download:v8];
  }
}

void __50__ICQUsageStorageController_checkForPendingUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 progress];
  int v8 = [v7 isDone];

  uint64_t v20 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  id v9 = (void *)getSUDownloadPolicyFactoryClass_softClass;
  uint64_t v25 = getSUDownloadPolicyFactoryClass_softClass;
  if (!getSUDownloadPolicyFactoryClass_softClass)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __getSUDownloadPolicyFactoryClass_block_invoke;
    v21[3] = &unk_264921E58;
    v21[4] = &v22;
    __getSUDownloadPolicyFactoryClass_block_invoke((uint64_t)v21);
    id v9 = (void *)v23[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v22, 8);
  id v11 = [v10 userDownloadPolicyForDescriptor:*(void *)(a1 + 32) existingPolicy:0];
  [v11 isDownloadableForCurrentNetworkConditions:&v20 cellularFeesApply:0];
  if (v20 == 6
    && ([*(id *)(a1 + 32) humanReadableUpdateName],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    uint64_t v13 = *(void **)(a1 + 32);
    if (v8) {
      uint64_t v14 = [v13 installationSize];
    }
    else {
      uint64_t v14 = [v13 totalRequiredFreeSpace];
    }
    *(void *)(*(void *)(a1 + 40) + 1464) = v14;
    uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "humanReadableUpdateName", v20);
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void **)(v18 + 1440);
    *(void *)(v18 + 1440) = v17;

    [*(id *)(a1 + 40) reloadStorageSummary];
  }
  else
  {
    *(void *)(*(void *)(a1 + 40) + 1464) = 0;
    uint64_t v15 = *(void *)(a1 + 40);
    long long v16 = *(void **)(v15 + 1440);
    *(void *)(v15 + 1440) = 0;
  }
}

- (void)refreshSoftwareUpdateRequiredSpace
{
  id v3 = [(ICQUsageStorageController *)self specifierForID:@"SUMMARY_GROUP"];
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  [(ICQUsageStorageController *)self getGroup:&v20 row:0 ofSpecifier:v3];
  float updateRequiredBytes = (float)self->_updateRequiredBytes;
  id v5 = +[ICQUsageStorageMonitor sharedMonitor];
  [v5 availableSize];
  float v7 = updateRequiredBytes - v6;

  if (v7 <= 0.0)
  {
    [v3 removePropertyForKey:*MEMORY[0x263F600F8]];
    if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_8;
    }
    int v8 = [(ICQUsageStorageController *)self table];
    id v9 = [MEMORY[0x263F088D0] indexSetWithIndex:v20];
    [v8 _reloadSectionHeaderFooters:v9 withRowAnimation:100];
    goto LABEL_6;
  }
  id v10 = NSString;
  id v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"UPDATE_STORAGE_REQUIREMENT_%@" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  uint64_t v13 = [MEMORY[0x263F086F0] stringFromByteCount:(uint64_t)v7 countStyle:2];
  int v8 = objc_msgSend(v10, "stringWithFormat:", v12, v13);

  uint64_t v14 = *MEMORY[0x263F600F8];
  uint64_t v15 = [v3 objectForKeyedSubscript:*MEMORY[0x263F600F8]];
  LOBYTE(v13) = [v15 isEqualToString:v8];

  if ((v13 & 1) == 0)
  {
    [v3 setObject:v8 forKeyedSubscript:v14];
    id v9 = [(ICQUsageStorageController *)self table];
    long long v16 = [MEMORY[0x263F088D0] indexSetWithIndex:v20];
    [v9 _reloadSectionHeaderFooters:v16 withRowAnimation:100];

LABEL_6:
  }

LABEL_8:
  uint64_t v17 = [(PSSpecifier *)self->_storageAvailableSpecifier objectForKeyedSubscript:*MEMORY[0x263F602B0]];
  uint64_t v18 = [v17 detailTextLabel];
  if (v7 > 0.0) {
    [MEMORY[0x263F825C8] systemRedColor];
  }
  else {
  uint64_t v19 = [MEMORY[0x263F825C8] tableCellGrayTextColor];
  }
  [v18 setTextColor:v19];
}

+ (id)systemSizeUsed:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086F0];
  objc_super v4 = +[ICQUsageStorageMonitor sharedMonitor];
  [v4 usedSize];
  float v6 = [v3 stringFromByteCount:(uint64_t)v5 countStyle:2];

  return v6;
}

+ (id)systemSizeAvailable:(id)a3
{
  id v3 = (void *)MEMORY[0x263F086F0];
  objc_super v4 = +[ICQUsageStorageMonitor sharedMonitor];
  [v4 availableSize];
  float v6 = [v3 stringFromByteCount:(uint64_t)v5 countStyle:2];

  return v6;
}

+ (id)storageUsedSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  float v5 = [v4 localizedStringForKey:@"USED" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  float v6 = [v3 preferenceSpecifierNamed:v5 target:a1 set:0 get:sel_systemSizeUsed_ detail:0 cell:4 edit:0];

  return v6;
}

+ (id)storageAvailableSpecifier
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  objc_super v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  float v5 = [v4 localizedStringForKey:@"AVAILABLE" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  float v6 = [v3 preferenceSpecifierNamed:v5 target:a1 set:0 get:sel_systemSizeAvailable_ detail:0 cell:4 edit:0];

  return v6;
}

- (void)reloadStorageSummary
{
  id v3 = +[ICQUsageStorageMonitor sharedMonitor];
  [v3 fetchSystemSizeStrings];

  [(ICQUsageStorageController *)self reloadSpecifier:self->_storageAvailableSpecifier animated:0];
  [(ICQUsageStorageController *)self reloadSpecifier:self->_storageUsedSpecifier animated:0];
  [(ICQUsageStorageController *)self refreshSoftwareUpdateRequiredSpace];
}

- (void)addStorageSpecifiers:(id)a3 completed:(BOOL)a4
{
  BOOL v4 = a4;
  id v22 = a3;
  [(ICQUsageStorageController *)self beginUpdates];
  uint64_t v6 = [(ICQUsageStorageController *)self indexOfSpecifierID:@"SPINNER_CELL"];
  unint64_t v7 = v6;
  if (v4) {
    [(ICQUsageStorageController *)self removeSpecifierID:@"SPINNER_CELL" animated:1];
  }
  else {
    unint64_t v7 = v6 + 1;
  }
  uint64_t v8 = (int)*MEMORY[0x263F5FDB8];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v8)) {
    -[ICQUsageStorageController addStorageSpecifiers:completed:]();
  }
  uint64_t v9 = [v22 count];
  unint64_t v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + v8) count] + v9;
  if (v7 < v10)
  {
    unint64_t v11 = 0;
    do
    {
      if (v11 >= [v22 count]) {
        break;
      }
      if (v7 >= [*(id *)((char *)&self->super.super.super.super.super.isa + v8) count])
      {
        unint64_t v14 = 0;
      }
      else
      {
        uint64_t v12 = [*(id *)((char *)&self->super.super.super.super.super.isa + v8) objectAtIndexedSubscript:v7];
        uint64_t v13 = [v12 objectForKeyedSubscript:kTotalSizeProperty];
        unint64_t v14 = [v13 unsignedIntegerValue];
      }
      uint64_t v15 = [v22 objectAtIndexedSubscript:v11];
      long long v16 = [v15 objectForKeyedSubscript:kTotalSizeProperty];
      unint64_t v17 = [v16 unsignedIntegerValue];

      if (v17 > v14)
      {
        uint64_t v18 = [v22 objectAtIndexedSubscript:v11];
        [(ICQUsageStorageController *)self insertSpecifier:v18 atIndex:v7];

        ++v11;
      }
      ++v7;
    }
    while (v10 != v7);
  }
  [(ICQUsageStorageController *)self endUpdates];
  if (v4)
  {
    uint64_t v19 = [MEMORY[0x263F82438] sharedApplication];
    int v20 = [v19 isRunningTest:@"EnterManageStoragePane"];

    if (v20)
    {
      v21 = [MEMORY[0x263F82438] sharedApplication];
      [v21 finishedTest:@"EnterManageStoragePane"];
    }
  }
}

- (id)stringWithAppSizeForSpecifier:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:kTotalSizeProperty];
  [v3 floatValue];
  float v5 = v4;

  if (v5 <= 0.0)
  {
    unint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v7 localizedStringForKey:@"NO_DATA" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F086F0] stringFromByteCount:(uint64_t)v5 countStyle:2];
  }
  return v6;
}

- (Class)usageDetailControllerForBundleID:(id)a3
{
  v11[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  float v4 = (void *)usageDetailControllerForBundleID__specialDetailControllerMap;
  if (!usageDetailControllerForBundleID__specialDetailControllerMap)
  {
    v10[0] = *MEMORY[0x263F5FF50];
    v11[0] = objc_opt_class();
    v10[1] = *MEMORY[0x263F5FF40];
    v11[1] = objc_opt_class();
    v10[2] = *MEMORY[0x263F5FF48];
    v11[2] = objc_opt_class();
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
    uint64_t v6 = (void *)usageDetailControllerForBundleID__specialDetailControllerMap;
    usageDetailControllerForBundleID__specialDetailControllerMap = v5;

    float v4 = (void *)usageDetailControllerForBundleID__specialDetailControllerMap;
  }
  id v7 = (id)[v4 objectForKeyedSubscript:v3];
  if (!v7) {
    id v7 = (id)objc_opt_class();
  }
  uint64_t v8 = (objc_class *)v7;

  return v8;
}

- (BOOL)storageExpired
{
  if (!self->_storageExpiry) {
    return 0;
  }
  id v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:self->_storageExpiry];
  BOOL v5 = v4 > self->_timeoutLimit;

  return v5;
}

- (void)didUnlock
{
  if ([(ICQUsageStorageController *)self storageExpired])
  {
    id v3 = +[ICQUsageStorageMonitor sharedMonitor];
    [v3 clearUsageDataCache];

    [(ICQUsageStorageController *)self reloadSpecifiers];
  }
}

- (void)prepareForSnapshot
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v3 = [(ICQUsageStorageController *)self indexOfSpecifier:self->_appsStorageGroup];
  [(ICQUsageStorageController *)self getGroup:&v8 row:&v7 ofSpecifierAtIndex:v3];
  double v4 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26DFF2C90 target:0 set:0 get:0 detail:0 cell:15 edit:0];
  [v4 setProperty:@"SPINNER_CELL" forKey:*MEMORY[0x263F60138]];
  BOOL v5 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "subarrayWithRange:", v3, -[ICQUsageStorageController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDD0]), v8));
  [(ICQUsageStorageController *)self removeContiguousSpecifiers:v5 animated:0];

  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", self->_appsStorageGroup, v4, 0);
  [(ICQUsageStorageController *)self insertContiguousSpecifiers:v6 atIndex:v3 animated:0];
}

- (id)_specifierForApp:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 bundleIdentifier];
  uint64_t v6 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v4 name];
    [v4 totalSize];
    *(_DWORD *)buf = 138412802;
    id v22 = v7;
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    __int16 v25 = 2048;
    double v26 = v8;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "Usage item '%@' in bundle %@ has total size %f", buf, 0x20u);
  }
  uint64_t v9 = (void *)MEMORY[0x263F5FC40];
  unint64_t v10 = [v4 name];
  unint64_t v11 = objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, sel_stringWithAppSizeForSpecifier_, -[ICQUsageStorageController usageDetailControllerForBundleID:](self, "usageDetailControllerForBundleID:", v5), 2, 0);

  [v11 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v11 setProperty:v5 forKey:*MEMORY[0x263F60138]];
  [v11 setProperty:v5 forKey:*MEMORY[0x263F60188]];
  uint64_t v12 = [NSNumber numberWithBool:1];
  [v11 setProperty:v12 forKey:*MEMORY[0x263F601A8]];

  uint64_t v13 = [v4 bundleVersion];
  [v11 setProperty:v13 forKey:@"VERSION"];

  if (([v4 isSystemApp] & 1) == 0)
  {
    unint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v15 = [v14 localizedStringForKey:@"APP_SIZE" value:&stru_26DFF2C90 table:@"Usage Statistics"];
    [v11 setProperty:v15 forKey:@"SIZE_TITLE"];

    long long v16 = NSNumber;
    [v4 staticSize];
    unint64_t v17 = objc_msgSend(v16, "numberWithFloat:");
    [v11 setProperty:v17 forKey:@"SIZE_VALUE"];
  }
  [v11 setProperty:v4 forKey:@"USAGE_APP"];
  uint64_t v18 = NSNumber;
  [v4 totalSize];
  uint64_t v19 = objc_msgSend(v18, "numberWithFloat:");
  [v11 setProperty:v19 forKey:kTotalSizeProperty];

  return v11;
}

- (id)_specifierForBundle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 bundleIdentifier];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 usageBundleStorageReporter];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [v4 usageBundleStorageReporter];
    uint64_t v10 = [v9 usageDetailControllerClassForUsageBundleApp:v4];

    if (v10) {
      uint64_t v6 = v10;
    }
  }
  unint64_t v11 = (void *)MEMORY[0x263F5FC40];
  uint64_t v12 = [v4 name];
  uint64_t v13 = [v11 preferenceSpecifierNamed:v12 target:self set:0 get:sel_stringWithAppSizeForSpecifier_ detail:v6 cell:2 edit:0];

  [v13 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v13 setProperty:v5 forKey:*MEMORY[0x263F60138]];
  [v13 setProperty:v5 forKey:*MEMORY[0x263F60188]];
  [v13 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  [v13 setProperty:v4 forKey:@"USAGE_BUNDLE_APP"];
  unint64_t v14 = NSNumber;
  [v4 totalSize];
  uint64_t v15 = objc_msgSend(v14, "numberWithFloat:");
  [v13 setProperty:v15 forKey:kTotalSizeProperty];

  long long v16 = (void *)MEMORY[0x263F5FD00];
  uint64_t v17 = objc_msgSend((id)objc_msgSend(v13, "detailControllerClass"), "mediaGroups");
  [v16 setupSpecifier:v13 forMediaGroups:v17];

  uint64_t v18 = [v4 usageBundleStorageReporter];
  LOBYTE(v17) = objc_opt_respondsToSelector();

  if (v17)
  {
    uint64_t v19 = [v4 usageBundleStorageReporter];
    id v22 = v13;
    [v19 usageBundleApp:v4 willDisplaySpecifier:&v22];
    id v20 = v22;

    uint64_t v13 = v20;
  }

  return v13;
}

- (BOOL)mediaCache:(id)a3 hasGroups:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (void)setDelayUsagePopulation:(BOOL)a3
{
  if (self->_delayUsagePopulation != a3)
  {
    self->_delayUsagePopulation = a3;
    if (!a3) {
      [(ICQUsageStorageController *)self reloadSpecifiers];
    }
  }
}

- (id)specifiers
{
  uint64_t v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 objectForKey:@"kPreferenceTimeoutLimitKey"];
  [v4 doubleValue];
  self->_timeoutLimit = v5;

  BOOL v6 = [(ICQUsageStorageController *)self storageExpired];
  uint64_t v7 = (int *)MEMORY[0x263F5FDB8];
  if (v6)
  {
    uint64_t v8 = (int)*MEMORY[0x263F5FDB8];
    uint64_t v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v8);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = 0;
  }
  uint64_t v10 = +[ICQUsageStorageMonitor sharedMonitor];
  [v10 fetchSystemSizeStrings];

  uint64_t v11 = *v7;
  BOOL v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  if (!v12)
  {
    if (!self->_storageLookupInProgress && !self->_delayUsagePopulation)
    {
      self->_storageLookupInProgress = 1;
      uint64_t v13 = [MEMORY[0x263EFF910] date];
      storageExpiry = self->_storageExpiry;
      self->_storageExpiry = v13;

      long long v15 = +[ICQUsageStorageMonitor sharedMonitor];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __39__ICQUsageStorageController_specifiers__block_invoke;
      v25[3] = &unk_264921FC0;
      v25[4] = self;
      [v15 populateUsageDataWithProgressBlock:v25];

      [(ICQUsageStorageController *)self checkForPendingUpdate];
    }
    long long v16 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SUMMARY_GROUP"];
    long long v17 = [(id)objc_opt_class() storageUsedSpecifier];
    storageUsedSpecifier = self->_storageUsedSpecifier;
    self->_storageUsedSpecifier = v17;

    uint64_t v19 = [(id)objc_opt_class() storageAvailableSpecifier];
    storageAvailableSpecifier = self->_storageAvailableSpecifier;
    self->_storageAvailableSpecifier = v19;

    v21 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26DFF2C90 target:0 set:0 get:0 detail:0 cell:15 edit:0];
    [v21 setProperty:@"SPINNER_CELL" forKey:*MEMORY[0x263F60138]];
    id v22 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v16, self->_storageUsedSpecifier, self->_storageAvailableSpecifier, self->_appsStorageGroup, v21, 0);
    __int16 v23 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = v22;

    BOOL v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  }
  return v12;
}

void __39__ICQUsageStorageController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, unsigned int a5)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v67 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    __39__ICQUsageStorageController_specifiers__block_invoke_cold_1();
  }
  v66 = v9;
  v69 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = [v8 arrayByAddingObjectsFromArray:*(void *)(*(void *)(a1 + 32) + 1424)];

  [*(id *)(*(void *)(a1 + 32) + 1424) removeAllObjects];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v84 objects:v95 count:16];
  id v13 = v67;
  id v68 = v11;
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v85;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v85 != v15) {
          objc_enumerationMutation(v11);
        }
        long long v17 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v18 = [*(id *)(a1 + 32) _specifierForApp:v17];
        uint64_t v19 = objc_msgSend((id)objc_msgSend(v18, "detailControllerClass"), "mediaGroups");
        int v20 = [*(id *)(a1 + 32) mediaCache:v13 hasGroups:v19];
        if ((v20 & 1) != 0 || a5)
        {
          if (((v20 | a5 ^ 1) & 1) == 0)
          {
            __int16 v23 = _ICQGetLogSystem();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v24 = [v17 name];
              __int16 v25 = [v19 componentsJoinedByString:@","];
              *(_DWORD *)buf = 138412546;
              v92 = v24;
              __int16 v93 = 2112;
              v94 = v25;
              _os_log_impl(&dword_22C821000, v23, OS_LOG_TYPE_DEFAULT, "App %@ depends on media groups %@ but they were never loaded", buf, 0x16u);

              id v13 = v67;
            }

            id v11 = v68;
          }
          v21 = v69;
          id v22 = v18;
        }
        else
        {
          v21 = *(void **)(*(void *)(a1 + 32) + 1424);
          id v22 = v17;
        }
        [v21 addObject:v22];
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v84 objects:v95 count:16];
    }
    while (v14);
  }

  double v26 = *(void **)(a1 + 32);
  uint64_t v27 = v26[177];
  if (!v27 && (a5 & 1) == 0)
  {
    uint64_t v28 = +[ICQUsagePhotosController mediaGroups];
    id v29 = v13;
    v30 = (void *)v28;
    char v31 = [v26 mediaCache:v29 hasGroups:v28];

    if ((v31 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!v27)
  {
LABEL_20:
    v32 = (void *)MEMORY[0x263F5FC40];
    v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"PHOTOS" value:&stru_26DFF2C90 table:@"Usage Statistics"];
    id v11 = v68;
    uint64_t v35 = [v32 preferenceSpecifierNamed:v34 target:*(void *)(a1 + 32) set:0 get:sel_stringWithAppSizeForSpecifier_ detail:objc_opt_class() cell:2 edit:0];
    uint64_t v36 = *(void *)(a1 + 32);
    v37 = *(void **)(v36 + 1416);
    *(void *)(v36 + 1416) = v35;

    [*(id *)(*(void *)(a1 + 32) + 1416) setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    v38 = *(void **)(*(void *)(a1 + 32) + 1416);
    v39 = [NSNumber numberWithBool:1];
    [v38 setProperty:v39 forKey:*MEMORY[0x263F601A8]];

    [*(id *)(*(void *)(a1 + 32) + 1416) setProperty:@"com.apple.mobileslideshow" forKey:*MEMORY[0x263F60188]];
    [*(id *)(*(void *)(a1 + 32) + 1416) setIdentifier:@"PHOTOS"];
    uint64_t v40 = *(void *)(*(void *)(a1 + 32) + 1416);
    v41 = +[ICQUsagePhotosController mediaGroups];
    +[ICQUsageDetailController setupSpecifier:v40 forMediaGroups:v41];

    [v69 addObject:*(void *)(*(void *)(a1 + 32) + 1416)];
  }
LABEL_21:
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v42 = v69;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v80 objects:v90 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v81;
    do
    {
      for (uint64_t j = 0; j != v44; ++j)
      {
        if (*(void *)v81 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v80 + 1) + 8 * j);
        v48 = objc_msgSend((id)objc_msgSend(v47, "detailControllerClass"), "mediaGroups");
        +[ICQUsageDetailController setupSpecifier:v47 forMediaGroups:v48];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v80 objects:v90 count:16];
    }
    while (v44);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v49 = v66;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v76 objects:v89 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v77;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v77 != v52) {
          objc_enumerationMutation(v49);
        }
        v54 = [*(id *)(a1 + 32) _specifierForBundle:*(void *)(*((void *)&v76 + 1) + 8 * k)];
        [v42 addObject:v54];
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v76 objects:v89 count:16];
    }
    while (v51);
  }

  [v42 sortUsingComparator:&__block_literal_global_1];
  if (a5) {
    *(unsigned char *)(*(void *)(a1 + 32) + 1400) = 0;
  }
  if ([v42 count]) {
    [*(id *)(a1 + 32) addStorageSpecifiers:v42 completed:a5];
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v55 = v42;
  uint64_t v56 = [v55 countByEnumeratingWithState:&v72 objects:v88 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v73;
    while (2)
    {
      for (uint64_t m = 0; m != v57; ++m)
      {
        if (*(void *)v73 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = [*(id *)(*((void *)&v72 + 1) + 8 * m) identifier];
        v61 = [*(id *)(a1 + 32) specifierIDPendingPush];
        int v62 = [v60 isEqualToString:v61];

        if (v62)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __39__ICQUsageStorageController_specifiers__block_invoke_2;
          block[3] = &unk_264921C80;
          block[4] = *(void *)(a1 + 32);
          dispatch_async(MEMORY[0x263EF83A0], block);
          goto LABEL_49;
        }
      }
      uint64_t v57 = [v55 countByEnumeratingWithState:&v72 objects:v88 count:16];
      if (v57) {
        continue;
      }
      break;
    }
  }
LABEL_49:

  if (a5)
  {
    v63 = [*(id *)(a1 + 32) specifierIDPendingPush];

    if (v63)
    {
      v64 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = [*(id *)(a1 + 32) specifierIDPendingPush];
        *(_DWORD *)buf = 138412290;
        v92 = v65;
        _os_log_impl(&dword_22C821000, v64, OS_LOG_TYPE_DEFAULT, "Did not find a specifier for url path: %@", buf, 0xCu);
      }
      [*(id *)(a1 + 32) clearPendingURL];
    }
  }
}

uint64_t __39__ICQUsageStorageController_specifiers__block_invoke_425(uint64_t a1, void *a2, void *a3)
{
  id v4 = kTotalSizeProperty;
  id v5 = a2;
  BOOL v6 = [a3 objectForKeyedSubscript:v4];
  uint64_t v7 = [v5 objectForKeyedSubscript:kTotalSizeProperty];

  uint64_t v8 = [v6 compare:v7];
  return v8;
}

uint64_t __39__ICQUsageStorageController_specifiers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePendingURL];
}

- (id)controllerForSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICQUsageStorageController;
  id v4 = [(ICQUsageStorageController *)&v6 controllerForSpecifier:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setStorageController:self];
  }
  return v4;
}

- (void)removeStorageSpecifier:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) count] < 3)-[ICQUsageStorageController removeStorageSpecifier:](); {
  [(ICQUsageStorageController *)self removeSpecifier:v4 animated:1];
  }
  [(ICQUsageStorageController *)self reloadStorageSummary];
}

- (void)sizeChangedForSpecifier:(id)a3
{
  id v4 = kTotalSizeProperty;
  id v5 = a3;
  objc_super v6 = [v5 objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 unsignedLongLongValue];

  uint64_t v8 = [(ICQUsageStorageController *)self indexOfSpecifier:self->_appsStorageGroup];
  id v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  uint64_t v10 = [v9 count];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__ICQUsageStorageController_sizeChangedForSpecifier___block_invoke;
  v13[3] = &__block_descriptor_40_e24_i24__0__PSSpecifier_8q16l;
  v13[4] = v7;
  uint64_t v11 = objc_msgSend(v9, "sortedInsertionIndexWithRange:block:", v8, v10 - v8, v13);
  uint64_t v12 = [(ICQUsageStorageController *)self indexOfSpecifier:v5];
  [(ICQUsageStorageController *)self removeSpecifierAtIndex:v12];
  [(ICQUsageStorageController *)self insertSpecifier:v5 atIndex:(void)((__PAIR128__(v11, v12) - (unint64_t)v11) >> 64) animated:0];

  [(ICQUsageStorageController *)self reloadStorageSummary];
}

uint64_t __53__ICQUsageStorageController_sizeChangedForSpecifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:kTotalSizeProperty];
  unint64_t v4 = [v3 unsignedLongLongValue];

  unint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = v4 > v5;
  BOOL v7 = v4 >= v5;
  if (v6) {
    return 2;
  }
  else {
    return v7;
  }
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  return 1;
}

- (void)handleURL:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICQUsageStorageController *)self specifierIDPendingPush];

  if (v5)
  {
    BOOL v6 = [(ICQUsageStorageController *)self specifierIDPendingPush];
    BOOL v7 = [(ICQUsageStorageController *)self specifierForID:v6];

    uint64_t v8 = [(ICQUsageStorageController *)self controllerForSpecifier:v7];
    [v8 setParentController:self];
    id v9 = [(ICQUsageStorageController *)self rootController];
    [v8 setRootController:v9];

    [v8 setSpecifier:v7];
    [(ICQUsageStorageController *)self showController:v8];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICQUsageStorageController;
    [(ICQUsageStorageController *)&v10 handleURL:v4];
  }
}

- (BOOL)openedFromSoftwareUpdate
{
  return self->_openedFromSoftwareUpdate;
}

- (void)setOpenedFromSoftwareUpdate:(BOOL)a3
{
  self->_openedFromSoftwareUpdate = a3;
}

- (BOOL)delayUsagePopulation
{
  return self->_delayUsagePopulation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageAvailableSpecifier, 0);
  objc_storeStrong((id *)&self->_storageUsedSpecifier, 0);
  objc_storeStrong((id *)&self->_updateName, 0);
  objc_storeStrong((id *)&self->_SUManager, 0);
  objc_storeStrong((id *)&self->_deferredUsageApps, 0);
  objc_storeStrong((id *)&self->_photosSpecifier, 0);
  objc_storeStrong((id *)&self->_appsStorageGroup, 0);
  objc_storeStrong((id *)&self->_storageExpiry, 0);
}

void __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Failed to snapshot filesystem metadata with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)addStorageSpecifiers:completed:.cold.1()
{
}

void __39__ICQUsageStorageController_specifiers__block_invoke_cold_1()
{
}

- (void)removeStorageSpecifier:.cold.1()
{
}

@end