@interface PXPhotosGridToggleFilterActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
+ (BOOL)isContentFilterHidden:(int64_t)a3 viewModel:(id)a4;
+ (BOOL)isLibaryFilterHidden:(int64_t)a3 viewModel:(id)a4;
- (BOOL)performerResetsAfterCompletion;
- (BOOL)updateToContentFilterStateAndFinishTask:(id)a3;
- (BOOL)updateToLibraryFilterStateAndFinishTask:(id)a3;
- (id)menuElement;
- (void)finishedUserInteractionTask;
@end

@implementation PXPhotosGridToggleFilterActionPerformer

- (BOOL)updateToContentFilterStateAndFinishTask:(id)a3
{
  id v4 = a3;
  v5 = [(PXActionPerformer *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  if (v6) {
    [v5 photosGridActionPerformer:self contentFilterStateChanged:v4];
  }
  [(PXPhotosGridToggleFilterActionPerformer *)self finishedUserInteractionTask];

  return v6 & 1;
}

- (BOOL)updateToLibraryFilterStateAndFinishTask:(id)a3
{
  id v4 = a3;
  v5 = [(PXActionPerformer *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  if (v6) {
    [v5 photosGridActionPerformer:self libraryFilterStateChanged:v4];
  }
  [(PXPhotosGridToggleFilterActionPerformer *)self finishedUserInteractionTask];

  return v6 & 1;
}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (void)finishedUserInteractionTask
{
}

- (id)menuElement
{
  v11.receiver = self;
  v11.super_class = (Class)PXPhotosGridToggleFilterActionPerformer;
  id v4 = [(PXActionPerformer *)&v11 menuElement];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, self, @"PXPhotosGridToggleFilterActionPerformer.m", 45, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[super menuElement]", v9, v10 object file lineNumber description];
    }
  }
  v5 = [(PXActionPerformer *)self localizedTitleForUseCase:0];
  [v4 setTitle:v5];

  objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") | 8);
  return v4;
}

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return objc_msgSend(a4, "canFilterContent", a3);
}

+ (BOOL)isContentFilterHidden:(int64_t)a3 viewModel:(id)a4
{
  id v5 = a4;
  char v6 = [v5 dataSourceManager];
  v7 = [v6 dataSource];
  v8 = [v7 containerCollection];

  v9 = [v5 libraryFilterState];

  v10 = PXContentFilterHiddenTypesForAssetCollection(v8);

  objc_super v11 = [NSNumber numberWithInteger:a3];
  LOBYTE(v9) = [v10 containsObject:v11];

  return (char)v9;
}

+ (BOOL)isLibaryFilterHidden:(int64_t)a3 viewModel:(id)a4
{
  id v5 = a4;
  if ([v5 allowsSwitchLibraryAction]
    && ([v5 sharedLibraryStatusProvider],
        char v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 hasSharedLibraryOrPreview],
        v6,
        v7))
  {
    v8 = [v5 dataSourceManager];
    v9 = [v8 dataSource];
    v10 = [v9 containerCollection];

    objc_super v11 = [v5 libraryFilterState];
    v12 = PXLibraryFilterHiddenTypesForAssetCollection(v10);

    v13 = [NSNumber numberWithInteger:a3];
    char v14 = [v12 containsObject:v13];
  }
  else
  {
    char v14 = 1;
  }

  return v14;
}

@end