@interface ICCloudClient
- (BOOL)_isAuthenticated;
- (BOOL)canShowCloudDownloadButtons;
- (BOOL)canShowCloudMusic;
- (BOOL)canShowCloudVideo;
- (BOOL)createMusicNotificationFromAMSDialogRequest:(id)a3 error:(id *)a4;
- (BOOL)hasProperNetworkConditionsToPlayMedia;
- (BOOL)hasProperNetworkConditionsToShowCloudMedia;
- (BOOL)hasSetPreferenceForAutomaticDownloads;
- (BOOL)initialLibrarySyncsComplete;
- (BOOL)isActive;
- (BOOL)isAutomaticDownloadsEnabledForMediaKindMusic;
- (BOOL)isCellularDataRestricted;
- (BOOL)isCellularDataRestrictedForMusic;
- (BOOL)isCellularDataRestrictedForStoreApps;
- (BOOL)isCellularDataRestrictedForVideos;
- (BOOL)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3;
- (BOOL)musicPurchasesDisabledForJaliscoLibrary;
- (BOOL)serverIsSetup;
- (BOOL)shouldProhibitActionsForCurrentNetworkConditions;
- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions;
- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions;
- (ICCloudBadgingService)badgingService;
- (ICCloudClient)init;
- (ICCloudClient)initWithConfiguration:(id)a3;
- (ICCloudClient)initWithUserIdentity:(id)a3;
- (ICCloudClientAvailabilityService)availabilityService;
- (ICCloudClientCloudService)cloudService;
- (ICCloudServerListenerEndpointProvider)listenerEndpointProvider;
- (ICConnectionConfiguration)configuration;
- (NSMutableArray)pendingServerSetupCompleteBlocks;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)serialAccessQueue;
- (OS_dispatch_queue)serverSetupBlockQueue;
- (id)updateJaliscoInProgressChangedHandler;
- (id)updateSagaInProgressChangedHandler;
- (int64_t)preferredVideoQuality;
- (void)_enableCloudLibraryWithPolicy:(int64_t)a3 startinitialImport:(BOOL)a4 isExplicitUserAction:(BOOL)a5 completionHandler:(id)a6;
- (void)_serverJaliscoUpdateInProgressDidChange;
- (void)_serverSagaUpdateInProgressDidChange;
- (void)_serverSetupDidComplete;
- (void)_setupNotifications;
- (void)_tearDownNotifications;
- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7;
- (void)addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 completionHandler:(id)a5;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 completionHandler:(id)a6;
- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4;
- (void)authenticateAndStartInitialImport:(BOOL)a3 completionHandler:(id)a4;
- (void)authenticateWithCompletionHandler:(id)a3;
- (void)becomeActive;
- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)deauthenticateWithCompletionHandler:(id)a3;
- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3;
- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3;
- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3;
- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3;
- (void)disableCloudLibraryWithCompletionHandler:(id)a3;
- (void)disableCloudLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6;
- (void)enableCloudLibraryWithPolicy:(int64_t)a3 startInitialImport:(BOOL)a4 completionHandler:(id)a5;
- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)fetchEnhancedAudioOfflineKeys;
- (void)handleAutomaticDownloadPreferenceChangedForMediaKindMusic:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4;
- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)importArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importItemArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importScreenshotForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importSubscriptionContainerArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)importSubscriptionItemArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)importSubscriptionScreenshotForPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)isAuthenticatedWithCompletionHandler:(id)a3;
- (void)isAuthenticatedWithQueue:(id)a3 completionHandler:(id)a4;
- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5;
- (void)listCloudServerOperations;
- (void)loadArtworkInfoForContainerSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSubscriptionContainerPersistentID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSubscriptionItemPersistentID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 completionHandler:(id)a4;
- (void)loadBooksForStoreIDs:(id)a3 withCompletionHandler:(id)a4;
- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadIsJaliscoUpdateInProgressWithCompletionHandler:(id)a3;
- (void)loadIsSagaUpdateInProgressWithCompletionHandler:(id)a3;
- (void)loadIsUpdateInProgressWithCompletionHandler:(id)a3;
- (void)loadJaliscoUpdateProgressWithCompletionHandler:(id)a3;
- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3;
- (void)loadMissingArtwork;
- (void)loadSagaUpdateProgressWithCompletionHandler:(id)a3;
- (void)loadScreenshotInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForSubscriptionPersistentID:(unint64_t)a3 completionHandler:(id)a4;
- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 completionHandler:(id)a4;
- (void)loadUpdateProgressWithCompletionHandler:(id)a3;
- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3;
- (void)performBlockAfterServerSetup:(id)a3;
- (void)processPendingKeyInvalidations;
- (void)publishPlaylistWithSagaID:(int64_t)a3 completionHandler:(id)a4;
- (void)refreshEnhancedAudioSharedKeys;
- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5;
- (void)removeItemsWithSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)removeJaliscoLibraryWithCompletionHander:(id)a3;
- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4;
- (void)reportAppIconBadgeActionMetrics;
- (void)resetConfiguration:(id)a3;
- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)resignActive;
- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6;
- (void)sdk_addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4;
- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)sdk_createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6;
- (void)sdk_setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6;
- (void)setActive:(BOOL)a3;
- (void)setAlbumArtistProperties:(id)a3 forAlbumArtistPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)setAlbumEntityProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)setAlbumProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4;
- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 completionHandler:(id)a4;
- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4;
- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4;
- (void)setPendingServerSetupCompleteBlocks:(id)a3;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6;
- (void)setPreferredVideoQuality:(int64_t)a3;
- (void)setServerIsSetup:(BOOL)a3;
- (void)setUpdateJaliscoInProgressChangedHandler:(id)a3;
- (void)setUpdateSagaInProgressChangedHandler:(id)a3;
- (void)updateArtistHeroImages;
- (void)updateJaliscoLibraryWithCompletionHandler:(id)a3;
- (void)updateJaliscoLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)updatePinnedSubscribedPlaylistsWithCompletion:(id)a3;
- (void)updateSagaLibraryWithCompletionHandler:(id)a3;
- (void)updateSagaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5;
- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 completionHandler:(id)a4;
- (void)uploadCloudItemProperties;
- (void)uploadCloudPlaylistProperties;
@end

@implementation ICCloudClient

- (ICConnectionConfiguration)configuration
{
  configuration = self->_configuration;
  if (configuration) {
    v3 = configuration;
  }
  else {
    v3 = objc_alloc_init(ICConnectionConfiguration);
  }

  return v3;
}

- (ICCloudClient)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICCloudClient;
  v5 = [(ICCloudClient *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    configuration = v5->_configuration;
    v5->_configuration = (ICConnectionConfiguration *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.iTunesCloud.ICCloudClient.serial.access", 0);
    serialAccessQueue = v5->_serialAccessQueue;
    v5->_serialAccessQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.iTunesCloud.ICCloudClient.serverSetupQueue", 0);
    serverSetupBlockQueue = v5->_serverSetupBlockQueue;
    v5->_serverSetupBlockQueue = (OS_dispatch_queue *)v10;

    v5->_preferredVideoQuality = -1;
    v12 = objc_alloc_init(ICCloudServerListenerEndpointProvider);
    listenerEndpointProvider = v5->_listenerEndpointProvider;
    v5->_listenerEndpointProvider = v12;

    v14 = [[ICCloudClientAvailabilityService alloc] initWithListenerEndpointProvider:v5->_listenerEndpointProvider];
    availabilityService = v5->_availabilityService;
    v5->_availabilityService = v14;

    v16 = [[ICCloudBadgingService alloc] initWithListenerEndpointProvider:v5->_listenerEndpointProvider];
    badgingService = v5->_badgingService;
    v5->_badgingService = v16;

    v18 = [[ICCloudClientCloudService alloc] initWithListenerEndpointProvider:v5->_listenerEndpointProvider];
    cloudService = v5->_cloudService;
    v5->_cloudService = v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    pendingServerSetupCompleteBlocks = v5->_pendingServerSetupCompleteBlocks;
    v5->_pendingServerSetupCompleteBlocks = (NSMutableArray *)v20;

    int out_token = -1;
    notify_register_check("com.apple.itunescloud.setupcompleted", &out_token);
    uint64_t v23 = 0;
    notify_get_state(out_token, &v23);
    notify_cancel(out_token);
    v5->_serverIsSetup = v23 == 1;
    [(ICCloudClient *)v5 _setupNotifications];
  }

  return v5;
}

- (void)_setupNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_ServerDidCompleteSetup, @"com.apple.itunescloud.setupcompleted", 0, (CFNotificationSuspensionBehavior)1028);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)_ServerJaliscoUpdateInProgressDidChangeNotification, @"com.apple.itunescloudd.jaliscoUpdateInProgressChanged", 0, (CFNotificationSuspensionBehavior)1028);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_ServerSagaUpdateInProgressDidChangeNotification, @"com.apple.itunescloudd.sagaUpdateInProgressChanged", 0, (CFNotificationSuspensionBehavior)1028);
}

- (void)setUpdateJaliscoInProgressChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingServerSetupCompleteBlocks, 0);
  objc_storeStrong((id *)&self->_cloudService, 0);
  objc_storeStrong((id *)&self->_badgingService, 0);
  objc_storeStrong((id *)&self->_availabilityService, 0);
  objc_storeStrong((id *)&self->_serverSetupBlockQueue, 0);
  objc_storeStrong((id *)&self->_serialAccessQueue, 0);
  objc_storeStrong((id *)&self->_listenerEndpointProvider, 0);
  objc_storeStrong(&self->_updateJaliscoInProgressChangedHandler, 0);
  objc_storeStrong(&self->_updateSagaInProgressChangedHandler, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

uint64_t __27__ICCloudClient_setActive___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __25__ICCloudClient_isActive__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

uint64_t __56__ICCloudClient__serverJaliscoUpdateInProgressDidChange__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportAppIconBadgeActionMetrics
{
  id v2 = [(ICCloudClient *)self badgingService];
  [v2 reportAppIconBadgeActionMetrics];
}

- (ICCloudBadgingService)badgingService
{
  return self->_badgingService;
}

- (void)isAuthenticatedWithQueue:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(ICCloudClient *)self _isAuthenticated];
  if (v6)
  {
    v9 = v6;
  }
  else
  {
    v9 = dispatch_get_global_queue(0, 0);
  }
  dispatch_queue_t v10 = v9;
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__ICCloudClient_isAuthenticatedWithQueue_completionHandler___block_invoke;
    v11[3] = &unk_1E5ACC128;
    id v12 = v7;
    BOOL v13 = v8;
    dispatch_async(v10, v11);
  }
}

- (void)processPendingKeyInvalidations
{
  v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Sending request to process pending key invalidations...", v6, 2u);
  }

  id v4 = [(ICCloudClient *)self xpcConnection];
  v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_175];
  [v5 processPendingKeyInvalidations];
}

- (void)updateJaliscoLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ICCloudClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACAC90;
  id v8 = v6;
  id v15 = v8;
  v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  dispatch_queue_t v10 = [(ICCloudClient *)self configuration];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5ACAC90;
  id v13 = v8;
  id v11 = v8;
  [v9 updateJaliscoLibraryWithReason:a3 forConfiguration:v10 completion:v12];
}

- (void)_serverJaliscoUpdateInProgressDidChange
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(ICCloudClient *)self updateJaliscoInProgressChangedHandler];
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v3 != 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Receveived Jalisco update in progress notification [Handler present: %{BOOL}u", buf, 0x12u);
  }

  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__ICCloudClient__serverJaliscoUpdateInProgressDidChange__block_invoke;
    v5[3] = &unk_1E5AC76C0;
    id v6 = v3;
    [(ICCloudClient *)self loadIsJaliscoUpdateInProgressWithCompletionHandler:v5];
  }
}

