@interface PXAddAssetsToLastUsedAssetCollectionAction
+ (NSString)placeholderCommandTitle;
+ (id)commandTitleWithPhotoLibrary:(id)a3;
+ (id)targetAssetCollectionInPhotoLibrary:(id)a3 error:(id *)a4;
+ (void)configureToast:(id)a3 withAlbumName:(id)a4;
+ (void)userDidAddAssetsToAssetCollection:(id)a3;
- (PHAssetCollection)targetAssetCollection;
- (PXAddAssetsToAssetCollectionAction)underlyingAction;
- (PXAddAssetsToLastUsedAssetCollectionAction)initWithAssets:(id)a3;
- (PXAddAssetsToLastUsedAssetCollectionAction)initWithAssets:(id)a3 error:(id *)a4;
- (id)localizedActionName;
- (void)performAction:(id)a3;
- (void)performRedo:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXAddAssetsToLastUsedAssetCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetAssetCollection, 0);
  objc_storeStrong((id *)&self->_underlyingAction, 0);
}

- (PHAssetCollection)targetAssetCollection
{
  return self->_targetAssetCollection;
}

- (PXAddAssetsToAssetCollectionAction)underlyingAction
{
  return self->_underlyingAction;
}

- (void)performRedo:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(PXAddAssetsToLastUsedAssetCollectionAction *)self underlyingAction];
  id v6 = v5;
  if (v5) {
    [v5 performRedo:v4];
  }
  else {
    v4[2](v4, 1, 0);
  }
}

- (void)performUndo:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(PXAddAssetsToLastUsedAssetCollectionAction *)self underlyingAction];
  id v6 = v5;
  if (v5) {
    [v5 performUndo:v4];
  }
  else {
    v4[2](v4, 1, 0);
  }
}

- (void)performAction:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(PXAddAssetsToLastUsedAssetCollectionAction *)self underlyingAction];
  id v6 = v5;
  if (v5) {
    [v5 performAction:v4];
  }
  else {
    v4[2](v4, 1, 0);
  }
}

- (id)localizedActionName
{
  v3 = objc_opt_class();
  v4 = [(PXPhotosAction *)self photoLibrary];
  v5 = [v3 commandTitleWithPhotoLibrary:v4];

  return v5;
}

- (PXAddAssetsToLastUsedAssetCollectionAction)initWithAssets:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_class();
  v8 = [v6 firstObject];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  v10 = [v9 photoLibrary];
  v11 = [v7 targetAssetCollectionInPhotoLibrary:v10 error:a4];

  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)PXAddAssetsToLastUsedAssetCollectionAction;
    v12 = [(PXAssetsAction *)&v17 initWithAssets:v6];
    if (v12)
    {
      v13 = [[PXAddAssetsToAssetCollectionAction alloc] initWithAssets:v6 assetCollection:v11];
      underlyingAction = v12->_underlyingAction;
      v12->_underlyingAction = v13;

      objc_storeStrong((id *)&v12->_targetAssetCollection, v11);
    }
    self = v12;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (PXAddAssetsToLastUsedAssetCollectionAction)initWithAssets:(id)a3
{
  return [(PXAddAssetsToLastUsedAssetCollectionAction *)self initWithAssets:a3 error:0];
}

+ (void)configureToast:(id)a3 withAlbumName:(id)a4
{
  v5 = NSString;
  id v6 = a4;
  id v9 = a3;
  v7 = PXLocalizedStringFromTable(@"ADDED_TO_LAST_ALBUM_%@_TOAST_MESSAGE_FORMAT", @"PhotosUICore");
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);

  [v9 setMessage:v8];
  [v9 setIconSystemImageName:@"rectangle.stack"];
  [v9 setAutoDismissalDelay:1.0];
}

+ (NSString)placeholderCommandTitle
{
  return (NSString *)PXLocalizedStringFromTable(@"ADD_TO_LAST_ALBUM_COMMAND_TITLE_PLACEHOLDER", @"PhotosUICore");
}

