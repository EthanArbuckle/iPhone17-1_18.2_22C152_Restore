@interface PXCuratedLibrarySetSharedLibraryFilterActionPerformer
- (PXCuratedLibrarySetSharedLibraryFilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (id)menuElement;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibrarySetSharedLibraryFilterActionPerformer

- (void)performUserInteractionTask
{
  v3 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v4 = [v3 libraryFilterState];
  [v4 setViewMode:2];

  id v6 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v6 libraryFilterState];
  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToLibraryFilterStateAndFinishTask:v5];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_Shared");
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v3 = [v2 libraryFilterState];
  int64_t v4 = [v3 isLibraryFilterActive:2];

  return v4;
}

- (id)menuElement
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibrarySetSharedLibraryFilterActionPerformer;
  v3 = [(PXCuratedLibraryToggleFilterActionPerformer *)&v8 menuElement];
  int64_t v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v4 sharedLibraryStatusProvider];
  int v6 = [v5 hasPreview];

  if (v6) {
    PXSharedLibraryUpdateActionTitleForPreview(v3);
  }
  return v3;
}

- (id)activitySystemImageName
{
  v2 = @"person.2";
  return @"person.2";
}

- (id)activityType
{
  v2 = @"PXActivityTypeSetSharedLibraryFilter";
  return @"PXActivityTypeSetSharedLibraryFilter";
}

- (PXCuratedLibrarySetSharedLibraryFilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibrarySetSharedLibraryFilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionSetSharedLibraryFilter" viewModel:a3];
}

@end