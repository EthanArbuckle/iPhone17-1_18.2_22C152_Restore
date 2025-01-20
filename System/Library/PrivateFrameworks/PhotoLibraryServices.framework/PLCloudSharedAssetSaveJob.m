@interface PLCloudSharedAssetSaveJob
+ (BOOL)_lightweightReimportCacheDirectoryExists;
+ (id)_dcimDirectoryForFileURL:(id)a3;
+ (id)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID:(id)a3 cloudPersonID:(id)a4;
+ (id)newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd;
+ (id)nextDCIMSaveFileURLForCloudPersonID:(id)a3 cloudAlbumGUID:(id)a4 pathManager:(id)a5 fileExtension:(id)a6 assetUUID:(id)a7;
+ (id)pathForInFlightAssetCollectionWithGUID:(id)a3 mediaAssetType:(unint64_t)a4;
+ (void)assetsdProcessMetadataForAssetCollections:(id)a3 inAlbum:(id)a4 personID:(id)a5 info:(id)a6 libraryServicesManager:(id)a7;
+ (void)deleteCloudSharedAssetsWithCloudGUIDs:(id)a3 info:(id)a4;
+ (void)downloadPendingAssetsForPersonID:(id)a3 info:(id)a4;
+ (void)processMetadataForAssetCollections:(id)a3 inAlbum:(id)a4 personID:(id)a5 info:(id)a6;
+ (void)replaceRecentlyUploadedOriginalWithDerivativeForCollection:(id)a3 inAlbum:(id)a4 personID:(id)a5;
+ (void)saveCloudSharedAssetAtPath:(id)a3 forAssetCollection:(id)a4 mediaAssetType:(unint64_t)a5 albumGUID:(id)a6 personID:(id)a7 info:(id)a8 shouldPrioritize:(BOOL)a9;
- (BOOL)_processInflightAsset:(id)a3 mediaAssetType:(unint64_t)a4;
- (BOOL)_processSaveAssetWithPlaceholderKind:(signed __int16)a3 inLibrary:(id)a4 withAssetDataFilePath:(id)a5;
- (BOOL)isPhotoIris;
- (BOOL)isProcessingThumbnail;
- (BOOL)isVideo;
- (MSASAssetCollection)currentCloudAssetCollection;
- (NSArray)assetCollectionInfos;
- (NSArray)cloudAssetGUIDsToDelete;
- (NSDictionary)mstreamdInfoDictionary;
- (NSString)cloudAlbumGUID;
- (NSString)cloudPersonID;
- (NSString)currentCloudAssetGUID;
- (NSString)currentFilePath;
- (PLCloudSharedAssetSaveJob)initWithAssetsdClient:(id)a3;
- (id)_createPlaceHolderInSharedAlbum:(id)a3;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (int64_t)jobType;
- (signed)attemptLightweightReimportAssetDataInLibrary:(id)a3;
- (signed)placeHolderKindFromAssetMetadataType:(unint64_t)a3;
- (unint64_t)_insertionIndexForAsset:(id)a3 inAlbum:(id)a4;
- (unint64_t)currentCloudAssetMediaAssetType;
- (void)_addDownloadNotification:(id)a3;
- (void)_incrementDerivativesCount:(int64_t)a3 thumbnailsCount:(int64_t)a4;
- (void)_performSaveTransactionAndWaitOnLibrary:(id)a3 transaction:(id)a4 completion:(id)a5;
- (void)_prefetchLimitForDerivatives:(int64_t *)a3 thumbnails:(int64_t *)a4;
- (void)_processInFlightCommentsForAsset:(id)a3 inAlbum:(id)a4 inPhotoLibrary:(id)a5;
- (void)_updateAsset:(id)a3 withImageFileURL:(id)a4;
- (void)_updatePhotoIrisPropertiesIfNecessaryForAsset:(id)a3 inManagedObjectContext:(id)a4;
- (void)dealloc;
- (void)encodeToXPCObject:(id)a3;
- (void)executeDaemonOperationDeleteAssetJobType;
- (void)executeDaemonOperationDownloadPendingAssetsJobType;
- (void)executeDaemonOperationReplaceRecentlyUploadedOriginalJobType;
- (void)executeDaemonOperationSaveAssetJobType;
- (void)executeDaemonOperationSaveAssetMetadataForCollectionsJobType;
- (void)runDaemonSide;
- (void)setAssetCollectionInfos:(id)a3;
- (void)setCloudAlbumGUID:(id)a3;
- (void)setCloudAssetGUIDsToDelete:(id)a3;
- (void)setCloudPersonID:(id)a3;
- (void)setCurrentCloudAssetCollection:(id)a3;
- (void)setCurrentCloudAssetGUID:(id)a3;
- (void)setCurrentCloudAssetMediaAssetType:(unint64_t)a3;
- (void)setCurrentFilePath:(id)a3;
- (void)setIsPhotoIris:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setJobType:(int64_t)a3;
- (void)setMstreamdInfoDictionary:(id)a3;
- (void)setupSaveAssetMetadataForCollectionsJobForAssetCollections:(id)a3 album:(id)a4 personID:(id)a5 info:(id)a6;
@end

@implementation PLCloudSharedAssetSaveJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, 0);
  objc_storeStrong((id *)&self->_cloudAssetGUIDsToDelete, 0);
  objc_storeStrong((id *)&self->_assetCollectionInfos, 0);
  objc_storeStrong((id *)&self->_currentCloudAssetCollection, 0);
  objc_storeStrong((id *)&self->_cloudPersonID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumGUID, 0);
  objc_storeStrong((id *)&self->_currentCloudAssetGUID, 0);
  objc_storeStrong((id *)&self->_currentFilePath, 0);
  objc_storeStrong((id *)&self->_pendingDownloadNotifications, 0);
  objc_storeStrong((id *)&self->_currentAssetCollectionInfo, 0);
}

- (void)setMstreamdInfoDictionary:(id)a3
{
}

- (NSDictionary)mstreamdInfoDictionary
{
  return self->_mstreamdInfoDictionary;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)setCloudAssetGUIDsToDelete:(id)a3
{
}

- (NSArray)cloudAssetGUIDsToDelete
{
  return self->_cloudAssetGUIDsToDelete;
}

- (void)setIsPhotoIris:(BOOL)a3
{
  self->_isPhotoIris = a3;
}

- (BOOL)isPhotoIris
{
  return self->_isPhotoIris;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setAssetCollectionInfos:(id)a3
{
}

- (NSArray)assetCollectionInfos
{
  return self->_assetCollectionInfos;
}

- (void)setCurrentCloudAssetCollection:(id)a3
{
}

- (MSASAssetCollection)currentCloudAssetCollection
{
  return self->_currentCloudAssetCollection;
}

- (void)setCloudPersonID:(id)a3
{
}

- (NSString)cloudPersonID
{
  return self->_cloudPersonID;
}

- (void)setCloudAlbumGUID:(id)a3
{
}

- (NSString)cloudAlbumGUID
{
  return self->_cloudAlbumGUID;
}

- (void)setCurrentCloudAssetMediaAssetType:(unint64_t)a3
{
  self->_currentCloudAssetMediaAssetType = a3;
}

- (unint64_t)currentCloudAssetMediaAssetType
{
  return self->_currentCloudAssetMediaAssetType;
}

- (void)setCurrentCloudAssetGUID:(id)a3
{
}

- (NSString)currentCloudAssetGUID
{
  return self->_currentCloudAssetGUID;
}

- (void)setCurrentFilePath:(id)a3
{
}

- (NSString)currentFilePath
{
  return self->_currentFilePath;
}

- (unint64_t)_insertionIndexForAsset:(id)a3 inAlbum:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 assets];
  unint64_t v8 = [v7 count];

  v9 = [v6 sortingComparator];
  if (v9)
  {
    v10 = [v6 assets];
    v11 = [v10 array];
    unint64_t v8 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, v8, 1024, v9);
  }
  return v8;
}

- (void)executeDaemonOperationReplaceRecentlyUploadedOriginalJobType
{
  v3 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  BOOL v4 = [(PLCloudSharedAssetSaveJob *)self isVideo];
  BOOL v5 = [(PLCloudSharedAssetSaveJob *)self isPhotoIris];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__PLCloudSharedAssetSaveJob_executeDaemonOperationReplaceRecentlyUploadedOriginalJobType__block_invoke;
  v10[3] = &unk_1E5874318;
  BOOL v12 = v4;
  v10[4] = self;
  id v11 = v3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PLCloudSharedAssetSaveJob_executeDaemonOperationReplaceRecentlyUploadedOriginalJobType__block_invoke_399;
  v7[3] = &unk_1E586EBF8;
  v7[4] = self;
  BOOL v8 = v4;
  BOOL v9 = v5;
  id v6 = v3;
  [(PLCloudSharedAssetSaveJob *)self _performSaveTransactionAndWaitOnLibrary:v6 transaction:v10 completion:v7];
}

void __89__PLCloudSharedAssetSaveJob_executeDaemonOperationReplaceRecentlyUploadedOriginalJobType__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) currentCloudAssetGUID];
    BOOL v4 = (void *)v3;
    BOOL v5 = @"YES (streamed-video-replacement)";
    if (!*(unsigned char *)(a1 + 48)) {
      BOOL v5 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v3;
    __int16 v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationReplaceRecentlyUploadedOriginalJobType %@ isVideo %@", buf, 0x16u);
  }
  id v6 = [*(id *)(a1 + 32) currentCloudAssetGUID];
  v22 = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  BOOL v8 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v7 inLibrary:*(void *)(a1 + 40)];
  BOOL v9 = [v8 lastObject];

  v10 = [v9 uniformTypeIdentifier];
  if (*(unsigned char *)(a1 + 48)) {
    +[PLPhotoSharingHelper temporaryVideoPosterFramePathForCollectionGUID:v6];
  }
  else {
  id v11 = +[PLPhotoSharingHelper temporaryDerivativePathForCollectionGUID:v6 uti:v10];
  }
  BOOL v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v13 = [v12 fileExistsAtPath:v11];

  v14 = PLPhotoSharingGetLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      v16 = [*(id *)(a1 + 32) cloudAlbumGUID];
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = (uint64_t)v11;
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Found temporary derivative at path %@, will use it to replace original asset in shared album %@", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
    if (*(unsigned char *)(a1 + 48)) {
      uint64_t v17 = 7;
    }
    else {
      uint64_t v17 = 4;
    }
    v18 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationReplaceRecentlyUploadedOriginalJobType will call _processSaveAssetWithPlaceholderKind %i", buf, 8u);
    }

    [*(id *)(a1 + 32) _processSaveAssetWithPlaceholderKind:v17 inLibrary:*(void *)(a1 + 40) withAssetDataFilePath:v11];
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (uint64_t)v11;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "did not find recently uploaded derivative at path %@ to replace original", buf, 0xCu);
    }

    if (*(unsigned char *)(a1 + 48)
      && [v9 isVideo]
      && [v9 isCloudSharedAsset]
      && [v9 cloudPlaceholderKind] != 7)
    {
      [v9 setCloudPlaceholderKind:2];
      v20 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [*(id *)(a1 + 32) currentCloudAssetGUID];
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = (uint64_t)v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "(streamed-video-replacement) re-requesting download of video asset %@", buf, 0xCu);
      }
      +[PLPhotoSharingHelper downloadAsset:v9 cloudPlaceholderKind:3 shouldPrioritize:0 shouldExtendTimer:0];
    }
    else
    {
      v19 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v24 = (uint64_t)v9;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "(streamed-video-replacement) expected to find an original video asset but instead found %@", buf, 0xCu);
      }
    }
  }
}

void __89__PLCloudSharedAssetSaveJob_executeDaemonOperationReplaceRecentlyUploadedOriginalJobType__block_invoke_399(uint64_t a1)
{
  v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationReplaceRecentlyUploadedOriginalJobType did call _processSaveAssetWithPlaceholderKind", v19, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) currentCloudAssetGUID];
  BOOL v4 = +[PLPhotoSharingHelper temporaryThumbnailPathForCollectionGUID:v3];

  if (v4)
  {
    BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v5 removeItemAtPath:v4 error:0];
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 41)) {
      id v6 = @"MOV";
    }
    else {
      id v6 = @"MP4";
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 41)) {
      goto LABEL_18;
    }
    id v6 = @"MOV";
  }
  v7 = v6;
  BOOL v8 = [*(id *)(a1 + 32) currentCloudAssetGUID];
  BOOL v9 = +[PLPhotoSharingHelper temporarySmallVideoDerivativePathForCollectionGUID:v8];
  v10 = [v9 stringByAppendingPathExtension:v7];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v11 removeItemAtPath:v10 error:0];
  }
  BOOL v12 = [*(id *)(a1 + 32) currentCloudAssetGUID];
  int v13 = +[PLPhotoSharingHelper temporaryLargeVideoDerivativePathForCollectionGUID:v12];
  v14 = [v13 stringByAppendingPathExtension:v7];

  if (v14)
  {
    BOOL v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v15 removeItemAtPath:v14 error:0];
  }
  v16 = [*(id *)(a1 + 32) currentCloudAssetGUID];
  uint64_t v17 = +[PLPhotoSharingHelper temporaryVideoPathForCollectionGUID:v16];

  if (v17)
  {
    v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v18 removeItemAtPath:v17 error:0];
  }
