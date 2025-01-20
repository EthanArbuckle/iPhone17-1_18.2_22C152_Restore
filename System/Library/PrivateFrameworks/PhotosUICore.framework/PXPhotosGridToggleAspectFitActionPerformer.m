@interface PXPhotosGridToggleAspectFitActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (BOOL)performerResetsAfterCompletion;
- (id)activitySystemImageName;
- (id)activityType;
- (id)barButtonItemWithTarget:(id)a3 action:(SEL)a4;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (id)menuElement;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridToggleAspectFitActionPerformer

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__PXPhotosGridToggleAspectFitActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5DC9680;
  id v6 = v3;
  id v4 = v3;
  [v4 performChanges:v5];
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

void __72__PXPhotosGridToggleAspectFitActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "aspectFitContent") ^ 1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setUserWantsAspectFitContent:v5];
}

- (id)barButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v7 = [(PXPhotosGridToggleAspectFitActionPerformer *)self localizedTitleForUseCase:1];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:0 target:v6 action:a4];

  return v8;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  id v4 = [(PXPhotosGridActionPerformer *)self viewModel];
  int v5 = [v4 aspectFitContent];

  if (a3 - 1 < 2)
  {
    id v6 = @"PXLibraryAllPhotosToggleFullFramesActionTitle";
    v7 = @"PXLibraryAllPhotosToggleSquaresActionTitle";
LABEL_5:
    if (v5) {
      v8 = v7;
    }
    else {
      v8 = v6;
    }
    v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
    goto LABEL_10;
  }
  if (!a3)
  {
    id v6 = @"PXLibraryAllPhotosToggleFullFrames";
    v7 = @"PXLibraryAllPhotosToggleSquares";
    goto LABEL_5;
  }
  v9 = 0;
LABEL_10:
  return v9;
}

- (id)menuElement
{
  v10.receiver = self;
  v10.super_class = (Class)PXPhotosGridToggleAspectFitActionPerformer;
  id v4 = [(PXActionPerformer *)&v10 menuElement];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PXPhotosGridToggleAspectFitActionPerformer.m", 33, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[super menuElement]", v8, v9 object file lineNumber description];
    }
  }
  objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") | 8);
  return v4;
}

- (id)activitySystemImageName
{
  v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  if ([v2 aspectFitContent]) {
    v3 = @"rectangle.arrowtriangle.2.outward";
  }
  else {
    v3 = @"rectangle.arrowtriangle.2.inward";
  }
  id v4 = v3;

  return v4;
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleAspectFit";
  return @"PXActivityTypeToggleAspectFit";
}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4 = a4;
  if ([v4 supportsAspectRatioToggle])
  {
    int v5 = [v4 currentDataSource];
    char v6 = [v5 containsAnyItems];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

@end