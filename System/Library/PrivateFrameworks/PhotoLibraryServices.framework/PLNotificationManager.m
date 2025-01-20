@interface PLNotificationManager
+ (id)_bestDateForDeliveringNotification;
+ (id)_bestDateForDeliveringNotificationFromCoreDuetWithError:(id *)a3;
+ (id)_notificationDeliveryDate;
+ (id)filteredAlbumListForContentMode:(int)a3 library:(id)a4;
+ (id)sharedManager;
- (BOOL)_alertFiltrationEnabled;
- (BOOL)_isMyEmailAddress:(id)a3;
- (BOOL)_notificationType:(int64_t)a3 matchesCommentsOrLikeNotifications:(BOOL)a4 andPhotosAddedToAlbumNotifications:(BOOL)a5;
- (BOOL)_shouldAllowAlertsFromContactWithEmail:(id)a3;
- (BOOL)enableTemporaryDebugMode;
- (PLNotificationManager)init;
- (PLNotificationUNCenter)UNCenter;
- (id)_addWaitingNotification:(id)a3 forPhotosBatchID:(id)a4;
- (id)_generateMemoryNotificationRepresentationWithMemoryUUID:(id)a3 keyAssetUUID:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6 notificationDeliveryDate:(id)a7 pathManager:(id)a8;
- (id)_initSharedInstance;
- (id)_memoryNotificationFromDictionaryRepresentation:(id)a3;
- (id)_waitingNotificationForPhotosBatchID:(id)a3;
- (id)contactStore;
- (unint64_t)_appBadgeCount;
- (void)_deleteNotificationsForAlbumWithUUID:(id)a3 notificationTypes:(id)a4;
- (void)_deleteNotificationsForAssetWithUUID:(id)a3 shouldDeleteCommentsOrLikeNotifications:(BOOL)a4 shouldDeletePhotosAddedToAlbumNotifications:(BOOL)a5;
- (void)_deleteNotificationsForMemoriesWithUUID:(id)a3 notificationTypes:(id)a4;
- (void)_deleteNotificationsForObjectWithUUID:(id)a3 notificationDictionaryKey:(id)a4 notificationTypes:(id)a5;
- (void)_postAsyncNotificationForAcceptedSharedLibraryWithScopeIdentifier:(id)a3 participantName:(id)a4 NotificationDeliveryDate:(id)a5 transaction:(id)a6;
- (void)_postAsyncNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3 transaction:(id)a4;
- (void)_postAsyncNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3 transaction:(id)a4;
- (void)_postAsyncNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5 withNotificationDeliveryDate:(id)a6 transaction:(id)a7;
- (void)_postAsyncNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3 transaction:(id)a4;
- (void)_postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5 notificationDeliveryDate:(id)a6 transaction:(id)a7;
- (void)_removeWaitingNotificationForPhotosBatchID:(id)a3;
- (void)_resetAlertFiltration;
- (void)_updateImageDataForNotification:(id)a3;
- (void)calculateCurrentBadgeCountWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)discardAllNotifications;
- (void)getThumbnailImageDataAssetUUID:(id)a3 completionHandler:(id)a4;
- (void)noteDidChangePlaceholderKindForAsset:(id)a3 fromOldKind:(signed __int16)a4 forSharedAlbum:(id)a5 mstreamdInfo:(id)a6;
- (void)noteDidDeleteSharedAlbum:(id)a3;
- (void)noteDidDeleteSharedAssetsWithUUIDs:(id)a3;
- (void)noteDidReceiveAssets:(id)a3 forSharedAlbum:(id)a4 mstreamdInfo:(id)a5;
- (void)noteDidReceiveCMMInvitationWithMomentShare:(id)a3;
- (void)noteDidReceiveComment:(id)a3 mstreamdInfo:(id)a4;
- (void)noteDidReceiveExpiringCMMInvitationsWithMomentShares:(id)a3;
- (void)noteDidReceiveInvitationForSharedAlbum:(id)a3;
- (void)noteDidReceiveLike:(id)a3 mstreamdInfo:(id)a4;
- (void)noteInvitationRecordStatusChanged:(id)a3 fromOldState:(int64_t)a4 mstreamdInfo:(id)a5;
- (void)noteMultipleContributorStatusChangedForAlbum:(id)a3 mstreamdInfo:(id)a4;
- (void)noteSharedAlbumUnseenStatusDidChange:(id)a3;
- (void)noteSharedAssetCommentsUnreadStatusDidChange:(id)a3;
- (void)noteUserAssetsAreReadyForMomentShare:(id)a3;
- (void)noteUserDidChangeStatusForMomentShare:(id)a3 photoLibrary:(id)a4;
- (void)noteUserDidDeleteSharedAlbumWithUUID:(id)a3;
- (void)noteUserDidDeleteSharedAssetsWithUUIDs:(id)a3;
- (void)noteUserDidLeavePhotosApplication;
- (void)noteUserDidNavigateAwayFromSharedAlbum:(id)a3 photoLibrary:(id)a4;
- (void)noteUserDidNavigateIntoSharedAlbum:(id)a3 photoLibrary:(id)a4;
- (void)noteUserDidReadCommentOnSharedAsset:(id)a3 photoLibrary:(id)a4;
- (void)noteUserDidViewCloudFeedContent:(unint64_t)a3 photoLibrary:(id)a4;
- (void)postNotificationForAcceptedSharedLibraryWithScopeIdentifier:(id)a3 participantName:(id)a4 library:(id)a5 notificationDeliveryDate:(id)a6;
- (void)postNotificationForExpiringCMMsWithUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6;
- (void)postNotificationForInterestInUnrenderedCinematicVideoItems;
- (void)postNotificationForInterestingMemoryWithMemoryUUID:(id)a3 library:(id)a4 notificationDeliveryDate:(id)a5;
- (void)postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3;
- (void)postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3;
- (void)postNotificationForReadyToViewMomentShareWithUUID:(id)a3 photoLibrary:(id)a4;
- (void)postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5 notificationDeliveryDate:(id)a6;
- (void)postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5 withNotificationDeliveryDate:(id)a6;
- (void)postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3;
- (void)removeNotificationForInterestInUnrenderedCinematicVideoItems;
- (void)removeNotificationForInterestingMemoryWithUUID:(id)a3;
- (void)removeNotificationForSharedLibraryParticipantAssetTrash;
- (void)reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3;
- (void)sendResponse:(BOOL)a3 toPhotoStreamInvitationForAlbumWithCloudGUID:(id)a4;
- (void)setEnableTemporaryDebugMode:(BOOL)a3;
- (void)setUNCenter:(id)a3;
- (void)triggerNotificationThumbnailUpdateForAsset:(id)a3;
- (void)userViewedNotificationWithAlbumCloudGUID:(id)a3;
@end

@implementation PLNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UNCenter, 0);
  objc_storeStrong((id *)&self->_waitingAssetsAddNotifications, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (void)setUNCenter:(id)a3
{
}

- (PLNotificationUNCenter)UNCenter
{
  return self->_UNCenter;
}

- (void)_resetAlertFiltration
{
}

uint64_t __46__PLNotificationManager__resetAlertFiltration__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 24) = -1;
  return result;
}

- (BOOL)_alertFiltrationEnabled
{
  int alertFiltrationEnabled = self->_alertFiltrationEnabled;
  if (alertFiltrationEnabled == -1)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"IncomingMessageAlertFiltration", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v5 = AppBooleanValue == 0;
    }
    else {
      BOOL v5 = 1;
    }
    int alertFiltrationEnabled = !v5;
    self->_int alertFiltrationEnabled = alertFiltrationEnabled;
  }
  return alertFiltrationEnabled != 0;
}

- (BOOL)_isMyEmailAddress:(id)a3
{
  return 0;
}

- (BOOL)_shouldAllowAlertsFromContactWithEmail:(id)a3
{
  id v4 = a3;
  if ([(PLNotificationManager *)self _alertFiltrationEnabled])
  {
    if (v4)
    {
      BOOL v5 = [(PLNotificationManager *)self contactStore];
      v6 = [v5 contactsMatchingEmailAddress:v4 keysToFetch:MEMORY[0x1E4F1CBF0]];

      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    id v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    BOOL v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }
  return contactStore;
}

- (void)reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID:(id)a3
{
  id v3 = a3;
  id v4 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PLNotificationManager_reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke;
  v7[3] = &unk_1E5875E18;
  id v8 = v3;
  id v9 = v4;
  id v5 = v4;
  id v6 = v3;
  [v5 performBlock:v7];
}

void __80__PLNotificationManager_reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80__PLNotificationManager_reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke_2;
    v5[3] = &unk_1E5873440;
    id v6 = *(id *)(a1 + 32);
    +[PLPhotoSharingHelper markPendingInvitationAsSpamForAlbum:v2 completionHandler:v5];
    id v3 = v6;
  }
  else
  {
    id v3 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Cannot locate album for cloud GUID: \"%@\"", buf, 0xCu);
    }
  }
}

void __80__PLNotificationManager_reportAsJunkPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to report as junk the invitation to album with cloud GUID: \"%@\" error: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)sendResponse:(BOOL)a3 toPhotoStreamInvitationForAlbumWithCloudGUID:(id)a4
{
  id v5 = a4;
  int v6 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PLNotificationManager_sendResponse_toPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke;
  v9[3] = &unk_1E5874318;
  id v10 = v5;
  id v11 = v6;
  BOOL v12 = a3;
  id v7 = v6;
  id v8 = v5;
  [v7 performBlock:v9];
}

void __83__PLNotificationManager_sendResponse_toPhotoStreamInvitationForAlbumWithCloudGUID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Cannot locate album for cloud GUID: \"%@\"", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (*(unsigned char *)(a1 + 48))
  {
    id v8 = 0;
    BOOL v3 = +[PLPhotoSharingHelper canAcceptPendingInvitationForAlbum:v2 error:&v8];
    uint64_t v4 = v8;
    if (v3)
    {
      +[PLPhotoSharingHelper acceptPendingInvitationForAlbum:v2 completionHandler:0];
    }
    else
    {
      int v6 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v10 = v7;
        __int16 v11 = 2112;
        BOOL v12 = v4;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Cannot accept invitation to album with cloud GUID: \"%@\" error: %@", buf, 0x16u);
      }
    }
LABEL_11:

    goto LABEL_12;
  }
  +[PLPhotoSharingHelper declinePendingInvitationForAlbum:v2];
LABEL_12:
}

- (void)discardAllNotifications
{
  BOOL v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Notifications: Discarding ALL notifications", (uint8_t *)buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager discardAllNotifications]"];
  objc_initWeak(buf, self);
  objc_copyWeak(&v6, buf);
  id v5 = v4;
  pl_dispatch_async();

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

uint64_t __48__PLNotificationManager_discardAllNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained UNCenter];
  [v3 removeAllNotifications];

  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 stillAlive];
}

- (void)_updateImageDataForNotification:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self->_isolationQueue;
    id v6 = objc_initWeak(&location, self);
    uint64_t v7 = [v4 mainAssetUUID];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PLNotificationManager__updateImageDataForNotification___block_invoke;
    v9[3] = &unk_1E586F7D8;
    id v8 = v5;
    uint64_t v10 = v8;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    [(PLNotificationManager *)self getThumbnailImageDataAssetUUID:v7 completionHandler:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __57__PLNotificationManager__updateImageDataForNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    objc_copyWeak(&v8, (id *)(a1 + 48));
    id v6 = v3;
    id v7 = *(id *)(a1 + 40);
    pl_dispatch_async();

    objc_destroyWeak(&v8);
  }
  else
  {
    id v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "[Notification] notification get no thumbnail data for main asset. (%@)", buf, 0xCu);
    }
  }
}

