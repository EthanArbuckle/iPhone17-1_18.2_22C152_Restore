@interface PXCMMAssetsViewController
- (BOOL)_areAllNotCopiedAssetsSelected;
- (BOOL)_isAssetAlreadyImportedAtIndexPath:(PXSimpleIndexPath *)a3;
- (BOOL)_isAssetAlreadyImportedAtIndexPath:(PXSimpleIndexPath *)a3 withEngineDrivenLayout:(id)a4;
- (BOOL)_shouldShowDefaultOneUpActions;
- (BOOL)_shouldShowProgressBanner;
- (BOOL)_shouldShowStatusPlaceholder;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)engineDrivenLayout:(id)a3 shouldShowDimmingOverlayAtIndexPath:(PXSimpleIndexPath *)a4;
- (BOOL)engineDrivenLayout:(id)a3 shouldShowStatusBadgeAtIndexPath:(PXSimpleIndexPath *)a4;
- (BOOL)isActionInProgress;
- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4;
- (BOOL)swipeSelectionManager:(id)a3 shouldSelectItemAtIndexPath:(PXSimpleIndexPath *)a4;
- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3;
- (BOOL)userSelectionEnabled;
- (CGRect)engineDrivenLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5;
- (CGSize)_maximumThumbnailSize;
- (NSSet)_hiddenAssetReferences;
- (PXActionManager)assetActionManager;
- (PXAssetReference)_focusedAssetReference;
- (PXBoopableItemsProvider)boopableItemsProvider;
- (PXCMMAssetsViewController)initWithSession:(id)a3;
- (PXCMMAssetsViewControllerDelegate)delegate;
- (PXOneUpPresentation)_oneUpPresentation;
- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4;
- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4 kind:(UIEdgeInsets)a5;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (UIEdgeInsets)contentInset;
- (double)_bannerHeightFromReferenceSize:(CGSize)a3;
- (double)_headerHeightFromReferenceSize:(CGSize)a3 insets:(UIEdgeInsets)a4;
- (double)_progressBannerViewLayoutHeight;
- (double)_statusFooterHeightFromReferenceSize:(CGSize)a3 insets:(UIEdgeInsets)a4;
- (double)engineDrivenLayout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4;
- (id)_assetActionManagerWithSelectionManager:(id)a3;
- (id)_assetReferenceAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4;
- (id)_createAddButton;
- (id)_createBannerTileController;
- (id)_createNewLayout;
- (id)_createNewLayoutGeneratorWithReferenceSize:(CGSize)a3;
- (id)_createOverlayTileView;
- (id)_createPosterTileController;
- (id)_createSectionHeaderController;
- (id)_createSelectionManagerWithAssetReference:(id)a3;
- (id)_createStatusBadgeTileView;
- (id)_createStatusFooter;
- (id)_createStatusPlaceholderTileView;
- (id)_indexPathsForAssetReferences:(id)a3 inDataSource:(id)a4;
- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4;
- (id)assetsScene:(id)a3 transitionAnimationCoordinatorForChange:(id)a4;
- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 presentingScrollViewForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4;
- (id)oneUpPresentationActionManager:(id)a3;
- (id)oneUpPresentationActionManagerForPreviewing:(id)a3;
- (id)oneUpPresentationDataSourceManager:(id)a3;
- (id)oneUpPresentationImportStatusManager:(id)a3;
- (id)oneUpPresentationInitialAssetReference:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (id)presentationEnvironmentForStatusController:(id)a3;
- (int64_t)_assetImportStateAtIndexPath:(PXSimpleIndexPath *)a3 withDataSource:(id)a4;
- (int64_t)_layoutType;
- (int64_t)engineDrivenLayout:(id)a3 assetStatusAtIndexPath:(PXSimpleIndexPath *)a4;
- (int64_t)oneUpPresentationActionContext:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (unint64_t)_additionalTileCount;
- (void)_configureBannerTile:(id)a3;
- (void)_configureLayout:(id)a3;
- (void)_deselectAllAssets;
- (void)_handleLongPress:(id)a3;
- (void)_handleSpaceBar:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_invalidateLayoutGenerator;
- (void)_performInitialSelectionIfNeeded;
- (void)_performTilingChangeWithoutAnimationTransition:(id)a3;
- (void)_scheduleLayout;
- (void)_selectAllAssets;
- (void)_selectCuratedAssets;
- (void)_selectNonCopiedAssets;
- (void)_selectionModeDidChange;
- (void)_setHiddenAssetReferences:(id)a3;
- (void)_setLayoutType:(int64_t)a3;
- (void)_toggleAssetSelectionAtIndexPath:(PXSimpleIndexPath *)a3;
- (void)_transitionLayoutGesture:(id)a3;
- (void)_updateAssetsScene;
- (void)_updateGestures;
- (void)_updateLayoutEngine;
- (void)_updatePlaceholder;
- (void)_updateProgressBannerViewConstraints;
- (void)_updateProgressBannerViewVisibility;
- (void)_updateSelectionEnabled;
- (void)_updateSelectionIfNeeded;
- (void)_updateStyle;
- (void)addButtonTapped:(id)a3;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)didTapActionButtonInBannerTileController:(id)a3;
- (void)engineDrivenLayoutReferenceSizeDidChange:(id)a3;
- (void)invalidateBoopableItemsProvider;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4;
- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4;
- (void)progressBannerView:(id)a3 dismissViewController:(id)a4;
- (void)progressBannerView:(id)a3 presentViewController:(id)a4;
- (void)progressBannerViewLayoutHeightDidChange:(id)a3;
- (void)setActionInProgress:(BOOL)a3;
- (void)setBoopableItemsProvider:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setUserSelectionEnabled:(BOOL)a3;
- (void)set_hiddenAssetReferences:(id)a3;
- (void)set_layoutType:(int64_t)a3;
- (void)statusController:(id)a3 configurationDidChange:(id)a4;
- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXCMMAssetsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->__hiddenAssetReferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inUseTiles, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentationForPoster, 0);
  objc_storeStrong((id *)&self->_measuringBannerTile, 0);
  objc_storeStrong((id *)&self->_measuringStatusFooterView, 0);
  objc_storeStrong((id *)&self->_statusFooterViewModel, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentationForFooter, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_layoutTransitionGesture, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_tapSelectionGesture, 0);
  objc_storeStrong((id *)&self->_cmmStatusController, 0);
  objc_storeStrong((id *)&self->_statusController, 0);
  objc_storeStrong((id *)&self->_progressBannerViewConstraints, 0);
  objc_storeStrong((id *)&self->_progressBannerView, 0);
  objc_storeStrong((id *)&self->_sceneController, 0);
  objc_storeStrong((id *)&self->_tilingController, 0);
  objc_storeStrong((id *)&self->_tileAnimator, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_layoutEngine, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

- (void)setBoopableItemsProvider:(id)a3
{
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (BOOL)userSelectionEnabled
{
  return self->_userSelectionEnabled;
}

- (void)set_hiddenAssetReferences:(id)a3
{
}

- (NSSet)_hiddenAssetReferences
{
  return self->__hiddenAssetReferences;
}

- (void)set_layoutType:(int64_t)a3
{
  self->__layoutType = a3;
}

- (int64_t)_layoutType
{
  return self->__layoutType;
}

- (BOOL)isActionInProgress
{
  return self->_actionInProgress;
}

- (PXCMMAssetsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXCMMAssetsViewControllerDelegate *)WeakRetained;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return 1;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  return 1;
}

- (PXActionManager)assetActionManager
{
  v3 = [(PXCMMAssetsViewController *)self _focusedAssetReference];
  if (v3)
  {
    v4 = [(PXCMMAssetsViewController *)self _createSelectionManagerWithAssetReference:v3];
    v5 = [(PXCMMAssetsViewController *)self _assetActionManagerWithSelectionManager:v4];
  }
  else
  {
    v5 = 0;
  }

  return (PXActionManager *)v5;
}

- (void)invalidateBoopableItemsProvider
{
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  v3 = [(PXCMMComponentViewController *)self session];
  v4 = [v3 viewModel];
  int v5 = [v4 selectionEnabled];

  if (v5)
  {
    v6 = [(PXCMMAssetsViewController *)self boopableItemsProvider];

    if (!v6)
    {
      v7 = objc_alloc_init(PXBoopableItemsProvider);
      [(PXCMMAssetsViewController *)self setBoopableItemsProvider:v7];

      v8 = [(PXCMMComponentViewController *)self session];
      v9 = [v8 viewModel];
      v10 = [v9 selectionManager];
      v11 = [(PXCMMAssetsViewController *)self boopableItemsProvider];
      [v11 setSelectionManager:v10];

      v12 = [(PXCMMComponentViewController *)self session];
      v13 = [v12 mediaProvider];
      v14 = [(PXCMMAssetsViewController *)self boopableItemsProvider];
      [v14 setImagePreviewMediaProvider:v13];
    }
    v15 = [(PXCMMAssetsViewController *)self boopableItemsProvider];
  }
  else
  {
    v15 = 0;
  }
  return (UIActivityItemsConfigurationReading *)v15;
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5) {
    [(PXCMMAssetsViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else {
    [(PXCMMAssetsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)didTapActionButtonInBannerTileController:(id)a3
{
  v4 = [(PXCMMComponentViewController *)self session];
  uint64_t v5 = [v4 activityType];

  if (v5 == 2) {
    self->_receivingActionButtonWasTapped = 1;
  }
  id v6 = [(PXCMMAssetsViewController *)self delegate];
  [v6 assetsViewControllerDidTapActionButton:self];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXCMMViewModelObservationContext_243532 == a5)
  {
    id v13 = v9;
    if ((v6 & 0x600) != 0)
    {
      [(PXCMMAssetsViewController *)self _selectionModeDidChange];
      id v9 = v13;
    }
    if ((v6 & 0x1000) == 0) {
      goto LABEL_15;
    }
    [(PXCMMAssetsViewController *)self _updatePlaceholder];
LABEL_13:
    [(PXCMMAssetsViewController *)self _updateProgressBannerViewVisibility];
    goto LABEL_14;
  }
  if ((void *)PXMomentShareStatusPresentationObservationContext_243533 == a5)
  {
    if ((v6 & 0x2000) == 0) {
      goto LABEL_15;
    }
    id v13 = v9;
    [(PXCMMAssetsViewController *)self _updateSelectionEnabled];
    goto LABEL_13;
  }
  if ((void *)PXSpecManagerObservationContext_243534 == a5)
  {
    if (v6)
    {
      id v13 = v9;
      v10 = [(PXFeatureSpecManager *)self->_specManager spec];
      spec = self->_spec;
      self->_spec = v10;

      [(PXCMMAssetsViewController *)self _updateStyle];
      [(PXCMMAssetsViewController *)self _invalidateLayoutGenerator];
      goto LABEL_14;
    }
  }
  else
  {
    if ((void *)PXSelectionManagerObservationContext_243535 != a5)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXCMMAssetsViewController.m" lineNumber:1817 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 2) != 0)
    {
      id v13 = v9;
      [(PXCMMAssetsViewController *)self _updateSelectionIfNeeded];
LABEL_14:
      id v9 = v13;
    }
  }
LABEL_15:
}

- (id)presentationEnvironmentForStatusController:(id)a3
{
  return +[PXViewControllerPresenter defaultPresenterWithViewController:self];
}

- (void)statusController:(id)a3 configurationDidChange:(id)a4
{
  sceneController = self->_sceneController;
  id v5 = a4;
  __int16 v6 = [(PXAssetsScene *)sceneController viewTileReusePool];
  v7 = [v6 checkOutReusableObjectWithReuseIdentifier:8870950];

  id v9 = v7;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v9;
  }
  else {
    id v8 = 0;
  }

  [v8 setConfiguration:v5];
}

- (BOOL)_shouldShowStatusPlaceholder
{
  if (!self->_momentShareStatusPresentationForFooter) {
    return 0;
  }
  v2 = [(PXCMMComponentViewController *)self session];
  v3 = [v2 viewModel];
  char v4 = [v3 shouldShowPlaceholder];

  return v4;
}

- (void)progressBannerView:(id)a3 dismissViewController:(id)a4
{
  objc_msgSend(a4, "presentingViewController", a3);
  id v5 = (PXCMMAssetsViewController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    [(PXCMMAssetsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)progressBannerView:(id)a3 presentViewController:(id)a4
{
}

- (void)progressBannerViewLayoutHeightDidChange:(id)a3
{
  [(PXCMMAssetsViewController *)self _updateProgressBannerViewConstraints];
  [(PXCMMAssetsViewController *)self _invalidateLayoutGenerator];
}

- (void)_updateProgressBannerViewConstraints
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PXCMMProgressBannerView *)self->_progressBannerView superview];
  v21 = [v3 safeAreaLayoutGuide];
  [(PXCMMProgressBannerView *)self->_progressBannerView layoutHeight];
  double v5 = v4;
  v20 = [(PXCMMProgressBannerView *)self->_progressBannerView topAnchor];
  v19 = [v21 bottomAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:-v5];
  v22[0] = v18;
  v17 = [(PXCMMProgressBannerView *)self->_progressBannerView leadingAnchor];
  v16 = [v3 leadingAnchor];
  __int16 v6 = [v17 constraintEqualToAnchor:v16];
  v22[1] = v6;
  v7 = [(PXCMMProgressBannerView *)self->_progressBannerView trailingAnchor];
  id v8 = [v3 trailingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  v22[2] = v9;
  v10 = [(PXCMMProgressBannerView *)self->_progressBannerView bottomAnchor];
  v11 = [v3 bottomAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v22[3] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];

  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_progressBannerViewConstraints];
  progressBannerViewConstraints = self->_progressBannerViewConstraints;
  self->_progressBannerViewConstraints = v13;
  v15 = v13;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_progressBannerViewConstraints];
}

- (void)_updateProgressBannerViewVisibility
{
  int v3 = [(PXCMMAssetsViewController *)self _shouldShowProgressBanner];
  if (v3 == [(PXCMMProgressBannerView *)self->_progressBannerView isHidden])
  {
    [(PXCMMProgressBannerView *)self->_progressBannerView setHidden:v3 ^ 1u];
    [(PXCMMAssetsViewController *)self _invalidateLayoutGenerator];
  }
}

- (double)_progressBannerViewLayoutHeight
{
  if (![(PXCMMAssetsViewController *)self _shouldShowProgressBanner]) {
    return 0.0;
  }
  progressBannerView = self->_progressBannerView;
  [(PXCMMProgressBannerView *)progressBannerView layoutHeight];
  return result;
}

- (BOOL)_shouldShowProgressBanner
{
  if (self->_momentShareStatusPresentationForFooter
    && ![(PXCMMAssetsViewController *)self _shouldShowStatusPlaceholder]
    && (unint64_t)([(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentationForFooter state]- 1) < 4)
  {
    return 1;
  }
  int v3 = +[PXCompleteMyMomentSettings sharedInstance];
  int v4 = [v3 showProgressBannerView];

  if (v4)
  {
    if (_shouldShowProgressBanner_predicate != -1) {
      dispatch_once(&_shouldShowProgressBanner_predicate, &__block_literal_global_405_243548);
    }
    return 1;
  }
  return 0;
}

void __54__PXCMMAssetsViewController__shouldShowProgressBanner__block_invoke()
{
  v0 = PLSharingGetLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A9AE7000, v0, OS_LOG_TYPE_DEFAULT, "Debug setting forced the progress banner to be visible", v1, 2u);
  }
}

- (int64_t)engineDrivenLayout:(id)a3 assetStatusAtIndexPath:(PXSimpleIndexPath *)a4
{
  __int16 v6 = [a3 dataSource];
  long long v7 = *(_OWORD *)&a4->item;
  v10[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v10[1] = v7;
  int64_t v8 = [(PXCMMAssetsViewController *)self _assetImportStateAtIndexPath:v10 withDataSource:v6];

  if ((unint64_t)(v8 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1AB35C2A8[v8 - 1];
  }
}

- (BOOL)engineDrivenLayout:(id)a3 shouldShowStatusBadgeAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6 = a3;
  long long v7 = [(PXCMMComponentViewController *)self session];
  if ([v7 activityType] == 2)
  {
    int64_t v8 = [v6 dataSource];
    long long v9 = *(_OWORD *)&a4->item;
    v17[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v17[1] = v9;
    int64_t v10 = [(PXCMMAssetsViewController *)self _assetImportStateAtIndexPath:v17 withDataSource:v8];

    v11 = [(PXCMMComponentViewController *)self session];
    v12 = [v11 viewModel];
    int v13 = [v12 isSelecting];

    uint64_t v14 = 2;
    if (!v13) {
      uint64_t v14 = 3;
    }
    BOOL v15 = v10 == v14;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)engineDrivenLayout:(id)a3 shouldShowDimmingOverlayAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6 = a3;
  long long v7 = [(PXCMMComponentViewController *)self session];
  if ([v7 activityType] == 2
    && ([v7 viewModel],
        int64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isSelecting],
        v8,
        v9))
  {
    int64_t v10 = [v6 dataSource];
    long long v11 = *(_OWORD *)&a4->item;
    v15[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v15[1] = v11;
    int64_t v12 = [(PXCMMAssetsViewController *)self _assetImportStateAtIndexPath:v15 withDataSource:v10];

    BOOL v13 = v12 == 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (CGRect)engineDrivenLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5
{
  long long v7 = [a3 dataSource];
  long long v8 = *(_OWORD *)&a4->item;
  v22[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v22[1] = v8;
  int v9 = [v7 assetAtItemIndexPath:v22];

  if (objc_opt_respondsToSelector())
  {
    [v9 bestCropRectForAspectRatio:a5];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    double v11 = *(double *)off_1E5DAB010;
    double v13 = *((double *)off_1E5DAB010 + 1);
    double v15 = *((double *)off_1E5DAB010 + 2);
    double v17 = *((double *)off_1E5DAB010 + 3);
  }

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)engineDrivenLayout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  double v5 = [a3 dataSource];
  long long v6 = *(_OWORD *)&a4->item;
  v11[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v11[1] = v6;
  long long v7 = [v5 assetAtItemIndexPath:v11];

  double v8 = 1.0;
  if (objc_opt_respondsToSelector())
  {
    [v7 aspectRatio];
    double v8 = v9;
  }

  return v8;
}

- (void)engineDrivenLayoutReferenceSizeDidChange:(id)a3
{
  id v9 = a3;
  id v4 = [(PXTilingController *)self->_tilingController targetLayout];

  double v5 = v9;
  if (v4 == v9)
  {
    [v9 referenceSize];
    double v5 = v9;
    if (self->_knownReferenceSize.width != v6 || self->_knownReferenceSize.height != v7)
    {
      self->_knownReferenceSize.width = v6;
      self->_knownReferenceSize.height = v7;
      [(PXCMMAssetsViewController *)self _invalidateLayoutGenerator];
      double v5 = v9;
    }
  }
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  double v7 = self->_sceneController;
  long long v8 = *(_OWORD *)&a4->index[5];
  long long v15 = *(_OWORD *)&a4->index[3];
  long long v16 = v8;
  long long v17 = *(_OWORD *)&a4->index[7];
  unint64_t v18 = a4->index[9];
  long long v9 = *(_OWORD *)&a4->index[1];
  long long v13 = *(_OWORD *)&a4->length;
  long long v14 = v9;
  if ([(PXAssetsScene *)v7 providesTileForIdentifier:&v13])
  {
    long long v10 = *(_OWORD *)&a4->index[5];
    long long v15 = *(_OWORD *)&a4->index[3];
    long long v16 = v10;
    long long v17 = *(_OWORD *)&a4->index[7];
    unint64_t v18 = a4->index[9];
    long long v11 = *(_OWORD *)&a4->index[1];
    long long v13 = *(_OWORD *)&a4->length;
    long long v14 = v11;
    [(PXUIAssetsScene *)v7 checkInTile:a3 withIdentifier:&v13];
  }
  else
  {
    double v12 = [(PXAssetsScene *)v7 viewTileReusePool];
    [v12 checkInReusableObject:a3];

    [(NSMutableSet *)self->_inUseTiles removeObject:a3];
  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7 = a4;
  long long v8 = self->_sceneController;
  long long v9 = *(_OWORD *)&a3->index[5];
  long long v26 = *(_OWORD *)&a3->index[3];
  long long v27 = v9;
  long long v28 = *(_OWORD *)&a3->index[7];
  unint64_t v29 = a3->index[9];
  long long v10 = *(_OWORD *)&a3->index[1];
  long long v24 = *(_OWORD *)&a3->length;
  long long v25 = v10;
  if (![(PXAssetsScene *)v8 providesTileForIdentifier:&v24])
  {
    uint64_t v14 = a3->index[0];
    if (v14 > 8439963)
    {
      switch(v14)
      {
        case 8439980:
          long long v15 = [(PXAssetsScene *)v8 viewTileReusePool];
          long long v16 = v15;
          uint64_t v17 = 8870944;
          break;
        case 8439981:
          unint64_t v18 = [(PXAssetsScene *)v8 viewTileReusePool];
          long long v13 = (void *)[v18 checkOutReusableObjectWithReuseIdentifier:8870947];

          [(PXCMMAssetsViewController *)self _configureBannerTile:v13];
          if (!v13) {
            goto LABEL_16;
          }
          goto LABEL_20;
        case 8439982:
          long long v15 = [(PXAssetsScene *)v8 viewTileReusePool];
          long long v16 = v15;
          uint64_t v17 = 8870948;
          break;
        case 8439983:
          goto LABEL_16;
        case 8439984:
          long long v15 = [(PXAssetsScene *)v8 viewTileReusePool];
          long long v16 = v15;
          uint64_t v17 = 8870950;
          break;
        default:
          if (v14 != 8439964) {
            goto LABEL_16;
          }
          long long v15 = [(PXAssetsScene *)v8 viewTileReusePool];
          long long v16 = v15;
          uint64_t v17 = 8870946;
          break;
      }
    }
    else
    {
      switch(v14)
      {
        case 8439952:
          long long v15 = [(PXAssetsScene *)v8 viewTileReusePool];
          long long v16 = v15;
          uint64_t v17 = 8870942;
          break;
        case 8439962:
          long long v15 = [(PXAssetsScene *)v8 viewTileReusePool];
          long long v16 = v15;
          uint64_t v17 = 8870943;
          break;
        case 8439963:
          long long v15 = [(PXAssetsScene *)v8 viewTileReusePool];
          long long v16 = v15;
          uint64_t v17 = 8870945;
          break;
        default:
LABEL_16:
          double v19 = [MEMORY[0x1E4F28B00] currentHandler];
          long long v20 = *(_OWORD *)&a3->index[5];
          long long v26 = *(_OWORD *)&a3->index[3];
          long long v27 = v20;
          long long v28 = *(_OWORD *)&a3->index[7];
          unint64_t v29 = a3->index[9];
          long long v21 = *(_OWORD *)&a3->index[1];
          long long v24 = *(_OWORD *)&a3->length;
          long long v25 = v21;
          v22 = PXTileIdentifierDescription((unint64_t *)&v24);
          [v19 handleFailureInMethod:a2, self, @"PXCMMAssetsViewController.m", 1571, @"%@ couldn't check out tile for identifier:%@, layout:%@", self, v22, v7 object file lineNumber description];

          long long v13 = 0;
          goto LABEL_21;
      }
    }
    long long v13 = (void *)[v15 checkOutReusableObjectWithReuseIdentifier:v17];

    if (v13)
    {
LABEL_20:
      [(NSMutableSet *)self->_inUseTiles addObject:v13];
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  long long v11 = *(_OWORD *)&a3->index[5];
  long long v26 = *(_OWORD *)&a3->index[3];
  long long v27 = v11;
  long long v28 = *(_OWORD *)&a3->index[7];
  unint64_t v29 = a3->index[9];
  long long v12 = *(_OWORD *)&a3->index[1];
  long long v24 = *(_OWORD *)&a3->length;
  long long v25 = v12;
  long long v13 = [(PXUIAssetsScene *)v8 checkOutTileForIdentifier:&v24 layout:v7];
  if (!v13) {
    goto LABEL_16;
  }
LABEL_21:

  return v13;
}

- (void)_configureBannerTile:(id)a3
{
  id v11 = a3;
  id v4 = [(PXCMMComponentViewController *)self session];
  uint64_t v5 = [v4 sourceType];
  uint64_t v6 = [v4 activityType];
  if (!v5 && v6 == 1)
  {
    id v7 = [v4 peopleSuggestionsPreviewDataSourceManager];
    long long v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v4 peopleSuggestionsDataSourceManager];
    }
    long long v10 = v9;

    [v11 setPeopleSuggestionsDataSourceManager:v10];
  }
}

- (id)assetsScene:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_layoutAnimationsGloballyDisabled)
  {
    id v7 = 0;
  }
  else
  {
    long long v8 = [a3 dataSourceManager];
    id v9 = [v8 changeHistory];
    id v7 = +[PXAssetsTileTransitionCoordinator transitionCoordinatorForChange:v6 changeHistory:v9];

    long long v10 = +[PXCompleteMyMomentSettings sharedInstance];
    LODWORD(v8) = [v10 sectionHeadersShouldFloat];

    if (v8)
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v11 = [v6 invalidationContexts];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v33;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v11);
            }
            long long v16 = [*(id *)(*((void *)&v32 + 1) + 8 * i) tag];
            char v17 = [v16 isEqualToString:@"PXCMMSectionHeaderTileGroupInvalidation"];

            if (v17)
            {

              [v7 disableAnimationsForTileKind:8439963];
              goto LABEL_14;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
LABEL_14:
    unint64_t v18 = +[PXCompleteMyMomentSettings sharedInstance];
    int v19 = [v18 showFloatingBanner];

    if (v19)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v20 = objc_msgSend(v6, "invalidationContexts", 0);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v29;
        while (2)
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v29 != v23) {
              objc_enumerationMutation(v20);
            }
            long long v25 = [*(id *)(*((void *)&v28 + 1) + 8 * j) tag];
            char v26 = [v25 isEqualToString:@"PXCMMBannerTileGroupInvalidationTag"];

            if (v26)
            {

              [v7 disableAnimationsForTileKind:8439981];
              goto LABEL_25;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v22) {
            continue;
          }
          break;
        }
      }
    }
LABEL_25:
    [v7 disableAnimationsForTileKind:8439964];
  }

  return v7;
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  id v5 = a4;
  [(PXCMMAssetsViewController *)self _updateLayoutEngine];
  id v6 = [(PXLayoutEngine *)self->_layoutEngine dataSourceSnapshot];
  uint64_t v7 = [v6 identifier];

  long long v8 = [(PXCMMComponentViewController *)self session];
  id v9 = [v8 dataSourceManager];
  long long v10 = [v9 changeHistory];
  id v11 = objc_msgSend(v10, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v7, objc_msgSend(v5, "identifier"));

  if ([v11 count] == 1)
  {
    uint64_t v12 = [v11 firstObject];
  }
  else
  {
    uint64_t v12 = 0;
  }
  layoutEngine = self->_layoutEngine;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __61__PXCMMAssetsViewController_assetsScene_layoutForDataSource___block_invoke;
  uint64_t v22 = &unk_1E5DC9FE8;
  id v23 = v5;
  id v24 = v12;
  id v14 = v12;
  id v15 = v5;
  id v16 = [(PXSectionedLayoutEngine *)layoutEngine performChangesAndWait:&v19];
  char v17 = [(PXCMMAssetsViewController *)self _createNewLayout];

  return v17;
}

uint64_t __61__PXCMMAssetsViewController_assetsScene_layoutForDataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDataSourceSnapshot:*(void *)(a1 + 32) withChangeDetails:*(void *)(a1 + 40)];
}

