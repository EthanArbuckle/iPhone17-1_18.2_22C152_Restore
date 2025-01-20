@interface PXPostAssetsToSharedAlbumAction
- (PXPostAssetsToSharedAlbumAction)initWithSharedAlbum:(id)a3 assets:(id)a4 comment:(id)a5;
- (id)actionIdentifier;
- (id)actionNameLocalizationKey;
- (id)presentationEnvironment;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXPostAssetsToSharedAlbumAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_sharedAlbum, 0);
}

- (void)performUndo:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  objc_msgSend(v4, "px_genericErrorWithDebugDescription:", @"No undo support for post actions");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)performAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_sharedAlbum;
  id v6 = PLSharedAlbumsGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(PHCloudSharedAlbum *)v5 uuid];
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "IPXSharedAlbumPostToAction: Posting assets to shared album with UUID=%{public}@", buf, 0xCu);
  }
  v8 = [(PXPostAssetsToSharedAlbumAction *)self presentationEnvironment];
  v9 = [(PXAssetsAction *)self assets];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__PXPostAssetsToSharedAlbumAction_performAction___block_invoke;
  v13[3] = &unk_1E5DB94C8;
  v14 = v5;
  v15 = self;
  id v16 = v8;
  id v17 = v4;
  id v10 = v4;
  id v11 = v8;
  v12 = v5;
  PXSharedAlbumsValidateSharedAlbumAddAssets(v12, v9, v11, v13);
}

void __49__PXPostAssetsToSharedAlbumAction_performAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    v8 = v3;
    id v5 = PXSharedAlbumsDefaultAssetCreationOptionsForAssets(v3, 0, 1);
    id v6 = PXSharedAlbumsPrepareAndPublishAssetsToSharedAlbum(*(void **)(a1 + 32), v8, *(void **)(*(void *)(a1 + 40) + 104), v5, *(void **)(a1 + 48), *(void **)(a1 + 56));
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (!v7) {
      goto LABEL_6;
    }
    v8 = 0;
    (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, 0);
  }
  id v4 = v8;
LABEL_6:
}

- (id)actionNameLocalizationKey
{
  return @"PXPostToSharedAlbumActionName";
}

- (id)actionIdentifier
{
  return @"PostAssetsToSharedAlbum";
}

- (PXPostAssetsToSharedAlbumAction)initWithSharedAlbum:(id)a3 assets:(id)a4 comment:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXPostAssetsToSharedAlbumAction.m", 38, @"Invalid parameter not satisfying: %@", @"sharedAlbum" object file lineNumber description];
  }
  if (![v11 count])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXPostAssetsToSharedAlbumAction.m", 39, @"Invalid parameter not satisfying: %@", @"assets.count" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)PXPostAssetsToSharedAlbumAction;
  v13 = [(PXAssetsAction *)&v20 initWithAssets:v11];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sharedAlbum, a3);
    uint64_t v15 = [v12 copy];
    comment = v14->_comment;
    v14->_comment = (NSString *)v15;
  }
  return v14;
}

- (id)presentationEnvironment
{
  v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v3 = objc_msgSend(v2, "px_firstKeyWindow");
  id v4 = [v3 rootViewController];
  id v5 = PXPresentationEnvironmentForSender(v4);

  return v5;
}

@end