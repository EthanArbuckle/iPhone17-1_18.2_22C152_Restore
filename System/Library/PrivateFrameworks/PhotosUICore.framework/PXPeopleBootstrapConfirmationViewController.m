@interface PXPeopleBootstrapConfirmationViewController
- (BOOL)hasSelectionEverChanged;
- (BOOL)shouldConfirmAdvancement;
- (BOOL)suggestionsPresented;
- (BOOL)useLowMemoryMode;
- (BOOL)wantsCancelButton;
- (BOOL)willAppear;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (CGSize)lastSize;
- (CGSize)preferredSize;
- (NSArray)currentSuggestions;
- (NSArray)presentationStatuses;
- (NSTimer)loadingDelayTimer;
- (PXPeopleBootstrapConfirmationViewController)initWithContext:(id)a3 dataSource:(id)a4;
- (PXPeopleBootstrapContext)bootstrapContext;
- (PXPeopleFlowViewControllerActionDelegate)actionDelegate;
- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate;
- (PXPeopleSuggestionManager)suggestionManager;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (id)_descriptionForFooterView;
- (id)_keyAssetForPersonAtIndex:(int64_t)a3;
- (id)_sortedIndexPathsForVisibleCells;
- (id)_titleForHeaderView;
- (id)_titleForPreviewForAsset:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)type;
- (unint64_t)viewState;
- (void)_badgeLoadingCells;
- (void)_cacheCurrentSuggestions;
- (void)_evaluateIfSuggestionPresentationFinished;
- (void)_finishedPresentingSuggestions;
- (void)_markSkippedSuggestions;
- (void)_noSuggestionsFound;
- (void)_startLoadingTimer;
- (void)_toggleConfirmedForCollectionViewCellAtIndexPath:(id)a3;
- (void)_updateNavigationBarForCurrentTraitCollection;
- (void)_updateViewWithViewState:(unint64_t)a3;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)keyFaceUpdated:(id)a3;
- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setActionDelegate:(id)a3;
- (void)setConfigControllerDelegate:(id)a3;
- (void)setCurrentSuggestions:(id)a3;
- (void)setHasSelectionEverChanged:(BOOL)a3;
- (void)setLastSize:(CGSize)a3;
- (void)setLoadingDelayTimer:(id)a3;
- (void)setSuggestionsPresented:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)setUseLowMemoryMode:(BOOL)a3;
- (void)setViewState:(unint64_t)a3;
- (void)setWillAppear:(BOOL)a3;
- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImageForCell:(id)a3 withPerson:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willLoadMoreSuggestionsForSuggestionManager:(id)a3;
- (void)willTransitionToNextInFlow;
@end

@implementation PXPeopleBootstrapConfirmationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingDelayTimer, 0);
  objc_storeStrong((id *)&self->_currentSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionManager, 0);
  objc_destroyWeak((id *)&self->_configControllerDelegate);
  objc_destroyWeak((id *)&self->actionDelegate);
  objc_storeStrong((id *)&self->_bootstrapContext, 0);
}

- (void)setHasSelectionEverChanged:(BOOL)a3
{
  self->_hasSelectionEverChanged = a3;
}

- (BOOL)hasSelectionEverChanged
{
  return self->_hasSelectionEverChanged;
}

- (void)setLastSize:(CGSize)a3
{
  self->_lastSize = a3;
}

- (CGSize)lastSize
{
  double width = self->_lastSize.width;
  double height = self->_lastSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWillAppear:(BOOL)a3
{
  self->_willAppear = a3;
}

- (BOOL)willAppear
{
  return self->_willAppear;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)viewState
{
  return self->_viewState;
}

- (void)setSuggestionsPresented:(BOOL)a3
{
  self->_suggestionsPresented = a3;
}

- (BOOL)suggestionsPresented
{
  return self->_suggestionsPresented;
}

- (void)setLoadingDelayTimer:(id)a3
{
}

- (NSTimer)loadingDelayTimer
{
  return self->_loadingDelayTimer;
}

- (void)setCurrentSuggestions:(id)a3
{
}

- (NSArray)currentSuggestions
{
  return self->_currentSuggestions;
}

- (PXPeopleSuggestionManager)suggestionManager
{
  return self->_suggestionManager;
}

- (void)setConfigControllerDelegate:(id)a3
{
}

- (PXPeoplePickerConfigurationControllerDelegate)configControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configControllerDelegate);
  return (PXPeoplePickerConfigurationControllerDelegate *)WeakRetained;
}

- (void)setUseLowMemoryMode:(BOOL)a3
{
  self->_useLowMemoryMode = a3;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (void)setActionDelegate:(id)a3
{
}

- (PXPeopleFlowViewControllerActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->actionDelegate);
  return (PXPeopleFlowViewControllerActionDelegate *)WeakRetained;
}

