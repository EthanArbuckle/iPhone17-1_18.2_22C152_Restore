@interface PLPhotoSharingHelper
+ (BOOL)_derivativeExistsForAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4;
+ (BOOL)_isUserLoggedIntoiCloud;
+ (BOOL)_recentlyRequestedDownloadAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4;
+ (BOOL)_retrieveURLsFromAssetWithUUID:(id)a3 withExportedFileURL:(id)a4 primaryURL:(id *)a5 videoComplementURL:(id *)a6;
+ (BOOL)_sharedStreamsEnabled;
+ (BOOL)_sharedStreamsExplicitlyDisabled;
+ (BOOL)accountMatchesEmail:(id)a3;
+ (BOOL)canAcceptPendingInvitationForAlbum:(id)a3 error:(id *)a4;
+ (BOOL)canCreateStreamInPhotoLibrary:(id)a3 error:(id *)a4;
+ (BOOL)canSetUserCloudSharedLiked:(BOOL)a3 forAssets:(id)a4 error:(id *)a5;
+ (BOOL)debugAlwaysStreamSharedVideos;
+ (BOOL)debugAutoAcceptInvitation;
+ (BOOL)debugDownloadAllDerivatives;
+ (BOOL)debugDownloadMetadataOnly;
+ (BOOL)debugDownloadThumbnailsOnly;
+ (BOOL)hasPhoneInvitationForAlbum:(id)a3;
+ (BOOL)hasReachedLimitOfOwnedStreamsInLibrary:(id)a3;
+ (BOOL)hasReachedLimitOfSubscribedStreamsInLibrary:(id)a3;
+ (BOOL)isBreadcrumbDebugEnabled;
+ (BOOL)isCellularConnection;
+ (BOOL)prepareToEnqueueBatchOfOriginalAssetUUIDs:(id)a3 withBatchCommentText:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 andTrimmedVideoPathInfo:(id)a7 sharedAlbum:(id)a8 isNewAlbum:(BOOL)a9 error:(id *)a10;
+ (BOOL)processExportedFileURL:(id)a3 assetUUID:(id)a4 customExportsInfo:(id)a5;
+ (BOOL)removeCloudSharingDirectories:(id *)a3;
+ (BOOL)sharedStreamsEnabledForPhotoLibraryURL:(id)a3;
+ (BOOL)sharedStreamsExplictlyDisabledForPhotoLibraryURL:(id)a3;
+ (CGSize)derivedAssetSizeForMasterSizeWidth:(double)a3 height:(double)a4 derivativeType:(int)a5 withSpecificationInfo:(id)a6;
+ (CGSize)videoPosterFrameDimension;
+ (double)derivedAssetSmallDimensionLimitForType:(int)a3;
+ (double)intervalBetweenAlbumPolls;
+ (double)intervalBetweenPolls;
+ (double)intervalBetweenRelationshipPolls;
+ (id)_customSharedAlbumExportsOutputDirectoryForAssetWithUUID:(id)a3;
+ (id)_customSharedAlbumsExportsOutputDirectoryParent;
+ (id)_downloadRequestQueue;
+ (id)_localizationKeyForAssets:(id)a3;
+ (id)_pathToServerConfigurationCache;
+ (id)_phoneInvitationFailureFile;
+ (id)_processPhoneFailuresQueue;
+ (id)_transactionWithName:(const char *)a3;
+ (id)_videoComplementURLForSharingFromAsset:(id)a3;
+ (id)_videoDerivativeForVideoAtURL:(id)a3 outputURL:(id)a4 withPreset:(id)a5 reason:(id)a6 outputFileType:(id)a7;
+ (id)derivativesForMasterAsset:(id)a3 withSpecifications:(id)a4;
+ (id)directoryPathForDownloadActivityForAlbumGUID:(id)a3 create:(BOOL)a4;
+ (id)directoryPathForUploadActivityForAlbumGUID:(id)a3 create:(BOOL)a4;
+ (id)downloadNotificationForAssetwithUUID:(id)a3 cloudPlaceholderKind:(signed __int16)a4;
+ (id)photoSharingOriginalFilenameForAsset:(id)a3;
+ (id)prefixForBreadcrumbState:(int)a3;
+ (id)serverSideConfigurationDictionary;
+ (id)sharingDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4;
+ (id)sharingFirstName;
+ (id)sharingLastName;
+ (id)sharingPersonID;
+ (id)sharingUsername;
+ (id)streamdVideoCache;
+ (id)temporaryDerivativePathForCollectionGUID:(id)a3 uti:(id)a4;
+ (id)temporaryLargeVideoDerivativePathForCollectionGUID:(id)a3;
+ (id)temporarySmallVideoDerivativePathForCollectionGUID:(id)a3;
+ (id)temporaryThumbnailPathForCollectionGUID:(id)a3;
+ (id)temporaryUploadDerivativesPathForCollectionGUID:(id)a3 pathExtension:(id)a4;
+ (id)temporaryVideoPathForCollectionGUID:(id)a3;
+ (id)temporaryVideoPosterFramePathForCollectionGUID:(id)a3;
+ (id)videoDerivativesForAssetCollection:(id)a3 withSpecifications:(id)a4;
+ (int64_t)_serverLimitValueForKey:(id)a3 withDefaultResult:(int64_t)a4;
+ (int64_t)maxAssetsPerStream;
+ (int64_t)maxCharactersPerComment;
+ (int64_t)maxCommentsPerAsset;
+ (int64_t)maxGIFSizeForPublishing;
+ (int64_t)maxNumDerivativesToDownloadPerPush;
+ (int64_t)maxNumDerivativesToPrefetchPerDay;
+ (int64_t)maxNumThumbnailsToPrefetchPerDay;
+ (int64_t)maxOwnedStreams;
+ (int64_t)maxSubscribedStreams;
+ (int64_t)maxSubscribersPerStream;
+ (int64_t)maxVideoLengthForPublishing;
+ (unint64_t)purgeSpace:(unint64_t)a3;
+ (unint64_t)purgeableSpace;
+ (void)_markStreamVideosAsPurgeable;
+ (void)_resetServerSideConfigurationDictionary;
+ (void)_userDidDeleteSharedAlbum:(id)a3;
+ (void)_userDidDeleteSharedAssets:(id)a3;
+ (void)acceptPendingInvitationForAlbum:(id)a3 completionHandler:(id)a4;
+ (void)accountSettingsChanged;
+ (void)applicationIsInForeground:(BOOL)a3 photoLibraryURL:(id)a4;
+ (void)checkServerModelForAlbum:(id)a3 photoLibrary:(id)a4;
+ (void)checkServerModelRelationshipsForPhotoLibrary:(id)a3;
+ (void)clearCachedAccountState;
+ (void)declinePendingInvitationForAlbum:(id)a3;
+ (void)deleteCloudSharedAlbumFromServer:(id)a3;
+ (void)deleteCloudSharedAssetsFromServer:(id)a3 inSharedAlbum:(id)a4;
+ (void)deleteCommentWithGUIDFromServer:(id)a3;
+ (void)deleteDebugBreadcrumbsForAlbumGUID:(id)a3;
+ (void)deleteLocalAlbumsForMSASAlbumsWithGUID:(id)a3 inviterAddress:(id)a4;
+ (void)deleteLocalAlbumsForMSASAlbumsWithGUIDs:(id)a3;
+ (void)downloadAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6;
+ (void)enqueueCloudSharedAssetsForPublishToServer:(id)a3 inSharedAlbum:(id)a4;
+ (void)forgetSharingPersonID:(id)a3;
+ (void)handlePhoneInvitationFailuresWithCompletionBlock:(id)a3;
+ (void)initializeMSPlatform;
+ (void)markAlbumGUIDAsViewed:(id)a3 clearUnseenAssetsCount:(BOOL)a4;
+ (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4;
+ (void)markPendingInvitationAsSpamForAlbum:(id)a3 completionHandler:(id)a4;
+ (void)photosPreferencesChanged;
+ (void)pollForAlbumListUpdates;
+ (void)pollForAlbumListUpdatesIfNecessary;
+ (void)prioritizeDownloadsForAlbumGUID:(id)a3;
+ (void)pruneCloudSharingContentIfNecessaryInLibrary:(id)a3;
+ (void)publishCloudSharedAlbumToServer:(id)a3;
+ (void)publishCloudSharedCommentToServer:(id)a3;
+ (void)removeSubscribers:(id)a3 fromOwnedAlbum:(id)a4;
+ (void)requestVideoPlaybackURLForAsset:(id)a3 videoType:(unint64_t)a4 completion:(id)a5;
+ (void)resetAllLocalState;
+ (void)retryOutstandingActivities;
+ (void)savePhoneInvitationFailuresForPhoneNumber:(id)a3 inAlbum:(id)a4;
+ (void)sendPendingInvitationsForAlbum:(id)a3 resendInvitationGUIDs:(id)a4;
+ (void)sendPendingInvitationsForNewlyCreatedAlbum:(id)a3;
+ (void)unsubscribeFromAlbum:(id)a3;
+ (void)updateCloudSharedAlbumMetadataOnServer:(id)a3;
+ (void)updateCloudSharedAlbumMultipleContributorsStateOnServer:(id)a3;
+ (void)updateCloudSharedAlbumPublicURLStateOnServer:(id)a3;
+ (void)updateLocalAlbumMetadataForMSASAlbum:(id)a3 info:(id)a4;
+ (void)updateSharedAlbumsCachedServerConfigurationLimits;
+ (void)writeAlbumNameBreadCrumb:(id)a3 forAlbumGUID:(id)a4 isUpload:(BOOL)a5;
+ (void)writeDownloadDebugBreadcrumbForAsset:(id)a3 albumGUID:(id)a4 content:(id)a5 state:(int)a6 error:(id)a7;
+ (void)writeUploadDebugBreadcrumbForAssetCollections:(id)a3 state:(int)a4 error:(id)a5;
@end

@implementation PLPhotoSharingHelper

+ (void)applicationIsInForeground:(BOOL)a3 photoLibraryURL:(id)a4
{
  id v5 = a4;
  v6 = [a1 sharingPersonID];
  if (v6 && [(id)objc_opt_class() sharedStreamsEnabledForPhotoLibraryURL:v5])
  {
    v7 = [a1 _transactionWithName:"+[PLPhotoSharingHelper applicationIsInForeground:photoLibraryURL:]"];
    v8 = dispatch_get_global_queue(0, 0);
    id v10 = v6;
    id v9 = v7;
    pl_dispatch_async();
  }
}

+ (id)sharingPersonID
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (([(id)objc_opt_class() _sharedStreamsEnabled] & 1) == 0)
  {
    v3 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Can't return sharingPersonID because no Apple Account has Photo Sharing enabled", (uint8_t *)&v7, 2u);
    }
    goto LABEL_8;
  }
  v2 = +[PLAccountStore pl_sharedAccountStore];
  v3 = [v2 cachedPrimaryAppleAccount];

  if (!v3)
  {
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  v4 = [v3 aa_personID];
  id v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, " using sharing person id from Photo Stream account %@", (uint8_t *)&v7, 0xCu);
  }

LABEL_9:
  return v4;
}

+ (BOOL)_sharedStreamsEnabled
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v2 = _sharedStreamsEnabled;
  if (_sharedStreamsEnabled == -1)
  {
    v3 = +[PLAccountStore pl_sharedAccountStore];
    v4 = [v3 cachedPrimaryAppleAccount];

    uint64_t v5 = *MEMORY[0x1E4F17B18];
    int v6 = [v4 isEnabledForDataclass:*MEMORY[0x1E4F17B18]];
    int v7 = [v4 isProvisionedForDataclass:v5];
    int v8 = PLIsEDUMode();
    int v9 = PLIsLockdownMode();
    id v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [v4 username];
      int v16 = 138413314;
      v17 = v11;
      __int16 v18 = 1024;
      int v19 = v6;
      __int16 v20 = 1024;
      int v21 = v7;
      __int16 v22 = 1024;
      int v23 = v8;
      __int16 v24 = 1024;
      int v25 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Determining if Shared Albums enabled: Found %@ with:\nisEnabledForSharedStreams: %{BOOL}d\nisProvisionedForDataclass: %{BOOL}d\nisEDUMode: %{BOOL}d\nisLockdownMode: %{BOOL}d", (uint8_t *)&v16, 0x24u);
    }
    _sharedStreamsEnabled = v7 & v6 & ~v8 & (v9 ^ 1);
    v12 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 67109120;
      LODWORD(v17) = _sharedStreamsEnabled;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "sharedStreamsEnabled: %{BOOL}d", (uint8_t *)&v16, 8u);
    }

    if (!_sharedStreamsEnablementStateObserver)
    {
      v13 = objc_alloc_init(_PLSharedStreamsEnablementStateObserver);
      v14 = (void *)_sharedStreamsEnablementStateObserver;
      _sharedStreamsEnablementStateObserver = (uint64_t)v13;
    }
    int v2 = _sharedStreamsEnabled;
  }
  return v2 != 0;
}

+ (BOOL)_sharedStreamsExplicitlyDisabled
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = _sharedStreamsExplicitlyDisabled;
  if (_sharedStreamsExplicitlyDisabled == -1)
  {
    v3 = +[PLAccountStore pl_sharedAccountStore];
    v4 = [v3 cachedPrimaryAppleAccount];

    uint64_t v5 = *MEMORY[0x1E4F17B18];
    int v6 = [v4 isEnabledForDataclass:*MEMORY[0x1E4F17B18]];
    int v7 = [v4 isProvisionedForDataclass:v5];
    int v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v4 username];
      id v10 = (void *)v9;
      if (v6) {
        v11 = @"YES";
      }
      else {
        v11 = @"NO";
      }
      int v17 = 138412802;
      uint64_t v18 = v9;
      if (v7) {
        v12 = @"YES";
      }
      else {
        v12 = @"NO";
      }
      __int16 v19 = 2112;
      __int16 v20 = v11;
      __int16 v21 = 2112;
      __int16 v22 = v12;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "Looking for a Shared Streams account. Found %@ with isEnableForSharedStreams %@ isProvisionedForDataclass %@ ", (uint8_t *)&v17, 0x20u);
    }
    int v13 = v7 & v6 ^ 1;
    if (!v4) {
      int v13 = 0;
    }
    _sharedStreamsExplicitlyDisabled = v13;
    v14 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (_sharedStreamsExplicitlyDisabled) {
        v15 = @"YES";
      }
      else {
        v15 = @"NO";
      }
      int v17 = 138412290;
      uint64_t v18 = (uint64_t)v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "sharedStreamsExplicitlyDisabled %@", (uint8_t *)&v17, 0xCu);
    }

    int v2 = _sharedStreamsExplicitlyDisabled;
  }
  return v2 != 0;
}

void __73__PLPhotoSharingHelper_handlePhoneInvitationFailuresWithCompletionBlock___block_invoke(uint64_t a1)
{
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  int v2 = [*(id *)(a1 + 48) _phoneInvitationFailureFile];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v2];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v5);
  }
  int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v7 removeItemAtPath:v2 error:0];

  [*(id *)(a1 + 32) stillAlive];
  objc_sync_exit(obj);
}

+ (id)_phoneInvitationFailureFile
{
  pl_dispatch_once();
  int v2 = (void *)_phoneInvitationFailureFile_phoneFailureFile;
  return v2;
}

void __51__PLPhotoSharingHelper__phoneInvitationFailureFile__block_invoke()
{
  id v3 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  v0 = [v3 photoDirectoryWithType:22 additionalPathComponents:@"phoneFailures.plist"];
  uint64_t v1 = [v0 copy];
  int v2 = (void *)_phoneInvitationFailureFile_phoneFailureFile;
  _phoneInvitationFailureFile_phoneFailureFile = v1;
}

+ (BOOL)sharedStreamsEnabledForPhotoLibraryURL:(id)a3
{
  int v4 = [MEMORY[0x1E4F8B980] isSystemPhotoLibraryURL:a3];
  if (v4)
  {
    LOBYTE(v4) = [a1 _sharedStreamsEnabled];
  }
  return v4;
}

void __50__PLPhotoSharingHelper__processPhoneFailuresQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileSlideShow.PLPhotoSharingHelperProcessPhoneFailuresQueue", 0);
  uint64_t v1 = (void *)_processPhoneFailuresQueue_queue;
  _processPhoneFailuresQueue_queue = (uint64_t)v0;
}

+ (void)handlePhoneInvitationFailuresWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _transactionWithName:"+[PLPhotoSharingHelper handlePhoneInvitationFailuresWithCompletionBlock:]"];
  uint64_t v6 = [a1 _processPhoneFailuresQueue];
  uint64_t v9 = v4;
  id v7 = v5;
  id v8 = v4;
  pl_dispatch_async();
}

+ (id)_transactionWithName:(const char *)a3
{
  if (PLIsAssetsd())
  {
    id v4 = [MEMORY[0x1E4F8BA48] transaction:a3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)_processPhoneFailuresQueue
{
  pl_dispatch_once();
  int v2 = (void *)_processPhoneFailuresQueue_queue;
  return v2;
}

+ (BOOL)sharedStreamsExplictlyDisabledForPhotoLibraryURL:(id)a3
{
  int v4 = [MEMORY[0x1E4F8B980] isSystemPhotoLibraryURL:a3];
  if (v4)
  {
    LOBYTE(v4) = [a1 _sharedStreamsExplicitlyDisabled];
  }
  return v4;
}

+ (BOOL)debugAutoAcceptInvitation
{
  int v2 = __debugAutoAcceptInvitation;
  if (__debugAutoAcceptInvitation == -1)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    int v2 = CFPreferencesGetAppBooleanValue(@"AutoAcceptInvitation", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
    __debugAutoAcceptInvitation = v2;
  }
  return v2 == 1;
}

+ (BOOL)debugDownloadAllDerivatives
{
  int v2 = __debugDownloadAllDerivatives;
  if (__debugDownloadAllDerivatives == -1)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    int v2 = CFPreferencesGetAppBooleanValue(@"PSDownloadAllDerivatives", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
    __debugDownloadAllDerivatives = v2;
  }
  return v2 == 1;
}

+ (BOOL)debugDownloadMetadataOnly
{
  int v2 = __debugDownloadMetadataOnly;
  if (__debugDownloadMetadataOnly == -1)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    int v2 = CFPreferencesGetAppBooleanValue(@"PSDownloadMetadataOnly", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
    __debugDownloadMetadataOnly = v2;
  }
  return v2 == 1;
}

+ (BOOL)debugDownloadThumbnailsOnly
{
  int v2 = __debugDownloadThumbnailsOnly;
  if (__debugDownloadThumbnailsOnly == -1)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    int v2 = CFPreferencesGetAppBooleanValue(@"PSDownloadThumbnailsOnly", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat) != 0;
    __debugDownloadThumbnailsOnly = v2;
  }
  return v2 == 1;
}

+ (BOOL)debugAlwaysStreamSharedVideos
{
  int v2 = __debugAlwaysStreamSharedVideos;
  if (__debugAlwaysStreamSharedVideos == -1)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    if (CFPreferencesGetAppBooleanValue(@"PSAlwaysStreamSharedVideos", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat))
    {
      BOOL v3 = keyExistsAndHasValidFormat == 0;
    }
    else
    {
      BOOL v3 = 1;
    }
    int v2 = !v3;
    __debugAlwaysStreamSharedVideos = v2;
  }
  return v2 == 1;
}

+ (void)deleteDebugBreadcrumbsForAlbumGUID:(id)a3
{
  if (a3)
  {
    int v4 = (void *)MEMORY[0x1E4F28CB8];
    id v5 = a3;
    id v8 = [v4 defaultManager];
    uint64_t v6 = [a1 directoryPathForUploadActivityForAlbumGUID:v5 create:0];
    [v8 removeItemAtPath:v6 error:0];
    id v7 = [a1 directoryPathForDownloadActivityForAlbumGUID:v5 create:0];

    [v8 removeItemAtPath:v7 error:0];
  }
}

+ (void)writeDownloadDebugBreadcrumbForAsset:(id)a3 albumGUID:(id)a4 content:(id)a5 state:(int)a6 error:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ([a1 isBreadcrumbDebugEnabled])
  {
    if (v12)
    {
      if (v13)
      {
        int v16 = [a1 directoryPathForDownloadActivityForAlbumGUID:v13 create:1];
        int v17 = [a1 prefixForBreadcrumbState:v8];
        uint64_t v18 = v17;
        if ((int)v8 <= 220)
        {
          if ((int)v8 <= 209)
          {
            if (v8 != 200)
            {
              if (v8 == 205)
              {
                id v22 = a1;
                uint64_t v23 = 200;
                goto LABEL_33;
              }
              goto LABEL_27;
            }
LABEL_28:
            v44 = 0;
            v41 = 0;
            BOOL v24 = v15 != 0;
LABEL_39:
            v29 = [NSString stringWithFormat:@"%@ \n", v14];
            if (v24)
            {
              uint64_t v30 = [v18 stringByAppendingPathExtension:@"ERROR"];
              v31 = v18;
              uint64_t v18 = (void *)v30;

              v32 = [NSString stringWithFormat:@"CONTENT:%@ ERROR:%@ \n", v29, v15];

              if (objc_opt_respondsToSelector())
              {
                v33 = NSString;
                v34 = [v15 MSVerboseDescription];
                v29 = [v33 stringWithFormat:@"%@\n MSVerboseDescription:%@ \n", v32, v34];
              }
              else
              {
                v29 = v32;
              }
            }
            v42 = v18;
            v43 = v16;
            v35 = [v16 stringByAppendingPathComponent:v18];
            v36 = [v35 stringByAppendingPathExtension:v12];

            v37 = [v29 dataUsingEncoding:4];
            id v45 = 0;
            char v38 = [v37 writeToFile:v36 options:1073741825 error:&v45];
            id v39 = v45;
            if ((v38 & 1) == 0)
            {
              v40 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138413570;
                id v47 = v12;
                __int16 v48 = 2112;
                id v49 = v13;
                __int16 v50 = 1024;
                int v51 = v8;
                __int16 v52 = 2112;
                id v53 = v15;
                __int16 v54 = 2112;
                v55 = v36;
                __int16 v56 = 2112;
                id v57 = v39;
                _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "writeDownloadDebugBreadcrumbForAsset:%@ album:%@ step:%i error:%@ failed to write download breadcrumb at path %@ error %@", buf, 0x3Au);
              }
            }
            __int16 v20 = v43;
            goto LABEL_48;
          }
          if ((v8 - 210) >= 3)
          {
            if (v8 == 220)
            {
              id v22 = a1;
              uint64_t v23 = 210;
              goto LABEL_33;
            }
            goto LABEL_27;
          }
        }
        else
        {
          if ((int)v8 <= 289)
          {
            switch(v8)
            {
              case 0xDD:
                id v22 = a1;
                uint64_t v23 = 211;
                goto LABEL_33;
              case 0xE6:
                id v22 = a1;
                uint64_t v23 = 220;
                goto LABEL_33;
              case 0xE7:
                id v22 = a1;
                uint64_t v23 = 221;
                goto LABEL_33;
            }
            goto LABEL_27;
          }
          if ((int)v8 <= 291)
          {
            if (v8 != 290)
            {
              uint64_t v19 = [a1 prefixForBreadcrumbState:231];
              v44 = [a1 prefixForBreadcrumbState:290];
LABEL_34:
              BOOL v24 = v15 != 0;
              v41 = (void *)v19;
              if (!v15 && v19)
              {
                int v25 = [MEMORY[0x1E4F28CB8] defaultManager];
                uint64_t v26 = [v16 stringByAppendingPathComponent:v19];
                v27 = [v26 stringByAppendingPathExtension:v12];

                [v25 removeItemAtPath:v27 error:0];
                if (v44)
                {
                  v28 = -[NSObject stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:");

                  v27 = [v28 stringByAppendingPathExtension:v12];

                  [v25 removeItemAtPath:v27 error:0];
                }

                BOOL v24 = 0;
              }
              goto LABEL_39;
            }
            id v22 = a1;
            uint64_t v23 = 230;
LABEL_33:
            uint64_t v19 = [v22 prefixForBreadcrumbState:v23];
            v44 = 0;
            goto LABEL_34;
          }
          if (v8 != 292)
          {
            if (v8 != 300)
            {
LABEL_27:

              uint64_t v18 = 0;
              goto LABEL_28;
            }
            goto LABEL_28;
          }
        }
        id v22 = a1;
        uint64_t v23 = 205;
        goto LABEL_33;
      }
      __int16 v20 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v47 = v12;
        __int16 v48 = 2112;
        id v49 = 0;
        __int16 v50 = 1024;
        int v51 = v8;
        __int16 v52 = 2112;
        id v53 = v15;
        __int16 v21 = "writeDownloadDebugBreadcrumbForAsset:%@ album:%@ step:%i error:%@ does not have an album GUID to proceed";
        goto LABEL_13;
      }
    }
    else
    {
      __int16 v20 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        id v47 = 0;
        __int16 v48 = 2112;
        id v49 = v13;
        __int16 v50 = 1024;
        int v51 = v8;
        __int16 v52 = 2112;
        id v53 = v15;
        __int16 v21 = "writeDownloadDebugBreadcrumbForAsset:%@ album:%@ step:%i error:%@ does not have an asset GUID to proceed";
LABEL_13:
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, v21, buf, 0x26u);
      }
    }
