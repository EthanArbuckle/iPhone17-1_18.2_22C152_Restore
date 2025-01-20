@interface PUAlbumListViewController
+ (id)newMyAlbumsViewControllerWithSpec:(id)a3 sessionInfo:(id)a4 dataSourceManager:(id)a5 photoLibrary:(id)a6;
+ (id)newMyAlbumsViewControllerWithSpec:(id)a3 sessionInfo:(id)a4 photoLibrary:(id)a5;
- (BOOL)_aboutToCreateAlbum;
- (BOOL)_canDragIn;
- (BOOL)_isKeyboardAware;
- (BOOL)_isPlaceholderEnabled:(int64_t)a3;
- (BOOL)_needsUpdate;
- (BOOL)_shouldShowAggregateItem;
- (BOOL)_someAlbumSupportsEditing;
- (BOOL)_updateInterfaceForIncrementalModelChangeHandler:(id)a3 withSectionedChangeDetails:(id)a4 animated:(BOOL)a5;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5;
- (BOOL)albumListCellContentViewShouldBeginRetitling:(id)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canNavigateToCollection:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canShowAggregateItem;
- (BOOL)canShowAvatarViews;
- (BOOL)canShowSyncProgress;
- (BOOL)cloudFeedAssetIsAvailableForNavigation:(id)a3;
- (BOOL)cloudFeedCommentIsAvailableForNavigation:(id)a3;
- (BOOL)cloudFeedInvitationForAlbumIsAvailableForNavigation:(id)a3;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canReorderItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isPlaceholderAtIndexPath:(id)a3;
- (BOOL)isRootFolder;
- (BOOL)isRootSharedAlbumList;
- (BOOL)isViewInSyncWithModel;
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)progressViewVisible;
- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3;
- (BOOL)pu_wantsToolbarVisible;
- (BOOL)shouldAllowEmailInAlbumSubtitle;
- (BOOL)shouldAutorotate;
- (BOOL)shouldBeginRetitlingAlbumAtIndexPath:(id)a3;
- (BOOL)shouldEnableCollection:(id)a3;
- (BOOL)shouldHideEmptyCollections;
- (BOOL)shouldShowAllPhotosItem;
- (BOOL)showAddNewAlbumPlaceholder;
- (BOOL)showsEmptyPlaceholderWhenEmpty;
- (BOOL)showsSeparatorBelowTopPlaceholdersSection;
- (BOOL)showsTopPlaceholdersSection;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)updateSpec;
- (CGRect)_previousPreheatRect;
- (CGSize)_layoutReferenceSize;
- (NSMutableSet)_preheatedCollections;
- (NSString)_justCreatedCollectionIdentifier;
- (NSUserActivity)siriActionActivity;
- (PHCachingImageManager)_cachingImageManager;
- (PHCollection)collection;
- (PHCollection)pushedAlbum;
- (PHCollection)retitlingCollection;
- (PHImageRequestOptions)_imageRequestOptions;
- (PHPhotoLibrary)photoLibrary;
- (PHPickerViewController)pickerViewController;
- (PUAlbumListCell)focusedListCell;
- (PUAlbumListViewController)initWithSpec:(id)a3;
- (PUAlbumListViewController)initWithSpec:(id)a3 dataSourceManager:(id)a4 photoLibrary:(id)a5;
- (PUAlbumListViewController)initWithSpec:(id)a3 isRootSharedAlbumList:(BOOL)a4;
- (PUAlbumListViewController)initWithSpec:(id)a3 photoLibrary:(id)a4;
- (PUAlbumListViewControllerSpec)spec;
- (PUCollectionView)_mainCollectionView;
- (PUCollectionsCollectionViewDropDelegate)collectionViewDropDelegate;
- (PUFontManager)_fontManager;
- (PUSectionedGridLayout)_mainCollectionViewLayout;
- (PUSessionInfo)sessionInfo;
- (PXAssetBadgeManager)_badgeManager;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXCollectionTileLayoutTemplate)_collectionTileLayoutTemplate;
- (PXFeatureSpec)_featureSpec;
- (PXFeatureSpecManager)_featureSpecManager;
- (PXLibraryFilterState)libraryFilterState;
- (PXPhotoKitCollectionsDataSource)dataSource;
- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager;
- (PXPhotoKitCollectionsDataSourceManagerConfiguration)dataSourceManagerConfiguration;
- (PXPhotosGlobalFooterView)syncProgressView;
- (PXPlacesAlbumCoverProvider)_placesAlbumCoverProvider;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (UIEdgeInsets)_layoutSafeAreaInsets;
- (UITableView)_mainTableView;
- (UIView)_backgroundView;
- (UIViewController)_placesContainerController;
- (UIViewController)pushedController;
- (_NSRange)albumsSections;
- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_albumCreationButtonItem;
- (id)_assetsFetchOptions;
- (id)_cancelButtonItem;
- (id)_collectionForNavigation;
- (id)_createControllerForFolder:(id)a3;
- (id)_doneButtonItem;
- (id)_getDisplayableAssetsForFolder:(id)a3 maximumCount:(int64_t)a4 useCache:(BOOL)a5 correspondingCollections:(id *)a6;
- (id)_getDisplayableFacesForCollectionList:(id)a3 maximumCount:(int64_t)a4;
- (id)_justCreatedCollectionAnimationCompletionHandler;
- (id)_keyAssetsForMoments;
- (id)_onViewDidLayoutSubviewsBlock;
- (id)_pendingScrollingAnimationEndBlock;
- (id)_pickerBannerView;
- (id)_preparedAlbumListCellContentViewAtIndexPath:(id)a3;
- (id)_suppressionContexts;
- (id)_targetIndexPathForMoveFromIndexPath:(id)a3 toProposedIndexPath:(id)a4;
- (id)_viewControllerForCollection:(id)a3 userActivity:(id *)a4;
- (id)_visibleAssetsForCollection:(id)a3;
- (id)_visibleAssetsForCollection:(id)a3 correspondingCollections:(id *)a4;
- (id)_visibleAssetsForCollection:(id)a3 maximumNumberOfVisibleAssets:(int64_t)a4 correspondingCollections:(id *)a5;
- (id)assetsFilterPredicate;
- (id)backgroundColorForTableView;
- (id)bestReferenceItemIndexPath;
- (id)collectionAtIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewDropDelegate:(id)a3 collectionAtIndexPath:(id)a4;
- (id)contextMenuInteractionEndBlock;
- (id)finishedPickingBlock;
- (id)indexPathForAddNewAlbumPlaceholder;
- (id)indexPathForAggregateItem;
- (id)indexPathForAlbumListCellContentView:(id)a3;
- (id)indexPathForCollection:(id)a3;
- (id)indexPathForFirstEditableAlbum;
- (id)indexPathForItemAtPoint:(CGPoint)a3;
- (id)indexPathForPeopleAlbum;
- (id)indexPathForPlacesAlbum;
- (id)indexPathsForItemsInRect:(CGRect)a3;
- (id)indexPathsForVisibleItems;
- (id)mainScrollView;
- (id)newGridViewControllerForAllPhotos;
- (id)newGridViewControllerForAssetCollection:(id)a3;
- (id)newGridViewControllerForFolder:(id)a3;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)px_gridPresentation;
- (id)px_navigationDestination;
- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3;
- (id)sectionedGridLayout:(id)a3 sectionsForVisualSection:(int64_t)a4;
- (id)subtitleForCollection:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)_ignoredReorderNotificationCount;
- (int64_t)_preferredWhitePointAdaptivityStyle;
- (int64_t)albumsSection;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)numberOfVisualSectionsForSectionedGridLayout:(id)a3;
- (int64_t)placeholderKindAtIndexPath:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewStyle;
- (int64_t)topPlaceholdersSection;
- (unint64_t)_editCapabilitiesForAlbum:(id)a3;
- (unint64_t)_stackViewStyleForCollection:(id)a3;
- (unint64_t)_unfilteredIndexForFilteredIndexPath:(id)a3;
- (unint64_t)filteringAssetTypes;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_didSelectPlaceholderAtIndexPath:(id)a3;
- (void)_dismissPhotosPickerControllerAnimated:(BOOL)a3;
- (void)_enumerateIndexPathsForPreparedItemsUsingBlock:(id)a3;
- (void)_getDisplayableAssets:(id *)a3 indexes:(id *)a4 forCollection:(id)a5 maximumCount:(int64_t)a6 useCache:(BOOL)a7;
- (void)_handleCancelButton:(id)a3;
- (void)_handleCollectionListActionType:(id)a3;
- (void)_handleDeleteAlbumAtIndexPath:(id)a3;
- (void)_handleDeleteCollection:(id)a3 sourceView:(id)a4;
- (void)_handleDeleteKeyCommand:(id)a3;
- (void)_handleDoneButton:(id)a3;
- (void)_handleOpenKeyCommand:(id)a3;
- (void)_handlePendingScrollingAnimationEndBlock;
- (void)_handleRenameKeyCommand:(id)a3;
- (void)_invalidatePreparedCellsConfiguration;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_navigateToDestination:(id)a3 provideViewControllers:(BOOL)a4 options:(unint64_t)a5 completionHandler:(id)a6;
- (void)_navigateToMemories;
- (void)_navigateToPeopleAnimated:(BOOL)a3 withPersonLocalIdentifier:(id)a4 withCompletion:(id)a5;
- (void)_navigateToPlacesFromCollection:(id)a3;
- (void)_performBatchUpdates:(id)a3 withDeletedSections:(id)a4 insertedSections:(id)a5 changedSections:(id)a6 deletedItemsIndexPaths:(id)a7 insertedItemsIndexPaths:(id)a8 changedItemsIndexPaths:(id)a9 movedItemsFromIndexPaths:(id)a10 movedItemsToIndexPaths:(id)a11 completionHandler:(id)a12;
- (void)_performOrScheduleScrollToCollection:(id)a3 animated:(BOOL)a4;
- (void)_postDidAppearActions;
- (void)_prepareStackView:(id)a3 forCollection:(id)a4 withStackCount:(int64_t)a5 withCustomEmptyPlaceHolderImage:(id)a6;
- (void)_recursivelyCollectCollectionsIn:(id)a3 fetchResult:(id)a4;
- (void)_resetPreheating;
- (void)_scrollToCollection:(id)a3 animated:(BOOL)a4;
- (void)_setAboutToCreateAlbum:(BOOL)a3;
- (void)_setBackgroundView:(id)a3;
- (void)_setFeatureSpec:(id)a3;
- (void)_setIgnoredReorderNotificationCount:(int64_t)a3;
- (void)_setJustCreatedCollectionAnimationCompletionHandler:(id)a3;
- (void)_setJustCreatedCollectionIdentifier:(id)a3;
- (void)_setKeyboardAware:(BOOL)a3;
- (void)_setLayoutReferenceSize:(CGSize)a3;
- (void)_setLayoutSafeAreaInsets:(UIEdgeInsets)a3;
- (void)_setMainCollectionView:(id)a3;
- (void)_setMainCollectionViewLayout:(id)a3;
- (void)_setMainTableView:(id)a3;
- (void)_setOnViewDidLayoutSubviewsBlock:(id)a3;
- (void)_setPendingScrollingAnimationEndBlock:(id)a3;
- (void)_setPreheatedCollections:(id)a3;
- (void)_setPreviousPreheatRect:(CGRect)a3;
- (void)_updateAddNewAlbumPlaceholderAnimated:(BOOL)a3;
- (void)_updateAlbumSubtitleFormat;
- (void)_updateCollageView:(id)a3 forAssets:(id)a4;
- (void)_updateEmptyPlaceholder;
- (void)_updateIfNeeded;
- (void)_updateInterfaceForModelReloadAnimated:(BOOL)a3;
- (void)_updateLayoutMetrics;
- (void)_updateMainView;
- (void)_updateNavigationBannerAnimated:(BOOL)a3;
- (void)_updatePeripheralInterfaceAnimated:(BOOL)a3;
- (void)_updatePreheatedAssets;
- (void)_updatePreparedCellsConfigurationIfNeeded;
- (void)_updateStackView:(id)a3 forAssets:(id)a4 collection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6;
- (void)_updateStackView:(id)a3 forFaces:(id)a4 inCollection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6;
- (void)_updateTitle;
- (void)_visiblyInsertItemAtIndexPath:(id)a3 modelUpdate:(id)a4 completionHandler:(id)a5;
- (void)albumListCellContentView:(id)a3 didEndRetitlingFromTitle:(id)a4 toTitle:(id)a5;
- (void)albumListCellContentView:(id)a3 performDeleteAction:(id)a4;
- (void)albumListTableViewCell:(id)a3 willChangeState:(unint64_t)a4;
- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4;
- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5 completionHandler:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5;
- (void)dealloc;
- (void)deselectSelectedItemAnimated:(BOOL)a3;
- (void)didSelectItemAtIndexPath:(id)a3;
- (void)handleSessionInfoAlbumSelection:(id)a3;
- (void)navigateToAllPhotosAnimated:(BOOL)a3 completion:(id)a4;
- (void)navigateToCollection:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)navigateToPeopleAnimated:(BOOL)a3 withPersonLocalIdentifier:(id)a4 withCompletion:(id)a5;
- (void)navigateToRevealAssetCollection:(id)a3 initiallyHidden:(BOOL)a4 animated:(BOOL)a5;
- (void)newAlbum:(id)a3;
- (void)newFolder:(id)a3;
- (void)newSmartAlbum:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)placesSnapshotCountDidChange;
- (void)placesSnapshotDidChange;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)provideViewControllersForDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)reloadContentView;
- (void)scrollToItemAtIndexPath:(id)a3 centered:(BOOL)a4 animated:(BOOL)a5;
- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)sessionInfoPhotoSelectionDidChange:(id)a3;
- (void)setAssetCollectionActionManager:(id)a3;
- (void)setCanShowAggregateItem:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionViewDropDelegate:(id)a3;
- (void)setContextMenuInteractionEndBlock:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDataSourceManager:(id)a3;
- (void)setDataSourceManagerConfiguration:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFinishedPickingBlock:(id)a3;
- (void)setKeyboardAware:(BOOL)a3;
- (void)setPickerViewController:(id)a3;
- (void)setProgressViewVisible:(BOOL)a3;
- (void)setPushedAlbum:(id)a3;
- (void)setPushedController:(id)a3;
- (void)setRetitlingCollection:(id)a3;
- (void)setSessionInfo:(id)a3;
- (void)setSiriActionActivity:(id)a3;
- (void)setSyncProgressView:(id)a3;
- (void)setSyncProgressVisible:(BOOL)a3;
- (void)setTitleForCell:(id)a3 withCollection:(id)a4;
- (void)setViewInSyncWithModel:(BOOL)a3;
- (void)setupDropDelegateForCollectionView:(id)a3;
- (void)showPlacesCount:(int64_t)a3;
- (void)showPlacesCount:(int64_t)a3 atIndexPath:(id)a4;
- (void)showPlacesPlaceholderImageInStackView:(id)a3 andContentView:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)updateAlbumListCellContentView:(id)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5;
- (void)updateInterfaceLayoutIfNecessary;
- (void)updateListCellForItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)updateNavigationBarAnimated:(BOOL)a3;
- (void)updatePlaceholderListCellContentView:(id)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5;
- (void)updateSyncProgress;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUAlbumListViewController

- (id)collectionViewDropDelegate:(id)a3 collectionAtIndexPath:(id)a4
{
  return [(PUAlbumListViewController *)self collectionAtIndexPath:a4];
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(PUAlbumListViewController *)self collectionViewDropDelegate];
  int v12 = [v11 collectionView:v8 shouldSpringLoadItemAtIndexPath:v9 withContext:v10];

  if (v12)
  {
    v13 = [v8 cellForItemAtIndexPath:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v13 albumListCellContentView];
      v15 = [v14 springLoadingTargetView];

      if (v15)
      {
        [v10 setTargetView:v15];
      }
    }
  }
  return v12;
}

- (BOOL)_canDragIn
{
  v2 = [(PUAlbumListViewController *)self sessionInfo];
  char v3 = [v2 isSelectingTargetAlbum] ^ 1;

  return v3;
}

- (void)setupDropDelegateForCollectionView:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PUCollectionsCollectionViewDropDelegate);
  [(PUCollectionsCollectionViewDropDelegate *)v5 setDropDataProvider:self];
  [v4 setDropDelegate:v5];

  [(PUAlbumListViewController *)self setCollectionViewDropDelegate:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_collectionViewDropDelegate, 0);
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->__placesContainerController, 0);
  objc_storeStrong((id *)&self->__featureSpec, 0);
  objc_storeStrong((id *)&self->__featureSpecManager, 0);
  objc_storeStrong((id *)&self->__collectionTileLayoutTemplate, 0);
  objc_storeStrong((id *)&self->__badgeManager, 0);
  objc_storeStrong(&self->__pendingScrollingAnimationEndBlock, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong(&self->_finishedPickingBlock, 0);
  objc_destroyWeak((id *)&self->_pickerViewController);
  objc_storeStrong((id *)&self->__mainTableView, 0);
  objc_storeStrong((id *)&self->__mainCollectionViewLayout, 0);
  objc_storeStrong((id *)&self->__mainCollectionView, 0);
  objc_storeStrong((id *)&self->__preheatedCollections, 0);
  objc_storeStrong((id *)&self->_pushedController, 0);
  objc_storeStrong((id *)&self->_pushedAlbum, 0);
  objc_storeStrong(&self->_contextMenuInteractionEndBlock, 0);
  objc_storeStrong((id *)&self->_syncProgressView, 0);
  objc_storeStrong(&self->__onViewDidLayoutSubviewsBlock, 0);
  objc_storeStrong(&self->__justCreatedCollectionAnimationCompletionHandler, 0);
  objc_storeStrong((id *)&self->__justCreatedCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
  objc_storeStrong((id *)&self->__cachingImageManager, 0);
  objc_storeStrong((id *)&self->_retitlingCollection, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_dataSourceManagerConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->__placesAlbumCoverProvider, 0);
  objc_storeStrong((id *)&self->__fontManager, 0);
  objc_storeStrong((id *)&self->__imageRequestOptions, 0);
  objc_storeStrong((id *)&self->_sectionHeaderView, 0);
  objc_storeStrong((id *)&self->_keyAssetsForMoments, 0);
  objc_storeStrong((id *)&self->_aggregateCollageView, 0);
  objc_storeStrong((id *)&self->_albumSubtitleFormat, 0);
  objc_storeStrong((id *)&self->_albumCreationButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)setCollectionViewDropDelegate:(id)a3
{
}

- (PUCollectionsCollectionViewDropDelegate)collectionViewDropDelegate
{
  return self->_collectionViewDropDelegate;
}

- (void)setSiriActionActivity:(id)a3
{
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (UIViewController)_placesContainerController
{
  return self->__placesContainerController;
}

- (void)_setFeatureSpec:(id)a3
{
}

- (PXFeatureSpec)_featureSpec
{
  return self->__featureSpec;
}

- (PXFeatureSpecManager)_featureSpecManager
{
  return self->__featureSpecManager;
}

- (PXCollectionTileLayoutTemplate)_collectionTileLayoutTemplate
{
  return self->__collectionTileLayoutTemplate;
}

- (PXAssetBadgeManager)_badgeManager
{
  return self->__badgeManager;
}

- (void)_setPendingScrollingAnimationEndBlock:(id)a3
{
}

- (id)_pendingScrollingAnimationEndBlock
{
  return self->__pendingScrollingAnimationEndBlock;
}

- (UIEdgeInsets)_layoutSafeAreaInsets
{
  double top = self->__layoutSafeAreaInsets.top;
  double left = self->__layoutSafeAreaInsets.left;
  double bottom = self->__layoutSafeAreaInsets.bottom;
  double right = self->__layoutSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)_layoutReferenceSize
{
  double width = self->__layoutReferenceSize.width;
  double height = self->__layoutReferenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDataSource:(id)a3
{
}

- (void)setDataSourceManager:(id)a3
{
}

- (PXPhotoKitCollectionsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setAssetCollectionActionManager:(id)a3
{
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  return self->_assetCollectionActionManager;
}

- (void)setFinishedPickingBlock:(id)a3
{
}

- (id)finishedPickingBlock
{
  return self->_finishedPickingBlock;
}

- (void)setPickerViewController:(id)a3
{
}

- (PHPickerViewController)pickerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerViewController);
  return (PHPickerViewController *)WeakRetained;
}

- (void)_setIgnoredReorderNotificationCount:(int64_t)a3
{
  self->__ignoredReorderNotificationCount = a3;
}

- (int64_t)_ignoredReorderNotificationCount
{
  return self->__ignoredReorderNotificationCount;
}

- (void)_setMainTableView:(id)a3
{
}

- (UITableView)_mainTableView
{
  return self->__mainTableView;
}

- (void)_setMainCollectionViewLayout:(id)a3
{
}

- (PUSectionedGridLayout)_mainCollectionViewLayout
{
  return self->__mainCollectionViewLayout;
}

- (void)_setMainCollectionView:(id)a3
{
}

- (PUCollectionView)_mainCollectionView
{
  return self->__mainCollectionView;
}

- (void)_setPreheatedCollections:(id)a3
{
}

- (NSMutableSet)_preheatedCollections
{
  return self->__preheatedCollections;
}

- (void)_setPreviousPreheatRect:(CGRect)a3
{
  self->__previousPreheatRect = a3;
}

- (CGRect)_previousPreheatRect
{
  double x = self->__previousPreheatRect.origin.x;
  double y = self->__previousPreheatRect.origin.y;
  double width = self->__previousPreheatRect.size.width;
  double height = self->__previousPreheatRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPushedController:(id)a3
{
}

- (UIViewController)pushedController
{
  return self->_pushedController;
}

- (void)setPushedAlbum:(id)a3
{
}

- (PHCollection)pushedAlbum
{
  return self->_pushedAlbum;
}

- (void)setContextMenuInteractionEndBlock:(id)a3
{
}

- (id)contextMenuInteractionEndBlock
{
  return self->_contextMenuInteractionEndBlock;
}

- (void)setSyncProgressView:(id)a3
{
}

- (PXPhotosGlobalFooterView)syncProgressView
{
  return self->_syncProgressView;
}

- (void)setProgressViewVisible:(BOOL)a3
{
  self->_progressViewVisible = a3;
}

- (BOOL)progressViewVisible
{
  return self->_progressViewVisible;
}

- (void)_setKeyboardAware:(BOOL)a3
{
  self->__isKeyboardAware = a3;
}

- (BOOL)_isKeyboardAware
{
  return self->__isKeyboardAware;
}

- (void)_setOnViewDidLayoutSubviewsBlock:(id)a3
{
}

- (id)_onViewDidLayoutSubviewsBlock
{
  return self->__onViewDidLayoutSubviewsBlock;
}

- (void)_setAboutToCreateAlbum:(BOOL)a3
{
  self->__aboutToCreateAlbum = a3;
}

- (BOOL)_aboutToCreateAlbum
{
  return self->__aboutToCreateAlbum;
}

- (void)_setJustCreatedCollectionAnimationCompletionHandler:(id)a3
{
}

- (id)_justCreatedCollectionAnimationCompletionHandler
{
  return self->__justCreatedCollectionAnimationCompletionHandler;
}

- (void)_setJustCreatedCollectionIdentifier:(id)a3
{
}

- (NSString)_justCreatedCollectionIdentifier
{
  return self->__justCreatedCollectionIdentifier;
}

- (void)_setBackgroundView:(id)a3
{
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (PHCachingImageManager)_cachingImageManager
{
  return self->__cachingImageManager;
}

- (void)setRetitlingCollection:(id)a3
{
}

- (PHCollection)retitlingCollection
{
  return self->_retitlingCollection;
}

- (void)setViewInSyncWithModel:(BOOL)a3
{
  self->_viewInSyncWithModel = a3;
}

- (BOOL)isViewInSyncWithModel
{
  return self->_viewInSyncWithModel;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setCanShowAggregateItem:(BOOL)a3
{
  self->_canShowAggregateItem = a3;
}

- (BOOL)canShowAggregateItem
{
  return self->_canShowAggregateItem;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (PXPhotoKitCollectionsDataSourceManagerConfiguration)dataSourceManagerConfiguration
{
  return self->_dataSourceManagerConfiguration;
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (PXPlacesAlbumCoverProvider)_placesAlbumCoverProvider
{
  return self->__placesAlbumCoverProvider;
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUAlbumListViewController.m", 4087, @"Invalid parameter not satisfying: %@", @"assetCollectionHandler" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PUAlbumListViewController.m", 4088, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  if (appIntentsEnumerateAssetCollections_completionHandler__predicate != -1) {
    dispatch_once(&appIntentsEnumerateAssetCollections_completionHandler__predicate, &__block_literal_global_640);
  }
  id v9 = [(PUAlbumListViewController *)self dataSource];
  id v10 = appIntentsEnumerateAssetCollections_completionHandler__serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2;
  block[3] = &unk_1E5F2E958;
  id v17 = v9;
  id v18 = v7;
  id v19 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(v10, block);
}

void __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3;
  v3[3] = &unk_1E5F23488;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateCollectionsUsingBlock:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v3 = v4;

    if (v3) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {

    id v3 = 0;
  }
}

void __83__PUAlbumListViewController_appIntentsEnumerateAssetCollections_completionHandler___block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("PUAlbumListViewController", attr);
  v2 = (void *)appIntentsEnumerateAssetCollections_completionHandler__serialQueue;
  appIntentsEnumerateAssetCollections_completionHandler__serialQueue = (uint64_t)v1;
}

- (void)placesSnapshotCountDidChange
{
  objc_initWeak(&location, self);
  id v3 = [(PUAlbumListViewController *)self _placesAlbumCoverProvider];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PUAlbumListViewController_placesSnapshotCountDidChange__block_invoke;
  v4[3] = &unk_1E5F2E558;
  objc_copyWeak(&v5, &location);
  [v3 requestAssetCountWithForcedRefresh:1 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__PUAlbumListViewController_placesSnapshotCountDidChange__block_invoke(uint64_t a1, void *a2)
{
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = a2;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v3);
}

void __57__PUAlbumListViewController_placesSnapshotCountDidChange__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showPlacesCount:*(void *)(a1 + 40)];
}

- (void)placesSnapshotDidChange
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

void __52__PUAlbumListViewController_placesSnapshotDidChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_queue_t v1 = [WeakRetained indexPathForPlacesAlbum];
  [WeakRetained updateListCellForItemAtIndexPath:v1 animated:0];
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (PUFontManager)_fontManager
{
  fontManager = self->__fontManager;
  if (!fontManager)
  {
    id v4 = objc_alloc_init(PUFontManager);
    id v5 = self->__fontManager;
    self->__fontManager = v4;

    [(PUFontManager *)self->__fontManager registerChangeObserver:self context:PUFontManagerObservationContext];
    fontManager = self->__fontManager;
  }
  return fontManager;
}

- (void)_updateIfNeeded
{
  if ([(PUAlbumListViewController *)self _needsUpdate])
  {
    [(PUAlbumListViewController *)self _updatePreparedCellsConfigurationIfNeeded];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.preparedCellsConfiguration;
}

- (void)_updatePreparedCellsConfigurationIfNeeded
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.preparedCellsConfiguration)
  {
    self->_needsUpdateFlags.preparedCellsConfiguration = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__PUAlbumListViewController__updatePreparedCellsConfigurationIfNeeded__block_invoke;
    v16[3] = &unk_1E5F23460;
    v16[4] = self;
    [(PUAlbumListViewController *)self _enumerateIndexPathsForPreparedItemsUsingBlock:v16];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = [(PUAlbumListViewController *)self collectionView];
    id v4 = [v3 indexPathsForVisibleSupplementaryElementsOfKind:@"PUAlbumListViewControllerElementKindSectionHeader"];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
          id v10 = [(PUAlbumListViewController *)self collectionView];
          id v11 = [v10 supplementaryViewForElementKind:@"PUAlbumListViewControllerElementKindSectionHeader" atIndexPath:v9];

          [(PUAlbumListViewController *)self configureSupplementaryView:v11 ofKind:@"PUAlbumListViewControllerElementKindSectionHeader" forIndexPath:v9];
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v6);
    }
  }
}

uint64_t __70__PUAlbumListViewController__updatePreparedCellsConfigurationIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateListCellForItemAtIndexPath:a2 animated:0];
}