void __57__PLNotificationManager__updateImageDataForNotification___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained UNCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) requestIdentifier];
  [v2 updateImageData:v3 forNotificationWithIdentifier:v4];
}

- (void)getThumbnailImageDataAssetUUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    id v8 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PLNotificationManager_getThumbnailImageDataAssetUUID_completionHandler___block_invoke;
    v10[3] = &unk_1E5874868;
    id v11 = v8;
    id v12 = v5;
    id v13 = v7;
    id v9 = v8;
    [v9 performBlock:v10 withPriority:0];
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __74__PLNotificationManager_getThumbnailImageDataAssetUUID_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) assetWithUUID:*(void *)(a1 + 40)];
  uint64_t v3 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  id v4 = [v3 masterThumbnailFormat];
  id v5 = +[PLImageLoadingUtilities newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:](PLImageLoadingUtilities, "newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:", v2, [v4 formatID], 0, 0, 0);

  if (v5)
  {
    DCIM_sizeFromPLImage();
    if (v6 != v7)
    {
      uint64_t v8 = PLCreateSquareCroppedImage(v5);

      id v5 = (id)v8;
    }
    uint64_t v9 = DCIM_CGImageRefFromPLImage();
    if (v9)
    {
      uint64_t v10 = (CGImage *)v9;
      data = [MEMORY[0x1E4F1CA58] data];
      id v11 = [(id)*MEMORY[0x1E4F44410] identifier];
      id v12 = CGImageDestinationCreateWithData(data, v11, 1uLL, 0);

      if (v12)
      {
        CGImageDestinationAddImage(v12, v10, 0);
        if (!CGImageDestinationFinalize(v12))
        {

          data = 0;
        }
        CFRelease(v12);
      }
      uint64_t v9 = (uint64_t)data;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  CFMutableDataRef dataa = (CFMutableDataRef)v9;
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(uint64_t, CFMutableDataRef))(v13 + 16))(v13, dataa);
  }
}

- (void)triggerNotificationThumbnailUpdateForAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1466, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  unsigned int v6 = [v5 cloudPlaceholderKind];
  if (v6 <= 8 && ((1 << v6) & 0x1B8) != 0)
  {
    double v7 = [v5 uuid];
    uint64_t v8 = self->_isolationQueue;
    objc_initWeak(&location, self);
    uint64_t v9 = [(PLNotificationManager *)self UNCenter];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke;
    v13[3] = &unk_1E586F800;
    id v10 = v7;
    id v14 = v10;
    id v11 = v8;
    v15 = v11;
    objc_copyWeak(&v16, &location);
    [v9 enumerateExistingNotificationsUsingBlock:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C7F0]];
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C710]];
  unsigned int v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C7D0]];
  if (!v4 && [v5 isEqualToString:*(void *)(a1 + 32)])
  {
    double v7 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager triggerNotificationThumbnailUpdateForAsset:]_block_invoke"];
    objc_copyWeak(&v12, (id *)(a1 + 48));
    id v8 = v5;
    id v9 = *(id *)(a1 + 40);
    id v10 = v6;
    id v11 = v7;
    pl_dispatch_async();

    objc_destroyWeak(&v12);
  }
}

void __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke_3;
  v5[3] = &unk_1E586F7D8;
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, v2);
  id v7 = *(id *)(a1 + 48);
  [WeakRetained getThumbnailImageDataAssetUUID:v4 completionHandler:v5];

  [*(id *)(a1 + 56) stillAlive];
  objc_destroyWeak(&v8);
}

void __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_copyWeak(&v6, (id *)(a1 + 48));
    id v4 = v3;
    id v5 = *(id *)(a1 + 40);
    pl_dispatch_async();

    objc_destroyWeak(&v6);
  }
}

void __68__PLNotificationManager_triggerNotificationThumbnailUpdateForAsset___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained UNCenter];
  [v2 updateImageData:*(void *)(a1 + 32) forNotificationWithIdentifier:*(void *)(a1 + 40)];
}

- (void)_removeWaitingNotificationForPhotosBatchID:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1458, @"Invalid parameter not satisfying: %@", @"photosBatchID" object file lineNumber description];

    id v5 = 0;
  }
  [(NSMutableDictionary *)self->_waitingAssetsAddNotifications removeObjectForKey:v5];
}

- (id)_waitingNotificationForPhotosBatchID:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1451, @"Invalid parameter not satisfying: %@", @"photosBatchID" object file lineNumber description];
  }
  id v6 = [(NSMutableDictionary *)self->_waitingAssetsAddNotifications objectForKey:v5];

  return v6;
}

- (id)_addWaitingNotification:(id)a3 forPhotosBatchID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1433, @"Invalid parameter not satisfying: %@", @"notification" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1434, @"Invalid parameter not satisfying: %@", @"photosBatchID" object file lineNumber description];

LABEL_3:
  id v10 = [(NSMutableDictionary *)self->_waitingAssetsAddNotifications objectForKey:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 notificationByMergingWithNotification:v7];
  }
  else
  {
    id v12 = 0;
  }
  if (v12) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = v7;
  }
  id v14 = v13;

  [(NSMutableDictionary *)self->_waitingAssetsAddNotifications setObject:v14 forKey:v9];
  return v14;
}

- (void)calculateCurrentBadgeCountWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PLNotificationManager_calculateCurrentBadgeCountWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E58742F0;
  id v8 = v4;
  id v9 = v3;
  id v5 = v3;
  id v6 = v4;
  [v6 performBlock:v7 withPriority:0];
}

void __73__PLNotificationManager_calculateCurrentBadgeCountWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) albumListForContentMode:1];
  uint64_t v3 = [v2 unreadAlbumsCount];
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Notifications: Calculated current badge count: %ld", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v3);
  }
}

- (unint64_t)_appBadgeCount
{
  if (PLIsLockdownMode()) {
    return 0;
  }
  id v4 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PLNotificationManager__appBadgeCount__block_invoke;
  v7[3] = &unk_1E5875340;
  void v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [v5 performBlockAndWait:v7];
  unint64_t v3 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v3;
}

void __39__PLNotificationManager__appBadgeCount__block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() filteredAlbumListForContentMode:1 library:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 unreadAlbumsCount];
}

- (void)_postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5 notificationDeliveryDate:(id)a6 transaction:(id)a7
{
  uint64_t v10 = a3;
  id v16 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = [[PLNotification alloc] initForSharedLibraryExitInitatedByOwnerWithType:v10 retentionPolicy:a4 ownerName:v13];

  if (v14)
  {
    [v14 setNotificationDeliveryDate:v16];
    v15 = [(PLNotificationManager *)self UNCenter];
    [v15 sendNotificationForNotification:v14];
  }
  [v12 stillAlive];
}

- (void)postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:(signed __int16)a3 retentionPolicy:(int64_t)a4 ownerName:(id)a5 notificationDeliveryDate:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:retentionPolicy:ownerName:notificationDeliveryDate:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(v16, &location);
  signed __int16 v17 = a3;
  v16[1] = (id)a4;
  id v13 = v10;
  id v14 = v11;
  id v15 = v12;
  pl_dispatch_async();

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __148__PLNotificationManager_postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType_retentionPolicy_ownerName_notificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _postNotificationForSharedLibraryExitInitatedByOwnerWithTypeWithExitType:*(__int16 *)(a1 + 72) retentionPolicy:*(void *)(a1 + 64) ownerName:*(void *)(a1 + 32) notificationDeliveryDate:*(void *)(a1 + 40) transaction:*(void *)(a1 + 48)];
}

- (void)removeNotificationForSharedLibraryParticipantAssetTrash
{
  unint64_t v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager removeNotificationForSharedLibraryParticipantAssetTrash]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  id v4 = v3;
  pl_dispatch_async();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __80__PLNotificationManager_removeNotificationForSharedLibraryParticipantAssetTrash__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  [v3 addIndex:14];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _deleteNotificationsForObjectWithUUID:@"SharedLibraryParticipantAssetTrashNotification" notificationDictionaryKey:0 notificationTypes:v3];

  [*(id *)(a1 + 32) stillAlive];
}

- (void)_postAsyncNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5 withNotificationDeliveryDate:(id)a6 transaction:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v15 = [[PLNotification alloc] initForSharedLibraryParticipantAssetTrashNotificationWithTrashedPhotoCount:a3 videoCount:a4 itemCount:a5];
  [v15 setNotificationDeliveryDate:v13];

  id v14 = [(PLNotificationManager *)self UNCenter];
  [v14 sendNotificationForNotification:v15];

  [v12 stillAlive];
}

- (void)postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 itemCount:(unint64_t)a5 withNotificationDeliveryDate:(id)a6
{
  id v6 = a6;
  id v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:videoCount:itemCount:withNotificationDeliveryDate:]"];
  id v7 = v9;
  id v8 = v6;
  pl_dispatch_async();
}

uint64_t __155__PLNotificationManager_postNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount_videoCount_itemCount_withNotificationDeliveryDate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postAsyncNotificationForSharedLibraryParticipantAssetTrashWithTrashedAssetPhotoCount:*(void *)(a1 + 56) videoCount:*(void *)(a1 + 64) itemCount:*(void *)(a1 + 72) withNotificationDeliveryDate:*(void *)(a1 + 40) transaction:*(void *)(a1 + 48)];
}

- (void)_postAsyncNotificationForAcceptedSharedLibraryWithScopeIdentifier:(id)a3 participantName:(id)a4 NotificationDeliveryDate:(id)a5 transaction:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [[PLNotification alloc] initForSharedLibraryScopeAcceptWithLibraryScopeIdentifier:v13 participantName:v12];

  [v15 setNotificationDeliveryDate:v11];
  id v14 = [(PLNotificationManager *)self UNCenter];
  [v14 sendNotificationForNotification:v15];

  [v10 stillAlive];
}

- (void)postNotificationForAcceptedSharedLibraryWithScopeIdentifier:(id)a3 participantName:(id)a4 library:(id)a5 notificationDeliveryDate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForAcceptedSharedLibraryWithScopeIdentifier:participantName:library:notificationDeliveryDate:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v19, &location);
  id v15 = v10;
  id v16 = v11;
  id v17 = v13;
  id v18 = v14;
  pl_dispatch_async();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __134__PLNotificationManager_postNotificationForAcceptedSharedLibraryWithScopeIdentifier_participantName_library_notificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained _postAsyncNotificationForAcceptedSharedLibraryWithScopeIdentifier:*(void *)(a1 + 32) participantName:*(void *)(a1 + 40) NotificationDeliveryDate:*(void *)(a1 + 48) transaction:*(void *)(a1 + 56)];
}

- (void)_postAsyncNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3 transaction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [[PLNotification alloc] initForSharedLibrarySuggestions];
  [v9 setNotificationDeliveryDate:v7];

  id v8 = [(PLNotificationManager *)self UNCenter];
  [v8 sendNotificationForNotification:v9];

  [v6 stillAlive];
}

- (void)postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  id v6 = v4;
  id v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __97__PLNotificationManager_postNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _postAsyncNotificationForSharedLibrarySuggestionsWithNotificationDeliveryDate:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40)];
}

- (void)_postAsyncNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3 transaction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [[PLNotification alloc] initForPhotosChallengeNewQuestions];
  [v9 setNotificationDeliveryDate:v7];

  id v8 = [(PLNotificationManager *)self UNCenter];
  [v8 sendNotificationForNotification:v9];

  [v6 stillAlive];
}

- (void)postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  id v6 = v4;
  id v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __100__PLNotificationManager_postNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _postAsyncNotificationForPhotosChallengeNewQuestionsWithNotificationDeliveryDate:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40)];
}

