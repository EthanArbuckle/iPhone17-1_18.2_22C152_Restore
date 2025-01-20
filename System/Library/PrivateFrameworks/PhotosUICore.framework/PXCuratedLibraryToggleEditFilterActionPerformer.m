@interface PXCuratedLibraryToggleEditFilterActionPerformer
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryToggleEditFilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryToggleEditFilterActionPerformer

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
        [v10 handleFailureInMethod:a2, self, @"PXCuratedLibraryToggleEditFilterActionPerformer.m", 42, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.viewModel.allPhotosContentFilterState", v12, v13 object file lineNumber description];
      }
    }
    if ([v6 edited]) {
      v7 = @"DISABLE_EDITS_FILTER_SHORTCUT";
    }
    else {
      v7 = @"ENABLE_EDITS_FILTER_SHORTCUT";
    }
    v8 = PXLocalizedStringFromTable(v7, @"PhotosUICore");
  }
  else
  {
    v8 = PXContentFilterTitleForItemTag(9);
  }
  return v8;
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  int64_t v3 = [v2 isContentFilterActive:9];

  return v3;
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (id)activitySystemImageName
{
  return @"slider.horizontal.3";
}

- (void)performUserInteractionTask
{
  id v3 = [(PXCuratedLibraryToggleFilterActionPerformer *)self currentContentFilterState];
  objc_msgSend(v3, "setEdited:", objc_msgSend(v3, "edited") ^ 1);
  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToContentFilterStateAndFinishTask:v3];
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleEditedFilter";
  return @"PXActivityTypeToggleEditedFilter";
}

- (PXCuratedLibraryToggleEditFilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleEditFilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionToggleEditFilter" viewModel:a3];
}

@end