- (id)updateJaliscoInProgressChangedHandler
{
  return self->_updateJaliscoInProgressChangedHandler;
}

- (void)becomeActive
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (![(ICCloudClient *)self isActive])
  {
    [(ICCloudClient *)self setActive:1];
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__4222;
    v17 = __Block_byref_object_dispose__4223;
    id v18 = 0;
    v3 = [(ICCloudClient *)self xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __29__ICCloudClient_becomeActive__block_invoke;
    v12[3] = &unk_1E5ACC338;
    void v12[4] = &v13;
    id v4 = [v3 remoteObjectProxyWithErrorHandler:v12];

    if (v14[5])
    {
      v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = v14[5];
        *(_DWORD *)buf = 134218242;
        uint64_t v20 = self;
        __int16 v21 = 2114;
        uint64_t v22 = v6;
        _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "ICCloudClient %p - becomeActive - Error retrieving xpc service - error=%{public}@", buf, 0x16u);
      }
      goto LABEL_13;
    }
    id v7 = [(ICCloudClient *)self configuration];
    [v4 setupInitialJaliscoPoolingForConfiguration:v7];

    id v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v5 = [v8 bundleIdentifier];

    __int16 v9 = ICBundleIdentifierForSystemApplicationType(0);
    if ([v5 isEqualToString:v9])
    {
      if (![(ICCloudClient *)self isAuthenticated] || ![(ICCloudClient *)self isActive]) {
        goto LABEL_12;
      }
      BOOL v10 = [(ICCloudClient *)self configuration];
      [v4 setupInitialSagaPoolingForConfiguration:v10];
    }
    else
    {
      BOOL v10 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = (ICCloudClient *)v5;
        _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Skip refreshing cloud library and subscribed playlists for bundle: %{public}@", buf, 0xCu);
      }
    }

LABEL_12:
    uint64_t v11 = [(ICCloudClient *)self configuration];
    [v4 updateArtistHeroImagesForConfiguration:v11];

LABEL_13:
    _Block_object_dispose(&v13, 8);
  }
}

- (void)loadIsJaliscoUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  id v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5AC76C0;
  id v11 = v6;
  id v9 = v6;
  [v7 loadIsJaliscoUpdateInProgressForConfiguration:v8 completion:v10];
}

- (NSXPCConnection)xpcConnection
{
  id v2 = [(ICCloudClient *)self cloudService];
  v3 = [v2 xpcConnection];

  return (NSXPCConnection *)v3;
}

- (ICCloudClientCloudService)cloudService
{
  return self->_cloudService;
}

- (void)setActive:(BOOL)a3
{
  v5 = [(ICCloudClient *)self serialAccessQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__ICCloudClient_setActive___block_invoke;
  v6[3] = &unk_1E5ACAD30;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)isActive
{
  id v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(ICCloudClient *)self serialAccessQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __25__ICCloudClient_isActive__block_invoke;
  v5[3] = &unk_1E5ACD880;
  void v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (OS_dispatch_queue)serialAccessQueue
{
  return self->_serialAccessQueue;
}

- (BOOL)_isAuthenticated
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [(ICCloudClient *)self configuration];
  v5 = [v4 userIdentityStore];

  if (!v5)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"ICCloudClient.m" lineNumber:2085 description:@"userIndentityStore cannot be nil"];
  }
  uint64_t v6 = [v4 userIdentity];

  if (!v6)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"ICCloudClient.m" lineNumber:2086 description:@"userIndentity cannot be nil"];
  }
  BOOL v7 = [v4 userIdentityStore];
  [v7 synchronize];

  uint64_t v8 = [(ICCloudClient *)self configuration];
  char v9 = [v8 userIdentityStore];
  BOOL v10 = [(ICCloudClient *)self configuration];
  id v11 = [v10 userIdentity];
  id v20 = 0;
  id v12 = [v9 getPropertiesForUserIdentity:v11 error:&v20];
  id v13 = v20;

  if (v13 || !v12)
  {
    uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [v4 userIdentity];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = self;
      __int16 v23 = 2112;
      v24 = v16;
      __int16 v25 = 2114;
      id v26 = v13;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "%{public}@ - isAuthenticatedWithQueue: - Error retrieving properties - userIdentity=%@ - error=%{public}@", buf, 0x20u);
    }
    LOBYTE(v14) = 0;
  }
  else
  {
    int v14 = [v12 isActiveLocker];
    uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v22 = self;
      __int16 v23 = 1024;
      LODWORD(v24) = v14;
      _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - isAuthenticatedWithQueue: - isAuthenticated=%{BOOL}u", buf, 0x12u);
    }
  }

  return v14;
}

- (ICCloudClient)init
{
  return [(ICCloudClient *)self initWithConfiguration:0];
}

- (void)dealloc
{
  [(ICCloudClient *)self _tearDownNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ICCloudClient;
  [(ICCloudClient *)&v3 dealloc];
}

- (void)_tearDownNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.itunescloud.setupcompleted", 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.itunescloudd.sagaUpdateInProgressChanged", 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterRemoveObserver(v5, self, @"com.apple.itunescloudd.jaliscoUpdateInProgressChanged", 0);
}

void __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, char a3)
{
  objc_super v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACC178;
    id v7 = v3;
    char v8 = a2;
    char v9 = a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __60__ICCloudClient_isAuthenticatedWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32) == 0);
}

void __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Update Jalisco Library failed with error: %{public}@", buf, 0xCu);
    }
  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_68;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

- (void)setServerIsSetup:(BOOL)a3
{
  self->_serverIsSetup = a3;
}

- (BOOL)serverIsSetup
{
  return self->_serverIsSetup;
}

- (void)setPendingServerSetupCompleteBlocks:(id)a3
{
}

- (NSMutableArray)pendingServerSetupCompleteBlocks
{
  return self->_pendingServerSetupCompleteBlocks;
}

- (ICCloudClientAvailabilityService)availabilityService
{
  return self->_availabilityService;
}

- (int64_t)preferredVideoQuality
{
  return self->_preferredVideoQuality;
}

- (OS_dispatch_queue)serverSetupBlockQueue
{
  return self->_serverSetupBlockQueue;
}

- (ICCloudServerListenerEndpointProvider)listenerEndpointProvider
{
  return self->_listenerEndpointProvider;
}

- (void)setUpdateSagaInProgressChangedHandler:(id)a3
{
}

- (id)updateSagaInProgressChangedHandler
{
  return self->_updateSagaInProgressChangedHandler;
}

- (void)_serverSagaUpdateInProgressDidChange
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICCloudClient *)self updateSagaInProgressChangedHandler];
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v3 != 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - Receveived Saga update in progress notification [Handler present: %{BOOL}u", buf, 0x12u);
  }

  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__ICCloudClient__serverSagaUpdateInProgressDidChange__block_invoke;
    v5[3] = &unk_1E5AC76C0;
    id v6 = v3;
    [(ICCloudClient *)self loadIsSagaUpdateInProgressWithCompletionHandler:v5];
  }
}

uint64_t __53__ICCloudClient__serverSagaUpdateInProgressDidChange__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_serverSetupDidComplete
{
  serverSetupBlockQueue = self->_serverSetupBlockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__ICCloudClient__serverSetupDidComplete__block_invoke;
  block[3] = &unk_1E5ACD750;
  block[4] = self;
  dispatch_async(serverSetupBlockQueue, block);
}

uint64_t __40__ICCloudClient__serverSetupDidComplete__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) serverIsSetup];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setServerIsSetup:1];
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [*(id *)(*(void *)(a1 + 32) + 96) count];
      *(_DWORD *)buf = 67109120;
      int v17 = v4;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Running %d blocks.", buf, 8u);
    }

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = *(id *)(*(void *)(a1 + 32) + 96);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_unsafeClaimAutoreleasedReturnValue((id)(*(uint64_t (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9)
                                                                                              + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v9)));
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "removeAllObjects", (void)v11);
  }
  return result;
}

- (BOOL)shouldProhibitActionsForCurrentNetworkConditions
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 shouldProhibitStoreAppsActionForCurrentNetworkConditions];

  return v3;
}

- (BOOL)isCellularDataRestricted
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 isCellularDataRestrictedForStoreApps];

  return v3;
}

- (BOOL)canShowCloudVideo
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 canShowCloudVideo];

  return v3;
}

- (BOOL)canShowCloudMusic
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 canShowCloudMusic];

  return v3;
}

- (BOOL)canShowCloudDownloadButtons
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 canShowCloudDownloadButtons];

  return v3;
}

- (BOOL)shouldProhibitStoreAppsActionForCurrentNetworkConditions
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 shouldProhibitStoreAppsActionForCurrentNetworkConditions];

  return v3;
}

- (BOOL)isCellularDataRestrictedForStoreApps
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 isCellularDataRestrictedForStoreApps];

  return v3;
}

- (BOOL)shouldProhibitVideosActionForCurrentNetworkConditions
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 shouldProhibitVideosActionForCurrentNetworkConditions];

  return v3;
}

- (BOOL)isCellularDataRestrictedForVideos
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 isCellularDataRestrictedForVideos];

  return v3;
}

- (BOOL)shouldProhibitMusicActionForCurrentNetworkConditions
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 shouldProhibitMusicActionForCurrentNetworkConditions];

  return v3;
}

- (BOOL)isCellularDataRestrictedForMusic
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 isCellularDataRestrictedForMusic];

  return v3;
}

- (BOOL)hasProperNetworkConditionsToShowCloudMedia
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 hasProperNetworkConditionsToShowCloudMedia];

  return v3;
}

- (BOOL)hasProperNetworkConditionsToPlayMedia
{
  id v2 = [(ICCloudClient *)self availabilityService];
  char v3 = [v2 hasProperNetworkConditionsToPlayMedia];

  return v3;
}

- (void)listCloudServerOperations
{
  id v3 = [(ICCloudClient *)self xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_177];
  [v2 listCloudServerOperations];
}

void __42__ICCloudClient_listCloudServerOperations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to list cloud server operations with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending notification that setup has completed...", buf, 2u);
  }

  listenerEndpointProvider = self->_listenerEndpointProvider;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__ICCloudClient_notifyDeviceSetupFinishedWithCompletion___block_invoke;
  v8[3] = &unk_1E5ACAC90;
  id v9 = v4;
  id v7 = v4;
  [(ICCloudServerListenerEndpointProvider *)listenerEndpointProvider notifyDeviceSetupFinishedWithCompletion:v8];
}

void __57__ICCloudClient_notifyDeviceSetupFinishedWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_msgSend(v3, "msv_description");
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "Completing sending setup completed notification error=%{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Completing sending setup completed notification", (uint8_t *)&v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__ICCloudClient_processPendingKeyInvalidations__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to invalidate offline keys. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)fetchEnhancedAudioOfflineKeys
{
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Sending request to fetch enhanced-audio offline keys...", v6, 2u);
  }

  int v4 = [(ICCloudClient *)self xpcConnection];
  id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_173];
  [v5 fetchEnhancedAudioOfflineKeys];
}

void __46__ICCloudClient_fetchEnhancedAudioOfflineKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch enhanced-audio offline keys. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)refreshEnhancedAudioSharedKeys
{
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Sending request to refresh enhanced-audio shared keys...", v6, 2u);
  }

  int v4 = [(ICCloudClient *)self xpcConnection];
  id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_171];
  [v5 refreshEnhancedAudioSharedKeys];
}