- (void)_postAsyncNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3 transaction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [[PLNotification alloc] initForPhotosChallengeSubmission];
  [v9 setNotificationDeliveryDate:v7];

  id v8 = [(PLNotificationManager *)self UNCenter];
  [v8 sendNotificationForNotification:v9];

  [v6 stillAlive];
}

- (void)postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  id v6 = v4;
  id v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __98__PLNotificationManager_postNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _postAsyncNotificationForPhotosChallengeSubmissionWithNotificationDeliveryDate:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40)];
}

- (void)removeNotificationForInterestInUnrenderedCinematicVideoItems
{
}

void __85__PLNotificationManager_removeNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke(uint64_t a1)
{
  id v2 = *(__CFUserNotification **)(*(void *)(a1 + 32) + 48);
  if (v2)
  {
    CFUserNotificationCancel(v2);
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 48));
    *(void *)(*(void *)(a1 + 32) + 48) = 0;
  }
}

- (void)postNotificationForInterestInUnrenderedCinematicVideoItems
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = PLServicesLocalizedFrameworkStringForAssetsd();
  id v4 = PLServicesLocalizedFrameworkStringForAssetsd();
  id v5 = v3;
  id v6 = PLServicesLocalizedFrameworkStringForAssetsd();
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v8 = *MEMORY[0x1E4F1D9D0];
  v27[0] = *MEMORY[0x1E4F1D990];
  v27[1] = v8;
  *(void *)v28 = v6;
  id v29 = v5;
  uint64_t v9 = *MEMORY[0x1E4F1D9B8];
  v27[2] = *MEMORY[0x1E4F1DA10];
  v27[3] = v9;
  v30 = v4;
  uint64_t v31 = MEMORY[0x1E4F1CC38];
  v27[4] = @"DismissOnLock";
  v27[5] = @"SBUserNotificationDontDismissOnUnlock";
  uint64_t v32 = MEMORY[0x1E4F1CC38];
  uint64_t v33 = MEMORY[0x1E4F1CC38];
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];
  CFDictionaryRef v11 = [v7 dictionaryWithDictionary:v10];

  id v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Presenting prompt to process unrendered Cinematic videos on behalf of Photos", buf, 2u);
  }

  CFUserNotificationRef v13 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 0x20uLL, 0, v11);
  if (v13)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke;
    v23 = &unk_1E5873348;
    v24 = self;
    CFUserNotificationRef v25 = v13;
    PLRunWithUnfairLock();
    id v14 = dispatch_get_global_queue(25, 0);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v16[2] = __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke_2;
    v16[3] = &unk_1E58735D8;
    CFUserNotificationRef v19 = v13;
    v16[4] = self;
    id v17 = v5;
    id v18 = v4;
    dispatch_async(v14, v16);
  }
  else
  {
    id v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to present library picker alert on behalf of Photos", v28, 2u);
    }
  }
}

uint64_t __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 48) = *(void *)(result + 40);
  return result;
}

void __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(a1 + 56), 0.0, &responseFlags);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = *(void *)(a1 + 32);
  PLRunWithUnfairLock();
  CFOptionFlags v2 = responseFlags & 3;
  id v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = 48;
    if (v2 == 1) {
      uint64_t v4 = 40;
    }
    uint64_t v5 = *(void *)(a1 + v4);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v5;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "User selected: %{public}@", buf, 0xCu);
  }

  if (v2 == 1)
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F223E0], "defaultWorkspace", v8, 3221225472, __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke_3, &unk_1E5875CE0, v9);
    id v7 = [MEMORY[0x1E4F1CB10] URLWithString:@"photos://album?name=cinematic&render=1"];
    [v6 openSensitiveURL:v7 withOptions:MEMORY[0x1E4F1CC08]];
  }
}

void __83__PLNotificationManager_postNotificationForInterestInUnrenderedCinematicVideoItems__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(const void **)(v2 + 48);
  if (v3)
  {
    CFRelease(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(void *)(v2 + 48) = 0;
}

- (void)postNotificationForReadyToViewMomentShareWithUUID:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 length])
  {
    CFDictionaryRef v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1189, @"Invalid parameter not satisfying: %@", @"momentShareUUID.length" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1190, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__77218;
  v21[4] = __Block_byref_object_dispose__77219;
  id v22 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke;
  v17[3] = &unk_1E5875340;
  id v18 = v7;
  id v9 = v8;
  id v19 = v9;
  uint64_t v20 = v21;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke_2;
  v13[3] = &unk_1E5875340;
  id v16 = v21;
  id v10 = v18;
  id v14 = v10;
  id v15 = self;
  [v9 performBlock:v17 completionHandler:v13 withPriority:0];

  _Block_object_dispose(v21, 8);
}

void __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v7 = +[PLShare shareWithUUID:v2 includeTrashed:0 inManagedObjectContext:v3];

  if (v7)
  {
    id v4 = [[PLNotification alloc] initCMMInvitationReadyToViewWithMomentShare:v7];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke_2(uint64_t a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v2 = *(id *)(*(void *)(a1 + 40) + 32);
    id v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForReadyToViewMomentShareWithUUID:photoLibrary:]_block_invoke"];
    objc_initWeak(location, *(id *)(a1 + 40));
    objc_copyWeak(&v6, location);
    id v5 = v3;
    pl_dispatch_async();

    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v2 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v4 = *(void **)(a1 + 32);
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v4;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "[CMM Notification] fail to find matching moment share for uuid: \"%@\"", (uint8_t *)location, 0xCu);
    }
  }
}

uint64_t __88__PLNotificationManager_postNotificationForReadyToViewMomentShareWithUUID_photoLibrary___block_invoke_2_134(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "[CMM Notification] Sending \"ready to view\" moment share notification: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = [WeakRetained UNCenter];
  [v5 sendNotificationForNotification:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  return [*(id *)(a1 + 32) stillAlive];
}

- (void)postNotificationForExpiringCMMsWithUUIDs:(id)a3 thumbnailImageData:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v25 = v11;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v14;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "[CMM Notification] Notifications: Trying to post notification for about to expire CMMs %@, title %@, subtitle %@.", buf, 0x20u);
  }

  if (!v11)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1174, @"Invalid parameter not satisfying: %@", @"CMMUUIDs" object file lineNumber description];
  }
  if (!v13)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1175, @"Invalid parameter not satisfying: %@", @"notificationTitle" object file lineNumber description];
  }
  if (!v14)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1176, @"Invalid parameter not satisfying: %@", @"notificationSubtitle" object file lineNumber description];
  }
  id v16 = [[PLNotification alloc] initWithExpiringMomentShareUUIDs:v11 thumbnailImageData:v12 notificationTitle:v13 notificationSubtitle:v14];
  id v17 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForExpiringCMMsWithUUIDs:thumbnailImageData:notificationTitle:notificationSubtitle:]"];
  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v23, (id *)buf);
  uint64_t v21 = v16;
  id v22 = v17;
  pl_dispatch_async();

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

uint64_t __124__PLNotificationManager_postNotificationForExpiringCMMsWithUUIDs_thumbnailImageData_notificationTitle_notificationSubtitle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained UNCenter];
  [v3 sendNotificationForNotification:*(void *)(a1 + 32)];

  id v4 = *(void **)(a1 + 40);
  return [v4 stillAlive];
}

- (void)_deleteNotificationsForAssetWithUUID:(id)a3 shouldDeleteCommentsOrLikeNotifications:(BOOL)a4 shouldDeletePhotosAddedToAlbumNotifications:(BOOL)a5
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager _deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:]"];
    objc_initWeak(&location, self);
    objc_copyWeak(&v12, &location);
    BOOL v13 = a4;
    BOOL v14 = a5;
    id v10 = v8;
    id v11 = v9;
    pl_dispatch_async();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __146__PLNotificationManager__deleteNotificationsForAssetWithUUID_shouldDeleteCommentsOrLikeNotifications_shouldDeletePhotosAddedToAlbumNotifications___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained UNCenter];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __146__PLNotificationManager__deleteNotificationsForAssetWithUUID_shouldDeleteCommentsOrLikeNotifications_shouldDeletePhotosAddedToAlbumNotifications___block_invoke_2;
  v5[3] = &unk_1E586F6E8;
  objc_copyWeak(&v7, v2);
  __int16 v8 = *(_WORD *)(a1 + 56);
  id v6 = *(id *)(a1 + 32);
  [v4 enumerateExistingNotificationsUsingBlock:v5];

  [*(id *)(a1 + 40) stillAlive];
  objc_destroyWeak(&v7);
}

void __146__PLNotificationManager__deleteNotificationsForAssetWithUUID_shouldDeleteCommentsOrLikeNotifications_shouldDeletePhotosAddedToAlbumNotifications___block_invoke_2(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C7A8]];
  uint64_t v5 = [v4 integerValue];

  id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C738]];
  int v7 = [v6 BOOLValue];

  __int16 v8 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C710]];
  uint64_t v9 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v11 = [WeakRetained _notificationType:v5 matchesCommentsOrLikeNotifications:*(unsigned __int8 *)(a1 + 48) andPhotosAddedToAlbumNotifications:*(unsigned __int8 *)(a1 + 49)];

  if (*(unsigned char *)(a1 + 48)) {
    int v12 = v11;
  }
  else {
    int v12 = 1;
  }
  if (v12) {
    int v13 = v11;
  }
  else {
    int v13 = v7 | v11;
  }
  if (v13 == 1 && [*(id *)(a1 + 32) isEqualToString:v8])
  {
    BOOL v14 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F8C7D0]];
    if (v14)
    {
      id v15 = objc_loadWeakRetained(v9);
      id v16 = [v15 UNCenter];
      v18[0] = v14;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v16 removeNotificationWithRequestIdentifiers:v17];
    }
  }
}

- (BOOL)_notificationType:(int64_t)a3 matchesCommentsOrLikeNotifications:(BOOL)a4 andPhotosAddedToAlbumNotifications:(BOOL)a5
{
  if (a4 && a5) {
    return a3 == 3 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  BOOL v7 = a3 == 3 && a5;
  if (a4) {
    return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else {
    return v7;
  }
}

- (void)_deleteNotificationsForAlbumWithUUID:(id)a3 notificationTypes:(id)a4
{
}

- (void)_deleteNotificationsForMemoriesWithUUID:(id)a3 notificationTypes:(id)a4
{
}

- (void)_deleteNotificationsForObjectWithUUID:(id)a3 notificationDictionaryKey:(id)a4 notificationTypes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = v10;
  if (v8 && [v10 count])
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__77218;
    id v25 = __Block_byref_object_dispose__77219;
    id v26 = 0;
    int v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __107__PLNotificationManager__deleteNotificationsForObjectWithUUID_notificationDictionaryKey_notificationTypes___block_invoke;
    v17[3] = &unk_1E586F698;
    id v18 = v8;
    uint64_t v20 = &v21;
    id v13 = v12;
    id v19 = v13;
    [v11 enumerateIndexesUsingBlock:v17];
    if ([v13 count])
    {
      BOOL v14 = [(PLNotificationManager *)self UNCenter];
      [v14 removeNotificationWithRequestIdentifiers:v13];
    }
    if (v22[5])
    {
      id v15 = [(PLNotificationManager *)self UNCenter];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      id v16[2] = __107__PLNotificationManager__deleteNotificationsForObjectWithUUID_notificationDictionaryKey_notificationTypes___block_invoke_2;
      v16[3] = &unk_1E586F6C0;
      v16[4] = self;
      void v16[5] = &v21;
      [v15 enumerateExistingNotificationsUsingBlock:v16];
    }
    _Block_object_dispose(&v21, 8);
  }
}