- (void)_updateLayoutEngine
{
}

void __48__PXCMMAssetsViewController__updateLayoutEngine__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  PXSizeScale();
}

- (double)_statusFooterHeightFromReferenceSize:(CGSize)a3 insets:(UIEdgeInsets)a4
{
  if (self->_momentShareStatusPresentationForFooter
    && ![(PXCMMAssetsViewController *)self _shouldShowStatusPlaceholder])
  {
    if (!self->_measuringStatusFooterView)
    {
      id v5 = [PXPhotosGlobalFooterView alloc];
      id v6 = -[PXPhotosGlobalFooterView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      measuringStatusFooterView = self->_measuringStatusFooterView;
      self->_measuringStatusFooterView = v6;

      [(PXPhotosGlobalFooterView *)self->_measuringStatusFooterView setViewModel:self->_statusFooterViewModel];
    }
    PXEdgeInsetsInsetSize();
  }
  return 0.0;
}

- (double)_bannerHeightFromReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = +[PXCompleteMyMomentSettings sharedInstance];
  int v7 = [v6 showFloatingBanner];

  double v8 = 0.0;
  if (v7)
  {
    momentShareStatusPresentationForPoster = self->_momentShareStatusPresentationForPoster;
    if (!momentShareStatusPresentationForPoster
      || (uint64_t v10 = [(PXMomentShareStatusPresentation *)momentShareStatusPresentationForPoster type]) != 0
      && (v10 != 1
       || ([(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentationForPoster state] & 0xFFFFFFFFFFFFFFFDLL) != 4
       && ![(PXCMMAssetsViewController *)self _shouldShowStatusPlaceholder]))
    {
      id v11 = [(PXCMMComponentViewController *)self session];
      measuringBannerTile = self->_measuringBannerTile;
      if (!measuringBannerTile)
      {
        uint64_t v13 = [PXCMMBannerTileController alloc];
        uint64_t v14 = [v11 activityType];
        uint64_t v15 = [v11 sourceType];
        id v16 = [v11 viewModel];
        char v17 = self->_momentShareStatusPresentationForPoster;
        unint64_t v18 = [v11 importStatusManager];
        uint64_t v19 = [(PXCMMBannerTileController *)v13 initWithActivityType:v14 sourceType:v15 viewModel:v16 momentShareStatusPresentation:v17 importStatusManager:v18];
        uint64_t v20 = self->_measuringBannerTile;
        self->_measuringBannerTile = v19;

        [(PXCMMAssetsViewController *)self _configureBannerTile:self->_measuringBannerTile];
        measuringBannerTile = self->_measuringBannerTile;
      }
      uint64_t v21 = [(PXCMMBannerTileController *)measuringBannerTile view];
      objc_msgSend(v21, "sizeThatFits:", width, height);
      double v8 = v22;
    }
  }
  return v8;
}

- (double)_headerHeightFromReferenceSize:(CGSize)a3 insets:(UIEdgeInsets)a4
{
  id v4 = +[PXCompleteMyMomentSettings sharedInstance];
  int v5 = [v4 showAttachedHeaderView];

  if (v5) {
    PXEdgeInsetsInsetSize();
  }
  return 0.0;
}

- (id)_createNewLayoutGeneratorWithReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = +[PXCompleteMyMomentSettings sharedInstance];
  if ([v6 showSectionHeaders])
  {
    BOOL v7 = [(PXCMMAssetsViewController *)self _shouldShowStatusPlaceholder];

    double v8 = 0.0;
    if (!v7)
    {
      [(PXCMMSpec *)self->_spec reviewSectionHeaderHeight];
      double v8 = v9;
    }
  }
  else
  {

    double v8 = 0.0;
  }
  int64_t v10 = [(PXCMMAssetsViewController *)self _layoutType];
  unint64_t v11 = [(PXCMMAssetsViewController *)self _additionalTileCount];
  [(PXCMMSpec *)self->_spec reviewGridItemSize];
  double v13 = v12;
  double v15 = v14;
  [(PXCMMSpec *)self->_spec reviewGridInterItemSpacing];
  double v17 = v16;
  double v19 = v18;
  [(PXCMMSpec *)self->_spec reviewGridContentInsets];
  return +[PXCMMLayoutGenerator layoutGeneratorForLayoutType:withReferenceSize:additionalTileCount:headerHeight:itemSize:interItemSpacing:contentInsets:](PXCMMLayoutGenerator, "layoutGeneratorForLayoutType:withReferenceSize:additionalTileCount:headerHeight:itemSize:interItemSpacing:contentInsets:", v10, v11, width, height, v8, v13, v15, v17, v19, v20, v21, v22, v23);
}

