@interface PXUIFilterController
+ (BOOL)_isContentFilterItemTagHandledBySwitch:(int64_t)a3;
- (BOOL)hidesFooter;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXContentFilterState)contentFilterState;
- (PXFilterControllerDelegate)filterControllerDelegate;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (PXUIFilterController)initWithDelegate:(id)a3 libraryFilterState:(id)a4 initialContentFilterState:(id)a5 sharedLibraryStatusProvider:(id)a6 filterControllerOptions:(unint64_t)a7;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (id)_contentFilterGroups;
- (id)_localizedCounts;
- (id)_localizedGuestCounts;
- (id)_sectionHeaderTitleTextAttributes;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_contentFilterGroupsCount;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneButtonPressed:(id)a3;
- (void)_filterControllerDidClose;
- (void)_setVisibilityForSender:(id)a3;
- (void)_setupNavigationBar;
- (void)_setupTableView;
- (void)_tappedRowAtIndexPath:(id)a3;
- (void)_updateContentFilterStateWithFilterItemTag:(int64_t)a3 shouldEnable:(BOOL)a4;
- (void)_updateFooterLayout;
- (void)_updateFooterStatus;
- (void)_updateTableView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)setContentFilterState:(id)a3;
- (void)setDataSourceManager:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation PXUIFilterController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_destroyWeak((id *)&self->_filterControllerDelegate);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_contentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_contentFilterGroups, 0);
}

- (BOOL)hidesFooter
{
  return self->_hidesFooter;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXFilterControllerDelegate)filterControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterControllerDelegate);
  return (PXFilterControllerDelegate *)WeakRetained;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXContentFilterState)contentFilterState
{
  return self->_contentFilterState;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v8 = a4;
  v5 = NSStringFromSelector(sel_showLivePhotoFilter);
  if ([v8 isEqualToString:v5])
  {
  }
  else
  {
    v6 = NSStringFromSelector(sel_showPortraitFilter);
    int v7 = [v8 isEqualToString:v6];

    if (!v7) {
      goto LABEL_5;
    }
  }
  [(PXUIFilterController *)self _updateTableView];
LABEL_5:
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXContentSyndicationConfigurationObservationContext_208133 == a5)
  {
    if ((v6 & 5) == 0) {
      goto LABEL_16;
    }
    id v10 = v8;
    v9 = [(PXUIFilterController *)self contentFilterState];

    if (v9)
    {
      [(PXUIFilterController *)self setContentFilterState:0];
LABEL_15:
      id v8 = v10;
      goto LABEL_16;
    }
LABEL_14:
    [(PXUIFilterController *)self _updateTableView];
    goto LABEL_15;
  }
  if ((void *)PXCountsControllerObserverContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_16;
    }
    id v10 = v8;
    [(PXUIFilterController *)self _updateFooterStatus];
    goto LABEL_15;
  }
  if ((void *)PXSharedLibraryStatusProviderObservationContext_208134 == a5)
  {
    if ((v6 & 3) == 0) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if ((v6 & 1) != 0 && (void *)PXLibraryFilterStateObservationContext_208135 == a5)
  {
LABEL_13:
    id v10 = v8;
    goto LABEL_14;
  }
LABEL_16:
}

