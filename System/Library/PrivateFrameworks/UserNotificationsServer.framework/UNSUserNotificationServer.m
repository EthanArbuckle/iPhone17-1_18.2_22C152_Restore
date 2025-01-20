@interface UNSUserNotificationServer
+ (id)sharedInstance;
- (BOOL)isApplicationForeground:(id)a3;
- (BOOL)observeLaunchProhibitedApps;
- (BOOL)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4;
- (BOOL)setBadgeString:(id)a3 forBundleIdentifier:(id)a4;
- (UNSUserNotificationServer)init;
- (id)_loadAllSystemNotificationSourceDescriptions;
- (id)_sourceDescriptionsForApplications:(id)a3;
- (id)allBundleIdentifiersForCategories;
- (id)badgeNumberForBundleIdentifier:(id)a3;
- (id)categoriesForBundleIdentifier:(id)a3;
- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)localActionForAction:(id)a3 notification:(id)a4 bundleID:(id)a5;
- (id)localResponseForAction:(id)a3 notification:(id)a4 bundleID:(id)a5 userText:(id)a6;
- (void)_addObserverForApplicationWorkspaceChanges;
- (void)_addObserverForBackgroundRefreshApplicationChanges;
- (void)_addObserverForContentProtectionChanges;
- (void)_addObserverForDataProviderFactoryChanges;
- (void)_addObserverForLocaleChanges;
- (void)_addObserverForRemoteNotificationServiceChanges;
- (void)_addObserverForSignificantTimeChanges;
- (void)_applicationStateDidRestore;
- (void)_applicationsDidInstall:(id)a3;
- (void)_backgroundRefreshApplicationsDidChange;
- (void)_buildForegroundAction:(id)a3 queue:(id)a4 completionHandler:(id)a5;
- (void)_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4;
- (void)_ensureAttachmentsIntegrity;
- (void)_installedSourceQueue_notificationSourcesDidInstall:(id)a3;
- (void)_installedSourceQueue_notificationSourcesDidUninstall:(id)a3;
- (void)_localeDidChange;
- (void)_migrateAttachments;
- (void)_migrateNotificationRepository;
- (void)_registerLoggers;
- (void)_removeBundleLibrarianMappingsForSourceDescriptions:(id)a3;
- (void)_removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)_removeNotificationSourceDirectories:(id)a3;
- (void)_removePushStore;
- (void)_timeDidChangeSignificantly;
- (void)_triggerLocationArrowForBundleIdentifier:(id)a3;
- (void)_validateNotificationRepository;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationStateDidChange:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3;
- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3;
- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4;
- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)initialSystemNotificationSourcesDidInstall:(id)a3 applicationsDidInstall:(id)a4;
- (void)notificationRepositoryDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3;
- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4;
- (void)performAction:(id)a3 forNotification:(id)a4 inApp:(id)a5 withUserText:(id)a6;
- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4;
- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UNSUserNotificationServer

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  userNotificationServerConnectionListener = self->_userNotificationServerConnectionListener;
  id v7 = a4;
  id v8 = a3;
  [(UNSUserNotificationServerConnectionListener *)userNotificationServerConnectionListener didReceiveDeviceToken:v8 forBundleIdentifier:v7];
  [(UNSUserNotificationServerRemoteNotificationConnectionListener *)self->_userNotificationServerRemoteNotificationConnectionListener didReceiveDeviceToken:v8 forBundleIdentifier:v7];
}

void __33__UNSUserNotificationServer_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [v6 state];

  v9 = [v7 bundle];

  v10 = [v9 identifier];
  [WeakRetained _didChangeProcessState:v8 forBundleIdentifier:v10];
}

- (void)_didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  applicationService = self->_applicationService;
  id v7 = a4;
  id v8 = a3;
  [(UNSApplicationService *)applicationService didChangeProcessState:v8 forBundleIdentifier:v7];
  [(UNSNotificationAuthorizationService *)self->_notificationAuthorizationService didChangeProcessState:v8 forBundleIdentifier:v7];
  [(UNCRemoteNotificationServer *)self->_remoteNotificationService didChangeProcessState:v8 forBundleIdentifier:v7];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

void __43__UNSUserNotificationServer_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(UNSUserNotificationServer);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
}