LABEL_48:
  }
}

+ (void)writeUploadDebugBreadcrumbForAssetCollections:(id)a3 state:(int)a4 error:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v39 = a1;
  if ([a1 isBreadcrumbDebugEnabled])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v32 = v8;
    id obj = v8;
    uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
    if (!v38) {
      goto LABEL_35;
    }
    BOOL v34 = v9 != 0;
    uint64_t v37 = *(void *)v44;
    unsigned int v36 = v6;
    id v35 = v9;
    while (1)
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v12 = [v11 albumGUID];
        if (v12)
        {
          id v13 = [v39 directoryPathForUploadActivityForAlbumGUID:v12 create:1];
          v41 = [v11 GUID];
          id v14 = 0;
          if ((int)v6 > 119)
          {
            if (v6 == 120)
            {
              uint64_t v17 = 110;
              goto LABEL_19;
            }
            BOOL v15 = v34;
            uint64_t v16 = 0;
            if (v6 == 199)
            {
              uint64_t v17 = 120;
              goto LABEL_19;
            }
          }
          else
          {
            if (v6 == 100)
            {
              id v14 = [v39 prefixForBreadcrumbState:100];
              uint64_t v16 = 0;
              goto LABEL_22;
            }
            BOOL v15 = v34;
            uint64_t v16 = 0;
            if (v6 == 110)
            {
              uint64_t v17 = 100;
LABEL_19:
              uint64_t v16 = [v39 prefixForBreadcrumbState:v17];
              id v14 = [v39 prefixForBreadcrumbState:v6];
              if (!v9 && v16)
              {
                uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
                uint64_t v19 = [v13 stringByAppendingPathComponent:v16];
                __int16 v20 = [v19 stringByAppendingPathExtension:v41];

                [v18 removeItemAtPath:v20 error:0];
                BOOL v15 = 0;
                goto LABEL_23;
              }
LABEL_22:
              BOOL v15 = v34;
            }
          }
LABEL_23:
          v40 = (void *)v16;
          __int16 v21 = [NSString stringWithFormat:@"%@ \n", v11];
          if (v15)
          {
            id v22 = [v14 stringByAppendingPathExtension:@"ERROR"];

            uint64_t v23 = [NSString stringWithFormat:@"CONTENT:%@ ERROR:%@ \n", v21, v9];

            if (objc_opt_respondsToSelector())
            {
              BOOL v24 = NSString;
              int v25 = [v9 MSVerboseDescription];
              __int16 v21 = [v24 stringWithFormat:@"%@\n MSVerboseDescription:%@ \n", v23, v25];
            }
            else
            {
              __int16 v21 = v23;
            }
          }
          else
          {
            id v22 = v14;
          }
          uint64_t v26 = [v13 stringByAppendingPathComponent:v22];
          v27 = [v26 stringByAppendingPathExtension:v41];

          v28 = [v21 dataUsingEncoding:4];
          id v42 = 0;
          char v29 = [v28 writeToFile:v27 options:1073741825 error:&v42];
          id v30 = v42;
          if ((v29 & 1) == 0)
          {
            v31 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413314;
              __int16 v48 = v11;
              __int16 v49 = 1024;
              int v50 = v36;
              __int16 v51 = 2112;
              id v52 = v35;
              __int16 v53 = 2112;
              __int16 v54 = v27;
              __int16 v55 = 2112;
              id v56 = v30;
              _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "writeUploadDebugBreadcrumbForAssetCollection %@ step:%i error:%@ failed to write upload breadcrumb at path %@ error %@", buf, 0x30u);
            }
          }
          uint64_t v6 = v36;
          id v9 = v35;
          goto LABEL_33;
        }
        id v13 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          __int16 v48 = v11;
          __int16 v49 = 1024;
          int v50 = v6;
          __int16 v51 = 2112;
          id v52 = v9;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "writeUploadDebugBreadcrumbForAssetCollection %@ step:%i error:%@ does not have an album GUID to proceed", buf, 0x1Cu);
        }
LABEL_33:
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
      if (!v38)
      {
LABEL_35:

        id v8 = v32;
        break;
      }
    }
  }
}

+ (id)prefixForBreadcrumbState:(int)a3
{
  id v5 = 0;
  if (a3 > 219)
  {
    uint64_t v6 = @"complete_replaced_original";
    id v7 = @"deleted";
    if (a3 != 300) {
      id v7 = 0;
    }
    if (a3 != 292) {
      uint64_t v6 = v7;
    }
    id v8 = @"complete_thumbnail";
    id v9 = @"complete";
    if (a3 != 291) {
      id v9 = 0;
    }
    if (a3 != 290) {
      id v8 = v9;
    }
    if (a3 <= 291) {
      uint64_t v6 = v8;
    }
    id v10 = @"received_assetsd_thumbnail";
    v11 = @"received_assetsd";
    if (a3 != 231) {
      v11 = 0;
    }
    if (a3 != 230) {
      id v10 = v11;
    }
    if (a3 == 221) {
      id v5 = @"received";
    }
    if (a3 == 220) {
      id v5 = @"received_thumbnail";
    }
    if (a3 > 229) {
      id v5 = v10;
    }
    if (a3 > 289) {
      id v5 = v6;
    }
  }
  else if (a3 <= 198)
  {
    if (a3 == 120) {
      id v5 = @"submitted";
    }
    if (a3 == 110) {
      id v5 = @"requested";
    }
    if (a3 == 100) {
      id v5 = @"enqueued";
    }
  }
  else
  {
    switch(a3)
    {
      case 199:
        id v5 = @"complete";
        break;
      case 200:
        id v5 = @"metadata";
        break;
      case 205:
        id v5 = @"metadata_assetsd";
        break;
      case 210:
        id v5 = @"requested_thumbnail";
        break;
      case 211:
        id v5 = @"requested";
        break;
      case 212:
        id v5 = @"requested_video_posterframe";
        break;
      default:
        return (id)[NSString stringWithFormat:@"%i_%@", *(void *)&a3, v5, v3, v4];
    }
  }
  return (id)[NSString stringWithFormat:@"%i_%@", *(void *)&a3, v5, v3, v4];
}

+ (void)writeAlbumNameBreadCrumb:(id)a3 forAlbumGUID:(id)a4 isUpload:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  if ([a1 isBreadcrumbDebugEnabled])
  {
    if (v5) {
      [a1 directoryPathForUploadActivityForAlbumGUID:v8 create:1];
    }
    else {
    id v9 = [a1 directoryPathForDownloadActivityForAlbumGUID:v8 create:1];
    }
    id v10 = [NSString stringWithFormat:@"\"albumName %@\"", v13];
    v11 = [v9 stringByAppendingPathComponent:v10];
    id v12 = [v13 dataUsingEncoding:4];
    [v12 writeToFile:v11 options:1073741825 error:0];
  }
}

+ (id)directoryPathForDownloadActivityForAlbumGUID:(id)a3 create:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v5 = a3;
    pl_dispatch_once();
    uint64_t v6 = [(id)directoryPathForDownloadActivityForAlbumGUID_create__activityPath stringByAppendingPathComponent:v5];

    if (v4)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

void __76__PLPhotoSharingHelper_directoryPathForDownloadActivityForAlbumGUID_create___block_invoke()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v4 = [v0 photoDirectoryWithType:22 additionalPathComponents:@"DEBUG"];

  uint64_t v1 = [v4 stringByAppendingPathComponent:@"Downloads"];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)directoryPathForDownloadActivityForAlbumGUID_create__activityPath;
  directoryPathForDownloadActivityForAlbumGUID_create__activityPath = v2;
}

+ (id)directoryPathForUploadActivityForAlbumGUID:(id)a3 create:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v5 = a3;
    pl_dispatch_once();
    uint64_t v6 = [(id)directoryPathForUploadActivityForAlbumGUID_create__activityPath stringByAppendingPathComponent:v5];

    if (v4)
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

void __74__PLPhotoSharingHelper_directoryPathForUploadActivityForAlbumGUID_create___block_invoke()
{
  dispatch_queue_t v0 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v4 = [v0 photoDirectoryWithType:22 additionalPathComponents:@"DEBUG"];

  uint64_t v1 = [v4 stringByAppendingPathComponent:@"Uploads"];
  uint64_t v2 = [v1 copy];
  uint64_t v3 = (void *)directoryPathForUploadActivityForAlbumGUID_create__activityPath;
  directoryPathForUploadActivityForAlbumGUID_create__activityPath = v2;
}

+ (BOOL)isBreadcrumbDebugEnabled
{
  int AppIntegerValue = __isSharingBreadcrumbDebuggingEnabled;
  if (__isSharingBreadcrumbDebuggingEnabled == -1)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"PSDebugLevel", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    __isSharingBreadcrumbDebuggingEnabled = AppIntegerValue;
  }
  return AppIntegerValue != 0;
}

+ (unint64_t)purgeSpace:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
  id v5 = [v4 assetsdClient];
  uint64_t v6 = [v5 cloudInternalClient];

  uint64_t v10 = 0;
  unint64_t v7 = [v6 cloudSharingSpaceManagementRequestWithType:1 optionalBytesToPurge:a3 error:&v10];
  if (v10)
  {
    id v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v12 = a3;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Error purging space with spaceNeeded %lld", buf, 0xCu);
    }
  }
  return v7;
}

+ (unint64_t)purgeableSpace
{
  uint64_t v2 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
  uint64_t v3 = [v2 assetsdClient];
  id v4 = [v3 cloudInternalClient];

  uint64_t v9 = 0;
  unint64_t v5 = [v4 cloudSharingSpaceManagementRequestWithType:0 optionalBytesToPurge:0 error:&v9];
  if (v9)
  {
    uint64_t v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Error getting purgeable space", v8, 2u);
    }
  }
  return v5;
}

+ (void)_markStreamVideosAsPurgeable
{
  v38[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 streamdVideoCache];
  uint64_t v3 = [v2 URL];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = *MEMORY[0x1E4F1C6E8];
    uint64_t v6 = *MEMORY[0x1E4F1C530];
    v38[0] = *MEMORY[0x1E4F1C6E8];
    v38[1] = v6;
    uint64_t v30 = v6;
    uint64_t v7 = *MEMORY[0x1E4F1C670];
    v38[2] = *MEMORY[0x1E4F1C670];
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:3];
    v28 = v4;
    char v29 = v3;
    uint64_t v9 = [v4 enumeratorAtURL:v3 includingPropertiesForKeys:v8 options:5 errorHandler:&__block_literal_global_753];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v32 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v32) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v14 = [v13 resourceValuesForKeys:v8 error:0];
          BOOL v15 = [v14 objectForKeyedSubscript:v5];
          int v16 = [v15 hasPrefix:@"CachedMedia-"];

          if (v16)
          {
            uint64_t v17 = [v14 objectForKeyedSubscript:v7];
            int v18 = [v17 BOOLValue];

            if (v18)
            {
              v31 = [v14 objectForKeyedSubscript:v30];
              uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
              [v19 timeIntervalSinceDate:v31];
              uint64_t v20 = v11;
              __int16 v21 = v9;
              id v22 = v8;
              uint64_t v23 = v5;
              uint64_t v24 = v7;
              BOOL v26 = v25 < 604800.0;

              uint64_t v27 = 2 * v26;
              uint64_t v7 = v24;
              uint64_t v5 = v23;
              id v8 = v22;
              uint64_t v9 = v21;
              uint64_t v11 = v20;
              +[PLCacheDeleteSupport markPurgeableForFileAtURL:v13 withUrgency:v27 outInode:0];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v11);
    }

    uint64_t v3 = v29;
  }
}

uint64_t __52__PLPhotoSharingHelper__markStreamVideosAsPurgeable__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to enumerate %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return 1;
}

+ (BOOL)processExportedFileURL:(id)a3 assetUUID:(id)a4 customExportsInfo:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    __int16 v10 = +[PLPhotoSharingHelper _customSharedAlbumExportsOutputDirectoryForAssetWithUUID:v8];
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    int v12 = [v11 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v21];
    uint64_t v13 = v21;
    if (v12)
    {
      id v14 = [v7 lastPathComponent];
      BOOL v15 = [v10 URLByAppendingPathComponent:v14];

      id v20 = 0;
      int v16 = [v11 copyItemAtURL:v7 toURL:v15 error:&v20];
      id v17 = v20;
      if (v16)
      {
        int v18 = [v15 absoluteString];
        [v9 setObject:v18 forKeyedSubscript:v8];
      }
      else
      {
        int v18 = PLSharingGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v23 = (uint64_t)v7;
          __int16 v24 = 2112;
          double v25 = v15;
          __int16 v26 = 2112;
          id v27 = v17;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Could not copy file from exported source: %@ to temporary location: %@, error: %@", buf, 0x20u);
        }
      }
    }
    else
    {
      BOOL v15 = PLSharingGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = (uint64_t)v7;
        __int16 v24 = 2112;
        double v25 = v13;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Could not create a directory for copying the exported source: %@. Error: %@", buf, 0x16u);
      }
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    __int16 v10 = PLSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = objc_opt_class();
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Skipping exported item of unexpected class: %{public}@", buf, 0xCu);
    }
    LOBYTE(v16) = 0;
  }

  return v16;
}

+ (id)_customSharedAlbumExportsOutputDirectoryForAssetWithUUID:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _customSharedAlbumsExportsOutputDirectoryParent];
  id v5 = [v4 URLByAppendingPathComponent:v3];

  return v5;
}

+ (id)_customSharedAlbumsExportsOutputDirectoryParent
{
  uint64_t v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"TemporaryItems"];

  id v4 = [MEMORY[0x1E4F29128] UUID];
  id v5 = [v4 UUIDString];

  uint64_t v6 = [NSString stringWithFormat:@"com.apple.photos.cloud-shared-custom-exports-%d-%@", getpid(), v5];
  id v7 = [v3 stringByAppendingPathComponent:v6];

  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:1];

  return v8;
}

+ (void)pruneCloudSharingContentIfNecessaryInLibrary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"PLPhotoSharingHelper.m" lineNumber:3071 description:@"Method can only be run in assetsd"];
  }
  uint64_t v6 = [v5 pathManager];
  id v7 = [v6 photoDirectoryWithType:22];

  if ([MEMORY[0x1E4F8B8D8] freeSpaceBelowDesiredSpaceThresholdForPath:v7])
  {
    id v8 = +[PLPhotoSharingHelper sharingPersonID];
    if (v8)
    {
      id v9 = [v5 pathManager];
      __int16 v10 = [v9 libraryURL];
      BOOL v11 = +[PLPhotoSharingHelper sharedStreamsEnabledForPhotoLibraryURL:v10];

      if (v11)
      {
        int v12 = PLBackendGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v20 = v8;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "About to call connection refreshResetSync:NO personID:%@ in nightly maintenance task", buf, 0xCu);
        }

        uint64_t v13 = [MEMORY[0x1E4F77A58] sharedConnection];
        [v13 refreshResetSync:0 personID:v8];

        id v14 = PLBackendGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Purging non-recently viewed cloud sharing assets", buf, 2u);
        }

        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __69__PLPhotoSharingHelper_pruneCloudSharingContentIfNecessaryInLibrary___block_invoke;
        v17[3] = &unk_1E5875CE0;
        id v18 = v5;
        [v18 performTransactionAndWait:v17];
        BOOL v15 = PLBackendGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Completed purging non-recently viewed cloud sharing assets", buf, 2u);
        }
      }
    }
  }
  [a1 _markStreamVideosAsPurgeable];
}

unint64_t __69__PLPhotoSharingHelper_pruneCloudSharingContentIfNecessaryInLibrary___block_invoke(uint64_t a1)
{
  return +[PLDiskSpaceManagement performCloudSharingSpaceManagementWithBytesToPurge:-1 shouldFreeSpace:1 shouldKeepRecentlyViewedAssets:1 fromPhotoLibrary:*(void *)(a1 + 32)];
}

uint64_t __66__PLPhotoSharingHelper_applicationIsInForeground_photoLibraryURL___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "about to call connection setIsUIForeground:%@ personID:%@", (uint8_t *)&v7, 0x16u);
  }

  id v5 = [MEMORY[0x1E4F77A58] sharedConnection];
  [v5 setIsUIForeground:*(unsigned __int8 *)(a1 + 48) forPersonID:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 40) stillAlive];
}

+ (double)intervalBetweenRelationshipPolls
{
  return 3600.0;
}

+ (double)intervalBetweenAlbumPolls
{
  return 3600.0;
}

+ (double)intervalBetweenPolls
{
  return 86400.0;
}

+ (void)downloadAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6
{
  uint64_t v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:a1 file:@"PLPhotoSharingHelper.m" lineNumber:2962 description:@"downloadAsset: can only run from within assets"];
  }
  uint64_t v10 = [a1 sharingPersonID];
  uint64_t v11 = [v9 cloudAssetGUID];
  int v12 = [v9 cloudShareAlbum];
  uint64_t v13 = [v12 cloudGUID];

  if (!v10)
  {
    int v16 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    id v32 = v9;
    id v17 = "No Apple Account, skip downloading cloud shared asset %@";
LABEL_15:
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
    goto LABEL_16;
  }
  if (([v9 isCloudSharedAsset] & 1) == 0)
  {
    int v16 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    id v32 = v9;
    id v17 = "Asset %@ is not a cloud shared asset, skip downloading from cloud";
    goto LABEL_15;
  }
  if (!v11)
  {
    int v16 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_DWORD *)buf = 138412290;
    id v32 = v9;
    id v17 = "Unable to find a cloudAssetGUID for %@, skip downloading from cloud";
    goto LABEL_15;
  }
  if (v13)
  {
    if ([a1 _derivativeExistsForAsset:v9 cloudPlaceholderKind:v6])
    {
      id v14 = [v9 uuid];
      BOOL v15 = [a1 downloadNotificationForAssetwithUUID:v14 cloudPlaceholderKind:v6];

      int v16 = v15;
      notify_post((const char *)[v16 UTF8String]);
LABEL_16:

      goto LABEL_17;
    }
    int v20 = [a1 _recentlyRequestedDownloadAsset:v9 cloudPlaceholderKind:v6];
    uint64_t v21 = PLPhotoSharingGetLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (!v20)
    {
      if (v22)
      {
        uint64_t v23 = objc_opt_class();
        id v27 = v23;
        *(_DWORD *)buf = 138413058;
        id v32 = v23;
        __int16 v33 = 2112;
        id v34 = v11;
        __int16 v35 = 1024;
        int v36 = [v9 cloudPlaceholderKind];
        __int16 v37 = 1024;
        int v38 = v6;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "%@ downloadAsset:%@ current placeHolderKind %i request placeHolderkind %d", buf, 0x22u);
      }
      __int16 v24 = [a1 _transactionWithName:"+[PLPhotoSharingHelper downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:]"];
      double v25 = [a1 _downloadRequestQueue];
      id v28 = v11;
      id v29 = v10;
      id v30 = v13;
      int v16 = v24;
      pl_dispatch_async();

      goto LABEL_16;
    }
    if (v22)
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v9;
      __int16 v33 = 1024;
      LODWORD(v34) = v6;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "asset %@ with cloudPlaceholderkind %d has been recently requsted to be downloaded, skip duplicate request.", buf, 0x12u);
    }
  }
  else
  {
    id v18 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v32 = (id)objc_opt_class();
      __int16 v33 = 2112;
      id v34 = v9;
      id v19 = v32;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "%@ unable to find albumGUID for cloudSharedAsset %@", buf, 0x16u);
    }
  }
LABEL_17:
}

void __94__PLPhotoSharingHelper_downloadAsset_cloudPlaceholderKind_shouldPrioritize_shouldExtendTimer___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F77A58] sharedConnection];
  if (*(unsigned char *)(a1 + 74))
  {
    uint64_t v3 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "prioritize downloadAsset:%@", buf, 0xCu);
    }

    [v2 setFocusAssetCollectionGUID:*(void *)(a1 + 32) forPersonID:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 75)) {
    [v2 setIsUIForeground:1 forPersonID:*(void *)(a1 + 40)];
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__PLPhotoSharingHelper_downloadAsset_cloudPlaceholderKind_shouldPrioritize_shouldExtendTimer___block_invoke_740;
  v10[3] = &unk_1E586E888;
  __int16 v17 = *(_WORD *)(a1 + 72);
  id v11 = v2;
  id v12 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  id v13 = v7;
  uint64_t v16 = v8;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 56);
  id v9 = v2;
  [v9 assetCollectionWithGUID:v5 personID:v6 completionBlock:v10];
}

void __94__PLPhotoSharingHelper_downloadAsset_cloudPlaceholderKind_shouldPrioritize_shouldExtendTimer___block_invoke_740(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v5 = objc_msgSend(v3, "assets", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
LABEL_4:
      uint64_t v9 = 0;
      while (2)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
        switch([v10 mediaAssetType])
        {
          case 2:
            if (*(_WORD *)(a1 + 80) == 3) {
              goto LABEL_15;
            }
            goto LABEL_16;
          case 3:
            if (*(_WORD *)(a1 + 80) != 4) {
              goto LABEL_16;
            }
            goto LABEL_15;
          case 5:
            if (*(_WORD *)(a1 + 80) != 7) {
              goto LABEL_16;
            }
            goto LABEL_15;
          case 7:
            if ((*(_WORD *)(a1 + 80) & 0xFFFE) != 8) {
              goto LABEL_16;
            }
LABEL_15:
            id v11 = v10;
            if (v11)
            {
              id v12 = v11;

              uint64_t v21 = *(void **)(a1 + 32);
              __int16 v33 = v12;
              BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
              [v21 retrieveAssets:v22 inAlbumWithGUID:*(void *)(a1 + 40) personID:*(void *)(a1 + 48)];

              goto LABEL_24;
            }
LABEL_16:
            if (v7 != ++v9) {
              continue;
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v34 count:16];
            if (!v7) {
              goto LABEL_18;
            }
            goto LABEL_4;
          default:
            goto LABEL_16;
        }
      }
    }
