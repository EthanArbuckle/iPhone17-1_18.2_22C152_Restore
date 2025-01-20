@interface SagaRequestHandler
- (BOOL)isUpdateInProgressWithIsInitialImport:(BOOL *)a3;
- (SagaRequestHandler)init;
- (SagaRequestHandler)initWithConfiguration:(id)a3 progressObserver:(id)a4;
- (float)updateProgress;
- (id)_library;
- (void)_addLibraryOperation:(id)a3 priority:(int)a4 noLibraryHandler:(id)a5;
- (void)_handleCloudLibraryUpdateOperationFinishedWithError:(id)a3;
- (void)_handleLibraryEditOperationCompletionUpdatingLibrary:(BOOL)a3 andSubscribedPlaylist:(unint64_t)a4 completion:(id)a5;
- (void)addBackgroundOperation:(id)a3 priority:(int)a4;
- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addStoreItemWithOpaqueID:(id)a3 requestingBundleID:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addStorePlaylistWithGlobalID:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5;
- (void)cancelOperations;
- (void)cancelOperationsWithCompletionHandler:(id)a3;
- (void)cancelPendingChanges;
- (void)cancelPendingChangesWithCompletion:(id)a3;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 requestingBundleID:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)dealloc;
- (void)decreasePriorityForAllOperations;
- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3;
- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6;
- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)environmentMonitorDidChangePower:(id)a3;
- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)increasePriorityForAllOperations;
- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5;
- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadGeniusItemsForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadScreenshotInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)publishPlaylistWithSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5;
- (void)removeItemsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removePlaylistsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6;
- (void)setAlbumArtistProperties:(id)a3 withArtistPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setAlbumEntityProperties:(id)a3 withAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setAlbumProperties:(id)a3 forItemsWithAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7 completionHandler:(id)a8;
- (void)updateItemPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4;
- (void)updateLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 allowNoisyAuthPrompt:(BOOL)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7;
- (void)updatePlaylistPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4;
- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 requestReason:(int64_t)a5 pinnedOnly:(BOOL)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)uploadItemPropertiesWithClientIdentity:(id)a3 minimumTimeInterval:(double)a4;
- (void)uploadPlaylistPropertiesWithClientIdentity:(id)a3 minimumTimeInterval:(double)a4;
@end

@implementation SagaRequestHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicLibrary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_updateTaskHelper, 0);
  objc_storeStrong((id *)&self->_playlistPropertiesCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_itemPropertiesCoalescingTimer, 0);
  objc_storeStrong((id *)&self->_updateLibraryCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_updateCloudLibraryOperation, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_updateCloudLibraryQueue, 0);
  objc_storeStrong((id *)&self->_uploadPlaylistPropertiesQueue, 0);
  objc_storeStrong((id *)&self->_uploadItemPropertiesQueue, 0);
  objc_storeStrong((id *)&self->_artworkImporter, 0);

  objc_storeStrong((id *)&self->_library, 0);
}

- (void)_handleLibraryEditOperationCompletionUpdatingLibrary:(BOOL)a3 andSubscribedPlaylist:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v9 = [(ICConnectionConfiguration *)self->_configuration clientIdentity];
  if (v6)
  {
    v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Requesting library update because the response contained update-required flag", buf, 0xCu);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100083D40;
    v17[3] = &unk_1001BBDB8;
    v17[4] = self;
    unint64_t v20 = a4;
    id v19 = v8;
    id v18 = v9;
    [(SagaRequestHandler *)self updateLibraryWithClientIdentity:v18 reason:8 allowNoisyAuthPrompt:1 isExplicitUserAction:0 completionHandler:v17];

    v11 = v19;
  }
  else
  {
    if (!a4)
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
      goto LABEL_10;
    }
    v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = self;
      __int16 v24 = 2048;
      unint64_t v25 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Requesting subscribed playlist update for %lld", buf, 0x16u);
    }

    v13 = +[NSNumber numberWithUnsignedLongLong:a4];
    v21 = v13;
    v14 = +[NSArray arrayWithObjects:&v21 count:1];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100083FD0;
    v15[3] = &unk_1001BF2B0;
    v15[4] = self;
    id v16 = v8;
    [(SagaRequestHandler *)self updateSubscribedPlaylistsWithSagaIDs:v14 ignoreMinRefreshInterval:1 requestReason:8 pinnedOnly:0 clientIdentity:v9 completionHandler:v15];

    v11 = v16;
  }

LABEL_10:
}

- (void)_handleCloudLibraryUpdateOperationFinishedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_updateLibraryCompletionHandlers copy];
  if ([v5 count])
  {
    calloutQueue = self->_calloutQueue;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_1000843D4;
    v12 = &unk_1001BECC0;
    id v13 = v5;
    id v14 = v4;
    dispatch_async(calloutQueue, &v9);
  }
  [(NSMutableArray *)self->_updateLibraryCompletionHandlers removeAllObjects];
  updateCloudLibraryOperation = self->_updateCloudLibraryOperation;
  self->_updateCloudLibraryOperation = 0;

  id v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Posting Saga update in progress changed notification", buf, 0xCu);
  }
}

- (void)updateLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 allowNoisyAuthPrompt:(BOOL)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = ICCloudClientGetStringForRequestReason();
    *(_DWORD *)buf = 138544130;
    v70 = self;
    __int16 v71 = 2114;
    *(void *)v72 = v15;
    *(_WORD *)&v72[8] = 1024;
    LODWORD(v73[0]) = v9;
    WORD2(v73[0]) = 1024;
    *(_DWORD *)((char *)v73 + 6) = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received request to update cloud library (requestReason = %{public}@), allowNoisyAuthPrompt=%{BOOL}u, isExplicitUserAction=%{BOOL}u", buf, 0x22u);
  }
  id v16 = +[ICCloudAvailabilityController sharedController];
  unsigned int v17 = [v16 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (!v17)
  {
    v22 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
    v23 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v22];
    unsigned int v24 = [v23 privacyAcknowledgementRequiredForMedia];

    if (v24)
    {
      unint64_t v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v70 = self;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ - Skipping update because privacy acknowledgement is required", buf, 0xCu);
      }

      if (!v13) {
        goto LABEL_47;
      }
      calloutQueue = self->_calloutQueue;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_100084D90;
      v65[3] = &unk_1001BEC70;
      id v66 = v13;
      dispatch_async(calloutQueue, v65);
      v27 = v66;
      goto LABEL_46;
    }
    uint64_t v28 = [(SagaRequestHandler *)self _library];
    v27 = (void *)v28;
    if (!v28)
    {
      v38 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v70 = self;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ - Could not initialize saga library", buf, 0xCu);
      }

      if (!v13)
      {
        v27 = 0;
LABEL_46:

        goto LABEL_47;
      }
      v39 = self->_calloutQueue;
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_100084E08;
      v63[3] = &unk_1001BEC70;
      id v64 = v13;
      dispatch_async(v39, v63);
      id v32 = v64;
LABEL_45:

      goto LABEL_46;
    }
    v48 = v22;
    v49 = v12;
    v46 = (void *)v28;
    v29 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
    v30 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
    id v62 = 0;
    v31 = [v29 getPropertiesForUserIdentity:v30 error:&v62];
    id v32 = v62;

    v47 = v31;
    if (!v31 || v32)
    {
      v40 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      id v12 = v49;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v70 = self;
        __int16 v71 = 2114;
        *(void *)v72 = v32;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%{public}@ - Could not load user identity properties. error=%{public}@", buf, 0x16u);
      }

      v27 = v46;
      if (!v13) {
        goto LABEL_44;
      }
      v41 = self->_calloutQueue;
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100084E74;
      v59[3] = &unk_1001BEC48;
      id v61 = v13;
      id v60 = v32;
      dispatch_async(v41, v59);

      id v33 = v61;
    }
    else if ([v31 isActiveLocker])
    {
      [(ML3MusicLibrary *)self->_musicLibrary setClientIdentity:v49];
      id v33 = [v31 DSID];
      id v34 = [(ML3MusicLibrary *)self->_musicLibrary sagaAccountID];
      if (v33 == v34)
      {
      }
      else
      {
        unsigned __int8 v35 = [v33 isEqual:v34];

        if ((v35 & 1) == 0)
        {
          id v36 = v34;
          if (v34)
          {
            v37 = sub_1000EFD0C();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543874;
              v70 = self;
              __int16 v71 = 2114;
              *(void *)v72 = v36;
              *(_WORD *)&v72[8] = 2114;
              v73[0] = v33;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_FAULT, "%{public}@ - CloudIds are different. oldValue=%{public}@, currentValue=%{public}@}", buf, 0x20u);
            }

            +[MSVAutoBugCapture snapshotWithDomain:MSVAutoBugCaptureDomainiTunesCloud type:@"Bug" subType:@"Different Cloud IDS" context:&stru_1001BF9F0 triggerThresholdValues:&stru_1001BF9F0 events:0 completion:0];
          }
          [(ML3MusicLibrary *)self->_musicLibrary setSagaAccountID:v33];
          id v34 = v36;
        }
      }
      updateCloudLibraryQueue = self->_updateCloudLibraryQueue;
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_100084EF4;
      v50[3] = &unk_1001BBD90;
      id v53 = v13;
      int64_t v54 = a4;
      v50[4] = self;
      id v51 = v49;
      BOOL v55 = v9;
      BOOL v56 = v8;
      id v52 = v46;
      v45 = updateCloudLibraryQueue;
      v27 = v46;
      dispatch_async(v45, v50);
    }
    else
    {
      v42 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      v27 = v46;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v70 = self;
        __int16 v71 = 1024;
        *(_DWORD *)v72 = a4;
        *(_WORD *)&v72[4] = 1024;
        *(_DWORD *)&v72[6] = v9;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@ - Locker bit is not set on the account. Will not updateLibrary for reason=%d, allowNoisyAuthPrompt=%{BOOL}u", buf, 0x18u);
      }

      id v12 = v49;
      if (!v13) {
        goto LABEL_44;
      }
      v43 = self->_calloutQueue;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100084E88;
      v57[3] = &unk_1001BEC70;
      id v58 = v13;
      dispatch_async(v43, v57);
      id v33 = v58;
    }

    id v12 = v49;