- (UNSUserNotificationServer)init
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  v135.receiver = self;
  v135.super_class = (Class)UNSUserNotificationServer;
  v2 = [(UNSUserNotificationServer *)&v135 init];
  v3 = v2;
  if (v2)
  {
    [(UNSUserNotificationServer *)v2 _registerLoggers];
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.usernotificationsserver.SourceInstallation", v4);
    installedSourceQueue = v3->_installedSourceQueue;
    v3->_installedSourceQueue = (OS_dispatch_queue *)v5;

    id v7 = (UNSContentProtectionManager *)objc_alloc_init(MEMORY[0x263F84310]);
    contentProtectionManager = v3->_contentProtectionManager;
    v3->_contentProtectionManager = v7;

    v9 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    uint64_t v10 = [v9 objectAtIndex:0];
    libraryDirectory = v3->_libraryDirectory;
    v3->_libraryDirectory = (NSString *)v10;

    uint64_t v12 = [(NSString *)v3->_libraryDirectory stringByAppendingPathComponent:@"UserNotifications"];
    directory = v3->_directory;
    v3->_directory = (NSString *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F84208]) initWithDirectory:v3->_directory];
    librarian = v3->_librarian;
    v3->_librarian = (UNCBundleLibrarian *)v14;

    v16 = (UNCLocalizationService *)objc_alloc_init(MEMORY[0x263F84218]);
    localizationService = v3->_localizationService;
    v3->_localizationService = v16;

    v18 = (_UNNotificationCommunicationContextService *)objc_alloc_init(MEMORY[0x263F843B8]);
    communicationContextService = v3->_communicationContextService;
    v3->_communicationContextService = v18;

    v20 = objc_alloc_init(UNSBadgeService);
    badgeService = v3->_badgeService;
    v3->_badgeService = v20;

    id v22 = objc_alloc(MEMORY[0x263F842A0]);
    v23 = v3->_directory;
    v24 = v3->_librarian;
    v25 = [(UNSContentProtectionManager *)v3->_contentProtectionManager classDStrategy];
    uint64_t v26 = [v22 initWithDirectory:v23 librarian:v24 repositoryProtectionStrategy:v25];
    topicRepository = v3->_topicRepository;
    v3->_topicRepository = (UNCNotificationTopicRepository *)v26;

    if (UNCRemoteServicesNeeded())
    {
      v28 = (UNCNotificationCoreServiceClient *)objc_alloc_init(MEMORY[0x263F84248]);
      coreServiceClient = v3->_coreServiceClient;
      v3->_coreServiceClient = v28;

      [(UNCNotificationCoreServiceClient *)v3->_coreServiceClient setDelegate:v3];
    }
    if (UNCDaemonEnabled())
    {
      uint64_t v30 = [objc_alloc(MEMORY[0x263F84338]) initWithServiceClient:v3->_coreServiceClient];
      categoryRepository = v3->_categoryRepository;
      v3->_categoryRepository = (UNSNotificationCategoryRepository *)v30;

      uint64_t v32 = [objc_alloc(MEMORY[0x263F842B8]) initWithServiceClient:v3->_coreServiceClient];
      notificationRepository = v3->_notificationRepository;
      v3->_notificationRepository = (UNCNotificationRepository *)v32;
    }
    else
    {
      id v34 = objc_alloc(MEMORY[0x263F84318]);
      v35 = v3->_librarian;
      v36 = v3->_directory;
      v37 = [(UNSContentProtectionManager *)v3->_contentProtectionManager classDStrategy];
      uint64_t v38 = [v34 initWithDirectory:v36 librarian:v35 repositoryProtectionStrategy:v37];
      v39 = v3->_categoryRepository;
      v3->_categoryRepository = (UNSNotificationCategoryRepository *)v38;

      id v40 = objc_alloc(MEMORY[0x263F84210]);
      v41 = v3->_directory;
      v42 = v3->_librarian;
      v43 = [(UNSContentProtectionManager *)v3->_contentProtectionManager classCStrategyExcludedFromBackup];
      uint64_t v44 = [v40 initWithDirectory:v41 librarian:v42 repositoryProtectionStrategy:v43 categoryRepository:v3->_categoryRepository badgeService:v3->_badgeService];
      v45 = v3->_notificationRepository;
      v3->_notificationRepository = (UNCNotificationRepository *)v44;

      if (UNCRemoteServicesNeeded())
      {
        uint64_t v46 = *MEMORY[0x263F84340];
        [(UNCNotificationRepository *)v3->_notificationRepository addObserver:v3->_coreServiceClient forBundleIdentifier:*MEMORY[0x263F84340]];
        [(UNSNotificationCategoryRepository *)v3->_categoryRepository addObserver:v3->_coreServiceClient forBundleIdentifier:v46];
      }
    }
    v47 = objc_alloc_init(UNSSummaryServiceAdapter);
    summaryService = v3->_summaryService;
    v3->_summaryService = v47;

    id v49 = objc_alloc(MEMORY[0x263F842A8]);
    v50 = v3->_librarian;
    v51 = v3->_directory;
    v52 = [(UNSContentProtectionManager *)v3->_contentProtectionManager classDStrategy];
    uint64_t v53 = [v49 initWithDirectory:v51 librarian:v50 repositoryProtectionStrategy:v52];
    pendingNotificationRepository = v3->_pendingNotificationRepository;
    v3->_pendingNotificationRepository = (UNCPendingNotificationRepository *)v53;

    uint64_t v55 = [objc_alloc(MEMORY[0x263F842B0]) initWithDirectory:v3->_directory librarian:v3->_librarian];
    pushRegistrationRepository = v3->_pushRegistrationRepository;
    v3->_pushRegistrationRepository = (UNCPushRegistrationRepository *)v55;

    uint64_t v57 = [objc_alloc(MEMORY[0x263F84260]) initWithDirectory:v3->_directory librarian:v3->_librarian];
    notificationScheduleRepository = v3->_notificationScheduleRepository;
    v3->_notificationScheduleRepository = (UNCNotificationScheduleRepository *)v57;

    uint64_t v59 = [objc_alloc(MEMORY[0x263F84200]) initWithDirectory:v3->_directory librarian:v3->_librarian];
    attachmentsRepository = v3->_attachmentsRepository;
    v3->_attachmentsRepository = (UNCAttachmentsRepository *)v59;

    v61 = (UNCLocationMonitor *)objc_alloc_init(MEMORY[0x263F84220]);
    locationMonitor = v3->_locationMonitor;
    v3->_locationMonitor = v61;

    uint64_t v63 = [objc_alloc(MEMORY[0x263F84268]) initWithNotificationRepository:v3->_notificationRepository pendingNotificationRepository:v3->_pendingNotificationRepository notificationScheduleRepository:v3->_notificationScheduleRepository locationMonitor:v3->_locationMonitor];
    notificationSchedulingService = v3->_notificationSchedulingService;
    v3->_notificationSchedulingService = (UNCNotificationSchedulingService *)v63;

    v65 = [[UNSAttachmentsService alloc] initWithAttachmentsRepository:v3->_attachmentsRepository notificationRepository:v3->_notificationRepository notificationSchedulingService:v3->_notificationSchedulingService pendingNotificationRepository:v3->_pendingNotificationRepository];
    attachmentsService = v3->_attachmentsService;
    v3->_attachmentsService = v65;

    v67 = [[UNSApplicationLauncher alloc] initWithLocationMonitor:v3->_locationMonitor];
    applicationLauncher = v3->_applicationLauncher;
    v3->_applicationLauncher = v67;

    v69 = objc_alloc_init(UNSDaemonLauncher);
    daemonLauncher = v3->_daemonLauncher;
    v3->_daemonLauncher = v69;

    v71 = objc_alloc_init(UNSSettingsGateway);
    settingsGateway = v3->_settingsGateway;
    v3->_settingsGateway = v71;

    v73 = [[UNSDefaultDataProviderFactory alloc] initWithApplicationLauncher:v3->_applicationLauncher daemonLauncher:v3->_daemonLauncher categoryRepository:v3->_categoryRepository notificationRepository:v3->_notificationRepository attachmentsService:v3->_attachmentsService topicRepository:v3->_topicRepository localizationService:v3->_localizationService summaryService:v3->_summaryService settingsGateway:v3->_settingsGateway];
    dataProviderFactory = v3->_dataProviderFactory;
    v3->_dataProviderFactory = v73;

    v75 = [[UNSNotificationSettingsService alloc] initWithSettingsGateway:v3->_settingsGateway];
    notificationSettingsService = v3->_notificationSettingsService;
    v3->_notificationSettingsService = v75;

    v77 = [[UNSNotificationAuthorizationService alloc] initWithDataProviderFactory:v3->_dataProviderFactory settingsService:v3->_notificationSettingsService localizationService:v3->_localizationService];
    notificationAuthorizationService = v3->_notificationAuthorizationService;
    v3->_notificationAuthorizationService = v77;

    v79 = [[UNSApplicationService alloc] initWithApplicationLauncher:v3->_applicationLauncher categoryRepository:v3->_categoryRepository localizationService:v3->_localizationService];
    applicationService = v3->_applicationService;
    v3->_applicationService = v79;

    if ((UNCDaemonEnabled() & 1) == 0) {
      [(UNCNotificationRepository *)v3->_notificationRepository setSettingsProvider:v3->_notificationSettingsService];
    }
    id v81 = objc_alloc(MEMORY[0x263F842C0]);
    v82 = v3->_notificationRepository;
    v83 = v3->_attachmentsService;
    v84 = v3->_pushRegistrationRepository;
    v85 = [MEMORY[0x263F29CA0] sharedInstance];
    uint64_t v86 = [v81 initWithNotificationRepository:v82 attachmentsService:v83 pushRegistrationRepository:v84 platform:v85];
    remoteNotificationService = v3->_remoteNotificationService;
    v3->_remoteNotificationService = (UNCRemoteNotificationServer *)v86;

    v88 = [[UNSUserNotificationServerRemoteNotificationConnectionListener alloc] initWithRemoteNotificationService:v3->_remoteNotificationService];
    userNotificationServerRemoteNotificationConnectionListener = v3->_userNotificationServerRemoteNotificationConnectionListener;
    v3->_userNotificationServerRemoteNotificationConnectionListener = v88;

    v90 = [[UNSUserNotificationServerConnectionListener alloc] initWithCategoryRepository:v3->_categoryRepository notificationSchedulingService:v3->_notificationSchedulingService notificationAuthorizationService:v3->_notificationAuthorizationService notificationSettingsService:v3->_notificationSettingsService notificationRepository:v3->_notificationRepository remoteNotificationConnectionListener:v3->_userNotificationServerRemoteNotificationConnectionListener remoteNotificationService:v3->_remoteNotificationService applicationLauncher:v3->_applicationLauncher attachmentsService:v3->_attachmentsService locationMonitor:v3->_locationMonitor topicRepository:v3->_topicRepository localizationService:v3->_localizationService communicationContextService:v3->_communicationContextService];
    userNotificationServerConnectionListener = v3->_userNotificationServerConnectionListener;
    v3->_userNotificationServerConnectionListener = v90;

    v92 = [[UNSUserNotificationServerSettingsConnectionListener alloc] initWithNotificationSettingsService:v3->_notificationSettingsService];
    userNotificationServerSettingsConnectionListener = v3->_userNotificationServerSettingsConnectionListener;
    v3->_userNotificationServerSettingsConnectionListener = v92;

    if (UNCRemoteServicesNeeded())
    {
      uint64_t v94 = [objc_alloc(MEMORY[0x263F84288]) initWithDelegate:v3];
      systemServiceListener = v3->_systemServiceListener;
      v3->_systemServiceListener = (UNCNotificationSystemServiceListener *)v94;

      [(UNCNotificationSystemServiceListener *)v3->_systemServiceListener activate];
    }
    v96 = [MEMORY[0x263EFF9C0] set];
    v97 = [MEMORY[0x263EFF9C0] set];
    [(UNSUserNotificationServer *)v3 _loadAllSystemNotificationSourceDescriptions];
    long long v133 = 0u;
    long long v134 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v98 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v99 = [v98 countByEnumeratingWithState:&v131 objects:v136 count:16];
    if (v99)
    {
      uint64_t v100 = *(void *)v132;
      do
      {
        uint64_t v101 = 0;
        do
        {
          if (*(void *)v132 != v100) {
            objc_enumerationMutation(v98);
          }
          v102 = [*(id *)(*((void *)&v131 + 1) + 8 * v101) bundleIdentifier];
          [v96 addObject:v102];
          [v97 addObject:v102];

          ++v101;
        }
        while (v99 != v101);
        uint64_t v99 = [v98 countByEnumeratingWithState:&v131 objects:v136 count:16];
      }
      while (v99);
    }

    uint64_t v103 = [v96 copy];
    systemSourceBundleIdentifiers = v3->_systemSourceBundleIdentifiers;
    v3->_systemSourceBundleIdentifiers = (NSSet *)v103;

    v105 = v3->_librarian;
    v106 = [(NSString *)v3->_libraryDirectory stringByAppendingPathComponent:@"UserNotificationsServer"];
    [(UNCBundleLibrarian *)v105 migrateLibraryFromDirectory:v106 toDirectory:v3->_directory];

    v107 = [MEMORY[0x263EFF980] array];
    v108 = (void *)MEMORY[0x263F01878];
    v128[0] = MEMORY[0x263EF8330];
    v128[1] = 3221225472;
    v128[2] = __33__UNSUserNotificationServer_init__block_invoke;
    v128[3] = &unk_26462F6F0;
    id v109 = v107;
    id v129 = v109;
    id v110 = v97;
    id v130 = v110;
    objc_msgSend(v108, "unc_enumerateApplicationRecordsEligibleToDeliverNotifications:", v128);
    v111 = v3->_librarian;
    v112 = (void *)[v110 copy];
    [(UNCBundleLibrarian *)v111 bootstrapLibraryForBundleIdentifiers:v112];

    if ((UNCDaemonEnabled() & 1) == 0) {
      [(UNSUserNotificationServer *)v3 _migrateNotificationRepository];
    }
    [(UNSUserNotificationServer *)v3 _migrateAttachments];
    [(UNSUserNotificationServer *)v3 _removePushStore];
    if ((UNCDaemonEnabled() & 1) == 0) {
      [(UNSUserNotificationServer *)v3 _validateNotificationRepository];
    }
    objc_initWeak(&location, v3);
    v113 = (void *)MEMORY[0x263F645C0];
    v125[0] = MEMORY[0x263EF8330];
    v125[1] = 3221225472;
    v125[2] = __33__UNSUserNotificationServer_init__block_invoke_2;
    v125[3] = &unk_26462F740;
    objc_copyWeak(&v126, &location);
    uint64_t v114 = [v113 monitorWithConfiguration:v125];
    processMonitor = v3->_processMonitor;
    v3->_processMonitor = (RBSProcessMonitor *)v114;

    [(UNSUserNotificationServer *)v3 _addObserverForApplicationStateRestore];
    [(UNSUserNotificationServer *)v3 _addObserverForApplicationWorkspaceChanges];
    [(UNSUserNotificationServer *)v3 _addObserverForBackgroundRefreshApplicationChanges];
    [(UNSUserNotificationServer *)v3 _addObserverForContentProtectionChanges];
    [(UNSUserNotificationServer *)v3 _addObserverForDataProviderFactoryChanges];
    [(UNSUserNotificationServer *)v3 _addObserverForLocaleChanges];
    [(UNSUserNotificationServer *)v3 _addObserverForRemoteNotificationServiceChanges];
    [(UNSUserNotificationServer *)v3 _addObserverForSignificantTimeChanges];
    [(UNSUserNotificationServer *)v3 initialSystemNotificationSourcesDidInstall:v98 applicationsDidInstall:v109];
    if ((UNCDaemonEnabled() & 1) == 0) {
      [(UNCNotificationRepository *)v3->_notificationRepository setDelegate:v3];
    }
    v116 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__UNSUserNotificationServer_init__block_invoke_4;
    block[3] = &unk_26462F430;
    v117 = v3;
    v123 = v117;
    id v118 = v110;
    id v124 = v118;
    dispatch_async(v116, block);

    if (-[UNSContentProtectionManager deviceUnlockedSinceBoot](v3->_contentProtectionManager, "deviceUnlockedSinceBoot"))[v117 _ensureAttachmentsIntegrity]; {
    [(UNSUserNotificationServerConnectionListener *)v3->_userNotificationServerConnectionListener resume];
    }
    [(UNSUserNotificationServerRemoteNotificationConnectionListener *)v3->_userNotificationServerRemoteNotificationConnectionListener resume];
    [(UNSUserNotificationServerSettingsConnectionListener *)v3->_userNotificationServerSettingsConnectionListener resume];
    uint64_t v119 = objc_opt_new();
    id v120 = v117[35];
    v117[35] = (id)v119;

    [v117[35] setDelegate:v117];
    UNSExampleUserNotificationCenterRegister();

    objc_destroyWeak(&v126);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __33__UNSUserNotificationServer_init__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  dispatch_queue_t v5 = [v4 compatibilityObject];
  [v3 addObject:v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 bundleIdentifier];

  [v6 addObject:v7];
}