LABEL_18:
}

- (void)executeDaemonOperationDeleteAssetJobType
{
  uint64_t v3 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PLCloudSharedAssetSaveJob_executeDaemonOperationDeleteAssetJobType__block_invoke;
  v5[3] = &unk_1E5875E18;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 performTransactionAndWait:v5 completionHandler:&__block_literal_global_392];
}

void __69__PLCloudSharedAssetSaveJob_executeDaemonOperationDeleteAssetJobType__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [*(id *)(a1 + 32) cloudAssetGUIDsToDelete];
  id v4 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v3 inLibrary:*(void *)(a1 + 40)];

  BOOL v5 = +[PLAssetTransactionReason transactionReason:@"[Shared Streams]Asset was deleted remotely."];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 138412290;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        BOOL v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "uuid", v17, (void)v18);
        v14 = (void *)[v13 copy];

        if (v14)
        {
          [v2 addObject:v14];
        }
        else
        {
          BOOL v15 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = v12;
            _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error : AssetUUID for asset %@ which was deleted remotely was nil", buf, 0xCu);
          }
        }
        [v12 deleteWithReason:v5];
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }

  v16 = +[PLNotificationManager sharedManager];
  [v16 noteDidDeleteSharedAssetsWithUUIDs:v2];
}

- (void)_incrementDerivativesCount:(int64_t)a3 thumbnailsCount:(int64_t)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v4 = [(PLDaemonJob *)self libraryServicesManager];
  BOOL v5 = [v4 pathManager];
  id v6 = [v5 photoDirectoryWithType:24 createIfNeeded:1 error:0];
  uint64_t v7 = [v6 stringByAppendingPathComponent:@"sharedAssetsPrefetchCount.plist"];

  long long v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v7];
  uint64_t v9 = [v8 objectForKey:@"date"];
  uint64_t v10 = [v8 objectForKey:@"thumbnailsCount"];
  uint64_t v11 = [v10 integerValue];

  BOOL v12 = [v8 objectForKey:@"derivativesCount"];
  uint64_t v13 = [v12 integerValue];

  if (!v9
    || ([MEMORY[0x1E4F1C9C8] date],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v14 timeIntervalSinceDate:v9],
        double v16 = v15,
        v14,
        v16 >= 86400.0))
  {
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];

    uint64_t v11 = 0;
    uint64_t v9 = (void *)v17;
  }
  v27[0] = v9;
  v26[0] = @"date";
  v26[1] = @"thumbnailsCount";
  long long v18 = [NSNumber numberWithInteger:v11 + a4];
  v27[1] = v18;
  v26[2] = @"derivativesCount";
  long long v19 = [NSNumber numberWithInteger:v13 + a3];
  v27[2] = v19;
  long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

  if (([v20 writeToFile:v7 atomically:1] & 1) == 0)
  {
    long long v21 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v7;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "failed to update prefetch count file %@", buf, 0xCu);
    }
  }
}

- (void)_prefetchLimitForDerivatives:(int64_t *)a3 thumbnails:(int64_t *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      *a3 = 0;
      *a4 = 0;
      if (PLPlatformSharedAlbumAndiCPLPrefetchSupported())
      {
        uint64_t v7 = [(PLDaemonJob *)self libraryServicesManager];
        long long v8 = [v7 pathManager];
        uint64_t v9 = [v8 photoDirectoryWithType:24 createIfNeeded:0 error:0];
        uint64_t v10 = [v9 stringByAppendingPathComponent:@"sharedAssetsPrefetchCount.plist"];

        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v10];
        BOOL v12 = [v11 objectForKey:@"date"];
        uint64_t v13 = [v11 objectForKey:@"thumbnailsCount"];
        uint64_t v14 = [v13 integerValue];

        double v15 = [v11 objectForKey:@"derivativesCount"];
        uint64_t v16 = [v15 integerValue];

        if (v12
          && ([MEMORY[0x1E4F1C9C8] date],
              uint64_t v17 = objc_claimAutoreleasedReturnValue(),
              [v17 timeIntervalSinceDate:v12],
              double v19 = v18,
              v17,
              v19 < 86400.0))
        {
          uint64_t v46 = v14;
        }
        else
        {
          uint64_t v16 = 0;
          uint64_t v46 = 0;
        }
        uint64_t v20 = MGGetSInt64Answer();
        char v21 = MGGetBoolAnswer();
        v22 = [MEMORY[0x1E4F28F80] processInfo];
        int v23 = [v22 isLowPowerModeEnabled];

        if (+[PLPhotoSharingHelper debugDownloadMetadataOnly])
        {
          uint64_t v24 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v25 = "skip downloading shared assets since download metadata only is requested.";
LABEL_14:
            v26 = v24;
            uint32_t v27 = 2;
LABEL_15:
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
            goto LABEL_16;
          }
          goto LABEL_16;
        }
        if (v23)
        {
          uint64_t v24 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v25 = "skip downloading shared assets in battery saver mode";
            goto LABEL_14;
          }
LABEL_16:

          return;
        }
        if (v20 > 19) {
          char v28 = 1;
        }
        else {
          char v28 = v21;
        }
        if ((v28 & 1) == 0)
        {
          uint64_t v24 = PLPhotoSharingGetLog();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 134218240;
          uint64_t v48 = v20;
          __int16 v49 = 1024;
          int v50 = 20;
          uint64_t v25 = "skip downloading shared assets as battery capacity %lld is less than %d";
          v26 = v24;
          uint32_t v27 = 18;
          goto LABEL_15;
        }
        v29 = +[PLPhotoLibrary cloudSharingPhotoLibrary];
        v30 = [v29 pathManager];
        uint64_t v24 = [v30 libraryURL];

        v31 = (void *)MEMORY[0x1E4F8B8D8];
        v32 = [v24 path];
        uint64_t v33 = [v31 diskSpaceAvailableForPath:v32];

        if (+[PLPhotoSharingHelper debugDownloadThumbnailsOnly])
        {
          v34 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v35 = "skip downloading derivatives since download thumbnail only is requested.";
            v36 = v34;
            uint32_t v37 = 2;
LABEL_25:
            _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
          }
        }
        else
        {
          if (+[PLPhotoSharingHelper debugDownloadAllDerivatives])
          {
            v38 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "downloading all derivatives is requested.", buf, 2u);
            }

            *a3 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_33:
            if (v33 <= 0x1FFFFFFF)
            {
              v39 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v48 = 0x20000000;
                _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "skip downloading shared asset thumbnails since available storage is less than %lld", buf, 0xCu);
              }

              goto LABEL_16;
            }
LABEL_45:
            if (+[PLPhotoSharingHelper isCellularConnection])
            {
              int64_t v43 = +[PLPhotoSharingHelper maxNumThumbnailsToPrefetchPerDay];
              *a4 = (v43 - v46) & ~((v43 - v46) >> 63);
              v44 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                int64_t v45 = *a4;
                *(_DWORD *)buf = 134217984;
                uint64_t v48 = v45;
                _os_log_impl(&dword_19B3C7000, v44, OS_LOG_TYPE_DEFAULT, "On cellular connection, allows %ld thumbnails to be prefetched", buf, 0xCu);
              }
            }
            else
            {
              *a4 = 0x7FFFFFFFFFFFFFFFLL;
            }
            goto LABEL_16;
          }
          if (v33 > 0x3FFFFFFF)
          {
            if (+[PLPhotoSharingHelper isCellularConnection])
            {
              int64_t v40 = +[PLPhotoSharingHelper maxNumDerivativesToPrefetchPerDay];
              *a3 = (v40 - v16) & ~((v40 - v16) >> 63);
              v41 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                int64_t v42 = *a4;
                *(_DWORD *)buf = 134217984;
                uint64_t v48 = v42;
                _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "On cellular connection, allows %ld derivatives to be prefetched", buf, 0xCu);
              }
            }
            else
            {
              *a3 = +[PLPhotoSharingHelper maxNumDerivativesToDownloadPerPush];
            }
            goto LABEL_45;
          }
          v34 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v48 = 0x40000000;
            v35 = "skip downloading shared asset derivatives since available storage is less than %lld";
            v36 = v34;
            uint32_t v37 = 12;
            goto LABEL_25;
          }
        }

        goto LABEL_33;
      }
    }
  }
}

- (BOOL)_processInflightAsset:(id)a3 mediaAssetType:(unint64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 cloudAssetGUID];
  long long v8 = +[PLCloudSharedAssetSaveJob pathForInFlightAssetCollectionWithGUID:v7 mediaAssetType:a4];
  if (v8
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 fileExistsAtPath:v8],
        v9,
        v10))
  {
    uint64_t v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Inflight file for asset %@ already exists at %@. Attempting to import directly", (uint8_t *)&v21, 0x16u);
    }

    BOOL v12 = [v6 cloudShareAlbum];
    uint64_t v13 = [v12 cloudGUID];

    if (v13)
    {
      [(PLCloudSharedAssetSaveJob *)self setCurrentCloudAssetGUID:v7];
      [(PLCloudSharedAssetSaveJob *)self setCloudAlbumGUID:v13];
      -[PLCloudSharedAssetSaveJob setIsVideo:](self, "setIsVideo:", [v6 isVideo]);
      uint64_t v14 = [(PLCloudSharedAssetSaveJob *)self placeHolderKindFromAssetMetadataType:a4];
      double v15 = [v6 photoLibrary];
      BOOL v16 = [(PLCloudSharedAssetSaveJob *)self _processSaveAssetWithPlaceholderKind:v14 inLibrary:v15 withAssetDataFilePath:v8];

      if (v16)
      {
        uint64_t v17 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138412290;
          id v22 = v8;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Successfully imported inflight file %@", (uint8_t *)&v21, 0xCu);
        }

        [(PLCloudSharedAssetSaveJob *)self setCloudAlbumGUID:0];
        [(PLCloudSharedAssetSaveJob *)self setCurrentCloudAssetGUID:0];
      }
      [(PLCloudSharedAssetSaveJob *)self setCurrentCloudAssetGUID:0];
      [(PLCloudSharedAssetSaveJob *)self setCloudAlbumGUID:0];
    }
    else
    {
      LOBYTE(v16) = 0;
    }
    double v18 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Failed to import inflight file %@. Removing", (uint8_t *)&v21, 0xCu);
    }

    double v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v19 removeItemAtPath:v8 error:0];
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)executeDaemonOperationDownloadPendingAssetsJobType
{
  long long v14 = 0uLL;
  [(PLCloudSharedAssetSaveJob *)self _prefetchLimitForDerivatives:(char *)&v14 + 8 thumbnails:&v14];
  if (v14 == 0)
  {
    uint64_t v3 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Skipping prefetching cloud shared assets since there is no more budget for today", buf, 2u);
    }
  }
  else
  {
    id v4 = [(PLCloudSharingJob *)self transientPhotoLibrary];
    BOOL v5 = [(PLCloudSharedAssetSaveJob *)self cloudPersonID];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__PLCloudSharedAssetSaveJob_executeDaemonOperationDownloadPendingAssetsJobType__block_invoke;
    v7[3] = &unk_1E5873AC8;
    id v8 = v4;
    uint64_t v9 = self;
    uint64_t v11 = *((void *)&v14 + 1);
    uint64_t v12 = v14;
    id v10 = v5;
    id v6 = v5;
    uint64_t v3 = v4;
    [v3 performTransaction:v7];
  }
}