- (void)_invalidatePreparedCellsConfiguration
{
  self->_needsUpdateFlags.preparedCellsConfiguration = 1;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXPhotoKitCollectionsDataSourceManagerObservationContext != a5)
  {
    if ((void *)PUFontManagerObservationContext == a5)
    {
      [(PUAlbumListViewController *)self _updateMainView];
      [(PUAlbumListViewController *)self _updateInterfaceForModelReloadAnimated:0];
    }
    else if ((void *)PXSpecManagerObservationContext == a5)
    {
      v24 = [(PUAlbumListViewController *)self _featureSpecManager];
      v25 = [v24 spec];

      [(PUAlbumListViewController *)self _setFeatureSpec:v25];
    }
    else
    {
      if ((void *)PXSharedLibraryStatusProviderObservationContext != a5)
      {
        v57 = [MEMORY[0x1E4F28B00] currentHandler];
        [v57 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:3996 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      if ((v6 & 3) != 0) {
        [(PUAlbumListViewController *)self updateNavigationBarAnimated:0];
      }
    }
    goto LABEL_39;
  }
  id v10 = [(PUAlbumListViewController *)self dataSourceManager];
  id v11 = [v10 dataSource];
  long long v12 = [v10 changeHistory];
  long long v13 = [(PUAlbumListViewController *)self dataSource];
  long long v14 = objc_msgSend(v12, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v13, "identifier"), objc_msgSend(v11, "identifier"));

  if ((unint64_t)[v14 count] >= 2)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:3872 description:@"Should only have one change details at most."];
  }
  long long v15 = [v14 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v16 = [v15 isCountUpdateChange];
  }
  else {
    char v16 = 0;
  }
  v62 = v14;
  v61 = v15;
  id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F91278]), "initWithSectionedDataSourceChangeDetails:shiftedSection:", v15, -[PUAlbumListViewController albumsSections](self, "albumsSections"));
  uint64_t v18 = [(PUAlbumListViewController *)self pushedAlbum];
  if (v18)
  {
    id v19 = [v17 deletedItemsIndexPaths];
    [(PUAlbumListViewController *)self pushedAlbum];
    id v20 = v9;
    v22 = v21 = v10;
    v23 = [(PUAlbumListViewController *)self indexPathForCollection:v22];
    int v63 = [v19 containsObject:v23];

    id v10 = v21;
    id v9 = v20;
  }
  else
  {
    int v63 = 0;
  }

  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__PUAlbumListViewController_observable_didChange_context___block_invoke;
  aBlock[3] = &unk_1E5F2E0D0;
  v70 = &v71;
  aBlock[4] = self;
  id v26 = v11;
  id v69 = v26;
  v27 = (void (**)(void))_Block_copy(aBlock);
  BOOL v28 = [(PUAlbumListViewController *)self isViewInSyncWithModel];
  [(PUAlbumListViewController *)self setViewInSyncWithModel:0];
  if (![(PUAlbumListViewController *)self px_isVisible]) {
    goto LABEL_32;
  }
  if ((v16 & 1) == 0) {
    [(PUAlbumListViewController *)self _updateAlbumSubtitleFormat];
  }
  if (v17 && ![v17 hasIncrementalChanges]) {
    goto LABEL_31;
  }
  if (([v17 hasMoves] | !v28)) {
    goto LABEL_31;
  }
  v29 = [v17 contentItemsChangedIndexPaths];
  uint64_t v30 = [v29 count];

  if (!v17)
  {
    if (v30) {
      goto LABEL_31;
    }
  }
  v31 = [(PUAlbumListViewController *)self _justCreatedCollectionIdentifier];

  if (v31)
  {
    v32 = [v17 deletedSections];
    if ([v32 count])
    {
LABEL_29:

      goto LABEL_30;
    }
    v33 = [v17 insertedSections];
    if ([v33 count])
    {

      goto LABEL_29;
    }
    v39 = [v17 changedSections];
    uint64_t v40 = [v39 count];

    if (!v40 && ([v17 hasMoves] & 1) == 0)
    {
      v41 = [v17 deletedItemsIndexPaths];
      uint64_t v42 = [v41 count];

      if (!v42)
      {
        v43 = [v17 changedItemsIndexPaths];
        uint64_t v44 = [v43 count];

        if (!v44)
        {
          v45 = [v17 insertedItemsIndexPaths];
          uint64_t v46 = [v45 count];

          if (v46 == 1)
          {
            id v58 = v9;
            v47 = v10;
            v48 = [v17 insertedItemsIndexPaths];
            v49 = [v48 firstObject];

            v50 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v49, "item"), objc_msgSend(v49, "section") - -[PUAlbumListViewController albumsSections](self, "albumsSections"));
            v60 = [v26 collectionAtIndexPath:v50];
            v59 = [v60 localIdentifier];
            v51 = [(PUAlbumListViewController *)self _justCreatedCollectionIdentifier];
            int v52 = [v59 isEqualToString:v51];

            id v53 = v52 ? v49 : 0;
            id v10 = v47;
            id v9 = v58;
            if (v53)
            {
              v55 = [(PUAlbumListViewController *)self _justCreatedCollectionAnimationCompletionHandler];
              v64[0] = MEMORY[0x1E4F143A8];
              v64[1] = 3221225472;
              v64[2] = __58__PUAlbumListViewController_observable_didChange_context___block_invoke_2;
              v64[3] = &unk_1E5F2EBC8;
              id v65 = v17;
              v66 = self;
              id v56 = v55;
              id v67 = v56;
              [(PUAlbumListViewController *)self _visiblyInsertItemAtIndexPath:v53 modelUpdate:v27 completionHandler:v64];
              [(PUAlbumListViewController *)self _setJustCreatedCollectionAnimationCompletionHandler:0];
              [(PUAlbumListViewController *)self _updatePeripheralInterfaceAnimated:1];
              [(PUAlbumListViewController *)self setViewInSyncWithModel:1];
              [(PUAlbumListViewController *)self _updatePreheatedAssets];

              id v10 = v47;
              id v9 = v58;
              goto LABEL_32;
            }
          }
        }
      }
    }
  }
LABEL_30:
  if (![(PUAlbumListViewController *)self _updateInterfaceForIncrementalModelChangeHandler:v27 withSectionedChangeDetails:v17 animated:1])
  {
LABEL_31:
    v27[2](v27);
    [(PUAlbumListViewController *)self _updateInterfaceForModelReloadAnimated:1];
  }
LABEL_32:
  if (!*((unsigned char *)v72 + 24)) {
    v27[2](v27);
  }
  [(PUAlbumListViewController *)self _setJustCreatedCollectionIdentifier:0];
  v34 = [(PUAlbumListViewController *)self _justCreatedCollectionAnimationCompletionHandler];

  if (v34)
  {
    v35 = [(PUAlbumListViewController *)self _justCreatedCollectionAnimationCompletionHandler];
    v35[2]();

    [(PUAlbumListViewController *)self _setJustCreatedCollectionAnimationCompletionHandler:0];
  }
  if (v63)
  {
    v36 = [(PUAlbumListViewController *)self pushedController];
    objc_msgSend(v36, "pl_visitControllerHierarchyWithBlock:", &__block_literal_global_625);

    v37 = [(PUAlbumListViewController *)self navigationController];
    id v38 = (id)[v37 popToViewController:self animated:0];
  }
  _Block_object_dispose(&v71, 8);

LABEL_39:
}

void __58__PUAlbumListViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1272), *(id *)(a1 + 40));
  }
}

uint64_t __58__PUAlbumListViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "contentItemsChangedIndexPaths", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) updateListCellForItemAtIndexPath:*(void *)(*((void *)&v8 + 1) + 8 * v6++) animated:1];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __58__PUAlbumListViewController_observable_didChange_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F07DFE40]) {
    uint64_t v3 = [v2 prepareForDismissingForced:1];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (id)sectionedDataSourceManagerInterestingObjectReferences:(id)a3
{
  return 0;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (void)albumListTableViewCell:(id)a3 willChangeState:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((a4 & 2) != 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(PUAlbumListViewController *)self _mainTableView];
    uint64_t v5 = [v4 visibleCells];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) viewWithTag:236897];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 cancelPerformRetitleAction];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = PULocalizedString(@"ALBUM_LIST_TABLE_ROW_DELETE_CONFIRMATION");
  uint64_t v7 = [(PUAlbumListViewController *)self collectionAtIndexPath:v5];

  if (objc_msgSend(v7, "px_isSharedAlbum") && (objc_msgSend(v7, "px_isOwnedSharedAlbum") & 1) == 0)
  {
    uint64_t v8 = PULocalizedString(@"ALBUM_LIST_TABLE_ROW_UNSUBSCRIBE_CONFIRMATION");

    uint64_t v6 = (void *)v8;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1) {
    [(PUAlbumListViewController *)self _handleDeleteAlbumAtIndexPath:a5];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = [(PUAlbumListViewController *)self collectionAtIndexPath:a4];
  uint64_t v6 = [(PUAlbumListViewController *)self dataSourceManager];
  int64_t v7 = [v6 canDeleteCollection:v5];

  return v7;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 != v10 && ([v9 isEqual:v10] & 1) == 0)
  {
    long long v11 = [(PUAlbumListViewController *)self dataSourceManager];
    long long v12 = [v11 collectionList];
    long long v13 = [v11 collectionsFetchResult];
    unint64_t v14 = [(PUAlbumListViewController *)self _unfilteredIndexForFilteredIndexPath:v9];
    unint64_t v15 = [(PUAlbumListViewController *)self _unfilteredIndexForFilteredIndexPath:v10];
    [(PUAlbumListViewController *)self _setIgnoredReorderNotificationCount:[(PUAlbumListViewController *)self _ignoredReorderNotificationCount] + 1];
    uint64_t v16 = [v12 photoLibrary];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__PUAlbumListViewController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke;
    v19[3] = &unk_1E5F2E580;
    id v20 = v12;
    id v21 = v13;
    unint64_t v22 = v14;
    unint64_t v23 = v15;
    id v17 = v13;
    id v18 = v12;
    [v16 performChanges:v19 completionHandler:0];
  }
}

void __70__PUAlbumListViewController_tableView_moveRowAtIndexPath_toIndexPath___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F39010] changeRequestForCollectionList:*(void *)(a1 + 32) childCollections:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 40) objectAtIndex:*(void *)(a1 + 48)];
  uint64_t v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:*(void *)(a1 + 48)];
  [v2 removeChildCollectionsAtIndexes:v4];

  v7[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  uint64_t v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:*(void *)(a1 + 56)];
  [v2 insertChildCollections:v5 atIndexes:v6];
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  return [(PUAlbumListViewController *)self _targetIndexPathForMoveFromIndexPath:a4 toProposedIndexPath:a5];
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(PUAlbumListViewController *)self isEditing])
  {
    uint64_t v6 = [(PUAlbumListViewController *)self collectionAtIndexPath:v5];
    if (v6)
    {
      int64_t v7 = [(PUAlbumListViewController *)self retitlingCollection];
      if (v7)
      {
        char v8 = 0;
      }
      else
      {
        id v9 = [(PUAlbumListViewController *)self dataSourceManager];
        char v8 = [v9 canReorderCollection:v6];
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(PUAlbumListViewController *)self didSelectItemAtIndexPath:v6];
  if ([(PUAlbumListViewController *)self isPlaceholderAtIndexPath:v6]) {
    [v7 deselectRowAtIndexPath:v6 animated:1];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(PUAlbumListViewController *)self isPlaceholderAtIndexPath:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(PUAlbumListViewController *)self collectionAtIndexPath:v5];
    BOOL v6 = [(PUAlbumListViewController *)self shouldEnableCollection:v7];
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(PUAlbumListViewController *)self topPlaceholdersSection] == a4
    && [(PUAlbumListViewController *)self showsSeparatorBelowTopPlaceholdersSection])
  {
    id v7 = [PUAlbumListSeparatorView alloc];
    char v8 = -[PUAlbumListSeparatorView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v9 = [v6 separatorColor];
    [(PUAlbumListSeparatorView *)v8 setLineColor:v9];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  int64_t v6 = [(PUAlbumListViewController *)self topPlaceholdersSection];
  double result = 0.0;
  if (v6 == a4)
  {
    BOOL v8 = [(PUAlbumListViewController *)self showsSeparatorBelowTopPlaceholdersSection];
    double result = 0.0;
    if (v8) {
      return 4.0;
    }
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 delegate];
  [v7 tableView:v6 heightForHeaderInSection:a4];
  double v9 = v8;

  if (v9 <= 0.0)
  {
    unint64_t v14 = 0;
  }
  else
  {
    int64_t v10 = a4 - [(PUAlbumListViewController *)self albumsSections];
    long long v11 = [(PUAlbumListViewController *)self dataSource];
    long long v12 = [v11 collectionListForSection:v10];

    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v13 = [v12 localizedTitle];
    }
    else
    {
      long long v13 = 0;
    }
    if ([v13 length])
    {
      sectionHeaderView = self->_sectionHeaderView;
      if (!sectionHeaderView)
      {
        uint64_t v16 = [PUAlbumListSectionHeaderView alloc];
        [v6 frame];
        double v18 = v17;
        id v19 = [(PUAlbumListViewController *)self spec];
        [v19 sectionHeaderHeight];
        id v21 = -[PUAlbumListSectionHeaderView initWithFrame:](v16, "initWithFrame:", 0.0, 0.0, v18, v20);
        unint64_t v22 = self->_sectionHeaderView;
        self->_sectionHeaderView = v21;

        sectionHeaderView = self->_sectionHeaderView;
      }
      unint64_t v23 = PULocalizedString(v13);
      [(PUAlbumListSectionHeaderView *)sectionHeaderView setSectionHeaderTitle:v23];

      v24 = self->_sectionHeaderView;
      v25 = [(PUAlbumListViewController *)self _fontManager];
      id v26 = [v25 albumListSectionTitleLabelFont];
      [(PUAlbumListSectionHeaderView *)v24 setSectionHeaderTitleFont:v26];

      v27 = [(PUAlbumListViewController *)self spec];
      [(PUAlbumListViewController *)self _layoutReferenceSize];
      double v29 = v28;
      double v31 = v30;
      [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
      objc_msgSend(v27, "sectionInsetsForLayoutReferenceSize:safeAreaInsets:", v29, v31, v32, v33, v34, v35);
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;

      -[PUAlbumListSectionHeaderView setSectionHeaderInsets:](self->_sectionHeaderView, "setSectionHeaderInsets:", v37, v39, v41, v43);
      unint64_t v14 = self->_sectionHeaderView;
    }
    else
    {
      unint64_t v14 = 0;
    }
  }
  return v14;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  unint64_t v6 = [(PUAlbumListViewController *)self albumsSections];
  double v8 = 0.0;
  if (a4 >= v6 && a4 - v6 < v7)
  {
    if ([(PUAlbumListViewController *)self isRootFolder])
    {
      double v9 = [(PUAlbumListViewController *)self spec];
      int v10 = [v9 shouldShowSectionHeaders];

      if (v10)
      {
        int64_t v11 = a4 - [(PUAlbumListViewController *)self albumsSections];
        long long v12 = [(PUAlbumListViewController *)self dataSource];
        long long v13 = [v12 collectionListForSection:v11];

        if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          unint64_t v14 = [v13 localizedTitle];
        }
        else
        {
          unint64_t v14 = 0;
        }
        if ([v14 length])
        {
          unint64_t v15 = [(PUAlbumListViewController *)self spec];
          [v15 sectionHeaderHeight];
          double v8 = v16;
        }
      }
    }
  }
  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3, a4);
  unint64_t v6 = [v5 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v6)
    && ([(PUAlbumListViewController *)self spec],
        unint64_t v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 cellContentViewLayout],
        v7,
        !v8))
  {
    double v12 = *MEMORY[0x1E4FB2F28];
  }
  else
  {
    double v9 = [(PUAlbumListViewController *)self spec];
    int v10 = [(PUAlbumListViewController *)self view];
    [v10 bounds];
    objc_msgSend(v9, "cellSizeForBounds:");
    double v12 = v11;
  }
  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PUAlbumListViewController *)self isPlaceholderAtIndexPath:v6];
  double v9 = @"albumCell";
  if (v8) {
    double v9 = @"placeholderCell";
  }
  int v10 = v9;
  double v11 = [v7 dequeueReusableCellWithIdentifier:v10];

  if (!v11)
  {
    double v12 = [[PUAlbumListTableViewCell alloc] initWithStyle:0 reuseIdentifier:v10];
    double v11 = v12;
    if (!v8) {
      [(PUAlbumListTableViewCell *)v12 setStateChangeDelegate:self];
    }
  }
  long long v13 = [v11 viewWithTag:236897];
  if (!v13)
  {
    unint64_t v14 = [PUAlbumListCellContentView alloc];
    unint64_t v15 = [v11 contentView];
    [v15 bounds];
    long long v13 = -[PUAlbumListCellContentView initWithFrame:](v14, "initWithFrame:");

    [(PUAlbumListCellContentView *)v13 setTag:236897];
    [(PUAlbumListCellContentView *)v13 setAutoresizingMask:18];
    [(PUAlbumListCellContentView *)v13 setCombinesPhotoDecorations:1];
    double v16 = [v11 contentView];
    [v16 addSubview:v13];

    if (!v8) {
      [(PUAlbumListCellContentView *)v13 setDelegate:self];
    }
  }
  [(PUAlbumListCellContentView *)v13 prepareForReuse];
  double v17 = [(PUAlbumListViewController *)self sessionInfo];
  int v18 = [v17 isSelectingTargetAlbum];

  if (v8)
  {
    int64_t v19 = [(PUAlbumListViewController *)self placeholderKindAtIndexPath:v6];
    if (v19 == 6) {
      int v20 = v18 ^ 1;
    }
    else {
      int v20 = 0;
    }
    if ((unint64_t)(v19 - 2) >= 4) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = v18 ^ 1;
    }
    [(PUAlbumListViewController *)self updatePlaceholderListCellContentView:v13 forItemAtIndexPath:v6 animated:0];
  }
  else
  {
    [(PUAlbumListViewController *)self updateAlbumListCellContentView:v13 forItemAtIndexPath:v6 animated:0];
    if (v18)
    {
      unint64_t v22 = [(PUAlbumListViewController *)self collectionAtIndexPath:v6];
      unsigned int v21 = objc_msgSend(v22, "px_isFolder");
    }
    else
    {
      unsigned int v21 = 1;
    }
  }
  unint64_t v23 = [(PUAlbumListViewController *)self sessionInfo];
  if ([v23 hasClearBackgroundColor]) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  v24 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  [v11 setBackgroundColor:v24];

  [v11 setAccessoryType:v21];
  [v11 setSelectionStyle:2];

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(PUAlbumListViewController *)self numberOfItemsInSection:a4];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = PXMap();
  id v6 = PLUIGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    double v9 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_INFO, "Picker in collection view finished with selected identifiers: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(PUAlbumListViewController *)self finishedPickingBlock];
  ((void (**)(void, void *))v7)[2](v7, v5);

  [(PUAlbumListViewController *)self setFinishedPickingBlock:0];
  [(PUAlbumListViewController *)self _dismissPhotosPickerControllerAnimated:1];
}

uint64_t __53__PUAlbumListViewController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(PUAlbumListViewController *)self collection];
    int v7 = 138412290;
    int v8 = v5;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_INFO, "Picker in collection view manually dismissed with no picked assets for collection: %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(PUAlbumListViewController *)self finishedPickingBlock];
  v6[2](v6, MEMORY[0x1E4F1CBF0]);

  [(PUAlbumListViewController *)self setFinishedPickingBlock:0];
  [(PUAlbumListViewController *)self setPickerViewController:0];
}

- (double)sectionedGridLayout:(id)a3 sectionHeaderHeightForVisualSection:(int64_t)a4
{
  id v6 = [(PUAlbumListViewController *)self dataSource];
  int v7 = [v6 collectionListForSection:a4];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v8 = [v7 localizedTitle];
  }
  else
  {
    int v8 = 0;
  }
  if ([v8 length])
  {
    uint64_t v9 = [(PUAlbumListViewController *)self spec];
    [v9 sectionHeaderHeight];
    double v11 = v10;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (id)bestReferenceItemIndexPath
{
  uint64_t v3 = [(PUAlbumListViewController *)self _mainCollectionView];
  uint64_t v4 = [(PUAlbumListViewController *)self _mainCollectionViewLayout];
  uint64_t v5 = [v4 collectionView];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v3 window];

    if (v7)
    {
      [v3 contentOffset];
      double v9 = v8;
      double v11 = v10;
      [v3 bounds];
      double v13 = v12;
      double v15 = v14;
      uint64_t v16 = [v3 numberOfSections];
      if (v16 < 1)
      {
LABEL_7:
        id v18 = 0;
        goto LABEL_8;
      }
      uint64_t v17 = 0;
      while ([v3 numberOfItemsInSection:v17] <= 0)
      {
        if (v16 == ++v17) {
          goto LABEL_7;
        }
      }
      id v18 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v17];
      if (!v18) {
        goto LABEL_8;
      }
      v25 = [v4 layoutAttributesForItemAtIndexPath:v18];
      id v26 = v25;
      if (v25
        && ([v25 frame],
            v32.origin.double x = v9,
            v32.origin.double y = v11,
            v32.size.double width = v13,
            v32.size.double height = v15,
            CGRectIntersectsRect(v30, v32)))
      {
        id v18 = v18;

        unint64_t v22 = v18;
      }
      else
      {

LABEL_8:
        while (v16-- >= 1)
        {
          uint64_t v20 = [v3 numberOfItemsInSection:v16];
          if (v20 >= 1)
          {
            uint64_t v21 = [MEMORY[0x1E4F28D58] indexPathForItem:v20 - 1 inSection:v16];
            if (v21)
            {
              unint64_t v22 = (void *)v21;
              unint64_t v23 = [v4 layoutAttributesForItemAtIndexPath:v21];
              v24 = v23;
              if (v23)
              {
                [v23 frame];
                v31.origin.double x = v9;
                v31.origin.double y = v11;
                v31.size.double width = v13;
                v31.size.double height = v15;
                if (CGRectIntersectsRect(v29, v31))
                {

                  goto LABEL_23;
                }
              }
            }
            break;
          }
        }
        if ([v4 conformsToProtocol:&unk_1F083ED00])
        {
          unint64_t v22 = objc_msgSend(v4, "itemIndexPathAtCenterOfRect:", v9, v11, v13, v15);
        }
        else
        {
          unint64_t v22 = 0;
        }
      }
LABEL_23:
      id v7 = v22;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)sectionedGridLayout:(id)a3 sectionsForVisualSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(PUAlbumListViewController *)self albumsSections];
  uint64_t v9 = v7;
  unint64_t v10 = v8;
  if (a4)
  {
    if ([(PUAlbumListViewController *)self numberOfVisualSectionsForSectionedGridLayout:v6]- 1 != a4)
    {
      uint64_t v17 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
      goto LABEL_10;
    }
    uint64_t v11 = v10 + v9 - 1;
    double v12 = (void *)MEMORY[0x1E4F28D60];
    int64_t v13 = [(PUAlbumListViewController *)self numberOfSections] - v11;
    double v14 = v12;
    uint64_t v15 = v11;
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28D60];
    if (v8 > 1) {
      int64_t v13 = v7 + 1;
    }
    else {
      int64_t v13 = [(PUAlbumListViewController *)self numberOfSections];
    }
    double v14 = v16;
    uint64_t v15 = 0;
  }
  uint64_t v17 = objc_msgSend(v14, "indexSetWithIndexesInRange:", v15, v13);
LABEL_10:
  id v18 = (void *)v17;

  return v18;
}

- (int64_t)numberOfVisualSectionsForSectionedGridLayout:(id)a3
{
  uint64_t v3 = [(PUAlbumListViewController *)self dataSource];
  int64_t v4 = [v3 numberOfSections];

  if (v4 <= 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int64_t v13 = (void (**)(void))a6;
  if (v11 == v12 || [v11 isEqual:v12])
  {
    if (v13) {
      v13[2](v13);
    }
  }
  else
  {
    double v14 = [(PUAlbumListViewController *)self dataSourceManager];
    uint64_t v15 = [v14 collectionList];
    uint64_t v16 = [v14 collectionsFetchResult];
    unint64_t v17 = [(PUAlbumListViewController *)self _unfilteredIndexForFilteredIndexPath:v11];
    unint64_t v18 = [(PUAlbumListViewController *)self _unfilteredIndexForFilteredIndexPath:v12];
    uint64_t v21 = [v15 photoLibrary];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke;
    v25[3] = &unk_1E5F2E580;
    id v26 = v15;
    id v27 = v16;
    unint64_t v28 = v17;
    unint64_t v29 = v18;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke_2;
    v22[3] = &unk_1E5F26E28;
    v22[4] = self;
    id v23 = v26;
    v24 = v13;
    id v19 = v26;
    id v20 = v16;
    [v21 performChanges:v25 completionHandler:v22];
  }
}

void __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F39010] changeRequestForCollectionList:*(void *)(a1 + 32) childCollections:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 40) objectAtIndex:*(void *)(a1 + 48)];
  int64_t v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:*(void *)(a1 + 48)];
  [v2 removeChildCollectionsAtIndexes:v4];

  v7[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v6 = [MEMORY[0x1E4F28D60] indexSetWithIndex:*(void *)(a1 + 56)];
  [v2 insertChildCollections:v5 atIndexes:v6];
}

void __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke_3;
  block[3] = &unk_1E5F2EBC8;
  id v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __94__PUAlbumListViewController_collectionView_moveItemAtIndexPath_toIndexPath_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataSourceManagerConfiguration];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) dataSourceManagerConfiguration];
    id v6 = (id)[v3 newConfigurationWithCollectionList:*(void *)(a1 + 40)];

    uint64_t v4 = (uint64_t)v6;
  }
  else
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F90480]) initWithCollectionList:*(void *)(a1 + 40)];
  }
  id v7 = (id)v4;
  [*(id *)(a1 + 32) setDataSourceManagerConfiguration:v4];
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  return [(PUAlbumListViewController *)self _targetIndexPathForMoveFromIndexPath:a4 toProposedIndexPath:a5];
}

