@interface PXCMMBannerTileController
+ (id)new;
- (PXCMMBannerTileController)init;
- (PXCMMBannerTileController)initWithActivityType:(unint64_t)a3 sourceType:(unint64_t)a4 viewModel:(id)a5 momentShareStatusPresentation:(id)a6 importStatusManager:(id)a7;
- (PXCMMBannerTileControllerDelegate)delegate;
- (PXCMMPosterBannerView)bannerView;
- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager;
- (UIView)view;
- (void)_configureBannerViewActionButtonWithTitle:(id)a3;
- (void)_handleButtonActionWithTitle:(id)a3;
- (void)_updateBannerActionButton;
- (void)_updateContainsUnverifierPersons;
- (void)_updateCounts;
- (void)_updateLoadingPeopleSuggestions;
- (void)_updateLocalizedNamesByViewModel;
- (void)_updatePeopleSuggestionNames;
- (void)becomeReusable;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareForReuse;
- (void)setBannerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPeopleSuggestionsDataSourceManager:(id)a3;
@end

@implementation PXCMMBannerTileController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
  objc_storeStrong((id *)&self->_localizedNames, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setBannerView:(id)a3
{
}

- (PXCMMPosterBannerView)bannerView
{
  return self->_bannerView;
}

- (void)setDelegate:(id)a3
{
}

- (PXCMMBannerTileControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCMMBannerTileControllerDelegate *)WeakRetained;
}

- (PXPeopleSuggestionsDataSourceManager)peopleSuggestionsDataSourceManager
{
  return self->_peopleSuggestionsDataSourceManager;
}

- (void)_updateLocalizedNamesByViewModel
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_sourceType == 1)
  {
    v3 = [(PXCMMViewModel *)self->_viewModel recipients];
    v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "firstName", (void)v18);
          if ([v11 length])
          {
            v12 = [v10 firstName];
          }
          else
          {
            v13 = [v10 localizedName];
            if ([v13 length])
            {
              v12 = [v10 localizedName];
            }
            else
            {
              v12 = 0;
            }
          }
          if (v12) {
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    v14 = (NSArray *)[v4 copy];
    localizedNames = self->_localizedNames;
    self->_localizedNames = v14;

    v16 = self->_localizedNames;
    v17 = [(PXCMMBannerTileController *)self bannerView];
    [v17 setLocalizedNamesForHeadline:v16];
  }
}

- (void)_updatePeopleSuggestionNames
{
  v3 = [(PXCMMBannerTileController *)self peopleSuggestionsDataSourceManager];
  id v16 = [v3 dataSource];

  uint64_t v4 = [v16 numberOfItemsInSection:0];
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [MEMORY[0x1E4F28D58] indexPathForItem:i inSection:0];
      uint64_t v8 = [v16 personSuggestionAtIndexPath:v7];

      uint64_t v9 = [v8 localizedName];
      v10 = (void *)v9;
      if (v9) {
        v11 = (__CFString *)v9;
      }
      else {
        v11 = &stru_1F00B0030;
      }
      [v5 addObject:v11];
    }
  }
  v12 = (NSArray *)[v5 copy];
  localizedNames = self->_localizedNames;
  self->_localizedNames = v12;

  v14 = self->_localizedNames;
  v15 = [(PXCMMBannerTileController *)self bannerView];
  [v15 setLocalizedNamesForHeadline:v14];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if ((void *)PXViewModelObservationContext_181511 != a5)
  {
    if ((void *)PXMomentShareStatusPresentationObservationContext_181512 != a5)
    {
      id v11 = v9;
      if ((void *)PXPeopleSuggestionsDataSourceManagerContext != a5)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"PXCMMBannerTileController.m" lineNumber:250 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      [(PXCMMBannerTileController *)self _updatePeopleSuggestionNames];
      goto LABEL_11;
    }
    if ((v6 & 0x2000) == 0) {
      goto LABEL_12;
    }
    id v11 = v9;
    goto LABEL_10;
  }
  id v11 = v9;
  if ((*(void *)&v6 & 0x10606) != 0)
  {
    if ((v6 & 4) != 0) {
      [(PXCMMBannerTileController *)self _updateLocalizedNamesByViewModel];
    }
LABEL_10:
    [(PXCMMBannerTileController *)self _updateCounts];
    [(PXCMMBannerTileController *)self _updateBannerActionButton];
LABEL_11:
    id v9 = v11;
    goto LABEL_12;
  }
  if ((v6 & 0x800) != 0)
  {
    [(PXCMMBannerTileController *)self _updateLoadingPeopleSuggestions];
    goto LABEL_11;
  }
  if ((v6 & 0x8000) != 0)
  {
    [(PXCMMBannerTileController *)self _updateContainsUnverifierPersons];
    goto LABEL_11;
  }