- (PXPeopleBootstrapContext)bootstrapContext
{
  return self->_bootstrapContext;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  v6 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  v11 = objc_msgSend(v6, "indexPathForItemAtPoint:", v8, v10);
  if (v11)
  {
    v12 = [v6 cellForItemAtIndexPath:v11];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v12];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v8 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
  double v9 = objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  if (!v9)
  {
    v20 = 0;
    goto LABEL_11;
  }
  double v10 = [v8 cellForItemAtIndexPath:v9];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_4;
    }
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v25 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v25);
    v26 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v22 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 854, @"%@ should be an instance inheriting from %@, but it is %@", @"[collectionView cellForItemAtIndexPath:indexPath]", v24, v26 object file lineNumber description];
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    [v22 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 854, @"%@ should be an instance inheriting from %@, but it is nil", @"[collectionView cellForItemAtIndexPath:indexPath]", v24 object file lineNumber description];
  }

LABEL_4:
  v11 = [v10 image];

  if (!v11)
  {
    v20 = 0;
    goto LABEL_10;
  }
  uint64_t v12 = [v9 item];
  v13 = [(PXPeopleBootstrapConfirmationViewController *)self _keyAssetForPersonAtIndex:v12];
  v14 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  v15 = [v14 objectAtIndexedSubscript:v12];

  id v16 = v15;
  if (!v16)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    [v27 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 859, @"%@ should be an instance inheriting from %@, but it is nil", @"suggestion", v29 object file lineNumber description];
LABEL_19:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v30);
    v31 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
    [v27 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 859, @"%@ should be an instance inheriting from %@, but it is %@", @"suggestion", v29, v31 object file lineNumber description];

    goto LABEL_19;
  }
LABEL_7:
  v17 = (void *)MEMORY[0x1E4FB1678];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v36[3] = &unk_1E5DC7420;
  id v37 = v16;
  id v38 = v13;
  v39 = self;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  v32[3] = &unk_1E5DC7470;
  v32[4] = self;
  id v33 = v16;
  id v34 = v9;
  id v35 = v38;
  id v18 = v38;
  id v19 = v16;
  v20 = [v17 configurationWithIdentifier:0 previewProvider:v36 actionProvider:v32];

LABEL_10:
LABEL_11:

  return v20;
}

PXPeopleBootstrapConfirmationPreviewViewController *__101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v1 = -[PXPeopleBootstrapConfirmationPreviewViewController initWithPerson:keyAsset:useLowMemoryMode:]([PXPeopleBootstrapConfirmationPreviewViewController alloc], "initWithPerson:keyAsset:useLowMemoryMode:", *(void *)(a1 + 32), *(void *)(a1 + 40), [*(id *)(a1 + 48) useLowMemoryMode]);
  return v1;
}

id __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) suggestionManager];
  if ([v4 isSuggestionConfirmed:*(void *)(a1 + 40)]) {
    id v5 = @"PXPeopleBootstrapPreviewDeselect";
  }
  else {
    id v5 = @"PXPeopleBootstrapPreviewSelect";
  }
  v6 = PXLocalizedStringFromTable(v5, @"PhotosUICore");
  objc_initWeak(&location, *(id *)(a1 + 32));
  double v7 = (void *)MEMORY[0x1E4FB13F0];
  double v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  v15[3] = &unk_1E5DC7448;
  objc_copyWeak(&v17, &location);
  id v16 = *(id *)(a1 + 48);
  double v9 = [v7 actionWithTitle:v6 image:v8 identifier:0 handler:v15];

  double v10 = [*(id *)(a1 + 32) _titleForPreviewForAsset:*(void *)(a1 + 56)];
  v11 = (void *)MEMORY[0x1E4FB1970];
  v19[0] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v13 = [v11 menuWithTitle:v10 children:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __101__PXPeopleBootstrapConfirmationViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _toggleConfirmedForCollectionViewCellAtIndexPath:*(void *)(a1 + 32)];
}

- (void)keyFaceUpdated:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 userInfo];
  v4 = [v3 objectForKey:@"PXPeopleUpdatedKeyFacePersonsKey"];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v31;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v5;
        v6 = *(void **)(*((void *)&v30 + 1) + 8 * v5);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        double v7 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
        double v8 = [v7 visibleCells];

        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v27 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              v14 = [v13 image];

              if (!v14)
              {
                v15 = [v13 imageRequest];
                id v16 = [v15 person];

                id v17 = objc_msgSend(v16, "px_localIdentifier");
                id v18 = objc_msgSend(v6, "px_localIdentifier");
                int v19 = [v17 isEqualToString:v18];

                if (v19)
                {
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __62__PXPeopleBootstrapConfirmationViewController_keyFaceUpdated___block_invoke;
                  block[3] = &unk_1E5DD0F30;
                  block[4] = self;
                  block[5] = v13;
                  block[6] = v6;
                  dispatch_async(MEMORY[0x1E4F14428], block);
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v10);
        }

        uint64_t v5 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v22);
  }
}