void __107__PLNotificationManager__deleteNotificationsForObjectWithUUID_notificationDictionaryKey_notificationTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = +[PLNotification requestIdentifierByNotificationType:a2 keyObjectUUID:*(void *)(a1 + 32) photosBatchID:0];
  uint64_t v5 = v4;
  if (a2 == 3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v4);
    id v4 = v5;
  }
  if (v4)
  {
    [*(id *)(a1 + 40) addObject:v5];
    id v4 = v5;
  }
}

void __107__PLNotificationManager__deleteNotificationsForObjectWithUUID_notificationDictionaryKey_notificationTypes___block_invoke_2(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F8C7D0]];
  if ([v3 hasPrefix:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)])
  {
    id v4 = [*(id *)(a1 + 32) UNCenter];
    v6[0] = v3;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v4 removeNotificationWithRequestIdentifiers:v5];
  }
}

- (void)removeNotificationForInterestingMemoryWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager removeNotificationForInterestingMemoryWithUUID:]"];
  id v6 = (void *)[v4 copy];
  objc_initWeak(&location, self);
  objc_copyWeak(&v9, &location);
  id v7 = v6;
  id v8 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__PLNotificationManager_removeNotificationForInterestingMemoryWithUUID___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  [v3 addIndex:6];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteNotificationsForMemoriesWithUUID:*(void *)(a1 + 32) notificationTypes:v3];

  [*(id *)(a1 + 40) stillAlive];
}

- (void)postNotificationForInterestingMemoryWithMemoryUUID:(id)a3 library:(id)a4 notificationDeliveryDate:(id)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Notifications: Trying to post notification for memory %@.", (uint8_t *)&buf, 0xCu);
  }

  if (!v9)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 1005, @"Invalid parameter not satisfying: %@", @"memoryUUID" object file lineNumber description];
  }
  if (PLIsFeaturedContentAllowed())
  {
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__77218;
    v54 = __Block_byref_object_dispose__77219;
    id v55 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__77218;
    v45 = __Block_byref_object_dispose__77219;
    id v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__77218;
    v39 = __Block_byref_object_dispose__77219;
    id v40 = 0;
    if (!v10) {
      goto LABEL_12;
    }
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __109__PLNotificationManager_postNotificationForInterestingMemoryWithMemoryUUID_library_notificationDeliveryDate___block_invoke;
    v28[3] = &unk_1E586F670;
    id v13 = v9;
    id v29 = v13;
    id v14 = v10;
    id v30 = v14;
    uint64_t v31 = &v47;
    p_long long buf = &buf;
    uint64_t v33 = &v41;
    uint64_t v34 = &v35;
    [v14 performBlockAndWait:v28];

    if (*((unsigned char *)v48 + 24))
    {
      uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
      uint64_t v16 = v42[5];
      uint64_t v17 = v36[5];
      id v18 = [v14 pathManager];
      id v19 = [(PLNotificationManager *)self _generateMemoryNotificationRepresentationWithMemoryUUID:v13 keyAssetUUID:v15 notificationTitle:v16 notificationSubtitle:v17 notificationDeliveryDate:v11 pathManager:v18];

      uint64_t v20 = self->_isolationQueue;
      uint64_t v21 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager postNotificationForInterestingMemoryWithMemoryUUID:library:notificationDeliveryDate:]"];
      objc_initWeak(location, self);
      objc_copyWeak(&v26, location);
      id v22 = v19;
      id v25 = v21;
      pl_dispatch_async();

      objc_destroyWeak(&v26);
      objc_destroyWeak(location);
    }
    else
    {
LABEL_12:
      id v22 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "[Memories Notification] Notifications: No displayable memory subtitle.", (uint8_t *)location, 2u);
      }
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v41, 8);

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v47, 8);
  }
  else
  {
    uint64_t v23 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Not posting - featured content is disabled in settings", (uint8_t *)&buf, 2u);
    }
  }
}

void __109__PLNotificationManager_postNotificationForInterestingMemoryWithMemoryUUID_library_notificationDeliveryDate___block_invoke(void *a1)
{
  uint64_t v2 = +[PLMemory memoryWithUUID:a1[4] inPhotoLibrary:a1[5]];
  id v16 = v2;
  if (v2)
  {
    id v3 = [v2 title];
    id v4 = v3;
    if (v3)
    {
      BOOL v5 = [v3 length] != 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = 0;
  }
  BOOL v5 = 0;
LABEL_6:
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v6 = [v16 keyAsset];
    uint64_t v7 = [v6 uuid];
    uint64_t v8 = *(void *)(a1[7] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = PLLocalizedImportantMemoryNotificationTitle();
    uint64_t v11 = *(void *)(a1[8] + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1EEB2EB80];
    uint64_t v14 = *(void *)(a1[9] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

void __109__PLNotificationManager_postNotificationForInterestingMemoryWithMemoryUUID_library_notificationDeliveryDate___block_invoke_121(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained _memoryNotificationFromDictionaryRepresentation:*(void *)(a1 + 32)];

  BOOL v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Notifications: Created notification for new memory notification: %@.", (uint8_t *)&v10, 0xCu);
  }

  id v6 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v6 UNCenter];
  [v7 sendNotificationForNotification:v4];

  uint64_t v8 = [v4 thumbnailImageData];

  if (!v8)
  {
    id v9 = objc_loadWeakRetained(v2);
    [v9 _updateImageDataForNotification:v4];
  }
  [*(id *)(a1 + 40) stillAlive];
}

- (id)_generateMemoryNotificationRepresentationWithMemoryUUID:(id)a3 keyAssetUUID:(id)a4 notificationTitle:(id)a5 notificationSubtitle:(id)a6 notificationDeliveryDate:(id)a7 pathManager:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v35 = a6;
  id v34 = a7;
  id v18 = a8;
  if (v15)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 983, @"Invalid parameter not satisfying: %@", @"memoryUUID" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 984, @"Invalid parameter not satisfying: %@", @"notificationTitle" object file lineNumber description];

LABEL_3:
  id v19 = v17;
  if (!v35)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 985, @"Invalid parameter not satisfying: %@", @"notificationSubtitle" object file lineNumber description];
  }
  uint64_t v20 = v16;
  uint64_t v21 = v15;
  if (!v18)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 986, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];
  }
  id v22 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v23 = *MEMORY[0x1E4F8C780];
  uint64_t v24 = *MEMORY[0x1E4F8C7A0];
  uint64_t v25 = *MEMORY[0x1E4F8C798];
  id v26 = [v18 libraryURL];
  id v27 = [v26 absoluteString];
  __int16 v28 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v21, v23, v19, v24, v35, v25, v27, *MEMORY[0x1E4F8C7C8], 0);

  [v28 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F8C710]];
  if (v34) {
    [v28 setObject:v34 forKey:*MEMORY[0x1E4F8C758]];
  }

  return v28;
}

- (id)_memoryNotificationFromDictionaryRepresentation:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F8C780];
  id v4 = a3;
  BOOL v5 = [v4 objectForKey:v3];
  id v6 = [v4 objectForKey:*MEMORY[0x1E4F8C710]];
  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F8C7A0]];
  uint64_t v8 = [v4 objectForKey:*MEMORY[0x1E4F8C798]];
  id v9 = [v4 objectForKey:*MEMORY[0x1E4F8C758]];
  int v10 = [v4 objectForKey:*MEMORY[0x1E4F8C7C8]];

  uint64_t v11 = [[PLNotification alloc] initWithInterestingMemoryNotificationWithMemoryUUID:v5 keyAssetUUID:v6 notificationTitle:v7 notificationSubtitle:v8 photoLibraryURLString:v10];
  [(PLNotification *)v11 setNotificationDeliveryDate:v9];

  return v11;
}

- (void)userViewedNotificationWithAlbumCloudGUID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __66__PLNotificationManager_userViewedNotificationWithAlbumCloudGUID___block_invoke;
    v6[3] = &unk_1E5875E18;
    id v7 = v3;
    id v8 = v4;
    id v5 = v4;
    [v5 performBlock:v6];
  }
}

void __66__PLNotificationManager_userViewedNotificationWithAlbumCloudGUID___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    if ([v2 hasUnseenContentBoolValue])
    {
      [v3 setHasUnseenContentBoolValue:0];
      +[PLPhotoSharingHelper markAlbumGUIDAsViewed:*(void *)(a1 + 32) clearUnseenAssetsCount:1];
    }
  }
  else
  {
    id v4 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Cannot locate album for cloud GUID: \"%@\"", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)noteUserDidChangeStatusForMomentShare:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidChangeStatusForMomentShare:photoLibrary:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v9 = v8;
  pl_dispatch_async();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __76__PLNotificationManager_noteUserDidChangeStatusForMomentShare_photoLibrary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained UNCenter];
  [v3 updateBadgeCountWithDelay:1];

  id v4 = *(void **)(a1 + 32);
  return [v4 stillAlive];
}

- (void)noteUserDidLeavePhotosApplication
{
  id v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidLeavePhotosApplication]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v5, &location);
  id v4 = v3;
  pl_dispatch_async();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __58__PLNotificationManager_noteUserDidLeavePhotosApplication__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained UNCenter];
  [v3 updateBadgeCountWithDelay:1];

  id v4 = *(void **)(a1 + 32);
  return [v4 stillAlive];
}

- (void)noteUserDidDeleteSharedAssetsWithUUIDs:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidDeleteSharedAssetsWithUUIDs:]"];
  objc_initWeak(&location, self);
  id v6 = v4;
  objc_copyWeak(&v8, &location);
  id v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __64__PLNotificationManager_noteUserDidDeleteSharedAssetsWithUUIDs___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained(a1 + 6);
        objc_msgSend(WeakRetained, "_deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:", v7, 1, 1, (void)v10);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [a1[5] stillAlive];
}

- (void)noteUserDidDeleteSharedAlbumWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidDeleteSharedAlbumWithUUID:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  id v6 = v4;
  id v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__PLNotificationManager_noteUserDidDeleteSharedAlbumWithUUID___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  [v3 addIndex:0];
  [v3 addIndex:1];
  [v3 addIndex:3];
  [v3 addIndex:4];
  [v3 addIndex:5];
  [v3 addIndex:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteNotificationsForAlbumWithUUID:*(void *)(a1 + 32) notificationTypes:v3];

  [*(id *)(a1 + 40) stillAlive];
}

- (void)noteUserDidReadCommentOnSharedAsset:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 cloudHasUnseenComments])
  {
    id v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidReadCommentOnSharedAsset:photoLibrary:]"];
    id v9 = [v6 photoLibrary];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke;
    v20[3] = &unk_1E5875CE0;
    id v21 = v6;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke_2;
    v18[3] = &unk_1E5875CE0;
    id v19 = v8;
    id v10 = v8;
    [v9 performTransaction:v20 completionHandler:v18 withPriority:0];
  }
  long long v11 = [v6 uuid];
  long long v12 = (void *)[v11 copy];

  long long v13 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidReadCommentOnSharedAsset:photoLibrary:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v16, &location);
  id v14 = v12;
  id v15 = v13;
  pl_dispatch_async();

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userReadAllCloudSharedComments];
}

uint64_t __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stillAlive];
}

uint64_t __74__PLNotificationManager_noteUserDidReadCommentOnSharedAsset_photoLibrary___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteNotificationsForAssetWithUUID:*(void *)(a1 + 32) shouldDeleteCommentsOrLikeNotifications:1 shouldDeletePhotosAddedToAlbumNotifications:0];

  id v3 = *(void **)(a1 + 40);
  return [v3 stillAlive];
}