+ (id)commandTitleWithPhotoLibrary:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  v4 = [a1 targetAssetCollectionInPhotoLibrary:a3 error:&v11];
  id v5 = v11;
  if (v4)
  {
    id v6 = PXLocalizedStringFromTable(@"ADD_TO_LAST_ALBUM_COMMAND_TITLE_FORMAT", @"PhotosUICore");
    v10 = [v4 localizedTitle];
    v7 = PXStringWithValidatedFormat();
  }
  else
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "command title for 'add to last used asset collection' couldn't be determined because destination is missing: %@", buf, 0xCu);
    }

    v7 = [a1 placeholderCommandTitle];
  }

  return v7;
}

+ (id)targetAssetCollectionInPhotoLibrary:(id)a3 error:(id *)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXAddAssetsToLastUsedAssetCollectionAction.m", 61, @"%s must be called on the main thread", "+[PXAddAssetsToLastUsedAssetCollectionAction targetAssetCollectionInPhotoLibrary:error:]");
  }
  if (targetAssetCollectionInPhotoLibrary_error__targetAssetCollection)
  {
    v8 = [(id)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection photoLibrary];
    int v9 = [v7 isEqual:v8];

    if (v9)
    {
      id v10 = (id)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
      goto LABEL_24;
    }
  }
  if (!v7)
  {
    v23 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"target asset collection for 'add to last used asset collection' couldn't be determined because the photo library is missing");
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  id v11 = objc_msgSend(v7, "px_localDefaults");
  v12 = [v11 dateForKey:@"LastAddToDestinationDate"];
  if (!v12
    || ([MEMORY[0x1E4F1C9C8] now],
        id v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = objc_msgSend(v13, "px_isWithinTimeInterval:sinceDate:", v12, 2592000.0),
        v13,
        !v14))
  {
    v23 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"target asset collection for 'add to last used asset collection' couldn't be determined because the date is too old or missing");
    goto LABEL_19;
  }
  uint64_t v15 = [v11 stringForKey:@"LastAddToDestination"];
  v16 = (void *)v15;
  if (!v15)
  {
    v24 = (void *)MEMORY[0x1E4F28C58];
    v25 = @"target asset collection for 'add to last used asset collection' couldn't be determined because its local identifier is missing";
LABEL_17:
    v23 = objc_msgSend(v24, "px_genericErrorWithDebugDescription:", v25, v30);
    goto LABEL_18;
  }
  objc_super v17 = (void *)MEMORY[0x1E4F38EE8];
  v31[0] = v15;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  v19 = [v7 librarySpecificFetchOptions];
  v20 = [v17 fetchAssetCollectionsWithLocalIdentifiers:v18 options:v19];
  uint64_t v21 = [v20 firstObject];
  v22 = (void *)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
  targetAssetCollectionInPhotoLibrary_error__targetAssetCollection = v21;

  if (!targetAssetCollectionInPhotoLibrary_error__targetAssetCollection)
  {
    v24 = (void *)MEMORY[0x1E4F28C58];
    v30 = v16;
    v25 = @"target asset collection for 'add to last used asset collection' couldn't be found with local identifier %@";
    goto LABEL_17;
  }
  v23 = 0;
LABEL_18:

LABEL_19:
  if (a4) {
LABEL_20:
  }
    *a4 = v23;
LABEL_21:
  v26 = (void *)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
  if (targetAssetCollectionInPhotoLibrary_error__targetAssetCollection)
  {
    v27 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v27 performBlock:&__block_literal_global_65026];

    v26 = (void *)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
  }
  id v10 = v26;

LABEL_24:
  return v10;
}

void __88__PXAddAssetsToLastUsedAssetCollectionAction_targetAssetCollectionInPhotoLibrary_error___block_invoke()
{
  v0 = (void *)targetAssetCollectionInPhotoLibrary_error__targetAssetCollection;
  targetAssetCollectionInPhotoLibrary_error__targetAssetCollection = 0;
}

+ (void)userDidAddAssetsToAssetCollection:(id)a3
{
  id v3 = a3;
  v4 = [v3 photoLibrary];
  id v5 = objc_msgSend(v4, "px_localDefaults");

  id v6 = [v3 localIdentifier];

  [v5 setString:v6 forKey:@"LastAddToDestination"];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setDate:v7 forKey:@"LastAddToDestinationDate"];

  px_dispatch_on_main_queue();
}

id __80__PXAddAssetsToLastUsedAssetCollectionAction_userDidAddAssetsToAssetCollection___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) targetAssetCollectionInPhotoLibrary:0 error:0];
}

@end