void __47__ICCloudClient_refreshEnhancedAudioSharedKeys__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to refresh enhanced-audio shared keys. err=%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)createMusicNotificationFromAMSDialogRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = ICBundleIdentifierForSystemApplicationType(0);
  int v7 = +[ICInAppMessageManager sharedManager];
  [v7 addMessageEntryFromAMSDialogRequest:v5 bundleIdentifier:v6 completion:&__block_literal_global_169];

  if (a4) {
    *a4 = 0;
  }

  return 1;
}

void __67__ICCloudClient_createMusicNotificationFromAMSDialogRequest_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to add message entry from AMS dialog. err=%{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (BOOL)hasSetPreferenceForAutomaticDownloads
{
  id v2 = +[ICDefaults standardDefaults];
  char v3 = [v2 automaticDownloadsEnabled];

  return v3;
}

- (BOOL)isAutomaticDownloadsEnabledForMediaKindMusic
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ic_sharedAccountStore");
  id v8 = 0;
  char v3 = objc_msgSend(v2, "ic_activeStoreAccountWithError:", &v8);
  id v4 = v8;

  if (v3)
  {
    int v5 = objc_msgSend(v3, "ic_isAutomaticDownloadsEnabledForMediaKindMusic");
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "Automatic downloads are %{BOOL}u for media kind music", buf, 8u);
    }
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "Not able to determine if automatic downloads are enabled for media kind music. Could not load active store account: error=%{public}@", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)handleAutomaticDownloadPreferenceChangedForMediaKindMusic:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v21 = self;
    __int16 v22 = 1024;
    BOOL v23 = v4;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating automatic download preference change. shouldAutomaticallyDownload=%{BOOL}u", buf, 0x12u);
  }

  id v8 = +[ICUpdateAutomaticDownloadMediaKindsRequest automaticDownloadMediaKindsForMusic];
  uint64_t v9 = [ICStoreRequestContext alloc];
  id v10 = +[ICUserIdentity activeAccount];
  uint64_t v11 = [(ICStoreRequestContext *)v9 initWithIdentity:v10];

  long long v12 = [ICUpdateAutomaticDownloadMediaKindsRequest alloc];
  if (v4) {
    long long v13 = v8;
  }
  else {
    long long v13 = 0;
  }
  if (v4) {
    long long v14 = 0;
  }
  else {
    long long v14 = v8;
  }
  uint64_t v15 = [(ICUpdateAutomaticDownloadMediaKindsRequest *)v12 initWithRequestContext:v11 mediaKindsToAdd:v13 mediaKindsToRemove:v14];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__ICCloudClient_handleAutomaticDownloadPreferenceChangedForMediaKindMusic_withCompletionHandler___block_invoke;
  v17[3] = &unk_1E5AC87B0;
  BOOL v19 = v4;
  v17[4] = self;
  id v18 = v6;
  id v16 = v6;
  [(ICRequestOperation *)v15 performRequestWithCompletionHandler:v17];
}

void __97__ICCloudClient_handleAutomaticDownloadPreferenceChangedForMediaKindMusic_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  int v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      int v17 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Automatic download media kind update task completed error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Automatic download media kind update task completed", buf, 0xCu);
    }

    int v5 = +[ICDefaults standardDefaults];
    [v5 setAutomaticDownloadsEnabled:*(unsigned __int8 *)(a1 + 48)];
  }

  uint64_t v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __97__ICCloudClient_handleAutomaticDownloadPreferenceChangedForMediaKindMusic_withCompletionHandler___block_invoke_165;
    v11[3] = &unk_1E5ACD2F0;
    id v13 = v9;
    id v12 = v3;
    dispatch_async(v10, v11);
  }
}

uint64_t __97__ICCloudClient_handleAutomaticDownloadPreferenceChangedForMediaKindMusic_withCompletionHandler___block_invoke_165(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)loadBooksForStoreIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  uint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E5AC8F38;
  id v14 = v9;
  id v12 = v9;
  [v10 loadBooksForStoreIDs:v7 configuration:v11 completion:v13];
}

void __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Books failed with error: %{public}@", buf, 0xCu);
  }

  int v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_159;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Books failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_160;
    block[3] = &unk_1E5ACD250;
    id v13 = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_160(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__ICCloudClient_loadBooksForStoreIDs_withCompletionHandler___block_invoke_159(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)updateArtistHeroImages
{
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Sending request to update artist hero images...", v7, 2u);
  }

  BOOL v4 = [(ICCloudClient *)self xpcConnection];
  id v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_158];
  id v6 = [(ICCloudClient *)self configuration];
  [v5 updateArtistHeroImagesForConfiguration:v6];
}

void __39__ICCloudClient_updateArtistHeroImages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to update artist hero images with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setAlbumArtistProperties:(id)a3 forAlbumArtistPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Setting album artist properties %{public}@ for persistent ID %llu...", buf, 0x16u);
  }

  id v11 = [(ICCloudClient *)self xpcConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke;
  v18[3] = &unk_1E5ACAC90;
  id v12 = v9;
  id v19 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v18];
  id v14 = [(ICCloudClient *)self configuration];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_2;
  v16[3] = &unk_1E5ACAC90;
  id v17 = v12;
  id v15 = v12;
  [v13 setAlbumArtistProperties:v8 forAlbumArtistPersistentID:a4 configuration:v14 completion:v16];
}

void __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to set album artist properties with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_155;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to set album artist properties with error: %{public}@", buf, 0xCu);
    }
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_156;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_156(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __87__ICCloudClient_setAlbumArtistProperties_forAlbumArtistPersistentID_completionHandler___block_invoke_155(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setAlbumEntityProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Setting album properties %{public}@ for persistent ID %llu ...", buf, 0x16u);
  }

  id v11 = [(ICCloudClient *)self xpcConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke;
  v18[3] = &unk_1E5ACAC90;
  id v12 = v9;
  id v19 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v18];
  id v14 = [(ICCloudClient *)self configuration];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_2;
  v16[3] = &unk_1E5ACAC90;
  id v17 = v12;
  id v15 = v12;
  [v13 setAlbumEntityProperties:v8 forAlbumPersistentID:a4 configuration:v14 completion:v16];
}

void __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to set collection properties with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_153;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to set collection properties with error: %{public}@", buf, 0xCu);
    }
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_154;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_154(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __81__ICCloudClient_setAlbumEntityProperties_forAlbumPersistentID_completionHandler___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setAlbumProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Setting album properties %{public}@ for persistent ID %llu...", buf, 0x16u);
  }

  id v11 = [(ICCloudClient *)self xpcConnection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke;
  v18[3] = &unk_1E5ACAC90;
  id v12 = v9;
  id v19 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v18];
  id v14 = [(ICCloudClient *)self configuration];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_2;
  v16[3] = &unk_1E5ACAC90;
  id v17 = v12;
  id v15 = v12;
  [v13 setAlbumProperties:v8 forAlbumPersistentID:a4 configuration:v14 completion:v16];
}

void __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to set collection properties with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_151;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to set collection properties with error: %{public}@", buf, 0xCu);
    }
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_152;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_152(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__ICCloudClient_setAlbumProperties_forAlbumPersistentID_completionHandler___block_invoke_151(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)uploadCloudPlaylistProperties
{
  id v5 = [(ICCloudClient *)self xpcConnection];
  id v3 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_147];
  int v4 = [(ICCloudClient *)self configuration];
  [v3 uploadCloudPlaylistPropertiesForConfiguration:v4 completion:&__block_literal_global_150];
}

void __46__ICCloudClient_uploadCloudPlaylistProperties__block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to update cloud plaulist properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __46__ICCloudClient_uploadCloudPlaylistProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to update cloud plaulist properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)uploadCloudItemProperties
{
  id v5 = [(ICCloudClient *)self xpcConnection];
  id v3 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_142];
  int v4 = [(ICCloudClient *)self configuration];
  [v3 uploadCloudItemPropertiesForConfiguration:v4 completion:&__block_literal_global_145];
}

void __42__ICCloudClient_uploadCloudItemProperties__block_invoke_143(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to update cloud item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __42__ICCloudClient_uploadCloudItemProperties__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to update cloud item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 2048;
      unint64_t v14 = a4;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Setting item properties %{public}@ for saga ID %llu...", (uint8_t *)&v11, 0x16u);
    }

    id v8 = [(ICCloudClient *)self xpcConnection];
    id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_137];
    id v10 = [(ICCloudClient *)self configuration];
    [v9 setItemProperties:v6 forSagaID:a4 configuration:v10 completion:&__block_literal_global_140];
  }
}

void __45__ICCloudClient_setItemProperties_forSagaID___block_invoke_138(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to set item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __45__ICCloudClient_setItemProperties_forSagaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to set item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543618;
      id v12 = v6;
      __int16 v13 = 2048;
      unint64_t v14 = a4;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Setting item properties %{public}@ for purchaseHistoryID %llu...", (uint8_t *)&v11, 0x16u);
    }

    id v8 = [(ICCloudClient *)self xpcConnection];
    id v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_132];
    id v10 = [(ICCloudClient *)self configuration];
    [v9 setItemProperties:v6 forPurchaseHistoryID:a4 configuration:v10 completion:&__block_literal_global_135];
  }
}

void __56__ICCloudClient_setItemProperties_forPurchaseHistoryID___block_invoke_133(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138543362;
      id v5 = v2;
      _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "Failed to set item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __56__ICCloudClient_setItemProperties_forPurchaseHistoryID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_DEFAULT, "Failed to set item properties with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  id v5 = [(ICCloudClient *)self serialAccessQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__ICCloudClient_setPreferredVideoQuality___block_invoke;
  v10[3] = &unk_1E5ACCD30;
  void v10[4] = self;
  v10[5] = a3;
  dispatch_sync(v5, v10);

  uint64_t v6 = [(ICCloudClient *)self xpcConnection];
  id v7 = [v6 remoteObjectProxy];
  int64_t preferredVideoQuality = self->_preferredVideoQuality;
  id v9 = [(ICCloudClient *)self configuration];
  [v7 setPreferredVideoQuality:preferredVideoQuality forConfiguration:v9 completion:&__block_literal_global_130];
}

uint64_t __42__ICCloudClient_setPreferredVideoQuality___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 64) = *(void *)(result + 40);
  return result;
}

- (void)resignActive
{
}

- (void)resetConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudClient *)self serialAccessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__ICCloudClient_resetConfiguration___block_invoke;
  v7[3] = &unk_1E5ACD4C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __36__ICCloudClient_resetConfiguration___block_invoke(uint64_t a1)
{
}

- (BOOL)initialLibrarySyncsComplete
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICCloudClient *)self configuration];
  id v4 = [v3 userIdentity];

  id v5 = [getML3MusicLibraryClass() musicLibraryForUserAccount:v4];
  id v6 = [(ICCloudClient *)self configuration];
  id v7 = [v6 userIdentityStore];
  id v25 = 0;
  id v8 = [v7 getPropertiesForUserIdentity:v4 error:&v25];
  id v9 = v25;

  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v9;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_ERROR, "Check for initial library syncs completion failed to load identity properties. err = %{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = [v5 jaliscoOnDiskDatabaseRevision];
  uint64_t v12 = [v5 sagaOnDiskDatabaseRevision];
  __int16 v13 = [v5 syncLibraryID];
  int v14 = [v8 isActiveLocker];
  uint64_t v15 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544386;
    id v27 = v4;
    __int16 v28 = 2048;
    uint64_t v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = v12;
    __int16 v32 = 2114;
    v33 = v13;
    __int16 v34 = 1024;
    int v35 = v14;
    _os_log_impl(&dword_1A2D01000, v15, OS_LOG_TYPE_ERROR, "Checking if initial library syncs are completed. userIdentity = %{public}@, jaliscoOnDiskDatabaseRevision=%ld, sagaOnDiskDatabaseRevision=%ld, syncLibraryID=%{public}@, isActiveLocker=%{BOOL}u", buf, 0x30u);
  }

  uint64_t v16 = +[ICDeviceInfo currentDeviceInfo];
  if ([v16 isWatch])
  {
    id v17 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
    int v18 = [v17 isMediaSyncingSupported] ^ 1;
    if (v13) {
      int v19 = 1;
    }
    else {
      int v19 = v18;
    }
  }
  else
  {
    int v19 = 1;
  }

  if (v8) {
    BOOL v20 = v11 == 0;
  }
  else {
    BOOL v20 = 0;
  }
  int v21 = !v20;
  unsigned int v22 = ((v12 != 0) | ~[v8 isActiveLocker]) & v21 & v19;
  int64_t v23 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = v22;
    _os_log_impl(&dword_1A2D01000, v23, OS_LOG_TYPE_ERROR, "Initial library syncs completed: %{BOOL}u", buf, 8u);
  }

  return v22;
}