void __33__UNSUserNotificationServer_init__block_invoke_2(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263F645E8] descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&unk_26D512160];
  [v3 setStateDescriptor:v4];
  dispatch_queue_t v5 = [MEMORY[0x263F645D8] predicateMatchingProcessTypeApplication];
  v9[0] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v3 setPredicates:v6];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__UNSUserNotificationServer_init__block_invoke_3;
  v7[3] = &unk_26462F718;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  [v3 setUpdateHandler:v7];
  objc_destroyWeak(&v8);
}

void __33__UNSUserNotificationServer_init__block_invoke_4(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 144) notificationSourcesForBundleIdentifiers:*(void *)(a1 + 40)];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = [v7 sourceSettings];
        v9 = [v8 notificationSettings];
        if ([v9 hasEnabledSettings])
        {
          uint64_t v10 = [v7 sourceIdentifier];
          [*(id *)(a1 + 32) didChangeNotificationSettings:v9 forBundleIdentifier:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  [*(id *)(*(void *)(a1 + 32) + 168) didCompleteInitialization];
}

- (id)_loadAllSystemNotificationSourceDescriptions
{
  v2 = [MEMORY[0x263F84278] systemSourceDirectoryURLs];
  uint64_t v3 = objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_57);
  uint64_t v4 = objc_msgSend(v3, "bs_flatten");
  uint64_t v5 = objc_msgSend(v4, "bs_filter:", &__block_literal_global_61);
  id v6 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_63);

  return v6;
}