- (void)_configureLayout:(id)a3
{
  id v19 = a3;
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    double v17 = (objc_class *)objc_opt_class();
    double v16 = NSStringFromClass(v17);
    double v18 = objc_msgSend(v19, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PXCMMAssetsViewController.m", 1302, @"%@ should be an instance inheriting from %@, but it is %@", @"layout", v16, v18 object file lineNumber description];
  }
  else
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    double v15 = (objc_class *)objc_opt_class();
    double v16 = NSStringFromClass(v15);
    [v14 handleFailureInMethod:a2, self, @"PXCMMAssetsViewController.m", 1302, @"%@ should be an instance inheriting from %@, but it is nil", @"layout", v16 object file lineNumber description];
  }

LABEL_3:
  objc_msgSend(v19, "setPlaceholderMode:", -[PXCMMAssetsViewController _shouldShowStatusPlaceholder](self, "_shouldShowStatusPlaceholder"));
  objc_msgSend(v19, "setContentMode:", -[PXCMMSpec reviewGridContentMode](self->_spec, "reviewGridContentMode"));
  if (self->_userSelectionEnabled) {
    uint64_t v5 = 1025;
  }
  else {
    uint64_t v5 = 0;
  }
  [v19 setSelectionBadgeOptions:v5];
  [v19 setBadgeOptions:3];
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v7 = [v6 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  [v19 setHasFloatingBanner:!IsAccessibilityCategory];
  double v9 = +[PXCompleteMyMomentSettings sharedInstance];
  objc_msgSend(v19, "setHasFloatingSectionHeaders:", objc_msgSend(v9, "sectionHeadersShouldFloat"));

  [(PXCMMSpec *)self->_spec reviewContentInsets];
  [v19 setHeaderFooterSideInset:v10];
  [(PXCMMSpec *)self->_spec reviewHeaderTopInset];
  objc_msgSend(v19, "setHeaderTopInset:");
  [(PXCMMSpec *)self->_spec reviewFooterBottomInset];
  objc_msgSend(v19, "setFooterBottomInset:");
  [(PXCMMAssetsViewController *)self _progressBannerViewLayoutHeight];
  [(PXCMMSpec *)self->_spec reviewSafeAreaInsets];
  objc_msgSend(v19, "setReviewSafeAreaInsets:");
  unint64_t v11 = [(PXCMMAssetsViewController *)self _hiddenAssetReferences];
  double v12 = [v19 dataSource];
  double v13 = [(PXCMMAssetsViewController *)self _indexPathsForAssetReferences:v11 inDataSource:v12];

  [v19 setHiddenIndexPaths:v13];
}

