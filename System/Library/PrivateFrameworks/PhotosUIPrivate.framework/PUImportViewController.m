@interface PUImportViewController
+ (id)totalSizeStringForItems:(id)a3;
+ (unsigned)defaultThumbnailImageFormat;
- (BOOL)_isItemVisibleAtIndex:(id)a3;
- (BOOL)animateHeaderActionButtonChanges;
- (BOOL)anyAlreadyImportedItemsAreSelected;
- (BOOL)areAllItemsSelectedInAssetCollection:(id)a3;
- (BOOL)canBeginDoubleTapGesture:(id)a3;
- (BOOL)canBeginSwipeSelectionAtScrollViewLocation:(CGPoint)a3;
- (BOOL)canDragOut;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)compactLayoutMode;
- (BOOL)compactWidthToolbarCoversLocation:(CGPoint)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasBackOrCloseButton;
- (BOOL)importSectionedGridLayout:(id)a3 shouldEmphasizeSection:(unint64_t)a4;
- (BOOL)importSourceIsAppleDevice;
- (BOOL)isBusy;
- (BOOL)isContentViewInSyncWithModel;
- (BOOL)isEmpty;
- (BOOL)isImporting;
- (BOOL)isPeeking;
- (BOOL)isPreheatingEnabled;
- (BOOL)isTransitioningToNewSize;
- (BOOL)isViewAppearing;
- (BOOL)needsDataReloadAfterAnimatingDataSourceChange;
- (BOOL)performingAlbumPickerPresentation;
- (BOOL)performingDataSourceChange;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)sectionHeadersCoverLocation:(CGPoint)a3;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldCollapseAlreadyImportedSection;
- (BOOL)shouldLongPressForOneUp;
- (BOOL)shouldStayScrolledToBottom;
- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3;
- (BOOL)updateSpec;
- (BOOL)userHasScrolled;
- (BOOL)userWantsAlreadyImportedSectionCollapsedIfPossible;
- (BOOL)wantsPlaceholderView;
- (CGRect)imageRectFromPhotoView:(id)a3;
- (CGRect)targetFrameForTransitionItem:(id)a3;
- (CGSize)_cachedViewSizeTransitionContextSize;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5;
- (CGSize)gridItemSize;
- (NSLayoutConstraint)compactWidthToolbarTopConstraint;
- (NSMutableSet)itemsBeingTransitioned;
- (NSNumber)cachedHeaderHeight;
- (NSProgress)importProgress;
- (PHImportSource)importSource;
- (PLRoundProgressView)roundProgressView;
- (PUImportActionCoordinator)actionCoordinator;
- (PUImportAddToLibraryAndAlbumsPickerViewController)destinationPickerViewController;
- (PUImportChangeDetailsCollectionViewHelper)changeDetailsHelper;
- (PUImportCustomViewBarButton)compactWidthAlbumPickerButton;
- (PUImportFakePhotosDataSource)fakePhotosDataSource;
- (PUImportFloatingToolbarView)compactWidthToolbar;
- (PUImportViewController)initWithSpec:(id)a3 photoLibrary:(id)a4;
- (PUPhotosGridViewControllerSpec)_spec;
- (PXActionableSectionHeaderView)referenceHeaderView;
- (PXImportAssetsDataSource)importDataSource;
- (PXImportAssetsDataSource)pendingDataSource;
- (PXImportAssetsDataSourceManager)importDataSourceManager;
- (PXImportAssetsDataSourceManager)unfilteredImportDataSourceManager;
- (PXImportController)importController;
- (PXNavigationTitleView)compactWidthAlbumPickerBarButtonView;
- (PXNavigationTitleView)contentInfoBarButtonView;
- (PXNavigationTitleView)navigationTitleView;
- (PXSelectionSnapshot)currentSelectionSnapshot;
- (PXSimpleIndexPath)selectionIndexPathForItem:(SEL)a3;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4;
- (PXSwipeSelectionManager)swipeSelectionManager;
- (UIEdgeInsets)collectionViewSafeAreaInsets;
- (UILabel)navigationLargeTitleAccessoryLabel;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (double)_collectionViewLayoutReferenceWidth;
- (double)referenceWidth;
- (double)sectionedGridLayout:(id)a3 accessibilitySectionHeaderHeightForVisualSection:(int64_t)a4;
- (double)sectionedGridLayout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4;
- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4;
- (id)_bestReferenceItemIndexPath;
- (id)_cachedViewSizeTransitionContext;
- (id)_gridLayout;
- (id)_navigationViewControllerForViewController:(id)a3;
- (id)_newGridLayoutFromSpec:(id)a3;
- (id)_pendingViewSizeTransitionContext;
- (id)accessibilityLabelForAlbumPickerControlWithDestination:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)deleteButtonItem;
- (id)destinationDescriptionForCollection:(id)a3;
- (id)importDestinationForActionCoordinator:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)newGridLayout;
- (id)oneUpViewControllerForItemAtIndexPath:(id)a3;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (id)px_navigationDestination;
- (id)transitionItemsForContext:(id)a3;
- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)contentFillModeForImportCell:(id)a3;
- (int64_t)importCell:(id)a3 requestImageForImportItem:(id)a4 ofSize:(unint64_t)a5 completion:(id)a6;
- (int64_t)numItemsCompleted;
- (int64_t)numTotalItemsToComplete;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_beginImport;
- (void)_beginUninterruptibleOperation;
- (void)_cancelAlerts;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_deleteItems:(id)a3;
- (void)_deselectCell:(id)a3;
- (void)_dismissPopupsAnimated:(BOOL)a3;
- (void)_endImport;
- (void)_endUninterruptibleOperation;
- (void)_getDataForVisualSection:(int64_t)a3 hasActionButton:(BOOL *)a4 title:(id *)a5 startDate:(id *)a6 endDate:(id *)a7;
- (void)_importControllerDidEndAction;
- (void)_importControllerWillBeginAction;
- (void)_invalidateCachedViewSizeTransitionContext;
- (void)_navigateToPhotoAtIndexPath:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5;
- (void)_selectCell:(id)a3;
- (void)_setCachedViewSizeTransitionContext:(id)a3;
- (void)_setCachedViewSizeTransitionContextSize:(CGSize)a3;
- (void)_setCollectionViewLayoutReferenceWidth:(double)a3;
- (void)_setCollectionViewSafeAreaInsets:(UIEdgeInsets)a3;
- (void)_setPendingViewSizeTransitionContext:(id)a3;
- (void)_setSpec:(id)a3;
- (void)_updateBackdropGroupNameForHeaderView:(id)a3;
- (void)_updateCell:(id)a3 atIndex:(id)a4;
- (void)_updateCompactToolbar;
- (void)_updateContentOffsetForPendingViewSizeTransition;
- (void)_updateItemViewAtIndex:(id)a3;
- (void)_updateLayoutMetrics;
- (void)_updateToolbarAnimated:(BOOL)a3;
- (void)actionCoordinator:(id)a3 didCompleteWithImportSession:(id)a4 results:(id)a5;
- (void)actionCoordinatorDidBeginDelete:(id)a3;
- (void)actionCoordinatorDidBeginImport:(id)a3;
- (void)actionCoordinatorDidEndDelete:(id)a3;
- (void)actionCoordinatorWillBeginDelete:(id)a3;
- (void)cancelAlbumPickerPopover:(id)a3;
- (void)collectionSelected:(id)a3;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureCollectionViewGridLayout:(id)a3;
- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)didTapAddToAlbumsView:(id)a3;
- (void)didTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5;
- (void)disableSwipeSelection;
- (void)enableSwipeSelection;
- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6;
- (void)handleDoubleTapGesture:(id)a3;
- (void)handleImportCompleteAlertResponse:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)handleLongPressGesture:(id)a3;
- (void)handleNewDataSource:(id)a3;
- (void)handlePhotoOrStackPinchGestureRecognizer:(id)a3;
- (void)handleTapGesture:(id)a3;
- (void)handleTouchEvent:(int64_t)a3 forCell:(id)a4;
- (void)headerViewDidPressActionButton:(id)a3 inHeaderView:(id)a4;
- (void)importCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4;
- (void)importController:(id)a3 didCompleteImportWithImportSession:(id)a4 results:(id)a5 completion:(id)a6;
- (void)importController:(id)a3 didLoadAssets:(id)a4 exceptions:(id)a5;
- (void)importControllerProgressDidChange:(id)a3;
- (void)installGestureRecognizers;
- (void)navigateToBottomAnimated:(BOOL)a3;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)notifyUserOfImportCompletionIfNeededWithImportSession:(id)a3 results:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)prepareTransitionItemViewForDestination:(id)a3;
- (void)presentAlbumPickerFromView:(id)a3 orBarItem:(id)a4;
- (void)presentOneUpViewController:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5;
- (void)reloadData;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)selectAllSelectableItems;
- (void)setActionCoordinator:(id)a3;
- (void)setAllItemsSelected:(BOOL)a3 inAssetCollection:(id)a4;
- (void)setAnimateHeaderActionButtonChanges:(BOOL)a3;
- (void)setCachedHeaderHeight:(id)a3;
- (void)setChangeDetailsHelper:(id)a3;
- (void)setCompactWidthAlbumPickerBarButtonView:(id)a3;
- (void)setCompactWidthAlbumPickerButton:(id)a3;
- (void)setCompactWidthToolbar:(id)a3;
- (void)setCompactWidthToolbarTopConstraint:(id)a3;
- (void)setContentInfoBarButtonView:(id)a3;
- (void)setCurrentSelectionSnapshot:(id)a3;
- (void)setDestinationPickerViewController:(id)a3;
- (void)setDoubleTapGestureRecognizer:(id)a3;
- (void)setFakePhotosDataSource:(id)a3;
- (void)setImportController:(id)a3;
- (void)setImportDataSource:(id)a3;
- (void)setImportDataSourceManager:(id)a3;
- (void)setImportProgress:(id)a3;
- (void)setImportSource:(id)a3;
- (void)setIsPeeking:(BOOL)a3;
- (void)setItemsBeingTransitioned:(id)a3;
- (void)setNeedsDataReloadAfterAnimatingDataSourceChange:(BOOL)a3;
- (void)setNumItemsCompleted:(int64_t)a3;
- (void)setNumTotalItemsToComplete:(int64_t)a3;
- (void)setPendingDataSource:(id)a3;
- (void)setPerformingAlbumPickerPresentation:(BOOL)a3;
- (void)setPerformingDataSourceChange:(BOOL)a3;
- (void)setReferenceHeaderView:(id)a3;
- (void)setReferenceWidth:(double)a3;
- (void)setRoundProgressView:(id)a3;
- (void)setShouldCollapseAlreadyImportedSection:(BOOL)a3;
- (void)setShouldStayScrolledToBottom:(BOOL)a3;
- (void)setSwipeSelectionManager:(id)a3;
- (void)setTransitioningToNewSize:(BOOL)a3;
- (void)setUnfilteredImportDataSourceManager:(id)a3;
- (void)setUpCompactWidthToolbar;
- (void)setUserHasScrolled:(BOOL)a3;
- (void)setUserWantsAlreadyImportedSectionCollapsedIfPossible:(BOOL)a3;
- (void)setViewAppearing:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)showAlbumPicker:(id)a3;
- (void)stayScrolledToBottomIfAtBottomAfterDrag:(id)a3;
- (void)stopImport:(id)a3;
- (void)targetLibrarySelected:(unint64_t)a3;
- (void)toggleAlreadyImportedExpansion;
- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6;
- (void)uninstallGestureRecognizers;
- (void)updateAlreadyImportedCollapseStatus;
- (void)updateAlreadyImportedHeaderIfVisible;
- (void)updateCompactWidthToolbarBackgroundGroupName;
- (void)updateCompactWidthToolbarTopConstraint;
- (void)updateCompactWidthToolbarVisibility;
- (void)updateContentInfoBarButtonTitlesWithItems:(id)a3 sizeString:(id)a4 itemsAreSelected:(BOOL)a5;
- (void)updateContentInfoLabels;
- (void)updateContentInsetForCompactWidthToolbar;
- (void)updateDataSourceManagerFilters;
- (void)updateHeaderView:(id)a3 forAlreadyImportedAssetCollection:(id)a4;
- (void)updateHeaderView:(id)a3 forAssetCollection:(id)a4;
- (void)updateNavigationBarAnimated:(BOOL)a3;
- (void)updateNavigationTitleViewVisibilityAnimated:(BOOL)a3;
- (void)updateNavigationTitleWithItems:(id)a3 sizeString:(id)a4 itemsAreSelected:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5;
@end

@implementation PUImportViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_referenceHeaderView, 0);
  objc_storeStrong((id *)&self->_cachedHeaderHeight, 0);
  objc_storeStrong((id *)&self->_compactWidthAlbumPickerButton, 0);
  objc_storeStrong((id *)&self->_compactWidthAlbumPickerBarButtonView, 0);
  objc_storeStrong((id *)&self->_contentInfoBarButtonView, 0);
  objc_storeStrong((id *)&self->_compactWidthToolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_compactWidthToolbar, 0);
  objc_storeStrong((id *)&self->_itemsBeingTransitioned, 0);
  objc_storeStrong((id *)&self->_roundProgressView, 0);
  objc_storeStrong((id *)&self->_destinationPickerViewController, 0);
  objc_storeStrong((id *)&self->_currentSelectionSnapshot, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_navigationLargeTitleAccessoryLabel, 0);
  objc_storeStrong((id *)&self->_navigationTitleView, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_storeStrong((id *)&self->_fakePhotosDataSource, 0);
  objc_storeStrong((id *)&self->_changeDetailsHelper, 0);
  objc_storeStrong((id *)&self->_pendingDataSource, 0);
  objc_storeStrong((id *)&self->_unfilteredImportDataSourceManager, 0);
  objc_storeStrong((id *)&self->_importDataSource, 0);
  objc_storeStrong((id *)&self->_importDataSourceManager, 0);
  objc_storeStrong((id *)&self->_importController, 0);
  objc_storeStrong((id *)&self->_importProgress, 0);
  objc_storeStrong(&self->__cachedViewSizeTransitionContext, 0);
  objc_storeStrong(&self->__pendingViewSizeTransitionContext, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->_px_navigationDestination, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong(&self->_mstreamd_pause_context, 0);
  objc_storeStrong((id *)&self->_compactEmptyTrailingButton, 0);
  objc_storeStrong((id *)&self->_compactSpacer2, 0);
  objc_storeStrong((id *)&self->_compactImportDestinationButton, 0);
  objc_storeStrong((id *)&self->_compactSpacer1, 0);
  objc_storeStrong((id *)&self->_compactContentInfoButton, 0);
  objc_storeStrong((id *)&self->_albumPickerCompactWidthBarButton, 0);
  objc_storeStrong((id *)&self->_contentInfoBarButton, 0);
  objc_storeStrong((id *)&self->_addToAlbumsToolbarView, 0);
  objc_storeStrong((id *)&self->_albumPickerBarItem, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
  objc_storeStrong((id *)&self->_progressButtonItem, 0);
  objc_storeStrong((id *)&self->_stopBarItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteButtonItemIcon, 0);
  objc_storeStrong((id *)&self->_importButtonItem, 0);
  objc_storeStrong((id *)&self->_completedImportSessionInfo, 0);
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setReferenceWidth:(double)a3
{
  self->_referenceWidth = a3;
}

- (double)referenceWidth
{
  return self->_referenceWidth;
}

- (void)setIsPeeking:(BOOL)a3
{
  self->_isPeeking = a3;
}

- (BOOL)isPeeking
{
  return self->_isPeeking;
}

- (void)setReferenceHeaderView:(id)a3
{
}

- (PXActionableSectionHeaderView)referenceHeaderView
{
  return self->_referenceHeaderView;
}

- (void)setCachedHeaderHeight:(id)a3
{
}

- (NSNumber)cachedHeaderHeight
{
  return self->_cachedHeaderHeight;
}

- (void)setCompactWidthAlbumPickerButton:(id)a3
{
}

- (PUImportCustomViewBarButton)compactWidthAlbumPickerButton
{
  return self->_compactWidthAlbumPickerButton;
}

- (void)setCompactWidthAlbumPickerBarButtonView:(id)a3
{
}

- (PXNavigationTitleView)compactWidthAlbumPickerBarButtonView
{
  return self->_compactWidthAlbumPickerBarButtonView;
}

- (void)setContentInfoBarButtonView:(id)a3
{
}

- (PXNavigationTitleView)contentInfoBarButtonView
{
  return self->_contentInfoBarButtonView;
}

- (void)setCompactWidthToolbarTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)compactWidthToolbarTopConstraint
{
  return self->_compactWidthToolbarTopConstraint;
}

- (void)setCompactWidthToolbar:(id)a3
{
}

- (PUImportFloatingToolbarView)compactWidthToolbar
{
  return self->_compactWidthToolbar;
}

- (void)setAnimateHeaderActionButtonChanges:(BOOL)a3
{
  self->_animateHeaderActionButtonChanges = a3;
}

- (BOOL)animateHeaderActionButtonChanges
{
  return self->_animateHeaderActionButtonChanges;
}

- (void)setItemsBeingTransitioned:(id)a3
{
}

- (NSMutableSet)itemsBeingTransitioned
{
  return self->_itemsBeingTransitioned;
}

- (void)setNumTotalItemsToComplete:(int64_t)a3
{
  self->_numTotalItemsToComplete = a3;
}

- (int64_t)numTotalItemsToComplete
{
  return self->_numTotalItemsToComplete;
}

- (void)setNumItemsCompleted:(int64_t)a3
{
  self->_numItemsCompleted = a3;
}

- (int64_t)numItemsCompleted
{
  return self->_numItemsCompleted;
}

- (void)setRoundProgressView:(id)a3
{
}

- (PLRoundProgressView)roundProgressView
{
  return self->_roundProgressView;
}

- (void)setShouldStayScrolledToBottom:(BOOL)a3
{
  self->_shouldStayScrolledToBottom = a3;
}

- (BOOL)shouldStayScrolledToBottom
{
  return self->_shouldStayScrolledToBottom;
}

- (void)setUserHasScrolled:(BOOL)a3
{
  self->_userHasScrolled = a3;
}

- (BOOL)userHasScrolled
{
  return self->_userHasScrolled;
}

- (void)setShouldCollapseAlreadyImportedSection:(BOOL)a3
{
  self->_shouldCollapseAlreadyImportedSection = a3;
}

- (BOOL)shouldCollapseAlreadyImportedSection
{
  return self->_shouldCollapseAlreadyImportedSection;
}

- (void)setUserWantsAlreadyImportedSectionCollapsedIfPossible:(BOOL)a3
{
  self->_userWantsAlreadyImportedSectionCollapsedIfPossible = a3;
}

- (BOOL)userWantsAlreadyImportedSectionCollapsedIfPossible
{
  return self->_userWantsAlreadyImportedSectionCollapsedIfPossible;
}

- (void)setPerformingAlbumPickerPresentation:(BOOL)a3
{
  self->_performingAlbumPickerPresentation = a3;
}

- (BOOL)performingAlbumPickerPresentation
{
  return self->_performingAlbumPickerPresentation;
}

- (void)setDestinationPickerViewController:(id)a3
{
}

- (PUImportAddToLibraryAndAlbumsPickerViewController)destinationPickerViewController
{
  return self->_destinationPickerViewController;
}

- (void)setCurrentSelectionSnapshot:(id)a3
{
}

- (PXSelectionSnapshot)currentSelectionSnapshot
{
  return self->_currentSelectionSnapshot;
}

- (void)setSwipeSelectionManager:(id)a3
{
}

- (PXSwipeSelectionManager)swipeSelectionManager
{
  return self->_swipeSelectionManager;
}

- (UILabel)navigationLargeTitleAccessoryLabel
{
  return self->_navigationLargeTitleAccessoryLabel;
}

- (PXNavigationTitleView)navigationTitleView
{
  return self->_navigationTitleView;
}

- (void)setActionCoordinator:(id)a3
{
}

- (PUImportActionCoordinator)actionCoordinator
{
  return self->_actionCoordinator;
}

- (void)setFakePhotosDataSource:(id)a3
{
}

- (PUImportFakePhotosDataSource)fakePhotosDataSource
{
  return self->_fakePhotosDataSource;
}

- (void)setViewAppearing:(BOOL)a3
{
  self->_viewAppearing = a3;
}

- (BOOL)isViewAppearing
{
  return self->_viewAppearing;
}

- (void)setTransitioningToNewSize:(BOOL)a3
{
  self->_transitioningToNewSize = a3;
}

- (BOOL)isTransitioningToNewSize
{
  return self->_transitioningToNewSize;
}

- (void)setChangeDetailsHelper:(id)a3
{
}

- (PUImportChangeDetailsCollectionViewHelper)changeDetailsHelper
{
  return self->_changeDetailsHelper;
}

- (void)setPendingDataSource:(id)a3
{
}

- (PXImportAssetsDataSource)pendingDataSource
{
  return self->_pendingDataSource;
}

- (void)setNeedsDataReloadAfterAnimatingDataSourceChange:(BOOL)a3
{
  self->_needsDataReloadAfterAnimatingDataSourceChange = a3;
}

- (BOOL)needsDataReloadAfterAnimatingDataSourceChange
{
  return self->_needsDataReloadAfterAnimatingDataSourceChange;
}

- (void)setPerformingDataSourceChange:(BOOL)a3
{
  self->_performingDataSourceChange = a3;
}

- (BOOL)performingDataSourceChange
{
  return self->_performingDataSourceChange;
}

- (PXImportAssetsDataSourceManager)unfilteredImportDataSourceManager
{
  return self->_unfilteredImportDataSourceManager;
}

- (PXImportAssetsDataSource)importDataSource
{
  return self->_importDataSource;
}

- (PXImportAssetsDataSourceManager)importDataSourceManager
{
  return self->_importDataSourceManager;
}

- (PXImportController)importController
{
  return self->_importController;
}

- (void)setImportProgress:(id)a3
{
}

- (NSProgress)importProgress
{
  return self->_importProgress;
}

- (void)_setCachedViewSizeTransitionContextSize:(CGSize)a3
{
  self->__cachedViewSizeTransitionContextSize = a3;
}

- (CGSize)_cachedViewSizeTransitionContextSize
{
  double width = self->__cachedViewSizeTransitionContextSize.width;
  double height = self->__cachedViewSizeTransitionContextSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setCachedViewSizeTransitionContext:(id)a3
{
}

- (id)_cachedViewSizeTransitionContext
{
  return self->__cachedViewSizeTransitionContext;
}

- (void)_setPendingViewSizeTransitionContext:(id)a3
{
}

- (id)_pendingViewSizeTransitionContext
{
  return self->__pendingViewSizeTransitionContext;
}

- (UIEdgeInsets)collectionViewSafeAreaInsets
{
  double top = self->_collectionViewSafeAreaInsets.top;
  double left = self->_collectionViewSafeAreaInsets.left;
  double bottom = self->_collectionViewSafeAreaInsets.bottom;
  double right = self->_collectionViewSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)_collectionViewLayoutReferenceWidth
{
  return self->__collectionViewLayoutReferenceWidth;
}

- (void)_setSpec:(id)a3
{
}

- (PUPhotosGridViewControllerSpec)_spec
{
  return self->__spec;
}

- (id)px_navigationDestination
{
  v3 = [(PUImportViewController *)self importSource];
  v4 = [v3 uuid];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F905E8]);
    v6 = [(PUImportViewController *)self importSource];
    v7 = (void *)[v5 initWithImportSource:v6 revealMode:0];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v8 = (void (**)(id, uint64_t, void))a5;
  if ([(PUImportViewController *)self routingOptionsForDestination:a3]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  v8[2](v8, v7, 0);
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 20)
  {
    id v5 = [(PUImportViewController *)self importSource];
    v6 = [v5 uuid];
    uint64_t v7 = [v4 importSourceUUID];
    unint64_t v8 = [v6 isEqual:v7];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager gesturesForFailureRequirements];
  if ([v8 containsObject:v6])
  {
    id v9 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];

    if (v9 != v7)
    {
      uint64_t v10 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager state];
      BOOL v11 = v10 != 0;
      v12 = _importGridLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = [(PXSwipeSelectionManager *)self->_swipeSelectionManager state];
        int v17 = 136315650;
        v18 = "-[PUImportViewController gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:]";
        __int16 v19 = 2048;
        BOOL v20 = v10 != 0;
        __int16 v21 = 2048;
        uint64_t v22 = v16;
        _os_log_debug_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEBUG, "%s: shouldRecognize returning %ld(swipe state %ld)", (uint8_t *)&v17, 0x20u);
      }

      goto LABEL_11;
    }
  }
  else
  {
  }
  id v13 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];
  if (v13 == v6)
  {
    id v14 = [(PUPhotosGridViewController *)self longPressGestureRecognizer];

    if (v14 == v7)
    {
      BOOL v11 = 1;
      goto LABEL_11;
    }
  }
  else
  {
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  if (self->_tapGestureRecognizer == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    id v5 = [(PUPhotosGridViewController *)self longPressGestureRecognizer];

    if (v5 == v4)
    {
      LODWORD(self) = ![(PUImportViewController *)self isPeeking];
    }
    else
    {
      id v6 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];

      if (v6 == v4)
      {
        unsigned __int8 v8 = [(PUPhotosGridViewController *)self canNavigateToPhotoInteractively:1];
      }
      else
      {
        id v7 = [(PUImportViewController *)self doubleTapGestureRecognizer];

        if (v7 == v4)
        {
          id v9 = [(PUImportViewController *)self doubleTapGestureRecognizer];
          LOBYTE(self) = [(PUImportViewController *)self canBeginDoubleTapGesture:v9];

          goto LABEL_11;
        }
        v11.receiver = self;
        v11.super_class = (Class)PUImportViewController;
        unsigned __int8 v8 = [(PUPhotosGridViewController *)&v11 gestureRecognizerShouldBegin:v4];
      }
      LOBYTE(self) = v8;
    }
  }