- (void)noteUserDidNavigateAwayFromSharedAlbum:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v5 hasUnseenContentBoolValue];
  uint64_t v8 = [v5 unseenAssetsCountIntegerValue];
  if ((v7 & 1) != 0 || v8)
  {
    id v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidNavigateAwayFromSharedAlbum:photoLibrary:]"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__PLNotificationManager_noteUserDidNavigateAwayFromSharedAlbum_photoLibrary___block_invoke;
    v13[3] = &unk_1E58748B0;
    char v15 = v7;
    id v14 = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PLNotificationManager_noteUserDidNavigateAwayFromSharedAlbum_photoLibrary___block_invoke_2;
    v11[3] = &unk_1E5875CE0;
    id v12 = v9;
    id v10 = v9;
    [v6 performTransaction:v13 completionHandler:v11 withPriority:0];
  }
}

void __77__PLNotificationManager_noteUserDidNavigateAwayFromSharedAlbum_photoLibrary___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) setHasUnseenContentBoolValue:0];
  }
  id v2 = [*(id *)(a1 + 32) cloudGUID];
  +[PLPhotoSharingHelper markAlbumGUIDAsViewed:v2 clearUnseenAssetsCount:1];
}

uint64_t __77__PLNotificationManager_noteUserDidNavigateAwayFromSharedAlbum_photoLibrary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stillAlive];
}

- (void)noteUserDidNavigateIntoSharedAlbum:(id)a3 photoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasUnseenContentBoolValue])
  {
    uint64_t v8 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidNavigateIntoSharedAlbum:photoLibrary:]"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke;
    v19[3] = &unk_1E5875CE0;
    id v20 = v6;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke_2;
    v17[3] = &unk_1E5875CE0;
    id v18 = v8;
    id v9 = v8;
    [v7 performTransaction:v19 completionHandler:v17 withPriority:0];
  }
  id v10 = [v6 uuid];
  long long v11 = (void *)[v10 copy];

  id v12 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidNavigateIntoSharedAlbum:photoLibrary:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v15, &location);
  id v13 = v11;
  id v14 = v12;
  pl_dispatch_async();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasUnseenContentBoolValue:0];
  id v2 = [*(id *)(a1 + 32) cloudGUID];
  +[PLPhotoSharingHelper markAlbumGUIDAsViewed:v2 clearUnseenAssetsCount:1];
}

uint64_t __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stillAlive];
}

void __73__PLNotificationManager_noteUserDidNavigateIntoSharedAlbum_photoLibrary___block_invoke_3(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  [v3 addIndex:0];
  [v3 addIndex:1];
  [v3 addIndex:3];
  [v3 addIndex:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteNotificationsForAlbumWithUUID:*(void *)(a1 + 32) notificationTypes:v3];

  [*(id *)(a1 + 40) stillAlive];
}

- (void)noteUserDidViewCloudFeedContent:(unint64_t)a3 photoLibrary:(id)a4
{
  char v4 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 managedObjectContext];
  if (v4)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
    long long v11 = +[PLManagedObject entityInManagedObjectContext:v7];
    [v10 setEntity:v11];

    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(hasUnseenContent == YES)"];
    [v10 setPredicate:v12];

    id v37 = 0;
    uint64_t v8 = [v7 executeFetchRequest:v10 error:&v37];
    id v9 = v37;
    if (!v8)
    {
      id v13 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v40 = v9;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "failed to fetch albums with unseen content: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = 0;
  }
  if ((v4 & 2) != 0)
  {
    id v15 = (void *)MEMORY[0x1E4F1C0D0];
    id v16 = +[PLManagedAsset entityName];
    id v17 = [v15 fetchRequestWithEntityName:v16];

    id v18 = (void *)MEMORY[0x1E4F28BA0];
    id v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == YES", @"cloudHasUnseenComments");
    v38[0] = v19;
    id v20 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCloudSharedAsset"), 1);
    v38[1] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v22 = [v18 andPredicateWithSubpredicates:v21];

    [v17 setPredicate:v22];
    id v36 = v9;
    id v14 = [v7 executeFetchRequest:v17 error:&v36];
    id v23 = v36;

    if (!v14)
    {
      uint64_t v24 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v40 = v23;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "failed to fetch assets with unseen comments: %@", buf, 0xCu);
      }
    }
    id v9 = v23;
  }
  else
  {
    id v14 = 0;
  }
  if ([v8 count] || objc_msgSend(v14, "count"))
  {
    uint64_t v25 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidViewCloudFeedContent:photoLibrary:]"];
    objc_initWeak((id *)buf, self);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke;
    v33[3] = &unk_1E5875E18;
    id v34 = v8;
    id v35 = v14;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke_2;
    v27[3] = &unk_1E586F760;
    id v28 = v34;
    id v29 = v35;
    id v30 = self;
    objc_copyWeak(&v32, (id *)buf);
    id v26 = v25;
    id v31 = v26;
    [v6 performTransaction:v33 completionHandler:v27 withPriority:0];

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
}

void __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        [v7 setHasUnseenContentBoolValue:0];
        uint64_t v8 = [v7 cloudGUID];
        +[PLPhotoSharingHelper markAlbumGUIDAsViewed:v8 clearUnseenAssetsCount:1];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * j), "userReadAllCloudSharedComments", (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

void __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke_2(id *a1)
{
  id v2 = [a1[4] valueForKey:@"uuid"];
  uint64_t v3 = [a1[5] valueForKey:@"uuid"];
  if ([v2 count] || objc_msgSend(v3, "count"))
  {
    uint64_t v4 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserDidViewCloudFeedContent:photoLibrary:]_block_invoke_2"];
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    id v7 = __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke_3;
    uint64_t v8 = &unk_1E586F648;
    id v9 = v2;
    objc_copyWeak(&v12, a1 + 8);
    id v10 = v3;
    id v11 = v4;
    pl_dispatch_async();

    objc_destroyWeak(&v12);
  }
  objc_msgSend(a1[7], "stillAlive", v5, v6, v7, v8);
}

void __70__PLNotificationManager_noteUserDidViewCloudFeedContent_photoLibrary___block_invoke_3(id *a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28E60] indexSet];
  [v2 addIndex:3];
  [v2 addIndex:4];
  [v2 addIndex:5];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * v7);
        id WeakRetained = objc_loadWeakRetained(a1 + 7);
        [WeakRetained _deleteNotificationsForAlbumWithUUID:v8 notificationTypes:v2];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = a1[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * v14);
        id v16 = objc_loadWeakRetained(a1 + 7);
        objc_msgSend(v16, "_deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:", v15, 1, 1, (void)v17);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  [a1[6] stillAlive];
}

- (void)noteUserAssetsAreReadyForMomentShare:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__77218;
  void v9[4] = __Block_byref_object_dispose__77219;
  id v10 = [[PLNotification alloc] initCMMInvitationReadyToViewWithMomentShare:v4];
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteUserAssetsAreReadyForMomentShare:]"];
  objc_initWeak(&location, self);
  objc_copyWeak(&v7, &location);
  id v6 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  _Block_object_dispose(v9, 8);
}

uint64_t __62__PLNotificationManager_noteUserAssetsAreReadyForMomentShare___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained UNCenter];
  [v3 sendNotificationForNotification:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  id v4 = *(void **)(a1 + 32);
  return [v4 stillAlive];
}

- (void)noteDidReceiveExpiringCMMInvitationsWithMomentShares:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLNotificationManager.m", 673, @"Invalid parameter not satisfying: %@", @"momentShares.count" object file lineNumber description];
  }
  id v6 = [[PLNotification alloc] initWithExpiringMomentShares:v5];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__PLNotificationManager_noteDidReceiveExpiringCMMInvitationsWithMomentShares___block_invoke;
  v14[3] = &unk_1E586F8A0;
  id v15 = v7;
  id v8 = v7;
  [v5 enumerateObjectsUsingBlock:v14];
  id v9 = [v5 firstObject];

  id v10 = [v9 thumbnailImageData];
  uint64_t v11 = [(PLNotification *)v6 title];
  uint64_t v12 = [(PLNotification *)v6 message];
  [(PLNotificationManager *)self postNotificationForExpiringCMMsWithUUIDs:v8 thumbnailImageData:v10 notificationTitle:v11 notificationSubtitle:v12];
}

void __78__PLNotificationManager_noteDidReceiveExpiringCMMInvitationsWithMomentShares___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

- (void)noteDidReceiveCMMInvitationWithMomentShare:(id)a3
{
  id v4 = a3;
  id v5 = [[PLNotification alloc] initCMMInvitationWithMomentShare:v4];
  id v6 = [v5 senderEmailAddress];
  if (v6)
  {
    if ([v4 status] == 1)
    {
      id v7 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        id v8 = "Notifications: MomentShare is inited by myself.";
LABEL_10:
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)buf, 2u);
      }
    }
    else
    {
      if (![(PLNotificationManager *)self _shouldAllowAlertsFromContactWithEmail:v6])
      {
        id v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteDidReceiveCMMInvitationWithMomentShare:]"];
        objc_initWeak(buf, self);
        objc_copyWeak(&v10, buf);
        id v7 = v9;
        pl_dispatch_async();

        objc_destroyWeak(&v10);
        objc_destroyWeak(buf);
        goto LABEL_12;
      }
      id v7 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        id v8 = "Notifications: MomentShare's invitor is NOT in my contacts.";
        goto LABEL_10;
      }
    }
  }
  else
  {
    id v7 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v8 = "Notifications: no sender email address.";
      goto LABEL_10;
    }
  }
LABEL_12:
}

uint64_t __68__PLNotificationManager_noteDidReceiveCMMInvitationWithMomentShare___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained UNCenter];
  [v3 updateBadgeCountWithDelay:1];

  id v4 = *(void **)(a1 + 32);
  return [v4 stillAlive];
}

- (void)noteSharedAssetCommentsUnreadStatusDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 cloudHasUnseenComments];
  id v6 = [v4 uuid];
  id v7 = (void *)[v6 copy];

  id v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v4 uuid];
    id v10 = (void *)v9;
    uint64_t v11 = @"NO";
    if (v5) {
      uint64_t v11 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    long long v19 = v11;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Notifications: Processing assetCommentsUnreadStatusDidChange for asset %@, unread: %@", buf, 0x16u);
  }
  if ((v5 & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteSharedAssetCommentsUnreadStatusDidChange:]"];
    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v15, (id *)buf);
    id v13 = v7;
    id v14 = v12;
    pl_dispatch_async();

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __70__PLNotificationManager_noteSharedAssetCommentsUnreadStatusDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteNotificationsForAssetWithUUID:*(void *)(a1 + 32) shouldDeleteCommentsOrLikeNotifications:1 shouldDeletePhotosAddedToAlbumNotifications:0];

  id v3 = *(void **)(a1 + 40);
  return [v3 stillAlive];
}

- (void)noteSharedAlbumUnseenStatusDidChange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 hasUnseenContentBoolValue];
  id v6 = [v4 uuid];
  id v7 = (void *)[v6 copy];

  id v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v4 localizedTitle];
    id v10 = @"NO";
    *(_DWORD *)long long buf = 138412802;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    if (v5) {
      id v10 = @"YES";
    }
    long long v19 = v7;
    __int16 v20 = 2112;
    long long v21 = v10;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Notifications: processing albumUnseenStatusDidChange \"%@\" (%@), unseen: %@", buf, 0x20u);
  }
  uint64_t v11 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteSharedAlbumUnseenStatusDidChange:]"];
  objc_initWeak((id *)buf, self);
  char v15 = v5;
  objc_copyWeak(&v14, (id *)buf);
  id v12 = v7;
  id v13 = v11;
  pl_dispatch_async();

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