LABEL_18:

    id v12 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = objc_opt_class();
      int v14 = *(__int16 *)(a1 + 80);
      *(_DWORD *)buf = 138412802;
      id v28 = v13;
      __int16 v29 = 2112;
      id v30 = v4;
      __int16 v31 = 1024;
      int v32 = v14;
      id v15 = v13;
      uint64_t v16 = "%@ unable to find an asset in assetCollection %@ matching cloudPlaceholderKind %d";
      __int16 v17 = v12;
      uint32_t v18 = 28;
LABEL_22:
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, v16, buf, v18);
    }
  }
  else
  {
    id v12 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      id v28 = v19;
      __int16 v29 = 2112;
      id v30 = v20;
      id v15 = v19;
      uint64_t v16 = "%@ unable to find assetCollection with GUID %@, skipping downloading";
      __int16 v17 = v12;
      uint32_t v18 = 22;
      goto LABEL_22;
    }
  }
LABEL_24:

  [*(id *)(a1 + 64) stillAlive];
}

+ (id)downloadNotificationForAssetwithUUID:(id)a3 cloudPlaceholderKind:(signed __int16)a4
{
  return (id)[NSString stringWithFormat:@"com.apple.assetsd.cloudsharedassetdownloaddone.%@.%d", a3, a4];
}

+ (BOOL)_derivativeExistsForAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 cloudSharedAssetPathForPlaceholderKind:v4];
  uint64_t v7 = (void *)v6;
  if (v4 == 3)
  {
    char v8 = [v5 hasMasterThumb];
  }
  else if (v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v8 = [v9 fileExistsAtPath:v7];
  }
  else
  {
    uint64_t v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109378;
      v12[1] = v4;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unsupported cloudPlaceholderKind %d to download for cloudSharedAsset %@", (uint8_t *)v12, 0x12u);
    }

    char v8 = 0;
  }

  return v8;
}

+ (id)_downloadRequestQueue
{
  pl_dispatch_once();
  uint64_t v2 = (void *)_downloadRequestQueue_queue;
  return v2;
}

void __45__PLPhotoSharingHelper__downloadRequestQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.MobileSlideShow.PLPhotoSharingHelperDownloadRequestQueue", 0);
  uint64_t v1 = (void *)_downloadRequestQueue_queue;
  _downloadRequestQueue_queue = (uint64_t)v0;
}

+ (BOOL)_recentlyRequestedDownloadAsset:(id)a3 cloudPlaceholderKind:(signed __int16)a4
{
  int v4 = a4;
  id v5 = a3;
  pl_dispatch_once();
  uint64_t v6 = NSString;
  uint64_t v7 = [v5 cloudAssetGUID];

  char v8 = [v6 stringWithFormat:@"%@.%d", v7, v4];

  char v9 = [(id)_recentlyRequestedDownloadAsset_cloudPlaceholderKind__recentlyRequestedIdentifiers containsObject:v8];
  if ((v9 & 1) == 0) {
    [(id)_recentlyRequestedDownloadAsset_cloudPlaceholderKind__recentlyRequestedIdentifiers addObject:v8];
  }

  return v9;
}

void __77__PLPhotoSharingHelper__recentlyRequestedDownloadAsset_cloudPlaceholderKind___block_invoke()
{
  dispatch_queue_t v0 = [[_PLExpirableSet alloc] initWithSecondsToExpire:6.0];
  uint64_t v1 = (void *)_recentlyRequestedDownloadAsset_cloudPlaceholderKind__recentlyRequestedIdentifiers;
  _recentlyRequestedDownloadAsset_cloudPlaceholderKind__recentlyRequestedIdentifiers = (uint64_t)v0;
}

+ (void)prioritizeDownloadsForAlbumGUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 sharingPersonID];
  if (v5)
  {
    uint64_t v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2112;
      id v17 = v4;
      id v7 = v15;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "%@ prioritizeDownloadsForAlbumGUID:%@", buf, 0x16u);
    }
    char v8 = [a1 _transactionWithName:"+[PLPhotoSharingHelper prioritizeDownloadsForAlbumGUID:]"];
    char v9 = dispatch_get_global_queue(0, 0);
    id v11 = v4;
    id v12 = v5;
    __int16 v13 = v8;
    id v10 = v8;
    pl_dispatch_async();
  }
}

void __56__PLPhotoSharingHelper_prioritizeDownloadsForAlbumGUID___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F77A58] sharedConnection];
  id v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "about to call connection setFocusAlbum:%@ personID:%@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [MEMORY[0x1E4F5C360] album];
  [v6 setGUID:*(void *)(a1 + 32)];
  [v2 setFocusAlbum:v6 forPersonID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) stillAlive];
}

+ (void)checkServerModelForAlbum:(id)a3 photoLibrary:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 sharingPersonID];
  if (v8)
  {
    __int16 v9 = [v6 cloudGUID];
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:@"/tmp/_pollStreams.plist"];
    if (!v10)
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v11 = [v10 objectForKey:v9];
    if (!v11
      || ([MEMORY[0x1E4F1C9C8] date],
          id v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v11 compare:v12],
          v12,
          v13 == -1))
    {
      id v15 = (void *)MEMORY[0x1E4F1C9C8];
      [a1 intervalBetweenAlbumPolls];
      id v14 = objc_msgSend(v15, "dateWithTimeIntervalSinceNow:");

      if (v14)
      {
        [v10 setObject:v14 forKey:v9];
        __int16 v16 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v10 format:100 options:0 error:0];
        int v17 = [v16 writeToFile:@"/tmp/_pollStreams.plist" options:1073741825 error:0];
        uint64_t v18 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v28 = v10;
          __int16 v29 = 2112;
          id v30 = @"/tmp/_pollStreams.plist";
          __int16 v31 = 1024;
          int v32 = v17;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, " saved pollStreamsDate %@ to path %@ success %d", buf, 0x1Cu);
        }
      }
      uint64_t v19 = [a1 _transactionWithName:"+[PLPhotoSharingHelper checkServerModelForAlbum:photoLibrary:]"];
      uint64_t v20 = dispatch_get_global_queue(0, 0);
      id v22 = v9;
      id v23 = v8;
      id v24 = v7;
      id v25 = v6;
      long long v26 = v19;
      id v21 = v19;
      pl_dispatch_async();
    }
    else
    {
      id v14 = v11;
    }
  }
}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F77A58] sharedConnection];
  id v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = a1[4];
    id v5 = a1[5];
    *(_DWORD *)buf = 138412546;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "about to call connection assetCollectionGUIDsInAlbumWithGUID:%@ personID:%@", buf, 0x16u);
  }

  id v6 = a1[4];
  id v7 = a1[5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_717;
  v9[3] = &unk_1E586E810;
  id v10 = a1[6];
  id v11 = a1[7];
  id v12 = v2;
  id v13 = a1[5];
  id v14 = a1[4];
  id v15 = a1[8];
  id v8 = v2;
  [v8 assetCollectionGUIDsInAlbumWithGUID:v6 personID:v7 completionBlock:v9];
}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_717(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_2;
  v6[3] = &unk_1E586E860;
  id v7 = v3;
  id v4 = a1[4];
  id v8 = a1[5];
  id v9 = a1[4];
  id v10 = a1[6];
  id v11 = a1[7];
  id v12 = a1[8];
  id v13 = a1[9];
  id v5 = v3;
  [v4 performBlock:v6];
}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if (v2 != [*(id *)(a1 + 40) assetsCount])
  {
    id v3 = [*(id *)(a1 + 40) assets];
    id v4 = [v3 valueForKey:@"cloudAssetGUID"];

    id v5 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 32)];
    uint64_t v20 = v4;
    id v6 = [v4 set];
    [v5 minusSet:v6];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * v10);
          id v12 = [MEMORY[0x1E4F5C360] album];
          id v13 = [*(id *)(a1 + 40) cloudGUID];
          [v12 setGUID:v13];

          id v14 = [*(id *)(a1 + 48) libraryServicesManager];
          __int16 v16 = *(void **)(a1 + 56);
          id v15 = *(void **)(a1 + 64);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_3;
          v22[3] = &unk_1E586E838;
          id v23 = v12;
          id v17 = v15;
          id v24 = v17;
          id v25 = v14;
          id v26 = *(id *)(a1 + 56);
          uint64_t v27 = v11;
          id v28 = *(id *)(a1 + 72);
          id v29 = *(id *)(a1 + 80);
          id v18 = v14;
          id v19 = v12;
          [v16 assetCollectionWithGUID:v11 personID:v17 completionBlock:v22];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v8);
    }
  }
}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObject:a2];
  +[PLCloudSharedAssetSaveJob assetsdProcessMetadataForAssetCollections:v3 inAlbum:*(void *)(a1 + 32) personID:*(void *)(a1 + 40) info:0 libraryServicesManager:*(void *)(a1 + 48)];

  id v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_4;
  v10[3] = &unk_1E586E810;
  id v11 = v4;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 72);
  id v12 = v7;
  uint64_t v13 = v8;
  id v14 = v9;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 80);
  [v11 commentGUIDsForAssetCollectionWithGUID:v5 personID:v6 completionBlock:v10];
}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * v6);
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        _DWORD v12[2] = __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_5;
        v12[3] = &unk_1E586E7E8;
        uint64_t v10 = *(void **)(a1 + 56);
        v12[4] = *(void *)(a1 + 48);
        id v13 = v10;
        id v14 = *(id *)(a1 + 64);
        [v8 commentWithGUID:v7 personID:v9 completionBlock:v12];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  [*(id *)(a1 + 72) stillAlive];
}

void __62__PLPhotoSharingHelper_checkServerModelForAlbum_photoLibrary___block_invoke_5(void *a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObject:a2];
  +[PLCloudSharedCommentsJob assetsdLocallyProcessAddedComments:v3 assetGUID:a1[4] albumGUID:a1[5] info:0 libraryServicesManager:a1[6]];
}

+ (void)checkServerModelRelationshipsForPhotoLibrary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  uint64_t v4 = [a1 sharingPersonID];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:@"/tmp/_pollRelationships.plist"];
    if (!v5)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    uint64_t v6 = [v5 objectForKey:@"pollRelationshipsNextDate"];
    if (!v6
      || ([MEMORY[0x1E4F1C9C8] date],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v6 compare:v7],
          v7,
          v8 == -1))
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1C9C8];
      [a1 intervalBetweenRelationshipPolls];
      uint64_t v10 = objc_msgSend(v9, "dateWithTimeIntervalSinceNow:");

      if (v10)
      {
        [v5 setObject:v10 forKey:@"pollRelationshipsNextDate"];
        id v11 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:0];
        int v12 = [v11 writeToFile:@"/tmp/_pollRelationships.plist" options:1073741825 error:0];
        id v13 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v39 = v5;
          __int16 v40 = 2112;
          v41 = @"/tmp/_pollRelationships.plist";
          __int16 v42 = 1024;
          int v43 = v12;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, " saved pollRelationshipsDate %@ to path %@ success %d", buf, 0x1Cu);
        }
      }
      id v14 = objc_msgSend(MEMORY[0x1E4F77A58], "sharedConnection", v10, v5);
      +[PLCloudSharedAlbum allCloudSharedAlbumsInLibrary:v28];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            uint64_t v20 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              id v21 = [v19 cloudGUID];
              *(_DWORD *)buf = 138412546;
              uint64_t v39 = v21;
              __int16 v40 = 2112;
              v41 = v4;
              _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "about to call connection accessControlGUIDsForAlbumWithGUID:%@ personID:%@", buf, 0x16u);
            }
            id v22 = [v19 cloudGUID];
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __69__PLPhotoSharingHelper_checkServerModelRelationshipsForPhotoLibrary___block_invoke;
            v29[3] = &unk_1E586E7C0;
            id v23 = v14;
            id v30 = v23;
            id v24 = v4;
            long long v31 = v24;
            id v32 = v28;
            [v23 accessControlGUIDsForAlbumWithGUID:v22 personID:v24 completionBlock:v29];
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v16);
      }

      uint64_t v6 = v25;
      uint64_t v5 = v26;
    }
  }
}

void __69__PLPhotoSharingHelper_checkServerModelRelationshipsForPhotoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = *(void **)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __69__PLPhotoSharingHelper_checkServerModelRelationshipsForPhotoLibrary___block_invoke_2;
        v11[3] = &unk_1E586E798;
        id v12 = *(id *)(a1 + 48);
        [v8 accessControlWithGUID:v7 personID:v9 completionBlock:v11];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __69__PLPhotoSharingHelper_checkServerModelRelationshipsForPhotoLibrary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 personInfoManager];
  uint64_t v6 = [v4 emails];
  uint64_t v7 = [v4 phones];
  uint64_t v8 = [v4 GUID];
  [v5 setEmails:v6 phones:v7 forInvitationRecordGUID:v8];

  id v14 = [*(id *)(a1 + 32) personInfoManager];
  uint64_t v9 = [v4 firstName];
  uint64_t v10 = [v4 lastName];
  id v11 = [v4 fullName];
  id v12 = [v4 email];
  long long v13 = [v4 personID];

  [v14 setFirstName:v9 lastName:v10 fullName:v11 email:v12 forPersonID:v13];
}

+ (void)markCommentsForAssetCollectionWithGUID:(id)a3 asViewedWithLastViewedDate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412802;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    id v9 = v14;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "%@ markCommentsForAssetCollectionWithGUID:%@ asViewedWithLastViewedDate:%@", (uint8_t *)&v13, 0x20u);
  }
  if (v6)
  {
    uint64_t v10 = [a1 sharingPersonID];
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F77A58] sharedConnection];
      id v12 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412802;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v7;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "about to call connection markCommentsForAssetCollectionWithGUID:%@ asViewedWithLastViewedDate:%@ personID:%@", (uint8_t *)&v13, 0x20u);
      }

      [v11 markCommentsForAssetCollectionWithGUID:v6 asViewedWithLastViewedDate:v7 personID:v10];
    }
  }
}

+ (void)markAlbumGUIDAsViewed:(id)a3 clearUnseenAssetsCount:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = @"NO";
    int v15 = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    if (v4) {
      id v9 = @"YES";
    }
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    id v10 = v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "%@ markAlbumGUIDAsViewed:%@ clearUnseenAssetsCount:%@", (uint8_t *)&v15, 0x20u);
  }
  if (v6)
  {
    id v11 = [a1 sharingPersonID];
    if (v11)
    {
      id v12 = [MEMORY[0x1E4F77A58] sharedConnection];
      int v13 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = @"NO";
        int v15 = 138412802;
        id v16 = v6;
        __int16 v17 = 2112;
        if (v4) {
          id v14 = @"YES";
        }
        id v18 = v11;
        __int16 v19 = 2112;
        uint64_t v20 = v14;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "about to call connection markAlbumGUIDAsViewed:%@ personID:%@ moveLastViewedAssetCollectionMarker:%@ info:nil", (uint8_t *)&v15, 0x20u);
      }

      [v12 markAlbumGUIDAsViewed:v6 personID:v11 moveLastViewedAssetCollectionMarker:v4 info:0];
    }
  }
}

+ (CGSize)derivedAssetSizeForMasterSizeWidth:(double)a3 height:(double)a4 derivativeType:(int)a5 withSpecificationInfo:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = [a6 objectForKey:*MEMORY[0x1E4F5C6A8]];
  id v10 = v9;
  if (v9)
  {
    [v9 doubleValue];
    double v12 = ceil(v11 * a3);
    [v10 doubleValue];
    double v14 = ceil(v13 * a4);
    int v15 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      [v10 floatValue];
      int v21 = 134219008;
      double v22 = a3;
      __int16 v23 = 2048;
      double v24 = a4;
      __int16 v25 = 2048;
      double v26 = v16;
      __int16 v27 = 2048;
      double v28 = v12;
      __int16 v29 = 2048;
      double v30 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "derivedAssetSizeForMasterSize %f,%f scaling with factor %f to return %f,%f", (uint8_t *)&v21, 0x34u);
    }
  }
  else
  {
    float v19 = a3 / a4;
    +[PLPhotoSharingHelper derivedAssetSmallDimensionLimitForType:v6];
    if (a3 >= a4)
    {
      double v14 = a4;
      double v12 = a3;
      if (v20 < a4)
      {
        double v12 = rint(v20 * v19);
        double v14 = v20;
      }
    }
    else
    {
      double v14 = a4;
      double v12 = a3;
      if (v20 < a3)
      {
        double v14 = rint(v20 / v19);
        double v12 = v20;
      }
    }
  }

  double v17 = v12;
  double v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

+ (id)temporaryLargeVideoDerivativePathForCollectionGUID:(id)a3
{
  return (id)[a1 temporaryUploadDerivativesPathForCollectionGUID:a3 pathExtension:@"largevideo"];
}

+ (id)temporarySmallVideoDerivativePathForCollectionGUID:(id)a3
{
  return (id)[a1 temporaryUploadDerivativesPathForCollectionGUID:a3 pathExtension:@"smallvideo"];
}

+ (id)temporaryVideoPosterFramePathForCollectionGUID:(id)a3
{
  return (id)[a1 temporaryUploadDerivativesPathForCollectionGUID:a3 pathExtension:@"posterFrame.JPG"];
}

+ (id)temporaryVideoPathForCollectionGUID:(id)a3
{
  return (id)[a1 temporaryUploadDerivativesPathForCollectionGUID:a3 pathExtension:@"derivative.MOV"];
}

+ (id)temporaryThumbnailPathForCollectionGUID:(id)a3
{
  return (id)[a1 temporaryUploadDerivativesPathForCollectionGUID:a3 pathExtension:@"thumbnail.JPG"];
}

+ (id)temporaryDerivativePathForCollectionGUID:(id)a3 uti:(id)a4
{
  id v6 = a3;
  id v7 = @"derivative.JPG";
  if (a4)
  {
    uint64_t v8 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a4];
    if ([v8 isEqual:*MEMORY[0x1E4F443D0]]) {
      id v7 = @"derivative.GIF";
    }
  }
  id v9 = [a1 temporaryUploadDerivativesPathForCollectionGUID:v6 pathExtension:v7];

  return v9;
}

+ (id)temporaryUploadDerivativesPathForCollectionGUID:(id)a3 pathExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (temporaryUploadDerivativesPathForCollectionGUID_pathExtension__onceToken != -1) {
    dispatch_once(&temporaryUploadDerivativesPathForCollectionGUID_pathExtension__onceToken, &__block_literal_global_689);
  }
  id v7 = 0;
  if (v5 && temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath)
  {
    uint64_t v8 = [(id)temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath stringByAppendingPathComponent:v5];
    id v7 = [v8 stringByAppendingPathExtension:v6];
  }
  return v7;
}

void __86__PLPhotoSharingHelper_temporaryUploadDerivativesPathForCollectionGUID_pathExtension___block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  uint64_t v1 = [v0 photoDirectoryWithType:22 additionalPathComponents:@"derivatives"];
  uint64_t v2 = (void *)temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath;
  temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath = v1;

  uint64_t v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath isDirectory:1];
  id v13 = 0;
  char v4 = [v3 getResourceValue:&v13 forKey:*MEMORY[0x1E4F1C5C0] error:0];
  id v5 = v13;
  if ((v4 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = 0;
    char v7 = [v6 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v12];
    id v8 = v12;

    if ((v7 & 1) == 0)
    {
      id v9 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v3 path];
        *(_DWORD *)buf = 138412546;
        int v15 = v10;
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);
      }
      double v11 = (void *)temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath;
      temporaryUploadDerivativesPathForCollectionGUID_pathExtension__temporaryUploadDerivativesPath = 0;
    }
  }
}

+ (double)derivedAssetSmallDimensionLimitForType:(int)a3
{
  double result = 1536.0;
  if (a3 == 1) {
    return 256.0;
  }
  return result;
}

+ (id)derivativesForMasterAsset:(id)a3 withSpecifications:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [MEMORY[0x1E4F1CA48] array];
  if (![v6 count])
  {
    long long v36 = 0;
    __int16 v37 = 0;
    double v20 = 0;
    int v38 = 0;
    id v21 = 0;
    goto LABEL_46;
  }
  id v8 = [v5 metadata];
  id v9 = [v8 objectForKey:*MEMORY[0x1E4F5C720]];
  [v9 doubleValue];
  double v11 = v10;

  id v12 = [v8 objectForKey:*MEMORY[0x1E4F5C718]];
  [v12 doubleValue];
  double v14 = v13;

  int v15 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    double v69 = v11;
    __int16 v70 = 2048;
    double v71 = v14;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "calling MSImageScalingSpecification assetsToGenerateFromImageWithInputSize:(%f,%f)", buf, 0x16u);
  }

  __int16 v16 = objc_msgSend(MEMORY[0x1E4F5C388], "assetsToGenerateFromImageWithInputSize:toConformToSpecifications:", v6, v11, v14);
  if (![v16 count])
  {
    long long v36 = 0;
    v59 = 0;
    double v20 = 0;
    int v38 = 0;
    id v21 = 0;
    goto LABEL_45;
  }
  __int16 v55 = v7;
  id v17 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    double v69 = *(double *)&v16;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "assetsToGenerateFromImageWithInputSize returned %@", buf, 0xCu);
  }
  __int16 v54 = v8;
  id v56 = v6;
  id v57 = v5;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v16;
  uint64_t v18 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
  if (!v18)
  {
    uint64_t v58 = 0;
    v59 = 0;
    double v20 = 0;
    id v21 = 0;
    goto LABEL_33;
  }
  uint64_t v19 = v18;
  uint64_t v58 = 0;
  v59 = 0;
  double v20 = 0;
  id v21 = 0;
  uint64_t v22 = *(void *)v64;
  uint64_t v23 = *MEMORY[0x1E4F5C6A8];
  uint64_t v61 = *MEMORY[0x1E4F5C6F0];
  do
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      if (*(void *)v64 != v22) {
        objc_enumerationMutation(obj);
      }
      __int16 v25 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      double v26 = objc_msgSend(v25, "objectForKey:", v23, v54);
      if (v26)
      {
        __int16 v27 = [v25 objectForKey:v61];
        double v28 = v27;
        if (v27)
        {
          if (([v27 intValue] & 2) == 0)
          {
            id v29 = v20;
            if (([v28 intValue] & 1) == 0)
            {
              double v30 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                double v69 = *(double *)&v25;
                uint64_t v31 = v30;
                id v32 = "unexpected specification result %@, didn't find a derivative or thumbnail asset type";
                goto LABEL_22;
              }
              goto LABEL_25;
            }
LABEL_24:
            id v35 = v25;

            double v30 = v59;
            uint64_t v58 = v35;
            v59 = v26;
            goto LABEL_25;
          }
          id v33 = v25;
          long long v34 = v21;
          id v21 = v33;

          id v29 = v26;
          if ([v28 intValue]) {
            goto LABEL_24;
          }
        }
        else
        {
          id v29 = v20;
          double v30 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            double v69 = *(double *)&v25;
            uint64_t v31 = v30;
            id v32 = "ERROR: missing asset type flags in specification result %@";
LABEL_22:
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0xCu);
          }
LABEL_25:
        }
        double v20 = v29;
        goto LABEL_27;
      }
      double v28 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v69 = *(double *)&v25;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "ERROR: missing scale factor in specification result %@", buf, 0xCu);
      }
LABEL_27:
    }
    uint64_t v19 = [obj countByEnumeratingWithState:&v63 objects:v67 count:16];
  }
  while (v19);
