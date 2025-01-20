@interface PXCuratedLibraryShowFiltersActionPerformer
- (BOOL)_isAlreadyDone;
- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4;
- (BOOL)performerResetsAfterCompletion;
- (PXUIFilterController)filterController;
- (id)activitySystemImageName;
- (id)activityType;
- (id)contentFilterHiddenTypesForFilterController:(id)a3;
- (void)filterController:(id)a3 contentFilterStateChanged:(id)a4;
- (void)filterControllerDidClose:(id)a3;
- (void)performUserInteractionTask;
- (void)setFilterController:(id)a3;
@end

@implementation PXCuratedLibraryShowFiltersActionPerformer

- (void).cxx_destruct
{
}

- (void)setFilterController:(id)a3
{
}

- (void)filterControllerDidClose:(id)a3
{
  if (![(PXCuratedLibraryShowFiltersActionPerformer *)self _isAlreadyDone])
  {
    [(PXActionPerformer *)self completeUserInteractionTaskWithSuccess:1 error:0];
  }
}

- (BOOL)_isAlreadyDone
{
  return [(PXActionPerformer *)self state] == 0;
}

- (void)filterController:(id)a3 contentFilterStateChanged:(id)a4
{
  id v6 = a4;
  v5 = [(PXActionPerformer *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 curatedLibraryActionPerformer:self contentFilterStateChanged:v6];
  }
}

- (id)contentFilterHiddenTypesForFilterController:(id)a3
{
  v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v4 currentDataSource];
  id v6 = [v5 containerCollection];

  v7 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v8 = [v7 libraryFilterState];
  v9 = PXContentFilterHiddenTypesForAssetCollection(v6);

  return v9;
}

- (void)performUserInteractionTask
{
  v3 = [(PXCuratedLibraryShowFiltersActionPerformer *)self filterController];
  v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v5 = [v4 currentContentFilterState];
  id v6 = (void *)[v5 copy];
  [v3 setContentFilterState:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
  [v7 setModalPresentationStyle:7];
  v8 = [v7 popoverPresentationController];
  [v8 setDelegate:v3];

  if (![(PXActionPerformer *)self presentViewController:v7]) {
    PXAssertGetLog();
  }
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  objc_msgSend(a4, "activityType", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(PXCuratedLibraryShowFiltersActionPerformer *)self activityType];
  if (v6 == v7)
  {

    goto LABEL_5;
  }
  v8 = v7;
  char v9 = [v6 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PXCuratedLibraryShowFiltersActionPerformer.m", 62, @"Invalid parameter not satisfying: %@", @"PXStringEqualToString(activity.activityType, self.activityType)" object file lineNumber description];
LABEL_5:
  }
  return 1;
}

- (id)activitySystemImageName
{
  v2 = [(PXCuratedLibraryActionPerformer *)self viewModel];
  v3 = [v2 currentContentFilterState];
  if ([v3 isFiltering]) {
    v4 = @"line.horizontal.3.decrease.circle.fill";
  }
  else {
    v4 = @"line.horizontal.3.decrease.circle";
  }
  v5 = v4;

  return v5;
}

- (id)activityType
{
  v2 = @"PXActivityTypeShowFilters";
  return @"PXActivityTypeShowFilters";
}

- (PXUIFilterController)filterController
{
  filterController = self->_filterController;
  if (!filterController)
  {
    v4 = [(PXCuratedLibraryActionPerformer *)self viewModel];
    v5 = [v4 sharedLibraryStatusProvider];
    id v6 = [v4 allPhotosContentFilterState];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      char v9 = [v4 photoLibrary];
      id v8 = +[PXContentFilterState defaultAllPhotosFilterStateForPhotoLibrary:v9];
    }
    v10 = [PXUIFilterController alloc];
    v11 = [v4 libraryFilterState];
    v12 = [(PXUIFilterController *)v10 initWithDelegate:self libraryFilterState:v11 initialContentFilterState:v8 sharedLibraryStatusProvider:v5 filterControllerOptions:0];
    v13 = self->_filterController;
    self->_filterController = v12;

    v14 = [v4 assetsDataSourceManager];
    [(PXUIFilterController *)self->_filterController setDataSourceManager:v14];

    filterController = self->_filterController;
  }
  return filterController;
}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

@end