- (void)setContentFilterState:(id)a3
{
  v15 = (PXContentFilterState *)a3;
  v4 = self->_contentFilterState;
  v5 = v15;
  if (v4 != v15)
  {
    char v6 = v4;
    BOOL v7 = [(PXContentFilterState *)v4 isEqual:v15];

    id v8 = v15;
    if (v7) {
      goto LABEL_8;
    }
    v9 = (void *)[(PXContentFilterState *)v15 copy];
    id v10 = v9;
    if (v9)
    {
      v11 = v9;
      contentFilterState = self->_contentFilterState;
      self->_contentFilterState = v11;
    }
    else
    {
      contentFilterState = [(PXContentFilterState *)self->_contentFilterState photoLibrary];
      v13 = +[PXContentFilterState defaultFilterStateForPhotoLibrary:contentFilterState];
      v14 = self->_contentFilterState;
      self->_contentFilterState = v13;
    }
    [(PXUIFilterController *)self _updateTableView];
    v5 = [(PXUIFilterController *)self filterControllerDelegate];
    [v5 filterController:self contentFilterStateChanged:self->_contentFilterState];
  }

  id v8 = v15;
LABEL_8:
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  BOOL v7 = [a3 presentedViewController];
  uint64_t v8 = [v7 modalPresentationStyle];

  if (a4 == -1 && v8 == 7)
  {
    uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  id v11 = (id)v9;
  id v10 = [(PXUIFilterController *)self tableView];
  [v10 setBackgroundColor:v11];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  char v6 = [(PXUIFilterController *)self _contentFilterGroups];
  BOOL v7 = [v6 objectAtIndexedSubscript:a4];
  uint64_t v8 = [v7 name];

  uint64_t v9 = [MEMORY[0x1E4FB1948] headerConfiguration];
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v11 = [(PXUIFilterController *)self _sectionHeaderTitleTextAttributes];
  v12 = (void *)[v10 initWithString:v8 attributes:v11];
  [v9 setAttributedText:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4FB1D30]);
  [v13 setContentConfiguration:v9];
  [v13 setAutomaticallyUpdatesContentConfiguration:1];

  return v13;
}

- (id)_sectionHeaderTitleTextAttributes
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = *MEMORY[0x1E4FB06F8];
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:withSymbolicTraits:options:", *MEMORY[0x1E4FB28C8], 2, 1);
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E4FB0700];
  v3 = [MEMORY[0x1E4FB1618] labelColor];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40 = v6;
  uint64_t v8 = [v6 dequeueReusableCellWithIdentifier:@"PXFilterControllerCellIdentifier"];
  if (!v8)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PXFilterControllerCellIdentifier"];
    objc_msgSend(v8, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [v8 setSelectionStyle:0];
    [v8 setInsetsLayoutMarginsFromSafeArea:0];
    uint64_t v9 = [v8 textLabel];
    [v9 setAdjustsFontSizeToFitWidth:1];
    [v9 setNumberOfLines:2];
    [v9 setLineBreakMode:0];
    [v9 setMinimumScaleFactor:0.600000024];
    id v10 = [v8 detailTextLabel];
    [v10 setAdjustsFontSizeToFitWidth:1];
    [v10 setMinimumScaleFactor:0.400000006];
  }
  id v11 = [v8 textLabel];
  [v11 setText:0];

  v12 = [v8 detailTextLabel];
  [v12 setText:0];

  id v13 = [v8 imageView];
  [v13 setImage:0];

  [v8 setAccessoryType:0];
  [v8 setAccessoryView:0];
  uint64_t v14 = [v7 section];
  v15 = [(PXUIFilterController *)self _contentFilterGroups];
  v16 = [v15 objectAtIndexedSubscript:v14];
  v17 = [v16 filterIdentifiers];
  id v39 = v7;
  v18 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
  uint64_t v19 = (int)[v18 intValue];

  v20 = [(PXUIFilterController *)self contentFilterState];
  int v21 = [v20 isContentFilterActive:v19];

  v22 = PXContentFilterImageForItemTag(v19);
  v23 = [v8 imageView];
  [v23 setImage:v22];

  v24 = PXContentFilterTitleForItemTag(v19);
  v25 = [v8 textLabel];
  [v25 setText:v24];

  v26 = [(PXUIFilterController *)self libraryFilterState];
  uint64_t v27 = [v26 viewMode];

  v28 = [(PXUIFilterController *)self sharedLibraryStatusProvider];
  v29 = PXContentFilterSubtitleForItemTag(v19, v28, v27);
  v30 = [v8 detailTextLabel];
  [v30 setText:v29];

  v31 = [MEMORY[0x1E4FB1618] grayColor];
  v32 = [v8 detailTextLabel];
  [v32 setTextColor:v31];

  [v8 setTag:v19];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PXUIFilterController_tableView_cellForRowAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E5DC52D8;
  aBlock[4] = self;
  char v43 = v21;
  id v33 = v8;
  id v42 = v33;
  v34 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  if (+[PXUIFilterController _isContentFilterItemTagHandledBySwitch:v19])
  {
    v34[2](v34, v19);
    v36 = v39;
    v35 = v40;
  }
  else
  {
    v36 = v39;
    v35 = v40;
    if (v21)
    {
      [v33 setAccessoryType:3];
      [v40 selectRowAtIndexPath:v39 animated:0 scrollPosition:0];
    }
  }
  id v37 = v33;

  return v37;
}

