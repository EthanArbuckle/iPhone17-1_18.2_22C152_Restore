@interface PXCMMViewController
- (BOOL)_canPresentComposeRecipientViewController;
- (BOOL)_shouldShowActionMenu;
- (BOOL)_shouldShowDismissButton;
- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 dismissViewController:(id)a5 completionHandler:(id)a6;
- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 presentViewController:(id)a5;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)didSetUpNavigationItem;
- (BOOL)isLoadingPeopleSuggestions;
- (BOOL)shouldShowAddMoreButtonForAssetsViewController:(id)a3;
- (BOOL)showTitleInNavigationBar;
- (NSArray)layoutConstraints;
- (NSProgress)actionProgress;
- (PXCMMActionControllerDelegate)actionDelegate;
- (PXCMMAssetsViewController)assetsViewController;
- (PXCMMSession)session;
- (PXCMMSpecManager)specManager;
- (PXCMMViewController)initWithCoder:(id)a3;
- (PXCMMViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXCMMViewController)initWithSession:(id)a3;
- (PXCMMViewControllerDelegate)delegate;
- (PXMoviePresenter)moviePresenter;
- (PXOneUpPresentation)oneUpPresentation;
- (PXPhotoDetailsActionMenuController)activeActionMenuController;
- (PXUpdater)updater;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIBarButtonItem)actionMenuButtonItem;
- (UIBarButtonItem)progressButton;
- (UINavigationBar)standaloneNavigationBar;
- (id)_actionMenu;
- (id)_localizedSelectionTitle;
- (id)_menuController;
- (id)_shareCMMMenuItemForMomentShareURL:(id)a3 title:(id)a4;
- (id)completeMyMomentViewController:(id)a3 performActionForSession:(id)a4;
- (id)effectiveNavigationItem;
- (int64_t)positionForBar:(id)a3;
- (void)_activateNotificationSuppressionIfNecessary;
- (void)_completePeopleSuggestionsLoading;
- (void)_deactivateNotificationSuppressionIfNecessary;
- (void)_dismissViewControllerWithCompletionHandler:(id)a3;
- (void)_handleActionButton;
- (void)_handleComposeRecipientCancelButton:(id)a3;
- (void)_performCancel;
- (void)_presentComposeRecipientViewController;
- (void)_presentViewController:(id)a3;
- (void)_setNeedsUpdate;
- (void)_setupNavigationItem;
- (void)_startPreloadingTasksIfNeeded;
- (void)_updateActionProgress;
- (void)_updateComponentViewController:(id)a3 frame:(CGRect)a4;
- (void)_updateComponentsViewControllerLayout;
- (void)_updateStyle;
- (void)_updateTitle;
- (void)actionMenu:(id)a3 actionPerformer:(id)a4 didChangeState:(unint64_t)a5;
- (void)actionMenu:(id)a3 assetCollectionActionPerformer:(id)a4 playMovieForAssetCollection:(id)a5;
- (void)closeButtonTapped:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)didPerformDeletionActionForAssetsViewController:(id)a3;
- (void)didTapAddMoreButtonForAssetsViewController:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)ppt_setSelecting:(BOOL)a3;
- (void)setActionDelegate:(id)a3;
- (void)setActionMenuButtonItem:(id)a3;
- (void)setActionProgress:(id)a3;
- (void)setActiveActionMenuController:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSetUpNavigationItem:(BOOL)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setLoadingPeopleSuggestions:(BOOL)a3;
- (void)setMoviePresenter:(id)a3;
- (void)setProgressButton:(id)a3;
- (void)setShowTitleInNavigationBar:(BOOL)a3;
- (void)setStandaloneNavigationBar:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PXCMMViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moviePresenter, 0);
  objc_storeStrong((id *)&self->_activeActionMenuController, 0);
  objc_storeStrong((id *)&self->_actionMenuButtonItem, 0);
  objc_storeStrong((id *)&self->_progressButton, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_actionProgress, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_assetsViewController, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_standaloneNavigationBar, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
}

- (void)setMoviePresenter:(id)a3
{
}

- (PXMoviePresenter)moviePresenter
{
  return self->_moviePresenter;
}

- (BOOL)isLoadingPeopleSuggestions
{
  return self->_loadingPeopleSuggestions;
}

- (void)setActiveActionMenuController:(id)a3
{
}

- (PXPhotoDetailsActionMenuController)activeActionMenuController
{
  return self->_activeActionMenuController;
}

- (void)setActionMenuButtonItem:(id)a3
{
}

- (UIBarButtonItem)actionMenuButtonItem
{
  return self->_actionMenuButtonItem;
}

- (void)setProgressButton:(id)a3
{
}