LABEL_44:

    v22 = v48;
    goto LABEL_45;
  }
  id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = ICCloudClientGetStringForRequestReason();
    *(_DWORD *)buf = 138543618;
    v70 = self;
    __int16 v71 = 2114;
    *(void *)v72 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - No WiFi connection, skipping update (requestReason = %{public}@)", buf, 0x16u);
  }
  if (a4 == 2)
  {
    unint64_t v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v70 = self;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Rescheduling push notification triggered update when WiFi becomes available.", buf, 0xCu);
    }

    [(ICDCloudMusicLibrarySagaUpdateTaskHelper *)self->_updateTaskHelper scheduleBackgroundTaskToUpdateLibraryType:1];
  }
  if (v13)
  {
    v21 = self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100084D7C;
    block[3] = &unk_1001BEC70;
    id v68 = v13;
    dispatch_async(v21, block);
    v22 = v68;
LABEL_47:
  }
}

- (void)_addLibraryOperation:(id)a3 priority:(int)a4 noLibraryHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v12 = a3;
  BOOL v8 = (void (**)(id, void *))a5;
  BOOL v9 = [(SagaRequestHandler *)self _library];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 addOperation:v12 priority:v6];
  }
  else if (v8)
  {
    v11 = +[NSError ic_cloudClientErrorWithCode:2009 userInfo:0];
    v8[2](v8, v11);
  }
}

- (id)_library
{
  library = self->_library;
  if (!library || [(CloudLibrary *)library failedToConnect])
  {
    id v4 = [[SagaLibrary alloc] initWithConfiguration:self->_configuration];
    id v5 = self->_library;
    self->_library = v4;
  }
  uint64_t v6 = self->_library;

  return v6;
}

- (void)environmentMonitorDidChangePower:(id)a3
{
  id v4 = a3;
  id v5 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v6 = [v5 isWatch];

  if (v6)
  {
    unsigned int v7 = [v4 isCharging];
    BOOL v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v12 = 138543362;
        id v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Device is plugged in - checking for artwork to download", (uint8_t *)&v12, 0xCu);
      }

      artworkImporter = self->_artworkImporter;
      v11 = [(ICConnectionConfiguration *)self->_configuration clientIdentity];
      [(SagaArtworkImporter *)artworkImporter importAllItemArtworkWithClientIdentity:v11];
    }
    else
    {
      if (v9)
      {
        int v12 = 138543362;
        id v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Device was unplugged from power - cancelling artwork downloads", (uint8_t *)&v12, 0xCu);
      }

      [(CloudArtworkImporter *)self->_artworkImporter cancelAllImports];
    }
  }
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  unsigned int v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unsigned int v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - resetting invitation link for persistentID %lld", buf, 0x16u);
  }

  BOOL v8 = [SagaCollaborationResetInvitationURLOperation alloc];
  configuration = self->_configuration;
  uint64_t v10 = [(ICConnectionConfiguration *)configuration clientIdentity];
  v11 = [(SagaCollaborationResetInvitationURLOperation *)v8 initWithConfiguration:configuration clientIdentity:v10 persistentID:a3];

  objc_initWeak((id *)buf, v11);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100085E94;
  v13[3] = &unk_1001BCD88;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v6;
  v13[4] = self;
  id v14 = v12;
  [(SagaCollaborationResetInvitationURLOperation *)v11 setCompletionBlock:v13];
  [(SagaRequestHandler *)self _addLibraryOperation:v11 priority:2 noLibraryHandler:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v8 componentsJoinedByString:@","];
    *(_DWORD *)buf = 138543874;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v11;
    __int16 v24 = 2048;
    int64_t v25 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - removing users (%{public}@) for persistendID %lld", buf, 0x20u);
  }
  id v12 = [SagaCollaborationRemoveCollaboratorsOperation alloc];
  configuration = self->_configuration;
  id v14 = [(ICConnectionConfiguration *)configuration clientIdentity];
  id v15 = [(SagaCollaborationRemoveCollaboratorsOperation *)v12 initWithConfiguration:configuration clientIdentity:v14 persistentID:a4 socialProfileIDs:v8];

  objc_initWeak((id *)buf, v15);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100086268;
  v17[3] = &unk_1001BCD88;
  objc_copyWeak(&v19, (id *)buf);
  id v16 = v9;
  v17[4] = self;
  id v18 = v16;
  [(SagaCollaborationRemoveCollaboratorsOperation *)v15 setCompletionBlock:v17];
  [(SagaRequestHandler *)self _addLibraryOperation:v15 priority:2 noLibraryHandler:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v22 = self;
    __int16 v23 = 2114;
    id v24 = v10;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - responding to approval request from user %{public}@ for collaboration persistentID %lld", buf, 0x20u);
  }

  id v13 = [SagaCollaborationRespondToPendingCollaboratorOperation alloc];
  configuration = self->_configuration;
  id v15 = [(ICConnectionConfiguration *)configuration clientIdentity];
  id v16 = [(SagaCollaborationRespondToPendingCollaboratorOperation *)v13 initWithConfiguration:configuration clientIdentity:v15 persistentID:a4 socialProfileID:v10 approval:v7];

  objc_initWeak((id *)buf, v16);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000865F4;
  v18[3] = &unk_1001BCD88;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v11;
  v18[4] = self;
  id v19 = v17;
  [(SagaCollaborationRespondToPendingCollaboratorOperation *)v16 setCompletionBlock:v18];
  [(SagaRequestHandler *)self _addLibraryOperation:v16 priority:2 noLibraryHandler:0];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - joining collaboration for playlist with cloud ID %{public}@", buf, 0x16u);
  }

  id v12 = [SagaCollaborationJoinOperation alloc];
  configuration = self->_configuration;
  id v14 = [(ICConnectionConfiguration *)configuration clientIdentity];
  id v15 = [(SagaCollaborationJoinOperation *)v12 initWithConfiguration:configuration clientIdentity:v14 globalPlaylistID:v8 invitationURL:v9];

  objc_initWeak((id *)buf, v15);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100086978;
  v17[3] = &unk_1001BCD88;
  objc_copyWeak(&v19, (id *)buf);
  id v16 = v10;
  v17[4] = self;
  id v18 = v16;
  [(SagaCollaborationJoinOperation *)v15 setCompletionBlock:v17];
  [(SagaRequestHandler *)self _addLibraryOperation:v15 priority:2 noLibraryHandler:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - editing a collaboration with persistentID %lld", buf, 0x16u);
  }

  id v14 = [SagaCollaborationEditOperation alloc];
  configuration = self->_configuration;
  id v16 = [(ICConnectionConfiguration *)configuration clientIdentity];
  id v17 = [(SagaCollaborationEditOperation *)v14 initWithConfiguration:configuration clientIdentity:v16 collaborationPersistentID:a3 properties:v10 trackEdits:v11];

  objc_initWeak((id *)buf, v17);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100086D0C;
  v19[3] = &unk_1001BCD88;
  objc_copyWeak(&v21, (id *)buf);
  id v18 = v12;
  v19[4] = self;
  id v20 = v18;
  [(SagaCollaborationEditOperation *)v17 setCompletionBlock:v19];
  [(SagaRequestHandler *)self _addLibraryOperation:v17 priority:2 noLibraryHandler:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - ending collaboration for playlist with persistent ID %lld", buf, 0x16u);
  }

  id v8 = [SagaCollaborationEndOperation alloc];
  configuration = self->_configuration;
  id v10 = [(ICConnectionConfiguration *)configuration clientIdentity];
  id v11 = [(SagaCollaborationEndOperation *)v8 initWithConfiguration:configuration clientIdentity:v10 collaborationPersistentID:a3];

  objc_initWeak((id *)buf, v11);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100087068;
  v13[3] = &unk_1001BCD88;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v6;
  v13[4] = self;
  id v14 = v12;
  [(SagaCollaborationEndOperation *)v11 setCompletionBlock:v13];
  [(SagaRequestHandler *)self _addLibraryOperation:v11 priority:2 noLibraryHandler:0];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v18 = self;
    __int16 v19 = 2048;
    int64_t v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - starting collaboration using playlist with persistentID %lld", buf, 0x16u);
  }

  id v10 = self->_configuration;
  id v11 = [(ICConnectionConfiguration *)self->_configuration clientIdentity];
  id v12 = [[SagaCollaborationBeginOperation alloc] initWithConfiguration:v10 clientIdentity:v11 playlistPersistentID:a3 sharingMode:a4];
  objc_initWeak((id *)buf, v12);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000873D8;
  v14[3] = &unk_1001BCD88;
  objc_copyWeak(&v16, (id *)buf);
  id v13 = v8;
  v14[4] = self;
  id v15 = v13;
  [(SagaCollaborationBeginOperation *)v12 setCompletionBlock:v14];
  [(SagaRequestHandler *)self _addLibraryOperation:v12 priority:2 noLibraryHandler:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 length];
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      __int16 v32 = 2114;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - favoriting artist with cloudID=%{public}@}", buf, 0x16u);
    }

    id v16 = [SagaFavoriteEntityOperation alloc];
    configuration = self->_configuration;
    __int16 v18 = [(ICConnectionConfiguration *)configuration clientIdentity];
    __int16 v19 = [(SagaFavoriteEntityOperation *)v16 initWithConfiguration:configuration clientIdentity:v18 persistentID:a3 artistCloudLibraryID:v10 time:v11];

    [(SagaFavoriteEntityOperation *)v19 setName:@"com.apple.itunescloudd.SagaRequestHandler.favoriteCloudArtistEntityOperation"];
    objc_initWeak((id *)buf, v19);
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    __int16 v24 = sub_100087884;
    int64_t v25 = &unk_1001BC2E0;
    id v26 = v12;
    objc_copyWeak(&v27, (id *)buf);
    [(SagaFavoriteEntityOperation *)v19 setCompletionBlock:&v22];
    -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:](self, "_addLibraryOperation:priority:noLibraryHandler:", v19, 2, 0, v22, v23, v24, v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v10;
    __int16 v34 = 2114;
    id v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@ - cannot favorite album artist with invalid cloud-library-id=%{public}@, timeStamp=%{public}@", buf, 0x20u);
  }

  if (v12)
  {
    v28[0] = @"entityType";
    NSStringFromICFavoriteMediaEntityType();
    __int16 v19 = (SagaFavoriteEntityOperation *)objc_claimAutoreleasedReturnValue();
    v28[1] = @"action";
    v29[0] = v19;
    v29[1] = @"favorite";
    int64_t v20 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    id v21 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:v20];
    (*((void (**)(id, void *))v12 + 2))(v12, v21);