uint64_t __62__PXPeopleBootstrapConfirmationViewController_keyFaceUpdated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateImageForCell:*(void *)(a1 + 40) withPerson:*(void *)(a1 + 48)];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"nameSelection", a4, a5, a6))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __94__PXPeopleBootstrapConfirmationViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __94__PXPeopleBootstrapConfirmationViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _cacheCurrentSuggestions];
  id v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];
}

- (BOOL)shouldConfirmAdvancement
{
  return ![(PXPeopleBootstrapConfirmationViewController *)self hasSelectionEverChanged];
}

- (void)willTransitionToNextInFlow
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    double v7 = "-[PXPeopleBootstrapConfirmationViewController willTransitionToNextInFlow]";
    _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "Bootstrap UI: %s", (uint8_t *)&v6, 0xCu);
  }

  [(PXPeopleBootstrapConfirmationViewController *)self _markSkippedSuggestions];
  v4 = [(PXPeopleBootstrapConfirmationViewController *)self suggestionManager];
  uint64_t v5 = [(PXPeopleBootstrapConfirmationViewController *)self bootstrapContext];
  [v5 setSuggestionManager:v4];
}

- (BOOL)wantsCancelButton
{
  return 0;
}

- (CGSize)preferredSize
{
  +[PXPeopleBootstrap preferredBootstrapSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4
{
  [(PXPeopleBootstrapConfirmationViewController *)self _cacheCurrentSuggestions];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__PXPeopleBootstrapConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke;
  v5[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __92__PXPeopleBootstrapConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setSuggestionsPresented:0];

  id v4 = objc_loadWeakRetained(v1);
  double v3 = [v4 collectionView];
  [v3 reloadData];
}

- (void)willLoadMoreSuggestionsForSuggestionManager:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    double v7 = "-[PXPeopleBootstrapConfirmationViewController willLoadMoreSuggestionsForSuggestionManager:]";
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "Bootstrap UI: %s", buf, 0xCu);
  }

  if ([(PXPeopleBootstrapConfirmationViewController *)self willAppear])
  {
    [(PXPeopleBootstrapConfirmationViewController *)self _startLoadingTimer];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__PXPeopleBootstrapConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __91__PXPeopleBootstrapConfirmationViewController_willLoadMoreSuggestionsForSuggestionManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setViewState:4];
}

- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PXPeopleBootstrapConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __94__PXPeopleBootstrapConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _noSuggestionsFound];
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)updateImageForCell:(id)a3 withPerson:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [[PXPersonImageRequest alloc] initWithPerson:v7];
  [v6 setImageRequest:v8];
  uint64_t v9 = [(PXPeopleBootstrapConfirmationViewController *)self suggestionManager];
  [v6 bounds];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  double v14 = CGRectGetWidth(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v15 = CGRectGetHeight(v31);
  if (v14 >= v15) {
    double v16 = v15;
  }
  else {
    double v16 = v14;
  }
  id v17 = [v6 traitCollection];
  [v17 displayScale];
  double v19 = v18;

  v20 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v7, v16, v16, v19);
  [(PXPeopleFaceCropFetchOptions *)v20 setCropFactor:0];
  [(PXPeopleFaceCropFetchOptions *)v20 setCornerStyle:1];
  [(PXPeopleFaceCropFetchOptions *)v20 setUseLowMemoryMode:[(PXPeopleBootstrapConfirmationViewController *)self useLowMemoryMode]];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__PXPeopleBootstrapConfirmationViewController_updateImageForCell_withPerson___block_invoke;
  v25[3] = &unk_1E5DC73F8;
  long long v26 = v8;
  id v27 = v6;
  id v28 = v9;
  id v29 = v7;
  id v21 = v7;
  id v22 = v9;
  id v23 = v6;
  v24 = v8;
  [(PXPersonImageRequest *)v24 requestFaceCropWithOptions:v20 timeout:v25 resultHandler:30.0];
}

void __77__PXPeopleBootstrapConfirmationViewController_updateImageForCell_withPerson___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PXPeopleBootstrapConfirmationViewController_updateImageForCell_withPerson___block_invoke_2;
  v9[3] = &unk_1E5DC76E8;
  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = v6;
  id v13 = v5;
  id v14 = a1[6];
  id v15 = a1[7];
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

