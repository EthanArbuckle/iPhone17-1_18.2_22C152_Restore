@interface PXCMMMomentsInvitation
+ (BOOL)supportsSavingAssetsForInvitations:(id)a3 numberOfAssetsToSave:(unint64_t *)a4 assetsToSaveMediaType:(int64_t *)a5;
+ (id)_invitationWithAssetCollection:(id)a3 previewAssetsFetchResult:(id)a4 participantsFetchResult:(id)a5;
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
- (PHFetchResult)participantsFetchResult;
- (PHFetchResult)previewAssetsFetchResult;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXCMMInvitationParticipant)owner;
- (PXCMMMomentsInvitation)init;
- (PXCMMMomentsInvitation)initWithAssetCollection:(id)a3;
- (PXCMMMomentsInvitation)invitationWithUpdatedParticipantsFetchResult:(id)a3;
- (PXCMMMomentsInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3;
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

@implementation PXCMMMomentsInvitation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsFetchResult, 0);
  objc_storeStrong((id *)&self->_previewAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (PHFetchResult)participantsFetchResult
{
  return self->_participantsFetchResult;
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
  v3 = [(PXCMMMomentsInvitation *)self contextForActivityType:a3];
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

- (PXCMMMomentsInvitation)invitationWithUpdatedParticipantsFetchResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithAssetCollection:self->_assetCollection];
  objc_storeStrong((id *)(v5 + 64), self->_previewAssetsFetchResult);
  objc_storeStrong((id *)(v5 + 40), self->_posterAsset);
  objc_storeStrong((id *)(v5 + 48), self->_posterMediaProvider);
  v6 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v4;
  id v7 = v4;

  uint64_t v8 = _GetOwner(v7);
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  return (PXCMMMomentsInvitation *)(id)v5;
}

- (PXCMMMomentsInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithAssetCollection:self->_assetCollection];
  objc_storeStrong((id *)(v5 + 72), self->_participantsFetchResult);
  objc_storeStrong((id *)(v5 + 32), self->_owner);
  objc_storeStrong((id *)(v5 + 48), self->_posterMediaProvider);
  v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;
  id v7 = v4;

  uint64_t v8 = [v7 firstObject];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  return (PXCMMMomentsInvitation *)(id)v5;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p, asset collection: \"%@\">", objc_opt_class(), self, self->_assetCollection];
}

- (PXCMMMomentsInvitation)initWithAssetCollection:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXCMMMomentsInvitation;
  v6 = [(PXCMMMomentsInvitation *)&v17 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    v7->_shareType = 1;
    id v15 = 0;
    id v16 = 0;
    PXCMMTitleAndSubtitleForAssetCollection(v5, &v16, &v15);
    id v8 = v16;
    id v9 = v15;
    uint64_t v10 = [v8 copy];
    title = v7->_title;
    v7->_title = (NSString *)v10;

    uint64_t v12 = [v9 copy];
    subtitle = v7->_subtitle;
    v7->_subtitle = (NSString *)v12;
  }
  return v7;
}

- (PXCMMMomentsInvitation)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMMomentsInvitation.m", 93, @"%s is not available as initializer", "-[PXCMMMomentsInvitation init]");

  abort();
}

+ (void)saveAllAssetsForInvitations:(id)a3 toDestinationPhotoLibrary:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2 object:a1 file:@"PXCMMMomentsInvitation.m" lineNumber:273 description:@"Code which should be unreachable has been reached"];

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
  return (id)objc_msgSend(NSString, "localizedStringWithFormat:", @"Remove %lu iCloud Links (Moments Mock)", objc_msgSend(a3, "count"));
}

+ (id)invitationWithAssetCollection:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];
  [v6 setFetchLimit:5];
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"curationScore" ascending:0];
  v14[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v6 setInternalSortDescriptors:v8];

  id v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v6];
  id v10 = [v5 librarySpecificFetchOptions];
  id v11 = [MEMORY[0x1E4F391F0] fetchPersonsForAssetCollection:v4 options:v10];
  uint64_t v12 = [a1 _invitationWithAssetCollection:v4 previewAssetsFetchResult:v9 participantsFetchResult:v11];

  return v12;
}

+ (id)_invitationWithAssetCollection:(id)a3 previewAssetsFetchResult:(id)a4 participantsFetchResult:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithAssetCollection:v10];

  uint64_t v12 = (void *)v11[8];
  v11[8] = v8;
  id v13 = v8;

  uint64_t v14 = _GetOwner(v9);
  id v15 = (void *)v11[4];
  v11[4] = v14;

  id v16 = (void *)v11[9];
  v11[9] = v9;
  id v17 = v9;

  uint64_t v18 = [v13 firstObject];
  v19 = (void *)v11[5];
  v11[5] = v18;

  v20 = objc_alloc_init(PXPhotoKitUIMediaProvider);
  v21 = (void *)v11[6];
  v11[6] = v20;

  return v11;
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMMomentsInvitation.m", 97, @"%s is not available as initializer", "+[PXCMMMomentsInvitation new]");

  abort();
}

- (int64_t)aggregateMediaType
{
  v2 = [(PXCMMMomentsInvitation *)self assetCollection];
  int64_t v3 = [v2 aggregateMediaType];

  return v3;
}

@end