- (void)loadJaliscoUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  id v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5AC7710;
  id v11 = v6;
  id v9 = v6;
  [v7 loadJaliscoUpdateProgressForConfiguration:v8 completion:v10];
}

void __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Jalisco update progress failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_125;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "Jalisco update progress failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_126;
    v9[3] = &unk_1E5AC76E8;
    id v10 = v7;
    float v11 = a3;
    dispatch_async(v8, v9);
  }
}

uint64_t __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_126(uint64_t a1)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40));
}

uint64_t __64__ICCloudClient_loadJaliscoUpdateProgressWithCompletionHandler___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(3.4028e38);
}

- (void)loadSagaUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  id v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5AC7710;
  id v11 = v6;
  id v9 = v6;
  [v7 loadSagaUpdateProgressForConfiguration:v8 completion:v10];
}

void __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Saga update progress failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_123;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "Saga update progress failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_124;
    v9[3] = &unk_1E5AC76E8;
    id v10 = v7;
    float v11 = a3;
    dispatch_async(v8, v9);
  }
}

uint64_t __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40));
}

uint64_t __61__ICCloudClient_loadSagaUpdateProgressWithCompletionHandler___block_invoke_123(uint64_t a1)
{
  return (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(3.4028e38);
}

void __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Jalisco load Update In Progress failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_122;
    block[3] = &unk_1E5ACD170;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __68__ICCloudClient_loadIsJaliscoUpdateInProgressWithCompletionHandler___block_invoke_122(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadIsSagaUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  id v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5AC76C0;
  id v11 = v6;
  id v9 = v6;
  [v7 loadIsSagaUpdateInProgressForConfiguration:v8 completion:v10];
}

void __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Saga update In Progress failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_121;
    block[3] = &unk_1E5ACD170;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, char a3)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACC178;
    id v7 = v3;
    char v8 = a2;
    char v9 = a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __65__ICCloudClient_loadIsSagaUpdateInProgressWithCompletionHandler___block_invoke_121(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadUpdateProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  char v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5AC7710;
  id v11 = v6;
  id v9 = v6;
  [v7 loadUpdateProgressForConfiguration:v8 completion:v10];
}

void __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Update In Progress failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_118;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "Load Update In Progress failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_119;
    v9[3] = &unk_1E5AC76E8;
    id v10 = v7;
    float v11 = a3;
    dispatch_async(v8, v9);
  }
}

uint64_t __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_119(uint64_t a1)
{
  return (*(uint64_t (**)(void, float))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(float *)(a1 + 40));
}

uint64_t __57__ICCloudClient_loadUpdateProgressWithCompletionHandler___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(float))(*(void *)(a1 + 32) + 16))(3.4028e38);
}

- (void)loadIsUpdateInProgressWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  id v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E5AC76C0;
  id v11 = v6;
  id v9 = v6;
  [v7 loadIsUpdateInProgressForConfiguration:v8 completion:v10];
}

void __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Update In Progress failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_116;
    block[3] = &unk_1E5ACD170;
    id v7 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, char a3)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACC178;
    id v7 = v3;
    char v8 = a2;
    char v9 = a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __61__ICCloudClient_loadIsUpdateInProgressWithCompletionHandler___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (void (**)(void, void, void))v6;
  if (a3)
  {
    char v8 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v19 = a3;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "Sending load genius items request for saga ID %llu...", buf, 0xCu);
    }

    char v9 = [(ICCloudClient *)self xpcConnection];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke;
    v16[3] = &unk_1E5ACAC90;
    uint64_t v10 = v7;
    id v17 = v10;
    id v11 = [v9 remoteObjectProxyWithErrorHandler:v16];
    uint64_t v12 = [(ICCloudClient *)self configuration];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_2;
    v14[3] = &unk_1E5AC8F38;
    uint64_t v15 = v10;
    [v11 loadGeniusItemsForSagaID:a3 configuration:v12 completion:v14];
  }
  else if (v6)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "ic_cloudClientErrorWithCode:userInfo:", 2015, 0);
    ((void (**)(void, void, void *))v7)[2](v7, 0, v13);
  }
}

void __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Genius Items failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_113;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Genius Items failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_114;
    block[3] = &unk_1E5ACD250;
    id v13 = v8;
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_114(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __60__ICCloudClient_loadGeniusItemsForSagaID_completionHandler___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)loadMissingArtwork
{
  id v5 = [(ICCloudClient *)self xpcConnection];
  id v3 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_4155];
  id v4 = [(ICCloudClient *)self configuration];
  [v3 loadMissingArtworkForConfiguration:v4];
}

void __35__ICCloudClient_loadMissingArtwork__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1A2D01000, v3, OS_LOG_TYPE_ERROR, "loadMissingArtwork failed with error: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(ICCloudClient *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    id v9 = v7;
    id v15 = v9;
    uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
    id v11 = [(ICCloudClient *)self configuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AC7698;
    id v13 = v9;
    [v10 loadArtworkInfoForSubscriptionContainerPersistentIDs:v6 configuration:v11 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Subscription Container Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_111;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Subscription Container Artwork Info failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_112;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_112(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __88__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentIDs_completionHandler___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadArtworkInfoForSubscriptionContainerPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7670;
  id v11 = v6;
  id v9 = v6;
  [(ICCloudClient *)self loadArtworkInfoForSubscriptionContainerPersistentIDs:v8 completionHandler:v10];
}

void __87__ICCloudClient_loadArtworkInfoForSubscriptionContainerPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(ICCloudClient *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    id v9 = v7;
    id v15 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
    id v11 = [(ICCloudClient *)self configuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AC7698;
    id v13 = v9;
    [v10 loadScreenshotInfoForSubscriptionPersistentIDs:v6 configuration:v11 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Subscription Screenshot Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_109;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Subscription Screenshot Artwork Info failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_110;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_110(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __82__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentIDs_completionHandler___block_invoke_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadScreenshotInfoForSubscriptionPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7670;
  id v11 = v6;
  id v9 = v6;
  [(ICCloudClient *)self loadScreenshotInfoForSubscriptionPersistentIDs:v8 completionHandler:v10];
}

void __81__ICCloudClient_loadScreenshotInfoForSubscriptionPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(ICCloudClient *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    id v9 = v7;
    id v15 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
    id v11 = [(ICCloudClient *)self configuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AC7698;
    id v13 = v9;
    [v10 loadArtworkInfoForSubscriptionItemPersistentIDs:v6 configuration:v11 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Subscription Item Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_107;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Subscription Item Artwork Info failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_108;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_108(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __83__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentIDs_completionHandler___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadArtworkInfoForSubscriptionItemPersistentID:(unint64_t)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7670;
  id v11 = v6;
  id v9 = v6;
  [(ICCloudClient *)self loadArtworkInfoForSubscriptionItemPersistentIDs:v8 completionHandler:v10];
}

void __82__ICCloudClient_loadArtworkInfoForSubscriptionItemPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(ICCloudClient *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    id v9 = v7;
    id v15 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
    id v11 = [(ICCloudClient *)self configuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AC7698;
    id v13 = v9;
    [v10 loadScreenshotInfoForSagaIDs:v6 configuration:v11 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Container Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_105;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Container Artwork Info failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_106;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_106(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __64__ICCloudClient_loadScreenshotInfoForSagaIDs_completionHandler___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadScreenshotInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__ICCloudClient_loadScreenshotInfoForSagaID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7670;
  id v11 = v6;
  id v9 = v6;
  [(ICCloudClient *)self loadScreenshotInfoForSagaIDs:v8 completionHandler:v10];
}

void __63__ICCloudClient_loadScreenshotInfoForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(ICCloudClient *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    id v9 = v7;
    id v15 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
    id v11 = [(ICCloudClient *)self configuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AC7698;
    id v13 = v9;
    [v10 loadArtworkInfoForContainerSagaIDs:v6 configuration:v11 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Container Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_103;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Container Artwork Info failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_104;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __70__ICCloudClient_loadArtworkInfoForContainerSagaIDs_completionHandler___block_invoke_103(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadArtworkInfoForContainerSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__ICCloudClient_loadArtworkInfoForContainerSagaID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7670;
  id v11 = v6;
  id v9 = v6;
  [(ICCloudClient *)self loadArtworkInfoForContainerSagaIDs:v8 completionHandler:v10];
}

void __69__ICCloudClient_loadArtworkInfoForContainerSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)loadArtworkInfoForSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(ICCloudClient *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    id v9 = v7;
    id v15 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
    id v11 = [(ICCloudClient *)self configuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AC7698;
    id v13 = v9;
    [v10 loadArtworkInfoForSagaIDs:v6 configuration:v11 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_101;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Artwork Info failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_102;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_102(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __61__ICCloudClient_loadArtworkInfoForSagaIDs_completionHandler___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadArtworkInfoForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__ICCloudClient_loadArtworkInfoForSagaID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7670;
  id v11 = v6;
  id v9 = v6;
  [(ICCloudClient *)self loadArtworkInfoForSagaIDs:v8 completionHandler:v10];
}

void __60__ICCloudClient_loadArtworkInfoForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(ICCloudClient *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    id v9 = v7;
    id v15 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
    id v11 = [(ICCloudClient *)self configuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AC7698;
    id v13 = v9;
    [v10 loadScreenshotInfoForPurchaseHistoryIDs:v6 configuration:v11 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Artwork Info for purchase history screenshot failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_99;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Artwork Info for purchase history screenshot failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_100;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __75__ICCloudClient_loadScreenshotInfoForPurchaseHistoryIDs_completionHandler___block_invoke_99(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadScreenshotInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__ICCloudClient_loadScreenshotInfoForPurchaseHistoryID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7670;
  id v11 = v6;
  id v9 = v6;
  [(ICCloudClient *)self loadScreenshotInfoForPurchaseHistoryIDs:v8 completionHandler:v10];
}

void __74__ICCloudClient_loadScreenshotInfoForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [v6 count])
  {
    id v8 = [(ICCloudClient *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke;
    v14[3] = &unk_1E5ACAC90;
    id v9 = v7;
    id v15 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
    id v11 = [(ICCloudClient *)self configuration];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5AC7698;
    id v13 = v9;
    [v10 loadArtworkInfoForPurchaseHistoryIDs:v6 configuration:v11 completion:v12];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0]);
  }
}

void __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Load Artwork Info failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_96;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

void __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "Load Artwork Info failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = dispatch_get_global_queue(0, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_97;
    v10[3] = &unk_1E5ACD2F0;
    id v12 = v8;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

uint64_t __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_97(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __72__ICCloudClient_loadArtworkInfoForPurchaseHistoryIDs_completionHandler___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadArtworkInfoForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  v12[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__ICCloudClient_loadArtworkInfoForPurchaseHistoryID_completionHandler___block_invoke;
  v10[3] = &unk_1E5AC7670;
  id v11 = v6;
  id v9 = v6;
  [(ICCloudClient *)self loadArtworkInfoForPurchaseHistoryIDs:v8 completionHandler:v10];
}

void __71__ICCloudClient_loadArtworkInfoForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 firstObject];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize album artist hero artwork import with persistent ID %lld...", buf, 0xCu);
  }

  id v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__ICCloudClient_deprioritizeAlbumArtistHeroImageForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  id v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeAlbumArtistHeroImageForPersistentID:a3 configuration:v8];
}

void __65__ICCloudClient_deprioritizeAlbumArtistHeroImageForPersistentID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize album artist hero artwork import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize artist hero artwork import with persistent ID %lld...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ICCloudClient_deprioritizeArtistHeroImageForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeArtistHeroImageForPersistentID:a3 configuration:v8];
}

void __60__ICCloudClient_deprioritizeArtistHeroImageForPersistentID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize artist hero artwork import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize subscription container artwork import with persistent ID %lld...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__ICCloudClient_deprioritizeSubscriptionContainerArtworkForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeSubscriptionContainerArtworkForPersistentID:a3 configuration:v8];
}

void __73__ICCloudClient_deprioritizeSubscriptionContainerArtworkForPersistentID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize subscription container artwork import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize subscription screenshot import with persistent ID %lld...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__ICCloudClient_deprioritizeSubscriptionScreenshotForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeSubscriptionScreenshotForPersistentID:a3 configuration:v8];
}

void __67__ICCloudClient_deprioritizeSubscriptionScreenshotForPersistentID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize subscription screenshot import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize subscription item artwork import with persistent ID %lld...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ICCloudClient_deprioritizeSubscriptionItemArtworkForPersistentID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeSubscriptionItemArtworkForPersistentID:a3 configuration:v8];
}

void __68__ICCloudClient_deprioritizeSubscriptionItemArtworkForPersistentID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize subscription item artwork import with persistent ID %lld with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize container artwork import with saga ID %llu...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ICCloudClient_deprioritizeContainerArtworkForSagaID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeContainerArtworkForSagaID:a3 configuration:v8];
}

void __55__ICCloudClient_deprioritizeContainerArtworkForSagaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize container artwork import with saga ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize screenshot import with saga ID %llu...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__ICCloudClient_deprioritizeScreenshotForSagaID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeScreenshotForSagaID:a3 configuration:v8];
}

void __49__ICCloudClient_deprioritizeScreenshotForSagaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize screenshot import with saga ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize item artwork import with saga ID %llu...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__ICCloudClient_deprioritizeItemArtworkForSagaID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeItemArtworkForSagaID:a3 configuration:v8];
}