id __73__UNSUserNotificationServer__loadAllSystemNotificationSourceDescriptions__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08850];
  id v3 = a2;
  uint64_t v4 = [v2 defaultManager];
  uint64_t v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:1 error:0];

  return v5;
}

uint64_t __73__UNSUserNotificationServer__loadAllSystemNotificationSourceDescriptions__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 pathExtension];
  id v3 = [MEMORY[0x263F84278] systemSourcePathExtension];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __73__UNSUserNotificationServer__loadAllSystemNotificationSourceDescriptions__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x263F84278] systemSourceDescriptionWithBundleURL:a2];
}

- (void)initialSystemNotificationSourcesDidInstall:(id)a3 applicationsDidInstall:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  installedSourceQueue = self->_installedSourceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__UNSUserNotificationServer_initialSystemNotificationSourcesDidInstall_applicationsDidInstall___block_invoke;
  block[3] = &unk_26462F678;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(installedSourceQueue, block);
}

void __95__UNSUserNotificationServer_initialSystemNotificationSourcesDidInstall_applicationsDidInstall___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _sourceDescriptionsForApplications:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 48) arrayByAddingObjectsFromArray:v4];
  objc_msgSend(v2, "_installedSourceQueue_notificationSourcesDidInstall:", v3);
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4 = a3;
  installedSourceQueue = self->_installedSourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__UNSUserNotificationServer_applicationInstallsDidChange___block_invoke;
  v7[3] = &unk_26462F430;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(installedSourceQueue, v7);
}

void __58__UNSUserNotificationServer_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "correspondingApplicationRecord", (void)v11);
        id v10 = v9;
        if (v9 && [v9 isWebApp]) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  if ([v2 count]) {
    [*(id *)(a1 + 40) _applicationsDidInstall:v2];
  }
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  installedSourceQueue = self->_installedSourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__UNSUserNotificationServer_applicationsDidInstall___block_invoke;
  v7[3] = &unk_26462F430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(installedSourceQueue, v7);
}

uint64_t __52__UNSUserNotificationServer_applicationsDidInstall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationsDidInstall:*(void *)(a1 + 40)];
}

- (void)applicationStateDidChange:(id)a3
{
  id v4 = a3;
  installedSourceQueue = self->_installedSourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__UNSUserNotificationServer_applicationStateDidChange___block_invoke;
  v7[3] = &unk_26462F430;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(installedSourceQueue, v7);
}

uint64_t __55__UNSUserNotificationServer_applicationStateDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationsDidInstall:*(void *)(a1 + 40)];
}

- (BOOL)observeLaunchProhibitedApps
{
  return 1;
}

- (void)_applicationsDidInstall:(id)a3
{
  id v4 = [(UNSUserNotificationServer *)self _sourceDescriptionsForApplications:a3];
  [(UNSUserNotificationServer *)self _installedSourceQueue_notificationSourcesDidInstall:v4];
}