- (UIBarButtonItem)progressButton
{
  return self->_progressButton;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (NSProgress)actionProgress
{
  return self->_actionProgress;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setDidSetUpNavigationItem:(BOOL)a3
{
  self->_didSetUpNavigationItem = a3;
}

- (BOOL)didSetUpNavigationItem
{
  return self->_didSetUpNavigationItem;
}

- (void)setShowTitleInNavigationBar:(BOOL)a3
{
  self->_showTitleInNavigationBar = a3;
}

- (BOOL)showTitleInNavigationBar
{
  return self->_showTitleInNavigationBar;
}

- (PXCMMAssetsViewController)assetsViewController
{
  return self->_assetsViewController;
}

- (void)setLayoutConstraints:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setStandaloneNavigationBar:(id)a3
{
}

- (UINavigationBar)standaloneNavigationBar
{
  return self->_standaloneNavigationBar;
}

- (PXCMMSpecManager)specManager
{
  return self->_specManager;
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (void)setActionDelegate:(id)a3
{
}

- (PXCMMActionControllerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (PXCMMActionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXCMMViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCMMViewControllerDelegate *)WeakRetained;
}

- (PXCMMSession)session
{
  return self->_session;
}

- (void)ppt_setSelecting:(BOOL)a3
{
  v4 = [(PXCMMViewController *)self session];
  v5 = [v4 viewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PXCMMViewController_ppt_setSelecting___block_invoke;
  v6[3] = &__block_descriptor_33_e33_v16__0___PXCMMMutableViewModel__8l;
  BOOL v7 = a3;
  [v5 performChanges:v6];
}

uint64_t __40__PXCMMViewController_ppt_setSelecting___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelecting:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return 1;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  if ((void *)PXProgressFinishedObservationContext_105927 == a6
    || PXProgressCancelledObservationContext_105928 == (void)a6)
  {
    v19[1] = (id)MEMORY[0x1E4F143A8];
    v19[2] = (id)3221225472;
    v19[3] = __70__PXCMMViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v19[4] = &unk_1E5DD32D0;
    objc_copyWeak(&v20, &location);
    px_dispatch_on_main_queue();
  }
  if ((void *)PXProgressFractionCompletedObservationContext_105929 == a6)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __70__PXCMMViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v18 = &unk_1E5DD32D0;
    objc_copyWeak(v19, &location);
    px_dispatch_on_main_queue();
  }
  v14.receiver = self;
  v14.super_class = (Class)PXCMMViewController;
  [(PXCMMViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  objc_destroyWeak(&location);
}

void __70__PXCMMViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained updater];
  [v1 setNeedsUpdateOf:sel__updateActionProgress];
}

void __70__PXCMMViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained updater];
  [v1 setNeedsUpdateOf:sel__updateActionProgress];
}

- (void)actionMenu:(id)a3 assetCollectionActionPerformer:(id)a4 playMovieForAssetCollection:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  BOOL v7 = [(PXCMMViewController *)self moviePresenter];
  id v8 = v6;
  if (!v7)
  {
    BOOL v7 = +[PXMoviePresenter moviePresenterWithPresentingViewController:self];
    [(PXCMMViewController *)self setMoviePresenter:v7];
  }
  [v7 presentMovieViewControllerForAssetCollection:v8 keyAssetFetchResult:0 preferredTransitionType:1];
  v9 = (void *)MEMORY[0x1E4F56658];
  uint64_t v10 = *MEMORY[0x1E4F56548];
  v16[0] = v8;
  uint64_t v11 = *MEMORY[0x1E4F56560];
  v15[0] = v10;
  v15[1] = v11;
  id v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v16[1] = v13;
  objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v9 sendEvent:@"com.apple.photos.CPAnalytics.assetCollectionMoviePlayed" withPayload:v14];
}

- (void)actionMenu:(id)a3 actionPerformer:(id)a4 didChangeState:(unint64_t)a5
{
  if (a5 == 20)
  {
    uint64_t v18 = v5;
    uint64_t v19 = v6;
    id v8 = objc_msgSend(a4, "actionType", a3);
    if ([v8 isEqualToString:@"PXAssetCollectionActionTypeTrashMomentShare"])
    {
      v9 = [(PXCMMViewController *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v9 didCancelCompleteMyMomentViewController:self];
      }
    }
    else if ([v8 isEqualToString:@"PXAssetCollectionActionTypeCreateMemory"])
    {
      uint64_t v10 = [(PXCMMViewController *)self session];
      uint64_t v11 = [v10 viewModel];

      id v12 = (void *)MEMORY[0x1E4F1CA80];
      v13 = [v11 disabledActionTypes];
      objc_super v14 = [v12 setWithSet:v13];

      [v14 addObject:@"PXAssetCollectionActionTypeCreateMemory"];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __65__PXCMMViewController_actionMenu_actionPerformer_didChangeState___block_invoke;
      void v16[3] = &unk_1E5DCCFD0;
      id v17 = v14;
      id v15 = v14;
      [v11 performChanges:v16];
    }
  }
}

uint64_t __65__PXCMMViewController_actionMenu_actionPerformer_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDisabledActionTypes:*(void *)(a1 + 32)];
}

- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 dismissViewController:(id)a5 completionHandler:(id)a6
{
  return 1;
}

- (BOOL)actionMenu:(id)a3 actionPerformer:(id)a4 presentViewController:(id)a5
{
  return 1;
}

- (void)_dismissViewControllerWithCompletionHandler:(id)a3
{
}

- (void)_presentViewController:(id)a3
{
  id v6 = a3;
  v4 = [v6 popoverPresentationController];
  if (v4)
  {
    uint64_t v5 = [(PXCMMViewController *)self actionMenuButtonItem];
    if (v5) {
      [v4 setBarButtonItem:v5];
    }
    [v4 setDelegate:self];
  }
  [(PXCMMViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (id)completeMyMomentViewController:(id)a3 performActionForSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXCMMViewController *)self actionDelegate];
  v9 = [v8 completeMyMomentViewController:v7 performActionForSession:v6];

  return v9;
}