LABEL_11:

  return (char)self;
}

- (void)uninstallGestureRecognizers
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v7 uninstallGestureRecognizers];
  v3 = [(UITapGestureRecognizer *)self->_tapGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_tapGestureRecognizer];

  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = 0;

  id v5 = [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer view];
  [v5 removeGestureRecognizer:self->_doubleTapGestureRecognizer];

  doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
  self->_doubleTapGestureRecognizer = 0;
}

- (void)installGestureRecognizers
{
  v8.receiver = self;
  v8.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v8 installGestureRecognizers];
  v3 = [(PUImportViewController *)self view];
  if (!self->_tapGestureRecognizer)
  {
    id v4 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleTapGesture_];
    tapGestureRecognizer = self->_tapGestureRecognizer;
    self->_tapGestureRecognizer = v4;

    [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
    [v3 addGestureRecognizer:self->_tapGestureRecognizer];
  }
  if (!self->_doubleTapGestureRecognizer)
  {
    id v6 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_handleDoubleTapGesture_];
    doubleTapGestureRecognizer = self->_doubleTapGestureRecognizer;
    self->_doubleTapGestureRecognizer = v6;

    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setDelegate:self];
    [(UITapGestureRecognizer *)self->_doubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [v3 addGestureRecognizer:self->_doubleTapGestureRecognizer];
  }
}

- (PXSimpleIndexPath)selectionIndexPathForItem:(SEL)a3
{
  id v6 = a4;
  if (v6)
  {
    id v13 = v6;
    objc_super v7 = [(PUImportViewController *)self importController];
    objc_super v8 = [v7 selectionManager];

    id v9 = [v8 dataSourceManager];
    uint64_t v10 = [v9 dataSource];

    *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
    *(_OWORD *)&retstr->item = 0u;
    if (v10) {
      [v10 itemIndexPathForItem:v13];
    }

    id v6 = v13;
  }
  else
  {
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F91348] + 16);
    *(_OWORD *)&retstr->dataSourceIdentifier = *MEMORY[0x1E4F91348];
    *(_OWORD *)&retstr->item = v11;
  }

  return result;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = [(PUPhotosGridViewController *)self contentScrollView];
  uint64_t v10 = [(PUImportViewController *)self collectionView];
  objc_msgSend(v9, "convertPoint:fromView:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  v15 = [(PUImportViewController *)self importDataSource];
  id v28 = 0;
  id v29 = 0;
  uint64_t v16 = -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, &v29, &v28, v12, v14);
  id v17 = v29;
  id v18 = v28;
  long long v26 = 0u;
  *(void *)&long long v27 = 0;
  [v15 identifier];
  PXSimpleIndexPathFromIndexPath();
  __int16 v19 = 0;
  uint64_t v20 = *MEMORY[0x1E4F91310];
  __int16 v21 = (long long *)MEMORY[0x1E4F91348];
  if (*MEMORY[0x1E4F91310])
  {
    memset(buf, 0, 32);
    __int16 v19 = [v15 assetAtItemIndexPath:buf];
    if (([v19 isSelectable] & 1) == 0)
    {
      long long v26 = *v21;
      long long v27 = v21[1];
    }
  }
  uint64_t v22 = _importGridLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[PUImportViewController swipeSelectionManager:itemIndexPathClosestAboveLocation:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = *((void *)&v26 + 1);
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v27;
    _os_log_debug_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEBUG, "%s: [%ld, %ld]", buf, 0x20u);
  }

  long long v23 = v21[1];
  *(_OWORD *)&retstr->dataSourceIdentifier = *v21;
  *(_OWORD *)&retstr->item = v23;
  if ((void)v26 != v20)
  {
    [(PUImportViewController *)self selectionIndexPathForItem:v19];
    long long v24 = *(_OWORD *)&buf[16];
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)buf;
    *(_OWORD *)&retstr->item = v24;
  }

  return result;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = [(PUPhotosGridViewController *)self contentScrollView];
  uint64_t v10 = [(PUImportViewController *)self collectionView];
  objc_msgSend(v9, "convertPoint:fromView:", v10, x, y);
  double v12 = v11;
  double v14 = v13;

  v15 = [(PUImportViewController *)self importDataSource];
  id v28 = 0;
  id v29 = 0;
  uint64_t v16 = -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, &v29, &v28, v12, v14);
  id v17 = v29;
  id v18 = v28;
  long long v26 = 0u;
  *(void *)&long long v27 = 0;
  [v15 identifier];
  PXSimpleIndexPathFromIndexPath();
  __int16 v19 = 0;
  uint64_t v20 = *MEMORY[0x1E4F91310];
  __int16 v21 = (long long *)MEMORY[0x1E4F91348];
  if (*MEMORY[0x1E4F91310])
  {
    memset(buf, 0, 32);
    __int16 v19 = [v15 assetAtItemIndexPath:buf];
    if (([v19 isSelectable] & 1) == 0)
    {
      long long v26 = *v21;
      long long v27 = v21[1];
    }
  }
  uint64_t v22 = _importGridLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[PUImportViewController swipeSelectionManager:itemIndexPathClosestLeadingLocation:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = *((void *)&v26 + 1);
    *(_WORD *)&buf[22] = 2048;
    *(void *)&buf[24] = v27;
    _os_log_debug_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEBUG, "%s: [%ld, %ld]", buf, 0x20u);
  }

  long long v23 = v21[1];
  *(_OWORD *)&retstr->dataSourceIdentifier = *v21;
  *(_OWORD *)&retstr->item = v23;
  if ((void)v26 != v20)
  {
    [(PUImportViewController *)self selectionIndexPathForItem:v19];
    long long v24 = *(_OWORD *)&buf[16];
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)buf;
    *(_OWORD *)&retstr->item = v24;
  }

  return result;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = [(PUImportViewController *)self collectionView];
  uint64_t v10 = objc_msgSend(v9, "indexPathForItemAtPoint:", x, y);

  if (v10)
  {
    double v11 = [(PUImportViewController *)self importDataSource];
    long long v20 = 0u;
    *(void *)&long long v21 = 0;
    [v11 identifier];
    PXSimpleIndexPathFromIndexPath();
    memset(buf, 0, sizeof(buf));
    double v12 = [v11 assetAtItemIndexPath:buf];
    int v13 = [v12 isSelectable];
    double v14 = (_OWORD *)MEMORY[0x1E4F91348];
    if ((v13 & 1) == 0)
    {
      long long v20 = *MEMORY[0x1E4F91348];
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F91348] + 16);
    }
    v15 = _importGridLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[4] = "-[PUImportViewController swipeSelectionManager:itemIndexPathAtLocation:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = *((void *)&v20 + 1);
      *(_WORD *)&buf[22] = 2048;
      *(void *)&buf[24] = v21;
      __int16 v23 = 1024;
      int v24 = v13;
      _os_log_debug_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEBUG, "%s: [%ld, %ld] (selectable: %d)", buf, 0x26u);
    }

    long long v16 = v14[1];
    *(_OWORD *)&retstr->dataSourceIdentifier = *v14;
    *(_OWORD *)&retstr->item = v16;
    if ((void)v20 != *MEMORY[0x1E4F91310])
    {
      [(PUImportViewController *)self selectionIndexPathForItem:v12];
      long long v17 = *(_OWORD *)&buf[16];
      *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)buf;
      *(_OWORD *)&retstr->item = v17;
    }
  }
  else
  {
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F91348] + 16);
    *(_OWORD *)&retstr->dataSourceIdentifier = *MEMORY[0x1E4F91348];
    *(_OWORD *)&retstr->item = v18;
  }

  return result;
}

- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3
{
  v3 = [(PUImportViewController *)self swipeSelectionManager];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)disableSwipeSelection
{
  swipeSelectionManager = self->_swipeSelectionManager;
  if (swipeSelectionManager)
  {
    [(PXSwipeSelectionManager *)swipeSelectionManager setDelegate:0];
    BOOL v4 = self->_swipeSelectionManager;
    self->_swipeSelectionManager = 0;
  }
}

- (void)enableSwipeSelection
{
  if (!self->_swipeSelectionManager)
  {
    id v7 = [(PUPhotosGridViewController *)self contentScrollView];
    v3 = [(PUImportViewController *)self importController];
    BOOL v4 = [v3 selectionManager];

    if (v4 && v7)
    {
      id v5 = (PXSwipeSelectionManager *)[objc_alloc(MEMORY[0x1E4F907D0]) initWithSelectionManager:v4 scrollView:v7];
      swipeSelectionManager = self->_swipeSelectionManager;
      self->_swipeSelectionManager = v5;

      [(PXSwipeSelectionManager *)self->_swipeSelectionManager setDelegate:self];
    }
  }
}

- (BOOL)canBeginSwipeSelectionAtScrollViewLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = [(PUImportViewController *)self importController];
  if ([v6 isImportingAssets]) {
    goto LABEL_4;
  }
  id v7 = [(PUImportViewController *)self importController];
  if ([v7 isDeletingAssets])
  {

LABEL_4:
LABEL_5:
    LOBYTE(v8) = 0;
    return v8;
  }
  uint64_t v10 = [(PUImportViewController *)self presentedViewController];

  if (v10) {
    goto LABEL_5;
  }
  double v11 = [(PUPhotosGridViewController *)self contentScrollView];
  double v12 = [(PUImportViewController *)self collectionView];
  int v13 = objc_msgSend(v12, "indexPathForItemAtPoint:", x, y);

  double v14 = [(PUImportViewController *)self collectionView];
  v15 = [v14 cellForItemAtIndexPath:v13];

  objc_msgSend(v11, "convertPoint:toView:", v15, x, y);
  unsigned int v8 = objc_msgSend(v15, "shouldBeginGestureForPoint:");
  long long v16 = _importGridLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315394;
    long long v18 = "-[PUImportViewController canBeginSwipeSelectionAtScrollViewLocation:]";
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    _os_log_debug_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEBUG, "%s: return %ld", (uint8_t *)&v17, 0x16u);
  }

  return v8;
}

- (void)stayScrolledToBottomIfAtBottomAfterDrag:(id)a3
{
  id v5 = a3;
  if ([(PUImportViewController *)self userHasScrolled])
  {
    BOOL v4 = [(PUImportViewController *)self importController];

    if (v4) {
      -[PUImportViewController setShouldStayScrolledToBottom:](self, "setShouldStayScrolledToBottom:", objc_msgSend(v5, "px_isScrolledAtEdge:", 3));
    }
  }
}

- (void)navigateToBottomAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUImportViewController *)self setUserHasScrolled:1];
  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v5 navigateToBottomAnimated:v3];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v5 scrollViewDidScroll:v4];
  [(PUImportViewController *)self updateNavigationTitleViewVisibilityAnimated:1];
  [(PUImportViewController *)self updateCompactWidthToolbarTopConstraint];
  if (([v4 isDragging] & 1) == 0) {
    [(PUImportViewController *)self stayScrolledToBottomIfAtBottomAfterDrag:v4];
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 1;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v4 scrollViewWillBeginDragging:a3];
  [(PUImportViewController *)self setUserHasScrolled:1];
  [(PUImportViewController *)self setShouldStayScrolledToBottom:0];
}

- (CGRect)imageRectFromPhotoView:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 contentHelper];
  [v3 bounds];
  objc_msgSend(v4, "imageContentFrameForBounds:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "convertRect:toView:", 0, v6, v8, v10, v12);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)didTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v23 = v7;
    char v11 = 0;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v8);
        }
        double v14 = [*(id *)(*((void *)&v26 + 1) + 8 * i) importItem];
        char v15 = [v14 isDuplicate];
        *(_OWORD *)buf = 0u;
        long long v25 = 0u;
        double v16 = [(PUImportViewController *)self importDataSource];
        double v17 = v16;
        if (v16)
        {
          [v16 itemIndexPathForItem:v14];
        }
        else
        {
          *(_OWORD *)buf = 0u;
          long long v25 = 0u;
        }
        v11 |= v15;

        double v18 = PXIndexPathFromSimpleIndexPath();
        double v19 = [(PUImportViewController *)self collectionView];
        double v20 = [v19 cellForItemAtIndexPath:v18];

        [v20 setAlpha:1.0];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
    [(PUImportViewController *)self setItemsBeingTransitioned:0];
    id v7 = v23;
    if ((v11 & 1) != 0
      && [(PUImportViewController *)self shouldCollapseAlreadyImportedSection])
    {
      [(PUImportViewController *)self toggleAlreadyImportedExpansion];
    }
  }
  else
  {
    [(PUImportViewController *)self setItemsBeingTransitioned:0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v21 = [v7 topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v22 = _importGridLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEFAULT, "Dismissed Import One Up", buf, 2u);
      }
    }
  }
}

- (void)willTransitionFromViewController:(id)a3 toViewController:(id)a4 withTransitionItems:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  [(PUImportViewController *)self setItemsBeingTransitioned:v7];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = [*(id *)(*((void *)&v22 + 1) + 8 * i) importItem];
        long long v20 = 0u;
        long long v21 = 0u;
        double v14 = [(PUImportViewController *)self importDataSource];
        char v15 = v14;
        if (v14)
        {
          [v14 itemIndexPathForItem:v13];
        }
        else
        {
          long long v20 = 0u;
          long long v21 = 0u;
        }

        double v16 = PXIndexPathFromSimpleIndexPath();
        double v17 = [(PUImportViewController *)self collectionView];
        double v18 = [v17 cellForItemAtIndexPath:v16];

        [v18 setAlpha:0.0];
        double v19 = [(PUImportViewController *)self itemsBeingTransitioned];
        [v19 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (void)prepareTransitionItemViewForDestination:(id)a3
{
  id v4 = a3;
  double v5 = [v4 transitionView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 initialFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v4 targetFrame];
    objc_msgSend(v5, "setInitialFrame:targetFrame:", v7, v9, v11, v13, v14, v15, v16, v17);
    double v18 = [v4 importItem];
    long long v31 = 0u;
    long long v32 = 0u;
    double v19 = [(PUImportViewController *)self importDataSource];
    long long v20 = v19;
    if (v19)
    {
      [v19 itemIndexPathForItem:v18];
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
    }

    long long v21 = PXIndexPathFromSimpleIndexPath();
    long long v22 = [(PUImportViewController *)self collectionView];
    long long v23 = [v22 cellForItemAtIndexPath:v21];

    long long v24 = [v23 photoView];
    long long v25 = [v24 contentHelper];
    [v25 contentAlpha];
    double v27 = v26;

    [v4 setTargetContentAlpha:v27];
    [v4 initialContentAlpha];
    double v29 = v28;
    [v4 targetContentAlpha];
    [v5 setPhotoViewInitialAlpha:v29 targetAlpha:v30];
  }
}

