@interface PXCuratedLibraryTogglePortraitFilterActionPerformer
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryTogglePortraitFilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryTogglePortraitFilterActionPerformer

- (void)performUserInteractionTask
{
  id v3 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  objc_msgSend(v3, "setPortrait:", objc_msgSend(v3, "portrait") ^ 1);
  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v3];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  if (a3 == 1)
  {
    v5 = [(PXCuratedLibraryActionPerformer *)self viewModel];
    v6 = [v5 allPhotosContentFilterState];

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
        [v10 handleFailureInMethod:a2, self, @"PXCuratedLibraryTogglePortraitFilterActionPerformer.m", 42, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.viewModel.allPhotosContentFilterState", v12, v13 object file lineNumber description];
      }
    }
    if ([v6 portrait]) {
      v7 = @"DISABLE_PORTRAIT_FILTER_SHORTCUT";
    }
    else {
      v7 = @"ENABLE_PORTRAIT_FILTER_SHORTCUT";
    }
    v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");
  }
  else
  {
    v8 = PXContentFilterTitleForItemTag(12);
  }
  return v8;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:12];

  return v3;
}

- (id)activitySystemImageName
{
  return @"f.cursive.circle";
}

- (id)activityType
{
  v2 = @"PXActivityTypeTogglePortraitFilter";
  return @"PXActivityTypeTogglePortraitFilter";
}

- (PXCuratedLibraryTogglePortraitFilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryTogglePortraitFilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionTogglePortraitFilter" viewModel:a3];
}

@end