void __56__PXUIFilterController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  [v4 addTarget:*(void *)(a1 + 32) action:sel__setVisibilityForSender_ forControlEvents:4096];
  [v4 setTag:a2];
  [v4 setOn:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 40) setAccessoryView:v4];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(PXUIFilterController *)self _contentFilterGroups];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 filterIdentifiers];
  int64_t v8 = [v7 count];

  return v8;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXUIFilterController;
  [(PXUIFilterController *)&v3 viewDidLayoutSubviews];
  [(PXUIFilterController *)self _updateFooterLayout];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PXUIFilterController;
  [(PXUIFilterController *)&v4 viewDidLoad];
  [(PXUIFilterController *)self _setupNavigationBar];
  [(PXUIFilterController *)self _setupTableView];
  objc_super v3 = +[PXContentSyndicationConfigurationProvider sharedInstance];
  [v3 registerChangeObserver:self context:PXContentSyndicationConfigurationObservationContext_208133];
}

- (void)setDataSourceManager:(id)a3
{
  id v7 = (PXAssetsDataSourceManager *)a3;
  if (self->_dataSourceManager != v7)
  {
    objc_storeStrong((id *)&self->_dataSourceManager, a3);
    [(PXAssetsDataSourceCountsController *)self->_countsController unregisterChangeObserver:self context:PXCountsControllerObserverContext];
    v5 = (PXAssetsDataSourceCountsController *)[objc_alloc((Class)off_1E5DA5640) initWithAssetsDataSourceManager:v7];
    countsController = self->_countsController;
    self->_countsController = v5;

    [(PXAssetsDataSourceCountsController *)self->_countsController registerChangeObserver:self context:PXCountsControllerObserverContext];
    [(PXAssetsDataSourceCountsController *)self->_countsController prepareCountsIfNeeded];
    [(PXUIFilterController *)self _updateFooterStatus];
  }
}

- (PXUIFilterController)initWithDelegate:(id)a3 libraryFilterState:(id)a4 initialContentFilterState:(id)a5 sharedLibraryStatusProvider:(id)a6 filterControllerOptions:(unint64_t)a7
{
  char v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PXUIFilterController.m", 316, @"Invalid parameter not satisfying: %@", @"contentFilterState" object file lineNumber description];

    if (v16) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  int v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PXUIFilterController.m", 315, @"Invalid parameter not satisfying: %@", @"libraryFilterState" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_3:
  if (v16) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PXUIFilterController.m", 317, @"Invalid parameter not satisfying: %@", @"sharedLibraryStatusProvider" object file lineNumber description];

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)PXUIFilterController;
  v17 = [(PXUIFilterController *)&v24 initWithStyle:2];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sharedLibraryStatusProvider, a6);
    objc_storeStrong((id *)&v18->_libraryFilterState, a4);
    objc_storeStrong((id *)&v18->_contentFilterState, a5);
    objc_storeWeak((id *)&v18->_filterControllerDelegate, v13);
    v18->_hidesFooter = (v7 & 8) != 0;
    [(PXSharedLibraryStatusProvider *)v18->_sharedLibraryStatusProvider registerChangeObserver:v18 context:PXSharedLibraryStatusProviderObservationContext_208134];
    [(PXLibraryFilterState *)v18->_libraryFilterState registerChangeObserver:v18 context:PXLibraryFilterStateObservationContext_208135];
    uint64_t v19 = +[PXPhotosGridSettings sharedInstance];
    [v19 addKeyObserver:v18];
  }
  return v18;
}

- (void)_doneButtonPressed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PXUIFilterController__doneButtonPressed___block_invoke;
  v5[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  [(PXUIFilterController *)self dismissViewControllerAnimated:1 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __43__PXUIFilterController__doneButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _filterControllerDidClose];
}

- (void)_filterControllerDidClose
{
  id v3 = [(PXUIFilterController *)self filterControllerDelegate];
  if (objc_opt_respondsToSelector()) {
    [v3 filterControllerDidClose:self];
  }
}