- (CGRect)targetFrameForTransitionItem:(id)a3
{
  id v4 = [a3 importItem];
  long long v35 = 0u;
  long long v36 = 0u;
  double v5 = [(PUImportViewController *)self importDataSource];
  double v6 = v5;
  if (v5)
  {
    [v5 itemIndexPathForItem:v4];
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
  }

  double v7 = PXIndexPathFromSimpleIndexPath();
  double v8 = [(PUImportViewController *)self collectionView];
  double v9 = [v8 indexPathsForVisibleItems];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {
    double v11 = [(PUImportViewController *)self collectionView];
    [v11 scrollToItemAtIndexPath:v7 atScrollPosition:2 animated:0];

    double v12 = [(PUImportViewController *)self collectionView];
    [v12 layoutIfNeeded];
  }
  double v13 = [(PUImportViewController *)self collectionView];
  double v14 = [v13 cellForItemAtIndexPath:v7];

  double v15 = [v14 photoView];
  [(PUImportViewController *)self imageRectFromPhotoView:v15];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  if ([v14 needsThumbnailRefresh])
  {
    long long v24 = [(PUImportViewController *)self importController];
    long long v25 = [v24 importMediaProvider];
    double v26 = [v25 cachedImageForModel:v4 atSize:0];

    if (v26)
    {
      [v14 setCachedImage:v26 isPlaceholder:0];
      [(PUImportViewController *)self imageRectFromPhotoView:v15];
      double v17 = v27;
      double v19 = v28;
      double v21 = v29;
      double v23 = v30;
    }
  }
  double v31 = v17;
  double v32 = v19;
  double v33 = v21;
  double v34 = v23;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (id)transitionItemsForContext:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a3 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  [v4 setModalPresentationStyle:0];
  objc_opt_class();
  id v5 = 0;
  if (objc_opt_isKindOfClass())
  {
    double v6 = [v4 topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }
  long long v35 = v4;
  double v7 = objc_msgSend(v5, "startingAssetReference", v5);
  double v8 = v7;
  long long v38 = 0u;
  long long v39 = 0u;
  if (v7) {
    [v7 indexPath];
  }
  double v9 = [(PUImportViewController *)self importDataSource];
  long long v36 = v38;
  long long v37 = v39;
  char v10 = [v9 assetAtItemIndexPath:&v36];

  long long v36 = v38;
  long long v37 = v39;
  double v11 = PXIndexPathFromSimpleIndexPath();
  double v12 = [(PUImportViewController *)self collectionView];
  double v13 = [v12 cellForItemAtIndexPath:v11];

  double v14 = [v13 photoView];
  [(PUImportViewController *)self imageRectFromPhotoView:v14];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = [v14 contentHelper];
  long long v24 = [v23 photoImage];

  long long v25 = [PUImportOneUpTransitionItem alloc];
  long long v36 = v38;
  long long v37 = v39;
  double v26 = -[PUImportOneUpTransitionItem initWithInitialFrame:snapshotImage:importItem:indexPath:](v25, "initWithInitialFrame:snapshotImage:importItem:indexPath:", v24, v10, &v36, v16, v18, v20, v22);
  double v27 = [v14 contentHelper];
  [v27 contentAlpha];
  -[PUImportOneUpTransitionItem setInitialContentAlpha:](v26, "setInitialContentAlpha:");

  double v28 = [PUImportOneUpTransitionView alloc];
  double v29 = [(PUImportViewController *)self importController];
  double v30 = [v29 importMediaProvider];
  double v31 = [(PUImportOneUpTransitionView *)v28 initWithImportItem:v10 startingImage:v24 mediaProvider:v30];
  [(PUImportOneUpTransitionItem *)v26 setTransitionView:v31];

  v40[0] = v26;
  double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];

  return v32;
}

- (void)handlePhotoOrStackPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportViewController *)self presentedViewController];
  double v6 = objc_msgSend(v5, "pu_modalTransition");
  if (([v6 isInteractive] & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUImportViewController;
    [(PUPhotosGridViewController *)&v7 handlePhotoOrStackPinchGestureRecognizer:v4];
  }
}

- (void)handleTouchEvent:(int64_t)a3 forCell:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_super v7 = _importGridLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[PUImportViewController handleTouchEvent:forCell:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    _os_log_debug_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "%s: %lu", buf, 0x16u);
  }

  double v8 = [v6 representedImportItem];
  double v9 = [v8 kind];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F90F08]];

  if (v10)
  {
    [(PUImportViewController *)self toggleAlreadyImportedExpansion];
    goto LABEL_19;
  }
  double v11 = [(PUImportViewController *)self importController];
  if ([v11 isImportingAssets])
  {

    goto LABEL_19;
  }
  double v12 = [(PUImportViewController *)self importController];
  char v13 = [v12 isDeletingAssets];

  if (v13) {
    goto LABEL_19;
  }
  if ([(PUImportViewController *)self shouldLongPressForOneUp]
    && !UIAccessibilityIsVoiceOverRunning())
  {
    goto LABEL_12;
  }
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_19;
    }
LABEL_12:
    if ([v8 isSelected]) {
      [(PUImportViewController *)self _deselectCell:v6];
    }
    else {
      [(PUImportViewController *)self _selectCell:v6];
    }
    goto LABEL_19;
  }
  memset(buf, 0, 32);
  double v14 = [(PUImportViewController *)self importDataSource];
  double v15 = v14;
  if (v14) {
    [v14 itemIndexPathForItem:v8];
  }
  else {
    memset(buf, 0, 32);
  }

  long long v17 = *(_OWORD *)buf;
  long long v18 = *(_OWORD *)&buf[16];
  double v16 = PXIndexPathFromSimpleIndexPath();
  -[PUImportViewController _navigateToPhotoAtIndexPath:animated:interactive:](self, "_navigateToPhotoAtIndexPath:animated:interactive:", v16, 1, 0, v17, v18);

LABEL_19:
}

- (void)handleLongPressGesture:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PUImportViewController *)self shouldLongPressForOneUp])
  {
    if (self->_acceptsLongPress && [v4 state] == 1)
    {
      self->_acceptsLongPress = 0;
      id v5 = _importGridLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        double v15 = "-[PUImportViewController handleLongPressGesture:]";
        _os_log_debug_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
      }

      id v6 = [(PUPhotosGridViewController *)self contentScrollView];
      [v4 locationInView:v6];
      double v8 = v7;
      double v10 = v9;
      if (!-[PUImportViewController compactWidthToolbarCoversLocation:](self, "compactWidthToolbarCoversLocation:")
        && !-[PUImportViewController sectionHeadersCoverLocation:](self, "sectionHeadersCoverLocation:", v8, v10))
      {
        double v11 = [(PUImportViewController *)self collectionView];
        double v12 = objc_msgSend(v11, "indexPathForItemAtPoint:", v8, v10);

        if (v12) {
          [(PUImportViewController *)self _navigateToPhotoAtIndexPath:v12 animated:1 interactive:0];
        }
      }
    }
    else if ([v4 state] >= 3)
    {
      self->_acceptsLongPress = 1;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PUImportViewController;
    [(PUPhotosGridViewController *)&v13 handleLongPressGesture:v4];
  }
}

- (BOOL)shouldLongPressForOneUp
{
  id v3 = [MEMORY[0x1E4F902D0] sharedInstance];
  BOOL v4 = [v3 longPressForOneUpInCompactMode]
    && [(PUImportViewController *)self compactLayoutMode]
    || [v3 longPressForOneUpInPadSpec]
    && ![(PUImportViewController *)self compactLayoutMode];

  return v4;
}

- (void)handleDoubleTapGesture:(id)a3
{
  BOOL v4 = [(PUImportViewController *)self importController];
  id v10 = [v4 selectionManager];

  id v5 = [v10 selectionSnapshot];
  if (![v5 isAnyItemSelected]) {
    goto LABEL_4;
  }
  id v6 = [v5 dataSource];
  uint64_t v7 = [v6 numberOfSelectableItems];

  double v8 = [v5 selectedIndexPaths];
  uint64_t v9 = [v8 count];

  if (v7 == v9) {
    [v10 performChanges:&__block_literal_global_634];
  }
  else {
LABEL_4:
  }
    [(PUImportViewController *)self selectAllSelectableItems];
}

uint64_t __49__PUImportViewController_handleDoubleTapGesture___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (BOOL)canBeginDoubleTapGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportViewController *)self importController];
  if ([v5 isImportingAssets])
  {
    BOOL v6 = 0;
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v7 = [(PUImportViewController *)self importController];
  char v8 = [v7 isDeletingAssets];

  if ((v8 & 1) == 0)
  {
    id v5 = [(PUPhotosGridViewController *)self contentScrollView];
    [v4 locationInView:v5];
    double v10 = v9;
    double v12 = v11;
    objc_msgSend(v5, "hitTest:withEvent:", 0);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    double v14 = v13;
    if (v13)
    {
      double v15 = v13;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v16 = [v15 superview];

        double v15 = (void *)v16;
        if (!v16) {
          goto LABEL_9;
        }
      }
      BOOL v6 = 0;
    }
    else
    {
LABEL_9:
      BOOL v17 = -[PUImportViewController sectionHeadersCoverLocation:](self, "sectionHeadersCoverLocation:", v10, v12);
      BOOL v18 = -[PUImportViewController compactWidthToolbarCoversLocation:](self, "compactWidthToolbarCoversLocation:", v10, v12);
      BOOL v6 = 1;
      if (v17 || v18) {
        goto LABEL_14;
      }
      double v19 = [(PUImportViewController *)self collectionView];
      double v15 = objc_msgSend(v19, "indexPathForItemAtPoint:", v10, v12);

      BOOL v6 = v15 == 0;
    }

LABEL_14:
    goto LABEL_15;
  }
  BOOL v6 = 0;
LABEL_16:

  return v6;
}

- (void)handleTapGesture:(id)a3
{
  id v13 = a3;
  id v4 = [(PUPhotosGridViewController *)self contentScrollView];
  [v13 locationInView:v4];
  double v6 = v5;
  double v8 = v7;
  if (!-[PUImportViewController compactWidthToolbarCoversLocation:](self, "compactWidthToolbarCoversLocation:")
    && !-[PUImportViewController sectionHeadersCoverLocation:](self, "sectionHeadersCoverLocation:", v6, v8))
  {
    double v9 = [(PUImportViewController *)self collectionView];
    double v10 = objc_msgSend(v9, "indexPathForItemAtPoint:", v6, v8);

    double v11 = [(PUImportViewController *)self collectionView];
    double v12 = [v11 cellForItemAtIndexPath:v10];

    [v12 handleTapGesture:v13];
  }
}

- (void)_navigateToPhotoAtIndexPath:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v10 = [v9 usePhotosOneUp];

  if (v10)
  {
    double v11 = [(PUImportViewController *)self importDataSourceManager];
    double v12 = [v11 dataSource];

    [v12 identifier];
    PXSimpleIndexPathFromIndexPath();
    memset(v33, 0, sizeof(v33));
    id v13 = [v12 assetReferenceAtItemIndexPath:v33];
    double v14 = [PUPXAssetsDataSourceManager alloc];
    double v15 = [(PUImportViewController *)self importDataSourceManager];
    uint64_t v16 = [(PUPXAssetsDataSourceManager *)v14 initWithUnderlyingDataSourceManager:v15];

    BOOL v17 = [PUPXMediaProvider alloc];
    BOOL v18 = [(PUImportViewController *)self importController];
    double v19 = [v18 importMediaProvider];
    uint64_t v20 = [(PUPXMediaProvider *)v17 initWithUnderlyingMediaProvider:v19];

    double v21 = [[PUBrowsingSession alloc] initWithDataSourceManager:v16 actionManager:0 mediaProvider:v20];
    double v22 = [(PUBrowsingSession *)v21 viewModel];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __75__PUImportViewController__navigateToPhotoAtIndexPath_animated_interactive___block_invoke;
    v29[3] = &unk_1E5F2E908;
    id v30 = v22;
    id v31 = v13;
    double v32 = v16;
    double v23 = v16;
    id v24 = v13;
    id v25 = v22;
    [v25 performChanges:v29];
    double v26 = [[PUOneUpViewController alloc] initWithBrowsingSession:v21];
    double v27 = [[PUNavigationController alloc] initWithNavigationBarClass:0 toolbarClass:objc_opt_class()];
    [(PUNavigationController *)v27 setModalPresentationStyle:0];
    [(PUNavigationController *)v27 pushViewController:v26 animated:0];
    [(PUImportViewController *)self presentViewController:v27 animated:1 completion:0];
  }
  else
  {
    double v28 = [(PUImportViewController *)self oneUpViewControllerForItemAtIndexPath:v8];
    [(PUImportViewController *)self presentOneUpViewController:v28 animated:v6 interactive:v5];
  }
}

void __75__PUImportViewController__navigateToPhotoAtIndexPath_animated_interactive___block_invoke(uint64_t a1)
{
  v2 = [PUPXAssetReference alloc];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) assetsDataSource];
  id v4 = [v6 identifier];
  BOOL v5 = [(PUPXAssetReference *)v2 initWithPXAssetReference:v3 dataSourceIdentifier:v4];
  [*(id *)(a1 + 32) setCurrentAssetReference:v5];
}

- (void)presentOneUpViewController:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = _importGridLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Presenting Import One Up", v16, 2u);
  }

  int v10 = [[PUNavigationController alloc] initWithNavigationBarClass:0 toolbarClass:objc_opt_class()];
  [(PUNavigationController *)v10 pushViewController:v8 animated:0];

  [(PUNavigationController *)v10 setModalPresentationStyle:0];
  double v11 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v12 = [v11 interactive1upPresentationEnabled];

  if (v12)
  {
    id v13 = [PUImportOneUpTransitionController alloc];
    double v14 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];
    double v15 = [(PUImportOneUpTransitionController *)v13 initWithPresentingViewController:self pinchGestureRecognizer:v14];

    [(UIViewController *)self pu_presentViewController:v10 transition:v15 animated:v6 interactive:v5 completion:0];
  }
  else
  {
    [(PUImportViewController *)self presentViewController:v10 animated:v6 completion:0];
  }
}

- (id)oneUpViewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUImportViewController *)self importDataSourceManager];
  BOOL v6 = [v5 dataSource];

  if (v4)
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    [v6 identifier];
    PXSimpleIndexPathFromIndexPath();
  }
  else
  {
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    if (v6) {
      [v6 firstItemIndexPath];
    }
  }
  v18[0] = v19;
  v18[1] = v20;
  double v7 = [v6 assetReferenceAtItemIndexPath:v18];

  id v8 = [v7 asset];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v10 = [v7 asset];
    if ([v10 isDuplicate]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  int v12 = [PUImportOneUpViewController alloc];
  id v13 = [(PUImportViewController *)self importController];
  double v14 = [(PUImportViewController *)self importController];
  double v15 = [v14 importMediaProvider];
  uint64_t v16 = [(PUImportOneUpViewController *)v12 initWithImportController:v13 mediaProvider:v15 startingAssetReference:v7 presentationFilter:v11];

  return v16;
}

- (void)updateDataSourceManagerFilters
{
  if ([(PUImportViewController *)self shouldCollapseAlreadyImportedSection])
  {
    uint64_t v3 = [(PUImportViewController *)self importDataSourceManager];
    id v4 = [v3 unfilteredAlreadyImportedAssetCollection];

    uint64_t v5 = [v4 numberOfItems];
    BOOL v6 = [(PUPhotosGridViewController *)self gridLayout];
    uint64_t v7 = [v6 columnsPerRow];

    id v8 = [(PUImportViewController *)self importController];
    [v8 setAlreadyImportedItemsSelectable:v5 <= v7];
  }
  else
  {
    id v4 = [(PUImportViewController *)self importController];
    [v4 setAlreadyImportedItemsSelectable:1];
  }

  if ([(PUImportViewController *)self shouldCollapseAlreadyImportedSection])
  {
    double v9 = [(PUPhotosGridViewController *)self gridLayout];
    uint64_t v10 = [v9 columnsPerRow];

    uint64_t v11 = [(PUImportViewController *)self importDataSourceManager];
    int v12 = v11;
    uint64_t v13 = v10;
  }
  else
  {
    uint64_t v11 = [(PUImportViewController *)self importDataSourceManager];
    int v12 = v11;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v11 setMaxAlreadyImportedItems:v13];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUImportViewController_updateDataSourceManagerFilters__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __56__PUImportViewController_updateDataSourceManagerFilters__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) importDataSourceManager];
  [v1 updateFilteredAssetsIfNeeded];
}

- (double)sectionedGridLayout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    *(_OWORD *)buf = 0u;
    long long v15 = 0u;
    BOOL v6 = [(PUImportViewController *)self importDataSource];
    [v6 identifier];
    PXSimpleIndexPathFromIndexPath();

    uint64_t v7 = [(PUImportViewController *)self importDataSource];
    memset(v13, 0, sizeof(v13));
    id v8 = [v7 assetAtItemIndexPath:v13];

    if (v8)
    {
      [v8 aspectRatio];
      double v10 = v9;
    }
    else
    {
      double v10 = 1.0;
    }
  }
  else
  {
    uint64_t v11 = PLUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "IndexPath missing for aspectRatioForItemAtIndexPath", buf, 2u);
    }

    double v10 = -1.0;
  }

  return v10;
}

- (double)sectionedGridLayout:(id)a3 accessibilitySectionHeaderHeightForVisualSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v7);

  if (IsAccessibilityCategory)
  {
    double v9 = [(PUImportViewController *)self _spec];
    uint64_t v10 = [v9 sectionHeaderStyle];

    uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
    int v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = [MEMORY[0x1E4F90580] sharedMetrics];
    double v14 = [v6 collectionView];
    [v14 bounds];
    [v13 accessibilitySectionHeaderHeightForStyle:v10 width:0 actionButton:0 disclosure:&stru_1F06BE7B8 title:v11 startDate:v12 endDate:CGRectGetWidth(v19) + -8.0 + -8.5 locations:MEMORY[0x1E4F1CBF0] actionButtonSpec:0];
    double v16 = v15;
  }
  else
  {
    [(PUImportViewController *)self sectionedGridLayout:v6 sectionHeaderHeightForVisualSection:a4];
    double v16 = v17;
  }

  return v16;
}

- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4
{
  id v6 = [(PUImportViewController *)self referenceHeaderView];
  uint64_t v7 = [(PUImportViewController *)self cachedHeaderHeight];

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a4];
    [(PUImportViewController *)self configureSupplementaryView:v6 ofKind:@"PUImportSectionHeaderReuseIdentifier" forIndexPath:v8];
    double v9 = [(PUImportViewController *)self traitCollection];
    uint64_t v10 = [v9 horizontalSizeClass];
    uint64_t v11 = [(PUImportViewController *)self collectionView];
    [v11 bounds];
    double Width = CGRectGetWidth(v25);
    uint64_t v13 = [(PUPhotosGridViewController *)self gridSpec];
    [v13 sectionHeaderInsets];
    objc_msgSend(v6, "heightForSizeClass:width:safeAreaInsets:", v10, Width, v14, v15, v16, v17);
    double v19 = v18;

    long long v20 = [NSNumber numberWithDouble:v19];
    [(PUImportViewController *)self setCachedHeaderHeight:v20];
  }
  double v21 = [(PUImportViewController *)self cachedHeaderHeight];
  [v21 doubleValue];
  double v23 = v22;

  return v23;
}

- (BOOL)anyAlreadyImportedItemsAreSelected
{
  v2 = [(PUImportViewController *)self importController];
  uint64_t v3 = [v2 selectionManager];

  id v4 = [v3 selectionSnapshot];
  id v5 = [v4 dataSource];
  id v6 = [v5 alreadyImportedCollection];
  if (v6)
  {
    uint64_t v7 = [v5 sectionForAssetCollection:v6];
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    id v8 = [v4 selectedIndexPaths];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PUImportViewController_anyAlreadyImportedItemsAreSelected__block_invoke;
    v11[3] = &unk_1E5F26528;
    v11[4] = &v12;
    v11[5] = v7;
    [v8 enumerateItemIndexPathsUsingBlock:v11];

    BOOL v9 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __60__PUImportViewController_anyAlreadyImportedItemsAreSelected__block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(a2 + 8) == *(void *)(result + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)updateAlreadyImportedCollapseStatus
{
  int v3 = [(PUImportViewController *)self anyAlreadyImportedItemsAreSelected];
  id v4 = [(PUImportViewController *)self importDataSourceManager];
  id v9 = [v4 unfilteredAlreadyImportedAssetCollection];

  uint64_t v5 = [v9 numberOfItems];
  id v6 = [(PUPhotosGridViewController *)self gridLayout];
  uint64_t v7 = [v6 columnsPerRow];

  if ([(PUImportViewController *)self userWantsAlreadyImportedSectionCollapsedIfPossible])
  {
    uint64_t v8 = (v5 > v7) & ~v3;
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(PUImportViewController *)self setShouldCollapseAlreadyImportedSection:v8];
  [(PUImportViewController *)self updateAlreadyImportedHeaderIfVisible];
  [(PUImportViewController *)self updateDataSourceManagerFilters];
}

- (void)toggleAlreadyImportedExpansion
{
  [(PUImportViewController *)self setUserWantsAlreadyImportedSectionCollapsedIfPossible:[(PUImportViewController *)self userWantsAlreadyImportedSectionCollapsedIfPossible] ^ 1];
  [(PUImportViewController *)self updateAlreadyImportedCollapseStatus];
}

- (void)selectAllSelectableItems
{
  int v3 = [(PUImportViewController *)self importDataSource];
  id v5 = [v3 allSelectableItems];

  id v4 = [(PUImportViewController *)self importController];
  [v4 setSelected:1 forItems:v5];
}

- (BOOL)areAllItemsSelectedInAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportViewController *)self importDataSource];
  uint64_t v6 = [v5 sectionForAssetCollection:v4];
  uint64_t v7 = [(PUImportViewController *)self importController];
  uint64_t v8 = [v7 selectionManager];

  id v9 = [v8 selectionSnapshot];
  uint64_t v10 = [v9 selectedIndexPaths];
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _OWORD v13[2] = __63__PUImportViewController_areAllItemsSelectedInAssetCollection___block_invoke;
  v13[3] = &unk_1E5F26528;
  v13[4] = &v14;
  v13[5] = v6;
  [v10 enumerateItemIndexPathsUsingBlock:v13];
  uint64_t v11 = [v4 numberOfItems];
  LOBYTE(v6) = v15[3] == v11;
  _Block_object_dispose(&v14, 8);

  return v6;
}

uint64_t __63__PUImportViewController_areAllItemsSelectedInAssetCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 8) == *(void *)(result + 40)) {
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

- (void)setAllItemsSelected:(BOOL)a3 inAssetCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__37362;
  uint64_t v13 = __Block_byref_object_dispose__37363;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PUImportViewController_setAllItemsSelected_inAssetCollection___block_invoke;
  v8[3] = &unk_1E5F26500;
  v8[4] = &v9;
  [v6 arrangedObjects:v8];
  uint64_t v7 = [(PUImportViewController *)self importController];
  [v7 setSelected:v4 forItems:v10[5]];

  _Block_object_dispose(&v9, 8);
}

