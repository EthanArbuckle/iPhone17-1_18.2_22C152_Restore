@interface PLUserActivityDaemonJob
+ (id)newUserActivityDaemonJob;
+ (void)checkedSharedAlbumServerModelRelationships;
+ (void)userDidChangeStatusForMomentShare:(id)a3;
+ (void)userDidDeleteSharedAlbum:(id)a3;
+ (void)userDidDeleteSharedAssets:(id)a3;
+ (void)userDidLeavePhotosApplication;
+ (void)userDidNavigateAwayFromAllSharedAlbums;
+ (void)userDidNavigateAwayFromSharedAlbum:(id)a3;
+ (void)userDidNavigateIntoImagePickerSharedAlbum:(id)a3;
+ (void)userDidNavigateIntoSharedAlbum:(id)a3;
+ (void)userDidReadCommentOnSharedAsset:(id)a3;
+ (void)userDidViewCloudFeedContent:(unint64_t)a3;
+ (void)userDidViewSharedLibraryParticipantAssetTrashNotification;
- (NSArray)assetUUIDs;
- (NSString)albumUUID;
- (NSString)momentShareUUID;
- (PLUserActivityDaemonJob)initWithAssetsdClient:(id)a3;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)actionType;
- (int64_t)daemonOperation;
- (unint64_t)cloudFeedContent;
- (void)encodeToXPCObject:(id)a3;
- (void)runDaemonSide;
- (void)setActionType:(int64_t)a3;
- (void)setAlbumUUID:(id)a3;
- (void)setAssetUUIDs:(id)a3;
- (void)setCloudFeedContent:(unint64_t)a3;
- (void)setMomentShareUUID:(id)a3;
@end

@implementation PLUserActivityDaemonJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentShareUUID, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_albumUUID, 0);
}

- (void)setMomentShareUUID:(id)a3
{
}

- (NSString)momentShareUUID
{
  return self->_momentShareUUID;
}

- (void)setCloudFeedContent:(unint64_t)a3
{
  self->_cloudFeedContent = a3;
}

- (unint64_t)cloudFeedContent
{
  return self->_cloudFeedContent;
}

- (void)setAssetUUIDs:(id)a3
{
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void)setAlbumUUID:(id)a3
{
}

- (NSString)albumUUID
{
  return self->_albumUUID;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)runDaemonSide
{
  v3 = +[PLNotificationManager sharedManager];
  v4 = [(PLDaemonJob *)self libraryServicesManager];
  v5 = [v4 databaseContext];
  v6 = (void *)[v5 newShortLivedLibraryWithName:"-[PLUserActivityDaemonJob runDaemonSide]"];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__PLUserActivityDaemonJob_runDaemonSide__block_invoke;
  v9[3] = &unk_1E5873A50;
  v9[4] = self;
  id v10 = v6;
  id v11 = v3;
  id v7 = v3;
  id v8 = v6;
  [v8 performTransaction:v9];
}

