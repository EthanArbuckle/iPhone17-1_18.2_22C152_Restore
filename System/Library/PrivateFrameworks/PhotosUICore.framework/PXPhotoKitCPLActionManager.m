@interface PXPhotoKitCPLActionManager
- (PHPhotoLibrary)photoLibrary;
- (PXPhotoKitCPLActionManager)init;
- (PXPhotoKitCPLActionManager)initWithPhotoLibrary:(id)a3;
- (id)actionPerformerForActionType:(id)a3;
@end

@implementation PXPhotoKitCPLActionManager

- (PXPhotoKitCPLActionManager)initWithPhotoLibrary:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXPhotoKitCPLActionManager.m", 21, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PXPhotoKitCPLActionManager;
  v7 = [(PXPhotoKitCPLActionManager *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)actionPerformerForActionType:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXPhotoKitCPLActionManager.m", 31, @"Invalid parameter not satisfying: %@", @"actionType" object file lineNumber description];
  }
  if ((([v5 isEqualToString:@"PXCPLActionTypePause"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeResume"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeManageCloudStorage"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeManageLocalStorage"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeManageCellularDataDisabled"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeManageAirplaneMode"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeManageExitMode"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeLearnMoreClientVersionTooOld"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeManageClientAuthentication"] & 1) != 0
     || ([v5 isEqualToString:@"PXCPLActionTypeLearnMoreUpgradeSuggested"] & 1) != 0
     || [v5 isEqualToString:@"PXCPLActionTypeViewItemsFailingToUpload"])
    && (id v6 = (objc_class *)objc_opt_class()) != 0)
  {
    v7 = (void *)[[v6 alloc] initWithActionType:v5 photoLibrary:self->_photoLibrary];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PXPhotoKitCPLActionManager)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoKitCPLActionManager.m", 17, @"%s is not available as initializer", "-[PXPhotoKitCPLActionManager init]");

  abort();
}

@end