uint64_t __62__PLNotificationManager_noteSharedAlbumUnseenStatusDidChange___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    id v2 = [MEMORY[0x1E4F28E60] indexSet];
    [v2 addIndex:0];
    [v2 addIndex:1];
    [v2 addIndex:3];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _deleteNotificationsForAlbumWithUUID:*(void *)(a1 + 32) notificationTypes:v2];
  }
  id v4 = *(void **)(a1 + 40);
  return [v4 stillAlive];
}

- (void)noteDidReceiveLike:(id)a3 mstreamdInfo:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 shouldNotifyAsNotificationWithMediaStreamInfo:v7 asCaptionOnly:0] & 1) == 0)
  {
    id v12 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v6 commenterDisplayName];
      uint64_t v17 = [v6 asset];
      __int16 v18 = [v17 uuid];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring received like from %@, asset: %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  id v8 = [v6 asset];
  if ([v8 isCloudSharedAsset])
  {
    uint64_t v9 = [v6 asset];
    id v10 = [v9 cloudShareAlbum];
    char v11 = [v10 cloudNotificationsEnabled];

    if ((v11 & 1) == 0)
    {
      id v12 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v6 asset];
        id v14 = [v13 cloudShareAlbum];
        char v15 = [v14 localizedTitle];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v15;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring received like notification since we are currently not accepting notification for album %@.", buf, 0xCu);
      }
LABEL_6:

      goto LABEL_18;
    }
  }
  else
  {
  }
  long long v19 = [v7 valueForKey:*MEMORY[0x1E4F5C4A0]];
  int v20 = [v19 BOOLValue];

  long long v21 = PLPhotoSharingGetLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring add liked notification beause it's not interesting as per mstreamd dictionary.", buf, 2u);
    }
  }
  else
  {
    if (v22)
    {
      long long v23 = [v6 commenterDisplayName];
      long long v24 = [v6 asset];
      uint64_t v25 = [v24 uuid];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Notifications: Processing recevedLike: %@. asset: %@", buf, 0x16u);
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v32 = __Block_byref_object_copy__77218;
    uint64_t v33 = __Block_byref_object_dispose__77219;
    id v34 = [[PLNotification alloc] initWithLikeAdded:v6];
    id v26 = self->_isolationQueue;
    uint64_t v27 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteDidReceiveLike:mstreamdInfo:]"];
    objc_initWeak(&location, self);
    objc_copyWeak(&v29, &location);
    id v28 = v27;
    pl_dispatch_async();

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
  }
LABEL_18:
}

void __57__PLNotificationManager_noteDidReceiveLike_mstreamdInfo___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained UNCenter];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __57__PLNotificationManager_noteDidReceiveLike_mstreamdInfo___block_invoke_2;
  uint64_t v9 = &unk_1E586F5A8;
  objc_copyWeak(&v11, v2);
  uint64_t v10 = *(void *)(a1 + 40);
  [v4 mergeExistingAndSendNotificationForNotification:v5 thumbnailHandler:&v6];

  objc_msgSend(*(id *)(a1 + 32), "stillAlive", v6, v7, v8, v9);
  objc_destroyWeak(&v11);
}

void __57__PLNotificationManager_noteDidReceiveLike_mstreamdInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateImageDataForNotification:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)noteDidReceiveComment:(id)a3 mstreamdInfo:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v39 = 0;
  char v8 = [v6 shouldNotifyAsNotificationWithMediaStreamInfo:v7 asCaptionOnly:&v39];
  char v9 = v8;
  if (v39) {
    char v10 = 1;
  }
  else {
    char v10 = v8;
  }
  if ((v10 & 1) == 0)
  {
    char v15 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = [v6 cloudGUID];
      int v20 = [v6 asset];
      long long v21 = [v20 cloudAssetGUID];
      BOOL v22 = [v6 isCaption];
      int v23 = [v22 BOOLValue];
      long long v24 = @"N";
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      if (v23) {
        long long v24 = @"Y";
      }
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t))v24;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring received comment: %@, for asset: %@, isCaption: %@", buf, 0x20u);
    }
    goto LABEL_9;
  }
  id v11 = [v6 asset];
  if ([v11 isCloudSharedAsset])
  {
    id v12 = [v6 asset];
    id v13 = [v12 cloudShareAlbum];
    char v14 = [v13 cloudNotificationsEnabled];

    if ((v14 & 1) == 0)
    {
      char v15 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v6 asset];
        uint64_t v17 = [v16 cloudShareAlbum];
        __int16 v18 = [v17 cloudGUID];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring received comment notification since we are currently not accepting notification for album %@.", buf, 0xCu);
      }
LABEL_9:

      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v25 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = [v6 cloudGUID];
    uint64_t v27 = [v6 asset];
    id v28 = [v27 cloudAssetGUID];
    id v29 = [v6 isCaption];
    int v30 = [v29 BOOLValue];
    id v31 = @"N";
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    if (v30) {
      id v31 = @"Y";
    }
    *(void *)&buf[14] = v28;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v41 = (uint64_t (*)(uint64_t, uint64_t))v31;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_DEFAULT, "Notifications: Processing received comment: %@, for asset: %@, isCaption: %@", buf, 0x20u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__77218;
  v42 = __Block_byref_object_dispose__77219;
  uint64_t v43 = [[PLNotification alloc] initWithCommentAdded:v6];
  id v32 = self->_isolationQueue;
  uint64_t v33 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteDidReceiveComment:mstreamdInfo:]"];
  objc_initWeak(&location, self);
  char v36 = v9;
  char v37 = v39;
  objc_copyWeak(&v35, &location);
  id v34 = v33;
  pl_dispatch_async();

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  _Block_object_dispose(buf, 8);
LABEL_21:
}

uint64_t __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56) || !*(unsigned char *)(a1 + 57))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v3 = [WeakRetained UNCenter];
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) requestIdentifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke_68;
    v18[3] = &unk_1E586F5D0;
    char v20 = *(unsigned char *)(a1 + 56);
    void v18[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v19, (id *)(a1 + 48));
    [v3 findExistingNotificationByIdentifier:v4 withCompletionHandler:v18];

    objc_destroyWeak(&v19);
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) photosBatchID];
    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 48));
      id v7 = [v6 _waitingNotificationForPhotosBatchID:v5];

      if (v7)
      {
        char v8 = [v7 notificationByMergingWithNotification:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
        if (v8)
        {
          id v9 = objc_loadWeakRetained((id *)(a1 + 48));
          [v9 _removeWaitingNotificationForPhotosBatchID:v5];

          id v10 = objc_loadWeakRetained((id *)(a1 + 48));
          id v11 = [v10 UNCenter];
          [v11 sendNotificationForNotification:v8];

          id v12 = [v8 thumbnailImageData];

          if (!v12)
          {
            id v13 = objc_loadWeakRetained((id *)(a1 + 48));
            [v13 _updateImageDataForNotification:v8];
          }
        }
        else
        {
          char v15 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            *(_DWORD *)long long buf = 138412546;
            BOOL v22 = v7;
            __int16 v23 = 2112;
            uint64_t v24 = v16;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Notifications: found same batch notification, but failed to merge. (found: %@, new: %@)", buf, 0x16u);
          }

          char v8 = 0;
        }
      }
      else
      {
        char v8 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          char v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          *(_DWORD *)long long buf = 138412290;
          BOOL v22 = v14;
          _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Notifications: Caption comment arrived, but no \"Photos added batch\" waiting. (new: %@)", buf, 0xCu);
        }
      }
    }
  }
  return [*(id *)(a1 + 32) stillAlive];
}

void __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke_68(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && !*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = [WeakRetained UNCenter];
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke_2;
    v8[3] = &unk_1E586F5A8;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    v8[4] = *(void *)(a1 + 32);
    [v6 mergeExistingAndSendNotificationForNotification:v7 thumbnailHandler:v8];

    objc_destroyWeak(&v9);
  }
}

void __60__PLNotificationManager_noteDidReceiveComment_mstreamdInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateImageDataForNotification:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (void)noteDidChangePlaceholderKindForAsset:(id)a3 fromOldKind:(signed __int16)a4 forSharedAlbum:(id)a5 mstreamdInfo:(id)a6
{
  *(void *)&v20[5] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if ([v9 cloudIsMyAsset]
    && ![(PLNotificationManager *)self enableTemporaryDebugMode])
  {
    uint64_t v16 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v10 localizedTitle];
      int v19 = 138412290;
      *(void *)char v20 = v17;
      __int16 v18 = "Notifications: Ignoring placeholderKindChanged notification since we own the album %@.";
      goto LABEL_13;
    }
  }
  else if ([v10 cloudNotificationsEnabled])
  {
    int v12 = [v9 cloudPlaceholderKind];
    id v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109378;
      v20[0] = v12;
      LOWORD(v20[1]) = 2112;
      *(void *)((char *)&v20[1] + 2) = v9;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Notifications: Processing placeholderKindChanged. Asset changed to %d. (asset: %@)", (uint8_t *)&v19, 0x12u);
    }

    char v14 = [v11 valueForKey:*MEMORY[0x1E4F5C4A0]];
    int v15 = [v14 BOOLValue];

    if (!v15)
    {
      [(PLNotificationManager *)self triggerNotificationThumbnailUpdateForAsset:v9];
      goto LABEL_15;
    }
    uint64_t v16 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v10 localizedTitle];
      int v19 = 138412290;
      *(void *)char v20 = v17;
      __int16 v18 = "Notifications: Ignoring placeholderKindChanged notification for album %@ beause it's not interesting as per "
            "mstreamd dictionary.";
LABEL_13:
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    uint64_t v16 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v10 localizedTitle];
      int v19 = 138412290;
      *(void *)char v20 = v17;
      __int16 v18 = "Notifications: Ignoring placeholderKindChanged notification since we are currently not accepting notification for album %@.";
      goto LABEL_13;
    }
  }

LABEL_15:
}

- (void)noteDidReceiveAssets:(id)a3 forSharedAlbum:(id)a4 mstreamdInfo:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 firstObject];
  if ([v11 cloudIsMyAsset])
  {
    BOOL v12 = [(PLNotificationManager *)self enableTemporaryDebugMode];

    if (!v12)
    {
      id v13 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        char v14 = [v9 localizedTitle];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring addedAsset notification since we own the  asset in the album %@.", buf, 0xCu);
      }
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ([v9 cloudNotificationsEnabled])
  {
    int v15 = [MEMORY[0x1E4F1CA48] array];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke;
    v29[3] = &unk_1E5872990;
    id v13 = v15;
    int v30 = v13;
    [v8 enumerateObjectsUsingBlock:v29];
    uint64_t v16 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v9 localizedTitle];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Notifications: Processing addedAsset to \"%@\", UUIDs: %@.", buf, 0x16u);
    }
    __int16 v18 = [v10 valueForKey:*MEMORY[0x1E4F5C4A0]];
    int v19 = [v18 BOOLValue];

    if (v19)
    {
      char v20 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        long long v21 = [v9 localizedTitle];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring addedAsset notification for album %@ beause it's not interesting as per mstreamd dictionary.", buf, 0xCu);
      }
    }
    else
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      id v32 = __Block_byref_object_copy__77218;
      uint64_t v33 = __Block_byref_object_dispose__77219;
      id v34 = [[PLNotification alloc] initWithAssetsAdded:v8 toAlbum:v9];
      __int16 v23 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteDidReceiveAssets:forSharedAlbum:mstreamdInfo:]"];
      uint64_t v24 = self->_isolationQueue;
      objc_initWeak(&location, self);
      objc_copyWeak(&v27, &location);
      uint64_t v25 = v24;
      id v26 = v23;
      pl_dispatch_async();

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    id v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v22 = [v9 localizedTitle];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring addedAsset notification since we are currently not accepting notification for album %@.", buf, 0xCu);
    }
  }