- (BOOL)collectionView:(id)a3 canReorderItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(PUAlbumListViewController *)self isEditing])
  {
    id v6 = [(PUAlbumListViewController *)self collectionAtIndexPath:v5];
    if (v6)
    {
      id v7 = [(PUAlbumListViewController *)self retitlingCollection];
      if (v7)
      {
        char v8 = 0;
      }
      else
      {
        uint64_t v9 = [(PUAlbumListViewController *)self dataSourceManager];
        char v8 = [v9 canReorderCollection:v6];
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return 1;
}

- (BOOL)actionPerformer:(id)a3 transitionToViewController:(id)a4 transitionType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  switch(a5)
  {
    case 1:
      id v12 = [(PUAlbumListViewController *)self navigationController];
      objc_msgSend(v12, "px_pushViewController:animated:completion:", v10, 1, 0);
LABEL_7:

      BOOL v11 = 1;
      goto LABEL_8;
    case 2:
      id v12 = [(PUAlbumListViewController *)self navigationController];
      [v12 presentViewController:v10 animated:1 completion:0];
      goto LABEL_7;
    case 0:
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:3382 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  BOOL v11 = 0;
LABEL_8:

  return v11;
}

- (void)assetCollectionActionPerformer:(id)a3 playMovieForAssetCollection:(id)a4
{
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (void *)MEMORY[0x1E4F90368];
    id v6 = v8;
    id v7 = [v5 moviePresenterWithPresentingViewController:self];
    [v7 presentMovieViewControllerForAssetCollection:v6 keyAssetFetchResult:0 preferredTransitionType:1];
  }
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  return (id)[MEMORY[0x1E4F908D0] defaultPresenterWithViewController:self];
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  id v9 = [a4 identifier];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      BOOL v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int64_t v13 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
      [v10 handleFailureInMethod:a2, self, @"PUAlbumListViewController.m", 3332, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"configuration.identifier", v12, v13 object file lineNumber description];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __102__PUAlbumListViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v14[3] = &unk_1E5F2ECC8;
    v14[4] = self;
    id v15 = v9;
    [v8 addCompletion:v14];
  }
}

uint64_t __102__PUAlbumListViewController_collectionView_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) navigateToCollection:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [(PUAlbumListViewController *)self contextMenuInteractionEndBlock];

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PUAlbumListViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke;
    aBlock[3] = &unk_1E5F2ED10;
    aBlock[4] = self;
    id v8 = _Block_copy(aBlock);
    if (v8)
    {
      id v9 = v8;
      if (v6) {
        [v6 addCompletion:v8];
      }
      else {
        (*((void (**)(void *))v8 + 2))(v8);
      }
    }
  }
}

uint64_t __100__PUAlbumListViewController_collectionView_willEndContextMenuInteractionWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contextMenuInteractionEndBlock];
  v2[2]();

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setContextMenuInteractionEndBlock:0];
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PUAlbumListViewController *)self collectionAtIndexPath:v8];
  id v10 = [(PUAlbumListViewController *)self sessionInfo];
  char v11 = [v10 isForAssetPicker];

  id v12 = [(PUAlbumListViewController *)self sessionInfo];
  char v13 = [v12 isForAlbumPicker];

  double v14 = [(PUAlbumListViewController *)self sessionInfo];
  char v15 = [v14 isLimitedLibraryPicker];

  uint64_t v16 = 0;
  if ((v11 & 1) == 0 && (v15 & 1) == 0 && (v13 & 1) == 0)
  {
    if ([(PUAlbumListViewController *)self isEditing])
    {
      uint64_t v16 = 0;
    }
    else
    {
      unint64_t v17 = (void *)MEMORY[0x1E4FB1678];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke;
      v19[3] = &unk_1E5F23418;
      id v20 = v7;
      id v21 = v8;
      unint64_t v22 = self;
      id v23 = v9;
      uint64_t v16 = [v17 configurationWithIdentifier:v23 previewProvider:0 actionProvider:v19];
    }
  }

  return v16;
}

id __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) cellForItemAtIndexPath:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 48));
  if ([*(id *)(a1 + 56) canPerformEditOperation:7])
  {
    id v5 = [MEMORY[0x1E4F90608] actionNameForCollection:*(void *)(a1 + 56)];
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pencil"];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2;
    v27[3] = &unk_1E5F2D440;
    objc_copyWeak(&v29, &location);
    id v28 = v4;
    id v8 = [v6 actionWithTitle:v5 image:v7 identifier:0 handler:v27];

    objc_destroyWeak(&v29);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = *(id *)(a1 + 56);
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = 0;
    id v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  id v10 = v9;

  if (v10)
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F90438]) initWithAssetCollection:v10 displayTitleInfo:0];
    [v9 setPerformerDelegate:*(void *)(a1 + 48)];
    [*(id *)(a1 + 48) setAssetCollectionActionManager:v9];
    if (v8)
    {
      uint64_t v31 = *MEMORY[0x1E4F90E10];
      v32[0] = v8;
      char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    }
    else
    {
      char v11 = (void *)MEMORY[0x1E4F1CC08];
    }
    id v12 = [MEMORY[0x1E4F8FF70] contextMenuWithActionManager:v9 overrideActions:v11];

    goto LABEL_13;
  }
  id v12 = 0;
LABEL_14:
  id v13 = *(id *)(a1 + 56);
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v14 = v13;

    if (!v14) {
      goto LABEL_25;
    }
    char v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
    id v13 = v15;
    if (v8) {
      [v15 addObject:v8];
    }
    if ([v14 canPerformEditOperation:6])
    {
      unint64_t v22 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v16 = PXLocalizedString();
      unint64_t v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4;
      v23[3] = &unk_1E5F2D468;
      id v21 = &v26;
      objc_copyWeak(&v26, &location);
      id v24 = *(id *)(a1 + 56);
      id v25 = v4;
      unint64_t v18 = [v22 actionWithTitle:v16 image:v17 identifier:0 handler:v23];

      [v18 setAttributes:2];
      [v13 addObject:v18];

      objc_destroyWeak(&v26);
    }
    if (objc_msgSend(v13, "count", v21))
    {
      uint64_t v19 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v13];

      id v12 = (void *)v19;
    }
  }
  else
  {
    id v14 = 0;
  }

LABEL_25:
  objc_destroyWeak(&location);

  return v12;
}

void __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  id v3[2] = __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3;
  v3[3] = &unk_1E5F2ED10;
  id v4 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setContextMenuInteractionEndBlock:v3];
}

void __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleDeleteCollection:*(void *)(a1 + 32) sourceView:*(void *)(a1 + 40)];
}

void __93__PUAlbumListViewController_collectionView_contextMenuConfigurationForItemAtIndexPath_point___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) albumListCellContentView];
  [v1 startPerformRetitleAction];
}

- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  id v38 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"PUGridGlobalFooter"])
  {
    [(PUAlbumListViewController *)self setSyncProgressView:v38];
    [(PUAlbumListViewController *)self updateSyncProgress];
  }
  else if ([v9 isEqualToString:@"PUAlbumListViewControllerElementKindSectionHeader"])
  {
    char v11 = [(PUAlbumListViewController *)self _mainCollectionViewLayout];
    uint64_t v12 = [v11 visualSectionForSupplementaryViewIndexPath:v10];
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, self, @"PUAlbumListViewController.m", 3240, @"%@ can't configure header view at %@ as it is not bound to a visual section", self, v10 object file lineNumber description];
    }
    id v13 = [(PUAlbumListViewController *)self dataSource];
    id v14 = [v13 collectionListForSection:v12];

    char v15 = [v14 localizedTitle];
    uint64_t v16 = PULocalizedString(v15);

    id v17 = v38;
    [v17 setSectionHeaderTitle:v16];
    unint64_t v18 = [(PUAlbumListViewController *)self _fontManager];
    uint64_t v19 = [v18 albumListSectionTitleLabelFont];
    [v17 setSectionHeaderTitleFont:v19];

    id v20 = [(PUAlbumListViewController *)self spec];
    [(PUAlbumListViewController *)self _layoutReferenceSize];
    double v22 = v21;
    double v24 = v23;
    [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
    objc_msgSend(v20, "sectionInsetsForLayoutReferenceSize:safeAreaInsets:", v22, v24, v25, v26, v27, v28);
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;

    objc_msgSend(v17, "setSectionHeaderInsets:", v30, v32, v34, v36);
  }
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return [(PUAlbumListViewController *)self isEditing] ^ 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(PUAlbumListViewController *)self isPlaceholderAtIndexPath:v5])
  {
    int64_t v6 = [(PUAlbumListViewController *)self placeholderKindAtIndexPath:v5];

    return [(PUAlbumListViewController *)self _isPlaceholderEnabled:v6];
  }
  else
  {
    id v8 = [(PUAlbumListViewController *)self collectionAtIndexPath:v5];

    if ([(PUAlbumListViewController *)self shouldEnableCollection:v8]) {
      int v9 = [(PUAlbumListViewController *)self isEditing] ^ 1;
    }
    else {
      LOBYTE(v9) = 0;
    }

    return v9;
  }
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v9 forIndexPath:v8];
  [(PUAlbumListViewController *)self configureSupplementaryView:v10 ofKind:v9 forIndexPath:v8];

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PUAlbumListViewController *)self isPlaceholderAtIndexPath:v7])
  {
    id v8 = [v6 dequeueReusableCellWithReuseIdentifier:@"placeholderCell" forIndexPath:v7];
    id v9 = [v8 albumListCellContentView];
    [v9 prepareForReuse];
    [(PUAlbumListViewController *)self updatePlaceholderListCellContentView:v9 forItemAtIndexPath:v7 animated:0];
  }
  else
  {
    id v9 = [(PUAlbumListViewController *)self collectionAtIndexPath:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = @"albumCell";
    }
    else {
      id v10 = @"folderCell";
    }
    id v8 = [v6 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v7];
    char v11 = [(PUAlbumListViewController *)self spec];
    [v11 cellBackgroundCornerRadius];
    objc_msgSend(v8, "setBackgroundCornerRadius:");

    uint64_t v12 = [v8 albumListCellContentView];
    [v12 setDelegate:self];
    [v12 prepareForReuse];
    [(PUAlbumListViewController *)self updateAlbumListCellContentView:v12 forItemAtIndexPath:v7 animated:0];
  }
  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(PUAlbumListViewController *)self numberOfItemsInSection:a4];
}

- (BOOL)isEmpty
{
  uint64_t v3 = [(PUAlbumListViewController *)self dataSource];
  if (v3
    && (id v4 = (void *)v3,
        [(PUAlbumListViewController *)self dataSource],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 containsAnyItems],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    id v8 = [(PUAlbumListViewController *)self sessionInfo];
    int v7 = [v8 isSelectingTargetAlbum] ^ 1;
  }
  return v7;
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUAlbumListViewController *)self navigationController];
  char v6 = [v5 viewControllers];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
    id v8 = [(PUAlbumListViewController *)self mainScrollView];
    BOOL v9 = 1;
    objc_msgSend(v8, "px_scrollToEdge:animated:", 1, v3);
  }
  else
  {
    id v10 = [(PUAlbumListViewController *)self collectionView];
    char v11 = objc_msgSend(v10, "px_isScrolledAtEdge:", 1);

    uint64_t v12 = [(PUAlbumListViewController *)self mainScrollView];
    objc_msgSend(v12, "px_scrollToEdge:animated:", 1, v3);

    return v11 ^ 1;
  }
  return v9;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  return 1;
}

- (BOOL)cloudFeedInvitationForAlbumIsAvailableForNavigation:(id)a3
{
  return 1;
}

- (BOOL)cloudFeedCommentIsAvailableForNavigation:(id)a3
{
  return 1;
}

- (BOOL)cloudFeedAssetIsAvailableForNavigation:(id)a3
{
  return 1;
}

- (void)_scrollToCollection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ([(PUAlbumListViewController *)self isViewInSyncWithModel])
  {
    uint64_t v6 = [(PUAlbumListViewController *)self indexPathForCollection:v8];
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      [(PUAlbumListViewController *)self scrollToItemAtIndexPath:v6 centered:1 animated:v4];
    }
  }
}

- (void)_performOrScheduleScrollToCollection:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(PUAlbumListViewController *)self isViewLoaded])
  {
    [(PUAlbumListViewController *)self _scrollToCollection:v6 animated:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __75__PUAlbumListViewController__performOrScheduleScrollToCollection_animated___block_invoke;
    v7[3] = &unk_1E5F2A840;
    objc_copyWeak(&v9, &location);
    id v8 = v6;
    BOOL v10 = v4;
    [(PUAlbumListViewController *)self _setOnViewDidLayoutSubviewsBlock:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __75__PUAlbumListViewController__performOrScheduleScrollToCollection_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _scrollToCollection:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)navigateToRevealAssetCollection:(id)a3 initiallyHidden:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)showPlacesCount:(int64_t)a3 atIndexPath:(id)a4
{
  id v9 = [(PUAlbumListViewController *)self _preparedPlaceholderListCellContentViewAtIndexPath:a4];
  if (a3)
  {
    id v5 = PLSharedCountFormatter();
    id v6 = [NSNumber numberWithInteger:a3];
    uint64_t v7 = [v5 stringFromNumber:v6];
  }
  else
  {
    uint64_t v7 = @" ";
    id v8 = @" ";
  }
  [v9 setSubtitle:v7 animated:1];
}

- (void)showPlacesCount:(int64_t)a3
{
  id v5 = [(PUAlbumListViewController *)self indexPathForPlacesAlbum];
  [(PUAlbumListViewController *)self showPlacesCount:a3 atIndexPath:v5];
}

- (void)showPlacesPlaceholderImageInStackView:(id)a3 andContentView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUAlbumListViewController *)self spec];
  id v9 = [v6 window];
  id v10 = [v8 emptyAlbumPlaceholderImageForWindow:v9];

  [(PUAlbumListViewController *)self _updateStackView:v7 forAssets:0 collection:0 withCustomEmptyPlaceholderImage:v10];
  [v6 setCustomImageView:0];
}

- (void)_navigateToPlacesFromCollection:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 assetCollectionSubtype] == 1000000203)
  {
    id v5 = [(PUAlbumListViewController *)self px_gridPresentation];
    id v6 = [v5 createPlacesViewControllerForAssetCollection:v4];

    id v7 = [v6 navigationItem];
    objc_msgSend(v7, "px_setPreferredLargeTitleDisplayMode:", 2);

    id v8 = [(PUAlbumListViewController *)self navigationController];
    objc_msgSend(v8, "pu_pushViewController:withTransition:animated:isInteractive:", v6, 0, 1, 0);

    if (objc_msgSend(MEMORY[0x1E4F22488], "px_allowsDonationsForCurrentProcess"))
    {
      id v9 = (void *)MEMORY[0x1E4F22488];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __61__PUAlbumListViewController__navigateToPlacesFromCollection___block_invoke_2;
      v10[3] = &unk_1E5F233F0;
      id v11 = v4;
      uint64_t v12 = self;
      objc_msgSend(v9, "px_requestActivityWithActivityType:titleProvider:completionBlock:", @"com.apple.mobileslideshow.album", &__block_literal_global_7767, v10);
    }
  }
}

void __61__PUAlbumListViewController__navigateToPlacesFromCollection___block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setEligibleForSearch:1];
  [v3 _setEligibleForPrediction:1];
  [v3 setEligibleForHandoff:0];
  id v6 = @"uuid";
  id v4 = [*(id *)(a1 + 32) uuid];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 addUserInfoEntriesFromDictionary:v5];

  objc_msgSend(v3, "px_setPersistentIdentifierFromAssetCollection:", *(void *)(a1 + 32));
  [*(id *)(a1 + 40) setSiriActionActivity:v3];
  [v3 becomeCurrent];
}

uint64_t __61__PUAlbumListViewController__navigateToPlacesFromCollection___block_invoke()
{
  return px_deferredLocalizedStringWithFormat();
}

- (void)_navigateToMemories
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:3017 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)_navigateToPeopleAnimated:(BOOL)a3 withPersonLocalIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:3013 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)navigateToAllPhotosAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v9 = (void (**)(id, void *))a4;
  id v6 = [(PUAlbumListViewController *)self newGridViewControllerForAllPhotos];
  id v7 = [(PUAlbumListViewController *)self navigationController];
  objc_msgSend(v7, "pu_pushViewController:withTransition:animated:isInteractive:", v6, 0, v4, 0);

  if (v9)
  {
    id v8 = [(PUAlbumListViewController *)self pushedController];
    v9[2](v9, v8);
  }
}

- (id)_viewControllerForCollection:(id)a3 userActivity:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = objc_msgSend(v6, "px_isFolder");
  if (v7)
  {
    id v8 = [(PUAlbumListViewController *)self _createControllerForFolder:v6];
  }
  else
  {
    id v9 = v6;
    if ([v9 isPlacesAlbum])
    {
      [(PUAlbumListViewController *)self _navigateToPlacesFromCollection:v9];
      id v8 = 0;
    }
    else
    {
      id v8 = [(PUAlbumListViewController *)self newGridViewControllerForAssetCollection:v9];
    }
  }
  [(PUAlbumListViewController *)self setPushedController:v8];
  [(PUAlbumListViewController *)self setPushedAlbum:v6];
  if (a4
    && ((v7 | objc_msgSend(MEMORY[0x1E4F22488], "px_allowsDonationsForCurrentProcess") ^ 1) & 1) == 0)
  {
    id v10 = v6;
    uint64_t v11 = [v10 assetCollectionSubtype];
    if (v11 != 205 && v11 != 1000000201)
    {
      uint64_t v12 = [v10 localizedTitle];
      if ([v12 length])
      {
        id v13 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.mobileslideshow.album"];
        id v14 = px_deferredLocalizedStringWithFormat();
        objc_msgSend(v13, "setTitle:", v14, v12);

        [v13 setEligibleForSearch:1];
        [v13 _setEligibleForPrediction:1];
        [v13 setEligibleForHandoff:0];
        uint64_t v19 = @"uuid";
        char v15 = [v10 uuid];
        v20[0] = v15;
        uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
        [v13 addUserInfoEntriesFromDictionary:v16];

        objc_msgSend(v13, "px_setPersistentIdentifierFromAssetCollection:", v10);
        [(PUAlbumListViewController *)self setSiriActionActivity:v13];
        id v17 = v13;
        *a4 = v17;
      }
    }
  }
  return v8;
}

- (void)navigateToCollection:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(id, void *))a5;
  id v13 = 0;
  id v9 = [(PUAlbumListViewController *)self _viewControllerForCollection:a3 userActivity:&v13];
  id v10 = v13;
  uint64_t v11 = [(PUAlbumListViewController *)self navigationController];
  objc_msgSend(v11, "pu_pushViewController:withTransition:animated:isInteractive:", v9, 0, v5, 0);

  if (v8)
  {
    uint64_t v12 = [(PUAlbumListViewController *)self pushedController];
    v8[2](v8, v12);
  }
  [v10 becomeCurrent];
}

- (id)_createControllerForFolder:(id)a3
{
  id v4 = a3;
  id v5 = [(PUAlbumListViewController *)self newGridViewControllerForFolder:v4];
  id v6 = [(PUAlbumListViewController *)self sessionInfo];
  [v5 setSessionInfo:v6];

  [v5 setCanShowAggregateItem:1];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F90480]) initWithCollectionList:v4];

  [v5 setDataSourceManagerConfiguration:v7];
  id v8 = [v5 navigationItem];
  objc_msgSend(v8, "px_setPreferredLargeTitleDisplayMode:", 2);

  return v5;
}

- (BOOL)canNavigateToCollection:(id)a3
{
  id v3 = [(PUAlbumListViewController *)self indexPathForCollection:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)px_navigationDestination
{
  id v2 = [(PUAlbumListViewController *)self _collectionForNavigation];
  if (v2) {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F905E8]) initWithObject:v2 revealMode:0];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (void)provideViewControllersForDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PUAlbumListViewController_navigateToDestination_options_completionHandler___block_invoke;
  v10[3] = &unk_1E5F233C8;
  id v11 = v8;
  id v9 = v8;
  [(PUAlbumListViewController *)self _navigateToDestination:a3 provideViewControllers:0 options:a4 completionHandler:v10];
}

uint64_t __77__PUAlbumListViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_navigateToDestination:(id)a3 provideViewControllers:(BOOL)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  v52[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = (void (**)(id, void *, uint64_t, void))a6;
  id v13 = [(PUAlbumListViewController *)self _collectionForNavigation];
  id v14 = [v11 sidebarBackNavigationRootDestination];
  char v15 = [v14 collection];
  int v16 = [v15 isEqual:v13];

  if (v16)
  {
    id v17 = [(PUAlbumListViewController *)self navigationItem];
    objc_msgSend(v17, "px_setHidesBackButtonInRegularWidth:", 1);
    unint64_t v18 = [(PUAlbumListViewController *)self traitCollection];
    objc_msgSend(v17, "px_updateBackButtonVisibilityForTraitCollection:", v18);
  }
  uint64_t v19 = [v11 collection];
  int v20 = [v19 isEqual:v13];

  if (v20)
  {
    v52[0] = self;
    double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    v12[2](v12, v21, 1, 0);
  }
  else
  {
    double v21 = [v11 collectionHierarchy];
    double v22 = objc_msgSend(v21, "px_objectAfterObject:", v13);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([(PUAlbumListViewController *)self indexPathForCollection:v22],
          double v23 = objc_claimAutoreleasedReturnValue(),
          v23,
          v23))
    {
      BOOL v24 = [v11 type] == 8 && objc_msgSend(v11, "revealMode") == 2;
      if ([(PUAlbumListViewController *)self isEditing]) {
        [(PUAlbumListViewController *)self setEditing:0];
      }
      [(PUAlbumListViewController *)self _performOrScheduleScrollToCollection:v22 animated:0];
      if (v24)
      {
        uint64_t v46 = self;
        id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
        v12[2](v12, v26, 1, 0);
      }
      else if (v8)
      {
        id v43 = 0;
        double v27 = [(PUAlbumListViewController *)self _viewControllerForCollection:v22 userActivity:&v43];
        id v26 = v43;
        if (([v27 routingOptionsForDestination:v11] & 2) != 0)
        {
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke;
          v39[3] = &unk_1E5F23350;
          v39[4] = self;
          double v42 = v12;
          id v40 = v27;
          id v41 = v26;
          [v40 provideViewControllersForDestination:v11 options:a5 completionHandler:v39];
        }
        else if (v27)
        {
          v45[0] = self;
          v45[1] = v27;
          double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
          v12[2](v12, v28, 1, 0);

          [v26 becomeCurrent];
        }
        else
        {
          double v29 = PXAssertGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v49 = self;
            __int16 v50 = 2112;
            id v51 = v11;
            _os_log_error_impl(&dword_1AE9F8000, v29, OS_LOG_TYPE_ERROR, "Albums list %@ failed to navigate to destination %@", buf, 0x16u);
          }

          double v30 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Albums list %@ failed to navigate to destination %@", self, v11);
          uint64_t v44 = self;
          double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
          ((void (**)(id, void *, uint64_t, void *))v12)[2](v12, v31, 2, v30);
        }
      }
      else
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke_411;
        void v32[3] = &unk_1E5F233A0;
        id v33 = v11;
        unint64_t v37 = a5;
        SEL v38 = a2;
        double v36 = v12;
        double v34 = self;
        id v35 = v22;
        [(PUAlbumListViewController *)self navigateToCollection:v35 animated:0 completion:v32];

        id v26 = v33;
      }
    }
    else
    {
      double v25 = PXAssertGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v49 = self;
        __int16 v50 = 2112;
        id v51 = v11;
        _os_log_error_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_ERROR, "Albums list %@ failed to navigate to destination %@", buf, 0x16u);
      }

      v47 = self;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      v12[2](v12, v26, 2, 0);
    }
  }
}

void __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *(void *)(a1 + 32);
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a2;
  id v9 = [v6 arrayWithObjects:&v12 count:1];
  id v10 = objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v8, v12, v13);

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v11 = [v10 lastObject];
  LODWORD(v9) = [v11 isEqual:*(void *)(a1 + 40)];

  if (v9) {
    [*(id *)(a1 + 48) becomeCurrent];
  }
}

void __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke_411(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke_2;
    v9[3] = &unk_1E5F23378;
    uint64_t v5 = *(void *)(a1 + 64);
    id v10 = *(id *)(a1 + 56);
    [a2 navigateToDestination:v4 options:v5 completionHandler:v9];
    id v6 = v10;
  }
  else
  {
    id v7 = PXAssertGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v8;
      _os_log_error_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Album List failed to create a view controller for collection %@", buf, 0xCu);
    }

    id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"Album List failed to create a view controller for collection %@", *(void *)(a1 + 48));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __101__PUAlbumListViewController__navigateToDestination_provideViewControllers_options_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v5 = a3;
  id v6 = [(PUAlbumListViewController *)self _collectionForNavigation];
  id v7 = [v5 collection];
  char v8 = [v7 isEqual:v6];

  if (v8) {
    goto LABEL_6;
  }
  id v9 = [v5 collectionHierarchy];
  uint64_t v10 = objc_msgSend(v9, "px_objectAfterObject:", v6);
  if (!v10)
  {

    unint64_t v12 = 0;
    goto LABEL_8;
  }
  id v11 = (void *)v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    char v15 = (objc_class *)objc_opt_class();
    int v16 = NSStringFromClass(v15);
    id v17 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v14 handleFailureInMethod:a2, self, @"PUAlbumListViewController.m", 2828, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[collectionHierarchy px_objectAfterObject:ownCollection]", v16, v17 object file lineNumber description];
  }
  unint64_t v12 = [(PUAlbumListViewController *)self indexPathForCollection:v11];

  if (v12) {
LABEL_6:
  }
    unint64_t v12 = 3;
LABEL_8:

  return v12;
}

- (id)_collectionForNavigation
{
  id v3 = [(PUAlbumListViewController *)self dataSourceManager];
  uint64_t v4 = [v3 collectionList];

  if (!v4)
  {
    uint64_t v4 = [(PUAlbumListViewController *)self collection];
  }
  return v4;
}

- (void)albumListCellContentView:(id)a3 didEndRetitlingFromTitle:(id)a4 toTitle:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PUAlbumListViewController *)self indexPathForAlbumListCellContentView:v8];
  unint64_t v12 = [(PUAlbumListViewController *)self collectionAtIndexPath:v11];
  if ([v10 length])
  {
    if (([v10 isEqualToString:v9] & 1) == 0)
    {
      if (v12)
      {
        uint64_t v13 = [(PUAlbumListViewController *)self dataSourceManager];
        int v14 = [v13 canRenameCollection:v12];

        if (v14)
        {
          double v22 = (void *)[objc_alloc(MEMORY[0x1E4F90608]) initWithCollection:v12 title:v10];
          char v15 = [(PUAlbumListViewController *)self undoManager];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __87__PUAlbumListViewController_albumListCellContentView_didEndRetitlingFromTitle_toTitle___block_invoke;
          v23[3] = &unk_1E5F2D4B8;
          id v24 = v8;
          id v25 = v10;
          [v22 executeWithUndoManager:v15 completionHandler:v23];

          int v16 = (void *)MEMORY[0x1E4F56658];
          uint64_t v28 = *MEMORY[0x1E4F56548];
          uint64_t v17 = v28;
          v29[0] = v12;
          unint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
          [v16 sendEvent:@"com.apple.photos.CPAnalytics.albumRenamed" withPayload:v18];

          uint64_t v19 = (void *)MEMORY[0x1E4F56658];
          uint64_t v26 = v17;
          double v27 = v12;
          int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          [v19 sendEvent:@"com.apple.photos.CPAnalytics.albumRenamedFromEditableTitle" withPayload:v20];
        }
      }
    }
  }
  double v21 = [(PUAlbumListViewController *)self retitlingCollection];

  if (v12 == v21)
  {
    [(PUAlbumListViewController *)self setKeyboardAware:0];
    [(PUAlbumListViewController *)self setRetitlingCollection:0];
  }
}