- (void)didPerformDeletionActionForAssetsViewController:(id)a3
{
  id v4 = [(PXCMMViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 didCancelCompleteMyMomentViewController:self];
  }
}

- (void)didTapAddMoreButtonForAssetsViewController:(id)a3
{
  id v5 = [(PXCMMViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(PXCMMViewController *)self session];
    [v5 completeMyMomentViewController:self showPhotoPickerForSession:v4];
  }
}

- (BOOL)shouldShowAddMoreButtonForAssetsViewController:(id)a3
{
  id v4 = [(PXCMMViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  id v6 = [(PXCMMViewController *)self session];
  uint64_t v7 = [v6 activityType];

  return v5 & (v7 == 1);
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  objc_initWeak(&location, self);
  if ((void *)PXSpecManagerObservationContext_105940 == a5)
  {
    if (v6)
    {
      v16[1] = (id)MEMORY[0x1E4F143A8];
      v16[2] = (id)3221225472;
      void v16[3] = __52__PXCMMViewController_observable_didChange_context___block_invoke;
      void v16[4] = &unk_1E5DD32D0;
      objc_copyWeak(&v17, &location);
      px_dispatch_on_main_queue();
    }
  }
  else if ((void *)PXViewModelObservationContext_105941 == a5)
  {
    if ((*(void *)&v6 & 0x10600) != 0)
    {
      v15[1] = (id)MEMORY[0x1E4F143A8];
      void v15[2] = (id)3221225472;
      v15[3] = __52__PXCMMViewController_observable_didChange_context___block_invoke_2;
      v15[4] = &unk_1E5DD32D0;
      objc_copyWeak(v16, &location);
      px_dispatch_on_main_queue();
    }
  }
  else if ((void *)PXMomentShareStatusPresentationObservationContext_105942 == a5)
  {
    if ((v6 & 0x3000) != 0)
    {
      v14[1] = (id)MEMORY[0x1E4F143A8];
      v14[2] = (id)3221225472;
      v14[3] = __52__PXCMMViewController_observable_didChange_context___block_invoke_3;
      v14[4] = &unk_1E5DD32D0;
      objc_copyWeak(v15, &location);
      px_dispatch_on_main_queue();
    }
  }
  else
  {
    if ((void *)PXPeopleSuggestionManagerObservationContext_105943 == a5)
    {
      objc_copyWeak(v14, &location);
      px_dispatch_on_main_queue();
    }
    if ((void *)PXDataSourceManagerObservationContext_105944 == a5)
    {
      uint64_t v11 = [(PXCMMViewController *)self session];
      id v12 = [v11 dataSourceManager];
      v13 = [v12 dataSource];

      if ([v13 numberOfSections] <= 0) {
        px_dispatch_on_main_queue();
      }
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXCMMViewController.m" lineNumber:718 description:@"unknown observation context"];
    }
  }
  objc_destroyWeak(&location);
}

void __52__PXCMMViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateStyle];
}

void __52__PXCMMViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained updater];
  [v1 setNeedsUpdateOf:sel__updateTitle];
}

void __52__PXCMMViewController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained updater];
  [v1 setNeedsUpdateOf:sel__updateActionProgress];
}

void __52__PXCMMViewController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained session];
  id v6 = [v3 peopleSuggestionsDataSourceManager];

  id v4 = [v6 dataSource];
  if ([v4 numberOfItemsInSection:0] >= 1)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 _completePeopleSuggestionsLoading];
  }
}

void __52__PXCMMViewController_observable_didChange_context___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 didCancelCompleteMyMomentViewController:*(void *)(a1 + 32)];
  }
}

- (void)_handleComposeRecipientCancelButton:(id)a3
{
}

- (void)_handleActionButton
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(PXCMMViewController *)self _canPresentComposeRecipientViewController])
  {
    id v4 = [(PXCMMViewController *)self session];
    id v5 = [v4 peopleSuggestionsDataSourceManager];

    if ([v5 isLoading])
    {
      [v5 boostLoading];
      [v5 registerChangeObserver:self context:PXPeopleSuggestionManagerObservationContext_105943];
      [(PXCMMViewController *)self setLoadingPeopleSuggestions:1];
      id v6 = +[PXCompleteMyMomentSettings sharedInstance];
      [v6 peopleSuggestionsTimeout];
      double v8 = v7;

      id v9 = PLSharingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        double v21 = v8;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEBUG, "PXCMMViewController: People Suggestions Loading in Progress(Timeout=%f)", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PXCMMViewController__handleActionButton__block_invoke;
      block[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v19, (id *)buf);
      dispatch_after(v10, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(PXCMMViewController *)self _presentComposeRecipientViewController];
    }
  }
  else
  {
    uint64_t v11 = [(PXCMMViewController *)self actionDelegate];

    if (!v11)
    {
      objc_super v14 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = (objc_class *)objc_opt_class();
      uint64_t v16 = NSStringFromClass(v15);
      [v14 handleFailureInMethod:a2, self, @"PXCMMViewController.m", 666, @"actionDelegate in %@ is nil, save action will not work.", v16 object file lineNumber description];
    }
    id v12 = [(PXCMMViewController *)self actionDelegate];
    v13 = [(PXCMMViewController *)self session];
    id v17 = [v12 completeMyMomentViewController:self performActionForSession:v13];

    [(PXCMMViewController *)self setActionProgress:v17];
  }
}