LABEL_9:
  }
}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 length];
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v31 = self;
      __int16 v32 = 2114;
      id v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - favoriting album with cloudID=%{public}@}", buf, 0x16u);
    }

    id v16 = [SagaFavoriteEntityOperation alloc];
    configuration = self->_configuration;
    __int16 v18 = [(ICConnectionConfiguration *)configuration clientIdentity];
    __int16 v19 = [(SagaFavoriteEntityOperation *)v16 initWithConfiguration:configuration clientIdentity:v18 persistentID:a3 albumCloudLibraryID:v10 time:v11];

    [(SagaFavoriteEntityOperation *)v19 setName:@"com.apple.itunescloudd.SagaRequestHandler.favoriteCloudAlbumEntityOperation"];
    objc_initWeak((id *)buf, v19);
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    __int16 v24 = sub_100087C40;
    int64_t v25 = &unk_1001BC2E0;
    id v26 = v12;
    objc_copyWeak(&v27, (id *)buf);
    [(SagaFavoriteEntityOperation *)v19 setCompletionBlock:&v22];
    -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:](self, "_addLibraryOperation:priority:noLibraryHandler:", v19, 2, 0, v22, v23, v24, v25);
    objc_destroyWeak(&v27);

    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v31 = self;
    __int16 v32 = 2114;
    id v33 = v10;
    __int16 v34 = 2114;
    id v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}@ - cannot favorite album with invalid cloud-library-id=%{public}@ timeStamp=%{public}@", buf, 0x20u);
  }

  if (v12)
  {
    v28[0] = @"entityType";
    NSStringFromICFavoriteMediaEntityType();
    __int16 v19 = (SagaFavoriteEntityOperation *)objc_claimAutoreleasedReturnValue();
    v28[1] = @"action";
    v29[0] = v19;
    v29[1] = @"favorite";
    int64_t v20 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    id v21 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:v20];
    (*((void (**)(id, void *))v12 + 2))(v12, v21);

LABEL_9:
  }
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  id v14 = v13;
  if ((unint64_t)a5 <= 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = NSStringFromICFavoriteMediaEntityType();
      *(_DWORD *)buf = 138543874;
      v39 = self;
      __int16 v40 = 2048;
      int64_t v41 = a4;
      __int16 v42 = 2114;
      int64_t v43 = (int64_t)v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - favoriting entity with cloudID=%lld, entityType=%{public}@", buf, 0x20u);
    }
    BOOL v16 = a5 == 0;

    id v17 = (void **)&ML3TrackPropertyLikedState;
    if (!v16) {
      id v17 = (void **)&ML3ContainerPropertyLikedState;
    }
    __int16 v18 = *v17;
    if (v16) {
      __int16 v19 = (id *)&ML3TrackPropertyLikedStateChangedDate;
    }
    else {
      __int16 v19 = (id *)&ML3ContainerPropertyLikedStateChangedDate;
    }
    id v20 = v18;
    id v21 = *v19;
    v36[0] = v20;
    v36[1] = v21;
    v37[0] = &off_1001CC098;
    v37[1] = v11;
    __int16 v22 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    uint64_t v23 = [SagaSetItemPropertyOperation alloc];
    configuration = self->_configuration;
    int64_t v25 = [(ICConnectionConfiguration *)configuration clientIdentity];
    id v26 = [(SagaSetItemPropertyOperation *)v23 initWithConfiguration:configuration clientIdentity:v25 sagaID:a4 properties:v22];

    objc_initWeak((id *)buf, v26);
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472;
    v30 = sub_1000880D8;
    v31 = &unk_1001BC2E0;
    id v32 = v12;
    objc_copyWeak(&v33, (id *)buf);
    [(SagaSetItemPropertyOperation *)v26 setCompletionBlock:&v28];
    [(SagaSetItemPropertyOperation *)v26 setName:@"com.apple.itunescloudd.SagaRequestHandler.setItemPropertyOperation", v28, v29, v30, v31];
    [(SagaRequestHandler *)self _addLibraryOperation:v26 priority:2 noLibraryHandler:0];
    objc_destroyWeak(&v33);

    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    id v27 = NSStringFromICFavoriteMediaEntityType();
    *(_DWORD *)buf = 138543874;
    v39 = self;
    __int16 v40 = 2114;
    int64_t v41 = (int64_t)v27;
    __int16 v42 = 2048;
    int64_t v43 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@ - unsupported entityType=%{public}@ to favorite with entity with sagaID=%lld", buf, 0x20u);
  }
  if (v12)
  {
    v34[0] = @"entityType";
    NSStringFromICFavoriteMediaEntityType();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v35[0] = v20;
    v34[1] = @"sagaID";
    id v21 = +[NSNumber numberWithLongLong:a4];
    v35[1] = v21;
    v34[2] = @"action";
    v35[2] = @"favorite";
    __int16 v22 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];
    id v26 = +[NSError errorWithDomain:ICErrorDomain code:-7101 userInfo:v22];
    (*((void (**)(id, SagaSetItemPropertyOperation *))v12 + 2))(v12, v26);
