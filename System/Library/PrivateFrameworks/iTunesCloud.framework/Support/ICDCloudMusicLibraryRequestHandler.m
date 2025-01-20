@interface ICDCloudMusicLibraryRequestHandler
+ (id)handler;
+ (id)handlers;
- (BOOL)_isNativeMusicAppInstalled;
- (BOOL)_wasRestoredFromCloudBackup:(id)a3;
- (BOOL)isUpdatingCloudLibrary;
- (BOOL)shouldIncludeMediaKindSongForJaliscoImport;
- (ICDCloudMusicLibraryRequestHandler)initWithConfiguration:(id)a3;
- (id)_cloudSourcesToRemoveForReason:(int64_t)a3;
- (id)_prepareLibraryLoadErrorWithJaliscoError:(id)a3 sagaError:(id)a4;
- (int64_t)_canEnableCloudMusicLibraryOnPlatformsWithSideLoadedMediaContentWithProperties:(id)a3 includeLocalContentCheck:(BOOL)a4;
- (int64_t)_getCurrentSubscriptionStatusForReason:(int64_t)a3;
- (int64_t)_shouldHandleDaemonStartupOrAccountChangedNotificationWithProperties:(id)a3;
- (void)_adjustMergePreferenceWithUserIdentityProperties:(id)a3;
- (void)_authenticateAndStartInitialImportWithMergePreference:(id)a3 userIdentityProperties:(id)a4 enableReason:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)_enqueueCloudUpdateLibraryOperationForReason:(int64_t)a3;
- (void)_enqueueSubscriptionStatusCheckForReason:(int64_t)a3;
- (void)_handleMusicSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_handleSagaAuthentication:(id)a3 finishedForReason:(int64_t)a4 explicitUserAction:(BOOL)a5 shouldStartInitialImport:(BOOL)a6 completionHandler:(id)a7;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_performInitialJaliscoImportWithClientIdentity:(id)a3 completion:(id)a4;
- (void)_performInitialSagaImportWithClientIdentity:(id)a3 allowingNoisyAuthPrompt:(BOOL)a4 completionHandler:(id)a5;
- (void)_performJaliscoImportWithClientIdentity:(id)a3 byAddingMediaKind:(int64_t)a4 completionHandler:(id)a5;
- (void)_postLibraryUpdateProgressChangedForLibraryType:(int64_t)a3;
- (void)_registerDeviceAndPerformInitialImportWithUserIdentityProperties:(id)a3 cloudLibraryEnableReason:(int64_t)a4 completionHandler:(id)a5;
- (void)_reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)_removeCloudSourcesForReason:(int64_t)a3 withClientIdentity:(id)a4 byDisablingActiveLockerAccount:(BOOL)a5 completionHandler:(id)a6;
- (void)_resetInternalCloudLibraryState;
- (void)_retryEnablingCloudMusicLibraryForReason:(int64_t)a3;
- (void)_runSagaAuthenticateOperationWithClientIdentity:(id)a3 mergePreference:(id)a4 allowNoisyPrompt:(BOOL)a5 cloudLibraryEnableReason:(int64_t)a6 completionHandler:(id)a7;
- (void)_runSubscriptionStatusCheckOperationWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)_tryEnablingCloudMusicLibraryForReason:(int64_t)a3 completionHandler:(id)a4;
- (void)_tryEnablingICMLOnDevicesSupportingSideLoadedContentWithProperties:(id)a3 reason:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)_updateAutomaticDownloadsPreference;
- (void)addBackgroundOperation:(id)a3 forLibraryType:(int64_t)a4 priority:(int)a5;
- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addOperation:(id)a3 forLibraryType:(int64_t)a4 priority:(int)a5;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addStoreItemWithOpaqueID:(id)a3 requestingBundleID:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addStorePlaylistWithGlobalID:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)becomeActive;
- (void)becomeInactiveWithDeauthentication:(BOOL)a3 completion:(id)a4;
- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5;
- (void)cancelPendingChangesForLibraryType:(int64_t)a3;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 requestingBundleID:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3;
- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3;
- (void)disableCloudLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5;
- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6;
- (void)enableCloudLibraryWithClientIdentity:(id)a3 startInitialImport:(BOOL)a4 enableCloudLibraryPolicy:(int64_t)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7;
- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)finishedUpdateOperationForLibraryType:(int64_t)a3 withResponse:(id)a4;
- (void)handleMusicAppInstalled;
- (void)handleMusicAppRemovedWithCompletion:(id)a3;
- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importContainerArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 clientIdentity:(id)a4 completion:(id)a5;
- (void)isUpdatingCloudLibraryWithCompletion:(id)a3;
- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5;
- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadBooksForStoreIDs:(id)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5;
- (void)loadGeniusItemsForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadLastKnownEnableICMLStatusWithCompletionHandler:(id)a3;
- (void)loadMissingArtworkWithClientIdentity:(id)a3;
- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadScreenshotInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)publishPlaylistWithSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5;
- (void)removeItemsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeLibraryWithClientIdentity:(id)a3 completion:(id)a4;
- (void)removePlaylistsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6;
- (void)scheduleBackgroundTaskToUpdateLibraryType:(int64_t)a3;
- (void)setAlbumArtistProperties:(id)a3 withArtistPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setAlbumEntityProperties:(id)a3 withAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setAlbumProperties:(id)a3 forItemsWithAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7 completionHandler:(id)a8;
- (void)setUpdateProgress:(float)a3 forLibraryType:(int64_t)a4;
- (void)startingUpdateOperationForLibraryType:(int64_t)a3 isInitialImport:(BOOL)a4;
- (void)updateCloudLibraryProgressWithCompletion:(id)a3;
- (void)updateItemPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4;
- (void)updateJaliscoLibraryWithClientIdentity:(id)a3 forReason:(int64_t)a4 completionHandler:(id)a5;
- (void)updateLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)updatePlaylistPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4;
- (void)updateProgressForLibraryType:(int64_t)a3 completionHandler:(id)a4;
- (void)updateSagaLibraryWithClientIdentity:(id)a3 forReason:(int64_t)a4 allowNoisyAuthPrompt:(BOOL)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7;
- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 requestReason:(int64_t)a5 pinnedOnly:(BOOL)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation ICDCloudMusicLibraryRequestHandler

- (void)finishedUpdateOperationForLibraryType:(int64_t)a3 withResponse:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007158;
  block[3] = &unk_1001BDCF8;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)updateJaliscoLibraryWithClientIdentity:(id)a3 forReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010DC4;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)isUpdatingCloudLibraryWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E3D0;
  v7[3] = &unk_1001BEC48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

+ (id)handlers
{
  if (qword_1001F3770 != -1) {
    dispatch_once(&qword_1001F3770, &stru_1001B9A50);
  }
  v2 = (void *)qword_1001F3768;

  return v2;
}

- (BOOL)shouldIncludeMediaKindSongForJaliscoImport
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  if (sub_100010724())
  {
    v3 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *((unsigned __int8 *)v21 + 24);
      *(_DWORD *)buf = 138543618;
      v25 = self;
      __int16 v26 = 1024;
      LODWORD(v27) = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ includeMediaKindSong=%{BOOL}u on non standalone wOS platform", buf, 0x12u);
    }
  }
  else
  {
    v5 = [(BaseRequestHandler *)self userIdentityStore];
    id v6 = [(BaseRequestHandler *)self userIdentity];
    id v19 = 0;
    v7 = [v5 getPropertiesForUserIdentity:v6 error:&v19];
    v3 = v19;

    if (v3 || !v7)
    {
      id v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v25 = self;
        __int16 v26 = 2114;
        v27 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ could not load user identity properties. error=%{public}@", buf, 0x16u);
      }

      unsigned __int8 v8 = 0;
    }
    else
    {
      unsigned __int8 v8 = [v7 isActiveLocker];
    }
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = [(BaseRequestHandler *)self configuration];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E748;
    v15[3] = &unk_1001B9D90;
    unsigned __int8 v18 = v8;
    v15[4] = self;
    v17 = &v20;
    id v12 = v10;
    int64_t v16 = v12;
    sub_100010794(v11, v15);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }

  char v13 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (void)_postLibraryUpdateProgressChangedForLibraryType:(int64_t)a3
{
  if (a3 == 1)
  {
    notify_post("com.apple.itunescloudd.sagaUpdateInProgressChanged");
  }
  else
  {
    v9[10] = v3;
    v9[11] = v4;
    v7 = [(BaseRequestHandler *)self userIdentityStore];
    unsigned __int8 v8 = [(BaseRequestHandler *)self userIdentity];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010558;
    v9[3] = &unk_1001BA0D8;
    v9[4] = self;
    v9[5] = a3;
    [v7 getPropertiesForUserIdentity:v8 completionHandler:v9];
  }
}

- (void)startingUpdateOperationForLibraryType:(int64_t)a3 isInitialImport:(BOOL)a4
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000803C;
  block[3] = &unk_1001B9DB8;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(accessQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncProgressDictionary, 0);
  objc_storeStrong((id *)&self->_retryQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_subscriptionRequestHandler, 0);
  objc_storeStrong((id *)&self->_jaliscoRequestHandler, 0);

  objc_storeStrong((id *)&self->_sagaRequestHandler, 0);
}