- (void)_updateContentFilterStateWithFilterItemTag:(int64_t)a3 shouldEnable:(BOOL)a4
{
  BOOL v4 = a4;
  char v7 = [(PXUIFilterController *)self contentFilterState];
  PXContentFilterGetUpdatedState(v7, a3, v4, 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [(PXUIFilterController *)self setContentFilterState:v13];
  if (a3 == 3)
  {
    if (v13) {
      uint64_t v8 = [v13 includeSharedWithYou];
    }
    else {
      uint64_t v8 = 1;
    }
    uint64_t v9 = [NSNumber numberWithBool:v8];
    id v10 = +[PXUserDefaults standardUserDefaults];
    [v10 setIncludeSharedWithYou:v9];
  }
  if (v4)
  {
    id v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    PXContentFilterSendAnalyticsForItemSelected(a3, v12);
  }
}

- (void)_tappedRowAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(PXUIFilterController *)self tableView];
  id v8 = [v5 cellForRowAtIndexPath:v4];

  uint64_t v6 = [v8 isSelected];
  uint64_t v7 = [v8 tag];
  if (!+[PXUIFilterController _isContentFilterItemTagHandledBySwitch:v7])[(PXUIFilterController *)self _updateContentFilterStateWithFilterItemTag:v7 shouldEnable:v6]; {
}
  }

- (int64_t)_contentFilterGroupsCount
{
  v2 = [(PXUIFilterController *)self _contentFilterGroups];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)_contentFilterGroups
{
  contentFilterGroups = self->_contentFilterGroups;
  if (!contentFilterGroups)
  {
    unint64_t v4 = 0x1E4F1C000uLL;
    v5 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    uint64_t v6 = [(PXUIFilterController *)self filterControllerDelegate];
    uint64_t v7 = [v6 contentFilterHiddenTypesForFilterController:self];

    if (([v7 containsObject:&unk_1F02D9268] & 1) == 0)
    {
      id v8 = +[PXFilterGroup groupWithName:&stru_1F00B0030 filterIdentifiers:&unk_1F02D4E58];
      [(NSArray *)v5 addObject:v8];
    }
    uint64_t v9 = +[PXContentSyndicationConfigurationProvider sharedInstance];
    if ([v9 showUnsavedSyndicatedContentInPhotosGrids])
    {
      id v10 = +[PXContentSyndicationConfigurationProvider sharedInstance];
      if ([v10 contentSyndicationIsAvailable])
      {
        id v11 = +[PXUserDefaults standardUserDefaults];
        v12 = [v11 includeSharedWithYou];
        int v13 = [v12 BOOLValue];

        unint64_t v4 = 0x1E4F1C000;
      }
      else
      {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }

    id v14 = (void *)[objc_alloc(*(Class *)(v4 + 2632)) initWithCapacity:4];
    if (v13)
    {
      if (([v7 containsObject:&unk_1F02D9280] & 1) == 0) {
        [v14 addObject:&unk_1F02D9280];
      }
      if (([v7 containsObject:&unk_1F02D9298] & 1) == 0) {
        [v14 addObject:&unk_1F02D9298];
      }
    }
    if (([v7 containsObject:&unk_1F02D92B0] & 1) == 0) {
      [v14 addObject:&unk_1F02D92B0];
    }
    if (([v7 containsObject:&unk_1F02D92C8] & 1) == 0) {
      [v14 addObject:&unk_1F02D92C8];
    }
    if (([v7 containsObject:&unk_1F02D92E0] & 1) == 0) {
      [v14 addObject:&unk_1F02D92E0];
    }
    if (([v7 containsObject:&unk_1F02D92F8] & 1) == 0) {
      [v14 addObject:&unk_1F02D92F8];
    }
    if (([v7 containsObject:&unk_1F02D9310] & 1) == 0) {
      [v14 addObject:&unk_1F02D9310];
    }
    if (([v7 containsObject:&unk_1F02D9328] & 1) == 0) {
      [v14 addObject:&unk_1F02D9328];
    }
    id v15 = [(PXUIFilterController *)self contentFilterState];
    char v16 = [v15 shouldExcludeScreenshots];

    if ((v16 & 1) == 0 && ([v7 containsObject:&unk_1F02D9340] & 1) == 0) {
      [v14 addObject:&unk_1F02D9340];
    }
    if (v13 && ([v7 containsObject:&unk_1F02D9358] & 1) == 0) {
      [v14 addObject:&unk_1F02D9358];
    }
    if ([v14 count])
    {
      v17 = PXLocalizedStringFromTable(@"PXContentFilterGroupTitleOnlyShow", @"PhotosUICore");
      v18 = +[PXFilterGroup groupWithName:v17 filterIdentifiers:v14];

      [(NSArray *)v5 addObject:v18];
    }
    uint64_t v19 = (void *)[objc_alloc(*(Class *)(v4 + 2632)) initWithCapacity:2];
    if (v13 && ([v7 containsObject:&unk_1F02D9370] & 1) == 0) {
      [v19 addObject:&unk_1F02D9370];
    }
    if ([v19 count])
    {
      v20 = PXLocalizedStringFromTable(@"PXContentFilterGroupTitleInclude", @"PhotosUICore");
      int v21 = +[PXFilterGroup groupWithName:v20 filterIdentifiers:v19];

      [(NSArray *)v5 addObject:v21];
    }
    v22 = self->_contentFilterGroups;
    self->_contentFilterGroups = v5;

    contentFilterGroups = self->_contentFilterGroups;
  }
  return contentFilterGroups;
}

- (void)_setVisibilityForSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 tag];
  uint64_t v6 = [v4 isOn];

  [(PXUIFilterController *)self _updateContentFilterStateWithFilterItemTag:v5 shouldEnable:v6];
}