- (id)_sourceDescriptionsForApplications:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__UNSUserNotificationServer__sourceDescriptionsForApplications___block_invoke;
  v5[3] = &unk_26462F7A8;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "bs_mapNoNulls:", v5);
  return v3;
}

id __64__UNSUserNotificationServer__sourceDescriptionsForApplications___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = (void *)MEMORY[0x223CA06B0]();
  id v6 = [v4 correspondingApplicationRecord];
  int v7 = objc_msgSend(v6, "unc_isEligibleToDeliverNotifications");

  if (v7)
  {
    id v8 = [MEMORY[0x263F84278] applicationSourceDescriptionWithApplication:v4];
    char v9 = [v8 useDefaultDataProvider];
    if ((v9 & 1) == 0)
    {
      id v2 = [v8 pushEnvironment];
      if (!v2) {
        goto LABEL_7;
      }
    }
    id v10 = *(void **)(*(void *)(a1 + 32) + 240);
    long long v11 = [v8 bundleIdentifier];
    char v12 = [v10 containsObject:v11];

    if ((v9 & 1) == 0) {
    if ((v12 & 1) == 0)
    }
      id v13 = v8;
    else {
LABEL_7:
    }
      id v13 = 0;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  installedSourceQueue = self->_installedSourceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__UNSUserNotificationServer_applicationsDidUninstall___block_invoke;
  v7[3] = &unk_26462F430;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(installedSourceQueue, v7);
}

void __54__UNSUserNotificationServer_applicationsDidUninstall___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__UNSUserNotificationServer_applicationsDidUninstall___block_invoke_2;
  v4[3] = &unk_26462F7A8;
  v4[4] = *(void *)(a1 + 40);
  id v3 = objc_msgSend(v2, "bs_mapNoNulls:", v4);
  objc_msgSend(*(id *)(a1 + 40), "_installedSourceQueue_notificationSourcesDidUninstall:", v3);
}

id __54__UNSUserNotificationServer_applicationsDidUninstall___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x263F84278] applicationSourceDescriptionWithApplication:a2];
  char v5 = [v4 useDefaultDataProvider];
  if ((v5 & 1) == 0)
  {
    id v2 = [v4 pushEnvironment];
    if (!v2) {
      goto LABEL_6;
    }
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 240);
  int v7 = [v4 bundleIdentifier];
  char v8 = [v6 containsObject:v7];

  if ((v5 & 1) == 0) {
  if ((v8 & 1) == 0)
  }
    id v9 = v4;
  else {
LABEL_6:
  }
    id v9 = 0;

  return v9;
}

- (void)didChangeNotificationSettings:(id)a3 forBundleIdentifier:(id)a4
{
  notificationSchedulingService = self->_notificationSchedulingService;
  id v7 = a4;
  id v8 = a3;
  [(UNCNotificationSchedulingService *)notificationSchedulingService didChangeNotificationSettings:v8 forBundleIdentifier:v7];
  [(UNCRemoteNotificationServer *)self->_remoteNotificationService didChangeNotificationSettings:v8 forBundleIdentifier:v7];
}

- (BOOL)isApplicationForeground:(id)a3
{
  return [(UNSApplicationService *)self->_applicationService isApplicationForeground:a3];
}

- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  BOOL v3 = a3;
  -[UNCNotificationRepository contentProtectionStateChangedForFirstUnlock:](self->_notificationRepository, "contentProtectionStateChangedForFirstUnlock:");
  [(UNCPendingNotificationRepository *)self->_pendingNotificationRepository contentProtectionStateChangedForFirstUnlock:v3];
  [(UNSNotificationCategoryRepository *)self->_categoryRepository contentProtectionStateChangedForFirstUnlock:v3];
  [(UNCNotificationTopicRepository *)self->_topicRepository contentProtectionStateChangedForFirstUnlock:v3];
  attachmentsService = self->_attachmentsService;
  [(UNSAttachmentsService *)attachmentsService contentProtectionStateChangedForFirstUnlock:v3];
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  return [(UNSBadgeService *)self->_badgeService badgeNumberForBundleIdentifier:a3];
}

- (BOOL)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4
{
  return [(UNSBadgeService *)self->_badgeService setBadgeValue:a3 forBundleIdentifier:a4];
}

- (BOOL)setBadgeString:(id)a3 forBundleIdentifier:(id)a4
{
  return [(UNSBadgeService *)self->_badgeService setBadgeValue:a3 forBundleIdentifier:a4];
}

- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UNCNotificationRepository *)self->_notificationRepository notifyDidPerformUpdates:v7 forBundleIdentifier:v6];
  }
}

- (void)notificationRepositoryDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UNCNotificationRepository *)self->_notificationRepository notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier:v4];
  }
}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UNSNotificationCategoryRepository *)self->_categoryRepository notifyDidChangeCategoriesForBundleIdentifier:v4];
  }
}

- (void)_removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  notificationRepository = self->_notificationRepository;
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  id v8 = [v6 setWithArray:a3];
  [(UNCNotificationRepository *)notificationRepository removeNotificationRecordsForIdentifiers:v8 bundleIdentifier:v7];
}

- (id)allBundleIdentifiersForCategories
{
  return (id)[(UNSNotificationCategoryRepository *)self->_categoryRepository allBundleIdentifiers];
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  return (id)[(UNSNotificationCategoryRepository *)self->_categoryRepository categoriesForBundleIdentifier:a3];
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return (id)[(UNSNotificationCategoryRepository *)self->_categoryRepository categoryWithIdentifier:a3 bundleIdentifier:a4];
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void)_buildForegroundAction:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  UNCDecodeNotificationActionSelector();
}