void __42__PXCMMViewController__handleActionButton__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _completePeopleSuggestionsLoading];
}

- (void)setLoadingPeopleSuggestions:(BOOL)a3
{
  if (self->_loadingPeopleSuggestions != a3)
  {
    self->_loadingPeopleSuggestions = a3;
    id v4 = [(PXCMMViewController *)self session];
    id v5 = [v4 viewModel];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__PXCMMViewController_setLoadingPeopleSuggestions___block_invoke;
    v6[3] = &__block_descriptor_33_e33_v16__0___PXCMMMutableViewModel__8l;
    BOOL v7 = a3;
    [v5 performChanges:v6];
  }
}

uint64_t __51__PXCMMViewController_setLoadingPeopleSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLoadingPeopleSuggestions:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_completePeopleSuggestionsLoading
{
  [(PXCMMViewController *)self setLoadingPeopleSuggestions:0];
  v3 = [(PXCMMViewController *)self session];
  id v4 = [v3 peopleSuggestionsDataSourceManager];

  [v4 unregisterChangeObserver:self context:PXPeopleSuggestionManagerObservationContext_105943];
  [(PXCMMViewController *)self _presentComposeRecipientViewController];
}

- (void)_presentComposeRecipientViewController
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [PXCMMComposeRecipientViewController alloc];
  id v4 = [(PXCMMViewController *)self session];
  id v5 = [(PXCMMComposeRecipientViewController *)v3 initWithSession:v4];

  [(PXCMMComposeRecipientViewController *)v5 setActionDelegate:self];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];
  BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleComposeRecipientCancelButton_];
  double v8 = [v6 viewControllers];
  id v9 = [v8 firstObject];
  dispatch_time_t v10 = [v9 navigationItem];
  [v10 setLeftBarButtonItem:v7];

  [v6 setModalPresentationStyle:2];
  [(PXCMMViewController *)self presentViewController:v6 animated:1 completion:0];
  uint64_t v11 = (void *)MEMORY[0x1E4F56658];
  uint64_t v15 = *MEMORY[0x1E4F56560];
  id v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v16[0] = v13;
  objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v11 sendEvent:@"com.apple.photos.CPAnalytics.cmmSuggestionComposeFlowOpened" withPayload:v14];
}

- (BOOL)_canPresentComposeRecipientViewController
{
  id v2 = [(PXCMMViewController *)self session];
  uint64_t v3 = [v2 activityType];
  if ([v2 sourceType]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3 == 1;
  }
  BOOL v5 = v4;

  return v5;
}

- (void)_updateStyle
{
  id v6 = [(PXCMMViewController *)self specManager];
  uint64_t v3 = [v6 spec];
  BOOL v4 = [v3 reviewBackgroundColor];
  BOOL v5 = [(PXCMMViewController *)self viewIfLoaded];
  [v5 setBackgroundColor:v4];
}

