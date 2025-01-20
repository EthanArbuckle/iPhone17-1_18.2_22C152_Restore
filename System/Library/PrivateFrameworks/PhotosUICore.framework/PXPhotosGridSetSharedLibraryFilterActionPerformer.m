@interface PXPhotosGridSetSharedLibraryFilterActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (id)activitySystemImageName;
- (id)activityType;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (int64_t)menuElementState;
- (void)performUserInteractionTask;
@end

@implementation PXPhotosGridSetSharedLibraryFilterActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  return !+[PXPhotosGridToggleFilterActionPerformer isLibaryFilterHidden:2 viewModel:a4];
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v4 = [v3 libraryFilterState];

  [v4 setViewMode:2];
  [(PXPhotosGridToggleFilterActionPerformer *)self updateToLibraryFilterStateAndFinishTask:v4];
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  v3 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v4 = [v3 dataSourceManager];
  v5 = [v4 dataSource];
  v6 = [v5 containerCollection];

  v7 = [v6 photoLibrary];
  v8 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v7];

  [v8 hasPreview];
  v9 = PXLocalizedSharedLibraryString(@"PXSharedLibrary_FilterMenu_Shared");

  return v9;
}

- (int64_t)menuElementState
{
  v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  v3 = [v2 libraryFilterState];
  int64_t v4 = [v3 isLibraryFilterActive:2];

  return v4;
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

@end