void __79__PLCloudSharedAssetSaveJob_executeDaemonOperationDownloadPendingAssetsJobType__block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = +[PLPhotoSharingHelper maxNumDerivativesToDownloadPerPush];
  v53 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
  v56 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v2];
  uint64_t v3 = [MEMORY[0x1E4F77A58] sharedConnection];
  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K < 1", @"cloudDownloadRequests");
  id v6 = +[PLManagedAsset fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:&unk_1EEBF20C0 additionalPredicate:v5 ascending:0];
  id v61 = 0;
  uint64_t v7 = [v4 executeFetchRequest:v6 error:&v61];
  id v48 = v61;
  __int16 v49 = v7;
  if (!v7)
  {
    v34 = PLPhotoSharingGetLog();
    v35 = v48;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = (uint64_t)v6;
      __int16 v65 = 2112;
      id v66 = v48;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to fetch pending assets with request:%@ %@", buf, 0x16u);
    }

    uint64_t v36 = 0;
    uint64_t v37 = 0;
    id v10 = v53;
    goto LABEL_59;
  }
  int64_t v45 = v6;
  uint64_t v46 = v5;
  v47 = v4;
  v52 = v3;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (!v8)
  {
    uint64_t v51 = 0;
    uint64_t v54 = 0;
    id v10 = v53;
    goto LABEL_50;
  }
  uint64_t v9 = v8;
  uint64_t v51 = 0;
  uint64_t v54 = 0;
  uint64_t v55 = *(void *)v58;
  id v10 = v53;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v58 != v55) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v57 + 1) + 8 * i);
      [v12 setCloudDownloadRequests:&unk_1EEBEF6D8];
      uint64_t v13 = [v12 cloudAssetGUID];
      if (![v13 length])
      {
        BOOL v16 = NSString;
        uint64_t v17 = [v12 objectID];
        double v18 = [v16 stringWithFormat:@"Found cloud shared asset with nil cloudAssetGUID %@ (isDeleted=%d) %@.\n\nSee rdar://problem/33335181", v17, objc_msgSend(v12, "isDeleted"), v12];

        if (!*MEMORY[0x1E4F59AC0])
        {
          double v19 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v64 = (uint64_t)v18;
            _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
        }
        +[PLDiagnostics fileRadarUserNotificationWithHeader:@"Unexpected Shared Album state" message:@"Please file a Radar against Photos" radarTitle:@"TTR: cloud shared asset with nil cloudAssetGUID" radarDescription:v18];

        goto LABEL_26;
      }
      if (v54 < *(void *)(a1 + 56))
      {
        if ([v12 isVideo]) {
          uint64_t v14 = 5;
        }
        else {
          uint64_t v14 = 3;
        }
        if ([*(id *)(a1 + 40) _processInflightAsset:v12 mediaAssetType:v14]) {
          goto LABEL_40;
        }
        ++v54;
        double v15 = v56;
LABEL_25:
        [v15 addObject:v13];
LABEL_26:
        if ([v56 count] >= v2)
        {
          if ([v12 isVideo]) {
            uint64_t v21 = 212;
          }
          else {
            uint64_t v21 = 211;
          }
          id v22 = [v12 cloudShareAlbum];
          __int16 v23 = [v22 cloudGUID];
          +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:v13 albumGUID:v23 content:v13 state:v21 error:0];

          uint64_t v24 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v25 = [v56 count];
            v26 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 134218242;
            uint64_t v64 = v25;
            __int16 v65 = 2112;
            id v66 = v26;
            _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEFAULT, "calling MSASConnection to retrieveAssets: with a batch of %lu derivatives personID:%@", buf, 0x16u);
          }

          [v52 retrieveAssetsFromAssetCollectionsWithGUIDs:v56 assetTypeFlags:2 personID:*(void *)(a1 + 48)];
          [v56 removeAllObjects];
          id v10 = v53;
        }
        if ([v10 count] >= v2)
        {
          if ([v12 isVideo]) {
            uint64_t v27 = 212;
          }
          else {
            uint64_t v27 = 210;
          }
          char v28 = [v12 cloudShareAlbum];
          v29 = [v28 cloudGUID];
          uint64_t v30 = v27;
          id v10 = v53;
          +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:v13 albumGUID:v29 content:v13 state:v30 error:0];

          v31 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = [v53 count];
            uint64_t v33 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 134218242;
            uint64_t v64 = v32;
            __int16 v65 = 2112;
            id v66 = v33;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "calling MSASConnection to retrieveAssets: with a batch of %lu thumbnails personID:%@", buf, 0x16u);
          }

          [v52 retrieveAssetsFromAssetCollectionsWithGUIDs:v53 assetTypeFlags:1 personID:*(void *)(a1 + 48)];
          [v53 removeAllObjects];
        }
        goto LABEL_40;
      }
      if (v51 >= *(void *)(a1 + 64))
      {
        v38 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "No more budget for shared assets prefetching", buf, 2u);
        }

        goto LABEL_50;
      }
      if ([v12 isVideo]) {
        uint64_t v20 = 5;
      }
      else {
        uint64_t v20 = 2;
      }
      if (([*(id *)(a1 + 40) _processInflightAsset:v12 mediaAssetType:v20] & 1) == 0)
      {
        ++v51;
        double v15 = v10;
        goto LABEL_25;
      }
LABEL_40:
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_50:

  uint64_t v3 = v52;
  BOOL v5 = v46;
  id v4 = v47;
  id v6 = v45;
  v35 = v48;
  if ([v56 count])
  {
    v39 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = [v56 count];
      v41 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v64 = v40;
      __int16 v65 = 2112;
      id v66 = v41;
      _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "calling MSASConnection to retrieveAssets: with a batch of %lu derivatives personID:%@", buf, 0x16u);
    }

    [v52 retrieveAssetsFromAssetCollectionsWithGUIDs:v56 assetTypeFlags:2 personID:*(void *)(a1 + 48)];
  }
  if ([v10 count])
  {
    int64_t v42 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v43 = [v10 count];
      v44 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v64 = v43;
      __int16 v65 = 2112;
      id v66 = v44;
      _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_DEFAULT, "calling MSASConnection to retrieveAssets: with a batch of %lu thumbnails personID:%@", buf, 0x16u);
    }

    [v52 retrieveAssetsFromAssetCollectionsWithGUIDs:v10 assetTypeFlags:1 personID:*(void *)(a1 + 48)];
  }
  uint64_t v36 = v51;
  uint64_t v37 = v54;
LABEL_59:
  [*(id *)(a1 + 40) _incrementDerivativesCount:v37 thumbnailsCount:v36];
}

- (void)executeDaemonOperationSaveAssetMetadataForCollectionsJobType
{
  uint64_t v3 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__74004;
  v15[4] = __Block_byref_object_dispose__74005;
  id v16 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __89__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetMetadataForCollectionsJobType__block_invoke;
  v11[3] = &unk_1E5875368;
  v11[4] = self;
  id v5 = v3;
  id v12 = v5;
  uint64_t v14 = v15;
  id v13 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetMetadataForCollectionsJobType__block_invoke_350;
  v7[3] = &unk_1E5875340;
  id v6 = v13;
  uint64_t v9 = self;
  id v10 = v15;
  id v8 = v6;
  [(PLCloudSharedAssetSaveJob *)self _performSaveTransactionAndWaitOnLibrary:v5 transaction:v11 completion:v7];

  _Block_object_dispose(v15, 8);
}

void __89__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetMetadataForCollectionsJobType__block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) assetCollectionInfos];
  uint64_t v3 = [v2 valueForKey:@"GUID"];

  id v4 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v3 inLibrary:*(void *)(a1 + 40)];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v67 objects:v78 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v68 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        id v12 = [v11 cloudAssetGUID];

        if (v12)
        {
          id v13 = [v11 cloudAssetGUID];
          [v5 setObject:v11 forKey:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v67 objects:v78 count:16];
    }
    while (v8);
  }

  int v59 = [(id)objc_opt_class() _lightweightReimportCacheDirectoryExists];
  uint64_t v14 = [*(id *)(a1 + 32) cloudAlbumGUID];
  uint64_t v15 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v14 inLibrary:*(void *)(a1 + 40)];
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    double v18 = [*(id *)(a1 + 32) assetCollectionInfos];
    uint64_t v60 = [v18 countByEnumeratingWithState:&v63 objects:v77 count:16];
    if (v60)
    {
      id v52 = v6;
      v53 = v3;
      uint64_t v58 = *(void *)v64;
      uint64_t v57 = *MEMORY[0x1E4F1C5C0];
      uint64_t v54 = v5;
      uint64_t v55 = v18;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v64 != v58) {
            objc_enumerationMutation(v18);
          }
          uint64_t v20 = *(void **)(*((void *)&v63 + 1) + 8 * j);
          uint64_t v21 = (void *)MEMORY[0x19F38D3B0]();
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), v20);
          id v22 = [*(id *)(*(void *)(a1 + 32) + 88) GUID];
          [*(id *)(a1 + 32) setCurrentCloudAssetGUID:v22];
          objc_msgSend(*(id *)(a1 + 32), "setIsVideo:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "isVideo"));
          objc_msgSend(*(id *)(a1 + 32), "setIsPhotoIris:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "isPhotoIris"));
          __int16 v23 = [v5 objectForKey:v22];
          uint64_t v24 = v23;
          if (v23)
          {
            if ([v23 cloudPlaceholderKind] == 5)
            {
              uint64_t v25 = v18;
              v26 = v21;
              uint64_t v27 = [v24 uniformTypeIdentifier];
              char v28 = [*(id *)(a1 + 32) currentCloudAssetGUID];
              v29 = +[PLPhotoSharingHelper temporaryDerivativePathForCollectionGUID:v28 uti:v27];

              uint64_t v30 = [MEMORY[0x1E4F28CB8] defaultManager];
              int v31 = [v30 fileExistsAtPath:v29];

              if (v31)
              {
                uint64_t v32 = PLPhotoSharingGetLog();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v33 = [*(id *)(a1 + 32) cloudAlbumGUID];
                  *(_DWORD *)buf = 138412546;
                  v72 = v29;
                  __int16 v73 = 2112;
                  v74 = v33;
                  _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Found temporary derivative at path %@, will use it to replace original asset in shared album %@", buf, 0x16u);
                }
                *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
                [*(id *)(a1 + 32) _processSaveAssetWithPlaceholderKind:4 inLibrary:*(void *)(a1 + 40) withAssetDataFilePath:v29];
              }

              uint64_t v21 = v26;
              double v18 = v25;
              id v5 = v54;
            }
            v34 = (void *)MEMORY[0x1E4F1CB10];
            uint64_t v35 = objc_msgSend(v24, "directory", v52, v53);
            uint64_t v36 = [v34 fileURLWithPath:v35];

            id v62 = 0;
            LOBYTE(v35) = [v36 getResourceValue:&v62 forKey:v57 error:0];
            id v37 = v62;
            if ((v35 & 1) == 0)
            {
              v56 = v21;
              v38 = v5;
              v39 = [MEMORY[0x1E4F28CB8] defaultManager];
              id v61 = 0;
              char v40 = [v39 createDirectoryAtURL:v36 withIntermediateDirectories:1 attributes:0 error:&v61];
              id v41 = v61;

              if ((v40 & 1) == 0)
              {
                int64_t v42 = PLPhotoSharingGetLog();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v72 = v36;
                  __int16 v73 = 2114;
                  v74 = v22;
                  __int16 v75 = 2112;
                  id v76 = v41;
                  _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\" for asset %{public}@: %@", buf, 0x20u);
                }
              }
              id v5 = v38;
              double v18 = v55;
              uint64_t v21 = v56;
            }
          }
          else
          {
            uint64_t v36 = [*(id *)(a1 + 32) _createPlaceHolderInSharedAlbum:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
            if (v36) {
              [*(id *)(a1 + 48) addObject:v36];
            }
          }

          if (v59)
          {
            int v43 = [*(id *)(a1 + 32) attemptLightweightReimportAssetDataInLibrary:*(void *)(a1 + 40)];
            if (v43)
            {
              int v44 = v43;
              int64_t v45 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                uint64_t v46 = [*(id *)(a1 + 32) currentCloudAssetGUID];
                *(_DWORD *)buf = 138412546;
                v72 = v46;
                __int16 v73 = 1024;
                LODWORD(v74) = v44;
                _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "lightweight reimport of %@ asset data (kind = %i) successful, excluding from MSAS server request queue", buf, 0x12u);
              }
            }
          }
        }
        uint64_t v60 = [v18 countByEnumeratingWithState:&v63 objects:v77 count:16];
      }
      while (v60);
      id v6 = v52;
      uint64_t v3 = v53;
    }
  }
  else
  {
    double v18 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v47 = v18;
      id v48 = objc_opt_class();
      __int16 v49 = *(void **)(a1 + 32);
      id v50 = v48;
      uint64_t v51 = [v49 cloudAlbumGUID];
      *(_DWORD *)buf = 138412546;
      v72 = v48;
      double v18 = v47;
      __int16 v73 = 2112;
      v74 = v51;
      _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_ERROR, "%@ ERROR: couldn't find album with GUID %@ to insert assets", buf, 0x16u);
    }
  }
}

void __89__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetMetadataForCollectionsJobType__block_invoke_350(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v2 = +[PLNotificationManager sharedManager];
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) mstreamdInfoDictionary];
    [v2 noteDidReceiveAssets:v4 forSharedAlbum:v3 mstreamdInfo:v5];
  }
  id v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 40) assetCollectionInfos];
    int v8 = 134217984;
    uint64_t v9 = [v7 count];
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationSaveAssetMetadataForCollectionsJobType did process metadata for %lu collections", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_performSaveTransactionAndWaitOnLibrary:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PLCloudSharedAssetSaveJob__performSaveTransactionAndWaitOnLibrary_transaction_completion___block_invoke;
  v10[3] = &unk_1E58742F0;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [a3 performTransactionAndWait:a4 completionHandler:v10];
}

uint64_t __92__PLCloudSharedAssetSaveJob__performSaveTransactionAndWaitOnLibrary_transaction_completion___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v10 + 1) + 8 * i);
        notify_post((const char *)[v7 UTF8String]);
        id v8 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v15 = v7;
          _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Broadcasting '%@'", buf, 0xCu);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_addDownloadNotification:(id)a3
{
  id v4 = a3;
  pendingDownloadNotifications = self->_pendingDownloadNotifications;
  id v8 = v4;
  if (!pendingDownloadNotifications)
  {
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = self->_pendingDownloadNotifications;
    self->_pendingDownloadNotifications = v6;

    id v4 = v8;
    pendingDownloadNotifications = self->_pendingDownloadNotifications;
  }
  [(NSMutableArray *)pendingDownloadNotifications addObject:v4];
}