- (void)_updateActionProgress
{
  id v17 = [(PXCMMViewController *)self actionProgress];
  if (v17)
  {
    uint64_t v3 = [(PXCMMViewController *)self effectiveNavigationItem];
    if ([v17 isFinished] & 1) != 0 || (objc_msgSend(v17, "isCancelled"))
    {
      BOOL v4 = [(PXCMMViewController *)self activityIndicatorView];
      [v4 stopAnimating];

      [v3 setRightBarButtonItem:0];
      uint64_t v5 = 0;
    }
    else
    {
      id v9 = [(PXCMMViewController *)self activityIndicatorView];

      if (!v9)
      {
        dispatch_time_t v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        [(PXCMMViewController *)self setActivityIndicatorView:v10];
      }
      uint64_t v11 = [(PXCMMViewController *)self progressButton];

      if (!v11)
      {
        id v12 = objc_alloc(MEMORY[0x1E4FB14A8]);
        v13 = [(PXCMMViewController *)self activityIndicatorView];
        objc_super v14 = (void *)[v12 initWithCustomView:v13];
        [(PXCMMViewController *)self setProgressButton:v14];
      }
      uint64_t v15 = [(PXCMMViewController *)self activityIndicatorView];
      [v15 startAnimating];

      uint64_t v16 = [(PXCMMViewController *)self progressButton];
      [v3 setRightBarButtonItem:v16];

      uint64_t v5 = 1;
    }
    [(PXCMMAssetsViewController *)self->_assetsViewController setActionInProgress:v5];
  }
  else
  {
    id v6 = [(PXCMMViewController *)self activityIndicatorView];
    [v6 stopAnimating];

    BOOL v7 = [(PXCMMViewController *)self session];
    uint64_t v8 = [v7 activityType];

    if (v8 == 2) {
      [(PXCMMAssetsViewController *)self->_assetsViewController setActionInProgress:(unint64_t)([(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentation state] - 3) < 2];
    }
  }
}

- (void)_updateTitle
{
  uint64_t v3 = [(PXCMMViewController *)self session];
  BOOL v4 = [v3 viewModel];

  if ([v4 isSelecting])
  {
    id v6 = [(PXCMMViewController *)self _localizedSelectionTitle];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v5 = [(PXCMMViewController *)self effectiveNavigationItem];
  [v5 setTitle:v6];
}

- (id)_localizedSelectionTitle
{
  id v2 = [(PXCMMViewController *)self session];
  uint64_t v3 = [v2 viewModel];
  BOOL v4 = [v3 selectionManager];
  uint64_t v5 = [v4 selectionSnapshot];

  id v6 = [v5 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [v5 dataSource];
    uint64_t v8 = [v7 photosDataSource];
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v9 = [v5 selectedIndexPaths];
  dispatch_time_t v10 = v9;
  if (v8 && [v9 count] >= 1)
  {
    uint64_t v11 = [v8 assetsAtIndexPaths:v10];
    PXLocalizedSelectionMessageForAssets(v11);
  }
  id v12 = PXLocalizedStringFromTable(@"PXPhotosDetailsBarSelectItemsTitle", @"PhotosUICore");

  return v12;
}

- (void)_updateComponentsViewControllerLayout
{
  uint64_t v3 = [(PXCMMViewController *)self view];
  [v3 bounds];

  BOOL v4 = [(PXCMMViewController *)self standaloneNavigationBar];
  [v4 bounds];

  uint64_t v5 = [(PXCMMViewController *)self standaloneNavigationBar];
  [v5 bounds];

  [(PXCMMViewController *)self assetsViewController];
  objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1E4FB1BA8] mainScreen];
  [(id)objc_claimAutoreleasedReturnValue() scale];
  PXRectRoundToPixel();
}

- (void)_setNeedsUpdate
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMViewController.m", 509, @"%s must be called on the main thread", "-[PXCMMViewController _setNeedsUpdate]");
  }
  id v5 = [(PXCMMViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (void)_updateComponentViewController:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  if (v9)
  {
    id v14 = v9;
    dispatch_time_t v10 = [v9 parentViewController];

    if (!v10)
    {
      [(PXCMMViewController *)self addChildViewController:v14];
      uint64_t v11 = [(PXCMMViewController *)self view];
      id v12 = [v14 view];
      [v11 addSubview:v12];

      [v14 didMoveToParentViewController:self];
    }
    v13 = [v14 view];
    objc_msgSend(v13, "setFrame:", x, y, width, height);

    id v9 = v14;
  }
}

- (id)_shareCMMMenuItemForMomentShareURL:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.up"];
  id v9 = (void *)MEMORY[0x1E4FB13F0];
  dispatch_time_t v10 = PXLocalizedStringFromTable(@"PXCompleteMyMomentShareActionMenuTitle", @"PhotosUICore");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __64__PXCMMViewController__shareCMMMenuItemForMomentShareURL_title___block_invoke;
  v15[3] = &unk_1E5DC6948;
  id v16 = v6;
  id v17 = v7;
  uint64_t v18 = self;
  id v11 = v7;
  id v12 = v6;
  v13 = [v9 actionWithTitle:v10 image:v8 identifier:0 handler:v15];

  return v13;
}

void __64__PXCMMViewController__shareCMMMenuItemForMomentShareURL_title___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F9F2E8];
  id v4 = a2;
  id v5 = [v3 alloc];
  v20[0] = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v7 = (void *)[v5 initWithActivityItems:v6 applicationActivities:0];

  uint64_t v8 = [v4 sender];

  id v9 = [v7 popoverPresentationController];
  [v9 setBarButtonItem:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F309F8]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  [v11 setTitle:*(void *)(a1 + 40)];
  [v11 setOriginalURL:*(void *)(a1 + 32)];
  id v12 = PXLocalizedStringFromTable(@"PXCMMSharingHeaderSubtitleCloudLink", @"PhotosUICore");
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v12];
  [v10 setStatus:v13];

  id v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"link.icloud"];
  uint64_t v15 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  id v16 = [v14 imageWithSymbolConfiguration:v15];

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v16];
  [v11 setSpecialization:v10];
  id v19 = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  [v11 setAlternateImages:v18];

  [v7 setPhotosHeaderMetadata:v11];
  [*(id *)(a1 + 48) presentViewController:v7 animated:1 completion:0];
}

- (id)_actionMenu
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = [(PXCMMViewController *)self session];
  uint64_t v5 = [v4 activityType];
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    id v9 = 0;
    id v19 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = v5;
  id v7 = v4;
  if (!v7)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    [v21 handleFailureInMethod:a2, self, @"PXCMMViewController.m", 432, @"%@ should be an instance inheriting from %@, but it is nil", @"session", v23 object file lineNumber description];
LABEL_20:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v24);
    v25 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v21 handleFailureInMethod:a2, self, @"PXCMMViewController.m", 432, @"%@ should be an instance inheriting from %@, but it is %@", @"session", v23, v25 object file lineNumber description];

    goto LABEL_20;
  }