LABEL_33:

  if (v21)
  {
    id v5 = v57;
    uint64_t v39 = [v57 GUID];
    long long v36 = +[PLPhotoDerivativeUtilities generateDerivativeForMSAsset:v57 derivativeType:0 withSpecificationInfo:v21 collectionGUID:v39];

    char v7 = v55;
    id v6 = v56;
    __int16 v37 = v59;
    if (v36) {
      [v55 addObject:v36];
    }
  }
  else
  {
    long long v36 = 0;
    id v6 = v56;
    id v5 = v57;
    char v7 = v55;
    __int16 v37 = v59;
  }
  int v38 = v58;
  if (v58)
  {
    id v40 = v21;
    id v41 = v5;
    id v42 = v58;
    int v38 = v42;
    id v43 = v41;
    __int16 v16 = v42;
    v62 = v20;
    if (v36)
    {
      id v43 = v41;
      __int16 v16 = v42;
      if (v20)
      {
        id v43 = v41;
        __int16 v16 = v42;
        if (v59)
        {
          id v43 = v36;

          [v59 floatValue];
          float v45 = v44;
          [v20 floatValue];
          float v47 = v45 / v46;
          __int16 v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v38];

          __int16 v48 = [NSNumber numberWithDouble:v47];
          [v16 setObject:v48 forKey:*MEMORY[0x1E4F5C6A8]];
        }
      }
    }
    __int16 v49 = objc_msgSend(v41, "GUID", v54);
    id v50 = v43;
    __int16 v51 = +[PLPhotoDerivativeUtilities generateDerivativeForMSAsset:v43 derivativeType:1 withSpecificationInfo:v16 collectionGUID:v49];

    if (v51) {
      [v7 addObject:v51];
    }

    id v8 = v50;
    double v20 = v62;
    id v21 = v40;
LABEL_45:

    __int16 v37 = v59;
  }
LABEL_46:
  id v52 = v7;

  return v52;
}

+ (id)_videoDerivativeForVideoAtURL:(id)a3 outputURL:(id)a4 withPreset:(id)a5 reason:(id)a6 outputFileType:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  __int16 v37 = __Block_byref_object_copy__70926;
  int v38 = __Block_byref_object_dispose__70927;
  id v39 = 0;
  __int16 v16 = [MEMORY[0x1E4F1CA60] dictionary];
  [v16 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F59AC8]];
  [v16 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F59AD0]];
  id v17 = dispatch_group_create();
  dispatch_group_enter(v17);
  uint64_t v18 = (void *)MEMORY[0x1E4F59AD8];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __97__PLPhotoSharingHelper__videoDerivativeForVideoAtURL_outputURL_withPreset_reason_outputFileType___block_invoke;
  v27[3] = &unk_1E586E770;
  id v19 = v11;
  id v28 = v19;
  id v20 = v12;
  id v29 = v20;
  id v33 = &v34;
  id v21 = v15;
  id v30 = v21;
  id v22 = v13;
  id v31 = v22;
  uint64_t v23 = v17;
  id v32 = v23;
  id v24 = (id)[v18 transcodeVideoAtURL:v19 withAdjustments:0 destinationURL:v20 options:v16 reason:v14 isCancellable:0 completionHandler:v27];
  dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  id v25 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v25;
}

void __97__PLPhotoSharingHelper__videoDerivativeForVideoAtURL_outputURL_withPreset_reason_outputFileType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      char v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v31 = v6;
      __int16 v32 = 2112;
      id v33 = v7;
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "could not generate video derivative for %@ to %@: %@", buf, 0x20u);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = [*(id *)(a1 + 40) path];
    id v29 = 0;
    double v10 = [v8 attributesOfItemAtPath:v9 error:&v29];
    id v11 = v29;

    if (v10)
    {
      id v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v10, "fileSize"));
      [v5 setObject:v12 forKey:*MEMORY[0x1E4F5C710]];
    }
    else
    {
      id v12 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v31 = v13;
        __int16 v32 = 2112;
        id v33 = v11;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "could not get file attributes for %@: %@", buf, 0x16u);
      }
    }

    uint64_t v14 = [MEMORY[0x1E4F5C380] asset];
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    __int16 v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    id v17 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    uint64_t v18 = [*(id *)(a1 + 40) path];
    [v17 setPath:v18];

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setType:*(void *)(a1 + 48)];
    +[PLManagedAsset dimensionsForVideoAtURL:*(void *)(a1 + 40)];
    id v20 = v19;
    double v22 = v21;
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v5 setObject:v23 forKey:*MEMORY[0x1E4F5C720]];

    id v24 = [NSNumber numberWithDouble:v22];
    [v5 setObject:v24 forKey:*MEMORY[0x1E4F5C718]];

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setMetadata:v5];
    id v25 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = *(void *)(a1 + 40);
      __int16 v27 = *(void **)(a1 + 56);
      uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138413314;
      uint64_t v31 = v26;
      __int16 v32 = 2112;
      id v33 = v27;
      __int16 v34 = 2048;
      id v35 = v20;
      __int16 v36 = 2048;
      double v37 = v22;
      __int16 v38 = 2112;
      uint64_t v39 = v28;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "generated video derivative to %@ with videoPresetName %@ dimensions (%f,%f) for MSAsset %@", buf, 0x34u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

+ (id)videoDerivativesForAssetCollection:(id)a3 withSpecifications:(id)a4
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v108 = v6;
    __int16 v109 = 2112;
    id v110 = v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "videoDerivativesForAssetCollection %@ with specifications %@", buf, 0x16u);
  }

  id v9 = [v6 GUID];
  if (!v9)
  {
    id v18 = 0;
    goto LABEL_71;
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v104 = 0u;
  long long v103 = 0u;
  double v10 = [v6 assets];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v103 objects:v113 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v104;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v104 != v14) {
          objc_enumerationMutation(v10);
        }
        __int16 v16 = *(void **)(*((void *)&v103 + 1) + 8 * i);
        if ([v16 isVideo])
        {
          uint64_t v17 = [v16 path];

          uint64_t v13 = (void *)v17;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v103 objects:v113 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  id v19 = +[PLPhotoSharingHelper temporaryVideoPathForCollectionGUID:v9];
  id v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19 isDirectory:0];
  double v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v22 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
  id v102 = 0;
  char v23 = [v21 copyItemAtURL:v22 toURL:v20 error:&v102];
  id v90 = v102;

  if ((v23 & 1) == 0)
  {
    id v24 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v108 = v13;
      __int16 v109 = 2112;
      id v110 = v19;
      __int16 v111 = 2112;
      id v112 = v90;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "could not copy %@ to %@ error %@", buf, 0x20u);
    }
  }
  if (([v21 fileExistsAtPath:v19] & 1) == 0)
  {
    id v33 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v108 = v19;
      __int16 v109 = 2112;
      id v110 = v6;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "could not access masterVideoPath %@ for collection %@", buf, 0x16u);
    }
    id v18 = 0;
    goto LABEL_70;
  }
  id v85 = v7;
  v88 = [MEMORY[0x1E4F1CA48] array];
  int v25 = [v6 isPhotoIris];
  int v26 = v25;
  __int16 v27 = @"MP4";
  if (v25) {
    __int16 v27 = @"MOV";
  }
  uint64_t v78 = *MEMORY[0x1E4F15AA8];
  if (v25) {
    uint64_t v28 = (void *)*MEMORY[0x1E4F15AB0];
  }
  else {
    uint64_t v28 = (void *)*MEMORY[0x1E4F15AA8];
  }
  v87 = v27;
  id v86 = v28;
  v89 = v21;
  int v83 = v26;
  if ((v26 & 1) == 0)
  {
    id v29 = +[PLPhotoSharingHelper temporaryVideoPosterFramePathForCollectionGUID:v9];
    if ([v21 fileExistsAtPath:v29])
    {
      id v101 = 0;
      char v30 = [v21 removeItemAtPath:v29 error:&v101];
      id v31 = v101;
      v80 = v31;
      if (v30)
      {
        __int16 v32 = v20;
      }
      else
      {
        id v34 = v31;
        id v35 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v108 = v19;
          __int16 v109 = 2112;
          id v110 = v6;
          __int16 v111 = 2112;
          id v112 = v34;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "could not remove masterVideoPath %@ for collection %@ error %@", buf, 0x20u);
        }
        __int16 v32 = v20;
      }
    }
    else
    {
      __int16 v32 = v20;
      v80 = 0;
    }
    [a1 videoPosterFrameDimension];
    uint64_t v76 = (uint64_t)(v36 * v37);
    __int16 v38 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v29 isDirectory:0];
    uint64_t v39 = dispatch_group_create();
    dispatch_group_enter(v39);
    uint64_t v40 = [NSString stringWithFormat:@"Shared albums posterframe extraction for %@", v9];
    v73 = (void *)MEMORY[0x1E4F59AD8];
    v74 = (void *)v40;
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __78__PLPhotoSharingHelper_videoDerivativesForAssetCollection_withSpecifications___block_invoke;
    v93[3] = &unk_1E586E748;
    id v94 = v29;
    id v95 = v32;
    id v96 = v6;
    double v21 = v89;
    id v97 = v89;
    id v98 = v38;
    id v99 = v88;
    v100 = v39;
    id v41 = v39;
    id v42 = v38;
    id v43 = v29;
    [v73 generatePosterFrameForVideoAtURL:v95 maximumPixelCount:v76 destinationURL:v42 reason:v74 completionHandler:v93];
    dispatch_group_wait(v41, 0xFFFFFFFFFFFFFFFFLL);

    id v20 = v32;
    int v26 = v83;
  }
  CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
  float v44 = (void *)CFPreferencesCopyAppValue(@"PLDebugVideoTranscodingPresetName", @"com.apple.mobileslideshow");
  if ((v26 & 1) == 0)
  {
    id v45 = (id)*MEMORY[0x1E4F15760];
    float v46 = v45;
    if (v44)
    {
      id v81 = v44;

      float v47 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v108 = v81;
        _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_ERROR, "will use PLDebugVideoTranscodingPresetName %@", buf, 0xCu);
      }
      id v48 = a1;
    }
    else
    {
      id v48 = a1;
      id v81 = v45;
    }
    __int16 v49 = +[PLPhotoSharingHelper temporarySmallVideoDerivativePathForCollectionGUID:v9];
    id v50 = (void *)MEMORY[0x1E4F1CB10];
    v75 = v49;
    __int16 v51 = [v49 stringByAppendingPathExtension:@"MP4"];
    id v52 = [v50 fileURLWithPath:v51 isDirectory:0];

    __int16 v53 = [v52 path];
    if ([v89 fileExistsAtPath:v53])
    {
      id v92 = 0;
      char v54 = [v89 removeItemAtURL:v52 error:&v92];
      id v77 = v92;

      if (v54)
      {
LABEL_50:
        __int16 v55 = PLPhotoSharingGetLog();
        a1 = v48;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v108 = v52;
          __int16 v109 = 2112;
          id v110 = v81;
          _os_log_impl(&dword_19B3C7000, v55, OS_LOG_TYPE_INFO, "will generate video derivative to %@ with videoPresetName %@", buf, 0x16u);
        }

        id v56 = [NSString stringWithFormat:@"Shared albums small video derivative for asset collection %@", v9];
        id v57 = [v48 _videoDerivativeForVideoAtURL:v20 outputURL:v52 withPreset:v81 reason:v56 outputFileType:v78];
        uint64_t v58 = v57;
        if (v57)
        {
          [v57 setMediaAssetType:6];
          [v88 addObject:v58];
        }

        double v21 = v89;
        int v26 = v83;
        goto LABEL_55;
      }
      __int16 v53 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v108 = v52;
        __int16 v109 = 2112;
        id v110 = v6;
        __int16 v111 = 2112;
        id v112 = v77;
        _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "could not remove smallDerivativeURL %@ for collection %@ error %@", buf, 0x20u);
      }
    }
    else
    {
      id v77 = 0;
    }

    goto LABEL_50;
  }
LABEL_55:
  if (!v44)
  {
    v82 = v20;
    id v59 = a1;
    v60 = (id *)MEMORY[0x1E4F15700];
    if (!v26) {
      v60 = (id *)MEMORY[0x1E4F15768];
    }
    id v61 = *v60;
    v62 = +[PLPhotoSharingHelper temporaryLargeVideoDerivativePathForCollectionGUID:v9];
    long long v63 = (void *)MEMORY[0x1E4F1CB10];
    v79 = v62;
    long long v64 = [v62 stringByAppendingPathExtension:v87];
    long long v65 = [v63 fileURLWithPath:v64 isDirectory:0];

    long long v66 = [v65 path];
    if ([v89 fileExistsAtPath:v66])
    {
      id v91 = 0;
      char v67 = [v89 removeItemAtURL:v65 error:&v91];
      id v84 = v91;

      if (v67)
      {
LABEL_64:
        v68 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v108 = v65;
          __int16 v109 = 2112;
          id v110 = v61;
          _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_INFO, "will generate video derivative to %@ with videoPresetName %@", buf, 0x16u);
        }

        double v69 = [NSString stringWithFormat:@"Shared albums large video derivative for asset collection %@", v9];
        __int16 v70 = [v59 _videoDerivativeForVideoAtURL:v82 outputURL:v65 withPreset:v61 reason:v69 outputFileType:v86];
        double v71 = v70;
        if (v70)
        {
          [v70 setMediaAssetType:7];
          [v88 addObject:v71];
        }

        id v20 = v82;
        double v21 = v89;
        goto LABEL_69;
      }
      long long v66 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v108 = v65;
        __int16 v109 = 2112;
        id v110 = v6;
        __int16 v111 = 2112;
        id v112 = v84;
        _os_log_impl(&dword_19B3C7000, v66, OS_LOG_TYPE_ERROR, "could not remove largeDerivativeURL %@ for collection %@ error %@", buf, 0x20u);
      }
    }
    else
    {
      id v84 = 0;
    }

    goto LABEL_64;
  }
LABEL_69:
  id v18 = v88;

  id v7 = v85;
  id v33 = v87;
LABEL_70:

LABEL_71:
  return v18;
}

void __78__PLPhotoSharingHelper_videoDerivativesForAssetCollection_withSpecifications___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(a1 + 40);
      double v8 = *(double *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      uint64_t v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      double v30 = v8;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "could not generate video posterframe at %@ for video URL %@ collection %@ error %@", buf, 0x2Au);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    id v9 = *(void **)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    id v24 = 0;
    uint64_t v11 = [v9 attributesOfItemAtPath:v10 error:&v24];
    id v12 = v24;
    if (v11)
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "fileSize"));
      [v5 setObject:v13 forKey:*MEMORY[0x1E4F5C710]];
    }
    else
    {
      uint64_t v13 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v26 = v14;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "could not get file attributes for %@: %@", buf, 0x16u);
      }
    }

    uint64_t v15 = [MEMORY[0x1E4F5C380] asset];
    [v15 setPath:*(void *)(a1 + 32)];
    [v15 setType:@"public.jpeg"];
    [v15 setMediaAssetType:5];
    [MEMORY[0x1E4F59AE0] sizeOfImageAtURL:*(void *)(a1 + 64) orientationOut:0];
    uint64_t v17 = v16;
    double v19 = v18;
    id v20 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v5 setObject:v20 forKey:*MEMORY[0x1E4F5C720]];

    double v21 = [NSNumber numberWithDouble:v19];
    [v5 setObject:v21 forKey:*MEMORY[0x1E4F5C718]];

    [v15 setMetadata:v5];
    [*(id *)(a1 + 72) addObject:v15];
    double v22 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138413058;
      uint64_t v26 = v23;
      __int16 v27 = 2048;
      id v28 = v17;
      __int16 v29 = 2048;
      double v30 = v19;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "generated video poster frame to %@ dimensions (%f,%f) with MSAsset %@", buf, 0x2Au);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 80));
}

+ (void)deleteCommentWithGUIDFromServer:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    __int16 v16 = v9;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v13, 0x20u);
  }
  if (v5)
  {
    uint64_t v10 = [a1 sharingPersonID];
    uint64_t v11 = [MEMORY[0x1E4F77A58] sharedConnection];
    id v12 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "about to call connection deleteCommentWithGUID:%@ personID:%@", (uint8_t *)&v13, 0x16u);
    }

    [v11 deleteCommentWithGUID:v5 personID:v10];
  }
}

+ (void)publishCloudSharedCommentToServer:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    id v9 = NSStringFromSelector(a2);
    int v25 = 138412802;
    uint64_t v26 = v7;
    __int16 v27 = 2112;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v25, 0x20u);
  }
  if (v5)
  {
    uint64_t v10 = [v5 asset];
    uint64_t v11 = [v10 cloudAssetGUID];

    if (v11)
    {
      id v12 = [MEMORY[0x1E4F5C370] comment];
      int v13 = [v5 cloudGUID];
      [v12 setGUID:v13];

      id v14 = [v5 commentDate];
      [v12 setTimestamp:v14];

      __int16 v15 = [v5 isCaption];
      -[NSObject setIsCaption:](v12, "setIsCaption:", [v15 BOOLValue]);

      __int16 v16 = [v5 isBatchComment];
      -[NSObject setIsBatchComment:](v12, "setIsBatchComment:", [v16 BOOLValue]);

      __int16 v17 = [v5 isLike];
      int v18 = [v17 BOOLValue];

      if (v18)
      {
        [v12 setIsLike:1];
      }
      else
      {
        uint64_t v19 = [v5 commentText];
        [v12 setContent:v19];
      }
      id v20 = [v5 isMyComment];
      -[NSObject setIsMine:](v12, "setIsMine:", [v20 BOOLValue]);

      [v12 setIsDeletable:1];
      double v21 = [a1 sharingPersonID];
      double v22 = [MEMORY[0x1E4F77A58] sharedConnection];
      uint64_t v23 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412802;
        uint64_t v26 = v12;
        __int16 v27 = 2112;
        id v28 = v11;
        __int16 v29 = 2112;
        id v30 = v21;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, "about to call connection addComments:%@ toAssetCollectionWithGUID:%@ personID:%@", (uint8_t *)&v25, 0x20u);
      }

      id v24 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
      [v22 addComments:v24 toAssetCollectionWithGUID:v11 personID:v21];
    }
    else
    {
      id v12 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "ERROR: couldn't find asset cloud GUID for comment, skipping comment deletion on server", (uint8_t *)&v25, 2u);
      }
    }
  }
}

+ (void)savePhoneInvitationFailuresForPhoneNumber:(id)a3 inAlbum:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = objc_opt_class();
  objc_sync_enter(v7);
  id v8 = [a1 _phoneInvitationFailureFile];
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8];

  if (!v10
    || ([MEMORY[0x1E4F1CA60] dictionaryWithContentsOfFile:v8],
        (uint64_t v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v12 = [v6 GUID];
  if (v12)
  {
    int v13 = [v11 objectForKey:v12];
    if (!v13)
    {
      int v13 = [MEMORY[0x1E4F1CA48] array];
    }
    [v13 addObject:v15];
    [v11 setObject:v13 forKey:v12];
    id v14 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v11 format:100 options:0 error:0];
    [v14 writeToFile:v8 options:1073741825 error:0];
  }
  objc_sync_exit(v7);
}

+ (BOOL)hasPhoneInvitationForAlbum:(id)a3
{
  uint64_t v3 = [a3 cloudMetadata];
  id v4 = [v3 objectForKey:*MEMORY[0x1E4F5C3D8]];

  LOBYTE(v3) = [v4 length] != 0;
  return (char)v3;
}

+ (void)markPendingInvitationAsSpamForAlbum:(id)a3 completionHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = objc_opt_class();
    id v11 = v10;
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v34 = v10;
    __int16 v35 = 2112;
    double v36 = v12;
    __int16 v37 = 2112;
    id v38 = v7;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);
  }
  int v13 = [MEMORY[0x1E4F77A58] sharedConnection];
  id v14 = [v7 cloudMetadata];
  id v15 = [v14 objectForKey:*MEMORY[0x1E4F5C3D8]];

  __int16 v16 = [a1 sharingPersonID];
  __int16 v17 = [v7 cloudGUID];
  uint64_t v18 = [v15 length];
  uint64_t v19 = PLPhotoSharingGetLog();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
  if (v18)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v15;
      __int16 v35 = 2112;
      double v36 = v16;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "about to call connection markAsSpamInvitationWithToken:%@ personID:%@", buf, 0x16u);
    }

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __78__PLPhotoSharingHelper_markPendingInvitationAsSpamForAlbum_completionHandler___block_invoke;
    v30[3] = &unk_1E58734E8;
    double v21 = &v32;
    double v22 = &v31;
    uint64_t v31 = v17;
    id v32 = v8;
    id v23 = v17;
    id v24 = v8;
    [v13 markAsSpamInvitationWithToken:v15 personID:v16 completionBlock:v30];
  }
  else
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v17;
      __int16 v35 = 2112;
      double v36 = v16;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_INFO, "about to call connection markAsSpamAlbumWithGUID:%@ personID:%@", buf, 0x16u);
    }

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __78__PLPhotoSharingHelper_markPendingInvitationAsSpamForAlbum_completionHandler___block_invoke_652;
    v27[3] = &unk_1E58734E8;
    double v21 = &v29;
    double v22 = &v28;
    id v28 = v17;
    id v29 = v8;
    id v25 = v17;
    id v26 = v8;
    [v13 markAsSpamAlbumWithGUID:v25 personID:v16 completionBlock:v27];
  }
}

void __78__PLPhotoSharingHelper_markPendingInvitationAsSpamForAlbum_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  if (!v3)
  {
    v6[0] = *(void *)(a1 + 32);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:v5];
  }
}

void __78__PLPhotoSharingHelper_markPendingInvitationAsSpamForAlbum_completionHandler___block_invoke_652(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
  if (!v3)
  {
    id v5 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
      *(_DWORD *)buf = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "will call -[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:albumGUIDs:] with arguments %@", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:v7];
  }
}

+ (void)declinePendingInvitationForAlbum:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 unsubscribeFromAlbum:v4];
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = [v4 cloudGUID];

  id v7 = [v5 arrayWithObject:v6];

  uint64_t v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    int v10 = v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "will call -[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:albumGUIDs:] with arguments %@", (uint8_t *)&v9, 0xCu);
  }

  +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:v7];
}

+ (void)acceptPendingInvitationForAlbum:(id)a3 completionHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 photoLibrary];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke;
  v29[3] = &unk_1E5875CE0;
  id v10 = v7;
  id v30 = v10;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke_2;
  v27[3] = &unk_1E5875198;
  id v11 = v8;
  id v28 = v11;
  [v9 performTransaction:v29 completionHandler:v27];
  uint64_t v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = objc_opt_class();
    id v14 = v13;
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    id v32 = v13;
    __int16 v33 = 2112;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v10;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);
  }
  __int16 v16 = [MEMORY[0x1E4F77A58] sharedConnection];
  __int16 v17 = [v10 cloudMetadata];
  uint64_t v18 = [v17 objectForKey:*MEMORY[0x1E4F5C3D8]];

  uint64_t v19 = [a1 sharingPersonID];
  uint64_t v20 = [v18 length];
  double v21 = PLPhotoSharingGetLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412546;
      id v32 = v18;
      __int16 v33 = 2112;
      id v34 = v19;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "about to call connection acceptInvitationWithToken:%@ personID:%@", buf, 0x16u);
    }

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke_650;
    v25[3] = &unk_1E5874D70;
    id v26 = v11;
    [v16 acceptInvitationWithToken:v18 personID:v19 completionBlock:v25];
    id v23 = v26;
  }
  else
  {
    if (v22)
    {
      id v24 = [v10 cloudGUID];
      *(_DWORD *)buf = 138412546;
      id v32 = v24;
      __int16 v33 = 2112;
      id v34 = v19;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, "about to call connection subscribeToAlbumWithGUID:%@ personID:%@", buf, 0x16u);
    }
    id v23 = [v10 cloudGUID];
    [v16 subscribeToAlbumWithGUID:v23 personID:v19];
  }
}