- (signed)attemptLightweightReimportAssetDataInLibrary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
  id v6 = [(PLCloudSharedAssetSaveJob *)self cloudPersonID];
  id v7 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
  id v8 = [(id)objc_opt_class() _lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID:v5 cloudPersonID:v6];
  id v9 = [v8 objectForKey:v7];
  long long v10 = v9;
  if (v9)
  {
    id v40 = v4;
    long long v11 = [v9 objectForKey:@"cloudPlaceholderKind"];
    long long v12 = v11;
    v39 = v8;
    if (v11)
    {
      unsigned __int16 v13 = [v11 intValue];
    }
    else
    {
      uint64_t v14 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)int v43 = v7;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Missing placeholder kind value for asset with cloudAssetGUID %@, skipping lightweight reimport of unknown cache data", buf, 0xCu);
      }

      unsigned __int16 v13 = 0;
    }
    uint64_t v36 = v5;
    v38 = v6;
    uint64_t v15 = +[PLCloudSharedAlbum lightweightReimportDirectoryNameWithGUID:v5 cloudPersonID:v6];
    uint64_t v16 = +[PLManagedAsset lightweightReimportFileNameWithGUID:v7 type:0];
    uint64_t v17 = [(PLDaemonJob *)self libraryServicesManager];
    double v18 = [v17 pathManager];
    double v19 = [v18 privateCacheDirectoryWithSubType:3];
    id v37 = (void *)v15;
    uint64_t v20 = [v19 stringByAppendingPathComponent:v15];

    uint64_t v21 = (void *)v16;
    id v22 = [v20 stringByAppendingPathComponent:v16];
    __int16 v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v24 = v23;
    if (v22)
    {
      uint64_t v35 = v23;
      if ([v23 fileExistsAtPath:v22 isDirectory:0])
      {
        if (v12 && v13 <= 7u && ((1 << v13) & 0x98) != 0)
        {
          uint64_t v25 = v20;
          v26 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v27 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetMediaAssetType];
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)int v43 = v13;
            uint64_t v21 = (void *)v16;
            *(_WORD *)&v43[4] = 2048;
            *(void *)&v43[6] = v27;
            *(_WORD *)&v43[14] = 2112;
            *(void *)&v43[16] = v7;
            __int16 v44 = 2112;
            int64_t v45 = v22;
            _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "attemptLightweightReimportAssetWithPlaceholderKind:%i mediaAssetType: %lu GUID: %@ cachePath: %@", buf, 0x26u);
          }

          BOOL v28 = [(PLCloudSharedAssetSaveJob *)self _processSaveAssetWithPlaceholderKind:(__int16)v13 inLibrary:v40 withAssetDataFilePath:v22];
          uint64_t v5 = v36;
          v29 = v37;
          uint64_t v24 = v35;
          if (v28) {
            goto LABEL_31;
          }
          uint64_t v30 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)int v43 = v7;
            _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "lightweight reimport failed for asset %@", buf, 0xCu);
          }
        }
        else
        {
          int v31 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)int v43 = v7;
            *(_WORD *)&v43[8] = 2112;
            *(void *)&v43[10] = v22;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Cannot reimport chached data for asset %@: removing cached image file at path: %@", buf, 0x16u);
          }

          id v41 = 0;
          char v32 = [v35 removeItemAtPath:v22 error:&v41];
          uint64_t v30 = v41;
          uint64_t v25 = v20;
          if ((v32 & 1) == 0)
          {
            uint64_t v33 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)int v43 = v7;
              *(_WORD *)&v43[8] = 2112;
              *(void *)&v43[10] = v22;
              _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Failed to remove cached asset data for %@ from path: %@", buf, 0x16u);
            }
          }
          uint64_t v21 = (void *)v16;
          uint64_t v5 = v36;
          v29 = v37;
        }

        unsigned __int16 v13 = 0;
      }
      else
      {
        uint64_t v25 = v20;
        unsigned __int16 v13 = 0;
        uint64_t v5 = v36;
        v29 = v37;
      }
      uint64_t v24 = v35;
    }
    else
    {
      uint64_t v25 = v20;
      unsigned __int16 v13 = 0;
      uint64_t v5 = v36;
      v29 = v37;
    }
LABEL_31:

    id v8 = v39;
    id v4 = v40;
    id v6 = v38;
    goto LABEL_32;
  }
  long long v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)int v43 = v7;
    *(_WORD *)&v43[8] = 2112;
    *(void *)&v43[10] = v5;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Cloud shared asset %@ not registered with album %@", buf, 0x16u);
  }
  unsigned __int16 v13 = 0;
LABEL_32:

  return v13;
}

- (void)_updatePhotoIrisPropertiesIfNecessaryForAsset:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  if ([self->_currentAssetCollectionInfo isPhotoIris])
  {
    if (([v5 isPhotoIris] & 1) == 0) {
      [v5 setKindSubtype:2];
    }
    if ([v5 playbackStyle] != 3) {
      [v5 setPlaybackStyle:3];
    }
    if (![v5 videoCpDurationValue])
    {
      id v6 = [self->_currentAssetCollectionInfo metaData];
      id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F5C418]];

      if (v7)
      {
        memset(&v15, 0, sizeof(v15));
        [v7 doubleValue];
        CMTimeMakeWithSeconds(&v15, v8, 600);
        CMTime v14 = v15;
        [v5 setPhotoIrisVideoDuration:&v14];
      }
      id v9 = [self->_currentAssetCollectionInfo metaData];
      long long v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F5C410]];

      if (v10)
      {
        memset(&v15, 0, sizeof(v15));
        [v10 doubleValue];
        CMTimeMakeWithSeconds(&v15, v11, 600);
        CMTime v14 = v15;
        [v5 setPhotoIrisStillDisplayTime:&v14];
      }
      long long v12 = [self->_currentAssetCollectionInfo metaData];
      unsigned __int16 v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F5C408]];

      if (v13) {
        [v5 setMediaGroupUUID:v13];
      }
    }
  }
}

- (void)_updateAsset:(id)a3 withImageFileURL:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F8CC48]);
  id v9 = [(PLDaemonJob *)self libraryServicesManager];
  long long v10 = [v9 libraryBundle];
  Float64 v11 = [v10 timeZoneLookup];
  long long v12 = (void *)[v8 initWithImageURL:v7 contentType:0 options:13 timeZoneLookup:v11 cacheImageSource:1 cacheImageData:1];

  if (PLPlatformExtendedAttributesSupported())
  {
    [v6 setImageInfoFromOriginalImageMetadata:v12];
    unsigned __int16 v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Setting the image info for asset %@ with %@", (uint8_t *)&v24, 0x16u);
    }
  }
  uint64_t v14 = [v12 imageSource];
  CMTime v15 = [v12 imageData];
  [v6 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:v14 imageData:v15 forceSRGBConversion:0];

  uint64_t v16 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v6 uuid];
    int v24 = 138412546;
    id v25 = v17;
    __int16 v26 = 2112;
    id v27 = v7;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Generated new thumbnail for asset %@ with %@", (uint8_t *)&v24, 0x16u);
  }
  double v18 = [v6 location];

  if (!v18)
  {
    double v19 = [v12 gpsLocation];
    [v6 setLocation:v19];
  }
  uint64_t v20 = [v6 longDescription];

  if (!v20)
  {
    uint64_t v21 = [v12 captionAbstract];
    [v6 setLongDescription:v21];
  }
  id v22 = [v6 accessibilityDescription];

  if (!v22)
  {
    __int16 v23 = [v12 artworkContentDescription];
    [v6 setAccessibilityDescription:v23];
  }
}

- (BOOL)_processSaveAssetWithPlaceholderKind:(signed __int16)a3 inLibrary:(id)a4 withAssetDataFilePath:(id)a5
{
  unsigned int v126 = a3;
  v148[1] = *MEMORY[0x1E4F143B8];
  id v122 = a4;
  id v7 = a5;
  v116 = v7;
  if (v7)
  {
    v124 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
  }
  else
  {
    v124 = 0;
  }
  id v8 = [MEMORY[0x1E4F1CA80] set];
  id v9 = v8;
  if (v124) {
    objc_msgSend(v8, "addObject:");
  }
  v123 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
  long long v10 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
  Float64 v11 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v10 inLibrary:v122];

  if (v11)
  {
    v148[0] = v123;
    long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:1];
    unsigned __int16 v13 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v12 inLibrary:v122];

    if ((unint64_t)[v13 count] >= 2)
    {
      uint64_t v14 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v141 = v123;
        __int16 v142 = 2112;
        uint64_t v143 = (uint64_t)v13;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one asset with cloudAssetGUID %@, returning last one in array %@", buf, 0x16u);
      }
    }
    CMTime v15 = [v13 lastObject];
    uint64_t v16 = v15;
    if (!v15)
    {
      uint64_t v46 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v141 = v123;
        _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_ERROR, "Couldn't find asset with cloudAssetGUID %{public}@ ", buf, 0xCu);
      }

      uint64_t v44 = [NSString stringWithFormat:@"%@ ERROR: couldn't find asset with cloudAssetGUID %@ ", objc_opt_class(), v123];
      v121 = 0;
      BOOL v115 = 0;
      uint64_t v45 = 197704;
      goto LABEL_100;
    }
    int v120 = [v15 cloudPlaceholderKind];
    v125 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v17 = [(__CFString *)v124 path];
    char v18 = [v125 fileExistsAtPath:v17];

    if ((v18 & 1) == 0)
    {
      v47 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        id v48 = [(__CFString *)v124 path];
        *(_DWORD *)buf = 138412290;
        v141 = v48;
        _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_ERROR, "InProcess file \"%@\" not found.", buf, 0xCu);
      }
      __int16 v49 = NSString;
      uint64_t v50 = objc_opt_class();
      uint64_t v51 = [(__CFString *)v124 path];
      uint64_t v44 = [v49 stringWithFormat:@"%@ ERROR: InProcess file \"%@\" not found.", v50, v51];
      v121 = 0;
      BOOL v115 = 0;
      uint64_t v45 = 197704;
      goto LABEL_99;
    }
    uint64_t v146 = *MEMORY[0x1E4F28370];
    uint64_t v147 = *MEMORY[0x1E4F28358];
    double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
    uint64_t v20 = [(__CFString *)v124 path];
    id v138 = 0;
    char v21 = [v125 setAttributes:v19 ofItemAtPath:v20 error:&v138];
    id v113 = v138;

    if ((v21 & 1) == 0)
    {
      id v22 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = [(__CFString *)v124 path];
        *(_DWORD *)buf = 138412546;
        v141 = v23;
        __int16 v142 = 2112;
        uint64_t v143 = (uint64_t)v113;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
      }
    }
    v117 = [v16 cloudSharedAssetPathForPlaceholderKind:v126];
    if (![v117 length]
      || ([MEMORY[0x1E4F1CB10] fileURLWithPath:v117],
          v118 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
          v118,
          !v118))
    {
      id v52 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = [(__CFString *)v124 path];
        *(_DWORD *)buf = 138412290;
        v141 = v53;
        _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "No destination URL to move %@ to", buf, 0xCu);
      }
      uint64_t v54 = NSString;
      uint64_t v55 = objc_opt_class();
      v118 = [(__CFString *)v124 path];
      uint64_t v44 = [v54 stringWithFormat:@"%@ ERROR: No destination URL to move %@ to", v55, v118];
      v121 = 0;
      BOOL v115 = 0;
      uint64_t v45 = 197702;
      goto LABEL_98;
    }
    int v24 = [(__CFString *)v118 path];
    int v25 = [v125 fileExistsAtPath:v24];

    if (v25)
    {
      id v137 = 0;
      int v26 = [v125 removeItemAtURL:v118 error:&v137];
      id v27 = (__CFString *)v137;
      if (!v26)
      {
        v112 = v27;
        v56 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          uint64_t v57 = [(__CFString *)v118 path];
          uint64_t v58 = [(__CFString *)v124 path];
          *(_DWORD *)buf = 138412802;
          v141 = v57;
          __int16 v142 = 2112;
          uint64_t v143 = (uint64_t)v58;
          __int16 v144 = 2112;
          v145 = v112;
          _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "Unable to remove \"%@\" before replacing it with \"%@\": %@", buf, 0x20u);
        }
        int v59 = NSString;
        uint64_t v60 = objc_opt_class();
        uint64_t v33 = [(__CFString *)v118 path];
        id v61 = [(__CFString *)v124 path];
        uint64_t v62 = [v59 stringWithFormat:@"%@ ERROR: Unable to remove \"%@\" before replacing it with \"%@\": %@", v60, v33, v61, v112];
        goto LABEL_70;
      }
    }
    [(__CFString *)v118 URLByDeletingLastPathComponent];
    id v136 = 0;
    v112 = (__CFString *)objc_claimAutoreleasedReturnValue();
    char v28 = [(__CFString *)v112 getResourceValue:&v136 forKey:*MEMORY[0x1E4F1C5C0] error:0];
    id v29 = v136;
    if ((v28 & 1) == 0)
    {
      uint64_t v30 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v135 = 0;
      char v31 = [v30 createDirectoryAtURL:v112 withIntermediateDirectories:1 attributes:0 error:&v135];
      v111 = (__CFString *)v135;

      if ((v31 & 1) == 0)
      {
        uint64_t v33 = v29;
        v83 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v141 = v112;
          __int16 v142 = 2114;
          uint64_t v143 = (uint64_t)v123;
          __int16 v144 = 2112;
          v145 = v111;
          _os_log_impl(&dword_19B3C7000, v83, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\" for asset %{public}@: %@", buf, 0x20u);
        }
        v121 = 0;
        BOOL v115 = 0;
        goto LABEL_96;
      }
    }
    if (self->_replacingOriginalWithDerivative)
    {
      char v32 = [v16 pathForOriginalFile];
      uint64_t v33 = v29;
      if ([v125 fileExistsAtPath:v32])
      {
        id v134 = 0;
        char v34 = [v125 removeItemAtPath:v32 error:&v134];
        uint64_t v35 = (__CFString *)v134;
        if ((v34 & 1) == 0)
        {
          uint64_t v36 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            id v37 = (__CFString *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v141 = v37;
            __int16 v142 = 2112;
            uint64_t v143 = (uint64_t)v32;
            __int16 v144 = 2112;
            v145 = v35;
            v38 = v37;
            _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_ERROR, "%@ ERROR: (streamed-video-replacement) Unable to remove original video file \"%@\" error:%@", buf, 0x20u);

            uint64_t v33 = v29;
          }
        }
      }
      if ([v16 isVideo] && (objc_msgSend(v16, "isStreamedVideo") & 1) == 0) {
        [v16 setKindSubtype:100];
      }

      int v120 = 2;
      v39 = v118;
    }
    else
    {
      v39 = v118;
      uint64_t v33 = v29;
    }
    id v133 = 0;
    int v63 = [MEMORY[0x1E4F8B908] copyItemAtURL:v124 toURL:v39 error:&v133];
    long long v64 = (__CFString *)v133;
    v111 = v64;
    if (v63)
    {
      long long v65 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v141 = v124;
        __int16 v142 = 2112;
        uint64_t v143 = (uint64_t)v39;
        _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_DEBUG, "Successfully copied %@ to %@", buf, 0x16u);
      }

      long long v66 = v118;
      if (([v16 hasMasterThumb] & 1) != 0 || v126 > 7 || ((1 << v126) & 0x98) == 0)
      {
        if (self->_replacingOriginalWithDerivative)
        {
          long long v67 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            int v68 = [v16 kind];
            uint64_t v69 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
            long long v70 = (void *)v69;
            v71 = @"size";
            if (!v68) {
              v71 = @"image width, height and size";
            }
            *(_DWORD *)buf = 138412546;
            v141 = v71;
            __int16 v142 = 2112;
            uint64_t v143 = v69;
            _os_log_impl(&dword_19B3C7000, v67, OS_LOG_TYPE_DEFAULT, "Setting %@ for asset with cloudGUID %@", buf, 0x16u);
          }
          v72 = [(PLCloudSharedAssetSaveJob *)self assetCollectionInfos];
          __int16 v73 = [v72 firstObject];

          v74 = [v73 width];
          objc_msgSend(v16, "setWidth:", objc_msgSend(v74, "longLongValue"));

          __int16 v75 = [v73 height];
          objc_msgSend(v16, "setHeight:", objc_msgSend(v75, "longLongValue"));

          id v76 = [v73 originalFilesize];
          objc_msgSend(v16, "setOriginalFilesize:", objc_msgSend(v76, "longLongValue"));

          [v16 setSpatialType:0];
          if (PLPlatformExtendedAttributesSupported())
          {
            if ([v16 kind])
            {
              if ([v16 kind] == 1)
              {
                v77 = [v73 metaData];
                v78 = [v77 objectForKey:*MEMORY[0x1E4F5C430]];

                uint64_t v79 = [v16 extendedAttributesCreateIfNeeded:v78 != 0];
                v80 = v79;
                if (v78) {
                  [v79 setDuration:v78];
                }
              }
            }
            else
            {
              [(PLCloudSharedAssetSaveJob *)self _updateAsset:v16 withImageFileURL:v118];
            }
          }

          long long v66 = v118;
        }
      }
      else
      {
        v84 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          v85 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
          *(_DWORD *)buf = 138412290;
          v141 = v85;
          _os_log_impl(&dword_19B3C7000, v84, OS_LOG_TYPE_DEFAULT, "Generating new thumbnails for asset with cloudGUID %@", buf, 0xCu);
        }
        long long v66 = v118;
        [(PLCloudSharedAssetSaveJob *)self _updateAsset:v16 withImageFileURL:v118];
      }
      if (v126 == 3 && [v16 hasMasterThumb])
      {
        id v132 = 0;
        char v86 = [v125 removeItemAtURL:v66 error:&v132];
        id v87 = v132;
        if ((v86 & 1) == 0)
        {
          v88 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v141 = v118;
            __int16 v142 = 2112;
            uint64_t v143 = (uint64_t)v87;
            _os_log_impl(&dword_19B3C7000, v88, OS_LOG_TYPE_ERROR, "Unable to remove thumbnail resource from %@ after generating local thumb: %@", buf, 0x16u);
          }
        }
      }
      if (v120 < (int)v126) {
        [v16 setCloudPlaceholderKind:v126];
      }
      v89 = [v16 uuid];
      v83 = +[PLPhotoSharingHelper downloadNotificationForAssetwithUUID:v89 cloudPlaceholderKind:v126];

      [(PLCloudSharedAssetSaveJob *)self _addDownloadNotification:v83];
      if (v120 != v126)
      {
        v90 = +[PLNotificationManager sharedManager];
        v91 = [(PLCloudSharedAssetSaveJob *)self mstreamdInfoDictionary];
        [v90 noteDidChangePlaceholderKindForAsset:v16 fromOldKind:v120 forSharedAlbum:v11 mstreamdInfo:v91];
      }
      [(PLCloudSharedAssetSaveJob *)self _processInFlightCommentsForAsset:v16 inAlbum:v11 inPhotoLibrary:v122];
      v92 = NSString;
      if (self->_replacingOriginalWithDerivative)
      {
        v93 = [(__CFString *)v124 path];
        v121 = [v92 stringWithFormat:@"found recently uploaded derivative at %@ and replaced original for asset %@ \n ", v93, v16];
      }
      else
      {
        v121 = [NSString stringWithFormat:@"finished processing downloaded asset %@ \n", v16];
      }
      BOOL v115 = 1;