void __64__PUImportViewController_setAllItemsSelected_inAssetCollection___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)sectionHeadersCoverLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = [(PUImportViewController *)self collectionView];
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  uint64_t v11 = [(PUImportViewController *)self collectionView];
  uint64_t v12 = [v11 indexPathsForVisibleSupplementaryElementsOfKind:@"PUImportSectionHeaderReuseIdentifier"];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = [(PUImportViewController *)self collectionView];
        long long v20 = [(id)v19 supplementaryViewForElementKind:@"PUImportSectionHeaderReuseIdentifier" atIndexPath:v18];

        [v20 bounds];
        objc_msgSend(v20, "convertRect:toView:", 0);
        v29.double x = v8;
        v29.double y = v10;
        LOBYTE(v19) = CGRectContainsPoint(v30, v29);

        if (v19)
        {
          BOOL v21 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v21 = 0;
LABEL_11:

  return v21;
}

- (void)updateHeaderView:(id)a3 forAssetCollection:(id)a4
{
  id v8 = a3;
  LODWORD(a4) = [(PUImportViewController *)self areAllItemsSelectedInAssetCollection:a4];
  [v8 setShowsActionButton:1];
  if (a4) {
    id v6 = @"DESELECT_BUTTON_TITLE";
  }
  else {
    id v6 = @"SELECT_BUTTON_TITLE";
  }
  double v7 = PULocalizedString(v6);
  [v8 setActionText:v7];

  [v8 layoutIfNeeded];
}

- (void)updateHeaderView:(id)a3 forAlreadyImportedAssetCollection:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  double v7 = [(PUPhotosGridViewController *)self gridLayout];
  uint64_t v8 = [v7 columnsPerRow];

  uint64_t v9 = [v6 numberOfItems];
  if (v9 <= v8)
  {
    [v13 setShowsActionButton:0];
    [v13 setActionText:0];
  }
  else
  {
    [v13 setShowsActionButton:1];
    [(PUImportViewController *)self shouldCollapseAlreadyImportedSection];
    CGFloat v10 = PLLocalizedFrameworkString();
    [v13 setActionText:v10];

    BOOL v11 = [(PUImportViewController *)self anyAlreadyImportedItemsAreSelected];
    if ([(PUImportViewController *)self animateHeaderActionButtonChanges]) {
      uint64_t v12 = [(PUImportViewController *)self px_isVisible];
    }
    else {
      uint64_t v12 = 0;
    }
    [v13 setActionButtonEnabled:!v11 animated:v12];
  }
  [v13 layoutIfNeeded];
}

- (void)headerViewDidPressActionButton:(id)a3 inHeaderView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v13 = 0;
  if (v7) {
    objc_msgSend(v7, "sectionIndexPath", 0);
  }
  uint64_t v9 = [(PUImportViewController *)self importDataSource];
  CGFloat v10 = [v9 assetCollectionForSection:0];

  if ([v10 alreadyImportedGroup])
  {
    [(PUImportViewController *)self toggleAlreadyImportedExpansion];
  }
  else
  {
    if ([(PUImportViewController *)self areAllItemsSelectedInAssetCollection:v10])
    {
      BOOL v11 = self;
      uint64_t v12 = 0;
    }
    else
    {
      BOOL v11 = self;
      uint64_t v12 = 1;
    }
    [(PUImportViewController *)v11 setAllItemsSelected:v12 inAssetCollection:v10];
  }
}

- (BOOL)isPreheatingEnabled
{
  return 0;
}

- (BOOL)isContentViewInSyncWithModel
{
  return 1;
}

- (void)configureCollectionViewGridLayout:(id)a3
{
  id v3 = a3;
  [v3 setSectionTopPadding:1.0];
  [v3 setFloatingSectionHeadersEnabled:1];
}

- (void)_getDataForVisualSection:(int64_t)a3 hasActionButton:(BOOL *)a4 title:(id *)a5 startDate:(id *)a6 endDate:(id *)a7
{
  CGFloat v10 = [(PUImportViewController *)self importDataSource];
  id v11 = [v10 assetCollectionForSection:a3];

  if (a5)
  {
    *a5 = [v11 localizedTitle];
  }
  if (a4) {
    *a4 = 0;
  }
}

- (void)_updateBackdropGroupNameForHeaderView:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportViewController *)self navigationController];
  id v7 = [v5 navigationBar];

  id v6 = [v7 _backdropViewLayerGroupName];
  [v4 setBackdropViewGroupName:v6];
}

- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"PUImportSectionHeaderReuseIdentifier"])
  {
    id v11 = v8;
    uint64_t v12 = [(PUImportViewController *)self importDataSource];
    uint64_t v13 = objc_msgSend(v12, "assetCollectionForSection:", objc_msgSend(v10, "section"));

    uint64_t v14 = [v13 localizedTitle];
    uint64_t v15 = [(PUImportViewController *)self importDataSource];
    uint64_t v16 = [v15 identifier];
    uint64_t v17 = [v10 section];

    v29[0] = v16;
    v29[1] = v17;
    long long v30 = xmmword_1AEFF7BB0;
    [v11 setSectionIndexPath:v29];
    uint64_t v28 = (void *)v14;
    [v11 setPrimaryText:v14];
    uint64_t v18 = [(PUImportViewController *)self importDataSourceManager];
    uint64_t v19 = [v18 unfilteredDataSource];

    long long v20 = [v13 identifier];
    BOOL v21 = [v19 assetCollectionForIdentifier:v20];

    uint64_t v22 = [v21 numberOfItems];
    if (v22 < 1)
    {
      long long v25 = 0;
    }
    else
    {
      uint64_t v23 = v22;
      long long v24 = PULocalizedString(@"IMPORT_ITEMS_COUNT");
      uint64_t v27 = v23;
      long long v25 = PULocalizedStringWithValidatedFormat(v24, @"%d");
    }
    objc_msgSend(v11, "setSecondaryText:", v25, v27);
    if ([v13 alreadyImportedGroup]) {
      [(PUImportViewController *)self updateHeaderView:v11 forAlreadyImportedAssetCollection:v21];
    }
    else {
      [(PUImportViewController *)self updateHeaderView:v11 forAssetCollection:v21];
    }
    long long v26 = [(PUPhotosGridViewController *)self gridSpec];
    [v26 sectionHeaderInsets];
    objc_msgSend(v11, "setContentInsets:");

    [(PUImportViewController *)self _updateBackdropGroupNameForHeaderView:v11];
  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)PUImportViewController;
    [(PUPhotosGridViewController *)&v31 configureSupplementaryView:v8 ofKind:v9 forIndexPath:v10];
  }
}

- (void)updateAlreadyImportedHeaderIfVisible
{
  id v3 = [(PUImportViewController *)self importDataSource];
  id v11 = [v3 alreadyImportedCollection];

  id v4 = [(PUImportViewController *)self importDataSource];
  uint64_t v5 = [v4 sectionForAssetCollection:v11];

  id v6 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v5];
  id v7 = [(PUImportViewController *)self collectionView];
  id v8 = [v7 indexPathsForVisibleSupplementaryElementsOfKind:@"PUImportSectionHeaderReuseIdentifier"];

  if ([v8 containsObject:v6])
  {
    id v9 = [(PUImportViewController *)self collectionView];
    id v10 = [v9 supplementaryViewForElementKind:@"PUImportSectionHeaderReuseIdentifier" atIndexPath:v6];

    [(PUImportViewController *)self configureSupplementaryView:v10 ofKind:@"PUImportSectionHeaderReuseIdentifier" forIndexPath:v6];
  }
}

- (id)newGridLayout
{
  id v3 = objc_alloc_init(PUImportSectionedGridLayout);
  [(PUImportSectionedGridLayout *)v3 setDelegate:self];
  [(PUSectionedGridLayout *)v3 setSectionHeaderElementKind:@"PUImportSectionHeaderReuseIdentifier"];
  [(PUImportViewController *)self configureCollectionViewGridLayout:v3];
  return v3;
}

- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6
{
  if ([(PUImportViewController *)self importSourceIsAppleDevice])
  {
    id v11 = [(PUImportViewController *)self importController];
    int v12 = [v11 isUserRequiredToTrustHostOnSourceDevice];

    uint64_t v13 = [(PUImportViewController *)self importController];
    uint64_t v14 = v13;
    if (v12)
    {
      uint64_t v15 = [v13 importSource];
      id v16 = [v15 productKind];

      uint64_t v17 = [NSString stringWithFormat:@"UNLOCK_DEVICE_%@", v16];
      PLLocalizedFrameworkString();
      id v18 = objc_claimAutoreleasedReturnValue();
      *a3 = v18;
      *a4 = 0;
      *a5 = 0;
      *a6 = 0;

LABEL_6:
      goto LABEL_8;
    }
    int v19 = [v13 isLoadingInitialBatchOfAssets];

    if (v19)
    {
      long long v20 = [(PUImportViewController *)self importController];
      BOOL v21 = [v20 importSource];
      id v16 = [v21 name];

      uint64_t v17 = PLLocalizedFrameworkString();
      PULocalizedStringWithValidatedFormat(v17, @"%@");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      *a4 = 0;
      *a5 = 0;
      *a6 = 0;
      goto LABEL_6;
    }
  }
  PLLocalizedFrameworkString();
  id v16 = objc_claimAutoreleasedReturnValue();
  *a3 = v16;
LABEL_8:

  PLLocalizedFrameworkString();
  id v22 = objc_claimAutoreleasedReturnValue();
  *a4 = v22;
  *a5 = 0;
  *a6 = 0;
}

- (BOOL)importSourceIsAppleDevice
{
  id v3 = [(PUImportViewController *)self importController];
  id v4 = [v3 importSource];
  uint64_t v5 = [v4 productKind];

  id v6 = [(PUImportViewController *)self importController];
  id v7 = [v6 importSource];
  id v8 = [v7 name];

  BOOL v9 = ([v5 isEqualToString:@"Camera"] & 1) == 0 && objc_msgSend(v8, "length") != 0;
  return v9;
}

- (BOOL)wantsPlaceholderView
{
  BOOL v3 = [(PUImportViewController *)self isEmpty];
  id v4 = [(PUImportViewController *)self importController];
  char v5 = [v4 isLoadingInitialBatchOfAssets];

  BOOL v6 = [(PUImportViewController *)self importSourceIsAppleDevice];
  id v7 = [(PUImportViewController *)self importController];
  char v8 = [v7 isUserRequiredToTrustHostOnSourceDevice];

  if (v8) {
    return 1;
  }
  else {
    return v3 & (v5 & v6 | v5 ^ 1);
  }
}

- (BOOL)isEmpty
{
  v2 = [(PUImportViewController *)self importDataSource];
  BOOL v3 = [v2 numberOfItems] == 0;

  return v3;
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = _importGridLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    BOOL v9 = "-[PUImportViewController updateNavigationBarAnimated:]";
    _os_log_debug_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "%s: [PUPhotosGridViewController] super squash", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(PUImportViewController *)self importController];
  char v7 = [v6 isLoadingContent];

  if ((v7 & 1) == 0) {
    [(PUImportViewController *)self _updateToolbarAnimated:v3];
  }
}

- (BOOL)canDragOut
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = _importGridLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    char v5 = "-[PUImportViewController canDragOut]";
    _os_log_debug_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEBUG, "%s: [PUPhotosGridViewController] super squash", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (int64_t)contentFillModeForImportCell:(id)a3
{
  BOOL v3 = [(PUImportViewController *)self _spec];
  int64_t v4 = [v3 cellFillMode];

  return v4;
}

- (void)importCell:(id)a3 didRequestCancellationOfThumbnailRequestWithID:(int64_t)a4
{
  id v6 = [(PUImportViewController *)self importController];
  char v5 = [v6 importMediaProvider];
  [v5 cancelImageRequest:a4];
}

- (int64_t)importCell:(id)a3 requestImageForImportItem:(id)a4 ofSize:(unint64_t)a5 completion:(id)a6
{
  id v9 = a6;
  if (v9)
  {
    id v10 = a4;
    id v11 = [(PUImportViewController *)self importController];
    int v12 = [v11 importMediaProvider];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __81__PUImportViewController_importCell_requestImageForImportItem_ofSize_completion___block_invoke;
    v15[3] = &unk_1E5F264D8;
    id v16 = v9;
    int64_t v13 = [v12 requestImageForImportItem:v10 ofSize:a5 completion:v15];
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

uint64_t __81__PUImportViewController_importCell_requestImageForImportItem_ofSize_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGSize)gridItemSize
{
  v2 = [(PUImportViewController *)self _gridLayout];
  [v2 itemSize];
  double v4 = v3;
  double v6 = v5;

  if (v4 == *MEMORY[0x1E4F1DB30] && v6 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    _PFAssertContinueHandler();
  }
  double v8 = v4;
  double v9 = v6;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = [(PUImportViewController *)self collectionView];
  double v6 = [v5 indexPathsForVisibleItems];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(PUImportViewController *)self _updateItemViewAtIndex:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)notifyUserOfImportCompletionIfNeededWithImportSession:(id)a3 results:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [(PUImportViewController *)self importController];
  uint64_t v10 = [v9 importSource];

  p_completedImportSessionInfo = &self->_completedImportSessionInfo;
  objc_storeStrong((id *)&self->_completedImportSessionInfo, a3);
  if (!self->_completedImportSessionInfo) {
    _PFAssertContinueHandler();
  }
  long long v12 = [v8 importRecords];
  if (!v10)
  {
    self->_completedAnImport = 0;
    [0 canDeleteContent];
    goto LABEL_52;
  }
  long long v13 = [(PXImportSessionInfo *)*p_completedImportSessionInfo importedItems];
  self->_completedAnImport = [v13 count] != 0;

  int v14 = [v10 canDeleteContent];
  uint64_t v15 = [(PXImportSessionInfo *)*p_completedImportSessionInfo importedItems];
  uint64_t v16 = [v15 count];

  if (v16) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (!v17)
  {
    int v18 = [(PXImportSessionInfo *)*p_completedImportSessionInfo importStopped];
    int v19 = _importGridLog();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "Showing Import Complete Dialog: Import Stopped", buf, 2u);
      }
    }
    else if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEFAULT, "Showing Import Complete Dialog: Import Complete", buf, 2u);
    }

    uint64_t v21 = PLLocalizedFrameworkString();
    v51 = PLLocalizedFrameworkString();
    v50 = PLLocalizedFrameworkString();
    id v22 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"KEEPORDELETE_"];
    v46 = v12;
    id v47 = v7;
    v48 = (void *)v21;
    v49 = v22;
    if ([v12 count] == 1)
    {
      uint64_t v23 = [v12 objectAtIndex:0];
      long long v24 = [v23 importAsset];

      if ([v24 isImage] && !objc_msgSend(v24, "isLivePhoto"))
      {
        long long v25 = @"PHOTO_";
      }
      else if ([v24 isMovie])
      {
        long long v25 = @"VIDEO_";
      }
      else
      {
        long long v25 = @"MEDIA_";
      }
      [v22 appendString:v25];

      goto LABEL_42;
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v26 = v12;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v55;
      char v30 = 1;
      int v31 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(v26);
          }
          double v33 = [*(id *)(*((void *)&v54 + 1) + 8 * i) importAsset];
          if ([v33 isImage])
          {
            int v31 = 0;
          }
          else
          {
            char v30 = 0;
            v31 &= [v33 isMovie];
          }

          if ((v30 & 1) == 0 && !v31)
          {

            id v22 = v49;
            [v49 appendString:@"MEDIA_"];
            uint64_t v21 = (uint64_t)v48;
            goto LABEL_42;
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v28) {
          continue;
        }
        break;
      }

      uint64_t v21 = (uint64_t)v48;
      if ((v30 & 1) == 0)
      {
        id v22 = v49;
        if (!v31) {
          goto LABEL_42;
        }
        double v34 = @"VIDEOS_";
        goto LABEL_39;
      }
    }
    else
    {
    }
    double v34 = @"PHOTOS_";
    id v22 = v49;
LABEL_39:
    [v22 appendString:v34];
LABEL_42:
    long long v35 = [v10 productKind];
    long long v36 = [v10 name];
    if (([v35 isEqualToString:@"Camera"] & 1) != 0 || !objc_msgSend(v36, "length"))
    {
      [v22 appendString:v35];
      long long v38 = PLLocalizedFrameworkString();
    }
    else
    {
      [v22 appendString:@"FORMAT"];
      long long v37 = PLLocalizedFrameworkString();
      long long v38 = PUStringWithValidatedFormat();
    }
    id v7 = v47;
    *(_DWORD *)buf = 0;
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v39 setObject:v21 forKey:*MEMORY[0x1E4F1D990]];
    [v39 setObject:v38 forKey:*MEMORY[0x1E4F1D9A8]];
    [v39 setObject:v51 forKey:*MEMORY[0x1E4F1D9E0]];
    [v39 setObject:v50 forKey:*MEMORY[0x1E4F1D9D0]];
    v40 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0.0, 3uLL, (SInt32 *)buf, (CFDictionaryRef)v39);
    self->_importCompleteNotification = v40;
    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v40, (CFUserNotificationCallBack)_ImportCompleteAlertNotificationResponseHandler, 0);
    if (RunLoopSource)
    {
      v42 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v42, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      importCompleteNotification = v42;
    }
    else
    {
      v45 = PLCameraConnectionKitGetLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_1AE9F8000, v45, OS_LOG_TYPE_ERROR, "Couldn't create runloop source for notification", v52, 2u);
      }

      importCompleteNotification = self->_importCompleteNotification;
    }
    CFRelease(importCompleteNotification);

    long long v12 = v46;
  }
LABEL_52:
}

- (void)importController:(id)a3 didLoadAssets:(id)a4 exceptions:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if (![a4 count] && objc_msgSend(v6, "count"))
  {
    id v7 = _importGridLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_error_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Error(s) loading assets: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)importController:(id)a3 didCompleteImportWithImportSession:(id)a4 results:(id)a5 completion:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = _importGridLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[PUImportViewController importController:didCompleteImportWithImportSession:results:completion:]";
    _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  dispatch_time_t v13 = dispatch_time(0, 500000000);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__PUImportViewController_importController_didCompleteImportWithImportSession_results_completion___block_invoke;
  v17[3] = &unk_1E5F2A248;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  dispatch_after(v13, MEMORY[0x1E4F14428], v17);
}

uint64_t __97__PUImportViewController_importController_didCompleteImportWithImportSession_results_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyUserOfImportCompletionIfNeededWithImportSession:*(void *)(a1 + 40) results:*(void *)(a1 + 48)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (void)_importControllerWillBeginAction
{
  self->_allowsSelection = 0;
  [(PUImportViewController *)self setNumItemsCompleted:0];
  [(PUImportViewController *)self setNumTotalItemsToComplete:0];
}

- (void)_importControllerDidEndAction
{
  self->_allowsSelection = 1;
  [(PUImportViewController *)self setNumItemsCompleted:0];
  [(PUImportViewController *)self setNumTotalItemsToComplete:0];
  [(PUImportViewController *)self _updateToolbarAnimated:0];
}

- (id)importDestinationForActionCoordinator:(id)a3
{
  double v3 = [(PUImportViewController *)self importController];
  double v4 = [v3 importDestinationAlbum];

  return v4;
}

- (void)actionCoordinatorDidEndDelete:(id)a3
{
  [(PUImportViewController *)self _endUninterruptibleOperation];
  [(PUImportViewController *)self _importControllerDidEndAction];
  [(PUPhotosGridViewController *)self updatePeripheralInterfaceAnimated:1];
}

- (void)actionCoordinatorDidBeginDelete:(id)a3
{
}

- (void)actionCoordinatorWillBeginDelete:(id)a3
{
  [(PUImportViewController *)self _beginUninterruptibleOperation];
  [(PUImportViewController *)self _importControllerWillBeginAction];
}

- (void)actionCoordinator:(id)a3 didCompleteWithImportSession:(id)a4 results:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = _importGridLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[PUImportViewController actionCoordinator:didCompleteWithImportSession:results:]";
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  [(PUImportViewController *)self _endImport];
}

- (void)actionCoordinatorDidBeginImport:(id)a3
{
}

- (id)_navigationViewControllerForViewController:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4FB19E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithRootViewController:v5];
  int v7 = PLLocalizedFrameworkString();
  int v8 = [v5 navigationItem];
  [v8 setTitle:v7];

  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelAlbumPickerPopover_];
  id v10 = [v5 navigationItem];

  [v10 setLeftBarButtonItem:v9];
  return v6;
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  id v5 = [a3 presentedViewController];
  if (v5)
  {
    objc_opt_class();
    id v6 = v5;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      id v6 = v5;
      if (objc_opt_isKindOfClass())
      {
        id v6 = [(PUImportViewController *)self _navigationViewControllerForViewController:v5];
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)targetLibrarySelected:(unint64_t)a3
{
  double v4 = [(PUImportViewController *)self importController];
  id v5 = [v4 importDestinationAlbum];
  id v6 = [(PUImportViewController *)self destinationDescriptionForCollection:v5];

  int v7 = [(PUImportViewController *)self compactWidthAlbumPickerBarButtonView];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __48__PUImportViewController_targetLibrarySelected___block_invoke;
  long long v12 = &unk_1E5F2ECC8;
  dispatch_time_t v13 = self;
  id v14 = v6;
  id v8 = v6;
  [v7 performChanges:&v9];

  -[PUImportAddToAlbumsToolbarView setDestinationDescriptionTitle:](self->_addToAlbumsToolbarView, "setDestinationDescriptionTitle:", v8, v9, v10, v11, v12, v13);
}

void __48__PUImportViewController_targetLibrarySelected___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) compactWidthAlbumPickerBarButtonView];
  [v2 setSubtitle:v1];
}