void __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [NSNumber numberWithInteger:2];
  [v1 setCloudRelationshipState:v2];
}

uint64_t __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __74__PLPhotoSharingHelper_acceptPendingInvitationForAlbum_completionHandler___block_invoke_650(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)unsubscribeFromAlbum:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    int v9 = NSStringFromSelector(a2);
    int v16 = 138412802;
    __int16 v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v16, 0x20u);
  }
  id v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v5 cloudGUID];
    uint64_t v12 = [a1 sharingPersonID];
    int v16 = 138412546;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    uint64_t v19 = v12;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "about to call connection unsubscribeFromAlbumWithGUID:%@ personID %@", (uint8_t *)&v16, 0x16u);
  }
  int v13 = [MEMORY[0x1E4F77A58] sharedConnection];
  id v14 = [v5 cloudGUID];
  id v15 = [a1 sharingPersonID];
  [v13 unsubscribeFromAlbumWithGUID:v14 personID:v15];
}

+ (void)removeSubscribers:(id)a3 fromOwnedAlbum:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    id v29 = v10;
    __int16 v30 = 2112;
    uint64_t v31 = v12;
    __int16 v32 = 2112;
    id v33 = v7;
    __int16 v34 = 2112;
    id v35 = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%@ %@ %@ ownedAlbum:%@", buf, 0x2Au);
  }
  uint64_t v22 = v8;

  int v13 = [a1 sharingPersonID];
  id v14 = [MEMORY[0x1E4F77A58] sharedConnection];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        __int16 v20 = [*(id *)(*((void *)&v23 + 1) + 8 * i) cloudGUID];
        id v21 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v29 = v20;
          __int16 v30 = 2112;
          uint64_t v31 = v13;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_INFO, " about to call connection removeAccessControlEntryWithGUID:%@ personID:%@", buf, 0x16u);
        }

        [v14 removeAccessControlEntryWithGUID:v20 personID:v13];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }
}

+ (void)sendPendingInvitationsForAlbum:(id)a3 resendInvitationGUIDs:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v8 = a4;
  int v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    __int16 v30 = v7;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%@ %@ %@", buf, 0x20u);
  }
  if (v8 && [v8 count])
  {
    int v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  }
  else
  {
    int v13 = 0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v30 = __Block_byref_object_copy__70926;
  uint64_t v31 = __Block_byref_object_dispose__70927;
  id v32 = 0;
  id v14 = [v7 photoLibrary];
  id v15 = +[PLPhotoSharingHelper sharingPersonID];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__PLPhotoSharingHelper_sendPendingInvitationsForAlbum_resendInvitationGUIDs___block_invoke;
  v25[3] = &unk_1E5875340;
  long long v26 = v7;
  id v27 = v13;
  id v28 = buf;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__PLPhotoSharingHelper_sendPendingInvitationsForAlbum_resendInvitationGUIDs___block_invoke_649;
  v19[3] = &unk_1E58743C0;
  long long v23 = buf;
  id v24 = a1;
  uint64_t v16 = v26;
  __int16 v20 = v16;
  id v17 = v15;
  id v21 = v17;
  id v18 = v27;
  id v22 = v18;
  [v14 performBlockAndWait:v25 completionHandler:v19];

  _Block_object_dispose(buf, 8);
}

void __77__PLPhotoSharingHelper_sendPendingInvitationsForAlbum_resendInvitationGUIDs___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 invitationRecords];
    *(_DWORD *)buf = 138412546;
    id v38 = v3;
    __int16 v39 = 2048;
    uint64_t v40 = [v4 count];
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "found plAlbum %@ with invitationRecords %lu", buf, 0x16u);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = [*(id *)(a1 + 32) invitationRecords];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v33;
    *(void *)&long long v7 = 138412290;
    long long v31 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v12 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v31;
          id v38 = v11;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "invitation record %@", buf, 0xCu);
        }

        int v13 = [v11 invitationState];
        if ([v13 intValue] == 1)
        {
        }
        else
        {
          uint64_t v14 = *(void *)(a1 + 40);

          if (!v14) {
            continue;
          }
        }
        id v15 = *(void **)(a1 + 40);
        if (v15)
        {
          uint64_t v16 = [v11 cloudGUID];
          int v17 = [v15 containsObject:v16];

          if (!v17) {
            continue;
          }
        }
        id v18 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "record state is kMSASRelationshipStatePending, will send invitation", buf, 2u);
        }

        id v19 = objc_alloc_init(MEMORY[0x1E4F5C378]);
        __int16 v20 = [v11 cloudGUID];
        [v19 setGUID:v20];

        id v21 = [v11 inviteeEmails];
        [v19 setEmails:v21];

        id v22 = [v11 inviteePhones];
        [v19 setPhones:v22];

        long long v23 = [v11 inviteeFirstName];
        [v19 setFirstName:v23];

        id v24 = [v11 inviteeLastName];
        [v19 setLastName:v24];

        long long v25 = [v11 inviteeFullName];
        [v19 setFullName:v25];

        long long v26 = [v11 inviteeHashedPersonID];
        [v19 setPersonID:v26];

        [v19 setState:1];
        id v27 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (!v27)
        {
          id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
          __int16 v30 = *(void **)(v29 + 40);
          *(void *)(v29 + 40) = v28;

          id v27 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        }
        objc_msgSend(v27, "addObject:", v19, v31);
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v8);
  }
}

void __77__PLPhotoSharingHelper_sendPendingInvitationsForAlbum_resendInvitationGUIDs___block_invoke_649(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v3 = PLPhotoSharingGetLog();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      id v5 = objc_opt_class();
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      long long v7 = *(void **)(a1 + 32);
      id v8 = v5;
      uint64_t v9 = [v7 cloudGUID];
      uint64_t v10 = *(void *)(a1 + 40);
      int v18 = 138413058;
      id v19 = v5;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      __int16 v22 = 2112;
      long long v23 = v9;
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "%@: about to call connection addAccessControlEntries: %@ toAlbumWithGUID: %@ forPersonID %@", (uint8_t *)&v18, 0x2Au);
    }
    id v11 = [MEMORY[0x1E4F77A58] sharedConnection];
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    int v13 = [*(id *)(a1 + 32) cloudGUID];
    [v11 addAccessControlEntries:v12 toAlbumWithGUID:v13 personID:*(void *)(a1 + 40)];

LABEL_5:
    return;
  }
  if (v4)
  {
    int v18 = 138412290;
    id v19 = (id)objc_opt_class();
    id v14 = v19;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "%@: no sharing invitations to send", (uint8_t *)&v18, 0xCu);
  }
  if (*(void *)(a1 + 48))
  {
    id v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      uint64_t v16 = *(void *)(a1 + 48);
      int v18 = 138412546;
      id v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      id v17 = v15;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "%@: failed to find invitation GUIDs %@ to resend", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_5;
  }
}

+ (void)sendPendingInvitationsForNewlyCreatedAlbum:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    id v8 = NSStringFromSelector(a2);
    int v10 = 138412802;
    id v11 = v6;
    __int16 v12 = 2112;
    int v13 = v8;
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v9 = [v4 GUID];
  +[PLCloudSharingInvitationChangeJob sendServerPendingInvitationsForAlbumWithGUID:v9];
}

+ (BOOL)removeCloudSharingDirectories:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v6 = [v4 photoDirectoryWithType:22];
  id v27 = 0;
  char v7 = [v5 removeItemAtPath:v6 error:&v27];
  id v8 = v27;

  uint64_t v9 = (void *)MEMORY[0x1E4F28A50];
  int v10 = (void *)MEMORY[0x1E4F28798];
  if (v7)
  {
    BOOL v11 = 1;
  }
  else
  {
    __int16 v12 = [v8 userInfo];
    int v13 = [v12 objectForKey:*v9];

    __int16 v14 = [v13 domain];
    if ([v14 isEqualToString:*v10]) {
      BOOL v11 = [v13 code] == 2;
    }
    else {
      BOOL v11 = 0;
    }

    if (a3 && !v11) {
      *a3 = v8;
    }
  }
  id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v16 = [v4 photoDirectoryWithType:23];
  id v26 = 0;
  char v17 = [v15 removeItemAtPath:v16 error:&v26];
  id v18 = v26;

  if ((v17 & 1) == 0)
  {
    id v19 = [v18 userInfo];
    __int16 v20 = [v19 objectForKey:*v9];

    uint64_t v21 = [v20 domain];
    if ([v21 isEqualToString:*v10])
    {
      uint64_t v22 = [v20 code];

      if (v22 == 2)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    long long v23 = PLMigrationGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      __int16 v24 = [v4 photoDirectoryWithType:23];
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v24;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Unable to delete %@: %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
LABEL_19:

  return v11;
}

+ (void)requestVideoPlaybackURLForAsset:(id)a3 videoType:(unint64_t)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 isStreamedVideo])
  {
    uint64_t v9 = +[PLPhotoSharingHelper sharingPersonID];
    int v10 = [v7 cloudAssetGUID];
    BOOL v11 = [MEMORY[0x1E4F77A58] sharedConnection];
    __int16 v12 = [v7 photoLibrary];
    int v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v10;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2048;
      unint64_t v29 = a4;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "about to call connection videoURLForAssetCollectionWithGUID:%@ personID:%@ mediaAssetType:%ld", buf, 0x20u);
    }

    __int16 v14 = [v7 cloudAssetGUID];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke;
    v18[3] = &unk_1E586E720;
    id v19 = v10;
    id v20 = v9;
    id v21 = v12;
    id v22 = v7;
    id v23 = v8;
    id v15 = v12;
    id v16 = v9;
    id v17 = v10;
    [v11 videoURLsForAssetCollectionWithGUID:v14 forMediaAssetType:a4 personID:v16 completionBlock:v18];
  }
  else
  {
    BOOL v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, " requestVideoPlaybackURLForAsset called with a non streamed video asset %@", buf, 0xCu);
    }
  }
}

void __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  int v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413314;
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "completion block for videoURLForAssetCollectionWithGUID:%@ personID:%@ result %@ expiration %@ error %@", buf, 0x34u);
  }

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke_644;
  v19[3] = &unk_1E5875BF8;
  int v13 = *(void **)(a1 + 48);
  id v20 = *(id *)(a1 + 56);
  id v21 = v8;
  id v22 = v9;
  id v23 = v7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke_2;
  v17[3] = &unk_1E5875198;
  id v18 = *(id *)(a1 + 64);
  id v14 = v7;
  id v15 = v9;
  id v16 = v8;
  [v13 performBlock:v19 completionHandler:v17];
}

uint64_t __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke_644(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) firstObject];
  [v2 setCachedNonPersistedVideoPlaybackURL:v3];

  [*(id *)(a1 + 32) setCachedNonPersistedVideoPlaybackURLExpiration:*(void *)(a1 + 48)];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v4 setCachedNonPersistedVideoPlaybackURLError:v5];
}

uint64_t __77__PLPhotoSharingHelper_requestVideoPlaybackURLForAsset_videoType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (BOOL)isCellularConnection
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  sockaddr address = (sockaddr)xmmword_19BA9A0E0;
  uint64_t v2 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &address);
  if (v2)
  {
    id v3 = v2;
    SCNetworkReachabilityFlags v8 = 0;
    SCNetworkReachabilityGetFlags(v2, &v8);
    BOOL v4 = (~v8 & 0x40002) == 0;
    CFRelease(v3);
  }
  else
  {
    BOOL v4 = 1;
  }
  uint64_t v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = @"wifi";
    if (v4) {
      uint64_t v6 = @"celluar";
    }
    SCNetworkReachabilityFlags v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "Using %@ connection", (uint8_t *)&v8, 0xCu);
  }

  return v4;
}

+ (void)deleteCloudSharedAssetsFromServer:(id)a3 inSharedAlbum:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = objc_opt_class();
    id v11 = v10;
    uint64_t v12 = NSStringFromSelector(a2);
    int v13 = [v7 valueForKey:@"cloudAssetGUID"];
    *(_DWORD *)buf = 138413058;
    __int16 v30 = v10;
    __int16 v31 = 2112;
    __int16 v32 = v12;
    __int16 v33 = 2112;
    uint64_t v34 = v13;
    __int16 v35 = 2112;
    id v36 = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%@ %@ cloudAssetGUIDs %@ album %@", buf, 0x2Au);
  }
  id v14 = [MEMORY[0x1E4F77A58] sharedConnection];
  id v15 = [a1 sharingPersonID];
  id v16 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v17 = v7;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21), "cloudAssetGUID", (void)v24);
        [v16 addObject:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }

  id v23 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v30 = v16;
    __int16 v31 = 2112;
    __int16 v32 = v15;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_INFO, " about to call connection deleteAssetCollectionsWithGUIDs:%@ personID:%@", buf, 0x16u);
  }

  [v14 deleteAssetCollectionsWithGUIDs:v16 personID:v15];
  [a1 _userDidDeleteSharedAssets:v17];
}

+ (void)_userDidDeleteSharedAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (PLIsAssetsd())
  {
    BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "uuid", (void)v12);
          if (v10) {
            [v4 addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      id v11 = +[PLNotificationManager sharedManager];
      [v11 noteUserDidDeleteSharedAssetsWithUUIDs:v4];
    }
  }
  else
  {
    +[PLUserActivityDaemonJob userDidDeleteSharedAssets:v3];
  }
}

+ (void)enqueueCloudSharedAssetsForPublishToServer:(id)a3 inSharedAlbum:(id)a4
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = objc_opt_class();
    id v11 = v10;
    long long v12 = NSStringFromSelector(a2);
    long long v13 = [v7 valueForKey:@"uuid"];
    *(_DWORD *)buf = 138413058;
    v142 = v10;
    __int16 v143 = 2112;
    id v144 = v12;
    __int16 v145 = 2112;
    v146 = v13;
    __int16 v147 = 2112;
    id v148 = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%@ %@ asset uuids %@ album %@", buf, 0x2Au);
  }
  id v96 = a1;
  id v97 = v8;

  v117 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  id obj = v7;
  uint64_t v118 = [obj countByEnumeratingWithState:&v136 objects:v140 count:16];
  uint64_t v14 = 0;
  if (v118)
  {
    uint64_t v116 = *(void *)v137;
    uint64_t v123 = *MEMORY[0x1E4F1C5F8];
    uint64_t v121 = *MEMORY[0x1E4F5C710];
    uint64_t v119 = *MEMORY[0x1E4F5C718];
    uint64_t v120 = *MEMORY[0x1E4F5C720];
    uint64_t v115 = *MEMORY[0x1E4F5C428];
    long long v106 = (void *)*MEMORY[0x1E4F44490];
    double v15 = *MEMORY[0x1E4F1DB30];
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v100 = *MEMORY[0x1E4F5C408];
    uint64_t v99 = *MEMORY[0x1E4F5C410];
    uint64_t v98 = *MEMORY[0x1E4F5C418];
    uint64_t v110 = *MEMORY[0x1E4F5C3F8];
    uint64_t v109 = *MEMORY[0x1E4F5C3F0];
    uint64_t v108 = *MEMORY[0x1E4F5C400];
    uint64_t v104 = *MEMORY[0x1E4F5C430];
    uint64_t v102 = *MEMORY[0x1E4F5C420];
    do
    {
      for (uint64_t i = 0; i != v118; ++i)
      {
        if (*(void *)v137 != v116) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        id v19 = objc_alloc_init(MEMORY[0x1E4F5C380]);
        uint64_t v20 = [v18 cloudAssetGUID];
        [v19 setGUID:v20];

        uint64_t v21 = [v18 uniformTypeIdentifier];
        [v19 setType:v21];
        id v22 = [v18 pathForOriginalFile];
        [v19 setPath:v22];

        if ([v18 isVideo]) {
          [v19 setMediaAssetType:4];
        }
        id v23 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v24 = (void *)MEMORY[0x1E4F1CB10];
        long long v25 = [v18 pathForOriginalFile];
        long long v26 = [v24 fileURLWithPath:v25 isDirectory:0];

        id v135 = 0;
        v127 = v26;
        [v26 getResourceValue:&v135 forKey:v123 error:0];
        id v126 = v135;
        objc_msgSend(v23, "setObject:forKey:");
        uint64_t v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v18, "width"));
        __int16 v28 = NSNumber;
        uint64_t v29 = [v18 height];
        __int16 v30 = v28;
        uint64_t v31 = v27;
        uint64_t v32 = [v30 numberWithLongLong:v29];
        v129 = (void *)v31;
        [v23 setObject:v31 forKey:v120];
        v125 = (void *)v32;
        [v23 setObject:v32 forKey:v119];
        v124 = v23;
        [v19 setMetadata:v23];
        v130 = [MEMORY[0x1E4F1CA48] array];
        [v130 addObject:v19];
        id v33 = objc_alloc_init(MEMORY[0x1E4F5C368]);
        uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionary];
        __int16 v35 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v18, "playbackVariation"));
        [v34 setObject:v35 forKey:v115];

        uint64_t v36 = [v18 mediaGroupUUID];
        v128 = (void *)v36;
        if ([v18 isPhotoIris] && v36)
        {
          v113 = v21;
          uint64_t v114 = v14;
          uint64_t v37 = [v18 pathForVideoComplementFile];
          uint64_t v38 = [v37 pathExtension];
          __int16 v39 = [v106 identifier];
          v122 = v34;
          __int16 v111 = (void *)v38;
          if (v38)
          {
            uint64_t v40 = +[PLManagedAsset uniformTypeIdentifierFromPathExtension:v38 assetType:1];
            uint64_t v41 = (void *)v40;
            if (v40) {
              id v42 = (void *)v40;
            }
            else {
              id v42 = v39;
            }
            id v43 = v42;

            __int16 v39 = v43;
          }
          id v44 = objc_alloc_init(MEMORY[0x1E4F5C380]);
          id v45 = [MEMORY[0x1E4F29128] UUID];
          float v46 = [v45 UUIDString];
          [v44 setGUID:v46];

          id v112 = v39;
          [v44 setType:v39];
          float v47 = [v18 pathForVideoComplementFile];
          [v44 setPath:v47];

          [v44 setMediaAssetType:4];
          id v48 = [MEMORY[0x1E4F1CA60] dictionary];
          if (v37
            && ([MEMORY[0x1E4F28CB8] defaultManager],
                __int16 v49 = objc_claimAutoreleasedReturnValue(),
                int v50 = [v49 fileExistsAtPath:v37],
                v49,
                v50))
          {
            __int16 v51 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v37 isDirectory:0];
            id v133 = 0;
            id v134 = 0;
            int v52 = [v51 getResourceValue:&v134 forKey:v123 error:&v133];
            id v53 = v134;
            id v105 = v133;
            long long v103 = v53;
            if (v52)
            {
              [v48 setObject:v53 forKey:v121];
              +[PLManagedAsset dimensionsForVideoAtURL:v51];
              double v55 = v54;
              id v56 = v51;
              if (v57 == v15 && v54 == v16)
              {
                uint64_t v58 = v48;
                id v59 = PLPhotoSharingGetLog();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v142 = v37;
                  _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_ERROR, "ERROR: Unable to get dimensions for Iris video complement file %@", buf, 0xCu);
                }
              }
              else
              {
                id v61 = objc_msgSend(NSNumber, "numberWithDouble:");
                [v48 setObject:v61 forKey:v120];

                v62 = [NSNumber numberWithDouble:v55];
                [v48 setObject:v62 forKey:v119];

                [v44 setMetadata:v48];
                [v122 setObject:v128 forKey:v100];
                long long v63 = NSNumber;
                id v101 = v48;
                if (v18) {
                  [v18 photoIrisStillDisplayTime];
                }
                else {
                  memset(&time, 0, sizeof(time));
                }
                long long v64 = [v63 numberWithDouble:CMTimeGetSeconds(&time)];
                [v122 setObject:v64 forKey:v99];

                long long v65 = NSNumber;
                if (v18) {
                  [v18 photoIrisVideoDuration];
                }
                else {
                  memset(&v131, 0, sizeof(v131));
                }
                uint64_t v58 = v101;
                long long v66 = [v65 numberWithDouble:CMTimeGetSeconds(&v131)];
                [v122 setObject:v66 forKey:v98];

                [v130 addObject:v44];
              }
            }
            else
            {
              uint64_t v58 = v48;
              v60 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v142 = v37;
                __int16 v143 = 2112;
                id v144 = v105;
                _os_log_impl(&dword_19B3C7000, v60, OS_LOG_TYPE_ERROR, "ERROR: Unable to get Iris video complement file size for %@: %@", buf, 0x16u);
              }

              id v56 = v51;
            }
          }
          else
          {
            uint64_t v58 = v48;
            id v56 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v142 = v37;
              _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "ERROR: Iris video complement file path is nil or does not exist: %@", buf, 0xCu);
            }
          }

          uint64_t v21 = v113;
          uint64_t v14 = v114;
          uint64_t v34 = v122;
        }
        [v33 setAssets:v130];
        char v67 = [v18 cloudAssetGUID];
        [v33 setGUID:v67];

        v68 = [v18 originalFilename];
        [v33 setFileName:v68];

        objc_msgSend(v33, "setIsDeletable:", objc_msgSend(v18, "cloudIsDeletable"));
        objc_msgSend(v33, "setIsMine:", objc_msgSend(v18, "cloudIsMyAsset"));
        double v69 = [v18 cloudBatchID];

        if (v69)
        {
          __int16 v70 = [v18 cloudBatchID];
          [v34 setObject:v70 forKey:v110];
        }
        double v71 = v19;
        uint64_t v72 = [v18 cloudBatchPublishDate];

        if (v72)
        {
          v73 = [v18 cloudBatchPublishDate];
          [v34 setObject:v73 forKey:v109];
        }
        v74 = [v18 dateCreated];
        if (v74) {
          [v34 setObject:v74 forKey:v108];
        }
        v75 = [NSNumber numberWithBool:1];
        uint64_t v76 = v34;
        [v34 setObject:v75 forKey:@"kPLJustEnqueuedAssetCollectionKey"];

        id v77 = v124;
        uint64_t v78 = v129;
        if ([v18 isVideo])
        {
          v79 = v71;
          v80 = v21;
          uint64_t v81 = v14;
          [v18 duration];
          if (v82 != 0.0)
          {
            +[PLSlalomUtilities durationForManagedAsset:v18 applyVideoAdjustments:1];
            int v83 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v76 setObject:v83 forKey:v104];
          }
          id v84 = [v18 location];
          id v85 = v84;
          if (v84)
          {
            id v86 = [v84 iso6709Notation];
            v87 = v86;
            if (v86 && [v86 length]) {
              [v76 setObject:v87 forKey:v102];
            }
          }
          uint64_t v14 = v81;
          uint64_t v21 = v80;
          id v77 = v124;
          double v71 = v79;
          uint64_t v78 = v129;
        }
        [v33 setMetadata:v76];
        [v117 addObject:v33];
        v88 = [v18 locationData];

        if (v88) {
          ++v14;
        }
      }
      uint64_t v118 = [obj countByEnumeratingWithState:&v136 objects:v140 count:16];
    }
    while (v118);
  }

  if ([v117 count])
  {
    v89 = [MEMORY[0x1E4F77A58] sharedConnection];
    id v90 = [v96 sharingPersonID];
    id v91 = PLPhotoSharingGetLog();
    id v92 = v97;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
    {
      v93 = [v97 cloudGUID];
      *(_DWORD *)buf = 138412802;
      v142 = v117;
      __int16 v143 = 2112;
      id v144 = v93;
      __int16 v145 = 2112;
      v146 = v90;
      _os_log_impl(&dword_19B3C7000, v91, OS_LOG_TYPE_INFO, " about to call connection addAssetCollections:%@ toAlbumWithGUID:%@ personID:%@", buf, 0x20u);
    }
    id v94 = [v97 cloudGUID];
    [v89 addAssetCollections:v117 toAlbumWithGUID:v94 personID:v90];

    [v96 writeUploadDebugBreadcrumbForAssetCollections:v117 state:100 error:0];
  }
  else
  {
    v89 = PLPhotoSharingGetLog();
    id v92 = v97;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v89, OS_LOG_TYPE_INFO, " no asset collections to add", buf, 2u);
    }
  }

  if (MEMORY[0x19F38CC90]())
  {
    if (v14 >= 1)
    {
      id v95 = [v92 title];
      plslogGreenTea();
    }
    if (PLIsForegroundApplication()) {
      cpllogGreenTeaTransmittingPhotosOrVideos();
    }
  }
}