- (void)_updateAutomaticDownloadsPreference
{
  uint64_t v3 = +[ICDefaults standardDefaults];
  unsigned int v4 = [v3 automaticDownloadsEnabled];

  v5 = +[ACAccountStore ic_sharedAccountStore];
  BOOL v6 = [(BaseRequestHandler *)self configuration];
  v7 = [v6 userIdentity];
  unsigned __int8 v8 = [v7 accountDSID];
  id v9 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 longLongValue]);
  id v32 = 0;
  dispatch_semaphore_t v10 = objc_msgSend(v5, "ic_storeAccountForStoreAccountID:error:", v9, &v32);
  id v11 = v32;

  if (!v10)
  {
    v17 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [(BaseRequestHandler *)self configuration];
      char v23 = [v22 userIdentity];
      *(_DWORD *)buf = 138543618;
      v34 = v23;
      __int16 v35 = 2114;
      id v36 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Could not get account for userIdentity=%{public}@, error=%{public}@ - not updating Automatic Downloads preference", buf, 0x16u);
    }
    goto LABEL_13;
  }
  unsigned int v12 = objc_msgSend(v10, "ic_isAutomaticDownloadsEnabledForMediaKindMusic");
  if (((v12 ^ 1 | v4) & 1) == 0)
  {
    v24 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Automatic downloads are enabled on the account, but not internally - removing it from the account", buf, 2u);
    }

    id v25 = objc_alloc((Class)ICStoreRequestContext);
    __int16 v26 = [(BaseRequestHandler *)self configuration];
    v27 = [v26 userIdentity];
    v17 = [v25 initWithIdentity:v27];

    id v28 = objc_alloc((Class)ICUpdateAutomaticDownloadMediaKindsRequest);
    v29 = +[ICUpdateAutomaticDownloadMediaKindsRequest automaticDownloadMediaKindsForMusic];
    id v20 = [v28 initWithRequestContext:v17 mediaKindsToAdd:0 mediaKindsToRemove:v29];

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100014090;
    v31[3] = &unk_1001BE408;
    v31[4] = self;
    v21 = v31;
    goto LABEL_12;
  }
  if (((v12 | v4 ^ 1) & 1) == 0)
  {
    char v13 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Automatic downloads are enabled internally but not on the account - setting it on the account", buf, 2u);
    }

    id v14 = objc_alloc((Class)ICStoreRequestContext);
    id v15 = [(BaseRequestHandler *)self configuration];
    int64_t v16 = [v15 userIdentity];
    v17 = [v14 initWithIdentity:v16];

    id v18 = objc_alloc((Class)ICUpdateAutomaticDownloadMediaKindsRequest);
    id v19 = +[ICUpdateAutomaticDownloadMediaKindsRequest automaticDownloadMediaKindsForMusic];
    id v20 = [v18 initWithRequestContext:v17 mediaKindsToAdd:v19 mediaKindsToRemove:0];

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100014164;
    v30[3] = &unk_1001BE408;
    v30[4] = self;
    v21 = v30;
LABEL_12:
    [v20 performRequestWithCompletionHandler:v21];

LABEL_13:
  }
}

- (id)_cloudSourcesToRemoveForReason:(int64_t)a3
{
  if ((unint64_t)(a3 + 11) <= 0xA)
  {
    if (((1 << (a3 + 11)) & 0x76A) != 0)
    {
      +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1001CBAF8, &off_1001CBB28, 0, v5);
      uint64_t v3 = LABEL_4:;
      goto LABEL_5;
    }
    if (a3 == -11)
    {
      +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_1001CBAF8, &off_1001CBAE0, &off_1001CBB40, 0);
      goto LABEL_4;
    }
  }
  uint64_t v3 = +[NSSet setWithObject:&off_1001CBAF8];
LABEL_5:

  return v3;
}

- (void)_handleSagaAuthentication:(id)a3 finishedForReason:(int64_t)a4 explicitUserAction:(BOOL)a5 shouldStartInitialImport:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = v13;
  if (v12)
  {
    self->_isPendingAuthentication = 0;
    id v15 = dispatch_group_create();
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = sub_100014764;
    v47[4] = sub_100014774;
    id v48 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_100014764;
    v45[4] = sub_100014774;
    id v46 = 0;
    self->_havePendingSagaUpdate = 1;
    id v16 = [v12 status];
    v17 = [v12 error];
    id v18 = [v12 authenticateFailureCode];
    id v26 = [v18 integerValue];

    id v19 = [v12 clientIdentity];
    id v20 = &OBJC_INSTANCE_METHODS_UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation;
    if (v16 != (id)1)
    {
LABEL_13:
      accessQueue = self->_accessQueue;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = v20[77];
      v27[2] = sub_100014AD4;
      v27[3] = &unk_1001BA178;
      v27[4] = self;
      id v28 = v19;
      BOOL v36 = v9;
      id v33 = v16;
      int64_t v34 = a4;
      v31 = v45;
      id v32 = v47;
      id v35 = v26;
      id v29 = v17;
      id v30 = v14;
      id v24 = v17;
      id v25 = v19;
      dispatch_group_notify(v15, accessQueue, v27);

      _Block_object_dispose(v45, 8);
      _Block_object_dispose(v47, 8);

      goto LABEL_14;
    }
    dispatch_group_enter(v15);
    if (!a4 || v9)
    {
      self->_didManuallyReloadCloudLibrary = 1;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10001477C;
      v41[3] = &unk_1001BA100;
      v41[4] = self;
      v43 = v47;
      int64_t v44 = a4;
      v42 = v15;
      [(ICDCloudMusicLibraryRequestHandler *)self _performJaliscoImportWithClientIdentity:v19 byAddingMediaKind:1 completionHandler:v41];
      v21 = v42;
    }
    else
    {
      if (!v8)
      {
        dispatch_group_leave(v15);
        goto LABEL_12;
      }
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10001493C;
      v37[3] = &unk_1001BA100;
      v37[4] = self;
      v39 = v47;
      int64_t v40 = a4;
      v38 = v15;
      [(ICDCloudMusicLibraryRequestHandler *)self _performInitialJaliscoImportWithClientIdentity:v19 completion:v37];
      v21 = v38;
    }

LABEL_12:
    id v20 = &OBJC_INSTANCE_METHODS_UpdateArtistStoreIDsByBulkLibraryMatchLookupOperation;
    goto LABEL_13;
  }
  if (v13)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000146E8;
    block[3] = &unk_1001BEC70;
    v50 = v13;
    dispatch_async(calloutQueue, block);
    id v15 = v50;
LABEL_14:
  }
}

- (id)_prepareLibraryLoadErrorWithJaliscoError:(id)a3 sagaError:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    v7 = +[NSMutableDictionary dictionary];
    BOOL v8 = v7;
    if (v5) {
      [v7 setObject:v5 forKey:@"ICDCloudLibraryJaliscoLibraryUpdateErrorKey"];
    }
    if (v6) {
      [v8 setObject:v6 forKey:@"ICDCloudLibrarySagaLibraryUpdateErrorKey"];
    }
    BOOL v9 = +[NSError errorWithDomain:ICErrorDomain code:0 userInfo:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_performInitialSagaImportWithClientIdentity:(id)a3 allowingNoisyAuthPrompt:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  dispatch_semaphore_t v10 = [(BaseRequestHandler *)self musicLibrary];
  id v11 = [v10 sagaOnDiskDatabaseRevision];

  id v12 = [(BaseRequestHandler *)self musicLibrary];
  unsigned int v13 = [v12 sagaNeedsFullUpdate];

  id v14 = [(BaseRequestHandler *)self musicLibrary];
  unsigned int v15 = [v14 sagaInitiateClientResetSync];

  if (MSVDeviceOSIsInternalInstall())
  {
    id v16 = +[ICDefaults standardDefaults];
    unsigned int v17 = [v16 shouldForceServerToUseDAAPDebugFeature];
  }
  else
  {
    unsigned int v17 = 0;
  }
  if (self->_sagaRequestHandler && (!v11 ? (int v18 = 1) : (int v18 = v13), (v18 | v17) == 1))
  {
    id v19 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      v31 = self;
      __int16 v32 = 1024;
      *(_DWORD *)id v33 = v11;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v13;
      *(_WORD *)&v33[10] = 1024;
      *(_DWORD *)&v33[12] = v15;
      *(_WORD *)&v33[16] = 1024;
      *(_DWORD *)&v33[18] = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - performing initial saga update, sagaDatabaseVersion=%d, sagaNeedsFullUpdate=%{BOOL}u, sagaInitiateClientResetSync=%{BOOL}u, shouldForceServerToUseDAAPDebugFeature=%{BOOL}u", buf, 0x24u);
    }

    [(SagaRequestHandler *)self->_sagaRequestHandler updateLibraryWithClientIdentity:v8 reason:1 allowNoisyAuthPrompt:v6 isExplicitUserAction:v6 completionHandler:v9];
  }
  else
  {
    id v20 = +[ICDeviceInfo currentDeviceInfo];
    v21 = [v20 buildVersion];

    uint64_t v22 = [(BaseRequestHandler *)self musicLibrary];
    char v23 = [v22 sagaLastCloudUpdateClientBuildVersion];

    if ([v23 length]
      && (![v21 length] || (objc_msgSend(v21, "isEqualToString:", v23) & 1) != 0))
    {
      id v24 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        sagaRequestHandler = self->_sagaRequestHandler;
        *(_DWORD *)buf = 138544386;
        v31 = self;
        __int16 v32 = 1024;
        *(_DWORD *)id v33 = v11;
        *(_WORD *)&v33[4] = 2114;
        *(void *)&v33[6] = v21;
        *(_WORD *)&v33[14] = 2114;
        *(void *)&v33[16] = v23;
        __int16 v34 = 2048;
        id v35 = sagaRequestHandler;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ - not performing initial saga import. sagaDatabaseVersion=%d, currentBuildVersion=%{public}@, sagaCloudUpdateClientBuildVersion=%{public}@, _sagaRequestHandler=%p", buf, 0x30u);
      }
    }
    else
    {
      id v26 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v31 = self;
        __int16 v32 = 2114;
        *(void *)id v33 = v21;
        *(_WORD *)&v33[8] = 2114;
        *(void *)&v33[10] = v23;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ - clearing last cloud update time as build versions are different currentBuildVersion=%{public}@, sagaCloudUpdateClientBuildVersion=%{public}@", buf, 0x20u);
      }

      id v24 = [(BaseRequestHandler *)self musicLibrary];
      [v24 setSagaLastLibraryUpdateTime:0];
    }

    if (v9)
    {
      calloutQueue = self->_calloutQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000155B4;
      block[3] = &unk_1001BEC70;
      id v29 = v9;
      dispatch_async(calloutQueue, block);
    }
  }
}

- (void)_performJaliscoImportWithClientIdentity:(id)a3 byAddingMediaKind:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  jaliscoRequestHandler = self->_jaliscoRequestHandler;
  if (jaliscoRequestHandler)
  {
    [(JaliscoRequestHandler *)jaliscoRequestHandler updateJaliscoLibraryWithClientIdentity:a3 byAddingMediaKind:a4 completionHandler:v8];
  }
  else
  {
    dispatch_semaphore_t v10 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_jaliscoRequestHandler;
      *(_DWORD *)buf = 138543874;
      id v16 = self;
      __int16 v17 = 1024;
      int v18 = a4;
      __int16 v19 = 2048;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - not reloading media purchase history by adding kind=%d, _jaliscoRequestHandler=%p", buf, 0x1Cu);
    }

    if (v8)
    {
      calloutQueue = self->_calloutQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001574C;
      block[3] = &unk_1001BEC70;
      id v14 = v8;
      dispatch_async(calloutQueue, block);
    }
  }
}

- (void)_performInitialJaliscoImportWithClientIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BaseRequestHandler *)self musicLibrary];
  id v9 = [v8 jaliscoOnDiskDatabaseRevision];

  unsigned int v10 = [(ICDCloudMusicLibraryRequestHandler *)self shouldIncludeMediaKindSongForJaliscoImport];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  if (sub_100010724() || !v10)
  {
    unsigned int v15 = 0;
    *((unsigned char *)v31 + 24) = 0;
  }
  else
  {
    id v11 = [(BaseRequestHandler *)self musicLibrary];
    id v12 = [v11 jaliscoLastSupportedMediaKinds];

    unsigned int v13 = [v12 componentsSeparatedByString:@","];
    id v14 = NSStringFromSelector("longLongValue");
    unsigned int v15 = [v13 valueForKey:v14];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100015BA4;
    v29[3] = &unk_1001BA0B0;
    v29[4] = &v30;
    [v15 enumerateObjectsUsingBlock:v29];
  }
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    jaliscoRequestHandler = self->_jaliscoRequestHandler;
    int v18 = *((unsigned __int8 *)v31 + 24);
    *(_DWORD *)buf = 138544642;
    id v35 = self;
    __int16 v36 = 1024;
    int v37 = (int)v9;
    __int16 v38 = 1024;
    unsigned int v39 = v10;
    __int16 v40 = 1024;
    int v41 = v18;
    __int16 v42 = 2114;
    v43 = v15;
    __int16 v44 = 2048;
    v45 = jaliscoRequestHandler;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - jaliscoDatabaseVersion=%d, shouldIncludeMediaKindSong=%{BOOL}u,reloadPurchaseHistoryIncludingMediaKindSong=%{BOOL}u, supportedMediaKinds=%{public}@, _jaliscoRequestHandler=%p", buf, 0x32u);
  }

  if (v9)
  {
    __int16 v19 = [(BaseRequestHandler *)self musicLibrary];
    if (([v19 jaliscoNeedsUpdateForTokens] & 1) != 0 || *((unsigned char *)v31 + 24))
    {
      BOOL v20 = self->_jaliscoRequestHandler == 0;

      if (!v20)
      {
        v21 = self->_jaliscoRequestHandler;
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  else
  {
    v21 = self->_jaliscoRequestHandler;
    if (v21)
    {
LABEL_13:
      if (*((unsigned char *)v31 + 24))
      {
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100015BF0;
        v27[3] = &unk_1001BF2B0;
        v27[4] = self;
        id v28 = v7;
        [(JaliscoRequestHandler *)v21 updateJaliscoLibraryWithClientIdentity:v6 byAddingMediaKind:1 completionHandler:v27];
      }
      else
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_100015CC4;
        v25[3] = &unk_1001BF2B0;
        v25[4] = self;
        id v26 = v7;
        [(JaliscoRequestHandler *)v21 updateLibraryWithClientIdentity:v6 reason:1 completionHandler:v25];
      }
      goto LABEL_19;
    }
  }
  if (v7)
  {
    calloutQueue = self->_calloutQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100015D98;
    v23[3] = &unk_1001BEC70;
    id v24 = v7;
    dispatch_async(calloutQueue, v23);
  }
LABEL_19:
  _Block_object_dispose(&v30, 8);
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  unsigned int v4 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
  unsigned int v5 = [v4 isMediaSyncingSupported];

  if (v5)
  {
    id v6 = [(BaseRequestHandler *)self userIdentityStore];
    id v7 = [(BaseRequestHandler *)self userIdentity];
    id v14 = 0;
    id v8 = [v6 getPropertiesForUserIdentity:v7 error:&v14];
    id v9 = v14;

    if (!v9 && v8)
    {
      unsigned __int8 v10 = [v8 isActiveLocker];
      accessQueue = self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000160FC;
      block[3] = &unk_1001BDD48;
      unsigned __int8 v13 = v10;
      void block[4] = self;
      dispatch_async(accessQueue, block);
    }
  }
  else
  {
    id v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - ignoring store did change notification", buf, 0xCu);
    }
  }
}

- (void)_removeCloudSourcesForReason:(int64_t)a3 withClientIdentity:(id)a4 byDisablingActiveLockerAccount:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  int deauthOperationCount = self->_deauthOperationCount;
  if (deauthOperationCount < 1 || a3 == -11 || a3 == -5)
  {
    BOOL v15 = a3 == -11;
    self->_int deauthOperationCount = deauthOperationCount + 1;
    id v16 = [(ICDCloudMusicLibraryRequestHandler *)self _cloudSourcesToRemoveForReason:a3];
    if (v15) {
      uint64_t v17 = MSVDeviceSupportsMultipleLibraries();
    }
    else {
      uint64_t v17 = 0;
    }
    int v18 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v46 = self;
      __int16 v47 = 1024;
      int v48 = v17;
      __int16 v49 = 1024;
      int v50 = v7;
      __int16 v51 = 2114;
      v52 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Running RemoveCloudSourcesOperation deletingDatabase:%{BOOL}u, disableActiveLockerAccount:%{BOOL}u, removeSources=%{public}@", buf, 0x22u);
    }

    __int16 v19 = [(BaseRequestHandler *)self configuration];
    BOOL v20 = +[BaseRequestHandler handlerForConfiguration:v19];
    [v20 cancelAllOperations];

    v21 = +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener];
    uint64_t v22 = [(BaseRequestHandler *)self configuration];
    [v21 removeContentTasteOperationsForConnectionConfiguration:v22];

    char v23 = self->_sagaRequestHandler;
    sagaRequestHandler = self->_sagaRequestHandler;
    self->_sagaRequestHandler = 0;

    [(ICDCloudMusicLibraryRequestHandler *)self _resetInternalCloudLibraryState];
    id v25 = [RemoveCloudSourcesOperation alloc];
    id v26 = [(BaseRequestHandler *)self configuration];
    v27 = [(CloudLibraryOperation *)v25 initWithConfiguration:v26 clientIdentity:v10];

    [(RemoveCloudSourcesOperation *)v27 setDeleteDB:v17];
    [(RemoveCloudSourcesOperation *)v27 setDisableActiveLockerAccount:v7];
    [(RemoveCloudSourcesOperation *)v27 setRemoveCloudSouceAttributes:v16];
    if ([v16 containsObject:&off_1001CBB28] && self->_jaliscoRequestHandler)
    {
      id v28 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v46 = self;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cancelling all Jalisco operations.", buf, 0xCu);
      }

      [(JaliscoRequestHandler *)self->_jaliscoRequestHandler cancelAllOperations];
    }
    id v29 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v23)
    {
      if (v30)
      {
        *(_DWORD *)buf = 138543362;
        id v46 = self;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cancelling all Saga operations.", buf, 0xCu);
      }

      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000168F4;
      v39[3] = &unk_1001BA088;
      __int16 v40 = v27;
      int v41 = self;
      id v42 = v11;
      [(SagaRequestHandler *)v23 cancelOperationsWithCompletionHandler:v39];
    }
    else
    {
      if (v30)
      {
        *(_DWORD *)buf = 138543362;
        id v46 = self;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ - No valid SagaRequestHandler - not cancelling pending SagaLibrary operations.", buf, 0xCu);
      }

      objc_initWeak((id *)buf, v27);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100016A18;
      v36[3] = &unk_1001BCD88;
      objc_copyWeak(&v38, (id *)buf);
      v36[4] = self;
      id v37 = v11;
      [(RemoveCloudSourcesOperation *)v27 setCompletionBlock:v36];
      [(RemoveCloudSourcesOperation *)v27 setName:@"com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.sagaDeauthenticateOperation"];
      v31 = +[ICDServer server];
      [v31 addOperation:v27 priority:2];

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    uint64_t v32 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = self->_deauthOperationCount;
      *(_DWORD *)buf = 138543874;
      id v46 = self;
      __int16 v47 = 1024;
      int v48 = v34;
      __int16 v49 = 1024;
      int v50 = a3;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ - We already have a pending deauthentication operation _deauthOperationCount=%d. Will not deauthenticate again for reason=%d.", buf, 0x18u);
    }

    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016864;
    block[3] = &unk_1001BEC70;
    id v44 = v11;
    dispatch_async(accessQueue, block);
    id v16 = v44;
  }
}

- (void)_runSagaAuthenticateOperationWithClientIdentity:(id)a3 mergePreference:(id)a4 allowNoisyPrompt:(BOOL)a5 cloudLibraryEnableReason:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (!self->_isPendingAuthentication)
  {
    self->_isPendingAuthentication = 1;
    __int16 v19 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v29 = self;
      __int16 v30 = 1024;
      unsigned int v31 = [v14 intValue];
      __int16 v32 = 1024;
      BOOL v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - Enqueueing CloudAuthenticateOperation shouldMerge:%d, allowNoisyPrompt:%{BOOL}u", buf, 0x18u);
    }

    BOOL v20 = [CloudAuthenticateOperation alloc];
    v21 = [(BaseRequestHandler *)self configuration];
    int v18 = [(CloudAuthenticateOperation *)v20 initWithConfiguration:v21 mergeToCloudLibraryPreference:v14 allowNoisyAuthPrompt:v9 enableLibraryReason:a6 clientIdentity:v13];

    objc_initWeak((id *)buf, v18);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100017040;
    v25[3] = &unk_1001BA060;
    objc_copyWeak(v27, (id *)buf);
    v25[4] = self;
    v27[1] = (id)a2;
    v27[2] = (id)a6;
    id v26 = v15;
    [(CloudAuthenticateOperation *)v18 setCompletionBlock:v25];
    [(CloudAuthenticateOperation *)v18 setName:@"com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.cloudAuthenticateOperation"];
    uint64_t v22 = +[ICDServer server];
    [v22 addOperation:v18 priority:2];

    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - We already have a pending authentication operation. Will not authenticate again.", buf, 0xCu);
  }

  if (v15)
  {
    accessQueue = self->_accessQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100017310;
    v23[3] = &unk_1001BEC70;
    id v24 = (CloudAuthenticateOperation *)v15;
    dispatch_async(accessQueue, v23);
    int v18 = v24;
LABEL_9:
  }
}

- (void)_tryEnablingCloudMusicLibraryForReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)ICAsyncBlockOperation);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000176D8;
  v10[3] = &unk_1001BA038;
  id v11 = v6;
  int64_t v12 = a3;
  v10[4] = self;
  id v8 = v6;
  id v9 = [v7 initWithStartHandler:v10];
  [(NSOperationQueue *)self->_operationQueue addOperation:v9];
}