- (void)collectionSelected:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportViewController *)self importController];
  id v6 = [v5 importDestinationAlbum];

  if (v6 != v4)
  {
    int v7 = [(PUImportViewController *)self importController];
    [v7 setImportDestinationAlbum:v4];

    id v8 = [(PUImportViewController *)self destinationDescriptionForCollection:v4];
    uint64_t v9 = [(PUImportViewController *)self compactWidthAlbumPickerBarButtonView];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    BOOL v17 = __45__PUImportViewController_collectionSelected___block_invoke;
    id v18 = &unk_1E5F2ECC8;
    id v19 = self;
    id v20 = v8;
    id v10 = v8;
    [v9 performChanges:&v15];

    -[PUImportAddToAlbumsToolbarView setDestinationDescriptionTitle:](self->_addToAlbumsToolbarView, "setDestinationDescriptionTitle:", v10, v15, v16, v17, v18, v19);
    id v11 = [(PUImportViewController *)self importController];
    long long v12 = [v11 importDestinationAlbum];
    dispatch_time_t v13 = [(PUImportViewController *)self accessibilityLabelForAlbumPickerControlWithDestination:v12];

    [(UIBarButtonItem *)self->_albumPickerBarItem setAccessibilityLabel:v13];
    id v14 = [(PUImportViewController *)self compactWidthAlbumPickerButton];
    [v14 setCustomAccessibilityLabel:v13];
  }
}

void __45__PUImportViewController_collectionSelected___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) compactWidthAlbumPickerBarButtonView];
  [v2 setSubtitle:v1];
}

- (id)accessibilityLabelForAlbumPickerControlWithDestination:(id)a3
{
  id v4 = a3;
  id v5 = PLLocalizedFrameworkString();
  if (v4)
  {
    id v6 = [(PUImportViewController *)self destinationDescriptionForCollection:v4];
    int v7 = PLLocalizedFrameworkString();
    uint64_t v8 = PULocalizedStringWithValidatedFormat(v7, @"%@");

    id v5 = (void *)v8;
  }

  return v5;
}

- (id)destinationDescriptionForCollection:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUPhotosGridViewController *)self photoLibrary];
  id v6 = PXTargetLibraryTitleForDefaultType();

  if (v4)
  {
    uint64_t v7 = [v4 localizedTitle];
    uint64_t v8 = (void *)v7;
    if (v7)
    {
      v12[0] = v6;
      v12[1] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
      id v10 = [v9 componentsJoinedByString:@", "];
    }
    else
    {
      id v10 = v6;
    }
  }
  else
  {
    id v10 = v6;
  }

  return v10;
}

- (void)cancelAlbumPickerPopover:(id)a3
{
}

- (void)presentAlbumPickerFromView:(id)a3 orBarItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PUImportViewController *)self performingAlbumPickerPresentation])
  {
    uint64_t v8 = [(PUImportViewController *)self destinationPickerViewController];

    if (!v8)
    {
      uint64_t v9 = [PUImportAddToLibraryAndAlbumsPickerViewController alloc];
      id v10 = [(PUPhotosGridViewController *)self photoLibrary];
      id v11 = [(PUImportAddToLibraryAndAlbumsPickerViewController *)v9 initWithPhotoLibrary:v10];
      [(PUImportViewController *)self setDestinationPickerViewController:v11];

      long long v12 = [(PUImportViewController *)self destinationPickerViewController];
      [v12 setDelegate:self];

      dispatch_time_t v13 = [(PUImportViewController *)self destinationPickerViewController];
      [v13 setModalPresentationStyle:7];
    }
    id v14 = [(PUImportViewController *)self destinationPickerViewController];
    uint64_t v15 = [v14 popoverPresentationController];

    if (v15)
    {
      if (v7)
      {
        [v15 setBarButtonItem:v7];
      }
      else
      {
        [v15 setSourceView:v6];
        [v6 bounds];
        objc_msgSend(v15, "setSourceRect:");
      }
      [v15 setDelegate:self];
    }
    [(PUImportViewController *)self setPerformingAlbumPickerPresentation:1];
    uint64_t v16 = [(PUImportViewController *)self destinationPickerViewController];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__PUImportViewController_presentAlbumPickerFromView_orBarItem___block_invoke;
    v17[3] = &unk_1E5F2ED10;
    v17[4] = self;
    [(PUImportViewController *)self presentViewController:v16 animated:1 completion:v17];
  }
}

uint64_t __63__PUImportViewController_presentAlbumPickerFromView_orBarItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPerformingAlbumPickerPresentation:0];
}

- (void)showAlbumPicker:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = self;
    id v5 = v7;
    id v6 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v4 = self;
    id v5 = 0;
    id v6 = v7;
  }
  [(PUImportViewController *)v4 presentAlbumPickerFromView:v5 orBarItem:v6];
LABEL_6:
}

- (void)didTapAddToAlbumsView:(id)a3
{
  id v4 = [a3 destinationButton];
  [(PUImportViewController *)self presentAlbumPickerFromView:v4 orBarItem:0];
}

- (void)importControllerProgressDidChange:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F90EF0]];

  id v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F90EE8]];

  uint64_t v9 = [v4 userInfo];

  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F90F00]];

  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    _PFAssertContinueHandler();
  }
  [v6 doubleValue];
  double v12 = v11;
  dispatch_time_t v13 = _importGridLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v25 = "-[PUImportViewController importControllerProgressDidChange:]";
    __int16 v26 = 2048;
    double v27 = v12;
    _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_INFO, "%s: setting progress to %f ", buf, 0x16u);
  }

  if (v12 == 0.0)
  {
    id v14 = [(PUImportViewController *)self roundProgressView];
    [v14 resetProgress];
  }
  uint64_t v15 = [(PUImportViewController *)self importController];
  [v15 isDeletingAssets];

  uint64_t v16 = PLLocalizedFrameworkString();
  BOOL v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "integerValue"));
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
  id v18 = PUStringWithValidatedFormat();

  id v19 = [(PUImportViewController *)self roundProgressView];
  [v19 setProgress:v12];

  -[PUImportViewController setNumItemsCompleted:](self, "setNumItemsCompleted:", [v8 integerValue]);
  -[PUImportViewController setNumTotalItemsToComplete:](self, "setNumTotalItemsToComplete:", [v10 integerValue]);
  [(UIBarButtonItem *)self->_progressButtonItem setAccessibilityLabel:v18];
  if (v12 >= 1.0)
  {
    id v20 = PLLocalizedFrameworkString();
    [(UIBarButtonItem *)self->_progressButtonItem setAccessibilityLabel:v20];
  }
  uint64_t v21 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v22 = [v21 showProgressTitles];

  if (v22) {
    [(PUImportViewController *)self _updateToolbarAnimated:0];
  }
}

- (void)stopImport:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = _importGridLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[PUImportViewController stopImport:]";
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(PUImportViewController *)self actionCoordinator];
  [v5 stopImport];
}

- (void)delete:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportViewController *)self actionCoordinator];
  [v5 deleteItemsFromBarButtonItem:v4];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && sel_delete_ == a3)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PUImportViewController;
    BOOL v7 = [(PUPhotosGridViewController *)&v9 canPerformAction:a3 withSender:v6];
  }

  return v7;
}

- (void)transitionFromDataSource:(id)a3 toDataSource:(id)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_time_t v13 = [(PUImportViewController *)self importDataSourceManager];
  id v14 = [v13 changeHistory];

  uint64_t v15 = [(PUImportViewController *)self changeDetailsHelper];

  if (!v15)
  {
    objc_initWeak(&location, self);
    uint64_t v16 = [PUImportChangeDetailsCollectionViewHelper alloc];
    BOOL v17 = [(PUImportViewController *)self collectionView];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __91__PUImportViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke;
    v23[3] = &unk_1E5F26488;
    objc_copyWeak(&v24, &location);
    id v18 = [(PUImportChangeDetailsCollectionViewHelper *)v16 initWithCollectionView:v17 dataSourceSettingHandler:v23];
    [(PUImportViewController *)self setChangeDetailsHelper:v18];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  id v19 = [(PUImportViewController *)self changeDetailsHelper];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__PUImportViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke_2;
  v21[3] = &unk_1E5F264B0;
  v21[4] = self;
  id v22 = v12;
  id v20 = v12;
  [v19 transitionFromDataSource:v10 toDataSource:v11 changeHistory:v14 animated:v7 completionHandler:v21];
}

void __91__PUImportViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setImportDataSource:v3];
}

uint64_t __91__PUImportViewController_transitionFromDataSource_toDataSource_animated_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) shouldStayScrolledToBottom])
  {
    id v4 = [*(id *)(a1 + 32) collectionView];
    objc_msgSend(v4, "px_scrollToEdge:animated:", 3, a2);
  }
  [*(id *)(a1 + 32) _updateToolbarAnimated:0];
  [*(id *)(a1 + 32) updateVisibleSupplementaryViewsOfKind:@"PUImportSectionHeaderReuseIdentifier"];
  [*(id *)(a1 + 32) updatePeripheralInterfaceAnimated:1];
  [*(id *)(a1 + 32) updateAlreadyImportedCollapseStatus];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)handleNewDataSource:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUImportViewController *)self importDataSource];
  uint64_t v6 = [v5 identifier];
  if (v6 != [v4 identifier])
  {
    if ([(PUImportViewController *)self performingDataSourceChange])
    {
      BOOL v7 = _importGridLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v20 = [v4 identifier];
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Collection view is performing changes, making pending data source: %ti", buf, 0xCu);
      }

      [(PUImportViewController *)self setPendingDataSource:v4];
    }
    else
    {
      if ([(PUImportViewController *)self px_isVisible])
      {
        uint64_t v8 = [(PUImportViewController *)self importController];
        if ([v8 isLoadingInitialBatchOfAssets])
        {
          uint64_t v9 = 0;
        }
        else
        {
          BOOL v10 = [(PUImportViewController *)self isViewAppearing];
          if (v4) {
            BOOL v11 = v5 == 0;
          }
          else {
            BOOL v11 = 1;
          }
          unsigned int v12 = !v11;
          if (v10) {
            uint64_t v9 = 0;
          }
          else {
            uint64_t v9 = v12;
          }
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
      dispatch_time_t v13 = [v5 alreadyImportedCollection];
      uint64_t v14 = [v13 numberOfItems];

      uint64_t v15 = [v4 alreadyImportedCollection];
      uint64_t v16 = [v15 numberOfItems];

      if ([(PUImportViewController *)self shouldCollapseAlreadyImportedSection])
      {
        int v17 = ![(PUImportViewController *)self isTransitioningToNewSize];
        if (v14 <= v16) {
          int v17 = 1;
        }
        uint64_t v9 = v9 & v17;
      }
      [(PUImportViewController *)self setPerformingDataSourceChange:1];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      _OWORD v18[2] = __46__PUImportViewController_handleNewDataSource___block_invoke;
      v18[3] = &unk_1E5F2ED10;
      v18[4] = self;
      [(PUImportViewController *)self transitionFromDataSource:v5 toDataSource:v4 animated:v9 completionHandler:v18];
    }
  }
}

void __46__PUImportViewController_handleNewDataSource___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PUImportViewController_handleNewDataSource___block_invoke_2;
  block[3] = &unk_1E5F2ED10;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __46__PUImportViewController_handleNewDataSource___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = _importGridLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) importDataSource];
    int v10 = 134217984;
    uint64_t v11 = [v3 identifier];
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Finished transitioning to: %lu", (uint8_t *)&v10, 0xCu);
  }
  [*(id *)(a1 + 32) setPerformingDataSourceChange:0];
  id v4 = [*(id *)(a1 + 32) pendingDataSource];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [v5 pendingDataSource];
    [*(id *)(a1 + 32) setPendingDataSource:0];
    BOOL v7 = _importGridLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 identifier];
      int v10 = 134217984;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Applying pending data source: %lu", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) handleNewDataSource:v6];
  }
  else if ([v5 needsDataReloadAfterAnimatingDataSourceChange])
  {
    uint64_t v9 = _importGridLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Performing reload after animating source change, due to layoutSubview while animating", (uint8_t *)&v10, 2u);
    }

    [*(id *)(a1 + 32) setNeedsDataReloadAfterAnimatingDataSourceChange:0];
    [*(id *)(a1 + 32) reloadData];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXImportControllerObserverContext_37454 == a5)
  {
    if (v6)
    {
      [(PUPhotosGridViewController *)self invalidateEmptyPlaceholderView];
    }
    else
    {
      if ((v6 & 2) != 0 || (v6 & 4) != 0) {
        goto LABEL_19;
      }
      if ((v6 & 8) != 0)
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __55__PUImportViewController_observable_didChange_context___block_invoke;
        v27[3] = &unk_1E5F2ED10;
        v27[4] = self;
        uint64_t v21 = MEMORY[0x1E4F14428];
        id v22 = v27;
        goto LABEL_21;
      }
      if ((v6 & 0x10) == 0) {
        goto LABEL_24;
      }
    }
    [(PUPhotosGridViewController *)self updateEmptyPlaceholderView];
LABEL_19:
    [(PUImportViewController *)self _updateToolbarAnimated:0];
    goto LABEL_24;
  }
  if ((void *)PXImportAssetsDataSourceManagerObserverContext_37455 != a5)
  {
    if ((void *)PUImportUnfilteredAssetsDataSourceManagerObserverContext != a5)
    {
      if ((v6 & 1) != 0 && (void *)PUImportSelectionManagerObserverContext_37456 == a5)
      {
        uint64_t v9 = [(PUImportViewController *)self currentSelectionSnapshot];
        int v10 = [(PUImportViewController *)self importController];
        uint64_t v11 = [v10 selectionManager];
        uint64_t v12 = [v11 selectionSnapshot];
        [(PUImportViewController *)self setCurrentSelectionSnapshot:v12];

        id v13 = [v9 selectedIndexPaths];
        uint64_t v14 = [(PUImportViewController *)self currentSelectionSnapshot];
        id v15 = [v14 selectedIndexPaths];
        if (v13 == v15)
        {
        }
        else
        {
          uint64_t v16 = v15;
          char v17 = [v13 isEqual:v15];

          if ((v17 & 1) == 0)
          {
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __55__PUImportViewController_observable_didChange_context___block_invoke_4;
            block[3] = &unk_1E5F2ED10;
            block[4] = self;
            dispatch_async(MEMORY[0x1E4F14428], block);
          }
        }
      }
      goto LABEL_24;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __55__PUImportViewController_observable_didChange_context___block_invoke_3;
    v24[3] = &unk_1E5F2ED10;
    v24[4] = self;
    uint64_t v21 = MEMORY[0x1E4F14428];
    id v22 = v24;
LABEL_21:
    dispatch_async(v21, v22);
    goto LABEL_24;
  }
  if (v6)
  {
    id v18 = [(PUImportViewController *)self importDataSourceManager];
    id v19 = [v18 dataSource];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__PUImportViewController_observable_didChange_context___block_invoke_2;
    v25[3] = &unk_1E5F2ECC8;
    v25[4] = self;
    id v26 = v19;
    id v20 = v19;
    dispatch_async(MEMORY[0x1E4F14428], v25);
  }
LABEL_24:
}

uint64_t __55__PUImportViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateEmptyPlaceholderView];
  id v2 = *(void **)(a1 + 32);
  return [v2 updateEmptyPlaceholderView];
}

uint64_t __55__PUImportViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNewDataSource:*(void *)(a1 + 40)];
}

uint64_t __55__PUImportViewController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateToolbarAnimated:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 updateAlreadyImportedHeaderIfVisible];
}

uint64_t __55__PUImportViewController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateToolbarAnimated:0];
  [*(id *)(a1 + 32) setAnimateHeaderActionButtonChanges:1];
  [*(id *)(a1 + 32) updateVisibleSupplementaryViewsOfKind:@"PUImportSectionHeaderReuseIdentifier"];
  [*(id *)(a1 + 32) setAnimateHeaderActionButtonChanges:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 updateAlreadyImportedCollapseStatus];
}

- (void)setImportDataSource:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _importGridLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PXImportAssetsDataSource *)self->_importDataSource identifier];
    uint64_t v7 = [(PXImportAssetsDataSource *)self->_importDataSource numberOfSections];
    uint64_t v8 = [(PXImportAssetsDataSource *)self->_importDataSource numberOfItems];
    int v13 = 136316674;
    uint64_t v14 = "-[PUImportViewController setImportDataSource:]";
    __int16 v15 = 2048;
    uint64_t v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = v7;
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    __int16 v21 = 2048;
    uint64_t v22 = [v4 identifier];
    __int16 v23 = 2048;
    uint64_t v24 = [v4 numberOfSections];
    __int16 v25 = 2048;
    uint64_t v26 = [v4 numberOfItems];
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%s: Going from data source %lu (%lu sections, %lu assets) to %lu (%lu sections, %lu assets)", (uint8_t *)&v13, 0x48u);
  }

  importDataSource = self->_importDataSource;
  self->_importDataSource = (PXImportAssetsDataSource *)v4;
  id v10 = v4;

  uint64_t v11 = self->_importDataSource;
  uint64_t v12 = [(PUImportViewController *)self fakePhotosDataSource];
  [v12 setImportDataSource:v11];
}

- (void)setUnfilteredImportDataSourceManager:(id)a3
{
  id v5 = (PXImportAssetsDataSourceManager *)a3;
  unfilteredImportDataSourceManager = self->_unfilteredImportDataSourceManager;
  if (unfilteredImportDataSourceManager != v5)
  {
    uint64_t v7 = v5;
    [(PXImportAssetsDataSourceManager *)unfilteredImportDataSourceManager unregisterChangeObserver:self context:PUImportUnfilteredAssetsDataSourceManagerObserverContext];
    objc_storeStrong((id *)&self->_unfilteredImportDataSourceManager, a3);
    [(PXImportAssetsDataSourceManager *)self->_unfilteredImportDataSourceManager registerChangeObserver:self context:PUImportUnfilteredAssetsDataSourceManagerObserverContext];
    id v5 = v7;
  }
}

- (void)setImportDataSourceManager:(id)a3
{
  id v5 = (PXImportAssetsDataSourceManager *)a3;
  p_importDataSourceManager = &self->_importDataSourceManager;
  importDataSourceManager = self->_importDataSourceManager;
  if (importDataSourceManager != v5)
  {
    uint64_t v9 = v5;
    [(PXImportAssetsDataSourceManager *)importDataSourceManager unregisterChangeObserver:self context:PXImportAssetsDataSourceManagerObserverContext_37455];
    objc_storeStrong((id *)&self->_importDataSourceManager, a3);
    [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager registerChangeObserver:self context:PXImportAssetsDataSourceManagerObserverContext_37455];
    uint64_t v8 = [(PXImportAssetsDataSourceManager *)*p_importDataSourceManager dataSource];
    [(PUImportViewController *)self handleNewDataSource:v8];

    id v5 = v9;
  }
}

- (void)setImportController:(id)a3
{
  id v5 = (PXImportController *)a3;
  p_importController = (id *)&self->_importController;
  if (self->_importController != v5)
  {
    uint64_t v14 = v5;
    uint64_t v7 = [(PUImportViewController *)self unfilteredImportDataSourceManager];

    if (v7)
    {
      id v8 = *p_importController;
      uint64_t v9 = [(PUImportViewController *)self unfilteredImportDataSourceManager];
      [v8 removeDataSourceManager:v9];

      [(PUImportViewController *)self setUnfilteredImportDataSourceManager:0];
    }
    id v10 = [*p_importController selectionManager];
    [v10 unregisterChangeObserver:self context:PUImportSelectionManagerObserverContext_37456];

    [*p_importController unregisterChangeObserver:self context:PXImportControllerObserverContext_37454];
    objc_storeStrong((id *)&self->_importController, a3);
    uint64_t v11 = [*p_importController dataSourceManager];
    [(PUImportViewController *)self setImportDataSourceManager:v11];

    [(PUImportViewController *)self setUserWantsAlreadyImportedSectionCollapsedIfPossible:1];
    [(PUImportViewController *)self setShouldCollapseAlreadyImportedSection:[(PUImportViewController *)self userWantsAlreadyImportedSectionCollapsedIfPossible]];
    [(PUImportViewController *)self updateDataSourceManagerFilters];
    [*p_importController registerChangeObserver:self context:PXImportControllerObserverContext_37454];
    uint64_t v12 = [*p_importController selectionManager];
    [v12 registerChangeObserver:self context:PUImportSelectionManagerObserverContext_37456];

    int v13 = [*p_importController createDataSourceManagerWithLogIdentifier:@"unfiltered"];
    [(PUImportViewController *)self setUnfilteredImportDataSourceManager:v13];

    id v5 = v14;
  }
}

