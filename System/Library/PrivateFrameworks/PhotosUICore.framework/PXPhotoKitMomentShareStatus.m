@interface PXPhotoKitMomentShareStatus
- (PXPhotoKitMomentShareStatus)initWithPhotoKitMomentShare:(id)a3;
- (id)_createStatusProvider;
- (id)invitation;
- (void)_prepareFetchResultsForPhotoLibrary:(id)a3;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
@end

@implementation PXPhotoKitMomentShareStatus

- (void).cxx_destruct
{
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  id v4 = a3;
  v5 = [(PXMomentShareStatus *)self copyingAssetsFetchResult];
  v6 = [v4 changeDetailsForFetchResult:v5];

  if (v6)
  {
    v7 = [v6 fetchResultAfterChanges];
  }
  else
  {
    v7 = 0;
  }
  v8 = [(PXMomentShareStatus *)self copiedAssetsFetchResult];
  v9 = [v4 changeDetailsForFetchResult:v8];

  if (v9)
  {
    v10 = [v9 fetchResultAfterChanges];
  }
  else
  {
    v10 = 0;
  }
  v11 = [(PXMomentShareStatus *)self allAssetsFetchResult];
  v12 = [v4 changeDetailsForFetchResult:v11];

  if (v12)
  {
    v13 = [v12 fetchResultAfterChanges];
  }
  else
  {
    v13 = 0;
  }
  v14 = [(PXMomentShareStatus *)self momentShare];
  v15 = [v4 changeDetailsForObject:v14];

  if (v15)
  {
    v16 = [v15 objectAfterChanges];
LABEL_12:
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__PXPhotoKitMomentShareStatus_photoLibraryDidChangeOnMainQueue___block_invoke;
    v18[3] = &unk_1E5DCF3C8;
    id v19 = v7;
    id v20 = v10;
    BOOL v23 = v15 != 0;
    id v21 = v13;
    id v22 = v16;
    id v17 = v16;
    [(PXMomentShareStatus *)self performChanges:v18];

    goto LABEL_13;
  }
  v16 = 0;
  if (v7 || v10 || v13) {
    goto LABEL_12;
  }
LABEL_13:
}

void __64__PXPhotoKitMomentShareStatus_photoLibraryDidChangeOnMainQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(v3, "setCopyingAssetsFetchResult:");
    id v3 = v4;
  }
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v4, "setCopiedAssetsFetchResult:");
    id v3 = v4;
  }
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(v4, "setAllAssetsFetchResult:");
    id v3 = v4;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    [v4 setMomentShare:*(void *)(a1 + 56)];
    id v3 = v4;
  }
}

- (void)_prepareFetchResultsForPhotoLibrary:(id)a3
{
  id v4 = [a3 librarySpecificFetchOptions];
  v5 = [(PXMomentShareStatus *)self momentShare];
  v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"additionalAttributes.destinationAssetCopyState == %d", 1);
  [v4 setInternalPredicate:v6];

  v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v4];
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"additionalAttributes.destinationAssetCopyState == %d", 2);
  [v4 setInternalPredicate:v8];

  v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v4];
  v10 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForMomentSharedAsset"), 0);
  [v4 setInternalPredicate:v10];

  v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v5 options:v4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__PXPhotoKitMomentShareStatus__prepareFetchResultsForPhotoLibrary___block_invoke;
  v15[3] = &unk_1E5DCF3A0;
  id v16 = v7;
  id v17 = v9;
  id v18 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v7;
  [(PXMomentShareStatus *)self performChanges:v15];
}

void __67__PXPhotoKitMomentShareStatus__prepareFetchResultsForPhotoLibrary___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setCopyingAssetsFetchResult:v3];
  [v4 setCopiedAssetsFetchResult:a1[5]];
  [v4 setAllAssetsFetchResult:a1[6]];
}

- (id)_createStatusProvider
{
  v2 = [(PXMomentShareStatus *)self momentShare];
  uint64_t v3 = [v2 photoLibrary];

  id v4 = [[PXPhotoKitCPLActionManager alloc] initWithPhotoLibrary:v3];
  v5 = [[PXCPLUIStatusProvider alloc] initWithPhotoLibrary:v3 actionManager:v4];

  return v5;
}

- (id)invitation
{
  invitation = self->_invitation;
  if (!invitation)
  {
    id v4 = [(PXMomentShareStatus *)self momentShare];
    v5 = +[PXCMMMomentShareInvitation invitationWithMomentShare:v4];
    v6 = self->_invitation;
    self->_invitation = v5;

    invitation = self->_invitation;
  }
  return invitation;
}

- (PXPhotoKitMomentShareStatus)initWithPhotoKitMomentShare:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v12);
    id v13 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXMomentShareStatus.m", 131, @"%@ should be an instance inheriting from %@, but it is %@", @"momentShare", v11, v13 object file lineNumber description];
  }
  else
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXMomentShareStatus.m", 131, @"%@ should be an instance inheriting from %@, but it is nil", @"momentShare", v11 object file lineNumber description];
  }

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)PXPhotoKitMomentShareStatus;
  v6 = [(PXMomentShareStatus *)&v14 initWithMomentShare:v5];
  if (v6)
  {
    v7 = [v5 photoLibrary];
    objc_msgSend(v7, "px_registerChangeObserver:", v6);
    [(PXPhotoKitMomentShareStatus *)v6 _prepareFetchResultsForPhotoLibrary:v7];
  }
  return v6;
}

@end