uint64_t __87__PUAlbumListViewController_albumListCellContentView_didEndRetitlingFromTitle_toTitle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
}

- (BOOL)albumListCellContentViewShouldBeginRetitling:(id)a3
{
  uint64_t v4 = [(PUAlbumListViewController *)self indexPathForAlbumListCellContentView:a3];
  BOOL v5 = [(PUAlbumListViewController *)self shouldBeginRetitlingAlbumAtIndexPath:v4];
  if (v5)
  {
    id v6 = [(PUAlbumListViewController *)self collectionAtIndexPath:v4];
    [(PUAlbumListViewController *)self setRetitlingCollection:v6];
    [(PUAlbumListViewController *)self setKeyboardAware:1];
  }
  return v5;
}

- (void)albumListCellContentView:(id)a3 performDeleteAction:(id)a4
{
  -[PUAlbumListViewController indexPathForAlbumListCellContentView:](self, "indexPathForAlbumListCellContentView:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PUAlbumListViewController *)self _handleDeleteAlbumAtIndexPath:v5];
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PUAlbumListViewController *)self collection];
  if (v7)
  {
    if (v6)
    {
      id v8 = [v6 objectForKeyedSubscript:@"updatedCollection"];
      if (!v8)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      id v9 = [v10 changeDetailsForObject:v7];
      id v8 = [v9 objectAfterChanges];

      if (!v8) {
        goto LABEL_5;
      }
    }
    [(PUAlbumListViewController *)self setCollection:v8];
    goto LABEL_5;
  }
LABEL_6:
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  id v7 = [(PUAlbumListViewController *)self collection];
  id v8 = [v5 changeDetailsForObject:v7];

  id v9 = [v8 objectAfterChanges];
  [v6 setObject:v9 forKeyedSubscript:@"updatedCollection"];

  return v6;
}

- (void)_updateAlbumSubtitleFormat
{
  id v5 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  id v3 = [v5 syncedAlbumSubtitleStringFormat];
  albumSubtitleFormat = self->_albumSubtitleFormat;
  self->_albumSubtitleFormat = v3;
}

- (void)updateSyncProgress
{
  int v12 = 1;
  id v3 = [(PUAlbumListViewController *)self photoLibrary];
  int v4 = [v3 hasSyncProgressReturningImportOperations:&v12];

  uint64_t v11 = 0;
  uint64_t v10 = 0;
  if (v4 && [(PUAlbumListViewController *)self canShowSyncProgress])
  {
    id v5 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
    [v5 getPhotoCount:&v11 videoCount:&v10];

    [(PUAlbumListViewController *)self setSyncProgressVisible:1];
    id v6 = [(PUAlbumListViewController *)self syncProgressView];
    id v7 = [v6 viewModel];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PUAlbumListViewController_updateSyncProgress__block_invoke;
    v8[3] = &__block_descriptor_52_e36_v16__0___PXMutableFooterViewModel__8l;
    v8[4] = v11;
    v8[5] = v10;
    int v9 = v12;
    [v7 performChanges:v8];
  }
  else
  {
    [(PUAlbumListViewController *)self setSyncProgressVisible:0];
  }
}

void __47__PUAlbumListViewController_updateSyncProgress__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = PLLocalizedCountDescription();
  [v2 setTitle:v3];

  PLProgressDescription();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setSubtitle1:v4];
}

- (void)sessionInfoPhotoSelectionDidChange:(id)a3
{
  [(PUAlbumListViewController *)self updateNavigationBarAnimated:0];
  [(PUAlbumListViewController *)self _updateNavigationBannerAnimated:0];
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  id v7 = a3;
  id v4 = [(PUAlbumListViewController *)self retitlingCollection];
  if (v4)
  {
    id v5 = [(PUAlbumListViewController *)self mainScrollView];
    id v6 = [v7 userInfo];
    [(PUAlbumListViewController *)self px_safeAreaInsets];
    objc_msgSend(v5, "px_adjustInsetsForKeyboardInfo:safeAreaInsets:", v6);
  }
}

- (void)setKeyboardAware:(BOOL)a3
{
  if (self->__isKeyboardAware != a3)
  {
    self->__isKeyboardAware = a3;
    BOOL v4 = [(PUAlbumListViewController *)self _isKeyboardAware];
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v6 = v5;
    if (v4) {
      [v5 addObserver:self selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4FB2C48] object:0];
    }
    else {
      [v5 removeObserver:self name:*MEMORY[0x1E4FB2C48] object:0];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)_handlePendingScrollingAnimationEndBlock
{
  id v3 = [(PUAlbumListViewController *)self _pendingScrollingAnimationEndBlock];
  if (v3)
  {
    [(PUAlbumListViewController *)self _setPendingScrollingAnimationEndBlock:0];
    v3[2]();
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListViewController;
  id v6 = a4;
  [(PUAlbumListViewController *)&v8 willTransitionToTraitCollection:a3 withTransitionCoordinator:v6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __87__PUAlbumListViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v7[3] = &unk_1E5F2B9D0;
  void v7[4] = self;
  [v6 animateAlongsideTransition:0 completion:v7];
}

uint64_t __87__PUAlbumListViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNavigationBarAnimated:0];
}

- (BOOL)pu_wantsToolbarVisible
{
  id v3 = [(PUAlbumListViewController *)self sessionInfo];
  int v4 = [v3 isForAssetPicker];

  if (v4)
  {
    id v5 = [(PUAlbumListViewController *)self navigationController];
    int v6 = [v5 isToolbarHidden] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (!a3)
  {
    id v7 = [(PUAlbumListViewController *)self view];
    [v7 endEditing:1];
  }
  int v8 = [(PUAlbumListViewController *)self isEditing];
  v27.receiver = self;
  v27.super_class = (Class)PUAlbumListViewController;
  [(PUAlbumListViewController *)&v27 setEditing:v5 animated:v4];
  if (v8 != v5)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__PUAlbumListViewController_setEditing_animated___block_invoke;
    v25[3] = &unk_1E5F232E0;
    void v25[4] = self;
    BOOL v26 = v4;
    [(PUAlbumListViewController *)self _enumerateIndexPathsForPreparedItemsUsingBlock:v25];
    [(PUAlbumListViewController *)self _updatePeripheralInterfaceAnimated:v4];
    if (v5)
    {
      int v9 = [(PUAlbumListViewController *)self indexPathForFirstEditableAlbum];
      uint64_t v21 = 0;
      double v22 = &v21;
      uint64_t v23 = 0x2020000000;
      char v24 = 1;
      uint64_t v10 = [(PUAlbumListViewController *)self indexPathsForVisibleItems];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __49__PUAlbumListViewController_setEditing_animated___block_invoke_2;
      unint64_t v18 = &unk_1E5F23308;
      id v11 = v9;
      id v19 = v11;
      int v20 = &v21;
      [v10 enumerateObjectsUsingBlock:&v15];

      if (*((unsigned char *)v22 + 24))
      {
        int v12 = [(PUAlbumListViewController *)self indexPathForFirstEditableAlbum];
        [(PUAlbumListViewController *)self scrollToItemAtIndexPath:v12 centered:1 animated:v4];
      }
      _Block_object_dispose(&v21, 8);
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1790], "focusSystemForEnvironment:", self, v15, v16, v17, v18);
    [v13 setNeedsFocusUpdate];
  }
  int v14 = [(PUAlbumListViewController *)self _mainTableView];
  objc_msgSend(v14, "setEditing:animated:", -[PUAlbumListViewController isEditing](self, "isEditing"), v4);
}

uint64_t __49__PUAlbumListViewController_setEditing_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateListCellForItemAtIndexPath:a2 animated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __49__PUAlbumListViewController_setEditing_animated___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) compare:a2];
  if (result == -1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  BOOL v5 = [(PUAlbumListViewController *)self retitlingCollection];
  if (v5) {
    [(PUAlbumListViewController *)self navigateToRevealAssetCollection:v5 initiallyHidden:0 animated:1];
  }
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (int64_t)tableViewStyle
{
  return 1;
}

- (id)backgroundColorForTableView
{
  id v2 = +[PUInterfaceManager currentTheme];
  id v3 = [v2 photoCollectionViewBackgroundColor];

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PUAlbumListViewController;
  [(PUAlbumListViewController *)&v9 viewDidDisappear:a3];
  [(PUAlbumListViewController *)self _resetPreheating];
  BOOL v4 = [(PUAlbumListViewController *)self dataSourceManager];
  [v4 pauseBackgroundFetching];

  BOOL v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_super v6 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v11 = v6;
    id v7 = v6;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "*** %@ ending suppresion contexts", buf, 0xCu);
  }
  int v8 = [(id)*MEMORY[0x1E4FB2608] notificationSuppressionContextManager];
  [v8 setNotificationSuppressionContexts:0];

  PXUnregisterAppIntentsViewAnnotationDelegate();
}

- (void)_postDidAppearActions
{
  if ([(PUAlbumListViewController *)self px_isVisible]
    && [(PUAlbumListViewController *)self canShowSyncProgress])
  {
    [(PUAlbumListViewController *)self updateSyncProgress];
  }
  [MEMORY[0x1E4F90840] preloadResourcesForStyle:2];
  if (!self->_didInitialRequestForPlacesCount)
  {
    self->_didInitialRequestForPlacesCount = 1;
    objc_initWeak(&location, self);
    id v3 = [(PUAlbumListViewController *)self _placesAlbumCoverProvider];
    objc_initWeak(&from, v3);

    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__PUAlbumListViewController__postDidAppearActions__block_invoke;
    v5[3] = &unk_1E5F252D8;
    objc_copyWeak(&v6, &from);
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __50__PUAlbumListViewController__postDidAppearActions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  id v3[2] = __50__PUAlbumListViewController__postDidAppearActions__block_invoke_2;
  v3[3] = &unk_1E5F2E558;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  [WeakRetained requestAssetCountWithForcedRefresh:1 completion:v3];

  objc_destroyWeak(&v4);
}

void __50__PUAlbumListViewController__postDidAppearActions__block_invoke_2(uint64_t a1, void *a2)
{
  objc_copyWeak(v3, (id *)(a1 + 32));
  v3[1] = a2;
  px_dispatch_on_main_queue();
  objc_destroyWeak(v3);
}

void __50__PUAlbumListViewController__postDidAppearActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showPlacesCount:*(void *)(a1 + 40)];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)PUAlbumListViewController;
  [(PUAlbumListViewController *)&v12 viewDidAppear:a3];
  id v4 = [(PUAlbumListViewController *)self _suppressionContexts];
  BOOL v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    int v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    id v7 = v6;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "*** %@ Suppressing SB alerts for %@", buf, 0x16u);
  }
  int v8 = [(id)*MEMORY[0x1E4FB2608] notificationSuppressionContextManager];
  [v8 setNotificationSuppressionContexts:v4];

  objc_super v9 = [(PUAlbumListViewController *)self view];
  PXAppIntentsRegisterViewAnnotationView();

  PXRegisterAppIntentsViewAnnotationDelegate();
  if ([(PUAlbumListViewController *)self isRootSharedAlbumList]) {
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.photoStreamList" withPayload:MEMORY[0x1E4F1CC08]];
  }
  uint64_t v10 = [(PUAlbumListViewController *)self dataSourceManager];
  [v10 startBackgroundFetchingIfNeeded];

  objc_initWeak((id *)buf, self);
  objc_copyWeak(&v11, (id *)buf);
  px_dispatch_on_main_queue_when_idle_after_delay();
  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __43__PUAlbumListViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _postDidAppearActions];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PUAlbumListViewController;
  -[PUAlbumListViewController viewWillAppear:](&v21, sel_viewWillAppear_);
  [(PUAlbumListViewController *)self _resetPreheating];
  BOOL v5 = [(PUAlbumListViewController *)self pushedAlbum];
  [(PUAlbumListViewController *)self setPushedAlbum:0];
  [(PUAlbumListViewController *)self setPushedController:0];
  if (![(PUAlbumListViewController *)self isViewInSyncWithModel])
  {
    [(PUAlbumListViewController *)self _updateAlbumSubtitleFormat];
    [(PUAlbumListViewController *)self _updateInterfaceForModelReloadAnimated:0];
  }
  if (v5)
  {
    id v6 = [(PUAlbumListViewController *)self indexPathForCollection:v5];
    if (v6)
    {
      id v7 = [(PUAlbumListViewController *)self presentingViewController];
      int v8 = [v7 transitionCoordinator];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __44__PUAlbumListViewController_viewWillAppear___block_invoke;
      unint64_t v18 = &unk_1E5F28AE8;
      id v19 = self;
      id v6 = v6;
      id v20 = v6;
      [v8 animateAlongsideTransition:&v15 completion:0];
    }
    goto LABEL_9;
  }
  id v6 = [(PUAlbumListViewController *)self sessionInfo];
  uint64_t v9 = [v6 sourceAlbum];
  if (!v9)
  {
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v10 = (void *)v9;
  id v11 = [(PUAlbumListViewController *)self sessionInfo];
  int v12 = [v11 scrollToSourceAlbumWhenPresented];

  if (v12)
  {
    id v6 = [(PUAlbumListViewController *)self sessionInfo];
    uint64_t v13 = [v6 sourceAlbum];
    [(PUAlbumListViewController *)self _performOrScheduleScrollToCollection:v13 animated:0];

    goto LABEL_9;
  }
LABEL_10:
  -[PUAlbumListViewController deselectSelectedItemAnimated:](self, "deselectSelectedItemAnimated:", v3, v15, v16, v17, v18, v19);
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:v3];
  int v14 = [(PUAlbumListViewController *)self dataSourceManager];
  [v14 prepareBackgroundFetchingIfNeeded];
}

uint64_t __44__PUAlbumListViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) scrollToItemAtIndexPath:*(void *)(a1 + 40) centered:0 animated:0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 selectItemAtIndexPath:v3 animated:0];
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PUAlbumListViewController;
  [(PUAlbumListViewController *)&v7 viewDidLayoutSubviews];
  uint64_t v3 = [(PUAlbumListViewController *)self mainScrollView];
  [v3 setNeedsLayout];

  id v4 = [(PUAlbumListViewController *)self mainScrollView];
  [v4 layoutIfNeeded];

  BOOL v5 = [(PUAlbumListViewController *)self _onViewDidLayoutSubviewsBlock];

  if (v5)
  {
    id v6 = [(PUAlbumListViewController *)self _onViewDidLayoutSubviewsBlock];
    v6[2]();

    [(PUAlbumListViewController *)self _setOnViewDidLayoutSubviewsBlock:0];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUAlbumListViewController;
  [(PUAlbumListViewController *)&v3 viewWillLayoutSubviews];
  [(PUAlbumListViewController *)self updateInterfaceLayoutIfNecessary];
  [(PUAlbumListViewController *)self _updateIfNeeded];
}

- (void)_updateMainView
{
  objc_super v3 = [(PUAlbumListViewController *)self spec];
  int v4 = [v3 shouldUseTableView];

  id v57 = [(PUAlbumListViewController *)self view];
  [v57 bounds];
  double v55 = v6;
  double v56 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(PUAlbumListViewController *)self _mainTableView];
  int v12 = v11;
  if (v4)
  {
    if (!v11)
    {
      int v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D00]), "initWithFrame:style:", -[PUAlbumListViewController tableViewStyle](self, "tableViewStyle"), v56, v55, v8, v10);
      uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, v8, 1.17549435e-38);
      [v12 setTableHeaderView:v13];

      [v12 setAutoresizingMask:18];
      [v12 setAlwaysBounceVertical:1];
      [v12 setDataSource:self];
      [v12 setDelegate:self];
      int v14 = [(PUAlbumListViewController *)self backgroundColorForTableView];
      if (v14) {
        [v12 setBackgroundColor:v14];
      }
      [v12 setAllowsSelection:1];
      [v12 setAllowsSelectionDuringEditing:0];
      [v12 setAllowsMultipleSelection:0];
      [v12 setSeparatorStyle:0];
      [v12 setCellLayoutMarginsFollowReadableWidth:0];
      [v57 addSubview:v12];
      [(PUAlbumListViewController *)self _setMainTableView:v12];
      [(PUAlbumListViewController *)self setViewInSyncWithModel:0];
    }
    uint64_t v15 = [(PUAlbumListViewController *)self spec];
    uint64_t v16 = [(PUAlbumListViewController *)self view];
    [v16 bounds];
    objc_msgSend(v15, "cellSizeForBounds:");
    [v12 setEstimatedRowHeight:v17];

    [v12 setSectionHeaderHeight:0.0];
    unint64_t v18 = [(PUAlbumListViewController *)self spec];
    [v18 sectionFooterHeight];
    double v20 = v19;

    [v12 setSectionFooterHeight:v20];
  }
  else
  {
    if (!v11) {
      goto LABEL_10;
    }
    [v11 setDataSource:0];
    [v12 setDelegate:0];
    [v12 removeFromSuperview];
    [(PUAlbumListViewController *)self _setMainTableView:0];
  }

LABEL_10:
  objc_super v21 = [(PUAlbumListViewController *)self view];
  [v21 frame];
  double v23 = v22;
  double v25 = v24;

  BOOL v26 = [(PUAlbumListViewController *)self view];
  [v26 safeAreaInsets];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  -[PUAlbumListViewController _setLayoutReferenceSize:](self, "_setLayoutReferenceSize:", v23, v25);
  -[PUAlbumListViewController _setLayoutSafeAreaInsets:](self, "_setLayoutSafeAreaInsets:", v28, v30, v32, v34);
  id v35 = [(PUAlbumListViewController *)self _mainCollectionViewLayout];
  double v36 = [(PUAlbumListViewController *)self _mainCollectionView];
  if (v4)
  {
    if (v35)
    {
      [(PUSectionedGridLayout *)v35 setDelegate:0];
      [(PUAlbumListViewController *)self _setMainCollectionViewLayout:0];
    }
    if (v36)
    {
      [(PUCollectionView *)v36 setDataSource:0];
      [(PUCollectionView *)v36 setDelegate:0];
      [(PUCollectionView *)v36 setDragDestinationDelegate:0];
      [(PUCollectionView *)v36 setReorderDelegate:0];
      [(PUCollectionView *)v36 removeFromSuperview];
      [(PUAlbumListViewController *)self _setMainCollectionView:0];
    }
  }
  else
  {
    if (!v35)
    {
      id v35 = objc_alloc_init(PUSectionedGridLayout);
      [(PUSectionedGridLayout *)v35 setDelegate:self];
      [(PUAlbumListViewController *)self _setMainCollectionViewLayout:v35];
    }
    [(PUAlbumListViewController *)self _updateLayoutMetrics];
    unint64_t v37 = [(PUAlbumListViewController *)self spec];
    [(PUAlbumListViewController *)self _layoutReferenceSize];
    double v39 = v38;
    double v41 = v40;
    [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
    objc_msgSend(v37, "sectionInsetsForLayoutReferenceSize:safeAreaInsets:", v39, v41, v42, v43, v44, v45);
    double v47 = v46;
    double v49 = v48;

    __int16 v50 = [(PUAlbumListViewController *)self navigationItem];
    objc_msgSend(v50, "setLargeTitleInsets:", 0.0, v47, 0.0, v49);

    if ([(PUAlbumListViewController *)self isRootFolder]
      && ([(PUAlbumListViewController *)self spec],
          id v51 = objc_claimAutoreleasedReturnValue(),
          int v52 = [v51 shouldShowSectionHeaders],
          v51,
          v52))
    {
      [(PUSectionedGridLayout *)v35 setSectionHeadersEnabled:1];
      [(PUSectionedGridLayout *)v35 setFloatingSectionHeadersEnabled:0];
      [(PUSectionedGridLayout *)v35 setSectionHeaderElementKind:@"PUAlbumListViewControllerElementKindSectionHeader"];
      if (v36) {
        goto LABEL_23;
      }
    }
    else
    {
      [(PUSectionedGridLayout *)v35 setSectionHeadersEnabled:0];
      if (v36) {
        goto LABEL_23;
      }
    }
    double v36 = -[PUCollectionView initWithFrame:collectionViewLayout:]([PUCollectionView alloc], "initWithFrame:collectionViewLayout:", v35, v56, v55, v8, v10);
    [(PUCollectionView *)v36 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"albumCell"];
    [(PUCollectionView *)v36 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"folderCell"];
    [(PUCollectionView *)v36 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"placeholderCell"];
    [(PUCollectionView *)v36 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUGridGlobalHeader" withReuseIdentifier:@"PUGridGlobalHeader"];
    [(PUCollectionView *)v36 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUGridGlobalFooter" withReuseIdentifier:@"PUGridGlobalFooter"];
    [(PUCollectionView *)v36 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUAlbumListViewControllerElementKindSectionHeader" withReuseIdentifier:@"PUAlbumListViewControllerElementKindSectionHeader"];
    [(PUCollectionView *)v36 setAutoresizingMask:18];
    [(PUCollectionView *)v36 setAlwaysBounceVertical:1];
    [(PUCollectionView *)v36 setPrefetchingEnabled:1];
    [(PUCollectionView *)v36 setDataSource:self];
    [(PUCollectionView *)v36 setDelegate:self];
    [(PUCollectionView *)v36 setReorderDelegate:self];
    [(PUAlbumListViewController *)self setupDropDelegateForCollectionView:v36];
    [(PUCollectionView *)v36 setSpringLoaded:1];
    id v53 = +[PUInterfaceManager currentTheme];
    v54 = [v53 photoCollectionViewBackgroundColor];

    [(PUCollectionView *)v36 setBackgroundColor:v54];
    [v57 addSubview:v36];
    [(PUAlbumListViewController *)self _setMainCollectionView:v36];
    [(PUAlbumListViewController *)self setViewInSyncWithModel:0];
  }
LABEL_23:
}

- (void)_updateLayoutMetrics
{
  id v12 = [(PUAlbumListViewController *)self spec];
  objc_super v3 = [(PUAlbumListViewController *)self gridLayout];
  [(PUAlbumListViewController *)self _layoutReferenceSize];
  double v5 = v4;
  double v7 = v6;
  [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
  objc_msgSend(v12, "configureGridLayout:forLayoutReferenceSize:safeAreaInsets:", v3, v5, v7, v8, v9, v10, v11);
}

- (void)_setLayoutSafeAreaInsets:(UIEdgeInsets)a3
{
  if (self->__layoutSafeAreaInsets.left != a3.left
    || self->__layoutSafeAreaInsets.top != a3.top
    || self->__layoutSafeAreaInsets.right != a3.right
    || self->__layoutSafeAreaInsets.bottom != a3.bottom)
  {
    self->__layoutSafeAreaInsets = a3;
    [(PUAlbumListViewController *)self _invalidatePreparedCellsConfiguration];
  }
}

- (void)_setLayoutReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUAlbumListViewController *)self _layoutReferenceSize];
  if (v7 != width || v6 != height)
  {
    double v9 = self->__layoutReferenceSize.width;
    double v10 = self->__layoutReferenceSize.height;
    self->__layoutReferenceSize.double width = width;
    self->__layoutReferenceSize.double height = height;
    if (*MEMORY[0x1E4F1DB30] != v9 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v10)
    {
      [(PUAlbumListViewController *)self _invalidatePreparedCellsConfiguration];
    }
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PUAlbumListViewController;
  [(PUAlbumListViewController *)&v9 viewDidLoad];
  [(PUAlbumListViewController *)self updateSpec];
  objc_super v3 = [(PUAlbumListViewController *)self view];
  double v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [(PUAlbumListViewController *)self _updateAddNewAlbumPlaceholderAnimated:0];
  [(PUAlbumListViewController *)self _updateMainView];
  double v5 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2AF8] modifierFlags:0x100000 action:sel__handleOpenKeyCommand_];
  [(PUAlbumListViewController *)self addKeyCommand:v5];

  double v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0x80000 action:sel__handleRenameKeyCommand_];
  [(PUAlbumListViewController *)self addKeyCommand:v6];

  double v7 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\b" modifierFlags:0 action:sel__handleDeleteKeyCommand_];
  [(PUAlbumListViewController *)self addKeyCommand:v7];

  double v8 = [(PUAlbumListViewController *)self sharedLibraryStatusProvider];
  [v8 registerChangeObserver:self context:PXSharedLibraryStatusProviderObservationContext];
}

- (id)_suppressionContexts
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F8C560]];
  objc_super v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 138412290;
    double v6 = v2;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "*** Supressing SB alerts for %@", (uint8_t *)&v5, 0xCu);
  }

  return v2;
}