+ (id)_videoComplementURLForSharingFromAsset:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 uuid];
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Determining video complement path to use. UUID: \"%@\"", buf, 0xCu);
  }
  id v18 = 0;
  int v6 = [v3 isPlayableVideo:&v18];
  id v7 = (__CFString *)v18;
  if (v6)
  {
    int v8 = [v3 hasAdjustedVideoComplement];
    uint64_t v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        int v10 = @"adjusted";
      }
      else {
        int v10 = @"original";
      }
      id v11 = [v3 uuid];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Using the %@ original video component. UUID: \"%@\"", buf, 0x16u);
    }
    if (v8) {
      [v3 pathForFullsizeRenderVideoFile];
    }
    else {
    uint64_t v12 = [v3 pathForVideoComplementFile];
    }
  }
  else
  {
    long long v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v3 uuid];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v7;
      __int16 v21 = 2112;
      id v22 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Falling back to medium, since the original video component is unsupported. Codec: \"%@\", UUID: \"%@\"", buf, 0x16u);
    }
    uint64_t v12 = [v3 pathForMediumVideoFile];
  }
  double v15 = (void *)v12;
  double v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];

  return v16;
}

+ (BOOL)_retrieveURLsFromAssetWithUUID:(id)a3 withExportedFileURL:(id)a4 primaryURL:(id *)a5 videoComplementURL:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v39 = v10;
    __int16 v40 = 2114;
    id v41 = v9;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Determining URLs to share for exported file URL: %@, asset UUID: \"%{public}@\"", buf, 0x16u);
  }

  uint64_t v12 = [v10 pathExtension];
  if ([v12 isEqualToString:*MEMORY[0x1E4F8CED8]])
  {
    long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v10];
    uint64_t v14 = [v13 imagePath];
    uint64_t v15 = [v13 videoPath];
    double v16 = (void *)v15;
    if (v14) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    BOOL v18 = !v17;
    if (v17)
    {
      uint64_t v31 = (void *)v15;
      uint64_t v32 = v14;
      id v33 = v9;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      __int16 v21 = [v20 enumeratorAtURL:v10 includingPropertiesForKeys:0 options:5 errorHandler:0];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = [*(id *)(*((void *)&v34 + 1) + 8 * i) pathExtension];
            [v19 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v24);
      }

      __int16 v28 = PLPhotoSharingGetLog();
      id v9 = v33;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = [v19 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412802;
        id v39 = v10;
        __int16 v40 = 2114;
        id v41 = v29;
        __int16 v42 = 2114;
        id v43 = v33;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to determine URLs to share for exported file URL: %@, with path extensions: (%{public}@), asset UUID: \"%{public}@\"", buf, 0x20u);
      }
      double v16 = v31;
      uint64_t v14 = v32;
    }
    else
    {
      *a5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
      *a6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
    }
  }
  else
  {
    *a5 = v10;
    BOOL v18 = 1;
  }

  return v18;
}

+ (BOOL)prepareToEnqueueBatchOfOriginalAssetUUIDs:(id)a3 withBatchCommentText:(id)a4 assetsSharingInfos:(id)a5 customExportsInfo:(id)a6 andTrimmedVideoPathInfo:(id)a7 sharedAlbum:(id)a8 isNewAlbum:(BOOL)a9 error:(id *)a10
{
  id v16 = a3;
  id v31 = a4;
  id v34 = a5;
  id v35 = a6;
  id v36 = a7;
  id v17 = a8;
  BOOL v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v16, "count"));
  id v19 = [v17 photoLibrary];
  uint64_t v20 = [v19 pathManager];
  __int16 v21 = [v20 capabilities];

  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__70926;
  v68[4] = __Block_byref_object_dispose__70927;
  id v69 = 0;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x3032000000;
  long long v65 = __Block_byref_object_copy__70926;
  long long v66 = __Block_byref_object_dispose__70927;
  id v67 = 0;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 1;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke;
  v43[3] = &unk_1E586E6F8;
  id v44 = v19;
  id v53 = &v62;
  double v54 = &v58;
  id v45 = v17;
  BOOL v57 = a9;
  id v33 = v16;
  id v46 = v33;
  id v32 = v31;
  id v47 = v32;
  id v22 = v34;
  id v48 = v22;
  id v23 = v35;
  id v49 = v23;
  id v24 = v36;
  id v50 = v24;
  id v56 = a1;
  id v25 = v21;
  id v51 = v25;
  id v52 = v18;
  double v55 = v68;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_616;
  v37[3] = &unk_1E58743C0;
  id v26 = v52;
  id v38 = v26;
  id v27 = v44;
  id v39 = v27;
  id v42 = a1;
  id v28 = v45;
  id v40 = v28;
  id v41 = v68;
  [v27 performTransactionAndWait:v43 completionHandler:v37];
  if (a10) {
    *a10 = (id) v63[5];
  }
  char v29 = *((unsigned char *)v59 + 24);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  _Block_object_dispose(v68, 8);
  return v29;
}

void __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke(uint64_t a1)
{
  v233[1] = *MEMORY[0x1E4F143B8];
  v163 = +[PLPhotoSharingHelper sharingPersonID];
  if ([*(id *)(a1 + 32) isUnitTesting])
  {

    v163 = @"UnitTestID";
  }
  else if (!v163)
  {
    uint64_t v149 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v232 = *MEMORY[0x1E4F28228];
    v233[0] = @"sharingPersonID is nil";
    v150 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v233 forKeys:&v232 count:1];
    uint64_t v151 = [v149 errorWithDomain:@"com.apple.photolibraryservices" code:5 userInfo:v150];
    uint64_t v152 = *(void *)(*(void *)(a1 + 104) + 8);
    v153 = *(void **)(v152 + 40);
    *(void *)(v152 + 40) = v151;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
    return;
  }
  if (*(void *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 136)) {
      +[PLPhotoSharingHelper publishCloudSharedAlbumToServer:](PLPhotoSharingHelper, "publishCloudSharedAlbumToServer:");
    }
    uint64_t v1 = +[PLManagedAsset assetsWithUUIDs:*(void *)(a1 + 48) options:1 inLibrary:*(void *)(a1 + 32)];
    uint64_t v2 = [v1 count];
    if (v2 != [*(id *)(a1 + 48) count])
    {
      id v3 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = [v1 count];
        uint64_t v5 = [*(id *)(a1 + 48) count];
        *(_DWORD *)buf = 134218240;
        *(void *)&uint8_t buf[4] = v4;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v5;
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "ERROR: Only found %lu originalAssets, expected %lu", buf, 0x16u);
      }
    }
    v178 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v1, "count"));
    long long v212 = 0u;
    long long v213 = 0u;
    long long v210 = 0u;
    long long v211 = 0u;
    id obj = v1;
    uint64_t v6 = [obj countByEnumeratingWithState:&v210 objects:v229 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v211;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v211 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v210 + 1) + 8 * i);
          id v10 = [v9 uuid];
          [v178 setObject:v9 forKey:v10];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v210 objects:v229 count:16];
      }
      while (v6);
    }

    v159 = [MEMORY[0x1E4F8BA08] UUIDString];
    v160 = [MEMORY[0x1E4F1C9C8] date];
    v158 = [*(id *)(a1 + 40) mutableAssets];
    uint64_t v157 = [*(id *)(a1 + 56) length];
    id v11 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    uint64_t v12 = *(void **)(a1 + 64);
    v208[0] = MEMORY[0x1E4F143A8];
    v208[1] = 3221225472;
    v208[2] = __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_582;
    v208[3] = &unk_1E586F060;
    id v154 = v11;
    id v209 = v154;
    [v12 enumerateKeysAndObjectsUsingBlock:v208];
    id v13 = *(id *)(a1 + 48);
    long long v204 = 0u;
    long long v205 = 0u;
    long long v206 = 0u;
    long long v207 = 0u;
    id v164 = v13;
    uint64_t v169 = [v164 countByEnumeratingWithState:&v204 objects:v228 count:16];
    if (v169)
    {
      uint64_t v168 = *(void *)v205;
      uint64_t v162 = *MEMORY[0x1E4F28228];
      v156 = (void *)*MEMORY[0x1E4F15768];
      uint64_t v155 = *MEMORY[0x1E4F15AA8];
      uint64_t v161 = *MEMORY[0x1E4F28A50];
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v205 != v168)
          {
            uint64_t v15 = v14;
            objc_enumerationMutation(v164);
            uint64_t v14 = v15;
          }
          uint64_t v177 = v14;
          uint64_t v16 = *(void *)(*((void *)&v204 + 1) + 8 * v14);
          id v17 = [v178 objectForKey:v16];
          if (v17)
          {
            context = (void *)MEMORY[0x19F38D3B0]();
            int v18 = [v17 isVideo];
            unsigned int v166 = [v17 playbackVariation];
            id v19 = *(void **)(a1 + 72);
            uint64_t v20 = [v17 uuid];
            v171 = [v19 objectForKey:v20];

            __int16 v21 = *(void **)(a1 + 80);
            id v22 = [v17 uuid];
            v179 = [v21 objectForKey:v22];

            if (v179)
            {
              objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
              id v181 = (id)objc_claimAutoreleasedReturnValue();
              id v23 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v181;
                _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Original video is trimmed, use the trimmed file %@", buf, 0xCu);
              }
              v180 = 0;
              v174 = 0;
              BOOL v167 = 0;
LABEL_28:
              int v24 = 1;
LABEL_29:

              id v25 = [MEMORY[0x1E4F29128] UUID];
              v176 = [v25 UUIDString];

              v172 = [v181 pathExtension];
              id v26 = [*(id *)(a1 + 40) cloudGUID];
              id v27 = [*(id *)(a1 + 32) pathManager];
              id v28 = +[PLCloudSharedAssetSaveJob nextDCIMSaveFileURLForCloudPersonID:v163 cloudAlbumGUID:v26 pathManager:v27 fileExtension:v172 assetUUID:v176];

              if (v180)
              {
                char v29 = [v28 URLByDeletingLastPathComponent];
                __int16 v30 = [v28 lastPathComponent];
                id v31 = [v30 stringByDeletingPathExtension];

                id v32 = [v180 pathExtension];
                id v33 = [v32 uppercaseString];
                id v34 = [v31 stringByAppendingPathExtension:v33];

                v173 = [v29 URLByAppendingPathComponent:v34];
              }
              else
              {
                v173 = 0;
              }
              if (v179) {
                int v38 = 1;
              }
              else {
                int v38 = v18 ^ 1;
              }
              if (((v24 | v38) & 1) != 0
                || ![v17 isDefaultAdjustedSlomo]
                || ![v17 isPlayableVideo:0])
              {
                if (v24)
                {
                  id v46 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v181;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v28;
                    _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEFAULT, "Moving result from %@ to %@", buf, 0x16u);
                  }

                  uint64_t v47 = *(void *)(a1 + 88);
                  id v190 = 0;
                  char v48 = [MEMORY[0x1E4F8B908] secureMoveItemAtURL:v181 toURL:v28 capabilities:v47 error:&v190];
                  id v49 = v190;
                  if ((v48 & 1) == 0)
                  {
                    id v50 = NSString;
                    id v51 = [v181 path];
                    id v52 = [v28 path];
                    id v53 = [v50 stringWithFormat:@"Unable to move \"%@\" to \"%@\": %@", v51, v52, v49];

                    double v54 = (void *)MEMORY[0x1E4F28C58];
                    v222[0] = v162;
                    v222[1] = v161;
                    v223[0] = v53;
                    v223[1] = v49;
                    double v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v223 forKeys:v222 count:2];
                    uint64_t v56 = [v54 errorWithDomain:@"com.apple.photolibraryservices" code:9 userInfo:v55];
                    uint64_t v57 = *(void *)(*(void *)(a1 + 104) + 8);
                    uint64_t v58 = *(void **)(v57 + 40);
                    *(void *)(v57 + 40) = v56;

                    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
                    goto LABEL_96;
                  }
                }
                else
                {
                  id v189 = 0;
                  char v59 = [MEMORY[0x1E4F8B908] copyItemAtURL:v181 toURL:v28 error:&v189];
                  id v49 = v189;
                  if ((v59 & 1) == 0)
                  {
                    int v83 = NSString;
                    id v84 = [v181 path];
                    id v85 = [v28 path];
                    id v86 = [v83 stringWithFormat:@"Unable to copy \"%@\" to \"%@\": %@", v84, v85, v49];

                    v87 = (void *)MEMORY[0x1E4F28C58];
                    v220[0] = v162;
                    v220[1] = v161;
                    v221[0] = v86;
                    v221[1] = v49;
                    v88 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v221 forKeys:v220 count:2];
                    uint64_t v89 = [v87 errorWithDomain:@"com.apple.photolibraryservices" code:9 userInfo:v88];
                    uint64_t v90 = *(void *)(*(void *)(a1 + 104) + 8);
                    id v91 = *(void **)(v90 + 40);
                    *(void *)(v90 + 40) = v89;

                    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
                    goto LABEL_96;
                  }
                }

                goto LABEL_52;
              }
              id v39 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v28;
                _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "Original is a slow-mo, flatten the video to %@", buf, 0xCu);
              }

              id v40 = v156;
              dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              LOBYTE(v225) = 0;
              id v42 = +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:v17 applyVideoAdjustments:1];
              v195[0] = MEMORY[0x1E4F143A8];
              v195[1] = 3221225472;
              v195[2] = __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_595;
              v195[3] = &unk_1E586E6D0;
              id v196 = v181;
              id v43 = v28;
              id v197 = v43;
              long long v199 = *(_OWORD *)(a1 + 104);
              v200 = buf;
              id v44 = v41;
              v198 = v44;
              long long v193 = *MEMORY[0x1E4F1FA48];
              uint64_t v194 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
              long long v191 = v193;
              uint64_t v192 = v194;
              +[PLVideoTranscoder transcodeVideoWithObjectBuilder:v42 outputURL:v43 startTime:&v193 endTime:&v191 presetName:v40 outputFileType:v155 metadata:0 completionHandler:v195];
              dispatch_semaphore_wait(v44, 0xFFFFFFFFFFFFFFFFLL);
              BOOL v45 = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;

              _Block_object_dispose(buf, 8);
              if (v45)
              {
LABEL_52:
                BOOL v60 = v167;
                if (!v173) {
                  BOOL v60 = 0;
                }
                if (v60)
                {
                  char v61 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v180;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v173;
                    _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_DEFAULT, "Moving video complement from %@ to %@, for an in-place video complement creation later", buf, 0x16u);
                  }

                  uint64_t v62 = *(void *)(a1 + 88);
                  id v188 = 0;
                  int v63 = [MEMORY[0x1E4F8B908] secureMoveItemAtURL:v180 toURL:v173 capabilities:v62 error:&v188];
                  id v64 = v188;
                  if (v63)
                  {
                    id v65 = v173;

                    v180 = v65;
                    uint64_t v66 = 2;
                    goto LABEL_60;
                  }
                  uint64_t v104 = NSString;
                  id v105 = [v180 path];
                  long long v106 = [v173 path];
                  v107 = [v104 stringWithFormat:@"Unable to move \"%@\" to \"%@\": %@", v105, v106, v64];

                  uint64_t v108 = (void *)MEMORY[0x1E4F28C58];
                  v218[0] = v162;
                  v218[1] = v161;
                  v219[0] = v107;
                  v219[1] = v64;
                  uint64_t v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v219 forKeys:v218 count:2];
                  uint64_t v110 = [v108 errorWithDomain:@"com.apple.photolibraryservices" code:9 userInfo:v109];
                  uint64_t v111 = *(void *)(*(void *)(a1 + 104) + 8);
                  id v112 = *(void **)(v111 + 40);
                  *(void *)(v111 + 40) = v110;

                  *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
                  goto LABEL_96;
                }
                uint64_t v66 = 0;
LABEL_60:
                if (v174)
                {
                  id v67 = [MEMORY[0x1E4F28CB8] defaultManager];
                  id v187 = 0;
                  [v67 removeItemAtURL:v174 error:&v187];
                  id v68 = v187;

                  if (v68)
                  {
                    id v69 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v174;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v68;
                      _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_DEFAULT, "Unable to opportunistically clean up temporary directory: \"%@\" Error: %@", buf, 0x16u);
                    }
                  }
                }
                *(void *)&long long v193 = 0;
                uint64_t v70 = *(void *)(a1 + 32);
                uint64_t v71 = [MEMORY[0x1E4F8BA10] savedAssetTypeForCloudSharedAsset];
                id v186 = 0;
                uint64_t v72 = +[PLManagedAsset insertAssetIntoPhotoLibrary:v70 mainFileURL:v28 savedAssetType:v71 bundleScope:2 uuid:v176 replacementUUID:0 imageSource:&v193 imageData:&v186];
                id v73 = v186;
                v74 = +[PLPhotoSharingHelper photoSharingOriginalFilenameForAsset:v17];
                [v72 setOriginalFilename:v74];

                if (v72)
                {
                  if ([v72 isVideo])
                  {
                    id v185 = 0;
                    char v75 = [v72 isPlayableVideo:&v185];
                    id v76 = v185;
                    v175 = v76;
                    if ((v75 & 1) == 0)
                    {
                      id v77 = [NSString stringWithFormat:@"Can't play new asset for file at %@, with codec: %@", v28, v76];
                      uint64_t v78 = (void *)MEMORY[0x1E4F28C58];
                      uint64_t v214 = v162;
                      v215 = v77;
                      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
                      uint64_t v80 = [v78 errorWithDomain:@"com.apple.photolibraryservices" code:10 userInfo:v79];
                      uint64_t v81 = *(void *)(*(void *)(a1 + 104) + 8);
                      double v82 = *(void **)(v81 + 40);
                      *(void *)(v81 + 40) = v80;

                      *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
LABEL_95:

                      v174 = 0;
                      goto LABEL_96;
                    }
                  }
                  else
                  {
                    v175 = 0;
                  }
                  [v72 setVisibilityState:2];
                  v113 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v16;
                    _os_log_impl(&dword_19B3C7000, v113, OS_LOG_TYPE_DEFAULT, "Generating new thumbnails for asset with UUID %@", buf, 0xCu);
                  }

                  [v72 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:(void)v193 imageData:v73 forceSRGBConversion:1];
                  uint64_t v114 = [MEMORY[0x1E4F8BA08] UUIDString];
                  uint64_t v115 = [v17 additionalAttributes];
                  uint64_t v116 = [v115 originalFilename];
                  v117 = [v72 additionalAttributes];
                  [v117 setOriginalFilename:v116];

                  [v72 setCloudAssetGUID:v114];
                  [v72 setCloudBatchID:v159];
                  [v72 setCloudBatchPublishDate:v160];
                  [v72 setCloudPlaceholderKind:5];
                  [v72 setCloudIsMyAsset:1];
                  [v72 setCloudIsDeletable:1];
                  [v72 setPlaybackVariationAndLoopingPlaybackStyleWithPlaybackVariation:v166];
                  if ((v38 & 1) == 0)
                  {
                    uint64_t v118 = [v17 uuid];
                    [v72 setOriginalAssetsUUID:v118];

                    uint64_t v119 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v120 = [v72 originalAssetsUUID];
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v120;
                      _os_log_impl(&dword_19B3C7000, v119, OS_LOG_TYPE_DEFAULT, "Saved original video uuid %@ for later playback", buf, 0xCu);
                    }
                  }
                  if (v180)
                  {
                    uint64_t v121 = [v17 mediaGroupUUID];
                    [v17 photoIrisVideoDuration];
                    [v17 photoIrisStillDisplayTime];
                    [v72 becomePhotoIrisWithMediaGroupUUID:v121 mainFileMetadata:0 videoURL:v180 videoDuration:v184 stillDisplayTime:v183 options:v66];
                  }
                  [v158 addObject:v72];
                  v122 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v123 = [v28 path];
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v181;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v123;
                    *(_WORD *)&buf[22] = 2112;
                    v225 = v114;
                    _os_log_impl(&dword_19B3C7000, v122, OS_LOG_TYPE_DEFAULT, "Created copy of original asset at %@ to %@ and assigned it new cloudAssetGUID %@", buf, 0x20u);
                  }
                  [*(id *)(a1 + 96) addObject:v72];
                  if (v157 && !*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40))
                  {
                    uint64_t v124 = +[PLCloudSharedComment insertNewCommentIntoAsset:v72 commentDate:0 withText:*(void *)(a1 + 56) isLike:0 isMyComment:1 inLibrary:*(void *)(a1 + 32)];
                    uint64_t v125 = *(void *)(*(void *)(a1 + 120) + 8);
                    id v126 = *(void **)(v125 + 40);
                    *(void *)(v125 + 40) = v124;

                    v127 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
                    v128 = [NSNumber numberWithBool:1];
                    [v127 setIsCaption:v128];

                    v129 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
                    v130 = [NSNumber numberWithBool:1];
                    [v129 setIsBatchComment:v130];
                  }
                  +[PLResourceInstaller installInternalResourcesForExistingAsset:v72 assumeNoExistingResources:1 referencedResourceURLs:0 error:0];

                  goto LABEL_95;
                }
                v175 = [NSString stringWithFormat:@"Couldn't insert new asset for file at %@", v28];
                uint64_t v99 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v216 = v162;
                v217 = v175;
                uint64_t v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v217 forKeys:&v216 count:1];
                uint64_t v101 = [v99 errorWithDomain:@"com.apple.photolibraryservices" code:10 userInfo:v100];
                uint64_t v102 = *(void *)(*(void *)(a1 + 104) + 8);
                long long v103 = *(void **)(v102 + 40);
                *(void *)(v102 + 40) = v101;

                *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
                goto LABEL_95;
              }
LABEL_96:

              uint64_t v98 = v174;
LABEL_97:

              goto LABEL_98;
            }
            if (v171)
            {
              id v23 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
              id v35 = *(void **)(a1 + 128);
              id v203 = 0;
              id v202 = 0;
              int v36 = [v35 _retrieveURLsFromAssetWithUUID:v16 withExportedFileURL:v23 primaryURL:&v203 videoComplementURL:&v202];
              id v181 = v203;
              id v37 = v202;
              if (v36)
              {
                v180 = v37;
                BOOL v167 = v37 != 0;
                v174 = [v23 URLByDeletingLastPathComponent];
                goto LABEL_28;
              }
              id v97 = v37;

              uint64_t v98 = v181;
              goto LABEL_97;
            }
            int v92 = [v17 isLoopingVideo];
            if (v92)
            {
              v93 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = v166;
                _os_log_impl(&dword_19B3C7000, v93, OS_LOG_TYPE_DEFAULT, "Sharing looping video with playback variation %ld", buf, 0xCu);
              }

              if (v18)
              {
                id v23 = [v17 pathForVideoFile];
                id v94 = PLPhotoSharingGetLog();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v23;
                  id v95 = v94;
                  id v96 = "Original is a looping video, use the original file %@";
                  goto LABEL_113;
                }