- (void)_updateFooterStatus
{
  int64_t v3 = [(PXUIFilterController *)self tableView];
  id v4 = [v3 tableFooterView];

  uint64_t v5 = [(PXUIFilterController *)self _localizedCounts];
  uint64_t v6 = [(PXUIFilterController *)self _localizedGuestCounts];
  uint64_t v7 = @"shared.with.you";
  if (!v6) {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [(PXUIFilterController *)self contentFilterState];
  if ([v9 isFiltering]) {
    id v10 = @"PXContentFilterFooterSubtitle_FilterResults";
  }
  else {
    id v10 = @"PXContentFilterFooterSubtitle_NoFilters";
  }
  id v11 = PXLocalizedStringFromTable(v10, @"PhotosUICore");

  v12 = [v4 viewModel];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __43__PXUIFilterController__updateFooterStatus__block_invoke;
  v20 = &unk_1E5DC52B0;
  id v21 = v5;
  id v22 = v6;
  v23 = v8;
  id v24 = v11;
  id v13 = v11;
  id v14 = v8;
  id v15 = v6;
  id v16 = v5;
  [v12 performChanges:&v17];

  [(PXUIFilterController *)self _updateFooterLayout];
}

void __43__PXUIFilterController__updateFooterStatus__block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  id v4 = a2;
  [v4 setTitle:v3];
  [v4 setExtendedTitle:a1[5]];
  [v4 setExtendedSystemImageName:a1[6]];
  [v4 setSubtitle1:a1[7]];
}