void __50__ICCloudClient_deprioritizeItemArtworkForSagaID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize item artwork import with saga ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize screenshot artwork import with purchase history ID %llu...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__ICCloudClient_deprioritizeScreenshotForPurchaseHistoryID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeScreenshotForPurchaseHistoryID:a3 configuration:v8];
}

void __60__ICCloudClient_deprioritizeScreenshotForPurchaseHistoryID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize screenshot artwork import with purchase history ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v11 = a3;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending request to deprioritize item artwork import with purchase history ID %llu...", buf, 0xCu);
  }

  int v6 = [(ICCloudClient *)self xpcConnection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__ICCloudClient_deprioritizeItemArtworkForPurchaseHistoryID___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v9[4] = a3;
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ICCloudClient *)self configuration];
  [v7 deprioritizeItemArtworkForPurchaseHistoryID:a3 configuration:v8];
}

void __61__ICCloudClient_deprioritizeItemArtworkForPurchaseHistoryID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 134218242;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to deprioritize item artwork import with purchase history ID %llu with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import album artist hero image for item persistent ID %lld...", buf, 0xCu);
  }

  __int16 v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__ICCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__ICCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke_92;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importAlbumArtistHeroImageForPersistentID:a3 configuration:v11 completion:v13];
}

void __77__ICCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Album Artist Hero Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __77__ICCloudClient_importAlbumArtistHeroImageForPersistentID_completionHandler___block_invoke_92(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Album Artist Hero Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to artist hero image hero for item persistent ID %lld...", buf, 0xCu);
  }

  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__ICCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__ICCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke_91;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importArtistHeroImageForPersistentID:a3 configuration:v11 completion:v13];
}

void __72__ICCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Artist Hero Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __72__ICCloudClient_importArtistHeroImageForPersistentID_completionHandler___block_invoke_91(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Artist Hero Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importSubscriptionContainerArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import subscription artwork for container persistent ID %lld...", buf, 0xCu);
  }

  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__ICCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__ICCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke_90;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importSubscriptionContainerArtworkForPersistentID:a3 configuration:v11 completion:v13];
}

void __85__ICCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Container Artwork with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __85__ICCloudClient_importSubscriptionContainerArtworkForPersistentID_completionHandler___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Container Artwork with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importSubscriptionScreenshotForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import subscription screenshot for item persistent ID %lld...", buf, 0xCu);
  }

  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__ICCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__ICCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke_89;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importSubscriptionScreenshotForPersistentID:a3 configuration:v11 completion:v13];
}

void __79__ICCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __79__ICCloudClient_importSubscriptionScreenshotForPersistentID_completionHandler___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importSubscriptionItemArtworkForPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import subscription artwork for item persistent ID %lld...", buf, 0xCu);
  }

  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__ICCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__ICCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke_88;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importSubscriptionItemArtworkForPersistentID:a3 configuration:v11 completion:v13];
}

void __80__ICCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __80__ICCloudClient_importSubscriptionItemArtworkForPersistentID_completionHandler___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Subscription Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import container artwork for saga ID %llu...", buf, 0xCu);
  }

  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__ICCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__ICCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke_87;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importContainerArtworkForSagaID:a3 configuration:v11 completion:v13];
}

void __67__ICCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Container Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __67__ICCloudClient_importContainerArtworkForSagaID_completionHandler___block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Container Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importScreenshotForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import screenshot for saga ID %llu...", buf, 0xCu);
  }

  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__ICCloudClient_importScreenshotForSagaID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__ICCloudClient_importScreenshotForSagaID_completionHandler___block_invoke_86;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importScreenshotForSagaID:a3 configuration:v11 completion:v13];
}

void __61__ICCloudClient_importScreenshotForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Cloud Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __61__ICCloudClient_importScreenshotForSagaID_completionHandler___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Cloud Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import item artwork for saga ID %llu...", buf, 0xCu);
  }

  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__ICCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ICCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke_85;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importItemArtworkForSagaID:a3 configuration:v11 completion:v13];
}

void __62__ICCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __62__ICCloudClient_importItemArtworkForSagaID_completionHandler___block_invoke_85(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[ICCloudAvailabilityController sharedController];
  int v8 = [v7 shouldProhibitVideosActionForCurrentNetworkConditions];

  id v9 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v21 = a3;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "Sending request to import screenshot for purchase history ID %llu...", buf, 0xCu);
    }

    id v12 = [(ICCloudClient *)self xpcConnection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__ICCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke;
    v18[3] = &unk_1E5ACAC90;
    id v13 = v6;
    id v19 = v13;
    id v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
    uint64_t v15 = [(ICCloudClient *)self configuration];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __72__ICCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke_84;
    v16[3] = &unk_1E5ACAC90;
    id v17 = v13;
    [v14 importScreenshotForPurchaseHistoryID:a3 configuration:v15 completion:v16];

    unint64_t v11 = v19;
    goto LABEL_9;
  }
  if (v10)
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v21 = a3;
    _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_DEFAULT, "Skipping request to import item screenshot for purchase history ID %llu due to insufficient network conditions", buf, 0xCu);
  }

  if (v6)
  {
    unint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "ic_cloudClientErrorWithCode:userInfo:", 2006, 0);
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
LABEL_9:
  }
}

void __72__ICCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Purchase History Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __72__ICCloudClient_importScreenshotForPurchaseHistoryID_completionHandler___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Purchase History Screenshot failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v18 = a3;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to import item artwork for purchase history ID %llu...", buf, 0xCu);
  }

  uint64_t v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__ICCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  BOOL v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  unint64_t v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__ICCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke_83;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 importItemArtworkForPurchaseHistoryID:a3 configuration:v11 completion:v13];
}

void __73__ICCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __73__ICCloudClient_importItemArtworkForPurchaseHistoryID_completionHandler___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138543362;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Import Item Artwork failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)loadLastKnownEnableICMLErrorStatusWithCompletionHander:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __72__ICCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  uint64_t v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__ICCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke_81;
  v10[3] = &unk_1E5AC7648;
  id v11 = v6;
  id v9 = v6;
  [v7 loadLastKnownEnableICMLErrorStatusForConfiguration:v8 completion:v10];
}

void __72__ICCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "loading last known iCML state change failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __72__ICCloudClient_loadLastKnownEnableICMLErrorStatusWithCompletionHander___block_invoke_81(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "loading last known iCML state change failed with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)isAuthenticatedWithCompletionHandler:(id)a3
{
}

- (void)deauthenticateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "Sending deauthenticate request...", buf, 2u);
  }

  id v6 = [(ICCloudClient *)self xpcConnection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E5ACAC90;
  id v7 = v4;
  id v14 = v7;
  uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  int v9 = [(ICCloudClient *)self configuration];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E5ACAC90;
  id v12 = v7;
  id v10 = v7;
  [v8 deauthenticateForConfiguration:v9 completion:v11];
}

void __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Deauthenticate failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_79;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Deauthenticate failed with error: %{public}@", buf, 0xCu);
    }
  }
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_80;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_80(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __53__ICCloudClient_deauthenticateWithCompletionHandler___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)updateSagaLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "Sending request to update Cloud Library...", buf, 2u);
  }

  id v8 = +[ICCloudAvailabilityController sharedController];
  int v9 = [v8 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v10, OS_LOG_TYPE_DEFAULT, "Can't update cloud library using current network - skipping", buf, 2u);
    }

    if (v6) {
      v6[2](v6, 0);
    }
  }
  else
  {
    id v11 = [(ICCloudClient *)self xpcConnection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke;
    v17[3] = &unk_1E5ACAC90;
    uint64_t v12 = v6;
    id v18 = v12;
    id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
    id v14 = [(ICCloudClient *)self configuration];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke_77;
    v15[3] = &unk_1E5ACAC90;
    id v16 = v12;
    [v13 updateSagaLibraryWithReason:a3 forConfiguration:v14 completion:v15];
  }
}

void __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Update Match Library failed with error: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 code];
  if (v3 >= 1)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Update Match Library failed with status: %ld", buf, 0xCu);
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    int v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke_78;
    v7[3] = &unk_1E5ACA758;
    id v8 = v5;
    uint64_t v9 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __63__ICCloudClient_updateSagaLibraryWithReason_completionHandler___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40) == 0);
}

- (void)updateSagaLibraryWithCompletionHandler:(id)a3
{
}

- (void)updateJaliscoLibraryWithCompletionHandler:(id)a3
{
}

- (BOOL)musicPurchasesDisabledForJaliscoLibrary
{
  uint64_t v2 = [(ICCloudClient *)self configuration];
  uint64_t v3 = [v2 userIdentity];
  id v4 = [getML3MusicLibraryClass() musicLibraryForUserAccount:v3];
  uint64_t v5 = [v4 jaliscoLastExcludedMediaKinds];
  char v6 = [v5 containsObject:&unk_1EF640810];

  return v6;
}