LABEL_17:
}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 uuid];
  [v2 addObject:v3];
}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_61(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) photosBatchID];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = WeakRetained;
  if (v2)
  {
    uint64_t v5 = [WeakRetained _addWaitingNotification:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forPhotosBatchID:v2];

    dispatch_time(0, 3000000000);
    objc_copyWeak(&v9, (id *)(a1 + 56));
    id v7 = v2;
    id v8 = v5;
    pl_dispatch_after();

    objc_destroyWeak(&v9);
  }
  else
  {
    id v6 = [WeakRetained UNCenter];
    [v6 mergeExistingAndSendNotificationForNotification:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) thumbnailHandler:0];
  }
  [*(id *)(a1 + 40) stillAlive];
}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained _waitingNotificationForPhotosBatchID:*(void *)(a1 + 32)];

  if (v4 && v4 == *(void **)(a1 + 40))
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 _removeWaitingNotificationForPhotosBatchID:*(void *)(a1 + 32)];

    uint64_t v6 = [v4 notificationType];
    id v7 = [v4 keyObjectUUID];
    id v8 = +[PLNotification requestIdentifierByNotificationType:v6 keyObjectUUID:v7 photosBatchID:*(void *)(a1 + 32)];

    id v9 = objc_loadWeakRetained(v2);
    id v10 = [v9 UNCenter];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_3;
    v12[3] = &unk_1E586F558;
    objc_copyWeak(&v15, v2);
    id v13 = v4;
    id v11 = v8;
    id v14 = v11;
    [v10 findExistingNotificationByIdentifier:v11 withCompletionHandler:v12];

    objc_destroyWeak(&v15);
  }
}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_3(uint64_t a1, int a2)
{
  id v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v6 = [WeakRetained UNCenter];
  uint64_t v7 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_4;
    v14[3] = &unk_1E5875DA0;
    id v9 = &v16;
    objc_copyWeak(&v16, v4);
    id v15 = *(id *)(a1 + 32);
    [v6 mergeExistingAndSendNotificationForNotification:v7 requestIdentifier:v8 thumbnailHandler:v14];
    id v10 = &v15;
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_5;
    v11[3] = &unk_1E5875DA0;
    id v9 = &v13;
    objc_copyWeak(&v13, v4);
    id v12 = *(id *)(a1 + 32);
    [v6 mergeExistingAndSendNotificationForNotification:v7 thumbnailHandler:v11];
    id v10 = &v12;
  }

  objc_destroyWeak(v9);
}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateImageDataForNotification:*(void *)(a1 + 32)];
}

void __74__PLNotificationManager_noteDidReceiveAssets_forSharedAlbum_mstreamdInfo___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateImageDataForNotification:*(void *)(a1 + 32)];
}

- (void)noteMultipleContributorStatusChangedForAlbum:(id)a3 mstreamdInfo:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 valueForKey:*MEMORY[0x1E4F5C4A0]];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v6 localizedTitle];
      *(_DWORD *)long long buf = 138412290;
      id v28 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring multipleContributorStatusChanged notification for album %@ beause it's not interesting as per mstreamd dictionary.", buf, 0xCu);
    }
  }
  else if ([v6 cloudNotificationsEnabled])
  {
    if ([v6 isOwnedCloudSharedAlbum]
      && ![(PLNotificationManager *)self enableTemporaryDebugMode])
    {
      id v10 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v22 = [v6 localizedTitle];
        *(_DWORD *)long long buf = 138412290;
        id v28 = v22;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring multiple status changed notification because we are not subscribed to this the album %@.", buf, 0xCu);
      }
    }
    else
    {
      id v12 = [v6 cloudMultipleContributorsEnabled];
      int v13 = [v12 BOOLValue];

      if (v13)
      {
        id v14 = [[PLNotification alloc] initWithMultipleContributorEnabledForAlbum:v6];
        id v15 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteMultipleContributorStatusChangedForAlbum:mstreamdInfo:]"];
        objc_initWeak((id *)buf, self);
        v24[1] = (id)MEMORY[0x1E4F143A8];
        v24[2] = (id)3221225472;
        v24[3] = __83__PLNotificationManager_noteMultipleContributorStatusChangedForAlbum_mstreamdInfo___block_invoke;
        v24[4] = &unk_1E586F530;
        objc_copyWeak(&v26, (id *)buf);
        id v10 = v14;
        v24[5] = v10;
        id v25 = v15;
        pl_dispatch_async();

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        uint64_t v17 = [v6 uuid];
        __int16 v18 = (void *)[v17 copy];

        int v19 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          char v20 = [v6 localizedTitle];
          *(_DWORD *)long long buf = 138412290;
          id v28 = v20;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Notifications: Deleting notifications for multiple contributor status change for album: %@.", buf, 0xCu);
        }
        long long v21 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteMultipleContributorStatusChangedForAlbum:mstreamdInfo:]"];
        objc_initWeak((id *)buf, self);
        objc_copyWeak(v24, (id *)buf);
        id v10 = v18;
        id v23 = v21;
        pl_dispatch_async();

        objc_destroyWeak(v24);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    id v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v6 localizedTitle];
      *(_DWORD *)long long buf = 138412290;
      id v28 = v16;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring multipleContributorStatusChanged notification since we are currently not accepting notification for album %@.", buf, 0xCu);
    }
  }
}

uint64_t __83__PLNotificationManager_noteMultipleContributorStatusChangedForAlbum_mstreamdInfo___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [a1[4] senderEmailAddress];
  int v5 = [WeakRetained _shouldAllowAlertsFromContactWithEmail:v4];

  if (v5)
  {
    id v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = a1[4];
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Notifications: Created notification for multiple contributor status change: %@.", (uint8_t *)&v11, 0xCu);
    }

    id v8 = objc_loadWeakRetained(v2);
    int v9 = [v8 UNCenter];
    [v9 sendNotificationForNotification:a1[4]];
  }
  return [a1[5] stillAlive];
}

void __83__PLNotificationManager_noteMultipleContributorStatusChangedForAlbum_mstreamdInfo___block_invoke_58(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  [v3 addIndex:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteNotificationsForAlbumWithUUID:*(void *)(a1 + 32) notificationTypes:v3];

  [*(id *)(a1 + 40) stillAlive];
}

- (void)noteInvitationRecordStatusChanged:(id)a3 fromOldState:(int64_t)a4 mstreamdInfo:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 album];
  int v11 = [v9 valueForKey:*MEMORY[0x1E4F5C4A0]];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    uint64_t v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v10 localizedTitle];
      *(_DWORD *)long long buf = 138412546;
      int64_t v36 = (int64_t)v14;
      __int16 v37 = 2112;
      id v38 = v8;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring invitatitionRecordStatusChanged notification for album %@ and invitationRecord %@ beause it's not interesting as per mstreamd dictionary.", buf, 0x16u);
    }
  }
  id v15 = [v8 invitationState];
  unsigned int v16 = [v15 intValue];

  if (([v10 isOwnedCloudSharedAlbum] & 1) != 0
    || [(PLNotificationManager *)self enableTemporaryDebugMode])
  {
    int v17 = 0;
  }
  else
  {
    __int16 v18 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = [v10 localizedTitle];
      *(_DWORD *)long long buf = 138412290;
      int64_t v36 = (int64_t)v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring invitation status changed because we don't own the album %@.", buf, 0xCu);
    }
    int v17 = 1;
  }
  if (([v10 cloudNotificationsEnabled] & 1) == 0)
  {
    BOOL v22 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v10 localizedTitle];
      *(_DWORD *)long long buf = 138412290;
      int64_t v36 = (int64_t)v23;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring invitation status changed since we are currently not accepting notification for album %@.", buf, 0xCu);
    }
    goto LABEL_27;
  }
  if ([(PLNotificationManager *)self enableTemporaryDebugMode]
    || v16 != a4 && (v16 == 2 || v16 == 4))
  {
    if (((v17 | v12) & 1) == 0)
    {
      char v20 = [[PLNotification alloc] initWithInvitationRecordStatusChanged:v8];
      long long v21 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteInvitationRecordStatusChanged:fromOldState:mstreamdInfo:]"];
      objc_initWeak((id *)buf, self);
      v32[1] = (id)MEMORY[0x1E4F143A8];
      v32[2] = (id)3221225472;
      v32[3] = __85__PLNotificationManager_noteInvitationRecordStatusChanged_fromOldState_mstreamdInfo___block_invoke;
      v32[4] = &unk_1E586F530;
      objc_copyWeak(&v34, (id *)buf);
      BOOL v22 = v20;
      v32[5] = v22;
      id v33 = v21;
      pl_dispatch_async();

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);

LABEL_27:
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v24 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      int64_t v36 = a4;
      __int16 v37 = 2048;
      id v38 = (id)(int)v16;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "Notifications: Ignoring invitation status changed because it changed from %ld to %ld.", buf, 0x16u);
    }
  }
  if (([v10 isOwnedCloudSharedAlbum] & 1) == 0 && v16 >= 2)
  {
    id v25 = [v8 inviteeEmails];
    id v26 = [v25 firstObject];
    BOOL v27 = +[PLPhotoSharingHelper accountMatchesEmail:v26];

    if (v27)
    {
      id v28 = [v10 uuid];
      uint64_t v29 = (void *)[v28 copy];

      int v30 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteInvitationRecordStatusChanged:fromOldState:mstreamdInfo:]"];
      objc_initWeak((id *)buf, self);
      objc_copyWeak(v32, (id *)buf);
      BOOL v22 = v29;
      id v31 = v30;
      pl_dispatch_async();

      objc_destroyWeak(v32);
      objc_destroyWeak((id *)buf);

      goto LABEL_27;
    }
  }
LABEL_28:
}

uint64_t __85__PLNotificationManager_noteInvitationRecordStatusChanged_fromOldState_mstreamdInfo___block_invoke(id *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [a1[4] senderEmailAddress];
  int v5 = [WeakRetained _shouldAllowAlertsFromContactWithEmail:v4];

  if (v5)
  {
    id v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = a1[4];
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Notifications: Created notification for invitation changed: %@.", (uint8_t *)&v11, 0xCu);
    }

    id v8 = objc_loadWeakRetained(v2);
    id v9 = [v8 UNCenter];
    [v9 sendNotificationForNotification:a1[4]];
  }
  return [a1[5] stillAlive];
}

void __85__PLNotificationManager_noteInvitationRecordStatusChanged_fromOldState_mstreamdInfo___block_invoke_57(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  [v3 addIndex:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteNotificationsForAlbumWithUUID:*(void *)(a1 + 32) notificationTypes:v3];

  [*(id *)(a1 + 40) stillAlive];
}

- (void)noteDidDeleteSharedAssetsWithUUIDs:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteDidDeleteSharedAssetsWithUUIDs:]"];
  objc_initWeak(&location, self);
  id v6 = v4;
  objc_copyWeak(&v8, &location);
  id v7 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

uint64_t __60__PLNotificationManager_noteDidDeleteSharedAssetsWithUUIDs___block_invoke(id *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained(a1 + 6);
        objc_msgSend(WeakRetained, "_deleteNotificationsForAssetWithUUID:shouldDeleteCommentsOrLikeNotifications:shouldDeletePhotosAddedToAlbumNotifications:", v7, 1, 1, (void)v10);

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return [a1[5] stillAlive];
}

