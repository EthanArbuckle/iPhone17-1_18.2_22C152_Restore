@interface PXCMMMomentShareInvitation
+ (BOOL)supportsSavingAssetsForInvitations:(id)a3 numberOfAssetsToSave:(unint64_t *)a4 assetsToSaveMediaType:(int64_t *)a5;
+ (id)invitationWithMomentShare:(id)a3;
+ (id)menuItemTitleForDeletingInvitations:(id)a3;
+ (id)new;
+ (void)deleteInvitations:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5;
+ (void)saveAllAssetsForInvitations:(id)a3 toDestinationPhotoLibrary:(id)a4 completionHandler:(id)a5;
- (BOOL)px_canPerformFavoriteAction;
- (BOOL)px_isEmpty;
- (BOOL)px_isFavorite;
- (NSDate)creationDate;
- (NSDate)expiryDate;
- (NSString)description;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)shareURL;
- (PHFetchResult)participantsFetchResult;
- (PHFetchResult)previewAssetsFetchResult;
- (PHMomentShare)momentShare;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXCMMInvitationParticipant)owner;
- (PXCMMMomentShareInvitation)init;
- (PXCMMMomentShareInvitation)initWithMomentShare:(id)a3;
- (PXCMMMomentShareInvitation)invitationWithUpdatedParticipantsFetchResult:(id)a3;
- (PXCMMMomentShareInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3;
- (PXDisplayAsset)posterAsset;
- (PXMomentShareStatusPresentation)statusPresentation;
- (PXPhotosViewConfiguration)assetViewConfiguration;
- (PXUIImageProvider)posterMediaProvider;
- (id)contextForActivityType:(unint64_t)a3;
- (id)momentShareStatus;
- (id)sessionForActivityType:(unint64_t)a3;
- (int64_t)aggregateMediaType;
- (int64_t)shareType;
- (unint64_t)count;
- (void)acceptWithCompletionHandler:(id)a3;
- (void)requestNotificationOnUploadCompletion;
@end

@implementation PXCMMMomentShareInvitation

- (BOOL)px_canPerformFavoriteAction
{
  return 0;
}

- (BOOL)px_isFavorite
{
  return 0;
}

- (BOOL)px_isEmpty
{
  return 0;
}

- (int64_t)aggregateMediaType
{
  v2 = [(PXCMMMomentShareInvitation *)self momentShare];
  int64_t v3 = [v2 aggregateMediaType];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_participantsFetchResult, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
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

- (PHFetchResult)participantsFetchResult
{
  return self->_participantsFetchResult;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
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

- (void)requestNotificationOnUploadCompletion
{
}

- (id)momentShareStatus
{
  int64_t v3 = [PXPhotoKitMomentShareStatus alloc];
  v4 = [(PXCMMMomentShareInvitation *)self momentShare];
  v5 = [(PXPhotoKitMomentShareStatus *)v3 initWithPhotoKitMomentShare:v4];

  return v5;
}

- (void)acceptWithCompletionHandler:(id)a3
{
}

- (id)sessionForActivityType:(unint64_t)a3
{
  int64_t v3 = [(PXCMMMomentShareInvitation *)self contextForActivityType:a3];
  v4 = [[PXCMMPhotoKitSession alloc] initWithPhotoKitContext:v3];

  return v4;
}

- (id)contextForActivityType:(unint64_t)a3
{
  int64_t v3 = [[PXCMMPhotoKitContext alloc] initWithMomentShare:self->_momentShare activityType:a3 sourceType:0];
  return v3;
}

- (PXMomentShareStatusPresentation)statusPresentation
{
  v2 = [(PXCMMMomentShareInvitation *)self momentShareStatus];
  int64_t v3 = [[PXMomentShareStatusPresentation alloc] initWithMomentShareStatus:v2 presentationStyle:0];

  return v3;
}

- (PXPhotosViewConfiguration)assetViewConfiguration
{
  v11[1] = *MEMORY[0x1E4F143B8];
  momentShare = self->_momentShare;
  v11[0] = *MEMORY[0x1E4F39470];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  LOBYTE(v10) = 1;
  v5 = +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:momentShare existingAssetsFetchResult:0 existingKeyAssetsFetchResult:0 fetchPropertySets:v4 basePredicate:0 options:0 ignoreSharedLibraryFilters:v10];

  v6 = [(PHMomentShare *)self->_momentShare photoLibrary];
  v7 = +[PXPhotoKitUIMediaProvider mediaProviderWithLibrary:v6];

  v8 = [[PXPhotosViewConfiguration alloc] initWithDataSourceManager:v5 mediaProvider:v7 selectionManager:0 assetActionManager:0 assetCollectionActionManager:0];
  return v8;
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  v2 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:self->_momentShare displayTitleInfo:0];
  return (PXAssetCollectionActionManager *)v2;
}

- (unint64_t)count
{
  return [(PHMomentShare *)self->_momentShare assetCount];
}

- (NSDate)expiryDate
{
  return (NSDate *)[(PHMomentShare *)self->_momentShare expiryDate];
}

- (NSDate)creationDate
{
  return (NSDate *)[(PHMomentShare *)self->_momentShare creationDate];
}

- (NSString)identifier
{
  return (NSString *)[(PHMomentShare *)self->_momentShare uuid];
}

- (NSURL)shareURL
{
  return (NSURL *)[(PHMomentShare *)self->_momentShare shareURL];
}

- (PXCMMMomentShareInvitation)invitationWithUpdatedPreviewAssetsFetchResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithMomentShare:self->_momentShare];
  objc_storeStrong((id *)(v5 + 64), self->_participantsFetchResult);
  objc_storeStrong((id *)(v5 + 32), self->_owner);
  v6 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v4;
  id v7 = v4;

  momentShare = self->_momentShare;
  id v15 = 0;
  id v16 = 0;
  _GetPreviewAsset(v7, momentShare, &v16, &v15);
  id v9 = v16;
  id v10 = v15;
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;
  id v12 = v9;

  v13 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  return (PXCMMMomentShareInvitation *)(id)v5;
}