- (id)_createNewLayout
{
  [(PXLayoutEngine *)self->_layoutEngine layoutSnapshot];
  if (!objc_claimAutoreleasedReturnValue())
  {
    id v4 = [(PXTilingController *)self->_tilingController targetLayout];
    uint64_t v5 = [v4 layoutSnapshot];

    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"PXCMMAssetsViewController.m" lineNumber:1278 description:@"The layout engine should always return a layoutSnapshot."];
    }
  }
  [(PXCMMSpec *)self->_spec reviewContentInsets];
  [(PXCMMSpec *)self->_spec reviewSafeAreaInsets];
  PXEdgeInsetsAdd();
}

- (void)_invalidateLayoutGenerator
{
  layoutGenerator = self->_layoutGenerator;
  self->_layoutGenerator = 0;

  layoutEngine = self->_layoutEngine;
  self->_layoutEngine = 0;

  updater = self->_updater;
  [(PXUpdater *)updater setNeedsUpdateOf:sel__updateLayoutEngine];
}

- (unint64_t)_additionalTileCount
{
  int v3 = +[PXCompleteMyMomentSettings sharedInstance];
  if ([v3 shouldShowInlineAddButton])
  {
    int64_t v4 = [(PXCMMAssetsViewController *)self _layoutType];

    if (v4 == 1 || !self->_delegateRespondsTo.shouldShowAddMoreButton) {
      return 0;
    }
    int v3 = [(PXCMMAssetsViewController *)self delegate];
    unint64_t v5 = [v3 shouldShowAddMoreButtonForAssetsViewController:self];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)_performTilingChangeWithoutAnimationTransition:(id)a3
{
  BOOL layoutAnimationsGloballyDisabled = self->_layoutAnimationsGloballyDisabled;
  self->_BOOL layoutAnimationsGloballyDisabled = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  [(PXScrollViewController *)self->_scrollViewController updateIfNeeded];
  self->_BOOL layoutAnimationsGloballyDisabled = layoutAnimationsGloballyDisabled;
}

- (void)_setLayoutType:(int64_t)a3
{
  if (self->__layoutType != a3)
  {
    self->__layoutType = a3;
    [(PXCMMAssetsViewController *)self _invalidateLayoutGenerator];
  }
}

- (id)oneUpPresentation:(id)a3 presentingScrollViewForAssetReference:(id)a4
{
  return [(PXUIScrollViewController *)self->_scrollViewController scrollView];
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(PXCMMComponentViewController *)self session];
  BOOL v7 = [v6 dataSourceManager];
  double v8 = [v7 dataSource];

  double v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = [v8 assetReferenceForAssetReference:*(void *)(*((void *)&v19 + 1) + 8 * v14)];
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  _OWORD v17[2] = __72__PXCMMAssetsViewController_oneUpPresentation_setHiddenAssetReferences___block_invoke;
  v17[3] = &unk_1E5DD32A8;
  v17[4] = self;
  id v18 = v9;
  id v16 = v9;
  [(PXCMMAssetsViewController *)self _performTilingChangeWithoutAnimationTransition:v17];
}

uint64_t __72__PXCMMAssetsViewController_oneUpPresentation_setHiddenAssetReferences___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHiddenAssetReferences:*(void *)(a1 + 40)];
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v5 = a4;
  [(PXScrollViewController *)self->_scrollViewController updateIfNeeded];
  id v6 = [(PXTilingController *)self->_tilingController currentLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [(PXTilingController *)self->_tilingController currentLayout];
  }
  else
  {
    BOOL v7 = 0;
  }

  memset(v22, 0, sizeof(v22));
  double v8 = [v7 dataSource];
  double v9 = v8;
  if (v8) {
    [v8 indexPathForAssetReference:v5];
  }
  else {
    memset(v22, 0, sizeof(v22));
  }

  if (*(void *)&v22[0] == *(void *)off_1E5DAAED8)
  {
    id v10 = 0;
  }
  else
  {
    tilingController = self->_tilingController;
    uint64_t v20 = 0;
    id v21 = 0;
    long long v14 = xmmword_1AB359AB0;
    uint64_t v15 = *(void *)&v22[0];
    long long v16 = *(_OWORD *)((char *)v22 + 8);
    uint64_t v17 = *((void *)&v22[1] + 1);
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = 0;
    if ([(PXTilingController *)tilingController getTile:&v21 geometry:0 group:0 userData:0 forTileWithIdentifier:&v14])
    {
      id v12 = v21;
      if ([v12 conformsToProtocol:&unk_1F0420FF8])
      {
        id v10 = [v12 image];
      }
      else
      {
        id v10 = 0;
      }
    }
  }

  return v10;
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v5 = a4;
  [(PXScrollViewController *)self->_scrollViewController updateIfNeeded];
  id v6 = [(PXTilingController *)self->_tilingController currentLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [(PXTilingController *)self->_tilingController currentLayout];
  }
  else
  {
    BOOL v7 = 0;
  }

  memset(v18, 0, sizeof(v18));
  double v8 = [v7 dataSource];
  double v9 = v8;
  if (v8) {
    [v8 indexPathForAssetReference:v5];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }

  if (*(void *)&v18[0] != *(void *)off_1E5DAAED8)
  {
    memset(v17, 0, sizeof(v17));
    long long v10 = xmmword_1AB359AB0;
    uint64_t v11 = *(void *)&v18[0];
    long long v12 = *(_OWORD *)((char *)v18 + 8);
    uint64_t v13 = *((void *)&v18[1] + 1);
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v16 = 0;
    if ([v7 getGeometry:v17 group:0 userData:0 forTileWithIdentifier:&v10])
    {
      [(PXUIScrollViewController *)self->_scrollViewController scrollView];
      [(id)objc_claimAutoreleasedReturnValue() bounds];
      [(PXScrollViewController *)self->_scrollViewController contentInset];
      PXEdgeInsetsInsetRect();
    }
  }
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  id v5 = a4;
  double v6 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v10 = [(PXCMMComponentViewController *)self session];
  uint64_t v11 = [v10 dataSourceManager];

  [(PXScrollViewController *)self->_scrollViewController updateIfNeeded];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v12 = [v11 dataSource];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 indexPathForAssetReference:v5];
  }
  else
  {
    long long v69 = 0u;
    long long v70 = 0u;
  }
  double v14 = *(double *)off_1E5DAB010;
  double v15 = *((double *)off_1E5DAB010 + 1);
  double v16 = *((double *)off_1E5DAB010 + 2);
  double v17 = *((double *)off_1E5DAB010 + 3);

  uint64_t v18 = v69;
  if ((void)v69 != *(void *)off_1E5DAAED8)
  {
    uint64_t v19 = *((void *)&v69 + 1);
    long long v20 = v70;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    tilingController = self->_tilingController;
    long long v45 = xmmword_1AB359AB0;
    long long v46 = v69;
    long long v47 = v70;
    long long v48 = 0u;
    long long v49 = 0u;
    *(void *)&long long v50 = 0;
    if ([(PXTilingController *)tilingController getTile:0 geometry:&v57 group:0 userData:0 forTileWithIdentifier:&v45])
    {
      double v7 = *((double *)&v57 + 1);
      double v6 = *(double *)&v57;
      double v9 = *((double *)&v58 + 1);
      double v8 = *(double *)&v58;
      double v14 = *((double *)&v66 + 1);
      double v16 = *((double *)&v67 + 1);
      double v15 = *(double *)&v67;
      double v17 = *(double *)&v68;
    }
    v72.origin.x = v6;
    v72.origin.y = v7;
    v72.size.double width = v8;
    v72.size.double height = v9;
    if (CGRectIsNull(v72))
    {
      id v37 = v5;
      long long v22 = [(PXAssetsScene *)self->_sceneController currentLayout];
      uint64_t v23 = v69;
      uint64_t v24 = [v22 dataSource];
      uint64_t v25 = [v24 identifier];

      if (v23 == v25)
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v38 = xmmword_1AB359AB0;
        uint64_t v39 = v18;
        uint64_t v40 = v19;
        long long v41 = v20;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v44 = 0;
        if ([v22 getGeometry:&v45 group:0 userData:0 forTileWithIdentifier:&v38])
        {
          char v26 = +[PXTilingCoordinateSpaceConverter defaultConverter];
          uint64_t v27 = [v22 coordinateSpaceIdentifier];
          long long v28 = [(PXTilingController *)self->_tilingController contentCoordinateSpaceIdentifier];
          objc_msgSend(v26, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v27, v28, v45, v46);
          double v6 = v29;
          double v7 = v30;
          double v8 = v31;
          double v9 = v32;
        }
      }
      id v5 = v37;
    }
  }
  v73.origin.x = v6;
  v73.origin.y = v7;
  v73.size.double width = v8;
  v73.size.double height = v9;
  if (CGRectIsNull(v73))
  {
    long long v33 = 0;
  }
  else
  {
    id v34 = objc_alloc((Class)off_1E5DA82B8);
    long long v35 = [(PXUIScrollViewController *)self->_scrollViewController contentCoordinateSpace];
    long long v33 = objc_msgSend(v34, "initWithRect:inCoordinateSpace:", v35, v6, v7, v8, v9);

    objc_msgSend(v33, "setImageContentsRect:", v14, v15, v16, v17);
  }

  return v33;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  return self->_navigatedAssetReference;
}

- (id)oneUpPresentationImportStatusManager:(id)a3
{
  int v3 = [(PXCMMComponentViewController *)self session];
  int64_t v4 = [v3 importStatusManager];

  return v4;
}

- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4
{
  int64_t v4 = [(PXCMMComponentViewController *)self session];
  id v5 = [v4 viewModel];
  char v6 = [v5 isSelecting] ^ 1;

  return v6;
}

- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4
{
  id v5 = a4;
  char v6 = +[PXCompleteMyMomentSettings sharedInstance];
  if ([v6 disableClickyOrb])
  {
    BOOL v7 = 0;
LABEL_6:

    goto LABEL_7;
  }
  double v8 = [(PXCMMComponentViewController *)self session];
  double v9 = [v8 viewModel];
  char v10 = [v9 isSelecting];

  if ((v10 & 1) == 0)
  {
    char v6 = [v5 view];
    [v5 locationInView:v6];
    double v12 = v11;
    double v14 = v13;
    double v15 = [(PXUIScrollViewController *)self->_scrollViewController contentCoordinateSpace];
    objc_msgSend(v15, "convertPoint:fromCoordinateSpace:", v6, v12, v14);
    double v17 = v16;
    double v19 = v18;

    -[PXCMMAssetsViewController _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v17, v19, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
    long long v20 = (PXAssetReference *)objc_claimAutoreleasedReturnValue();
    navigatedAssetReference = self->_navigatedAssetReference;
    self->_navigatedAssetReference = v20;

    BOOL v7 = v20 != 0;
    goto LABEL_6;
  }
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (id)oneUpPresentationActionManagerForPreviewing:(id)a3
{
  if (self->_navigatedAssetReference)
  {
    int64_t v4 = -[PXCMMAssetsViewController _createSelectionManagerWithAssetReference:](self, "_createSelectionManagerWithAssetReference:");
    id v5 = [(PXCMMAssetsViewController *)self _assetActionManagerWithSelectionManager:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)oneUpPresentationActionManager:(id)a3
{
  if ([(PXCMMAssetsViewController *)self _shouldShowDefaultOneUpActions])
  {
    int64_t v4 = 0;
  }
  else
  {
    id v5 = [(PXCMMComponentViewController *)self session];
    char v6 = [v5 viewModel];
    int v7 = [v6 isSelecting];

    if (v7)
    {
      double v8 = [(PXCMMComponentViewController *)self session];
      double v9 = [v8 viewModel];
      char v10 = [v9 selectionManager];
    }
    else if (self->_navigatedAssetReference)
    {
      char v10 = -[PXCMMAssetsViewController _createSelectionManagerWithAssetReference:](self, "_createSelectionManagerWithAssetReference:");
    }
    else
    {
      char v10 = 0;
    }
    int64_t v4 = [(PXCMMAssetsViewController *)self _assetActionManagerWithSelectionManager:v10];
  }
  return v4;
}

- (id)_assetActionManagerWithSelectionManager:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [(PXCMMComponentViewController *)self session];
  int v7 = [v6 viewModel];
  double v8 = [v5 dataSourceManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v10 = [[PXPhotoKitAssetActionManager alloc] initWithSelectionManager:v5];
    [(PXActionManager *)v10 setPerformerDelegate:self];
    id v11 = v6;
    uint64_t v12 = [v11 activityType];
    double v13 = [v11 importStatusManager];

    if (v12 != 2) {
      goto LABEL_5;
    }
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_5;
      }
      long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"PXPhotoKitImportStatusManager *_ImportStatusManagerForSession(PXCMMSession *__strong)"];
      char v26 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v26);
      uint64_t v27 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v22 handleFailureInFunction:v23, @"PXCMMAssetsViewController.m", 95, @"%@ should be an instance inheriting from %@, but it is %@", @"session.importStatusManager", v25, v27 file lineNumber description];
    }
    else
    {
      long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v23 = [NSString stringWithUTF8String:"PXPhotoKitImportStatusManager *_ImportStatusManagerForSession(PXCMMSession *__strong)"];
      uint64_t v24 = (objc_class *)objc_opt_class();
      uint64_t v25 = NSStringFromClass(v24);
      [v22 handleFailureInFunction:v23, @"PXCMMAssetsViewController.m", 95, @"%@ should be an instance inheriting from %@, but it is nil", @"session.importStatusManager", v25 file lineNumber description];
    }

LABEL_5:
    [(PXPhotoKitAssetActionManager *)v10 setImportStatusManager:v13];

    double v14 = [v11 importSessionID];
    [(PXPhotoKitAssetActionManager *)v10 setImportSessionID:v14];

    char v15 = [v7 isSelecting];
    double v16 = +[PXCompleteMyMomentSettings sharedInstance];
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v17 addObject:@"PXAssetActionTypeAddToLibrary"];
    if (v15)
    {
      double v18 = PXAssetActionTypeToggleSelection;
    }
    else
    {
      if (([v16 disablePrintAction] & 1) == 0) {
        [v17 addObject:@"PXAssetActionTypePrint"];
      }
      if (([v16 disableShareAction] & 1) == 0) {
        [v17 addObject:@"PXAssetActionTypeShare"];
      }
      if (([v16 disableShowInAllPhotosAction] & 1) == 0) {
        [v17 addObject:@"PXAssetActionTypeShowInLibrary"];
      }
      if ([v16 disableCopyAction]) {
        goto LABEL_19;
      }
      double v18 = PXAssetActionTypeCopy;
    }
    [v17 addObject:*v18];
LABEL_19:
    [(PXActionManager *)v10 setAllowedActionTypes:v17];

    goto LABEL_20;
  }
  double v19 = PLSharingGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    long long v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    double v29 = v20;
    _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_ERROR, "%@: Unable to provide action manager because data source manager is not of type PXPhotoKitAssetsDataSourceManager.", buf, 0xCu);
  }
  char v10 = 0;
LABEL_20:

  return v10;
}

- (id)_createSelectionManagerWithAssetReference:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  if (a3) {
    [a3 indexPath];
  }
  v12[0] = v13;
  v12[1] = v14;
  int64_t v4 = [off_1E5DA6F50 indexPathSetWithIndexPath:v12];
  id v5 = [(PXCMMComponentViewController *)self session];
  char v6 = [v5 dataSourceManager];

  int v7 = (void *)[objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v6];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __71__PXCMMAssetsViewController__createSelectionManagerWithAssetReference___block_invoke;
  v10[3] = &unk_1E5DC9F28;
  id v11 = v4;
  id v8 = v4;
  [v7 performChanges:v10];

  return v7;
}

uint64_t __71__PXCMMAssetsViewController__createSelectionManagerWithAssetReference___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  int v3 = [(PXCMMComponentViewController *)self session];
  int64_t v4 = [v3 mediaProvider];

  return v4;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  int v3 = [(PXCMMComponentViewController *)self session];
  int64_t v4 = [v3 dataSourceManager];

  return v4;
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  BOOL v4 = [(PXCMMAssetsViewController *)self _shouldShowDefaultOneUpActions];
  id v5 = [(PXCMMComponentViewController *)self session];
  char v6 = [v5 viewModel];

  if ([v6 isSelecting])
  {
    uint64_t v7 = 3;
  }
  else
  {
    id v8 = [(PXCMMComponentViewController *)self session];
    uint64_t v9 = [v8 activityType];

    uint64_t v7 = 1;
    if (v9 == 2) {
      uint64_t v7 = 2;
    }
  }
  if (v4) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = v7;
  }

  return v10;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 13;
}

- (BOOL)_shouldShowDefaultOneUpActions
{
  int v3 = [(PXCMMComponentViewController *)self session];
  if ([v3 sourceType] || objc_msgSend(v3, "activityType") != 1)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    BOOL v4 = [(PXCMMComponentViewController *)self session];
    id v5 = [v4 viewModel];
    int v6 = [v5 isSelecting] ^ 1;
  }
  return v6;
}

- (PXOneUpPresentation)_oneUpPresentation
{
  if (self->_delegateRespondsTo.oneUpPresentation)
  {
    int v3 = [(PXCMMAssetsViewController *)self delegate];
    BOOL v4 = [v3 oneUpPresentationForAssetsViewController:self];

    [v4 setDelegate:self];
  }
  else
  {
    BOOL v4 = 0;
  }
  return (PXOneUpPresentation *)v4;
}

- (void)_updateSelectionIfNeeded
{
  id v5 = [(PXCMMComponentViewController *)self session];
  int v3 = [v5 viewModel];
  uint64_t v4 = [v5 activityType];
  if (([v3 isSelecting] & 1) == 0 && v4 == 2) {
    [(PXCMMAssetsViewController *)self _selectNonCopiedAssets];
  }
}

- (void)_updatePlaceholder
{
  [(PXCMMAssetsViewController *)self _invalidateLayoutGenerator];
  if (![(PXCMMAssetsViewController *)self _shouldShowStatusPlaceholder])
  {
    [(PXCMMAssetsViewController *)self _performInitialSelectionIfNeeded];
  }
}

- (void)_selectionModeDidChange
{
  id v5 = [(PXCMMComponentViewController *)self session];
  int v3 = [v5 viewModel];
  uint64_t v4 = [v5 activityType];
  if (![v3 isSelecting])
  {
    [(PXCMMAssetsViewController *)self setUserSelectionEnabled:0];
    if (v4 == 2) {
      goto LABEL_6;
    }
    if (v4 != 1) {
      goto LABEL_9;
    }
LABEL_8:
    [(PXCMMAssetsViewController *)self _selectAllAssets];
    goto LABEL_9;
  }
  [(PXCMMAssetsViewController *)self setUserSelectionEnabled:1];
  if (v4 == 1) {
    goto LABEL_8;
  }
  if (v4 == 2) {
LABEL_6:
  }
    [(PXCMMAssetsViewController *)self _selectNonCopiedAssets];
LABEL_9:
  [(PXCMMAssetsViewController *)self invalidateBoopableItemsProvider];
}

- (void)addButtonTapped:(id)a3
{
  if (self->_delegateRespondsTo.didTapAddMoreButton)
  {
    id v4 = [(PXCMMAssetsViewController *)self delegate];
    [v4 didTapAddMoreButtonForAssetsViewController:self];
  }
}

- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3
{
  id v4 = [(PXCMMComponentViewController *)self session];
  int v3 = [v4 viewModel];
  [v3 performChanges:&__block_literal_global_316_243595];
}

uint64_t __91__PXCMMAssetsViewController_swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelecting:1];
}

- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3
{
  int v3 = [(PXCMMComponentViewController *)self session];
  id v4 = [v3 viewModel];
  char v5 = [v4 isSelecting];

  return v5;
}

- (BOOL)swipeSelectionManager:(id)a3 shouldSelectItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  long long v4 = *(_OWORD *)&a4->item;
  v6[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v6[1] = v4;
  return ![(PXCMMAssetsViewController *)self _isAssetAlreadyImportedAtIndexPath:v6];
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  scrollViewController = self->_scrollViewController;
  id v10 = a4;
  id v11 = [(PXUIScrollViewController *)scrollViewController contentCoordinateSpace];
  uint64_t v12 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager scrollView];
  objc_msgSend(v11, "convertPoint:fromCoordinateSpace:", v12, x, y);

  long long v13 = [v10 scrollView];

  [v13 frame];
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = [(PXUIScrollViewController *)self->_scrollViewController contentCoordinateSpace];
  id v10 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager scrollView];
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v10, x, y);

  id v11 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager scrollView];
  [v11 frame];

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = [(PXUIScrollViewController *)self->_scrollViewController contentCoordinateSpace];
  id v10 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager scrollView];
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  double v15 = *(double *)off_1E5DAAF08;
  double v16 = *((double *)off_1E5DAAF08 + 1);
  double v17 = *((double *)off_1E5DAAF08 + 2);
  double v18 = *((double *)off_1E5DAAF08 + 3);
  return -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v12, v14, v15, v16, v17, v18);
}