- (BOOL)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(ICCloudClient *)self xpcConnection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__ICCloudClient_isMediaKindDisabledForJaliscoLibrary___block_invoke;
  v10[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v10[4] = a3;
  char v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v7 = [(ICCloudClient *)self configuration];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__ICCloudClient_isMediaKindDisabledForJaliscoLibrary___block_invoke_71;
  v9[3] = &unk_1E5AC7620;
  void v9[4] = &v11;
  void v9[5] = a3;
  [v6 isMediaKindDisabledForJaliscoLibrary:a3 configuration:v7 completion:v9];

  LOBYTE(a3) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return a3;
}

void __54__ICCloudClient_isMediaKindDisabledForJaliscoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = 67109378;
    v6[1] = v5;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Checking if mediakind=%d is disabled failed with error=%{public}@", (uint8_t *)v6, 0x12u);
  }
}

void __54__ICCloudClient_isMediaKindDisabledForJaliscoLibrary___block_invoke_71(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  if (v5)
  {
    char v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v15 = 67109634;
      int v16 = v7;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 1024;
      int v20 = v8;
      uint64_t v9 = "Could not get if mediaKind=%d is disabled for Jalisco sync. error=%{public}@, isMediaKindDisabled=%d";
      id v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 24;
LABEL_9:
      _os_log_impl(&dword_1A2D01000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    char v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        char v14 = "disabled";
      }
      else {
        char v14 = "enabled";
      }
      int v15 = 67109378;
      int v16 = v13;
      __int16 v17 = 2082;
      id v18 = v14;
      uint64_t v9 = "mediaKind=%d is %{public}s for Jalisco sync";
      id v10 = v6;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 18;
      goto LABEL_9;
    }
  }
}

- (void)removeJaliscoLibraryWithCompletionHander:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  int v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_2;
  v10[3] = &unk_1E5ACAC90;
  id v11 = v6;
  id v9 = v6;
  [v7 removeJaliscoLibraryForConfiguration:v8 completion:v10];
}

void __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Remove Jalisco failed with error: %{public}@", buf, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_69;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Remove Jalisco failed with error: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_70;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __58__ICCloudClient_removeJaliscoLibraryWithCompletionHander___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Update Jalisco Library failed with error: %{public}@", buf, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_67;
    block[3] = &unk_1E5ACD170;
    id v8 = v5;
    dispatch_async(v6, block);
  }
}

uint64_t __66__ICCloudClient_updateJaliscoLibraryWithReason_completionHandler___block_invoke_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __29__ICCloudClient_becomeActive__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Update Jalisco Library failed with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)disableCloudLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v17 = self;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "<ICCloudClient %p> - Attempting disable cloud library", buf, 0xCu);
  }

  id v8 = [(ICCloudClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__ICCloudClient_disableCloudLibraryWithReason_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACD8E0;
  void v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __65__ICCloudClient_disableCloudLibraryWithReason_completionHandler___block_invoke_65;
  v12[3] = &unk_1E5ACAC90;
  id v13 = v9;
  id v11 = v9;
  [v10 disableCloudLibraryWithReason:a3 completion:v12];
}

void __65__ICCloudClient_disableCloudLibraryWithReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Could not get remote object to deauth Saga library - error=%{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __65__ICCloudClient_disableCloudLibraryWithReason_completionHandler___block_invoke_65(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  uint64_t v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = 138543362;
    id v12 = v3;
    uint64_t v6 = "Could not deauthenticate Saga library and disable active locker account - error=%{public}@.";
    int v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v11) = 0;
    uint64_t v6 = "Finished deauthenticating Saga library";
    int v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 2;
  }
  _os_log_impl(&dword_1A2D01000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

- (void)disableCloudLibraryWithCompletionHandler:(id)a3
{
}

- (void)_enableCloudLibraryWithPolicy:(int64_t)a3 startinitialImport:(BOOL)a4 isExplicitUserAction:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  int v11 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    int64_t v23 = self;
    __int16 v24 = 1024;
    int v25 = a3;
    __int16 v26 = 1024;
    BOOL v27 = v7;
    __int16 v28 = 1024;
    BOOL v29 = v6;
    _os_log_impl(&dword_1A2D01000, v11, OS_LOG_TYPE_DEFAULT, "<ICCloudClient %p> - Attempting cloud library authenticate (start initial import with explicit user action, merge policy=%d, shouldStartInitialImport=%{BOOL}u, isExplicitUserAction = %{BOOL}u)", buf, 0x1Eu);
  }

  BOOL v12 = [(ICCloudClient *)self _isAuthenticated];
  if (!a3 || !v12)
  {
    char v14 = [(ICCloudClient *)self xpcConnection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __105__ICCloudClient__enableCloudLibraryWithPolicy_startinitialImport_isExplicitUserAction_completionHandler___block_invoke;
    v20[3] = &unk_1E5ACAC90;
    id v15 = v10;
    id v21 = v15;
    int v16 = [v14 remoteObjectProxyWithErrorHandler:v20];
    __int16 v17 = [(ICCloudClient *)self configuration];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __105__ICCloudClient__enableCloudLibraryWithPolicy_startinitialImport_isExplicitUserAction_completionHandler___block_invoke_64;
    v18[3] = &unk_1E5ACAC90;
    id v19 = v15;
    [v16 authenticateForConfiguration:v17 startInitialImport:v7 enableCloudLibraryPolicy:a3 isExplicitUserAction:v6 completion:v18];

    uint64_t v13 = v21;
    goto LABEL_8;
  }
  if (v10)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ICError" code:0 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v13);
LABEL_8:
  }
}

void __105__ICCloudClient__enableCloudLibraryWithPolicy_startinitialImport_isExplicitUserAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Could not get remote object to authenticate and start initial Saga import - error=%{public}@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __105__ICCloudClient__enableCloudLibraryWithPolicy_startinitialImport_isExplicitUserAction_completionHandler___block_invoke_64(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  uint64_t v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = 138543362;
    id v12 = v3;
    int v6 = "Could not authenticate and start initial import of Saga library - error=%{public}@";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    uint32_t v9 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v11) = 0;
    int v6 = "Successfully authenticated and finished Saga import.";
    id v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 2;
  }
  _os_log_impl(&dword_1A2D01000, v7, v8, v6, (uint8_t *)&v11, v9);
LABEL_7:

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);
  }
}

- (void)enableCloudLibraryWithPolicy:(int64_t)a3 startInitialImport:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)authenticateAndStartInitialImport:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)authenticateWithCompletionHandler:(id)a3
{
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(ICCloudClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke;
  v14[3] = &unk_1E5ACD8E0;
  void v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  uint32_t v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  uint64_t v10 = [(ICCloudClient *)self configuration];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_2;
  v12[3] = &unk_1E5AC75D8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v9 resetInvitationURLForCollaborationWithPersistentID:a3 configuration:v10 completion:v12];
}

void __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_61;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = objc_msgSend(v6, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      id v21 = v10;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to reset invitation link error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v11;
    _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to reset invitation link", buf, 0xCu);
  }

  uint64_t v12 = *(void **)(a1 + 40);
  if (v12)
  {
    __int16 v13 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_62;
    block[3] = &unk_1E5ACD250;
    id v17 = v12;
    id v15 = v5;
    id v16 = v6;
    dispatch_async(v13, block);
  }
}

uint64_t __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_62(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __79__ICCloudClient_resetInvitationURLForCollaborationWithPersistentID_completion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(ICCloudClient *)self xpcConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke;
  v17[3] = &unk_1E5ACD8E0;
  void v17[4] = self;
  id v11 = v8;
  id v18 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  __int16 v13 = [(ICCloudClient *)self configuration];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_2;
  v15[3] = &unk_1E5ACD8E0;
  void v15[4] = self;
  id v16 = v11;
  id v14 = v11;
  [v12 removeCollaborators:v9 fromCollaborationWithPersistentID:a4 configuration:v13 completion:v15];
}

void __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_59;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v6;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Completed removing collaborator request error=%{public}@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed removing collaborator request", buf, 0xCu);
  }

  id v9 = *(void **)(a1 + 40);
  if (v9)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_60;
    v11[3] = &unk_1E5ACD2F0;
    id v13 = v9;
    id v12 = v3;
    dispatch_async(v10, v11);
  }
}

uint64_t __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __82__ICCloudClient_removeCollaborators_fromCollaborationWithPersistentID_completion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  id v12 = [(ICCloudClient *)self xpcConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke;
  v20[3] = &unk_1E5ACD8E0;
  void v20[4] = self;
  id v13 = v10;
  id v21 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v20];
  uint64_t v15 = [(ICCloudClient *)self configuration];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_2;
  v17[3] = &unk_1E5ACABC8;
  id v18 = v13;
  int64_t v19 = a4;
  void v17[4] = self;
  id v16 = v13;
  [v14 respondToPendingCollaborator:v11 onCollaborationWithPersistentID:a4 withApproval:v6 configuration:v15 completion:v17];
}

void __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  BOOL v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_57;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[6];
      uint64_t v8 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Completed responding to collaboration join request persistentID %lld error=%{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[6];
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed responding to collaboration join request persistentID %lld", buf, 0x16u);
  }

  id v11 = (void *)a1[5];
  if (v11)
  {
    uint64_t v12 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_58;
    v13[3] = &unk_1E5ACD2F0;
    id v15 = v11;
    id v14 = v3;
    dispatch_async(v12, v13);
  }
}

uint64_t __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __102__ICCloudClient_respondToPendingCollaborator_onCollaborationWithPersistentID_withApproval_completion___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(ICCloudClient *)self xpcConnection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke;
  v20[3] = &unk_1E5ACD8E0;
  void v20[4] = self;
  id v12 = v9;
  id v21 = v12;
  __int16 v13 = [v11 remoteObjectProxyWithErrorHandler:v20];
  id v14 = [(ICCloudClient *)self configuration];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_2;
  v17[3] = &unk_1E5ACAA38;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v12;
  id v15 = v12;
  id v16 = v8;
  [v13 joinCollaborationWithGlobalPlaylistID:v16 invitationURL:v10 configuration:v14 completion:v17];
}

void __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_55;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      id v10 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      __int16 v24 = v10;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to join collaboration for playlist %{public}@ error=%{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[5];
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v11;
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to join collaboration for playlist %{public}@", buf, 0x16u);
  }

  __int16 v13 = (void *)a1[6];
  if (v13)
  {
    id v14 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_56;
    block[3] = &unk_1E5ACA780;
    id v17 = v13;
    uint64_t v18 = a2;
    id v16 = v5;
    dispatch_async(v14, block);
  }
}

uint64_t __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_56(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __80__ICCloudClient_joinCollaborationWithGlobalPlaylistID_invitationURL_completion___block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  __int16 v13 = [(ICCloudClient *)self xpcConnection];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke;
  v21[3] = &unk_1E5ACD8E0;
  v21[4] = self;
  id v14 = v10;
  id v22 = v14;
  uint64_t v15 = [v13 remoteObjectProxyWithErrorHandler:v21];
  id v16 = [(ICCloudClient *)self configuration];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_2;
  v18[3] = &unk_1E5ACABC8;
  id v19 = v14;
  int64_t v20 = a3;
  void v18[4] = self;
  id v17 = v14;
  [v15 editCollaborationWithPersistentID:a3 configuration:v16 properties:v12 trackEdits:v11 completion:v18];
}