- (PXCMMMomentShareInvitation)invitationWithUpdatedParticipantsFetchResult:(id)a3
{
  id v5 = a3;
  if (self->_shareType != 1)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXCMMMomentShareInvitation.m", 107, @"Invalid parameter not satisfying: %@", @"_shareType == PXDisplayMomentShareTypeReceiver" object file lineNumber description];
  }
  uint64_t v6 = [objc_alloc((Class)objc_opt_class()) initWithMomentShare:self->_momentShare];
  objc_storeStrong((id *)(v6 + 72), self->_previewAssetsFetchResult);
  objc_storeStrong((id *)(v6 + 40), self->_posterAsset);
  objc_storeStrong((id *)(v6 + 48), self->_posterMediaProvider);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;
  id v8 = v5;

  uint64_t v9 = PXOwnerForMomentShareParticipantFetchResult(v8, self->_momentShare);
  id v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  return (PXCMMMomentShareInvitation *)(id)v6;
}

- (NSString)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  momentShare = self->_momentShare;
  id v7 = [(PHMomentShare *)momentShare uuid];
  id v8 = [v3 stringWithFormat:@"<%@: %p, <%@: %p, %@>>", v4, self, v5, momentShare, v7];

  return (NSString *)v8;
}

- (PXCMMMomentShareInvitation)initWithMomentShare:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXCMMMomentShareInvitation.m", 56, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)PXCMMMomentShareInvitation;
  id v7 = [(PXCMMMomentShareInvitation *)&v19 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_momentShare, a3);
    v8->_shareType = [(PHMomentShare *)v8->_momentShare px_momentShareType];
    id v17 = 0;
    id v18 = 0;
    PXCMMTitleAndSubtitleForAssetCollection(v6, &v18, &v17);
    id v9 = v18;
    id v10 = v17;
    uint64_t v11 = [v9 copy];
    title = v8->_title;
    v8->_title = (NSString *)v11;

    uint64_t v13 = [v10 copy];
    subtitle = v8->_subtitle;
    v8->_subtitle = (NSString *)v13;
  }
  return v8;
}

- (PXCMMMomentShareInvitation)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMMomentShareInvitation.m", 48, @"%s is not available as initializer", "-[PXCMMMomentShareInvitation init]");

  abort();
}

+ (void)saveAllAssetsForInvitations:(id)a3 toDestinationPhotoLibrary:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  PXMap();
}

+ (BOOL)supportsSavingAssetsForInvitations:(id)a3 numberOfAssetsToSave:(unint64_t *)a4 assetsToSaveMediaType:(int64_t *)a5
{
}

+ (void)deleteInvitations:(id)a3 presentationEnvironment:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  PXMap();
}

+ (id)menuItemTitleForDeletingInvitations:(id)a3
{
}

+ (id)invitationWithMomentShare:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"PXCMMMomentShareInvitation.m", 80, @"Invalid parameter not satisfying: %@", @"momentShare" object file lineNumber description];
  }
  id v6 = (void *)[objc_alloc((Class)a1) initWithMomentShare:v5];
  id v7 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
  id v8 = PXParticipantFetchResultForMomentShare(v5);
  id v9 = v8;
  if (v8)
  {
    id v10 = PXOwnerForMomentShareParticipantFetchResult(v8, v5);
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = (void *)v6[8];
  v6[8] = v9;
  id v12 = v9;

  uint64_t v13 = (void *)v6[4];
  v6[4] = v10;
  id v14 = v10;

  id v15 = [v7 librarySpecificFetchOptions];
  [v15 setFetchLimit:1];
  [v15 setIncludeAssetSourceTypes:8];
  id v16 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v5 options:v15];
  id v17 = (void *)v6[9];
  v6[9] = v16;
  id v18 = v16;

  id v26 = 0;
  id v27 = 0;
  _GetPreviewAsset(v18, v5, &v27, &v26);
  id v19 = v27;
  id v20 = v26;
  v21 = (void *)v6[5];
  v6[5] = v19;
  id v22 = v19;

  v23 = (void *)v6[6];
  v6[6] = v20;

  return v6;
}

+ (id)new
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMMomentShareInvitation.m", 52, @"%s is not available as initializer", "+[PXCMMMomentShareInvitation new]");

  abort();
}

@end