- (void)setImportSource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F902D0] sharedInstance];
    uint64_t v6 = [v5 showNewestItemsInGridUntilScrolled];

    if (v6) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = -1;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F902B8]);
    uint64_t v9 = [(PUPhotosGridViewController *)self photoLibrary];
    id v10 = objc_msgSend(v8, "initWithImportSource:photoLibrary:imageFormat:dateOrder:", v4, v9, objc_msgSend((id)objc_opt_class(), "defaultThumbnailImageFormat"), v7);
    [(PUImportViewController *)self setImportController:v10];

    uint64_t v11 = [(PUImportViewController *)self importController];
    [v11 setImportCompletionDelegate:self];

    uint64_t v12 = [PUImportFakePhotosDataSource alloc];
    int v13 = [(PUImportViewController *)self importController];
    uint64_t v14 = [v13 dataSourceManager];
    __int16 v15 = [v14 dataSource];
    uint64_t v16 = [(PUPhotosGridViewController *)self photoLibrary];
    __int16 v17 = [(PUImportFakePhotosDataSource *)v12 initWithImportDataSource:v15 photoLibrary:v16];
    [(PUImportViewController *)self setFakePhotosDataSource:v17];

    uint64_t v18 = [(PUImportViewController *)self fakePhotosDataSource];
    [(PUPhotosGridViewController *)self setPhotosDataSource:v18];

    [(PUImportViewController *)self setShouldStayScrolledToBottom:v6];
    __int16 v19 = [(PUImportViewController *)self importController];
    [v19 loadAssets];

    uint64_t v20 = [PUImportActionCoordinator alloc];
    __int16 v21 = [(PUImportViewController *)self importController];
    uint64_t v22 = [(PUImportActionCoordinator *)v20 initWithViewController:self importController:v21 loggingSource:0];
    [(PUImportViewController *)self setActionCoordinator:v22];

    __int16 v23 = [(PUImportViewController *)self actionCoordinator];
    [v23 setPresentsAdditionalDeleteAllConfirmation:1];

    uint64_t v24 = [(PUImportViewController *)self actionCoordinator];
    [v24 setDelegate:self];

    [(PUImportViewController *)self enableSwipeSelection];
  }
  else
  {
    [(PUImportViewController *)self setActionCoordinator:0];
    __int16 v25 = [(PUImportViewController *)self importController];
    [v25 shutdown];

    [(PUImportViewController *)self setImportController:0];
    [(PUImportViewController *)self _cancelAlerts];
    if (self->_completedAnImport)
    {
      uint64_t v26 = [(PUImportViewController *)self view];
      uint64_t v27 = [v26 superview];

      if (v27) {
        self->_completedAnImport = 0;
      }
    }
    [(PUImportViewController *)self disableSwipeSelection];
    uint64_t v28 = [(PUImportViewController *)self presentingViewController];

    if (v28)
    {
      uint64_t v29 = _importGridLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v31 = 0;
        _os_log_impl(&dword_1AE9F8000, v29, OS_LOG_TYPE_DEFAULT, "Import source went away while modally presented. Auto-dismissing import UI", v31, 2u);
      }

      char v30 = [(PUImportViewController *)self presentingViewController];
      [v30 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (PHImportSource)importSource
{
  id v2 = [(PUImportViewController *)self importController];
  id v3 = [v2 importSource];

  return (PHImportSource *)v3;
}

- (void)_cancelAlerts
{
  if (self->_importCompleteNotification)
  {
    id v3 = PLCameraConnectionKitGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "Cancelling notification", v7, 2u);
    }

    CFUserNotificationCancel(self->_importCompleteNotification);
    CFRelease(self->_importCompleteNotification);
    self->_importCompleteNotification = 0;
  }
  id v4 = [(PUImportViewController *)self presentedViewController];

  if (v4)
  {
    id v5 = [(PUImportViewController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    [(PUImportViewController *)self dismissViewControllerAnimated:isKindOfClass & 1 completion:0];
  }
}

- (BOOL)isImporting
{
  id v2 = [(PUImportViewController *)self importController];
  char v3 = [v2 isImportingAssets];

  return v3;
}

- (BOOL)isBusy
{
  return self->_busyCount != 0;
}

- (void)handleImportCompleteAlertResponse:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  if (self->_importCompleteNotification == a3)
  {
    if (!self->_completedImportSessionInfo) {
      _PFAssertContinueHandler();
    }
    uint64_t v6 = _importGridLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a4 == 1)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Import Complete Dialog: Deleting imported items.", buf, 2u);
      }

      uint64_t v6 = [(PXImportSessionInfo *)self->_completedImportSessionInfo importedItems];
      [(PUImportViewController *)self _deleteItems:v6];
    }
    else if (v7)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Import Complete Dialog: Keeping imported items.", v9, 2u);
    }

    completedImportSessionInfo = self->_completedImportSessionInfo;
    self->_completedImportSessionInfo = 0;

    CFRelease(self->_importCompleteNotification);
    self->_importCompleteNotification = 0;
  }
}

- (void)_deleteItems:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _importGridLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    id v8 = "-[PUImportViewController _deleteItems:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_debug_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v7, 0x16u);
  }

  if (![v4 count]) {
    _PFAssertContinueHandler();
  }
  uint64_t v6 = _importGridLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[PUImportViewController _deleteItems:]";
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "%s: Delete operation starting", (uint8_t *)&v7, 0xCu);
  }

  [(PUImportActionCoordinator *)self->_actionCoordinator deleteItemsWithoutConfirmation:v4];
}

- (void)_endImport
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = _importGridLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[PUImportViewController _endImport]";
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(PUImportViewController *)self _endUninterruptibleOperation];
  [(PUImportViewController *)self _importControllerDidEndAction];
}

- (void)_beginImport
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = _importGridLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[PUImportViewController _beginImport]";
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(PUImportViewController *)self _beginUninterruptibleOperation];
  [(PUImportViewController *)self _importControllerWillBeginAction];
}

- (void)_endUninterruptibleOperation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = _importGridLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[PUImportViewController _endUninterruptibleOperation]";
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  unint64_t v4 = self->_busyCount - 1;
  self->_busyCount = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v5 setIdleTimerDisabled:0];
  }
}

- (void)_beginUninterruptibleOperation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = _importGridLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[PUImportViewController _beginUninterruptibleOperation]";
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  unint64_t busyCount = self->_busyCount;
  if (!busyCount)
  {
    id v5 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v5 setIdleTimerDisabled:1];

    unint64_t busyCount = self->_busyCount;
  }
  self->_unint64_t busyCount = busyCount + 1;
}

- (void)_updateItemViewAtIndex:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _importGridLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    id v10 = "-[PUImportViewController _updateItemViewAtIndex:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  int v6 = [(PUImportViewController *)self collectionView];
  int v7 = [v6 cellForItemAtIndexPath:v4];

  if (v7)
  {
    [(PUImportViewController *)self _updateCell:v7 atIndex:v4];
  }
  else
  {
    uint64_t v8 = _importGridLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315394;
      id v10 = "-[PUImportViewController _updateItemViewAtIndex:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_debug_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "%s: Warning missing cell for index %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_updateCell:(id)a3 atIndex:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _importGridLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[PUImportViewController _updateCell:atIndex:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_debug_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "%s: %@", buf, 0x16u);
  }

  [v6 refreshThumbnail];
  int v9 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v10 = [v9 showImportItemFilenames];

  if (v10)
  {
    memset(buf, 0, 32);
    __int16 v11 = [(PUImportViewController *)self importDataSource];
    [v11 identifier];
    PXSimpleIndexPathFromIndexPath();

    id v12 = [(PUImportViewController *)self importDataSource];
    v17[0] = *(_OWORD *)buf;
    v17[1] = *(_OWORD *)&buf[16];
    uint64_t v13 = [v12 assetAtItemIndexPath:v17];

    uint64_t v14 = NSString;
    __int16 v15 = [v13 debugDisplayName];
    uint64_t v16 = [v14 stringWithFormat:@"%@ [%lu]", v15, objc_msgSend(v7, "row")];
    [v6 updateDebugLabel:v16];
  }
  else
  {
    [v6 updateDebugLabel:0];
  }
}

- (void)_deselectCell:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 representedImportItem];
  id v6 = _importGridLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    int v9 = "-[PUImportViewController _deselectCell:]";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "%s: model: %@ cell: %@", (uint8_t *)&v8, 0x20u);
  }

  if (v5)
  {
    id v7 = [(PUImportViewController *)self importController];
    [v7 deselectItem:v5];

    [v4 setSelected:0];
  }
}

- (void)_selectCell:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 representedImportItem];
  id v6 = _importGridLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    int v9 = "-[PUImportViewController _selectCell:]";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "%s: model: %@ cell: %@", (uint8_t *)&v8, 0x20u);
  }

  if (v5)
  {
    id v7 = [(PUImportViewController *)self importController];
    [v7 selectItem:v5];

    [v4 setSelected:1];
  }
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v10 collectionView:a3 didEndDisplayingCell:v8 forItemAtIndexPath:a5];
  int v9 = _importGridLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[PUImportViewController collectionView:didEndDisplayingCell:forItemAtIndexPath:]";
    _os_log_debug_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v8 cancelThumbnailLoadIfActive];
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  int v9 = _importGridLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    __int16 v11 = "-[PUImportViewController collectionView:willDisplayCell:forItemAtIndexPath:]";
    _os_log_debug_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v10, 0xCu);
  }

  [(PUImportViewController *)self _updateCell:v8 atIndex:v7];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _importGridLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    BOOL allowsSelection = self->_allowsSelection;
    int v10 = 136315650;
    __int16 v11 = "-[PUImportViewController collectionView:shouldSelectItemAtIndexPath:]";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 1024;
    BOOL v15 = allowsSelection;
    _os_log_debug_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "%s: %@ -> %d", (uint8_t *)&v10, 0x1Cu);
  }

  BOOL v7 = self->_allowsSelection;
  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [(PUImportViewController *)self importDataSource];
  [v9 identifier];
  PXSimpleIndexPathFromIndexPath();

  int v10 = [(PUImportViewController *)self importDataSource];
  memset(buf, 0, 32);
  __int16 v11 = [v10 assetAtItemIndexPath:buf];

  if (!v11)
  {
    _PFAssertContinueHandler();
    uint64_t v19 = _importGridLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = [(PUImportViewController *)self importDataSource];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[PUImportViewController collectionView:cellForItemAtIndexPath:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v20;
      _os_log_error_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "%s: Unreachable Error: Import view model at index path %{public}@ is nil, import data source: %{public}@", buf, 0x20u);
    }
    __int16 v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PUImportViewController.m" lineNumber:1265 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  __int16 v12 = _importGridLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[PUImportViewController collectionView:cellForItemAtIndexPath:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v8;
    _os_log_debug_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEBUG, "%s: %@(%@)", buf, 0x20u);
  }

  id v13 = [(PUImportViewController *)self collectionView];
  __int16 v14 = [v13 dequeueReusableCellWithReuseIdentifier:@"PUImportCellReuseIdentifier" forIndexPath:v8];

  [v14 setDelegate:self];
  [v14 setRepresentedImportItem:v11];
  BOOL v15 = [(PUImportViewController *)self itemsBeingTransitioned];
  uint64_t v16 = [v15 member:v11];

  double v17 = 0.0;
  if (!v16) {
    double v17 = 1.0;
  }
  [v14 setAlpha:v17];

  return v14;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v9 = a3;
  int v10 = (__CFString *)a4;
  id v11 = a5;
  if (v10 != @"PUImportSectionHeaderReuseIdentifier")
  {
    BOOL v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PUImportViewController.m" lineNumber:1235 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  __int16 v12 = v11;
  id v13 = [v9 dequeueReusableSupplementaryViewOfKind:@"PUImportSectionHeaderReuseIdentifier" withReuseIdentifier:@"PUImportSectionHeaderReuseIdentifier" forIndexPath:v11];
  [v13 setDelegate:self];
  [(PUImportViewController *)self configureSupplementaryView:v13 ofKind:@"PUImportSectionHeaderReuseIdentifier" forIndexPath:v12];

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v5 = [(PUImportViewController *)self collectionView];
  [v5 contentSize];
  double v7 = v6;

  double v8 = 30.0;
  double v9 = v7;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = [(PUImportViewController *)self importDataSource];
  int64_t v6 = [v5 numberOfItemsInSection:a4];

  return v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  char v3 = [(PUImportViewController *)self importDataSource];
  int64_t v4 = [v3 numberOfSections];

  return v4;
}

- (BOOL)importSectionedGridLayout:(id)a3 shouldEmphasizeSection:(unint64_t)a4
{
  if (a4) {
    return 0;
  }
  id v5 = [(PUImportViewController *)self importDataSource];
  char v6 = [v5 hasAlreadyImportedSection];

  return v6;
}

- (id)_bestReferenceItemIndexPath
{
  id v2 = [(PUImportViewController *)self collectionView];
  char v3 = [v2 collectionViewLayout];
  uint64_t v4 = [v3 collectionView];
  if (!v4
    || (id v5 = (void *)v4,
        [v2 window],
        char v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
LABEL_19:
    id v20 = 0;
    goto LABEL_20;
  }
  [v2 contentOffset];
  double v8 = v7;
  double v10 = v9;
  [v2 bounds];
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [v2 numberOfSections];
  uint64_t v16 = v15 - 1;
  if (v15 < 1 || [v2 numberOfItemsInSection:0] < 1) {
    goto LABEL_25;
  }
  double v17 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  uint64_t v18 = [v3 layoutAttributesForItemAtIndexPath:v17];
  uint64_t v19 = v18;
  if (v18
    && ([v18 frame],
        v29.origin.double x = v8,
        v29.origin.double y = v10,
        v29.size.double width = v12,
        v29.size.double height = v14,
        CGRectIntersectsRect(v27, v29)))
  {
    id v20 = v17;
  }
  else
  {
    id v20 = 0;
  }
  uint64_t v21 = [v2 numberOfItemsInSection:v16];
  if (!v20 && v21 >= 1)
  {
    uint64_t v22 = [MEMORY[0x1E4F28D58] indexPathForItem:v21 - 1 inSection:v16];
    uint64_t v23 = [v3 layoutAttributesForItemAtIndexPath:v22];
    uint64_t v24 = v23;
    if (v23
      && ([v23 frame],
          v30.origin.double x = v8,
          v30.origin.double y = v10,
          v30.size.double width = v12,
          v30.size.double height = v14,
          CGRectIntersectsRect(v28, v30)))
    {
      id v20 = v22;
    }
    else
    {
      id v20 = 0;
    }
  }
  if (!v20)
  {
LABEL_25:
    if ([v3 conformsToProtocol:&unk_1F083ED00])
    {
      objc_msgSend(v3, "itemIndexPathAtCenterOfRect:", v8, v10, v12, v14);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_20:

  return v20;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", @"PUImportSectionHeaderReuseIdentifier", a4))
  {
    id v5 = [(PUImportViewController *)self collectionView];
    char v6 = [v5 collectionViewLayout];

    double v7 = [v6 globalHeaderAttributes];
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (id)_newGridLayoutFromSpec:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(PUSectionedGridLayout);
  [(PUSectionedGridLayout *)v5 setSectionHeadersEnabled:1];
  [(PUSectionedGridLayout *)v5 setSectionHeaderElementKind:@"PUImportSectionHeaderReuseIdentifier"];
  [(PUSectionedGridLayout *)v5 setFloatingSectionHeadersEnabled:1];
  [(PUSectionedGridLayout *)v5 setSectionTopPadding:0.0];
  [v4 baseInterItemSpacing];
  double v7 = v6;

  [(PUSectionedGridLayout *)v5 setGlobalTopPadding:v7];
  [(PUSectionedGridLayout *)v5 setGlobalBottomPadding:0.0];
  [(PUSectionedGridLayout *)v5 setDelegate:self];
  return v5;
}

- (id)_gridLayout
{
  id v2 = [(PUImportViewController *)self collectionView];
  char v3 = [v2 collectionViewLayout];

  return v3;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  [(PUPhotosGridViewController *)self updateLayoutMetrics];
  [(PUImportViewController *)self setCachedHeaderHeight:0];
  id v5 = [(PUImportViewController *)self collectionView];
  id v4 = [v5 collectionViewLayout];
  [v4 invalidateLayout];
}

- (void)_updateLayoutMetrics
{
  id v11 = [(PUImportViewController *)self _spec];
  char v3 = [(PUImportViewController *)self _gridLayout];
  [(PUImportViewController *)self _collectionViewLayoutReferenceWidth];
  double v5 = v4;
  double v6 = [(PUImportViewController *)self collectionView];
  [v6 safeAreaInsets];
  objc_msgSend(v11, "configureCollectionViewGridLayout:forWidth:safeAreaInsets:", v3, v5, v7, v8, v9, v10);
}

- (void)_updateContentOffsetForPendingViewSizeTransition
{
  id v15 = [(PUImportViewController *)self _pendingViewSizeTransitionContext];
  if (v15)
  {
    if ([(PUImportViewController *)self isViewLoaded])
    {
      char v3 = [(PUImportViewController *)self collectionView];
      [v3 bounds];
      CGRectGetWidth(v17);

      [(PUImportViewController *)self _collectionViewLayoutReferenceWidth];
      if (PXFloatApproximatelyEqualToFloat())
      {
        double v4 = [(PUImportViewController *)self _gridLayout];
        double v5 = [(PUImportViewController *)self collectionView];
        [v5 contentOffset];
        double v7 = v6;
        double v9 = v8;

        [v4 targetContentOffsetForViewSizeTransitionContext:v15];
        double v12 = v11;
        double v13 = v10;
        if (v7 != v11 || v9 != v10)
        {
          double v14 = [(PUImportViewController *)self collectionView];
          objc_msgSend(v14, "setContentOffset:", v12, v13);

          [v4 invalidateLayout];
        }
        [(PUImportViewController *)self _setPendingViewSizeTransitionContext:0];
      }
    }
  }
}

- (BOOL)updateSpec
{
  v11.receiver = self;
  v11.super_class = (Class)PUImportViewController;
  BOOL v3 = [(PUPhotosGridViewController *)&v11 updateSpec];
  double v4 = [(PUImportViewController *)self traitCollection];
  if ([v4 horizontalSizeClass] && objc_msgSend(v4, "verticalSizeClass"))
  {
    BOOL v5 = +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:v4];
    double v6 = (objc_class *)objc_opt_class();
    double v7 = [(PUImportViewController *)self _spec];
    uint64_t v8 = objc_opt_class();

    self->_compactLayoutMode = v5;
    if (v6 != (objc_class *)v8)
    {
      id v9 = objc_alloc_init(v6);
      [(PUImportViewController *)self _setSpec:v9];

      BOOL v3 = 1;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_setCollectionViewSafeAreaInsets:(UIEdgeInsets)a3
{
  if (self->_collectionViewSafeAreaInsets.left != a3.left
    || self->_collectionViewSafeAreaInsets.top != a3.top
    || self->_collectionViewSafeAreaInsets.right != a3.right
    || self->_collectionViewSafeAreaInsets.bottom != a3.bottom)
  {
    self->_collectionViewSafeAreaInsets = a3;
    [(PUImportViewController *)self _updateLayoutMetrics];
  }
}

- (void)_setCollectionViewLayoutReferenceWidth:(double)a3
{
  if (self->__collectionViewLayoutReferenceWidth != a3)
  {
    self->__collectionViewLayoutReferencedouble Width = a3;
    [(PUImportViewController *)self _updateLayoutMetrics];
  }
}

- (void)_invalidateCachedViewSizeTransitionContext
{
  [(PUImportViewController *)self _setCachedViewSizeTransitionContext:0];
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[PUImportViewController _setCachedViewSizeTransitionContextSize:](self, "_setCachedViewSizeTransitionContextSize:", v3, v4);
}

- (void)viewSafeAreaInsetsDidChange
{
  v12.receiver = self;
  v12.super_class = (Class)PUImportViewController;
  [(PUImportViewController *)&v12 viewSafeAreaInsetsDidChange];
  double v3 = [(PUImportViewController *)self collectionView];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PUImportViewController _setCollectionViewSafeAreaInsets:](self, "_setCollectionViewSafeAreaInsets:", v5, v7, v9, v11);
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v5 viewDidLayoutSubviews];
  [(PUImportViewController *)self updateDataSourceManagerFilters];
  [(PUImportViewController *)self updateAlreadyImportedHeaderIfVisible];
  double v3 = [(PUImportViewController *)self compactWidthToolbar];
  char v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    [(PUImportViewController *)self updateCompactWidthToolbarVisibility];
    [(PUImportViewController *)self updateCompactWidthToolbarTopConstraint];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController viewWillTransitionToSize:withTransitionCoordinator:](&v30, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(PUImportViewController *)self collectionView];
  double v9 = [v8 collectionViewLayout];

  double v10 = objc_msgSend(v9, "prepareForViewTransitionToSize:", width, height);
  if ([v7 isAnimated]
    && ([(PUImportViewController *)self px_isVisible] & 1) != 0)
  {
    [(PUImportViewController *)self _setPendingViewSizeTransitionContext:0];
    char v11 = 0;
    goto LABEL_14;
  }
  [(PUImportViewController *)self _cachedViewSizeTransitionContextSize];
  if (width == v13 && height == v12)
  {
    uint64_t v14 = [(PUImportViewController *)self _cachedViewSizeTransitionContext];

    int v15 = 1;
    double v10 = (void *)v14;
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4FB1438] sharedApplication];
    int v17 = [v16 isSuspended];

    if (v17)
    {
      uint64_t v18 = [(PUImportViewController *)self _cachedViewSizeTransitionContext];

      if (!v18)
      {
        uint64_t v19 = [(PUImportViewController *)self view];
        [v19 bounds];
        double v21 = v20;
        double v23 = v22;

        [(PUImportViewController *)self _setCachedViewSizeTransitionContext:v10];
        -[PUImportViewController _setCachedViewSizeTransitionContextSize:](self, "_setCachedViewSizeTransitionContextSize:", v21, v23);
      }
      int v15 = 0;
    }
    else
    {
      int v15 = 1;
    }
  }
  uint64_t v24 = [(PUImportViewController *)self _pendingViewSizeTransitionContext];

  if (!v24)
  {
    [(PUImportViewController *)self _setPendingViewSizeTransitionContext:v10];
    char v11 = 1;
    if ((v15 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  char v11 = 1;
  if (v15) {
LABEL_14:
  }
    [(PUImportViewController *)self _invalidateCachedViewSizeTransitionContext];
LABEL_15:
  [(PUImportViewController *)self setTransitioningToNewSize:1];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  void v29[2] = __77__PUImportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v29[3] = &unk_1E5F2B9D0;
  void v29[4] = self;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__PUImportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v26[3] = &unk_1E5F26460;
  char v28 = v11;
  v26[4] = self;
  id v27 = v9;
  id v25 = v9;
  [v7 animateAlongsideTransition:v29 completion:v26];
}

uint64_t __77__PUImportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateAlreadyImportedCollapseStatus];
  int v2 = [*(id *)(a1 + 32) anyAlreadyImportedItemsAreSelected];
  if ([*(id *)(a1 + 32) userWantsAlreadyImportedSectionCollapsedIfPossible]
    && ([*(id *)(a1 + 32) shouldCollapseAlreadyImportedSection] & 1) == 0
    && ((v2 ^ 1) & 1) == 0)
  {
    [*(id *)(a1 + 32) setUserWantsAlreadyImportedSectionCollapsedIfPossible:0];
  }
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "px_isVisible");
  if (result)
  {
    char v4 = *(void **)(a1 + 32);
    return [v4 _updateToolbarAnimated:1];
  }
  return result;
}

void __77__PUImportViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _updateContentOffsetForPendingViewSizeTransition];
  }
  [*(id *)(a1 + 40) finalizeViewTransitionToSize];
  if (objc_msgSend(*(id *)(a1 + 32), "px_isVisible"))
  {
    objc_msgSend(*(id *)(a1 + 32), "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 0, 0);
    [*(id *)(a1 + 32) _updateToolbarAnimated:0];
  }
  [*(id *)(a1 + 32) setTransitioningToNewSize:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  -[PUPhotosGridViewController viewWillDisappear:](&v5, sel_viewWillDisappear_);
  [(PUImportViewController *)self _dismissPopupsAnimated:v3];
  [(PUImportViewController *)self disableSwipeSelection];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v4 viewDidAppear:a3];
  [(PUImportViewController *)self setViewAppearing:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUImportViewController *)self setViewAppearing:1];
  objc_super v5 = [(PUImportViewController *)self _spec];
  uint64_t v6 = objc_opt_class();

  v13.receiver = self;
  v13.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v13 viewWillAppear:v3];
  id v7 = [(PUImportViewController *)self _spec];
  uint64_t v8 = objc_opt_class();

  double v9 = [(PUImportViewController *)self view];
  [v9 frame];
  double v11 = v10;

  [(PUImportViewController *)self _setCollectionViewLayoutReferenceWidth:v11];
  if (v6 != v8)
  {
    double v12 = [(PUImportViewController *)self _gridLayout];
    [v12 invalidateLayout];

    [(PUImportViewController *)self reloadData];
  }
  [(PUImportViewController *)self _updateToolbarAnimated:v3];
  [(PUImportViewController *)self updateNavigationTitleViewVisibilityAnimated:v3];
  [(PUImportViewController *)self enableSwipeSelection];
  self->_acceptsLongPress = 1;
}