LABEL_12:
}

- (void)prepareForReuse
{
  id v2 = [(PXCMMBannerTileController *)self bannerView];
  [v2 setHidden:0];
}

- (void)becomeReusable
{
  v3 = [(PXCMMBannerTileController *)self bannerView];
  [v3 setHidden:1];

  [(PXCMMBannerTileController *)self setPeopleSuggestionsDataSourceManager:0];
}

- (UIView)view
{
  v3 = [(PXCMMBannerTileController *)self bannerView];

  if (!v3)
  {
    uint64_t v4 = [PXCMMPosterBannerView alloc];
    id v5 = -[PXCMMPosterBannerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PXCMMBannerTileController *)self setBannerView:v5];

    [(PXCMMBannerTileController *)self _updateLocalizedNamesByViewModel];
    [(PXCMMBannerTileController *)self _updateCounts];
    [(PXCMMBannerTileController *)self _updateBannerActionButton];
    [(PXCMMBannerTileController *)self _updateContainsUnverifierPersons];
  }
  return (UIView *)[(PXCMMBannerTileController *)self bannerView];
}

- (void)_updateContainsUnverifierPersons
{
  BOOL v3 = [(PXCMMViewModel *)self->_viewModel containsUnverifiedPersons];
  id v4 = [(PXCMMBannerTileController *)self bannerView];
  [v4 setContainsUnverifiedPersons:v3];
}

- (void)_configureBannerViewActionButtonWithTitle:(id)a3
{
  id v4 = a3;
  if (self->_activityType == 2)
  {
    id v9 = v4;
    id v5 = [(PXCMMViewModel *)self->_viewModel selectionManager];
    int v6 = [v5 selectionSnapshot];
    int v7 = [v6 areAllUnsavedAssetsSelectedWithImportStatusManager:self->_importStatusManager];

    if (v7)
    {
      uint64_t v8 = [(PXCMMBannerTileController *)self bannerView];
      [v8 setActionButtonWithTitle:v9 actionBlock:0];
    }
    id v4 = v9;
  }
}

- (void)_updateLoadingPeopleSuggestions
{
  BOOL v3 = [(PXCMMViewModel *)self->_viewModel isLoadingPeopleSuggestions];
  id v4 = [(PXCMMBannerTileController *)self bannerView];
  [v4 setLoadingPeopleSuggestions:v3];
}

- (void)_handleButtonActionWithTitle:(id)a3
{
  [(PXCMMBannerTileController *)self _configureBannerViewActionButtonWithTitle:a3];
  id v4 = [(PXCMMBannerTileController *)self delegate];
  [v4 didTapActionButtonInBannerTileController:self];

  if (self->_activityType == 2)
  {
    id v5 = [(PXCMMBannerTileController *)self bannerView];
    [v5 setAddingPhotos:1];
  }
}

- (void)_updateBannerActionButton
{
  uint64_t v3 = [(PXCMMViewModel *)self->_viewModel selectedCount];
  unint64_t activityType = self->_activityType;
  unint64_t sourceType = self->_sourceType;
  uint64_t v6 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation state];
  int v7 = [(PXCMMViewModel *)self->_viewModel selectionManager];
  uint64_t v8 = [v7 selectionSnapshot];
  importStatusManager = self->_importStatusManager;
  id v25 = 0;
  PXCMMActionButton(activityType, sourceType, v6, v8, importStatusManager, 0, &v25);
  id v10 = v25;

  objc_initWeak(&location, self);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  long long v20 = __54__PXCMMBannerTileController__updateBannerActionButton__block_invoke;
  long long v21 = &unk_1E5DD20C8;
  objc_copyWeak(&v23, &location);
  id v11 = v10;
  id v22 = v11;
  v12 = _Block_copy(&v18);
  v13 = [(PXCMMBannerTileController *)self bannerView];
  v14 = v13;
  if (v3 <= 0) {
    v15 = 0;
  }
  else {
    v15 = v12;
  }
  [v13 setActionButtonWithTitle:v11 actionBlock:v15];

  unint64_t v16 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation state];
  if (v16 <= 6 && ((1 << v16) & 0x61) != 0)
  {
    v17 = [(PXCMMBannerTileController *)self bannerView];
    [v17 setAddingPhotos:0];
  }
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __54__PXCMMBannerTileController__updateBannerActionButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleButtonActionWithTitle:*(void *)(a1 + 32)];
}