LABEL_14:
  }
}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = self;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - favoriting playlist with globalID=%{public}@}", buf, 0x16u);
  }

  id v14 = [SagaFavoriteEntityOperation alloc];
  configuration = self->_configuration;
  BOOL v16 = [(ICConnectionConfiguration *)configuration clientIdentity];
  id v17 = [(SagaFavoriteEntityOperation *)v14 initWithConfiguration:configuration clientIdentity:v16 persistentID:a3 globalPlaylistID:v10 time:v11];

  [(SagaFavoriteEntityOperation *)v17 setName:@"com.apple.itunescloudd.SagaRequestHandler.favoritePlaylistEntityOperation"];
  objc_initWeak((id *)buf, v17);
  __int16 v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_10008838C;
  __int16 v22 = &unk_1001BC2E0;
  id v18 = v12;
  id v23 = v18;
  objc_copyWeak(&v24, (id *)buf);
  [(SagaFavoriteEntityOperation *)v17 setCompletionBlock:&v19];
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:](self, "_addLibraryOperation:priority:noLibraryHandler:", v17, 2, 0, v19, v20, v21, v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak((id *)buf);
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = NSStringFromICFavoriteMediaEntityType();
    *(_DWORD *)buf = 138543874;
    id v28 = self;
    __int16 v29 = 2048;
    int64_t v30 = a4;
    __int16 v31 = 2114;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - favoriting entity with storeID=%lld, entityType=%{public}@", buf, 0x20u);
  }
  BOOL v16 = [SagaFavoriteEntityOperation alloc];
  configuration = self->_configuration;
  id v18 = [(ICConnectionConfiguration *)configuration clientIdentity];
  __int16 v19 = [(SagaFavoriteEntityOperation *)v16 initWithConfiguration:configuration clientIdentity:v18 persistentID:a3 storeID:a4 entityType:a5 time:v12];

  [(SagaFavoriteEntityOperation *)v19 setName:@"com.apple.itunescloudd.SagaRequestHandler.favoriteEntityOperation"];
  objc_initWeak((id *)buf, v19);
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_100088664;
  id v24 = &unk_1001BC2E0;
  id v20 = v13;
  id v25 = v20;
  objc_copyWeak(&v26, (id *)buf);
  [(SagaFavoriteEntityOperation *)v19 setCompletionBlock:&v21];
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:](self, "_addLibraryOperation:priority:noLibraryHandler:", v19, 2, 0, v21, v22, v23, v24);
  objc_destroyWeak(&v26);

  objc_destroyWeak((id *)buf);
}

- (float)updateProgress
{
  uint64_t v6 = 0;
  BOOL v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  updateCloudLibraryQueue = self->_updateCloudLibraryQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100088798;
  v5[3] = &unk_1001BE648;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(updateCloudLibraryQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = self;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating item properties for sagaID %lld. properties=%{public}@", buf, 0x20u);
  }

  id v14 = [v10 objectForKey:@"daap.incrementplaycount"];
  if (v14
    || ([v10 objectForKey:@"daap.incrementskipcount"],
        (id v14 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v10 objectForKey:@"daap.songdateadded"],
        (id v14 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v10 objectForKey:ML3TrackPropertyDatePlayed],
        (id v14 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_8:
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100088B30;
    v22[3] = &unk_1001BD0D8;
    id v23 = (SagaSetItemPropertyOperation *)v12;
    [(SagaRequestHandler *)self updateItemPlayDataWithClientIdentity:v11 completionHandler:v22];
    id v15 = v23;
    goto LABEL_9;
  }
  BOOL v16 = [v10 objectForKey:ML3TrackPropertyDateSkipped];
  BOOL v17 = v16 == 0;

  if (!v17) {
    goto LABEL_8;
  }
  id v18 = sub_1000EFD0C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = self;
    __int16 v26 = 2114;
    unint64_t v27 = (unint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Issuing immediate property change: %{public}@", buf, 0x16u);
  }

  id v15 = [[SagaSetItemPropertyOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v11 sagaID:a4 properties:v10];
  objc_initWeak((id *)buf, v15);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100088B48;
  v19[3] = &unk_1001BC2E0;
  id v20 = v12;
  objc_copyWeak(&v21, (id *)buf);
  [(SagaSetItemPropertyOperation *)v15 setCompletionBlock:v19];
  [(SagaSetItemPropertyOperation *)v15 setName:@"com.apple.itunescloudd.SagaRequestHandler.setItemPropertyOperation"];
  [(SagaRequestHandler *)self _addLibraryOperation:v15 priority:2 noLibraryHandler:0];
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
LABEL_9:
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Get genius items for saga ID: %llu", buf, 0x16u);
  }

  id v11 = [[SagaGetGeniusItemsOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v8 seedID:a3 numberOfItems:25];
  objc_initWeak((id *)buf, v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100088E18;
  v16[3] = &unk_1001BC2E0;
  id v12 = v9;
  id v17 = v12;
  objc_copyWeak(&v18, (id *)buf);
  [(SagaGetGeniusItemsOperation *)v11 setCompletionBlock:v16];
  [(SagaGetGeniusItemsOperation *)v11 setName:@"com.apple.itunescloudd.SagaRequestHandler.getGeniusItemsOperation"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100088E9C;
  v14[3] = &unk_1001BD0D8;
  id v13 = v12;
  id v15 = v13;
  [(SagaRequestHandler *)self _addLibraryOperation:v11 priority:2 noLibraryHandler:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v7;
  id v35 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (!v35)
  {
    unint64_t v27 = 0;
    id v25 = v11;
LABEL_17:

    __int16 v26 = v27;
    __int16 v31 = v10;
    goto LABEL_18;
  }
  id v29 = v9;
  id v32 = 0;
  uint64_t v34 = *(void *)v42;
  uint64_t v33 = ML3TrackPropertyStoreSagaID;
  id v30 = v11;
  __int16 v31 = v10;
LABEL_3:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v42 != v34) {
      objc_enumerationMutation(v11);
    }
    uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * v12);
    [(ML3MusicLibrary *)self->_musicLibrary setClientIdentity:v8];
    id v14 = +[ML3ComparisonPredicate predicateWithProperty:v33 equalToValue:v13];
    id v15 = +[ML3Track anyInLibrary:self->_musicLibrary predicate:v14];
    id v16 = [objc_alloc((Class)ML3ArtworkTokenSet) initWithEntity:v15 artworkType:2];
    id v17 = [v16 artworkTokenForSource:200];
    id v18 = [v17 length];
    if (v18)
    {
      __int16 v19 = ICCloudClientCreateArtworkInfoDictionary();
      [v10 addObject:v19];
    }
    else
    {
      id v20 = v8;
      __int16 v21 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        id v22 = [v15 persistentID];
        *(_DWORD *)buf = 134217984;
        id v48 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "No saga artwork_token for screenshot item with persistent-id = %lld", buf, 0xCu);
      }

      __int16 v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"No saga artwork_token for screenshot item with persistent-id = %lld", [v15 persistentID]);
      CFStringRef v45 = @"NSDebugDescription";
      v46 = v19;
      id v23 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v24 = +[NSError ic_cloudClientErrorWithCode:2021 userInfo:v23];

      id v32 = (void *)v24;
      id v8 = v20;
      id v11 = v30;
      id v10 = v31;
    }

    if (!v18) {
      break;
    }
    if (v35 == (id)++v12)
    {
      id v35 = [v11 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v35) {
        goto LABEL_3;
      }
      break;
    }
  }

  id v25 = v10;
  id v10 = 0;
  __int16 v26 = 0;
  id v9 = v29;
  unint64_t v27 = v32;
  if (v32) {
    goto LABEL_17;
  }
LABEL_18:
  if (v9)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100089298;
    block[3] = &unk_1001BEC98;
    id v40 = v9;
    id v38 = v31;
    id v39 = v26;
    dispatch_async(calloutQueue, block);
  }
}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Got load artwork info request for container saga IDs: %{public}@", buf, 0x16u);
  }

  uint64_t v12 = +[ICCloudAvailabilityController sharedController];
  unsigned int v13 = [v12 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (!v13)
  {
    id v15 = [(CloudLoadBulkArtworkInfoOperation *)[SagaLoadBulkContainerArtworkInfoOperation alloc] initWithConfiguration:self->_configuration cloudIDs:v8];
    objc_initWeak((id *)buf, v15);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000895C8;
    v19[3] = &unk_1001BC2E0;
    id v16 = v10;
    id v20 = v16;
    objc_copyWeak(&v21, (id *)buf);
    [(SagaLoadBulkContainerArtworkInfoOperation *)v15 setCompletionBlock:v19];
    [(SagaLoadBulkContainerArtworkInfoOperation *)v15 setName:@"com.apple.itunescloudd.SagaRequestHandler.loadArtworkInfoOperation"];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008964C;
    v17[3] = &unk_1001BD0D8;
    id v18 = v16;
    [(SagaRequestHandler *)self _addLibraryOperation:v15 priority:1 noLibraryHandler:v17];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - No WiFi connection, skipping artwork info load.", buf, 0xCu);
  }

  if (v10)
  {
    id v15 = +[NSError errorWithDomain:NSURLErrorDomain code:-999 userInfo:0];
    (*((void (**)(id, void, SagaLoadBulkContainerArtworkInfoOperation *))v10 + 2))(v10, 0, v15);
LABEL_9:
  }
}

