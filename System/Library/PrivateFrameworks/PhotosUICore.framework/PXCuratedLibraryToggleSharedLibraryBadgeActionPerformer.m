@interface PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer
- (BOOL)keepMenuPresented;
- (PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (id)menuElement;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer

- (void)performUserInteractionTask
{
  v3 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  id v4 = [v3 libraryFilterState];

  objc_msgSend(v4, "setSharedLibraryBadgeEnabled:", objc_msgSend(v4, "isSharedLibraryBadgeEnabled") ^ 1);
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_ToggleBadge");
}

- (BOOL)keepMenuPresented
{
  return 1;
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v3 = [v2 libraryFilterState];
  int64_t v4 = [v3 isSharedLibraryBadgeEnabled];

  return v4;
}

- (id)menuElement
{
  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer;
  int64_t v4 = [(PXActionPerformer *)&v10 menuElement];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      v9 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer.m", 35, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[super menuElement]", v8, v9 object file lineNumber description];
    }
  }
  objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") | 8);
  return v4;
}

- (id)activitySystemImageName
{
  return @"person.2";
}

- (id)activityType
{
  v2 = @"PXActivityTypeToggleSharedLibraryBadge";
  return @"PXActivityTypeToggleSharedLibraryBadge";
}

- (PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryToggleSharedLibraryBadgeActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionToggleSharedLibraryBadge" viewModel:a3];
}

@end