- (void)_tryEnablingICMLOnDevicesSupportingSideLoadedContentWithProperties:(id)a3 reason:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v30 = self;
    __int16 v31 = 1024;
    int v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - checking to see if iCML can be enabled for reason=%d", buf, 0x12u);
  }

  if (a4 != 1 && self->_didHandleStartupNotificationReason)
  {
    int64_t v11 = 0;
    goto LABEL_11;
  }
  int64_t v11 = [(ICDCloudMusicLibraryRequestHandler *)self _shouldHandleDaemonStartupOrAccountChangedNotificationWithProperties:v8];
  if (v11 != 2)
  {
LABEL_11:
    switch([(ICDCloudMusicLibraryRequestHandler *)self _canEnableCloudMusicLibraryOnPlatformsWithSideLoadedMediaContentWithProperties:v8 includeLocalContentCheck:v11 == 0])
    {
      case 0:
        goto LABEL_19;
      case 1:
        id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        *(_DWORD *)buf = 138543618;
        __int16 v30 = self;
        __int16 v31 = 1024;
        int v32 = 1;
        id v16 = "%{public}@ - Not enabling ICML (status = %d)";
        uint64_t v17 = v15;
        uint32_t v18 = 18;
        goto LABEL_25;
      case 2:
        id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        BOOL v20 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 2)
        {
          if (v20)
          {
            *(_DWORD *)buf = 138543618;
            __int16 v30 = self;
            __int16 v31 = 1024;
            int v32 = 2;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ -  enabling ICML (status = %d)", buf, 0x12u);
          }

LABEL_19:
          [(ICDCloudMusicLibraryRequestHandler *)self _authenticateAndStartInitialImportWithMergePreference:0 userIdentityProperties:v8 enableReason:a4 withCompletionHandler:v9];
          goto LABEL_30;
        }
        if (v20)
        {
          *(_DWORD *)buf = 138543874;
          __int16 v30 = self;
          __int16 v31 = 1024;
          int v32 = a4;
          __int16 v33 = 1024;
          int v34 = 2;
          id v16 = "%{public}@ - Not enabling ICML for reason = %d, status = %d";
          uint64_t v17 = v15;
          uint32_t v18 = 24;
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        }
LABEL_26:
        char v19 = 0;
LABEL_27:

LABEL_28:
        v21 = [(BaseRequestHandler *)self configuration];
        uint64_t v22 = [v21 clientIdentity];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_1000196EC;
        v23[3] = &unk_1001B9FE8;
        void v23[4] = self;
        int64_t v25 = a4;
        id v24 = v9;
        char v26 = v19;
        [(ICDCloudMusicLibraryRequestHandler *)self _performInitialJaliscoImportWithClientIdentity:v22 completion:v23];

        id v14 = v24;
        break;
      case 3:
        id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          __int16 v30 = self;
          __int16 v31 = 1024;
          int v32 = 3;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Will schedule a retry to enable ICML (status = %d)", buf, 0x12u);
        }
        char v19 = 1;
        goto LABEL_27;
      default:
        char v19 = 0;
        goto LABEL_28;
    }
    goto LABEL_29;
  }
  int64_t v12 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v30 = self;
    __int16 v31 = 1024;
    int v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - No pending changes to handle. Ignoring reason=%d", buf, 0x12u);
  }

  if (v9)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000196D8;
    block[3] = &unk_1001BEC70;
    id v28 = v9;
    dispatch_async(calloutQueue, block);
    id v14 = v28;
LABEL_29:
  }
LABEL_30:
}

- (void)_authenticateAndStartInitialImportWithMergePreference:(id)a3 userIdentityProperties:(id)a4 enableReason:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  int64_t v11 = [(BaseRequestHandler *)self configuration];
  int64_t v12 = [v11 clientIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001995C;
  v14[3] = &unk_1001B9FC0;
  id v15 = v9;
  int64_t v16 = a5;
  v14[4] = self;
  id v13 = v9;
  [(ICDCloudMusicLibraryRequestHandler *)self _runSagaAuthenticateOperationWithClientIdentity:v12 mergePreference:v10 allowNoisyPrompt:0 cloudLibraryEnableReason:a5 completionHandler:v14];
}

- (void)_registerDeviceAndPerformInitialImportWithUserIdentityProperties:(id)a3 cloudLibraryEnableReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((MSVDeviceSupportsSideLoadedMediaContent() & 1) == 0)
  {
    id v10 = +[ICDeviceInfo currentDeviceInfo];
    if (([v10 isWatch] & 1) == 0)
    {

      goto LABEL_13;
    }
    int64_t v11 = +[ICNanoPairedDeviceStatusMonitor sharedMonitor];
    unsigned __int8 v12 = [v11 isMediaSyncingSupported];

    if (v12) {
      goto LABEL_13;
    }
  }
  if (([v8 isActive] & 1) != 0 || !objc_msgSend(v8, "isActiveLocker"))
  {
    if (MSVDeviceSupportsSideLoadedMediaContent() && !self->_didAdjustMergePreference)
    {
      [(ICDCloudMusicLibraryRequestHandler *)self _adjustMergePreferenceWithUserIdentityProperties:v8];
      self->_didAdjustMergePreference = 1;
    }
LABEL_13:
    id v15 = +[ICDServer server];
    int64_t v16 = [(BaseRequestHandler *)self configuration];
    uint64_t v17 = [v15 daemonOptionsForConfiguration:v16];

    if (([v17 prohibitLibraryUpload] & 1) == 0)
    {
      uint32_t v18 = [(BaseRequestHandler *)self musicLibrary];
      char v19 = [v18 sagaCloudLibraryCUID];

      BOOL v20 = [(BaseRequestHandler *)self musicLibrary];
      v21 = [v20 sagaCloudLibraryTroveID];

      if ([v19 length] && objc_msgSend(v21, "length"))
      {
        uint64_t v22 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v44 = self;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ - Device is already registered with CUID and TroveID", buf, 0xCu);
        }
      }
      else
      {

        char v23 = [(BaseRequestHandler *)self configuration];
        uint64_t v40 = 0;
        BOOL v24 = sub_1000D4EBC(v23, 0, &v40);

        if (!v24)
        {
          id v35 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v44 = self;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ - Enqueuing SagaDeauth as device registration failed.", buf, 0xCu);
          }

          int v32 = [(BaseRequestHandler *)self configuration];
          __int16 v33 = [v32 clientIdentity];
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10001A2BC;
          v36[3] = &unk_1001B9F70;
          v36[4] = self;
          v37[1] = a4;
          int v34 = (id *)v37;
          v37[0] = v9;
          [(ICDCloudMusicLibraryRequestHandler *)self _removeCloudSourcesForReason:-3 withClientIdentity:v33 byDisablingActiveLockerAccount:1 completionHandler:v36];
          goto LABEL_27;
        }
      }
    }
    sagaRequestHandler = self->_sagaRequestHandler;
    char v26 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (sagaRequestHandler)
    {
      if (v27)
      {
        id v28 = self->_sagaRequestHandler;
        *(_DWORD *)buf = 138543618;
        id v44 = self;
        __int16 v45 = 2048;
        id v46 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ - We have a valid SagaRequestHander (%p)....", buf, 0x16u);
      }
    }
    else
    {
      if (v27)
      {
        *(_DWORD *)buf = 138543362;
        id v44 = self;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ - Initializing SagaRequestHander ....", buf, 0xCu);
      }

      id v29 = [SagaRequestHandler alloc];
      char v26 = [(BaseRequestHandler *)self configuration];
      __int16 v30 = [(SagaRequestHandler *)v29 initWithConfiguration:v26 progressObserver:self];
      __int16 v31 = self->_sagaRequestHandler;
      self->_sagaRequestHandler = v30;
    }
    self->_havePendingSagaUpdate = 1;
    int v32 = [(BaseRequestHandler *)self configuration];
    __int16 v33 = [v32 clientIdentity];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10001A160;
    v38[3] = &unk_1001B9ED0;
    v38[4] = self;
    v39[1] = a4;
    int v34 = (id *)v39;
    v39[0] = v9;
    [(ICDCloudMusicLibraryRequestHandler *)self _performInitialJaliscoImportWithClientIdentity:v33 completion:v38];
LABEL_27:

    goto LABEL_28;
  }
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v44 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Locker bit set, but the account is not active. Enqueuing a SagaDeauth", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A094;
  block[3] = &unk_1001BEC48;
  void block[4] = self;
  id v42 = v9;
  dispatch_async(accessQueue, block);

LABEL_28:
}

- (int64_t)_shouldHandleDaemonStartupOrAccountChangedNotificationWithProperties:(id)a3
{
  id v4 = a3;
  if (self->_didHandleStartupNotificationReason)
  {
    int64_t v5 = 2;
  }
  else
  {
    self->_didHandleStartupNotificationReason = 1;
    id v6 = [(BaseRequestHandler *)self userIdentity];
    id v7 = +[ML3MusicLibrary musicLibraryForUserAccount:v6];

    id v8 = [v4 DSID];
    id v9 = [v7 sagaAccountID];
    id v10 = [v7 sagaLastKnownActiveLockerAccountDSID];
    unsigned int v11 = [v7 sagaOnDiskDatabaseRevision];
    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v8 == 0;
    }
    int v13 = !v12;
    if (v9) {
      BOOL v14 = v8 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14) {
      unsigned int v15 = 0;
    }
    else {
      unsigned int v15 = [v8 isEqualToNumber:v9] ^ 1;
    }
    unsigned int v25 = v15;
    if ((v13 | v15))
    {
      int64_t v5 = 0;
    }
    else if ([(ICDCloudMusicLibraryRequestHandler *)self _wasRestoredFromCloudBackup:v4])
    {
      int64_t v5 = 1;
    }
    else
    {
      int64_t v16 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        BOOL v27 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - No changes to process", buf, 0xCu);
      }

      int64_t v5 = 2;
    }
    uint64_t v17 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = v13;
      id v18 = [v9 longLongValue];
      BOOL v24 = v7;
      unsigned int v19 = v11;
      id v20 = [v8 longLongValue];
      id v21 = [v10 longLongValue];
      *(_DWORD *)buf = 138545154;
      BOOL v27 = self;
      __int16 v28 = 2048;
      id v29 = v18;
      __int16 v30 = 2048;
      id v31 = v20;
      __int16 v32 = 2048;
      id v33 = v21;
      __int16 v34 = 1024;
      unsigned int v35 = v19;
      id v7 = v24;
      __int16 v36 = 1024;
      int v37 = v23;
      __int16 v38 = 1024;
      unsigned int v39 = v25;
      __int16 v40 = 1024;
      int v41 = v5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - previousAccountID=%lld, activeAccountID=%lld, lastKnownActiveLockerAccountID=%lld, currentSagaDatabaseVersion=%d, accountIDWasAdded=%{BOOL}u, accountIDWasChanged=%{BOOL}u, handleReason=%d", buf, 0x42u);
    }
  }
  return v5;
}