- (void)_updatePreheatedAssets
{
  objc_super v3 = [(PUAlbumListViewController *)self mainScrollView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  v62.origin.double x = v5;
  v62.origin.double y = v7;
  v62.size.double width = v9;
  v62.size.double height = v11;
  if (!CGRectIsEmpty(v62))
  {
    [(PUAlbumListViewController *)self _previousPreheatRect];
    CGFloat v45 = v12;
    double v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    v63.origin.double x = v5;
    v63.origin.double y = v7;
    v63.size.double width = v9;
    v63.size.double height = v11;
    CGRect v64 = CGRectInset(v63, 0.0, v11 * -0.5);
    double x = v64.origin.x;
    double y = v64.origin.y;
    double v21 = v64.origin.y - v14;
    double v22 = -(v64.origin.y - v14);
    if (v21 < 0.0) {
      double v21 = v22;
    }
    if (v21 > v11 / 3.0)
    {
      double width = v64.size.width;
      double height = v64.size.height;
      if ([(PUAlbumListViewController *)self px_isVisible])
      {
        -[PUAlbumListViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", x, y, width, height);
        id v25 = [(PUAlbumListViewController *)self _preheatedCollections];
        if (!v25)
        {
          id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [(PUAlbumListViewController *)self _setPreheatedCollections:v25];
        }
        uint64_t v56 = 0;
        id v57 = &v56;
        uint64_t v58 = 0x3032000000;
        v59 = __Block_byref_object_copy__7833;
        v60 = __Block_byref_object_dispose__7834;
        id v61 = 0;
        uint64_t v50 = 0;
        id v51 = &v50;
        uint64_t v52 = 0x3032000000;
        id v53 = __Block_byref_object_copy__7833;
        v54 = __Block_byref_object_dispose__7834;
        id v55 = 0;
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __51__PUAlbumListViewController__updatePreheatedAssets__block_invoke;
        v46[3] = &unk_1E5F232B8;
        v46[4] = self;
        id v26 = v25;
        id v47 = v26;
        double v48 = &v56;
        double v49 = &v50;
        PUDiffVerticalRects(v46, v45, v14, v16, v18, x, y, width, height);
        if ([(id)v57[5] count] || objc_msgSend((id)v51[5], "count"))
        {
          double v27 = [(PUAlbumListViewController *)self _imageRequestOptions];
          double v28 = [(PUAlbumListViewController *)self spec];
          uint64_t v29 = [v28 imageContentMode];

          double v30 = [(PUAlbumListViewController *)self spec];
          [(PUAlbumListViewController *)self _layoutReferenceSize];
          double v32 = v31;
          double v34 = v33;
          [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
          objc_msgSend(v30, "imageSizeForLayoutReferenceSize:safeAreaInsets:", v32, v34, v35, v36, v37, v38);
          double v40 = v39;
          double v42 = v41;

          double v43 = [(PUAlbumListViewController *)self _cachingImageManager];
          objc_msgSend(v43, "startCachingImagesForAssets:targetSize:contentMode:options:", v57[5], v29, v27, v40, v42);

          double v44 = [(PUAlbumListViewController *)self _cachingImageManager];
          objc_msgSend(v44, "stopCachingImagesForAssets:targetSize:contentMode:options:", v51[5], v29, v27, v40, v42);
        }
        _Block_object_dispose(&v50, 8);

        _Block_object_dispose(&v56, 8);
      }
    }
  }
}

void __51__PUAlbumListViewController__updatePreheatedAssets__block_invoke(uint64_t a1, int a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v4 = objc_msgSend(*(id *)(a1 + 32), "indexPathsForItemsInRect:");
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        CGFloat v9 = [*(id *)(a1 + 32) collectionAtIndexPath:*(void *)(*((void *)&v25 + 1) + 8 * v8)];
        double v10 = v9;
        if (v9 && (objc_msgSend(v9, "px_isFolder") & 1) == 0)
        {
          int v11 = [*(id *)(a1 + 40) containsObject:v10];
          if (a2)
          {
            if (v11) {
              goto LABEL_20;
            }
            double v12 = [*(id *)(a1 + 32) _visibleAssetsForCollection:v10];
            uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
            double v14 = *(void **)(v13 + 40);
            if (v14)
            {
              id v15 = v14;
              CGFloat v16 = *(void **)(v13 + 40);
              *(void *)(v13 + 40) = v15;
            }
            else
            {
              uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
              CGFloat v16 = *(void **)(v22 + 40);
              *(void *)(v22 + 40) = v21;
            }

            [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObjectsFromArray:v12];
            [*(id *)(a1 + 40) addObject:v10];
          }
          else
          {
            if (!v11) {
              goto LABEL_20;
            }
            double v12 = [*(id *)(a1 + 32) _visibleAssetsForCollection:v10];
            uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
            CGFloat v18 = *(void **)(v17 + 40);
            if (v18)
            {
              id v19 = v18;
              double v20 = *(void **)(v17 + 40);
              *(void *)(v17 + 40) = v19;
            }
            else
            {
              uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
              double v20 = *(void **)(v24 + 40);
              *(void *)(v24 + 40) = v23;
            }

            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v12];
            [*(id *)(a1 + 40) removeObject:v10];
          }
        }
LABEL_20:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }
}

- (void)_resetPreheating
{
  [(PHCachingImageManager *)self->__cachingImageManager stopCachingImagesForAllAssets];
  -[PUAlbumListViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PUAlbumListViewController *)self _setPreheatedCollections:0];
}

- (id)_visibleAssetsForCollection:(id)a3 maximumNumberOfVisibleAssets:(int64_t)a4 correspondingCollections:(id *)a5
{
  id v8 = a3;
  if (objc_msgSend(v8, "px_isMacSyncedFacesFolder"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(PUAlbumListViewController *)self _getDisplayableFacesForCollectionList:v8 maximumCount:a4];
LABEL_4:
      double v10 = v9;
      goto LABEL_11;
    }
  }
  else if ((objc_msgSend(v8, "px_isPeopleVirtualCollection") & 1) == 0 {
         && (objc_msgSend(v8, "px_isPlacesSmartAlbum") & 1) == 0
  }
         && (objc_msgSend(v8, "px_isHiddenSmartAlbum") & 1) == 0
         && (objc_msgSend(v8, "px_isRecentlyDeletedSmartAlbum") & 1) == 0
         && (objc_msgSend(v8, "px_isRecoveredSmartAlbum") & 1) == 0)
  {
    if (objc_msgSend(v8, "px_isFolder"))
    {
      id v9 = [(PUAlbumListViewController *)self _getDisplayableAssetsForFolder:v8 maximumCount:a4 useCache:1 correspondingCollections:a5];
    }
    else
    {
      id v12 = 0;
      [(PUAlbumListViewController *)self _getDisplayableAssets:&v12 indexes:0 forCollection:v8 maximumCount:a4 useCache:1];
      id v9 = v12;
    }
    goto LABEL_4;
  }
  double v10 = 0;
LABEL_11:

  return v10;
}

- (id)_visibleAssetsForCollection:(id)a3 correspondingCollections:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(PUAlbumListViewController *)self _visibleAssetsForCollection:v6 maximumNumberOfVisibleAssets:+[PUStackView maximumNumberOfVisibleImagesForStyle:[(PUAlbumListViewController *)self _stackViewStyleForCollection:v6]] correspondingCollections:a4];

  return v7;
}

- (id)_visibleAssetsForCollection:(id)a3
{
  return [(PUAlbumListViewController *)self _visibleAssetsForCollection:a3 correspondingCollections:0];
}

- (unint64_t)_stackViewStyleForCollection:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "px_isSharedAlbum"))
  {
    uint64_t v5 = [(PUAlbumListViewController *)self spec];
    id v6 = v5;
LABEL_5:
    uint64_t v8 = [v5 stackViewStyle];
    goto LABEL_6;
  }
  int v7 = objc_msgSend(v4, "px_isFolder");
  uint64_t v5 = [(PUAlbumListViewController *)self spec];
  id v6 = v5;
  if (!v7) {
    goto LABEL_5;
  }
  uint64_t v8 = [v5 folderStackViewStyle];
LABEL_6:
  unint64_t v9 = v8;

  return v9;
}

- (void)_getDisplayableAssets:(id *)a3 indexes:(id *)a4 forCollection:(id)a5 maximumCount:(int64_t)a6 useCache:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a5;
  id v13 = [(PUAlbumListViewController *)self dataSourceManager];
  [v13 getDisplayableAssets:a3 indexes:a4 forCollection:v12 maximumCount:a6 useCache:v7];
}

- (id)_getDisplayableFacesForCollectionList:(id)a3 maximumCount:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(PUAlbumListViewController *)self dataSourceManager];
  uint64_t v8 = [v7 assetsFetchResultForCollection:v6];

  if ([v8 count] <= (unint64_t)a4) {
    a4 = [v8 count];
  }
  if (a4)
  {
    unint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v10 = 0;
    do
    {
      int v11 = [v8 objectAtIndex:v10];
      id v12 = [MEMORY[0x1E4F38EE8] posterImageForAssetCollection:v11];
      if (v12) {
        [v9 addObject:v12];
      }

      ++v10;
    }
    while (a4 != v10);
  }
  else
  {
    unint64_t v9 = [MEMORY[0x1E4F1C978] array];
  }

  return v9;
}

- (id)_getDisplayableAssetsForFolder:(id)a3 maximumCount:(int64_t)a4 useCache:(BOOL)a5 correspondingCollections:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  int v11 = [(PUAlbumListViewController *)self dataSourceManager];
  id v12 = [v11 displayableAssetsForCollectionList:v10 maximumCount:a4 useCache:v7 correspondingCollections:a6];

  return v12;
}

- (id)newGridViewControllerForAllPhotos
{
  return 0;
}

- (void)navigateToPeopleAnimated:(BOOL)a3 withPersonLocalIdentifier:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__PUAlbumListViewController_navigateToPeopleAnimated_withPersonLocalIdentifier_withCompletion___block_invoke;
  v10[3] = &unk_1E5F23290;
  id v11 = v8;
  id v9 = v8;
  [(PUAlbumListViewController *)self _navigateToPeopleAnimated:v6 withPersonLocalIdentifier:a4 withCompletion:v10];
}

uint64_t __95__PUAlbumListViewController_navigateToPeopleAnimated_withPersonLocalIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)newGridViewControllerForAssetCollection:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 assetCollectionType];
  uint64_t v6 = [v4 assetCollectionSubtype];
  if (v5 == 2 && v6 == 201)
  {
    BOOL v7 = [(PUAlbumListViewController *)self px_gridPresentation];
    id v8 = [v7 createPanoramaViewController];
  }
  else
  {
    id v9 = [(PUAlbumListViewController *)self dataSourceManager];
    BOOL v7 = [v9 assetsFetchResultForCollection:v4];

    id v10 = [(PUAlbumListViewController *)self px_gridPresentation];
    id v8 = [v10 createPhotosAlbumViewControllerForAlbum:v4 withFetchResult:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [(PUAlbumListViewController *)self sessionInfo];
    [v8 setSessionInfo:v11];
  }
  id v12 = (void *)MEMORY[0x1E4F56658];
  uint64_t v15 = *MEMORY[0x1E4F56548];
  v16[0] = v4;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v12 sendEvent:@"com.apple.photos.CPAnalytics.albumListItemSelected" withPayload:v13];

  return v8;
}

- (id)newGridViewControllerForFolder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUAlbumListViewController *)self spec];
  uint64_t v6 = [v5 standInAlbumListViewControllerSpec];

  BOOL v7 = [PUAlbumListViewController alloc];
  id v8 = [(PUAlbumListViewController *)self photoLibrary];
  id v9 = [(PUAlbumListViewController *)v7 initWithSpec:v6 photoLibrary:v8];

  [(PUAlbumListViewController *)v9 setCollection:v4];
  return v9;
}

- (void)handleSessionInfoAlbumSelection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUAlbumListViewController *)self sessionInfo];
  uint64_t v6 = [(PUAlbumListViewController *)self _pickerBannerView];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  CGFloat v18 = __61__PUAlbumListViewController_handleSessionInfoAlbumSelection___block_invoke;
  id v19 = &unk_1E5F2E1C0;
  id v20 = v5;
  id v7 = v4;
  id v21 = v7;
  id v8 = v5;
  id v9 = _Block_copy(&v16);
  id v10 = v9;
  if (v6)
  {
    id v11 = -[PUAlbumListViewController indexPathForCollection:](self, "indexPathForCollection:", v7, v16, v17, v18, v19, v20, v21);
    id v12 = [(PUAlbumListViewController *)self _preparedAlbumListCellContentViewAtIndexPath:v11];
    id v13 = [v12 stackView];
    double v14 = [(PUAlbumListViewController *)self navigationController];
    uint64_t v15 = [v14 view];

    [v6 animateImagesOntoView:v13 inContainerView:v15 completionHandler:v10];
  }
  else
  {
    (*((void (**)(void *, uint64_t))v9 + 2))(v9, 1);
  }
}

uint64_t __61__PUAlbumListViewController_handleSessionInfoAlbumSelection___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTargetAlbum:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 setStatus:1];
}

- (void)_handleDeleteCollection:(id)a3 sourceView:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  id v8 = [(PUAlbumListViewController *)self dataSourceManager];
  char v9 = [v8 canDeleteCollection:v15];

  if ((v9 & 1) == 0)
  {
    double v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:2079 description:@"expected deletable collection"];
  }
  id v10 = [(PUAlbumListViewController *)self spec];
  [v10 albumDeletionWarningStyle];

  id v11 = [(PUAlbumListViewController *)self undoManager];
  id v12 = PXCollectionDeletionAlertControllerForCollection();

  id v13 = [v12 popoverPresentationController];
  [v13 setSourceView:v7];

  [v13 setDelegate:self];
  [(PUAlbumListViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_handleDeleteAlbumAtIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = -[PUAlbumListViewController collectionAtIndexPath:](self, "collectionAtIndexPath:");
  if (v4)
  {
    uint64_t v5 = [(PUAlbumListViewController *)self _mainCollectionView];
    uint64_t v6 = [v5 cellForItemAtIndexPath:v7];

    [(PUAlbumListViewController *)self _handleDeleteCollection:v4 sourceView:v6];
  }
}

- (void)_dismissPhotosPickerControllerAnimated:(BOOL)a3
{
  id v4 = [(PUAlbumListViewController *)self pickerViewController];
  if (v4)
  {
    [(PUAlbumListViewController *)self setPickerViewController:0];
    uint64_t v5 = [v4 presentingViewController];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
      id v7 = PXAssertGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v8 = 0;
        _os_log_error_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Photos picker's presenting view controller is unexpectedly missing.", v8, 2u);
      }
    }
  }
}

- (void)_handleCollectionListActionType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUAlbumListViewController *)self dataSourceManager];
  uint64_t v6 = [v5 collectionList];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F90470]) initWithActionType:v4 collectionList:v6];
  [v7 setDelegate:self];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke;
  v9[3] = &unk_1E5F2D4B8;
  id v10 = v7;
  id v11 = self;
  id v8 = v7;
  [v8 performActionWithCompletionHandler:v9];
}

void __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) createdCollection];
  id v7 = [v6 localIdentifier];
  if (a2)
  {
    id v8 = [*(id *)(a1 + 40) sessionInfo];
    objc_initWeak(&location, *(id *)(a1 + 40));
    [*(id *)(a1 + 40) _setJustCreatedCollectionIdentifier:v7];
    char v9 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke_2;
    v13[3] = &unk_1E5F2D3F0;
    objc_copyWeak(&v17, &location);
    id v10 = v8;
    id v14 = v10;
    id v11 = v6;
    uint64_t v12 = *(void *)(a1 + 40);
    id v15 = v11;
    uint64_t v16 = v12;
    [v9 _setJustCreatedCollectionAnimationCompletionHandler:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke_2(id *a1)
{
  id v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if ([a1[4] isSelectingTargetAlbum])
  {
    id v4 = [WeakRetained _pickerBannerView];
    id v5 = [WeakRetained indexPathForCollection:a1[5]];
    uint64_t v6 = [WeakRetained collectionView];
    [v6 layoutIfNeeded];

    id v7 = [WeakRetained _preparedAlbumListCellContentViewAtIndexPath:v5];
    id v8 = [v7 stackView];
    char v9 = [WeakRetained navigationController];
    id v10 = [v9 view];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke_3;
    v15[3] = &unk_1E5F2E1C0;
    id v16 = a1[4];
    id v17 = a1[5];
    [v4 animateImagesOntoView:v8 inContainerView:v10 completionHandler:v15];
  }
  id v11 = objc_loadWeakRetained(v2);
  uint64_t v12 = [v11 sharedLibraryStatusProvider];

  if ([v12 hasSharedLibraryOrPreview])
  {
    id v13 = [a1[6] libraryFilterState];
    uint64_t v14 = [v13 viewMode];

    if (v14 == 2) {
      [WeakRetained navigateToCollection:a1[5] animated:1 completion:0];
    }
  }
}

uint64_t __61__PUAlbumListViewController__handleCollectionListActionType___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setTargetAlbum:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 setStatus:1];
}

- (void)didSelectItemAtIndexPath:(id)a3
{
  id v7 = a3;
  id v4 = [(PUAlbumListViewController *)self collectionAtIndexPath:v7];
  if ([(PUAlbumListViewController *)self isPlaceholderAtIndexPath:v7])
  {
    [(PUAlbumListViewController *)self _didSelectPlaceholderAtIndexPath:v7];
    goto LABEL_10;
  }
  if (v4)
  {
    id v5 = [(PUAlbumListViewController *)self sessionInfo];
    if ([v5 isSelectingTargetAlbum])
    {
      char v6 = objc_msgSend(v4, "px_isFolder");

      if ((v6 & 1) == 0)
      {
        [(PUAlbumListViewController *)self handleSessionInfoAlbumSelection:v4];
        goto LABEL_10;
      }
    }
    else
    {
    }
    if (([(PUAlbumListViewController *)self isEditing] & 1) == 0) {
      [(PUAlbumListViewController *)self navigateToCollection:v4 animated:1 completion:0];
    }
  }
LABEL_10:
}

- (void)_didSelectPlaceholderAtIndexPath:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int64_t v6 = [(PUAlbumListViewController *)self placeholderKindAtIndexPath:v5];
  if (![(PUAlbumListViewController *)self _isPlaceholderEnabled:v6])
  {
    switch(v6)
    {
      case 0:
        id v7 = [MEMORY[0x1E4F28B00] currentHandler];
        [v7 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:1936 description:@"undefined placeholder"];

        break;
      case 1:
        if ([(PUAlbumListViewController *)self isRootSharedAlbumList]) {
          [(PUAlbumListViewController *)self newSharedAlbum:0];
        }
        else {
          [(PUAlbumListViewController *)self _handleCollectionListActionType:*MEMORY[0x1E4F90E38]];
        }
        break;
      case 2:
        id v8 = [MEMORY[0x1E4F1CA48] array];
        char v9 = [(PUAlbumListViewController *)self dataSourceManager];
        id v10 = [v9 collectionsFetchResult];
        [(PUAlbumListViewController *)self _recursivelyCollectCollectionsIn:v8 fetchResult:v10];

        id v11 = [(PUAlbumListViewController *)self _assetsFetchOptions];
        uint64_t v29 = [v8 valueForKey:@"objectID"];
        uint64_t v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY albums IN (%@)", v29];
        uint64_t v13 = [v11 internalPredicate];
        uint64_t v14 = (void *)v13;
        long long v28 = v12;
        if (v13)
        {
          id v15 = (void *)MEMORY[0x1E4F28BA0];
          v31[0] = v12;
          v31[1] = v13;
          id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
          id v17 = [v15 andPredicateWithSubpredicates:v16];
        }
        else
        {
          id v17 = v12;
        }
        [v11 setInternalPredicate:v17];
        CGFloat v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
        uint64_t v30 = v18;
        id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        [v11 setSortDescriptors:v19];

        [v11 setIncludeAssetSourceTypes:7];
        id v20 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v11];
        id v21 = (void *)MEMORY[0x1E4F38EE8];
        uint64_t v22 = PULocalizedString(@"ALL_PHOTOS_IN_FOLDER");
        uint64_t v23 = [v21 transientAssetCollectionWithAssetFetchResult:v20 title:v22];

        uint64_t v24 = [(PUAlbumListViewController *)self spec];
        char v25 = [v24 shouldUseCollageForCloudFeedPlaceholder];

        if (v25)
        {
          id v26 = [(PUAlbumListViewController *)self newGridViewControllerForAssetCollection:v23];
          long long v27 = [(PUAlbumListViewController *)self navigationController];
          objc_msgSend(v27, "pu_pushViewController:withTransition:animated:isInteractive:", v26, 0, 1, 0);
        }
        else
        {
          [(PUAlbumListViewController *)self navigateToCollection:v23 animated:1 completion:0];
        }

        goto LABEL_19;
      case 3:
        [(PUAlbumListViewController *)self navigateToAllPhotosAnimated:1 completion:0];
        break;
      case 4:
        [(PUAlbumListViewController *)self _navigateToPeopleAnimated:1 withPersonLocalIdentifier:0 withCompletion:0];
        break;
      case 5:
        id v8 = [(PUAlbumListViewController *)self collectionAtIndexPath:v5];
        [(PUAlbumListViewController *)self _navigateToPlacesFromCollection:v8];
LABEL_19:

        break;
      case 6:
        [(PUAlbumListViewController *)self _navigateToMemories];
        break;
      default:
        JUMPOUT(0);
    }
  }
}

- (BOOL)_isPlaceholderEnabled:(int64_t)a3
{
  if ([(PUAlbumListViewController *)self isEditing])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    int64_t v6 = [(PUAlbumListViewController *)self sessionInfo];
    int v5 = [v6 isSelectingTargetAlbum] ^ 1;
  }
  if (a3 == 1) {
    return 1;
  }
  else {
    return v5;
  }
}

- (void)_recursivelyCollectCollectionsIn:(id)a3 fetchResult:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 canContainCollections])
        {
          uint64_t v13 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v12 options:0];
          [(PUAlbumListViewController *)self _recursivelyCollectCollectionsIn:v6 fetchResult:v13];
        }
        else if ([v12 canContainAssets])
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)_handleCancelButton:(id)a3
{
  id v3 = [(PUAlbumListViewController *)self sessionInfo];
  [v3 setStatus:2];
}

- (void)_handleDoneButton:(id)a3
{
  id v3 = [(PUAlbumListViewController *)self sessionInfo];
  [v3 setStatus:1];
}

- (void)newFolder:(id)a3
{
}

- (void)newSmartAlbum:(id)a3
{
}

- (void)newAlbum:(id)a3
{
}

- (void)_handleDeleteKeyCommand:(id)a3
{
  id v6 = [(PUAlbumListViewController *)self focusedListCell];
  if (v6)
  {
    id v4 = [(PUAlbumListViewController *)self _mainCollectionView];
    int v5 = [v4 indexPathForCell:v6];

    [(PUAlbumListViewController *)self _handleDeleteAlbumAtIndexPath:v5];
  }
}

- (void)_handleRenameKeyCommand:(id)a3
{
  id v3 = [(PUAlbumListViewController *)self focusedListCell];
  id v4 = [v3 albumListCellContentView];

  [v4 startPerformRetitleAction];
}

- (void)_handleOpenKeyCommand:(id)a3
{
  id v6 = [(PUAlbumListViewController *)self focusedListCell];
  if (v6)
  {
    id v4 = [(PUAlbumListViewController *)self _mainCollectionView];
    int v5 = [v4 indexPathForCell:v6];

    [(PUAlbumListViewController *)self didSelectItemAtIndexPath:v5];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel__handleOpenKeyCommand_ == a3)
  {
    id v7 = [(PUAlbumListViewController *)self focusedListCell];
    LOBYTE(a3) = v7 != 0;

    goto LABEL_11;
  }
  if (sel__handleRenameKeyCommand_ == a3)
  {
    uint64_t v8 = [(PUAlbumListViewController *)self focusedListCell];
    uint64_t v9 = [v8 albumListCellContentView];
    a3 = (SEL)(((unint64_t)[v9 editCapabilities] >> 1) & 1);
LABEL_9:

    goto LABEL_11;
  }
  if (sel__handleDeleteKeyCommand_ == a3)
  {
    uint64_t v8 = [(PUAlbumListViewController *)self focusedListCell];
    uint64_t v9 = [v8 albumListCellContentView];
    a3 = (SEL)([v9 editCapabilities] & 1);
    goto LABEL_9;
  }
  if (sel_newSmartAlbum_ == a3)
  {
    LOBYTE(a3) = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PUAlbumListViewController;
    LOBYTE(a3) = [(PUAlbumListViewController *)&v11 canPerformAction:a3 withSender:v6];
  }
LABEL_11:

  return (char)a3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)_targetIndexPathForMoveFromIndexPath:(id)a3 toProposedIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PUAlbumListViewController *)self albumsSections];
  unint64_t v10 = v9;
  if ([(PUAlbumListViewController *)self isEmpty])
  {
    id v11 = v6;
    goto LABEL_14;
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v31 = [v7 item];
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v27 = [v7 section];
  unint64_t v12 = v25[3];
  if (v12 < v8 || v12 - v8 >= v10)
  {
    unint64_t v14 = v10 + v8 - 1;
    if (v12 <= v14)
    {
      if (v12 >= v8) {
        goto LABEL_13;
      }
      int64_t v15 = 0;
      v25[3] = v8;
    }
    else
    {
      v25[3] = v14;
      int64_t v15 = -[PUAlbumListViewController numberOfItemsInSection:](self, "numberOfItemsInSection:") - 1;
    }
    v29[3] = v15;
  }
LABEL_13:
  long long v16 = [(PUAlbumListViewController *)self dataSource];
  uint64_t v17 = [v16 identifier];
  uint64_t v18 = v25[3];
  uint64_t v19 = v29[3];

  id v20 = [(PUAlbumListViewController *)self dataSource];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __86__PUAlbumListViewController__targetIndexPathForMoveFromIndexPath_toProposedIndexPath___block_invoke;
  v23[3] = &unk_1E5F23268;
  void v23[4] = self;
  v23[5] = &v24;
  v23[7] = v8;
  v23[8] = v10;
  v23[6] = &v28;
  v22[0] = v17;
  v22[1] = v18 - v8;
  v22[2] = v19;
  v22[3] = 0x7FFFFFFFFFFFFFFFLL;
  [v20 enumerateItemIndexPathsStartingAtIndexPath:v22 reverseDirection:0 usingBlock:v23];

  id v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v29[3] inSection:v25[3]];
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
LABEL_14:

  return v11;
}

void __86__PUAlbumListViewController__targetIndexPathForMoveFromIndexPath_toProposedIndexPath___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v6 = [*(id *)(a1 + 32) dataSource];
  long long v7 = *(_OWORD *)(a2 + 16);
  v11[0] = *(_OWORD *)a2;
  v11[1] = v7;
  unint64_t v8 = [v6 objectAtIndexPath:v11];

  unint64_t v9 = [*(id *)(a1 + 32) dataSourceManager];
  int v10 = [v9 canReorderCollection:v8];

  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a1 + 56) + *(void *)(a2 + 8);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a2 + 16);
    *a3 = 1;
  }
}

- (id)indexPathForFirstEditableAlbum
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int64_t v15 = __Block_byref_object_copy__7833;
  long long v16 = __Block_byref_object_dispose__7834;
  id v17 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(PUAlbumListViewController *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    [v3 firstItemIndexPath];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }

  if ((void)v10 != *MEMORY[0x1E4F91310])
  {
    int v5 = [(PUAlbumListViewController *)self dataSource];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__PUAlbumListViewController_indexPathForFirstEditableAlbum__block_invoke;
    v9[3] = &unk_1E5F23240;
    void v9[4] = self;
    v9[5] = &v12;
    v8[0] = v10;
    v8[1] = v11;
    [v5 enumerateItemIndexPathsStartingAtIndexPath:v8 reverseDirection:0 usingBlock:v9];
  }
  id v6 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v6;
}

void __59__PUAlbumListViewController_indexPathForFirstEditableAlbum__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v6 = [*(id *)(a1 + 32) dataSource];
  long long v7 = *(_OWORD *)(a2 + 16);
  v12[0] = *(_OWORD *)a2;
  v12[1] = v7;
  unint64_t v8 = [v6 objectAtIndexPath:v12];

  if ([*(id *)(a1 + 32) _editCapabilitiesForAlbum:v8])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", *(void *)(a2 + 16), objc_msgSend(*(id *)(a1 + 32), "albumsSections") + *(void *)(a2 + 8));
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a3 = 1;
  }
}

- (id)indexPathForAggregateItem
{
  if ([(PUAlbumListViewController *)self _shouldShowAggregateItem])
  {
    int64_t v3 = [(PUAlbumListViewController *)self topPlaceholdersSection];
    BOOL v4 = [(PUAlbumListViewController *)self showAddNewAlbumPlaceholder];
    int v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v4 inSection:v3];
  }
  else
  {
    int v5 = 0;
  }
  return v5;
}

