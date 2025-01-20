@interface PXPhotosGridToggleSharedLibraryBadgeActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (BOOL)performerResetsAfterCompletion;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (id)menuElement;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridToggleSharedLibraryBadgeActionPerformer

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v5 = [v3 libraryFilterState];

  objc_msgSend(v5, "setSharedLibraryBadgeEnabled:", objc_msgSend(v5, "isSharedLibraryBadgeEnabled") ^ 1);
  v4 = [(PXActionPerformer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 photosGridActionPerformer:self libraryFilterStateChanged:v5];
  }
  [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_ToggleBadge");
}

- (int64_t)menuElementState
{
  v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  v3 = [v2 libraryFilterState];
  int64_t v4 = [v3 isSharedLibraryBadgeEnabled];

  return v4;
}

- (id)menuElement
{
  v10.receiver = self;
  v10.super_class = (Class)PXPhotosGridToggleSharedLibraryBadgeActionPerformer;
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
      [v6 handleFailureInMethod:a2, self, @"PXPhotosGridToggleSharedLibraryBadgeActionPerformer.m", 44, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[super menuElement]", v8, v9 object file lineNumber description];
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

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4 = a4;
  id v5 = [v4 sharedLibraryStatusProvider];
  int v6 = [v5 hasSharedLibraryOrPreview];

  if (v6)
  {
    v7 = [v4 dataSourceManager];
    v8 = [v7 dataSource];
    v9 = [v8 containerCollection];

    int v10 = objc_msgSend(v9, "px_isSharedAlbum") ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

@end