void __77__PXPeopleBootstrapConfirmationViewController_updateImageForCell_withPerson___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) imageRequest];

  if (v2 == v3)
  {
    id v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
    id v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 56);
    [v4 CGRectValue];
    objc_msgSend(v5, "setImage:contentsRect:", v6);
    if (*(void *)(a1 + 56))
    {
      id v7 = *(void **)(a1 + 64);
      v9[0] = *(void *)(a1 + 72);
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      [v7 markSuggestions:v8 confirmed:1 wantsSound:1];

      [*(id *)(a1 + 40) setConfirmed:1];
    }
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"PXPeopleBootstrapCell" forIndexPath:v6];
  uint64_t v9 = [v6 item];

  id v10 = [(PXPeopleBootstrapConfirmationViewController *)self suggestionManager];
  id v11 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  id v12 = [v11 objectAtIndexedSubscript:v9];
  id v13 = [v8 contentView];
  id v14 = [v13 layer];

  [v8 bounds];
  CGFloat x = v44.origin.x;
  CGFloat y = v44.origin.y;
  CGFloat width = v44.size.width;
  CGFloat height = v44.size.height;
  double v19 = CGRectGetWidth(v44);
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double v20 = CGRectGetHeight(v45);
  if (v19 >= v20) {
    double v21 = v20;
  }
  else {
    double v21 = v19;
  }
  id v22 = [[PXPersonImageRequest alloc] initWithPerson:v12];
  [v8 setImageRequest:v22];
  objc_msgSend(v8, "setIsMergeCandidate:", objc_msgSend(v12, "isPersonModel"));
  objc_msgSend(v8, "setIsVerified:", objc_msgSend(v12, "isVerified"));
  id v23 = [v7 traitCollection];

  [v23 displayScale];
  double v25 = v24;

  long long v26 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v12, v21, v21, v25);
  [(PXPeopleFaceCropFetchOptions *)v26 setCropFactor:0];
  [(PXPeopleFaceCropFetchOptions *)v26 setCornerStyle:1];
  [(PXPeopleFaceCropFetchOptions *)v26 setUseLowMemoryMode:[(PXPeopleBootstrapConfirmationViewController *)self useLowMemoryMode]];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  aBlock[3] = &unk_1E5DC73D0;
  v39 = v22;
  id v27 = v8;
  id v40 = v27;
  id v41 = v10;
  id v42 = v12;
  v43 = self;
  id v28 = v12;
  id v29 = v10;
  CGRect v30 = v22;
  CGRect v31 = _Block_copy(aBlock);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke_3;
  v36[3] = &unk_1E5DD24E8;
  id v37 = v31;
  id v32 = v31;
  [(PXPersonImageRequest *)v30 requestFaceCropWithOptions:v26 timeout:v36 resultHandler:30.0];
  long long v33 = v37;
  id v34 = v27;

  return v34;
}

void __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke_2;
  block[3] = &unk_1E5DC73A8;
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v6;
  id v16 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  id v17 = v7;
  uint64_t v18 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__PXPeopleBootstrapConfirmationViewController_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) imageRequest];

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = [*(id *)(a1 + 40) image];

    id v6 = [*(id *)(a1 + 56) objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    [v6 CGRectValue];
    objc_msgSend(v7, "setImage:contentsRect:", v8);
    if (!v4 || v5)
    {
      if (!v4)
      {
        id v11 = *(void **)(a1 + 64);
        uint64_t v13 = *(void *)(a1 + 72);
        id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
        [v11 markSuggestionsAsSkipped:v12];
      }
    }
    else
    {
      id v9 = *(void **)(a1 + 64);
      v14[0] = *(void *)(a1 + 72);
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      [v9 markSuggestions:v10 confirmed:1 wantsSound:1];

      [*(id *)(a1 + 40) setConfirmed:1];
    }
    [*(id *)(a1 + 80) _evaluateIfSuggestionPresentationFinished];
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a4;
  id v9 = (id)*MEMORY[0x1E4FB2770];
  if ((id)*MEMORY[0x1E4FB2770] == v8) {
    id v10 = @"PXPeopleBootstrapHeader";
  }
  else {
    id v10 = @"PXPeopleBootstrapFooter";
  }
  id v11 = [a3 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v10 forIndexPath:a5];
  if (v9 == v8)
  {
    uint64_t v13 = [(PXPeopleBootstrapConfirmationViewController *)self bootstrapContext];
    id v14 = [v13 sourcePerson];
    [v11 setPerson:v14];

    id v12 = [(PXPeopleBootstrapConfirmationViewController *)self _titleForHeaderView];
    [v11 setTitle:v12];
  }
  else
  {
    if ((id)*MEMORY[0x1E4FB2760] != v8) {
      goto LABEL_9;
    }
    id v12 = [(PXPeopleBootstrapConfirmationViewController *)self _descriptionForFooterView];
    [v11 setDescriptionText:v12];
  }

LABEL_9:
  return v11;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  [a3 frame];
  +[PXPeopleGridSizer cellSizeForGridClass:0 width:v5];
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  [a3 frame];
  +[PXPeopleGridSizer marginForGridClass:0 width:v5];
  float v7 = v6 * 0.5;
  double v8 = ceilf(v7);
  double v9 = v6;
  double v10 = v6;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v6;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  [a3 frame];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(PXPeopleBootstrapConfirmationViewController *)self _descriptionForFooterView];
  +[PXPeopleBootstrapFooterView sizeForBoundingSize:descriptionText:](PXPeopleBootstrapFooterView, "sizeForBoundingSize:descriptionText:", v10, v7, v9);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.CGFloat height = v16;
  result.CGFloat width = v15;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v6 = a3;
  double v7 = [(PXPeopleBootstrapConfirmationViewController *)self _titleForHeaderView];
  [v6 frame];
  double v9 = v8;

  +[PXPeopleConfirmationHeaderView sizeForTitle:boundingSize:](PXPeopleConfirmationHeaderView, "sizeForTitle:boundingSize:", v7, v9, 0.0);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.CGFloat height = v15;
  result.CGFloat width = v14;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (id)_titleForPreviewForAsset:(id)a3
{
  double v3 = (objc_class *)MEMORY[0x1E4F8A798];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 creationDate];
  double v7 = [v5 stringFromDate:v6];

  double v8 = [v4 localizedGeoDescription];

  if ([v8 length])
  {
    id v9 = [NSString stringWithFormat:@"%@\n%@", v8, v7];
  }
  else
  {
    id v9 = v7;
  }
  id v10 = v9;

  return v10;
}

