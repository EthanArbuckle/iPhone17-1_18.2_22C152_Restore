@interface PXCuratedLibraryToggleFilterActionPerformer
- (BOOL)updateToContentFilterStateAndFinishTask:(id)a3;
- (BOOL)updateToLibraryFilterStateAndFinishTask:(id)a3;
- (PXContentFilterState)currentContentFilterState;
- (id)menuElement;
- (void)finishedUserInteractionTask;
@end

@implementation PXCuratedLibraryToggleFilterActionPerformer

- (PXContentFilterState)currentContentFilterState
{
  v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v4 allPhotosContentFilterState];

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      v15 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v12 handleFailureInMethod:a2, self, @"PXCuratedLibraryToggleFilterActionPerformer.m", 30, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.viewModel.allPhotosContentFilterState", v14, v15 object file lineNumber description];
    }
  }
  v6 = (void *)[v5 copy];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    v9 = [(PXCuratedLibraryActionPerformer *)self viewModel];
    v10 = [v9 photoLibrary];
    id v8 = +[PXContentFilterState defaultAllPhotosFilterStateForPhotoLibrary:v10];
  }
  return (PXContentFilterState *)v8;
}

- (id)menuElement
{
  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryToggleFilterActionPerformer;
  v4 = [(PXActionPerformer *)&v11 menuElement];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, self, @"PXCuratedLibraryToggleFilterActionPerformer.m", 37, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[super menuElement]", v9, v10 object file lineNumber description];
    }
  }
  v5 = [(PXCuratedLibraryActionPerformer *)self localizedTitleForUseCase:0];
  [v4 setTitle:v5];

  return v4;
}

- (BOOL)updateToContentFilterStateAndFinishTask:(id)a3
{
  id v4 = a3;
  v5 = [(PXActionPerformer *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  if (v6) {
    [v5 curatedLibraryActionPerformer:self contentFilterStateChanged:v4];
  }
  [(PXCuratedLibraryToggleFilterActionPerformer *)self finishedUserInteractionTask];

  return v6 & 1;
}

- (BOOL)updateToLibraryFilterStateAndFinishTask:(id)a3
{
  id v4 = a3;
  v5 = [(PXActionPerformer *)self delegate];
  char v6 = objc_opt_respondsToSelector();
  if (v6) {
    [v5 curatedLibraryActionPerformer:self libraryFilterStateChanged:v4];
  }
  [(PXCuratedLibraryToggleFilterActionPerformer *)self finishedUserInteractionTask];

  return v6 & 1;
}

- (void)finishedUserInteractionTask
{
}

@end