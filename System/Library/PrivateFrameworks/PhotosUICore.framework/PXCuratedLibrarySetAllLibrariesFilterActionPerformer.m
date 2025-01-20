@interface PXCuratedLibrarySetAllLibrariesFilterActionPerformer
- (PXCuratedLibrarySetAllLibrariesFilterActionPerformer)initWithViewModel:(id)a3;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXCuratedLibrarySetAllLibrariesFilterActionPerformer

- (void)performUserInteractionTask
{
  v3 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v4 = [v3 libraryFilterState];
  [v4 setViewMode:0];

  id v6 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v6 libraryFilterState];
  [(PXCuratedLibraryToggleFilterActionPerformer *)self updateToLibraryFilterStateAndFinishTask:v5];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_All");
}

- (int64_t)menuElementState
{
  v2 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v3 = [v2 libraryFilterState];
  int64_t v4 = [v3 isLibraryFilterActive:0];

  return v4;
}

- (id)activitySystemImageName
{
  v2 = @"photo.on.rectangle";
  return @"photo.on.rectangle";
}

- (id)activityType
{
  v2 = @"PXActivityTypeSetAllLibrariesFilter";
  return @"PXActivityTypeSetAllLibrariesFilter";
}

- (PXCuratedLibrarySetAllLibrariesFilterActionPerformer)initWithViewModel:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibrarySetAllLibrariesFilterActionPerformer;
  return [(PXCuratedLibraryActionPerformer *)&v4 initWithActionType:@"PXCuratedLibraryActionSetAllLibrariesFilter" viewModel:a3];
}

@end