void __40__PLUserActivityDaemonJob_runDaemonSide__block_invoke(id *a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] albumUUID];
  if (v2)
  {
    v3 = [a1[5] albumWithUuid:v2];
    v4 = v3;
    if (v3
      && [v3 isCloudSharedAlbum]
      && [v4 conformsToProtocol:&unk_1EEC33B20])
    {
      id v5 = v4;
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  v6 = [a1[4] assetUUIDs];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = [a1[5] assetWithUUID:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        if (v12)
        {
          if (!v9)
          {
            v9 = [MEMORY[0x1E4F1CA48] array];
          }
          [v9 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v13 = [a1[4] momentShareUUID];
  switch([a1[4] actionType])
  {
    case 0:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"_PLUserActivityTypeInvalid not a valid user activity"];
      break;
    case 1:
      objc_msgSend(a1[6], "noteUserDidViewCloudFeedContent:photoLibrary:", objc_msgSend(a1[4], "cloudFeedContent"), a1[5]);
      break;
    case 2:
      if (v5)
      {
        +[PLPhotoSharingHelper checkServerModelForAlbum:v5 photoLibrary:a1[5]];
        v14 = [v5 cloudGUID];
        +[PLPhotoSharingHelper prioritizeDownloadsForAlbumGUID:v14];

        [a1[6] noteUserDidNavigateIntoSharedAlbum:v5 photoLibrary:a1[5]];
      }
      break;
    case 3:
      if (v5)
      {
        v15 = [v5 cloudGUID];
        +[PLPhotoSharingHelper prioritizeDownloadsForAlbumGUID:v15];
        goto LABEL_47;
      }
      break;
    case 4:
      if (v5) {
        [a1[6] noteUserDidNavigateAwayFromSharedAlbum:v5 photoLibrary:a1[5]];
      }
      break;
    case 5:
      +[PLPhotoSharingHelper prioritizeDownloadsForAlbumGUID:0];
      break;
    case 6:
      if ([v9 count])
      {
        id v16 = a1[6];
        v17 = [v9 objectAtIndex:0];
        [v16 noteUserDidReadCommentOnSharedAsset:v17 photoLibrary:a1[5]];
      }
      break;
    case 7:
      if (v6) {
        [a1[6] noteUserDidDeleteSharedAssetsWithUUIDs:v6];
      }
      break;
    case 8:
      if (v2) {
        [a1[6] noteUserDidDeleteSharedAlbumWithUUID:v2];
      }
      break;
    case 9:
      [a1[6] noteUserDidLeavePhotosApplication];
      break;
    case 10:
      if (v13) {
        [a1[6] noteUserDidChangeStatusForMomentShare:v13 photoLibrary:a1[5]];
      }
      break;
    case 11:
      v18 = [a1[5] managedObjectContext];
      v15 = +[PLLibraryScope activeLibraryScopeInManagedObjectContext:v18];

      if (v15)
      {
        v19 = [a1[5] managedObjectContext];
        [v15 userViewedAssetTrashNotificationWithManagedObjectContext:v19];
      }
      else
      {
        v19 = PLUserActivityGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Failed to find an active LibraryScope to mark as notification viewed", v20, 2u);
        }
      }

LABEL_47:
      break;
    case 12:
      +[PLPhotoSharingHelper checkServerModelRelationshipsForPhotoLibrary:a1[5]];
      break;
    default:
      break;
  }
}

- (int64_t)daemonOperation
{
  return 12;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUserActivityDaemonJob;
  id v7 = [(PLDaemonJob *)&v12 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    objc_msgSend(v7, "setActionType:", xpc_dictionary_get_int64(v6, "actionType"));
    uint64_t v8 = PLStringFromXPCDictionary();
    [v7 setAlbumUUID:v8];

    v9 = PLArrayFromXPCDictionary();
    [v7 setAssetUUIDs:v9];

    objc_msgSend(v7, "setCloudFeedContent:", xpc_dictionary_get_int64(v6, "cloudFeedContent"));
    uint64_t v10 = PLStringFromXPCDictionary();
    [v7 setMomentShareUUID:v10];
  }
  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLUserActivityDaemonJob;
  [(PLDaemonJob *)&v11 encodeToXPCObject:v4];
  id v5 = [(PLUserActivityDaemonJob *)self albumUUID];

  if (v5)
  {
    id v6 = [(PLUserActivityDaemonJob *)self albumUUID];
    PLXPCDictionarySetString();
  }
  id v7 = [(PLUserActivityDaemonJob *)self assetUUIDs];

  if (v7)
  {
    uint64_t v8 = [(PLUserActivityDaemonJob *)self assetUUIDs];
    PLXPCDictionarySetArray();
  }
  v9 = [(PLUserActivityDaemonJob *)self momentShareUUID];

  if (v9)
  {
    uint64_t v10 = [(PLUserActivityDaemonJob *)self momentShareUUID];
    PLXPCDictionarySetString();
  }
  xpc_dictionary_set_int64(v4, "actionType", self->_actionType);
  xpc_dictionary_set_int64(v4, "cloudFeedContent", self->_cloudFeedContent);
}

- (PLUserActivityDaemonJob)initWithAssetsdClient:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLUserActivityDaemonJob;
  return [(PLDaemonJob *)&v4 initWithAssetsdClient:a3];
}

+ (void)checkedSharedAlbumServerModelRelationships
{
  id v2 = (id)[a1 newUserActivityDaemonJob];
  [v2 setActionType:12];
  [v2 run];
}

+ (void)userDidViewSharedLibraryParticipantAssetTrashNotification
{
  v3 = PLUserActivityGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "User did view shared library participant asset trash notification", v5, 2u);
  }

  objc_super v4 = (void *)[a1 newUserActivityDaemonJob];
  [v4 setActionType:11];
  [v4 run];
}

