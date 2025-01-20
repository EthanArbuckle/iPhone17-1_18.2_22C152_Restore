@interface PUAlbumStreamActivity
+ (BOOL)canPerformWithAssets:(id)a3;
+ (int64_t)activityCategory;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (BOOL)destinationSharedAlbumWasCreated;
- (BOOL)isPresentedFromActivityViewController;
- (PLUserEditableAlbumProtocol)destinationSharedAlbum;
- (PUAlbumStreamActivity)init;
- (UIViewController)referenceViewController;
- (id)_perAssetCreationOptionsForAssets:(id)a3;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (id)itemSourceController;
- (void)_handleDismissWithSuccess:(BOOL)a3;
- (void)_performPresentationOnViewController:(id)a3 completion:(id)a4;
- (void)_prepareWithAssets:(id)a3;
- (void)_publishAssets:(id)a3 withSharingInfos:(id)a4 customExportsInfo:(id)a5 andTrimmedVideoPathInfo:(id)a6 comment:(id)a7 invitationRecipients:(id)a8 wantsPublicWebsite:(BOOL)a9 toAlbum:(id)a10 orCreateWithName:(id)a11 completion:(id)a12;
- (void)_publishAssets:(id)a3 withSharingInfos:(id)a4 customExportsInfo:(id)a5 andTrimmedVideoPathInfo:(id)a6 comment:(id)a7 toAlbum:(id)a8 isNewAlbum:(BOOL)a9 completion:(id)a10;
- (void)prepareWithActivityItems:(id)a3;
- (void)presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDestinationSharedAlbum:(id)a3;
- (void)setDestinationSharedAlbumWasCreated:(BOOL)a3;
- (void)setItemSourceController:(id)a3;
- (void)setPresentedFromActivityViewController:(BOOL)a3;
- (void)setReferenceViewController:(id)a3;
- (void)sharedAlbumActionControllerDidCancel:(id)a3;
- (void)sharedAlbumActionControllerDidFinish:(id)a3;
@end

@implementation PUAlbumStreamActivity

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_referenceViewController);
  objc_storeStrong((id *)&self->_destinationSharedAlbum, 0);
  objc_destroyWeak((id *)&self->_itemSourceController);
  objc_storeStrong((id *)&self->_activityController, 0);
}

- (void)setReferenceViewController:(id)a3
{
}

- (UIViewController)referenceViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setDestinationSharedAlbumWasCreated:(BOOL)a3
{
  self->_destinationSharedAlbumWasCreated = a3;
}

- (BOOL)destinationSharedAlbumWasCreated
{
  return self->_destinationSharedAlbumWasCreated;
}

- (void)setDestinationSharedAlbum:(id)a3
{
}

- (PLUserEditableAlbumProtocol)destinationSharedAlbum
{
  return self->_destinationSharedAlbum;
}

- (void)setPresentedFromActivityViewController:(BOOL)a3
{
  self->_isPresentedFromActivityViewController = a3;
}

- (BOOL)isPresentedFromActivityViewController
{
  return self->_isPresentedFromActivityViewController;
}

- (void)setItemSourceController:(id)a3
{
}

- (id)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  return WeakRetained;
}

- (void)sharedAlbumActionControllerDidCancel:(id)a3
{
}

- (void)sharedAlbumActionControllerDidFinish:(id)a3
{
}

- (void)_publishAssets:(id)a3 withSharingInfos:(id)a4 customExportsInfo:(id)a5 andTrimmedVideoPathInfo:(id)a6 comment:(id)a7 invitationRecipients:(id)a8 wantsPublicWebsite:(BOOL)a9 toAlbum:(id)a10 orCreateWithName:(id)a11 completion:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a12;
  if (v22)
  {
    PXSharedAlbumsRecordRecentInvitationRecipients();
    LOBYTE(v24) = 0;
    [(PUAlbumStreamActivity *)self _publishAssets:v17 withSharingInfos:v18 customExportsInfo:v19 andTrimmedVideoPathInfo:v20 comment:v21 toAlbum:v22 isNewAlbum:v24 completion:v23];
  }
  else
  {
    id v25 = v17;
    id v26 = v18;
    id v27 = v19;
    id v28 = v20;
    id v29 = v21;
    id v30 = v23;
    PXSharedAlbumsCreateNewAlbum();
  }
}

