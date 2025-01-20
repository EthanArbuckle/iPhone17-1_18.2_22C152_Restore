@interface PXCuratedLibraryToggleAspectFitActionPerformer
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryToggleAspectFitActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)performActionWithCompletionHandler:(id)a3;
@end

@implementation PXCuratedLibraryToggleAspectFitActionPerformer

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)activitySystemImageName
{
  v2 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v3 = [v2 zoomablePhotosViewModel];
  if ([v3 aspectFit]) {
    v4 = @"rectangle.arrowtriangle.2.outward";
  }
  else {
    v4 = @"rectangle.arrowtriangle.2.inward";
  }
  v5 = v4;

  return v5;
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  int v5 = [v4 aspectFitContent];

  if (a3 - 1 < 2)
  {
    v6 = @"PXLibraryAllPhotosToggleFullFramesActionTitle";
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
    v6 = @"PXLibraryAllPhotosToggleFullFrames";
    v7 = @"PXLibraryAllPhotosToggleSquares";
    goto LABEL_5;
  }
  v9 = 0;
LABEL_10:
  return v9;
}

- (void)performActionWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, uint64_t, void))a3;
  int v5 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PXCuratedLibraryToggleAspectFitActionPerformer_performActionWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5DCF3F0;
  v6[4] = self;
  [v5 performChanges:v6];

  if (v4) {
    v4[2](v4, 1, 0);
  }
}

void __85__PXCuratedLibraryToggleAspectFitActionPerformer_performActionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 viewModel];
  int v5 = objc_msgSend(v2, "numberWithInt:", objc_msgSend(v6, "aspectFitContent") ^ 1);
  [v4 setUserWantsAspectFitContent:v5];
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  objc_msgSend(a4, "activityType", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(PXCuratedLibraryToggleAspectFitActionPerformer *)self activityType];
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  char v9 = [v6 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryToggleAspectFitActionPerformer.m", 34, @"Invalid parameter not satisfying: %@", @"PXStringEqualToString(activity.activityType, self.activityType)" object file lineNumber description];
LABEL_5:
  }
  return 1;
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleAspectFit";
  return @"PXActivityTypeToggleAspectFit";
}

- (PXCuratedLibraryToggleAspectFitActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleAspectFitActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionAllPhotosToggleAspectFit" viewModel:a3];
}

@end