void __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v15)
  {
    uint64_t v16 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_2;
    block[3] = &unk_26462F480;
    id v43 = *(id *)(a1 + 48);
    id v42 = v15;
    dispatch_async(v16, block);

    v17 = v43;
  }
  else
  {
    v18 = (os_log_t *)MEMORY[0x263F1DFE8];
    v19 = *MEMORY[0x263F1DFE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v45 = v11;
      __int16 v46 = 2112;
      id v47 = v13;
      __int16 v48 = 2112;
      id v49 = v12;
      __int16 v50 = 2112;
      id v51 = v14;
      _os_log_impl(&dword_22289A000, v19, OS_LOG_TYPE_DEFAULT, "bundleID: %@ performAction: %@ forNotification: %@ withUserText: %@", buf, 0x2Au);
    }
    v17 = [*(id *)(a1 + 40) localResponseForAction:v13 notification:v12 bundleID:v11 userText:v14];
    if (v17)
    {
      int v20 = [v13 isEqual:*MEMORY[0x263F1E0C8]];
      v33 = [*(id *)(a1 + 40) localActionForAction:v13 notification:v12 bundleID:v11];
      if (([v33 options] & 4) != 0 || v20)
      {
        v25 = *v18;
        if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v45 = v13;
          __int16 v46 = 2112;
          id v47 = v12;
          __int16 v48 = 2112;
          id v49 = v14;
          _os_log_impl(&dword_22289A000, v25, OS_LOG_TYPE_DEFAULT, "FOREGROUND sendAction: %@ forNotification: %@ withUserText: %@", buf, 0x20u);
        }
        uint64_t v26 = [v17 notification];
        v27 = [v26 request];
        v28 = [v27 content];
        uint64_t v32 = [v28 launchImageName];

        uint64_t v29 = *(void *)(a1 + 32);
        uint64_t v30 = *(void **)(*(void *)(a1 + 40) + 16);
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_68;
        v36[3] = &unk_26462F7D0;
        v31 = *(void **)(a1 + 48);
        id v22 = (void *)v32;
        id v38 = v31;
        id v37 = v11;
        [v30 foregroundLaunchOptionsForApplication:v37 withResponse:v17 launchImageName:v32 origin:0 queue:v29 completionHandler:v36];
      }
      else
      {
        v21 = *(NSObject **)(a1 + 32);
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_2_70;
        v34[3] = &unk_26462F588;
        id v35 = *(id *)(a1 + 48);
        dispatch_async(v21, v34);
        id v22 = v35;
      }

      v24 = v33;
    }
    else
    {
      if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR)) {
        __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_cold_1();
      }
      v23 = *(NSObject **)(a1 + 32);
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_66;
      v39[3] = &unk_26462F588;
      id v40 = *(id *)(a1 + 48);
      dispatch_async(v23, v39);
      v24 = v40;
    }
  }
}

uint64_t __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_66(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *(void *)(a1 + 40);
  if (a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v4, a3);
}

void __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_2_70(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performAction:(id)a3 forNotification:(id)a4 inApp:(id)a5 withUserText:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (os_log_t *)MEMORY[0x263F1DFE8];
  id v15 = *MEMORY[0x263F1DFE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    __int16 v44 = 2112;
    id v45 = v13;
    _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "bundleID: %@ performAction: %@ forNotification: %@ withUserText: %@", buf, 0x2Au);
  }
  uint64_t v16 = [(UNSUserNotificationServer *)self localResponseForAction:v10 notification:v11 bundleID:v12 userText:v13];
  if (v16)
  {
    v17 = [(UNSUserNotificationServer *)self localActionForAction:v10 notification:v11 bundleID:v12];
    char v18 = [v17 options];
    v19 = *v14;
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if ((v18 & 4) != 0)
    {
      v27 = v17;
      if (v20)
      {
        *(_DWORD *)buf = 138412802;
        id v39 = v10;
        __int16 v40 = 2112;
        id v41 = v11;
        __int16 v42 = 2112;
        id v43 = v13;
        _os_log_impl(&dword_22289A000, v19, OS_LOG_TYPE_DEFAULT, "FOREGROUND sendAction: %@ forNotification: %@ withUserText: %@", buf, 0x20u);
      }
      v23 = [v16 notification];
      v24 = [v23 request];
      v25 = [v24 content];
      id v22 = [v25 launchImageName];

      applicationLauncher = self->_applicationLauncher;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke;
      v34[3] = &unk_26462F820;
      id v35 = v10;
      id v36 = v11;
      id v37 = v13;
      [(UNSApplicationLauncher *)applicationLauncher foregroundLaunchApplication:v12 withResponse:v16 launchImageName:v22 origin:0 endpoint:0 completionHandler:v34];

      v17 = v27;
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412802;
        id v39 = v10;
        __int16 v40 = 2112;
        id v41 = v11;
        __int16 v42 = 2112;
        id v43 = v13;
        _os_log_impl(&dword_22289A000, v19, OS_LOG_TYPE_DEFAULT, "BACKGROUND APPLICATION sendAction: %@ forNotification: %@ withUserText: %@", buf, 0x20u);
      }
      v21 = self->_applicationLauncher;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_73;
      v28[3] = &unk_26462F848;
      id v29 = v10;
      id v30 = v11;
      id v31 = v13;
      uint64_t v32 = self;
      id v33 = v12;
      [(UNSApplicationLauncher *)v21 backgroundLaunchApplication:v33 withResponse:v16 completionHandler:v28];

      id v22 = v29;
    }
  }
  else if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
  {
    __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_cold_1();
  }
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke(void *a1, char a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F1DFE8];
  uint64_t v4 = *MEMORY[0x263F1DFE8];
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      uint64_t v7 = a1[6];
      int v8 = 138412802;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "FOREGROUND succeeded sendAction: %@ forNotification: %@ withUserText: %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_cold_1();
  }
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_73(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F1DFE8];
  uint64_t v4 = *MEMORY[0x263F1DFE8];
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_22289A000, v3, OS_LOG_TYPE_DEFAULT, "BACKGROUND APPLICATION succeeded sendAction: %@ forNotification: %@ withUserText: %@", buf, 0x20u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_74;
    block[3] = &unk_26462F678;
    void block[4] = *(void *)(a1 + 56);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 64);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_73_cold_1();
  }
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_74(void *a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)a1[4];
  v4[0] = a1[5];
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [v2 _removeNotificationRecordsForIdentifiers:v3 bundleIdentifier:a1[6]];
}