LABEL_114:

                if (v23)
                {
                  id v181 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23 isDirectory:0];
                  if ([v17 canPlayPhotoIris]
                    && ([v17 uuid],
                        id v133 = objc_claimAutoreleasedReturnValue(),
                        int v134 = [v154 containsObject:v133],
                        v133,
                        ((v92 | v134) & 1) == 0))
                  {
                    v180 = [*(id *)(a1 + 128) _videoComplementURLForSharingFromAsset:v17];
                  }
                  else
                  {
                    v180 = 0;
                  }
                  v174 = 0;
                  BOOL v167 = 0;
                  int v24 = 0;
                  goto LABEL_29;
                }
                uint64_t v98 = [NSString stringWithFormat:@"No local file path on disk to support sharing asset %@", v16];
                id v135 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v226 = v162;
                v227 = v98;
                long long v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v227 forKeys:&v226 count:1];
                uint64_t v137 = [v135 errorWithDomain:@"com.apple.photolibraryservices" code:7 userInfo:v136];
                uint64_t v138 = *(void *)(*(void *)(a1 + 104) + 8);
                long long v139 = *(void **)(v138 + 40);
                *(void *)(v138 + 40) = v137;

                *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
                goto LABEL_97;
              }
              id v23 = [v17 pathForFullsizeRenderVideoFile];
              id v94 = PLPhotoSharingGetLog();
              if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_114;
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v23;
              id v95 = v94;
              id v96 = "Original is a regular photo, use the full size render video file %@";
            }
            else if (v18)
            {
              if ([v17 isPlayableVideo:0])
              {
                if ([v17 isCloudSharedAsset]) {
                  [v17 cloudSharedAssetPathForPlaceholderKind:9];
                }
                else {
                uint64_t v131 = [v17 pathForVideoFile];
                }
              }
              else
              {
                uint64_t v131 = [v17 pathForMediumVideoFile];
              }
              id v23 = v131;
              id v94 = PLPhotoSharingGetLog();
              if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_114;
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v23;
              id v95 = v94;
              id v96 = "Original is a video, use the video file %@";
            }
            else
            {
              id v201 = 0;
              id v132 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:v17 format:0 allowMetadataSnapshot:0 forceLarge:1 outFilePath:&v201 outImageType:0];
              id v23 = v201;
              id v94 = PLPhotoSharingGetLog();
              if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_114;
              }
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v23;
              id v95 = v94;
              id v96 = "Original is not a video, use the large displayable image file %@";
            }
LABEL_113:
            _os_log_impl(&dword_19B3C7000, v95, OS_LOG_TYPE_DEFAULT, v96, buf, 0xCu);
            goto LABEL_114;
          }
LABEL_98:

          uint64_t v14 = v177 + 1;
        }
        while (v169 != v177 + 1);
        uint64_t v140 = [v164 countByEnumeratingWithState:&v204 objects:v228 count:16];
        uint64_t v169 = v140;
      }
      while (v140);
    }

    [*(id *)(a1 + 40) updateCloudLastInterestingChangeDateWithDate:v160];
    [*(id *)(a1 + 40) updateCloudLastContributionDateWithDate:v160];
  }
  else
  {
    v141 = NSString;
    v142 = [0 cloudGUID];
    __int16 v143 = [v141 stringWithFormat:@"Couldn't find album with cloud GUID %@ to publish assets from", v142];

    id v144 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v230 = *MEMORY[0x1E4F28228];
    v231 = v143;
    __int16 v145 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v231 forKeys:&v230 count:1];
    uint64_t v146 = [v144 errorWithDomain:@"com.apple.photolibraryservices" code:6 userInfo:v145];
    uint64_t v147 = *(void *)(*(void *)(a1 + 104) + 8);
    id v148 = *(void **)(v147 + 40);
    *(void *)(v147 + 40) = v146;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
  }
}

uint64_t __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_616(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 40) isUnitTesting];
    if ((result & 1) == 0)
    {
      uint64_t result = [*(id *)(a1 + 64) enqueueCloudSharedAssetsForPublishToServer:*(void *)(a1 + 32) inSharedAlbum:*(void *)(a1 + 48)];
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
      {
        id v3 = *(void **)(a1 + 64);
        return objc_msgSend(v3, "publishCloudSharedCommentToServer:");
      }
    }
  }
  return result;
}

void __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_582(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = [a3 objectForKeyedSubscript:@"useStillImageOnly"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __177__PLPhotoSharingHelper_prepareToEnqueueBatchOfOriginalAssetUUIDs_withBatchCommentText_assetsSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_sharedAlbum_isNewAlbum_error___block_invoke_595(uint64_t a1, uint64_t a2, void *a3)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = NSString;
    int v6 = [*(id *)(a1 + 32) path];
    id v7 = [*(id *)(a1 + 40) path];
    int v8 = [v5 stringWithFormat:@"Could not generate trimmed video for %@ to %@ error %@", v6, v7, v4];

    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v21[0] = *MEMORY[0x1E4F28228];
    v21[1] = v10;
    v22[0] = v8;
    v22[1] = v4;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v12 = [v9 errorWithDomain:@"com.apple.photolibraryservices" code:8 userInfo:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    int v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [*(id *)(a1 + 32) path];
      uint64_t v16 = [*(id *)(a1 + 40) path];
      *(_DWORD *)buf = 138412546;
      int v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "generated trimmed video of %@ to %@ ", buf, 0x16u);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (id)photoSharingOriginalFilenameForAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 originalFilename];
  char v5 = [v3 isVideo];

  if ((v5 & 1) == 0)
  {
    int v6 = [v4 stringByDeletingPathExtension];
    if ([v6 length])
    {
      uint64_t v7 = [v6 stringByAppendingPathExtension:@"JPG"];

      id v4 = (void *)v7;
    }
  }
  return v4;
}

+ (void)updateCloudSharedAlbumMultipleContributorsStateOnServer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 cloudGUID];
  int v6 = [v4 cloudMultipleContributorsEnabledLocal];
  uint64_t v7 = [v6 BOOLValue];

  int v8 = [v4 cloudMultipleContributorsEnabled];
  int v9 = [v8 BOOLValue];

  uint64_t v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v4 cloudGUID];
    uint64_t v12 = [v4 title];
    *(_DWORD *)buf = 138413058;
    *(void *)id v22 = v11;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v12;
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v7;
    __int16 v23 = 1024;
    int v24 = v9;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "updateCloudSharedAlbumMultipleContributorsStateOnServer:(%@ guid %@ requestedEnabledValue %i previousEnabledValue %i)", buf, 0x22u);
  }
  uint64_t v13 = [a1 sharingPersonID];
  uint64_t v14 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)id v22 = v7;
    *(_WORD *)&void v22[4] = 2112;
    *(void *)&v22[6] = v5;
    *(_WORD *)&v22[14] = 2112;
    *(void *)&v22[16] = v13;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, " about to call connection setMultipleContributorsEnabled:%i forAlbumWithGUID:%@ personID:%@", buf, 0x1Cu);
  }

  uint64_t v15 = [MEMORY[0x1E4F77A58] sharedConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__PLPhotoSharingHelper_updateCloudSharedAlbumMultipleContributorsStateOnServer___block_invoke;
  v17[3] = &unk_1E586E6A8;
  char v19 = v7;
  char v20 = v9;
  id v18 = v4;
  id v16 = v4;
  [v15 setMultipleContributorsEnabled:v7 forAlbumWithGUID:v5 personID:v13 completionBlock:v17];
}

void __80__PLPhotoSharingHelper_updateCloudSharedAlbumMultipleContributorsStateOnServer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "setMultipleContributorsEnabled completionBlock error:%@", buf, 0xCu);
  }

  char v5 = (char *)(a1 + 40);
  if (v3)
  {
    int v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *v5;
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "ERROR: couldn't set multipleContributors to %i", buf, 8u);
    }

    char v5 = (char *)(a1 + 41);
  }
  char v8 = *v5;
  int v9 = [*(id *)(a1 + 32) photoLibrary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PLPhotoSharingHelper_updateCloudSharedAlbumMultipleContributorsStateOnServer___block_invoke_564;
  v10[3] = &unk_1E58748B0;
  id v11 = *(id *)(a1 + 32);
  char v12 = v8;
  [v9 performTransaction:v10 completionHandler:&__block_literal_global_566];
}

void __80__PLPhotoSharingHelper_updateCloudSharedAlbumMultipleContributorsStateOnServer___block_invoke_564(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v2 setCloudMultipleContributorsEnabled:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v4 setCloudMultipleContributorsEnabledLocal:v5];
}

+ (void)updateCloudSharedAlbumPublicURLStateOnServer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 cloudGUID];
  int v6 = [v4 cloudPublicURLEnabledLocal];
  uint64_t v7 = [v6 BOOLValue];

  char v8 = [v4 cloudPublicURLEnabled];
  int v9 = [v8 BOOLValue];

  uint64_t v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v4 cloudGUID];
    char v12 = [v4 title];
    *(_DWORD *)buf = 138413058;
    *(void *)id v22 = v11;
    *(_WORD *)&v22[8] = 2112;
    *(void *)&v22[10] = v12;
    *(_WORD *)&v22[18] = 1024;
    *(_DWORD *)&v22[20] = v7;
    __int16 v23 = 1024;
    int v24 = v9;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "updateCloudSharedAlbumPublicURLStateOnServer:(%@ guid %@ requestedEnabledValue %i previousEnabledValue %i)", buf, 0x22u);
  }
  uint64_t v13 = [a1 sharingPersonID];
  id v14 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)id v22 = v7;
    *(_WORD *)&void v22[4] = 2112;
    *(void *)&v22[6] = v5;
    *(_WORD *)&v22[14] = 2112;
    *(void *)&v22[16] = v13;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, " about to call connection setPublicAccessEnabled:%i forAlbumWithGUID:%@ personID:%@", buf, 0x1Cu);
  }

  uint64_t v15 = [MEMORY[0x1E4F77A58] sharedConnection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__PLPhotoSharingHelper_updateCloudSharedAlbumPublicURLStateOnServer___block_invoke;
  v17[3] = &unk_1E586E6A8;
  char v19 = v7;
  char v20 = v9;
  id v18 = v4;
  id v16 = v4;
  [v15 setPublicAccessEnabled:v7 forAlbumWithGUID:v5 personID:v13 completionBlock:v17];
}

void __69__PLPhotoSharingHelper_updateCloudSharedAlbumPublicURLStateOnServer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "setPublicAccessEnabled completionBlock error:%@", buf, 0xCu);
  }

  id v5 = (char *)(a1 + 40);
  if (v3)
  {
    int v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = *v5;
      *(_DWORD *)buf = 67109120;
      LODWORD(v14) = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "ERROR: couldn't set publicAccess to %i", buf, 8u);
    }

    id v5 = (char *)(a1 + 41);
  }
  char v8 = *v5;
  int v9 = [*(id *)(a1 + 32) photoLibrary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PLPhotoSharingHelper_updateCloudSharedAlbumPublicURLStateOnServer___block_invoke_560;
  v10[3] = &unk_1E58748B0;
  id v11 = *(id *)(a1 + 32);
  char v12 = v8;
  [v9 performTransaction:v10 completionHandler:&__block_literal_global_562];
}

void __69__PLPhotoSharingHelper_updateCloudSharedAlbumPublicURLStateOnServer___block_invoke_560(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v2 setCloudPublicURLEnabled:v3];

  id v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v4 setCloudPublicURLEnabledLocal:v5];
}

+ (void)updateCloudSharedAlbumMetadataOnServer:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = objc_opt_class();
    id v8 = v7;
    int v9 = NSStringFromSelector(a2);
    int v18 = 138412802;
    id v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = v9;
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v18, 0x20u);
  }
  if ([v5 kindValue] == 1505)
  {
    uint64_t v10 = [a1 sharingPersonID];
    id v11 = [MEMORY[0x1E4F5C360] album];
    char v12 = [v5 cloudGUID];
    [v11 setGUID:v12];

    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = [v5 title];
    uint64_t v15 = [v13 dictionaryWithObject:v14 forKey:*MEMORY[0x1E4F5C3D0]];
    [v11 setMetadata:v15];

    id v16 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412546;
      id v19 = v11;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, " about to call connection modifyAlbumMetadata:%@ personID:%@", (uint8_t *)&v18, 0x16u);
    }

    id v17 = [MEMORY[0x1E4F77A58] sharedConnection];
    [v17 modifyAlbumMetadata:v11 personID:v10];
  }
  else
  {
    uint64_t v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Error, album not a shared album %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

+ (void)deleteCloudSharedAlbumFromServer:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = objc_opt_class();
    id v8 = v7;
    int v9 = NSStringFromSelector(a2);
    int v15 = 138412802;
    id v16 = v7;
    __int16 v17 = 2112;
    int v18 = v9;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v15, 0x20u);
  }
  if ([v5 kindValue] == 1505)
  {
    uint64_t v10 = [a1 sharingPersonID];
    id v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      char v12 = [v5 cloudGUID];
      int v15 = 138412546;
      id v16 = v12;
      __int16 v17 = 2112;
      int v18 = v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, " about to call connection deleteAlbumWithGUID:%@ personID:%@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x1E4F77A58] sharedConnection];
    id v14 = [v5 cloudGUID];
    [v13 deleteAlbumWithGUID:v14 personID:v10];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1 _userDidDeleteSharedAlbum:v5];
    }
  }
  else
  {
    uint64_t v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Error, album not a shared album %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

+ (void)_userDidDeleteSharedAlbum:(id)a3
{
  id v5 = a3;
  if (PLIsAssetsd())
  {
    uint64_t v3 = [v5 uuid];

    if (v3)
    {
      id v4 = +[PLNotificationManager sharedManager];
      [v4 noteUserDidDeleteSharedAlbumWithUUID:v3];

      id v5 = (id)v3;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    +[PLUserActivityDaemonJob userDidDeleteSharedAlbum:v5];
  }
}

+ (void)publishCloudSharedAlbumToServer:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = objc_opt_class();
    id v8 = v7;
    int v9 = NSStringFromSelector(a2);
    int v24 = 138412802;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v24, 0x20u);
  }
  if ([v5 kindValue] == 1505)
  {
    uint64_t v10 = [a1 sharingPersonID];
    id v11 = [MEMORY[0x1E4F5C360] album];
    char v12 = [v5 cloudGUID];
    [v11 setGUID:v12];

    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    id v14 = [v5 title];
    int v15 = [v13 dictionaryWithObject:v14 forKey:*MEMORY[0x1E4F5C3D0]];
    [v11 setMetadata:v15];

    id v16 = [v5 cloudPublicURLEnabledLocal];
    LODWORD(v14) = [v16 BOOLValue];

    if (v14) {
      [v11 setMetadataValue:@"1" forKey:*MEMORY[0x1E4F5C3C8]];
    }
    __int16 v17 = [v5 cloudMultipleContributorsEnabledLocal];
    int v18 = [v17 BOOLValue];

    if (v18) {
      [v11 setMetadataValue:@"1" forKey:*MEMORY[0x1E4F5C3B0]];
    }
    __int16 v19 = [MEMORY[0x1E4F1C9C8] date];
    [v11 setMetadataValue:v19 forKey:*MEMORY[0x1E4F5C3B8]];

    id v20 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412546;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v10;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, " about to call connection addAlbum:%@ forPersonID:%@", (uint8_t *)&v24, 0x16u);
    }

    uint64_t v21 = [MEMORY[0x1E4F77A58] sharedConnection];
    [v21 addAlbum:v11 personID:v10];
    __int16 v22 = [v5 title];
    id v23 = [v5 cloudGUID];
    [a1 writeAlbumNameBreadCrumb:v22 forAlbumGUID:v23 isUpload:1];
  }
  else
  {
    uint64_t v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412290;
      id v25 = v5;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Error, album not a shared album %@", (uint8_t *)&v24, 0xCu);
    }
  }
}

+ (void)deleteLocalAlbumsForMSASAlbumsWithGUID:(id)a3 inviterAddress:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "will call +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumsWithGUID:inviterAddress] with albumGUID %@ inviterAddress %@", (uint8_t *)&v8, 0x16u);
  }

  +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumForMSASAlbumGUID:v5 inviterAddress:v6];
}

+ (void)deleteLocalAlbumsForMSASAlbumsWithGUIDs:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "will call +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs] with albumGUIDS %@", (uint8_t *)&v5, 0xCu);
  }

  +[PLCloudSharedDeleteAlbumsJob deleteLocalAlbumsForMSASAlbumGUIDs:v3];
}

+ (void)resetAllLocalState
{
  uint64_t v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_INFO, "will call +[PLCloudSharingResetJob resetAllLocalState]", v3, 2u);
  }

  +[PLCloudSharingResetJob resetAllLocalState];
}

+ (void)updateLocalAlbumMetadataForMSASAlbum:(id)a3 info:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v56 = (id)objc_opt_class();
    __int16 v57 = 2112;
    id v58 = v6;
    __int16 v59 = 2112;
    id v60 = v7;
    id v9 = v56;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "%@ updateLocalAlbumMetadataForMSASAlbum %@ info %@", buf, 0x20u);
  }
  __int16 v10 = [v6 metadata];
  id v11 = [v10 objectForKey:*MEMORY[0x1E4F5C3D0]];

  if (v11)
  {
    uint64_t v12 = [v6 metadata];
    uint64_t v13 = [v12 objectForKey:*MEMORY[0x1E4F5C3C0]];

    uint64_t v14 = [v6 ownerEmail];
    int v15 = (void *)v14;
    if (v13) {
      id v16 = v13;
    }
    else {
      id v16 = (void *)v14;
    }
    id v17 = v16;
    if (v17)
    {
      int v18 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v56 = v17;
        _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Checking blocked state for inviter %@.", buf, 0xCu);
      }

      CMFItemFromString = (const void *)CreateCMFItemFromString();
      int IsItemBlocked = CMFBlockListIsItemBlocked();
      CFRelease(CMFItemFromString);
      uint64_t v21 = PLPhotoSharingGetLog();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (IsItemBlocked)
      {
        if (v22)
        {
          *(_DWORD *)buf = 138412290;
          id v56 = v17;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring: Not calling updateSharedAlbumMetadata as inviter %@ is blocked.", buf, 0xCu);
        }
LABEL_52:

        goto LABEL_53;
      }
      if (v22)
      {
        *(_DWORD *)buf = 138412290;
        id v56 = v17;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "inviter %@ is not blocked.", buf, 0xCu);
      }
    }
    id v50 = v17;
    id v23 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v21 = v23;
    if (v7) {
      [v23 setObject:v7 forKey:@"mstreamd-info"];
    }
    int v24 = [v6 GUID];

    if (v24)
    {
      id v25 = [v6 GUID];
      [v21 setObject:v25 forKey:@"album-guid"];
    }
    [v6 metadata];
    v54 = id v53 = v15;
    if (v54)
    {
      [v21 setObject:v54 forKey:@"album-metadata"];
      [v21 setObject:v11 forKey:@"album-name"];
      __int16 v26 = [v6 GUID];
      [a1 writeAlbumNameBreadCrumb:v11 forAlbumGUID:v26 isUpload:0];

      id v27 = [v54 objectForKey:*MEMORY[0x1E4F5C3C8]];
      __int16 v28 = v27;
      if (v27)
      {
        uint64_t v29 = [v27 isEqualToString:@"1"];
        uint64_t v30 = [NSNumber numberWithBool:v29];
        [v21 setObject:v30 forKey:@"album-isPublic"];

        if (v29)
        {
          id v31 = [v6 publicURLString];
          if (v31) {
            [v21 setObject:v31 forKey:@"album-publicURLString"];
          }
        }
      }
      id v32 = [v54 objectForKey:*MEMORY[0x1E4F5C3B0]];
      id v33 = v32;
      if (v32)
      {
        uint64_t v34 = [v32 isEqualToString:@"1"];
        id v35 = [NSNumber numberWithBool:v34];
        [v21 setObject:v35 forKey:@"album-allowsMultipleContributors"];
      }
      int v36 = [v54 objectForKey:*MEMORY[0x1E4F5C3B8]];
      if (v36) {
        [v21 setObject:v36 forKey:@"album-creationDate"];
      }

      int v15 = v53;
    }
    id v51 = v11;
    id v37 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v6, "relationshipState"));
    [v21 setObject:v37 forKey:@"album-relationshipState"];

    int v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isFamilySharedAlbum"));
    [v21 setObject:v38 forKey:@"album-isFamilySharedAlbum"];

    id v39 = [MEMORY[0x1E4F1CA60] dictionary];
    id v40 = v39;
    if (v15) {
      [v39 setObject:v15 forKey:@"kPLAlbumOwnerEmailKey"];
    }
    dispatch_semaphore_t v41 = [v6 ownerFirstName];
    if (v41) {
      [v40 setObject:v41 forKey:@"kPLAlbumOwnerFirstNameKey"];
    }
    id v42 = [v6 ownerLastName];
    if (v42) {
      [v40 setObject:v42 forKey:@"kPLAlbumOwnerLastNameKey"];
    }
    id v43 = [v6 ownerFullName];
    if (v43) {
      [v40 setObject:v43 forKey:@"kPLAlbumOwnerFullNameKey"];
    }
    id v52 = v7;
    id v44 = [v6 ownerPersonID];
    if (v44) {
      [v40 setObject:v44 forKey:@"kPLAlbumOwnerHashedPersonIDKey"];
    }
    uint64_t v45 = [v6 ownerIsWhitelisted];
    id v46 = [NSNumber numberWithBool:v45];
    [v40 setObject:v46 forKey:@"kPLAlbumOwnerIsWhitelistedKey"];

    uint64_t v47 = [v6 subscriptionDate];
    if (v47) {
      [v40 setObject:v47 forKey:@"kPLAlbumOwnerSubscriptionDateKey"];
    }
    if (v40) {
      [v21 setObject:v40 forKey:@"kPLAlbumOwnerDictionaryKey"];
    }
    if (+[PLPhotoSharingHelper debugAutoAcceptInvitation])
    {
      char v48 = [NSNumber numberWithBool:1];
      [v21 setObject:v48 forKey:@"album-autoAcceptInvitation"];
    }
    id v49 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v56 = v21;
      _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_INFO, "about to call updateSharedAlbumMetadata with arguments %@", buf, 0xCu);
    }

    +[PLCloudSharedUpdateAlbumMetadataJob updateAlbumMetadata:v21];
    id v11 = v51;
    id v7 = v52;
    int v15 = v53;
    id v17 = v50;
    goto LABEL_52;
  }
  uint64_t v13 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Ignoring: Not calling updateSharedAlbumMetadata as we don't yet have an album name.", buf, 2u);
  }
LABEL_53:
}

+ (id)_localizationKeyForAssets:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "count", 0, 0);
  int v5 = [MEMORY[0x1E4F1CAA0] orderedSetWithSet:v3];

  PLAssetCountsByType();
  if (v4 == 1)
  {
    id v6 = @"PHOTO";
    id v7 = @"VIDEO";
    BOOL v8 = 0;
  }
  else
  {
    id v6 = @"ITEMS";
    id v7 = @"PHOTOS";
    BOOL v8 = v4 == 0;
  }
  if (v8) {
    return v7;
  }
  else {
    return v6;
  }
}