void __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  uint64_t v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_53;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[6];
      uint64_t v8 = objc_msgSend(v3, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v6;
      __int16 v18 = 2048;
      uint64_t v19 = v7;
      __int16 v20 = 2114;
      __int16 v21 = v8;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to edit collaboration for persistentID %lld error=%{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = a1[6];
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v9;
    __int16 v18 = 2048;
    uint64_t v19 = v10;
    _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to edit collaboration for persistentID %lld", buf, 0x16u);
  }

  id v11 = (void *)a1[5];
  if (v11)
  {
    uint64_t v12 = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_54;
    v13[3] = &unk_1E5ACD2F0;
    id v15 = v11;
    id v14 = v3;
    dispatch_async(v12, v13);
  }
}

uint64_t __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __84__ICCloudClient_editCollaborationWithPersistentID_properties_trackEdits_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke;
  v15[3] = &unk_1E5ACD8E0;
  void v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v15];
  uint64_t v10 = [(ICCloudClient *)self configuration];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_2;
  v12[3] = &unk_1E5AC75B0;
  id v13 = v8;
  int64_t v14 = a3;
  void v12[4] = self;
  id v11 = v8;
  [v9 endCollaborationWithPersistentID:a3 configuration:v10 completion:v12];
}

void __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_51;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[6];
      id v10 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      __int16 v24 = v10;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to end collaboration with persistentID %lld error=%{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[6];
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to end collaboration with persistentID %lld", buf, 0x16u);
  }

  __int16 v13 = (void *)a1[5];
  if (v13)
  {
    id v14 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_52;
    block[3] = &unk_1E5ACA780;
    id v17 = v13;
    uint64_t v18 = a2;
    id v16 = v5;
    dispatch_async(v14, block);
  }
}

uint64_t __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_52(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __61__ICCloudClient_endCollaborationWithPersistentID_completion___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(ICCloudClient *)self xpcConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke;
  v17[3] = &unk_1E5ACD8E0;
  void v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v17];
  uint64_t v12 = [(ICCloudClient *)self configuration];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_2;
  v14[3] = &unk_1E5AC75B0;
  id v15 = v10;
  int64_t v16 = a3;
  void v14[4] = self;
  id v13 = v10;
  [v11 beginCollaborationUsingPlaylistWithPersistentID:a3 sharingMode:a4 configuration:v12 completion:v14];
}

void __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "%{public}@ Failed to connect to remote proxy. err=%{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_49;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[6];
      id v10 = objc_msgSend(v5, "msv_description");
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2048;
      uint64_t v22 = v9;
      __int16 v23 = 2114;
      __int16 v24 = v10;
      _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_ERROR, "%{public}@ Completed request to start collaboration for persistentID %lld error=%{public}@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = a1[4];
    uint64_t v12 = a1[6];
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v11;
    __int16 v21 = 2048;
    uint64_t v22 = v12;
    _os_log_impl(&dword_1A2D01000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed request to start collaboration for persistentID %lld", buf, 0x16u);
  }

  __int16 v13 = (void *)a1[5];
  if (v13)
  {
    id v14 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_50;
    block[3] = &unk_1E5ACA780;
    id v17 = v13;
    uint64_t v18 = a2;
    id v16 = v5;
    dispatch_async(v14, block);
  }
}

uint64_t __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_50(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __88__ICCloudClient_beginCollaborationUsingPlaylistWithPersistentID_sharingMode_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  __int16 v13 = [(ICCloudClient *)self xpcConnection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke;
  v23[3] = &unk_1E5ACD8E0;
  id v14 = v10;
  id v24 = v14;
  id v15 = v11;
  id v25 = v15;
  id v16 = [v13 remoteObjectProxyWithErrorHandler:v23];
  id v17 = [(ICCloudClient *)self configuration];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_2;
  v20[3] = &unk_1E5ACD8E0;
  id v21 = v14;
  id v22 = v15;
  id v18 = v15;
  id v19 = v14;
  [v16 favoriteArtistWithPersistentID:a3 cloudLibraryID:v19 time:v12 configuration:v17 completionHandler:v20];
}

void __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Favoriting artist with cloud=%{public}@ failed with error: %{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_47;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite artist with cloudID=%{public}@} with error: %{public}@", buf, 0x16u);
    }
  }
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_48;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __86__ICCloudClient_favoriteArtistWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  __int16 v13 = [(ICCloudClient *)self xpcConnection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke;
  v23[3] = &unk_1E5ACD8E0;
  id v14 = v10;
  id v24 = v14;
  id v15 = v11;
  id v25 = v15;
  id v16 = [v13 remoteObjectProxyWithErrorHandler:v23];
  id v17 = [(ICCloudClient *)self configuration];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_2;
  v20[3] = &unk_1E5ACD8E0;
  id v21 = v14;
  id v22 = v15;
  id v18 = v15;
  id v19 = v14;
  [v16 favoriteAlbumWithPersistentID:a3 cloudLibraryID:v19 time:v12 configuration:v17 completionHandler:v20];
}

void __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Favoriting album with cloud=%{public}@ failed with error: %{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_45;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite album with cloudID=%{public}@} with error: %{public}@", buf, 0x16u);
    }
  }
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_46;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __85__ICCloudClient_favoriteAlbumWithPersistentID_cloudLibraryID_time_completionHandler___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = [(ICCloudClient *)self xpcConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke;
  v22[3] = &unk_1E5ACAB28;
  int64_t v24 = a4;
  id v15 = v12;
  id v23 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v22];
  id v17 = [(ICCloudClient *)self configuration];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_2;
  v19[3] = &unk_1E5ACAB28;
  id v20 = v15;
  int64_t v21 = a4;
  id v18 = v15;
  [v16 favoriteEntityWithPersistentID:a3 sagaID:a4 entityType:a5 time:v13 configuration:v17 completionHandler:v19];
}

void __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Favoriting entity with cloud=%lld failed with error: %{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_43;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite entity with itemIdentifiers=%lld with error: %{public}@", buf, 0x16u);
    }
  }
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_44;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __89__ICCloudClient_favoriteEntityWithPersistentID_sagaID_entityType_time_completionHandler___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  __int16 v13 = [(ICCloudClient *)self xpcConnection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke;
  v23[3] = &unk_1E5ACD8E0;
  id v14 = v10;
  id v24 = v14;
  id v15 = v11;
  id v25 = v15;
  id v16 = [v13 remoteObjectProxyWithErrorHandler:v23];
  id v17 = [(ICCloudClient *)self configuration];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_2;
  v20[3] = &unk_1E5ACD8E0;
  id v21 = v14;
  id v22 = v15;
  id v18 = v15;
  id v19 = v14;
  [v16 favoritePlaylistWithPersistentID:a3 globalID:v19 time:v12 configuration:v17 completionHandler:v20];
}

void __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Favoriting entity with globalPlaylistID=%{public}@ failed with error: %{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_41;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite entity with globalPlaylistID=%{public}@ with error: %{public}@", buf, 0x16u);
    }
  }
  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_42;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __82__ICCloudClient_favoritePlaylistWithPersistentID_globalID_time_completionHandler___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = [(ICCloudClient *)self xpcConnection];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke;
  v22[3] = &unk_1E5ACAB28;
  int64_t v24 = a4;
  id v15 = v12;
  id v23 = v15;
  id v16 = [v14 remoteObjectProxyWithErrorHandler:v22];
  id v17 = [(ICCloudClient *)self configuration];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_2;
  v19[3] = &unk_1E5ACAB28;
  id v20 = v15;
  int64_t v21 = a4;
  id v18 = v15;
  [v16 favoriteEntityWithPersistentID:a3 storeID:a4 entityType:a5 time:v13 configuration:v17 completionHandler:v19];
}

void __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Favoriting entity with storeID=%lld failed with error: %{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_39;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

void __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v12 = v5;
      __int16 v13 = 2114;
      id v14 = v3;
      _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Failed to favorite entity with itemIdentifiers=%lld with error: %{public}@", buf, 0x16u);
    }
  }
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_40;
    v8[3] = &unk_1E5ACD2F0;
    id v10 = v6;
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __90__ICCloudClient_favoriteEntityWithPersistentID_storeID_entityType_time_completionHandler___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = [(ICCloudClient *)self xpcConnection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke;
  v23[3] = &unk_1E5ACAC90;
  id v17 = v12;
  id v24 = v17;
  id v18 = [v16 remoteObjectProxyWithErrorHandler:v23];
  id v19 = [(ICCloudClient *)self configuration];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_2;
  v21[3] = &unk_1E5ACA8D0;
  id v22 = v17;
  id v20 = v17;
  [v18 addGeniusPlaylistWithPersistentID:a3 name:v15 seedItemSagaIDs:v14 itemSagaIDs:v13 configuration:v19 completion:v21];
}

void __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Create cloud genius playlist failed with error: %{public}@", buf, 0xCu);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_37;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "Failed to create Genius playlist with error: %{public}@", buf, 0xCu);
    }
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_38;
    block[3] = &unk_1E5ACA780;
    id v11 = v7;
    uint64_t v12 = a2;
    id v10 = v5;
    dispatch_async(v8, block);
  }
}

uint64_t __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_38(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __102__ICCloudClient_addGeniusPlaylistWithPersistentID_name_seedItemSagaIDs_itemSagaIDs_completionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  id v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 hideItemsWithPurchaseHistoryIDs:v7 configuration:v11 completion:v13];
}

void __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Hide items from purchase history failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_36;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __67__ICCloudClient_hideItemsWithPurchaseHistoryIDs_completionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeItemsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  id v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 removeItemsWithSagaIDs:v7 configuration:v11 completion:v13];
}

void __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Remove cloud items from library failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_35;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __58__ICCloudClient_removeItemsWithSagaIDs_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removePlaylistsWithSagaIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  id v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5ACAC90;
  id v14 = v9;
  id v12 = v9;
  [v10 removePlaylistsWithSagaIDs:v7 configuration:v11 completion:v13];
}

void __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Remove cloud playlists from library failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_34;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __62__ICCloudClient_removePlaylistsWithSagaIDs_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addStorePlaylistWithGlobalID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  id v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5AC7560;
  id v14 = v9;
  id v12 = v9;
  [v10 addStorePlaylistWithGlobalID:v7 configuration:v11 completion:v13];
}

void __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Add store playlist to library failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_33;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_3;
    block[3] = &unk_1E5ACD250;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __64__ICCloudClient_addStorePlaylistWithGlobalID_completionHandler___block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICCloudClient *)self xpcConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke;
  v15[3] = &unk_1E5ACAC90;
  id v9 = v6;
  id v16 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v15];
  id v11 = [(ICCloudClient *)self configuration];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5AC7560;
  id v14 = v9;
  id v12 = v9;
  objc_msgSend(v10, "sdk_addStoreItemWithOpaqueID:configuration:completion:", v7, v11, v13);
}

void __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "SDK: Add store item to library failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_32;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_3;
    block[3] = &unk_1E5ACD250;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __64__ICCloudClient_sdk_addStoreItemWithOpaqueID_completionHandler___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 completionHandler:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (a3 <= 0)
  {
    id v14 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v20 = a3;
      _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "Must provide a valid adam ID (%lld) adding to library.", buf, 0xCu);
    }

    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
  else
  {
    id v10 = [(ICCloudClient *)self xpcConnection];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke;
    v17[3] = &unk_1E5ACAC90;
    id v11 = v9;
    id v18 = v11;
    id v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
    id v13 = [(ICCloudClient *)self configuration];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_2;
    v15[3] = &unk_1E5AC7560;
    id v16 = v11;
    [v12 addStoreItemWithAdamID:a3 referral:v8 configuration:v13 completion:v15];
  }
}

