@interface PXCMMGridController
+ (BOOL)useGridZeroForCMMSession:(id)a3;
- (PXCMMGridController)init;
- (PXCMMGridController)initWithCMMSession:(id)a3 enableDismissAction:(BOOL)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 performerDelegate:(id)a7 photosViewConfigurationBlock:(id)a8;
- (UIViewController)gridViewController;
@end

@implementation PXCMMGridController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridViewController, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_statusPresentation, 0);
}

- (UIViewController)gridViewController
{
  return self->_gridViewController;
}

- (PXCMMGridController)initWithCMMSession:(id)a3 enableDismissAction:(BOOL)a4 assetActionManager:(id)a5 assetCollectionActionManager:(id)a6 performerDelegate:(id)a7 photosViewConfigurationBlock:(id)a8
{
  BOOL v50 = a4;
  id v13 = a3;
  v14 = (PXPhotoKitMessagesAssetActionManager *)a5;
  v15 = (PXPhotoKitAssetCollectionActionManager *)a6;
  id v16 = a7;
  v17 = (void (**)(id, void *))a8;
  v52.receiver = self;
  v52.super_class = (Class)PXCMMGridController;
  v18 = [(PXCMMGridController *)&v52 init];
  if (!v18) {
    goto LABEL_25;
  }
  v19 = [v13 viewModel];
  v51 = [v19 selectionManager];

  if (!v14)
  {
    id v20 = v13;
    id v21 = v51;
    v22 = [v21 dataSourceManager];
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [(PXPhotoKitAssetActionManager *)[PXPhotoKitMessagesAssetActionManager alloc] initWithSelectionManager:v21];
      v24 = [v20 importStatusManager];
      [(PXPhotoKitAssetActionManager *)v14 setImportStatusManager:v24];

      v25 = [v20 importSessionID];
      [(PXPhotoKitAssetActionManager *)v14 setImportSessionID:v25];

      v26 = +[PXCompleteMyMomentSettings sharedInstance];
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [v27 addObject:@"PXAssetActionTypeAddToLibrary"];
      if (([v26 disableShareAction] & 1) == 0) {
        [v27 addObject:@"PXAssetActionTypeShare"];
      }
      if (([v26 disableCopyAction] & 1) == 0) {
        [v27 addObject:@"PXAssetActionTypeCopy"];
      }
      [(PXActionManager *)v14 setAllowedActionTypes:v27];
    }
    else
    {
      v26 = PLSharingGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v26, OS_LOG_TYPE_ERROR, "Unable to provide action manager because data source manager is not of type PXPhotoKitAssetsDataSourceManager.", buf, 2u);
      }
      v14 = 0;
    }

    [(PXActionManager *)v14 setPerformerDelegate:v16];
    if (v15) {
      goto LABEL_18;
    }
LABEL_15:
    id v28 = v13;
    if (v28)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_17:
        v29 = [v28 momentShare];
        v15 = [(PXAssetCollectionActionManager *)[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollection:v29 displayTitleInfo:0];

        [(PXActionManager *)v15 setPerformerDelegate:v16];
        goto LABEL_18;
      }
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = [NSString stringWithUTF8String:"PXPhotoKitAssetCollectionActionManager *_AssetCollectionActionManager(PXCMMSession *__strong)"];
      v48 = (objc_class *)objc_opt_class();
      v47 = NSStringFromClass(v48);
      v49 = objc_msgSend(v28, "px_descriptionForAssertionMessage");
      [v44 handleFailureInFunction:v45, @"PXCMMGridController.m", 146, @"%@ should be an instance inheriting from %@, but it is %@", @"session", v47, v49 file lineNumber description];
    }
    else
    {
      v44 = [MEMORY[0x1E4F28B00] currentHandler];
      v45 = [NSString stringWithUTF8String:"PXPhotoKitAssetCollectionActionManager *_AssetCollectionActionManager(PXCMMSession *__strong)"];
      v46 = (objc_class *)objc_opt_class();
      v47 = NSStringFromClass(v46);
      [v44 handleFailureInFunction:v45, @"PXCMMGridController.m", 146, @"%@ should be an instance inheriting from %@, but it is nil", @"session", v47 file lineNumber description];
    }

    goto LABEL_17;
  }
  if (!v15) {
    goto LABEL_15;
  }
LABEL_18:
  v30 = [PXPhotosViewConfiguration alloc];
  v31 = [v13 dataSourceManager];
  v32 = [v13 mediaProvider];
  v33 = [(PXPhotosViewConfiguration *)v30 initWithDataSourceManager:v31 mediaProvider:v32 selectionManager:v51 assetActionManager:v14 assetCollectionActionManager:v15];

  [(PXPhotosViewConfiguration *)v33 setFooterVisibilityStyle:2];
  [(PXPhotosViewConfiguration *)v33 setAllowedActions:196769];
  if (v50) {
    [(PXPhotosViewConfiguration *)v33 setAllowedActions:[(PXPhotosViewConfiguration *)v33 allowedActions] | 0x2000];
  }
  [(PXPhotosViewConfiguration *)v33 setSectionBodyStyle:2];
  [(PXPhotosViewConfiguration *)v33 setWantsModernNavBarButtons:1];
  [(PXPhotosViewConfiguration *)v33 setNavBarStyle:3];
  [(PXPhotosViewConfiguration *)v33 setWantsTabBarHidden:1];
  [(PXPhotosViewConfiguration *)v33 setPrefersActionsInToolbar:1];
  v34 = [v13 importStatusManager];
  [(PXPhotosViewConfiguration *)v33 setAssetImportStatusManager:v34];

  uint64_t v35 = [v13 momentShareStatusPresentationWithPresentationStyle:2];
  statusPresentation = v18->_statusPresentation;
  v18->_statusPresentation = (PXMomentShareStatusPresentation *)v35;

  if (v18->_statusPresentation)
  {
    v37 = [[PXCMMFooterViewModel alloc] initWithMomentShareStatusPresentation:v18->_statusPresentation mode:1];
    [(PXPhotosViewConfiguration *)v33 setFooterViewModel:v37];
    v38 = objc_alloc_init(PXStatusViewModel);
    v39 = [[PXCMMStatusController alloc] initWithStatusPresentation:v18->_statusPresentation viewModel:v38];
    statusController = v18->_statusController;
    v18->_statusController = v39;

    [(PXPhotosViewConfiguration *)v33 setEmptyPlaceholderStatusViewModel:v38];
  }
  if (v17) {
    v17[2](v17, v33);
  }
  v41 = [[PXPhotosUIViewController alloc] initWithConfiguration:v33];
  gridViewController = v18->_gridViewController;
  v18->_gridViewController = &v41->super;

LABEL_25:
  return v18;
}

- (PXCMMGridController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMGridController.m", 51, @"%s is not available as initializer", "-[PXCMMGridController init]");

  abort();
}

+ (BOOL)useGridZeroForCMMSession:(id)a3
{
  id v3 = a3;
  v4 = +[PXPhotosGridSettings sharedInstance];
  char v5 = [v4 enableInCMM];

  BOOL v6 = [v3 activityType] == 3 || objc_msgSend(v3, "activityType") == 2;
  BOOL v7 = v5 & v6;

  return v7;
}

@end