@interface PXPhotoKitAssetCollectionMomentShareActionPerformer
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5;
- (int64_t)shareOriginForSession:(id)a3 workflowCoordinator:(id)a4;
- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4;
- (void)performUserInteractionTask;
- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6;
@end

@implementation PXPhotoKitAssetCollectionMomentShareActionPerformer

- (void).cxx_destruct
{
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  workflowCoordinator = self->_workflowCoordinator;
  self->_workflowCoordinator = 0;
  id v7 = a4;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotoKitAssetCollectionMomentShareActionPerformer;
  [(PXActionPerformer *)&v8 completeUserInteractionTaskWithSuccess:v4 error:v7];
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
  BOOL v7 = -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, 0, a5, a6);
  uint64_t v8 = 0;
  if (!v7)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1002, @"Failed to dismiss the CMM view controller");
  }
  id v9 = (id)v8;
  [(PXPhotoKitAssetCollectionMomentShareActionPerformer *)self completeUserInteractionTaskWithSuccess:v7 error:v8];
}

- (int64_t)shareOriginForSession:(id)a3 workflowCoordinator:(id)a4
{
  return 3;
}

- (void)performUserInteractionTask
{
  v3 = [PXCMMPhotoKitContext alloc];
  BOOL v4 = [(PXAssetCollectionActionPerformer *)self assetCollection];
  id v9 = [(PXCMMPhotoKitContext *)v3 initWithAssetCollection:v4 activityType:1 sourceType:0];

  [(PXCMMContext *)v9 setHideActionMenu:1];
  v5 = objc_alloc_init(PXCMMWorkflowCoordinator);
  workflowCoordinator = self->_workflowCoordinator;
  self->_workflowCoordinator = v5;

  [(PXCMMWorkflowCoordinator *)self->_workflowCoordinator setDelegate:self];
  BOOL v7 = [(PXCMMWorkflowCoordinator *)self->_workflowCoordinator workflowViewControllerWithContext:v9 embedInNavigationControllerOfClass:objc_opt_class()];
  if (![(PXActionPerformer *)self presentViewController:v7])
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1002, @"Failed to present the CMM view controller");
    [(PXPhotoKitAssetCollectionMomentShareActionPerformer *)self completeUserInteractionTaskWithSuccess:0 error:v8];
  }
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  v5 = NSString;
  if (a3 > 2) {
    v6 = 0;
  }
  else {
    v6 = off_1E5DB8B58[a3];
  }
  BOOL v7 = v6;
  uint64_t v8 = [v5 stringWithFormat:@"PXPhotoKitAssetCollectionActionManager%@Title_Share", v7];

  id v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");

  return v9;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  v6 = [a3 assetCollection];
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 1856, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v13 object file lineNumber description];
LABEL_10:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, a1, @"PXPhotoKitAssetCollectionActionManager.m", 1856, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v13, v15 object file lineNumber description];

    goto LABEL_10;
  }
LABEL_3:
  BOOL v7 = [v6 photoLibrary];
  int v8 = PXCMMHasSendAndReceiveCapabilities(v7);

  BOOL v9 = v8 && [v6 assetCollectionType] != 8 && objc_msgSend(v6, "assetCollectionType") != 7;
  return v9;
}

@end