LABEL_96:

      uint64_t v45 = 0;
      uint64_t v44 = 0;
      id v61 = v111;
      goto LABEL_97;
    }
    v81 = v64;
    v82 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v141 = v124;
      __int16 v142 = 2112;
      uint64_t v143 = (uint64_t)v39;
      __int16 v144 = 2112;
      v145 = v81;
      _os_log_impl(&dword_19B3C7000, v82, OS_LOG_TYPE_ERROR, "Unable to copy \"%@\" to \"%@\": %@", buf, 0x20u);
    }

    id v61 = v111;
    uint64_t v62 = [NSString stringWithFormat:@"%@ ERROR: Unable to copy \"%@\" to \"%@\": %@", objc_opt_class(), v124, v118, v111];
LABEL_70:
    uint64_t v44 = v62;
    v121 = 0;
    BOOL v115 = 0;
    uint64_t v45 = 197702;
LABEL_97:

LABEL_98:
    uint64_t v51 = v113;
LABEL_99:

LABEL_100:
    goto LABEL_101;
  }
  id v40 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    id v41 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
    *(_DWORD *)buf = 138543618;
    v141 = v41;
    __int16 v142 = 2114;
    uint64_t v143 = (uint64_t)v123;
    _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_ERROR, "Couldn't find album with GUID %{public}@ to insert asset %{public}@", buf, 0x16u);
  }
  int64_t v42 = NSString;
  uint64_t v43 = objc_opt_class();
  unsigned __int16 v13 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
  uint64_t v44 = [v42 stringWithFormat:@"%@ ERROR: couldn't find album with GUID %@ to insert asset %@", v43, v13, v123];
  v121 = 0;
  BOOL v115 = 0;
  uint64_t v45 = 197701;
LABEL_101:

  if (v44)
  {
    v94 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v44 forKey:*MEMORY[0x1E4F28228]];
    v119 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PLCloudSharedAssetSaveJob" code:v45 userInfo:v94];
  }
  else
  {
    v119 = 0;
  }
  if ([(PLCloudSharedAssetSaveJob *)self isProcessingThumbnail]) {
    unsigned int v95 = 290;
  }
  else {
    unsigned int v95 = 291;
  }
  if (self->_replacingOriginalWithDerivative) {
    uint64_t v96 = 292;
  }
  else {
    uint64_t v96 = v95;
  }
  if (v126 != 2)
  {
    v97 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
    v98 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
    +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:v97 albumGUID:v98 content:v121 state:v96 error:v119];
  }
  v114 = (void *)v44;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  id v99 = v9;
  uint64_t v100 = [v99 countByEnumeratingWithState:&v128 objects:v139 count:16];
  if (v100)
  {
    uint64_t v101 = *(void *)v129;
    do
    {
      for (uint64_t i = 0; i != v100; ++i)
      {
        if (*(void *)v129 != v101) {
          objc_enumerationMutation(v99);
        }
        v103 = *(__CFString **)(*((void *)&v128 + 1) + 8 * i);
        v104 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v141 = v103;
          _os_log_impl(&dword_19B3C7000, v104, OS_LOG_TYPE_DEFAULT, "Will remove INFLIGHT item at %@", buf, 0xCu);
        }

        v105 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v127 = 0;
        char v106 = [v105 removeItemAtURL:v103 error:&v127];
        id v107 = v127;

        if ((v106 & 1) == 0)
        {
          v108 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
          {
            v109 = [(__CFString *)v103 path];
            *(_DWORD *)buf = 138412546;
            v141 = v109;
            __int16 v142 = 2112;
            uint64_t v143 = (uint64_t)v107;
            _os_log_impl(&dword_19B3C7000, v108, OS_LOG_TYPE_ERROR, "Unable to delete in flight asset \"%@\": %@", buf, 0x16u);
          }
        }
      }
      uint64_t v100 = [v99 countByEnumeratingWithState:&v128 objects:v139 count:16];
    }
    while (v100);
  }

  return v115;
}

- (void)_processInFlightCommentsForAsset:(id)a3 inAlbum:(id)a4 inPhotoLibrary:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  id v9 = a5;
  long long v10 = [v9 pathManager];
  Float64 v11 = [v10 directoryPathForInFlightComments:0];
  v38 = v8;
  long long v12 = [v8 cloudAssetGUID];
  unsigned __int16 v13 = [v11 stringByAppendingPathComponent:v12];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v13];
    if (v14)
    {
      CMTime v15 = (void *)v14;
      uint64_t v16 = +[PLCloudSharedComment cloudSharedCommentsWithGUIDs:v14 inLibrary:v9];
      uint64_t v17 = [v15 count];
      if (v17 != [v16 count])
      {
        char v18 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [v15 count];
          uint64_t v20 = [v38 cloudAssetGUID];
          *(_DWORD *)buf = 134218498;
          uint64_t v45 = v19;
          __int16 v46 = 2112;
          v47 = v20;
          __int16 v48 = 2048;
          uint64_t v49 = [v16 count];
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "WARNING: Expected %lu inflight comments for asset %@ but only found %lu", buf, 0x20u);
        }
      }
      uint64_t v35 = v15;
      uint64_t v36 = v13;
      if ([v16 count])
      {
        char v21 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [v16 count];
          __int16 v23 = [v38 cloudAssetGUID];
          *(_DWORD *)buf = 134218242;
          uint64_t v45 = v22;
          __int16 v46 = 2112;
          v47 = v23;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Will attach %lu inflight comments to asset %@", buf, 0x16u);
        }
      }
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v24 = v16;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v40 != v27) {
              objc_enumerationMutation(v24);
            }
            id v29 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            [v38 addComment:v29];
            int v30 = [v29 isLikeBoolValue];
            char v31 = +[PLNotificationManager sharedManager];
            char v32 = [(PLCloudSharedAssetSaveJob *)self mstreamdInfoDictionary];
            if (v30) {
              [v31 noteDidReceiveLike:v29 mstreamdInfo:v32];
            }
            else {
              [v31 noteDidReceiveComment:v29 mstreamdInfo:v32];
            }

            if ([v29 isInterestingForAlbumsSorting])
            {
              uint64_t v33 = [v29 commentDate];
              [v37 updateCloudLastInterestingChangeDateWithDate:v33];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v26);
      }

      char v34 = [MEMORY[0x1E4F28CB8] defaultManager];
      unsigned __int16 v13 = v36;
      [v34 removeItemAtPath:v36 error:0];
    }
  }
}