void __183__PUAlbumStreamActivity__publishAssets_withSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_comment_invitationRecipients_wantsPublicWebsite_toAlbum_orCreateWithName_completion___block_invoke(id *a1, void *a2)
{
  id v4 = a2;
  id v5 = a1[5];
  id v6 = a1[6];
  id v7 = a1[7];
  id v8 = a1[8];
  id v9 = a1[9];
  id v10 = a1[10];
  id v3 = v4;
  px_dispatch_on_main_queue();
}

void __183__PUAlbumStreamActivity__publishAssets_withSharingInfos_customExportsInfo_andTrimmedVideoPathInfo_comment_invitationRecipients_wantsPublicWebsite_toAlbum_orCreateWithName_completion___block_invoke_2(uint64_t a1)
{
  id v13 = *(id *)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 32), "pl_assetContainer");
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 96);
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v10);
    v11 = objc_msgSend(v2, "px_descriptionForAssertionMessage");
    [v3 handleFailureInMethod:v8, v9, @"PUAlbumStreamActivity.m", 234, @"%@ should be an instance inheriting from %@, but it is %@", @"[sharedAlbum pl_assetContainer]", v7, v11 object file lineNumber description];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = *(void *)(a1 + 96);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    [v3 handleFailureInMethod:v4, v5, @"PUAlbumStreamActivity.m", 234, @"%@ should be an instance inheriting from %@, but it is nil", @"[sharedAlbum pl_assetContainer]", v7 object file lineNumber description];
  }

LABEL_3:
  [*(id *)(a1 + 40) setDestinationSharedAlbum:v13];
  [*(id *)(a1 + 40) setDestinationSharedAlbumWasCreated:1];
  LOBYTE(v12) = 1;
  [*(id *)(a1 + 40) _publishAssets:*(void *)(a1 + 48) withSharingInfos:*(void *)(a1 + 56) customExportsInfo:*(void *)(a1 + 64) andTrimmedVideoPathInfo:*(void *)(a1 + 72) comment:*(void *)(a1 + 80) toAlbum:v2 isNewAlbum:v12 completion:*(void *)(a1 + 88)];
}

- (void)_publishAssets:(id)a3 withSharingInfos:(id)a4 customExportsInfo:(id)a5 andTrimmedVideoPathInfo:(id)a6 comment:(id)a7 toAlbum:(id)a8 isNewAlbum:(BOOL)a9 completion:(id)a10
{
  uint64_t v24 = (void (**)(void))a10;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = [a3 valueForKeyPath:@"uuid"];
  id v22 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v23 = [v17 stringByTrimmingCharactersInSet:v22];

  [v16 publishBatchOfOriginalAssetUUIDs:v21 withBatchCommentText:v23 assetsSharingInfos:v20 customExportsInfo:v19 andTrimmedVideoPathInfo:v18 isNewAlbum:a9];
  if (v24) {
    v24[2]();
  }
}

- (void)presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    objc_storeWeak((id *)&self->_referenceViewController, v7);
    [(PUAlbumStreamActivity *)self _performPresentationOnViewController:v7 completion:v8];
  }
  else
  {
    uint64_t v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_error_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Presenting the activity controller requires either a concrete view controller or adoption of delegate methods for presenting and dismissing.", v10, 2u);
    }
  }
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 1;
}

- (void)_performPresentationOnViewController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  activityController = self->_activityController;
  id v8 = a3;
  [(UIViewController *)activityController setModalPresentationStyle:16];
  uint64_t v9 = self->_activityController;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PUAlbumStreamActivity__performPresentationOnViewController_completion___block_invoke;
  v11[3] = &unk_1E5F2EBA0;
  id v12 = v6;
  id v10 = v6;
  [v8 presentViewController:v9 animated:1 completion:v11];
}