- (void)_adjustMergePreferenceWithUserIdentityProperties:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BaseRequestHandler *)self userIdentity];
  id v6 = +[ML3MusicLibrary musicLibraryForUserAccount:v5];

  id v7 = [v4 DSID];
  id v8 = [v6 sagaAccountID];
  id v9 = [v6 sagaLastKnownActiveLockerAccountDSID];
  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v7 == 0;
  }
  int v11 = !v10;
  if (v8) {
    BOOL v12 = v7 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = [v7 isEqualToNumber:v8] ^ 1;
  }
  unsigned int v14 = [v6 sagaPrefersToMergeWithCloudLibrary];
  unsigned int v15 = [v4 DSID];
  int64_t v16 = v15;
  if ((v11 | v13) != 1)
  {
    __int16 v32 = v15;
    if ([(ICDCloudMusicLibraryRequestHandler *)self _wasRestoredFromCloudBackup:v4])
    {
      [v6 clearSagaCloudLibraryTroveID];
      [v6 clearSagaCloudLibraryCUID];
      [v6 clearSagaClientFeaturesVersion];
      [v6 setSagaLastKnownActiveLockerAccountDSID:0];
      [v6 setSagaPrefersToMergeWithCloudLibrary:0];
      uint64_t v22 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v34 = self;
        __int16 v35 = 1024;
        unsigned int v36 = [v6 sagaPrefersToMergeWithCloudLibrary];
        int v23 = "%{public}@ - Clearing TroveID, CUID, client feature versions and setting merge preference to %{BOOL}u";
        BOOL v24 = v22;
        uint32_t v25 = 18;
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      }
    }
    else
    {
      uint64_t v22 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v34 = self;
        int v23 = "%{public}@ - Will not adjust merge preference.";
        BOOL v24 = v22;
        uint32_t v25 = 12;
        goto LABEL_26;
      }
    }
    char v26 = v6;
LABEL_41:

    id v6 = v26;
LABEL_42:
    int64_t v16 = v32;
    goto LABEL_43;
  }
  if (v9)
  {
    id v17 = v15;
    if (v17 == v9)
    {
    }
    else
    {
      id v18 = v17;
      unsigned __int8 v19 = [v17 isEqual:v9];

      if ((v19 & 1) == 0)
      {
        id v20 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          __int16 v34 = self;
          __int16 v35 = 1024;
          unsigned int v36 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Active locker account is different from previous locker account - shouldMergeWithCloudLibrary=%d", buf, 0x12u);
        }

        if (v14)
        {
          __int16 v32 = v16;
          uint64_t v21 = 0;
          unsigned int v14 = 1;
          goto LABEL_39;
        }
        goto LABEL_43;
      }
    }
    __int16 v30 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v34 = self;
      __int16 v35 = 1024;
      unsigned int v36 = 1;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ - Active locker account is the same as previous locker account - shouldMergeWithCloudLibrary=%d", buf, 0x12u);
    }
  }
  else
  {
    BOOL v27 = [v4 mergeToCloudLibraryPreference];
    if (v27)
    {
      __int16 v28 = v27;
      __int16 v32 = v16;
      uint64_t v21 = (uint64_t)[v27 BOOLValue];
      id v29 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v34 = self;
        __int16 v35 = 1024;
        unsigned int v36 = v21;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ - Found mergePreference on the active locker account - shouldMerge=%d.", buf, 0x12u);
      }

      if (v14 == v21) {
        goto LABEL_42;
      }
      goto LABEL_39;
    }
  }
  if ((v14 & 1) == 0)
  {
    __int16 v32 = v16;
    unsigned int v14 = 0;
    uint64_t v21 = 1;
LABEL_39:
    id v31 = [(BaseRequestHandler *)self userIdentity];
    char v26 = +[ML3MusicLibrary musicLibraryForUserAccount:v31];

    [v26 setSagaPrefersToMergeWithCloudLibrary:v21];
    uint64_t v22 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v34 = self;
      __int16 v35 = 1024;
      unsigned int v36 = v14;
      __int16 v37 = 1024;
      int v38 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating merge preference from %{BOOL}u to %{BOOL}u", buf, 0x18u);
    }
    goto LABEL_41;
  }
LABEL_43:
}

- (BOOL)_wasRestoredFromCloudBackup:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0;
  unsigned int v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  int64_t v5 = [(BaseRequestHandler *)self userIdentity];
  id v6 = +[ML3MusicLibrary musicLibraryForUserAccount:v5];

  id v31 = [v4 DSID];
  id v7 = [v6 sagaAccountID];
  id v8 = [v6 sagaOnDiskDatabaseRevision];
  id v9 = objc_alloc_init((Class)sub_1000D73F8());
  BOOL v10 = [v9 getCurrentInstallDisposition];
  int v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v40 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "migratorDisposition=%{public}@", buf, 0xCu);
  }

  if (!v10)
  {
    int v18 = 0;
LABEL_14:
    int v23 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543874;
    __int16 v40 = self;
    __int16 v41 = 1024;
    *(_DWORD *)id v42 = v8;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v18;
    BOOL v24 = "%{public}@ - currentSagaDatabaseVersion=%d, wasRestoredFromCloudBackup=%{BOOL}u";
    uint32_t v25 = v23;
    uint32_t v26 = 24;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_17;
  }
  BOOL v12 = [(ICDCloudMusicLibraryRequestHandler *)v10 objectForKey:@"WasDeviceRestoredFromBackup"];
  unsigned int v13 = [v12 BOOLValue];

  unsigned int v14 = [(ICDCloudMusicLibraryRequestHandler *)v10 objectForKey:@"WasDeviceUpgraded"];
  unsigned int v15 = [v14 BOOLValue];

  int64_t v16 = [(ICDCloudMusicLibraryRequestHandler *)v10 objectForKey:@"WasDeviceRestoredFromCloudBackup"];
  unsigned int v17 = [v16 BOOLValue];

  int v18 = v13 & v17;
  if (v8 || !v18) {
    goto LABEL_14;
  }
  unsigned int v19 = 0;
  if (v7 && v31) {
    unsigned int v19 = [v31 isEqualToNumber:v7];
  }
  id v20 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    __int16 v40 = self;
    __int16 v41 = 1024;
    *(_DWORD *)id v42 = v19;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v15 & (v13 ^ 1);
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = 1;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Device was restored from cloud backup. sameAccountAsInBackup=%{BOOL}u, wasUpgraded=%{BOOL}u, wasRestored=%{BOOL}u", buf, 0x1Eu);
  }

  if (!v19)
  {
    int v23 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    if (v7) {
      id v29 = [v7 longLongValue];
    }
    else {
      id v29 = 0;
    }
    id v30 = v31;
    if (v31) {
      id v30 = [v31 longLongValue];
    }
    *(_DWORD *)buf = 138543874;
    __int16 v40 = self;
    __int16 v41 = 2048;
    *(void *)id v42 = v29;
    *(_WORD *)&v42[8] = 2048;
    id v43 = v30;
    BOOL v24 = "%{public}@ - Account in the backup is NOT the same as the current account (previousAccountID=%lld, activeAccou"
          "ntID=%lld), not upgrading iCML";
    uint32_t v25 = v23;
    uint32_t v26 = 32;
    goto LABEL_16;
  }
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  uint64_t v22 = [(BaseRequestHandler *)self configuration];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001B4A0;
  v32[3] = &unk_1001B9F48;
  __int16 v34 = &v35;
  v32[4] = self;
  int v23 = v21;
  id v33 = v23;
  sub_10000A1BC(v22, v32);

  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
LABEL_17:

  BOOL v27 = *((unsigned char *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);

  return v27;
}

- (int64_t)_canEnableCloudMusicLibraryOnPlatformsWithSideLoadedMediaContentWithProperties:(id)a3 includeLocalContentCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Checking if ICML can be enabled. includeLocalContentCheck=%{BOOL}u", buf, 0x12u);
  }

  id v8 = [v6 DSID];
  if ([v6 isActiveLocker])
  {
    id v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 longLongValue];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - DSID (%lld) is already the active locker account", buf, 0x16u);
    }
    int64_t v11 = 0;
    goto LABEL_21;
  }
  if (v8 && [v8 longLongValue])
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v42 = sub_100014764;
    id v43 = sub_100014774;
    id v44 = 0;
    uint64_t v33 = 0;
    __int16 v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    unsigned int v13 = [(BaseRequestHandler *)self configuration];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10001BC84;
    v29[3] = &unk_1001B9F20;
    id v31 = buf;
    __int16 v32 = &v33;
    id v9 = v12;
    id v30 = v9;
    sub_10000A1BC(v13, v29);

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (*((unsigned char *)v34 + 24))
    {
      unsigned int v14 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v37 = 138543362;
        char v38 = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cannot enable ICML as the user manually disabled it", v37, 0xCu);
      }
    }
    else
    {
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        unsigned int v14 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v16 = *(void **)(*(void *)&buf[8] + 40);
          *(_DWORD *)uint64_t v37 = 138543618;
          char v38 = self;
          __int16 v39 = 2114;
          id v40 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Error (%{public}@ determining if user manually disabled iCML. Will schedule a retry.", v37, 0x16u);
        }
        int64_t v11 = 3;
        goto LABEL_20;
      }
      if (!v4
        || ([(BaseRequestHandler *)self configuration],
            int v18 = objc_claimAutoreleasedReturnValue(),
            unsigned int v19 = sub_100006F5C(v18),
            v18,
            !v19))
      {
        id v23 = objc_alloc_init((Class)sub_1000D73F8());
        unsigned int v14 = [v23 getPreExistingStoreIdentifiers];
        BOOL v24 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v37 = 138543362;
          char v38 = (ICDCloudMusicLibraryRequestHandler *)v14;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "preExistingStoreIdentifiers=%{public}@", v37, 0xCu);
        }

        if ([v14 containsObject:v8])
        {
          uint32_t v25 = sub_1000EFE94();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v26 = [v8 longLongValue];
            *(_DWORD *)uint64_t v37 = 138543618;
            char v38 = self;
            __int16 v39 = 2048;
            id v40 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ - Can conditionally enable ICML as DSID (%lld) is a preexisting store acount", v37, 0x16u);
          }

          int64_t v11 = 2;
        }
        else
        {
          int64_t v11 = 0;
        }
        goto LABEL_20;
      }
      dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
      dispatch_semaphore_t v21 = sub_1000EFE94();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v37 = 138543362;
        char v38 = self;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cannot enable ICML as there are local destructive changes", v37, 0xCu);
      }

      uint64_t v22 = [(BaseRequestHandler *)self configuration];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10001BD2C;
      id v27[3] = &unk_1001BE408;
      unsigned int v14 = v20;
      __int16 v28 = v14;
      sub_1000D6B8C(v22, -100, v27);

      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    }
    int64_t v11 = 1;