- (id)_createPlaceHolderInSharedAlbum:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v75 = a3;
  id v76 = [v75 photoLibrary];
  LOWORD(v67) = 257;
  id v4 = +[PLManagedAsset insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:](PLManagedAsset, "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v76, 0, 0, [MEMORY[0x1E4F8BA10] savedAssetTypeForCloudSharedAsset], 2, 0, 0, 0, 0, v67);
  id v5 = v4;
  if (v4)
  {
    [v4 setVisibilityState:2];
    id v6 = [self->_currentAssetCollectionInfo width];
    uint64_t v7 = [v6 longLongValue];

    id v8 = [self->_currentAssetCollectionInfo height];
    uint64_t v9 = [v8 longLongValue];

    [v5 setWidth:v7];
    [v5 setOriginalWidth:v7];
    [v5 setHeight:v9];
    [v5 setOriginalHeight:v9];
    long long v10 = [self->_currentAssetCollectionInfo originalFilesize];
    objc_msgSend(v5, "setOriginalFilesize:", objc_msgSend(v10, "longLongValue"));

    Float64 v11 = [self->_currentAssetCollectionInfo originalFilename];
    [v5 setOriginalFilename:v11];

    v74 = [self->_currentAssetCollectionInfo metaData];
    uint64_t v12 = [v74 objectForKey:*MEMORY[0x1E4F5C400]];
    if (v12) {
      goto LABEL_9;
    }
    unsigned __int16 v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't find a creation date, setting to modification date", buf, 2u);
    }

    uint64_t v12 = [v5 modificationDate];
    if (v12) {
      goto LABEL_9;
    }
    uint64_t v14 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't find a creation date, setting to now", buf, 2u);
    }

    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    if (v12) {
LABEL_9:
    }
      [v5 setDateCreated:v12];
    uint64_t v69 = (void *)v12;
    v72 = [v74 objectForKey:*MEMORY[0x1E4F5C420]];
    if (v72)
    {
      if ([v72 length])
      {
        CLLocationDegrees v77 = 0.0;
        *(void *)buf = 0;
        if ([MEMORY[0x1E4F8CC48] parseISO6709String:v72 outLatitude:buf outLongitude:&v77])
        {
          CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)buf, v77);
          if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
          {
            uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5F0]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v12, v15.latitude, v15.longitude, 0.0, 0.0, 0.0);
            if (v16) {
              [v5 setLocation:v16];
            }
          }
          else
          {
            uint64_t v16 = 0;
          }
        }
      }
    }
    if ([self->_currentAssetCollectionInfo isVideo])
    {
      [v5 updateAssetKindAndPlaybackStyleIfNeededWithKind:1];
      [v5 setKindSubtype:100];
      uint64_t v25 = [v74 objectForKey:*MEMORY[0x1E4F5C430]];
      uint64_t v26 = v25;
      if (v25)
      {
        [v25 doubleValue];
        objc_msgSend(v5, "setDuration:");
        if (PLPlatformExtendedAttributesSupported())
        {
          uint64_t v27 = [v5 extendedAttributesCreateIfNeeded:1];
          [v27 setDuration:v26];
        }
        char v28 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          id v29 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v29;
          __int16 v79 = 2112;
          id v80 = v26;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEFAULT, "setting video duration from metadata for cloudGUID %@ to %@", buf, 0x16u);
        }
      }
    }
    else
    {
      [v5 updateAssetKindAndPlaybackStyleIfNeededWithKind:0];
    }
    int v30 = [v74 objectForKey:*MEMORY[0x1E4F5C428]];
    unsigned __int16 v31 = [v30 unsignedIntValue];

    [v5 setPlaybackVariationAndLoopingPlaybackStyleWithPlaybackVariation:v31];
    __int16 v73 = [self->_currentAssetCollectionInfo derivativeUTI];
    if (v73)
    {
      [v5 setUniformTypeIdentifier:v73];
      char v32 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v73];
      int v33 = [v32 isEqual:*MEMORY[0x1E4F443D0]];

      if (v33) {
        [v5 setPlaybackStyle:2];
      }
    }
    [v69 timeIntervalSinceReferenceDate];
    objc_msgSend(v5, "setSortToken:");
    objc_msgSend(v5, "setSavedAssetType:", objc_msgSend(MEMORY[0x1E4F8BA10], "savedAssetTypeForCloudSharedAsset"));
    [v5 setBundleScope:2];
    char v34 = [self->_currentAssetCollectionInfo personID];
    [v5 setCloudOwnerHashedPersonID:v34];

    objc_msgSend(v5, "setCloudIsDeletable:", -[AssetCollectionInfo isDeletable](self->_currentAssetCollectionInfo, "isDeletable"));
    objc_msgSend(v5, "setCloudIsMyAsset:", -[AssetCollectionInfo isMine](self->_currentAssetCollectionInfo, "isMine"));
    [v5 setCloudPlaceholderKind:2];
    uint64_t v35 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
    [v5 setCloudAssetGUID:v35];

    uint64_t v36 = [NSNumber numberWithInt:0];
    [v5 setCloudDownloadRequests:v36];

    uint64_t v37 = [self->_currentAssetCollectionInfo timestamp];
    if (v37) {
      [v5 setCloudServerPublishDate:v37];
    }
    int v68 = (void *)v37;
    v38 = [v5 uniformTypeIdentifier];
    long long v70 = +[PLManagedAsset preferredFileExtensionForType:v38];

    long long v39 = [(PLCloudSharedAssetSaveJob *)self cloudPersonID];
    long long v40 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
    long long v41 = [v76 pathManager];
    long long v42 = [v5 uuid];
    uint64_t v43 = +[PLCloudSharedAssetSaveJob nextDCIMSaveFileURLForCloudPersonID:v39 cloudAlbumGUID:v40 pathManager:v41 fileExtension:v70 assetUUID:v42];

    uint64_t v44 = [v43 path];
    uint64_t v45 = [v44 stringByDeletingLastPathComponent];

    v71 = [v43 lastPathComponent];
    if (v45 && v71)
    {
      __int16 v46 = [v76 pathManager];
      int v47 = [v46 isUBF];

      __int16 v48 = [v76 pathManager];
      uint64_t v49 = v48;
      if (v47) {
        uint64_t v50 = 22;
      }
      else {
        uint64_t v50 = 31;
      }
      uint64_t v51 = [v48 assetAbbreviatedMetadataDirectoryForDirectory:v45 type:v50 bundleScope:0];

      id v52 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v51;
        __int16 v79 = 2112;
        id v80 = v71;
        __int16 v81 = 2112;
        v82 = v53;
        _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEFAULT, "setting directory/filename to %@/%@ for cloudSharedAsset %@", buf, 0x20u);
      }
      [v5 setDirectory:v51];
      [v5 setFilename:v71];
    }
    else
    {
      uint64_t v54 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        id v55 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
        v56 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v43;
        __int16 v79 = 2112;
        id v80 = v55;
        __int16 v81 = 2112;
        v82 = v70;
        __int16 v83 = 2112;
        v84 = v56;
        _os_log_impl(&dword_19B3C7000, v54, OS_LOG_TYPE_ERROR, "unable to get directory/filename from %@ for cloudSharedAsset %@ with extension %@ in album %@", buf, 0x2Au);
      }
      uint64_t v51 = v45;
    }
    uint64_t v57 = [v76 managedObjectContext];
    [(PLCloudSharedAssetSaveJob *)self _updatePhotoIrisPropertiesIfNecessaryForAsset:v5 inManagedObjectContext:v57];

    uint64_t v58 = [v74 valueForKey:*MEMORY[0x1E4F5C3F8]];
    if (v58) {
      [v5 setCloudBatchID:v58];
    }
    int v59 = [v74 valueForKey:*MEMORY[0x1E4F5C3F0]];
    if (v59) {
      [v5 setCloudBatchPublishDate:v59];
    }
    if ([self->_currentAssetCollectionInfo isMine]) {
      [v75 updateCloudLastContributionDateWithDate:v59];
    }
    unint64_t v60 = [(PLCloudSharedAssetSaveJob *)self _insertionIndexForAsset:v5 inAlbum:v75];
    id v61 = [v75 mutableAssets];
    [v61 insertObject:v5 atIndex:v60];

    uint64_t v62 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      id v63 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
      long long v64 = [v5 dateCreated];
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v63;
      __int16 v79 = 2112;
      id v80 = v58;
      __int16 v81 = 2112;
      v82 = v59;
      __int16 v83 = 2112;
      v84 = v64;
      __int16 v85 = 2048;
      unint64_t v86 = v60;
      _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEFAULT, "Inserted new asset (GUID:%@ cloudAssetBatchID:%@ cloudAssetBatchDate:%@ dateCreated:%@) at index %lu", buf, 0x34u);
    }
    [v75 updateCloudLastInterestingChangeDateWithDate:v59];
    [(PLCloudSharedAssetSaveJob *)self _processInFlightCommentsForAsset:v5 inAlbum:v75 inPhotoLibrary:v76];
    +[PLResourceInstaller installInternalResourcesForExistingAsset:v5 assumeNoExistingResources:1 referencedResourceURLs:0 error:0];

    id v65 = v5;
  }
  else
  {
    uint64_t v17 = NSString;
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
    uint64_t v20 = [v17 stringWithFormat:@"%@ ERROR: in insertAssetIntoPhotoLibrary:asset GUID:%@", v18, v19];

    if (v20)
    {
      char v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v20 forKey:*MEMORY[0x1E4F28568]];
      uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.PLCloudSharedAssetSaveJob" code:197703 userInfo:v21];
      __int16 v23 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = objc_opt_class();
        __int16 v79 = 2112;
        id v80 = v22;
        id v24 = *(id *)&buf[4];
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "%@: Error creating placeholder: %@", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (void)executeDaemonOperationSaveAssetJobType
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetMediaAssetType];
  id v4 = [(NSArray *)self->_assetCollectionInfos lastObject];
  currentAssetCollectionInfo = self->_currentAssetCollectionInfo;
  self->_currentAssetCollectionInfo = v4;

  id v6 = [self->_currentAssetCollectionInfo GUID];
  if (v6)
  {
    [(PLCloudSharedAssetSaveJob *)self setCurrentCloudAssetGUID:v6];
    [(PLCloudSharedAssetSaveJob *)self setIsVideo:[self->_currentAssetCollectionInfo isVideo]];
    [(PLCloudSharedAssetSaveJob *)self setIsPhotoIris:[self->_currentAssetCollectionInfo isPhotoIris]];
    uint64_t v7 = [(PLCloudSharingJob *)self transientPhotoLibrary];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetJobType__block_invoke;
    v11[3] = &unk_1E5875E40;
    id v12 = v7;
    unint64_t v13 = v3;
    v11[4] = self;
    id v8 = v7;
    [(PLCloudSharedAssetSaveJob *)self _performSaveTransactionAndWaitOnLibrary:v8 transaction:v11 completion:&__block_literal_global_74099];
  }
  else
  {
    if (MEMORY[0x19F38BDA0]()) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"executeDaemonOperationSaveAssetJobType missing current asset collection information: %@/%@", self->_assetCollectionInfos, self->_currentAssetCollectionInfo format];
    }
    id v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      assetCollectionInfos = self->_assetCollectionInfos;
      long long v10 = self->_currentAssetCollectionInfo;
      *(_DWORD *)buf = 138412546;
      CLLocationCoordinate2D v15 = assetCollectionInfos;
      __int16 v16 = 2112;
      uint64_t v17 = v10;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "executeDaemonOperationSaveAssetJobType missing current asset collection information: %@/%@", buf, 0x16u);
    }
  }
}

void __67__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetJobType__block_invoke(uint64_t a1)
{
  id v2 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationSaveAssetJobType will call _processSaveAssetWithPlaceholderKind", v7, 2u);
  }

  unint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 placeHolderKindFromAssetMetadataType:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) currentFilePath];
  [v3 _processSaveAssetWithPlaceholderKind:v4 inLibrary:v5 withAssetDataFilePath:v6];
}

void __67__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetJobType__block_invoke_284()
{
  v0 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19B3C7000, v0, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationSaveAssetJobType did call saveJobAssetWithDispatchGroup", v1, 2u);
  }
}

- (signed)placeHolderKindFromAssetMetadataType:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  signed __int16 v5 = 3;
  switch(a3)
  {
    case 1uLL:
      signed __int16 v5 = 5;
      break;
    case 2uLL:
      return v5;
    case 3uLL:
      signed __int16 v5 = 4;
      break;
    case 5uLL:
      signed __int16 v5 = 7;
      break;
    case 7uLL:
      if ([(PLCloudSharedAssetSaveJob *)self isVideo]) {
        signed __int16 v5 = 9;
      }
      else {
        signed __int16 v5 = 8;
      }
      break;
    default:
      id v6 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
        int v9 = 134218242;
        unint64_t v10 = a3;
        __int16 v11 = 2112;
        id v12 = v7;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "unrecognized asset type %lu for asset %@", (uint8_t *)&v9, 0x16u);
      }
      signed __int16 v5 = 1;
      break;
  }
  return v5;
}

- (BOOL)isProcessingThumbnail
{
  return [(PLCloudSharedAssetSaveJob *)self placeHolderKindFromAssetMetadataType:[(PLCloudSharedAssetSaveJob *)self currentCloudAssetMediaAssetType]] == 3;
}