- (void)loadArtworkInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v26 = self;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Got load artwork info request for saga IDs: %{public}@", buf, 0x16u);
  }

  uint64_t v12 = +[ICCloudAvailabilityController sharedController];
  unsigned int v13 = [v12 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (!v13)
  {
    id v16 = [(CloudLoadBulkArtworkInfoOperation *)[SagaLoadBulkItemArtworkInfoOperation alloc] initWithConfiguration:self->_configuration cloudIDs:v8];
    objc_initWeak((id *)buf, v16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100089A24;
    v20[3] = &unk_1001BC2E0;
    id v17 = v10;
    id v21 = v17;
    objc_copyWeak(&v22, (id *)buf);
    [(SagaLoadBulkItemArtworkInfoOperation *)v16 setCompletionBlock:v20];
    [(SagaLoadBulkItemArtworkInfoOperation *)v16 setName:@"com.apple.itunescloudd.SagaRequestHandler.loadArtworkInfoOperation"];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100089AA8;
    v18[3] = &unk_1001BD0D8;
    id v19 = v17;
    [(SagaRequestHandler *)self _addLibraryOperation:v16 priority:1 noLibraryHandler:v18];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v26 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - No WiFi connection, skipping artwork info load.", buf, 0xCu);
  }

  if (v10)
  {
    calloutQueue = self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000899A8;
    block[3] = &unk_1001BEC70;
    __int16 v24 = (SagaLoadBulkItemArtworkInfoOperation *)v10;
    dispatch_async(calloutQueue, block);
    id v16 = v24;
LABEL_9:
  }
}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3
{
}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3
{
}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3
{
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
  id v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100089BE8;
  v14[3] = &unk_1001BC290;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
  id v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100089ECC;
  v14[3] = &unk_1001BC290;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ICConnectionConfiguration *)self->_configuration userIdentityStore];
  id v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008A1B0;
  v14[3] = &unk_1001BC290;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (BOOL)isUpdateInProgressWithIsInitialImport:(BOOL *)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  updateCloudLibraryQueue = self->_updateCloudLibraryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008A478;
  block[3] = &unk_1001BE670;
  void block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(updateCloudLibraryQueue, block);
  if (a3) {
    *a3 = *((unsigned char *)v9 + 24);
  }
  char v5 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)setAlbumArtistProperties:(id)a3 withArtistPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting album artist properties %{public}@ on items with album artist persistent ID: %lld", buf, 0x20u);
  }

  uint64_t v14 = [[SagaSetAlbumArtistPropertyOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v11 persistentID:a4 properties:v10];
  objc_initWeak((id *)buf, v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008A734;
  v19[3] = &unk_1001BC2E0;
  id v15 = v12;
  id v20 = v15;
  objc_copyWeak(&v21, (id *)buf);
  [(SagaSetAlbumArtistPropertyOperation *)v14 setCompletionBlock:v19];
  [(SagaSetAlbumArtistPropertyOperation *)v14 setName:@"com.apple.itunescloudd.SagaRequestHandler.setAlbumArtistPropertiesOperation"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008A7B4;
  v17[3] = &unk_1001BD0D8;
  id v16 = v15;
  id v18 = v16;
  [(SagaRequestHandler *)self _addLibraryOperation:v14 priority:2 noLibraryHandler:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)setAlbumEntityProperties:(id)a3 withAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting album properties %{public}@ with album persistent ID: %lld", buf, 0x20u);
  }

  uint64_t v14 = [[SagaSetAlbumPropertyOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v11 albumPersistentID:a4 properties:v10];
  objc_initWeak((id *)buf, v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008AA38;
  v19[3] = &unk_1001BC2E0;
  id v15 = v12;
  id v20 = v15;
  objc_copyWeak(&v21, (id *)buf);
  [(SagaSetAlbumPropertyOperation *)v14 setCompletionBlock:v19];
  [(SagaSetAlbumPropertyOperation *)v14 setName:@"com.apple.itunescloudd.SagaRequestHandler.setAlbumPropertiesOperation"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008AAB8;
  v17[3] = &unk_1001BD0D8;
  id v16 = v15;
  id v18 = v16;
  [(SagaRequestHandler *)self _addLibraryOperation:v14 priority:2 noLibraryHandler:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)setAlbumProperties:(id)a3 forItemsWithAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting album properties %{public}@ on items with album persistent ID: %lld", buf, 0x20u);
  }

  uint64_t v14 = [[SagaSetAlbumItemPropertyOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v11 albumPersistentID:a4 albumItemProperties:v10];
  objc_initWeak((id *)buf, v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008AD3C;
  v19[3] = &unk_1001BC2E0;
  id v15 = v12;
  id v20 = v15;
  objc_copyWeak(&v21, (id *)buf);
  [(SagaSetAlbumItemPropertyOperation *)v14 setCompletionBlock:v19];
  [(SagaSetAlbumItemPropertyOperation *)v14 setName:@"com.apple.itunescloudd.SagaRequestHandler.setAlbumPropertiesOperation"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008ADBC;
  v17[3] = &unk_1001BD0D8;
  id v16 = v15;
  id v18 = v16;
  [(SagaRequestHandler *)self _addLibraryOperation:v14 priority:2 noLibraryHandler:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = ICCloudClientGetStringForAddToLibraryBehavior();
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting cloud add to library behavior to: %{public}@", buf, 0x16u);
  }
  id v12 = [[CloudSetFavoriteSongAddToLibraryBehaviorOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v8 addToLibraryBehavior:a3];
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008B02C;
  v17[3] = &unk_1001BC2E0;
  id v13 = v9;
  id v18 = v13;
  objc_copyWeak(&v19, (id *)buf);
  [(CloudSetFavoriteSongAddToLibraryBehaviorOperation *)v12 setCompletionBlock:v17];
  [(CloudSetFavoriteSongAddToLibraryBehaviorOperation *)v12 setName:@"com.apple.itunescloudd.SagaRequestHandler.setAddToLibraryBehaviorOperation"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008B0B4;
  v15[3] = &unk_1001BD0D8;
  id v14 = v13;
  id v16 = v14;
  [(SagaRequestHandler *)self _addLibraryOperation:v12 priority:2 noLibraryHandler:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = ICCloudClientGetStringForAddToPlaylistBehavior();
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting cloud add to playlist behavior to: %{public}@", buf, 0x16u);
  }
  id v12 = [[CloudSetAddToPlaylistBehaviorOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v8 addToPlaylistBehavior:a3];
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008B324;
  v17[3] = &unk_1001BC2E0;
  id v13 = v9;
  id v18 = v13;
  objc_copyWeak(&v19, (id *)buf);
  [(CloudSetAddToPlaylistBehaviorOperation *)v12 setCompletionBlock:v17];
  [(CloudSetAddToPlaylistBehaviorOperation *)v12 setName:@"com.apple.itunescloudd.SagaRequestHandler.setAddToPlaylistBehaviorOperation"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008B3AC;
  v15[3] = &unk_1001BD0D8;
  id v14 = v13;
  id v16 = v14;
  [(SagaRequestHandler *)self _addLibraryOperation:v12 priority:2 noLibraryHandler:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)addStorePlaylistWithGlobalID:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received request to add store playlist with global ID: %{public}@", buf, 0x16u);
  }

  id v12 = [[SagaCloudAddPlaylistOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v9 playlistGlobalID:v8];
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008B618;
  v17[3] = &unk_1001BCD88;
  objc_copyWeak(&v19, (id *)buf);
  void v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  [(SagaCloudAddPlaylistOperation *)v12 setCompletionBlock:v17];
  [(SagaCloudAddPlaylistOperation *)v12 setName:@"com.apple.itunescloudd.SagaRequestHandler.cloudAddOperation"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008B728;
  v15[3] = &unk_1001BD0D8;
  id v14 = v13;
  id v16 = v14;
  [(SagaRequestHandler *)self _addLibraryOperation:v12 priority:2 noLibraryHandler:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)addStoreItemWithOpaqueID:(id)a3 requestingBundleID:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received request to add store item with opaque ID: %{public}@ from %{public}@", buf, 0x20u);
  }

  id v15 = [[SagaCloudSDKAddOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v13 opaqueID:v10 bundleID:v11];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10008B9F0;
  v20[3] = &unk_1001BBFB0;
  id v16 = v12;
  id v21 = v16;
  [(SagaCloudSDKAddOperation *)v15 setUpdateCompletionBlock:v20];
  [(SagaCloudSDKAddOperation *)v15 setName:@"com.apple.itunescloudd.SagaRequestHandler.cloudAddOperation"];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008BA08;
  v18[3] = &unk_1001BD0D8;
  id v19 = v16;
  id v17 = v16;
  [(SagaRequestHandler *)self _addLibraryOperation:v15 priority:2 noLibraryHandler:v18];
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 albumAdamID])
  {
    id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v32 = self;
      __int16 v33 = 2048;
      int64_t v34 = a3;
      __int16 v35 = 2048;
      id v36 = [v10 albumAdamID];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received request to add store item with adam ID: %lld (referral albumAdamID = %lld)", buf, 0x20u);
    }

    id v14 = -[SagaCloudAddItemOperation initWithConfiguration:adamID:referralAlbumAdamID:clientIdentity:]([SagaCloudAddItemOperation alloc], "initWithConfiguration:adamID:referralAlbumAdamID:clientIdentity:", self->_configuration, a3, [v10 albumAdamID], v11);
LABEL_5:
    id v15 = v14;
    goto LABEL_10;
  }
  id v16 = [v10 playlistGlobalID];
  id v17 = [v16 length];

  id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138543618;
      id v32 = self;
      __int16 v33 = 2048;
      int64_t v34 = a3;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received request to add store item with adam ID: %lld", buf, 0x16u);
    }

    id v14 = [[SagaCloudAddItemOperation alloc] initWithConfiguration:self->_configuration adamID:a3 clientIdentity:v11];
    goto LABEL_5;
  }
  if (v19)
  {
    id v20 = [v10 playlistGlobalID];
    *(_DWORD *)buf = 138543874;
    id v32 = self;
    __int16 v33 = 2048;
    int64_t v34 = a3;
    __int16 v35 = 2114;
    id v36 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ - Received request to add store item with adam ID: %lld (referral playlistGlobalID = %{public}@)", buf, 0x20u);
  }
  id v21 = [SagaCloudAddItemOperation alloc];
  configuration = self->_configuration;
  id v23 = [v10 playlistGlobalID];
  id v15 = [(SagaCloudAddItemOperation *)v21 initWithConfiguration:configuration adamID:a3 referralPlaylistGlobalID:v23 clientIdentity:v11];

LABEL_10:
  objc_initWeak((id *)buf, v15);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  void v28[2] = sub_10008BE14;
  v28[3] = &unk_1001BCD88;
  objc_copyWeak(&v30, (id *)buf);
  v28[4] = self;
  id v24 = v12;
  id v29 = v24;
  [(SagaCloudAddItemOperation *)v15 setCompletionBlock:v28];
  [(SagaCloudAddItemOperation *)v15 setName:@"com.apple.itunescloudd.SagaRequestHandler.cloudAddOperation"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10008BED0;
  v26[3] = &unk_1001BD0D8;
  id v25 = v24;
  id v27 = v25;
  [(SagaRequestHandler *)self _addLibraryOperation:v15 priority:2 noLibraryHandler:v26];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 requestReason:(int64_t)a5 pinnedOnly:(BOOL)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = ICCloudClientGetStringForRequestReason();
    *(_DWORD *)buf = 138543874;
    id v28 = self;
    __int16 v29 = 2114;
    id v30 = v18;
    __int16 v31 = 2114;
    id v32 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating subscribed playlists (reason = %{public}@) with cloud ids = %{public}@", buf, 0x20u);
  }
  BOOL v19 = [[SagaUpdateSubscribedPlaylistsOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v15 subscribedPlaylistSagaIDs:v14 ignoreMinRefreshInterval:v12 requestReason:a5 pinnedOnly:v10];
  objc_initWeak((id *)buf, v19);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008C188;
  v24[3] = &unk_1001BC2E0;
  id v20 = v16;
  id v25 = v20;
  objc_copyWeak(&v26, (id *)buf);
  [(SagaUpdateSubscribedPlaylistsOperation *)v19 setCompletionBlock:v24];
  [(SagaUpdateSubscribedPlaylistsOperation *)v19 setName:@"com.apple.itunescloudd.SagaRequestHandler.updateSubscribedPlaylistsOperation"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008C208;
  v22[3] = &unk_1001BD0D8;
  id v21 = v20;
  id v23 = v21;
  [(SagaRequestHandler *)self _addLibraryOperation:v19 priority:2 noLibraryHandler:v22];

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v22 = self;
    __int16 v23 = 2048;
    int64_t v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Setting artwork on saga playlist (pid = %lld)", buf, 0x16u);
  }

  id v11 = [[SagaUploadPlaylistArtworkOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v8 playlistPersistentID:a3];
  objc_initWeak((id *)buf, v11);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10008C45C;
  id v18 = &unk_1001BC2E0;
  id v12 = v9;
  id v19 = v12;
  objc_copyWeak(&v20, (id *)buf);
  [(SagaUploadPlaylistArtworkOperation *)v11 setCompletionBlock:&v15];
  id v13 = [(SagaRequestHandler *)self _library];
  if (v13)
  {
    [(SagaUploadPlaylistArtworkOperation *)v11 setName:@"com.apple.itunescloudd.SagaRequestHandler.uploadPlaylistArtworkOperation"];
    [v13 addBackgroundOperation:v11 priority:2];
  }
  else if (v12)
  {
    id v14 = +[NSError ic_cloudClientErrorWithCode:2009 userInfo:0];
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
  }
  objc_destroyWeak(&v20);

  objc_destroyWeak((id *)buf);
}

- (void)removePlaylistsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Removing playlists with cloud ids = %{public}@", buf, 0x16u);
  }

  id v12 = [[SagaRemovePlaylistOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v9 playlistSagaIDs:v8];
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008C734;
  v17[3] = &unk_1001BC2E0;
  id v13 = v10;
  id v18 = v13;
  objc_copyWeak(&v19, (id *)buf);
  [(SagaRemovePlaylistOperation *)v12 setCompletionBlock:v17];
  [(SagaRemovePlaylistOperation *)v12 setName:@"com.apple.itunescloudd.SagaRequestHandler.removePlaylistOperation"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008C7B4;
  v15[3] = &unk_1001BD0D8;
  id v14 = v13;
  id v16 = v14;
  [(SagaRequestHandler *)self _addLibraryOperation:v12 priority:2 noLibraryHandler:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)removeItemsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ - Removing items with cloud ids = %{public}@", buf, 0x16u);
  }

  id v12 = [[SagaRemoveItemOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v9 itemSagaIDs:v8];
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10008CA24;
  v17[3] = &unk_1001BC2E0;
  id v13 = v10;
  id v18 = v13;
  objc_copyWeak(&v19, (id *)buf);
  [(SagaRemoveItemOperation *)v12 setCompletionBlock:v17];
  [(SagaRemoveItemOperation *)v12 setName:@"com.apple.itunescloudd.SagaRequestHandler.removeItemOperation"];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008CAA4;
  v15[3] = &unk_1001BD0D8;
  id v14 = v13;
  id v16 = v14;
  [(SagaRequestHandler *)self _addLibraryOperation:v12 priority:2 noLibraryHandler:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)publishPlaylistWithSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ - Publishing playlist with cloud id = %llu.", buf, 0x16u);
  }

  id v11 = [[SagaPublishPlaylistOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v8 sagaID:a3];
  objc_initWeak((id *)buf, v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008CD00;
  v16[3] = &unk_1001BC2E0;
  id v12 = v9;
  id v17 = v12;
  objc_copyWeak(&v18, (id *)buf);
  [(SagaPublishPlaylistOperation *)v11 setCompletionBlock:v16];
  [(SagaPublishPlaylistOperation *)v11 setName:@"com.apple.itunescloudd.SagaRequestHandler.publishPlaylistOperation"];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008CDC4;
  v14[3] = &unk_1001BD0D8;
  id v13 = v12;
  id v15 = v13;
  [(SagaRequestHandler *)self _addLibraryOperation:v11 priority:2 noLibraryHandler:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    id v30 = self;
    __int16 v31 = 2048;
    int64_t v32 = a5;
    __int16 v33 = 2114;
    id v34 = v17;
    __int16 v35 = 2114;
    id v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating cloud playlist (pid = %lld) for %{public}@, setting properties: %{public}@", buf, 0x2Au);
  }

  id v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = self;
    __int16 v31 = 2114;
    int64_t v32 = (int64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - ... with cloud tracks: %{public}@", buf, 0x16u);
  }

  __int16 v21 = [[SagaSDKUpdatePlaylistOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v16 playlistPersistentID:a5 properties:v14 trackList:v15 requestingBundleID:v17];
  objc_initWeak((id *)buf, v21);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10008D0F8;
  v26[3] = &unk_1001BCD88;
  id v22 = v18;
  id v27 = v22;
  objc_copyWeak(&v28, (id *)buf);
  void v26[4] = self;
  [(SagaSDKUpdatePlaylistOperation *)v21 setCompletionBlock:v26];
  [(SagaSDKUpdatePlaylistOperation *)v21 setName:@"com.apple.itunescloudd.SagaRequestHandler.updatePlaylistOperation"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008D210;
  v24[3] = &unk_1001BD0D8;
  id v23 = v22;
  id v25 = v23;
  [(SagaRequestHandler *)self _addLibraryOperation:v21 priority:2 noLibraryHandler:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = self;
    __int16 v28 = 2048;
    int64_t v29 = a5;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating cloud playlist (pid = %lld), setting properties: %{public}@", buf, 0x20u);
  }

  id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v27 = self;
    __int16 v28 = 2114;
    int64_t v29 = (int64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - ... with cloud tracks: %{public}@", buf, 0x16u);
  }

  id v18 = [[SagaUpdatePlaylistOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v14 playlistPersistentID:a5 properties:v12 trackList:v13];
  objc_initWeak((id *)buf, v18);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10008D524;
  v23[3] = &unk_1001BCD88;
  id v19 = v15;
  id v24 = v19;
  objc_copyWeak(&v25, (id *)buf);
  v23[4] = self;
  [(SagaUpdatePlaylistOperation *)v18 setCompletionBlock:v23];
  [(SagaUpdatePlaylistOperation *)v18 setName:@"com.apple.itunescloudd.SagaRequestHandler.updatePlaylistOperation"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008D5FC;
  v21[3] = &unk_1001BD0D8;
  id v20 = v19;
  id v22 = v20;
  [(SagaRequestHandler *)self _addLibraryOperation:v18 priority:2 noLibraryHandler:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = self;
    __int16 v26 = 2048;
    unint64_t v27 = a3;
    __int16 v28 = 2048;
    int64_t v29 = a4;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Adding item with saga ID: %llu to cloud playlist (pid = %lld)", buf, 0x20u);
  }

  id v16 = [[SagaSDKAddItemToPlaylistOperation alloc] initWithConfiguration:self->_configuration itemSagaID:a3 playlistPersistentID:a4 clientIdentity:v13 requestingBundleID:v12];
  objc_initWeak((id *)buf, v16);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008D888;
  v21[3] = &unk_1001BC2E0;
  id v17 = v14;
  id v22 = v17;
  objc_copyWeak(&v23, (id *)buf);
  [(SagaSDKAddItemToPlaylistOperation *)v16 setCompletionBlock:v21];
  [(SagaSDKAddItemToPlaylistOperation *)v16 setName:@"com.apple.itunescloudd.SagaRequestHandler.addItemToPlaylistOperation"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008D908;
  v19[3] = &unk_1001BD0D8;
  id v18 = v17;
  id v20 = v18;
  [(SagaRequestHandler *)self _addLibraryOperation:v16 priority:2 noLibraryHandler:v19];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = self;
    __int16 v26 = 2114;
    id v27 = v12;
    __int16 v28 = 2048;
    int64_t v29 = a4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - Adding store item with opaque ID: %{public}@ to cloud playlist (pid = %lld)", buf, 0x20u);
  }

  id v17 = [[SagaCloudSDKAddItemToPlaylistOperation alloc] initWithConfiguration:self->_configuration clientIdentity:v14 opaqueID:v12 bundleID:v15 playlistPersistentID:a4];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008DB4C;
  v22[3] = &unk_1001BBFB0;
  id v18 = v13;
  id v23 = v18;
  [(SagaCloudSDKAddOperation *)v17 setUpdateCompletionBlock:v22];
  [(SagaCloudSDKAddItemToPlaylistOperation *)v17 setName:@"com.apple.itunescloudd.SagaRequestHandler.addItemToPlaylistOperation"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10008DB64;
  v20[3] = &unk_1001BD0D8;
  id v21 = v18;
  id v19 = v18;
  [(SagaRequestHandler *)self _addLibraryOperation:v17 priority:2 noLibraryHandler:v20];
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v22 = self;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ - Adding item with saga ID: %llu to cloud playlist (pid = %lld)", buf, 0x20u);
  }

  id v13 = [[SagaAddItemToPlaylistOperation alloc] initWithConfiguration:self->_configuration itemSagaID:a3 playlistPersistentID:a4 clientIdentity:v10];
  objc_initWeak((id *)buf, v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008DDD8;
  v18[3] = &unk_1001BC2E0;
  id v14 = v11;
  id v19 = v14;
  objc_copyWeak(&v20, (id *)buf);
  [(SagaAddItemToPlaylistOperation *)v13 setCompletionBlock:v18];
  [(SagaAddItemToPlaylistOperation *)v13 setName:@"com.apple.itunescloudd.SagaRequestHandler.addItemToPlaylistOperation"];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10008DE58;
  v16[3] = &unk_1001BD0D8;
  id v15 = v14;
  id v17 = v15;
  [(SagaRequestHandler *)self _addLibraryOperation:v13 priority:2 noLibraryHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ([v12 albumAdamID])
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v34 = self;
      __int16 v35 = 2048;
      int64_t v36 = a3;
      __int16 v37 = 2048;
      int64_t v38 = a5;
      __int16 v39 = 2048;
      id v40 = [v12 albumAdamID];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ - Adding store item with adam ID: %lld to cloud playlist (pid = %lld, referral albumAdamID = %lld)", buf, 0x2Au);
    }

    id v16 = -[SagaCloudAddItemToPlaylistOperation initWithConfiguration:adamID:playlistPersistentID:referralAlbumAdamID:clientIdentity:]([SagaCloudAddItemToPlaylistOperation alloc], "initWithConfiguration:adamID:playlistPersistentID:referralAlbumAdamID:clientIdentity:", self->_configuration, a3, a5, [v12 albumAdamID], v13);
LABEL_5:
    id v17 = v16;
    goto LABEL_10;
  }
  id v18 = [v12 playlistGlobalID];
  id v19 = [v18 length];

  id v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138543874;
      id v34 = self;
      __int16 v35 = 2048;
      int64_t v36 = a3;
      __int16 v37 = 2048;
      int64_t v38 = a5;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Adding store item with adam ID: %lld to cloud playlist (pid = %lld)", buf, 0x20u);
    }

    id v16 = [[SagaCloudAddItemToPlaylistOperation alloc] initWithConfiguration:self->_configuration adamID:a3 playlistPersistentID:a5 clientIdentity:v13];
    goto LABEL_5;
  }
  if (v21)
  {
    id v22 = [v12 playlistGlobalID];
    *(_DWORD *)buf = 138544130;
    id v34 = self;
    __int16 v35 = 2048;
    int64_t v36 = a3;
    __int16 v37 = 2048;
    int64_t v38 = a5;
    __int16 v39 = 2114;
    id v40 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - Adding store item with adam ID: %lld to cloud playlist (pid = %lld, referral playlistGlobalID = %{public}@)", buf, 0x2Au);
  }
  __int16 v23 = [SagaCloudAddItemToPlaylistOperation alloc];
  configuration = self->_configuration;
  __int16 v25 = [v12 playlistGlobalID];
  id v17 = [(SagaCloudAddItemToPlaylistOperation *)v23 initWithConfiguration:configuration adamID:a3 playlistPersistentID:a5 referralPlaylistGlobalID:v25 clientIdentity:v13];

LABEL_10:
  objc_initWeak((id *)buf, v17);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10008E290;
  v30[3] = &unk_1001BCD88;
  objc_copyWeak(&v32, (id *)buf);
  v30[4] = self;
  id v26 = v14;
  id v31 = v26;
  [(SagaCloudAddItemToPlaylistOperation *)v17 setCompletionBlock:v30];
  [(SagaCloudAddItemToPlaylistOperation *)v17 setName:@"com.apple.itunescloudd.SagaRequestHandler.addItemToPlaylistOperation"];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  void v28[2] = sub_10008E32C;
  v28[3] = &unk_1001BD0D8;
  id v27 = v26;
  id v29 = v27;
  [(SagaRequestHandler *)self _addLibraryOperation:v17 priority:2 noLibraryHandler:v28];

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v15 firstObject];
    *(_DWORD *)buf = 138543874;
    __int16 v30 = self;
    __int16 v31 = 2048;
    int64_t v32 = a3;
    __int16 v33 = 2048;
    id v34 = [v20 unsignedLongLongValue];
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating Genius playlist (pid = %lld) with seed ID: %lld", buf, 0x20u);
  }
  BOOL v21 = [[SagaCreateGeniusPlaylistOperation alloc] initWithConfiguration:self->_configuration geniusPlaylistPersistentID:a3 playlistName:v14 seedItemIDs:v15 itemIDs:v16 clientIdentity:v17];
  objc_initWeak((id *)buf, v21);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10008E5F8;
  v26[3] = &unk_1001BC2E0;
  id v22 = v18;
  id v27 = v22;
  objc_copyWeak(&v28, (id *)buf);
  [(SagaCreateGeniusPlaylistOperation *)v21 setCompletionBlock:v26];
  [(SagaCreateGeniusPlaylistOperation *)v21 setName:@"com.apple.itunescloudd.SagaRequestHandler.createGeniusPlaylistOperation"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008E69C;
  v24[3] = &unk_1001BD0D8;
  id v23 = v22;
  id v25 = v23;
  [(SagaRequestHandler *)self _addLibraryOperation:v21 priority:2 noLibraryHandler:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 requestingBundleID:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v30 = self;
    __int16 v31 = 2114;
    id v32 = v16;
    __int16 v33 = 2114;
    id v34 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating cloud playlist for %{public}@ with initial properties: %{public}@", buf, 0x20u);
  }

  id v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v30 = self;
    __int16 v31 = 2114;
    id v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ - ... with cloud tracks: %{public}@", buf, 0x16u);
  }

  BOOL v21 = [[SagaSDKCreatePlaylistOperation alloc] initWithConfiguration:self->_configuration playlistPersistentID:a3 properties:v14 trackList:v15 requestingBundleID:v16 clientIdentity:v17];
  objc_initWeak((id *)buf, v21);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10008E9C0;
  v26[3] = &unk_1001BCD88;
  id v22 = v18;
  id v27 = v22;
  objc_copyWeak(&v28, (id *)buf);
  void v26[4] = self;
  [(SagaSDKCreatePlaylistOperation *)v21 setCompletionBlock:v26];
  [(SagaSDKCreatePlaylistOperation *)v21 setName:@"com.apple.itunescloudd.SagaRequestHandler.createPlaylistOperation"];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10008EAEC;
  v24[3] = &unk_1001BD0D8;
  id v23 = v22;
  id v25 = v23;
  [(SagaRequestHandler *)self _addLibraryOperation:v21 priority:2 noLibraryHandler:v24];

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ - Creating cloud playlist with initial properties: %{public}@", buf, 0x16u);
  }

  id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ - ... with cloud tracks: %{public}@", buf, 0x16u);
  }

  id v18 = [[SagaCreatePlaylistOperation alloc] initWithConfiguration:self->_configuration playlistPersistentID:a3 properties:v12 trackList:v13 clientIdentity:v14];
  objc_initWeak((id *)buf, v18);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10008EE4C;
  v23[3] = &unk_1001BC2E0;
  id v19 = v15;
  id v24 = v19;
  objc_copyWeak(&v25, (id *)buf);
  [(SagaCreatePlaylistOperation *)v18 setCompletionBlock:v23];
  [(SagaCreatePlaylistOperation *)v18 setName:@"com.apple.itunescloudd.SagaRequestHandler.createPlaylistOperation"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10008EEF0;
  v21[3] = &unk_1001BD0D8;
  id v20 = v19;
  id v22 = v20;
  [(SagaRequestHandler *)self _addLibraryOperation:v18 priority:2 noLibraryHandler:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)uploadPlaylistPropertiesWithClientIdentity:(id)a3 minimumTimeInterval:(double)a4
{
  id v6 = a3;
  uploadPlaylistPropertiesQueue = self->_uploadPlaylistPropertiesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008EFB8;
  block[3] = &unk_1001BDCF8;
  void block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(uploadPlaylistPropertiesQueue, block);
}

- (void)uploadItemPropertiesWithClientIdentity:(id)a3 minimumTimeInterval:(double)a4
{
  id v6 = a3;
  uploadItemPropertiesQueue = self->_uploadItemPropertiesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008F564;
  block[3] = &unk_1001BDCF8;
  void block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(uploadItemPropertiesQueue, block);
}

- (void)updatePlaylistPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating playlist play data", buf, 0xCu);
  }

  id v9 = +[ICURLBagProvider sharedBagProvider];
  id v10 = objc_alloc((Class)ICStoreRequestContext);
  double v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  id v12 = [v10 initWithIdentity:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008FCC4;
  v15[3] = &unk_1001BD8E8;
  void v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v9 getBagForRequestContext:v12 withCompletionHandler:v15];
}

- (void)updateItemPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating item play data", buf, 0xCu);
  }

  id v9 = +[ICURLBagProvider sharedBagProvider];
  id v10 = objc_alloc((Class)ICStoreRequestContext);
  double v11 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  id v12 = [v10 initWithIdentity:v11];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100090008;
  v15[3] = &unk_1001BD8E8;
  void v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v9 getBagForRequestContext:v12 withCompletionHandler:v15];
}

- (void)increasePriorityForAllOperations
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - increasePriorityForAllOperations:", buf, 0xCu);
  }

  if ((MSVDeviceSupportsMultipleLibraries() & 1) == 0)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SagaRequestHandler.m", 214, @"Invalid parameter not satisfying: %@", @"MSVDeviceSupportsMultipleLibraries()" object file lineNumber description];
  }
  updateCloudLibraryQueue = self->_updateCloudLibraryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090314;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_sync(updateCloudLibraryQueue, block);
  [(CloudArtworkImporter *)self->_artworkImporter increasePriorityForAllOperations];
  [(CloudLibrary *)self->_library increasePriorityForAllOperations];
}

- (void)decreasePriorityForAllOperations
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - decreasePriorityForAllOperations:", buf, 0xCu);
  }

  if ((MSVDeviceSupportsMultipleLibraries() & 1) == 0)
  {
    id v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SagaRequestHandler.m", 202, @"Invalid parameter not satisfying: %@", @"MSVDeviceSupportsMultipleLibraries()" object file lineNumber description];
  }
  updateCloudLibraryQueue = self->_updateCloudLibraryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100090490;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_sync(updateCloudLibraryQueue, block);
  [(CloudArtworkImporter *)self->_artworkImporter decreasePriorityForAllOperations];
  [(CloudLibrary *)self->_library decreasePriorityForAllOperations];
}