LABEL_20:

    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_21;
  }
  id v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v8 longLongValue];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - Cannot enable ICML as the DSID (%lld) is invalid", buf, 0x16u);
  }
  int64_t v11 = 1;
LABEL_21:

  return v11;
}

- (int64_t)_getCurrentSubscriptionStatusForReason:(int64_t)a3
{
  int64_t musicSubscriptionCheckStatus = self->_musicSubscriptionCheckStatus;
  if (!musicSubscriptionCheckStatus) {
    [(ICDCloudMusicLibraryRequestHandler *)self _reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:a3 completionHandler:0];
  }
  return musicSubscriptionCheckStatus;
}

- (void)_retryEnablingCloudMusicLibraryForReason:(int64_t)a3
{
  if (self->_havePendingAutoEnableICMLCheck)
  {
    BOOL v4 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - We already have a pending enable ICML operation.", buf, 0xCu);
    }
  }
  else
  {
    self->_havePendingAutoEnableICMLCheck = 1;
    int autoEnableFailureCount = self->_autoEnableFailureCount;
    if (autoEnableFailureCount >= 10) {
      int autoEnableFailureCount = 10;
    }
    double v7 = (double)(3600 * (autoEnableFailureCount ^ 2));
    id v8 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      unsigned int v13 = self;
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Will retry enabling iCML in %f seconds.", buf, 0x16u);
    }

    dispatch_time_t v9 = dispatch_time(0x8000000000000000, (uint64_t)(v7 * 1000000000.0));
    accessQueue = self->_accessQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001BF50;
    v11[3] = &unk_1001BCD38;
    v11[4] = self;
    v11[5] = a3;
    dispatch_after(v9, accessQueue, v11);
  }
}

- (void)_reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  double v7 = +[ICDefaults standardDefaults];
  if ([v7 shouldTreatSubscriptionStatusAsExpired])
  {
    int v8 = MSVDeviceOSIsInternalInstall();

    if (v8)
    {
      dispatch_time_t v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v22 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - shouldTreatSubscriptionStatusAsExpired is set. Will force subscription status to be expired", buf, 0xCu);
      }

      accessQueue = self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001C584;
      block[3] = &unk_1001B9C00;
      v20[0] = v6;
      v20[1] = a3;
      int64_t v11 = (id *)v20;
      void block[4] = self;
      id v12 = v6;
      dispatch_async(accessQueue, block);
      goto LABEL_10;
    }
  }
  else
  {
  }
  unsigned int v13 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int64_t musicSubscriptionCheckStatus = self->_musicSubscriptionCheckStatus;
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = self;
    __int16 v23 = 1024;
    int v24 = musicSubscriptionCheckStatus;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - reloading subscription status. Current status=%d, reason=%d", buf, 0x18u);
  }

  double v15 = [(BaseRequestHandler *)self configuration];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001C638;
  v17[3] = &unk_1001B9EF8;
  v18[0] = v6;
  v18[1] = a3;
  int64_t v11 = (id *)v18;
  v17[4] = self;
  id v16 = v6;
  sub_100010794(v15, v17);

LABEL_10:
}

- (void)_enqueueCloudUpdateLibraryOperationForReason:(int64_t)a3
{
  if (!self->_havePendingCloudUpdateLibraryCheck)
  {
    self->_havePendingCloudUpdateLibraryCheck = 1;
    int64_t v5 = +[ICURLBagProvider sharedBagProvider];
    id v6 = objc_alloc((Class)ICStoreRequestContext);
    double v7 = [(BaseRequestHandler *)self configuration];
    int v8 = [v7 userIdentity];
    id v9 = [v6 initWithIdentity:v8];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001D4E0;
    v10[3] = &unk_1001B9EA8;
    v10[4] = self;
    void v10[5] = a3;
    [v5 getBagForRequestContext:v9 withCompletionHandler:v10];
  }
}

- (void)_enqueueSubscriptionStatusCheckForReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2 && self->_havePendingSubscriptionStatusCheck)
  {
    int64_t v5 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 138543362;
    unsigned int v17 = self;
    double v7 = "%{public}@ - We already have a pending subscription status check operation.";
    goto LABEL_13;
  }
  if ((unint64_t)(a3 - 1) > 1)
  {
    self->_havePendingSubscriptionStatusCheck = 1;
    int subscriptionStatusFailureCount = self->_subscriptionStatusFailureCount;
    if (subscriptionStatusFailureCount >= 10) {
      int subscriptionStatusFailureCount = 10;
    }
    double v10 = (double)(600 * (subscriptionStatusFailureCount ^ 2));
    int64_t v11 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = self->_subscriptionStatusFailureCount;
      *(_DWORD *)buf = 138544130;
      unsigned int v17 = self;
      __int16 v18 = 2048;
      double v19 = v10;
      __int16 v20 = 1024;
      int v21 = a3;
      __int16 v22 = 2048;
      uint64_t v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Will retry getting subscription status in %f seconds for reason %d, _subscriptionStatusFailureCount=%ld", buf, 0x26u);
    }

    dispatch_time_t v13 = dispatch_time(0x8000000000000000, (uint64_t)(v10 * 1000000000.0));
    accessQueue = self->_accessQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001DB68;
    v15[3] = &unk_1001BCD38;
    v15[4] = self;
    void v15[5] = a3;
    dispatch_after(v13, accessQueue, v15);
  }
  else
  {
    if (![(BaseRequestHandler *)self isActive])
    {
      int64_t v5 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 138543362;
      unsigned int v17 = self;
      double v7 = "%{public}@ - Not reloading subscription status as the handler is not active.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
LABEL_14:

      return;
    }
    [(ICDCloudMusicLibraryRequestHandler *)self _runSubscriptionStatusCheckOperationWithReason:5 completionHandler:0];
  }
}

- (void)_runSubscriptionStatusCheckOperationWithReason:(int64_t)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001DD1C;
  v6[3] = &unk_1001B9E80;
  v6[4] = self;
  v6[5] = a3;
  id v5 = [objc_alloc((Class)ICAsyncBlockOperation) initWithStartHandler:v6];
  [(NSOperationQueue *)self->_retryQueue addOperation:v5];
}

- (void)_handleMusicSubscriptionStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    __int16 v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Handling subscription status change notification", (uint8_t *)&v19, 0xCu);
  }

  id v6 = [v4 userInfo];
  uint64_t v7 = ICUserIdentityForMusicSubscriptionStatusDidChangeKey;
  int v8 = [v6 objectForKeyedSubscript:ICUserIdentityForMusicSubscriptionStatusDidChangeKey];

  if (!v8) {
    goto LABEL_11;
  }
  id v9 = [v4 userInfo];
  double v10 = [v9 objectForKeyedSubscript:v7];

  int64_t v11 = [(BaseRequestHandler *)self userIdentityStore];
  id v12 = [v11 DSIDForUserIdentity:v10 outError:0];

  dispatch_time_t v13 = [(BaseRequestHandler *)self userIdentityStore];
  __int16 v14 = [(BaseRequestHandler *)self userIdentity];
  double v15 = [v13 DSIDForUserIdentity:v14 outError:0];

  id v16 = v15;
  if (v12 == v16)
  {

    goto LABEL_10;
  }
  unsigned __int8 v17 = [v12 isEqual:v16];

  if (v17)
  {
LABEL_10:

LABEL_11:
    [(ICDCloudMusicLibraryRequestHandler *)self _reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:2 completionHandler:0];
    goto LABEL_12;
  }
  __int16 v18 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543874;
    __int16 v20 = self;
    __int16 v21 = 2112;
    id v22 = v16;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Subscription change notification received for another account [no action to take] - handlerDSID=%@ - notificationDSID=%@", (uint8_t *)&v19, 0x20u);
  }

LABEL_12:
}

- (BOOL)_isNativeMusicAppInstalled
{
  if (MSVDeviceSupportsMultipleLibraries())
  {
    uint64_t v3 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = self;
      id v4 = "%{public}@ - Ignoring native music app check on platforms that support multiple libraries";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (sub_100010724())
  {
    uint64_t v3 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = self;
      id v4 = "%{public}@ - Ignoring native music app check on traditional wOS";
      goto LABEL_7;
    }
LABEL_8:

    return 1;
  }

  return ICSystemApplicationIsInstalled();
}

- (void)_resetInternalCloudLibraryState
{
  self->_int64_t musicSubscriptionCheckStatus = 1;
  self->_int subscriptionStatusFailureCount = 0;
  self->_int autoEnableFailureCount = 0;
  self->_sagaImportFailureCount = 0;
  self->_autoRetryCloudAuthenticateFailureCount = 0;
}

- (void)updateLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(BaseRequestHandler *)self userIdentityStore];
  int v8 = [(BaseRequestHandler *)self userIdentity];
  id v25 = 0;
  id v9 = [v7 getPropertiesForUserIdentity:v8 error:&v25];
  id v10 = v25;

  if (v9)
  {
    unsigned __int8 v11 = [v9 isActiveLocker];
    id v12 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating Jalisco Library with reason=%d", buf, 8u);
    }

    dispatch_time_t v13 = [(BaseRequestHandler *)self configuration];
    __int16 v14 = [v13 clientIdentity];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_10001E5F8;
    v20[3] = &unk_1001B9E58;
    int64_t v23 = a3;
    double v15 = (id *)v21;
    id v16 = v10;
    unsigned __int8 v24 = v11;
    v21[0] = v16;
    v21[1] = self;
    id v22 = v6;
    [(ICDCloudMusicLibraryRequestHandler *)self updateJaliscoLibraryWithClientIdentity:v14 forReason:a3 completionHandler:v20];
  }
  else
  {
    calloutQueue = self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E810;
    block[3] = &unk_1001BEC70;
    double v15 = &v19;
    id v19 = v6;
    dispatch_async(calloutQueue, block);
  }
}