- (id)_keyAssetForPersonAtIndex:(int64_t)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  double v7 = [v6 objectAtIndexedSubscript:a3];

  id v8 = v7;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    id v22 = (objc_class *)objc_opt_class();
    double v21 = NSStringFromClass(v22);
    id v23 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 478, @"%@ should be an instance inheriting from %@, but it is %@", @"suggestion", v21, v23 object file lineNumber description];
  }
  else
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    double v20 = (objc_class *)objc_opt_class();
    double v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 478, @"%@ should be an instance inheriting from %@, but it is nil", @"suggestion", v21 object file lineNumber description];
  }

LABEL_3:
  id v9 = [v8 photoLibrary];
  id v10 = [v9 librarySpecificFetchOptions];

  [v10 setFetchLimit:1];
  double v11 = objc_msgSend(MEMORY[0x1E4F390A0], "px_defaultDetectionTypes");
  [v10 setIncludedDetectionTypes:v11];

  [v10 setIncludeTorsoAndFaceDetectionData:1];
  double v12 = [MEMORY[0x1E4F39050] fetchKeyFaceForPerson:v8 options:v10];
  double v13 = [v12 firstObject];

  double v14 = (void *)MEMORY[0x1E4F38EB8];
  v24[0] = v13;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  double v16 = [v14 fetchAssetsForFaces:v15 options:v10];
  id v17 = [v16 firstObject];

  return v17;
}

- (id)_titleForHeaderView
{
  id v4 = [(PXPeopleBootstrapConfirmationViewController *)self bootstrapContext];
  id v5 = [v4 sourcePerson];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = (objc_class *)objc_opt_class();
    double v12 = NSStringFromClass(v13);
    double v14 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 464, @"%@ should be an instance inheriting from %@, but it is %@", @"context.sourcePerson", v12, v14 object file lineNumber description];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = (objc_class *)objc_opt_class();
    double v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 464, @"%@ should be an instance inheriting from %@, but it is nil", @"context.sourcePerson", v12 object file lineNumber description];
  }

LABEL_3:
  id v6 = [v4 localizedName];
  if ([v6 length])
  {
    double v7 = PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, @"PXPeopleBootstrapHeaderTitleNamed");
    id v8 = PXStringWithValidatedFormat();
  }
  else
  {
    id v8 = PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, @"PXPeopleBootstrapHeaderTitleUnnamed");
  }

  return v8;
}

- (id)_descriptionForFooterView
{
  id v4 = [(PXPeopleBootstrapConfirmationViewController *)self bootstrapContext];
  id v5 = [v4 sourcePerson];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = (objc_class *)objc_opt_class();
    double v12 = NSStringFromClass(v13);
    double v14 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 449, @"%@ should be an instance inheriting from %@, but it is %@", @"context.sourcePerson", v12, v14 object file lineNumber description];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    double v11 = (objc_class *)objc_opt_class();
    double v12 = NSStringFromClass(v11);
    [v10 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 449, @"%@ should be an instance inheriting from %@, but it is nil", @"context.sourcePerson", v12 object file lineNumber description];
  }

LABEL_3:
  id v6 = [v4 localizedName];
  if ([v6 length])
  {
    double v7 = PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, @"PXPeopleBootstrapHeaderDescriptionNamed");
    id v8 = PXStringWithValidatedFormat();
  }
  else
  {
    id v8 = PXLocalizedStringForPersonOrPetAndVisibility(v5, 0, @"PXPeopleBootstrapHeaderDescriptionUnnamed");
  }

  return v8;
}

- (void)_cacheCurrentSuggestions
{
  id v8 = [(PXPeopleBootstrapConfirmationViewController *)self bootstrapContext];
  double v3 = [v8 nameSelection];
  id v4 = [v3 person];

  id v5 = [(PXPeopleBootstrapConfirmationViewController *)self suggestionManager];
  id v6 = [v5 currentSuggestions];

  if (v4 && [v6 containsObject:v4])
  {
    double v7 = (void *)[v6 mutableCopy];
    [v7 removeObject:v4];

    id v6 = v7;
  }
  [(PXPeopleBootstrapConfirmationViewController *)self setCurrentSuggestions:v6];
}