- (void)cancelOperations
{
  float v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - cancelOperations: - Starting...", buf, 0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000905A0;
  v4[3] = &unk_1001BEC20;
  v4[4] = self;
  [(SagaRequestHandler *)self cancelPendingChangesWithCompletion:v4];
}

- (void)cancelOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  char v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - cancelOperationsWithCompletion: - Starting...", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000908D0;
  v7[3] = &unk_1001BEC48;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SagaRequestHandler *)self cancelPendingChangesWithCompletion:v7];
}

- (void)cancelPendingChanges
{
}

- (void)cancelPendingChangesWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  char v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    library = self->_library;
    id v7 = [(CloudLibrary *)library pendingChangesCoordinator];
    int v11 = 138543874;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = library;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - cancelPendingChangesWithCompletion: - Library=%@ - PendingChangesCoordinator:%@", (uint8_t *)&v11, 0x20u);
  }
  id v8 = self->_library;
  if (v8
    && ([(CloudLibrary *)v8 pendingChangesCoordinator],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    id v10 = [(CloudLibrary *)self->_library pendingChangesCoordinator];
    [v10 removeAllPendingChangesWithCompletion:v4];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)addBackgroundOperation:(id)a3 priority:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    id v6 = a3;
    id v7 = [(SagaRequestHandler *)self _library];
    [v7 addBackgroundOperation:v6 priority:v4];
  }
}