- (void)_updateCounts
{
  uint64_t v18 = self->_viewModel;
  uint64_t v4 = [(PXCMMViewModel *)v18 selectedCount];
  switch(self->_activityType)
  {
    case 0uLL:
    case 4uLL:
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"PXCMMBannerTileController.m" lineNumber:138 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1uLL:
      localizedNames = self->_localizedNames;
      uint64_t v6 = [(PXCMMBannerTileController *)self bannerView];
      [v6 setLocalizedNamesForHeadline:localizedNames];

      int v7 = PXLocalizedAssetCountForUsage(v4, [(PXCMMViewModel *)v18 aggregateMediaType], 0, 0);
      uint64_t v8 = [(PXCMMBannerTileController *)self bannerView];
      [v8 setSubheadline:v7];

      goto LABEL_12;
    case 2uLL:
      int v7 = PXLocalizedAssetMessageForUsage([(PXCMMViewModel *)v18 aggregateMediaType], 0, 1);
      id v9 = [(PXCMMBannerTileController *)self bannerView];
      [v9 setHeadline:v7];

      if ([(PXCMMViewModel *)v18 isSelecting])
      {
        uint64_t v10 = [(PXCMMViewModel *)v18 aggregateMediaTypeForSelection];
      }
      else
      {
        int64_t v11 = [(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation state];
        if (v11 == 5 || v11 == 3)
        {
          uint64_t v12 = [(PXCMMViewModel *)v18 aggregateMediaTypeForSelection];
          uint64_t v13 = v4;
          uint64_t v14 = 20;
          goto LABEL_11;
        }
        uint64_t v4 = [(PXCMMViewModel *)v18 totalCount];
        uint64_t v10 = [(PXCMMViewModel *)v18 aggregateMediaType];
      }
      uint64_t v12 = v10;
      uint64_t v13 = v4;
      uint64_t v14 = 0;
LABEL_11:
      v15 = PXLocalizedAssetCountForUsage(v13, v12, 0, v14);
      unint64_t v16 = [(PXCMMBannerTileController *)self bannerView];
      [v16 setSubheadline:v15];

LABEL_12:
LABEL_13:

      return;
    case 3uLL:
      int v7 = [(PXCMMBannerTileController *)self bannerView];
      [v7 setHeadline:0];
      goto LABEL_12;
    default:
      goto LABEL_13;
  }
}

- (void)setPeopleSuggestionsDataSourceManager:(id)a3
{
  uint64_t v8 = (PXPeopleSuggestionsDataSourceManager *)a3;
  id v5 = self->_peopleSuggestionsDataSourceManager;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PXPeopleSuggestionsDataSourceManager *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      [(PXSectionedDataSourceManager *)self->_peopleSuggestionsDataSourceManager unregisterChangeObserver:self context:PXPeopleSuggestionsDataSourceManagerContext];
      objc_storeStrong((id *)&self->_peopleSuggestionsDataSourceManager, a3);
      [(PXSectionedDataSourceManager *)self->_peopleSuggestionsDataSourceManager registerChangeObserver:self context:PXPeopleSuggestionsDataSourceManagerContext];
      [(PXCMMBannerTileController *)self _updatePeopleSuggestionNames];
    }
  }
}

- (PXCMMBannerTileController)initWithActivityType:(unint64_t)a3 sourceType:(unint64_t)a4 viewModel:(id)a5 momentShareStatusPresentation:(id)a6 importStatusManager:(id)a7
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v14)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXCMMBannerTileController.m", 59, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)PXCMMBannerTileController;
  v17 = [(PXCMMBannerTileController *)&v21 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_unint64_t activityType = a3;
    v17->_unint64_t sourceType = a4;
    objc_storeStrong((id *)&v17->_viewModel, a5);
    [(PXCMMViewModel *)v18->_viewModel registerChangeObserver:v18 context:PXViewModelObservationContext_181511];
    objc_storeStrong((id *)&v18->_momentShareStatusPresentation, a6);
    [(PXMomentShareStatusPresentation *)v18->_momentShareStatusPresentation registerChangeObserver:v18 context:PXMomentShareStatusPresentationObservationContext_181512];
    objc_storeStrong((id *)&v18->_importStatusManager, a7);
  }

  return v18;
}

- (PXCMMBannerTileController)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMBannerTileController.m", 51, @"%s is not available as initializer", "-[PXCMMBannerTileController init]");

  abort();
}

+ (id)new
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXCMMBannerTileController.m", 55, @"%s is not available as initializer", "+[PXCMMBannerTileController new]");

  abort();
}

@end