- (void)viewWillLayoutSubviews
{
  BOOL v3 = [(PUImportViewController *)self updateSpec];
  objc_super v4 = [(PUImportViewController *)self view];
  [v4 frame];
  double v6 = v5;

  id v7 = [(PUImportViewController *)self collectionView];
  [v7 safeAreaInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  [(PUImportViewController *)self _setCollectionViewLayoutReferenceWidth:v6];
  -[PUImportViewController _setCollectionViewSafeAreaInsets:](self, "_setCollectionViewSafeAreaInsets:", v9, v11, v13, v15);
  double v16 = v6 - v11 - v15;
  [(PUImportViewController *)self referenceWidth];
  if (v16 != v17)
  {
    [(PUImportViewController *)self setReferenceWidth:v16];
    [(PUImportViewController *)self setCachedHeaderHeight:0];
    [(PUPhotosGridViewController *)self updateVisibleSupplementaryViewsOfKind:@"PUImportSectionHeaderReuseIdentifier"];
  }
  if (v3)
  {
    uint64_t v18 = [(PUImportViewController *)self _gridLayout];
    [v18 invalidateLayout];

    if ([(PUImportViewController *)self performingDataSourceChange])
    {
      [(PUImportViewController *)self setNeedsDataReloadAfterAnimatingDataSourceChange:1];
    }
    else
    {
      [(PUImportViewController *)self reloadData];
    }
  }
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v10 viewDidLoad];
  BOOL v3 = [(PUImportViewController *)self collectionView];
  objc_super v4 = +[PUInterfaceManager currentTheme];
  double v5 = [v4 photoCollectionViewBackgroundColor];
  [v3 setBackgroundColor:v5];

  double v6 = [(PUImportViewController *)self collectionView];
  [v6 setAllowsMultipleSelection:1];

  id v7 = [(PUImportViewController *)self collectionView];
  [v7 setAlwaysBounceVertical:1];

  double v8 = [(PUImportViewController *)self collectionView];
  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUImportCellReuseIdentifier"];

  double v9 = [(PUImportViewController *)self collectionView];
  [v9 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUImportSectionHeaderReuseIdentifier" withReuseIdentifier:@"PUImportSectionHeaderReuseIdentifier"];

  [(PUImportViewController *)self setUpCompactWidthToolbar];
  [(PUImportViewController *)self updateSpec];
}

- (void)dealloc
{
  [(PUImportViewController *)self _cancelAlerts];
  actionCoordinator = self->_actionCoordinator;
  self->_actionCoordinator = 0;

  [(PUImportViewController *)self setImportController:0];
  objc_super v4 = [MEMORY[0x1E4F902D0] sharedInstance];
  [v4 removeKeyObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PUImportViewController;
  [(PUPhotosGridViewController *)&v5 dealloc];
}

- (PUImportViewController)initWithSpec:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PUImportViewController;
  double v8 = [(PUPhotosGridViewController *)&v16 initWithSpec:v7 photoLibrary:a4];
  double v9 = v8;
  if (v8)
  {
    v8->_unint64_t busyCount = 0;
    objc_storeStrong((id *)&v8->__spec, a3);
    v9->_BOOL allowsSelection = 1;
    objc_super v10 = [MEMORY[0x1E4F902D0] sharedInstance];
    [v10 addKeyObserver:v9];

    cachedHeaderHeight = v9->_cachedHeaderHeight;
    v9->_cachedHeaderHeight = 0;

    id v12 = objc_alloc(MEMORY[0x1E4F8FF40]);
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    referenceHeaderView = v9->_referenceHeaderView;
    v9->_referenceHeaderView = (PXActionableSectionHeaderView *)v13;
  }
  return v9;
}

- (BOOL)compactWidthToolbarCoversLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PUImportViewController *)self collectionView];
  objc_msgSend(v6, "convertPoint:toView:", 0, x, y);
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  double v11 = [(PUImportViewController *)self compactWidthToolbar];
  uint64_t v12 = [v11 superview];
  if (!v12)
  {

    return 0;
  }
  uint64_t v13 = (void *)v12;
  double v14 = [(PUImportViewController *)self compactWidthToolbar];
  char v15 = [v14 isHidden];

  if (v15) {
    return 0;
  }
  objc_super v16 = [(PUImportViewController *)self compactWidthToolbar];
  double v17 = [(PUImportViewController *)self compactWidthToolbar];
  [v17 bounds];
  objc_msgSend(v16, "convertRect:toView:", 0);
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;

  uint64_t v26 = v19;
  uint64_t v27 = v21;
  uint64_t v28 = v23;
  uint64_t v29 = v25;
  uint64_t v30 = v8;
  uint64_t v31 = v10;
  return CGRectContainsPoint(*(CGRect *)&v26, *(CGPoint *)&v30);
}

- (void)updateCompactWidthToolbarTopConstraint
{
  BOOL v3 = [(PUImportViewController *)self compactWidthToolbar];
  char v4 = [v3 isHidden];

  if ((v4 & 1) == 0)
  {
    objc_super v5 = [(PUImportViewController *)self collectionView];
    [v5 contentOffset];
    double v7 = v6;

    uint64_t v8 = [(PUImportViewController *)self collectionView];
    [v8 adjustedContentInset];
    double v10 = v9;

    double v11 = [(PUImportViewController *)self collectionView];
    [v11 contentInset];
    double v13 = v12;

    double v14 = -v7;
    if (v10 >= -v7) {
      double v14 = v10;
    }
    double v15 = v14 - v13;
    id v16 = [(PUImportViewController *)self compactWidthToolbarTopConstraint];
    [v16 setConstant:v15];
  }
}

- (void)updateContentInsetForCompactWidthToolbar
{
  BOOL v3 = [(PUImportViewController *)self compactWidthToolbar];
  char v4 = [v3 isHidden];

  double v5 = 0.0;
  if ((v4 & 1) == 0)
  {
    double v6 = [(PUImportViewController *)self collectionView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;

    double v11 = [(PUImportViewController *)self compactWidthToolbar];
    objc_msgSend(v11, "sizeThatFits:", v8, v10);
    double v5 = v12;
  }
  double v13 = [(PUImportViewController *)self collectionView];
  [v13 contentInset];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  id v20 = [(PUImportViewController *)self collectionView];
  objc_msgSend(v20, "setContentInset:", v5, v15, v17, v19);
}

- (void)updateCompactWidthToolbarVisibility
{
  int v3 = [(PUImportViewController *)self compactLayoutMode];
  char v4 = [(PUImportViewController *)self compactWidthToolbar];
  int v5 = [v4 isHidden];

  if (v3 == v5)
  {
    uint64_t v6 = [(PUImportViewController *)self compactWidthToolbar];
    [(id)v6 setHidden:v3 ^ 1u];

    double v7 = [(PUImportViewController *)self compactWidthToolbar];
    LOBYTE(v6) = [v7 isHidden];

    if ((v6 & 1) == 0) {
      [(PUImportViewController *)self updateCompactWidthToolbarBackgroundGroupName];
    }
    [(PUImportViewController *)self updateContentInsetForCompactWidthToolbar];
  }
}

- (void)updateCompactWidthToolbarBackgroundGroupName
{
  int v3 = [(PUImportViewController *)self navigationController];
  char v4 = [v3 navigationBar];
  id v6 = [v4 _backdropViewLayerGroupName];

  if (v6)
  {
    int v5 = [(PUImportViewController *)self compactWidthToolbar];
    [v5 setBackdropViewGroupName:v6];
  }
}

- (void)setUpCompactWidthToolbar
{
  int v3 = [(PUImportViewController *)self compactWidthToolbar];

  if (!v3)
  {
    char v4 = objc_alloc_init(PUImportFloatingToolbarView);
    [(PUImportViewController *)self setCompactWidthToolbar:v4];

    int v5 = [(PUImportViewController *)self view];
    id v6 = [(PUImportViewController *)self compactWidthToolbar];
    double v7 = [(PUImportViewController *)self collectionView];
    [v5 insertSubview:v6 aboveSubview:v7];

    double v8 = [(PUImportViewController *)self view];
    double v9 = [(PUImportViewController *)self compactWidthToolbar];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    double v11 = [(PUImportViewController *)self compactWidthToolbar];
    double v12 = [v11 leadingAnchor];
    double v13 = [v8 leadingAnchor];
    double v14 = [v12 constraintEqualToAnchor:v13];
    [v10 addObject:v14];

    double v15 = [(PUImportViewController *)self compactWidthToolbar];
    double v16 = [v15 trailingAnchor];
    double v17 = [v8 trailingAnchor];
    double v18 = [v16 constraintEqualToAnchor:v17];
    [v10 addObject:v18];

    double v19 = [(PUImportViewController *)self compactWidthToolbar];
    id v20 = [v19 topAnchor];
    uint64_t v21 = [(PUImportViewController *)self view];
    uint64_t v22 = [v21 topAnchor];
    uint64_t v23 = [v20 constraintEqualToAnchor:v22 constant:0.0];
    [(PUImportViewController *)self setCompactWidthToolbarTopConstraint:v23];

    uint64_t v24 = [(PUImportViewController *)self compactWidthToolbarTopConstraint];
    [v10 addObject:v24];

    [MEMORY[0x1E4F28DC8] activateConstraints:v10];
    uint64_t v25 = [(PUImportViewController *)self compactWidthToolbar];
    [v25 setShouldBlurBackground:1];

    id v26 = objc_alloc_init(MEMORY[0x1E4F903B8]);
    [(PUImportViewController *)self setContentInfoBarButtonView:v26];

    uint64_t v27 = [(PUImportViewController *)self contentInfoBarButtonView];
    [v27 setUserInteractionEnabled:0];

    uint64_t v28 = [(PUImportViewController *)self contentInfoBarButtonView];
    uint64_t v29 = [v28 subtitleFont];

    uint64_t v30 = (void *)MEMORY[0x1E4FB08E0];
    [v29 pointSize];
    uint64_t v31 = objc_msgSend(v30, "monospacedDigitSystemFontOfSize:weight:");
    double v32 = [(PUImportViewController *)self contentInfoBarButtonView];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __50__PUImportViewController_setUpCompactWidthToolbar__block_invoke;
    v67[3] = &unk_1E5F2ECC8;
    v67[4] = self;
    id v33 = v31;
    id v68 = v33;
    [v32 performChanges:v67];

    double v34 = [(PUImportViewController *)self importController];
    long long v35 = [v34 importDestinationAlbum];

    id v36 = objc_alloc_init(MEMORY[0x1E4F903B8]);
    [(PUImportViewController *)self setCompactWidthAlbumPickerBarButtonView:v36];

    long long v37 = [(PUImportViewController *)self compactWidthAlbumPickerBarButtonView];
    [v37 setUserInteractionEnabled:0];

    long long v38 = [(PUImportViewController *)self compactWidthAlbumPickerBarButtonView];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __50__PUImportViewController_setUpCompactWidthToolbar__block_invoke_2;
    v64[3] = &unk_1E5F2E908;
    v64[4] = self;
    id v65 = v33;
    id v66 = v35;
    id v39 = v35;
    id v40 = v33;
    [v38 performChanges:v64];

    v41 = [PUImportCustomViewBarButton alloc];
    v42 = [(PUImportViewController *)self compactWidthAlbumPickerBarButtonView];
    v43 = [(PUImportCustomViewBarButton *)v41 initWithCustomView:v42];
    [(PUImportViewController *)self setCompactWidthAlbumPickerButton:v43];

    v44 = [(PUImportViewController *)self compactWidthAlbumPickerButton];
    [v44 addTarget:self action:sel_showAlbumPicker_ forControlEvents:64];

    v45 = [(PUImportViewController *)self accessibilityLabelForAlbumPickerControlWithDestination:v39];
    v46 = [(PUImportViewController *)self compactWidthAlbumPickerButton];
    [v46 setCustomAccessibilityLabel:v45];

    id v47 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v48 = [(PUImportViewController *)self contentInfoBarButtonView];
    v49 = (UIBarButtonItem *)[v47 initWithCustomView:v48];
    compactContentInfoButton = self->_compactContentInfoButton;
    self->_compactContentInfoButton = v49;

    v51 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    compactSpacer1 = self->_compactSpacer1;
    self->_compactSpacer1 = v51;

    id v53 = objc_alloc(MEMORY[0x1E4FB14A8]);
    long long v54 = [(PUImportViewController *)self compactWidthAlbumPickerButton];
    long long v55 = (UIBarButtonItem *)[v53 initWithCustomView:v54];
    compactImportDestinationButton = self->_compactImportDestinationButton;
    self->_compactImportDestinationButton = v55;

    long long v57 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    compactSpacer2 = self->_compactSpacer2;
    self->_compactSpacer2 = v57;

    id v59 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v60 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v61 = (UIBarButtonItem *)[v59 initWithCustomView:v60];
    compactEmptyTrailingButton = self->_compactEmptyTrailingButton;
    self->_compactEmptyTrailingButton = v61;

    [(UIBarButtonItem *)self->_compactEmptyTrailingButton setEnabled:0];
    [(UIBarButtonItem *)self->_compactEmptyTrailingButton setIsAccessibilityElement:0];
    v63 = [(PUImportViewController *)self compactWidthToolbar];
    [v63 setHidden:1];

    [(PUImportViewController *)self updateCompactWidthToolbarBackgroundGroupName];
    [(PUImportViewController *)self updateCompactWidthToolbarTopConstraint];
  }
}

void __50__PUImportViewController_setUpCompactWidthToolbar__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = [*(id *)(a1 + 32) contentInfoBarButtonView];
  [v3 setTitleFont:v2];

  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = [*(id *)(a1 + 32) contentInfoBarButtonView];
  [v5 setSubtitleFont:v4];

  id v6 = [*(id *)(a1 + 32) contentInfoBarButtonView];
  [v6 setTextAlignment:4];

  double v7 = *MEMORY[0x1E4FB2848];
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  id v9 = [*(id *)(a1 + 32) contentInfoBarButtonView];
  objc_msgSend(v9, "setMargins:", v7, 0.0, v8, 0.0);
}

void __50__PUImportViewController_setUpCompactWidthToolbar__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = [*(id *)(a1 + 32) compactWidthAlbumPickerBarButtonView];
  [v3 setTitleFont:v2];

  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = [*(id *)(a1 + 32) compactWidthAlbumPickerBarButtonView];
  [v5 setSubtitleFont:v4];

  id v6 = [*(id *)(a1 + 32) view];
  double v7 = [v6 tintColor];
  double v8 = [*(id *)(a1 + 32) compactWidthAlbumPickerBarButtonView];
  [v8 setSubtitleTextColor:v7];

  id v9 = PLLocalizedFrameworkString();
  double v10 = [*(id *)(a1 + 32) compactWidthAlbumPickerBarButtonView];
  [v10 setTitle:v9];

  double v11 = [*(id *)(a1 + 32) destinationDescriptionForCollection:*(void *)(a1 + 48)];
  double v12 = [*(id *)(a1 + 32) compactWidthAlbumPickerBarButtonView];
  [v12 setSubtitle:v11];

  double v13 = *MEMORY[0x1E4FB2848];
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v16 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  id v17 = [*(id *)(a1 + 32) compactWidthAlbumPickerBarButtonView];
  objc_msgSend(v17, "setMargins:", v13, v14, v15, v16);
}

- (void)_updateCompactToolbar
{
  v10[5] = *MEMORY[0x1E4F143B8];
  int v3 = [(PUImportViewController *)self compactWidthToolbar];

  if (v3)
  {
    uint64_t v4 = [(PUImportViewController *)self importDataSource];
    uint64_t v5 = [v4 numberOfItems];

    if (v5)
    {
      compactSpacer1 = self->_compactSpacer1;
      v10[0] = self->_compactContentInfoButton;
      v10[1] = compactSpacer1;
      compactSpacer2 = self->_compactSpacer2;
      v10[2] = self->_compactImportDestinationButton;
      v10[3] = compactSpacer2;
      v10[4] = self->_compactEmptyTrailingButton;
      double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];
      id v9 = [(PUImportViewController *)self compactWidthToolbar];
      [v9 setItems:v8];
    }
    [(PUImportViewController *)self updateCompactWidthToolbarVisibility];
  }
}