void __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Add store item to library failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_31;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_3;
    block[3] = &unk_1E5ACD250;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __67__ICCloudClient_addStoreItemWithAdamID_referral_completionHandler___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)updatePinnedSubscribedPlaylistsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCloudClient *)self xpcConnection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke;
  v12[3] = &unk_1E5ACAC90;
  id v6 = v4;
  id v13 = v6;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v12];
  id v8 = [(ICCloudClient *)self configuration];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E5ACAC90;
  id v11 = v6;
  id v9 = v6;
  [v7 updatePinnedSubscribedPlaylistsWithConfiguration:v8 completion:v10];
}

void __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Update pinned subscribed playlists failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_30;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __63__ICCloudClient_updatePinnedSubscribedPlaylistsWithCompletion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(ICCloudClient *)self xpcConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke;
  v17[3] = &unk_1E5ACAC90;
  id v11 = v8;
  id v18 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  id v13 = [(ICCloudClient *)self configuration];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5ACAC90;
  id v16 = v11;
  id v14 = v11;
  [v12 updateSubscribedPlaylistsWithSagaIDs:v9 ignoreMinRefreshInterval:v5 configuration:v13 completion:v15];
}

void __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Update subscribed playlists failed with error: %{public}@", buf, 0xCu);
  }

  BOOL v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_29;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    BOOL v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __97__ICCloudClient_updateSubscribedPlaylistsWithSagaIDs_ignoreMinRefreshInterval_completionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ICCloudClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACAC90;
  id v8 = v6;
  id v15 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  id v10 = [(ICCloudClient *)self configuration];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5ACAC90;
  id v13 = v8;
  id v11 = v8;
  [v9 uploadArtworkForPlaylistWithPersistentID:a3 configuration:v10 completion:v12];
}

void __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Upload playlist artwork failed with error: %{public}@", buf, 0xCu);
  }

  BOOL v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_28;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    BOOL v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__ICCloudClient_uploadArtworkForPlaylistWithPersistentID_completionHandler___block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)publishPlaylistWithSagaID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ICCloudClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACAC90;
  id v8 = v6;
  id v15 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  id v10 = [(ICCloudClient *)self configuration];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5AC7588;
  id v13 = v8;
  id v11 = v8;
  [v9 publishPlaylistWithSagaID:a3 configuration:v10 completion:v12];
}

void __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Publish cloud playlist failed with error: %{public}@", buf, 0xCu);
  }

  BOOL v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_26;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    id v11 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_3;
    v12[3] = &unk_1E5ACD2A0;
    id v16 = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, v12);
  }
}

uint64_t __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

uint64_t __61__ICCloudClient_publishPlaylistWithSagaID_completionHandler___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)sdk_addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [(ICCloudClient *)self xpcConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v16[3] = &unk_1E5ACAC90;
  id v10 = v8;
  id v17 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v16];
  uint64_t v12 = [(ICCloudClient *)self configuration];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5ACAC90;
  id v15 = v10;
  id v13 = v10;
  objc_msgSend(v11, "sdk_addItemWithSagaID:toPlaylistWithPersistentID:configuration:completion:", a3, a4, v12, v14);
}

void __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "SDK: Add saga id to playlist failed with error: %{public}@", buf, 0xCu);
  }

  BOOL v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_25;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    BOOL v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __84__ICCloudClient_sdk_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(ICCloudClient *)self xpcConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v17[3] = &unk_1E5ACAC90;
  id v11 = v8;
  id v18 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  id v13 = [(ICCloudClient *)self configuration];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v15[3] = &unk_1E5AC7560;
  id v16 = v11;
  id v14 = v11;
  objc_msgSend(v12, "sdk_addStoreItemWithOpaqueID:toPlaylistWithPersistentID:configuration:completion:", v9, a4, v13, v15);
}

void __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "SDK: Add store item to playlist failed with error: %{public}@", buf, 0xCu);
  }

  BOOL v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_23;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v7)
  {
    id v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_3;
    block[3] = &unk_1E5ACD250;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

uint64_t __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __91__ICCloudClient_sdk_addStoreItemWithOpaqueID_toPlaylistWithPersistentID_completionHandler___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [(ICCloudClient *)self xpcConnection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v16[3] = &unk_1E5ACAC90;
  id v10 = v8;
  id v17 = v10;
  id v11 = [v9 remoteObjectProxyWithErrorHandler:v16];
  id v12 = [(ICCloudClient *)self configuration];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v14[3] = &unk_1E5ACAC90;
  id v15 = v10;
  id v13 = v10;
  [v11 addItemWithSagaID:a3 toPlaylistWithPersistentID:a4 configuration:v12 completion:v14];
}

void __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Add saga id to playlist failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_22;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __80__ICCloudClient_addItemWithSagaID_toPlaylistWithPersistentID_completionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [(ICCloudClient *)self xpcConnection];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke;
  v19[3] = &unk_1E5ACAC90;
  id v13 = v10;
  id v20 = v13;
  id v14 = [v12 remoteObjectProxyWithErrorHandler:v19];
  id v15 = [(ICCloudClient *)self configuration];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_2;
  v17[3] = &unk_1E5ACAC90;
  id v18 = v13;
  id v16 = v13;
  [v14 addStoreItemWithAdamID:a3 referral:v11 toPlaylistWithPersistentID:a5 configuration:v15 completion:v17];
}

void __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Add store item to playlist failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_21;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __94__ICCloudClient_addStoreItemWithAdamID_referral_toPlaylistWithPersistentID_completionHandler___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sdk_setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6
{
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a6;
  id v13 = v12;
  if (v10 | v11)
  {
    id v14 = [(ICCloudClient *)self xpcConnection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke;
    v20[3] = &unk_1E5ACAC90;
    id v15 = v13;
    id v21 = v15;
    id v16 = [v14 remoteObjectProxyWithErrorHandler:v20];
    id v17 = [(ICCloudClient *)self configuration];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5ACAC90;
    id v19 = v15;
    objc_msgSend(v16, "sdk_setPlaylistProperties:trackList:forPlaylistPersistentID:configuration:completion:", v10, v11, a5, v17, v18);
  }
  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

void __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "SDK Set cloud playlist properties failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_20;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __95__ICCloudClient_sdk_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 completionHandler:(id)a6
{
  unint64_t v10 = (unint64_t)a3;
  unint64_t v11 = (unint64_t)a4;
  id v12 = a6;
  id v13 = v12;
  if (v10 | v11)
  {
    id v14 = [(ICCloudClient *)self xpcConnection];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke;
    v20[3] = &unk_1E5ACAC90;
    id v15 = v13;
    id v21 = v15;
    id v16 = [v14 remoteObjectProxyWithErrorHandler:v20];
    id v17 = [(ICCloudClient *)self configuration];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_2;
    v18[3] = &unk_1E5ACAC90;
    id v19 = v15;
    [v16 setPlaylistProperties:v10 trackList:v11 forPlaylistPersistentID:a5 configuration:v17 completion:v18];
  }
  else if (v12)
  {
    (*((void (**)(id, void))v12 + 2))(v12, 0);
  }
}

void __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Set cloud playlist properties failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_19;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __91__ICCloudClient_setPlaylistProperties_trackList_forPlaylistPersistentID_completionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)sdk_createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 tracklist:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 objectForKey:@"name"];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    id v15 = [(ICCloudClient *)self xpcConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke;
    v23[3] = &unk_1E5ACAC90;
    id v16 = v12;
    id v24 = v16;
    id v17 = [v15 remoteObjectProxyWithErrorHandler:v23];
    id v18 = [(ICCloudClient *)self configuration];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_2;
    v21[3] = &unk_1E5ACA8D0;
    id v22 = v16;
    objc_msgSend(v17, "sdk_createPlaylistWithPersistentID:properties:trackList:configuration:completion:", a3, v10, v11, v18, v21);

    id v19 = v24;
LABEL_7:

    goto LABEL_8;
  }
  id v20 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "Must provide at least a playlist name when creating a playlist.", buf, 2u);
  }

  if (v12)
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ic_cloudClientErrorWithCode:userInfo:", 2015, 0);
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v19);
    goto LABEL_7;
  }
LABEL_8:
}

void __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "SDK: Create cloud playlist failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_18;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_3;
  block[3] = &unk_1E5ACA780;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __91__ICCloudClient_sdk_createPlaylistWithPersistentID_properties_tracklist_completionHandler___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 objectForKey:@"name"];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    id v15 = [(ICCloudClient *)self xpcConnection];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke;
    v23[3] = &unk_1E5ACAC90;
    id v16 = v12;
    id v24 = v16;
    id v17 = [v15 remoteObjectProxyWithErrorHandler:v23];
    id v18 = [(ICCloudClient *)self configuration];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_2;
    v21[3] = &unk_1E5ACA8D0;
    id v22 = v16;
    [v17 createPlaylistWithPersistentID:a3 properties:v10 trackList:v11 configuration:v18 completion:v21];

    id v19 = v24;
LABEL_7:

    goto LABEL_8;
  }
  id v20 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v20, OS_LOG_TYPE_ERROR, "Must provide at least a playlist name when creating a playlist.", buf, 2u);
  }

  if (v12)
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ic_cloudClientErrorWithCode:userInfo:", 2015, 0);
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v19);
    goto LABEL_7;
  }
LABEL_8:
}

void __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Create cloud playlist failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_16;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_3;
    block[3] = &unk_1E5ACA780;
    id v10 = v6;
    uint64_t v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __87__ICCloudClient_createPlaylistWithPersistentID_properties_trackList_completionHandler___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ICCloudClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACAC90;
  id v8 = v6;
  id v15 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  id v10 = [(ICCloudClient *)self configuration];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5ACAC90;
  id v13 = v8;
  id v11 = v8;
  [v9 setCloudFavoriteSongAddToLibraryBehavior:a3 forConfiguration:v10 completion:v12];
}

void __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Set cloud favorite-to-library behavior failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_13;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __76__ICCloudClient_setCloudFavoriteSongAddToLibraryBehavior_completionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(ICCloudClient *)self xpcConnection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke;
  v14[3] = &unk_1E5ACAC90;
  id v8 = v6;
  id v15 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v14];
  id v10 = [(ICCloudClient *)self configuration];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_2;
  v12[3] = &unk_1E5ACAC90;
  id v13 = v8;
  id v11 = v8;
  [v9 setCloudAddToPlaylistBehavior:a3 forConfiguration:v10 completion:v12];
}

void __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "Set cloud add-to-playlist behavior failed with error: %{public}@", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_11;
    v7[3] = &unk_1E5ACD2F0;
    id v9 = v5;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    _DWORD v6[2] = __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5ACD2F0;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

uint64_t __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __65__ICCloudClient_setCloudAddToPlaylistBehavior_completionHandler___block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)performBlockAfterServerSetup:(id)a3
{
  id v4 = a3;
  serverSetupBlockQueue = self->_serverSetupBlockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ICCloudClient_performBlockAfterServerSetup___block_invoke;
  v7[3] = &unk_1E5ACD2F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serverSetupBlockQueue, v7);
}

void __46__ICCloudClient_performBlockAfterServerSetup___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) serverIsSetup])
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 96);
    id v4 = (void *)MEMORY[0x1A6240BF0](*(void *)(a1 + 40));
    [v3 addObject:v4];

    id v5 = [*(id *)(a1 + 32) xpcConnection];

    if (!v5)
    {
      id v6 = os_log_create("com.apple.amp.iTunesCloud", "CloudClient");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 96) count];
        int v8 = 134217984;
        uint64_t v9 = v7;
        _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "xpcConnection=nil. %lu pending blocks may not execute.", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

- (ICCloudClient)initWithUserIdentity:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ICConnectionConfiguration alloc] initWithUserIdentity:v4];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [(ICCloudClient *)self initWithConfiguration:v5];

  return v6;
}

@end