- (void)becomeInactiveWithDeauthentication:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EB14;
  block[3] = &unk_1001BD870;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)becomeActive
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F384;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  if ([a3 isRemoteServerReachable] && !self->_musicSubscriptionCheckStatus)
  {
    id v4 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t musicSubscriptionCheckStatus = self->_musicSubscriptionCheckStatus;
      int v6 = 138543618;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      int v9 = musicSubscriptionCheckStatus;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - network reachability changed, _int64_t musicSubscriptionCheckStatus = %d. Reloading subscription status", (uint8_t *)&v6, 0x12u);
    }

    [(ICDCloudMusicLibraryRequestHandler *)self _reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:5 completionHandler:0];
  }
}

- (void)scheduleBackgroundTaskToUpdateLibraryType:(int64_t)a3
{
  BOOL v4 = a3 != 1;
  id v6 = [(BaseRequestHandler *)self taskScheduler];
  id v5 = [(BaseRequestHandler *)self configuration];
  [v6 scheduleBackgroundUpdateType:v4 forConfiguration:v5];
}

- (void)setUpdateProgress:(float)a3 forLibraryType:(int64_t)a4
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FD18;
  block[3] = &unk_1001B9E08;
  void block[4] = self;
  void block[5] = a4;
  float v6 = a3;
  dispatch_async(accessQueue, block);
}

- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002021C;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100020504;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000207EC;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020A64;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020BE4;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020D64;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)importContainerArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100020F38;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importScreenshotForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021200;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importItemArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000214C8;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000217AC;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadMissingArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100021A44;
  v7[3] = &unk_1001BECC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)loadBooksForStoreIDs:(id)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021C84;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 clientIdentity:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100021F50;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100022238;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100022520;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022818;
  block[3] = &unk_1001B9CA0;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)removeLibraryWithClientIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100022ADC;
  block[3] = &unk_1001BEC98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022D4C;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022ECC;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000230A0;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100023368;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023610;
  block[3] = &unk_1001B9C00;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000238D8;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100023BB0;
  block[3] = &unk_1001B9D68;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a5;
  id v17 = v11;
  int64_t v18 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(accessQueue, block);
}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100023E98;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024190;
  block[3] = &unk_1001B9CA0;
  id v20 = v12;
  int64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024438;
  block[3] = &unk_1001B9C00;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  accessQueue = self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000246E4;
  v11[3] = &unk_1001B9D40;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(accessQueue, v11);
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  accessQueue = self->_accessQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000249C4;
  v17[3] = &unk_1001B9D18;
  int64_t v21 = a3;
  int64_t v22 = a5;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  int64_t v20 = a4;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(accessQueue, v17);
}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024D0C;
  block[3] = &unk_1001B9CA0;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a3;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025028;
  block[3] = &unk_1001B9CA0;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a3;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025344;
  block[3] = &unk_1001B9CA0;
  id v20 = v12;
  int64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  accessQueue = self->_accessQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100025648;
  v17[3] = &unk_1001B9D18;
  int64_t v21 = a4;
  int64_t v22 = a5;
  v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  int64_t v20 = a3;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(accessQueue, v17);
}

- (void)loadLastKnownEnableICMLStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(BaseRequestHandler *)self userIdentityStore];
  id v6 = [(BaseRequestHandler *)self userIdentity];
  id v26 = 0;
  id v7 = [v5 getPropertiesForUserIdentity:v6 error:&v26];
  id v8 = v26;

  if (v7)
  {
    id v9 = [v7 cloudLibraryStateReason];
    if ([v7 isActiveLocker])
    {
      id v10 = [v9 objectForKey:@"EnableCloudLibraryFailureReasonKey"];
      id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v28 = self;
        __int16 v29 = 2114;
        id v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - last known error reason enabling iCML=%{public}@", buf, 0x16u);
      }

      if (v4)
      {
        calloutQueue = self->_calloutQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100025C6C;
        block[3] = &unk_1001BEC48;
        id v25 = v4;
        id v10 = v10;
        id v24 = v10;
        dispatch_async(calloutQueue, block);
      }
    }
    else
    {
      id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v28 = self;
        __int16 v29 = 2114;
        id v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - locker bit is not set, not returning last known error enabling iCML. cloudLibraryStateReason=%{public}@", buf, 0x16u);
      }

      if (!v4) {
        goto LABEL_16;
      }
      id v16 = self->_calloutQueue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      void v20[2] = sub_100025C84;
      v20[3] = &unk_1001BEC48;
      id v22 = v4;
      id v21 = v8;
      dispatch_async(v16, v20);

      id v10 = v22;
    }

LABEL_16:
    goto LABEL_17;
  }
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v28 = self;
    __int16 v29 = 2114;
    id v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - could not load user identity properties (error=%{public}@), not returning last known error enabling iCML", buf, 0x16u);
  }

  if (v4)
  {
    id v14 = self->_calloutQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100025C9C;
    v17[3] = &unk_1001BEC48;
    id v19 = v4;
    id v18 = v8;
    dispatch_async(v14, v17);

    id v9 = v19;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100025DA0;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100026088;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadArtworkInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100026370;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002663C;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 requestReason:(int64_t)a5 pinnedOnly:(BOOL)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  accessQueue = self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_10002694C;
  v21[3] = &unk_1001BBD90;
  v21[4] = self;
  id v22 = v14;
  BOOL v26 = a4;
  id v24 = v16;
  int64_t v25 = a5;
  BOOL v27 = a6;
  id v23 = v15;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(accessQueue, v21);
}

- (void)updatePlaylistPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026C18;
  block[3] = &unk_1001BEC98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

- (void)updateItemPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026ED8;
  block[3] = &unk_1001BEC98;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

- (void)setAlbumArtistProperties:(id)a3 withArtistPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000271C8;
  block[3] = &unk_1001B9CA0;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)setAlbumEntityProperties:(id)a3 withAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000274BC;
  block[3] = &unk_1001B9CA0;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)setAlbumProperties:(id)a3 forItemsWithAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000277B0;
  block[3] = &unk_1001B9CA0;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027AA4;
  block[3] = &unk_1001B9CA0;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100027D78;
  v13[3] = &unk_1001B9CF0;
  id v15 = v9;
  int64_t v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(accessQueue, v13);
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028360;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000286A0;
  block[3] = &unk_1001BC268;
  void block[4] = self;
  id v26 = v14;
  id v30 = v18;
  int64_t v31 = a5;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(accessQueue, block);
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  accessQueue = self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_1000289B8;
  v21[3] = &unk_1001B9C28;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(accessQueue, v21);
}

- (void)addStorePlaylistWithGlobalID:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100028CA0;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)addStoreItemWithOpaqueID:(id)a3 requestingBundleID:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028FB4;
  block[3] = &unk_1001B9CC8;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(accessQueue, block);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000292AC;
  block[3] = &unk_1001B9CA0;
  id v20 = v12;
  int64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  accessQueue = self->_accessQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000295A8;
  v19[3] = &unk_1001B9C50;
  unint64_t v23 = a3;
  int64_t v24 = a4;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(accessQueue, v19);
}

- (void)addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  accessQueue = self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_1000298C0;
  v21[3] = &unk_1001B9C28;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a4;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(accessQueue, v21);
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029BA0;
  block[3] = &unk_1001B9C78;
  unint64_t v18 = a3;
  int64_t v19 = a4;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(accessQueue, block);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  accessQueue = self->_accessQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100029E98;
  v19[3] = &unk_1001B9C50;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a3;
  int64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(accessQueue, v19);
}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A1DC;
  block[3] = &unk_1001BC268;
  id v30 = v18;
  int64_t v31 = a3;
  void block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(accessQueue, block);
}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002A4AC;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)removePlaylistsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002A790;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)removeItemsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002AA74;
  v15[3] = &unk_1001BEDD8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)publishPlaylistWithSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002AD3C;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 requestingBundleID:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B084;
  block[3] = &unk_1001BC268;
  id v30 = v18;
  int64_t v31 = a3;
  void block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(accessQueue, block);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  accessQueue = self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_10002B3A0;
  v21[3] = &unk_1001B9C28;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a3;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(accessQueue, v21);
}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B61C;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B79C;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B91C;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002BAF0;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002BDB8;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002C080;
  v13[3] = &unk_1001B9CF0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)updateProgressForLibraryType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C328;
  block[3] = &unk_1001B9C00;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)cancelPendingChangesForLibraryType:(int64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002C6F0;
  v4[3] = &unk_1001BCD38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

- (void)addBackgroundOperation:(id)a3 forLibraryType:(int64_t)a4 priority:(int)a5
{
  id v8 = a3;
  accessQueue = self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002C7D0;
  v11[3] = &unk_1001B9BB0;
  id v12 = v8;
  int64_t v13 = a4;
  v11[4] = self;
  int v14 = a5;
  id v10 = v8;
  dispatch_async(accessQueue, v11);
}

- (void)addOperation:(id)a3 forLibraryType:(int64_t)a4 priority:(int)a5
{
  id v8 = a3;
  accessQueue = self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002C9A0;
  v11[3] = &unk_1001B9BB0;
  id v12 = v8;
  int64_t v13 = a4;
  v11[4] = self;
  int v14 = a5;
  id v10 = v8;
  dispatch_async(accessQueue, v11);
}

- (void)updateSagaLibraryWithClientIdentity:(id)a3 forReason:(int64_t)a4 allowNoisyAuthPrompt:(BOOL)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002CC24;
  block[3] = &unk_1001B9B88;
  id v19 = v13;
  int64_t v20 = a4;
  void block[4] = self;
  id v18 = v12;
  BOOL v21 = a5;
  BOOL v22 = a6;
  id v15 = v12;
  id v16 = v13;
  dispatch_async(accessQueue, block);
}

- (void)updateCloudLibraryProgressWithCompletion:(id)a3
{
  [(ICDCloudMusicLibraryRequestHandler *)self updateProgressForLibraryType:self->_musicSubscriptionCheckStatus != 3 completionHandler:a3];
}