- (id)indexPathForAddNewAlbumPlaceholder
{
  if ([(PUAlbumListViewController *)self showAddNewAlbumPlaceholder])
  {
    int64_t v3 = [(PUAlbumListViewController *)self topPlaceholdersSection];
    BOOL v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:v3];
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (id)indexPathForPeopleAlbum
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__7833;
  uint64_t v12 = __Block_byref_object_dispose__7834;
  id v13 = 0;
  BOOL v4 = [(PUAlbumListViewController *)self dataSource];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __52__PUAlbumListViewController_indexPathForPeopleAlbum__block_invoke;
  v7[3] = &unk_1E5F23218;
  void v7[4] = self;
  void v7[5] = &v8;
  v7[6] = a2;
  [v4 enumerateCollectionsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __52__PUAlbumListViewController_indexPathForPeopleAlbum__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (objc_msgSend(v9, "px_isPeopleVirtualCollection"))
  {
    uint64_t v6 = [*(id *)(a1 + 32) indexPathForCollection:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (id)indexPathForPlacesAlbum
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = __Block_byref_object_copy__7833;
  uint64_t v12 = __Block_byref_object_dispose__7834;
  id v13 = 0;
  BOOL v4 = [(PUAlbumListViewController *)self dataSource];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __52__PUAlbumListViewController_indexPathForPlacesAlbum__block_invoke;
  v7[3] = &unk_1E5F23218;
  void v7[4] = self;
  void v7[5] = &v8;
  v7[6] = a2;
  [v4 enumerateCollectionsUsingBlock:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __52__PUAlbumListViewController_indexPathForPlacesAlbum__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  if (objc_msgSend(v9, "px_isPlacesSmartAlbum"))
  {
    uint64_t v6 = [*(id *)(a1 + 32) indexPathForCollection:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (int64_t)placeholderKindAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5 == [(PUAlbumListViewController *)self topPlaceholdersSection])
  {
    uint64_t v6 = [v4 item];
    BOOL v7 = [(PUAlbumListViewController *)self showAddNewAlbumPlaceholder];
    uint64_t v8 = v6 - v7;
    if (v6) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = v7;
    }
    BOOL v10 = [(PUAlbumListViewController *)self _shouldShowAggregateItem];
    BOOL v11 = v8 >= 0 && v10;
    BOOL v12 = v8 == 0;
    uint64_t v13 = v8 - v11;
    if (v11 && v12) {
      int64_t v9 = 2;
    }
    BOOL v14 = [(PUAlbumListViewController *)self shouldShowAllPhotosItem];
    BOOL v15 = v13 >= 0 && v14;
    if (v15 && v13 == 0) {
      int64_t v9 = 3;
    }
  }
  else
  {
    unint64_t v16 = [v4 section];
    unint64_t v17 = [(PUAlbumListViewController *)self albumsSections];
    int64_t v9 = 0;
    if (v16 >= v17 && v16 - v17 < v18)
    {
      uint64_t v19 = [(PUAlbumListViewController *)self collectionAtIndexPath:v4];
      if (objc_msgSend(v19, "px_isPeopleVirtualCollection"))
      {
        int64_t v9 = 4;
      }
      else if (objc_msgSend(v19, "px_isPlacesSmartAlbum"))
      {
        int64_t v9 = 5;
      }
      else if (objc_msgSend(v19, "px_isMemoriesVirtualCollection"))
      {
        int64_t v9 = 6;
      }
      else
      {
        int64_t v9 = 0;
      }
    }
  }

  return v9;
}

- (BOOL)isPlaceholderAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  unint64_t v6 = [(PUAlbumListViewController *)self albumsSections];
  char v8 = 1;
  if (v5 >= v6 && v5 - v6 < v7)
  {
    int64_t v9 = [(PUAlbumListViewController *)self collectionAtIndexPath:v4];
    if ((objc_msgSend(v9, "px_isPlacesSmartAlbum") & 1) == 0
      && (objc_msgSend(v9, "px_isPeopleVirtualCollection") & 1) == 0)
    {
      char v8 = objc_msgSend(v9, "px_isMemoriesVirtualCollection");
    }
  }
  return v8;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  if ([(PUAlbumListViewController *)self topPlaceholdersSection] == a3)
  {
    LODWORD(v5) = [(PUAlbumListViewController *)self showAddNewAlbumPlaceholder];
    BOOL v6 = [(PUAlbumListViewController *)self _shouldShowAggregateItem];
    uint64_t v7 = 1;
    if (v5) {
      uint64_t v7 = 2;
    }
    if (v6) {
      uint64_t v5 = v7;
    }
    else {
      uint64_t v5 = v5;
    }
    return v5 + [(PUAlbumListViewController *)self shouldShowAllPhotosItem];
  }
  else
  {
    unint64_t v10 = [(PUAlbumListViewController *)self albumsSections];
    int64_t result = 0;
    BOOL v11 = a3 >= v10;
    unint64_t v12 = a3 - v10;
    if (v11 && v12 < v9)
    {
      uint64_t v13 = [(PUAlbumListViewController *)self dataSource];
      int64_t v14 = objc_msgSend(v13, "numberOfItemsInSection:", a3 - -[PUAlbumListViewController albumsSections](self, "albumsSections"));

      return v14;
    }
  }
  return result;
}

- (int64_t)numberOfSections
{
  int64_t v3 = [(PUAlbumListViewController *)self dataSource];
  uint64_t v4 = [v3 numberOfSections];

  return v4 + [(PUAlbumListViewController *)self showsTopPlaceholdersSection];
}

- (_NSRange)albumsSections
{
  NSUInteger v3 = [(PUAlbumListViewController *)self showsTopPlaceholdersSection];
  uint64_t v4 = [(PUAlbumListViewController *)self dataSource];
  uint64_t v5 = [v4 numberOfSections];

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.id location = v6;
  return result;
}

- (int64_t)albumsSection
{
  return [(PUAlbumListViewController *)self showsTopPlaceholdersSection];
}

- (int64_t)topPlaceholdersSection
{
  if ([(PUAlbumListViewController *)self showsTopPlaceholdersSection]) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)showsSeparatorBelowTopPlaceholdersSection
{
  if ([(PUAlbumListViewController *)self _shouldShowAggregateItem]) {
    return 1;
  }
  return [(PUAlbumListViewController *)self shouldShowAllPhotosItem];
}

- (BOOL)showsTopPlaceholdersSection
{
  return 1;
}

- (BOOL)canShowAvatarViews
{
  return 1;
}

- (BOOL)shouldHideEmptyCollections
{
  return 0;
}

- (BOOL)shouldShowAllPhotosItem
{
  return 0;
}

- (BOOL)_shouldShowAggregateItem
{
  id v2 = self;
  NSUInteger v3 = [(PUAlbumListViewController *)self dataSource];
  BOOL v4 = [(PUAlbumListViewController *)v2 canShowAggregateItem];
  BOOL v5 = [(PUAlbumListViewController *)v2 isEmpty];
  LOBYTE(v2) = [(PUAlbumListViewController *)v2 isRootFolder];
  NSUInteger v6 = [v3 collectionList];
  char v7 = objc_msgSend(v6, "px_isFolder");

  char v8 = [v3 collectionList];
  char v9 = objc_msgSend(v8, "px_isSmartFolder");

  char v10 = v7 & (v9 ^ 1);
  if (v2) {
    char v10 = 0;
  }
  if (v5) {
    char v10 = 0;
  }
  if (v4) {
    BOOL v11 = v10;
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)shouldBeginRetitlingAlbumAtIndexPath:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  NSUInteger v3 = [(PUAlbumListViewController *)self _mainTableView];
  BOOL v4 = [v3 visibleCells];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) showingDeleteConfirmation])
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)shouldAllowEmailInAlbumSubtitle
{
  return 1;
}

- (id)subtitleForCollection:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "px_isSharedAlbum"))
  {
    uint64_t v5 = objc_msgSend(v4, "localizedSharedByLabelAllowsEmail:", -[PUAlbumListViewController shouldAllowEmailInAlbumSubtitle](self, "shouldAllowEmailInAlbumSubtitle"));
LABEL_6:
    uint64_t v6 = (__CFString *)v5;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "px_isMacSyncedFacesFolder") & 1) != 0
    || objc_msgSend(v4, "px_isMacSyncedEventsFolder"))
  {
    uint64_t v5 = PULocalizedString(@"FROM_MY_MAC");
    goto LABEL_6;
  }
  char v8 = [(PUAlbumListViewController *)self dataSourceManager];
  BOOL v9 = [v8 dataSource];
  uint64_t v10 = [v9 countForCollection:v4];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v6 = @" ";
    long long v11 = @" ";
  }
  else
  {
    if (self->_albumSubtitleFormat && objc_msgSend(v4, "px_isMacSyncedAlbum"))
    {
      long long v12 = PULocalizedString(self->_albumSubtitleFormat);
      PULocalizedStringWithValidatedFormat(v12, @"%ld");
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v12 = PLSharedCountFormatter();
      long long v13 = [NSNumber numberWithInteger:v10];
      uint64_t v6 = [v12 stringFromNumber:v13];
    }
  }
LABEL_7:

  return v6;
}

- (void)setSyncProgressVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUAlbumListViewController *)self progressViewVisible] == a3) {
    return;
  }
  [(PUAlbumListViewController *)self setProgressViewVisible:v3];
  uint64_t v5 = [(PUAlbumListViewController *)self _mainCollectionView];

  if (v5)
  {
    if (v3) {
      double v6 = 100.0;
    }
    else {
      double v6 = 0.0;
    }
    id v21 = [(PUAlbumListViewController *)self _mainCollectionViewLayout];
    [v21 setGlobalFooterHeight:v6];
LABEL_12:

    return;
  }
  if (v3)
  {
    uint64_t v7 = [(PUAlbumListViewController *)self syncProgressView];
    if (!v7)
    {
      id v22 = objc_alloc_init(MEMORY[0x1E4F90560]);
      id v8 = objc_alloc_init(MEMORY[0x1E4F90230]);
      [v22 setViewModel:v8];

      [(PUAlbumListViewController *)self setSyncProgressView:v22];
      uint64_t v7 = v22;
    }
    id v21 = v7;
    [v7 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    BOOL v15 = [(PUAlbumListViewController *)self _mainTableView];
    [v15 rowHeight];
    double v17 = v16;

    objc_msgSend(v21, "setFrame:", v10, v12, v14, v17);
    unint64_t v18 = [(PUAlbumListViewController *)self _mainTableView];
    [v18 setTableFooterView:v21];

    goto LABEL_12;
  }
  uint64_t v19 = [(PUAlbumListViewController *)self _mainTableView];
  [v19 setTableFooterView:0];

  id v20 = [(PUAlbumListViewController *)self syncProgressView];
  [v20 removeFromSuperview];

  [(PUAlbumListViewController *)self setSyncProgressView:0];
}

- (void)_updateCollageView:(id)a3 forAssets:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUAlbumListViewController *)self spec];
  [(PUAlbumListViewController *)self _layoutReferenceSize];
  double v10 = v9;
  double v12 = v11;
  [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
  objc_msgSend(v8, "stackSizeForLayoutReferenceSize:safeAreaInsets:", v10, v12, v13, v14, v15, v16);
  double v18 = v17;
  double v20 = v19;
  [v8 collageSpacing];
  double v22 = v21;
  objc_msgSend(v6, "setCollageSize:", v18, v20);
  [v6 setSpacing:v22];
  objc_msgSend(v6, "setNumberOfItems:", objc_msgSend(v7, "count"));
  [v8 posterSquareCornerRadius];
  objc_msgSend(v6, "setCornerRadius:");
  [v8 posterSubitemCornerRadius];
  objc_msgSend(v6, "setSubitemCornerRadius:");
  uint64_t v23 = [v8 shouldUseTableView] ^ 1;
  uint64_t v24 = +[PUInterfaceManager currentTheme];
  char v25 = [v24 albumCornersBackgroundColor];
  [v6 setHasRoundedCorners:v23 withCornersBackgroundColor:v25];

  uint64_t v26 = [v6 tag] + 1;
  [v6 setTag:v26];
  uint64_t v27 = [v8 collageImageContentMode];
  [v8 collageImageSize];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __58__PUAlbumListViewController__updateCollageView_forAssets___block_invoke;
  void v31[3] = &unk_1E5F231F0;
  id v32 = v6;
  double v33 = self;
  uint64_t v34 = v28;
  uint64_t v35 = v29;
  uint64_t v36 = v27;
  uint64_t v37 = v26;
  id v30 = v6;
  [v7 enumerateObjectsUsingBlock:v31];
}

void __58__PUAlbumListViewController__updateCollageView_forAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", a3, (double)(unint64_t)objc_msgSend(v5, "pixelWidth"), (double)(unint64_t)objc_msgSend(v5, "pixelHeight"));
  id v6 = [*(id *)(a1 + 40) _imageRequestOptions];
  id v7 = [*(id *)(a1 + 40) _cachingImageManager];
  uint64_t v8 = *(void *)(a1 + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __58__PUAlbumListViewController__updateCollageView_forAssets___block_invoke_2;
  v11[3] = &unk_1E5F23178;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 72);
  id v12 = v9;
  uint64_t v13 = v10;
  uint64_t v14 = a3;
  objc_msgSend(v7, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, v8, v6, v11, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __58__PUAlbumListViewController__updateCollageView_forAssets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && [*(id *)(a1 + 32) tag] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) setImage:v6 forItemAtIndex:*(void *)(a1 + 48)];
  }
}

- (void)_updateStackView:(id)a3 forFaces:(id)a4 inCollection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  -[PUAlbumListViewController _prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:](self, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", v10, v12, [v13 count], v11);

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__PUAlbumListViewController__updateStackView_forFaces_inCollection_withCustomEmptyPlaceholderImage___block_invoke;
  v21[3] = &unk_1E5F231C8;
  id v22 = v10;
  id v14 = v10;
  [v13 enumerateObjectsUsingBlock:v21];

  long long v15 = *(_OWORD *)(MEMORY[0x1E4F91308] + 16);
  v20[0] = *MEMORY[0x1E4F91308];
  v20[1] = v15;
  [v14 setBadgeInfo:v20 forItemAtIndex:0];
  double v16 = [(PUAlbumListViewController *)self spec];
  uint64_t v17 = [v16 shouldUseTableView] ^ 1;
  double v18 = +[PUInterfaceManager currentTheme];
  double v19 = [v18 albumCornersBackgroundColor];
  [v14 setHasRoundedCorners:v17 withCornersBackgroundColor:v19];
}

void __100__PUAlbumListViewController__updateStackView_forFaces_inCollection_withCustomEmptyPlaceholderImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 size];
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", a3);
  [*(id *)(a1 + 32) setImage:v5 forItemAtIndex:a3];
}

- (void)_updateStackView:(id)a3 forAssets:(id)a4 collection:(id)a5 withCustomEmptyPlaceholderImage:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  -[PUAlbumListViewController _prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:](self, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", v10, v11, [v13 count], v12);

  uint64_t v14 = [v10 tag] + 1;
  [v10 setTag:v14];
  long long v15 = [(PUAlbumListViewController *)self spec];
  uint64_t v16 = [v15 imageContentMode];

  uint64_t v17 = [(PUAlbumListViewController *)self spec];
  [(PUAlbumListViewController *)self _layoutReferenceSize];
  double v19 = v18;
  double v21 = v20;
  [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
  objc_msgSend(v17, "imageSizeForLayoutReferenceSize:safeAreaInsets:", v19, v21, v22, v23, v24, v25);
  uint64_t v27 = v26;
  uint64_t v29 = v28;

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __99__PUAlbumListViewController__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke;
  v43[3] = &unk_1E5F231A0;
  id v44 = v10;
  id v30 = v11;
  id v45 = v30;
  double v46 = self;
  uint64_t v47 = v27;
  uint64_t v48 = v29;
  uint64_t v49 = v16;
  uint64_t v50 = v14;
  id v31 = v10;
  [v13 enumerateObjectsUsingBlock:v43];

  id v32 = [(PUAlbumListViewController *)self spec];
  int v33 = [v32 shouldUseTableView];

  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v34 = [(PUAlbumListViewController *)self _badgeManager];
  uint64_t v35 = v34;
  if (v34)
  {
    [v34 badgeInfoForCollection:v30 options:0];
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
  }

  if (v33) {
    uint64_t v36 = 1;
  }
  else {
    uint64_t v36 = 2;
  }
  v40[0] = v41;
  v40[1] = v42;
  [v31 setBadgeInfo:v40 style:v36 forItemAtIndex:0];
  uint64_t v37 = v33 ^ 1u;
  double v38 = +[PUInterfaceManager currentTheme];
  double v39 = [v38 albumCornersBackgroundColor];
  [v31 setHasRoundedCorners:v37 withCornersBackgroundColor:v39];
}

void __99__PUAlbumListViewController__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", a3, (double)(unint64_t)objc_msgSend(v5, "pixelWidth"), (double)(unint64_t)objc_msgSend(v5, "pixelHeight"));
  if (!a3
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [*(id *)(a1 + 40) assetCollectionSubtype] == 4)
  {
    id v6 = [MEMORY[0x1E4F38EE8] posterImageForAssetCollection:*(void *)(a1 + 40)];
    id v7 = v6;
    if (v6)
    {
      [v6 size];
      objc_msgSend(*(id *)(a1 + 32), "setImageSize:forItemAtIndex:", 0);
      [*(id *)(a1 + 32) setImage:v7 forItemAtIndex:0];
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 48) _imageRequestOptions];
    id v9 = [*(id *)(a1 + 48) _cachingImageManager];
    uint64_t v10 = *(void *)(a1 + 72);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__PUAlbumListViewController__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke_2;
    v13[3] = &unk_1E5F23178;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 80);
    id v14 = v11;
    uint64_t v15 = v12;
    uint64_t v16 = a3;
    objc_msgSend(v9, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, v10, v8, v13, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
}

void __99__PUAlbumListViewController__updateStackView_forAssets_collection_withCustomEmptyPlaceholderImage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (v6 && [*(id *)(a1 + 32) tag] == *(void *)(a1 + 40)) {
    [*(id *)(a1 + 32) setImage:v6 forItemAtIndex:*(void *)(a1 + 48)];
  }
}

- (void)_prepareStackView:(id)a3 forCollection:(id)a4 withStackCount:(int64_t)a5 withCustomEmptyPlaceHolderImage:(id)a6
{
  id v47 = a3;
  unint64_t v10 = (unint64_t)a6;
  id v11 = a4;
  unint64_t v12 = [(PUAlbumListViewController *)self _stackViewStyleForCollection:v11];
  [v47 setStyle:v12];
  id v13 = [(PUAlbumListViewController *)self spec];
  id v14 = v13;
  if (v12 - 3 > 1)
  {
    if (v12 == 6)
    {
      [v47 setGridItemSpacing:4.0];
    }
    else if (v12 == 5)
    {
      uint64_t v15 = +[PUInterfaceManager currentTheme];
      uint64_t v16 = [v15 placeholderCellBackgroundColor];
      [v47 setGridBackgroundColor:v16];
    }
  }
  else
  {
    [v13 configureStackViewWithGridStyle:v47];
  }
  if ([v14 shouldUseTableView])
  {
    if (a5) {
      [v14 stackPhotoDecoration];
    }
    else {
    uint64_t v17 = [v14 emptyStackPhotoDecoration];
    }
    [v14 stackOffset];
    double v25 = v26;
    double v24 = v27;
    [v14 stackPerspectiveInsets];
    double v20 = v28;
    double v21 = v29;
    double v22 = v30;
    double v23 = v31;
    [v14 stackPerspectiveOffset];
    double v18 = v32;
    double v19 = v33;
  }
  else
  {
    uint64_t v17 = 0;
    double v18 = *MEMORY[0x1E4FB2E10];
    double v19 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
    double v20 = *MEMORY[0x1E4FB2848];
    double v21 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v22 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v23 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v24 = v19;
    double v25 = *MEMORY[0x1E4FB2E10];
  }
  [v47 setPhotoDecoration:v17];
  objc_msgSend(v47, "setStackOffset:", v25, v24);
  objc_msgSend(v47, "setStackPerspectiveInsets:", v20, v21, v22, v23);
  objc_msgSend(v47, "setStackPerspectiveOffset:", v18, v19);
  [(PUAlbumListViewController *)self _layoutReferenceSize];
  double v35 = v34;
  double v37 = v36;
  [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
  objc_msgSend(v14, "stackSizeForLayoutReferenceSize:safeAreaInsets:", v35, v37, v38, v39, v40, v41);
  objc_msgSend(v47, "setStackSize:");
  [v14 posterSquareCornerRadius];
  objc_msgSend(v47, "setPosterSquareCornerRadius:");
  [v14 posterSubitemCornerRadius];
  objc_msgSend(v47, "setPosterSubitemCornerRadius:");
  int64_t v42 = +[PUStackView maximumNumberOfVisibleItemsForStyle:v12];
  if (v42 >= a5) {
    int64_t v43 = a5;
  }
  else {
    int64_t v43 = v42;
  }
  if (v43 <= 1) {
    int64_t v43 = 1;
  }
  if (v12 == 3) {
    int64_t v44 = v42;
  }
  else {
    int64_t v44 = v43;
  }
  [v47 setNumberOfVisibleItems:v44];
  [v47 setEmpty:(a5 | v10) == 0];
  int v45 = objc_msgSend(v11, "px_isFolder");

  if (v45) {
    unint64_t v46 = 0;
  }
  else {
    unint64_t v46 = v10;
  }
  [v47 setEmptyPlaceholderImage:v46];
}

- (id)_keyAssetsForMoments
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  keyAssetsForMoments = self->_keyAssetsForMoments;
  if (!keyAssetsForMoments)
  {
    unint64_t v4 = +[PUStackView maximumNumberOfVisibleImagesForStyle:4];
    id v5 = objc_msgSend(MEMORY[0x1E4F390A0], "px_standardFetchOptions");
    [v5 setFetchLimit:v4];
    [v5 setReverseSortOrder:1];
    double v22 = v5;
    id v6 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v5];
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    double v23 = self;
    uint64_t v8 = [(PUAlbumListViewController *)self _assetsFetchOptions];
    [v8 setFetchLimit:v4];
    [v8 setReverseSortOrder:1];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v30;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(*((void *)&v29 + 1) + 8 * v12) options:v8];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v26;
LABEL_9:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            [(NSArray *)v7 addObject:*(void *)(*((void *)&v25 + 1) + 8 * v18)];
            if ([(NSArray *)v7 count] >= v4) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v16) {
                goto LABEL_9;
              }
              break;
            }
          }
        }

        unint64_t v19 = [(NSArray *)v7 count];
        if (v19 >= v4) {
          break;
        }
        if (++v12 == v10)
        {
          uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    double v20 = v23->_keyAssetsForMoments;
    v23->_keyAssetsForMoments = v7;

    keyAssetsForMoments = v23->_keyAssetsForMoments;
  }
  return keyAssetsForMoments;
}

- (void)updatePlaceholderListCellContentView:(id)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v61 = a5;
  id v8 = a3;
  uint64_t v73 = 0;
  char v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__7833;
  v77 = __Block_byref_object_dispose__7834;
  id v78 = 0;
  id v60 = a4;
  int64_t v9 = -[PUAlbumListViewController placeholderKindAtIndexPath:](self, "placeholderKindAtIndexPath:");
  uint64_t v10 = [v8 stackView];
  uint64_t v11 = (void *)v10;
  switch(v9)
  {
    case 0:
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:1230 description:@"undefined placeholder"];
      id v13 = 0;
      id v14 = 0;
      uint64_t v15 = 0;
      goto LABEL_34;
    case 1:
      if ([(PUAlbumListViewController *)self isRootSharedAlbumList])
      {
        PULocalizedString(@"ALBUM_LIST_CREATE_NEW_SHARED_ALBUM_PLACEHOLDER_TITLE");
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        long long v26 = [(PUAlbumListViewController *)self spec];
        long long v27 = [v8 window];
        [v26 emptySharedAlbumPlaceholderImageForWindow:v27];
      }
      else
      {
        PULocalizedString(@"ALBUM_LIST_CREATE_NEW_ALBUM_PLACEHOLDER_TITLE");
        uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        long long v26 = [(PUAlbumListViewController *)self spec];
        long long v27 = [v8 window];
        [v26 emptyAlbumPlaceholderImageForWindow:v27];
      }
      id v12 = (id)objc_claimAutoreleasedReturnValue();

      [(PUAlbumListViewController *)self _updateStackView:v11 forAssets:0 collection:0 withCustomEmptyPlaceholderImage:v12];
      [v8 setCustomImageView:0];
      id v13 = 0;
      id v14 = 0;
      goto LABEL_34;
    case 2:
      uint64_t v17 = [(PUAlbumListViewController *)self spec];
      int v18 = [v17 shouldUseCollageForCloudFeedPlaceholder];

      long long v71 = 0u;
      long long v72 = 0u;
      unint64_t v19 = [(PUAlbumListViewController *)self dataSource];
      double v20 = v19;
      if (v19)
      {
        [v19 firstItemIndexPath];
      }
      else
      {
        long long v71 = 0u;
        long long v72 = 0u;
      }

      if ((void)v71 == *MEMORY[0x1E4F91310]) {
        goto LABEL_26;
      }
      int v45 = [(PUAlbumListViewController *)self dataSource];
      *(_OWORD *)id location = v71;
      long long v70 = v72;
      id v12 = [v45 objectAtIndexPath:location];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v12)
        {
          if (!v18)
          {
            unint64_t v46 = [(PUAlbumListViewController *)self _visibleAssetsForCollection:v12];
            goto LABEL_32;
          }
          unint64_t v46 = [(PUAlbumListViewController *)self _visibleAssetsForCollection:v12 maximumNumberOfVisibleAssets:+[PUCollageView maximumNumberOfItems] correspondingCollections:0];
          goto LABEL_27;
        }
      }
      else
      {
      }
LABEL_26:
      unint64_t v46 = 0;
      id v12 = 0;
      if (!v18)
      {
LABEL_32:
        id v51 = v11;
        uint64_t v52 = [(PUAlbumListViewController *)self spec];
        id v53 = [v8 window];
        v54 = [v52 emptyAlbumPlaceholderImageForWindow:v53];

        [(PUAlbumListViewController *)self _updateStackView:v51 forAssets:v46 collection:0 withCustomEmptyPlaceholderImage:v54];
        [v8 setCustomImageView:0];

        uint64_t v11 = v51;
        goto LABEL_33;
      }