- (BOOL)_isAssetAlreadyImportedAtIndexPath:(PXSimpleIndexPath *)a3 withEngineDrivenLayout:(id)a4
{
  int v6 = [a4 dataSource];
  long long v7 = *(_OWORD *)&a3->item;
  v10[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v10[1] = v7;
  int64_t v8 = [(PXCMMAssetsViewController *)self _assetImportStateAtIndexPath:v10 withDataSource:v6];

  return (unint64_t)(v8 - 1) < 2;
}

- (BOOL)_isAssetAlreadyImportedAtIndexPath:(PXSimpleIndexPath *)a3
{
  char v5 = [(PXTilingController *)self->_tilingController currentLayout];
  long long v6 = *(_OWORD *)&a3->item;
  v8[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v8[1] = v6;
  LOBYTE(a3) = [(PXCMMAssetsViewController *)self _isAssetAlreadyImportedAtIndexPath:v8 withEngineDrivenLayout:v5];

  return (char)a3;
}

- (int64_t)_assetImportStateAtIndexPath:(PXSimpleIndexPath *)a3 withDataSource:(id)a4
{
  id v6 = a4;
  long long v7 = [(PXCMMComponentViewController *)self session];
  int64_t v8 = [v7 importStatusManager];

  if (v8)
  {
    long long v9 = *(_OWORD *)&a3->item;
    v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
    v13[1] = v9;
    id v10 = [v6 assetAtItemIndexPath:v13];
    if (v10) {
      int64_t v11 = [v8 importStateForAsset:v10];
    }
    else {
      int64_t v11 = 0;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4 kind:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double y = a4.y;
  double x = a4.x;
  long long v15 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->item = v15;
  double v16 = [(PXCMMComponentViewController *)self session];
  double v17 = [v16 dataSourceManager];
  double v18 = [v17 dataSource];
  uint64_t v19 = [v18 identifier];

  uint64_t v30 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  long long v20 = [(PXAssetsScene *)self->_sceneController tilingController];
  id v21 = v20;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __68__PXCMMAssetsViewController__assetIndexPathAtLocation_padding_kind___block_invoke;
  v24[3] = &__block_descriptor_48_e355_B504__0_PXTileIdentifier_Q_10Q__8_v96_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_104_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_296Q488___NSObject__496l;
  v24[4] = a6;
  v24[5] = v19;
  if (v20)
  {
    objc_msgSend(v20, "hitTestTileAtPoint:padding:passingTest:", v24, x, y, top, left, bottom, right);
  }
  else
  {
    uint64_t v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
  }

  if ((void)v25)
  {
    if (*((void *)&v25 + 1) == a6)
    {
      long long v23 = v27;
      *(_OWORD *)&retstr->dataSourceIdentifier = v26;
      *(_OWORD *)&retstr->item = v23;
    }
  }
  return result;
}

BOOL __68__PXCMMAssetsViewController__assetIndexPathAtLocation_padding_kind___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  return (v2 == *(void *)(a1 + 32) || v2 == 8439981 || v2 == 8439963) && *(void *)(a2 + 16) == *(void *)(a1 + 40);
}

- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4
{
  return -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:kind:](self, "_assetIndexPathAtLocation:padding:kind:", 6432423, a4.x, a4.y, a5.top, a5.left, a5.bottom, a5.right);
}

- (id)_assetReferenceAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", a3.x, a3.y, a4.top, a4.left, a4.bottom, a4.right);
  if (*(void *)off_1E5DAAED8)
  {
    id v6 = [(PXCMMComponentViewController *)self session];
    long long v7 = [v6 dataSourceManager];
    int64_t v8 = [v7 dataSource];

    v10[0] = v11;
    v10[1] = v12;
    char v5 = [v8 assetReferenceAtItemIndexPath:v10];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (void)_toggleAssetSelectionAtIndexPath:(PXSimpleIndexPath *)a3
{
  long long v4 = [(PXCMMComponentViewController *)self session];
  char v5 = [v4 viewModel];
  id v6 = [v5 selectionManager];

  long long v7 = [v6 selectionSnapshot];
  long long v8 = *(_OWORD *)&a3->item;
  v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v15[1] = v8;
  char v9 = [v7 isIndexPathSelected:v15];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __62__PXCMMAssetsViewController__toggleAssetSelectionAtIndexPath___block_invoke;
  v11[3] = &__block_descriptor_65_e37_v16__0___PXMutableSelectionManager__8l;
  char v14 = v9 ^ 1;
  long long v10 = *(_OWORD *)&a3->item;
  long long v12 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v13 = v10;
  [v6 performChanges:v11];
}

uint64_t __62__PXCMMAssetsViewController__toggleAssetSelectionAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 64);
  long long v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  return [a2 setSelectedState:v2 forIndexPath:v5];
}

- (void)_handleSpaceBar:(id)a3
{
  long long v4 = [(PXCMMAssetsViewController *)self _focusedAssetReference];
  navigatedAssetReference = self->_navigatedAssetReference;
  self->_navigatedAssetReference = v4;

  if (self->_navigatedAssetReference)
  {
    id v6 = [(PXCMMAssetsViewController *)self _oneUpPresentation];
    [v6 startWithConfigurationHandler:0];
  }
}

- (void)_handleLongPress:(id)a3
{
  id v12 = a3;
  if ([v12 state] == 1)
  {
    long long v4 = [(PXUIScrollViewController *)self->_scrollViewController contentCoordinateSpace];
    objc_msgSend(v12, "px_locationInCoordinateSpace:", v4);
    double v6 = v5;
    double v8 = v7;

    -[PXCMMAssetsViewController _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v6, v8, *(double *)off_1E5DAAF08, *((double *)off_1E5DAAF08 + 1), *((double *)off_1E5DAAF08 + 2), *((double *)off_1E5DAAF08 + 3));
    char v9 = (PXAssetReference *)objc_claimAutoreleasedReturnValue();
    navigatedAssetReference = self->_navigatedAssetReference;
    self->_navigatedAssetReference = v9;

    if (self->_navigatedAssetReference)
    {
      long long v11 = [(PXCMMAssetsViewController *)self _oneUpPresentation];
      [v11 startWithConfigurationHandler:0];
    }
  }
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    double v5 = [(PXCMMComponentViewController *)self session];
    double v6 = [v5 viewModel];

    int v7 = [v6 isSelecting];
    char v8 = [v6 oneUpDisabled];
    char v9 = self->_scrollViewController;
    long long v10 = [(PXUIScrollViewController *)v9 contentCoordinateSpace];
    objc_msgSend(v4, "px_locationInCoordinateSpace:", v10);
    double v12 = v11;
    double v14 = v13;

    if (v7)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      -[PXCMMAssetsViewController _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v12, v14, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
      if (*(void *)off_1E5DAAED8)
      {
        long long v28 = v30;
        long long v29 = v31;
        if ([(PXCMMAssetsViewController *)self _isAssetAlreadyImportedAtIndexPath:&v28])
        {
          long long v27 = [(PXTilingController *)self->_tilingController currentLayout];
          long long v26 = [v27 dataSource];
          long long v28 = v30;
          long long v29 = v31;
          long long v15 = [v26 assetAtItemIndexPath:&v28];
          uint64_t v16 = [v15 mediaType];
          double v17 = PXLocalizedAssetMessageForUsage(v16, 0, 2);
          double v18 = PXLocalizedAssetMessageForUsage(v16, 0, 3);
          uint64_t v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v17 message:v18 preferredStyle:1];
          long long v20 = (void *)MEMORY[0x1E4FB1410];
          id v21 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
          long long v22 = [v20 actionWithTitle:v21 style:0 handler:0];
          [v19 addAction:v22];

          [(PXCMMAssetsViewController *)self presentViewController:v19 animated:1 completion:0];
        }
        else
        {
          long long v28 = v30;
          long long v29 = v31;
          [(PXCMMAssetsViewController *)self _toggleAssetSelectionAtIndexPath:&v28];
        }
      }
    }
    else if ((v8 & 1) == 0)
    {
      -[PXCMMAssetsViewController _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v12, v14, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
      long long v23 = (PXAssetReference *)objc_claimAutoreleasedReturnValue();
      navigatedAssetReference = self->_navigatedAssetReference;
      self->_navigatedAssetReference = v23;

      if (self->_navigatedAssetReference)
      {
        long long v25 = [(PXCMMAssetsViewController *)self _oneUpPresentation];
        [v25 startWithConfigurationHandler:0];
      }
    }
  }
}

- (void)setActionInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PXCMMAssetsViewController_setActionInProgress___block_invoke;
  aBlock[3] = &unk_1E5DD36F8;
  aBlock[4] = self;
  double v5 = (void (**)(void))_Block_copy(aBlock);
  if (self->_actionInProgress == v3)
  {
    if (!v3) {
      goto LABEL_8;
    }
LABEL_6:
    v5[2](v5);
    goto LABEL_8;
  }
  self->_actionInProgress = v3;
  double v6 = [(PXCMMComponentViewController *)self session];
  uint64_t v7 = [v6 activityType];

  if (v7 == 2)
  {
    if (!v3)
    {
      [(PXCMMAssetsViewController *)self _selectNonCopiedAssets];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
LABEL_8:
}

void __49__PXCMMAssetsViewController_setActionInProgress___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) session];
  id v2 = [v1 viewModel];

  if ([v2 isSelecting]) {
    [v2 performChanges:&__block_literal_global_306_243604];
  }
}

uint64_t __49__PXCMMAssetsViewController_setActionInProgress___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelecting:0];
}

- (PXAssetReference)_focusedAssetReference
{
  id v2 = (void *)MEMORY[0x1E4FB1790];
  BOOL v3 = [(PXCMMAssetsViewController *)self view];
  id v4 = [v2 focusSystemForEnvironment:v3];
  double v5 = [v4 focusedItem];

  double v6 = [v5 parentFocusEnvironment];
  uint64_t v7 = [v6 focusItemContainer];
  uint64_t v8 = [v7 coordinateSpace];

  if (v8)
  {
    [v5 frame];
    PXRectGetCenter();
  }

  return (PXAssetReference *)0;
}

- (void)_transitionLayoutGesture:(id)a3
{
  unint64_t v4 = [(PXCMMAssetsViewController *)self _layoutType];
  if (v4 > 4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = qword_1AB35C280[v4];
  }
  [(PXCMMAssetsViewController *)self _setLayoutType:v5];
}

- (void)_updateGestures
{
  if (!self->_tapSelectionGesture)
  {
    BOOL v3 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel__handleTap_];
    tapSelectionGesture = self->_tapSelectionGesture;
    self->_tapSelectionGesture = v3;

    [(PXUITapGestureRecognizer *)self->_tapSelectionGesture setNumberOfTapsRequired:1];
    uint64_t v5 = [(PXCMMAssetsViewController *)self view];
    [v5 addGestureRecognizer:self->_tapSelectionGesture];
  }
  if (!self->_longPressGesture)
  {
    double v6 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleLongPress_];
    longPressGesture = self->_longPressGesture;
    self->_longPressGesture = v6;

    uint64_t v8 = [(PXCMMAssetsViewController *)self view];
    [v8 addGestureRecognizer:self->_longPressGesture];
  }
  char v9 = +[PXCompleteMyMomentSettings sharedInstance];
  int v10 = [v9 allowSwipeSelection];

  if (v10)
  {
    swipeSelectionManager = self->_swipeSelectionManager;
    if (self->_userSelectionEnabled)
    {
      if (!swipeSelectionManager)
      {
        double v12 = [PXSwipeSelectionManager alloc];
        double v13 = [(PXCMMComponentViewController *)self session];
        double v14 = [v13 viewModel];
        long long v15 = [v14 selectionManager];
        uint64_t v16 = [(PXUIScrollViewController *)self->_scrollViewController scrollView];
        double v17 = [(PXSwipeSelectionManager *)v12 initWithSelectionManager:v15 scrollView:v16];
        double v18 = self->_swipeSelectionManager;
        self->_swipeSelectionManager = v17;

        [(PXSwipeSelectionManager *)self->_swipeSelectionManager setDelegate:self];
      }
    }
    else
    {
      [(PXSwipeSelectionManager *)swipeSelectionManager setDelegate:0];
      uint64_t v19 = self->_swipeSelectionManager;
      self->_swipeSelectionManager = 0;
    }
  }
  id v23 = +[PXCompleteMyMomentSettings sharedInstance];
  if ([v23 allowLayoutTransitionGesture])
  {
    layoutTransitionGesture = self->_layoutTransitionGesture;

    if (layoutTransitionGesture) {
      return;
    }
    id v21 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel__transitionLayoutGesture_];
    long long v22 = self->_layoutTransitionGesture;
    self->_layoutTransitionGesture = v21;

    [(PXUITapGestureRecognizer *)self->_layoutTransitionGesture setNumberOfTapsRequired:2];
    id v23 = [(PXCMMAssetsViewController *)self view];
    [v23 addGestureRecognizer:self->_layoutTransitionGesture];
  }
}