+ (BOOL)canSetUserCloudSharedLiked:(BOOL)a3 forAssets:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v6)
  {
    unint64_t v9 = +[PLPhotoSharingHelper maxCommentsPerAsset];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v10 = v8;
    id v11 = (void *)[v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v24 + 1) + 8 * i) totalCommentsCount] >= v9)
          {
            int v15 = [a1 _localizationKeyForAssets:v10];
            id v16 = [NSString stringWithFormat:@"CANNOT_LIKE_%@_ERROR_DESCRIPTION", v15];
            id v17 = PLServicesLocalizedFrameworkString();

            int v18 = [NSString stringWithFormat:@"CANNOT_LIKE_%@_LIMIT_REACHED_DESCRIPTION", v15];
            __int16 v19 = PLServicesLocalizedFrameworkString();

            id v20 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v21 = *MEMORY[0x1E4F28588];
            v28[0] = *MEMORY[0x1E4F28568];
            v28[1] = v21;
            v29[0] = v17;
            v29[1] = v19;
            BOOL v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
            id v11 = [v20 errorWithDomain:@"com.apple.photolibraryservices" code:3 userInfo:v22];

            BOOL v14 = 0;
            goto LABEL_13;
          }
        }
        id v11 = (void *)[v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 1;
LABEL_13:

    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

+ (BOOL)canAcceptPendingInvitationForAlbum:(id)a3 error:(id *)a4
{
  void v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = v5;
  if (v5) {
    [v5 photoLibrary];
  }
  else {
  id v7 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
  }
  BOOL v8 = +[PLPhotoSharingHelper hasReachedLimitOfSubscribedStreamsInLibrary:v7];
  if (!v8)
  {
    uint64_t v12 = 0;
    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  unint64_t v9 = [v6 localizedTitle];
  if ([v9 length])
  {
    id v10 = PLServicesLocalizedFrameworkString();
    id v11 = PFStringWithValidatedFormat();
  }
  else
  {
    id v11 = PLServicesLocalizedFrameworkString();
  }
  uint64_t v13 = PLServicesLocalizedFrameworkString();
  int64_t v19 = +[PLPhotoSharingHelper maxSubscribedStreams];
  BOOL v14 = PFStringWithValidatedFormat();

  int v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v16 = *MEMORY[0x1E4F28588];
  v20[0] = *MEMORY[0x1E4F28568];
  v20[1] = v16;
  v21[0] = v11;
  v21[1] = v14;
  id v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 2, v19);
  uint64_t v12 = [v15 errorWithDomain:@"com.apple.photolibraryservices" code:4 userInfo:v17];

  if (a4) {
LABEL_11:
  }
    *a4 = v12;
LABEL_12:

  return !v8;
}

+ (BOOL)canCreateStreamInPhotoLibrary:(id)a3 error:(id *)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (+[PLPhotoSharingHelper _isUserLoggedIntoiCloud])
  {
    id v7 = [v6 pathManager];
    BOOL v8 = [v7 libraryURL];
    char v9 = [a1 sharedStreamsEnabledForPhotoLibraryURL:v8];

    if (v9)
    {
      if (![a1 hasReachedLimitOfOwnedStreamsInLibrary:v6])
      {
        BOOL v22 = 0;
        BOOL v23 = 1;
        if (!a4) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
      id v10 = PLServicesLocalizedFrameworkString();
      id v11 = PLServicesLocalizedFrameworkString();
      int64_t v25 = +[PLPhotoSharingHelper maxOwnedStreams];
      uint64_t v12 = PFStringWithValidatedFormat();

      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28588];
      v26[0] = *MEMORY[0x1E4F28568];
      v26[1] = v14;
      v27[0] = v10;
      v27[1] = v12;
      int v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 2, v25);
      uint64_t v16 = v13;
      uint64_t v17 = 2;
    }
    else
    {
      id v10 = PLServicesLocalizedFrameworkString();
      uint64_t v12 = PLServicesLocalizedFrameworkString();
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28588];
      v28[0] = *MEMORY[0x1E4F28568];
      v28[1] = v21;
      v29[0] = v10;
      v29[1] = v12;
      int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      uint64_t v16 = v20;
      uint64_t v17 = 1;
    }
  }
  else
  {
    id v10 = PLServicesLocalizedFrameworkString();
    uint64_t v12 = PLServicesLocalizedFrameworkString();
    int v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28588];
    v30[0] = *MEMORY[0x1E4F28568];
    v30[1] = v19;
    v31[0] = v10;
    v31[1] = v12;
    int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    uint64_t v16 = v18;
    uint64_t v17 = 0;
  }
  BOOL v22 = [v16 errorWithDomain:@"com.apple.photolibraryservices" code:v17 userInfo:v15];

  BOOL v23 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v22;
LABEL_9:

  return v23;
}

+ (BOOL)_isUserLoggedIntoiCloud
{
  uint64_t v2 = +[PLAccountStore pl_sharedAccountStore];
  id v3 = [v2 cachedPrimaryAppleAccount];

  LOBYTE(v2) = [v3 isAuthenticated];
  return (char)v2;
}

+ (BOOL)hasReachedLimitOfSubscribedStreamsInLibrary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [a1 maxSubscribedStreams];
  id v6 = [v4 albumListForContentMode:1];
  id v7 = [v6 albums];
  unint64_t v8 = [v7 count];

  if (v8 >= v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = objc_msgSend(v6, "albums", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v16 conformsToProtocol:&unk_1EEC33B20])
          {
            if ([v16 cloudRelationshipStateValue] == 2 && ++v13 >= v5)
            {
              BOOL v9 = 1;
              goto LABEL_15;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 0;
LABEL_15:
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)hasReachedLimitOfOwnedStreamsInLibrary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [a1 maxOwnedStreams];
  id v6 = [v4 albumListForContentMode:1];
  id v7 = [v6 albums];
  unint64_t v8 = [v7 count];

  if (v8 >= v5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = objc_msgSend(v6, "albums", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      unint64_t v13 = 0;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v10);
          }
          v13 += [*(id *)(*((void *)&v17 + 1) + 8 * i) isOwnedCloudSharedAlbum];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    else
    {
      unint64_t v13 = 0;
    }

    BOOL v9 = v13 >= v5;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (int64_t)maxGIFSizeForPublishing
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxGIFSizeInBytes" withDefaultResult:104857600];
}

+ (int64_t)maxVideoLengthForPublishing
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxVideoDurationInSeconds" withDefaultResult:121];
  int64_t v3 = maxVideoLengthForPublishing_debug_max_video_length;
  if (maxVideoLengthForPublishing_debug_max_video_length < 0)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesAppSynchronize(@"com.apple.mobileslideshow");
    maxVideoLengthForPublishing_debug_max_video_length = CFPreferencesGetAppIntegerValue(@"PLDebugSharedVideoMaxLength", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      id v4 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v8 = maxVideoLengthForPublishing_debug_max_video_length;
        _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "using PLDebugSharedVideoMaxLength value of %ld", buf, 0xCu);
      }

      int64_t v3 = maxVideoLengthForPublishing_debug_max_video_length;
    }
    else
    {
      int64_t v3 = 0;
      maxVideoLengthForPublishing_debug_max_video_length = 0;
    }
  }
  if (v3 <= 0) {
    return v2;
  }
  else {
    return v3;
  }
}

+ (int64_t)maxNumThumbnailsToPrefetchPerDay
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxNumThumbnailsToPrefetchPerDay" withDefaultResult:50];
}

+ (int64_t)maxNumDerivativesToPrefetchPerDay
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxNumDerivativesToPrefetchPerDay" withDefaultResult:15];
}

+ (int64_t)maxNumDerivativesToDownloadPerPush
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxNumDerivativesToDownloadPerPush" withDefaultResult:30];
}

+ (int64_t)maxCharactersPerComment
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxnum.charactersPerComment" withDefaultResult:200];
}

+ (int64_t)maxCommentsPerAsset
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxnum.commentsPerPhoto" withDefaultResult:200];
}

+ (int64_t)maxSubscribersPerStream
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxnum.subscribersPerAlbum" withDefaultResult:100];
}

+ (int64_t)maxAssetsPerStream
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxnum.photosPerAlbum" withDefaultResult:1000];
}

+ (int64_t)maxSubscribedStreams
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxnum.subscribedAlbums" withDefaultResult:100];
}

+ (int64_t)maxOwnedStreams
{
  return [a1 _serverLimitValueForKey:@"com.apple.sharedstreams.config.maxnum.ownedAlbums" withDefaultResult:100];
}

+ (CGSize)videoPosterFrameDimension
{
  int64_t v2 = [a1 serverSideConfigurationDictionary];
  int64_t v3 = [v2 objectForKey:@"com.apple.sharedstreams.config.dimensions.videoposterframe"];

  if (v3)
  {
    id v4 = [v3 componentsSeparatedByString:@":"];
    if ([v4 count] == 2)
    {
      unint64_t v5 = [v4 objectAtIndex:0];
      [v5 floatValue];
      float v7 = v6;

      uint64_t v8 = [v4 objectAtIndex:1];
      [v8 floatValue];
      float v10 = v9;

      BOOL v11 = v7 > 0.0;
      BOOL v12 = v10 > 0.0;
      double v13 = v7;
      if (v11 && v12) {
        double v14 = v10;
      }
      else {
        double v14 = 720.0;
      }
      if (v11 && v12) {
        double v15 = v13;
      }
      else {
        double v15 = 1280.0;
      }
    }
    else
    {
      double v15 = 1280.0;
      double v14 = 720.0;
    }
  }
  else
  {
    double v15 = 1280.0;
    double v14 = 720.0;
  }

  double v16 = v15;
  double v17 = v14;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (int64_t)_serverLimitValueForKey:(id)a3 withDefaultResult:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  float v7 = [a1 serverSideConfigurationDictionary];
  uint64_t v8 = [v7 objectForKey:v6];

  if (v8)
  {
    a4 = [v8 integerValue];
  }
  else
  {
    float v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2048;
      int64_t v14 = a4;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "(server-configuration) ERROR: failed to get server limit for %@, returning default value %ld", (uint8_t *)&v11, 0x16u);
    }

    if ((_serverLimitValueForKey_withDefaultResult__hasRequestedServerLimitsAtLeastOnce & 1) == 0)
    {
      [a1 updateSharedAlbumsCachedServerConfigurationLimits];
      _serverLimitValueForKey_withDefaultResult__hasRequestedServerLimitsAtLeastOnce = 1;
    }
  }

  return a4;
}

+ (id)serverSideConfigurationDictionary
{
  id v2 = a1;
  objc_sync_enter(v2);
  int64_t v3 = (void *)_serverSideConfigurationDictionary;
  if (!_serverSideConfigurationDictionary)
  {
    id v4 = [v2 _pathToServerConfigurationCache];
    if ([MEMORY[0x1E4F8B9D8] isEntitledForPhotoKit])
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v4];
      id v6 = (void *)_serverSideConfigurationDictionary;
      _serverSideConfigurationDictionary = v5;
    }
    else
    {
      float v7 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)float v10 = 0;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "(server-configuration) ERROR: Unable to read serverconfiguration; missing required entitlement",
          v10,
          2u);
      }
    }
    int64_t v3 = (void *)_serverSideConfigurationDictionary;
  }
  id v8 = v3;
  objc_sync_exit(v2);

  return v8;
}

+ (void)_resetServerSideConfigurationDictionary
{
  id obj = a1;
  objc_sync_enter(obj);
  id v2 = (void *)_serverSideConfigurationDictionary;
  _serverSideConfigurationDictionary = 0;

  objc_sync_exit(obj);
}

+ (void)updateSharedAlbumsCachedServerConfigurationLimits
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = (id)objc_opt_class();
    id v4 = v14;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "%@ (server-configuration) updateSharedAlbumsCachedServerConfigurationLimits", buf, 0xCu);
  }
  uint64_t v5 = [a1 sharingPersonID];
  if (v5)
  {
    if (PLIsAssetsd())
    {
      id v6 = [MEMORY[0x1E4F77A58] sharedConnection];
      float v7 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "(server-configuration) about to call connection serverSideConfigurationDictionaryForPersonID:%@", buf, 0xCu);
      }

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __73__PLPhotoSharingHelper_updateSharedAlbumsCachedServerConfigurationLimits__block_invoke;
      v10[3] = &unk_1E586E680;
      id v11 = v5;
      id v12 = a1;
      [v6 serverSideConfigurationDictionaryForPersonID:v11 completionBlock:v10];
      id v8 = v11;
    }
    else
    {
      id v6 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
      id v8 = [v6 assetsdClient];
      float v9 = [v8 cloudInternalClient];
      [v9 updateSharedAlbumsCachedServerConfigurationLimits];
    }
  }
}

void __73__PLPhotoSharingHelper_updateSharedAlbumsCachedServerConfigurationLimits__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v23 = v5;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "(server-configuration) serverSideConfigurationDictionaryForPersonID:%@ returned %@", buf, 0x16u);
  }

  id v6 = [*(id *)(a1 + 40) _pathToServerConfigurationCache];
  float v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v7 removeItemAtPath:v6 error:0];
  id v8 = (void *)MEMORY[0x1E4F1CB10];
  float v9 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  float v10 = [v9 photoDirectoryWithType:22];
  id v11 = [v8 fileURLWithPath:v10 isDirectory:1];

  id v21 = 0;
  char v12 = [v11 getResourceValue:&v21 forKey:*MEMORY[0x1E4F1C5C0] error:0];
  id v13 = v21;
  id v14 = 0;
  if ((v12 & 1) == 0)
  {
    id v20 = 0;
    char v15 = [v7 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v20];
    id v14 = v20;
    if ((v15 & 1) == 0)
    {
      double v16 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = [v11 path];
        *(_DWORD *)buf = 138412546;
        id v23 = v17;
        __int16 v24 = 2112;
        id v25 = v14;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "(server-configuration) ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);
      }
    }
  }
  if (v3)
  {
    long long v18 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:100 options:0 error:0];
  }
  else
  {
    long long v18 = 0;
  }
  if (([v18 writeToFile:v6 options:1073741825 error:0] & 1) == 0)
  {
    long long v19 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v3;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "(server-configuration) ERROR: Unable to write serverconfiguration %@ to file %@: %@", buf, 0x20u);
    }
  }
  [*(id *)(a1 + 40) _resetServerSideConfigurationDictionary];
}

+ (id)streamdVideoCache
{
  pl_dispatch_once();
  id v2 = (void *)streamdVideoCache_cache;
  return v2;
}

void __41__PLPhotoSharingHelper_streamdVideoCache__block_invoke()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v0 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v9 = 0;
  uint64_t v1 = [v0 photoDirectoryWithType:24 createIfNeeded:1 error:&v9];
  id v2 = v9;

  if (v2)
  {
    id v3 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v1;
      __int16 v12 = 2112;
      id v13 = v2;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Failed to create streamdVideoCache %@: %@", buf, 0x16u);
    }
  }
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v1 isDirectory:0];
  uint64_t v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v1;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "Setting AVAsset cache to %@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F16338] assetCacheForProgressiveDownloadAndHTTPLiveStreamingWithURL:v4];
  float v7 = (void *)streamdVideoCache_cache;
  streamdVideoCache_cache = v6;

  uint64_t v8 = [MEMORY[0x1E4F8B8D8] diskSpaceAvailableForPath:v1];
  objc_msgSend((id)streamdVideoCache_cache, "setMaxSize:", (uint64_t)fmin((double)v8 * 0.1, 1073741820.0));
  [(id)streamdVideoCache_cache enableAutomaticCacheSizeManagement];
  [(id)streamdVideoCache_cache setMaxEntrySize:52428800];
}

+ (id)_pathToServerConfigurationCache
{
  id v2 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v3 = [v2 photoDirectoryWithType:22 additionalPathComponents:@"serverconfiguration"];

  return v3;
}

+ (void)initializeMSPlatform
{
}

id __44__PLPhotoSharingHelper_initializeMSPlatform__block_invoke()
{
  dispatch_queue_t v0 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_19B3C7000, v0, OS_LOG_TYPE_INFO, "initializeMSPlatform", v2, 2u);
  }

  return (id)[MEMORY[0x1E4F77A58] sharedConnection];
}

+ (void)forgetSharingPersonID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  uint64_t v5 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (__CFString *)objc_opt_class();
    float v7 = v6;
    uint64_t v8 = NSStringFromSelector(a2);
    int v14 = 138412802;
    char v15 = v6;
    __int16 v16 = 2112;
    double v17 = v8;
    __int16 v18 = 2112;
    long long v19 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "%@ %@ %@", (uint8_t *)&v14, 0x20u);
  }
  id v9 = [MEMORY[0x1E4F77A58] sharedConnection];
  float v10 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    char v15 = v4;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "about to call connection setIsUIForeground:NO personID:%@", (uint8_t *)&v14, 0xCu);
  }

  [v9 setIsUIForeground:0 forPersonID:v4];
  id v11 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    char v15 = v4;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "calling MSASConnection forgetEverythingAboutPersonID %@", (uint8_t *)&v14, 0xCu);
  }

  [v9 forgetEverythingAboutPersonID:v4];
  __int16 v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    char v15 = @"/tmp/_pollStreams.plist";
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "removing %@", (uint8_t *)&v14, 0xCu);
  }

  id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v13 removeItemAtPath:@"/tmp/_pollStreams.plist" error:0];
}

+ (void)retryOutstandingActivities
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v5;
    float v7 = NSStringFromSelector(a2);
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    char v15 = v7;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v8 = [a1 sharingPersonID];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F77A58] sharedConnection];
    if (objc_opt_respondsToSelector())
    {
      float v10 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "about to call connection retryOutstandingActivitiesForPersonID:%@", (uint8_t *)&v12, 0xCu);
      }

      [v9 retryOutstandingActivitiesForPersonID:v8];
    }
    else if (objc_opt_respondsToSelector())
    {
      id v11 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "about to call connection retryOutstandingActivities", (uint8_t *)&v12, 2u);
      }

      [v9 retryOutstandingActivities];
    }
  }
  else
  {
    id v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "no sharingPersonID, skipping retrying outstanding activities", (uint8_t *)&v12, 2u);
    }
  }
}

+ (void)pollForAlbumListUpdatesIfNecessary
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v3 objectForKey:@"kPLSharedAlbumNextPollDate"];
  if (!v5 || ([v4 timeIntervalSinceDate:v5], v6 > 0.0))
  {
    float v7 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Polling new shared album content", v9, 2u);
    }

    [a1 pollForAlbumListUpdates];
    uint64_t v8 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(a1, "_serverLimitValueForKey:withDefaultResult:", @"com.apple.sharedstreams.config.minIntervalBetweenPollInSeconds", 864000));

    [v3 setObject:v8 forKey:@"kPLSharedAlbumNextPollDate"];
    uint64_t v5 = (void *)v8;
  }
}

+ (void)pollForAlbumListUpdates
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v5;
    float v7 = NSStringFromSelector(a2);
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    char v15 = v7;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v8 = [a1 sharingPersonID];
  if (v8)
  {
    id v9 = [MEMORY[0x1E4F77A58] sharedConnection];
    float v10 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, " about to call connection refreshResetSync:NO personID:%@ in pollForAlbumListUpdates", (uint8_t *)&v12, 0xCu);
    }

    id v11 = [a1 sharingPersonID];
    [v9 refreshResetSync:0 personID:v11];
  }
  else
  {
    id v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "no sharingPersonID, skipping polling", (uint8_t *)&v12, 2u);
    }
  }
}

+ (BOOL)accountMatchesEmail:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([(id)objc_opt_class() _sharedStreamsEnabled])
  {
    id v4 = +[PLAccountStore pl_sharedAccountStore];
    uint64_t v5 = [v4 cachedPrimaryAppleAccount];
    id v6 = objc_msgSend(v5, "aa_primaryEmail");

    if ([v6 isEqualToString:v3])
    {
LABEL_16:
      id v9 = PLPhotoSharingGetLog();
      LOBYTE(v10) = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v3;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "%@ email matched icloud user email ", buf, 0xCu);
      }
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      float v7 = +[PLAccountStore pl_sharedAccountStore];
      uint64_t v8 = [v7 cachedPrimaryAppleAccount];
      id v9 = objc_msgSend(v8, "aa_appleIDAliases");

      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v9);
            }
            if ([*(id *)(*((void *)&v14 + 1) + 8 * i) isEqualToString:v3])
            {

              goto LABEL_16;
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v20 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v6 = PLMyPhotoStreamGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Can't return sharingPersonEmailAddress because no Apple Account has Photo Sharing enabled", buf, 2u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (id)sharingDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = +[PLAccountStore pl_sharedAccountStore];
  float v7 = [v6 cachedPrimaryAppleAccount];

  uint64_t v8 = objc_msgSend(v7, "aa_firstName");
  id v9 = objc_msgSend(v7, "aa_lastName");
  uint64_t v10 = [v7 userFullName];
  uint64_t v11 = objc_msgSend(v7, "aa_primaryEmail");
  int v12 = (void *)v11;
  if (v4) {
    id v13 = (__CFString *)v11;
  }
  else {
    id v13 = &stru_1EEB2EB80;
  }
  long long v14 = v13;
  if ([v10 length])
  {
    long long v15 = v10;
    goto LABEL_6;
  }
  if ([v8 length] && objc_msgSend(v9, "length"))
  {
    id v22 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v22 setGivenName:v8];
    [v22 setFamilyName:v9];
    long long v16 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v22 style:0 options:0];

    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if ([v8 length])
  {
    long long v15 = v8;
LABEL_6:
    long long v16 = v15;
    if (!v5) {
      goto LABEL_9;
    }
LABEL_7:
    if ([(__CFString *)v14 length])
    {
      long long v17 = PLServicesLocalizedFrameworkString();
      uint64_t v18 = PFStringWithValidatedFormat();

      long long v16 = (__CFString *)v18;
    }
    goto LABEL_9;
  }
  if (![v9 length])
  {
    long long v16 = v14;
    goto LABEL_9;
  }
  long long v16 = v9;
  if (v5) {
    goto LABEL_7;
  }
LABEL_9:
  if (v16) {
    id v19 = v16;
  }
  else {
    id v19 = &stru_1EEB2EB80;
  }
  uint64_t v20 = v19;

  return v20;
}

+ (id)sharingLastName
{
  if ([a1 _sharedStreamsEnabled])
  {
    id v2 = +[PLAccountStore pl_sharedAccountStore];
    id v3 = [v2 cachedPrimaryAppleAccount];
    BOOL v4 = objc_msgSend(v3, "aa_lastName");
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

+ (id)sharingFirstName
{
  if ([a1 _sharedStreamsEnabled])
  {
    id v2 = +[PLAccountStore pl_sharedAccountStore];
    id v3 = [v2 cachedPrimaryAppleAccount];
    BOOL v4 = objc_msgSend(v3, "aa_firstName");
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

+ (id)sharingUsername
{
  if ([a1 _sharedStreamsEnabled])
  {
    id v2 = +[PLAccountStore pl_sharedAccountStore];
    id v3 = [v2 cachedPrimaryAppleAccount];
    BOOL v4 = objc_msgSend(v3, "aa_formattedUsername");
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

+ (void)clearCachedAccountState
{
  id v3 = +[PLAccountStore pl_sharedAccountStore];
  [v3 clearCachedProperties];

  [a1 accountSettingsChanged];
}

+ (void)photosPreferencesChanged
{
  __debugDownloadThumbnailsOnly = -1;
  __debugDownloadMetadataOnly = -1;
  __debugDownloadAllDerivatives = -1;
}

+ (void)accountSettingsChanged
{
  id v3 = PLMyPhotoStreamGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Clearing cached PLPhotoSharingHelper state", v4, 2u);
  }

  __isSharingBreadcrumbDebuggingEnabled = -1;
  _sharedStreamsEnabled = -1;
  _sharedStreamsExplicitlyDisabled = -1;
  [a1 _resetServerSideConfigurationDictionary];
}

@end