- (id)_sortedIndexPathsForVisibleCells
{
  double v2 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
  double v3 = [v2 indexPathsForVisibleItems];

  id v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return v4;
}

- (void)_badgeLoadingCells
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
  double v3 = [v2 visibleCells];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (![v8 presentationStatus]) {
          [v8 setPresentationStatus:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_updateNavigationBarForCurrentTraitCollection
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __92__PXPeopleBootstrapConfirmationViewController__updateNavigationBarForCurrentTraitCollection__block_invoke;
  v2[3] = &unk_1E5DD36F8;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __92__PXPeopleBootstrapConfirmationViewController__updateNavigationBarForCurrentTraitCollection__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) currentSuggestions];
  uint64_t v3 = [v2 count];

  if (v3) {
    uint64_t v4 = @"PXPeopleBootstrapNewConfirmationTitle";
  }
  else {
    uint64_t v4 = @"PXPeopleBootstrapConfirmationTitle";
  }
  PXLocalizedStringFromTable(v4, @"PhotosUICore");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setTitle:v5];
}

- (void)_startLoadingTimer
{
  uint64_t v3 = [(PXPeopleBootstrapConfirmationViewController *)self loadingDelayTimer];
  uint64_t v4 = v3;
  if (v3) {
    [v3 invalidate];
  }
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4F1CB00];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__PXPeopleBootstrapConfirmationViewController__startLoadingTimer__block_invoke;
  v7[3] = &unk_1E5DC7380;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  uint64_t v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v7 block:0.5];

  [(PXPeopleBootstrapConfirmationViewController *)self setLoadingDelayTimer:v6];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __65__PXPeopleBootstrapConfirmationViewController__startLoadingTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXPeopleBootstrapConfirmationViewController__startLoadingTimer__block_invoke_2;
  block[3] = &unk_1E5DD2548;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __65__PXPeopleBootstrapConfirmationViewController__startLoadingTimer__block_invoke_2(uint64_t a1)
{
  double v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained loadingDelayTimer];
  id v5 = *(void **)(a1 + 32);

  uint64_t v6 = PLUIGetLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4 == v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "Bootstrap UI: Display loading UI (Timer Valid)", buf, 2u);
    }

    id v8 = objc_loadWeakRetained(v2);
    char v9 = [v8 suggestionsPresented];

    if ((v9 & 1) == 0) {
      [*(id *)(a1 + 40) setViewState:2];
    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)long long v10 = 0;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "Bootstrap UI: Do not display loading UI (Timer Invalid)", v10, 2u);
    }
  }
}

- (void)_toggleConfirmedForCollectionViewCellAtIndexPath:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
  BOOL v7 = [v6 cellForItemAtIndexPath:v5];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v17 = (objc_class *)objc_opt_class();
    double v16 = NSStringFromClass(v17);
    uint64_t v18 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 339, @"%@ should be an instance inheriting from %@, but it is %@", @"[self.collectionView cellForItemAtIndexPath:indexPath]", v16, v18 object file lineNumber description];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    double v15 = (objc_class *)objc_opt_class();
    double v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXPeopleBootstrapConfirmationViewController.m", 339, @"%@ should be an instance inheriting from %@, but it is nil", @"[self.collectionView cellForItemAtIndexPath:indexPath]", v16 object file lineNumber description];
  }

LABEL_3:
  id v8 = [v7 image];

  if (v8)
  {
    char v9 = [(PXPeopleBootstrapConfirmationViewController *)self suggestionManager];
    long long v10 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
    long long v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));

    uint64_t v12 = [v9 isSuggestionConfirmed:v11] ^ 1;
    v19[0] = v11;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    [v9 markSuggestions:v13 confirmed:v12 wantsSound:1];

    [v7 setConfirmed:v12];
    [(PXPeopleBootstrapConfirmationViewController *)self setHasSelectionEverChanged:1];
  }
}

- (void)_noSuggestionsFound
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (![(PXPeopleBootstrapConfirmationViewController *)self suggestionsPresented])
  {
    id v3 = PLUIGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[PXPeopleBootstrapConfirmationViewController _noSuggestionsFound]";
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEBUG, "Bootstrap UI: %s", (uint8_t *)&v5, 0xCu);
    }

    uint64_t v4 = [(PXPeopleBootstrapConfirmationViewController *)self loadingDelayTimer];
    [v4 invalidate];

    [(PXPeopleBootstrapConfirmationViewController *)self setLoadingDelayTimer:0];
    [(PXPeopleBootstrapConfirmationViewController *)self setViewState:5];
  }
}