- (void)runDaemonSide
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    uint64_t v49 = v4;
    __int16 v50 = 2112;
    uint64_t v51 = self;
    id v5 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);
  }
  int64_t v6 = [(PLCloudSharedAssetSaveJob *)self jobType];
  if (v6 == 1)
  {
    uint64_t v22 = NSString;
    __int16 v23 = [(PLCloudSharedAssetSaveJob *)self currentFilePath];
    id v24 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
    uint64_t v25 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
    id obj = [v22 stringWithFormat:@"path %@ asset GUID %@ album GUID %@ prioritize %d", v23, v24, v25, -[PLCloudSharingJob shouldPrioritize](self, "shouldPrioritize")];

    uint64_t v26 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
      BOOL v28 = [(PLCloudSharingJob *)self shouldPrioritize];
      *(_DWORD *)buf = 138412546;
      uint64_t v49 = v27;
      __int16 v50 = 1024;
      LODWORD(v51) = v28;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Saving asset %@ prioritize %d", buf, 0x12u);
    }
    unint64_t v10 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
    if ([(PLCloudSharedAssetSaveJob *)self isProcessingThumbnail]) {
      uint64_t v29 = 230;
    }
    else {
      uint64_t v29 = 231;
    }
    id v9 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
    +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:v10 albumGUID:v9 content:obj state:v29 error:0];
    goto LABEL_19;
  }
  if (v6) {
    goto LABEL_21;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(PLCloudSharedAssetSaveJob *)self assetCollectionInfos];
  uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = 0;
    unint64_t v10 = 0;
    uint64_t v39 = *(void *)v44;
    long long v40 = self;
    __int16 v11 = self;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v9;
      uint64_t v14 = v10;
      do
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(obj);
        }
        CLLocationCoordinate2D v15 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
        __int16 v16 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v17 = [v15 GUID];
        uint64_t v18 = NSString;
        uint64_t v19 = [(PLCloudSharedAssetSaveJob *)v11 cloudPersonID];
        uint64_t v20 = [(PLCloudSharedAssetSaveJob *)v11 cloudAlbumGUID];
        unint64_t v10 = [v18 stringWithFormat:@"personID %@ album GUID %@ collection %@", v19, v20, v17];

        id v9 = v17;
        char v21 = [(PLCloudSharedAssetSaveJob *)v11 cloudAlbumGUID];
        +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:v9 albumGUID:v21 content:v10 state:205 error:0];

        ++v12;
        uint64_t v13 = v9;
        uint64_t v14 = v10;
      }
      while (v8 != v12);
      uint64_t v8 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v8);
    self = v40;
LABEL_19:
  }
LABEL_21:
  int v30 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudSharedAssetSaveJob runDaemonSide]"];
  unsigned __int16 v31 = (void *)MEMORY[0x1E4F28B48];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __42__PLCloudSharedAssetSaveJob_runDaemonSide__block_invoke;
  v41[3] = &unk_1E5875E18;
  v41[4] = self;
  id v42 = v30;
  id v32 = v30;
  int v33 = [v31 blockOperationWithBlock:v41];
  if ([(PLCloudSharingJob *)self shouldPrioritize])
  {
    char v34 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
      *(_DWORD *)buf = 138412290;
      uint64_t v49 = v35;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Setting prioritize for %@", buf, 0xCu);
    }
    [v33 setQueuePriority:4];
    uint64_t v36 = [(id)objc_opt_class() highPriorityOperationQueue];
  }
  else
  {
    uint64_t v36 = [(id)objc_opt_class() lowPriorityOperationQueue];
  }
  uint64_t v37 = v36;
  [v36 addOperation:v33];
}

void __42__PLCloudSharedAssetSaveJob_runDaemonSide__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x19F38D3B0]();
  switch([*(id *)(a1 + 32) jobType])
  {
    case 0:
      [*(id *)(a1 + 32) executeDaemonOperationSaveAssetMetadataForCollectionsJobType];
      break;
    case 1:
      [*(id *)(a1 + 32) executeDaemonOperationSaveAssetJobType];
      break;
    case 2:
      [*(id *)(a1 + 32) executeDaemonOperationDeleteAssetJobType];
      break;
    case 3:
      [*(id *)(a1 + 32) executeDaemonOperationReplaceRecentlyUploadedOriginalJobType];
      break;
    case 4:
      [*(id *)(a1 + 32) executeDaemonOperationDownloadPendingAssetsJobType];
      break;
    default:
      break;
  }
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)PLCloudSharedAssetSaveJob;
  objc_msgSendSuper2(&v3, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

- (void)setupSaveAssetMetadataForCollectionsJobForAssetCollections:(id)a3 album:(id)a4 personID:(id)a5 info:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(PLCloudSharedAssetSaveJob *)self setJobType:0];
  uint64_t v22 = v11;
  uint64_t v14 = [v11 GUID];
  [(PLCloudSharedAssetSaveJob *)self setCloudAlbumGUID:v14];

  [(PLCloudSharedAssetSaveJob *)self setCloudPersonID:v12];
  CLLocationCoordinate2D v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        char v21 = [[AssetCollectionInfo alloc] initWithAssetCollection:*(void *)(*((void *)&v23 + 1) + 8 * v20)];
        [v15 addObject:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  if ([v15 count]) {
    [(PLCloudSharedAssetSaveJob *)self setAssetCollectionInfos:v15];
  }
  [(PLCloudSharedAssetSaveJob *)self setMstreamdInfoDictionary:v13];
}

- (int64_t)daemonOperation
{
  return 5;
}

- (void)dealloc
{
  pendingDownloadNotifications = self->_pendingDownloadNotifications;
  self->_pendingDownloadNotifications = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharedAssetSaveJob;
  [(PLCloudSharedAssetSaveJob *)&v4 dealloc];
}

- (id)description
{
  switch([(PLCloudSharedAssetSaveJob *)self jobType])
  {
    case 0:
      objc_super v3 = NSString;
      uint64_t v4 = objc_opt_class();
      id v5 = [(PLCloudSharedAssetSaveJob *)self assetCollectionInfos];
      int64_t v6 = [v5 valueForKey:@"GUID"];
      uint64_t v7 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
      uint64_t v8 = [(PLCloudSharedAssetSaveJob *)self mstreamdInfoDictionary];
      id v9 = [v3 stringWithFormat:@"%@ (PLSaveAssetMetadataForCollectionsJobType cloudAssetCollection GUIDS=%@ cloudAlbumGUID=%@ info=%@) ", v4, v6, v7, v8];

      goto LABEL_8;
    case 1:
      id v10 = NSString;
      uint64_t v11 = objc_opt_class();
      id v12 = [(PLCloudSharedAssetSaveJob *)self currentFilePath];
      id v13 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
      unint64_t v14 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetMediaAssetType];
      CLLocationCoordinate2D v15 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
      id v16 = [(PLCloudSharedAssetSaveJob *)self cloudPersonID];
      uint64_t v17 = [(PLCloudSharedAssetSaveJob *)self mstreamdInfoDictionary];
      id v9 = [v10 stringWithFormat:@"%@ (PLSaveAssetJobType filePath=%@ cloudAssetGUID=%@ cloudAssetMediaAssetType=%lu loudAlbumGUID=%@ cloudAlbumGUID=%@ info=%@ prioritize=%d) ", v11, v12, v13, v14, v15, v16, v17, -[PLCloudSharingJob shouldPrioritize](self, "shouldPrioritize")];

      goto LABEL_11;
    case 2:
      uint64_t v18 = NSString;
      uint64_t v19 = objc_opt_class();
      id v5 = [(PLCloudSharedAssetSaveJob *)self cloudAssetGUIDsToDelete];
      int64_t v6 = [(PLCloudSharedAssetSaveJob *)self mstreamdInfoDictionary];
      [v18 stringWithFormat:@"%@ (PLDeleteAssetJobType cloudAssetGUIDsToDelete=%@ info=%@) ", v19, v5, v6];
      goto LABEL_7;
    case 3:
      uint64_t v20 = NSString;
      uint64_t v21 = objc_opt_class();
      id v5 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
      int64_t v6 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
      [v20 stringWithFormat:@"%@ (PLReplaceRecentlyUploadedOriginalWithDerivative cloudAssetCollection=%@ cloudAlbumGUID=%@) ", v21, v5, v6];
      id v9 = LABEL_7:;
LABEL_8:

      goto LABEL_11;
    case 4:
      objc_msgSend(NSString, "stringWithFormat:", @"%@ (PLDownloadPendingAssets "), objc_opt_class(), v23;
      goto LABEL_10;
    default:
      [NSString stringWithFormat:@"%@ unknown job type %ld ", objc_opt_class(), -[PLCloudSharedAssetSaveJob jobType](self, "jobType")];
      id v9 = LABEL_10:;
LABEL_11:
      return v9;
  }
}

- (PLCloudSharedAssetSaveJob)initWithAssetsdClient:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharedAssetSaveJob;
  uint64_t result = [(PLCloudSharingJob *)&v4 initWithAssetsdClient:a3];
  if (result) {
    result->_isVideo = 0;
  }
  return result;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLCloudSharedAssetSaveJob;
  id v7 = [(PLCloudSharingJob *)&v21 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    uint64_t v8 = PLStringFromXPCDictionary();
    [v7 setCurrentFilePath:v8];

    objc_msgSend(v7, "setCurrentCloudAssetMediaAssetType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyCloudAssetMediaAssetType));
    objc_msgSend(v7, "setIsVideo:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyCloudAssetIsVideo));
    objc_msgSend(v7, "setIsPhotoIris:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyCloudAssetIsPhotoIris));
    id v9 = PLStringFromXPCDictionary();
    [v7 setCurrentCloudAssetGUID:v9];

    id v10 = PLStringFromXPCDictionary();
    [v7 setCloudAlbumGUID:v10];

    uint64_t v11 = PLStringFromXPCDictionary();
    [v7 setCloudPersonID:v11];

    id v12 = PLArrayFromXPCDictionary();
    [v7 setCloudAssetGUIDsToDelete:v12];

    id v13 = PLDataFromXPCDictionary();
    if (v13)
    {
      unint64_t v14 = (void *)MEMORY[0x1E4F28DC0];
      CLLocationCoordinate2D v15 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      uint64_t v18 = objc_msgSend(v14, "pl_safeUnarchiveObjectFromData:classes:", v13, v17);

      if (v18) {
        [v7 setAssetCollectionInfos:v18];
      }
    }
    uint64_t v19 = PLDictionaryFromXPCDictionary();
    [v7 setMstreamdInfoDictionary:v19];

    objc_msgSend(v7, "setJobType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyCloudAssetSaveJobType));
  }

  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLCloudSharedAssetSaveJob;
  [(PLDaemonJob *)&v16 encodeToXPCObject:v4];
  id v5 = [(PLCloudSharedAssetSaveJob *)self currentFilePath];
  PLXPCDictionarySetString();

  id v6 = [(PLCloudSharedAssetSaveJob *)self cloudAlbumGUID];
  PLXPCDictionarySetString();

  id v7 = [(PLCloudSharedAssetSaveJob *)self cloudPersonID];
  PLXPCDictionarySetString();

  uint64_t v8 = [(PLCloudSharedAssetSaveJob *)self currentCloudAssetGUID];
  PLXPCDictionarySetString();

  xpc_dictionary_set_int64(v4, (const char *)propertyKeyCloudAssetMediaAssetType, [(PLCloudSharedAssetSaveJob *)self currentCloudAssetMediaAssetType]);
  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyCloudAssetIsVideo, [(PLCloudSharedAssetSaveJob *)self isVideo]);
  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyCloudAssetIsPhotoIris, [(PLCloudSharedAssetSaveJob *)self isPhotoIris]);
  id v9 = [(PLCloudSharedAssetSaveJob *)self cloudAssetGUIDsToDelete];
  PLXPCDictionarySetArray();

  id v10 = [(PLCloudSharedAssetSaveJob *)self assetCollectionInfos];
  if (v10)
  {
    id v15 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v15];
    id v12 = v15;
    if (!v11)
    {
      id v13 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v12;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Failed to archive assetCollectionInfosData, error: %@", buf, 0xCu);
      }
    }
    PLXPCDictionarySetData();
  }
  unint64_t v14 = [(PLCloudSharedAssetSaveJob *)self mstreamdInfoDictionary];
  PLXPCDictionarySetDictionary();

  xpc_dictionary_set_int64(v4, (const char *)propertyKeyCloudAssetSaveJobType, [(PLCloudSharedAssetSaveJob *)self jobType]);
}

+ (id)nextDCIMSaveFileURLForCloudPersonID:(id)a3 cloudAlbumGUID:(id)a4 pathManager:(id)a5 fileExtension:(id)a6 assetUUID:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    uint64_t v17 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    long long v25 = "Error: missing cloudPersonID, cannot compute nextDCIMSaveFileURLForCloudPersonID";
LABEL_12:
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_13;
  }
  if (!v13)
  {
    uint64_t v17 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    long long v25 = "Error: missing cloudAlbumGUID, cannot compute nextDCIMSaveFileURLForCloudPersonID";
    goto LABEL_12;
  }
  if (!v15)
  {
    uint64_t v17 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      long long v25 = "Error: missing fileExtension, cannot compute nextDCIMSaveFileURLForCloudPersonID";
      goto LABEL_12;
    }