- (void)_updateStyle
{
  id v4 = [(PXUIScrollViewController *)self->_scrollViewController scrollView];
  BOOL v3 = [(PXCMMSpec *)self->_spec reviewBackgroundColor];
  [v4 setBackgroundColor:v3];
}

- (id)_indexPathsForAssetReferences:(id)a3 inDataSource:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  id v8 = 0;
  if (v6 && v7)
  {
    id v8 = objc_alloc_init((Class)off_1E5DA7430);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v5;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v17 = 0u;
          long long v18 = 0u;
          [v6 indexPathForAssetReference:v14];
          v16[0] = v17;
          v16[1] = v18;
          [v8 addIndexPath:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (void)_setHiddenAssetReferences:(id)a3
{
  id v4 = (NSSet *)a3;
  if (v4)
  {
    uint64_t v7 = v4;
    if ([(NSSet *)v4 count])
    {
      id v5 = v7;
      goto LABEL_6;
    }
  }
  id v5 = 0;
LABEL_6:
  if (self->__hiddenAssetReferences != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->__hiddenAssetReferences, v5);
    id v6 = [(PXAssetsScene *)self->_sceneController targetLayout];
    [(PXCMMAssetsViewController *)self _configureLayout:v6];

    id v5 = v8;
  }
}

- (void)setUserSelectionEnabled:(BOOL)a3
{
  if (self->_userSelectionEnabled != a3)
  {
    self->_userSelectionEnabled = a3;
    [(PXCMMAssetsViewController *)self _invalidateLayoutGenerator];
    updater = self->_updater;
    [(PXUpdater *)updater setNeedsUpdateOf:sel__updateGestures];
  }
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->shouldShowAddMoreButton = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->didTapAddMoreButton = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->oneUpPresentation = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(PXUpdater *)self->_updater setNeedsUpdateOf:sel__updateAssetsScene];
  }
}

- (id)_createOverlayTileView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v2 setUserInteractionEnabled:0];
  BOOL v3 = [[PXCMMTileReusableView alloc] initWithView:v2];

  return v3;
}

- (id)_createStatusBadgeTileView
{
  id v2 = objc_alloc_init(PXCMMAssetStatusBadgeView);
  return v2;
}

- (id)_createStatusPlaceholderTileView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1670]);
  id v4 = [(PXStatusController *)self->_statusController configuration];
  id v5 = (void *)[v3 initWithConfiguration:v4];

  id v6 = [[PXCMMTileReusableView alloc] initWithView:v5];
  return v6;
}

- (id)_createSectionHeaderController
{
  id v3 = [(PXCMMComponentViewController *)self session];
  id v4 = [PXCMMSectionHeaderController alloc];
  uint64_t v5 = [v3 activityType];
  id v6 = [v3 viewModel];
  momentShareStatusPresentationForFooter = self->_momentShareStatusPresentationForFooter;
  id v8 = [v3 importStatusManager];
  id v9 = [(PXCMMSectionHeaderController *)v4 initWithActivityType:v5 viewModel:v6 momentShareStatusPresentation:momentShareStatusPresentationForFooter importStatusManager:v8];

  return v9;
}

- (id)_createAddButton
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
  id v4 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  uint64_t v5 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
  [v4 setBackgroundColor:v5];

  id v6 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v4 setTintColor:v6];

  [v4 setImage:v3 forState:0];
  [v4 addTarget:self action:sel_addButtonTapped_ forControlEvents:64];
  uint64_t v7 = [[PXCMMTileReusableView alloc] initWithView:v4];

  return v7;
}

- (id)_createBannerTileController
{
  id v3 = [(PXCMMComponentViewController *)self session];
  id v4 = [PXCMMBannerTileController alloc];
  uint64_t v5 = [v3 activityType];
  uint64_t v6 = [v3 sourceType];
  uint64_t v7 = [v3 viewModel];
  momentShareStatusPresentationForPoster = self->_momentShareStatusPresentationForPoster;
  id v9 = [v3 importStatusManager];
  uint64_t v10 = [(PXCMMBannerTileController *)v4 initWithActivityType:v5 sourceType:v6 viewModel:v7 momentShareStatusPresentation:momentShareStatusPresentationForPoster importStatusManager:v9];

  [(PXCMMBannerTileController *)v10 setDelegate:self];
  return v10;
}

- (id)_createStatusFooter
{
  id v3 = [PXPhotosGlobalFooterView alloc];
  id v4 = -[PXPhotosGlobalFooterView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PXPhotosGlobalFooterView *)v4 setViewModel:self->_statusFooterViewModel];
  [(PXPhotosGlobalFooterView *)v4 setDelegate:self];
  uint64_t v5 = [[PXCMMTileReusableView alloc] initWithView:v4];

  return v5;
}

- (id)_createPosterTileController
{
  id v3 = [(PXCMMComponentViewController *)self session];
  id v4 = [PXCMMPosterTileController alloc];
  uint64_t v5 = [v3 activityType];
  uint64_t v6 = [v3 viewModel];
  uint64_t v7 = [(PXCMMPosterTileController *)v4 initWithActivityType:v5 viewModel:v6 momentShareStatusPresentation:self->_momentShareStatusPresentationForPoster];

  return v7;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMAssetsViewController;
  [(PXCMMAssetsViewController *)&v4 viewDidDisappear:a3];
  [(PXScrollViewController *)self->_scrollViewController unregisterObserver:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXCMMAssetsViewController;
  [(PXCMMAssetsViewController *)&v4 viewWillAppear:a3];
  [(PXScrollViewController *)self->_scrollViewController registerObserver:self];
}

- (void)viewDidLoad
{
  v49[4] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)PXCMMAssetsViewController;
  [(PXCMMAssetsViewController *)&v48 viewDidLoad];
  id v3 = [(PXCMMAssetsViewController *)self view];
  [v3 bounds];
  self->_knownReferenceSize.double width = v4;
  self->_knownReferenceSize.double height = v5;

  [(PXUpdater *)self->_updater updateIfNeeded];
  long long v29 = [(PXCMMAssetsViewController *)self view];
  long long v30 = [(PXUIScrollViewController *)self->_scrollViewController scrollView];
  uint64_t v6 = [(PXCMMSpec *)self->_spec reviewBackgroundColor];
  [v30 setBackgroundColor:v6];

  [v30 setAlwaysBounceVertical:1];
  [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v30 setContentInsetAdjustmentBehavior:2];
  [v29 addSubview:v30];
  id v23 = (void *)MEMORY[0x1E4F28DC8];
  long long v27 = [v30 topAnchor];
  long long v26 = [v29 topAnchor];
  long long v25 = [v27 constraintEqualToAnchor:v26];
  v49[0] = v25;
  uint64_t v24 = [v30 leadingAnchor];
  uint64_t v7 = [v29 leadingAnchor];
  id v8 = [v24 constraintEqualToAnchor:v7];
  v49[1] = v8;
  id v9 = [v30 trailingAnchor];
  uint64_t v10 = [v29 trailingAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  v49[2] = v11;
  uint64_t v12 = [v30 bottomAnchor];
  double v13 = [v29 bottomAnchor];
  uint64_t v14 = [v12 constraintEqualToAnchor:v13];
  v49[3] = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [v23 activateConstraints:v15];

  if (self->_momentShareStatusPresentationForFooter)
  {
    uint64_t v16 = [[PXCMMProgressBannerView alloc] initWithMomentShareStatusPresentation:self->_momentShareStatusPresentationForFooter];
    progressBannerView = self->_progressBannerView;
    self->_progressBannerView = v16;

    [(PXCMMProgressBannerView *)self->_progressBannerView setDelegate:self];
    [(PXCMMProgressBannerView *)self->_progressBannerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v29 addSubview:self->_progressBannerView];
    long long v18 = [(PXCMMProgressBannerView *)self->_progressBannerView layer];
    [v18 setZPosition:1.0];

    [(PXCMMAssetsViewController *)self _updateProgressBannerViewVisibility];
    [(PXCMMAssetsViewController *)self _updateProgressBannerViewConstraints];
  }
  [(PXCMMAssetsViewController *)self _updateSelectionEnabled];
  long long v19 = [(PXCMMAssetsViewController *)self _oneUpPresentation];
  long long v28 = [v19 contextMenuInteraction];

  [v30 addInteraction:v28];
  long long v20 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@" " modifierFlags:0 action:sel__handleSpaceBar_];
  [(PXCMMAssetsViewController *)self addKeyCommand:v20];

  long long v21 = [(PXAssetsScene *)self->_sceneController viewTileReusePool];
  objc_initWeak(&location, self);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke;
  v45[3] = &unk_1E5DC9F50;
  objc_copyWeak(&v46, &location);
  [v21 registerReusableObjectForReuseIdentifier:8870942 creationHandler:v45];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_2;
  v43[3] = &unk_1E5DC9F50;
  objc_copyWeak(&v44, &location);
  [v21 registerReusableObjectForReuseIdentifier:8870946 creationHandler:v43];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_3;
  v41[3] = &unk_1E5DC9F50;
  objc_copyWeak(&v42, &location);
  [v21 registerReusableObjectForReuseIdentifier:8870943 creationHandler:v41];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_4;
  v39[3] = &unk_1E5DC9F50;
  objc_copyWeak(&v40, &location);
  [v21 registerReusableObjectForReuseIdentifier:8870944 creationHandler:v39];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_5;
  v37[3] = &unk_1E5DC9F50;
  objc_copyWeak(&v38, &location);
  [v21 registerReusableObjectForReuseIdentifier:8870948 creationHandler:v37];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_6;
  v35[3] = &unk_1E5DC9F50;
  objc_copyWeak(&v36, &location);
  [v21 registerReusableObjectForReuseIdentifier:8870947 creationHandler:v35];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_7;
  v33[3] = &unk_1E5DC9F50;
  objc_copyWeak(&v34, &location);
  [v21 registerReusableObjectForReuseIdentifier:8870945 creationHandler:v33];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_8;
  v31[3] = &unk_1E5DC9F50;
  objc_copyWeak(&v32, &location);
  [v21 registerReusableObjectForReuseIdentifier:8870950 creationHandler:v31];
  long long v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v22 addObserver:self selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _createOverlayTileView];

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _createStatusBadgeTileView];

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _createAddButton];

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _createPosterTileController];

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _createStatusFooter];

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _createBannerTileController];

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _createSectionHeaderController];

  return v2;
}

id __40__PXCMMAssetsViewController_viewDidLoad__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _createStatusPlaceholderTileView];

  return v2;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXCMMAssetsViewController;
  [(PXCMMAssetsViewController *)&v3 viewDidLayoutSubviews];
  [(PXUpdater *)self->_updater updateIfNeeded];
}

- (void)_scheduleLayout
{
  id v2 = [(PXCMMAssetsViewController *)self viewIfLoaded];
  [v2 setNeedsLayout];
}

- (void)_deselectAllAssets
{
  id v2 = [(PXCMMComponentViewController *)self session];
  objc_super v3 = [v2 viewModel];
  id v4 = [v3 selectionManager];

  [v4 performChanges:&__block_literal_global_251_243646];
}

uint64_t __47__PXCMMAssetsViewController__deselectAllAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)_selectAllAssets
{
  id v2 = [(PXCMMComponentViewController *)self session];
  objc_super v3 = [v2 viewModel];
  id v4 = [v3 selectionManager];

  [v4 performChanges:&__block_literal_global_249_243648];
}