LABEL_4:
  uint64_t v8 = [v7 momentShare];
  id v9 = [v8 shareURL];
  id v10 = PLSharingGetLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = objc_msgSend(v9, "pl_redactedShareURL");
      *(_DWORD *)buf = 134218242;
      uint64_t v28 = v6;
      __int16 v29 = 2114;
      v30 = v12;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEFAULT, "CMM activity type is %ld, which means we are sharing an existing CMM link: %{public}@", buf, 0x16u);
    }
    id v7 = [(PXCMMViewController *)self _menuController];
    v13 = [(PXCMMViewController *)self session];
    id v14 = [v13 viewModel];
    uint64_t v8 = [v14 title];

    id v11 = [(PXCMMViewController *)self _shareCMMMenuItemForMomentShareURL:v9 title:v8];
    v26 = v11;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
    id v16 = [v7 actions];
    id v17 = [v15 arrayByAddingObjectsFromArray:v16];

    uint64_t v18 = PLSharingGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "Preparing a UIActivityViewController for sharing the CMM link", buf, 2u);
    }

    id v19 = [MEMORY[0x1E4FB1970] menuWithChildren:v17];
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v6;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "CMM activity type is %ld, which means we should have an existing CMM link, but it is nil.", buf, 0xCu);
    }
    id v9 = 0;
    id v19 = 0;
  }

LABEL_15:
  return v19;
}

- (id)_menuController
{
  uint64_t v3 = [(PXCMMViewController *)self activeActionMenuController];

  if (!v3)
  {
    id v4 = [(PXCMMViewController *)self session];
    uint64_t v5 = [v4 viewModel];
    uint64_t v6 = [v5 selectionManager];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = objc_alloc((Class)off_1E5DA84B0);
      id v10 = [v4 dataSourceManager];
      id v8 = (id)[v9 initWithDataSourceManager:v10];
    }
    id v11 = [[PXPhotoDetailsActionMenuController alloc] initWithSelectionManager:v8 displayTitleInfo:0 blockActionManager:0];
    id v12 = [v5 disabledActionTypes];
    [(PXActionMenuController *)v11 setDisabledActionTypes:v12];

    v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"PXAssetCollectionActionTypeMomentShare", @"PXAssetCollectionActionTypeFavorite", @"PXAssetCollectionActionTypeDeleteMemory", 0);
    [(PXActionMenuController *)v11 setExcludedActionTypes:v13];
    [(PXPhotoDetailsActionMenuController *)v11 setDelegate:self];
    [(PXCMMViewController *)self setActiveActionMenuController:v11];
  }
  return [(PXCMMViewController *)self activeActionMenuController];
}

- (void)_performCancel
{
  id v4 = [(PXCMMViewController *)self actionProgress];
  id v7 = v4;
  if (v4)
  {
    if (([v4 isCancellable] & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"PXCMMViewController.m", 397, @"Invalid parameter not satisfying: %@", @"actionProgress.isCancellable" object file lineNumber description];
    }
    [v7 cancel];
    [(PXCMMViewController *)self setActivityIndicatorView:0];
    [(PXCMMViewController *)self setProgressButton:0];
  }
  uint64_t v5 = [(PXCMMViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didCancelCompleteMyMomentViewController:self];
  }
}

- (BOOL)_shouldShowDismissButton
{
  id v2 = [(PXCMMViewController *)self presentingViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_shouldShowActionMenu
{
  id v2 = [(PXCMMViewController *)self session];
  char v3 = [v2 hideActionMenu] ^ 1;

  return v3;
}

- (void)closeButtonTapped:(id)a3
{
}

- (id)effectiveNavigationItem
{
  char v3 = [(PXCMMViewController *)self presentingViewController];

  if (v3)
  {
    id v4 = [(PXCMMViewController *)self navigationController];
    uint64_t v5 = [v4 topViewController];
    uint64_t v6 = [v5 navigationItem];
  }
  else
  {
    uint64_t v6 = [(PXCMMViewController *)self navigationItem];
  }
  return v6;
}

- (void)_setupNavigationItem
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(PXCMMViewController *)self didSetUpNavigationItem])
  {
    [(PXCMMViewController *)self setDidSetUpNavigationItem:1];
    char v3 = [(PXCMMViewController *)self effectiveNavigationItem];
    [v3 setLargeTitleDisplayMode:2];
    objc_msgSend(v3, "px_setBackButtonDisplayMode:", 2);
    id v4 = [(PXCMMViewController *)self session];
    uint64_t v5 = [v4 viewModel];
    uint64_t v6 = [v5 title];
    [v3 setBackButtonTitle:v6];

    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    if ([(PXCMMViewController *)self _shouldShowActionMenu])
    {
      id v8 = [(PXCMMViewController *)self _actionMenu];
      if (v8)
      {
        id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle.fill"];
        id v10 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
        id v11 = [v9 imageWithSymbolConfiguration:v10];

        id v12 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v11 menu:v8];
        actionMenuButtonItem = self->_actionMenuButtonItem;
        self->_actionMenuButtonItem = v12;

        [v7 addObject:self->_actionMenuButtonItem];
      }
      else
      {
        id v14 = [(PXCMMViewController *)self session];
        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }

        id v16 = [v15 momentShare];
        id v17 = PLSharingGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          int v19 = 138412290;
          id v20 = v16;
          _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "Could not create a menu of actions for CMM: %@. Skipping the ••• action menu", (uint8_t *)&v19, 0xCu);
        }
      }
    }
    if ([(PXCMMViewController *)self _shouldShowDismissButton])
    {
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel_closeButtonTapped_];
      [v7 insertObject:v18 atIndex:0];
    }
    [v3 setRightBarButtonItems:v7];
    [(PXCMMViewController *)self _updateTitle];
  }
}