LABEL_13:
    long long v26 = 0;
    goto LABEL_25;
  }
  id v40 = a1;
  uint64_t v17 = [v14 photoDirectoryWithType:22];
  uint64_t v18 = [v17 stringByAppendingPathComponent:v12];
  uint64_t v19 = [(id)v18 stringByAppendingPathComponent:v13];

  long long v43 = (void *)v19;
  uint64_t v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v19 isDirectory:1];
  id v46 = 0;
  uint64_t v21 = *MEMORY[0x1E4F1C5C0];
  LOBYTE(v18) = [v20 getResourceValue:&v46 forKey:*MEMORY[0x1E4F1C5C0] error:0];
  id v22 = v46;
  uint64_t v23 = v22;
  if (v18)
  {
    id v24 = v22;
  }
  else
  {
    id v39 = v16;
    uint64_t v27 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v45 = 0;
    v38 = v20;
    char v28 = [v27 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:&v45];
    id v29 = v45;

    if (v28)
    {
      id v24 = v23;
      uint64_t v20 = v38;
    }
    else
    {
      id v44 = 0;
      uint64_t v20 = v38;
      char v30 = [v38 getResourceValue:&v44 forKey:v21 error:0];
      id v24 = v44;

      if ((v30 & 1) == 0)
      {
        id v42 = v24;
        uint64_t v35 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          uint64_t v36 = [v38 path];
          *(_DWORD *)buf = 138412546;
          __int16 v48 = v36;
          __int16 v49 = 2112;
          id v50 = v29;
          _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);
        }
        char v34 = v38;
        long long v26 = 0;
        id v16 = v39;
        id v24 = v42;
        goto LABEL_24;
      }
    }

    id v16 = v39;
  }
  if ([v14 isUBF])
  {
    id v29 = [v16 uppercaseString];
    [v20 URLByAppendingPathComponent:v29];
    id v41 = v14;
    id v31 = v24;
    int v33 = v32 = v16;
    [v33 URLByAppendingPathExtension:v15];
    long long v26 = v34 = v20;

    id v16 = v32;
    id v24 = v31;
    id v14 = v41;
  }
  else
  {
    id v29 = [v40 _dcimDirectoryForFileURL:v20];
    [v29 nextAvailableFileURLWithExtension:v15];
    long long v26 = v34 = v20;
  }
LABEL_24:

LABEL_25:
  return v26;
}

+ (id)_dcimDirectoryForFileURL:(id)a3
{
  id v3 = a3;
  pl_dispatch_once();
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__74004;
  uint64_t v11 = __Block_byref_object_dispose__74005;
  id v12 = 0;
  id v6 = v3;
  pl_dispatch_sync();
  id v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __54__PLCloudSharedAssetSaveJob__dcimDirectoryForFileURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [(id)_dcimDirectoryForFileURL__dcimDictionary objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = [*(id *)(a1 + 32) path];
    id v6 = [MEMORY[0x1E4F8B9E0] cloudPlistName];
    id v10 = [v5 stringByAppendingPathComponent:v6];

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F8B9E0]) initWithDirectoryURL:*(void *)(a1 + 32) subDirectorySuffix:@"CLOUD" perDirectoryLimit:2000 userInfoPath:v10];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [(id)_dcimDirectoryForFileURL__dcimDictionary setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

void __54__PLCloudSharedAssetSaveJob__dcimDirectoryForFileURL___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PLCloudSharedAssetSaveJob.DCIM", 0);
  v1 = (void *)_dcimDirectoryForFileURL__isolationQueue;
  _dcimDirectoryForFileURL__isolationQueue = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)_dcimDirectoryForFileURL__dcimDictionary;
  _dcimDirectoryForFileURL__dcimDictionary = v2;
}

+ (id)pathForInFlightAssetCollectionWithGUID:(id)a3 mediaAssetType:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  pl_dispatch_once();
  if (pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory)
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    if (([v6 fileExistsAtPath:pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory] & 1) == 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v17 = 0;
      char v8 = [v7 createDirectoryAtPath:pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory withIntermediateDirectories:1 attributes:0 error:&v17];
      id v9 = v17;

      if ((v8 & 1) == 0)
      {
        id v13 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v19 = pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory;
          __int16 v20 = 2112;
          id v21 = v9;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory for shared album \"%@\": %@", buf, 0x16u);
        }
        id v12 = 0;
        goto LABEL_20;
      }
    }
    id v10 = v5;
    id v9 = v10;
    if (a4 == 7)
    {
      id v14 = @"MOV";
    }
    else
    {
      if (a4 == 5)
      {
        uint64_t v11 = @"poster";
      }
      else
      {
        if (a4 != 2)
        {
          id v14 = @"JPG";
          goto LABEL_19;
        }
        uint64_t v11 = @"thumb";
      }
      uint64_t v15 = [v10 stringByAppendingPathExtension:v11];

      id v14 = @"JPG";
      id v9 = (id)v15;
    }
LABEL_19:
    id v13 = [(id)pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory stringByAppendingPathComponent:v9];
    id v12 = [v13 stringByAppendingPathExtension:v14];
LABEL_20:

    goto LABEL_21;
  }
  id v6 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "ERROR: INFLIGHT directory does not exist for shared album", buf, 2u);
  }
  id v12 = 0;
LABEL_21:

  return v12;
}

void __83__PLCloudSharedAssetSaveJob_pathForInFlightAssetCollectionWithGUID_mediaAssetType___block_invoke()
{
  id v3 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  dispatch_queue_t v0 = [v3 photoDirectoryWithType:22 additionalPathComponents:@"INFLIGHT"];
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory;
  pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory = v1;
}

+ (id)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID:(id)a3 cloudPersonID:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  pl_dispatch_once();
  uint64_t v7 = [v5 stringByAppendingString:v6];
  char v8 = [(id)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID__cacheAlbumInfo objectForKey:v7];
  if (!v8)
  {
    id v9 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    id v10 = [v9 privateCacheDirectoryWithSubType:3];

    uint64_t v11 = +[PLCloudSharedAlbum lightweightReimportDirectoryNameWithGUID:v5 cloudPersonID:v6];
    id v12 = [v10 stringByAppendingPathComponent:v11];
    id v13 = [v12 stringByAppendingPathComponent:*MEMORY[0x1E4F8C4D0]];

    char v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v13];
    if (!v8)
    {
      id v14 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v16 = 138412546;
        id v17 = v5;
        __int16 v18 = 2112;
        uint64_t v19 = v13;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Missing reimport cache album info for album: %@ (path %@)", (uint8_t *)&v16, 0x16u);
      }

      char v8 = &unk_1EEBF29A0;
    }
    objc_msgSend((id)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID__cacheAlbumInfo, "setObject:forKey:cost:", v8, v7, objc_msgSend(v8, "count"));
  }
  return v8;
}

void __111__PLCloudSharedAssetSaveJob__lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v1 = (void *)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID__cacheAlbumInfo;
  _lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID__cacheAlbumInfo = (uint64_t)v0;
}

+ (BOOL)_lightweightReimportCacheDirectoryExists
{
  if (_lightweightReimportCacheDirectoryExists__skipCacheDirCheck) {
    return 0;
  }
  char v8 = 0;
  id v3 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v4 = [v3 privateCacheDirectoryWithSubType:3];

  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v6 = [v5 fileExistsAtPath:v4 isDirectory:&v8];
  if (v8) {
    BOOL v2 = v6;
  }
  else {
    BOOL v2 = 0;
  }

  if (!v2) {
    _lightweightReimportCacheDirectoryExists__skipCacheDirCheck = 1;
  }

  return v2;
}

+ (void)replaceRecentlyUploadedOriginalWithDerivativeForCollection:(id)a3 inAlbum:(id)a4 personID:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = [a1 newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd];
    [v12 setJobType:3];
    id v13 = [v9 GUID];
    [v12 setCloudAlbumGUID:v13];

    [v12 setCloudPersonID:v11];
    -[NSObject setIsVideo:](v12, "setIsVideo:", [v8 isVideo]);
    -[NSObject setIsPhotoIris:](v12, "setIsPhotoIris:", [v8 isPhotoIris]);
    id v14 = [v8 GUID];
    [v12 setCurrentCloudAssetGUID:v14];

    uint64_t v15 = [[AssetCollectionInfo alloc] initWithAssetCollection:v8];
    id v17 = v15;
    int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [v12 setAssetCollectionInfos:v16];

    [v12 runAndWaitForMessageToBeSent];
LABEL_7:

    goto LABEL_8;
  }
  id v12 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    id v19 = (id)objc_opt_class();
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    long long v25 = v11;
    uint64_t v15 = (AssetCollectionInfo *)v19;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "%@:replaceRecentlyUploadedOriginalWithDerivativeForCollection:%@ inAlbum:%@ personID:%@ can't have nil arguments", buf, 0x2Au);
    goto LABEL_7;
  }
LABEL_8:
}

+ (void)deleteCloudSharedAssetsWithCloudGUIDs:(id)a3 info:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 count])
  {
    uint64_t v7 = (void *)[a1 newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd];
    [v7 setJobType:2];
    [v7 setCloudAssetGUIDsToDelete:v8];
    [v7 setMstreamdInfoDictionary:v6];
    [v7 runAndWaitForMessageToBeSent];
  }
}

+ (void)saveCloudSharedAssetAtPath:(id)a3 forAssetCollection:(id)a4 mediaAssetType:(unint64_t)a5 albumGUID:(id)a6 personID:(id)a7 info:(id)a8 shouldPrioritize:(BOOL)a9
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  __int16 v20 = [v16 GUID];
  id v21 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v21 fileExistsAtPath:v15] && objc_msgSend(v20, "length"))
  {

    if (v18)
    {
      __int16 v22 = [a1 newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd];
      [v22 setJobType:1];
      [v22 setCurrentFilePath:v15];
      [v22 setCloudAlbumGUID:v17];
      [v22 setCurrentCloudAssetMediaAssetType:a5];
      [v22 setIsVideo:a5 == 5];
      [v22 setCurrentCloudAssetGUID:v20];
      [v22 setCloudPersonID:v18];
      [v22 setMstreamdInfoDictionary:v19];
      [v22 setShouldPrioritize:a9];
      id v23 = [[AssetCollectionInfo alloc] initWithAssetCollection:v16];
      long long v25 = v23;
      __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      [v22 setAssetCollectionInfos:v24];

      [v22 runAndWaitForMessageToBeSent];
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {
  }
  __int16 v22 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = (id)objc_opt_class();
    id v23 = (AssetCollectionInfo *)v27;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "%@:saveCloudSharedAssetAtPath: missing required parameters", buf, 0xCu);
    goto LABEL_8;
  }
LABEL_9:
}

+ (void)downloadPendingAssetsForPersonID:(id)a3 info:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = [a1 newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd];
    [v8 setJobType:4];
    [v8 setCloudPersonID:v6];
    [v8 setMstreamdInfoDictionary:v7];
    [v8 runAndWaitForMessageToBeSent];
  }
  else
  {
    id v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "%@:downloadPendingAssets personID: can't have nil arguments", (uint8_t *)&v10, 0xCu);
    }
  }
}

+ (void)assetsdProcessMetadataForAssetCollections:(id)a3 inAlbum:(id)a4 personID:(id)a5 info:(id)a6 libraryServicesManager:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if ((PLIsReallyAssetsd() & 1) == 0)
  {
    __int16 v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PLCloudSharedAssetSaveJob.m", 434, @"Invalid parameter not satisfying: %@", @"PLIsReallyAssetsd()" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
LABEL_12:
    id v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PLCloudSharedAssetSaveJob.m", 435, @"Invalid parameter not satisfying: %@", @"libraryServicesManager" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v17) {
    goto LABEL_12;
  }
LABEL_3:
  uint64_t v18 = [v13 count];
  if (v15 && v14 && v18)
  {
    id v19 = [[PLCloudSharedAssetSaveJob alloc] initWithAssetsdClient:0];
    [(PLCloudSharedAssetSaveJob *)v19 setupSaveAssetMetadataForCollectionsJobForAssetCollections:v13 album:v14 personID:v15 info:v16];
    [(PLDaemonJob *)v19 setLibraryServicesManager:v17];
    [(PLCloudSharedAssetSaveJob *)v19 runDaemonSide];
  }
  else
  {
    __int16 v20 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2112;
      id v27 = v13;
      __int16 v28 = 2112;
      id v29 = v14;
      __int16 v30 = 2112;
      id v31 = v15;
      id v21 = v25;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "%@:assetsdProcessMetadataForAssetCollections:%@ inAlbum:%@ personID:%@ can't have nil arguments", buf, 0x2Au);
    }
  }
}

+ (void)processMetadataForAssetCollections:(id)a3 inAlbum:(id)a4 personID:(id)a5 info:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (PLIsAssetsd())
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLCloudSharedAssetSaveJob.m", 418, @"Invalid parameter not satisfying: %@", @"!PLIsAssetsd()" object file lineNumber description];
  }
  uint64_t v15 = [v11 count];
  if (v13 && v12 && v15)
  {
    id v16 = (void *)[a1 newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd];
    [v16 setupSaveAssetMetadataForCollectionsJobForAssetCollections:v11 album:v12 personID:v13 info:v14];
    [v16 runAndWaitForMessageToBeSent];
  }
  else
  {
    id v17 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v21 = (id)objc_opt_class();
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v13;
      id v18 = v21;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "%@:processMetadataFromClientProcessForAssetCollections:%@ inAlbum:%@ personID:%@ can't have nil arguments", buf, 0x2Au);
    }
  }
}

+ (id)newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd
{
  if (PLIsAssetsd())
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"PLCloudSharedAssetSaveJob.m" lineNumber:390 description:@"This cannot be called from assetsd"];
  }
  id v4 = [PLCloudSharedAssetSaveJob alloc];
  id v5 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  id v6 = +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:v5];
  id v7 = [(PLCloudSharedAssetSaveJob *)v4 initWithAssetsdClient:v6];

  return v7;
}

@end