- (void)updateNavigationTitleViewVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PUImportViewController *)self navigationTitleView];
  [v5 alpha];
  double v7 = v6;

  double v8 = [(PUImportViewController *)self traitCollection];
  uint64_t v9 = [v8 verticalSizeClass];

  double v10 = 1.0;
  if (v9 == 2)
  {
    double v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v11 statusBarHeight];
    double v13 = v12;

    double v14 = [(PUImportViewController *)self navigationItem];
    double v15 = [v14 navigationBar];
    [v15 defaultHeightForMetrics:0];
    double v17 = v16;

    double v18 = [(PUImportViewController *)self collectionView];
    [v18 contentInset];
    double v20 = v19;

    double v21 = v13 + v17 + v20 + 14.0;
    uint64_t v22 = [(PUImportViewController *)self collectionView];
    [v22 contentOffset];
    double v24 = v23;

    if (v24 < -v21) {
      double v10 = 0.0;
    }
    else {
      double v10 = 1.0;
    }
  }
  if (v7 != v10)
  {
    if (!updateNavigationTitleViewVisibilityAnimated__animatingToAlpha
      || ([(id)updateNavigationTitleViewVisibilityAnimated__animatingToAlpha doubleValue], v25 != v10))
    {
      if (v3)
      {
        uint64_t v26 = [NSNumber numberWithDouble:v10];
        uint64_t v27 = (void *)updateNavigationTitleViewVisibilityAnimated__animatingToAlpha;
        updateNavigationTitleViewVisibilityAnimated__animatingToAlpha = v26;

        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        void v29[2] = __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke;
        v29[3] = &unk_1E5F2E0A8;
        void v29[4] = self;
        *(double *)&void v29[5] = v10;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v29 animations:&__block_literal_global_37517 completion:0.2];
      }
      else
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke_3;
        v28[3] = &unk_1E5F2E0A8;
        v28[4] = self;
        *(double *)&v28[5] = v10;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v28];
      }
    }
  }
}

void __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) navigationTitleView];
  [v2 setAlpha:v1];
}

void __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke_3(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) navigationTitleView];
  [v2 setAlpha:v1];
}

void __70__PUImportViewController_updateNavigationTitleViewVisibilityAnimated___block_invoke_2()
{
  v0 = (void *)updateNavigationTitleViewVisibilityAnimated__animatingToAlpha;
  updateNavigationTitleViewVisibilityAnimated__animatingToAlpha = 0;
}

- (id)deleteButtonItem
{
  BOOL v3 = [(PUImportViewController *)self importController];
  uint64_t v4 = [v3 importSource];
  int v5 = [v4 canDeleteContent];

  if (v5)
  {
    BOOL v6 = [(PUImportViewController *)self hasBackOrCloseButton];
    if (![(PUImportViewController *)self compactLayoutMode] || v6) {
      double v7 = &OBJC_IVAR___PUImportViewController__deleteButtonItemIcon;
    }
    else {
      double v7 = &OBJC_IVAR___PUImportViewController__deleteButtonItem;
    }
    id v8 = *(id *)((char *)&self->super.super.super.super.super.isa + *v7);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (BOOL)hasBackOrCloseButton
{
  BOOL v3 = [(PUImportViewController *)self navigationController];
  uint64_t v4 = [v3 viewControllers];
  int v5 = [v4 firstObject];
  if (v5 == self)
  {
    double v7 = [(PUImportViewController *)self presentingViewController];
    BOOL v6 = v7 != 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)compactLayoutMode
{
  return self->_compactLayoutMode;
}

- (int64_t)_titleViewVerticalSizeClassForExtendedTraitCollection:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 layoutSizeClass] == 1 && objc_msgSend(v3, "layoutOrientation") == 2;

  return v4;
}

- (void)updateContentInfoBarButtonTitlesWithItems:(id)a3 sizeString:(id)a4 itemsAreSelected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = [(PUImportViewController *)self importController];
  int v11 = [v10 isImportingAssets];

  double v12 = [(PUImportViewController *)self importController];
  int v13 = [v12 isDeletingAssets];

  double v14 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v15 = [v14 showProgressTitles];

  int64_t v16 = [(PUImportViewController *)self numTotalItemsToComplete];
  int64_t v17 = [(PUImportViewController *)self numItemsCompleted];
  if ((v11 | v13) == 1 && v15)
  {
    uint64_t v18 = (v16 - v17) & ~((v16 - v17) >> 63);
    double v19 = PULocalizedString(@"IMPORT_ASSET_PROGRESS_REMAINING_MULTILINE_TOP");
    PULocalizedStringWithValidatedFormat(v19, @"%d");
    double v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    double v21 = PULocalizedString(@"IMPORT_ASSET_PROGRESS_REMAINING_MULTILINE_BOTTOM");

    uint64_t v27 = v18;
    PULocalizedStringWithValidatedFormat(v21, @"%d");
    uint64_t v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    double v20 = (__CFString *)v9;
    uint64_t v22 = &stru_1F06BE7B8;
  }
  else if ([v8 count])
  {
    double v23 = PULocalizedString(@"IMPORT_ITEMS_COUNT");
    uint64_t v27 = [v8 count];
    PULocalizedStringWithValidatedFormat(v23, @"%d");
    double v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v22 = (__CFString *)v9;
  }
  else
  {
    double v20 = &stru_1F06BE7B8;
    uint64_t v22 = &stru_1F06BE7B8;
  }
  double v24 = [(PUImportViewController *)self contentInfoBarButtonView];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __96__PUImportViewController_updateContentInfoBarButtonTitlesWithItems_sizeString_itemsAreSelected___block_invoke;
  v28[3] = &unk_1E5F2E908;
  v28[4] = self;
  uint64_t v29 = v20;
  uint64_t v30 = v22;
  double v25 = v22;
  uint64_t v26 = v20;
  [v24 performChanges:v28];
}

void __96__PUImportViewController_updateContentInfoBarButtonTitlesWithItems_sizeString_itemsAreSelected___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) contentInfoBarButtonView];
  [v3 setTitle:v2];

  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) contentInfoBarButtonView];
  [v5 setSubtitle:v4];
}

- (void)updateNavigationTitleWithItems:(id)a3 sizeString:(id)a4 itemsAreSelected:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  double v10 = [(PUImportViewController *)self importController];
  int v11 = [v10 isImportingAssets];

  double v12 = [(PUImportViewController *)self importController];
  int v13 = [v12 isDeletingAssets];

  double v14 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v15 = [v14 showProgressTitles];

  int64_t v16 = [(PUImportViewController *)self numTotalItemsToComplete];
  int64_t v17 = [(PUImportViewController *)self numItemsCompleted];
  uint64_t v18 = (v16 - v17) & ~((v16 - v17) >> 63);
  if (v11 && v15 || (v13 & v15) == 1)
  {
    double v19 = PLLocalizedFrameworkString();
    double v20 = PULocalizedString(@"IMPORT_ASSET_PROGRESS_REMAINING");
    v41 = (void *)v18;
    PULocalizedStringWithValidatedFormat(v20, @"%d");
    double v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    double v19 = PXLocalizedSelectionMessageForAssets();
    double v21 = (__CFString *)v9;
  }
  else
  {
    double v21 = &stru_1F06BE7B8;
    double v19 = PLLocalizedFrameworkString();
    if ([v8 count])
    {
      long long v38 = PULocalizedString(@"IMPORT_ITEMS_COUNT");
      [v8 count];
      id v39 = PULocalizedStringWithValidatedFormat(v38, @"%d");

      id v40 = PLLocalizedFrameworkString();
      v41 = v39;
      id v42 = v9;
      PUStringWithValidatedFormat();
      double v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  v43 = v8;
  uint64_t v22 = [(PUImportViewController *)self compactWidthToolbar];
  char v23 = [v22 isHidden];

  double v24 = v9;
  if ((v23 & 1) == 0)
  {

    double v21 = &stru_1F06BE7B8;
  }
  double v25 = [(PUImportViewController *)self navigationTitleView];
  uint64_t v26 = [(PUImportViewController *)self px_extendedTraitCollection];
  int64_t v27 = [(PUImportViewController *)self _titleViewVerticalSizeClassForExtendedTraitCollection:v26];
  uint64_t v28 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  uint64_t v29 = (void *)MEMORY[0x1E4FB08E0];
  [v28 pointSize];
  uint64_t v30 = objc_msgSend(v29, "monospacedDigitSystemFontOfSize:weight:");
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __85__PUImportViewController_updateNavigationTitleWithItems_sizeString_itemsAreSelected___block_invoke;
  v44[3] = &unk_1E5F26410;
  id v45 = v25;
  id v46 = v19;
  id v48 = v30;
  int64_t v49 = v27;
  id v47 = v21;
  id v31 = v30;
  double v32 = v21;
  id v33 = v19;
  id v34 = v25;
  [v34 performChanges:v44];
  long long v35 = [(PUImportViewController *)self navigationItem];
  [v35 setTitle:v33];
  id v36 = [(PUImportViewController *)self navigationLargeTitleAccessoryLabel];
  [v36 setText:v32];

  long long v37 = [(PUImportViewController *)self navigationLargeTitleAccessoryLabel];
  [v37 sizeToFit];
}

uint64_t __85__PUImportViewController_updateNavigationTitleWithItems_sizeString_itemsAreSelected___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setSubtitle:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setVerticalSizeClass:*(void *)(a1 + 64)];
  uint64_t v2 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [*(id *)(a1 + 32) setTitleFont:v2];

  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setSubtitleFont:v3];
}

- (void)updateContentInfoLabels
{
  uint64_t v3 = [(PUImportViewController *)self importController];
  uint64_t v4 = [v3 selectionManager];
  BOOL v5 = [v4 selectionSnapshot];

  uint64_t v6 = [v5 isAnyItemSelected];
  if (v6)
  {
    double v7 = [(PUImportViewController *)self importController];
    [v7 selectedItems];
  }
  else
  {
    id v8 = [(PUImportViewController *)self importDataSourceManager];
    double v7 = [v8 unfilteredDataSource];

    [v7 allItemsUnsorted];
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [(id)objc_opt_class() totalSizeStringForItems:v10];
  [(PUImportViewController *)self updateNavigationTitleWithItems:v10 sizeString:v9 itemsAreSelected:v6];
  [(PUImportViewController *)self updateContentInfoBarButtonTitlesWithItems:v10 sizeString:v9 itemsAreSelected:v6];
}

- (void)_dismissPopupsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUImportViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(PUImportViewController *)self dismissViewControllerAnimated:v3 completion:0];
  }
}

- (void)_updateToolbarAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (![(PUImportViewController *)self isViewLoaded]) {
    return;
  }
  BOOL v5 = _importGridLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v91 = "-[PUImportViewController _updateToolbarAnimated:]";
    _os_log_debug_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  double v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = [(PUImportViewController *)self importController];
  id v9 = [v8 selectionManager];
  id v10 = [v9 selectionSnapshot];
  [v10 isAnyItemSelected];

  if (!self->_deleteButtonItem)
  {
    v83 = v7;
    int v11 = PLLocalizedFrameworkString();
    double v12 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v11 style:2 target:self action:sel_delete_];
    deleteButtonItem = self->_deleteButtonItem;
    self->_deleteButtonItem = v12;

    double v14 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:16 target:self action:sel_delete_];
    deleteButtonItemIcon = self->_deleteButtonItemIcon;
    self->_deleteButtonItemIcon = v14;

    int64_t v16 = PLLocalizedFrameworkString();

    int64_t v17 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v16 style:2 target:0 action:0];
    importButtonItem = self->_importButtonItem;
    self->_importButtonItem = v17;

    uint64_t v19 = PLLocalizedFrameworkString();

    v82 = (void *)v19;
    double v20 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v19 style:7 target:self action:sel_stopImport_];
    stopBarItem = self->_stopBarItem;
    self->_stopBarItem = v20;

    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5E8]), "initWithFrame:style:", 3, 0.0, 0.0, 28.0, 28.0);
    [(PUImportViewController *)self setRoundProgressView:v22];

    char v23 = [(PUImportViewController *)self roundProgressView];
    [v23 setUserInteractionEnabled:0];

    id v24 = objc_alloc(MEMORY[0x1E4FB14A8]);
    double v25 = [(PUImportViewController *)self roundProgressView];
    uint64_t v26 = (UIBarButtonItem *)[v24 initWithCustomView:v25];
    progressButtonItem = self->_progressButtonItem;
    self->_progressButtonItem = v26;

    uint64_t v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:self selector:sel_importControllerProgressDidChange_ name:*MEMORY[0x1E4F90EF8] object:0];

    [(UIBarButtonItem *)self->_progressButtonItem setIsAccessibilityElement:1];
    [(UIBarButtonItem *)self->_progressButtonItem setAccessibilityTraits:*MEMORY[0x1E4FB25A0] | *MEMORY[0x1E4FB25C0]];
    uint64_t v29 = PLLocalizedFrameworkString();
    [(UIBarButtonItem *)self->_progressButtonItem setAccessibilityLabel:v29];

    uint64_t v30 = [PUImportAddToAlbumsToolbarView alloc];
    id v31 = [(PUPhotosGridViewController *)self photoLibrary];
    double v32 = -[PUImportAddToAlbumsToolbarView initWithFrame:photoLibrary:](v30, "initWithFrame:photoLibrary:", v31, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    addToAlbumsToolbarView = self->_addToAlbumsToolbarView;
    self->_addToAlbumsToolbarView = v32;

    [(PUImportAddToAlbumsToolbarView *)self->_addToAlbumsToolbarView setDelegate:self];
    [(PUImportAddToAlbumsToolbarView *)self->_addToAlbumsToolbarView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v34 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_addToAlbumsToolbarView];
    albumPickerBarItem = self->_albumPickerBarItem;
    self->_albumPickerBarItem = v34;

    id v36 = [(PUImportAddToAlbumsToolbarView *)self->_addToAlbumsToolbarView accessibilityLabel];
    [(UIBarButtonItem *)self->_albumPickerBarItem setAccessibilityLabel:v36];

    long long v37 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"IMPORT", @"IMPORT_ALL", @"DELETE_ALL", @"DELETE_SELECTED", @"STOP_IMPORT", @"IMPORT_PROGRESS", @"IMPORT_TOALBUM_BARTITLE", 0);
    long long v38 = objc_opt_new();
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    id v39 = v37;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v85 objects:v89 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v86;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v86 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = PLLocalizedFrameworkString();
          [v38 addObject:v44];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v85 objects:v89 count:16];
      }
      while (v41);
    }

    [(UIBarButtonItem *)self->_deleteButtonItem setPossibleTitles:v38];
    [(UIBarButtonItem *)self->_importButtonItem setPossibleTitles:v38];
    [(UIBarButtonItem *)self->_stopBarItem setPossibleTitles:v38];
    [(UIBarButtonItem *)self->_progressButtonItem setPossibleTitles:v38];
    [(UIBarButtonItem *)self->_albumPickerBarItem setPossibleTitles:v38];

    double v7 = v83;
    uint64_t v3 = v3;
  }
  id v45 = [(PUImportViewController *)self importController];
  int v46 = [v45 isImportingAssets];

  if (v46)
  {
    [v6 addObject:self->_stopBarItem];
  }
  else
  {
    id v47 = [(PUImportViewController *)self importDataSource];
    uint64_t v48 = [v47 numberOfItems];

    if (v48)
    {
      int64_t v49 = [(PUImportViewController *)self actionCoordinator];
      [v49 configureImportActionsForBarButtonItem:self->_importButtonItem];

      [v6 addObject:self->_importButtonItem];
      v50 = PLLocalizedFrameworkString();
      [(UIBarButtonItem *)self->_deleteButtonItem setAccessibilityLabel:v50];
      [(UIBarButtonItem *)self->_deleteButtonItem setTitle:v50];
      v51 = [(PUImportViewController *)self deleteButtonItem];
      if (v51)
      {
        if ([(PUImportViewController *)self compactLayoutMode]) {
          v52 = v7;
        }
        else {
          v52 = v6;
        }
        [v52 addObject:v51];
      }
      if (self->_albumPickerBarItem)
      {
        id v53 = [(PUImportViewController *)self _spec];
        int v54 = [v53 canDisplayEditActionsInNavigationBar];

        if (v54) {
          [v7 addObject:self->_albumPickerBarItem];
        }
      }
    }
  }
  long long v55 = [(PUImportViewController *)self importController];
  if ([v55 isImportingAssets])
  {

LABEL_28:
    if ([(PUImportViewController *)self compactLayoutMode]) {
      v58 = v7;
    }
    else {
      v58 = v6;
    }
    [v58 addObject:self->_progressButtonItem];
    goto LABEL_32;
  }
  long long v56 = [(PUImportViewController *)self importController];
  int v57 = [v56 isDeletingAssets];

  if (v57) {
    goto LABEL_28;
  }
LABEL_32:
  id v59 = [(PUImportViewController *)self importController];
  if ([v59 isImportingAssets])
  {
    int v60 = 0;
  }
  else
  {
    v61 = [(PUImportViewController *)self importController];
    int v60 = [v61 isDeletingAssets] ^ 1;
  }
  v62 = [(PUImportViewController *)self importController];
  uint64_t v63 = [v62 hasLoadedInitialBatchOfAssets] & v60;

  [(UIBarButtonItem *)self->_importButtonItem setEnabled:v63];
  [(UIBarButtonItem *)self->_deleteButtonItem setEnabled:v63];
  [(UIBarButtonItem *)self->_deleteButtonItemIcon setEnabled:v63];
  v64 = [(PUImportViewController *)self navigationItem];
  [v64 setLargeTitleDisplayMode:0];
  if ([(PUImportViewController *)self hasBackOrCloseButton])
  {
    id v65 = [v7 reverseObjectEnumerator];
    id v66 = [v65 allObjects];
    [v6 addObjectsFromArray:v66];
  }
  else
  {
    [v64 setLeftBarButtonItems:v7 animated:v3];
  }
  [v64 setRightBarButtonItems:v6 animated:v3];
  if (!self->_navigationTitleView)
  {
    v67 = (PXNavigationTitleView *)objc_alloc_init(MEMORY[0x1E4F903B8]);
    navigationTitleView = self->_navigationTitleView;
    self->_navigationTitleView = v67;

    [(PXNavigationTitleView *)self->_navigationTitleView margins];
    v69 = self->_navigationTitleView;
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __49__PUImportViewController__updateToolbarAnimated___block_invoke;
    v84[3] = &unk_1E5F2E058;
    v84[4] = self;
    v84[5] = v70;
    v84[6] = v71;
    v84[7] = 0;
    v84[8] = v72;
    [(PXNavigationTitleView *)v69 performChanges:v84];
    v73 = [(PUImportViewController *)self navigationTitleView];
    [v64 setTitleView:v73];

    [(PUImportViewController *)self updateNavigationTitleViewVisibilityAnimated:0];
  }
  if (!self->_navigationLargeTitleAccessoryLabel)
  {
    v74 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    navigationLargeTitleAccessoryLabel = self->_navigationLargeTitleAccessoryLabel;
    self->_navigationLargeTitleAccessoryLabel = v74;

    v76 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    v77 = (void *)MEMORY[0x1E4FB08E0];
    [v76 pointSize];
    v78 = objc_msgSend(v77, "monospacedDigitSystemFontOfSize:weight:");
    [(UILabel *)self->_navigationLargeTitleAccessoryLabel setFont:v78];
  }
  v79 = [(PUImportViewController *)self _spec];
  int v80 = [v79 canDisplayEditActionsInNavigationBar];

  if (v80) {
    v81 = self->_navigationLargeTitleAccessoryLabel;
  }
  else {
    v81 = 0;
  }
  [v64 _setLargeTitleAccessoryView:v81];
  [(PUImportViewController *)self updateContentInfoLabels];
  [(PUImportViewController *)self _updateCompactToolbar];
}

uint64_t __49__PUImportViewController__updateToolbarAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 2056), "setMargins:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)_isItemVisibleAtIndex:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUImportViewController *)self collectionView];
  uint64_t v6 = [v5 cellForItemAtIndexPath:v4];

  return v6 != 0;
}

- (void)reloadData
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(PUImportViewController *)self isViewLoaded])
  {
    uint64_t v3 = _importGridLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(PUImportViewController *)self importDataSource];
      int v6 = 136315394;
      double v7 = "-[PUImportViewController reloadData]";
      __int16 v8 = 2048;
      uint64_t v9 = [v4 identifier];
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "%s: Reloading datasource %lu. Expensive (cancels all requests).", (uint8_t *)&v6, 0x16u);
    }
    BOOL v5 = [(PUImportViewController *)self collectionView];
    [v5 reloadData];
  }
}

+ (unsigned)defaultThumbnailImageFormat
{
  if (defaultThumbnailImageFormat_onceToken != -1) {
    dispatch_once(&defaultThumbnailImageFormat_onceToken, &__block_literal_global_660);
  }
  return defaultThumbnailImageFormat_imageFormat;
}

void __53__PUImportViewController_defaultThumbnailImageFormat__block_invoke()
{
  if (!defaultThumbnailImageFormat_imageFormat)
  {
    int IsIPad = PLPhysicalDeviceIsIPad();
    double v1 = off_1E5F1F010;
    if (!IsIPad) {
      double v1 = off_1E5F1F030;
    }
    id v2 = objc_alloc_init(*v1);
    defaultThumbnailImageFormat_imageFormat = [v2 thumbnailImageFormat];
  }
}

+ (id)totalSizeStringForItems:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PUImportViewController_totalSizeStringForItems___block_invoke;
  v6[3] = &unk_1E5F26438;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  id v4 = [MEMORY[0x1E4F28B68] stringFromByteCount:v8[3] countStyle:0];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__PUImportViewController_totalSizeStringForItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 importAsset];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 assetSizeIncludingRelatedAssets];
}

@end