- (void)_markSkippedSuggestions
{
  id v14 = [(PXPeopleBootstrapConfirmationViewController *)self presentationStatuses];
  id v3 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [v14 objectAtIndexedSubscript:v5];
      uint64_t v7 = [v6 integerValue];

      if (v7 == 3) {
        [v4 addIndex:v5];
      }
      ++v5;
    }
    while (v5 < [v3 count]);
  }
  id v8 = [v3 objectsAtIndexes:v4];
  char v9 = [(PXPeopleBootstrapConfirmationViewController *)self bootstrapContext];
  long long v10 = [v9 nameSelection];
  long long v11 = [v10 person];

  if (v11) {
    id v12 = (id)[v8 arrayByAddingObject:v11];
  }
  double v13 = [(PXPeopleBootstrapConfirmationViewController *)self suggestionManager];
  [v13 markSuggestionsAsSkipped:v8];
}

- (void)_evaluateIfSuggestionPresentationFinished
{
  id v3 = [(PXPeopleBootstrapConfirmationViewController *)self presentationStatuses];
  if (([v3 containsObject:&unk_1F02D96B8] & 1) == 0
    && ([v3 containsObject:&unk_1F02D96D0] & 1) == 0
    && ![(PXPeopleBootstrapConfirmationViewController *)self suggestionsPresented])
  {
    [(PXPeopleBootstrapConfirmationViewController *)self _finishedPresentingSuggestions];
  }
}

- (void)_finishedPresentingSuggestions
{
  id v3 = [(PXPeopleBootstrapConfirmationViewController *)self loadingDelayTimer];
  [v3 invalidate];

  [(PXPeopleBootstrapConfirmationViewController *)self setLoadingDelayTimer:0];
  id v4 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  uint64_t v5 = [v4 count];

  if (v5) {
    [(PXPeopleBootstrapConfirmationViewController *)self setViewState:1];
  }
  else {
    [(PXPeopleBootstrapConfirmationViewController *)self _noSuggestionsFound];
  }
  [(PXPeopleBootstrapConfirmationViewController *)self setSuggestionsPresented:1];
}

- (void)_updateViewWithViewState:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id v4 = [(PXPeopleBootstrapConfirmationViewController *)self actionDelegate];
      [v4 setAdvanceButtonEnabled:1];

      [(PXPeopleBootstrapConfirmationViewController *)self _updateNavigationBarForCurrentTraitCollection];
      break;
    case 5uLL:
      id v5 = [(PXPeopleBootstrapConfirmationViewController *)self actionDelegate];
      [v5 setAdvanceButtonEnabled:1];

      break;
    case 2uLL:
      [(PXPeopleBootstrapConfirmationViewController *)self _badgeLoadingCells];
      break;
  }
}

- (void)setViewState:(unint64_t)a3
{
  if ([(PXPeopleBootstrapConfirmationViewController *)self viewState] != a3)
  {
    self->_viewState = a3;
    [(PXPeopleBootstrapConfirmationViewController *)self _updateViewWithViewState:a3];
  }
}