- (void)addOperation:(id)a3 priority:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    id v6 = a3;
    id v7 = [(SagaRequestHandler *)self _library];
    [v7 addOperation:v6 priority:v4];
  }
}

- (SagaRequestHandler)initWithConfiguration:(id)a3 progressObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)SagaRequestHandler;
  id v9 = [(SagaRequestHandler *)&v35 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    int v11 = [v7 userIdentity];
    uint64_t v12 = +[ML3MusicLibrary musicLibraryForUserAccount:v11];
    musicLibrary = v10->_musicLibrary;
    v10->_musicLibrary = (ML3MusicLibrary *)v12;

    id v14 = [[SagaArtworkImporter alloc] initWithConfiguration:v7];
    artworkImporter = v10->_artworkImporter;
    v10->_artworkImporter = v14;

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100090F9C;
    v33[3] = &unk_1001BBC40;
    id v34 = v7;
    id v16 = objc_retainBlock(v33);
    ((void (*)(void *, const __CFString *))v16[2])(v16, @"com.apple.itunescloudd.sagaUploadItemPropertiesQueue");
    id v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    uploadItemPropertiesQueue = v10->_uploadItemPropertiesQueue;
    v10->_uploadItemPropertiesQueue = (OS_dispatch_queue *)v18;

    ((void (*)(void *, const __CFString *))v16[2])(v16, @"com.apple.itunescloudd.sagaUploadPlaylistPropertiesQueue");
    id v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 UTF8String], 0);
    uploadPlaylistPropertiesQueue = v10->_uploadPlaylistPropertiesQueue;
    v10->_uploadPlaylistPropertiesQueue = (OS_dispatch_queue *)v21;

    ((void (*)(void *, const __CFString *))v16[2])(v16, @"com.apple.itunescloudd.sagaUpdateLibraryQueue");
    id v23 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], 0);
    updateCloudLibraryQueue = v10->_updateCloudLibraryQueue;
    v10->_updateCloudLibraryQueue = (OS_dispatch_queue *)v24;

    ((void (*)(void *, const __CFString *))v16[2])(v16, @"com.apple.itunescloudd.calloutQueue");
    id v26 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v27 = dispatch_queue_create((const char *)[v26 UTF8String], (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    calloutQueue = v10->_calloutQueue;
    v10->_calloutQueue = (OS_dispatch_queue *)v27;

    id v29 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    updateLibraryCompletionHandlers = v10->_updateLibraryCompletionHandlers;
    v10->_updateLibraryCompletionHandlers = v29;

    __int16 v31 = +[ICEnvironmentMonitor sharedMonitor];
    [v31 registerObserver:v10];

    objc_storeStrong((id *)&v10->_updateTaskHelper, a4);
  }

  return v10;
}

- (SagaRequestHandler)init
{
  return 0;
}

- (void)dealloc
{
  float v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - dealloc", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = self->_updateLibraryCompletionHandlers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v8) + 16))();
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)SagaRequestHandler;
  [(SagaRequestHandler *)&v9 dealloc];
}

@end