- (void)updateViewConstraints
{
  v22[3] = *MEMORY[0x1E4F143B8];
  char v3 = [(PXCMMViewController *)self standaloneNavigationBar];

  if (v3)
  {
    id v4 = [(PXCMMViewController *)self layoutConstraints];

    if (v4)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v6 = [(PXCMMViewController *)self layoutConstraints];
      [v5 deactivateConstraints:v6];
    }
    id v7 = [(PXCMMViewController *)self standaloneNavigationBar];
    int v19 = [v7 topAnchor];
    id v20 = [(PXCMMViewController *)self view];
    uint64_t v18 = [v20 topAnchor];
    [(UIViewController *)self px_safeAreaInsets];
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18);
    v22[0] = v17;
    id v16 = [v7 leftAnchor];
    id v8 = [(PXCMMViewController *)self view];
    id v9 = [v8 leftAnchor];
    id v10 = [v16 constraintEqualToAnchor:v9];
    v22[1] = v10;
    id v11 = [v7 rightAnchor];
    id v12 = [(PXCMMViewController *)self view];
    v13 = [v12 rightAnchor];
    id v14 = [v11 constraintEqualToAnchor:v13];
    v22[2] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];

    [MEMORY[0x1E4F28DC8] activateConstraints:v15];
    [(PXCMMViewController *)self setLayoutConstraints:v15];
  }
  v21.receiver = self;
  v21.super_class = (Class)PXCMMViewController;
  [(PXCMMViewController *)&v21 updateViewConstraints];
}

- (void)setActionProgress:(id)a3
{
  uint64_t v5 = (NSProgress *)a3;
  p_actionProgress = &self->_actionProgress;
  actionProgress = self->_actionProgress;
  if (actionProgress != v5)
  {
    id v9 = v5;
    [(NSProgress *)actionProgress removeObserver:self forKeyPath:@"finished" context:PXProgressFinishedObservationContext_105927];
    [(NSProgress *)*p_actionProgress removeObserver:self forKeyPath:@"fractionCompleted" context:PXProgressFractionCompletedObservationContext_105929];
    [(NSProgress *)*p_actionProgress removeObserver:self forKeyPath:@"cancelled" context:PXProgressCancelledObservationContext_105928];
    objc_storeStrong((id *)&self->_actionProgress, a3);
    [(NSProgress *)*p_actionProgress addObserver:self forKeyPath:@"finished" options:1 context:PXProgressFinishedObservationContext_105927];
    [(NSProgress *)*p_actionProgress addObserver:self forKeyPath:@"fractionCompleted" options:1 context:PXProgressFractionCompletedObservationContext_105929];
    [(NSProgress *)*p_actionProgress addObserver:self forKeyPath:@"cancelled" options:1 context:PXProgressCancelledObservationContext_105928];
    id v8 = [(PXCMMViewController *)self updater];
    [v8 setNeedsUpdateOf:sel__updateActionProgress];

    uint64_t v5 = v9;
  }
}

- (void)_startPreloadingTasksIfNeeded
{
  if (!self->_hasStartedPreloadingTasks)
  {
    self->_hasStartedPreloadingTasks = 1;
    id v5 = [(PXCMMViewController *)self session];
    char v3 = [v5 peopleSuggestionsDataSourceManager];
    [v3 startLoading];

    id v4 = [(PXCMMViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 startPreloadingTasksForCompleteMyMomentViewController:self];
    }
  }
}

- (void)_deactivateNotificationSuppressionIfNecessary
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)MEMORY[0x1E4FB2608];
  char v3 = [(id)*MEMORY[0x1E4FB2608] notificationSuppressionContextManager];
  id v4 = [v3 notificationSuppressionContexts];

  if ([v4 count])
  {
    id v5 = PLSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Clearing CMM suppression contexts %@", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v6 = [*v2 notificationSuppressionContextManager];
    [v6 setNotificationSuppressionContexts:0];
  }
}

- (void)_activateNotificationSuppressionIfNecessary
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v3 = [(PXCMMViewController *)self session];
  if ([v3 sourceType] != 1)
  {
    id v4 = [(PXCMMViewController *)self session];
    id v5 = [v4 notificationSuppressionContexts];

    if ([v5 count])
    {
      uint64_t v6 = PLSharingGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        uint64_t v9 = v5;
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Adding CMM suppression contexts %@", (uint8_t *)&v8, 0xCu);
      }

      int v7 = [(id)*MEMORY[0x1E4FB2608] notificationSuppressionContextManager];
      [v7 setNotificationSuppressionContexts:v5];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMViewController;
  [(PXCMMViewController *)&v4 viewDidDisappear:a3];
  [(PXCMMViewController *)self _deactivateNotificationSuppressionIfNecessary];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXCMMViewController;
  [(PXCMMViewController *)&v9 viewDidAppear:a3];
  objc_super v4 = [(PXCMMViewController *)self session];
  if (!objc_msgSend(v4, "ppt_presentComposeRecipientView")) {
    goto LABEL_4;
  }
  BOOL v5 = [(PXCMMViewController *)self _canPresentComposeRecipientViewController];

  if (v5)
  {
    objc_super v4 = [(PXCMMViewController *)self session];
    objc_msgSend(v4, "ppt_delay");
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PXCMMViewController_viewDidAppear___block_invoke;
    block[3] = &unk_1E5DD36F8;
    void block[4] = self;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
LABEL_4:
  }
  [(PXCMMViewController *)self _startPreloadingTasksIfNeeded];
  [(PXCMMViewController *)self _activateNotificationSuppressionIfNecessary];
}