- (NSArray)presentationStatuses
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
  uint64_t v6 = [(PXPeopleBootstrapConfirmationViewController *)self _sortedIndexPathsForVisibleCells];
  uint64_t v7 = [v3 count];
  if ([v6 count] == v7)
  {
    id v17 = v3;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = [v5 cellForItemAtIndexPath:*(void *)(*((void *)&v18 + 1) + 8 * i)];
          id v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "presentationStatus"));
          [v4 addObject:v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    id v3 = v17;
  }
  else
  {
    for (; v7; --v7)
      [v4 addObject:&unk_1F02D96B8];
  }
  double v15 = (void *)[v4 copy];

  return (NSArray *)v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  id v4 = a3;
  [(PXPeopleBootstrapConfirmationViewController *)&v9 traitCollectionDidChange:v4];
  [(PXPeopleBootstrapConfirmationViewController *)self _updateNavigationBarForCurrentTraitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  uint64_t v6 = [(PXPeopleBootstrapConfirmationViewController *)self traitCollection];
  uint64_t v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    id v8 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
    [v8 reloadData];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  id v7 = a4;
  -[PXPeopleBootstrapConfirmationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__PXPeopleBootstrapConfirmationViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5DD2A68;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __98__PXPeopleBootstrapConfirmationViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionViewLayout];
  [v1 invalidateLayout];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  [(PXPeopleBootstrapConfirmationViewController *)&v8 viewWillDisappear:a3];
  id v4 = [(PXPeopleBootstrapConfirmationViewController *)self suggestionManager];
  id v5 = [v4 dataSource];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"PXPeopleSuggestionManagerKeyFaceUpdateNotification" object:0];

    [v5 stopListeningForLibraryChanges];
  }
  if (([(PXPeopleBootstrapConfirmationViewController *)self isBeingDismissed] & 1) != 0
    || [(PXPeopleBootstrapConfirmationViewController *)self isMovingFromParentViewController])
  {
    id v7 = [(PXPeopleBootstrapConfirmationViewController *)self configControllerDelegate];
    [v7 viewControllerWillBePopped:self];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  [(PXPeopleBootstrapConfirmationViewController *)&v11 viewWillAppear:a3];
  id v4 = [(PXPeopleBootstrapConfirmationViewController *)self suggestionManager];
  id v5 = [v4 dataSource];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel_keyFaceUpdated_ name:@"PXPeopleSuggestionManagerKeyFaceUpdateNotification" object:0];

    [v5 startListeningForLibraryChanges];
  }
  [(PXPeopleBootstrapConfirmationViewController *)self _cacheCurrentSuggestions];
  [(PXPeopleBootstrapConfirmationViewController *)self setWillAppear:1];
  id v7 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  uint64_t v8 = [v7 count];

  if (v8) {
    [(PXPeopleBootstrapConfirmationViewController *)self _evaluateIfSuggestionPresentationFinished];
  }
  unint64_t v9 = [(PXPeopleBootstrapConfirmationViewController *)self viewState];
  if (v9 != 1)
  {
    if (v9 == 4) {
      [(PXPeopleBootstrapConfirmationViewController *)self _startLoadingTimer];
    }
    uint64_t v10 = [(PXPeopleBootstrapConfirmationViewController *)self actionDelegate];
    [v10 setAdvanceButtonEnabled:0];
  }
  [(PXPeopleBootstrapConfirmationViewController *)self _updateHeaderContent];
  [(PXPeopleBootstrapConfirmationViewController *)self _updateNavigationBarForCurrentTraitCollection];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  [(PXPeopleBootstrapConfirmationViewController *)&v12 viewDidLoad];
  id v3 = [(PXPeopleBootstrapConfirmationViewController *)self view];
  [v3 bounds];
  -[PXPeopleBootstrapConfirmationViewController setLastSize:](self, "setLastSize:", v4, v5);
  uint64_t v6 = [(PXPeopleBootstrapConfirmationViewController *)self collectionView];
  id v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v6 setBackgroundColor:v7];

  [v6 setAllowsMultipleSelection:1];
  [v6 setContentInsetAdjustmentBehavior:0];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PXPeopleBootstrapCell"];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"PXPeopleBootstrapHeader"];
  [v6 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2760] withReuseIdentifier:@"PXPeopleBootstrapFooter"];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
  [v6 addInteraction:v8];
  unint64_t v9 = [(PXPeopleBootstrapConfirmationViewController *)self viewState];
  if (v9) {
    [(PXPeopleBootstrapConfirmationViewController *)self _updateViewWithViewState:v9];
  }
  [(PXPeopleBootstrapConfirmationViewController *)self _updateNavigationBarForCurrentTraitCollection];
  uint64_t v10 = [(PXPeopleBootstrapConfirmationViewController *)self currentSuggestions];
  objc_super v11 = [v10 firstObject];
  objc_msgSend((id)objc_opt_class(), "px_loadRepresentativeFacesForPersons:", v10);
}

- (void)dealloc
{
  id v3 = [(PXPeopleBootstrapConfirmationViewController *)self bootstrapContext];
  [v3 removeObserver:self forKeyPath:@"nameSelection"];

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  [(PXPeopleBootstrapConfirmationViewController *)&v4 dealloc];
}

- (PXPeopleBootstrapConfirmationViewController)initWithContext:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  objc_msgSend(v9, "setSectionInset:", 0.0, 5.0, 5.0, 5.0);
  [v9 setMinimumLineSpacing:5.0];
  [v9 setMinimumInteritemSpacing:5.0];
  v17.receiver = self;
  v17.super_class = (Class)PXPeopleBootstrapConfirmationViewController;
  uint64_t v10 = [(PXPeopleBootstrapConfirmationViewController *)&v17 initWithCollectionViewLayout:v9];
  objc_super v11 = v10;
  if (v10)
  {
    v10->_viewState = 0;
    objc_super v12 = [PXPeopleSuggestionManager alloc];
    double v13 = [v7 sourcePerson];
    uint64_t v14 = [(PXPeopleSuggestionManager *)v12 initWithPerson:v13];
    suggestionManager = v11->_suggestionManager;
    v11->_suggestionManager = (PXPeopleSuggestionManager *)v14;

    [(PXPeopleSuggestionManager *)v11->_suggestionManager setMute:1];
    [(PXPeopleSuggestionManager *)v11->_suggestionManager setDelegate:v11];
    v11->_type = [v7 bootstrapType];
    v11->_willAppear = 0;
    objc_storeStrong((id *)&v11->_bootstrapContext, a3);
    if (objc_opt_respondsToSelector()) {
      [v8 setInitialPageLimit:9];
    }
    [(PXPeopleSuggestionManager *)v11->_suggestionManager setDataSource:v8];
    [v7 addObserver:v11 forKeyPath:@"nameSelection" options:0 context:0];
  }

  return v11;
}

@end