LABEL_27:
      if (![v46 count]) {
        goto LABEL_32;
      }
      aggregateCollageView = self->_aggregateCollageView;
      if (!aggregateCollageView)
      {
        uint64_t v48 = [PUCollageView alloc];
        uint64_t v49 = -[PUCollageView initWithFrame:](v48, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        uint64_t v50 = self->_aggregateCollageView;
        self->_aggregateCollageView = v49;

        aggregateCollageView = self->_aggregateCollageView;
      }
      [(PUAlbumListViewController *)self _updateCollageView:aggregateCollageView forAssets:v46];
      [v8 setCustomImageView:self->_aggregateCollageView];
LABEL_33:
      PULocalizedString(@"ALL_PHOTOS_IN_FOLDER");
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v13 = 0;
      id v14 = 0;
LABEL_34:

LABEL_35:
      id v55 = [(PUAlbumListViewController *)self spec];
      objc_msgSend(v8, "setLayout:", objc_msgSend(v55, "cellContentViewLayout"));

      [v8 setTitle:v15];
      [v8 setSubtitle:v74[5]];
      [v8 setEditCapabilities:0];
      objc_msgSend(v8, "setEditing:animated:", -[PUAlbumListViewController isEditing](self, "isEditing"), v61);
      [v8 setEnabled:1 animated:v61];
      [v8 setTitleFont:v14];
      [v8 setSubtitleFont:v13];

      _Block_object_dispose(&v73, 8);
      return;
    case 3:
      double v21 = (void *)v10;
      id v12 = [(PUAlbumListViewController *)self _keyAssetsForMoments];
      double v22 = [(PUAlbumListViewController *)self spec];
      double v23 = [v8 window];
      double v24 = [v22 emptyAlbumPlaceholderImageForWindow:v23];

      [(PUAlbumListViewController *)self _updateStackView:v21 forAssets:v12 collection:0 withCustomEmptyPlaceholderImage:v24];
      [v8 setCustomImageView:0];
      PULocalizedString(@"ALL_PHOTOS_IN_LIBRARY");
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      long long v25 = [(PUAlbumListViewController *)self _fontManager];
      id v14 = [v25 albumListTitleLabelFont];

      id v13 = 0;
      goto LABEL_11;
    case 4:
      uint64_t v56 = [MEMORY[0x1E4F28B00] currentHandler];
      [v56 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:1296 description:@"Code which should be unreachable has been reached"];

      abort();
    case 5:
      PULocalizedString(@"PLACES_ALBUM_TITLE");
      uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [(PUAlbumListViewController *)self collectionAtIndexPath:v60];
      uint64_t v58 = v16;
      if (objc_msgSend(v16, "px_isPlacesSmartAlbum")) {
        id v12 = v16;
      }
      else {
        id v12 = 0;
      }
      long long v30 = (void *)([v11 tag] + 1);
      [v11 setTag:v30];
      objc_initWeak(location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke;
      aBlock[3] = &unk_1E5F23128;
      id v31 = v11;
      id v65 = v31;
      v68[1] = v30;
      objc_copyWeak(v68, location);
      id v66 = v8;
      id v67 = &v73;
      long long v32 = _Block_copy(aBlock);
      v59 = [(PUAlbumListViewController *)self px_extendedTraitCollection];
      if (!self->__placesAlbumCoverProvider)
      {
        double v33 = (PXPlacesAlbumCoverProvider *)[objc_alloc(MEMORY[0x1E4F905C0]) initWithDelegate:self andPlacesCollection:v12];
        placesAlbumCoverProvider = self->__placesAlbumCoverProvider;
        self->__placesAlbumCoverProvider = v33;
      }
      uint64_t v35 = [(PUAlbumListViewController *)self _placesAlbumCoverProvider];
      double v36 = [v31 traitCollection];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_2;
      v62[3] = &unk_1E5F23150;
      id v37 = v32;
      id v63 = v37;
      [v35 requestPlacesAlbumCover:v59 snapshotTraitCollection:v36 completion:v62];

      long long v38 = *(_OWORD *)(MEMORY[0x1E4F91308] + 16);
      long long v71 = *MEMORY[0x1E4F91308];
      long long v72 = v38;
      [v31 setBadgeInfo:&v71 forItemAtIndex:0];
      double v39 = [(PUAlbumListViewController *)self spec];
      int v40 = [v39 shouldUseTableView];
      double v41 = +[PUInterfaceManager currentTheme];
      int64_t v42 = [v41 albumCornersBackgroundColor];
      [v31 setHasRoundedCorners:v40 ^ 1u withCornersBackgroundColor:v42];

      int64_t v43 = [(PUAlbumListViewController *)self _fontManager];
      id v14 = [v43 albumListTitleLabelFont];

      int64_t v44 = [(PUAlbumListViewController *)self _fontManager];
      id v13 = [v44 albumListSubtitleLabelFont];

      objc_destroyWeak(v68);
      objc_destroyWeak(location);

      uint64_t v11 = v57;
      goto LABEL_34;
    case 6:
      double v21 = (void *)v10;
      long long v28 = [(PUAlbumListViewController *)self spec];
      long long v29 = [v8 window];
      id v12 = [v28 emptyAlbumPlaceholderImageForWindow:v29];

      [(PUAlbumListViewController *)self _updateStackView:v21 forAssets:0 collection:0 withCustomEmptyPlaceholderImage:v12];
      [v8 setCustomImageView:0];
      id v13 = 0;
      id v14 = 0;
      uint64_t v15 = @"Memories";
LABEL_11:
      uint64_t v11 = v21;
      goto LABEL_34;
    default:
      id v13 = 0;
      id v14 = 0;
      uint64_t v15 = 0;
      goto LABEL_35;
  }
}

void __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v18 = a2;
  if ([*(id *)(a1 + 32) tag] == *(void *)(a1 + 64))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = WeakRetained;
    if (v18)
    {
      objc_msgSend(WeakRetained, "_prepareStackView:forCollection:withStackCount:withCustomEmptyPlaceHolderImage:", *(void *)(a1 + 32), 0, 0);
    }
    else
    {
      id v7 = [WeakRetained spec];
      id v8 = [*(id *)(a1 + 40) window];
      uint64_t v9 = [v7 emptyAlbumPlaceholderImageForWindow:v8];

      id v10 = objc_loadWeakRetained((id *)(a1 + 56));
      [v10 _prepareStackView:*(void *)(a1 + 32) forCollection:0 withStackCount:0 withCustomEmptyPlaceHolderImage:v9];

      id v6 = (void *)v9;
    }

    [*(id *)(a1 + 40) setCustomImageView:0];
    if (a3)
    {
      uint64_t v11 = PLSharedCountFormatter();
      id v12 = [NSNumber numberWithInteger:a3];
      uint64_t v13 = [v11 stringFromNumber:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v17 = @" ";
      uint64_t v11 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = @" ";
    }

    [*(id *)(a1 + 40) setSubtitle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

void __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  id v12 = *(id *)(a1 + 32);
  uint64_t v11 = v8;
  id v9 = v8;
  id v10 = v7;
  px_dispatch_on_main_queue();
}

uint64_t __94__PUAlbumListViewController_updatePlaceholderListCellContentView_forItemAtIndexPath_animated___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[7], a1[5]);
}

- (void)setTitleForCell:(id)a3 withCollection:(id)a4
{
  id v5 = a3;
  id v6 = [a4 localizedTitle];
  [v5 setTitle:v6];
}

- (void)updateAlbumListCellContentView:(id)a3 forItemAtIndexPath:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(PUAlbumListViewController *)self collectionAtIndexPath:a4];
  objc_msgSend(v8, "setEditCapabilities:animated:", -[PUAlbumListViewController _editCapabilitiesForAlbum:](self, "_editCapabilitiesForAlbum:", v9), v5);
  objc_msgSend(v8, "setEnabled:animated:", -[PUAlbumListViewController shouldEnableCollection:](self, "shouldEnableCollection:", v9), v5);
  id v10 = [(PUAlbumListViewController *)self spec];
  uint64_t v11 = [v10 cellContentViewLayout];

  [v8 setLayout:v11];
  id v12 = [(PUAlbumListViewController *)self sessionInfo];
  if ([v12 showCheckmarkOnSourceAlbum])
  {
    uint64_t v13 = [v12 sourceAlbum];
    objc_msgSend(v8, "setShowsCheckmarkView:", objc_msgSend(v13, "isEqual:", v9));
  }
  else
  {
    [v8 setShowsCheckmarkView:0];
  }
  uint64_t v14 = [v8 stackView];
  id v32 = 0;
  uint64_t v15 = [(PUAlbumListViewController *)self _visibleAssetsForCollection:v9 correspondingCollections:&v32];
  id v16 = v32;
  if (v15)
  {
    uint64_t v17 = [v15 count];
    if ((objc_msgSend(v9, "px_isMacSyncedFacesFolder") & 1) == 0)
    {
      if (v17)
      {
        id v29 = v16;
        id v18 = 0;
        -[PUAlbumListViewController _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v14, v15, v9, 0, v29);
LABEL_14:

        id v16 = v30;
        goto LABEL_15;
      }
LABEL_10:
      unint64_t v19 = [(PUAlbumListViewController *)self spec];
      int v20 = objc_msgSend(v9, "px_isSharedAlbum");
      double v21 = [v8 window];
      if (v20) {
        [v19 emptySharedAlbumPlaceholderImageForWindow:v21];
      }
      else {
      id v18 = [v19 emptyAlbumPlaceholderImageForWindow:v21];
      }

      -[PUAlbumListViewController _updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:](self, "_updateStackView:forAssets:collection:withCustomEmptyPlaceholderImage:", v14, v15, v9, v18, v31);
      goto LABEL_14;
    }
  }
  else if (!objc_msgSend(v9, "px_isMacSyncedFacesFolder"))
  {
    goto LABEL_10;
  }
  [(PUAlbumListViewController *)self _updateStackView:v14 forFaces:v15 inCollection:v9 withCustomEmptyPlaceholderImage:0];
LABEL_15:
  double v22 = [(PUAlbumListViewController *)self spec];
  uint64_t v23 = [v22 showsDeleteButtonOnCellContentView];

  [v8 setShowsDeleteButtonWhenEditing:v23];
  objc_msgSend(v8, "setEditing:animated:", -[PUAlbumListViewController isEditing](self, "isEditing"), v5);
  [(PUAlbumListViewController *)self setTitleForCell:v8 withCollection:v9];
  double v24 = [(PUAlbumListViewController *)self subtitleForCollection:v9];
  [v8 setSubtitle:v24 animated:v5];
  long long v25 = [(PUAlbumListViewController *)self _fontManager];
  long long v26 = [v25 albumListTitleLabelFont];
  [v8 setTitleFont:v26];

  long long v27 = [(PUAlbumListViewController *)self _fontManager];
  long long v28 = [v27 albumListSubtitleLabelFont];
  [v8 setSubtitleFont:v28];
}

- (void)updateListCellForItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (-[PUAlbumListViewController isPlaceholderAtIndexPath:](self, "isPlaceholderAtIndexPath:"))
  {
    id v6 = [(PUAlbumListViewController *)self _preparedPlaceholderListCellContentViewAtIndexPath:v7];
    if (v6) {
      [(PUAlbumListViewController *)self updatePlaceholderListCellContentView:v6 forItemAtIndexPath:v7 animated:v4];
    }
  }
  else
  {
    id v6 = [(PUAlbumListViewController *)self _preparedAlbumListCellContentViewAtIndexPath:v7];
    if (v6) {
      [(PUAlbumListViewController *)self updateAlbumListCellContentView:v6 forItemAtIndexPath:v7 animated:v4];
    }
  }
}

- (void)_updateAddNewAlbumPlaceholderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PUAlbumListViewController *)self sessionInfo];
  if ([v10 isSelectingTargetAlbum]
    && ![(PUAlbumListViewController *)self _aboutToCreateAlbum])
  {
    int v5 = [v10 excludesNewAlbumCreation] ^ 1;
  }
  else
  {
    int v5 = 0;
  }
  if (self->_showAddNewAlbumPlaceholder != v5)
  {
    id v6 = [(PUAlbumListViewController *)self indexPathForAddNewAlbumPlaceholder];
    self->_showAddNewAlbumPlaceholder = v5;
    id v7 = [(PUAlbumListViewController *)self indexPathForAddNewAlbumPlaceholder];
    if (v6 == v7
      || ([v6 isEqual:v7] & 1) != 0
      || ![(PUAlbumListViewController *)self isViewInSyncWithModel])
    {
      goto LABEL_17;
    }
    if (!v3)
    {
      [(PUAlbumListViewController *)self reloadContentView];
LABEL_17:

      goto LABEL_18;
    }
    if (v6)
    {
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
      if (v7)
      {
LABEL_12:
        id v9 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
LABEL_16:
        [(PUAlbumListViewController *)self _performBatchUpdates:0 withDeletedSections:0 insertedSections:0 changedSections:0 deletedItemsIndexPaths:v8 insertedItemsIndexPaths:v9 changedItemsIndexPaths:0 movedItemsFromIndexPaths:0 movedItemsToIndexPaths:0 completionHandler:0];

        goto LABEL_17;
      }
    }
    else
    {
      id v8 = 0;
      if (v7) {
        goto LABEL_12;
      }
    }
    id v9 = 0;
    goto LABEL_16;
  }
LABEL_18:
}

- (BOOL)showAddNewAlbumPlaceholder
{
  return self->_showAddNewAlbumPlaceholder;
}

- (void)_updateEmptyPlaceholder
{
  if ([(PUAlbumListViewController *)self isViewLoaded])
  {
    if ([(PUAlbumListViewController *)self isEmpty]
      && [(PUAlbumListViewController *)self showsEmptyPlaceholderWhenEmpty])
    {
      BOOL v3 = [(PUAlbumListViewController *)self dataSourceManager];
      id v11 = [v3 collectionList];

      if (objc_msgSend(v11, "px_isFolder")
        && (objc_msgSend(v11, "px_isSmartFolder") & 1) == 0
        && ![(PUAlbumListViewController *)self isRootFolder])
      {
        [(PUAlbumListViewController *)self isRootSharedAlbumList];
      }
      BOOL v4 = [(PUAlbumListViewController *)self dataSourceManager];
      int v5 = [MEMORY[0x1E4FB1658] emptyConfiguration];
      id v6 = [v4 collectionsFetchResult];
      id v7 = PXPhotoKitLocalizedTitleForEmptyCollectionListFetchResult();
      [v5 setText:v7];

      id v8 = [v4 collectionsFetchResult];
      id v9 = PXPhotoKitLocalizedMessageForEmptyCollectionListFetchResult();
      id v10 = [v9 string];
      [v5 setSecondaryText:v10];

      [(PUAlbumListViewController *)self _setContentUnavailableConfiguration:v5];
    }
    else
    {
      [(PUAlbumListViewController *)self _setContentUnavailableConfiguration:0];
    }
  }
}

- (void)_updateNavigationBannerAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int v5 = [(PUAlbumListViewController *)self sessionInfo];
  id v6 = [(PUAlbumListViewController *)self _pickerBannerView];
  if (v6)
  {
    if ([v5 promptLocation] == 1)
    {
      id v7 = [v5 localizedPrompt];
    }
    else
    {
      id v7 = 0;
    }
    if ([v5 isSelectingTargetAlbum])
    {
      id v8 = [v5 transferredAssets];
    }
    else
    {
      id v8 = 0;
    }
    if ([v8 count])
    {
      double v22 = v7;
      unsigned int v23 = v3;
      double v24 = v5;
      id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      double v21 = v8;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v26;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
            id v16 = objc_msgSend(MEMORY[0x1E4F8B918], "defaultFormatChooser", v21);
            uint64_t v17 = [v16 indexSheetUnbakedFormat];
            id v18 = objc_msgSend(v15, "imageWithFormat:", objc_msgSend(v17, "formatID"));

            if (v18) {
              [v9 addObject:v18];
            }

            ++v14;
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v12);
      }

      if ([v9 count]) {
        unint64_t v19 = v9;
      }
      else {
        unint64_t v19 = 0;
      }
      id v20 = v19;

      int v5 = v24;
      uint64_t v3 = v23;
      id v8 = v21;
      id v7 = v22;
    }
    else
    {
      id v20 = 0;
    }
    objc_msgSend(v6, "setTitle:", v7, v21);
    [v6 setImages:v20];
    [v6 setLeftView:0 animated:v3];
    [v6 setRightView:0 animated:v3];
  }
}

- (id)_pickerBannerView
{
  id v2 = [(PUAlbumListViewController *)self navigationItem];
  uint64_t v3 = objc_msgSend(v2, "pu_banner");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 bannerView];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_updatePeripheralInterfaceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUAlbumListViewController *)self _updateEmptyPlaceholder];
  [(PUAlbumListViewController *)self updateNavigationBarAnimated:v3];
  [(PUAlbumListViewController *)self _updateNavigationBannerAnimated:v3];
}

- (BOOL)canShowSyncProgress
{
  return 1;
}

- (id)_preparedAlbumListCellContentViewAtIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(PUAlbumListViewController *)self _mainCollectionView];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 cellForItemAtIndexPath:v4];
      id v8 = [v7 albumListCellContentView];
    }
    else
    {
      id v8 = 0;
    }
    id v9 = [(PUAlbumListViewController *)self _mainTableView];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 cellForRowAtIndexPath:v4];
      uint64_t v12 = [v11 viewWithTag:236897];

      id v8 = (void *)v12;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)indexPathForAlbumListCellContentView:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  int v5 = [(PUAlbumListViewController *)self _mainCollectionView];
  id v6 = [v5 visibleCells];

  id v7 = (void *)[v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        if ([v4 isDescendantOfView:v10])
        {
          uint64_t v11 = [(PUAlbumListViewController *)self _mainCollectionView];
          id v7 = [v11 indexPathForCell:v10];

          goto LABEL_11;
        }
      }
      id v7 = (void *)[v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = [(PUAlbumListViewController *)self _mainTableView];
  uint64_t v13 = [v12 visibleCells];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * j);
        if ([v4 isDescendantOfView:v18])
        {
          unint64_t v19 = [(PUAlbumListViewController *)self _mainTableView];
          uint64_t v20 = [v19 indexPathForCell:v18];

          id v7 = (void *)v20;
          goto LABEL_21;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  return v7;
}

- (id)indexPathsForItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(PUAlbumListViewController *)self _mainCollectionView];
  if (v8)
  {
    id v9 = [(PUAlbumListViewController *)self _mainCollectionViewLayout];
    objc_msgSend(v9, "assetIndexPathsForElementsInRect:", x, y, width, height);
  }
  else
  {
    id v9 = [(PUAlbumListViewController *)self _mainTableView];
    objc_msgSend(v9, "indexPathsForRowsInRect:", x, y, width, height);
  uint64_t v10 = };

  return v10;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PUAlbumListViewController *)self _mainCollectionView];
  if (v6)
  {
    id v7 = [(PUAlbumListViewController *)self _mainCollectionView];
    objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);
  }
  else
  {
    id v7 = [(PUAlbumListViewController *)self _mainTableView];
    objc_msgSend(v7, "indexPathForRowAtPoint:", x, y);
  uint64_t v8 = };

  return v8;
}

- (id)indexPathsForVisibleItems
{
  BOOL v3 = [(PUAlbumListViewController *)self _mainCollectionView];
  if (v3)
  {
    id v4 = [(PUAlbumListViewController *)self _mainCollectionView];
    [v4 indexPathsForVisibleItems];
  }
  else
  {
    id v4 = [(PUAlbumListViewController *)self _mainTableView];
    [v4 indexPathsForVisibleRows];
  int v5 = };

  return v5;
}

- (void)_enumerateIndexPathsForPreparedItemsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  int v5 = [(PUAlbumListViewController *)self _mainCollectionView];
  uint64_t v6 = [v5 isPrefetchingEnabled];
  [v5 setPrefetchingEnabled:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [(PUAlbumListViewController *)self indexPathsForVisibleItems];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [v5 setPrefetchingEnabled:v6];
}

- (void)_performBatchUpdates:(id)a3 withDeletedSections:(id)a4 insertedSections:(id)a5 changedSections:(id)a6 deletedItemsIndexPaths:(id)a7 insertedItemsIndexPaths:(id)a8 changedItemsIndexPaths:(id)a9 movedItemsFromIndexPaths:(id)a10 movedItemsToIndexPaths:(id)a11 completionHandler:(id)a12
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = (void (**)(void))a3;
  id v18 = a4;
  id v19 = a5;
  id v48 = a6;
  id v20 = a7;
  id v50 = a8;
  id v53 = a9;
  id v51 = a10;
  id v21 = a11;
  id v22 = a12;
  if ([v18 count])
  {
    char v23 = 1;
    long long v24 = v52;
LABEL_5:
    long long v25 = v50;
    goto LABEL_6;
  }
  long long v24 = v52;
  if ([v19 count])
  {
    char v23 = 1;
    goto LABEL_5;
  }
  long long v25 = v50;
  if ([v48 count]
    || [v20 count]
    || [v50 count]
    || [v51 count]
    || [v21 count])
  {
    char v23 = 1;
  }
  else
  {
    if (![v53 count]) {
      goto LABEL_52;
    }
    char v23 = 0;
  }
LABEL_6:
  uint64_t v49 = [(PUAlbumListViewController *)self _mainCollectionView];
  if (v49)
  {
    if (v23)
    {
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke;
      v65[3] = &unk_1E5F230F8;
      v65[4] = self;
      uint64_t v73 = v24;
      id v66 = v49;
      id v67 = v18;
      id v68 = v19;
      id v69 = v20;
      id v70 = v25;
      id v71 = v51;
      id v72 = v21;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_3;
      v61[3] = &unk_1E5F2AFC8;
      id v62 = v53;
      id v63 = self;
      id v64 = v22;
      long long v24 = v52;
      [v66 performBatchUpdates:v65 completion:v61];
    }
    else
    {
      id v46 = v21;
      id v26 = v20;
      id v27 = v19;
      if (v24) {
        v24[2](v24);
      }
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v28 = v53;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v74 objects:v79 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v75;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v75 != v31) {
              objc_enumerationMutation(v28);
            }
            [(PUAlbumListViewController *)self updateListCellForItemAtIndexPath:*(void *)(*((void *)&v74 + 1) + 8 * i) animated:1];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v74 objects:v79 count:16];
        }
        while (v30);
      }

      id v19 = v27;
      id v20 = v26;
      long long v24 = v52;
      id v21 = v46;
      if (v22) {
        (*((void (**)(id, uint64_t))v22 + 2))(v22, 1);
      }
    }
  }
  double v33 = [(PUAlbumListViewController *)self _mainTableView];
  if (!v33) {
    goto LABEL_51;
  }
  uint64_t v34 = [(PUAlbumListViewController *)self _ignoredReorderNotificationCount];
  uint64_t v35 = v34 - 1;
  if (v34 >= 1 && ![v20 count] && !objc_msgSend(v25, "count") && !objc_msgSend(v53, "count"))
  {
    [(PUAlbumListViewController *)self _setIgnoredReorderNotificationCount:v35];
    if (!v22) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  if (v24)
  {
    [v33 beginUpdates];
    v24[2](v24);
  }
  else
  {
    if (![v20 count]
      && ![v25 count]
      && ![v51 count]
      && ![v18 count]
      && ![v19 count])
    {
      goto LABEL_42;
    }
    [v33 beginUpdates];
  }
  if ([v18 count]) {
    [v33 deleteSections:v18 withRowAnimation:0];
  }
  if ([v19 count]) {
    [v33 insertSections:v19 withRowAnimation:0];
  }
  if ([v20 count]) {
    [v33 deleteRowsAtIndexPaths:v20 withRowAnimation:0];
  }
  if ([v25 count]) {
    [v33 insertRowsAtIndexPaths:v25 withRowAnimation:0];
  }
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_4;
  v58[3] = &unk_1E5F230D0;
  id v59 = v21;
  id v36 = v33;
  id v60 = v36;
  [v51 enumerateObjectsUsingBlock:v58];
  [v36 endUpdates];

LABEL_42:
  id v47 = v22;
  id v37 = v21;
  id v38 = v20;
  id v39 = v18;
  id v40 = v19;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v41 = v53;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v78 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v55;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v55 != v44) {
          objc_enumerationMutation(v41);
        }
        [(PUAlbumListViewController *)self updateListCellForItemAtIndexPath:*(void *)(*((void *)&v54 + 1) + 8 * j) animated:1];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v54 objects:v78 count:16];
    }
    while (v43);
  }

  id v19 = v40;
  id v18 = v39;
  id v20 = v38;
  long long v25 = v50;
  long long v24 = v52;
  id v21 = v37;
  id v22 = v47;
  if (!v47) {
    goto LABEL_51;
  }
LABEL_50:
  (*((void (**)(id, uint64_t))v22 + 2))(v22, 1);
LABEL_51:

LABEL_52:
}

void __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) indexPathForAggregateItem];
  uint64_t v3 = *(void *)(a1 + 96);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  id v4 = [*(id *)(a1 + 32) indexPathForAggregateItem];
  if (v2 == v4)
  {
  }
  else
  {
    char v5 = [v2 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      if (v2)
      {
        uint64_t v6 = *(void **)(a1 + 40);
        v15[0] = v2;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
        [v6 deleteItemsAtIndexPaths:v7];
      }
      if (v4)
      {
        uint64_t v8 = *(void **)(a1 + 40);
        id v14 = v4;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
        [v8 insertItemsAtIndexPaths:v9];
      }
    }
  }
  if ([*(id *)(a1 + 48) count]) {
    [*(id *)(a1 + 40) deleteSections:*(void *)(a1 + 48)];
  }
  if ([*(id *)(a1 + 56) count]) {
    [*(id *)(a1 + 40) insertSections:*(void *)(a1 + 56)];
  }
  if ([*(id *)(a1 + 64) count]) {
    [*(id *)(a1 + 40) deleteItemsAtIndexPaths:*(void *)(a1 + 64)];
  }
  if ([*(id *)(a1 + 72) count]) {
    [*(id *)(a1 + 40) insertItemsAtIndexPaths:*(void *)(a1 + 72)];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  _OWORD v11[2] = __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5F230D0;
  uint64_t v10 = *(void **)(a1 + 80);
  id v12 = *(id *)(a1 + 88);
  id v13 = *(id *)(a1 + 40);
  [v10 enumerateObjectsUsingBlock:v11];
}

uint64_t __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(a1 + 40), "updateListCellForItemAtIndexPath:animated:", *(void *)(*((void *)&v10 + 1) + 8 * v8++), 1, (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndex:a3];
  [*(id *)(a1 + 40) moveRowAtIndexPath:v6 toIndexPath:v7];
}

void __239__PUAlbumListViewController__performBatchUpdates_withDeletedSections_insertedSections_changedSections_deletedItemsIndexPaths_insertedItemsIndexPaths_changedItemsIndexPaths_movedItemsFromIndexPaths_movedItemsToIndexPaths_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndex:a3];
  [*(id *)(a1 + 40) moveItemAtIndexPath:v6 toIndexPath:v7];
}

- (void)_visiblyInsertItemAtIndexPath:(id)a3 modelUpdate:(id)a4 completionHandler:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a4;
  long long v10 = (void (**)(void))a5;
  long long v11 = [(PUAlbumListViewController *)self _mainCollectionView];
  if (v11)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke;
    v23[3] = &unk_1E5F2A248;
    void v23[4] = self;
    id v26 = v9;
    id v24 = v11;
    id v25 = v8;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_2;
    id v18 = &unk_1E5F230A8;
    id v19 = self;
    id v20 = v25;
    id v21 = v24;
    id v22 = v10;
    [v21 performBatchUpdates:v23 completion:&v15];
  }
  long long v12 = [(PUAlbumListViewController *)self _mainTableView];
  long long v13 = v12;
  if (v8 && v12)
  {
    [v12 beginUpdates];
    if (v9) {
      v9[2](v9);
    }
    v27[0] = v8;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    [v13 insertRowsAtIndexPaths:v14 withRowAnimation:0];

    [v13 endUpdates];
    [(PUAlbumListViewController *)self scrollToItemAtIndexPath:v8 centered:1 animated:1];
    if (v10) {
      v10[2](v10);
    }
  }
}

void __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) indexPathForAggregateItem];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  id v4 = [*(id *)(a1 + 32) indexPathForAggregateItem];
  if (v2 == v4)
  {
  }
  else
  {
    char v5 = [v2 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      if (v2)
      {
        id v6 = *(void **)(a1 + 40);
        v14[0] = v2;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [v6 deleteItemsAtIndexPaths:v7];
      }
      if (v4)
      {
        id v8 = *(void **)(a1 + 40);
        id v13 = v4;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
        [v8 insertItemsAtIndexPaths:v9];
      }
    }
  }
  long long v10 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v10 insertItemsAtIndexPaths:v11];
}