- (id)localActionForAction:(id)a3 notification:(id)a4 bundleID:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(UNSDefaultDataProviderFactory *)self->_dataProviderFactory bundleIdentifierToDataProvider];
  uint64_t v12 = [v11 objectForKeyedSubscript:v10];

  if (v12)
  {
    __int16 v13 = [(UNCNotificationRepository *)self->_notificationRepository notificationRecordForIdentifier:v9 bundleIdentifier:v10];
    uint64_t v14 = v13;
    if (v13)
    {
      __int16 v15 = [v13 categoryIdentifier];
      uint64_t v16 = [(UNSNotificationCategoryRepository *)self->_categoryRepository categoryWithIdentifier:v15 bundleIdentifier:v10];
      if (v16)
      {
        id v17 = objc_alloc(MEMORY[0x263F84240]);
        char v18 = [v12 bundle];
        v19 = (void *)[v17 initWithBundle:v18];

        if (v19)
        {
          BOOL v20 = [v19 notificationCategoryForNotificationCategoryRecord:v16];
          id v38 = v20;
          if (v20)
          {
            id v34 = v19;
            id v35 = v16;
            id v36 = v15;
            id v37 = v9;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            v21 = [v20 actions];
            uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v40;
              id v33 = v14;
              while (2)
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v40 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                  v27 = objc_msgSend(v26, "identifier", v33);
                  char v28 = [v27 isEqual:v8];

                  if (v28)
                  {
                    id v29 = v26;

                    id v9 = v37;
                    uint64_t v14 = v33;
                    goto LABEL_30;
                  }
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v43 count:16];
                uint64_t v14 = v33;
                if (v23) {
                  continue;
                }
                break;
              }
            }

            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR)) {
              -[UNSUserNotificationServer localActionForAction:notification:bundleID:].cold.4();
            }
            id v29 = 0;
            id v9 = v37;
LABEL_30:
            uint64_t v16 = v35;
            __int16 v15 = v36;
            v19 = v34;
          }
          else
          {
            id v31 = *MEMORY[0x263F1DFE8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v45 = v10;
              __int16 v46 = 2112;
              id v47 = v12;
              __int16 v48 = 2112;
              id v49 = v16;
              _os_log_error_impl(&dword_22289A000, v31, OS_LOG_TYPE_ERROR, "bundleID: %@ NO CATEGORY found provider: %@, categoryRecord: %@", buf, 0x20u);
            }
            id v29 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR)) {
            -[UNSUserNotificationServer localActionForAction:notification:bundleID:]();
          }
          id v29 = 0;
          v19 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR)) {
          -[UNSUserNotificationServer localActionForAction:notification:bundleID:]();
        }
        id v29 = 0;
      }
    }
    else
    {
      id v30 = *MEMORY[0x263F1DFE8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v45 = v10;
        __int16 v46 = 2112;
        id v47 = v12;
        __int16 v48 = 2112;
        id v49 = v9;
        _os_log_error_impl(&dword_22289A000, v30, OS_LOG_TYPE_ERROR, "bundleID: %@ NO NOTIFICATION RECORD found provider: %@, notification: %@", buf, 0x20u);
      }
      id v29 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR)) {
      -[UNSUserNotificationServer localActionForAction:notification:bundleID:]();
    }
    id v29 = 0;
  }

  return v29;
}

- (id)localResponseForAction:(id)a3 notification:(id)a4 bundleID:(id)a5 userText:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(UNSDefaultDataProviderFactory *)self->_dataProviderFactory bundleIdentifierToDataProvider];
  __int16 v15 = [v14 objectForKeyedSubscript:v12];

  if (v15)
  {
    uint64_t v16 = [(UNCNotificationRepository *)self->_notificationRepository notificationRecordForIdentifier:v11 bundleIdentifier:v12];
    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x263F84258]);
      char v18 = [v15 bundle];
      v19 = (void *)[v17 initWithBundle:v18 categoryRepository:self->_categoryRepository];

      if (v19)
      {
        BOOL v20 = [v19 notificationForNotificationRecord:v16];
        if (v20)
        {
          if (v13) {
            [MEMORY[0x263F1DFA0] responseWithNotification:v20 actionIdentifier:v10 userText:v13];
          }
          else {
          v21 = [MEMORY[0x263F1DF50] responseWithNotification:v20 actionIdentifier:v10];
          }
        }
        else
        {
          uint64_t v23 = *MEMORY[0x263F1DFE8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR))
          {
            int v25 = 138412802;
            id v26 = v12;
            __int16 v27 = 2112;
            char v28 = v19;
            __int16 v29 = 2112;
            id v30 = v16;
            _os_log_error_impl(&dword_22289A000, v23, OS_LOG_TYPE_ERROR, "bundleID: %@ NO NOTIFICATION found mapper: %@, record: %@", (uint8_t *)&v25, 0x20u);
          }
          v21 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR)) {
          -[UNSUserNotificationServer localResponseForAction:notification:bundleID:userText:]();
        }
        v21 = 0;
      }
    }
    else
    {
      uint64_t v22 = *MEMORY[0x263F1DFE8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR))
      {
        int v25 = 138412802;
        id v26 = v12;
        __int16 v27 = 2112;
        char v28 = v15;
        __int16 v29 = 2112;
        id v30 = v11;
        _os_log_error_impl(&dword_22289A000, v22, OS_LOG_TYPE_ERROR, "bundleID: %@ NO NOTIFICATION RECORD found provider: %@, notification: %@", (uint8_t *)&v25, 0x20u);
      }
      v21 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFE8], OS_LOG_TYPE_ERROR)) {
      -[UNSUserNotificationServer localActionForAction:notification:bundleID:]();
    }
    v21 = 0;
  }

  return v21;
}

- (void)_migrateNotificationRepository
{
}

- (void)_validateNotificationRepository
{
}

- (void)_migrateAttachments
{
}

- (void)_removePushStore
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = [(NSString *)self->_libraryDirectory stringByAppendingPathComponent:@"SpringBoard"];
  BOOL v3 = [v2 stringByAppendingPathComponent:@"PushStore"];

  uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
  if ([v4 fileExistsAtPath:v3])
  {
    id v8 = 0;
    char v5 = [v4 removeItemAtPath:v3 error:&v8];
    id v6 = v8;
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = *MEMORY[0x263F1E048];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v10 = v6;
        _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "Removing PushStore failed: %{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)_addObserverForLocaleChanges
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__localeDidChange name:*MEMORY[0x263EFF458] object:0];
}

- (void)_localeDidChange
{
}

- (void)_addObserverForBackgroundRefreshApplicationChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_UNSBackgroundRefreshApplicationsDidChange, @"kKeepAppsUpToDateEnabledChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_applicationStateDidRestore
{
}

- (void)_backgroundRefreshApplicationsDidChange
{
}

- (void)_addObserverForApplicationWorkspaceChanges
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  [v3 addObserver:self];
}

- (void)_addObserverForContentProtectionChanges
{
}

- (void)_addObserverForDataProviderFactoryChanges
{
}

- (void)_addObserverForRemoteNotificationServiceChanges
{
}

- (void)_addObserverForSignificantTimeChanges
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_UNSTimeDidChangeSignificantly, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_ensureAttachmentsIntegrity
{
}