uint64_t __37__PXCMMViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleActionButton];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMViewController;
  [(PXCMMViewController *)&v4 viewWillAppear:a3];
  [(PXCMMViewController *)self _setupNavigationItem];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMViewController;
  [(PXCMMViewController *)&v4 viewDidLayoutSubviews];
  char v3 = [(PXCMMViewController *)self updater];
  [v3 updateIfNeeded];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  BOOL v5 = [(PXCMMViewController *)self view];
  [v5 setNeedsUpdateConstraints];

  double v6 = [(PXCMMViewController *)self updater];
  [v6 setNeedsUpdateOf:sel__updateComponentsViewControllerLayout];
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PXCMMViewController;
  [(PXCMMViewController *)&v17 viewDidLoad];
  [(UIViewController *)self px_enableExtendedTraitCollection];
  char v3 = [(PXCMMViewController *)self session];
  uint64_t v4 = [v3 sourceType];

  [(UIViewController *)self px_enableBarAppearance];
  BOOL v5 = [(UIViewController *)self px_barAppearance];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __34__PXCMMViewController_viewDidLoad__block_invoke;
  v15[3] = &__block_descriptor_33_e34_v16__0___PXMutableBarAppearance__8l;
  BOOL v16 = v4 == 0;
  [v5 performChangesWithAnimationOptions:0 changes:v15];

  [(UIViewController *)self px_enableOneUpPresentation];
  double v6 = [(UIViewController *)self px_oneUpPresentation];
  oneUpPresentation = self->_oneUpPresentation;
  self->_oneUpPresentation = v6;

  int v8 = [(UIViewController *)self px_extendedTraitCollection];
  objc_super v9 = [[PXCMMSpecManager alloc] initWithExtendedTraitCollection:v8 activityType:[(PXCMMSession *)self->_session activityType]];
  specManager = self->_specManager;
  self->_specManager = v9;

  [(PXCMMSpecManager *)self->_specManager registerChangeObserver:self context:PXSpecManagerObservationContext_105940];
  id v11 = [(PXFeatureSpecManager *)self->_specManager spec];
  id v12 = [v11 reviewBackgroundColor];
  v13 = [(PXCMMViewController *)self view];
  [v13 setBackgroundColor:v12];

  id v14 = [(PXCMMViewController *)self updater];
  [v14 setNeedsUpdateOf:sel__updateComponentsViewControllerLayout];
}

void __34__PXCMMViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPrefersNavigationBarVisible:1];
  [v3 setPrefersToolbarVisible:0];
  [v3 setPrefersTabBarVisible:*(unsigned __int8 *)(a1 + 32)];
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXCMMViewController;
  -[PXCMMViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  if (!a3) {
    [(PXCMMViewController *)self _performCancel];
  }
}

- (void)dealloc
{
  [(NSProgress *)self->_actionProgress removeObserver:self forKeyPath:@"finished" context:PXProgressFinishedObservationContext_105927];
  [(NSProgress *)self->_actionProgress removeObserver:self forKeyPath:@"fractionCompleted" context:PXProgressFractionCompletedObservationContext_105929];
  [(NSProgress *)self->_actionProgress removeObserver:self forKeyPath:@"cancelled" context:PXProgressCancelledObservationContext_105928];
  v3.receiver = self;
  v3.super_class = (Class)PXCMMViewController;
  [(PXCMMViewController *)&v3 dealloc];
}

- (PXCMMViewController)initWithSession:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXCMMViewController.m", 130, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)PXCMMViewController;
  objc_super v7 = [(PXCMMViewController *)&v19 initWithNibName:0 bundle:0];
  int v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_session, a3);
    objc_super v9 = [v6 viewModel];
    [v9 registerChangeObserver:v8 context:PXViewModelObservationContext_105941];

    uint64_t v10 = [v6 dataSourceManager];
    [v10 registerChangeObserver:v8 context:PXDataSourceManagerObservationContext_105944];

    uint64_t v11 = [v6 momentShareStatusPresentationWithPresentationStyle:2];
    momentShareStatusPresentation = v8->_momentShareStatusPresentation;
    v8->_momentShareStatusPresentation = (PXMomentShareStatusPresentation *)v11;

    [(PXMomentShareStatusPresentation *)v8->_momentShareStatusPresentation registerChangeObserver:v8 context:PXMomentShareStatusPresentationObservationContext_105942];
    uint64_t v13 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v8];
    updater = v8->_updater;
    v8->_updater = (PXUpdater *)v13;

    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateComponentsViewControllerLayout];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateActionProgress];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateTitle];
    [(PXUpdater *)v8->_updater setNeedsUpdateSelector:sel__setNeedsUpdate];
    id v15 = [[PXCMMAssetsViewController alloc] initWithSession:v6];
    assetsViewController = v8->_assetsViewController;
    v8->_assetsViewController = v15;

    [(PXCMMAssetsViewController *)v8->_assetsViewController setDelegate:v8];
  }

  return v8;
}

- (PXCMMViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMViewController.m", 126, @"%s is not available as initializer", "-[PXCMMViewController initWithCoder:]");

  abort();
}

- (PXCMMViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMViewController.m", 122, @"%s is not available as initializer", "-[PXCMMViewController initWithNibName:bundle:]");

  abort();
}

@end