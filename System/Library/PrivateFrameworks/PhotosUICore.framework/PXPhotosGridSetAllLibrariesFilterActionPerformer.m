@interface PXPhotosGridSetAllLibrariesFilterActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridSetAllLibrariesFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return !+[PXPhotosGridToggleFilterActionPerformer isLibaryFilterHidden:0 viewModel:a4];
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v4 = [v3 libraryFilterState];

  [v4 setViewMode:0];
  [(PXPhotosGridToggleFilterActionPerformer *)self updateToLibraryFilterStateAndFinishTask:v4];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_All");
}

- (int64_t)menuElementState
{
  v2 = [(PXPhotosGridActionPerformer *)self viewModel];
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

@end