+ (void)userDidChangeStatusForMomentShare:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserActivityGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "User did change status for moment share: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = (void *)[a1 newUserActivityDaemonJob];
  [v7 setActionType:10];
  uint64_t v8 = [v4 uuid];
  [v7 setMomentShareUUID:v8];

  [v7 run];
}

+ (void)userDidLeavePhotosApplication
{
  v3 = PLUserActivityGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "User did delete leave Photos app", v5, 2u);
  }

  id v4 = (void *)[a1 newUserActivityDaemonJob];
  [v4 setActionType:9];
  [v4 run];
}

+ (void)userDidDeleteSharedAssets:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserActivityGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = [v4 count];
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "User did delete %lu shared album assets", buf, 0xCu);
  }

  id v6 = (void *)[a1 newUserActivityDaemonJob];
  [v6 setActionType:7];
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "uuid", (void)v14);
        if (v13) {
          [v7 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [v6 setAssetUUIDs:v7];
  [v6 run];
}

+ (void)userDidDeleteSharedAlbum:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserActivityGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "User did delete shared album: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = (void *)[a1 newUserActivityDaemonJob];
  [v7 setActionType:8];
  id v8 = [v4 uuid];
  [v7 setAlbumUUID:v8];

  [v7 run];
}

+ (void)userDidReadCommentOnSharedAsset:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserActivityGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    int v10 = 138543362;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "User did read comments on asset: %{public}@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 uuid];
  if (v7)
  {
    id v8 = (void *)[a1 newUserActivityDaemonJob];
    [v8 setActionType:6];
    int v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
    [v8 setAssetUUIDs:v9];

    [v8 run];
  }
}

+ (void)userDidNavigateAwayFromAllSharedAlbums
{
  v3 = PLUserActivityGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "User did navigate away from all shared albums", v5, 2u);
  }

  id v4 = (void *)[a1 newUserActivityDaemonJob];
  [v4 setActionType:5];
  [v4 run];
}

+ (void)userDidNavigateAwayFromSharedAlbum:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserActivityGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    int v9 = 138543362;
    int v10 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "User did navigate away from shared album: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = (void *)[a1 newUserActivityDaemonJob];
  [v7 setActionType:4];
  id v8 = [v4 uuid];
  [v7 setAlbumUUID:v8];

  [v7 run];
}

+ (void)userDidNavigateIntoImagePickerSharedAlbum:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserActivityGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    int v9 = 138543362;
    int v10 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "User did navigate into picker shared album: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = (void *)[a1 newUserActivityDaemonJob];
  [v7 setActionType:3];
  id v8 = [v4 uuid];
  [v7 setAlbumUUID:v8];

  [v7 run];
}

+ (void)userDidNavigateIntoSharedAlbum:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLUserActivityGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uuid];
    int v9 = 138543362;
    int v10 = v6;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "User did navigate into shared album: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = (void *)[a1 newUserActivityDaemonJob];
  [v7 setActionType:2];
  id v8 = [v4 uuid];
  [v7 setAlbumUUID:v8];

  [v7 run];
}

+ (void)userDidViewCloudFeedContent:(unint64_t)a3
{
  id v5 = PLUserActivityGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "User did view cloud feed content", v7, 2u);
  }

  id v6 = (void *)[a1 newUserActivityDaemonJob];
  [v6 setActionType:1];
  [v6 setCloudFeedContent:a3];
  [v6 run];
}

+ (id)newUserActivityDaemonJob
{
  id v2 = [PLUserActivityDaemonJob alloc];
  v3 = [MEMORY[0x1E4F8B980] systemLibraryURL];
  id v4 = +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:v3];
  id v5 = [(PLUserActivityDaemonJob *)v2 initWithAssetsdClient:v4];

  return v5;
}

@end