- (void)_updateFooterLayout
{
  id v45 = [(PXUIFilterController *)self tableView];
  uint64_t v3 = [v45 tableFooterView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  double v13 = v12;
  if (v12 != v11)
  {
    objc_msgSend(v3, "setFrame:", v5, v7, v9, v12);
    [v45 setTableFooterView:v3];
  }
  id v14 = [(PXUIFilterController *)self traitCollection];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (v15 != 1)
  {
    objc_msgSend(v45, "rectForSection:", objc_msgSend(v45, "numberOfSections") - 1);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    [v45 contentOffset];
    double v25 = v24;
    [v45 frame];
    double v26 = v25 + CGRectGetHeight(v47);
    v48.origin.x = v17;
    v48.origin.y = v19;
    v48.size.width = v21;
    v48.size.height = v23;
    double v27 = v26 - CGRectGetMaxY(v48);
    if (v27 >= v13) {
      double v27 = v13;
    }
    double v28 = v13 + v25 - v27;
    [v3 frame];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    v35 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v36 = [v35 orientation];

    if (v36 == 1) {
      double v37 = 50.0;
    }
    else {
      double v37 = 0.0;
    }
    [v45 bounds];
    objc_msgSend(v3, "setFrame:", v30, v28 + v38 - v34 - v37, v32, v34);
  }
  id v39 = [(PXUIFilterController *)self tableView];
  [v39 contentSize];
  double v41 = v40;
  double v43 = v42;
  v44 = [(PXUIFilterController *)self parentViewController];
  objc_msgSend(v44, "setPreferredContentSize:", v41, v43);

  objc_msgSend(v3, "setHidden:", -[PXUIFilterController hidesFooter](self, "hidesFooter"));
}

- (id)_localizedGuestCounts
{
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  countsController = self->_countsController;
  if (countsController) {
    [(PXAssetsDataSourceCountsController *)countsController guestCounts];
  }
  double v4 = +[PXLemonadeSettings sharedInstance];
  if ([v4 sharedWithYouOnlyFilterIncludesUnsaved])
  {
    int v5 = 0;
  }
  else
  {
    double v6 = [(PXUIFilterController *)self contentFilterState];
    int v5 = [v6 showOnlySharedWithYou];
  }
  double v7 = 0;
  if ((void)v12 != 0x7FFFFFFFFFFFFFFFLL
    && *((void *)&v12 + 1) != 0x7FFFFFFFFFFFFFFFLL
    && v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*((void *)&v12 + 1) + (void)v12 + v13) {
      int v8 = 1;
    }
    else {
      int v8 = v5;
    }
    if (v8 == 1)
    {
      long long v10 = v12;
      uint64_t v11 = v13;
      double v7 = PXLocalizedDetailedCountsDescription(&v10);
    }
    else
    {
      double v7 = 0;
    }
  }
  return v7;
}

- (id)_localizedCounts
{
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  countsController = self->_countsController;
  if (countsController) {
    [(PXAssetsDataSourceCountsController *)countsController counts];
  }
  double v4 = +[PXLemonadeSettings sharedInstance];
  if ([v4 sharedWithYouOnlyFilterIncludesUnsaved])
  {
  }
  else
  {
    int v5 = [(PXUIFilterController *)self contentFilterState];
    char v6 = [v5 showOnlySharedWithYou];

    if (v6)
    {
      double v7 = 0;
      goto LABEL_11;
    }
  }
  double v7 = 0;
  if ((void)v11 != 0x7FFFFFFFFFFFFFFFLL
    && *((void *)&v11 + 1) != 0x7FFFFFFFFFFFFFFFLL
    && v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v9 = v11;
    uint64_t v10 = v12;
    double v7 = PXLocalizedDetailedCountsDescription(&v9);
  }
LABEL_11:
  return v7;
}

- (void)_updateTableView
{
  contentFilterGroups = self->_contentFilterGroups;
  self->_contentFilterGroups = 0;

  double v4 = [(PXUIFilterController *)self tableView];
  [v4 reloadData];

  [(PXUIFilterController *)self _updateFooterStatus];
}

- (void)_setupTableView
{
  uint64_t v3 = [PXPhotosGlobalFooterView alloc];
  char v6 = -[PXPhotosGlobalFooterView initWithFrame:needsWorkaroundFor53118165:](v3, "initWithFrame:needsWorkaroundFor53118165:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v4 = objc_alloc_init(PXFooterViewModel);
  [(PXPhotosGlobalFooterView *)v6 setViewModel:v4];

  int v5 = [(PXUIFilterController *)self tableView];
  [v5 setAllowsMultipleSelection:1];
  [v5 setTableFooterView:v6];
}

- (void)_setupNavigationBar
{
  uint64_t v3 = PXLocalizedStringFromTable(@"PXFilterPopoverTitle", @"PhotosUICore");
  [(PXUIFilterController *)self setTitle:v3];

  id v5 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__doneButtonPressed_];
  double v4 = [(PXUIFilterController *)self navigationItem];
  [v4 setRightBarButtonItem:v5];
}

+ (BOOL)_isContentFilterItemTagHandledBySwitch:(int64_t)a3
{
  return a3 == 3;
}

@end