void __56__UNSUserNotificationServer__ensureAttachmentsIntegrity__block_invoke()
{
  v0 = *MEMORY[0x263F1DFF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22289A000, v0, OS_LOG_TYPE_DEFAULT, "Attachment integrity check complete", v1, 2u);
  }
}

- (void)_timeDidChangeSignificantly
{
}

- (void)_registerLoggers
{
}

- (void)_triggerLocationArrowForBundleIdentifier:(id)a3
{
}

- (void)_installedSourceQueue_notificationSourcesDidInstall:(id)a3
{
  installedSourceQueue = self->_installedSourceQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(installedSourceQueue);
  [(UNCLocalizationService *)self->_localizationService notificationSourcesDidInstall:v5];
  [(UNSDefaultDataProviderFactory *)self->_dataProviderFactory notificationSourcesDidInstall:v5];
  [(UNCNotificationRepository *)self->_notificationRepository notificationSourcesDidInstall:v5];
  [(UNCRemoteNotificationServer *)self->_remoteNotificationService notificationSourcesDidInstall:v5];
}

- (void)_installedSourceQueue_notificationSourcesDidUninstall:(id)a3
{
  installedSourceQueue = self->_installedSourceQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(installedSourceQueue);
  [(UNSDefaultDataProviderFactory *)self->_dataProviderFactory notificationSourcesDidUninstall:v5];
  [(UNSAttachmentsService *)self->_attachmentsService notificationSourcesDidUninstall:v5];
  [(UNCNotificationRepository *)self->_notificationRepository notificationSourcesDidInstall:v5];
  [(UNCNotificationSchedulingService *)self->_notificationSchedulingService notificationSourcesDidUninstall:v5];
  [(UNCRemoteNotificationServer *)self->_remoteNotificationService notificationSourcesDidUninstall:v5];
  [(UNCNotificationScheduleRepository *)self->_notificationScheduleRepository notificationSourcesDidUninstall:v5];
  [(UNCPendingNotificationRepository *)self->_pendingNotificationRepository notificationSourcesDidUninstall:v5];
  [(UNSNotificationCategoryRepository *)self->_categoryRepository notificationSourcesDidUninstall:v5];
  [(UNCNotificationTopicRepository *)self->_topicRepository notificationSourcesDidUninstall:v5];
  [(UNCLocalizationService *)self->_localizationService notificationSourcesDidUninstall:v5];
  [(UNSUserNotificationServer *)self _removeNotificationSourceDirectories:v5];
  [(UNSUserNotificationServer *)self _removeBundleLibrarianMappingsForSourceDescriptions:v5];
}

- (void)_removeNotificationSourceDirectories:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263F08850] defaultManager];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138543618;
    long long v17 = v7;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * v10), "bundleIdentifier", v17);
        id v12 = [(UNCBundleLibrarian *)self->_librarian uniqueIdentifierForBundleIdentifier:v11];
        id v13 = [(NSString *)self->_directory stringByAppendingPathComponent:v12];
        if ([v5 fileExistsAtPath:v13])
        {
          id v19 = 0;
          char v14 = [v5 removeItemAtPath:v13 error:&v19];
          id v15 = v19;
          if ((v14 & 1) == 0)
          {
            uint64_t v16 = *MEMORY[0x263F1E048];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              int v25 = v13;
              __int16 v26 = 2114;
              id v27 = v15;
              _os_log_impl(&dword_22289A000, v16, OS_LOG_TYPE_DEFAULT, "Removing bundle directory '%{public}@' failed: %{public}@", buf, 0x16u);
            }
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)_removeBundleLibrarianMappingsForSourceDescriptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) bundleIdentifier];
        [(UNCBundleLibrarian *)self->_librarian removeMappingForBundleIdentifier:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverActionHandler, 0);
  objc_storeStrong((id *)&self->_installedSourceQueue, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_libraryDirectory, 0);
  objc_storeStrong((id *)&self->_systemSourceBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_summaryService, 0);
  objc_storeStrong((id *)&self->_coreServiceClient, 0);
  objc_storeStrong((id *)&self->_daemonLauncher, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_topicRepository, 0);
  objc_storeStrong((id *)&self->_notificationScheduleRepository, 0);
  objc_storeStrong((id *)&self->_remoteNotificationService, 0);
  objc_storeStrong((id *)&self->_pendingNotificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationSettingsService, 0);
  objc_storeStrong((id *)&self->_notificationAuthorizationService, 0);
  objc_storeStrong((id *)&self->_notificationSchedulingService, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_systemServiceListener, 0);
  objc_storeStrong((id *)&self->_userNotificationServerRemoteNotificationConnectionListener, 0);
  objc_storeStrong((id *)&self->_userNotificationServerSettingsConnectionListener, 0);
  objc_storeStrong((id *)&self->_userNotificationServerConnectionListener, 0);
  objc_storeStrong((id *)&self->_badgeService, 0);
  objc_storeStrong((id *)&self->_communicationContextService, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);
  objc_storeStrong((id *)&self->_contentProtectionManager, 0);
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_attachmentsRepository, 0);
  objc_storeStrong((id *)&self->_applicationService, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
  objc_storeStrong((id *)&self->_pushRegistrationRepository, 0);
}

void __76__UNSUserNotificationServer__buildForegroundAction_queue_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "bundleID: %@ NO LOCAL RESPONSE FOUND", v2, v3, v4, v5, v6);
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22289A000, v0, OS_LOG_TYPE_ERROR, "FOREGROUND FAILED sendAction: %@ forNotification: %@ withUserText: %@", v1, 0x20u);
}

void __78__UNSUserNotificationServer_performAction_forNotification_inApp_withUserText___block_invoke_73_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22289A000, v0, OS_LOG_TYPE_ERROR, "BACKGROUND APPLICATION FAILED sendAction: %@ forNotification: %@ withUserText: %@", v1, 0x20u);
}

- (void)localActionForAction:notification:bundleID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "bundleID: %@ NO PROVIDER", v2, v3, v4, v5, v6);
}

- (void)localActionForAction:notification:bundleID:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "bundleID: %@ NO CATEGORY RECORD found for action %@");
}

- (void)localActionForAction:notification:bundleID:.cold.3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "bundleID: %@ NO CATEGORY MAPPER found provider: %@");
}

- (void)localActionForAction:notification:bundleID:.cold.4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "bundleID: %@ NO ACTION found provider: %@");
}

- (void)localResponseForAction:notification:bundleID:userText:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "bundleID: %@ NO NOTIFICATION MAPPER found provider: %@");
}

@end