uint64_t __45__PXCMMAssetsViewController__selectAllAssets__block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (BOOL)_areAllNotCopiedAssetsSelected
{
  objc_super v3 = [(PXCMMComponentViewController *)self session];
  id v4 = [v3 viewModel];
  CGFloat v5 = [v4 selectionManager];

  uint64_t v6 = [(PXCMMComponentViewController *)self session];
  uint64_t v7 = [v6 importStatusManager];

  id v8 = [v5 selectionSnapshot];
  LOBYTE(v4) = [v8 areAllUnsavedAssetsSelectedWithImportStatusManager:v7];

  return (char)v4;
}

- (void)_selectNonCopiedAssets
{
  objc_super v3 = [(PXCMMComponentViewController *)self session];
  id v4 = [v3 viewModel];
  id v7 = [v4 selectionManager];

  CGFloat v5 = [(PXCMMComponentViewController *)self session];
  uint64_t v6 = [v5 importStatusManager];

  [v7 selectNonCopiedAssetsWithImportStatusManager:v6];
}

- (void)_selectCuratedAssets
{
  id v4 = [(PXCMMComponentViewController *)self session];
  CGFloat v5 = [v4 viewModel];
  uint64_t v6 = [v5 selectionManager];

  id v7 = [v6 selectionSnapshot];
  id v8 = [v7 dataSource];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v15 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v15);
    uint64_t v16 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PXCMMAssetsViewController.m", 348, @"%@ should be an instance inheriting from %@, but it is %@", @"dataSourceSnapshot", v14, v16 object file lineNumber description];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PXCMMAssetsViewController.m", 348, @"%@ should be an instance inheriting from %@, but it is nil", @"dataSourceSnapshot", v14 object file lineNumber description];
  }

LABEL_3:
  id v9 = [off_1E5DA7430 indexPathSet];
  if (v8) {
    [v8 firstItemIndexPath];
  }
  else {
    memset(v22, 0, sizeof(v22));
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __49__PXCMMAssetsViewController__selectCuratedAssets__block_invoke;
  v19[3] = &unk_1E5DCA3B8;
  id v10 = v8;
  id v20 = v10;
  id v11 = v9;
  id v21 = v11;
  [v10 enumerateItemIndexPathsStartingAtIndexPath:v22 reverseDirection:0 usingBlock:v19];
  if ([v11 count])
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    _OWORD v17[2] = __49__PXCMMAssetsViewController__selectCuratedAssets__block_invoke_2;
    v17[3] = &unk_1E5DC9F28;
    id v18 = v11;
    [v6 performChanges:v17];
  }
}

uint64_t __49__PXCMMAssetsViewController__selectCuratedAssets__block_invoke(uint64_t a1, long long *a2)
{
  id v4 = *(void **)(a1 + 32);
  long long v5 = a2[1];
  long long v9 = *a2;
  long long v10 = v5;
  uint64_t result = [v4 isAssetAtIndexPathPartOfCuratedSet:&v9];
  if (result)
  {
    id v7 = *(void **)(a1 + 40);
    long long v8 = a2[1];
    long long v9 = *a2;
    long long v10 = v8;
    return [v7 addIndexPath:&v9];
  }
  return result;
}

uint64_t __49__PXCMMAssetsViewController__selectCuratedAssets__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

- (void)_performInitialSelectionIfNeeded
{
  if (self->_needsToPerformInitialSelection
    && ![(PXCMMAssetsViewController *)self _shouldShowStatusPlaceholder])
  {
    self->_needsToPerformInitialSelection = 0;
    objc_super v3 = [(PXCMMComponentViewController *)self session];
    uint64_t v4 = [v3 activityType];

    if (v4 == 2)
    {
      [(PXCMMAssetsViewController *)self _selectNonCopiedAssets];
    }
    else if (v4 == 1)
    {
      [(PXCMMAssetsViewController *)self _selectAllAssets];
    }
  }
}

- (void)_updateSelectionEnabled
{
  if (([(PXMomentShareStatusPresentation *)self->_momentShareStatusPresentationForPoster state] & 0xFFFFFFFFFFFFFFFDLL) == 4)
  {
    objc_super v3 = [(PXCMMComponentViewController *)self session];
    id v4 = [v3 viewModel];

    [v4 performChanges:&__block_literal_global_243654];
  }
}

void __52__PXCMMAssetsViewController__updateSelectionEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setSelectionEnabled:0];
  [v2 setSelecting:0];
}

- (void)_updateAssetsScene
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_sceneController && [(PXCMMAssetsViewController *)self isViewLoaded])
  {
    objc_super v3 = [(PXCMMComponentViewController *)self session];
    long long v33 = [v3 dataSourceManager];
    id v4 = [v3 mediaProvider];
    long long v5 = [v3 viewModel];
    uint64_t v6 = [v5 selectionManager];

    id v7 = [(PXCMMAssetsViewController *)self _createNewLayout];
    long long v8 = [PXUIScrollViewController alloc];
    long long v9 = [(PXCMMAssetsViewController *)self view];
    [v9 bounds];
    long long v10 = -[PXUIScrollViewController initWithFrame:](v8, "initWithFrame:");
    scrollViewController = self->_scrollViewController;
    self->_scrollViewController = v10;

    uint64_t v12 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->_tileAnimator;
    self->_tileAnimator = &v12->super;

    uint64_t v14 = [[PXTilingController alloc] initWithLayout:v7];
    tilingController = self->_tilingController;
    self->_tilingController = v14;

    [(PXTilingController *)self->_tilingController setScrollController:self->_scrollViewController];
    [(PXTilingController *)self->_tilingController setTileAnimator:self->_tileAnimator];
    uint64_t v16 = [[PXUIAssetsScene alloc] initWithTilingController:self->_tilingController mediaProvider:v4 dataSourceManager:v33 selectionManager:v6 delegate:self];
    sceneController = self->_sceneController;
    self->_sceneController = v16;

    [(PXTilingController *)self->_tilingController setTileSource:self];
    [(PXTilingController *)self->_tilingController setTransitionDelegate:self->_sceneController];
    [(PXTilingController *)self->_tilingController setScrollDelegate:self->_sceneController];
    [(PXCMMAssetsViewController *)self _maximumThumbnailSize];
    double v19 = v18;
    double v21 = v20;
    long long v22 = PLSharingGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v37.double width = v19;
      v37.double height = v21;
      id v23 = NSStringFromCGSize(v37);
      *(_DWORD *)buf = 138543362;
      long long v35 = v23;
      _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "Setting the maximum image request size to %{public}@", buf, 0xCu);
    }
    -[PXUIAssetsScene setMaximumImageSize:](self->_sceneController, "setMaximumImageSize:", v19, v21);
    [(PXCMMAssetsViewController *)self _performInitialSelectionIfNeeded];
  }
  [(PXCMMAssetsViewController *)self contentInset];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  -[PXScrollViewController setContentInset:](self->_scrollViewController, "setContentInset:");
  id v32 = [(PXUIScrollViewController *)self->_scrollViewController scrollView];
  objc_msgSend(v32, "setVerticalScrollIndicatorInsets:", v25, v27, v29, v31);
}

- (CGSize)_maximumThumbnailSize
{
  id v2 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  objc_super v3 = [v2 masterThumbnailFormat];

  objc_msgSend(v3, "sizeWithFallBackSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (PXCMMAssetsViewController)initWithSession:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PXCMMAssetsViewController;
  double v5 = [(PXCMMComponentViewController *)&v34 initWithSession:v4];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA80] set];
    inUseTiles = v5->_inUseTiles;
    v5->_inUseTiles = (NSMutableSet *)v6;

    double v8 = +[PXCompleteMyMomentSettings sharedInstance];
    v5->__layoutType = [v8 initialLayoutType];

    v5->_needsToPerformInitialSelection = 1;
    [(UIViewController *)v5 px_enableExtendedTraitCollection];
    double v9 = [(UIViewController *)v5 px_extendedTraitCollection];
    long long v10 = -[PXCMMSpecManager initWithExtendedTraitCollection:activityType:]([PXCMMSpecManager alloc], "initWithExtendedTraitCollection:activityType:", v9, [v4 activityType]);
    specManager = v5->_specManager;
    v5->_specManager = v10;

    uint64_t v12 = [(PXFeatureSpecManager *)v5->_specManager spec];
    spec = v5->_spec;
    v5->_spec = (PXCMMSpec *)v12;

    [(PXCMMSpecManager *)v5->_specManager registerChangeObserver:v5 context:PXSpecManagerObservationContext_243534];
    uint64_t v14 = [v4 viewModel];
    [v14 registerChangeObserver:v5 context:PXCMMViewModelObservationContext_243532];

    long long v15 = [v4 viewModel];
    v5->_userSelectionEnabled = [v15 isSelecting];

    uint64_t v16 = [v4 momentShareStatusPresentationWithPresentationStyle:2];
    momentShareStatusPresentationForFooter = v5->_momentShareStatusPresentationForFooter;
    v5->_momentShareStatusPresentationForFooter = (PXMomentShareStatusPresentation *)v16;

    [(PXMomentShareStatusPresentation *)v5->_momentShareStatusPresentationForFooter registerChangeObserver:v5 context:PXMomentShareStatusPresentationObservationContext_243533];
    if (v5->_momentShareStatusPresentationForFooter)
    {
      double v18 = [[PXCMMFooterViewModel alloc] initWithMomentShareStatusPresentation:v5->_momentShareStatusPresentationForFooter mode:0];
      statusFooterViewModel = v5->_statusFooterViewModel;
      v5->_statusFooterViewModel = v18;
    }
    uint64_t v20 = [v4 momentShareStatusPresentationWithPresentationStyle:1];
    momentShareStatusPresentationForPoster = v5->_momentShareStatusPresentationForPoster;
    v5->_momentShareStatusPresentationForPoster = (PXMomentShareStatusPresentation *)v20;

    [(PXMomentShareStatusPresentation *)v5->_momentShareStatusPresentationForPoster registerChangeObserver:v5 context:PXMomentShareStatusPresentationObservationContext_243533];
    long long v22 = [v4 viewModel];
    id v23 = [v22 selectionManager];

    [v23 registerChangeObserver:v5 context:PXSelectionManagerObservationContext_243535];
    double v24 = objc_alloc_init(PXStatusController);
    statusController = v5->_statusController;
    v5->_statusController = v24;

    [(PXStatusController *)v5->_statusController setDelegate:v5];
    if (v5->_momentShareStatusPresentationForFooter)
    {
      double v26 = [PXCMMStatusController alloc];
      double v27 = v5->_momentShareStatusPresentationForFooter;
      double v28 = [(PXStatusController *)v5->_statusController viewModel];
      uint64_t v29 = [(PXCMMStatusController *)v26 initWithStatusPresentation:v27 viewModel:v28];
      cmmStatusController = v5->_cmmStatusController;
      v5->_cmmStatusController = (PXCMMStatusController *)v29;
    }
    uint64_t v31 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v5];
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v31;

    [(PXUpdater *)v5->_updater setNeedsUpdateSelector:sel__scheduleLayout];
    [(PXUpdater *)v5->_updater addUpdateSelector:sel__updateLayoutEngine];
    [(PXUpdater *)v5->_updater addUpdateSelector:sel__updateAssetsScene];
    [(PXUpdater *)v5->_updater addUpdateSelector:sel__updateGestures];
    [(PXUpdater *)v5->_updater setNeedsUpdateOf:sel__updateLayoutEngine];
    [(PXUpdater *)v5->_updater setNeedsUpdateOf:sel__updateAssetsScene];
    [(PXUpdater *)v5->_updater setNeedsUpdateOf:sel__updateGestures];
  }
  return v5;
}

@end