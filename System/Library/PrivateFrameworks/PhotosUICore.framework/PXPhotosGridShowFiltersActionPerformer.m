@interface PXPhotosGridShowFiltersActionPerformer
+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4;
- (BOOL)performerResetsAfterCompletion;
- (PXUIFilterController)filterController;
- (id)activitySystemImageName;
- (id)activityType;
- (id)contentFilterHiddenTypesForFilterController:(id)a3;
- (id)localizedTitleForUseCase:(unint64_t)a3;
- (void)filterController:(id)a3 contentFilterStateChanged:(id)a4;
- (void)filterControllerDidClose:(id)a3;
- (void)performUserInteractionTask;
- (void)setFilterController:(id)a3;
@end

@implementation PXPhotosGridShowFiltersActionPerformer

+ (BOOL)canPerformActionType:(id)a3 withViewModel:(id)a4
{
  id v4 = a4;
  if ([v4 canFilterContent])
  {
    v5 = [v4 dataSourceManager];
    v6 = [v5 dataSource];
    v7 = [v6 containerCollection];
    char v8 = [v7 canContainAssets];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (void)setFilterController:(id)a3
{
}

- (BOOL)performerResetsAfterCompletion
{
  return 1;
}

- (void)filterControllerDidClose:(id)a3
{
}

- (void)filterController:(id)a3 contentFilterStateChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(PXActionPerformer *)self delegate];
  [v6 photosGridActionPerformer:self contentFilterStateChanged:v5];
}

- (id)contentFilterHiddenTypesForFilterController:(id)a3
{
  id v4 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v5 = [v4 dataSourceManager];
  id v6 = [v5 dataSource];
  v7 = [v6 containerCollection];

  char v8 = [(PXPhotosGridActionPerformer *)self viewModel];
  v9 = [v8 libraryFilterState];
  v10 = PXContentFilterHiddenTypesForAssetCollection(v7);

  return v10;
}

- (void)performUserInteractionTask
{
  v3 = [(PXPhotosGridShowFiltersActionPerformer *)self filterController];
  id v4 = [(PXPhotosGridActionPerformer *)self viewModel];
  id v5 = [v4 contentFilterState];
  id v6 = (void *)[v5 copy];
  [v3 setContentFilterState:v6];

  v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
  [v7 setModalPresentationStyle:7];
  char v8 = [v7 popoverPresentationController];
  [v8 setDelegate:v3];

  if (![(PXActionPerformer *)self presentViewController:v7]) {
    PXAssertGetLog();
  }
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  return PXLocalizedStringFromTable(@"PXPhotosGridsShowFilters", @"PhotosUICore");
}

- (id)activitySystemImageName
{
  v2 = [(PXPhotosGridActionPerformer *)self viewModel];
  v3 = [v2 contentFilterState];
  if ([v3 isFiltering]) {
    id v4 = @"line.horizontal.3.decrease.circle.fill";
  }
  else {
    id v4 = @"line.horizontal.3.decrease.circle";
  }
  id v5 = v4;

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
    id v4 = [(PXPhotosGridActionPerformer *)self viewModel];
    id v5 = [v4 sharedLibraryStatusProvider];
    id v6 = [v4 contentFilterState];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v9 = [v5 photoLibrary];
      id v8 = +[PXContentFilterState defaultFilterStateForPhotoLibrary:v9];
    }
    v10 = [v4 dataSourceManager];
    v11 = [v10 dataSource];
    v12 = [v11 containerCollection];

    uint64_t v13 = PXFilterControllerOptionsForCollection(v12);
    if ([v4 hidesAssetCountInFooter]) {
      v13 |= 8uLL;
    }
    v14 = [PXUIFilterController alloc];
    v15 = [v4 libraryFilterState];
    v16 = [(PXUIFilterController *)v14 initWithDelegate:self libraryFilterState:v15 initialContentFilterState:v8 sharedLibraryStatusProvider:v5 filterControllerOptions:v13];
    v17 = self->_filterController;
    self->_filterController = v16;

    v18 = [v4 dataSourceManager];
    [(PXUIFilterController *)self->_filterController setDataSourceManager:v18];

    filterController = self->_filterController;
  }
  return filterController;
}

@end