void __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) indexPathsForVisibleItems];
  if ([v2 containsObject:*(void *)(a1 + 40)])
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
  }
  else
  {
    [*(id *)(a1 + 48) scrollToItemAtIndexPath:*(void *)(a1 + 40) atScrollPosition:0 animated:1];
    [*(id *)(a1 + 32) _setPendingScrollingAnimationEndBlock:*(void *)(a1 + 56)];
    objc_initWeak(&location, *(id *)(a1 + 32));
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_3;
    v5[3] = &unk_1E5F2E530;
    objc_copyWeak(&v6, &location);
    dispatch_after(v4, MEMORY[0x1E4F14428], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __89__PUAlbumListViewController__visiblyInsertItemAtIndexPath_modelUpdate_completionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePendingScrollingAnimationEndBlock];
}

- (id)mainScrollView
{
  uint64_t v3 = [(PUAlbumListViewController *)self _mainCollectionView];
  dispatch_time_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PUAlbumListViewController *)self _mainTableView];
  }
  id v6 = v5;

  return v6;
}

- (void)deselectSelectedItemAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PUAlbumListViewController *)self _mainCollectionView];
  if (v10)
  {
    id v5 = [v10 indexPathsForSelectedItems];
    id v6 = [v5 firstObject];

    [v10 deselectItemAtIndexPath:v6 animated:v3];
  }
  id v7 = [(PUAlbumListViewController *)self _mainTableView];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 indexPathForSelectedRow];
    [v8 deselectRowAtIndexPath:v9 animated:v3];
  }
}

- (void)selectItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(PUAlbumListViewController *)self _mainCollectionView];
  [v8 selectItemAtIndexPath:v6 animated:v4 scrollPosition:0];
  id v7 = [(PUAlbumListViewController *)self _mainTableView];
  [v7 selectRowAtIndexPath:v6 animated:v4 scrollPosition:0];
}

- (void)scrollToItemAtIndexPath:(id)a3 centered:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v14 = a3;
  id v8 = [(PUAlbumListViewController *)self _mainCollectionView];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v6) {
      uint64_t v10 = 18;
    }
    else {
      uint64_t v10 = 0;
    }
    [v8 scrollToItemAtIndexPath:v14 atScrollPosition:v10 animated:v5];
  }
  long long v11 = [(PUAlbumListViewController *)self _mainTableView];
  uint64_t v12 = v11;
  if (v11)
  {
    if (v6) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 0;
    }
    [v11 scrollToRowAtIndexPath:v14 atScrollPosition:v13 animated:v5];
  }
}

- (void)reloadContentView
{
  BOOL v3 = [(PUAlbumListViewController *)self _mainCollectionView];
  [v3 reloadData];

  id v4 = [(PUAlbumListViewController *)self _mainTableView];
  [v4 reloadData];
}

- (id)collectionAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUAlbumListViewController *)self albumsSections];
  unint64_t v7 = v6;
  unint64_t v8 = [v4 section];
  uint64_t v9 = 0;
  if (v8 >= v5 && v8 - v5 < v7)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v4, "item"), objc_msgSend(v4, "section") - v5);
    long long v11 = [(PUAlbumListViewController *)self dataSource];
    uint64_t v9 = [v11 collectionAtIndexPath:v10];
  }
  return v9;
}

- (id)indexPathForCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUAlbumListViewController *)self dataSource];
  unint64_t v6 = [v5 indexPathForCollection:v4];

  if (v6)
  {
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v6, "item"), -[PUAlbumListViewController albumsSections](self, "albumsSections") + objc_msgSend(v6, "section"));
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_someAlbumSupportsEditing
{
  id v2 = self;
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(PUAlbumListViewController *)self dataSource];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__PUAlbumListViewController__someAlbumSupportsEditing__block_invoke;
  v5[3] = &unk_1E5F23080;
  void v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateCollectionsUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __54__PUAlbumListViewController__someAlbumSupportsEditing__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) _editCapabilitiesForAlbum:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)_editCapabilitiesForAlbum:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUAlbumListViewController *)self dataSourceManager];
  uint64_t v6 = [v5 canDeleteCollection:v4];
  if ([v5 canRenameCollection:v4]) {
    uint64_t v7 = v6 | 2;
  }
  else {
    uint64_t v7 = v6;
  }
  int v8 = [v5 canReorderCollection:v4];

  if (v8) {
    unint64_t v9 = v7 | 4;
  }
  else {
    unint64_t v9 = v7;
  }

  return v9;
}

- (BOOL)shouldEnableCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUAlbumListViewController *)self sessionInfo];
  uint64_t v6 = [v5 sourceAlbum];
  if ([v4 isEqual:v6])
  {
    char v7 = 0;
  }
  else
  {
    int v8 = [(PUAlbumListViewController *)self sessionInfo];
    unint64_t v9 = [v8 targetAlbum];
    char v10 = [v4 isEqual:v9];

    if (v10)
    {
      char v7 = 0;
      goto LABEL_7;
    }
    unint64_t v5 = [(PUAlbumListViewController *)self sessionInfo];
    if (![v5 isSelectingTargetAlbum])
    {
      char v7 = 1;
      goto LABEL_4;
    }
    uint64_t v6 = [(PUAlbumListViewController *)self sessionInfo];
    if ([v6 allowSelectingNonEditableAlbums]) {
      char v7 = 1;
    }
    else {
      char v7 = [v4 canPerformEditOperation:3];
    }
  }

LABEL_4:
LABEL_7:

  return v7;
}

- (BOOL)showsEmptyPlaceholderWhenEmpty
{
  return 1;
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  unint64_t v5 = [(PUAlbumListViewController *)self dataSourceManager];
  int v6 = [v5 canEditAlbums];

  int v34 = [(PUAlbumListViewController *)self isEditing];
  char v7 = [(PUAlbumListViewController *)self sessionInfo];
  int v8 = [v7 isSelectingAssets];

  unint64_t v9 = [(PUAlbumListViewController *)self sessionInfo];
  int v10 = [v9 isSelectingTargetAlbum];

  long long v11 = [(PUAlbumListViewController *)self navigationController];
  uint64_t v12 = [v11 viewControllers];
  if ([v12 indexOfObject:self])
  {
    uint64_t v13 = [(PUAlbumListViewController *)self navigationItem];
    int v14 = [v13 hidesBackButton];
  }
  else
  {
    int v14 = 1;
  }

  uint64_t v15 = [(PUAlbumListViewController *)self sessionInfo];
  char v16 = [v15 isForAssetPicker];

  id v35 = [(PUAlbumListViewController *)self title];
  uint64_t v17 = [(PUAlbumListViewController *)self sessionInfo];
  uint64_t v18 = [v17 promptLocation];

  if (v18)
  {
    id v19 = 0;
  }
  else
  {
    id v20 = [(PUAlbumListViewController *)self sessionInfo];
    id v19 = [v20 localizedPrompt];
  }
  id v21 = 0;
  if ((v6 ^ 1 | v8 | v10) != 1 && v14 | v34)
  {
    id v21 = [(PUAlbumListViewController *)self _albumCreationButtonItem];
  }
  id v22 = [(PUAlbumListViewController *)self navigationItem];
  if ((v16 & 1) == 0)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v24 = [(PUAlbumListViewController *)self sharedLibraryStatusProvider];
    double v33 = v24;
    if (![(PUAlbumListViewController *)self isRootSharedAlbumList]
      && [v24 hasSharedLibraryOrPreview])
    {
      [(PUAlbumListViewController *)self libraryFilterState];
      v25 = unsigned int v32 = v3;
      [v24 hasPreview];
      id v26 = PXSharedLibrarySwitchLibraryButtonItems();
      [v23 addObjectsFromArray:v26];

      uint64_t v3 = v32;
    }
    if (v8)
    {
      uint64_t v27 = [(PUAlbumListViewController *)self _doneButtonItem];
    }
    else if (v10)
    {
      uint64_t v27 = [(PUAlbumListViewController *)self _cancelButtonItem];
    }
    else
    {
      if (!v34 && !v6) {
        goto LABEL_22;
      }
      uint64_t v27 = [(PUAlbumListViewController *)self editButtonItem];
    }
    id v28 = (void *)v27;
    [v23 addObject:v27];

LABEL_22:
    id v29 = [v22 leftBarButtonItem];
    if (v29 == v21)
    {
    }
    else
    {
      uint64_t v30 = v29;
      char v31 = [v29 isEqual:v21];

      if ((v31 & 1) == 0) {
        [v22 setLeftBarButtonItem:v21 animated:v3];
      }
    }
    [v22 setRightBarButtonItems:v23 animated:v3];
  }
  [v22 setPrompt:v19];
  [v22 setTitle:v35];
}

- (BOOL)_updateInterfaceForIncrementalModelChangeHandler:(id)a3 withSectionedChangeDetails:(id)a4 animated:(BOOL)a5
{
  BOOL v24 = a5;
  id v7 = a4;
  id v8 = a3;
  id v26 = [v7 deletedItemsIndexPaths];
  id v25 = [v7 insertedItemsIndexPaths];
  uint64_t v9 = [v7 changedItemsIndexPaths];
  uint64_t v10 = [v7 contentItemsChangedIndexPaths];
  id v23 = (void *)v9;
  long long v11 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
  id v22 = (void *)v10;
  [v11 addObjectsFromArray:v10];
  if ([v7 hasMoves])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    void v27[2] = __114__PUAlbumListViewController__updateInterfaceForIncrementalModelChangeHandler_withSectionedChangeDetails_animated___block_invoke;
    v27[3] = &unk_1E5F23058;
    id v14 = v12;
    id v28 = v14;
    id v15 = v13;
    id v29 = v15;
    [v7 enumerateMovedIndexPathsUsingBlock:v27];
  }
  else
  {
    id v14 = 0;
    id v15 = 0;
  }
  char v16 = [v7 deletedSections];
  uint64_t v17 = [v7 insertedSections];
  uint64_t v18 = [v7 changedSections];
  [v11 allObjects];
  id v19 = v21 = v11;
  [(PUAlbumListViewController *)self _performBatchUpdates:v8 withDeletedSections:v16 insertedSections:v17 changedSections:v18 deletedItemsIndexPaths:v26 insertedItemsIndexPaths:v25 changedItemsIndexPaths:v19 movedItemsFromIndexPaths:v14 movedItemsToIndexPaths:v15 completionHandler:0];

  [(PUAlbumListViewController *)self _updatePeripheralInterfaceAnimated:v24];
  [(PUAlbumListViewController *)self setViewInSyncWithModel:1];
  [(PUAlbumListViewController *)self _updatePreheatedAssets];

  return 1;
}

void __114__PUAlbumListViewController__updateInterfaceForIncrementalModelChangeHandler_withSectionedChangeDetails_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 40) addObject:v6];
}

- (void)_updateInterfaceForModelReloadAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUAlbumListViewController *)self _resetPreheating];
  [(PUAlbumListViewController *)self reloadContentView];
  [(PUAlbumListViewController *)self _updatePeripheralInterfaceAnimated:v3];
  [(PUAlbumListViewController *)self setViewInSyncWithModel:1];
  [(PUAlbumListViewController *)self _updatePreheatedAssets];
}

- (unint64_t)_unfilteredIndexForFilteredIndexPath:(id)a3
{
  id v4 = [(PUAlbumListViewController *)self collectionAtIndexPath:a3];
  unint64_t v5 = [(PUAlbumListViewController *)self dataSourceManager];
  id v6 = [v5 collectionsFetchResult];
  unint64_t v7 = [v6 indexOfObject:v4];

  return v7;
}

- (PHImageRequestOptions)_imageRequestOptions
{
  imageRequestOptions = self->__imageRequestOptions;
  if (!imageRequestOptions)
  {
    id v4 = (PHImageRequestOptions *)objc_alloc_init(MEMORY[0x1E4F390D8]);
    [(PHImageRequestOptions *)v4 setAllowPlaceholder:1];
    [(PHImageRequestOptions *)v4 setNetworkAccessAllowed:1];
    [(PHImageRequestOptions *)v4 setDeliveryMode:0];
    unint64_t v5 = self->__imageRequestOptions;
    self->__imageRequestOptions = v4;

    imageRequestOptions = self->__imageRequestOptions;
  }
  return imageRequestOptions;
}

- (id)_assetsFetchOptions
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F390A0], "px_standardFetchOptions");
  id v4 = [(PUAlbumListViewController *)self assetsFilterPredicate];
  [v3 setInternalPredicate:v4];

  return v3;
}

- (BOOL)isRootSharedAlbumList
{
  id v2 = [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_dataSourceManagerConfiguration collectionList];
  char v3 = objc_msgSend(v2, "px_isSharedAlbumsFolder");

  return v3;
}

- (BOOL)isRootFolder
{
  return [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)self->_dataSourceManagerConfiguration separateSectionsForSmartAndUserCollections];
}

- (PUAlbumListCell)focusedListCell
{
  char v3 = [MEMORY[0x1E4FB1790] focusSystemForEnvironment:self];
  id v4 = [v3 focusedItem];

  unint64_t v5 = self;
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(PUAlbumListViewController *)self _mainCollectionView];
    int v7 = [v4 isDescendantOfView:v6];

    if (v7)
    {
      id v8 = v4;
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v8 = 0;
LABEL_6:

  return (PUAlbumListCell *)v8;
}

- (id)assetsFilterPredicate
{
  return 0;
}

- (unint64_t)filteringAssetTypes
{
  return -1;
}

- (PXPhotoKitCollectionsDataSource)dataSource
{
  dataSource = self->_dataSource;
  if (!dataSource)
  {
    id v4 = [(PUAlbumListViewController *)self dataSourceManager];
    unint64_t v5 = [v4 dataSource];
    id v6 = self->_dataSource;
    self->_dataSource = v5;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)setDataSourceManagerConfiguration:(id)a3
{
  unint64_t v5 = (PXPhotoKitCollectionsDataSourceManagerConfiguration *)a3;
  if (self->_dataSourceManagerConfiguration != v5)
  {
    uint64_t v9 = v5;
    [(PXPhotoKitCollectionsDataSourceManagerConfiguration *)v5 setAssetTypesToInclude:[(PUAlbumListViewController *)self filteringAssetTypes]];
    objc_storeStrong((id *)&self->_dataSourceManagerConfiguration, a3);
    [(PXPhotoKitCollectionsDataSourceManager *)self->_dataSourceManager unregisterChangeObserver:self context:PXPhotoKitCollectionsDataSourceManagerObservationContext];
    dataSource = self->_dataSource;
    self->_dataSource = 0;

    int v7 = (PXPhotoKitCollectionsDataSourceManager *)[objc_alloc(MEMORY[0x1E4F90478]) initWithConfiguration:v9];
    dataSourceManager = self->_dataSourceManager;
    self->_dataSourceManager = v7;

    [(PXPhotoKitCollectionsDataSourceManager *)self->_dataSourceManager registerChangeObserver:self context:PXPhotoKitCollectionsDataSourceManagerObservationContext];
    if ([(PUAlbumListViewController *)self px_isVisible]) {
      [(PUAlbumListViewController *)self _updateInterfaceForModelReloadAnimated:0];
    }
    else {
      [(PUAlbumListViewController *)self setViewInSyncWithModel:0];
    }
    unint64_t v5 = v9;
  }
}

- (void)_updateTitle
{
  char v3 = [(PUAlbumListViewController *)self collection];
  id v6 = v3;
  if (v3)
  {
    id v4 = [v3 localizedTitle];
    [(PUAlbumListViewController *)self setTitle:v4];
    unint64_t v5 = [(PUAlbumListViewController *)self navigationItem];
    [v5 setTitleView:0];
  }
  else
  {
    id v4 = [(PUAlbumListViewController *)self navigationItem];
    [v4 setTitleView:0];
  }
}

- (void)setCollection:(id)a3
{
  unint64_t v5 = (PHCollection *)a3;
  collection = self->_collection;
  if (collection != v5)
  {
    uint64_t v9 = v5;
    int v7 = collection;
    objc_storeStrong((id *)&self->_collection, a3);
    if (!v9 || v7)
    {
      if (v9 || !v7) {
        goto LABEL_9;
      }
      id v8 = [(PHCollection *)v7 photoLibrary];
      objc_msgSend(v8, "px_unregisterChangeObserver:", self);
    }
    else
    {
      id v8 = [(PHCollection *)v9 photoLibrary];
      objc_msgSend(v8, "px_registerChangeObserver:", self);
    }

LABEL_9:
    [(PUAlbumListViewController *)self _invalidateTitle];

    unint64_t v5 = v9;
  }
}

- (void)setSessionInfo:(id)a3
{
  unint64_t v5 = (PUSessionInfo *)a3;
  p_sessionInfo = &self->_sessionInfo;
  sessionInfo = self->_sessionInfo;
  if (sessionInfo != v5)
  {
    long long v11 = v5;
    [(PUSessionInfo *)sessionInfo removeSessionInfoObserver:self];
    objc_storeStrong((id *)&self->_sessionInfo, a3);
    [(PUSessionInfo *)*p_sessionInfo addSessionInfoObserver:self];
    id v8 = [(PUSessionInfo *)*p_sessionInfo bannerGenerator];
    uint64_t v9 = v8[2]();

    uint64_t v10 = [(PUAlbumListViewController *)self navigationItem];
    objc_msgSend(v10, "pu_setBanner:", v9);

    [(PUAlbumListViewController *)self _updateAddNewAlbumPlaceholderAnimated:0];
    [(PUAlbumListViewController *)self _updateInterfaceForModelReloadAnimated:0];

    unint64_t v5 = v11;
  }
}

- (id)_albumCreationButtonItem
{
  v21[2] = *MEMORY[0x1E4F143B8];
  albumCreationButtonItem = self->_albumCreationButtonItem;
  if (!albumCreationButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:4 primaryAction:0];
    unint64_t v5 = self->_albumCreationButtonItem;
    self->_albumCreationButtonItem = v4;

    if ([(PUAlbumListViewController *)self isRootSharedAlbumList])
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      _OWORD v20[2] = __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke;
      v20[3] = &unk_1E5F2ADC0;
      v20[4] = self;
      id v6 = [MEMORY[0x1E4FB13F0] actionWithTitle:&stru_1F06BE7B8 image:0 identifier:0 handler:v20];
      [(UIBarButtonItem *)self->_albumCreationButtonItem setPrimaryAction:v6];
    }
    else
    {
      int v7 = (void *)MEMORY[0x1E4FB1970];
      id v8 = (void *)MEMORY[0x1E4FB13F0];
      id v6 = PULocalizedString(@"NEW_ALBUM_BUTTON");
      uint64_t v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle.stack.badge.plus"];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke_2;
      v19[3] = &unk_1E5F2ADC0;
      void v19[4] = self;
      uint64_t v10 = [v8 actionWithTitle:v6 image:v9 identifier:0 handler:v19];
      v21[0] = v10;
      long long v11 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v12 = PULocalizedString(@"NEW_FOLDER_BUTTON");
      uint64_t v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"folder.badge.plus"];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke_3;
      v18[3] = &unk_1E5F2ADC0;
      v18[4] = self;
      id v14 = [v11 actionWithTitle:v12 image:v13 identifier:0 handler:v18];
      v21[1] = v14;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
      char v16 = [v7 menuWithTitle:&stru_1F06BE7B8 children:v15];
      [(UIBarButtonItem *)self->_albumCreationButtonItem setMenu:v16];
    }
    albumCreationButtonItem = self->_albumCreationButtonItem;
  }
  return albumCreationButtonItem;
}

uint64_t __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) newSharedAlbum:0];
}

uint64_t __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) newAlbum:0];
}

uint64_t __53__PUAlbumListViewController__albumCreationButtonItem__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) newFolder:0];
}

- (id)_cancelButtonItem
{
  cancelButtonItem = self->_cancelButtonItem;
  if (!cancelButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancelButton_];
    unint64_t v5 = self->_cancelButtonItem;
    self->_cancelButtonItem = v4;

    cancelButtonItem = self->_cancelButtonItem;
  }
  return cancelButtonItem;
}

- (id)_doneButtonItem
{
  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleDoneButton_];
    unint64_t v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    doneButtonItem = self->_doneButtonItem;
  }
  return doneButtonItem;
}

- (void)updateInterfaceLayoutIfNecessary
{
  if (![(PUAlbumListViewController *)self updateSpec])
  {
    char v3 = [(PUAlbumListViewController *)self view];
    [v3 frame];
    double v5 = v4;
    [(PUAlbumListViewController *)self _layoutReferenceSize];
    double v7 = v6;

    if (v5 == v7)
    {
      id v8 = [(PUAlbumListViewController *)self view];
      [v8 safeAreaInsets];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      [(PUAlbumListViewController *)self _layoutSafeAreaInsets];
      if (v12 == v20 && v10 == v17 && v16 == v19)
      {
        double v21 = v18;

        if (v14 == v21) {
          return;
        }
      }
      else
      {
      }
    }
  }
  [(PUAlbumListViewController *)self _updateMainView];
}

- (BOOL)updateSpec
{
  char v3 = [(PUAlbumListViewController *)self traitCollection];
  if (![v3 horizontalSizeClass] || !objc_msgSend(v3, "verticalSizeClass")) {
    goto LABEL_8;
  }
  +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:v3];
  double v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() || v5 == objc_opt_class()) {
    double v4 = (objc_class *)objc_opt_class();
  }
  if (v4 != (objc_class *)v5)
  {
    double v6 = (PUAlbumListViewControllerSpec *)objc_alloc_init(v4);
    spec = self->_spec;
    self->_spec = v6;

    BOOL v8 = 1;
  }
  else
  {
LABEL_8:
    BOOL v8 = 0;
  }

  return v8;
}

- (PUAlbumListViewControllerSpec)spec
{
  spec = self->_spec;
  if (!spec)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUAlbumListViewController.m" lineNumber:388 description:@"missing spec"];

    spec = self->_spec;
  }
  return spec;
}

- (void)dealloc
{
  [(PUAlbumListViewController *)self setKeyboardAware:0];
  [(PUSessionInfo *)self->_sessionInfo removeSessionInfoObserver:self];
  char v3 = [(PUAlbumListViewController *)self _mainCollectionView];
  [v3 setDataSource:0];

  double v4 = [(PUAlbumListViewController *)self _mainCollectionView];
  [v4 setDelegate:0];

  uint64_t v5 = [(PUAlbumListViewController *)self _mainCollectionView];
  [v5 setReorderDelegate:0];

  double v6 = [(PUAlbumListViewController *)self _mainTableView];
  [v6 setDataSource:0];

  double v7 = [(PUAlbumListViewController *)self _mainTableView];
  [v7 setDelegate:0];

  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListViewController;
  [(PUAlbumListViewController *)&v8 dealloc];
}

- (PUAlbumListViewController)initWithSpec:(id)a3 dataSourceManager:(id)a4 photoLibrary:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PUAlbumListViewController;
  double v12 = [(PUAlbumListViewController *)&v26 initWithNibName:0 bundle:0];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a5);
    uint64_t v14 = [MEMORY[0x1E4F90690] sharedLibraryStatusProviderWithPhotoLibrary:v11];
    sharedLibraryStatusProvider = v13->_sharedLibraryStatusProvider;
    v13->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F90310]) initWithSharedLibraryStatusProvider:v13->_sharedLibraryStatusProvider];
    libraryFilterState = v13->_libraryFilterState;
    v13->_libraryFilterState = (PXLibraryFilterState *)v16;

    objc_storeStrong((id *)&v13->_spec, a3);
    uint64_t v18 = objc_opt_new();
    cachingImageManager = v13->__cachingImageManager;
    v13->__cachingImageManager = (PHCachingImageManager *)v18;

    double v20 = (PXAssetBadgeManager *)objc_alloc_init(MEMORY[0x1E4F8FFC8]);
    badgeManager = v13->__badgeManager;
    v13->__badgeManager = v20;

    id v22 = [(PUAlbumListViewController *)v13 navigationItem];
    objc_msgSend(v22, "px_setPreferredLargeTitleDisplayMode:", 2);

    [(PUAlbumListViewController *)v13 _updateAlbumSubtitleFormat];
    [(PUAlbumListViewController *)v13 px_enableExtendedTraitCollection];
    uint64_t v23 = [v10 configuration];
    dataSourceManagerConfiguration = v13->_dataSourceManagerConfiguration;
    v13->_dataSourceManagerConfiguration = (PXPhotoKitCollectionsDataSourceManagerConfiguration *)v23;

    objc_storeStrong((id *)&v13->_dataSourceManager, a4);
    [(PXPhotoKitCollectionsDataSourceManager *)v13->_dataSourceManager registerChangeObserver:v13 context:PXPhotoKitCollectionsDataSourceManagerObservationContext];
  }

  return v13;
}

- (PUAlbumListViewController)initWithSpec:(id)a3 photoLibrary:(id)a4
{
  return [(PUAlbumListViewController *)self initWithSpec:a3 dataSourceManager:0 photoLibrary:a4];
}

- (PUAlbumListViewController)initWithSpec:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F39228];
  id v5 = a3;
  double v6 = objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  double v7 = [(PUAlbumListViewController *)self initWithSpec:v5 dataSourceManager:0 photoLibrary:v6];

  return v7;
}

- (PUAlbumListViewController)initWithSpec:(id)a3 isRootSharedAlbumList:(BOOL)a4
{
  id v5 = (void *)MEMORY[0x1E4F39228];
  id v6 = a3;
  double v7 = objc_msgSend(v5, "px_deprecated_appPhotoLibrary");
  objc_super v8 = [(PUAlbumListViewController *)self initWithSpec:v6 dataSourceManager:0 photoLibrary:v7];

  return v8;
}

+ (id)newMyAlbumsViewControllerWithSpec:(id)a3 sessionInfo:(id)a4 dataSourceManager:(id)a5 photoLibrary:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  double v13 = [[PUAlbumListViewController alloc] initWithSpec:v12 dataSourceManager:v10 photoLibrary:v9];

  [(PUAlbumListViewController *)v13 setSessionInfo:v11];
  uint64_t v14 = PULocalizedString(@"USER_CREATED_ALBUMS_TITLE");
  [(PUAlbumListViewController *)v13 setTitle:v14];

  return v13;
}

+ (id)newMyAlbumsViewControllerWithSpec:(id)a3 sessionInfo:(id)a4 photoLibrary:(id)a5
{
  objc_super v8 = (void *)MEMORY[0x1E4F39008];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 librarySpecificFetchOptions];
  double v13 = [v8 fetchRootAlbumCollectionListWithOptions:v12];
  uint64_t v14 = [v13 firstObject];

  double v15 = (void *)[objc_alloc(MEMORY[0x1E4F90480]) initWithCollectionList:v14];
  [v15 setCollectionTypesToInclude:4983826];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F90478]) initWithConfiguration:v15];
  double v17 = (void *)[a1 newMyAlbumsViewControllerWithSpec:v11 sessionInfo:v10 dataSourceManager:v16 photoLibrary:v9];

  return v17;
}

- (id)px_gridPresentation
{
  char v3 = createGridPresentationWithViewController(self);
  double v4 = [(PUAlbumListViewController *)self sessionInfo];
  [v3 setSessionInfo:v4];

  return v3;
}

@end