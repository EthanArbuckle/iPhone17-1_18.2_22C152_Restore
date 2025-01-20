@interface PXCMMSharedAlbumInvitation
+ (BOOL)supportsSavingAssetsForInvitations:(id)a3 numberOfAssetsToSave:(unint64_t *)a4 assetsToSaveMediaType:(int64_t *)a5;
+ (id)_invitationWithAssetCollection:(id)a3 previewAssetsFetchResult:(id)a4;
+ (id)_participantsForAssetCollection:(id)a3;
+ (id)invitationWithAssetCollection:(id)a3;
+ (id)menuItemTitleForDeletingInvitations:(id)a3;
+ (id)new;
+ (void)deleteInvitations:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5;
+ (void)saveAllAssetsForInvitations:(id)a3 toDestinationPhotoLibrary:(id)a4 completionHandler:(id)a5;
- (NSDate)creationDate;
- (NSDate)expiryDate;
- (NSString)description;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)shareURL;
- (PHAssetCollection)assetCollection;
- (PHFetchResult)previewAssetsFetchResult;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXCMMInvitationParticipant)owner;
- (PXCMMSharedAlbumInvitation)init;
- (PXCMMSharedAlbumInvitation)initWithAssetCollection:(id)a3;
- (PXCMMSharedAlbumInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3;
- (PXDisplayAsset)posterAsset;
- (PXMomentShareStatusPresentation)statusPresentation;
- (PXPhotosViewConfiguration)assetViewConfiguration;
- (PXUIImageProvider)posterMediaProvider;
- (id)contextForActivityType:(unint64_t)a3;
- (id)sessionForActivityType:(unint64_t)a3;
- (int64_t)aggregateMediaType;
- (int64_t)shareType;
- (unint64_t)count;
- (void)acceptWithCompletionHandler:(id)a3;
@end

@implementation PXCMMSharedAlbumInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (PHFetchResult)previewAssetsFetchResult
{
  return self->_previewAssetsFetchResult;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PXUIImageProvider)posterMediaProvider
{
  return self->_posterMediaProvider;
}

- (PXDisplayAsset)posterAsset
{
  return self->_posterAsset;
}

- (PXCMMInvitationParticipant)owner
{
  return self->_owner;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)shareType
{
  return self->_shareType;
}

- (void)acceptWithCompletionHandler:(id)a3
{
  if (a3) {
    (*((void (**)(id, uint64_t, void))a3 + 2))(a3, 1, 0);
  }
}

- (id)sessionForActivityType:(unint64_t)a3
{
  v3 = [(PXCMMSharedAlbumInvitation *)self contextForActivityType:a3];
  v4 = [[PXCMMPhotoKitSession alloc] initWithPhotoKitContext:v3];

  return v4;
}

- (id)contextForActivityType:(unint64_t)a3
{
  v3 = [[PXCMMPhotoKitContext alloc] initWithAssetCollection:self->_assetCollection activityType:a3 sourceType:0];
  return v3;
}

- (PXMomentShareStatusPresentation)statusPresentation
{
  return 0;
}

- (PXPhotosViewConfiguration)assetViewConfiguration
{
  v3 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:self->_assetCollection];
  v4 = [(PHAssetCollection *)self->_assetCollection photoLibrary];
  v5 = +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:v4];

  v6 = [[PXPhotosViewConfiguration alloc] initWithDataSourceManager:v3 mediaProvider:v5 selectionManager:0 assetActionManager:0 assetCollectionActionManager:0];
  return v6;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  v2 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:self->_assetCollection displayTitleInfo:0];
  return (PXAssetCollectionActionManager *)v2;
}

- (unint64_t)count
{
  return [(PHAssetCollection *)self->_assetCollection estimatedAssetCount];
}

- (NSDate)expiryDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:2592000.0];
}

- (NSDate)creationDate
{
  return (NSDate *)[(PHAssetCollection *)self->_assetCollection creationDate];
}

- (NSString)identifier
{
  return (NSString *)[(PHAssetCollection *)self->_assetCollection uuid];
}

- (NSURL)shareURL
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://share.icloud.com/photos/123"];
  return (NSURL *)v2;
}

- (PXCMMSharedAlbumInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithAssetCollection:self->_assetCollection];
  objc_storeStrong((id *)(v5 + 32), self->_owner);
  objc_storeStrong((id *)(v5 + 48), self->_posterMediaProvider);
  v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;
  id v7 = v4;

  uint64_t v8 = [v7 firstObject];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  return (PXCMMSharedAlbumInvitation *)(id)v5;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p, asset collection: \"%@\">", objc_opt_class(), self, self->_assetCollection];
}