- (void)noteDidDeleteSharedAlbum:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteDidDeleteSharedAlbum:]"];
  uint64_t v6 = [v4 uuid];
  uint64_t v7 = (void *)[v6 copy];

  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  id v8 = v7;
  id v9 = v5;
  pl_dispatch_async();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__PLNotificationManager_noteDidDeleteSharedAlbum___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F28E60] indexSet];
  [v3 addIndex:0];
  [v3 addIndex:1];
  [v3 addIndex:3];
  [v3 addIndex:4];
  [v3 addIndex:5];
  [v3 addIndex:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _deleteNotificationsForAlbumWithUUID:*(void *)(a1 + 32) notificationTypes:v3];

  [*(id *)(a1 + 40) stillAlive];
}

- (void)noteDidReceiveInvitationForSharedAlbum:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[PLNotification alloc] initWithInvitationAlbum:v4];
  objc_initWeak(&location, self);
  uint64_t v6 = [MEMORY[0x1E4F8BA48] transaction:"-[PLNotificationManager noteDidReceiveInvitationForSharedAlbum:]"];
  objc_copyWeak(&v9, &location);
  uint64_t v7 = v5;
  id v8 = v6;
  pl_dispatch_async();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __64__PLNotificationManager_noteDidReceiveInvitationForSharedAlbum___block_invoke(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = [a1[4] senderEmailAddress];
  int v5 = [WeakRetained _shouldAllowAlertsFromContactWithEmail:v4];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    uint64_t v7 = [v6 UNCenter];
    id v8 = [a1[4] requestIdentifier];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    long long v12 = __64__PLNotificationManager_noteDidReceiveInvitationForSharedAlbum___block_invoke_2;
    long long v13 = &unk_1E586F508;
    id v14 = a1[4];
    objc_copyWeak(&v15, v2);
    [v7 findExistingNotificationByIdentifier:v8 withCompletionHandler:&v10];

    objc_destroyWeak(&v15);
  }
  return objc_msgSend(a1[5], "stillAlive", v10, v11, v12, v13);
}

void __64__PLNotificationManager_noteDidReceiveInvitationForSharedAlbum___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = PLPhotoSharingGetLog();
  BOOL v5 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_19B3C7000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Notifications: Ignored notification for album invitation: %@.", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_19B3C7000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Notifications: Created notification for album invitation: %@.", (uint8_t *)&v9, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [WeakRetained UNCenter];
    [v8 sendNotificationForNotification:*(void *)(a1 + 32)];
  }
}

- (void)setEnableTemporaryDebugMode:(BOOL)a3
{
  self->_enableTemporaryDebugMode = a3;
}

- (BOOL)enableTemporaryDebugMode
{
  return self->_enableTemporaryDebugMode;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)PLNotificationManager;
  [(PLNotificationManager *)&v4 dealloc];
}

- (id)_initSharedInstance
{
  v10.receiver = self;
  v10.super_class = (Class)PLNotificationManager;
  id v2 = [(PLNotificationManager *)&v10 init];
  id v3 = v2;
  if (v2)
  {
    v2->_int alertFiltrationEnabled = -1;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PLNotificationManager.IsolationQueue", 0);
    isolationQueue = v3->_isolationQueue;
    v3->_isolationQueue = (OS_dispatch_queue *)v4;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)incomingMessageAlertFiltrationEnabledChanged, @"com.apple.mobileslideshow.IncomingMessageAlertFiltration.changed", 0, (CFNotificationSuspensionBehavior)1028);
    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    waitingAssetsAddNotifications = v3->_waitingAssetsAddNotifications;
    v3->_waitingAssetsAddNotifications = v7;

    v3->_processCinematicVideoItemsPrompt = 0;
    v3->_processCinematicVideoItemsPromptLock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (PLNotificationManager)init
{
  dispatch_queue_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLNotificationManager.m" lineNumber:157 description:@"Do not use this initializer"];

  return 0;
}

+ (id)_bestDateForDeliveringNotificationFromCoreDuetWithError:(id *)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v4 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v5 = [MEMORY[0x1E4F5B560] knowledgeStore];
  uint64_t v6 = [MEMORY[0x1E4F5B5C8] predictorWithKnowledgeStore:v5];
  uint64_t v7 = [v6 launchLikelihoodPredictionForApp:0];
  id v8 = [MEMORY[0x1E4F5B5B8] predictionUnavailable];

  if (v7 != v8)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
    objc_super v10 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v11 = [v7 startDate];
    long long v12 = [v7 endDate];
    [v11 timeIntervalSinceDate:v12];
    double v14 = v13;

    if (v14 < 0.0)
    {
      uint64_t v39 = v5;
      id v40 = v4;
      char v15 = 0;
      uint64_t v16 = 0;
      double v17 = 0.0;
      do
      {
        __int16 v18 = v11;
        if (objc_msgSend(v10, "isDateInToday:", v11, v39, v40))
        {
          int v19 = [v7 valueAtDate:v11];
          [v19 doubleValue];
          double v21 = v20;

          if (v21 >= v17)
          {
            id v22 = v18;

            char v15 = 1;
            id v9 = v22;
            double v17 = v21;
          }
        }
        id v23 = [v7 transitionDates];
        uint64_t v24 = v16 + 1;
        uint64_t v11 = [v23 objectAtIndexedSubscript:v16];

        id v25 = [v7 endDate];
        [v11 timeIntervalSinceDate:v25];
        double v27 = v26;

        uint64_t v16 = v24;
      }
      while (v27 < 0.0);
      if (v15)
      {
        id v28 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [MEMORY[0x1E4F1CA20] currentLocale];
          int v30 = [v9 descriptionWithLocale:v29];
          *(_DWORD *)long long buf = 138412546;
          id v42 = v30;
          __int16 v43 = 2048;
          double v44 = v17;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "Most likely to use device at date %@ with likelihood %2.2f", buf, 0x16u);
        }
        BOOL v5 = v39;
        dispatch_queue_t v4 = v40;
LABEL_20:

        id v34 = v9;
        id v36 = v34;
        goto LABEL_21;
      }
      BOOL v5 = v39;
      dispatch_queue_t v4 = v40;
    }
    __int16 v37 = v9;
    id v9 = v4;

    id v28 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "No interesting dates in today returned from -[_DKPredictor launchLikelihoodPredictionForApp:], using default date.", buf, 2u);
    }
    goto LABEL_20;
  }
  id v31 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v32 = *MEMORY[0x1E4F8C500];
  uint64_t v45 = *MEMORY[0x1E4F28568];
  v46[0] = @"Problem while querying -[_DKPredictor launchLikelihoodPredictionForApp:]: prediction unavailable.";
  id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  id v34 = [v31 errorWithDomain:v32 code:0 userInfo:v33];

  if (a3) {
    *a3 = v34;
  }
  uint64_t v35 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v42 = v34;
    _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "Error: %@, can't predict best time to notify", buf, 0xCu);
  }

  id v36 = v4;
LABEL_21:

  return v36;
}

+ (id)_bestDateForDeliveringNotification
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  double v5 = (double)arc4random_uniform(0x708u);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = (id)PhotosMemoriesBestContentStartTimeHours;
  uint64_t v6 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(obj);
        }
        objc_super v10 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v11 = [v2 components:124 fromDate:v3];
        objc_msgSend(v11, "setHour:", objc_msgSend(v10, "integerValue"));
        [v11 setMinute:0];
        long long v12 = [v2 dateFromComponents:v11];
        double v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 duration:7200.0];
        if ([v13 containsDate:v3])
        {
          id v31 = v11;
          uint64_t v32 = [v3 dateByAddingTimeInterval:v5];

          id v33 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            id v34 = [v4 stringFromDate:v32];
            *(_DWORD *)long long buf = 138412290;
            id v51 = v34;
            _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "Memory Notification scheduled within best content time with offset: %@ (local time)", buf, 0xCu);
          }
          id v3 = v32;

          uint64_t v29 = v3;
          goto LABEL_28;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v44 = 0;
  obuint64_t j = [a1 _bestDateForDeliveringNotificationFromCoreDuetWithError:&v44];
  id v14 = v44;
  if (v14)
  {
    char v15 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v51 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error while calling +[PLNotificationManager(Private) _bestDateForDeliveringNotificationFromCoreDuetWithError:]: %@", buf, 0xCu);
    }

    id v16 = v3;
    obuint64_t j = v16;
  }
  double v17 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v18 = [v4 stringFromDate:obj];
    *(_DWORD *)long long buf = 138412290;
    id v51 = v18;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "CoreDuet suggested Memory Notification time: %@ (local time)", buf, 0xCu);
  }
  id v36 = v14;
  id v38 = v4;

  int v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v20 = (id)PhotosMemoriesBestContentStartTimeHours;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        double v26 = objc_msgSend(v2, "nextDateAfterDate:matchingHour:minute:second:options:", obj, objc_msgSend(v25, "integerValue"), 0, 0, 1024);
        double v27 = objc_msgSend(v2, "nextDateAfterDate:matchingHour:minute:second:options:", v3, objc_msgSend(v25, "integerValue"), 0, 0, 1024);
        id v28 = [v19 earlierDate:v26];

        int v19 = [v28 earlierDate:v27];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v22);
  }

  uint64_t v29 = [v19 dateByAddingTimeInterval:v5];

  long long v12 = PLPhotoSharingGetLog();
  id v4 = v38;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = [v38 stringFromDate:v29];
    *(_DWORD *)long long buf = 138412290;
    id v51 = v30;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Memory Notification scheduled at next best content start time: %@ (local time)", buf, 0xCu);
  }
  id v31 = v36;
LABEL_28:

  return v29;
}

+ (id)_notificationDeliveryDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"PhotosMemoriesNotificationDelayOverride"];

  if (v3)
  {
    [v3 doubleValue];
    double v5 = v4;
    if (v4 >= 0.0)
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v6 = [v11 dateByAddingTimeInterval:v5];
    }
    else
    {
      uint64_t v6 = 0;
    }
    uint64_t v7 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v13 = 134218242;
    double v14 = v5;
    __int16 v15 = 2112;
    id v16 = @"PhotosMemoriesNotificationDelayOverride";
    uint64_t v8 = "Memories Notification: overriding notification delay with time inverval %.2f because of user defaults %@";
    id v9 = v7;
    uint32_t v10 = 22;
  }
  else
  {
    uint64_t v6 = +[PLNotificationManager _bestDateForDeliveringNotification];
    uint64_t v7 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v13 = 138412290;
    double v14 = *(double *)&v6;
    uint64_t v8 = "Memories Notification Delivery Date: %@";
    id v9 = v7;
    uint32_t v10 = 12;
  }
  _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
LABEL_10:

  return v6;
}

+ (id)filteredAlbumListForContentMode:(int)a3 library:(id)a4
{
  double v5 = objc_msgSend(a4, "albumListForContentMode:");
  if (v5)
  {
    if (a3 == 13) {
      unsigned int v6 = 17174528;
    }
    else {
      unsigned int v6 = 397312;
    }
    if (a3 == 1) {
      uint64_t v7 = 462848;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t v8 = +[PLFilteredAlbumList filteredAlbumList:v5 filter:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)sharedManager
{
  pl_dispatch_once();
  id v2 = (void *)sharedManager___sharedManager;
  return v2;
}

void __38__PLNotificationManager_sharedManager__block_invoke(uint64_t a1)
{
  if ((PLIsAssetsd() & 1) != 0 || PLIsInternalTool())
  {
    id v2 = [[PLNotificationManager alloc] _initSharedInstance];
    id v3 = (void *)sharedManager___sharedManager;
    sharedManager___sharedManager = (uint64_t)v2;

    double v4 = objc_alloc_init(PLNotificationUNCenter);
    [(id)sharedManager___sharedManager setUNCenter:v4];

    uint64_t v5 = sharedManager___sharedManager;
    id v6 = [(id)sharedManager___sharedManager UNCenter];
    [v6 setDelegate:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"PLNotificationManager.m" lineNumber:148 description:@"PLNotificationManager can only run on assetsd."];
  }
}

@end