uint64_t __73__PUAlbumStreamActivity__performPresentationOnViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_handleDismissWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUAlbumStreamActivity *)self isPresentedFromActivityViewController])
  {
    [(UIActivity *)self activityDidFinish:v3];
  }
  else
  {
    id v6 = [(PXActivity *)self actionDelegate];
    if (objc_opt_respondsToSelector())
    {
      if (v3)
      {
        id WeakRetained = 0;
      }
      else
      {
        id WeakRetained = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
      }
      [v6 activity:self didFinishWithSuccess:v3 error:WeakRetained];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceViewController);
      [WeakRetained dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (id)activityViewController
{
  return self->_activityController;
}

- (void)_prepareWithAssets:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PUAlbumStreamActivity *)self itemSourceController];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 assets];
  }
  else
  {
    id v7 = v4;
  }
  id v8 = v7;
  char v9 = [v6 shouldExcludeCaptionInAllItemSources];
  id v10 = 0;
  if ([v8 count] == 1 && (v9 & 1) == 0)
  {
    v11 = [v8 firstObject];
    [v11 fetchPropertySetsIfNeeded];
    id v12 = [v11 descriptionProperties];
    id v13 = [v12 assetDescription];

    if ([v13 length])
    {
      v14 = PLShareSheetGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v13;
        _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "Sharing single asset which has a caption. Setting as starting text for posting as a comment: %@", (uint8_t *)&v20, 0xCu);
      }

      id v10 = v13;
    }
    else
    {
      id v10 = 0;
    }
  }
  v15 = [(PUAlbumStreamActivity *)self _perAssetCreationOptionsForAssets:v8];
  id v16 = objc_alloc(MEMORY[0x1E4F90680]);
  id v17 = [v8 array];
  id v18 = (UIViewController *)[v16 initWithAssets:v17 batchComment:v10 perAssetCreationOptions:v15];

  [(UIViewController *)v18 setActionControllerDelegate:self];
  activityController = self->_activityController;
  self->_activityController = v18;
}

- (id)_perAssetCreationOptionsForAssets:(id)a3
{
  id v5 = a3;
  id v6 = [(PUAlbumStreamActivity *)self itemSourceController];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 assetItemSources];
    char v9 = [v8 array];

    uint64_t v10 = [v9 count];
    if (v10 != [v5 count])
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"PUAlbumStreamActivity.m" lineNumber:122 description:@"Invalid item or asset count while creating sharing options"];
    }
    v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    char v12 = [v7 shouldExcludeLivenessInAllItemSources];
    char v13 = [v7 shouldExcludeLocationInAllItemSources];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__PUAlbumStreamActivity__perAssetCreationOptionsForAssets___block_invoke;
    v18[3] = &unk_1E5F234D8;
    id v19 = v9;
    char v21 = v12;
    char v22 = v13;
    id v14 = v11;
    id v20 = v14;
    id v15 = v9;
    [v5 enumerateObjectsUsingBlock:v18];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void __59__PUAlbumStreamActivity__perAssetCreationOptionsForAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v10 = [v5 objectAtIndexedSubscript:a3];
  [v10 sharingPreferences];
  id v7 = PXSharedAlbumsDefaultAssetCreationOptions();
  id v8 = *(void **)(a1 + 40);
  char v9 = [v6 uuid];

  [v8 setObject:v7 forKeyedSubscript:v9];
}

- (void)prepareWithActivityItems:(id)a3
{
  id v5 = [(PUAlbumStreamActivity *)self itemSourceController];
  id v4 = [v5 assets];
  [(PUAlbumStreamActivity *)self prepareWithAssets:v4];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F8AAB0];
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "systemPhotoLibraryURL", a3);
  int v6 = [v4 sharedStreamsEnabledForPhotoLibraryURL:v5];

  if (v6)
  {
    id v7 = [(PUAlbumStreamActivity *)self itemSourceController];
    if ([v7 isPreparingIndividualItems])
    {
      id v8 = [v7 assets];
      LOBYTE(v6) = +[PUAlbumStreamActivity canPerformWithAssets:v8];
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (id)_systemImageName
{
  return @"rectangle.stack.badge.person.crop";
}

- (id)activityTitle
{
  return PULocalizedString(@"PUBLISH_ALBUM_STREAMING_SERVICE");
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90950];
}

- (PUAlbumStreamActivity)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUAlbumStreamActivity;
  uint64_t result = [(UIActivity *)&v3 init];
  if (result) {
    result->_isPresentedFromActivityViewController = 1;
  }
  return result;
}

+ (int64_t)activityCategory
{
  return 0;
}

+ (BOOL)canPerformWithAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v5 = (void *)MEMORY[0x1E4F8AAB0];
  id v4 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
  LODWORD(v5) = [v5 sharedStreamsEnabledForPhotoLibraryURL:v4];

  if (v5)
  {
    id v5 = (void *)[v3 count];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "playbackStyle", (void)v12))
          {

            LOBYTE(v5) = 0;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    if (v5) {
      LOBYTE(v5) = (unint64_t)v5 <= [MEMORY[0x1E4F8AAB0] maxAssetsPerStream];
    }
  }
LABEL_13:

  return (char)v5;
}

@end