- (PXCMMSharedAlbumInvitation)initWithAssetCollection:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PXCMMSharedAlbumInvitation;
  v6 = [(PXCMMSharedAlbumInvitation *)&v24 init];
  id v7 = v6;
  if (v6)
  {
    p_assetCollection = (id *)&v6->_assetCollection;
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    v7->_shareType = 1;
    v9 = [(PHAssetCollection *)v7->_assetCollection localizedTitle];
    v10 = v9;
    if (v9 && (unint64_t)[v9 length] >= 0xE)
    {
      uint64_t v11 = [v10 substringFromIndex:13];

      v10 = (void *)v11;
    }
    v12 = [*p_assetCollection startDate];
    if (!v12)
    {
      v12 = [*p_assetCollection creationDate];
      if (!v12)
      {
        v12 = [MEMORY[0x1E4F1C9C8] date];
      }
    }
    uint64_t v13 = [(PHAssetCollection *)v7->_assetCollection endDate];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = v12;
    }
    id v16 = v15;

    PLCMMTitleAndSubtitleForTitleAndFallbackDates();
    id v17 = 0;
    id v18 = 0;
    uint64_t v19 = [v17 copy];
    title = v7->_title;
    v7->_title = (NSString *)v19;

    uint64_t v21 = [v18 copy];
    subtitle = v7->_subtitle;
    v7->_subtitle = (NSString *)v21;
  }
  return v7;
}

- (PXCMMSharedAlbumInvitation)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMSharedAlbumInvitation.m", 55, @"%s is not available as initializer", "-[PXCMMSharedAlbumInvitation init]");

  abort();
}

+ (void)saveAllAssetsForInvitations:(id)a3 toDestinationPhotoLibrary:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2 object:a1 file:@"PXCMMSharedAlbumInvitation.m" lineNumber:234 description:@"Code which should be unreachable has been reached"];

  abort();
}

+ (BOOL)supportsSavingAssetsForInvitations:(id)a3 numberOfAssetsToSave:(unint64_t *)a4 assetsToSaveMediaType:(int64_t *)a5
{
  return 0;
}

+ (void)deleteInvitations:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, uint64_t, void))a5 + 2))(a5, 1, 0);
  }
}

+ (id)menuItemTitleForDeletingInvitations:(id)a3
{
  return (id)objc_msgSend(NSString, "localizedStringWithFormat:", @"Remove %lu iCloud Links (Shared Albums Mock)", objc_msgSend(a3, "count"));
}

+ (id)invitationWithAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  [v6 setFetchLimit:5];
  id v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v6];
  uint64_t v8 = [a1 _invitationWithAssetCollection:v4 previewAssetsFetchResult:v7];

  return v8;
}

+ (id)_invitationWithAssetCollection:(id)a3 previewAssetsFetchResult:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[objc_alloc((Class)a1) initWithAssetCollection:v7];
  id v9 = (void *)v8[8];
  v8[8] = v6;
  id v10 = v6;

  id v11 = [a1 _participantsForAssetCollection:v7];

  uint64_t v12 = [v11 firstObject];
  uint64_t v13 = (void *)v8[4];
  v8[4] = v12;

  uint64_t v14 = [v10 firstObject];
  v15 = (void *)v8[5];
  v8[5] = v14;

  id v16 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  id v17 = (void *)v8[6];
  v8[6] = v16;

  return v8;
}

+ (id)_participantsForAssetCollection:(id)a3
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__54687;
  v4[4] = __Block_byref_object_dispose__54688;
  v4[5] = 0;
  a3;
  px_dispatch_on_main_queue_sync();
}

void __62__PXCMMSharedAlbumInvitation__participantsForAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(a1 + 32), "pl_assetContainer");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 cloudAlbumSubscriberRecords];
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "inviteeFirstName", (void)v15);
          if (v13)
          {
            uint64_t v14 = [[PXCMMSharedAlbumParticipant alloc] initWithRecord:v12];
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

+ (id)new
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMSharedAlbumInvitation.m", 59, @"%s is not available as initializer", "+[PXCMMSharedAlbumInvitation new]");

  abort();
}

- (int64_t)aggregateMediaType
{
  v2 = [(PXCMMSharedAlbumInvitation *)self assetCollection];
  int64_t v3 = [v2 aggregateMediaType];

  return v3;
}

@end