- (BOOL)isUpdatingCloudLibrary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002D590;
  v5[3] = &unk_1001BE648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)disableCloudLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v48 = a3;
  id v49 = a5;
  uint64_t v8 = [(BaseRequestHandler *)self userIdentityStore];
  char v9 = [(BaseRequestHandler *)self userIdentity];
  id v61 = 0;
  id v10 = [v8 getPropertiesForUserIdentity:v9 error:&v61];
  id v47 = v61;

  id v11 = 0;
  id v12 = 0;
  if (v10 && !v47)
  {
    id v11 = [v10 isActiveLocker];
    id v12 = [v10 DSID];
  }
  if ((unint64_t)(a4 + 11) <= 4 && a4 != -8)
  {
    v70[0] = @"reason";
    id v13 = +[NSNumber numberWithInteger:a4];
    v70[1] = @"isActiveLocker";
    v71[0] = v13;
    int v14 = +[NSNumber numberWithBool:v11];
    v71[1] = v14;
    id v15 = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
    v72 = v15;
    id v16 = +[NSArray arrayWithObjects:&v72 count:1];
    +[MSVAutoBugCapture snapshotWithDomain:MSVAutoBugCaptureDomainMusicLibrary type:@"Bug" subType:@"DisableICMLWrongReason" context:@"Disable iCML invoked for the wrong reason" triggerThresholdValues:0 events:v16 completion:0];
  }
  id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - Starting to disable cloud library for reason=%d, isActiveLocker=%{BOOL}u", buf, 0x18u);
  }

  if (v11)
  {
    int v18 = MSVDeviceSupportsSideLoadedMediaContent();
    if (v12) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    if (v19 == 1)
    {
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_10002E0A0;
      v60[3] = &unk_1001BE6B0;
      v60[4] = self;
      id v20 = [objc_alloc((Class)ICStoreRequestContext) initWithBlock:v60];
      BOOL v21 = +[ICUpdateAutomaticDownloadMediaKindsRequest automaticDownloadMediaKindsForMusic];
      id v22 = [objc_alloc((Class)ICUpdateAutomaticDownloadMediaKindsRequest) initWithRequestContext:v20 mediaKindsToAdd:0 mediaKindsToRemove:v21];
      [v22 performRequestWithCompletionHandler:&stru_1001B9AE8];
    }
    id v23 = [(BaseRequestHandler *)self configuration];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10002E130;
    v56[3] = &unk_1001BBDB8;
    v56[4] = self;
    int64_t v59 = a4;
    id v57 = v48;
    id v58 = v49;
    id v24 = v23;
    id v46 = v56;
    id v25 = [v24 userIdentityStore];
    int64_t v26 = [v24 userIdentity];
    __int16 v45 = +[NSDate date];
    id v69 = 0;
    id v27 = [v25 getPropertiesForUserIdentity:v26 error:&v69];
    id v28 = v69;
    if (v28 || !v27)
    {
      char v38 = dispatch_get_global_queue(0, 0);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_1000D6E90;
      *(void *)&unsigned char buf[24] = &unk_1001BEC48;
      v75 = v46;
      v74 = v28;
      dispatch_async(v38, buf);
    }
    else
    {
      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x3032000000;
      v66 = sub_1000D54E4;
      v67 = sub_1000D54F4;
      id v29 = [v27 cloudLibraryStateReason];
      id v68 = [v29 mutableCopy];

      id v30 = [(id)v64[5] objectForKey:@"CloudLibraryStateReasonKey"];
      id v31 = [v30 integerValue];
      if (v31 == (id)-1 || v64[5] && [v30 integerValue] == (id)a4)
      {
        __int16 v32 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = v64[5];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = a4;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v31 == (id)-1;
          *(_WORD *)&buf[14] = 2114;
          *(void *)&buf[16] = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Not updating account with disable iCML reason=%d. wasManuallyDisabled=%{BOOL}u, currentReason=%{public}@", buf, 0x18u);
        }

        __int16 v34 = dispatch_get_global_queue(0, 0);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_1000D7158;
        *(void *)&unsigned char buf[24] = &unk_1001BEC70;
        v74 = v46;
        dispatch_async(v34, buf);
      }
      else
      {
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_1000D6EA4;
        v62[3] = &unk_1001BD2A8;
        v62[4] = &v63;
        v62[5] = a4;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = sub_1000D6FAC;
        *(void *)&unsigned char buf[24] = &unk_1001BD280;
        v77 = &v63;
        id v44 = v26;
        v74 = v44;
        v75 = v45;
        v76 = v46;
        [v25 insertPropertiesForUserIdentity:v44 andPostAccountChangeNotification:0 usingBlock:v62 completionHandler:buf];

        __int16 v34 = v75;
      }

      _Block_object_dispose(&v63, 8);
    }
  }
  else if (self->_jaliscoRequestHandler)
  {
    if (a4 == -1)
    {
      id v42 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = -1;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating Jalisco library for reason=%d", buf, 0x12u);
      }

      jaliscoRequestHandler = self->_jaliscoRequestHandler;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10002E1EC;
      v54[3] = &unk_1001BF2B0;
      v54[4] = self;
      id v55 = v49;
      [(JaliscoRequestHandler *)jaliscoRequestHandler updateJaliscoLibraryByRemovingMediaKind:1 withClientIdentity:v48 completionHandler:v54];
    }
    else
    {
      uint64_t v35 = [(BaseRequestHandler *)self musicLibrary];
      [v35 setJaliscoNeedsUpdateForTokens:1];

      char v36 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = a4;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating Jalisco library for reason=%d, Setting jaliscoNeedsUpdateForTokens=YES", buf, 0x12u);
      }

      uint64_t v37 = self->_jaliscoRequestHandler;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10002E2A8;
      v52[3] = &unk_1001BF2B0;
      v52[4] = self;
      id v53 = v49;
      [(JaliscoRequestHandler *)v37 updateLibraryWithClientIdentity:v48 reason:6 completionHandler:v52];
    }
  }
  else
  {
    __int16 v39 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      id v40 = self->_jaliscoRequestHandler;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ - Will not update Jalisco library for reason=%d _jaliscoRequestHandler=%p", buf, 0x1Cu);
    }

    if (v49)
    {
      calloutQueue = self->_calloutQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002E364;
      block[3] = &unk_1001BEC70;
      id v51 = v49;
      dispatch_async(calloutQueue, block);
    }
  }
}

- (void)enableCloudLibraryWithClientIdentity:(id)a3 startInitialImport:(BOOL)a4 enableCloudLibraryPolicy:(int64_t)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  id v14 = objc_alloc((Class)ICAsyncBlockOperation);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_10002E800;
  v20[3] = &unk_1001BC070;
  void v20[4] = self;
  id v21 = v12;
  BOOL v24 = v10;
  BOOL v25 = v8;
  id v22 = v13;
  int64_t v23 = a5;
  id v15 = v13;
  id v16 = v12;
  id v17 = [v14 initWithStartHandler:v20];
  int v18 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isPendingAuthentication = self->_isPendingAuthentication;
    *(_DWORD *)buf = 138544642;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v17;
    __int16 v30 = 1024;
    BOOL v31 = v10;
    __int16 v32 = 1024;
    int v33 = a5;
    __int16 v34 = 1024;
    BOOL v35 = v8;
    __int16 v36 = 1024;
    BOOL v37 = isPendingAuthentication;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Enqueuing enableCloudLibraryOperation: %{public}@ - shouldStartInitialImport=%{BOOL}u, enableCloudLibraryPolicy=%d, isExplicitUserAction=%{BOOL}u, isPendingAuthentication=%{BOOL}u", buf, 0x2Eu);
  }

  [(NSOperationQueue *)self->_operationQueue addOperation:v17];
}

- (void)handleMusicAppInstalled
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F928;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)handleMusicAppRemovedWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    char v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - Handling music app removal", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [(BaseRequestHandler *)self configuration];
  id v7 = [v6 clientIdentity];
  [(ICDCloudMusicLibraryRequestHandler *)self disableCloudLibraryWithClientIdentity:v7 reason:-5 completionHandler:v4];
}

- (ICDCloudMusicLibraryRequestHandler)initWithConfiguration:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)ICDCloudMusicLibraryRequestHandler;
  char v3 = [(BaseRequestHandler *)&v21 initWithConfiguration:a3];
  if (v3)
  {
    id v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.accessQueue", v4);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v5;

    id v7 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.calloutQueue", v7);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v8;

    v3->_havePendingAutoEnableICMLCheck = 0;
    v3->_havePendingSubscriptionStatusCheck = 0;
    v3->_havePendingCloudUpdateLibraryCheck = 0;
    v3->_havePendingSagaUpdate = 0;
    v3->_didManuallyReloadCloudLibrary = 0;
    v3->_BOOL isPendingAuthentication = 0;
    v3->_didAdjustMergePreference = MSVDeviceSupportsSideLoadedMediaContent() ^ 1;
    v3->_didHandleStartupNotificationReason = MSVDeviceSupportsSideLoadedMediaContent() ^ 1;
    v3->_finishedSetup = 0;
    v3->_int64_t musicSubscriptionCheckStatus = 0;
    BOOL v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v10;

    [(NSOperationQueue *)v3->_operationQueue setName:@"com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.operationQueue"];
    [(NSOperationQueue *)v3->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_operationQueue setQualityOfService:17];
    [(NSOperationQueue *)v3->_operationQueue setUnderlyingQueue:v3->_accessQueue];
    id v12 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    retryQueue = v3->_retryQueue;
    v3->_retryQueue = v12;

    [(NSOperationQueue *)v3->_retryQueue setName:@"com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.retryQueue"];
    [(NSOperationQueue *)v3->_retryQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v3->_retryQueue setQualityOfService:17];
    v3->_int autoEnableFailureCount = 0;
    v3->_int subscriptionStatusFailureCount = 0;
    v3->_autoRetryCloudAuthenticateFailureCount = 0;
    v3->_sagaImportFailureCount = 0;
    v3->_int deauthOperationCount = 0;
    uint64_t v14 = +[NSMutableDictionary dictionary];
    syncProgressDictionary = v3->_syncProgressDictionary;
    v3->_syncProgressDictionary = (NSMutableDictionary *)v14;

    id v16 = +[ICEnvironmentMonitor sharedMonitor];
    [v16 registerObserver:v3];

    id v17 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v18 = [v17 isWatch];

    if (v18)
    {
      int v19 = +[NSNotificationCenter defaultCenter];
      [v19 addObserver:v3 selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];
    }
  }
  return v3;
}

+ (id)handler
{
  v2 = objc_opt_new();
  char v3 = +[BaseRequestHandler handlerForConfiguration:v2];

  return v3;
}

@end