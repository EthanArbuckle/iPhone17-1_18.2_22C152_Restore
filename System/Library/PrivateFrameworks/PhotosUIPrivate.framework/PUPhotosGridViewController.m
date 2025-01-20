@interface PUPhotosGridViewController
+ (id)_localizedSelectionTitleWithPhotoSelectionManager:(id)a3;
+ (void)transferPhotoBrowserFromGridViewController:(id)a3 toGridViewController:(id)a4;
- (BOOL)_allowsActions:(unint64_t)a3;
- (BOOL)_areAllAssetsSelected;
- (BOOL)_canAddContent;
- (BOOL)_canAllContainersPerformEditOperation:(int64_t)a3;
- (BOOL)_canPasteboardCopyAssetAtIndexPath:(id)a3;
- (BOOL)_canRemoveContent;
- (BOOL)_canShareAsset:(id)a3;
- (BOOL)_canShareContent;
- (BOOL)_collectionView:(id)a3 canHandleDropSesson:(id)a4;
- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5;
- (BOOL)_confidentialityWarningRequiredForAsset:(id)a3;
- (BOOL)_didForceDataSource;
- (BOOL)_hasAccessibilityLargeText;
- (BOOL)_hasAtLeastOneContainer;
- (BOOL)_navigateToBottomIfNeededAnimated:(BOOL)a3;
- (BOOL)_previewCommitting;
- (BOOL)_shouldBeginMultiSelectAtLocation:(CGPoint)a3;
- (BOOL)_shouldUpdateCollectionView;
- (BOOL)_transitionWidthHasChanged;
- (BOOL)_updateTransitionWidthOnAppearance;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)allowSelectAllButton;
- (BOOL)allowSlideshowButton;
- (BOOL)alwaysHideTabBar;
- (BOOL)canAddToOtherAlbumContent;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBeginStackCollapseTransition;
- (BOOL)canDeleteContent;
- (BOOL)canDisplayEditButton;
- (BOOL)canDragIn;
- (BOOL)canDragOut;
- (BOOL)canHandleDropSession:(id)a3;
- (BOOL)canNavigateToPhotoInteractively:(BOOL)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasKnownNonEmptyContent_toWorkAround31995766;
- (BOOL)hasScrollableContent;
- (BOOL)initiallyScrolledToBottom;
- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4;
- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5;
- (BOOL)isAddPlaceholderAtIndexPath:(id)a3;
- (BOOL)isAnyAssetSelected;
- (BOOL)isCameraRoll;
- (BOOL)isContentViewInSyncWithModel;
- (BOOL)isCurrentCollectionViewDataSource;
- (BOOL)isEmpty;
- (BOOL)isInMultiSelectMode;
- (BOOL)isPerformingCoalescedSelectionUpdates;
- (BOOL)isPreheatingEnabled;
- (BOOL)isTrashBinViewController;
- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3;
- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3;
- (BOOL)sectionedGridLayoutTransitionAutoAdjustContentOffsetEnabled:(id)a3;
- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 withVelocity:(CGPoint)a5;
- (BOOL)shouldPerformAutomaticContentOffsetAdjustment;
- (BOOL)shouldPerformFullReloadForIncrementalDataSourceChange:(id)a3;
- (BOOL)shouldPreventRevealInMomentAction;
- (BOOL)shouldShowMenu;
- (BOOL)shouldShowTabBar;
- (BOOL)shouldShowToolbar;
- (BOOL)showsCustomDoneButtonItemOnLeft;
- (BOOL)showsSelectionSessionCancelButtonItemOnLeft;
- (BOOL)supportsMultiSelectInteraction:(id)a3;
- (BOOL)updateSpec;
- (BOOL)wantsAddContentInToolbar;
- (BOOL)wantsAddPlaceholderAtEndOfSection:(int64_t)a3;
- (BOOL)wantsGlobalFooter;
- (BOOL)wantsPlaceholderView;
- (BOOL)zoomTransition:(id)a3 getFrame:(CGRect *)a4 inCoordinateSpace:(id *)a5 contentMode:(int64_t *)a6 cropInsets:(UIEdgeInsets *)a7 forPhotoToken:(id)a8 operation:(int64_t)a9;
- (BOOL)zoomTransition:(id)a3 transitionImageForPhotoToken:(id)a4 callback:(id)a5;
- (CGPoint)_previousPrefetchContentOffset;
- (CGPoint)_previousPreheatContentOffset;
- (CGPoint)contentOffsetForPreheating;
- (CGPoint)stableUpdatesContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGRect)_previousPrefetchRect;
- (CGRect)_previousPreheatRect;
- (CGSize)_cachedViewSizeTransitionContextSize;
- (CGSize)contentSizeForPreheating;
- (CGSize)imageRequestItemPixelSize;
- (CGSize)imageRequestItemSize;
- (CGSize)maximumThumbnailRequestSize;
- (NSIndexPath)_menuIndexPath;
- (NSIndexPath)_previewingIndexPath;
- (PHCachingImageManager)_cachingImageManager;
- (PHFetchResult)collectionListFetchResult;
- (PHPhotoLibrary)photoLibrary;
- (PLDateRangeFormatter)_dateRangeFormatter;
- (PUActivitySharingController)activitySharingController;
- (PUGridLayoutProtocol)mainGridLayout;
- (PUOneUpPresentationHelper)oneUpPresentationHelper;
- (PUPhotoBrowserOneUpPresentationAdaptor)_photoBrowserOneUpPresentationAdaptor;
- (PUPhotoPinchGestureRecognizer)photoOrStackPinchGestureRecognizer;
- (PUPhotoSelectionManager)photoSelectionManager;
- (PUPhotosGridBarsHelper)_barsHelper;
- (PUPhotosGridViewController)initWithCollectionViewLayout:(id)a3;
- (PUPhotosGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUPhotosGridViewController)initWithSpec:(id)a3 photoLibrary:(id)a4;
- (PUPhotosGridViewControllerSpec)gridSpec;
- (PUPhotosGridViewSupplementalToolbarProvider)supplementalToolbarProvider;
- (PUScrollViewSpeedometer)_collectionViewSpeedometer;
- (PUSessionInfo)sessionInfo;
- (PUSlideshowViewController)_slideshowViewController;
- (PUSwipeSelectionManager)_swipeSelectionManager;
- (PXAssetBadgeManager)_badgeManager;
- (PXPhotoKitDeletePhotosActionController)_deleteActionController;
- (PXPhotoKitDuplicateActionController)_duplicateActionController;
- (PXPhotosDataSource)photosDataSource;
- (UIActivityViewController)primingActivityViewController;
- (UIBarButtonItem)customDoneButtonItem;
- (UIContextMenuInteraction)_contextMenuInteraction;
- (UIEdgeInsets)collectionViewLayoutReferenceSafeAreaInsets;
- (UIMultiSelectInteraction)_multiSelectInteraction;
- (UIPopoverPresentationController)_shareAssetsPopoverController;
- (UIView)_emptyPlaceholderView;
- (UIView)_shareAssetsSender;
- (UIViewController)_actionConfirmationAlert;
- (UIViewController)_pushedPhotoBrowserController;
- (UIViewController)_removeActionSheet;
- (double)_adjustedTransitionWidth;
- (double)cellAspectRatioHint;
- (double)collectionViewLayoutReferenceWidth;
- (double)globalHeaderHeight;
- (double)lastUserScrollTime;
- (double)sectionedGridLayout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4;
- (double)topMarginForPhotosGlobalFooterView:(id)a3;
- (id)_activitySharingControllerWithSelectionManager:(id)a3;
- (id)_allAssetsInCollections;
- (id)_assetsAllowingEditOperation:(int64_t)a3 fromAssets:(id)a4;
- (id)_assetsAllowingRemove:(BOOL)a3 orDelete:(BOOL)a4 fromAssets:(id)a5;
- (id)_barButtonSpacerWithWidth:(double)a3;
- (id)_bestReferenceItemIndexPathWithTopBias:(BOOL)a3;
- (id)_cachedViewSizeTransitionContext;
- (id)_cancelButtonItem;
- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5;
- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6;
- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5;
- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4;
- (id)_deselectAllBarButtonItem;
- (id)_dragItemsForIndexPath:(id)a3;
- (id)_indexPathForAsset:(id)a3 inAssetCollection:(id)a4 refetchIfNeeded:(BOOL)a5;
- (id)_indexesWithoutPlaceholdersFromIndexes:(id)a3 inSection:(int64_t)a4;
- (id)_localizedBannerTextForAsset:(id)a3 isDestructive:(BOOL *)a4;
- (id)_newEditActionItemsWithWideSpacing:(BOOL)a3;
- (id)_pendingViewSizeTransitionContext;
- (id)_performDuplicateActivityWithSelectionSnapshot:(id)a3;
- (id)_performHideActivityWithSelectionManager:(id)a3;
- (id)_pickerBannerView;
- (id)_previewParametersForItemAtIndexPath:(id)a3;
- (id)_referenceBarButtonItemForDeleteAction:(int64_t)a3;
- (id)_selectAllBarButtonItem;
- (id)_selectSessionCancelBarButtonItem;
- (id)_selectSessionDoneBarButtonItem;
- (id)_selectionButton;
- (id)_selectionManagerWithSelectedSharableAssets;
- (id)_selectionManagerWithSharableAssetsInFetchResult:(id)a3 forAssetCollection:(id)a4;
- (id)_shareableAssetsFromAssets:(id)a3;
- (id)_slideshowNavigationControllerForFetchResult:(id)a3 assetCollection:(id)a4;
- (id)_updateSelectionFromSelectionManager:(id)a3;
- (id)alternateContentView;
- (id)assetAtIndexPath:(id)a3;
- (id)assetAtIndexPathIfSafe:(id)a3;
- (id)assetCollectionForSectionHeaderAtIndex:(unint64_t)a3;
- (id)assetIndexPathForPhotoToken:(id)a3;
- (id)assetsInAssetCollection:(id)a3;
- (id)beginShowingProgressForAsset:(id)a3 inCollection:(id)a4;
- (id)bestReferenceItemIndexPath;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)contentScrollView;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 preferredAttributesPromise:(id)a5;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)imageForAsset:(id)a3 outIsPlaceholder:(BOOL *)a4;
- (id)imageRequestOptionsForAsset:(id)a3 pixelSize:(CGSize *)a4;
- (id)indexPathForAsset:(id)a3 hintCollection:(id)a4 hintIndexPath:(id)a5;
- (id)indexPathsForPreheatingInRect:(CGRect)a3;
- (id)itemIndexPathAtPoint:(CGPoint)a3 outClosestMatch:(id *)a4;
- (id)itemIndexPathAtPoint:(CGPoint)a3 outClosestMatch:(id *)a4 outLeftClosestMatch:(id *)a5 outAboveClosestMatch:(id *)a6;
- (id)localizedSelectionTitle;
- (id)localizedTitleForAssetCollection:(id)a3;
- (id)localizedTitleForAssetCollection:(id)a3 titleCategory:(int64_t *)a4;
- (id)localizedTitleForAssets:(id)a3;
- (id)longPressGestureRecognizer;
- (id)newGridLayout;
- (id)newToolbarItems;
- (id)onViewDidAppearCompletion;
- (id)pendingProcessDataSourceUpdateBlock;
- (id)photoCollectionAtIndex:(unint64_t)a3;
- (id)photosGridBarsHelper:(id)a3 titleForPhotoSelectionManager:(id)a4;
- (id)ppt_dataSourceChangeHandler;
- (id)ppt_nextDeleteFinishedBlock;
- (id)previewViewControllerForItemAtIndexPath:(id)a3;
- (id)pu_debugRows;
- (id)selectedAssets;
- (id)selectedIndexPaths;
- (id)sessionInfoForTransferredAssets:(id)a3;
- (id)swipeSelectionManager:(id)a3 photoCollectionAtIndex:(unint64_t)a4;
- (id)zoomTransition:(id)a3 photoTokenForPhoto:(id)a4 inCollection:(id)a5;
- (int64_t)_batchPreheatingCount;
- (int64_t)_deleteActionForBarButtonItem:(id)a3;
- (int64_t)_maximumNumberOfRowsToPreheat;
- (int64_t)_preferredWhitePointAdaptivityStyle;
- (int64_t)cellFillMode;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)dateRangeFormatterPreset;
- (int64_t)imageDeliveryMode;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)oneUpPresentationOrigin;
- (int64_t)preferredStatusBarStyle;
- (int64_t)swipeSelectionManager:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (unint64_t)_indexForPhotoCollection:(id)a3;
- (unint64_t)_previousCollectionsCount;
- (unint64_t)_sharableAssetsTypeInFetchResult:(id)a3;
- (unint64_t)additionalOneUpViewControllerOptions;
- (unint64_t)allowedActions;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5;
- (void)_activitySharingControllerDidCancel:(id)a3;
- (void)_addButtonPressed:(id)a3;
- (void)_beginInteractiveNavigationForItemAtIndexPath:(id)a3;
- (void)_cancelImageRequestForCell:(id)a3;
- (void)_clearAutomaticContentOffsetSnapshot;
- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4;
- (void)_configureAddPlaceholderCell:(id)a3 animated:(BOOL)a4;
- (void)_contentSizeCategoryDidChangeNotification:(id)a3;
- (void)_ensureOneUpPresentationHelper;
- (void)_getFirstAsset:(id *)a3 collection:(id *)a4;
- (void)_handleCancelButton:(id)a3;
- (void)_handleDuplicateActionCompletionWithSuccess:(BOOL)a3;
- (void)_handleSelectSessionCancelButton:(id)a3;
- (void)_handleSelectSessionDoneButton:(id)a3;
- (void)_handleSelectionButton:(id)a3;
- (void)_hideMenuIfNeeded;
- (void)_invalidateAllProgressInfoIndexPaths;
- (void)_invalidateCachedViewSizeTransitionContext;
- (void)_menuControllerDidHideMenu:(id)a3;
- (void)_navigateToPhotoAtIndexPath:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5;
- (void)_performAutomaticContentOffsetAdjustment;
- (void)_presentActivitySharingController:(id)a3 completion:(id)a4;
- (void)_presentConfidentialityWarning;
- (void)_presentShareSheetWithCompletion:(id)a3;
- (void)_removeButtonPressed:(id)a3;
- (void)_removeSelectedAssetsWithCompletion:(id)a3;
- (void)_saveAnchorForAutomaticContentOffsetAdjustment;
- (void)_setActionConfirmationAlert:(id)a3;
- (void)_setBatchPreheatingCount:(int64_t)a3;
- (void)_setCachedViewSizeTransitionContext:(id)a3;
- (void)_setCachedViewSizeTransitionContextSize:(CGSize)a3;
- (void)_setCollectionViewSpeedometer:(id)a3;
- (void)_setContextMenuInteraction:(id)a3;
- (void)_setDeleteActionController:(id)a3;
- (void)_setDidForceDataSource:(BOOL)a3;
- (void)_setDuplicateActionController:(id)a3;
- (void)_setEmptyPlaceholderView:(id)a3;
- (void)_setMaximumNumberOfRowsToPreheat:(int64_t)a3;
- (void)_setMaximumThumbnailRequestSize:(CGSize)a3;
- (void)_setMenuIndexPath:(id)a3;
- (void)_setOneUpPresentationHelper:(id)a3;
- (void)_setPendingViewSizeTransitionContext:(id)a3;
- (void)_setPhotoBrowserOneUpPresentationAdaptor:(id)a3;
- (void)_setPhotoOrStackPinchGestureRecognizer:(id)a3;
- (void)_setPhotoSelectionManager:(id)a3;
- (void)_setPreviewCommitting:(BOOL)a3;
- (void)_setPreviewingIndexPath:(id)a3;
- (void)_setPreviousCollectionsCount:(unint64_t)a3;
- (void)_setPreviousPrefetchContentOffset:(CGPoint)a3;
- (void)_setPreviousPrefetchRect:(CGRect)a3;
- (void)_setPreviousPreheatContentOffset:(CGPoint)a3;
- (void)_setPreviousPreheatRect:(CGRect)a3;
- (void)_setPushedPhotoBrowserController:(id)a3;
- (void)_setRemoveActionSheet:(id)a3;
- (void)_setShareAssetsPopoverController:(id)a3;
- (void)_setShareAssetsSender:(id)a3;
- (void)_setSlideshowViewController:(id)a3;
- (void)_setSwipeSelectionManager:(id)a3;
- (void)_shareButtonPressed:(id)a3;
- (void)_slideshowButtonPressed:(id)a3;
- (void)_updateAllProgressInfoIndexPaths;
- (void)_updateBackButtonTitle;
- (void)_updateCollectionViewMultipleSelection;
- (void)_updateContentOffsetForPendingViewSizeTransition;
- (void)_updateGlobalHeaderVisibility;
- (void)_updateIndexPathForProgressInfo:(id)a3;
- (void)_updateLayoutReferenceValues;
- (void)_updateNavigationBannerAnimated:(BOOL)a3;
- (void)_updatePhotoDecorationForCell:(id)a3 animated:(BOOL)a4;
- (void)_updatePhotoSelectionManager;
- (void)_updateProgressForCell:(id)a3 atIndexPath:(id)a4;
- (void)_updateProgressForCellAtIndexPath:(id)a3;
- (void)_updateSelectionForCell:(id)a3 atIndexPath:(id)a4;
- (void)_updateSubviewsOrderingAndVisibility;
- (void)_updateToolbarContentsAnimated:(BOOL)a3;
- (void)_userDidStartScrolling;
- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5;
- (void)activitySharingControllerDidCancel:(id)a3;
- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3;
- (void)beginBatchPreheating;
- (void)beginCoalescedSelectionUpdates;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)configureDecorationsForCell:(id)a3 withAsset:(id)a4 assetCollection:(id)a5 thumbnailIsPlaceholder:(BOOL)a6 assetMayHaveChanged:(BOOL)a7;
- (void)configureGridCell:(id)a3 forItemAtIndexPath:(id)a4;
- (void)configureGridCell:(id)a3 forItemAtIndexPath:(id)a4 assetMayHaveChanged:(BOOL)a5;
- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4;
- (void)deselectAllItemsAnimated:(BOOL)a3;
- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)endBatchPreheating;
- (void)endCoalescedSelectionUpdates;
- (void)endShowingProgressWithIdentifier:(id)a3 succeeded:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6;
- (void)forceDataSourceIfNeeded;
- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6;
- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7;
- (void)handleDrop:(id)a3;
- (void)handleLongPressGesture:(id)a3;
- (void)handleNavigateToAsset:(id)a3 inContainer:(id)a4;
- (void)handlePhotoOrStackPinchGestureRecognizer:(id)a3;
- (void)handleToggleSelectionOfItemAtIndexPath:(id)a3;
- (void)installGestureRecognizers;
- (void)invalidateGridLayoutIfNecessary;
- (void)loadView;
- (void)menuActionController:(id)a3 didDismissWithActionIdentifier:(id)a4;
- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4;
- (void)navigateToBottomAnimated:(BOOL)a3;
- (void)navigateToPhoto:(id)a3 inAssetContainer:(id)a4 animated:(BOOL)a5;
- (void)navigateToPhoto:(id)a3 inAssetContainer:(id)a4 refetchIfNeeded:(BOOL)a5 animated:(BOOL)a6;
- (void)navigateToPhotosDetailsForAssetCollection:(id)a3;
- (void)navigateToPhotosDetailsForAssetCollection:(id)a3 animated:(BOOL)a4;
- (void)navigateToRevealPhoto:(id)a3 inAssetContainer:(id)a4 animated:(BOOL)a5;
- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4;
- (void)oneUpPresentationHelper:(id)a3 willPresentOneUpViewController:(id)a4;
- (void)paste:(id)a3;
- (void)photosDataSource:(id)a3 didChange:(id)a4;
- (void)photosDataSourceWillChange:(id)a3;
- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4;
- (void)photosGlobalFooterViewDidChangeHeight:(id)a3;
- (void)photosGridBarsHelper:(id)a3 didChange:(unint64_t)a4;
- (void)photosGridBarsHelper:(id)a3 getTitle:(id *)a4 prompt:(id *)a5 shouldHideBackButton:(BOOL *)a6 leftBarButtonItems:(id *)a7 rightBarButtonItems:(id *)a8 forPhotoSelectionManager:(id)a9;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)ppt_setDataSourceChangeHandler:(id)a3;
- (void)ppt_setNextDeleteFinishedBlock:(id)a3;
- (void)preheatAssets;
- (void)preheatAssetsWithPrefetchingDisabled:(BOOL)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)presentAlertController:(id)a3;
- (void)processDataSourceChange:(id)a3;
- (void)resetPreheating;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewSpeedometer:(id)a3 regimeDidChange:(int64_t)a4 from:(int64_t)a5;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillScrollToTop:(id)a3;
- (void)sectionedGridLayout:(id)a3 didPrepareTransitionIsAppearing:(BOOL)a4;
- (void)selectAssets:(id)a3 fromAssetCollection:(id)a4;
- (void)sender:(id)a3 shareAssetsInFetchResult:(id)a4 forAssetCollection:(id)a5 withCompletion:(id)a6;
- (void)sender:(id)a3 shareSelectedAssetsWithCompletion:(id)a4;
- (void)sessionInfoPhotoSelectionDidChange:(id)a3;
- (void)setActivitySharingController:(id)a3;
- (void)setAllowedActions:(unint64_t)a3;
- (void)setAlternateContentView:(id)a3;
- (void)setAlwaysHideTabBar:(BOOL)a3;
- (void)setCollectionViewLayoutReferenceSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setCollectionViewLayoutReferenceWidth:(double)a3;
- (void)setContentViewInSyncWithModel:(BOOL)a3;
- (void)setCustomDoneButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setGridSpec:(id)a3;
- (void)setHasKnownNonEmptyContent_toWorkAround31995766:(BOOL)a3;
- (void)setInitiallyScrolledToBottom:(BOOL)a3;
- (void)setLongPressGestureRecognizer:(id)a3;
- (void)setMainGridLayout:(id)a3;
- (void)setOnViewDidAppearCompletion:(id)a3;
- (void)setPendingProcessDataSourceUpdateBlock:(id)a3;
- (void)setPhotosDataSource:(id)a3;
- (void)setPrimingActivityViewController:(id)a3;
- (void)setSelected:(BOOL)a3 itemsAtIndexes:(id)a4 inSection:(int64_t)a5 animated:(BOOL)a6;
- (void)setSessionInfo:(id)a3;
- (void)setShowsCustomDoneButtonItemOnLeft:(BOOL)a3;
- (void)setShowsSelectionSessionCancelButtonItemOnLeft:(BOOL)a3;
- (void)setSupplementalToolbarProvider:(id)a3;
- (void)set_multiSelectInteraction:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4;
- (void)swipeSelectionManager:(id)a3 updatePhotoSelectionWithIndexes:(id)a4 inSection:(int64_t)a5 selectionMode:(int64_t)a6;
- (void)uninstallGestureRecognizers;
- (void)updateEmptyPlaceholderView;
- (void)updateGlobalFooter;
- (void)updateGlobalFooterUsingFooterView:(id)a3;
- (void)updateInterfaceForIncrementalDataSourceChanges:(id)a3;
- (void)updateInterfaceForModelReloadAnimated:(BOOL)a3;
- (void)updateLayoutMetrics;
- (void)updateNavigationBarAnimated:(BOOL)a3;
- (void)updatePeripheralInterfaceAnimated:(BOOL)a3;
- (void)updateProgressWithIdentifier:(id)a3 withValue:(double)a4;
- (void)updateVisibleSupplementaryViewsOfKind:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4;
- (void)zoomTransition:(id)a3 didFinishForOperation:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
- (void)zoomTransition:(id)a3 shouldHidePhotoTokens:(id)a4;
- (void)zoomTransition:(id)a3 willBeginForOperation:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6;
@end

@implementation PUPhotosGridViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primingActivityViewController, 0);
  objc_storeStrong(&self->_pendingProcessDataSourceUpdateBlock, 0);
  objc_storeStrong((id *)&self->__menuIndexPath, 0);
  objc_storeStrong((id *)&self->__badgeManager, 0);
  objc_storeStrong((id *)&self->__previewingIndexPath, 0);
  objc_storeStrong((id *)&self->__contextMenuInteraction, 0);
  objc_storeStrong(&self->__cachedViewSizeTransitionContext, 0);
  objc_storeStrong(&self->__pendingViewSizeTransitionContext, 0);
  objc_storeStrong(&self->_ppt_dataSourceChangeHandler, 0);
  objc_storeStrong(&self->_ppt_nextDeleteFinishedBlock, 0);
  objc_storeStrong((id *)&self->__swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->__multiSelectInteraction, 0);
  objc_storeStrong((id *)&self->__collectionViewSpeedometer, 0);
  objc_storeStrong((id *)&self->__cachingImageManager, 0);
  objc_storeStrong((id *)&self->_activitySharingController, 0);
  objc_destroyWeak((id *)&self->__shareAssetsPopoverController);
  objc_storeStrong((id *)&self->__photoBrowserOneUpPresentationAdaptor, 0);
  objc_storeStrong((id *)&self->_oneUpPresentationHelper, 0);
  objc_storeStrong((id *)&self->__pushedPhotoBrowserController, 0);
  objc_storeStrong((id *)&self->_customDoneButtonItem, 0);
  objc_storeStrong((id *)&self->__slideshowViewController, 0);
  objc_storeStrong((id *)&self->__duplicateActionController, 0);
  objc_storeStrong((id *)&self->__deleteActionController, 0);
  objc_destroyWeak((id *)&self->__shareAssetsSender);
  objc_destroyWeak((id *)&self->__actionConfirmationAlert);
  objc_destroyWeak((id *)&self->__removeActionSheet);
  objc_storeStrong((id *)&self->__emptyPlaceholderView, 0);
  objc_storeStrong((id *)&self->_photoOrStackPinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__barsHelper, 0);
  objc_storeStrong(&self->_onViewDidAppearCompletion, 0);
  objc_storeStrong((id *)&self->_photoSelectionManager, 0);
  objc_storeStrong((id *)&self->_mainGridLayout, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_gridSpec, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_supplementalToolbarProvider, 0);
  objc_storeStrong((id *)&self->__dateRangeFormatter, 0);
  objc_storeStrong(&self->_pendingNavigationBlock, 0);
  objc_storeStrong((id *)&self->_progressInfosByCachedIndexPath, 0);
  objc_storeStrong((id *)&self->_progressInfosByIdentifier, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_slideshowButton, 0);
  objc_storeStrong((id *)&self->_slideshowButtonSpacer, 0);
  objc_storeStrong((id *)&self->_restoreToolbarButton, 0);
  objc_storeStrong((id *)&self->_removeToolbarButton, 0);
  objc_storeStrong((id *)&self->_addToolbarButton, 0);
  objc_storeStrong((id *)&self->_shareToolbarButton, 0);
  objc_storeStrong((id *)&self->_deselectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectionButton, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_selectSessionCancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectSessionDoneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_visibleSectionsBeforeChange, 0);
  objc_storeStrong((id *)&self->_visibleReferenceAssetIndexPathBeforeChange, 0);
  objc_storeStrong((id *)&self->_visibleReferenceAssetContainerBeforeChange, 0);
  objc_storeStrong((id *)&self->_visibleReferenceAssetBeforeChange, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResultBeforeChange, 0);
  objc_storeStrong((id *)&self->_alternateContentView, 0);
}

- (void)setPrimingActivityViewController:(id)a3
{
}

- (UIActivityViewController)primingActivityViewController
{
  return self->_primingActivityViewController;
}

- (void)setHasKnownNonEmptyContent_toWorkAround31995766:(BOOL)a3
{
  self->_hasKnownNonEmptyContent_toWorkAround31995766 = a3;
}

- (BOOL)hasKnownNonEmptyContent_toWorkAround31995766
{
  return self->_hasKnownNonEmptyContent_toWorkAround31995766;
}

- (void)setPendingProcessDataSourceUpdateBlock:(id)a3
{
}

- (id)pendingProcessDataSourceUpdateBlock
{
  return self->_pendingProcessDataSourceUpdateBlock;
}

- (void)_setMenuIndexPath:(id)a3
{
}

- (NSIndexPath)_menuIndexPath
{
  return self->__menuIndexPath;
}

- (PXAssetBadgeManager)_badgeManager
{
  return self->__badgeManager;
}

- (void)_setPreviewCommitting:(BOOL)a3
{
  self->__previewCommitting = a3;
}

- (BOOL)_previewCommitting
{
  return self->__previewCommitting;
}

- (void)_setPreviewingIndexPath:(id)a3
{
}

- (NSIndexPath)_previewingIndexPath
{
  return self->__previewingIndexPath;
}

- (void)_setContextMenuInteraction:(id)a3
{
}

- (UIContextMenuInteraction)_contextMenuInteraction
{
  return self->__contextMenuInteraction;
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

- (void)_setDidForceDataSource:(BOOL)a3
{
  self->__didForceDataSource = a3;
}

- (BOOL)_didForceDataSource
{
  return self->__didForceDataSource;
}

- (void)ppt_setDataSourceChangeHandler:(id)a3
{
}

- (id)ppt_dataSourceChangeHandler
{
  return self->_ppt_dataSourceChangeHandler;
}

- (void)ppt_setNextDeleteFinishedBlock:(id)a3
{
}

- (id)ppt_nextDeleteFinishedBlock
{
  return self->_ppt_nextDeleteFinishedBlock;
}

- (void)_setBatchPreheatingCount:(int64_t)a3
{
  self->__batchPreheatingCount = a3;
}

- (int64_t)_batchPreheatingCount
{
  return self->__batchPreheatingCount;
}

- (void)_setSwipeSelectionManager:(id)a3
{
}

- (PUSwipeSelectionManager)_swipeSelectionManager
{
  return self->__swipeSelectionManager;
}

- (void)set_multiSelectInteraction:(id)a3
{
}

- (UIMultiSelectInteraction)_multiSelectInteraction
{
  return self->__multiSelectInteraction;
}

- (void)_setCollectionViewSpeedometer:(id)a3
{
}

- (PUScrollViewSpeedometer)_collectionViewSpeedometer
{
  return self->__collectionViewSpeedometer;
}

- (void)_setMaximumThumbnailRequestSize:(CGSize)a3
{
  self->_maximumThumbnailRequestSize = a3;
}

- (CGSize)maximumThumbnailRequestSize
{
  double width = self->_maximumThumbnailRequestSize.width;
  double height = self->_maximumThumbnailRequestSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setMaximumNumberOfRowsToPreheat:(int64_t)a3
{
  self->__maximumNumberOfRowsToPreheat = a3;
}

- (int64_t)_maximumNumberOfRowsToPreheat
{
  return self->__maximumNumberOfRowsToPreheat;
}

- (PHCachingImageManager)_cachingImageManager
{
  return self->__cachingImageManager;
}

- (void)_setPreviousPrefetchContentOffset:(CGPoint)a3
{
  self->__previousPrefetchContentOffset = a3;
}

- (CGPoint)_previousPrefetchContentOffset
{
  double x = self->__previousPrefetchContentOffset.x;
  double y = self->__previousPrefetchContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setPreviousPreheatContentOffset:(CGPoint)a3
{
  self->__previousPreheatContentOffset = a3;
}

- (CGPoint)_previousPreheatContentOffset
{
  double x = self->__previousPreheatContentOffset.x;
  double y = self->__previousPreheatContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setPreviousPrefetchRect:(CGRect)a3
{
  self->__previousPrefetchRect = a3;
}

- (CGRect)_previousPrefetchRect
{
  double x = self->__previousPrefetchRect.origin.x;
  double y = self->__previousPrefetchRect.origin.y;
  double width = self->__previousPrefetchRect.size.width;
  double height = self->__previousPrefetchRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
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

- (void)setActivitySharingController:(id)a3
{
}

- (PUActivitySharingController)activitySharingController
{
  return self->_activitySharingController;
}

- (void)_setShareAssetsPopoverController:(id)a3
{
}

- (UIPopoverPresentationController)_shareAssetsPopoverController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__shareAssetsPopoverController);
  return (UIPopoverPresentationController *)WeakRetained;
}

- (void)_setPhotoBrowserOneUpPresentationAdaptor:(id)a3
{
}

- (PUPhotoBrowserOneUpPresentationAdaptor)_photoBrowserOneUpPresentationAdaptor
{
  return self->__photoBrowserOneUpPresentationAdaptor;
}

- (void)_setOneUpPresentationHelper:(id)a3
{
}

- (PUOneUpPresentationHelper)oneUpPresentationHelper
{
  return self->_oneUpPresentationHelper;
}

- (UIViewController)_pushedPhotoBrowserController
{
  return self->__pushedPhotoBrowserController;
}

- (void)setCollectionViewLayoutReferenceSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_collectionViewLayoutReferenceSafeAreaInsets = a3;
}

- (UIEdgeInsets)collectionViewLayoutReferenceSafeAreaInsets
{
  double top = self->_collectionViewLayoutReferenceSafeAreaInsets.top;
  double left = self->_collectionViewLayoutReferenceSafeAreaInsets.left;
  double bottom = self->_collectionViewLayoutReferenceSafeAreaInsets.bottom;
  double right = self->_collectionViewLayoutReferenceSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCollectionViewLayoutReferenceWidth:(double)a3
{
  self->_collectionViewLayoutReferenceWidth = a3;
}

- (double)collectionViewLayoutReferenceWidth
{
  return self->_collectionViewLayoutReferenceWidth;
}

- (void)setShowsSelectionSessionCancelButtonItemOnLeft:(BOOL)a3
{
  self->_showsSelectionSessionCancelButtonItemOnLeft = a3;
}

- (BOOL)showsSelectionSessionCancelButtonItemOnLeft
{
  return self->_showsSelectionSessionCancelButtonItemOnLeft;
}

- (void)setShowsCustomDoneButtonItemOnLeft:(BOOL)a3
{
  self->_showsCustomDoneButtonItemOnLeft = a3;
}

- (BOOL)showsCustomDoneButtonItemOnLeft
{
  return self->_showsCustomDoneButtonItemOnLeft;
}

- (UIBarButtonItem)customDoneButtonItem
{
  return self->_customDoneButtonItem;
}

- (void)_setSlideshowViewController:(id)a3
{
}

- (PUSlideshowViewController)_slideshowViewController
{
  return self->__slideshowViewController;
}

- (void)_setDuplicateActionController:(id)a3
{
}

- (PXPhotoKitDuplicateActionController)_duplicateActionController
{
  return self->__duplicateActionController;
}

- (void)_setDeleteActionController:(id)a3
{
}

- (PXPhotoKitDeletePhotosActionController)_deleteActionController
{
  return self->__deleteActionController;
}

- (void)_setShareAssetsSender:(id)a3
{
}

- (UIView)_shareAssetsSender
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__shareAssetsSender);
  return (UIView *)WeakRetained;
}

- (void)_setActionConfirmationAlert:(id)a3
{
}

- (UIViewController)_actionConfirmationAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__actionConfirmationAlert);
  return (UIViewController *)WeakRetained;
}

- (void)_setRemoveActionSheet:(id)a3
{
}

- (UIViewController)_removeActionSheet
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__removeActionSheet);
  return (UIViewController *)WeakRetained;
}

- (void)_setPreviousCollectionsCount:(unint64_t)a3
{
  self->__previousCollectionsCount = a3;
}

- (unint64_t)_previousCollectionsCount
{
  return self->__previousCollectionsCount;
}

- (void)_setEmptyPlaceholderView:(id)a3
{
}

- (UIView)_emptyPlaceholderView
{
  return self->__emptyPlaceholderView;
}

- (void)_setPhotoOrStackPinchGestureRecognizer:(id)a3
{
}

- (PUPhotoPinchGestureRecognizer)photoOrStackPinchGestureRecognizer
{
  return self->_photoOrStackPinchGestureRecognizer;
}

- (PUPhotosGridBarsHelper)_barsHelper
{
  return self->__barsHelper;
}

- (void)setOnViewDidAppearCompletion:(id)a3
{
}

- (id)onViewDidAppearCompletion
{
  return self->_onViewDidAppearCompletion;
}

- (void)_setPhotoSelectionManager:(id)a3
{
}

- (PUPhotoSelectionManager)photoSelectionManager
{
  return self->_photoSelectionManager;
}

- (void)setAlwaysHideTabBar:(BOOL)a3
{
  self->_alwaysHideTabBar = a3;
}

- (BOOL)alwaysHideTabBar
{
  return self->_alwaysHideTabBar;
}

- (void)setInitiallyScrolledToBottom:(BOOL)a3
{
  self->_initiallyScrolledToBottom = a3;
}

- (BOOL)initiallyScrolledToBottom
{
  return self->_initiallyScrolledToBottom;
}

- (void)setMainGridLayout:(id)a3
{
}

- (PUGridLayoutProtocol)mainGridLayout
{
  return self->_mainGridLayout;
}

- (void)setAllowedActions:(unint64_t)a3
{
  self->_allowedActions = a3;
}

- (unint64_t)allowedActions
{
  return self->_allowedActions;
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void)setGridSpec:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setSupplementalToolbarProvider:(id)a3
{
}

- (PUPhotosGridViewSupplementalToolbarProvider)supplementalToolbarProvider
{
  return self->_supplementalToolbarProvider;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  [(PUPhotosGridViewController *)self _setActionConfirmationAlert:0];
  [(PUPhotosGridViewController *)self dismissViewControllerAnimated:1 completion:v6];

  return 1;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  [(PUPhotosGridViewController *)self _setActionConfirmationAlert:v5];
  id v6 = [v5 popoverPresentationController];
  [v6 setDelegate:self];

  [(PUPhotosGridViewController *)self presentViewController:v5 animated:1 completion:0];
  return 1;
}

- (void)didEndMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  id v5 = [(PUPhotosGridViewController *)self _swipeSelectionManager];
  if (v5)
  {
    id v7 = v5;
    [v5 endSelection];
    [(PUPhotosGridViewController *)self _setSwipeSelectionManager:0];
    id v6 = [(PUPhotosGridViewController *)self _barsHelper];
    [v6 setSwipeSelecting:0];

    id v5 = v7;
  }
}

- (BOOL)shouldAllowSelectionExtensionAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)multiSelectInteraction:(id)a3 toggleSelectionStateUpToPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [(PUPhotosGridViewController *)self collectionView];
  objc_msgSend(v7, "convertPoint:toView:", 0, x, y);
  double v9 = v8;
  double v11 = v10;

  id v19 = 0;
  id v20 = 0;
  v12 = -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, &v20, &v19, x, y);
  id v13 = v20;
  id v14 = v19;
  v15 = v14;
  if (v12 || v13 || v14)
  {
    v16 = [(PUPhotosGridViewController *)self _swipeSelectionManager];
    objc_msgSend(v16, "setScreenTouchLocation:", v9, v11);
    [v16 updateSelectionWithCurrentIndexPath:v12 leftClosestIndexPath:v13 aboveClosestIndexPath:v15];
    v17 = [v16 selectionAutoScroller];
    v18 = [(PUPhotosGridViewController *)self collectionView];
    objc_msgSend(v17, "updateWithUserInteractionLocation:inCoordinateSpace:", v18, x, y);
  }
}

- (void)willBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4
{
  -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, 0, 0, a4.x, a4.y);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v16 section]);
  id v6 = [(PUPhotosGridViewController *)self photoSelectionManager];
  unsigned int v7 = objc_msgSend(v6, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v16, "item"), v5);

  uint64_t v8 = v7;
  double v9 = [PUSwipeSelectionManager alloc];
  double v10 = [(PUPhotosGridViewController *)self photoSelectionManager];
  double v11 = [(PUSwipeSelectionManager *)v9 initWithSelectionMode:v8 photoSelectionManager:v10];

  [(PUSwipeSelectionManager *)v11 setDelegate:self];
  [(PUSwipeSelectionManager *)v11 setDatasource:self];
  [(PUPhotosGridViewController *)self _setSwipeSelectionManager:v11];
  [(PUSwipeSelectionManager *)v11 beginSelectionFromIndexPath:v16];
  v12 = [(PUPhotosGridViewController *)self _barsHelper];
  [v12 setSwipeSelecting:1];

  id v13 = objc_alloc(MEMORY[0x1E4F90848]);
  id v14 = [(PUPhotosGridViewController *)self collectionView];
  v15 = (void *)[v13 initWithTargetScrollView:v14];

  [v15 setDelegate:self];
  [(PUSwipeSelectionManager *)v11 setSelectionAutoScroller:v15];
}

- (BOOL)shouldBeginMultiSelectInteraction:(id)a3 atPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  BOOL v10 = [(PUPhotosGridViewController *)self isInMultiSelectMode];
  if (v10)
  {
    BOOL v11 = -[PUPhotosGridViewController _shouldBeginMultiSelectAtLocation:](self, "_shouldBeginMultiSelectAtLocation:", v8, v7);
    BOOL v12 = fabs(x) > fabs(y);
    LOBYTE(v10) = v11 && v12;
  }
  return v10;
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4 withVelocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  BOOL v10 = objc_msgSend(MEMORY[0x1E4F90268], "sharedInstance", a3);
  int v11 = [v10 enableAutomaticTransitionToSelectMode];

  if (!v11) {
    return 0;
  }
  BOOL v12 = -[PUPhotosGridViewController _shouldBeginMultiSelectAtLocation:](self, "_shouldBeginMultiSelectAtLocation:", v8, v7);
  BOOL v13 = fabs(x) > fabs(y);
  return v12 && v13;
}

- (BOOL)interaction:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4
{
  return -[PUPhotosGridViewController interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:](self, "interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:", a3, a4.x, a4.y, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (void)automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:(BOOL)a3
{
  if (([(PUPhotosGridViewController *)self isEditing] & 1) == 0)
  {
    [(PUPhotosGridViewController *)self setEditing:1 animated:1];
  }
}

- (BOOL)isInMultiSelectMode
{
  char v3 = [(PUPhotosGridViewController *)self isEditing];
  v4 = [(PUPhotosGridViewController *)self sessionInfo];
  char v5 = [v4 isSelectingAssets];

  return v5 | v3;
}

- (BOOL)supportsMultiSelectInteraction:(id)a3
{
  v4 = +[PUPhotosGridSettings sharedInstance];
  if ([v4 isSwipeSelectionEnabled])
  {
    char v5 = [(PUPhotosGridViewController *)self collectionView];
    int v6 = [v5 hasActiveDrag] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_shouldBeginMultiSelectAtLocation:(CGPoint)a3
{
  char v3 = -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", 0, 0, 0, a3.x, a3.y);
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "dropInteraction: %@ performDrop: %@", (uint8_t *)&v9, 0x16u);
  }

  [(PUPhotosGridViewController *)self handleDrop:v7];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:2];
  return v4;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "dropInteraction: %@ canHandleSession: %@", (uint8_t *)&v11, 0x16u);
  }

  BOOL v9 = [(PUPhotosGridViewController *)self canHandleDropSession:v7];
  return v9;
}

- (void)_collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ performDropWithCoordinator: %@", (uint8_t *)&v10, 0x16u);
  }

  BOOL v9 = [v7 dropSession];
  [(PUPhotosGridViewController *)self handleDrop:v9];
}

- (id)_collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEBUG, "_collectionView: %@ dropSessionDidUpdate:%@ withDestinationIndexPath: %@", (uint8_t *)&v13, 0x20u);
  }

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB15B8]) initWithDropOperation:2 dropLocation:2];
  return v11;
}

- (BOOL)_collectionView:(id)a3 canHandleDropSesson:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ canHandleDropSesson: %@ ", (uint8_t *)&v11, 0x16u);
  }

  BOOL v9 = [(PUPhotosGridViewController *)self canHandleDropSession:v7];
  return v9;
}

- (void)handleDrop:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "handleDrop: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [MEMORY[0x1E4F902C8] defaultManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PUPhotosGridViewController_handleDrop___block_invoke;
  v8[3] = &unk_1E5F2AB08;
  v8[4] = self;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  [v6 fetchAssetsFromDrop:v7 importIfNeeded:1 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __41__PUPhotosGridViewController_handleDrop___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __41__PUPhotosGridViewController_handleDrop___block_invoke_2;
    uint64_t v13 = &unk_1E5F2AAE0;
    objc_copyWeak(&v15, a1 + 6);
    id v5 = v4;
    id v14 = v5;
    [a1[4] setPendingProcessDataSourceUpdateBlock:&v10];

    objc_destroyWeak(&v15);
  }
  uint64_t v6 = objc_msgSend(v3, "count", v10, v11, v12, v13);
  id v7 = [a1[5] items];
  uint64_t v8 = [v7 count];

  if (v6 != v8)
  {
    id v9 = [MEMORY[0x1E4F90118] dropImportErrorAlertControllerWithHandler:0];
    [a1[4] presentViewController:v9 animated:1 completion:0];
  }
}

BOOL __41__PUPhotosGridViewController_handleDrop___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained photosDataSource];
  id v5 = [v4 indexPathForAsset:*(void *)(a1 + 32) hintIndexPath:0 hintCollection:0];

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    id v7 = [v6 collectionView];
    [v7 scrollToItemAtIndexPath:v5 atScrollPosition:2 animated:1];
  }
  return v5 != 0;
}

- (BOOL)canHandleDropSession:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(PUPhotosGridViewController *)self canDragIn];
  id v7 = [v5 localDragSession];

  if (v7)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = [v5 items];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v28 = self;
      id v29 = v5;
      uint64_t v11 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v30 + 1) + 8 * i) localObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = v13;
            id v15 = [v14 assetReference];
            id v16 = [v15 asset];

            if (!v16)
            {
              id v20 = [MEMORY[0x1E4F28B00] currentHandler];
              v21 = (objc_class *)objc_opt_class();
              v22 = NSStringFromClass(v21);
              [v20 handleFailureInMethod:a2, v28, @"PUPhotosGridViewController.m", 5704, @"%@ should be an instance inheriting from %@, but it is nil", @"pxLocalObject.assetReference.asset", v22 object file lineNumber description];

              id v16 = 0;
LABEL_19:

              int v19 = 1;
              goto LABEL_20;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v27 = [MEMORY[0x1E4F28B00] currentHandler];
              __int16 v17 = (objc_class *)objc_opt_class();
              id v18 = NSStringFromClass(v17);
              v26 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
              [v27 handleFailureInMethod:a2, v28, @"PUPhotosGridViewController.m", 5704, @"%@ should be an instance inheriting from %@, but it is %@", @"pxLocalObject.assetReference.asset", v18, v26 object file lineNumber description];
            }
            if ([v16 sourceType] == 2) {
              goto LABEL_19;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      int v19 = 0;
LABEL_20:
      id v5 = v29;
    }
    else
    {
      int v19 = 0;
    }
  }
  else
  {
    int v19 = 1;
  }
  if ((v6 & v19) == 1)
  {
    v23 = [MEMORY[0x1E4F902C8] supportedTypeIdentifiers];
    char v24 = [v5 hasItemsConformingToTypeIdentifiers:v23];
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (BOOL)canDragIn
{
  BOOL v3 = [(PUPhotosGridViewController *)self _allowsActions:64];
  if (v3)
  {
    LOBYTE(v3) = [(PUPhotosGridViewController *)self _canAddContent];
  }
  return v3;
}

- (id)_collectionView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v28.CGFloat x = x;
    v28.CGFloat y = y;
    id v15 = NSStringFromCGPoint(v28);
    int v18 = 138413058;
    id v19 = v11;
    __int16 v20 = 2112;
    id v21 = v12;
    __int16 v22 = 2112;
    id v23 = v13;
    __int16 v24 = 2112;
    v25 = v15;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEBUG, "_collectionView: %@ itemsForAddingToDragSession: %@ atIndexPath: %@ point: %@", (uint8_t *)&v18, 0x2Au);
  }
  id v16 = [(PUPhotosGridViewController *)self _dragItemsForIndexPath:v13];

  return v16;
}

- (id)_collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEBUG, "_collectionView: %@ itemsForBeginningDragSession: %@ atIndexPath: %@", (uint8_t *)&v14, 0x20u);
  }

  id v12 = [(PUPhotosGridViewController *)self _dragItemsForIndexPath:v10];

  return v12;
}

- (id)_collectionView:(id)a3 liftingPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ liftingPreviewParametersForItemAtIndexPath: %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = [(PUPhotosGridViewController *)self _previewParametersForItemAtIndexPath:v7];

  return v9;
}

- (id)collectionView:(id)a3 dragPreviewParametersForItemAtIndexPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "_collectionView: %@ liftingPreviewParametersForItemAtIndexPath: %@", (uint8_t *)&v11, 0x16u);
  }

  id v9 = [(PUPhotosGridViewController *)self _previewParametersForItemAtIndexPath:v7];

  return v9;
}

- (id)_previewParametersForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  if ([(PUPhotosGridViewController *)self cellFillMode] == 2)
  {
    id v6 = [(PUPhotosGridViewController *)self collectionView];
    id v7 = [v6 cellForItemAtIndexPath:v4];

    id v8 = [(PUPhotosGridViewController *)self assetAtIndexPath:v4];
    [v8 aspectRatio];
    double v10 = v9;
    [v7 bounds];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", PURectWithAspectRatioFittingRect(v10, v11, v12, v13, v14));
    [v5 setVisiblePath:v15];
  }
  return v5;
}

- (id)_dragItemsForIndexPath:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(PUPhotosGridViewController *)self canDragOut]
    || [(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v4])
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
  id v6 = [(PUPhotosGridViewController *)self photosDataSource];
  id v7 = [v6 assetReferenceAtIndexPath:v4];

  id v8 = (void *)MEMORY[0x1E4F90698];
  v17[0] = v7;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  LOBYTE(v8) = [v8 confidentialWarningRequiredForAssetReferences:v9];

  if (v8)
  {
    [(PUPhotosGridViewController *)self _presentConfidentialityWarning];
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    CGFloat v11 = [v7 asset];
    CGFloat v12 = PXDragAndDropItemProviderForDisplayAsset();

    if (!v12)
    {
      id v5 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_9;
    }
    CGFloat v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v12];
    CGFloat v14 = (void *)[objc_alloc(MEMORY[0x1E4F90120]) initWithAssetReference:v7];
    [v13 setLocalObject:v14];

    __int16 v16 = v13;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  }
  id v5 = v10;
LABEL_9:

LABEL_10:
  return v5;
}

- (void)_presentConfidentialityWarning
{
  id v3 = [MEMORY[0x1E4F90698] confidentialityAlertWithConfirmAction:0];
  [(PUPhotosGridViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (BOOL)_confidentialityWarningRequiredForAsset:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F90698] confidentialityCheckRequired]) {
    char v4 = [MEMORY[0x1E4F90698] confidentialWarningRequiredForAsset:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)canDragOut
{
  id v3 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "canDragOut", v8, 2u);
  }

  char v4 = [MEMORY[0x1E4F90110] sharedInstance];
  if ([v4 dragOutEnabled])
  {
    id v5 = [(PUPhotosGridViewController *)self sessionInfo];
    int v6 = [v5 isSelectingAssets] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)photosGridBarsHelper:(id)a3 didChange:(unint64_t)a4
{
  if (a4) {
    [(PUPhotosGridViewController *)self updateNavigationBarAnimated:0];
  }
}

- (id)photosGridBarsHelper:(id)a3 titleForPhotoSelectionManager:(id)a4
{
  id v4 = a4;
  id v5 = [(id)objc_opt_class() _localizedSelectionTitleWithPhotoSelectionManager:v4];

  return v5;
}

- (void)photosGridBarsHelper:(id)a3 getTitle:(id *)a4 prompt:(id *)a5 shouldHideBackButton:(BOOL *)a6 leftBarButtonItems:(id *)a7 rightBarButtonItems:(id *)a8 forPhotoSelectionManager:(id)a9
{
}

- (double)topMarginForPhotosGlobalFooterView:(id)a3
{
  return 0.0;
}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  if ([(PUPhotosGridViewController *)self px_isVisible])
  {
    [(PUPhotosGridViewController *)self updateGlobalFooter];
  }
}

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5) {
    [(PUPhotosGridViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else {
    [(PUPhotosGridViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (unint64_t)additionalOneUpViewControllerOptions
{
  return 0;
}

- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4
{
  id v5 = [(PUPhotosGridViewController *)self collectionView];
  [v5 _setAutomaticContentOffsetAdjustmentEnabled:1];

  id v6 = [(PUPhotosGridViewController *)self photosDataSource];
  [v6 stopForceIncludingAllAssets];
}

- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3
{
  return 1;
}

- (void)oneUpPresentationHelper:(id)a3 willPresentOneUpViewController:(id)a4
{
}

- (int64_t)oneUpPresentationOrigin
{
  return 0;
}

- (BOOL)allowSelectAllButton
{
  return 0;
}

- (BOOL)allowSlideshowButton
{
  return ![(PUPhotosGridViewController *)self isTrashBinViewController];
}

- (id)pu_debugRows
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PUPhotosGridViewController *)self collectionView];
  id v5 = [v4 collectionViewLayout];

  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_msgSend(v5, "pu_debugRows");
    [v3 addObjectsFromArray:v6];
  }
  id v7 = [(PUPhotosGridViewController *)self collectionView];
  objc_initWeak(&location, v7);

  id v8 = (void *)MEMORY[0x1E4F940F8];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  CGFloat v13 = __42__PUPhotosGridViewController_pu_debugRows__block_invoke;
  CGFloat v14 = &unk_1E5F2E530;
  objc_copyWeak(&v15, &location);
  double v9 = objc_msgSend(v8, "px_rowWithTitle:postDismissalAction:", @"Begin Scroll Test", &v11);
  objc_msgSend(v3, "addObject:", v9, v11, v12, v13, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v3;
}

void __42__PUPhotosGridViewController_pu_debugRows__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performScrollTest:@"ScrollPhotosGrid" iterations:1000 delta:20];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = +[PURootSettings sharedInstance];

  if (v7 == v10) {
    int v8 = [v6 isEqualToString:@"allowIrisUI"];
  }
  else {
    int v8 = 1;
  }
  id v9 = +[PUPhotosGridSettings sharedInstance];

  if (v9 != v10)
  {
    if (!v8) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [(PUPhotosGridViewController *)self gridSettings:v10 changedValueForKey:v6];
  if (v8)
  {
LABEL_6:
    [(PUPhotosGridViewController *)self updateLayoutMetrics];
    [(PUPhotosGridViewController *)self updateInterfaceForModelReloadAnimated:1];
  }
LABEL_7:
}

- (void)sessionInfoPhotoSelectionDidChange:(id)a3
{
  [(PUPhotosGridViewController *)self updateNavigationBarAnimated:0];
  [(PUPhotosGridViewController *)self _updateNavigationBannerAnimated:0];
  [(PUPhotosGridViewController *)self _updateCollectionViewMultipleSelection];
}

- (void)deselectAllItemsAnimated:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(PUPhotosGridViewController *)self selectedIndexPaths];
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
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [v10 section];
        uint64_t v12 = [NSNumber numberWithUnsignedInteger:v11];
        CGFloat v13 = [v4 objectForKeyedSubscript:v12];

        if (!v13)
        {
          CGFloat v13 = [MEMORY[0x1E4F28E60] indexSet];
          CGFloat v14 = [NSNumber numberWithUnsignedInteger:v11];
          [v4 setObject:v13 forKeyedSubscript:v14];
        }
        objc_msgSend(v13, "addIndex:", objc_msgSend(v10, "item"));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PUPhotosGridViewController_deselectAllItemsAnimated___block_invoke;
  v16[3] = &unk_1E5F2AAB8;
  v16[4] = self;
  BOOL v17 = a3;
  [v4 enumerateKeysAndObjectsUsingBlock:v16];
}

void __55__PUPhotosGridViewController_deselectAllItemsAnimated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  objc_msgSend(v5, "setSelected:itemsAtIndexes:inSection:animated:", 0, v6, objc_msgSend(a2, "unsignedIntegerValue"), *(unsigned __int8 *)(a1 + 40));
}

- (void)setSelected:(BOOL)a3 itemsAtIndexes:(id)a4 inSection:(int64_t)a5 animated:(BOOL)a6
{
  BOOL v7 = a3;
  id v9 = a4;
  id v10 = [(PUPhotosGridViewController *)self photoCollectionAtIndex:a5];
  uint64_t v11 = [(PUPhotosGridViewController *)self photoSelectionManager];
  uint64_t v12 = v11;
  if (v7) {
    [v11 selectAssetsAtIndexes:v9 inAssetCollection:v10];
  }
  else {
    [v11 deselectAssetsAtIndexes:v9 inAssetCollection:v10];
  }

  CGFloat v13 = [(PUPhotosGridViewController *)self collectionView];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PUPhotosGridViewController_setSelected_itemsAtIndexes_inSection_animated___block_invoke;
  v15[3] = &unk_1E5F2AA90;
  int64_t v17 = a5;
  id v14 = v13;
  id v16 = v14;
  BOOL v18 = v7;
  [v9 enumerateIndexesUsingBlock:v15];
  if (![(PUPhotosGridViewController *)self isPerformingCoalescedSelectionUpdates])[(PUPhotosGridViewController *)self updatePeripheralInterfaceAnimated:0]; {
}
  }

void __76__PUPhotosGridViewController_setSelected_itemsAtIndexes_inSection_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) cellForItemAtIndexPath:v4];
  [v3 setSelectionBadgeVisible:*(unsigned __int8 *)(a1 + 48)];
}

- (BOOL)isPerformingCoalescedSelectionUpdates
{
  return self->_coalescedSelectionEntranceCount != 0;
}

- (void)endCoalescedSelectionUpdates
{
  if (![(PUPhotosGridViewController *)self isPerformingCoalescedSelectionUpdates])
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewController.m" lineNumber:5379 description:@"Got mismatched request to end coalesced selection updates"];
  }
  --self->_coalescedSelectionEntranceCount;
  if (![(PUPhotosGridViewController *)self isPerformingCoalescedSelectionUpdates])
  {
    [(PUPhotosGridViewController *)self updatePeripheralInterfaceAnimated:0];
  }
}

- (void)beginCoalescedSelectionUpdates
{
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUPhotosGridViewController *)self _removeActionSheet];
  id v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 presentingViewController];
    [v7 dismissViewControllerAnimated:0 completion:0];
  }
  uint64_t v8 = [(PUPhotosGridViewController *)self _actionConfirmationAlert];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 presentingViewController];
    [v10 dismissViewControllerAnimated:0 completion:0];
  }
  uint64_t v11 = [(PUPhotosGridViewController *)self activitySharingController];
  uint64_t v12 = [v11 activityViewControllerIfAvailable];

  if (v12)
  {
    CGFloat v13 = [v12 presentingViewController];

    if (v13)
    {
      [(PUPhotosGridViewController *)self setActivitySharingController:0];
      [(PUPhotosGridViewController *)self dismissViewControllerAnimated:0 completion:0];
    }
  }
  id v14 = [(PUPhotosGridViewController *)self _slideshowViewController];
  id v15 = v14;
  if (v14)
  {
    id v16 = [v14 presentingViewController];

    if (v16)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __57__PUPhotosGridViewController_prepareForDismissingForced___block_invoke;
      v21[3] = &unk_1E5F2ED10;
      v21[4] = self;
      [(PUPhotosGridViewController *)self dismissViewControllerAnimated:0 completion:v21];
    }
  }
  int64_t v17 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  if (v17)
  {
    BOOL v18 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
    char v19 = [v18 dismissOneUpViewControllerForced:v3 animated:0];
  }
  else
  {
    char v19 = 1;
  }
  [(PUPhotosGridViewController *)self setEditing:0 animated:0];

  return v19;
}

uint64_t __57__PUPhotosGridViewController_prepareForDismissingForced___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSlideshowViewController:0];
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = a3;
  id v8 = [v4 presentedViewController];
  id v5 = [(PUPhotosGridViewController *)self _shareAssetsPopoverController];

  if (v5 == v4) {
    [(PUPhotosGridViewController *)self _setShareAssetsPopoverController:0];
  }
  id v6 = [(PUPhotosGridViewController *)self _actionConfirmationAlert];

  BOOL v7 = v8;
  if (v8 == v6)
  {
    [(PUPhotosGridViewController *)self _setActionConfirmationAlert:0];
    BOOL v7 = v8;
  }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  return 1;
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v11 = a3;
  id v4 = [v11 presentedViewController];
  id v5 = [(PUPhotosGridViewController *)self _actionConfirmationAlert];
  if (v4 == v5 && self->_shareToolbarButton)
  {
    int v10 = [(PUPhotosGridViewController *)self isEditing];

    if (v10) {
      [v11 setBarButtonItem:self->_shareToolbarButton];
    }
  }
  else
  {
  }
  id v6 = [(PUPhotosGridViewController *)self _removeActionSheet];
  if (v4 == v6)
  {
    BOOL v7 = [(PUPhotosGridViewController *)self _deleteActionController];

    if (!v7) {
      goto LABEL_7;
    }
    id v8 = [(PUPhotosGridViewController *)self _deleteActionController];
    uint64_t v9 = [v8 action];

    id v6 = [(PUPhotosGridViewController *)self _referenceBarButtonItemForDeleteAction:v9];
    [v11 setBarButtonItem:v6];
  }

LABEL_7:
}

- (BOOL)_navigateToBottomIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUPhotosGridViewController *)self isViewLoaded])
  {
    id v5 = [(PUPhotosGridViewController *)self collectionView];
    char v6 = objc_msgSend(v5, "px_isScrolledAtEdge:", 3);

    if (v6) {
      return 1;
    }
  }
  [(PUPhotosGridViewController *)self navigateToBottomAnimated:v3];
  return 0;
}

- (BOOL)pu_scrollToInitialPositionAnimated:(BOOL)a3
{
  return ![(PUPhotosGridViewController *)self _navigateToBottomIfNeededAnimated:a3];
}

- (void)navigateToBottomAnimated:(BOOL)a3
{
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PUPhotosGridViewController_navigateToBottomAnimated___block_invoke;
  aBlock[3] = &unk_1E5F2D918;
  objc_copyWeak(&v9, &location);
  BOOL v10 = a3;
  id v5 = (void (**)(void))_Block_copy(aBlock);
  if ([(PUPhotosGridViewController *)self isViewLoaded])
  {
    v5[2](v5);
  }
  else
  {
    char v6 = _Block_copy(v5);
    id pendingNavigationBlock = self->_pendingNavigationBlock;
    self->_id pendingNavigationBlock = v6;
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__PUPhotosGridViewController_navigateToBottomAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained collectionView];

  objc_msgSend(v3, "px_scrollToEdge:animated:", 3, *(unsigned __int8 *)(a1 + 40));
}

- (void)navigateToRevealPhoto:(id)a3 inAssetContainer:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PUPhotosGridViewController_navigateToRevealPhoto_inAssetContainer_animated___block_invoke;
  aBlock[3] = &unk_1E5F2AA68;
  objc_copyWeak(&v18, &location);
  id v10 = v9;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  BOOL v19 = a5;
  uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  if ([(PUPhotosGridViewController *)self isViewLoaded]
    && self->_didScrollToInitialPosition)
  {
    if (![(PUPhotosGridViewController *)self isContentViewInSyncWithModel]) {
      [(PUPhotosGridViewController *)self updateInterfaceForModelReloadAnimated:0];
    }
    v12[2](v12);
  }
  else
  {
    CGFloat v13 = _Block_copy(v12);
    id pendingNavigationBlock = self->_pendingNavigationBlock;
    self->_id pendingNavigationBlock = v13;
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __78__PUPhotosGridViewController_navigateToRevealPhoto_inAssetContainer_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained gridSpec];
  uint64_t v3 = [v2 forceLoadInitialSectionCount];

  id v4 = [WeakRetained photosDataSource];
  uint64_t v5 = [v4 sectionForAssetCollection:*(void *)(a1 + 32)];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    [v4 forceAccurateSection:v5 andSectionsBeforeAndAfter:v3];
  }
  char v6 = [v4 indexPathForAsset:*(void *)(a1 + 40) inCollection:*(void *)(a1 + 32)];
  if (v6)
  {
    [WeakRetained _setDidForceDataSource:1];
    BOOL v7 = [WeakRetained collectionView];
    objc_msgSend(v4, "setBackgroundFetchOriginSection:", objc_msgSend(v6, "section"));
    [v4 startBackgroundFetchIfNeeded];
    [v7 scrollToItemAtIndexPath:v6 atScrollPosition:2 animated:*(unsigned __int8 *)(a1 + 56)];
  }
}

- (id)_indexPathForAsset:(id)a3 inAssetCollection:(id)a4 refetchIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PUPhotosGridViewController *)self photosDataSource];
  id v11 = [v10 indexPathForAsset:v8 inCollection:v9];
  if (!v11 && v5)
  {
    [v10 refetchResultsForAssetCollection:v9];
    id v11 = [v10 indexPathForAsset:v8 inCollection:v9];
  }

  return v11;
}

- (void)navigateToPhoto:(id)a3 inAssetContainer:(id)a4 refetchIfNeeded:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = [(PUPhotosGridViewController *)self _indexPathForAsset:a3 inAssetCollection:a4 refetchIfNeeded:a5];
  if (v8)
  {
    id v9 = v8;
    [(PUPhotosGridViewController *)self _navigateToPhotoAtIndexPath:v8 animated:v6 interactive:0];
    id v8 = v9;
  }
}

- (void)navigateToPhoto:(id)a3 inAssetContainer:(id)a4 animated:(BOOL)a5
{
}

- (id)displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 preferredAttributesPromise:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = PLMemoriesGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEBUG, "Creating display title info from asset collection %@", buf, 0xCu);
  }

  id v11 = PLMemoriesGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v8 localizedTitle];
    CGFloat v13 = [v8 localizedSubtitle];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEBUG, "Asset collection title:'%@' subtitle:'%@'", buf, 0x16u);
  }
  id v14 = PLMemoriesGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    id v15 = [(PUPhotosGridViewController *)self localizedTitleForAssetCollection:v8];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v15;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEBUG, "UI title:'%@'", buf, 0xCu);
  }
  id v16 = PLMemoriesGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = [MEMORY[0x1E4F38EE8] descriptionOfTitleCategory:a4];
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&uint8_t buf[4] = a4;
    *(_WORD *)&buf[8] = 2112;
    *(void *)&buf[10] = v17;
    _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEBUG, "Title category:%i “%@”", buf, 0x12u);
  }
  id v18 = +[PUPhotosGridSettings sharedInstance];
  char v19 = [v18 allowDynamicDetailsTitles];

  if ((v19 & 1) == 0)
  {

    id v9 = 0;
  }
  *(void *)buf = a4;
  long long v20 = [(PUPhotosGridViewController *)self localizedTitleForAssetCollection:v8 titleCategory:buf];
  long long v21 = [MEMORY[0x1E4F91290] defaultHelper];
  __int16 v22 = [v21 titleForDisplayableText:v20 titleCategory:*(void *)buf options:1];

  uint64_t v23 = +[PUPhotosGridSettings sharedInstance];
  [v23 simulatedDetailsAttributesLoadingDelay];
  double v25 = v24;

  uint64_t v26 = [MEMORY[0x1E4F90100] displayTitleInfoForDetailsOfAssetCollection:v8 withTitleCategory:a4 defaultTitle:v22 defaultTitleCategory:*(void *)buf titleKey:*MEMORY[0x1E4F39778] titleCategoryKey:*MEMORY[0x1E4F39770] defaultSubtitle:v25 subtitleKey:0 simulatedLoadingDelay:*MEMORY[0x1E4F39768] preferredAttributesPromise:v9];

  return v26;
}

- (void)navigateToPhotosDetailsForAssetCollection:(id)a3 animated:(BOOL)a4
{
  BOOL v23 = a4;
  v30[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v22 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v5];
  BOOL v6 = (void *)MEMORY[0x1E4F39008];
  v30[0] = v5;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  id v8 = [v6 transientCollectionListWithCollections:v7 title:0];

  id v9 = [MEMORY[0x1E4F38EE8] fetchCollectionsInCollectionList:v8 options:0];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithCollectionListFetchResult:v9 options:0];
  id v28 = v5;
  uint64_t v29 = v22;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  [v10 setExistingAssetCollectionFetchResults:v11];

  [v10 setHideHiddenAssets:1];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v10];
  uint64_t v13 = [v5 titleCategory];
  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 6;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PUPhotosGridViewController_navigateToPhotosDetailsForAssetCollection_animated___block_invoke;
  aBlock[3] = &unk_1E5F2AA18;
  id v15 = v5;
  id v27 = v15;
  id v16 = _Block_copy(aBlock);
  id v17 = [(PUPhotosGridViewController *)self displayTitleInfoForDetailsOfAssetCollection:v15 withTitleCategory:v14 preferredAttributesPromise:v16];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F90518]) initWithPhotosDataSource:v12 displayTitleInfo:v17 parentContext:0 keyAssetsFetchResult:0];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__PUPhotosGridViewController_navigateToPhotosDetailsForAssetCollection_animated___block_invoke_2;
  v24[3] = &unk_1E5F2AA40;
  id v25 = v15;
  id v19 = v15;
  [v18 performChanges:v24];
  long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F90548]) initWithContext:v18 options:0];
  long long v21 = [(PUPhotosGridViewController *)self navigationController];
  [v21 pushViewController:v20 animated:v23];
}

uint64_t __81__PUPhotosGridViewController_navigateToPhotosDetailsForAssetCollection_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F39170] preferredAttributesForMemoryCreationFromAssetCollection:*(void *)(a1 + 32) proposedAttributes:a2];
}

void __81__PUPhotosGridViewController_navigateToPhotosDetailsForAssetCollection_animated___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v2 assetCollectionType] == 1) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 0;
  }
  [v4 setViewSourceOrigin:v3];
}

- (void)navigateToPhotosDetailsForAssetCollection:(id)a3
{
}

- (void)_navigateToPhotoAtIndexPath:(id)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  [(PUPhotosGridViewController *)self _ensureOneUpPresentationHelper];
  id v9 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  [v9 presentOneUpViewControllerFromAssetAtIndexPath:v8 animated:v6 interactiveMode:v5 activity:0 editActivityCompletion:0];
}

- (void)_beginInteractiveNavigationForItemAtIndexPath:(id)a3
{
}

- (void)_updatePhotoDecorationForCell:(id)a3 animated:(BOOL)a4
{
  id v5 = [a3 photoContentView];
  id v4 = [v5 contentHelper];
  [v4 setPhotoDecoration:0];
}

- (BOOL)zoomTransition:(id)a3 transitionImageForPhotoToken:(id)a4 callback:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 5096, @"Photo Token is invalid! (%@)", v8 object file lineNumber description];
  }
  id v10 = v8;
  id v11 = [v10 objectForKeyedSubscript:@"PUGridPhotoTokenPhoto"];
  if ([v11 isRAW])
  {
    uint64_t v12 = [(PUPhotosGridViewController *)self assetIndexPathForPhotoToken:v10];
    uint64_t v13 = [(PUPhotosGridViewController *)self collectionView];
    uint64_t v14 = [v13 cellForItemAtIndexPath:v12];

    id v15 = [v14 photoContentView];
    id v16 = [v15 contentHelper];
    id v17 = [v16 photoImage];

    BOOL v18 = v17 != 0;
    if (v17) {
      v9[2](v9, v17);
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)zoomTransition:(id)a3 didFinishForOperation:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  if (a5 && a6)
  {
    id v6 = [(PUPhotosGridViewController *)self collectionView];
    [v6 setScrollEnabled:1];
  }
}

- (void)zoomTransition:(id)a3 willBeginForOperation:(int64_t)a4 animated:(BOOL)a5 interactive:(BOOL)a6
{
  if (a5 && a6)
  {
    id v6 = [(PUPhotosGridViewController *)self collectionView];
    [v6 setScrollEnabled:0];
  }
}

- (void)zoomTransition:(id)a3 shouldHidePhotoTokens:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v7 = a4;
  id v8 = [(PUPhotosGridViewController *)self mainGridLayout];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    SEL v20 = a2;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v19 = [MEMORY[0x1E4F28B00] currentHandler];
          [v19 handleFailureInMethod:v20, self, @"PUPhotosGridViewController.m", 5059, @"Photo Token is invalid! (%@)", v15 object file lineNumber description];
        }
        uint64_t v16 = [(PUPhotosGridViewController *)self assetIndexPathForPhotoToken:v15];
        if (!v16)
        {
          BOOL v18 = PLUIGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v27 = 0;
            __int16 v28 = 2112;
            uint64_t v29 = v8;
            _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "Cannot hide item at index path: %@ Layout: %@", buf, 0x16u);
          }

          goto LABEL_17;
        }
        id v17 = (void *)v16;
        if (!v12) {
          uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
        }
        [v12 addObject:v17];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_17:
    uint64_t v12 = 0;
  }

  if ([v8 conformsToProtocol:&unk_1F083F088]) {
    [v8 setHiddenItemIndexPaths:v12];
  }
}

- (BOOL)zoomTransition:(id)a3 getFrame:(CGRect *)a4 inCoordinateSpace:(id *)a5 contentMode:(int64_t *)a6 cropInsets:(UIEdgeInsets *)a7 forPhotoToken:(id)a8 operation:(int64_t)a9
{
  id v14 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 4975, @"Photo Token is invalid! (%@)", v14 object file lineNumber description];
  }
  uint64_t v15 = [(PUPhotosGridViewController *)self assetIndexPathForPhotoToken:v14];
  if (!v15) {
    goto LABEL_26;
  }
  uint64_t v16 = [(PUPhotosGridViewController *)self collectionView];
  [v16 layoutIfNeeded];
  id v17 = [v16 cellForItemAtIndexPath:v15];
  if (a9 == 2)
  {
    BOOL v18 = [v16 collectionViewLayout];
    objc_opt_class();
    double Height = 0.0;
    if (objc_opt_isKindOfClass())
    {
      id v20 = v18;
      if ([v20 sectionHeadersEnabled])
      {
        objc_msgSend(v20, "frameForSectionHeaderAtVisualSection:", objc_msgSend(v15, "section"));
        double Height = CGRectGetHeight(v59);
      }
    }
    if (v17)
    {
      [v17 frame];
      objc_msgSend(v16, "scrollRectToVisible:animated:", 0, v21 + 0.0, v22 - Height);
    }
    else
    {
      v58 = a5;
      long long v23 = [v16 layoutAttributesForItemAtIndexPath:v15];
      long long v24 = [v16 collectionViewLayout];
      long long v25 = [v24 layoutAttributesForItemAtIndexPath:v15];

      [v23 frame];
      double v27 = v26;
      [v25 frame];
      if (v27 == v28)
      {
        [v16 scrollToItemAtIndexPath:v15 atScrollPosition:2 animated:0];
      }
      else
      {
        [v25 frame];
        objc_msgSend(v16, "scrollRectToVisible:animated:", 0, v29 + 0.0, v30 - Height);
      }
      [v16 layoutIfNeeded];
      id v17 = [v16 cellForItemAtIndexPath:v15];

      a5 = v58;
    }
  }
  if (v17)
  {
    [v17 bounds];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    v39 = [(PUPhotosGridViewController *)self view];
    objc_msgSend(v17, "convertRect:toView:", v39, v32, v34, v36, v38);
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    double v47 = v46;

    int64_t v48 = [(PUPhotosGridViewController *)self cellFillMode] != 1;
    v49 = [(PUPhotosGridViewController *)self assetAtIndexPath:v15];
    v50 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v15 section]);
    if ([v49 representsBurst] && objc_msgSend(v50, "canShowAvalancheStacks"))
    {
      objc_msgSend(MEMORY[0x1E4F8A6B8], "frameOfTopImageInStackForStackFrame:", v41, v43, v45, v47);
      double v41 = v51;
      double v43 = v52;
      double v45 = v53;
      double v47 = v54;
    }
    if (a4)
    {
      a4->origin.CGFloat x = v41;
      a4->origin.CGFloat y = v43;
      a4->size.double width = v45;
      a4->size.double height = v47;
      if (a5) {
        *a5 = v17;
      }
    }
    if (a6) {
      *a6 = v48;
    }

    BOOL v55 = 1;
  }
  else
  {
LABEL_26:
    BOOL v55 = 0;
  }

  return v55;
}

- (id)zoomTransition:(id)a3 photoTokenForPhoto:(id)a4 inCollection:(id)a5
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  id v9 = [(PUPhotosGridViewController *)self photosDataSource];
  uint64_t v10 = [v9 indexPathForAsset:v7 inCollection:v8];

  uint64_t v11 = 0;
  if (v7 && v8 && v10)
  {
    v13[0] = @"PUGridPhotoTokenIndexPath";
    v13[1] = @"PUGridPhotoTokenPhoto";
    v14[0] = v10;
    v14[1] = v7;
    v13[2] = @"PUGridPhotoTokenCollection";
    v14[2] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  }

  return v11;
}

- (id)assetIndexPathForPhotoToken:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"PUGridPhotoTokenIndexPath"];
  id v6 = [v4 objectForKey:@"PUGridPhotoTokenPhoto"];
  id v7 = [v4 objectForKey:@"PUGridPhotoTokenCollection"];

  id v8 = [(PUPhotosGridViewController *)self indexPathForAsset:v6 hintCollection:v7 hintIndexPath:v5];

  return v8;
}

- (id)_indexesWithoutPlaceholdersFromIndexes:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 lastIndex];
  id v8 = 0;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v7;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:a4];
      BOOL v11 = [(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v10];

      if (v11)
      {
        if ((unint64_t)[v6 count] < 2)
        {
          id v8 = 0;
        }
        else
        {
          id v8 = (id)[v6 mutableCopy];
          [v8 removeIndex:v9];
        }
      }
      else
      {
        id v8 = v6;
      }
    }
  }

  return v8;
}

- (void)swipeSelectionManager:(id)a3 updatePhotoSelectionWithIndexes:(id)a4 inSection:(int64_t)a5 selectionMode:(int64_t)a6
{
  uint64_t v9 = [(PUPhotosGridViewController *)self _indexesWithoutPlaceholdersFromIndexes:a4 inSection:a5];
  if (v9)
  {
    uint64_t v10 = v9;
    [(PUPhotosGridViewController *)self setSelected:a6 == 0 itemsAtIndexes:v9 inSection:a5 animated:0];
    uint64_t v9 = v10;
  }
}

- (id)swipeSelectionManager:(id)a3 photoCollectionAtIndex:(unint64_t)a4
{
  return [(PUPhotosGridViewController *)self photoCollectionAtIndex:a4];
}

- (int64_t)swipeSelectionManager:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v7 = [(PUPhotosGridViewController *)self photosDataSource];
  int64_t v8 = [v7 numberOfSections];

  if (v8 <= a4)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v13 = [(PUPhotosGridViewController *)self photosDataSource];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPhotosGridViewController.m", 4899, @"Section is out of bounds %li/%li", a4, objc_msgSend(v13, "numberOfSections"));
  }
  uint64_t v9 = [(PUPhotosGridViewController *)self photosDataSource];
  uint64_t v10 = [v9 numberOfItemsInSection:a4];

  return v10
       + [(PUPhotosGridViewController *)self wantsAddPlaceholderAtEndOfSection:a4];
}

- (void)_menuControllerDidHideMenu:(id)a3
{
  self->_showingMenu = 0;
}

- (void)_hideMenuIfNeeded
{
  [(PUPhotosGridViewController *)self _setMenuIndexPath:0];
  if (self->_showingMenu)
  {
    uint64_t v3 = [MEMORY[0x1E4FB1978] sharedMenuController];
    id v4 = [(PUPhotosGridViewController *)self collectionView];
    [v3 hideMenuFromView:v4];

    self->_showingMenu = 0;
  }
}

- (void)handleLongPressGesture:(id)a3
{
  id v4 = a3;
  if ([v4 state] != 1) {
    goto LABEL_18;
  }
  id v5 = [(PUPhotosGridViewController *)self collectionView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v21 = 0;
  uint64_t v10 = -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:", &v21, v7, v9);
  id v11 = v21;
  self->_isMenuIndexPathExact = [v10 isEqual:v11];
  if (v10 || !v11)
  {
    if (v10) {
      goto LABEL_8;
    }
    id v12 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:0];
  }
  else
  {
    id v12 = v11;
  }
  uint64_t v10 = v12;
LABEL_8:
  [(PUPhotosGridViewController *)self _setMenuIndexPath:v10];
  if ([(PUPhotosGridViewController *)self _hasAtLeastOneContainer]
    && !self->_isMenuIndexPathExact
    && ([(PUPhotosGridViewController *)self isEditing] & 1) == 0
    && ![(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v10]
    && [(PUPhotosGridViewController *)self shouldShowMenu])
  {
    [(PUPhotosGridViewController *)self becomeFirstResponder];
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v10 && self->_isMenuIndexPathExact)
    {
      uint64_t v15 = [(PUPhotosGridViewController *)self collectionView];
      uint64_t v16 = [v15 cellForItemAtIndexPath:v10];

      [v16 center];
      double v7 = v17;
      double v9 = v18;
    }
    self->_showingMenu = 1;
    id v19 = [MEMORY[0x1E4FB1978] sharedMenuController];
    id v20 = [(PUPhotosGridViewController *)self collectionView];
    objc_msgSend(v19, "showMenuFromView:rect:", v20, v7, v9, v13, v14);
  }
LABEL_18:
}

- (BOOL)shouldShowMenu
{
  return ![(PUPhotosGridViewController *)self isTrashBinViewController];
}

- (void)handlePhotoOrStackPinchGestureRecognizer:(id)a3
{
  id v9 = a3;
  id v4 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  char v5 = [v4 handlePresentingPinchGestureRecognizer:v9];

  if ((v5 & 1) == 0 && [v9 state] == 2)
  {
    if ([(PUPhotosGridViewController *)self canNavigateToPhotoInteractively:1]
      && ([v9 velocity], v6 > 0.0))
    {
      double v7 = [(PUPhotosGridViewController *)self collectionView];
      [v9 locationInView:v7];
      double v8 = objc_msgSend(v7, "indexPathForItemAtPoint:");
      if (v8) {
        [(PUPhotosGridViewController *)self _beginInteractiveNavigationForItemAtIndexPath:v8];
      }
    }
    else if ([(PUPhotosGridViewController *)self canBeginStackCollapseTransition])
    {
      [v9 velocity];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];

  if (v8 == v7)
  {
    uint64_t v10 = [(PUPhotosGridViewController *)self _multiSelectInteraction];
    id v11 = [v10 gesturesForFailureRequirements];
    char v9 = [v11 containsObject:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  int v5 = [(PUPhotosGridViewController *)self isEditing];
  id v6 = [(PUPhotosGridViewController *)self sessionInfo];
  int v7 = [v6 isSelectingAssets];

  id v8 = [(PUPhotosGridViewController *)self longPressGestureRecognizer];

  if (v8 == v4)
  {
    id v11 = [(PUPhotosGridViewController *)self collectionView];
    [v4 locationInView:v11];
    id v12 = objc_msgSend(v11, "indexPathForItemAtPoint:");
    if (v12) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = [(PUPhotosGridViewController *)self shouldShowMenu];
    }
  }
  else
  {
    id v9 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];

    if (v9 == v4)
    {
      if ((v5 | v7))
      {
        BOOL v10 = 0;
      }
      else
      {
        BOOL v10 = 1;
        if (![(PUPhotosGridViewController *)self canNavigateToPhotoInteractively:1])BOOL v10 = [(PUPhotosGridViewController *)self canBeginStackCollapseTransition]; {
      }
        }
    }
    else
    {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (double)sectionedGridLayout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    BOOL v6 = [(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v5];
    int v7 = [(PUPhotosGridViewController *)self photosDataSource];
    double v8 = 1.0;
    if (!v6)
    {
      uint64_t v9 = [v5 item];
      if (v9 < objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v5, "section")))
      {
        BOOL v10 = [v7 assetAtIndexPath:v5];
        [v10 aspectRatio];
        double v8 = v11;
      }
    }
  }
  else
  {
    id v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v14 = 0;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "IndexPath missing for aspectRatioForItemAtIndexPath", v14, 2u);
    }

    double v8 = -1.0;
  }

  return v8;
}

- (BOOL)sectionedGridLayoutTransitionAutoAdjustContentOffsetEnabled:(id)a3
{
  return 0;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PUPhotosGridViewController *)self _cancelImageRequestForCell:v6];
  }
}

- (void)sectionedGridLayout:(id)a3 didPrepareTransitionIsAppearing:(BOOL)a4
{
  if (a4) {
    [(PUPhotosGridViewController *)self preheatAssetsWithPrefetchingDisabled:1];
  }
  else {
    [(PUPhotosGridViewController *)self resetPreheating];
  }
}

- (BOOL)_collectionView:(id)a3 shouldApplyTransitionContentOffset:(CGPoint)a4 contentSize:(CGSize)a5
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v7])
  {
    double v8 = [(PUPhotosGridViewController *)self sessionInfo];
    if ([v8 isSelectingAssets]) {
      int v9 = 1;
    }
    else {
      int v9 = [(PUPhotosGridViewController *)self isEditing];
    }

    unsigned int v10 = v9 & ~[v6 hasActiveDrag];
    double v11 = [v6 cellForItemAtIndexPath:v7];
    if ([(PUPhotosGridViewController *)self canNavigateToPhotoInteractively:0])
    {
      uint64_t v12 = [v11 dragState];
      if ((v10 & 1) == 0)
      {
        if (!v12)
        {
          double v13 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v7 section]);
          double v14 = [(PUPhotosGridViewController *)self assetAtIndexPath:v7];
          [(PUPhotosGridViewController *)self handleNavigateToAsset:v14 inContainer:v13];
        }
        goto LABEL_13;
      }
    }
    else if (!v10)
    {
LABEL_13:

      goto LABEL_14;
    }
    [(PUPhotosGridViewController *)self handleToggleSelectionOfItemAtIndexPath:v7];
    goto LABEL_13;
  }
  if (([(PUPhotosGridViewController *)self isEditing] & 1) == 0) {
    -[PUPhotosGridViewController didSelectAddPlaceholderInSection:](self, "didSelectAddPlaceholderInSection:", [v7 section]);
  }
LABEL_14:

  return 0;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  unsigned int v10 = [a3 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v9 forIndexPath:v8];
  [(PUPhotosGridViewController *)self configureSupplementaryView:v10 ofKind:v9 forIndexPath:v8];

  return v10;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v6])
  {
    id v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"PUAddPlaceholderCell" forIndexPath:v6];

    [(PUPhotosGridViewController *)self _configureAddPlaceholderCell:v8 animated:0];
  }
  else
  {
    id v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"PUPhotoCell" forIndexPath:v6];

    [(PUPhotosGridViewController *)self configureGridCell:v8 forItemAtIndexPath:v6];
  }

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = [(PUPhotosGridViewController *)self photosDataSource];
  uint64_t v7 = [v6 numberOfItemsInSection:a4];

  return v7
       + [(PUPhotosGridViewController *)self wantsAddPlaceholderAtEndOfSection:a4];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  uint64_t v3 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)menuActionController:(id)a3 didDismissWithActionIdentifier:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(PUPhotosGridViewController *)self photosDataSource];
  [v6 stopForceIncludingAllAssets];

  LODWORD(v6) = [v5 isEqualToString:@"com.apple.mobileslideshow.PUMenuActionController.share"];
  if (v6)
  {
    uint64_t v7 = [(PUPhotosGridViewController *)self _previewingIndexPath];
    if (v7)
    {
      id v8 = [(PUPhotosGridViewController *)self assetAtIndexPath:v7];
      if (v8)
      {
        id v9 = [(PUPhotosGridViewController *)self photosDataSource];
        unsigned int v10 = objc_msgSend(v9, "assetCollectionForSection:", objc_msgSend(v7, "section"));

        double v11 = (void *)MEMORY[0x1E4F38EB8];
        uint64_t v12 = [v8 localIdentifier];
        v18[0] = v12;
        double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        double v14 = [v8 photoLibrary];
        uint64_t v15 = objc_msgSend(v14, "px_standardLibrarySpecificFetchOptions");
        uint64_t v16 = [v11 fetchAssetsWithLocalIdentifiers:v13 options:v15];

        [(PUPhotosGridViewController *)self sender:0 shareAssetsInFetchResult:v16 forAssetCollection:v10 withCompletion:0];
      }
      else
      {
        unsigned int v10 = PLUIGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v17 = 0;
          _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Missing asset for share operation", v17, 2u);
        }
      }
    }
    else
    {
      id v8 = PLUIGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v17 = 0;
        _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Missing indexPath for share operation", v17, 2u);
      }
    }
  }
  [(PUPhotosGridViewController *)self _setPreviewingIndexPath:0];
}

- (id)previewViewControllerForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if ([(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v4])
  {
    id v5 = 0;
  }
  else
  {
    [(PUPhotosGridViewController *)self _ensureOneUpPresentationHelper];
    id v6 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
    if ([v6 canPresentOneUpViewControllerAnimated:1])
    {
      id v5 = [v6 previewViewControllerForItemAtIndexPath:v4 allowingActions:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v5;
        [v5 createMenuActionControllerForManagerIfNeeded:0 withPresentingViewController:self regionOfInterestProvider:0];
        uint64_t v7 = [v5 menuActionController];

        [v7 setDelegate:self];
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  [(PUPhotosGridViewController *)self _ensureOneUpPresentationHelper];
  uint64_t v7 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  id v8 = [v6 previewViewController];

  objc_msgSend(v7, "didDismissPreviewViewController:committing:", v8, -[PUPhotosGridViewController _previewCommitting](self, "_previewCommitting"));
  [(PUPhotosGridViewController *)self _setPreviewCommitting:0];
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  if (![(PUPhotosGridViewController *)self isInMultiSelectMode])
  {
    uint64_t v7 = [v6 previewViewController];
    [(PUPhotosGridViewController *)self _setPreviewCommitting:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __111__PUPhotosGridViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v9[3] = &unk_1E5F2ECC8;
    v9[4] = self;
    id v10 = v7;
    id v8 = v7;
    [v6 addCompletion:v9];
  }
}

void __111__PUPhotosGridViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _ensureOneUpPresentationHelper];
  id v2 = [*(id *)(a1 + 32) oneUpPresentationHelper];
  [v2 commitPreviewViewController:*(void *)(a1 + 40)];
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = [(PUPhotosGridViewController *)self collectionView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  double v11 = objc_msgSend(v6, "indexPathForItemAtPoint:", v8, v10);
  uint64_t v12 = [v6 cellForItemAtIndexPath:v11];
  [(PUPhotosGridViewController *)self _setPreviewingIndexPath:v11];
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v12];

  return v13;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = [(PUPhotosGridViewController *)self collectionView];
  double v8 = objc_msgSend(v7, "indexPathForItemAtPoint:", x, y);

  if (v8 && [(PUPhotosGridViewController *)self allowedActions])
  {
    double v9 = [(PUPhotosGridViewController *)self gridSpec];
    if ([v9 canCommitPreview])
    {
      BOOL v10 = [(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v8];

      if (!v10)
      {
        double v11 = [(PUPhotosGridViewController *)self previewViewControllerForItemAtIndexPath:v8];
        char v12 = ![(PUPhotosGridViewController *)self isInMultiSelectMode];
        double v13 = (void *)MEMORY[0x1E4FB1678];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __84__PUPhotosGridViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
        v20[3] = &unk_1E5F2A9C8;
        id v21 = v11;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        void v17[2] = __84__PUPhotosGridViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
        v17[3] = &unk_1E5F2A9F0;
        char v19 = v12;
        id v18 = v21;
        id v14 = v21;
        uint64_t v15 = [v13 configurationWithIdentifier:0 previewProvider:v20 actionProvider:v17];

        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  uint64_t v15 = 0;
LABEL_8:

  return v15;
}

id __84__PUPhotosGridViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __84__PUPhotosGridViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v1 = objc_msgSend(*(id *)(a1 + 32), "px_previewActionMenus");
    id v2 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 children:v1];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)_ensureOneUpPresentationHelper
{
  id v6 = [(PUPhotosGridViewController *)self _photoBrowserOneUpPresentationAdaptor];
  if (!v6)
  {
    id v6 = objc_alloc_init(PUPhotoBrowserOneUpPresentationAdaptor);
    [(PUPhotoBrowserOneUpPresentationAdaptor *)v6 setZoomTransitionDelegate:self];
    [(PUPhotosGridViewController *)self _setPhotoBrowserOneUpPresentationAdaptor:v6];
  }
  uint64_t v3 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  if (!v3)
  {
    id v4 = [PUOneUpPresentationHelper alloc];
    id v5 = [(PUPhotosGridViewController *)self photosDataSource];
    uint64_t v3 = [(PUOneUpPresentationHelper *)v4 initWithPhotosDataSource:v5];

    [(PUOneUpPresentationHelper *)v3 setDelegate:self];
    [(PUOneUpPresentationHelper *)v3 setAssetDisplayDelegate:v6];
    [(PUPhotosGridViewController *)self _setOneUpPresentationHelper:v3];
  }
}

- (void)_updateBackButtonTitle
{
  uint64_t v3 = [(PUPhotosGridViewController *)self navigationController];
  id v16 = [v3 viewControllers];

  uint64_t v4 = [v16 indexOfObject:self];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v5 = v4 + 1, v4 + 1 >= (unint64_t)[v16 count]))
  {
    char v8 = 1;
  }
  else
  {
    id v6 = [v16 objectAtIndex:v5];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v8 = isKindOfClass ^ 1;
  }
  double v9 = [(PUPhotosGridViewController *)self _pushedPhotoBrowserController];
  if (v9
    && ![(PUPhotosGridViewControllerSpec *)self->_gridSpec wantsBackButtonTitleForPhotoBrowser])
  {
  }
  else
  {

    if (v8)
    {
      BOOL v10 = [(PUPhotosGridViewController *)self navigationItem];
      double v11 = [v10 backBarButtonItem];

      if (!v11) {
        goto LABEL_14;
      }
      char v12 = [(PUPhotosGridViewController *)self navigationItem];
      [v12 setBackBarButtonItem:0];
      goto LABEL_13;
    }
  }
  double v13 = [(PUPhotosGridViewController *)self navigationItem];
  id v14 = [v13 backBarButtonItem];

  if (v14) {
    goto LABEL_14;
  }
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:&stru_1F06BE7B8 style:0 target:0 action:0];
  uint64_t v15 = [(PUPhotosGridViewController *)self navigationItem];
  [v15 setBackBarButtonItem:v12];

LABEL_13:
LABEL_14:
}

- (void)_configureAddPlaceholderCell:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (_configureAddPlaceholderCell_animated__onceToken != -1) {
    dispatch_once(&_configureAddPlaceholderCell_animated__onceToken, &__block_literal_global_675);
  }
  double v7 = 0.0;
  if ([(PUPhotosGridViewController *)self isEditing]) {
    double v8 = 0.0;
  }
  else {
    double v8 = 1.0;
  }
  double v9 = [v6 photoContentView];
  BOOL v10 = [v9 contentHelper];

  [v10 setPhotoImage:_configureAddPlaceholderCell_animated__image];
  [v10 setFillMode:0];
  [v10 setPhotoDecoration:_configureAddPlaceholderCell_animated__decoration];
  double v11 = (void *)MEMORY[0x1E4FB1EB0];
  v13[1] = 3221225472;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[2] = __68__PUPhotosGridViewController__configureAddPlaceholderCell_animated___block_invoke_2;
  void v13[3] = &unk_1E5F2E0A8;
  if (v4) {
    double v7 = 0.25;
  }
  id v14 = v6;
  double v15 = v8;
  id v12 = v6;
  objc_msgSend(v11, "pu_animateWithDuration:animations:", v13, v7);
}

uint64_t __68__PUPhotosGridViewController__configureAddPlaceholderCell_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

void __68__PUPhotosGridViewController__configureAddPlaceholderCell_animated___block_invoke()
{
  objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PhotoCollectionAddItemPlaceholder");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4FB1618] _systemInteractionTintColor];
  uint64_t v1 = objc_msgSend(v8, "pu_tintedImageWithColor:", v0);
  id v2 = (void *)_configureAddPlaceholderCell_animated__image;
  _configureAddPlaceholderCell_animated__image = v1;

  uint64_t v3 = objc_alloc_init(PUPhotoDecoration);
  BOOL v4 = (void *)_configureAddPlaceholderCell_animated__decoration;
  _configureAddPlaceholderCell_animated__decoration = (uint64_t)v3;

  uint64_t v5 = (void *)_configureAddPlaceholderCell_animated__decoration;
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  [v5 setBorderWidth:round(*(double *)&PUMainScreenScale_screenScale * 0.5) / *(double *)&PUMainScreenScale_screenScale];
  id v6 = (void *)_configureAddPlaceholderCell_animated__decoration;
  double v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v6 setBorderColor:v7];
}

- (void)configureSupplementaryView:(id)a3 ofKind:(id)a4 forIndexPath:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"PUGridGlobalHeader"])
  {
    [(PUPhotosGridViewController *)self configureGlobalHeaderView:v9];
  }
  else if ([v7 isEqualToString:@"PUGridGlobalFooter"])
  {
    id v8 = v9;
    [v8 setDelegate:self];
    [v8 setLayoutDelegate:self];
    [(PUPhotosGridViewController *)self configureGlobalFooterView:v8];
  }
}

- (void)_cancelImageRequestForCell:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 currentImageRequestID];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [(PUPhotosGridViewController *)self _cachingImageManager];
    [v6 cancelImageRequest:v5];

    [v7 setCurrentImageRequestID:0];
  }
}

- (void)configureDecorationsForCell:(id)a3 withAsset:(id)a4 assetCollection:(id)a5 thumbnailIsPlaceholder:(BOOL)a6 assetMayHaveChanged:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = [v12 photoContentView];
  id v16 = [v15 contentHelper];

  int v17 = !v8 || v7;
  if (v13)
  {
    if (v8 && ([v13 isCloudSharedAsset] & 1) == 0 && objc_msgSend(v13, "cloudPlaceholderKind") == 2)
    {
      uint64_t v18 = 0;
      uint64_t v19 = *MEMORY[0x1E4F91308];
      long long v31 = *(_OWORD *)(MEMORY[0x1E4F91308] + 8);
      uint64_t v32 = *(void *)(MEMORY[0x1E4F91308] + 24);
      uint64_t v20 = 1;
    }
    else
    {
      BOOL v21 = [(PUPhotosGridViewController *)self isTrashBinViewController];
      long long v31 = *(_OWORD *)(MEMORY[0x1E4F91308] + 8);
      uint64_t v32 = *(void *)(MEMORY[0x1E4F91308] + 24);
      if (v21)
      {
        uint64_t v20 = 0;
        uint64_t v19 = *MEMORY[0x1E4F91308];
        uint64_t v18 = 1;
      }
      else
      {
        double v22 = [(PUPhotosGridViewController *)self _badgeManager];
        long long v23 = v22;
        if (v22)
        {
          [v22 badgeInfoForAsset:v13 inCollection:v14 options:0];
          uint64_t v24 = *(void *)&v30[0];
        }
        else
        {
          uint64_t v24 = 0;
          memset(v30, 0, sizeof(v30));
        }
        long long v31 = *(_OWORD *)((char *)v30 + 8);
        uint64_t v32 = *((void *)&v30[1] + 1);

        long long v25 = +[PUPhotosGridSettings sharedInstance];
        unsigned int v26 = [v25 badgeAllItemsAsFavorites];

        uint64_t v18 = 0;
        uint64_t v20 = 0;
        uint64_t v19 = v24 | v26;
      }
    }
    *(void *)&v30[0] = v19;
    *(_OWORD *)((char *)v30 + 8) = v31;
    *((void *)&v30[1] + 1) = v32;
    [v16 setBadgeInfo:v30];
    [v16 setTextBannerVisible:v18];
    if (v18)
    {
      LOBYTE(v30[0]) = 0;
      double v27 = [(PUPhotosGridViewController *)self _localizedBannerTextForAsset:v13 isDestructive:v30];
      double v28 = [v16 textBannerView];
      [v28 setText:v27];
      double v29 = [(PUPhotosGridViewController *)self gridSpec];
      objc_msgSend(v28, "setTextAlignment:", objc_msgSend(v29, "cellBannerTextAlignment"));

      [v28 setDestructiveText:LOBYTE(v30[0])];
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  if (v17) {
    [v12 setCloudIconVisible:v20];
  }
}

- (id)imageRequestOptionsForAsset:(id)a3 pixelSize:(CGSize *)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v5 setAllowPlaceholder:1];
  [v5 setNetworkAccessAllowed:1];
  objc_msgSend(v5, "setDeliveryMode:", -[PUPhotosGridViewController imageDeliveryMode](self, "imageDeliveryMode"));
  return v5;
}

- (void)configureGridCell:(id)a3 forItemAtIndexPath:(id)a4 assetMayHaveChanged:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(PUPhotosGridViewController *)self photosDataSource];
  double v11 = objc_msgSend(v10, "assetCollectionForSection:", objc_msgSend(v9, "section"));

  id v12 = [(PUPhotosGridViewController *)self assetAtIndexPathIfSafe:v9];
  id v13 = [v8 photoContentView];
  id v14 = [v13 contentHelper];

  unint64_t v15 = [(PUPhotosGridViewController *)self cellFillMode];
  [(PUPhotosGridViewController *)self imageRequestItemPixelSize];
  double v56 = v16;
  double v57 = v17;
  uint64_t v50 = 0;
  double v51 = &v50;
  uint64_t v52 = 0x3032000000;
  double v53 = __Block_byref_object_copy__669;
  double v54 = __Block_byref_object_dispose__670;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke;
  aBlock[3] = &unk_1E5F2A978;
  BOOL v49 = a5;
  id v18 = v14;
  unint64_t v48 = v15;
  id v42 = v18;
  double v43 = self;
  id v19 = v11;
  id v44 = v19;
  id v20 = v12;
  id v45 = v20;
  id v21 = v8;
  id v46 = v21;
  id v22 = v9;
  id v47 = v22;
  id v55 = _Block_copy(aBlock);
  [(PUPhotosGridViewController *)self _cancelImageRequestForCell:v21];
  char v40 = 0;
  long long v23 = [(PUPhotosGridViewController *)self imageForAsset:v20 outIsPlaceholder:&v40];
  if (v23)
  {
    (*(void (**)(void))(v51[5] + 16))();
    uint64_t v24 = 0;
  }
  else
  {
    double v27 = [(PUPhotosGridViewController *)self imageRequestOptionsForAsset:v20 pixelSize:&v56];
    id v26 = v18;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    char v39 = 0;
    objc_initWeak(&location, v21);
    objc_initWeak(&from, self);
    long long v25 = [(PUPhotosGridViewController *)self _cachingImageManager];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_2;
    v28[3] = &unk_1E5F2A9A0;
    objc_copyWeak(&v33, &location);
    objc_copyWeak(&v34, &from);
    long long v31 = &v50;
    uint64_t v32 = v38;
    id v29 = v20;
    id v30 = v19;
    BOOL v35 = a5;
    uint64_t v24 = objc_msgSend(v25, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v29, v15 < 2, v27, v28, v56, v57);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    _Block_object_dispose(v38, 8);
  }
  objc_msgSend(v21, "setCurrentImageRequestID:", v24, v26);

  _Block_object_dispose(&v50, 8);
}

void __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 88)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 0;
  }
  id v19 = v5;
  if (!v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) photoImage];

    id v19 = (id)v7;
  }
  [*(id *)(a1 + 32) setAvoidsImageViewIfPossible:1];
  [*(id *)(a1 + 32) setFillMode:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) photoSize];
  double v9 = v8;
  [v19 size];
  double v11 = v10;
  id v12 = *(void **)(a1 + 32);
  [v19 size];
  objc_msgSend(v12, "setPhotoSize:");
  id v13 = [*(id *)(a1 + 40) gridSpec];
  if ([v13 displaysAvalancheStacks]
    && [*(id *)(a1 + 48) canShowAvalancheStacks])
  {
    if ([*(id *)(a1 + 56) representsBurst])
    {
      uint64_t v14 = 1;
    }
    else
    {
      id v18 = +[PUPhotosGridSettings sharedInstance];
      uint64_t v14 = [v18 displayAllItemsAsBursts];
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  [*(id *)(a1 + 32) setNeedsAvalancheStack:v14];
  unint64_t v15 = *(void **)(a1 + 32);
  double v16 = +[PUInterfaceManager currentTheme];
  id v17 = [v16 photoCollectionViewBackgroundColor];
  objc_msgSend(v15, "setAvalancheStackBackgroundColor:", objc_msgSend(v17, "CGColor"));

  [*(id *)(a1 + 32) setPhotoImage:v19];
  objc_msgSend(*(id *)(a1 + 32), "setFlattensBadgeView:", objc_msgSend(*(id *)(a1 + 40), "canBeginStackCollapseTransition") ^ 1);
  [*(id *)(a1 + 40) configureDecorationsForCell:*(void *)(a1 + 64) withAsset:*(void *)(a1 + 56) assetCollection:*(void *)(a1 + 48) thumbnailIsPlaceholder:a3 assetMayHaveChanged:*(unsigned __int8 *)(a1 + 88)];
  [*(id *)(a1 + 40) _updateSelectionForCell:*(void *)(a1 + 64) atIndexPath:*(void *)(a1 + 72)];
  [*(id *)(a1 + 40) _updatePhotoDecorationForCell:*(void *)(a1 + 64) animated:0];
  [*(id *)(a1 + 40) _updateProgressForCell:*(void *)(a1 + 64) atIndexPath:*(void *)(a1 + 72)];
  if ([*(id *)(a1 + 40) canDragOut]
    && ([*(id *)(a1 + 40) isAddPlaceholderAtIndexPath:*(void *)(a1 + 72)] & 1) == 0)
  {
    [*(id *)(a1 + 64) setDraggable:1];
  }
  if (v9 != v11) {
    [*(id *)(a1 + 64) setNeedsLayout];
  }
}

void __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v8 = objc_loadWeakRetained((id *)(a1 + 72));
  if (v5)
  {
    double v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39710]];
    uint64_t v10 = [v9 BOOLValue];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v11)
  {
    (*(void (**)(uint64_t, id, uint64_t))(v11 + 16))(v11, v5, v10);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;
LABEL_6:

    goto LABEL_7;
  }
  if (v5)
  {
    if (WeakRetained)
    {
      long long v25 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F39718]];
      int v26 = [v25 intValue];
      int v27 = [WeakRetained currentImageRequestID];

      if (v26 == v27)
      {
        if (*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != v10) {
          [v8 configureDecorationsForCell:WeakRetained withAsset:*(void *)(a1 + 32) assetCollection:*(void *)(a1 + 40) thumbnailIsPlaceholder:v10 assetMayHaveChanged:*(unsigned __int8 *)(a1 + 80)];
        }
        double v28 = [WeakRetained photoContentView];
        id v13 = [v28 contentHelper];

        [v13 updatePhotoImageWithoutReconfiguring:v5];
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  if (MEMORY[0x1B3E7A510]())
  {
    uint64_t v14 = +[PUPhotosGridSettings sharedInstance];
    int v15 = [v14 flashDegradedImages];

    if (v15)
    {
      double v16 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F396F8]];
      int v17 = [v16 BOOLValue];

      if (v17)
      {
        id v18 = objc_alloc(MEMORY[0x1E4FB1EB0]);
        id v19 = [WeakRetained photoContentView];
        [v19 bounds];
        id v20 = objc_msgSend(v18, "initWithFrame:");

        id v21 = [MEMORY[0x1E4FB1618] darkGrayColor];
        [v20 setBackgroundColor:v21];

        [v20 setUserInteractionEnabled:0];
        id v22 = [WeakRetained photoContentView];
        [v22 addSubview:v20];

        long long v23 = (void *)MEMORY[0x1E4FB1EB0];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_3;
        v31[3] = &unk_1E5F2ED10;
        id v32 = v20;
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_4;
        v29[3] = &unk_1E5F2CEE8;
        id v30 = v32;
        id v24 = v32;
        [v23 animateWithDuration:v31 animations:v29 completion:1.0];
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
}

uint64_t __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __87__PUPhotosGridViewController_configureGridCell_forItemAtIndexPath_assetMayHaveChanged___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)configureGridCell:(id)a3 forItemAtIndexPath:(id)a4
{
}

- (id)imageForAsset:(id)a3 outIsPlaceholder:(BOOL *)a4
{
  return 0;
}

- (void)updateVisibleSupplementaryViewsOfKind:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUPhotosGridViewController *)self collectionView];
  id v6 = [v5 _indexPathsForVisibleSupplementaryViewsOfKind:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = [v5 _visibleSupplementaryViewOfKind:v4 atIndexPath:v11];
        if (v12) {
          [(PUPhotosGridViewController *)self configureSupplementaryView:v12 ofKind:v4 forIndexPath:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)updateInterfaceForIncrementalDataSourceChanges:(id)a3
{
  id v5 = a3;
  if (([v5 hasIncrementalChanges] & 1) == 0)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewController.m" lineNumber:4076 description:@"Must have incremental changes to perform an incremental update"];
  }
  [(PUPhotosGridViewController *)self _invalidateAllAssetIndexes];
  id v6 = [v5 deletedSections];
  uint64_t v7 = [v5 insertedSections];
  uint64_t v8 = [v5 changedSections];
  uint64_t v9 = [v5 deletedIndexPaths];
  uint64_t v10 = [v5 insertedIndexPaths];
  uint64_t v11 = [v5 changedIndexPaths];
  double v28 = [v5 contentChangedIndexPaths];
  int v27 = [v5 favoriteChangedIndexPaths];

  if ([v8 count]) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = [v11 count] != 0;
  }
  if ([v6 count]) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = [v9 count] != 0;
  }
  if ([v7 count])
  {
    int v26 = v11;
    id v14 = [(PUPhotosGridViewController *)self collectionView];
LABEL_11:
    long long v15 = [(PUPhotosGridViewController *)self photoLibrary];
    long long v16 = objc_msgSend(v15, "px_beginPausingChangesWithTimeout:identifier:", @"PUPhotosGridViewController-CollectionViewBatchUpdate", 1.0);

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke;
    v35[3] = &unk_1E5F2C960;
    id v36 = v6;
    id v14 = v14;
    id v37 = v14;
    id v38 = v7;
    id v39 = v9;
    id v40 = v10;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke_2;
    v33[3] = &unk_1E5F2E1C0;
    v33[4] = self;
    id v34 = v16;
    id v17 = v16;
    [v14 performBatchUpdates:v35 completion:v33];
    if (v13)
    {
      uint64_t v18 = [(PUPhotosGridViewController *)self ppt_nextDeleteFinishedBlock];
      if (v18)
      {
        [(PUPhotosGridViewController *)self ppt_setNextDeleteFinishedBlock:0];
        v18[2](v18);
      }
    }
    id v19 = [(PUPhotosGridViewController *)self photosDataSource];
    [v19 pauseChangeDeliveryFor:@"PUPhotosGridViewController-Padding" identifier:1.0];

    goto LABEL_16;
  }
  if ([v10 count]) {
    int v24 = 1;
  }
  else {
    int v24 = v13;
  }
  if ((v24 | v12) != 1) {
    goto LABEL_19;
  }
  int v26 = v11;
  id v14 = [(PUPhotosGridViewController *)self collectionView];
  if (v24) {
    goto LABEL_11;
  }
LABEL_16:
  id v20 = [MEMORY[0x1E4F1CA80] set];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke_3;
  aBlock[3] = &unk_1E5F2A950;
  id v30 = v14;
  id v31 = v20;
  id v32 = self;
  id v21 = v20;
  id v22 = v14;
  long long v23 = (void (**)(void *, void *))_Block_copy(aBlock);
  v23[2](v23, v28);
  v23[2](v23, v27);
  if (v8) {
    [(PUPhotosGridViewController *)self updateVisibleSectionHeadersAtIndexes:v8];
  }
  [(PUPhotosGridViewController *)self updatePeripheralInterfaceAnimated:1];

  uint64_t v11 = v26;
LABEL_19:
  [(PUPhotosGridViewController *)self _hideMenuIfNeeded];
  [(PUPhotosGridViewController *)self setContentViewInSyncWithModel:1];
}

uint64_t __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 32)) {
    UIEdgeInsets result = objc_msgSend(*(id *)(result + 40), "deleteSections:");
  }
  if (*(void *)(v1 + 48)) {
    UIEdgeInsets result = objc_msgSend(*(id *)(v1 + 40), "insertSections:");
  }
  if (*(void *)(v1 + 56)) {
    UIEdgeInsets result = objc_msgSend(*(id *)(v1 + 40), "deleteItemsAtIndexPaths:");
  }
  if (*(void *)(v1 + 64))
  {
    id v2 = *(void **)(v1 + 40);
    return objc_msgSend(v2, "insertItemsAtIndexPaths:");
  }
  return result;
}

void __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) beginBatchPreheating];
    [*(id *)(a1 + 32) resetPreheating];
    [*(id *)(a1 + 32) preheatAssets];
    [*(id *)(a1 + 32) endBatchPreheating];
  }
  id v3 = [*(id *)(a1 + 32) photoLibrary];
  objc_msgSend(v3, "px_endPausingChanges:", *(void *)(a1 + 40));
}

void __77__PUPhotosGridViewController_updateInterfaceForIncrementalDataSourceChanges___block_invoke_3(id *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v9 = [a1[4] cellForItemAtIndexPath:v8];
        if (v9 && ([a1[5] containsObject:v8] & 1) == 0)
        {
          [a1[6] configureGridCell:v9 forItemAtIndexPath:v8 assetMayHaveChanged:0];
          [a1[5] addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)updateInterfaceForModelReloadAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUPhotosGridViewController *)self isViewLoaded])
  {
    [(PUPhotosGridViewController *)self beginBatchPreheating];
    [(PUPhotosGridViewController *)self _invalidateAllAssetIndexes];
    uint64_t v5 = [(PUPhotosGridViewController *)self mainGridLayout];
    [v5 invalidateLayout];

    uint64_t v6 = [(PUPhotosGridViewController *)self collectionView];
    [v6 reloadData];

    [(PUPhotosGridViewController *)self resetPreheating];
    [(PUPhotosGridViewController *)self preheatAssets];
    [(PUPhotosGridViewController *)self endBatchPreheating];
    [(PUPhotosGridViewController *)self setContentViewInSyncWithModel:1];
    [(PUPhotosGridViewController *)self updatePeripheralInterfaceAnimated:v3];
    [(PUPhotosGridViewController *)self _hideMenuIfNeeded];
  }
}

- (void)updateEmptyPlaceholderView
{
  if ([(PUPhotosGridViewController *)self isViewLoaded])
  {
    if ([(PUPhotosGridViewController *)self wantsPlaceholderView])
    {
      BOOL v3 = [MEMORY[0x1E4FB1658] emptyConfiguration];
      id v18 = 0;
      id v19 = 0;
      id v16 = 0;
      id v17 = 0;
      [(PUPhotosGridViewController *)self getEmptyPlaceholderViewTitle:&v19 message:&v18 buttonTitle:&v17 buttonAction:&v16];
      id v4 = v19;
      id v5 = v18;
      id v6 = v17;
      id v7 = v16;
      [v3 setText:v4];
      [v3 setSecondaryText:v5];
      uint64_t v8 = [v3 buttonProperties];
      uint64_t v9 = [v8 configuration];
      [v9 setTitle:v6];

      long long v10 = (void *)MEMORY[0x1E4FB13F0];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __56__PUPhotosGridViewController_updateEmptyPlaceholderView__block_invoke;
      v14[3] = &unk_1E5F2A928;
      id v15 = v7;
      id v11 = v7;
      long long v12 = [v10 actionWithHandler:v14];
      long long v13 = [v3 buttonProperties];
      [v13 setPrimaryAction:v12];

      [(PUPhotosGridViewController *)self _setContentUnavailableConfiguration:v3];
    }
    else
    {
      [(PUPhotosGridViewController *)self _setContentUnavailableConfiguration:0];
    }
    [(PUPhotosGridViewController *)self emptyPlaceholderViewDidChange];
  }
}

uint64_t __56__PUPhotosGridViewController_updateEmptyPlaceholderView__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)wantsPlaceholderView
{
  BOOL v3 = [(PUPhotosGridViewController *)self isEmpty];
  if (v3) {
    LOBYTE(v3) = ![(PUPhotosGridViewController *)self wantsGlobalFooter];
  }
  return v3;
}

- (void)getEmptyPlaceholderViewTitle:(id *)a3 message:(id *)a4 buttonTitle:(id *)a5 buttonAction:(id *)a6
{
  id v11 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  long long v12 = PXPhotoKitLocalizedTitleForEmptyCollectionListFetchResult();

  if ([(PUPhotosGridViewController *)self isTrashBinViewController])
  {
    long long v13 = 0;
  }
  else
  {
    id v14 = [(PUPhotosGridViewController *)self collectionListFetchResult];
    id v15 = PXPhotoKitLocalizedMessageForEmptyCollectionListFetchResult();
    long long v13 = [v15 string];
  }
  id v17 = v12;
  *a3 = v17;
  id v16 = v13;
  *a4 = v16;
  *a5 = 0;
  *a6 = 0;
}

- (id)_deselectAllBarButtonItem
{
  deselectAllBarButtonItem = self->_deselectAllBarButtonItem;
  if (!deselectAllBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:&stru_1F06BE7B8 style:8 target:self action:sel__handleSelectionButton_];
    id v5 = self->_deselectAllBarButtonItem;
    self->_deselectAllBarButtonItem = v4;

    id v6 = PULocalizedString(@"DESELECT_ALL_BUTTON_TITLE");
    [(UIBarButtonItem *)self->_deselectAllBarButtonItem setTitle:v6];

    deselectAllBarButtonItem = self->_deselectAllBarButtonItem;
  }
  return deselectAllBarButtonItem;
}

- (id)_selectAllBarButtonItem
{
  selectAllBarButtonItem = self->_selectAllBarButtonItem;
  if (!selectAllBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:&stru_1F06BE7B8 style:8 target:self action:sel__handleSelectionButton_];
    id v5 = self->_selectAllBarButtonItem;
    self->_selectAllBarButtonItem = v4;

    id v6 = PULocalizedString(@"SELECT_ALL_BUTTON_TITLE");
    [(UIBarButtonItem *)self->_selectAllBarButtonItem setTitle:v6];

    selectAllBarButtonItem = self->_selectAllBarButtonItem;
  }
  return selectAllBarButtonItem;
}

- (id)_selectionButton
{
  selectionButton = self->_selectionButton;
  if (!selectionButton)
  {
    id v4 = (UINavigationButton *)[objc_alloc(MEMORY[0x1E4FB19E0]) initWithTitle:&stru_1F06BE7B8 style:0];
    id v5 = self->_selectionButton;
    self->_selectionButton = v4;

    [(UINavigationButton *)self->_selectionButton addTarget:self action:sel__handleSelectionButton_ forControlEvents:64];
    [(UINavigationButton *)self->_selectionButton sizeToFit];
    selectionButton = self->_selectionButton;
  }
  return selectionButton;
}

- (id)_cancelButtonItem
{
  cancelButtonItem = self->_cancelButtonItem;
  if (!cancelButtonItem)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v5 = PLLocalizedFrameworkString();
    id v6 = (UIBarButtonItem *)[v4 initWithTitle:v5 style:2 target:self action:sel__handleCancelButton_];
    id v7 = self->_cancelButtonItem;
    self->_cancelButtonItem = v6;

    cancelButtonItem = self->_cancelButtonItem;
  }
  return cancelButtonItem;
}

- (id)_selectSessionCancelBarButtonItem
{
  selectSessionCancelBarButtonItem = self->_selectSessionCancelBarButtonItem;
  if (!selectSessionCancelBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleSelectSessionCancelButton_];
    id v5 = self->_selectSessionCancelBarButtonItem;
    self->_selectSessionCancelBarButtonItem = v4;

    selectSessionCancelBarButtonItem = self->_selectSessionCancelBarButtonItem;
  }
  return selectSessionCancelBarButtonItem;
}

- (id)_selectSessionDoneBarButtonItem
{
  selectSessionDoneBarButtonItem = self->_selectSessionDoneBarButtonItem;
  if (!selectSessionDoneBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleSelectSessionDoneButton_];
    id v5 = self->_selectSessionDoneBarButtonItem;
    self->_selectSessionDoneBarButtonItem = v4;

    selectSessionDoneBarButtonItem = self->_selectSessionDoneBarButtonItem;
  }
  return selectSessionDoneBarButtonItem;
}

- (void)_updateSubviewsOrderingAndVisibility
{
  id v11 = [(PUPhotosGridViewController *)self view];
  alternateContentView = self->_alternateContentView;
  id v4 = [(PUPhotosGridViewController *)self collectionView];
  id v5 = v4;
  if (alternateContentView)
  {
    [v4 setHidden:1];

    id v6 = [(PUPhotosGridViewController *)self _emptyPlaceholderView];
    id v7 = v6;
    uint64_t v8 = 1;
  }
  else
  {
    [v4 setHidden:0];

    id v6 = [(PUPhotosGridViewController *)self _emptyPlaceholderView];
    id v7 = v6;
    uint64_t v8 = 0;
  }
  [v6 setHidden:v8];

  uint64_t v9 = [(PUPhotosGridViewController *)self collectionView];
  [v11 sendSubviewToBack:v9];

  long long v10 = [(PUPhotosGridViewController *)self _emptyPlaceholderView];
  [v11 bringSubviewToFront:v10];

  [(UIView *)self->_alternateContentView bringSubviewToFront:self->_alternateContentView];
}

- (void)_updateNavigationBannerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PUPhotosGridViewController *)self _pickerBannerView];
  id v5 = [(PUPhotosGridViewController *)self sessionInfo];
  if ([v5 isSelectingAssets] && objc_msgSend(v5, "promptLocation") == 1)
  {
    id v6 = [v5 localizedPrompt];
  }
  else
  {
    id v6 = 0;
  }
  if ([(PUPhotosGridViewController *)self allowSelectAllButton]
    && [v5 isSelectingAssets])
  {
    id v7 = [(PUPhotosGridViewController *)self _selectionButton];
    if ([(PUPhotosGridViewController *)self _areAllAssetsSelected]) {
      uint64_t v8 = @"DESELECT_ALL_BUTTON_TITLE";
    }
    else {
      uint64_t v8 = @"SELECT_ALL_BUTTON_TITLE";
    }
    uint64_t v9 = PULocalizedString(v8);
    [v7 setTitle:v9];
    [v7 sizeToFit];
  }
  else
  {
    id v7 = 0;
  }
  [v10 setTitle:v6];
  [v10 setLeftView:v7 animated:v3];
  [v10 setRightView:0 animated:v3];
}

- (id)_pickerBannerView
{
  id v2 = [(PUPhotosGridViewController *)self navigationItem];
  BOOL v3 = objc_msgSend(v2, "pu_banner");

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 bannerView];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_updateToolbarContentsAnimated:(BOOL)a3
{
  if ([(PUPhotosGridViewController *)self shouldShowToolbar]) {
    id v4 = [(PUPhotosGridViewController *)self newToolbarItems];
  }
  else {
    id v4 = 0;
  }
  id v5 = [(PUPhotosGridViewController *)self navigationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(UIViewController *)self pu_toolbarViewModel];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__PUPhotosGridViewController__updateToolbarContentsAnimated___block_invoke;
    v9[3] = &unk_1E5F2ECC8;
    id v10 = v7;
    id v11 = v4;
    id v8 = v7;
    [v8 performChanges:v9];
  }
  else
  {
    if ([(PUPhotosGridViewController *)self shouldShowToolbar]) {
      [(PUPhotosGridViewController *)self setToolbarItems:v4];
    }
    -[UIViewController pu_performBarsVisibilityUpdatesWithAnimationSettings:](self, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 2, *MEMORY[0x1E4FB2E08]);
  }
}

uint64_t __61__PUPhotosGridViewController__updateToolbarContentsAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setToolbarItems:*(void *)(a1 + 40)];
}

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  int v10 = [(PUPhotosGridViewController *)self isEditing];
  id v11 = [(PUPhotosGridViewController *)self sessionInfo];
  int v12 = [v11 isSelectingAssets];

  if (v12
    && ([(PUPhotosGridViewController *)self sessionInfo],
        long long v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 promptLocation],
        v13,
        !v14))
  {
    id v19 = [(PUPhotosGridViewController *)self sessionInfo];
    id v70 = [v19 localizedPrompt];
  }
  else
  {
    id v70 = 0;
  }
  if (v10) {
    [(PUPhotosGridViewController *)self localizedSelectionTitle];
  }
  else {
  id v64 = [(PUPhotosGridViewController *)self title];
  }
  *a3 = v64;
  uint64_t v15 = [(PUPhotosGridViewController *)self customDoneButtonItem];
  int v72 = v10;
  if (v12)
  {
    id v16 = [(PUPhotosGridViewController *)self _selectSessionDoneBarButtonItem];
    v73 = [(PUPhotosGridViewController *)self _selectSessionCancelBarButtonItem];
  }
  else
  {
    if ([(PUPhotosGridViewController *)self canDisplayEditButton])
    {
      id v16 = [(PUPhotosGridViewController *)self editButtonItem];
      if (v10)
      {
        uint64_t v17 = [(PUPhotosGridViewController *)self _cancelButtonItem];

        v73 = 0;
        int v18 = 1;
        id v16 = (void *)v17;
        goto LABEL_20;
      }
      if ([(PUPhotosGridViewController *)self isEmpty]) {
        id v20 = @"EDIT";
      }
      else {
        id v20 = @"SELECT";
      }
      id v21 = PULocalizedString(v20);
      [v16 setTitle:v21];
    }
    else
    {
      id v16 = 0;
    }
    v73 = 0;
  }
  int v18 = 0;
LABEL_20:
  v68 = a3;
  v69 = (void *)v15;
  if (v15)
  {
    BOOL v22 = [(PUPhotosGridViewController *)self showsCustomDoneButtonItemOnLeft];
    int v23 = ![(PUPhotosGridViewController *)self showsCustomDoneButtonItemOnLeft];
  }
  else
  {
    BOOL v22 = 0;
    int v23 = 0;
  }
  BOOL v24 = [(PUPhotosGridViewController *)self showsSelectionSessionCancelButtonItemOnLeft];
  if (v73) {
    BOOL v25 = v24;
  }
  else {
    BOOL v25 = 0;
  }
  v71 = v16;
  if ((v18 | !v22))
  {
    BOOL v26 = v16 == 0;
    BOOL v27 = v16 != 0;
    if (v26) {
      char v28 = 0;
    }
    else {
      char v28 = v23;
    }
    if ((v28 & 1) == 0)
    {
      id v29 = 0;
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  id v29 = [MEMORY[0x1E4F1CA48] array];
  [v29 addObject:v15];
  BOOL v26 = v16 == 0;
  BOOL v27 = v16 != 0;
  if (v26) {
    char v30 = 0;
  }
  else {
    char v30 = v23;
  }
  if (v30)
  {
    if (v29)
    {
LABEL_38:
      [v29 addObject:v71];
      BOOL v27 = 1;
      goto LABEL_39;
    }
LABEL_37:
    id v29 = [MEMORY[0x1E4F1CA48] array];
    goto LABEL_38;
  }
LABEL_39:
  if (((v72 ^ 1 | v12) & 1) == 0)
  {
    id v31 = a7;
    id v32 = [(PUPhotosGridViewController *)self gridSpec];
    int v33 = [v32 canDisplayEditActionsInNavigationBar];

    if (v33)
    {
      if (!v29)
      {
        id v29 = [MEMORY[0x1E4F1CA48] array];
      }
      id v34 = [(PUPhotosGridViewController *)self _newEditActionItemsWithWideSpacing:0];
      [v29 addObjectsFromArray:v34];
    }
    a7 = v31;
  }
  if (v25)
  {
    if (!v29)
    {
      id v29 = [MEMORY[0x1E4F1CA48] array];
    }
    [v29 addObject:v73];
  }
  int v35 = v23 ^ 1;
  if ((v18 | v23 ^ 1))
  {
    id v36 = v69;
    int v37 = v72;
    if ((v35 & v27) == 1)
    {
      id v38 = [MEMORY[0x1E4F1CA48] array];
      [v38 addObject:v71];
    }
    else
    {
      id v38 = 0;
    }
  }
  else
  {
    id v38 = [MEMORY[0x1E4F1CA48] array];
    id v36 = v69;
    [v38 addObject:v69];
    int v37 = v72;
  }
  if (((v37 | v12) & 1) == 0 && ![(PUPhotosGridViewController *)self isEmpty])
  {
    id v39 = [(PUPhotosGridViewController *)self gridSpec];
    if (([v39 canDisplaySlideshowButton] & 1) == 0)
    {

      if (v37) {
        goto LABEL_67;
      }
LABEL_73:
      BOOL v54 = [v29 count] != 0;
      goto LABEL_74;
    }
    id v40 = a7;
    BOOL v41 = [(PUPhotosGridViewController *)self allowSlideshowButton];

    if (v41)
    {
      if (!v38)
      {
        id v38 = [MEMORY[0x1E4F1CA48] array];
      }
      slideshowButtonSpacer = self->_slideshowButtonSpacer;
      if (!slideshowButtonSpacer)
      {
        double v43 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
        id v44 = self->_slideshowButtonSpacer;
        self->_slideshowButtonSpacer = v43;

        id v45 = +[PUInterfaceManager currentTheme];
        [v45 photoCollectionToolbarTextTitleSpacerWidth];
        double v47 = v46;

        [(UIBarButtonItem *)self->_slideshowButtonSpacer setWidth:v47];
        slideshowButtonSpacer = self->_slideshowButtonSpacer;
      }
      [v38 addObject:slideshowButtonSpacer];
      slideshowButton = self->_slideshowButton;
      if (!slideshowButton)
      {
        id v49 = objc_alloc(MEMORY[0x1E4FB14A8]);
        uint64_t v50 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_SLIDESHOW");
        double v51 = (UIBarButtonItem *)[v49 initWithTitle:v50 style:0 target:self action:sel__slideshowButtonPressed_];
        uint64_t v52 = self->_slideshowButton;
        self->_slideshowButton = v51;

        slideshowButton = self->_slideshowButton;
      }
      [v38 addObject:slideshowButton];
    }
    a7 = v40;
  }
  if (!v37) {
    goto LABEL_73;
  }
LABEL_67:
  if ([(PUPhotosGridViewController *)self isEmpty]
    || ![(PUPhotosGridViewController *)self allowSelectAllButton])
  {
    BOOL v54 = 1;
LABEL_74:
    double v56 = a5;
    id v55 = a6;
    v58 = v64;
    double v57 = a4;
    goto LABEL_75;
  }
  double v53 = a7;
  if ([(PUPhotosGridViewController *)self _areAllAssetsSelected]) {
    [(PUPhotosGridViewController *)self _deselectAllBarButtonItem];
  }
  else {
  v60 = [(PUPhotosGridViewController *)self _selectAllBarButtonItem];
  }
  if (v60)
  {
    v61 = [(PUPhotosGridViewController *)self gridSpec];
    int v62 = [v61 shouldPlaceSelectAllButtonInRightNavigationBar];

    if (v62)
    {
      if (v38)
      {
        v63 = v38;
      }
      else
      {
        v63 = [MEMORY[0x1E4F1CA48] array];
        id v38 = v63;
      }
    }
    else if (v29)
    {
      v63 = v29;
    }
    else
    {
      v63 = [MEMORY[0x1E4F1CA48] array];
      id v29 = v63;
    }
    a7 = v53;
    double v56 = a5;
    id v55 = a6;
    v58 = v64;
    double v57 = a4;
    [v63 addObject:v60];
  }
  else
  {
    double v56 = a5;
    id v55 = a6;
    v58 = v64;
    double v57 = a4;
  }

  BOOL v54 = 1;
LABEL_75:
  id v59 = v58;
  id *v68 = v59;
  if (v57) {
    id *v57 = v70;
  }
  if (v56) {
    *double v56 = v54;
  }
  if (v55) {
    *id v55 = v29;
  }
  if (a7) {
    *a7 = v38;
  }
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUPhotosGridViewController *)self _barsHelper];
  [v5 invalidateNavigationBarItems];
  id v6 = [v5 title];
  id v7 = [v5 prompt];
  uint64_t v8 = [v5 shouldHideBackButton];
  uint64_t v9 = [v5 leftBarButtonItems];
  int v10 = [v5 rightBarButtonItems];
  id v11 = [(PUPhotosGridViewController *)self navigationItem];
  [v11 _setTitle:v6 animated:v3 matchBarButtonItemAnimationDuration:1];
  int v12 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  int v18 = __58__PUPhotosGridViewController_updateNavigationBarAnimated___block_invoke;
  id v19 = &unk_1E5F2ECC8;
  id v13 = v11;
  id v20 = v13;
  id v21 = v7;
  id v14 = v7;
  [v12 performWithoutAnimation:&v16];
  objc_msgSend(v13, "setHidesBackButton:animated:", v8, v3, v16, v17, v18, v19);
  LODWORD(v12) = objc_msgSend(v13, "pu_shouldUpdateLeftBarButtonItems:", v9);
  int v15 = objc_msgSend(v13, "pu_shouldUpdateRightBarButtonItems:", v10);
  if (v12) {
    [v13 setLeftBarButtonItems:v9 animated:v3];
  }
  if (v15) {
    [v13 setRightBarButtonItems:v10 animated:v3];
  }
}

uint64_t __58__PUPhotosGridViewController_updateNavigationBarAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPrompt:*(void *)(a1 + 40)];
}

- (void)_updateContentOffsetForPendingViewSizeTransition
{
  id v15 = [(PUPhotosGridViewController *)self _pendingViewSizeTransitionContext];
  if (v15)
  {
    if ([(PUPhotosGridViewController *)self isViewLoaded])
    {
      BOOL v3 = [(PUPhotosGridViewController *)self collectionView];
      [v3 bounds];
      CGRectGetWidth(v17);

      [(PUPhotosGridViewController *)self collectionViewLayoutReferenceWidth];
      if (PXFloatApproximatelyEqualToFloat())
      {
        id v4 = [(PUPhotosGridViewController *)self mainGridLayout];
        id v5 = [(PUPhotosGridViewController *)self collectionView];
        [v5 contentOffset];
        double v7 = v6;
        double v9 = v8;

        [v4 targetContentOffsetForViewSizeTransitionContext:v15];
        double v12 = v11;
        double v13 = v10;
        if (v7 != v11 || v9 != v10)
        {
          id v14 = [(PUPhotosGridViewController *)self collectionView];
          objc_msgSend(v14, "setContentOffset:", v12, v13);

          [v4 invalidateLayout];
        }
        [(PUPhotosGridViewController *)self _setPendingViewSizeTransitionContext:0];
      }
    }
  }
}

- (void)updateGlobalFooterUsingFooterView:(id)a3
{
  id v15 = a3;
  if (([(PUPhotosGridViewController *)self _appearState] != 1
     || ![(PUPhotosGridViewController *)self isContentViewInSyncWithModel])
    && (![(PUPhotosGridViewController *)self px_isVisible]
     || ![(PUPhotosGridViewController *)self isCurrentCollectionViewDataSource]))
  {
    goto LABEL_15;
  }
  id v4 = [(PUPhotosGridViewController *)self mainGridLayout];
  double v5 = 0.0;
  if ([(PUPhotosGridViewController *)self wantsGlobalFooter])
  {
    uint64_t v6 = [v4 cachedDefaultGlobalFooterHeight];
    if (v6)
    {
      double v7 = (void *)v6;
      double v8 = [v4 cachedDefaultGlobalFooterHeight];
      [v8 floatValue];
      if (v9 != 0.0)
      {

        id v10 = v15;
        if (!v15)
        {
          id v15 = 0;
          goto LABEL_13;
        }
LABEL_12:
        id v15 = v10;
        [(PUPhotosGridViewController *)self configureGlobalFooterView:v10];
        [(PUPhotosGridViewController *)self collectionViewLayoutReferenceWidth];
        objc_msgSend(v15, "sizeThatFits:");
        double v12 = [NSNumber numberWithDouble:v11];
        [v4 setCachedDefaultGlobalFooterHeight:v12];

LABEL_13:
        double v13 = [v4 cachedDefaultGlobalFooterHeight];
        [v13 floatValue];
        double v5 = v14;

        goto LABEL_14;
      }
    }
    id v10 = v15;
    if (!v15)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F90560]);
      [v16 setNeedsLayout];
      id v10 = v16;
    }
    goto LABEL_12;
  }
LABEL_14:
  [v4 setGlobalFooterHeight:v5];

LABEL_15:
}

- (void)updateGlobalFooter
{
  BOOL v3 = [(PUPhotosGridViewController *)self collectionView];
  id v4 = [(PUPhotosGridViewController *)self mainGridLayout];
  double v5 = [v4 globalFooterIndexPath];
  id v6 = [v3 _visibleSupplementaryViewOfKind:@"PUGridGlobalFooter" atIndexPath:v5];

  [(PUPhotosGridViewController *)self updateGlobalFooterUsingFooterView:v6];
}

- (void)_updateGlobalHeaderVisibility
{
  [(PUPhotosGridViewController *)self globalHeaderHeight];
  double v4 = v3;
  id v5 = [(PUPhotosGridViewController *)self mainGridLayout];
  [v5 setGlobalHeaderHeight:v4];
}

- (void)_updateAllProgressInfoIndexPaths
{
  progressInfosByIdentifier = self->_progressInfosByIdentifier;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__PUPhotosGridViewController__updateAllProgressInfoIndexPaths__block_invoke;
  v3[3] = &unk_1E5F2A900;
  v3[4] = self;
  [(NSMutableDictionary *)progressInfosByIdentifier enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __62__PUPhotosGridViewController__updateAllProgressInfoIndexPaths__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateIndexPathForProgressInfo:");
}

- (void)_invalidateAllProgressInfoIndexPaths
{
  [(NSMutableDictionary *)self->_progressInfosByCachedIndexPath enumerateKeysAndObjectsUsingBlock:&__block_literal_global_625_69067];
  progressInfosByCachedIndexPath = self->_progressInfosByCachedIndexPath;
  [(NSMutableDictionary *)progressInfosByCachedIndexPath removeAllObjects];
}

uint64_t __66__PUPhotosGridViewController__invalidateAllProgressInfoIndexPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setCachedIndexPath:0];
}

- (void)_updateIndexPathForProgressInfo:(id)a3
{
  id v11 = a3;
  double v4 = [v11 cachedIndexPath];
  if (!v4)
  {
    id v5 = [(PUPhotosGridViewController *)self photosDataSource];
    id v6 = [v11 asset];
    double v7 = [v11 collection];
    double v4 = [v5 indexPathForAsset:v6 inCollection:v7];

    [v11 setCachedIndexPath:v4];
    progressInfosByCachedIndexPath = self->_progressInfosByCachedIndexPath;
    if (!progressInfosByCachedIndexPath)
    {
      float v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v10 = self->_progressInfosByCachedIndexPath;
      self->_progressInfosByCachedIndexPath = v9;

      progressInfosByCachedIndexPath = self->_progressInfosByCachedIndexPath;
    }
    [(NSMutableDictionary *)progressInfosByCachedIndexPath setObject:v11 forKeyedSubscript:v4];
  }
}

- (void)presentAlertController:(id)a3
{
  id v4 = a3;
  if ([(PUPhotosGridViewController *)self px_isVisible]) {
    [(PUPhotosGridViewController *)self presentViewController:v4 animated:1 completion:0];
  }
}

- (void)endShowingProgressWithIdentifier:(id)a3 succeeded:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6
{
  progressInfosByIdentifier = self->_progressInfosByIdentifier;
  id v8 = a3;
  id v10 = [(NSMutableDictionary *)progressInfosByIdentifier objectForKeyedSubscript:v8];
  [(NSMutableDictionary *)self->_progressInfosByIdentifier removeObjectForKey:v8];

  float v9 = [v10 cachedIndexPath];
  if (v9)
  {
    [(NSMutableDictionary *)self->_progressInfosByCachedIndexPath removeObjectForKey:v9];
    [(PUPhotosGridViewController *)self _updateProgressForCellAtIndexPath:v9];
  }
}

- (void)updateProgressWithIdentifier:(id)a3 withValue:(double)a4
{
  id v8 = [(NSMutableDictionary *)self->_progressInfosByIdentifier objectForKeyedSubscript:a3];
  [v8 progress];
  if (v6 != a4)
  {
    [v8 setProgress:a4];
    [(PUPhotosGridViewController *)self _updateIndexPathForProgressInfo:v8];
    double v7 = [v8 cachedIndexPath];
    [(PUPhotosGridViewController *)self _updateProgressForCellAtIndexPath:v7];
  }
}

- (id)beginShowingProgressForAsset:(id)a3 inCollection:(id)a4
{
  double v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = a3;
  float v9 = [v6 UUID];
  id v10 = [v9 UUIDString];

  id v11 = objc_alloc_init(_PUPhotosGridProgressInfo);
  [(_PUPhotosGridProgressInfo *)v11 setIdentifier:v10];
  [(_PUPhotosGridProgressInfo *)v11 setAsset:v8];

  [(_PUPhotosGridProgressInfo *)v11 setCollection:v7];
  [(_PUPhotosGridProgressInfo *)v11 setProgress:0.0];
  if (!self->_progressInfosByCachedIndexPath)
  {
    double v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    progressInfosByIdentifier = self->_progressInfosByIdentifier;
    self->_progressInfosByIdentifier = v12;
  }
  [(NSMutableDictionary *)self->_progressInfosByIdentifier setObject:v11 forKeyedSubscript:v10];
  [(PUPhotosGridViewController *)self _updateIndexPathForProgressInfo:v11];
  float v14 = [(_PUPhotosGridProgressInfo *)v11 cachedIndexPath];
  if (v14) {
    [(PUPhotosGridViewController *)self _updateProgressForCellAtIndexPath:v14];
  }

  return v10;
}

- (void)_updateCollectionViewMultipleSelection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [(PUPhotosGridViewController *)self collectionView];
  id v4 = [v3 indexPathsForVisibleItems];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (![(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v9])
        {
          id v10 = [v3 cellForItemAtIndexPath:v9];
          [(PUPhotosGridViewController *)self _updateSelectionForCell:v10 atIndexPath:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_updateProgressForCell:(id)a3 atIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(PUPhotosGridViewController *)self _updateAllProgressInfoIndexPaths];
  uint64_t v7 = [(NSMutableDictionary *)self->_progressInfosByCachedIndexPath objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = NSNumber;
    [v7 progress];
    uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v10 setProgress:v9];
}

- (void)_updateProgressForCellAtIndexPath:(id)a3
{
  id v6 = a3;
  id v4 = [(PUPhotosGridViewController *)self collectionView];
  uint64_t v5 = [v4 cellForItemAtIndexPath:v6];

  if (v5) {
    [(PUPhotosGridViewController *)self _updateProgressForCell:v5 atIndexPath:v6];
  }
}

- (void)_updateSelectionForCell:(id)a3 atIndexPath:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  char v7 = [(PUPhotosGridViewController *)self isEditing];
  id v8 = [(PUPhotosGridViewController *)self sessionInfo];
  int v9 = [v8 isSelectingAssets];

  if ((v7 & 1) != 0 || v9)
  {
    long long v11 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v6 section]);
    long long v12 = [(PUPhotosGridViewController *)self photoSelectionManager];
    uint64_t v10 = objc_msgSend(v12, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v6, "item"), v11);
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v13 setSelectionBadgeVisible:v10];
}

- (void)updatePeripheralInterfaceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUPhotosGridViewController *)self isViewLoaded])
  {
    [(PUPhotosGridViewController *)self updateEmptyPlaceholderView];
    [(PUPhotosGridViewController *)self updateTitle];
    [(PUPhotosGridViewController *)self _updateToolbarContentsAnimated:v3];
    [(PUPhotosGridViewController *)self updateNavigationBarAnimated:v3];
    [(PUPhotosGridViewController *)self _updateNavigationBannerAnimated:v3];
    [(PUPhotosGridViewController *)self _updateGlobalHeaderVisibility];
    [(PUPhotosGridViewController *)self updateGlobalFooter];
  }
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4 = [(PUPhotosGridViewController *)self mainGridLayout];
  [v4 setCachedDefaultGlobalFooterHeight:0];

  uint64_t v5 = [(PUPhotosGridViewController *)self collectionView];
  [v5 contentOffset];

  id v10 = [(PUPhotosGridViewController *)self _bestReferenceItemIndexPathWithTopBias:1];
  id v6 = [(PUPhotosGridViewController *)self collectionView];
  char v7 = [v6 collectionViewLayout];

  if (v10)
  {
    id v8 = [v7 collectionView];

    if (v8)
    {
      int v9 = [v7 layoutAttributesForItemAtIndexPath:v10];
      [(PUPhotosGridViewController *)self assetAtIndexPathIfSafe:v10];
    }
  }
  [(PUPhotosGridViewController *)self updateLayoutMetrics];
  [(PUPhotosGridViewController *)self updateGlobalFooter];
}

- (void)updateLayoutMetrics
{
  BOOL v3 = [(PUPhotosGridViewController *)self mainGridLayout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(PUPhotosGridViewController *)self collectionViewLayoutReferenceWidth];
    if (v5 > 0.0)
    {
      double v6 = v5;
      [(PUPhotosGridViewController *)self collectionViewLayoutReferenceSafeAreaInsets];
      PXEdgeInsetsForEdges();
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      id v16 = [(PUPhotosGridViewController *)self gridSpec];
      id v15 = [(PUPhotosGridViewController *)self mainGridLayout];
      objc_msgSend(v16, "configureCollectionViewGridLayout:forWidth:safeAreaInsets:", v15, v6, v8, v10, v12, v14);
    }
  }
}

- (BOOL)shouldPerformFullReloadForIncrementalDataSourceChange:(id)a3
{
  id v5 = a3;
  if (([v5 hasIncrementalChanges] & 1) == 0)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewController.m" lineNumber:3374 description:@"Must have incremental changes at this point"];
  }
  if ([(PUPhotosGridViewController *)self isContentViewInSyncWithModel])
  {
    if (([v5 changesAreNoOp] & 1) != 0
      || (visibleSectionsBeforeChange = self->_visibleSectionsBeforeChange) == 0)
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      uint64_t v7 = [(NSIndexSet *)visibleSectionsBeforeChange pl_rangeCoveringIndexSet];
      int v9 = objc_msgSend(v5, "affectsSectionsInRange:", v7, v8) ^ 1;
    }
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)processDataSourceChange:(id)a3
{
  id v23 = a3;
  BOOL v4 = [(PUPhotosGridViewController *)self _shouldUpdateCollectionView];
  id v5 = [v23 originatingPhotoLibraryChange];

  double v6 = [(PUPhotosGridViewController *)self photoSelectionManager];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v23 originatingPhotoLibraryChange];
    [v7 handlePhotoLibraryChange:v8];
  }
  else
  {
    [v6 invalidateAllAssetIndexes];
  }

  [(PUPhotosGridViewController *)self _invalidateCachedViewSizeTransitionContext];
  if (v4)
  {
    if ([v23 hasIncrementalChanges]
      && ![(PUPhotosGridViewController *)self shouldPerformFullReloadForIncrementalDataSourceChange:v23])
    {
      [(PUPhotosGridViewController *)self updateInterfaceForIncrementalDataSourceChanges:v23];
      [(PUPhotosGridViewController *)self _clearAutomaticContentOffsetSnapshot];
    }
    else
    {
      [(PUPhotosGridViewController *)self beginBatchPreheating];
      [(PUPhotosGridViewController *)self updateInterfaceForModelReloadAnimated:1];
      [(PUPhotosGridViewController *)self _performAutomaticContentOffsetAdjustment];
      [(PUPhotosGridViewController *)self endBatchPreheating];
    }
    CGRect v17 = [(PUPhotosGridViewController *)self pendingProcessDataSourceUpdateBlock];

    if (v17)
    {
      int v18 = [(PUPhotosGridViewController *)self pendingProcessDataSourceUpdateBlock];
      int v19 = v18[2]();

      if (v19) {
        [(PUPhotosGridViewController *)self setPendingProcessDataSourceUpdateBlock:0];
      }
    }
    if (![(PUPhotosGridViewController *)self canDisplayEditButton]
      && [(PUPhotosGridViewController *)self isEditing])
    {
      [(PUPhotosGridViewController *)self setEditing:0 animated:1];
    }
  }
  else
  {
    [(PUPhotosGridViewController *)self setContentViewInSyncWithModel:0];
    int v9 = [(PUPhotosGridViewController *)self mainGridLayout];
    [v9 invalidateLayout];

    uint64_t v10 = [(PUPhotosGridViewController *)self _pushedPhotoBrowserController];
    if (v10)
    {
      double v11 = (void *)v10;
      double v12 = [(PUPhotosGridViewController *)self photosDataSource];
      int v13 = [v12 isEmpty];

      if (v13)
      {
        double v14 = [(PUPhotosGridViewController *)self _pushedPhotoBrowserController];
        objc_msgSend(v14, "pl_visitControllerHierarchyWithBlock:", &__block_literal_global_613);

        id v15 = [(PUPhotosGridViewController *)self navigationController];
        id v16 = (id)[v15 popToViewController:self animated:1];
      }
    }
  }
  uint64_t v20 = [(PUPhotosGridViewController *)self ppt_dataSourceChangeHandler];
  id v21 = (void *)v20;
  if (v20) {
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v23);
  }
  collectionListFetchResultBeforeChange = self->_collectionListFetchResultBeforeChange;
  self->_collectionListFetchResultBeforeChange = 0;
}

uint64_t __54__PUPhotosGridViewController_processDataSourceChange___block_invoke(uint64_t a1, void *a2)
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

- (void)photosDataSource:(id)a3 didChange:(id)a4
{
}

- (void)photosDataSourceWillChange:(id)a3
{
  BOOL v4 = [a3 collectionListFetchResult];
  collectionListFetchResultBeforeChange = self->_collectionListFetchResultBeforeChange;
  self->_collectionListFetchResultBeforeChange = v4;

  if ([(PUPhotosGridViewController *)self _shouldUpdateCollectionView])
  {
    [(PUPhotosGridViewController *)self _saveAnchorForAutomaticContentOffsetAdjustment];
  }
}

- (BOOL)_shouldUpdateCollectionView
{
  BOOL v3 = [(PUPhotosGridViewController *)self isCurrentCollectionViewDataSource];
  return v3 & [(PUPhotosGridViewController *)self px_isVisible];
}

- (CGPoint)stableUpdatesContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y = a3.y;
  CGFloat x = a3.x;
  visibleReferenceAssetBeforeChange = self->_visibleReferenceAssetBeforeChange;
  if (visibleReferenceAssetBeforeChange && self->_visibleReferenceAssetContainerBeforeChange)
  {
    uint64_t v7 = visibleReferenceAssetBeforeChange;
    uint64_t v8 = self->_visibleReferenceAssetContainerBeforeChange;
    int v9 = self->_visibleReferenceAssetIndexPathBeforeChange;
    uint64_t v10 = [(PUPhotosGridViewController *)self photosDataSource];
    double v11 = [v10 indexPathForAsset:v7 hintIndexPath:v9 hintCollection:v8];

    double v12 = [(PUPhotosGridViewController *)self collectionView];
    int v13 = [v12 collectionViewLayout];

    if (v11)
    {
      double v14 = [v13 collectionView];

      if (v14)
      {
        id v15 = [v13 layoutAttributesForItemAtIndexPath:v11];
        [v15 frame];
        double y = CGRectGetMinY(v19) - self->_visibleReferenceAssetRelativeYBeforeChange;
      }
    }
  }
  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.CGFloat x = v16;
  return result;
}

- (void)_clearAutomaticContentOffsetSnapshot
{
  visibleReferenceAssetBeforeChange = self->_visibleReferenceAssetBeforeChange;
  self->_visibleReferenceAssetBeforeChange = 0;

  visibleReferenceAssetContainerBeforeChange = self->_visibleReferenceAssetContainerBeforeChange;
  self->_visibleReferenceAssetContainerBeforeChange = 0;

  visibleReferenceAssetIndexPathBeforeChange = self->_visibleReferenceAssetIndexPathBeforeChange;
  self->_visibleReferenceAssetIndexPathBeforeChange = 0;

  self->_visibleReferenceAssetRelativeYBeforeChange = 0.0;
  visibleSectionsBeforeChange = self->_visibleSectionsBeforeChange;
  self->_visibleSectionsBeforeChange = 0;
}

- (void)_performAutomaticContentOffsetAdjustment
{
  if ([(PUPhotosGridViewController *)self shouldPerformAutomaticContentOffsetAdjustment])
  {
    if (self->_visibleReferenceAssetBeforeChange)
    {
      if (self->_visibleReferenceAssetContainerBeforeChange)
      {
        BOOL v3 = [(PUPhotosGridViewController *)self collectionView];
        [v3 contentOffset];
        double v5 = v4;
        double v7 = v6;

        -[PUPhotosGridViewController stableUpdatesContentOffsetForProposedContentOffset:](self, "stableUpdatesContentOffsetForProposedContentOffset:", v5, v7);
        double v10 = v9;
        double v11 = v8;
        if (v5 != v9 || v7 != v8)
        {
          double v12 = [(PUPhotosGridViewController *)self collectionView];
          objc_msgSend(v12, "setContentOffset:", v10, v11);

          int v13 = [(PUPhotosGridViewController *)self mainGridLayout];
          [v13 invalidateLayoutForVerticalScroll];
        }
      }
    }
  }
  [(PUPhotosGridViewController *)self _clearAutomaticContentOffsetSnapshot];
}

- (void)_saveAnchorForAutomaticContentOffsetAdjustment
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (![(PUPhotosGridViewController *)self shouldPerformAutomaticContentOffsetAdjustment])goto LABEL_23; {
  if (self->_visibleReferenceAssetBeforeChange)
  }
    return;
  BOOL v3 = [(PUPhotosGridViewController *)self _bestReferenceItemIndexPathWithTopBias:1];
  double v4 = [(PUPhotosGridViewController *)self collectionView];
  double v5 = [v4 collectionViewLayout];

  if (!v3
    || ([v5 collectionView], double v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {

LABEL_23:
    [(PUPhotosGridViewController *)self _clearAutomaticContentOffsetSnapshot];
    return;
  }
  double v7 = [v5 layoutAttributesForItemAtIndexPath:v3];
  uint64_t v8 = [(PUPhotosGridViewController *)self assetAtIndexPathIfSafe:v3];
  double v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  char v11 = !v10;
  char v27 = v11;
  if (!v10)
  {
    double v12 = [(PUPhotosGridViewController *)self collectionView];
    [v12 contentOffset];
    double v14 = v13;

    objc_storeStrong((id *)&self->_visibleReferenceAssetBeforeChange, v9);
    id v15 = [(PUPhotosGridViewController *)self photosDataSource];
    objc_msgSend(v15, "assetCollectionForSection:", objc_msgSend(v3, "section"));
    double v16 = (PHAssetCollection *)objc_claimAutoreleasedReturnValue();
    visibleReferenceAssetContainerBeforeChange = self->_visibleReferenceAssetContainerBeforeChange;
    self->_visibleReferenceAssetContainerBeforeChange = v16;

    [v7 frame];
    self->_visibleReferenceAssetRelativeYBeforeChange = v18 - v14;
    objc_storeStrong((id *)&self->_visibleReferenceAssetIndexPathBeforeChange, v3);
  }
  CGRect v19 = [MEMORY[0x1E4F28E60] indexSet];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v20 = [(PUPhotosGridViewController *)self collectionView];
  id v21 = [v20 indexPathsForVisibleItems];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v21);
        }
        -[NSIndexSet addIndex:](v19, "addIndex:", [*(id *)(*((void *)&v28 + 1) + 8 * i) section]);
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v23);
  }

  visibleSectionsBeforeChange = self->_visibleSectionsBeforeChange;
  self->_visibleSectionsBeforeChange = v19;

  if ((v27 & 1) == 0) {
    goto LABEL_23;
  }
}

- (BOOL)shouldPerformAutomaticContentOffsetAdjustment
{
  return 0;
}

- (void)handleNavigateToAsset:(id)a3 inContainer:(id)a4
{
}

- (void)handleToggleSelectionOfItemAtIndexPath:(id)a3
{
  id v4 = a3;
  -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v4 section]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  double v5 = [(PUPhotosGridViewController *)self photoSelectionManager];
  int v6 = objc_msgSend(v5, "isAssetAtIndexSelected:inAssetCollection:", objc_msgSend(v4, "item"), v10);

  uint64_t v7 = v6 ^ 1u;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v4, "item"));
  uint64_t v9 = [v4 section];

  [(PUPhotosGridViewController *)self setSelected:v7 itemsAtIndexes:v8 inSection:v9 animated:0];
}

- (void)setCustomDoneButtonItem:(id)a3
{
  double v5 = (UIBarButtonItem *)a3;
  if (self->_customDoneButtonItem != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_customDoneButtonItem, a3);
    [(PUPhotosGridViewController *)self updateNavigationBarAnimated:0];
    double v5 = v6;
  }
}

- (void)deletePhotosActionController:(id)a3 presentConfirmationViewController:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 action];
  [(PUPhotosGridViewController *)self _setRemoveActionSheet:v6];
  id v9 = [v6 popoverPresentationController];
  uint64_t v8 = [(PUPhotosGridViewController *)self _referenceBarButtonItemForDeleteAction:v7];
  [v9 setBarButtonItem:v8];
  [v9 setDelegate:self];
  [(PUPhotosGridViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_removeButtonPressed:(id)a3
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  v68 = (UIBarButtonItem *)a3;
  val = self;
  double v5 = [(PUPhotosGridViewController *)self presentedViewController];
  if (v5
    || ([(PUPhotosGridViewController *)self _removeActionSheet],
        (double v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_4;
  }
  double v17 = [(PUPhotosGridViewController *)self _deleteActionController];

  if (v17)
  {
LABEL_4:
    oslog = PLUIGetLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(PUPhotosGridViewController *)self presentedViewController];
      if (v6) {
        uint64_t v7 = @"YES";
      }
      else {
        uint64_t v7 = @"NO";
      }
      uint64_t v8 = v7;
      id v9 = v8;
      id v10 = [(PUPhotosGridViewController *)self _removeActionSheet];
      if (v10) {
        char v11 = @"YES";
      }
      else {
        char v11 = @"NO";
      }
      double v12 = v11;
      double v13 = v12;
      double v14 = [(PUPhotosGridViewController *)self _deleteActionController];
      if (v14) {
        id v15 = @"YES";
      }
      else {
        id v15 = @"NO";
      }
      double v16 = v15;
      *(_DWORD *)buf = 138543874;
      v102 = v8;
      __int16 v103 = 2114;
      v104 = v12;
      __int16 v105 = 2114;
      v106 = v16;
      _os_log_impl(&dword_1AE9F8000, oslog, OS_LOG_TYPE_DEFAULT, "Remove button ignored. presentedViewController: %{public}@ _removeActionSheet: %{public}@ _deleteActionController: %{public}@", buf, 0x20u);
    }
    goto LABEL_15;
  }
  if (!v68 || self->_removeToolbarButton != v68 && self->_restoreToolbarButton != v68)
  {
    id v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewController.m" lineNumber:2923 description:@"expect sender; need to double-check delete logic that assumes sender"];
  }
  double v18 = [(PUPhotosGridViewController *)self selectedAssets];
  unint64_t v19 = [v18 count];
  BOOL v64 = v19 < 0x3E8;
  uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v19 < 0x3E8)
  {
    id v21 = [(PUPhotosGridViewController *)self selectedIndexPaths];
    uint64_t v22 = [v18 count];
    if (v22 != [v21 count])
    {
      double v56 = [MEMORY[0x1E4F28B00] currentHandler];
      [v56 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 2934, @"Invalid parameter not satisfying: %@", @"[assets count] == [indexPaths count]" object file lineNumber description];
    }
    if ([v18 count])
    {
      unint64_t v23 = 0;
      do
      {
        uint64_t v24 = [v18 objectAtIndexedSubscript:v23];
        BOOL v25 = [v21 objectAtIndexedSubscript:v23];
        [v20 setObject:v25 forKeyedSubscript:v24];

        ++v23;
      }
      while (v23 < [v18 count]);
    }
  }
  BOOL v26 = self;
  uint64_t v27 = [(PUPhotosGridViewController *)self canDeleteContent];
  BOOL v66 = [(PUPhotosGridViewController *)val _canRemoveContent];
  BOOL v61 = [(PUPhotosGridViewController *)val isTrashBinViewController];
  if (v61 && ![v18 count])
  {
    uint64_t v28 = [(PUPhotosGridViewController *)val _allAssetsInCollections];

    double v18 = (void *)v28;
    BOOL v26 = val;
  }
  oslog = [(PUPhotosGridViewController *)v26 _assetsAllowingRemove:v66 orDelete:v27 fromAssets:v18];

  if ((v66 & v27) == 1)
  {
    long long v29 = [(PUPhotosGridViewController *)val _assetsAllowingRemove:0 orDelete:1 fromAssets:oslog];
    LODWORD(v27) = [v29 isEqualToArray:oslog];
  }
  if ([oslog count])
  {
    int v58 = v27;
    BOOL v30 = v19 < 0x3E8;
    long long v31 = [MEMORY[0x1E4F1CA48] array];
    if (v30)
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v32 = oslog;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v96 objects:v100 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v97 != v34) {
              objc_enumerationMutation(v32);
            }
            id v36 = [v20 objectForKeyedSubscript:*(void *)(*((void *)&v96 + 1) + 8 * i)];
            if (v36)
            {
              int v37 = [(PUPhotosGridViewController *)val photosDataSource];
              id v38 = [v37 assetReferenceAtIndexPath:v36];

              [v31 addObject:v38];
            }
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v96 objects:v100 count:16];
        }
        while (v33);
      }
    }
    objc_initWeak((id *)buf, val);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke;
    aBlock[3] = &unk_1E5F2E530;
    objc_copyWeak(&v95, (id *)buf);
    v60 = (void (**)(void))_Block_copy(aBlock);
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_2;
    v90[3] = &unk_1E5F2A840;
    BOOL v93 = v64;
    objc_copyWeak(&v92, (id *)buf);
    id v57 = v31;
    id v91 = v57;
    v63 = _Block_copy(v90);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_3;
    v85[3] = &unk_1E5F2A868;
    objc_copyWeak(&v87, (id *)buf);
    BOOL v88 = v64;
    BOOL v89 = v61;
    id v39 = oslog;
    v86 = v39;
    v65 = _Block_copy(v85);
    if (v66)
    {
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_4;
      v84[3] = &unk_1E5F2BF98;
      v84[4] = val;
      v67 = _Block_copy(v84);
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_5;
      v81[3] = &unk_1E5F2A890;
      v81[4] = val;
      id v40 = v65;
      id v82 = v40;
      id v41 = v63;
      id v83 = v41;
      int v62 = _Block_copy(v81);

      if (v58)
      {
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_6;
        v75[3] = &unk_1E5F2A8B8;
        v75[4] = val;
        v76 = v68;
        v77 = v39;
        v78 = v60;
        id v79 = v41;
        id v80 = v40;
        id v59 = _Block_copy(v75);
      }
      else
      {
        id v59 = 0;
      }
      double v46 = [MEMORY[0x1E4F90488] warningStringForAssets:v39 isDeleting:1];
      double v47 = PULocalizedString(@"CANCEL");
      unint64_t v48 = PXLocalizedSharedLibraryString();
      id v49 = PULocalizedString(@"DELETE_FROM_LIBRARY_BUTTON_TITLE");
      uint64_t v50 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v46 message:0 preferredStyle:0];
      double v51 = [MEMORY[0x1E4FB1410] actionWithTitle:v47 style:1 handler:v67];
      [v50 addAction:v51];

      uint64_t v52 = [MEMORY[0x1E4FB1410] actionWithTitle:v48 style:0 handler:v62];
      [v50 addAction:v52];

      double v53 = [MEMORY[0x1E4FB1410] actionWithTitle:v49 style:2 handler:v59];
      [v50 addAction:v53];

      [(PUPhotosGridViewController *)val _setRemoveActionSheet:v50];
      BOOL v54 = [v50 popoverPresentationController];
      if (v54)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v54 setBarButtonItem:v68];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v54 setSourceView:v68];
            [(UIBarButtonItem *)v68 frame];
            objc_msgSend(v54, "setSourceRect:");
          }
        }
        [v54 setDelegate:val];
      }
      [(PUPhotosGridViewController *)val presentViewController:v50 animated:1 completion:0];
    }
    else if (v58)
    {
      uint64_t v42 = [(PUPhotosGridViewController *)val _deleteActionForBarButtonItem:v68];
      id v43 = objc_alloc(MEMORY[0x1E4F90488]);
      id v44 = [(PUPhotosGridViewController *)val undoManager];
      id v45 = (void *)[v43 initWithAction:v42 assets:v39 undoManager:v44 delegate:val];

      [(PUPhotosGridViewController *)val _setDeleteActionController:v45];
      v60[2]();
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_9;
      v73[3] = &unk_1E5F2EBA0;
      id v74 = v63;
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_10;
      v71[3] = &unk_1E5F2E930;
      v71[4] = val;
      id v72 = v65;
      [v45 performWithWillDeleteHandler:v73 completionHandler:v71];
    }
    objc_destroyWeak(&v87);

    objc_destroyWeak(&v92);
    objc_destroyWeak(&v95);
    objc_destroyWeak((id *)buf);
  }
LABEL_15:
}

void __51__PUPhotosGridViewController__removeButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained navigationController];
  id v4 = [v2 navigationBar];

  BOOL v3 = v4;
  if (v4)
  {
    [v4 setUserInteractionEnabled:0];
    BOOL v3 = v4;
  }
}

void __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v3 = [WeakRetained photosDataSource];
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(v3, "indexPathForAssetReference:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
          if (v10) {
            [v4 addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 forceExcludeAssetsAtIndexPaths:v4];
    [WeakRetained setEditing:0 animated:0];
    char v11 = [WeakRetained navigationController];
    double v12 = [v11 navigationBar];

    if (v12) {
      [v12 setUserInteractionEnabled:1];
    }
  }
}

void __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_3(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!a2)
  {
    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_9;
    }
    id v5 = [WeakRetained photosDataSource];
    [v5 stopExcludingAssets:*(void *)(a1 + 32)];

    goto LABEL_8;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    [WeakRetained setEditing:0 animated:0];
    id WeakRetained = v8;
  }
  if (!*(unsigned char *)(a1 + 49))
  {
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.photosDeleteGrid" withPayload:MEMORY[0x1E4F1CC08]];
LABEL_8:
    id WeakRetained = v8;
  }
LABEL_9:
  uint64_t v6 = [WeakRetained navigationController];
  uint64_t v7 = [v6 navigationBar];

  if (v7) {
    [v7 setUserInteractionEnabled:1];
  }
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setRemoveActionSheet:0];
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeSelectedAssetsWithCompletion:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 _setRemoveActionSheet:0];
}

void __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _deleteActionForBarButtonItem:*(void *)(a1 + 40)];
  id v3 = objc_alloc(MEMORY[0x1E4F90488]);
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) undoManager];
  uint64_t v6 = (void *)[v3 initWithAction:v2 assets:v4 undoManager:v5 delegate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) _setDeleteActionController:v6];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_7;
  v9[3] = &unk_1E5F2EBA0;
  id v10 = *(id *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_8;
  v7[3] = &unk_1E5F2E930;
  v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 72);
  [v6 performWithWillDeleteHandler:v9 completionHandler:v7];
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDeleteActionController:0];
  [*(id *)(a1 + 32) _setRemoveActionSheet:0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__PUPhotosGridViewController__removeButtonPressed___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDeleteActionController:0];
  [*(id *)(a1 + 32) _setRemoveActionSheet:0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (id)_allAssetsInCollections
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(PUPhotosGridViewController *)self assetsInAssetCollection:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v16 != v12) {
                objc_enumerationMutation(v9);
              }
              [v3 addObject:*(void *)(*((void *)&v15 + 1) + 8 * j)];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_addButtonPressed:(id)a3
{
  uint64_t v4 = [(PUPhotosGridViewController *)self presentedViewController];

  if (!v4)
  {
    if ([(PUPhotosGridViewController *)self isAnyAssetSelected])
    {
      uint64_t v5 = PLUIGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "No more 'Add To' action", v6, 2u);
      }
    }
    else
    {
      [(PUPhotosGridViewController *)self handleAddFromAction];
    }
  }
}

- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4
{
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __81__PUPhotosGridViewController_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke;
  v18[3] = &unk_1E5F2ED10;
  v18[4] = self;
  id v6 = a4;
  id v7 = a3;
  [(PUPhotosGridViewController *)self dismissViewControllerAnimated:1 completion:v18];
  id v8 = [v6 firstObject];

  uint64_t v9 = [v7 session];

  uint64_t v10 = [v9 assetCollection];

  if ([(PUPhotosGridViewController *)self _transitionWidthHasChanged])
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PUPhotosGridViewController_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke_2;
    aBlock[3] = &unk_1E5F2D758;
    objc_copyWeak(&v16, &location);
    id v14 = v8;
    id v15 = v10;
    uint64_t v11 = _Block_copy(aBlock);
    id pendingNavigationBlock = self->_pendingNavigationBlock;
    self->_id pendingNavigationBlock = v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PUPhotosGridViewController *)self navigateToRevealPhoto:v8 inAssetContainer:v10 animated:0];
  }
}

uint64_t __81__PUPhotosGridViewController_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSlideshowViewController:0];
}

void __81__PUPhotosGridViewController_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained navigateToRevealPhoto:*(void *)(a1 + 32) inAssetContainer:*(void *)(a1 + 40) animated:0];
}

- (id)_performDuplicateActivityWithSelectionSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F90498]);
  id v6 = [(PUPhotosGridViewController *)self undoManager];
  id v7 = (void *)[v5 initWithSelectionSnapshot:v4 undoManager:v6];

  [(PUPhotosGridViewController *)self _setDuplicateActionController:v7];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__PUPhotosGridViewController__performDuplicateActivityWithSelectionSnapshot___block_invoke;
  aBlock[3] = &unk_1E5F2A818;
  objc_copyWeak(&v17, &location);
  id v8 = v7;
  id v16 = v8;
  uint64_t v9 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  if ([v8 shouldUseAlertController])
  {
    uint64_t v10 = [v8 alertConfigurationForDuplicateActionWithUserConfirmationHandler:v9];
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F8FF78]) initWithConfiguration:v10];
    uint64_t v12 = [v11 alertController];
    long long v13 = [v12 popoverPresentationController];
    [v13 setDelegate:self];
  }
  else
  {
    v9[2](v9, 1, 1);
    uint64_t v12 = 0;
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v12;
}

void __77__PUPhotosGridViewController__performDuplicateActivityWithSelectionSnapshot___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  id v6 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (a2)
  {
    uint64_t v9 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __77__PUPhotosGridViewController__performDuplicateActivityWithSelectionSnapshot___block_invoke_2;
    v12[3] = &unk_1E5F2D898;
    objc_copyWeak(&v13, v6);
    long long v10 = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [v9 performDuplicateAction:a3 newStillImageTime:&v10 completionHandler:v12];
    objc_destroyWeak(&v13);
  }
  else
  {
    [WeakRetained _handleDuplicateActionCompletionWithSuccess:0];
  }
  [v8 _setActionConfirmationAlert:0];
}

void __77__PUPhotosGridViewController__performDuplicateActivityWithSelectionSnapshot___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleDuplicateActionCompletionWithSuccess:a2];
}

- (void)_handleDuplicateActionCompletionWithSuccess:(BOOL)a3
{
  if ([(PUPhotosGridViewController *)self isEditing])
  {
    id v4 = +[PUPhotosGridSettings sharedInstance];
    int v5 = [v4 shouldExitEditingModeAfterDuplication];

    if (v5) {
      [(PUPhotosGridViewController *)self setEditing:0 animated:0];
    }
  }
  [(PUPhotosGridViewController *)self _setDuplicateActionController:0];
}

- (id)_performHideActivityWithSelectionManager:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isAnyAssetSelected])
  {
    id v29 = v4;
    int v5 = [(PUPhotosGridViewController *)self photosDataSource];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v8 = [(PUPhotosGridViewController *)self collectionListFetchResult];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke;
    v48[3] = &unk_1E5F2A6D8;
    id v31 = v6;
    id v49 = v31;
    id v9 = v7;
    id v50 = v9;
    id v10 = v5;
    id v51 = v10;
    [v4 enumerateSelectedAssetsWithAssetCollectionOrdering:v8 block:v48];

    uint64_t v11 = [PUHidePhotosActionController alloc];
    uint64_t v12 = [(PUPhotosGridViewController *)self undoManager];
    BOOL v30 = [(PUHidePhotosActionController *)v11 initWithAssets:v31 undoManager:v12];

    if (v30)
    {
      objc_initWeak(&location, self);
      id v13 = [MEMORY[0x1E4F1CA48] array];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v14 = v31;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v44 != v16) {
              objc_enumerationMutation(v14);
            }
            long long v18 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v43 + 1) + 8 * i)];
            if (v18)
            {
              long long v19 = [v10 assetReferenceAtIndexPath:v18];
              [v13 addObject:v19];
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v15);
      }

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_2;
      aBlock[3] = &unk_1E5F2E4E8;
      objc_copyWeak(&v42, &location);
      id v28 = v13;
      id v41 = v28;
      long long v20 = _Block_copy(aBlock);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_3;
      v37[3] = &unk_1E5F2A7C8;
      objc_copyWeak(&v39, &location);
      id v38 = v14;
      long long v21 = _Block_copy(v37);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_4;
      v32[3] = &unk_1E5F2A7F0;
      objc_copyWeak(&v36, &location);
      long long v22 = v20;
      id v34 = v22;
      unint64_t v23 = v30;
      uint64_t v33 = v23;
      id v24 = v21;
      id v35 = v24;
      uint64_t v25 = [(PUHidePhotosActionController *)v23 alertControllerForTogglingAssetsVisibilityWithCompletionHandler:v32];
      BOOL v26 = [v25 popoverPresentationController];
      [v26 setDelegate:self];

      if (!v25)
      {
        v22[2](v22);
        [(PUHidePhotosActionController *)v23 performActionWithCompletionHandler:v24];
      }

      objc_destroyWeak(&v36);
      objc_destroyWeak(&v39);

      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v25 = 0;
    }

    id v4 = v29;
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

void __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v7 addObject:v8];
  id v9 = *(void **)(a1 + 48);
  id v11 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:a4];
  id v10 = [v9 indexPathForAsset:v8 hintIndexPath:v11 hintCollection:0];
  [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v8];
}

void __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained photosDataSource];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 32);
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
        id v10 = objc_msgSend(v3, "indexPathForAssetReference:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [v3 forceExcludeAssetsAtIndexPaths:v4];
  if ([WeakRetained isEditing]) {
    [WeakRetained setEditing:0 animated:0];
  }
}

void __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_3(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0)
  {
    id v6 = WeakRetained;
    id v5 = [WeakRetained photosDataSource];
    [v5 stopExcludingAssets:*(void *)(a1 + 32)];

    id WeakRetained = v6;
  }
}

void __71__PUPhotosGridViewController__performHideActivityWithSelectionManager___block_invoke_4(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) performActionWithCompletionHandler:*(void *)(a1 + 48)];
  }
  [WeakRetained _setActionConfirmationAlert:0];
}

- (id)_updateSelectionFromSelectionManager:(id)a3
{
  id v5 = a3;
  id v6 = [(PUPhotosGridViewController *)self photoSelectionManager];
  if (!v6)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewController.m" lineNumber:2736 description:@"A selection manager should always be available."];
  }
  [v6 deselectAllAssets];
  uint64_t v7 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PUPhotosGridViewController__updateSelectionFromSelectionManager___block_invoke;
  void v13[3] = &unk_1E5F2A6D8;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v8 = v7;
  id v9 = v6;
  [v5 enumerateSelectedAssetsWithAssetCollectionOrdering:v8 block:v13];

  [(PUPhotosGridViewController *)self _updateCollectionViewMultipleSelection];
  id v10 = [v9 selectionSnapshot];

  return v10;
}

void __67__PUPhotosGridViewController__updateSelectionFromSelectionManager___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 photosDataSource];
  id v10 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:a4];
  long long v11 = [*(id *)(a1 + 32) photoCollectionAtIndex:a4];
  id v15 = [v9 indexPathForAsset:v8 hintIndexPath:v10 hintCollection:v11];

  if (v15)
  {
    long long v12 = *(void **)(a1 + 40);
    uint64_t v13 = [v15 item];
    id v14 = objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", objc_msgSend(v15, "section"));
    [v12 selectAssetAtIndex:v13 inAssetCollection:v14];
  }
}

- (void)_activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PUPhotosGridViewController *)self activitySharingController];

  if (!v10)
  {
    id v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "didCompleteWithActivityType: was called whereas self.activitySharingController == nil.", (uint8_t *)buf, 2u);
    }
    goto LABEL_21;
  }
  if (v5)
  {
    [(PUPhotosGridViewController *)self setActivitySharingController:0];
    uint64_t v11 = *MEMORY[0x1E4F90A10];
    if (([v9 isEqualToString:*MEMORY[0x1E4F90A10]] & 1) == 0
      && ([v9 isEqualToString:*MEMORY[0x1E4F909D0]] & 1) == 0
      && ![v9 isEqualToString:*MEMORY[0x1E4F90A60]])
    {
      if (![v9 isEqualToString:*MEMORY[0x1E4F90AF8]])
      {
        if ([(PUPhotosGridViewController *)self isEditing]) {
          [(PUPhotosGridViewController *)self setEditing:0 animated:0];
        }
        id v16 = 0;
        goto LABEL_20;
      }
      long long v21 = (void *)MEMORY[0x1E4F38EE8];
      long long v22 = [v8 viewModel];
      unint64_t v23 = [v22 selectionManager];
      id v24 = [v23 orderedSelectedAssets];
      uint64_t v25 = [v24 array];
      id v14 = [v21 transientAssetCollectionWithAssets:v25 title:0];

      BOOL v26 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v14 options:0];
      id v16 = [(PUPhotosGridViewController *)self _slideshowNavigationControllerForFetchResult:v26 assetCollection:v14];

LABEL_19:
LABEL_20:
      objc_initWeak(buf, self);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __93__PUPhotosGridViewController__activitySharingController_didCompleteWithActivityType_success___block_invoke;
      v27[3] = &unk_1E5F2D3F0;
      objc_copyWeak(&v31, buf);
      id v17 = v16;
      id v28 = v17;
      id v29 = v9;
      BOOL v30 = self;
      [(UIViewController *)self pu_dismissViewControllerAnimated:1 interactive:0 completion:v27];

      objc_destroyWeak(&v31);
      objc_destroyWeak(buf);
LABEL_21:

      goto LABEL_22;
    }
    long long v12 = [v8 viewModel];
    uint64_t v13 = [v12 selectionManager];
    id v14 = [(PUPhotosGridViewController *)self _updateSelectionFromSelectionManager:v13];

    if ([v9 isEqualToString:v11])
    {
      id v15 = [(PUPhotosGridViewController *)self photoSelectionManager];
      id v16 = [(PUPhotosGridViewController *)self _performHideActivityWithSelectionManager:v15];

      if (!v16)
      {
LABEL_15:
        long long v18 = [(PUPhotosGridViewController *)self _shareAssetsSender];
        if (v18 && ([(PUPhotosGridViewController *)self isEditing] & 1) == 0)
        {
          long long v19 = [v16 popoverPresentationController];
          [v19 setSourceView:v18];

          long long v20 = [v16 popoverPresentationController];
          [v18 bounds];
          objc_msgSend(v20, "setSourceRect:");
        }
        [(PUPhotosGridViewController *)self _setActionConfirmationAlert:v16];

        goto LABEL_19;
      }
    }
    else
    {
      if (![v9 isEqualToString:*MEMORY[0x1E4F909D0]])
      {
        id v16 = 0;
        goto LABEL_15;
      }
      id v16 = [(PUPhotosGridViewController *)self _performDuplicateActivityWithSelectionSnapshot:v14];
      if (!v16) {
        goto LABEL_15;
      }
    }
    id v16 = v16;
    goto LABEL_15;
  }
LABEL_22:
}

void __93__PUPhotosGridViewController__activitySharingController_didCompleteWithActivityType_success___block_invoke(id *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PUPhotosGridViewController__activitySharingController_didCompleteWithActivityType_success___block_invoke_2;
  block[3] = &unk_1E5F2D758;
  objc_copyWeak(&v5, a1 + 7);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], block);
  [a1[6] _setShareAssetsSender:0];

  objc_destroyWeak(&v5);
}

void __93__PUPhotosGridViewController__activitySharingController_didCompleteWithActivityType_success___block_invoke_2(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a1[4])
  {
    id v3 = WeakRetained;
    if ([a1[5] isEqualToString:*MEMORY[0x1E4F90AF8]]) {
      [a1[4] setModalTransitionStyle:2];
    }
    [v3 presentViewController:a1[4] animated:1 completion:0];
    id WeakRetained = v3;
  }
}

- (void)_activitySharingControllerDidCancel:(id)a3
{
  [(PUPhotosGridViewController *)self setActivitySharingController:0];
  [(PUPhotosGridViewController *)self _setShareAssetsSender:0];
}

- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  id v16 = v9;
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v14);
    id v15 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 2658, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController", v13, v15 object file lineNumber description];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 2658, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController", v13 object file lineNumber description];
  }

LABEL_3:
  [(PUPhotosGridViewController *)self _activitySharingController:v16 didCompleteWithActivityType:v10 success:v5];
}

- (void)activitySharingControllerDidCancel:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v8);
    id v9 = objc_msgSend(v10, "px_descriptionForAssertionMessage");
    [v5 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 2653, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController", v7, v9 object file lineNumber description];
  }
  else
  {
    BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    [v5 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 2653, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController", v7 object file lineNumber description];
  }

LABEL_3:
  [(PUPhotosGridViewController *)self _activitySharingControllerDidCancel:v10];
}

- (id)_slideshowNavigationControllerForFetchResult:(id)a3 assetCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PUSlideshowSession alloc] initWithFetchResult:v7 assetCollection:v6];

  id v9 = [[PUSlideshowViewController alloc] initWithSession:v8];
  [(PUPhotosGridViewController *)self _setSlideshowViewController:v9];
  [(PUSlideshowViewController *)v9 setDelegate:self];
  id v10 = [[PUSlideshowNavigationController alloc] initWithRootViewController:v9];

  return v10;
}

- (BOOL)shouldPreventRevealInMomentAction
{
  return 0;
}

- (void)_slideshowButtonPressed:(id)a3
{
  BOOL v5 = [(PUPhotosGridViewController *)self presentedViewController];

  if (!v5)
  {
    id v6 = [(PUPhotosGridViewController *)self gridSpec];
    char v7 = [v6 canDisplaySlideshowButton];

    if ((v7 & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewController.m" lineNumber:2618 description:@"expected slideshow capability"];
    }
    id v12 = [(PUPhotosGridViewController *)self photoCollectionAtIndex:0];
    id v8 = [(PUPhotosGridViewController *)self photosDataSource];
    id v9 = [v8 assetsInSection:0];

    id v10 = [(PUPhotosGridViewController *)self _slideshowNavigationControllerForFetchResult:v9 assetCollection:v12];
    [v10 setModalTransitionStyle:2];
    [(PUPhotosGridViewController *)self presentViewController:v10 animated:1 completion:0];
  }
}

- (void)sender:(id)a3 shareAssetsInFetchResult:(id)a4 forAssetCollection:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke;
  aBlock[3] = &unk_1E5F2A750;
  void aBlock[4] = self;
  id v14 = v12;
  id v50 = v14;
  id v15 = _Block_copy(aBlock);
  unint64_t v16 = [(PUPhotosGridViewController *)self _sharableAssetsTypeInFetchResult:v11];
  if (v16 == 2)
  {
    id v37 = v13;
    id v38 = v10;
    long long v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    long long v20 = (void *)MEMORY[0x1E4FB1410];
    long long v21 = PULocalizedString(@"SHARE_THIS_MOMENT");
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke_2;
    v43[3] = &unk_1E5F2A778;
    objc_copyWeak(&v48, location);
    id v22 = v14;
    id v44 = v22;
    id v47 = v15;
    id v23 = v11;
    id v45 = v23;
    id v24 = v38;
    id v46 = v24;
    uint64_t v25 = [v20 actionWithTitle:v21 style:0 handler:v43];
    [v19 addAction:v25];

    BOOL v26 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v27 = PULocalizedString(@"SHARE_PLAY_SLIDESHOW");
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke_3;
    v39[3] = &unk_1E5F2A7A0;
    objc_copyWeak(&v42, location);
    v39[4] = self;
    id v40 = v22;
    id v41 = v23;
    id v28 = [v26 actionWithTitle:v27 style:0 handler:v39];
    [v19 addAction:v28];

    id v29 = (void *)MEMORY[0x1E4FB1410];
    BOOL v30 = PULocalizedString(@"CANCEL");
    id v31 = [v29 actionWithTitle:v30 style:1 handler:0];
    [v19 addAction:v31];

    id v32 = [v19 popoverPresentationController];
    [v32 setSourceView:v24];
    [v24 bounds];
    objc_msgSend(v32, "setSourceRect:");
    [v32 setDelegate:self];
    uint64_t v33 = (void *)MEMORY[0x1E4FB1EB0];
    id v34 = [(PUPhotosGridViewController *)self view];
    uint64_t v35 = objc_msgSend(v33, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v34, "semanticContentAttribute"));

    if (v35) {
      uint64_t v36 = 4;
    }
    else {
      uint64_t v36 = 8;
    }
    [v32 setPermittedArrowDirections:v36];
    [(PUPhotosGridViewController *)self presentViewController:v19 animated:1 completion:0];
    [(PUPhotosGridViewController *)self _setShareAssetsPopoverController:v32];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&v48);

    id v10 = v38;
    id v13 = v37;
  }
  else if (v16 == 1)
  {
    id v17 = [(PUPhotosGridViewController *)self photosDataSource];
    uint64_t v18 = [v17 sectionForAssetCollection:v14];

    if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
      (*((void (**)(void *, id))v15 + 2))(v15, v11);
    }
  }

  objc_destroyWeak(location);
}

void __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _selectionManagerWithSharableAssetsInFetchResult:a2 forAssetCollection:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) _activitySharingControllerWithSelectionManager:v4];
  [*(id *)(a1 + 32) _presentActivitySharingController:v3 completion:0];
}

void __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v2 = [WeakRetained photosDataSource];
  uint64_t v3 = [v2 sectionForAssetCollection:*(void *)(a1 + 32)];

  if (v3 != 0x7FFFFFFFFFFFFFFFLL) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [WeakRetained _setShareAssetsSender:*(void *)(a1 + 48)];
}

void __96__PUPhotosGridViewController_sender_shareAssetsInFetchResult_forAssetCollection_withCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v2 = [*(id *)(a1 + 32) photosDataSource];
  uint64_t v3 = [v2 sectionForAssetCollection:*(void *)(a1 + 40)];

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [WeakRetained _slideshowNavigationControllerForFetchResult:*(void *)(a1 + 48) assetCollection:*(void *)(a1 + 40)];
    [v4 setModalTransitionStyle:2];
    [WeakRetained presentViewController:v4 animated:1 completion:0];
  }
}

- (void)_shareButtonPressed:(id)a3
{
  id v5 = a3;
  id v4 = [(PUPhotosGridViewController *)self presentedViewController];

  if (!v4) {
    [(PUPhotosGridViewController *)self sender:v5 shareSelectedAssetsWithCompletion:0];
  }
}

- (void)_presentShareSheetWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = +[PUAssetActionManager actionManagerLog];
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayLatency", "", buf, 2u);
  }
  char v7 = [(PUPhotosGridViewController *)self _selectionManagerWithSelectedSharableAssets];
  id v8 = [v7 selectedAssets];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayDuration", " enableTelemetry=YES ", buf, 2u);
    }
    id v10 = [(PUPhotosGridViewController *)self _activitySharingControllerWithSelectionManager:v7];
    id v11 = [v10 activityViewController];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_8:
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __63__PUPhotosGridViewController__presentShareSheetWithCompletion___block_invoke;
        v19[3] = &unk_1E5F2ED10;
        long long v20 = v6;
        [v11 setReadyToInteractHandler:v19];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        void v17[2] = __63__PUPhotosGridViewController__presentShareSheetWithCompletion___block_invoke_561;
        v17[3] = &unk_1E5F2EBA0;
        id v18 = v5;
        [(PUPhotosGridViewController *)self _presentActivitySharingController:v10 completion:v17];

        goto LABEL_11;
      }
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v15 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v15);
      unint64_t v16 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v12 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 2529, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController.activityViewController", v14, v16 object file lineNumber description];
    }
    else
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      [v12 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 2529, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController.activityViewController", v14 object file lineNumber description];
    }

    goto LABEL_8;
  }
  if (v5) {
    (*((void (**)(id, void))v5 + 2))(v5, 0);
  }
LABEL_11:
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayLatency", "", buf, 2u);
  }
}

void __63__PUPhotosGridViewController__presentShareSheetWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayDuration", " enableTelemetry=YES ", v2, 2u);
  }
}

uint64_t __63__PUPhotosGridViewController__presentShareSheetWithCompletion___block_invoke_561(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)sender:(id)a3 shareSelectedAssetsWithCompletion:(id)a4
{
}

- (void)_presentActivitySharingController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PUPhotosGridViewController *)self setActivitySharingController:v7];
  id v8 = [v7 activityViewController];

  [(PUPhotosGridViewController *)self presentViewController:v8 animated:1 completion:v6];
}

- (id)_activitySharingControllerWithSelectionManager:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  id v6 = [(PUPhotosGridViewController *)self photosDataSource];
  id v7 = [v6 fetchResultsByAssetCollection];

  id v8 = [[PUActivitySharingConfiguration alloc] initWithCollectionsFetchResult:v5 selectionManager:v4];
  [(PUActivitySharingConfiguration *)v8 setAssetsFetchResultsByAssetCollection:v7];
  uint64_t v9 = [(PUPhotosGridViewController *)self photosDataSource];
  [(PUActivitySharingConfiguration *)v8 setPhotosDataSource:v9];

  id v10 = [[PUActivitySharingController alloc] initWithActivitySharingConfiguration:v8];
  [(PUActivitySharingController *)v10 setDelegate:self];

  return v10;
}

- (id)_selectionManagerWithSharableAssetsInFetchResult:(id)a3 forAssetCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PUPhotoSelectionManager alloc] initWithOptions:0];
  [(PUPhotoSelectionManager *)v8 setDataSource:self];
  uint64_t v9 = [MEMORY[0x1E4F28E60] indexSet];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__PUPhotosGridViewController__selectionManagerWithSharableAssetsInFetchResult_forAssetCollection___block_invoke;
  void v13[3] = &unk_1E5F2A728;
  void v13[4] = self;
  id v10 = v6;
  id v14 = v10;
  id v11 = v9;
  id v15 = v11;
  [v7 enumerateObjectsUsingBlock:v13];

  if ([v11 count]) {
    [(PUPhotoSelectionManager *)v8 selectAssetsAtIndexes:v11 inAssetCollection:v10];
  }

  return v8;
}

void __98__PUPhotosGridViewController__selectionManagerWithSharableAssetsInFetchResult_forAssetCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_canShareAsset:"))
  {
    id v5 = [*(id *)(a1 + 32) photosDataSource];
    uint64_t v6 = [v5 indexForAsset:v7 inCollection:*(void *)(a1 + 40) hintIndex:a3];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      [*(id *)(a1 + 48) addIndex:v6];
    }
  }
}

- (unint64_t)_sharableAssetsTypeInFetchResult:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PUPhotosGridViewController__sharableAssetsTypeInFetchResult___block_invoke;
  v7[3] = &unk_1E5F2A700;
  v7[4] = self;
  void v7[5] = v8;
  v7[6] = &v9;
  [v4 enumerateObjectsUsingBlock:v7];
  unint64_t v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

uint64_t __63__PUPhotosGridViewController__sharableAssetsTypeInFetchResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) _canShareAsset:a2];
  if (result)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 2uLL)
    {
      *(void *)(v7 + 24) = 1;
    }
    else
    {
      *(void *)(v7 + 24) = 2;
      *a4 = 1;
    }
  }
  return result;
}

- (id)_selectionManagerWithSelectedSharableAssets
{
  uint64_t v3 = [[PUPhotoSelectionManager alloc] initWithOptions:0];
  [(PUPhotoSelectionManager *)v3 setDataSource:self];
  id v4 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  unint64_t v5 = [(PUPhotosGridViewController *)self photoSelectionManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__PUPhotosGridViewController__selectionManagerWithSelectedSharableAssets__block_invoke;
  v11[3] = &unk_1E5F2A6D8;
  v11[4] = self;
  id v12 = v4;
  uint64_t v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [v5 enumerateSelectedAssetsWithAssetCollectionOrdering:v7 block:v11];

  id v8 = v13;
  uint64_t v9 = v6;

  return v9;
}

void __73__PUPhotosGridViewController__selectionManagerWithSelectedSharableAssets__block_invoke(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ([a1[4] _canShareAsset:a2])
  {
    id v7 = [a1[5] objectAtIndex:a4];
    [a1[6] selectAssetAtIndex:a3 inAssetCollection:v7];
  }
}

- (void)_handleSelectionButton:(id)a3
{
  id v4 = [(PUPhotosGridViewController *)self presentedViewController];

  if (!v4)
  {
    BOOL v5 = [(PUPhotosGridViewController *)self _areAllAssetsSelected];
    uint64_t v6 = [(PUPhotosGridViewController *)self photoSelectionManager];
    id v7 = [(PUPhotosGridViewController *)self collectionListFetchResult];
    if (v5) {
      [v6 deselectAllAssetsInAssetCollections:v7];
    }
    else {
      [v6 selectAllAssetsInAssetCollections:v7];
    }

    [(PUPhotosGridViewController *)self _updateCollectionViewMultipleSelection];
    [(PUPhotosGridViewController *)self updatePeripheralInterfaceAnimated:0];
  }
}

- (void)_handleCancelButton:(id)a3
{
  id v4 = [(PUPhotosGridViewController *)self presentedViewController];

  if (!v4)
  {
    [(PUPhotosGridViewController *)self setEditing:0 animated:1];
  }
}

- (void)_handleSelectSessionCancelButton:(id)a3
{
  id v4 = [(PUPhotosGridViewController *)self presentedViewController];

  if (!v4)
  {
    id v5 = [(PUPhotosGridViewController *)self sessionInfo];
    [v5 setStatus:2];
  }
}

- (void)_handleSelectSessionDoneButton:(id)a3
{
  id v4 = [(PUPhotosGridViewController *)self presentedViewController];

  if (!v4)
  {
    id v5 = [(PUPhotosGridViewController *)self sessionInfo];
    [v5 setStatus:1];
  }
}

- (void)paste:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PUPhotosGridViewController *)self _menuIndexPath];
  id v7 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v6 section]);
  if ([v7 canPerformEditOperation:3])
  {
    if (!v6)
    {
LABEL_6:
      id v8 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 2352, @"Attempting to paste into a non-editable collection: %@", v7 object file lineNumber description];

    if (!v6) {
      goto LABEL_6;
    }
  }
  if (!self->_isMenuIndexPathExact) {
    goto LABEL_6;
  }
  id v8 = [(PUPhotosGridViewController *)self assetAtIndexPath:v6];
LABEL_7:
  id v10 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  uint64_t v11 = objc_msgSend(v10, "px_assets");

  if ((unint64_t)[v11 count] > 1
    || [v11 count] == 1
    && ([v11 lastObject], id v12 = objc_claimAutoreleasedReturnValue(), v12, v12 != v8))
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    uint64_t v25 = 0;
    if (v8) {
      uint64_t v13 = [v6 item];
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v25 = v13;
    id v14 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v7];
    id v15 = [v14 photoLibrary];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __36__PUPhotosGridViewController_paste___block_invoke;
    v17[3] = &unk_1E5F2A6B0;
    id v18 = v7;
    id v16 = v14;
    id v19 = v16;
    id v20 = v11;
    id v21 = v8;
    id v22 = v6;
    id v23 = v24;
    [v15 performChanges:v17 completionHandler:0];

    _Block_object_dispose(v24, 8);
  }
  [(PUPhotosGridViewController *)self _setMenuIndexPath:0];
  self->_showingMenu = 0;
}

void __36__PUPhotosGridViewController_paste___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:*(void *)(a1 + 32) assets:*(void *)(a1 + 40)];
  uint64_t v3 = [MEMORY[0x1E4F28E60] indexSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
          [v3 addIndex:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  if ([v3 count]) {
    [v2 removeAssets:*(void *)(a1 + 48)];
  }
  if (objc_msgSend(v3, "count", (void)v17) && *(void *)(a1 + 56))
  {
    uint64_t v10 = [*(id *)(a1 + 64) item];
    if ([v3 containsIndex:v10])
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v13 = objc_msgSend(v3, "countOfIndexesInRange:", 0, v10);
      uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v12 = *(void *)(v11 + 24) - v13;
    }
    *(void *)(v11 + 24) = v12;
  }
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  uint64_t v15 = *(void *)(a1 + 48);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v2 addAssets:v15];
  }
  else
  {
    id v16 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:");
    [v2 insertAssets:v15 atIndexes:v16];
  }
}

- (void)copy:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLUIGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "Please stop calling copy: on %@, it does not support copy anymore, but the method is still implemented to avoid crashing", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_paste_ == a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = [(PUPhotosGridViewController *)self _menuIndexPath];
    if (v7 || [(PUPhotosGridViewController *)self _hasAtLeastOneContainer])
    {
      id v8 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v7 section]);
      if ([v8 canPerformEditOperation:3])
      {
        uint64_t v9 = [MEMORY[0x1E4FB1A78] generalPasteboard];
        char v10 = objc_msgSend(v9, "px_containsAssets");
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }

    if (sel_copy_ == a3) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v10;
    }
  }
  else if (sel_copy_ == a3)
  {
    BOOL v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PUPhotosGridViewController;
    BOOL v11 = [(PUPhotosGridViewController *)&v13 canPerformAction:a3 withSender:v6];
  }

  return v11;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)scrollViewSpeedometer:(id)a3 regimeDidChange:(int64_t)a4 from:(int64_t)a5
{
  id v7 = a3;
  if ((unint64_t)a4 <= 3)
  {
    id v8 = v7;
    [(PUPhotosGridViewController *)self _setMaximumNumberOfRowsToPreheat:qword_1AEFF8348[a4]];
    id v7 = v8;
  }
}

- (id)indexPathsForPreheatingInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = [(PUPhotosGridViewController *)self gridLayout];
  id v8 = objc_msgSend(v7, "layoutAttributesForElementsInRect:", x, y, width, height);

  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v16 = objc_msgSend(v15, "representedElementKind", (void)v19);

        if (!v16)
        {
          long long v17 = [v15 indexPath];
          if (v17) {
            [v9 addObject:v17];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  return v9;
}

- (double)cellAspectRatioHint
{
  return 0.0;
}

- (void)endBatchPreheating
{
  int64_t v3 = [(PUPhotosGridViewController *)self _batchPreheatingCount] - 1;
  [(PUPhotosGridViewController *)self _setBatchPreheatingCount:v3];
  if (!v3)
  {
    [(PUPhotosGridViewController *)self preheatAssets];
  }
}

- (void)beginBatchPreheating
{
  int64_t v3 = [(PUPhotosGridViewController *)self _batchPreheatingCount] + 1;
  [(PUPhotosGridViewController *)self _setBatchPreheatingCount:v3];
}

- (BOOL)isPreheatingEnabled
{
  return 1;
}

- (void)preheatAssetsWithPrefetchingDisabled:(BOOL)a3
{
  if ([(PUPhotosGridViewController *)self isPreheatingEnabled])
  {
    if ([(PUPhotosGridViewController *)self px_isVisible])
    {
      uint64_t v5 = [(PUPhotosGridViewController *)self collectionView];
      if (v5)
      {
        id v6 = (void *)v5;
        id v7 = [(PUPhotosGridViewController *)self mainGridLayout];
        id v8 = [v7 collectionView];

        if (v8)
        {
          if ([(PUPhotosGridViewController *)self _batchPreheatingCount] <= 0)
          {
            uint64_t v9 = [(PUPhotosGridViewController *)self collectionView];
            [(PUPhotosGridViewController *)self contentOffsetForPreheating];
            double v11 = v10;
            double v13 = v12;
            [v9 bounds];
            double v15 = v14;
            double v17 = v16;
            long long v18 = [(PUPhotosGridViewController *)self mainGridLayout];
            [(PUPhotosGridViewController *)self imageRequestItemSize];
            double v20 = v19;
            [(PUPhotosGridViewController *)self _previousPreheatContentOffset];
            double v22 = v21;
            [(PUPhotosGridViewController *)self _previousPrefetchContentOffset];
            if (v13 - v22 >= 0.0) {
              double v24 = v13 - v22;
            }
            else {
              double v24 = -(v13 - v22);
            }
            if (v24 > v20 * 0.5) {
              goto LABEL_13;
            }
            double v25 = v13 - v23;
            if (v25 < 0.0) {
              double v25 = -v25;
            }
            if (v25 > v20 * 0.5)
            {
LABEL_13:
              -[PUPhotosGridViewController _setPreviousPreheatContentOffset:](self, "_setPreviousPreheatContentOffset:", v11, v13);
              double v26 = v20
                  * (double)[(PUPhotosGridViewController *)self _maximumNumberOfRowsToPreheat];
              if (v24 < v26) {
                double v26 = v24;
              }
              if (v26 >= v17) {
                double v27 = v26;
              }
              else {
                double v27 = v17;
              }
              double v28 = *MEMORY[0x1E4FB2848];
              double v29 = *(double *)(MEMORY[0x1E4FB2848] + 8);
              double v30 = -v27;
              double v31 = -v26;
              double v32 = v27 * -4.0;
              if (v13 > v22)
              {
                double v33 = v30;
              }
              else
              {
                double v28 = v31;
                double v33 = v32;
              }
              if (v13 < v22)
              {
                double v31 = *(double *)(MEMORY[0x1E4FB2848] + 16);
                double v32 = v30;
              }
              double v84 = v11;
              double v34 = v11 + v29;
              double v35 = v13 + v28;
              double v81 = v15;
              double v36 = v15 - (v29 + *(double *)(MEMORY[0x1E4FB2848] + 24));
              double v37 = v17 - (v28 + v31);
              double v78 = v13;
              double v38 = v13 + v33;
              double v39 = v17 - (v33 + v32);
              [(PUPhotosGridViewController *)self contentSizeForPreheating];
              if (v35 >= 0.0) {
                double v41 = v35;
              }
              else {
                double v41 = 0.0;
              }
              if (v40 > 0.0 && v37 + v41 > v40) {
                double v37 = v40 - v41;
              }
              if (v38 >= 0.0) {
                double v42 = v38;
              }
              else {
                double v42 = 0.0;
              }
              double v43 = v40 - v42;
              if (v40 <= 0.0 || v39 + v42 <= v40) {
                double v43 = v39;
              }
              double v79 = v43;
              double v80 = v42;
              [(PUPhotosGridViewController *)self _previousPreheatRect];
              CGFloat v82 = v44;
              CGFloat v46 = v45;
              CGFloat v48 = v47;
              CGFloat v50 = v49;
              -[PUPhotosGridViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", v34, v41, v36, v37);
              id v51 = [(PUPhotosGridViewController *)self photosDataSource];
              uint64_t v104 = 0;
              __int16 v105 = &v104;
              uint64_t v106 = 0x3032000000;
              uint64_t v107 = __Block_byref_object_copy__69138;
              v108 = __Block_byref_object_dispose__69139;
              id v109 = 0;
              uint64_t v98 = 0;
              long long v99 = &v98;
              uint64_t v100 = 0x3032000000;
              v101 = __Block_byref_object_copy__69138;
              v102 = __Block_byref_object_dispose__69139;
              id v103 = 0;
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_533;
              aBlock[3] = &unk_1E5F2A638;
              id v52 = v18;
              id v95 = v52;
              long long v96 = &v104;
              long long v97 = &v98;
              uint64_t v53 = _Block_copy(aBlock);
              v91[0] = MEMORY[0x1E4F143A8];
              v91[1] = 3221225472;
              v91[2] = __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_2;
              v91[3] = &unk_1E5F2A660;
              char v93 = 1;
              id v54 = v53;
              id v92 = v54;
              PUDiffVerticalRects(v91, v82, v46, v48, v50, v34, v41, v36, v37);
              id v55 = [v51 approximateAssetsAtIndexPaths:v105[5]];
              v77 = v18;
              id v83 = v9;
              double v56 = [v51 approximateAssetsAtIndexPaths:v99[5]];
              id v57 = objc_opt_new();
              objc_msgSend(v57, "setDeliveryMode:", -[PUPhotosGridViewController imageDeliveryMode](self, "imageDeliveryMode"));
              BOOL v58 = (unint64_t)[(PUPhotosGridViewController *)self cellFillMode] < 2;
              [(PUPhotosGridViewController *)self imageRequestItemPixelSize];
              double v60 = v59;
              double v62 = v61;
              v63 = [(PUPhotosGridViewController *)self _cachingImageManager];
              objc_msgSend(v63, "startCachingImagesForAssets:targetSize:contentMode:options:", v55, v58, v57, v60, v62);

              BOOL v64 = [(PUPhotosGridViewController *)self _cachingImageManager];
              objc_msgSend(v64, "stopCachingImagesForAssets:targetSize:contentMode:options:", v56, v58, v57, v60, v62);

              if (!a3)
              {
                [(PUPhotosGridViewController *)self _previousPrefetchRect];
                CGFloat v66 = v65;
                CGFloat v68 = v67;
                CGFloat v70 = v69;
                CGFloat v72 = v71;
                -[PUPhotosGridViewController _setPreviousPrefetchRect:](self, "_setPreviousPrefetchRect:", v84 + 0.0, v80, v81, v79);
                -[PUPhotosGridViewController _setPreviousPrefetchContentOffset:](self, "_setPreviousPrefetchContentOffset:", v84, v78);
                v73 = [MEMORY[0x1E4F1CA48] array];
                id v74 = [MEMORY[0x1E4F1CA48] array];
                v85[0] = MEMORY[0x1E4F143A8];
                v85[1] = 3221225472;
                v85[2] = __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_3;
                v85[3] = &unk_1E5F2A688;
                id v86 = v52;
                double v89 = v84;
                double v90 = v78;
                id v75 = v73;
                id v87 = v75;
                id v76 = v74;
                id v88 = v76;
                PUDiffVerticalRects(v85, v66, v68, v70, v72, v84 + 0.0, v80, v81, v79);
                [v51 prefetchApproximateAssetsAtIndexPaths:v75 reverseOrder:1];
                [v51 prefetchApproximateAssetsAtIndexPaths:v76 reverseOrder:0];
              }
              _Block_object_dispose(&v98, 8);

              _Block_object_dispose(&v104, 8);
              uint64_t v9 = v83;
              long long v18 = v77;
            }
          }
        }
      }
    }
  }
}

void __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_533(uint64_t a1, int a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "assetIndexPathsForElementsInRect:");
  if (v4) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  double v15 = (void *)v4;
  if (v5)
  {
    id v6 = (void *)v4;
    if (!v4 || (a2 & 1) != 0) {
      goto LABEL_12;
    }
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v9 = a1 + 48;
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v9 = a1 + 40;
    uint64_t v8 = v10;
  }
  double v11 = *(void **)(*(void *)(v8 + 8) + 40);
  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v13 = *(void *)(*(void *)v9 + 8);
    double v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    double v11 = *(void **)(*(void *)(*(void *)v9 + 8) + 40);
  }
  [v11 addObjectsFromArray:v15];
  id v6 = v15;
LABEL_12:
}

uint64_t __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) != 0 || *(unsigned char *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __67__PUPhotosGridViewController_preheatAssetsWithPrefetchingDisabled___block_invoke_3(uint64_t a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetIndexPathsForElementsInRect:");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v15.origin.double x = a3;
    v15.origin.double y = a4;
    v15.size.double width = a5;
    v15.size.double height = a6;
    CGFloat MinY = CGRectGetMinY(v15);
    uint64_t v12 = 40;
    if (*(double *)(a1 + 64) < MinY) {
      uint64_t v12 = 48;
    }
    [*(id *)(a1 + v12) addObjectsFromArray:v13];
  }
}

- (void)preheatAssets
{
}

- (CGSize)contentSizeForPreheating
{
  uint64_t v2 = [(PUPhotosGridViewController *)self mainGridLayout];
  [v2 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGPoint)contentOffsetForPreheating
{
  uint64_t v2 = [(PUPhotosGridViewController *)self collectionView];
  [v2 contentOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)resetPreheating
{
  [(PHCachingImageManager *)self->__cachingImageManager stopCachingImagesForAllAssets];
  -[PUPhotosGridViewController _setPreviousPreheatContentOffset:](self, "_setPreviousPreheatContentOffset:", 1.79769313e308, 1.79769313e308);
  -[PUPhotosGridViewController _setPreviousPrefetchContentOffset:](self, "_setPreviousPrefetchContentOffset:", 1.79769313e308, 1.79769313e308);
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  -[PUPhotosGridViewController _setPreviousPreheatRect:](self, "_setPreviousPreheatRect:", *MEMORY[0x1E4F1DB28], v4, v5, v6);
  -[PUPhotosGridViewController _setPreviousPrefetchRect:](self, "_setPreviousPrefetchRect:", v3, v4, v5, v6);
}

- (int64_t)imageDeliveryMode
{
  return 0;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v5 scrollViewDidScrollToTop:v4];
}

- (void)scrollViewWillScrollToTop:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v5 scrollViewWillScrollToTop:v4];

  [(PUPhotosGridViewController *)self _userDidStartScrolling];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v5 scrollViewDidEndDecelerating:v4];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v7 scrollViewDidEndDragging:v6 willDecelerate:v4];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v5 scrollViewWillBeginDragging:v4];

  [(PUPhotosGridViewController *)self _clearAutomaticContentOffsetSnapshot];
  [(PUPhotosGridViewController *)self _userDidStartScrolling];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v5 scrollViewDidScroll:v4];

  [(PUPhotosGridViewController *)self preheatAssets];
  id v6 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  [v6 presentingViewControllerScrollViewDidScroll:v4];

  [(PUPhotosGridViewController *)self setPendingProcessDataSourceUpdateBlock:0];
  id v12 = [(PUPhotosGridViewController *)self collectionView];
  [v12 bounds];
  double v8 = v7;
  [v12 adjustedContentInset];
  BOOL v10 = v8 + v9 < 0.0;
  double v11 = [(PUPhotosGridViewController *)self photosDataSource];
  [v11 setAllowNextChangeDeliveryOnAllRunLoopModes:v10];
}

- (void)_userDidStartScrolling
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_lastUserScrollTime = v3;
}

- (double)lastUserScrollTime
{
  return self->_lastUserScrollTime;
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotosGridViewController;
  [(PUPhotosGridViewController *)&v5 viewDidLayoutSubviews];
  id pendingNavigationBlock = (void (**)(void))self->_pendingNavigationBlock;
  if (pendingNavigationBlock)
  {
    pendingNavigationBlock[2]();
    id v4 = self->_pendingNavigationBlock;
    self->_id pendingNavigationBlock = 0;
  }
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PUPhotosGridViewController;
  [(PUPhotosGridViewController *)&v19 viewWillLayoutSubviews];
  if ([(PUPhotosGridViewController *)self updateSpec])
  {
    double v3 = [(PUPhotosGridViewController *)self gridSpec];
    int v4 = [v3 wantsCustomNavigationTransition];

    if (v4) {
      [(UIViewController *)self pu_restoreNavigationTransition];
    }
    else {
      [(UIViewController *)self pu_removeNavigationTransition];
    }
    [(PUPhotosGridViewController *)self _updateLayoutReferenceValues];
    [(PUPhotosGridViewController *)self updateInterfaceForModelReloadAnimated:0];
  }
  else
  {
    [(PUPhotosGridViewController *)self _updateLayoutReferenceValues];
  }
  if (!self->_didScrollToInitialPosition)
  {
    if ([(PUPhotosGridViewController *)self initiallyScrolledToBottom])
    {
      objc_super v5 = [(PUPhotosGridViewController *)self mainGridLayout];
      if ([(PUPhotosGridViewController *)self wantsGlobalFooter])
      {
        id v6 = [v5 globalFooterIndexPath];
        double v7 = [v5 layoutAttributesForSupplementaryViewOfKind:@"PUGridGlobalFooter" atIndexPath:v6];
      }
      else
      {
        double v7 = 0;
      }
      double v8 = [(PUPhotosGridViewController *)self collectionView];
      double v9 = v8;
      if (v7)
      {
        [v8 contentOffset];
        double v11 = v10;
        id v12 = [v9 collectionViewLayout];
        [v12 collectionViewContentSize];
        double v14 = v13;

        [v9 adjustedContentInset];
        double v16 = v15;
        [v9 bounds];
        double v17 = v16 + v14 - CGRectGetHeight(v20);
        [v7 frame];
        objc_msgSend(v9, "px_scrollToContentOffset:animated:", 0, v11, v17 - v18);
      }
      else
      {
        objc_msgSend(v8, "px_scrollToEdge:animated:", 3, 0);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v9 didScrollToInitialPosition];
      }
      [v5 invalidateLayoutForVerticalScroll];
    }
    self->_didScrollToInitialPosition = 1;
  }
  [(PUPhotosGridViewController *)self _updateContentOffsetForPendingViewSizeTransition];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v7 = [(PUPhotosGridViewController *)self isEditing];
  v39.receiver = self;
  v39.super_class = (Class)PUPhotosGridViewController;
  [(PUPhotosGridViewController *)&v39 setEditing:v5 animated:v4];
  if (v7 != v5)
  {
    [(PUPhotosGridViewController *)self updatePeripheralInterfaceAnimated:v4];
    if (v4) {
      uint64_t v8 = *MEMORY[0x1E4FB2E08];
    }
    else {
      uint64_t v8 = 0;
    }
    -[UIViewController pu_performBarsVisibilityUpdatesWithAnimationSettings:](self, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", v4, v8);
    double v9 = [(PUPhotosGridViewController *)self collectionView];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    double v10 = [v9 indexPathsForVisibleItems];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          if ([(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v15])
          {
            double v16 = [v9 cellForItemAtIndexPath:v15];
            [(PUPhotosGridViewController *)self _configureAddPlaceholderCell:v16 animated:v4];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v12);
    }

    if (v5)
    {
      double v17 = [(PUPhotosGridViewController *)self primingActivityViewController];

      if (!v17)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F9F2E8]);
        objc_super v19 = (void *)[v18 initWithActivityItems:MEMORY[0x1E4F1CBF0] applicationActivities:MEMORY[0x1E4F1CBF0]];
        [(PUPhotosGridViewController *)self setPrimingActivityViewController:v19];
      }
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      CGRect v20 = [(PUPhotosGridViewController *)self _multiSelectInteraction];
      double v21 = [v20 gesturesForFailureRequirements];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v40 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v21);
            }
            double v26 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            [v26 setEnabled:0];
            [v26 setEnabled:1];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v40 count:16];
        }
        while (v23);
      }

      double v27 = [(PUPhotosGridViewController *)self _removeActionSheet];
      double v28 = [v27 presentingViewController];
      [v28 dismissViewControllerAnimated:1 completion:0];

      double v29 = [(PUPhotosGridViewController *)self photoSelectionManager];
      [v29 deselectAllAssets];

      [(PUPhotosGridViewController *)self setPrimingActivityViewController:0];
    }
    if ([(PUPhotosGridViewController *)self _hasAccessibilityLargeText])
    {
      double v30 = [(PUPhotosGridViewController *)self mainGridLayout];
      [v30 invalidateLayout];
    }
    [(PUPhotosGridViewController *)self _updateCollectionViewMultipleSelection];
  }
}

- (BOOL)_hasAccessibilityLargeText
{
  uint64_t v2 = [(PUPhotosGridViewController *)self traitCollection];
  BOOL v3 = +[PUInterfaceManager shouldUseAccessibilityLargeTextLayoutWithTraitCollecton:v2];

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v2 = [(PUPhotosGridViewController *)self gridSpec];
  unint64_t v3 = [v2 supportedInterfaceOrientations];

  return v3;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return ((1 << a3) & ~[(PUPhotosGridViewController *)self supportedInterfaceOrientations]) == 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  [(PUPhotosGridViewController *)self uninstallGestureRecognizers];
  BOOL v5 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  [v5 presentingViewControllerViewDidDisappear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  [(PUPhotosGridViewController *)self _saveAnchorForAutomaticContentOffsetAdjustment];
  [(PUPhotosGridViewController *)self resetPreheating];
  BOOL v5 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  [v5 presentingViewControllerViewWillDisappear:v3];

  [(PUPhotosGridViewController *)self _updateBackButtonTitle];
  [(PUPhotosGridViewController *)self setPendingProcessDataSourceUpdateBlock:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewDidAppear:](&v10, sel_viewDidAppear_);
  BOOL v5 = [(PUPhotosGridViewController *)self _pushedPhotoBrowserController];

  if (v5)
  {
    objc_super v6 = [(PUPhotosGridViewController *)self collectionView];
    [v6 _setAutomaticContentOffsetAdjustmentEnabled:0];
  }
  [(PUPhotosGridViewController *)self _setPushedPhotoBrowserController:0];
  int v7 = [(PUPhotosGridViewController *)self onViewDidAppearCompletion];

  if (v7)
  {
    uint64_t v8 = [(PUPhotosGridViewController *)self onViewDidAppearCompletion];
    ((void (**)(void, PUPhotosGridViewController *))v8)[2](v8, self);

    [(PUPhotosGridViewController *)self setOnViewDidAppearCompletion:0];
  }
  [(PUPhotosGridViewController *)self preheatAssets];
  [(PUPhotosGridViewController *)self installGestureRecognizers];
  double v9 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  [v9 presentingViewControllerViewDidAppear:v3];
}

- (void)invalidateGridLayoutIfNecessary
{
  if ([(PUPhotosGridViewController *)self _updateTransitionWidthOnAppearance])
  {
    id v3 = [(PUPhotosGridViewController *)self mainGridLayout];
    [v3 invalidateLayout];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  BOOL v5 = [(PUPhotosGridViewController *)self updateSpec];
  BOOL v6 = [(PUPhotosGridViewController *)self _updateTransitionWidthOnAppearance];
  [(PUPhotosGridViewController *)self forceDataSourceIfNeeded];
  [(PUPhotosGridViewController *)self beginBatchPreheating];
  [(PUPhotosGridViewController *)self resetPreheating];
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:v3];
  if (![(PUPhotosGridViewController *)self isContentViewInSyncWithModel] || v5 || v6)
  {
    [(PUPhotosGridViewController *)self updateInterfaceForModelReloadAnimated:0];
    [(PUPhotosGridViewController *)self _updateLayoutReferenceValues];
    [(PUPhotosGridViewController *)self _performAutomaticContentOffsetAdjustment];
  }
  else
  {
    [(PUPhotosGridViewController *)self _updateLayoutReferenceValues];
    [(PUPhotosGridViewController *)self updatePeripheralInterfaceAnimated:0];
  }
  [(PUPhotosGridViewController *)self endBatchPreheating];
  int v7 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
  [v7 presentingViewControllerViewWillAppear:v3];
}

- (int64_t)preferredStatusBarStyle
{
  uint64_t v2 = +[PUInterfaceManager currentTheme];
  int64_t v3 = [v2 topLevelStatusBarStyle];

  return v3;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PUPhotosGridViewController;
  [(PUPhotosGridViewController *)&v17 viewDidLoad];
  int64_t v3 = [(PUPhotosGridViewController *)self collectionView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 setPrefetchingEnabled:0];
    [v3 setAlwaysBounceVertical:1];
    [v3 setSelectionDelegate:self];
    [v3 setAllowsSelection:1];
    [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUPhotoCell"];
    [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"PUAddPlaceholderCell"];
    [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUGridGlobalHeader" withReuseIdentifier:@"PUGridGlobalHeader"];
    [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:@"PUGridGlobalFooter" withReuseIdentifier:@"PUGridGlobalFooter"];
    BOOL v4 = +[PUInterfaceManager currentTheme];
    BOOL v5 = [v4 photoCollectionViewBackgroundColor];

    [v3 setBackgroundColor:v5];
    if ([(PUPhotosGridViewController *)self canDragOut]) {
      [v3 setDragSourceDelegate:self];
    }
    [v3 setDragDestinationDelegate:self];
    BOOL v6 = [MEMORY[0x1E4F90110] sharedInstance];
    objc_msgSend(v3, "setReorderingCadence:", objc_msgSend(v6, "reorderCadence"));

    [v3 setDragInteractionEnabled:1];
  }
  [(PUPhotosGridViewController *)self updateSpec];
  [(PUPhotosGridViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  [(PUPhotosGridViewController *)self _updatePhotoSelectionManager];
  [(PUPhotosGridViewController *)self _updateSubviewsOrderingAndVisibility];
  int v7 = objc_opt_new();
  [(PUPhotosGridViewController *)self _setCollectionViewSpeedometer:v7];

  objc_super v8 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v8 setDelegate:self];

  double v9 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v9 setMediumUpperThreshold:1000.0];

  objc_super v10 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v10 setMediumLowerThreshold:200.0];

  uint64_t v11 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v11 setFastUpperThreshold:5000.0];

  uint64_t v12 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v12 setFastLowerThreshold:1000.0];

  [(PUPhotosGridViewController *)self _setMaximumNumberOfRowsToPreheat:10];
  [(PUPhotosGridViewController *)self _updateBackButtonTitle];
  uint64_t v13 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
  double v14 = [v13 masterThumbnailFormat];

  objc_msgSend(v14, "sizeWithFallBackSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[PUPhotosGridViewController _setMaximumThumbnailRequestSize:](self, "_setMaximumThumbnailRequestSize:");
  uint64_t v15 = [MEMORY[0x1E4F905E0] sharedScheduler];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__PUPhotosGridViewController_viewDidLoad__block_invoke;
  v16[3] = &unk_1E5F2ED10;
  v16[4] = self;
  [v15 scheduleMainQueueTask:v16];
}

void __41__PUPhotosGridViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PUPhotosGridSettings sharedInstance];
  [v2 addKeyObserver:*(void *)(a1 + 32)];

  id v3 = +[PURootSettings sharedInstance];
  [v3 addKeyObserver:*(void *)(a1 + 32)];
}

- (void)loadView
{
  if ([(PUPhotosGridViewController *)self useLayoutToLayoutNavigationTransitions])
  {
    [(PUPhotosGridViewController *)self setContentViewInSyncWithModel:1];
    v6.receiver = self;
    v6.super_class = (Class)PUPhotosGridViewController;
    [(PUPhotosGridViewController *)&v6 loadView];
  }
  else
  {
    id v5 = [(PUPhotosGridViewController *)self collectionViewLayout];
    id v3 = [PUCollectionView alloc];
    BOOL v4 = -[PUCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(PUCollectionView *)v4 setAccessibilityIdentifier:@"PhotosGridView"];
    [(PUCollectionView *)v4 setAutoresizingMask:18];
    [(PUPhotosGridViewController *)self setCollectionView:v4];
    [(PUPhotosGridViewController *)self setContentViewInSyncWithModel:0];
  }
}

- (BOOL)canBeginStackCollapseTransition
{
  return 0;
}

- (BOOL)canNavigateToPhotoInteractively:(BOOL)a3
{
  return 1;
}

- (void)uninstallGestureRecognizers
{
  id v3 = [(PUPhotosGridViewController *)self longPressGestureRecognizer];
  BOOL v4 = [v3 view];
  id v5 = [(PUPhotosGridViewController *)self longPressGestureRecognizer];
  [v4 removeGestureRecognizer:v5];

  objc_super v6 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];
  int v7 = [v6 view];
  objc_super v8 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];
  [v7 removeGestureRecognizer:v8];

  double v9 = [(PUPhotosGridViewController *)self _multiSelectInteraction];

  if (v9)
  {
    objc_super v10 = [(PUPhotosGridViewController *)self _multiSelectInteraction];
    uint64_t v11 = [v10 view];
    uint64_t v12 = [(PUPhotosGridViewController *)self _multiSelectInteraction];
    [v11 removeInteraction:v12];

    [(PUPhotosGridViewController *)self set_multiSelectInteraction:0];
  }
  uint64_t v13 = [(PUPhotosGridViewController *)self _contextMenuInteraction];
  if (v13)
  {
    id v15 = v13;
    double v14 = [v13 view];
    [v14 removeInteraction:v15];

    [(PUPhotosGridViewController *)self _setContextMenuInteraction:0];
    uint64_t v13 = v15;
  }
}

- (void)installGestureRecognizers
{
  id v9 = [(PUPhotosGridViewController *)self view];
  id v3 = [(PUPhotosGridViewController *)self longPressGestureRecognizer];
  if (!v3)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_handleLongPressGesture_];
    [v3 setDelegate:self];
    [(PUPhotosGridViewController *)self setLongPressGestureRecognizer:v3];
  }
  [v9 addGestureRecognizer:v3];
  BOOL v4 = [(PUPhotosGridViewController *)self photoOrStackPinchGestureRecognizer];
  if (!v4)
  {
    BOOL v4 = [[PUPhotoPinchGestureRecognizer alloc] initWithTarget:self action:sel_handlePhotoOrStackPinchGestureRecognizer_];
    [(PUPhotoPinchGestureRecognizer *)v4 setDelegate:self];
    [(PUPhotosGridViewController *)self _setPhotoOrStackPinchGestureRecognizer:v4];
  }
  [v9 addGestureRecognizer:v4];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB19C0]);
  [v5 setDelegate:self];
  [v5 setSingleTouchPanGestureHysteresis:5.0];
  objc_super v6 = [(PUPhotosGridViewController *)self collectionView];
  [v6 addInteraction:v5];

  [(PUPhotosGridViewController *)self set_multiSelectInteraction:v5];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
  [(PUPhotosGridViewController *)self _setContextMenuInteraction:v7];
  objc_super v8 = [(PUPhotosGridViewController *)self collectionView];
  [v8 addInteraction:v7];
}

- (id)contentScrollView
{
  if ([(PUPhotosGridViewController *)self isViewLoaded])
  {
    id v3 = [(PUPhotosGridViewController *)self collectionView];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (int64_t)_deleteActionForBarButtonItem:(id)a3
{
  BOOL v4 = (UIBarButtonItem *)a3;
  if ([(PUPhotosGridViewController *)self isTrashBinViewController])
  {
    if (self->_restoreToolbarButton == v4)
    {
      int64_t v5 = 3;
    }
    else if (self->_removeToolbarButton == v4)
    {
      int64_t v5 = 5;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)_referenceBarButtonItemForDeleteAction:(int64_t)a3
{
  BOOL v4 = &OBJC_IVAR___PUPhotosGridViewController__removeToolbarButton;
  if (!a3 || a3 == 5)
  {
LABEL_5:
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v4);
    return v5;
  }
  if (a3 == 3)
  {
    BOOL v4 = &OBJC_IVAR___PUPhotosGridViewController__restoreToolbarButton;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (void)_setPushedPhotoBrowserController:(id)a3
{
  objc_storeStrong((id *)&self->__pushedPhotoBrowserController, a3);
  [(PUPhotosGridViewController *)self _updateBackButtonTitle];
}

- (id)_bestReferenceItemIndexPathWithTopBias:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(PUPhotosGridViewController *)self collectionView];
  id v5 = [v4 collectionViewLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = [v5 collectionView];
  if (v7)
  {
    objc_super v8 = [v4 window];

    if (!v8)
    {
LABEL_35:
      id v7 = 0;
      goto LABEL_38;
    }
    [v4 bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    [v4 adjustedContentInset];
    double v18 = v10 + v17;
    double v20 = v12 + v19;
    double v22 = v14 - (v17 + v21);
    double v24 = v16 - (v19 + v23);
    double v25 = -0.0;
    if (v20 < 0.0) {
      double v25 = v20;
    }
    double v26 = v24 + v25;
    if (v20 >= 0.0) {
      double v27 = v20;
    }
    else {
      double v27 = 0.0;
    }
    uint64_t v28 = [v4 numberOfSections];
    uint64_t v29 = v28 - 1;
    if (v28 < 1 || [v4 numberOfItemsInSection:0] < 1)
    {
LABEL_32:
      if ([v5 conformsToProtocol:&unk_1F083ED00])
      {
        if (v3) {
          objc_msgSend(v5, "itemIndexPathClosestToPoint:", v18, v27);
        }
        else {
          objc_msgSend(v5, "itemIndexPathAtCenterOfRect:", v18, v27, v22, v26);
        }
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      }
      goto LABEL_35;
    }
    if (v6 && [v6 firstPreparedVisualSection])
    {
      id v7 = 0;
    }
    else
    {
      double v30 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      long long v31 = [v5 layoutAttributesForItemAtIndexPath:v30];
      long long v32 = v31;
      if (v31
        && ([v31 frame],
            v42.origin.double x = v18,
            v42.origin.double y = v27,
            v42.size.double width = v22,
            v42.size.double height = v26,
            CGRectIntersectsRect(v40, v42)))
      {
        id v7 = v30;
      }
      else
      {
        id v7 = 0;
      }

      if (!v6)
      {
        uint64_t v33 = v29;
LABEL_24:
        uint64_t v34 = [v4 numberOfItemsInSection:v33];
        if (!v7 && v34 >= 1)
        {
          long long v35 = [MEMORY[0x1E4F28D58] indexPathForItem:v34 - 1 inSection:v33];
          long long v36 = [v5 layoutAttributesForItemAtIndexPath:v35];
          long long v37 = v36;
          if (v36
            && ([v36 frame],
                v43.origin.double x = v18,
                v43.origin.double y = v27,
                v43.size.double width = v22,
                v43.size.double height = v26,
                CGRectIntersectsRect(v41, v43)))
          {
            id v7 = v35;
          }
          else
          {
            id v7 = 0;
          }
        }
LABEL_31:
        if (v7) {
          goto LABEL_38;
        }
        goto LABEL_32;
      }
    }
    uint64_t v33 = [v6 lastPreparedVisualSection];
    if (v33 != v29) {
      goto LABEL_31;
    }
    goto LABEL_24;
  }
LABEL_38:

  return v7;
}

- (id)bestReferenceItemIndexPath
{
  return [(PUPhotosGridViewController *)self _bestReferenceItemIndexPathWithTopBias:0];
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  id v5 = (UILongPressGestureRecognizer *)a3;
  if (self->_longPressGestureRecognizer != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
    id v5 = v6;
  }
}

- (id)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (BOOL)isAddPlaceholderAtIndexPath:(id)a3
{
  id v4 = a3;
  if (-[PUPhotosGridViewController wantsAddPlaceholderAtEndOfSection:](self, "wantsAddPlaceholderAtEndOfSection:", [v4 section]))
  {
    id v5 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v4 section]);
    id v6 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v5];
    uint64_t v7 = [v6 count];

    BOOL v8 = [v4 item] == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)wantsAddPlaceholderAtEndOfSection:(int64_t)a3
{
  return 0;
}

- (BOOL)hasScrollableContent
{
  BOOL v3 = [(PUPhotosGridViewController *)self collectionView];
  id v4 = v3;
  if (v3)
  {
    [v3 bounds];
    double v6 = v5;
    [v4 adjustedContentInset];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(PUPhotosGridViewController *)self mainGridLayout];
    double v12 = [v11 collectionView];

    if (v12)
    {
      [v11 collectionViewContentSize];
      double v14 = v13;
      [v11 globalFooterHeight];
      LOBYTE(v12) = v10 + v8 + v14 - v15 > v6;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return (char)v12;
}

- (BOOL)wantsGlobalFooter
{
  return 0;
}

- (double)globalHeaderHeight
{
  return 0.0;
}

- (id)newToolbarItems
{
  if ([(PUPhotosGridViewSupplementalToolbarProvider *)self->_supplementalToolbarProvider shouldShowToolbar])
  {
    [(PUPhotosGridViewSupplementalToolbarProvider *)self->_supplementalToolbarProvider toolbarItems];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return [(PUPhotosGridViewController *)self _newEditActionItemsWithWideSpacing:1];
  }
}

- (BOOL)shouldShowToolbar
{
  if ([(PUPhotosGridViewSupplementalToolbarProvider *)self->_supplementalToolbarProvider shouldShowToolbar])
  {
    LOBYTE(v3) = 1;
  }
  else if ([(PUPhotosGridViewController *)self isEditing])
  {
    id v4 = [(PUPhotosGridViewController *)self gridSpec];
    int v3 = [v4 canDisplayEditActionsInNavigationBar] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)shouldShowTabBar
{
  if ([(PUPhotosGridViewController *)self isEditing]) {
    return 0;
  }
  else {
    return ![(PUPhotosGridViewController *)self alwaysHideTabBar];
  }
}

- (id)sessionInfoForTransferredAssets:(id)a3
{
  id v3 = a3;
  id v4 = [[PUAlbumPickerSessionInfo alloc] initWithSourceAlbum:0 transferredAssets:v3];

  return v4;
}

- (int64_t)dateRangeFormatterPreset
{
  return 2;
}

- (PLDateRangeFormatter)_dateRangeFormatter
{
  dateRangeFormatter = self->__dateRangeFormatter;
  if (!dateRangeFormatter)
  {
    objc_msgSend(MEMORY[0x1E4F8A798], "autoupdatingFormatterWithPreset:", -[PUPhotosGridViewController dateRangeFormatterPreset](self, "dateRangeFormatterPreset"));
    id v4 = (PLDateRangeFormatter *)objc_claimAutoreleasedReturnValue();
    double v5 = self->__dateRangeFormatter;
    self->__dateRangeFormatter = v4;

    dateRangeFormatter = self->__dateRangeFormatter;
  }
  return dateRangeFormatter;
}

- (id)localizedTitleForAssetCollection:(id)a3 titleCategory:(int64_t *)a4
{
  id v6 = a3;
  double v7 = [v6 localizedTitle];
  if (![v7 length])
  {
    double v8 = [v6 startDate];
    if (v8)
    {
      double v9 = [(PUPhotosGridViewController *)self _dateRangeFormatter];
      double v10 = [v6 endDate];
      uint64_t v11 = [v9 stringFromDate:v8 toDate:v10];

      if (a4) {
        *a4 = 5;
      }
    }
    else
    {
      uint64_t v11 = (uint64_t)v7;
    }

    double v7 = (void *)v11;
  }

  return v7;
}

- (id)localizedTitleForAssetCollection:(id)a3
{
  return [(PUPhotosGridViewController *)self localizedTitleForAssetCollection:a3 titleCategory:0];
}

- (id)_localizedBannerTextForAsset:(id)a3 isDestructive:(BOOL *)a4
{
  id v6 = a3;
  if (![(PUPhotosGridViewController *)self isTrashBinViewController])
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewController.m" lineNumber:1357 description:@"expected trash bin"];
  }
  double v7 = PXPhotoKitLocalizedMessageForRecentlyDeletedDaysRemainingAsset();

  return v7;
}

- (id)localizedTitleForAssets:(id)a3
{
  return &stru_1F06BE7B8;
}

- (id)itemIndexPathAtPoint:(CGPoint)a3 outClosestMatch:(id *)a4 outLeftClosestMatch:(id *)a5 outAboveClosestMatch:(id *)a6
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [(PUPhotosGridViewController *)self collectionView];
  objc_msgSend(v11, "indexPathForItemAtPoint:", x, y);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  double v13 = v12;
  double v14 = [v11 collectionViewLayout];
  int v15 = [v14 conformsToProtocol:&unk_1F083ED00];

  if (!v12 && v15)
  {
    double v16 = [v11 collectionViewLayout];
    double v13 = objc_msgSend(v16, "itemIndexPathAtPoint:", x, y);
  }
  if (a5 != 0 && v12 == 0) {
    id v17 = 0;
  }
  else {
    id v17 = v12;
  }
  if (((a5 != 0 && v12 == 0) & v15) == 1)
  {
    double v18 = [v11 collectionViewLayout];
    double v19 = objc_msgSend(v18, "maxItemIndexPathLeftOfPoint:", x, y);

    id v17 = v19;
    *a5 = v17;
  }
  if (a6) {
    BOOL v20 = v17 == 0;
  }
  else {
    BOOL v20 = 0;
  }
  if (v20) {
    char v21 = v15 ^ 1;
  }
  else {
    char v21 = 1;
  }
  if (v20) {
    id v17 = 0;
  }
  if ((v21 & 1) == 0)
  {
    double v22 = [v11 collectionViewLayout];
    double v23 = objc_msgSend(v22, "maxItemIndexPathAbovePoint:", x, y);

    id v17 = v23;
    *a6 = v17;
  }
  if (a4 != 0 && v17 == 0) {
    double v24 = 0;
  }
  else {
    double v24 = v17;
  }
  if (((a4 != 0 && v17 == 0) & v15) == 1)
  {
    double v25 = [v11 collectionViewLayout];
    double v24 = objc_msgSend(v25, "itemIndexPathClosestToPoint:", x, y);
  }
  if (a4 && !v24)
  {
    double v26 = [v11 visibleCells];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      double v24 = 0;
      uint64_t v29 = *(void *)v39;
      double v30 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v32 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [v32 center];
          double v35 = (v34 - y) * (v34 - y) + (v33 - x) * (v33 - x);
          if (v35 < v30)
          {
            uint64_t v36 = [v11 indexPathForCell:v32];

            double v24 = (void *)v36;
            double v30 = v35;
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v28);
    }
    else
    {
      double v24 = 0;
    }
  }
  if (a4) {
    *a4 = v24;
  }

  return v13;
}

- (id)itemIndexPathAtPoint:(CGPoint)a3 outClosestMatch:(id *)a4
{
  return -[PUPhotosGridViewController itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:](self, "itemIndexPathAtPoint:outClosestMatch:outLeftClosestMatch:outAboveClosestMatch:", a4, 0, 0, a3.x, a3.y);
}

- (id)localizedSelectionTitle
{
  id v3 = objc_opt_class();
  id v4 = [(PUPhotosGridViewController *)self photoSelectionManager];
  double v5 = [v3 _localizedSelectionTitleWithPhotoSelectionManager:v4];

  return v5;
}

- (void)_removeSelectedAssetsWithCompletion:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v36;
    unint64_t v8 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v36 != v7) {
          objc_enumerationMutation(v4);
        }
        double v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
        uint64_t v11 = [(PUPhotosGridViewController *)self photoSelectionManager];
        long long v39 = v10;
        id v12 = [*(id *)(v8 + 2424) arrayWithObjects:&v39 count:1];
        double v13 = [v11 selectedAssetsWithAssetCollectionOrdering:v12];

        if ([v13 count])
        {
          double v14 = [(PUPhotosGridViewController *)self _assetsAllowingRemove:1 orDelete:0 fromAssets:v13];
          if ([v14 count] && objc_msgSend(v10, "canPerformEditOperation:", 2))
          {
            int v15 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v10];
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke;
            aBlock[3] = &unk_1E5F2E908;
            void aBlock[4] = v10;
            id v33 = v15;
            id v34 = v14;
            id v27 = v15;
            double v16 = _Block_copy(aBlock);
            uint64_t v17 = v6;
            uint64_t v18 = v7;
            unint64_t v19 = v8;
            BOOL v20 = v4;
            char v21 = _Block_copy(v16);
            [v26 addObject:v21];

            id v4 = v20;
            unint64_t v8 = v19;
            uint64_t v7 = v18;
            uint64_t v6 = v17;
          }
        }

        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v6);
  }
  double v22 = [v4 photoLibrary];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  _OWORD v30[2] = __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_2;
  v30[3] = &unk_1E5F2ED10;
  id v31 = v26;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_3;
  v28[3] = &unk_1E5F2DB20;
  id v29 = v25;
  id v23 = v25;
  id v24 = v26;
  [v22 performChanges:v30 completionHandler:v28];
}

void __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke(void *a1)
{
  id v2 = [MEMORY[0x1E4F38EF0] changeRequestForAssetCollection:a1[4] assets:a1[5]];
  [v2 removeAssets:a1[6]];
}

void __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_4;
  v3[3] = &unk_1E5F2C818;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_sync(MEMORY[0x1E4F14428], v3);
}

uint64_t __66__PUPhotosGridViewController__removeSelectedAssetsWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_hasAtLeastOneContainer
{
  uint64_t v2 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)selectAssets:(id)a3 fromAssetCollection:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(PUPhotosGridViewController *)self sessionInfo];
  long long v9 = [v8 photoSelectionManager];
  unint64_t v10 = [(PXPhotosDataSource *)self->_photosDataSource sectionForAssetCollection:v7];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v19 = v9;
    uint64_t v18 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v10];
    -[PXPhotosDataSource forceAccurateSectionsIfNeeded:](self->_photosDataSource, "forceAccurateSectionsIfNeeded:");
    uint64_t v11 = [MEMORY[0x1E4F28E60] indexSet];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [(PXPhotosDataSource *)self->_photosDataSource indexPathForAsset:*(void *)(*((void *)&v21 + 1) + 8 * v16) inCollection:v7];
          objc_msgSend(v11, "addIndex:", objc_msgSend(v17, "item"));

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    long long v9 = v19;
    if ([v11 count]) {
      [v19 selectAssetsAtIndexes:v11 inAssetCollection:v7];
    }

    id v6 = v20;
  }
}

- (void)_updatePhotoSelectionManager
{
  BOOL v3 = [(PUPhotosGridViewController *)self sessionInfo];
  id v5 = [v3 photoSelectionManager];

  uint64_t v4 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v4 = [(PUPhotosGridViewController *)self photoSelectionManager];
    if (!v4)
    {
      id v6 = [[PUPhotoSelectionManager alloc] initWithOptions:0];
      [(PUPhotoSelectionManager *)v6 setDataSource:self];
      uint64_t v4 = (uint64_t)v6;
    }
  }
  id v7 = (id)v4;
  [(PUPhotosGridViewController *)self _setPhotoSelectionManager:v4];
}

- (id)alternateContentView
{
  return self->_alternateContentView;
}

- (void)setAlternateContentView:(id)a3
{
  id v5 = (UIView *)a3;
  alternateContentView = self->_alternateContentView;
  if (alternateContentView != v5)
  {
    long long v8 = v5;
    [(UIView *)alternateContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_alternateContentView, a3);
    id v7 = [(PUPhotosGridViewController *)self view];
    [v7 addSubview:self->_alternateContentView];

    [(PUPhotosGridViewController *)self _updateSubviewsOrderingAndVisibility];
    id v5 = v8;
  }
}

- (id)_barButtonSpacerWithWidth:(double)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v4 setWidth:a3];
  return v4;
}

- (id)_newEditActionItemsWithWideSpacing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  BOOL v6 = [(PUPhotosGridViewController *)self isAnyAssetSelected];
  if ([(PUPhotosGridViewController *)self _canShareContent])
  {
    if (!self->_shareToolbarButton)
    {
      id v7 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:9 target:self action:sel__shareButtonPressed_];
      shareToolbarButton = self->_shareToolbarButton;
      self->_shareToolbarButton = v7;
    }
    long long v9 = [(PUPhotosGridViewController *)self photoSelectionManager];
    unint64_t v10 = [v9 selectedAssets];

    uint64_t v11 = [(PUPhotosGridViewController *)self _shareableAssetsFromAssets:v10];
    unint64_t v12 = [v11 count];
    if (v12 && v12 < [v10 count])
    {
      uint64_t v13 = PULocalizedString(@"SHARE_BUTTON_TITLE_COUNT");
      unint64_t v65 = v12;
      uint64_t v14 = PULocalizedStringWithValidatedFormat(v13, @"%ld");
    }
    else
    {
      uint64_t v14 = PULocalizedString(@"SHARE_BUTTON_TITLE");
    }
    -[UIBarButtonItem setTitle:](self->_shareToolbarButton, "setTitle:", v14, v65);
    [(UIBarButtonItem *)self->_shareToolbarButton setEnabled:v12 != 0];
    [v5 addObject:self->_shareToolbarButton];
  }
  BOOL v15 = [(PUPhotosGridViewController *)self isTrashBinViewController];
  BOOL v16 = [(PUPhotosGridViewController *)self canDeleteContent];
  BOOL v17 = [(PUPhotosGridViewController *)self _canRemoveContent];
  BOOL v18 = v17;
  if (!v16 && !v17)
  {
    double v67 = 0;
    unint64_t v19 = 0;
    id v20 = 0;
    long long v21 = 0;
    goto LABEL_34;
  }
  BOOL v66 = v6;
  if (v15)
  {
    if (!self->_restoreToolbarButton)
    {
      id v22 = objc_alloc(MEMORY[0x1E4FB14A8]);
      long long v23 = PULocalizedString(@"RESTORE_BUTTON_TITLE");
      long long v24 = (UIBarButtonItem *)[v22 initWithTitle:v23 style:0 target:self action:sel__removeButtonPressed_];
      restoreToolbarButton = self->_restoreToolbarButton;
      self->_restoreToolbarButton = v24;
    }
    removeToolbarButton = self->_removeToolbarButton;
    if (!removeToolbarButton)
    {
      id v27 = objc_alloc(MEMORY[0x1E4FB14A8]);
      uint64_t v28 = PULocalizedString(@"DELETE_BUTTON_TITLE");
      id v29 = (UIBarButtonItem *)[v27 initWithTitle:v28 style:0 target:self action:sel__removeButtonPressed_];
      double v30 = self->_removeToolbarButton;
      self->_removeToolbarButton = v29;

      removeToolbarButton = self->_removeToolbarButton;
    }
    if (v6) {
      id v31 = @"DELETE_BUTTON_TITLE";
    }
    else {
      id v31 = @"DELETE_ALL_BUTTON_TITLE";
    }
    if (v6) {
      long long v32 = @"RESTORE_BUTTON_TITLE";
    }
    else {
      long long v32 = @"RESTORE_ALL_BUTTON_TITLE";
    }
    id v33 = PULocalizedString(v31);
    [(UIBarButtonItem *)removeToolbarButton setTitle:v33];

    id v34 = self->_restoreToolbarButton;
    long long v35 = PULocalizedString(v32);
    [(UIBarButtonItem *)v34 setTitle:v35];
  }
  else
  {
    if (self->_removeToolbarButton) {
      goto LABEL_27;
    }
    long long v36 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:16 target:self action:sel__removeButtonPressed_];
    long long v35 = self->_removeToolbarButton;
    self->_removeToolbarButton = v36;
  }

LABEL_27:
  long long v37 = [(PUPhotosGridViewController *)self photoSelectionManager];
  long long v38 = [v37 selectedAssets];
  long long v39 = [v38 allObjects];

  long long v40 = [(PUPhotosGridViewController *)self _assetsAllowingRemove:v18 orDelete:v16 fromAssets:v39];
  uint64_t v41 = [v40 count];
  CGRect v42 = self->_removeToolbarButton;
  uint64_t v43 = v41 != 0;
  if (!v41 && v15) {
    uint64_t v43 = [(PUPhotosGridViewController *)self isEmpty] ^ 1;
  }
  [(UIBarButtonItem *)v42 setEnabled:v43];
  if (v3)
  {
    double v67 = 0;
    id v20 = 0;
  }
  else
  {
    double v44 = +[PUInterfaceManager currentTheme];
    [v44 photoCollectionToolbarTextTitleSpacerWidth];
    double v46 = v45;

    id v20 = [(PUPhotosGridViewController *)self _barButtonSpacerWithWidth:v46];
    double v67 = [(PUPhotosGridViewController *)self _barButtonSpacerWithWidth:v46];
  }
  long long v21 = self->_removeToolbarButton;
  unint64_t v19 = self->_restoreToolbarButton;

  BOOL v6 = v66;
LABEL_34:
  if (![(PUPhotosGridViewController *)self _canAddContent])
  {
    [(PUPhotosGridViewController *)self canAddToOtherAlbumContent];
    goto LABEL_41;
  }
  BOOL v47 = [(PUPhotosGridViewController *)self wantsAddContentInToolbar];
  [(PUPhotosGridViewController *)self canAddToOtherAlbumContent];
  if (!v47 || v6)
  {
LABEL_41:
    uint64_t v53 = 0;
    id v52 = 0;
    goto LABEL_44;
  }
  addToolbarButton = self->_addToolbarButton;
  if (!addToolbarButton)
  {
    double v49 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:0 style:0 target:self action:sel__addButtonPressed_];
    CGFloat v50 = self->_addToolbarButton;
    self->_addToolbarButton = v49;

    addToolbarButton = self->_addToolbarButton;
  }
  id v51 = PULocalizedString(@"ADD_FROM_ALBUM_BUTTON_TITLE");
  [(UIBarButtonItem *)addToolbarButton setTitle:v51];

  [(UIBarButtonItem *)self->_addToolbarButton setEnabled:1];
  if (v3)
  {
    id v52 = 0;
  }
  else
  {
    id v54 = +[PUInterfaceManager currentTheme];
    [v54 photoCollectionToolbarIconToTextSpacerWidth];
    double v56 = v55;

    id v52 = [(PUPhotosGridViewController *)self _barButtonSpacerWithWidth:v56];
  }
  uint64_t v53 = self->_addToolbarButton;
LABEL_44:
  id v57 = [(PUPhotosGridViewController *)self gridSpec];
  int v58 = [v57 shouldPlaceDeleteInCenterToolbarPosition];

  if (v58)
  {
    if (v20) {
      [v5 addObject:v20];
    }
    if (v21) {
      [v5 addObject:v21];
    }
    if (v67) {
      [v5 addObject:v67];
    }
    if (v19) {
      [v5 addObject:v19];
    }
    if (v52) {
      [v5 addObject:v52];
    }
    double v59 = v53;
    if (!v53) {
      goto LABEL_69;
    }
LABEL_68:
    [v5 addObject:v59];
    goto LABEL_69;
  }
  if (v52) {
    [v5 addObject:v52];
  }
  if (v53) {
    [v5 addObject:v53];
  }
  if (v20) {
    [v5 addObject:v20];
  }
  if (v21) {
    [v5 addObject:v21];
  }
  if (v67) {
    [v5 addObject:v67];
  }
  double v59 = v19;
  if (v19) {
    goto LABEL_68;
  }
LABEL_69:
  if (v3)
  {
    uint64_t v60 = objc_msgSend(v5, "count", v59);
    if (v60)
    {
      uint64_t v61 = v60 - 1;
      if (v60 != 1)
      {
        uint64_t v62 = 1;
        do
        {
          v63 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
          [v5 insertObject:v63 atIndex:v62];

          v62 += 2;
          --v61;
        }
        while (v61);
      }
    }
  }

  return v5;
}

- (BOOL)isCameraRoll
{
  return 0;
}

- (BOOL)isTrashBinViewController
{
  return 0;
}

- (BOOL)canDisplayEditButton
{
  BOOL v3 = [(PUPhotosGridViewController *)self _allowsActions:2]
    || [(PUPhotosGridViewController *)self _canAddContent]
    || [(PUPhotosGridViewController *)self _canShareContent]
    || [(PUPhotosGridViewController *)self _canRemoveContent]
    || [(PUPhotosGridViewController *)self canDeleteContent];
  if (![(PUPhotosGridViewController *)self isEmpty]) {
    return v3;
  }
  BOOL v4 = [(PUPhotosGridViewController *)self hasKnownNonEmptyContent_toWorkAround31995766];
  BOOL result = v4 && v3;
  if (!v4 && v3)
  {
    return [(PUPhotosGridViewController *)self _canAddContent];
  }
  return result;
}

- (BOOL)_canPasteboardCopyAssetAtIndexPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 1009, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  if ([(PUPhotosGridViewController *)self isAddPlaceholderAtIndexPath:v5])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    id v7 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v5 section]);
    long long v8 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v7];
    long long v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v5, "item"));

    int v6 = [v9 isStreamedVideo] ^ 1;
  }

  return v6;
}

- (id)_shareableAssetsFromAssets:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[PUPhotosGridViewController _canShareAsset:](self, "_canShareAsset:", v11, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_canShareAsset:(id)a3
{
  return [a3 canPerformSharingAction];
}

- (BOOL)_canShareContent
{
  return [(PUPhotosGridViewController *)self _allowsActions:32];
}

- (id)_assetsAllowingRemove:(BOOL)a3 orDelete:(BOOL)a4 fromAssets:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v6)
  {
    id v10 = v8;
LABEL_5:
    uint64_t v11 = v10;
    goto LABEL_7;
  }
  if (v5)
  {
    id v10 = [(PUPhotosGridViewController *)self _assetsAllowingEditOperation:1 fromAssets:v8];
    goto LABEL_5;
  }
  uint64_t v11 = 0;
LABEL_7:

  return v11;
}

- (id)_assetsAllowingEditOperation:(int64_t)a3 fromAssets:(id)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PUPhotosGridViewController__assetsAllowingEditOperation_fromAssets___block_invoke;
  v8[3] = &__block_descriptor_40_e24_B32__0__PHAsset_8Q16_B24l;
  void v8[4] = a3;
  id v4 = a4;
  BOOL v5 = [v4 indexesOfObjectsPassingTest:v8];
  BOOL v6 = [v4 objectsAtIndexes:v5];

  return v6;
}

uint64_t __70__PUPhotosGridViewController__assetsAllowingEditOperation_fromAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canPerformEditOperation:*(void *)(a1 + 32)];
}

- (BOOL)wantsAddContentInToolbar
{
  return 1;
}

- (BOOL)canAddToOtherAlbumContent
{
  return [(PUPhotosGridViewController *)self _allowsActions:2];
}

- (BOOL)_canAddContent
{
  BOOL v3 = [(PUPhotosGridViewController *)self _allowsActions:4];
  if (v3)
  {
    LOBYTE(v3) = [(PUPhotosGridViewController *)self _canAllContainersPerformEditOperation:3];
  }
  return v3;
}

- (BOOL)canDeleteContent
{
  BOOL v3 = [(PUPhotosGridViewController *)self _allowsActions:1];
  if (v3)
  {
    LOBYTE(v3) = [(PUPhotosGridViewController *)self _canAllContainersPerformEditOperation:1];
  }
  return v3;
}

- (BOOL)_canRemoveContent
{
  BOOL v3 = [(PUPhotosGridViewController *)self _allowsActions:1];
  if (v3)
  {
    LOBYTE(v3) = [(PUPhotosGridViewController *)self _canAllContainersPerformEditOperation:2];
  }
  return v3;
}

- (BOOL)_canAllContainersPerformEditOperation:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PUPhotosGridViewController *)self collectionListFetchResult];
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
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) canPerformEditOperation:a3])
        {
          BOOL v9 = 1;
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
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)_allowsActions:(unint64_t)a3
{
  return (a3 & ~[(PUPhotosGridViewController *)self allowedActions]) == 0;
}

- (BOOL)_areAllAssetsSelected
{
  BOOL v3 = [(PUPhotosGridViewController *)self photoSelectionManager];
  id v4 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  char v5 = [v3 areAllAssetsSelectedInAssetCollections:v4];

  return v5;
}

- (BOOL)isAnyAssetSelected
{
  uint64_t v2 = [(PUPhotosGridViewController *)self photoSelectionManager];
  char v3 = [v2 isAnyAssetSelected];

  return v3;
}

- (id)selectedIndexPaths
{
  char v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  char v5 = [(PUPhotosGridViewController *)self photoSelectionManager];
  uint64_t v6 = [v5 selectedAssetIndexesWithAssetCollectionOrdering:v4];

  if ([v6 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [v6 objectAtIndexedSubscript:v7];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __48__PUPhotosGridViewController_selectedIndexPaths__block_invoke;
      v10[3] = &unk_1E5F2A5F0;
      unint64_t v12 = v7;
      id v11 = v3;
      [v8 enumerateIndexesUsingBlock:v10];

      ++v7;
    }
    while (v7 < [v6 count]);
  }

  return v3;
}

void __48__PUPhotosGridViewController_selectedIndexPaths__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)selectedAssets
{
  id v3 = [(PUPhotosGridViewController *)self photoSelectionManager];
  id v4 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  char v5 = [v3 selectedAssetsWithAssetCollectionOrdering:v4];

  return v5;
}

- (BOOL)isEmpty
{
  uint64_t v2 = [(PUPhotosGridViewController *)self photosDataSource];
  id v3 = v2;
  if (v2) {
    char v4 = [v2 isEmpty];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)setContentViewInSyncWithModel:(BOOL)a3
{
  self->_contentViewInSyncWithModel = a3;
  if (a3)
  {
    char v4 = [(PUPhotosGridViewController *)self collectionListFetchResult];
    uint64_t v5 = [v4 count];

    [(PUPhotosGridViewController *)self _setPreviousCollectionsCount:v5];
  }
}

- (BOOL)isContentViewInSyncWithModel
{
  return self->_contentViewInSyncWithModel;
}

- (void)_getFirstAsset:(id *)a3 collection:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unint64_t v7 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v12 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v11];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          long long v15 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v11];
          long long v14 = [v15 firstObject];

          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  long long v14 = 0;
LABEL_11:

  if (a3) {
    *a3 = v14;
  }
  if (a4) {
    *a4 = v8;
  }
}

- (id)indexPathForAsset:(id)a3 hintCollection:(id)a4 hintIndexPath:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    id v18 = 0;
    goto LABEL_34;
  }
  id v11 = [(PUPhotosGridViewController *)self collectionListFetchResult];
  uint64_t v12 = [v11 count];

  if (!v10 || v12 <= [v10 section]) {
    goto LABEL_12;
  }
  uint64_t v13 = -[PUPhotosGridViewController photoCollectionAtIndex:](self, "photoCollectionAtIndex:", [v10 section]);
  long long v14 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v13];
  unint64_t v15 = [v14 count];
  if (v15 <= [v10 item])
  {

    goto LABEL_12;
  }
  long long v16 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v10, "item"));
  id v17 = [v16 isEqual:v8] ? v10 : 0;

  if (!v17)
  {
LABEL_12:
    long long v19 = [(PUPhotosGridViewController *)self photosDataSource];
    id v20 = v19;
    if (v9)
    {
      uint64_t v21 = [v19 sectionForAssetCollection:v9];
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v33 = v21;
        goto LABEL_30;
      }
    }
    id v22 = [v20 collectionListFetchResult];
    long long v23 = [v22 firstObject];
    long long v24 = v23;
    if (!v23 || [v23 assetCollectionType] != 3)
    {
      long long v32 = [(PUPhotosGridViewController *)self photosDataSource];
      [v32 forceAccurateAllSectionsIfNeeded];

      id v9 = 0;
LABEL_31:
      long long v35 = [v20 indexPathForAsset:v8 hintIndexPath:v10 hintCollection:v9];
LABEL_32:
      id v18 = v35;

      goto LABEL_33;
    }
    id v37 = v8;
    [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v8 withType:3 options:0];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (!v26)
    {
LABEL_25:

      id v9 = 0;
LABEL_37:
      long long v35 = 0;
      id v8 = v37;
      goto LABEL_32;
    }
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v39;
LABEL_19:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v39 != v28) {
        objc_enumerationMutation(v25);
      }
      double v30 = *(void **)(*((void *)&v38 + 1) + 8 * v29);
      uint64_t v31 = [v20 sectionForAssetCollection:v30];
      if (v31 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v27) {
          goto LABEL_19;
        }
        goto LABEL_25;
      }
    }
    uint64_t v33 = v31;
    id v9 = v30;

    if (!v9) {
      goto LABEL_37;
    }
    id v8 = v37;
LABEL_30:
    id v34 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v33];
    [v20 forceAccurateSectionsIfNeeded:v34];

    goto LABEL_31;
  }
  id v18 = v17;
LABEL_33:

LABEL_34:
  return v18;
}

- (int64_t)cellFillMode
{
  uint64_t v2 = [(PUPhotosGridViewController *)self gridSpec];
  int64_t v3 = [v2 cellFillMode];

  return v3;
}

- (CGSize)imageRequestItemPixelSize
{
  [(PUPhotosGridViewController *)self imageRequestItemSize];
  double v4 = PUPixelSizeFromPointSize(v3);
  double v6 = v5;
  [(PUPhotosGridViewController *)self maximumThumbnailRequestSize];
  if (*MEMORY[0x1E4F1DB30] == v8 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v7)
  {
    double v10 = v4;
    double v11 = v6;
  }
  else
  {
    PXSizeMin();
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)imageRequestItemSize
{
  uint64_t v2 = [(PUPhotosGridViewController *)self mainGridLayout];
  [v2 itemSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)assetAtIndexPathIfSafe:(id)a3
{
  id v4 = a3;
  if ([v4 section] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  if ([v4 item] == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_6;
  }
  uint64_t v5 = [v4 section];
  double v6 = [(PUPhotosGridViewController *)self photosDataSource];
  uint64_t v7 = [v6 numberOfSections];

  if (v5 >= v7
    || (uint64_t v8 = [v4 item],
        [(PUPhotosGridViewController *)self photosDataSource],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v4, "section")),
        v9,
        v8 >= v10))
  {
LABEL_6:
    uint64_t v12 = 0;
  }
  else
  {
    double v11 = [(PUPhotosGridViewController *)self photosDataSource];
    uint64_t v12 = [v11 assetAtIndexPath:v4];
  }
  return v12;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPhotosGridViewController *)self photosDataSource];
  double v6 = objc_msgSend(v5, "assetCollectionForSection:", objc_msgSend(v4, "section"));

  uint64_t v7 = [(PUPhotosGridViewController *)self assetsInAssetCollection:v6];
  uint64_t v8 = [v4 item];

  id v9 = [v7 objectAtIndex:v8];

  return v9;
}

- (id)assetsInAssetCollection:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [(PUPhotosGridViewController *)self photosDataSource];
    uint64_t v6 = [v5 sectionForAssetCollection:v4];

    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [v5 assetsInSection:v6];
      if (!v7)
      {
        id v8 = objc_alloc(MEMORY[0x1E4F39150]);
        id v9 = [v5 photoLibrary];
        uint64_t v10 = [MEMORY[0x1E4F38EB8] fetchType];
        uint64_t v7 = (void *)[v8 initWithObjects:MEMORY[0x1E4F1CBF0] photoLibrary:v9 fetchType:v10 fetchPropertySets:0 identifier:0 registerIfNeeded:0];
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (BOOL)isCurrentCollectionViewDataSource
{
  if (![(PUPhotosGridViewController *)self isViewLoaded]) {
    return 0;
  }
  double v3 = [(PUPhotosGridViewController *)self collectionView];
  id v4 = [v3 dataSource];
  BOOL v5 = v4 == self;

  return v5;
}

- (void)_updateLayoutReferenceValues
{
  double v3 = [(PUPhotosGridViewController *)self collectionView];
  [v3 bounds];
  double Width = CGRectGetWidth(v19);

  BOOL v5 = [(PUPhotosGridViewController *)self collectionView];
  [v5 safeAreaInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  if (v9 != self->_collectionViewLayoutReferenceSafeAreaInsets.left
    || v7 != self->_collectionViewLayoutReferenceSafeAreaInsets.top
    || v13 != self->_collectionViewLayoutReferenceSafeAreaInsets.right)
  {
    p_collectionViewLayoutReferencedouble Width = &self->_collectionViewLayoutReferenceWidth;
LABEL_13:
    *p_collectionViewLayoutReferencedouble Width = Width;
    self->_collectionViewLayoutReferenceSafeAreaInsets.double top = v7;
    self->_collectionViewLayoutReferenceSafeAreaInsets.double left = v9;
    self->_collectionViewLayoutReferenceSafeAreaInsets.double bottom = v11;
    self->_collectionViewLayoutReferenceSafeAreaInsets.double right = v13;
    [(PUPhotosGridViewController *)self updateLayoutMetrics];
    [(PUPhotosGridViewController *)self updateGlobalFooter];
    [(PUPhotosGridViewController *)self updateVisibleSupplementaryViewsOfKind:@"PUFullMomentsHeader"];
    return;
  }
  p_collectionViewLayoutReferencedouble Width = &self->_collectionViewLayoutReferenceWidth;
  if (Width != self->_collectionViewLayoutReferenceWidth
    || v11 != self->_collectionViewLayoutReferenceSafeAreaInsets.bottom)
  {
    goto LABEL_13;
  }
}

- (id)assetCollectionForSectionHeaderAtIndex:(unint64_t)a3
{
  if (!self->_collectionListFetchResultBeforeChange) {
    goto LABEL_3;
  }
  BOOL v5 = [(PUPhotosGridViewController *)self collectionView];
  uint64_t v6 = [v5 numberOfSections];
  double v7 = [(PUPhotosGridViewController *)self photosDataSource];
  uint64_t v8 = [v7 numberOfSections];

  if (v6 != v8)
  {
    double v9 = [(PHFetchResult *)self->_collectionListFetchResultBeforeChange objectAtIndexedSubscript:a3];
  }
  else
  {
LABEL_3:
    double v9 = [(PXPhotosDataSource *)self->_photosDataSource assetCollectionForSection:a3];
  }
  return v9;
}

- (unint64_t)_indexForPhotoCollection:(id)a3
{
  return [(PXPhotosDataSource *)self->_photosDataSource sectionForAssetCollection:a3];
}

- (id)photoCollectionAtIndex:(unint64_t)a3
{
  return [(PXPhotosDataSource *)self->_photosDataSource assetCollectionForSection:a3];
}

- (PHFetchResult)collectionListFetchResult
{
  return [(PXPhotosDataSource *)self->_photosDataSource collectionListFetchResult];
}

- (void)forceDataSourceIfNeeded
{
  if (![(PUPhotosGridViewController *)self _didForceDataSource] && !self->_pendingNavigationBlock)
  {
    [(PUPhotosGridViewController *)self _setDidForceDataSource:1];
    uint64_t v8 = self->_photosDataSource;
    if ([(PXPhotosDataSource *)v8 options])
    {
      if ([(PUPhotosGridViewController *)self initiallyScrolledToBottom]) {
        uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v3 = 0;
      }
      [(PXPhotosDataSource *)v8 setBackgroundFetchOriginSection:v3];
      uint64_t v4 = [(PXPhotosDataSource *)v8 numberOfSections] - 1;
      if (v3 < v4) {
        uint64_t v4 = v3;
      }
      uint64_t v5 = v4 & ~(v4 >> 63);
      uint64_t v6 = [(PUPhotosGridViewController *)self gridSpec];
      uint64_t v7 = [v6 forceLoadInitialSectionCount];

      [(PXPhotosDataSource *)v8 forceAccurateSection:v5 andSectionsBeforeAndAfter:v7];
      [(PXPhotosDataSource *)v8 startBackgroundFetchIfNeeded];
    }
  }
}

- (void)setPhotosDataSource:(id)a3
{
  uint64_t v5 = (PXPhotosDataSource *)a3;
  photosDataSource = self->_photosDataSource;
  if (photosDataSource != v5)
  {
    uint64_t v8 = v5;
    [(PXPhotosDataSource *)photosDataSource unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_photosDataSource, a3);
    [(PUPhotosGridViewController *)self _setDidForceDataSource:0];
    if ([(PUPhotosGridViewController *)self px_isVisible]) {
      [(PUPhotosGridViewController *)self forceDataSourceIfNeeded];
    }
    [(PXPhotosDataSource *)v8 registerChangeObserver:self];
    uint64_t v7 = [(PUPhotosGridViewController *)self oneUpPresentationHelper];
    [v7 setPhotosDataSource:v8];

    [(PUPhotosGridViewController *)self updateInterfaceForModelReloadAnimated:1];
    uint64_t v5 = v8;
  }
}

- (void)setSessionInfo:(id)a3
{
  uint64_t v5 = (PUSessionInfo *)a3;
  p_sessionInfo = &self->_sessionInfo;
  sessionInfo = self->_sessionInfo;
  if (sessionInfo != v5)
  {
    double v11 = v5;
    [(PUSessionInfo *)sessionInfo removeSessionInfoObserver:self];
    objc_storeStrong((id *)&self->_sessionInfo, a3);
    [(PUSessionInfo *)*p_sessionInfo addSessionInfoObserver:self];
    uint64_t v8 = [(PUSessionInfo *)*p_sessionInfo bannerGenerator];
    double v9 = v8[2]();

    double v10 = [(PUPhotosGridViewController *)self navigationItem];
    objc_msgSend(v10, "pu_setBanner:", v9);

    [(PUPhotosGridViewController *)self _updatePhotoSelectionManager];
    [(PUPhotosGridViewController *)self updateInterfaceForModelReloadAnimated:0];

    uint64_t v5 = v11;
  }
}

- (id)newGridLayout
{
  uint64_t v3 = objc_alloc_init(PUSectionedGridLayout);
  [(PUSectionedGridLayout *)v3 setDelegate:self];
  uint64_t v4 = +[PUPhotosGridSettings sharedInstance];
  uint64_t v5 = [v4 useFloatingHeaders];

  [(PUSectionedGridLayout *)v3 setFloatingSectionHeadersEnabled:v5];
  return v3;
}

- (BOOL)updateSpec
{
  uint64_t v3 = [(PUPhotosGridViewController *)self traitCollection];
  if (![v3 horizontalSizeClass] || !objc_msgSend(v3, "verticalSizeClass")) {
    goto LABEL_14;
  }
  +[PUInterfaceManager shouldUsePhoneLayoutWithTraitCollection:v3];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class()
    || v5 == objc_opt_class())
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
  }
  if (v4 != (objc_class *)v5)
  {
    uint64_t v6 = (PUPhotosGridViewControllerSpec *)objc_alloc_init(v4);
    gridSpec = self->_gridSpec;
    self->_gridSpec = v6;

    BOOL v8 = 1;
  }
  else
  {
LABEL_14:
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_updateTransitionWidthOnAppearance
{
  BOOL v3 = [(PUPhotosGridViewController *)self _transitionWidthHasChanged];
  if (v3)
  {
    [(PUPhotosGridViewController *)self _adjustedTransitionWidth];
    self->_lastTransitiondouble Width = v4;
  }
  return v3;
}

- (BOOL)_transitionWidthHasChanged
{
  [(PUPhotosGridViewController *)self _adjustedTransitionWidth];
  lastTransitiondouble Width = self->_lastTransitionWidth;
  BOOL v5 = v3 != lastTransitionWidth;
  if (lastTransitionWidth <= 0.0) {
    BOOL v5 = 0;
  }
  return v3 > 0.0 && v5;
}

- (double)_adjustedTransitionWidth
{
  double v3 = [(PUPhotosGridViewController *)self collectionView];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;

  BOOL v8 = [(PUPhotosGridViewController *)self collectionView];
  [v8 bounds];
  double v10 = v9 - v5 - v7;

  return v10;
}

- (void)_invalidateCachedViewSizeTransitionContext
{
  [(PUPhotosGridViewController *)self _setCachedViewSizeTransitionContext:0];
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[PUPhotosGridViewController _setCachedViewSizeTransitionContextSize:](self, "_setCachedViewSizeTransitionContextSize:", v3, v4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PUPhotosGridViewController;
  -[PUPhotosGridViewController viewWillTransitionToSize:withTransitionCoordinator:](&v38, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  BOOL v8 = [(PUPhotosGridViewController *)self isCurrentCollectionViewDataSource];
  if (v7) {
    [v7 targetTransform];
  }
  else {
    memset(&t2, 0, sizeof(t2));
  }
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&t1.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&t1.c = v9;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  BOOL v10 = CGAffineTransformEqualToTransform(&t1, &t2);
  double v11 = [(PUPhotosGridViewController *)self mainGridLayout];
  double v12 = v11;
  if (v8)
  {
    double v13 = objc_msgSend(v11, "prepareForViewTransitionToSize:", width, height);
  }
  else
  {
    double v13 = 0;
  }
  if ([v7 isAnimated]
    && ([(PUPhotosGridViewController *)self px_isVisible] & 1) != 0)
  {
    [(PUPhotosGridViewController *)self _setPendingViewSizeTransitionContext:0];
    char v14 = 0;
    goto LABEL_20;
  }
  [(PUPhotosGridViewController *)self _cachedViewSizeTransitionContextSize];
  if (width == v16 && height == v15)
  {
    uint64_t v17 = [(PUPhotosGridViewController *)self _cachedViewSizeTransitionContext];

    int v18 = 1;
    double v13 = (void *)v17;
  }
  else
  {
    CGRect v19 = [MEMORY[0x1E4FB1438] sharedApplication];
    int v20 = [v19 isSuspended];

    if (v20)
    {
      uint64_t v21 = [(PUPhotosGridViewController *)self _cachedViewSizeTransitionContext];

      if (!v21)
      {
        id v22 = [(PUPhotosGridViewController *)self view];
        [v22 bounds];
        double v24 = v23;
        double v26 = v25;

        [(PUPhotosGridViewController *)self _setCachedViewSizeTransitionContext:v13];
        -[PUPhotosGridViewController _setCachedViewSizeTransitionContextSize:](self, "_setCachedViewSizeTransitionContextSize:", v24, v26);
      }
      int v18 = 0;
    }
    else
    {
      int v18 = 1;
    }
  }
  uint64_t v27 = [(PUPhotosGridViewController *)self _pendingViewSizeTransitionContext];

  if (v27)
  {
    char v14 = 1;
    if (!v18) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  [(PUPhotosGridViewController *)self _setPendingViewSizeTransitionContext:v13];
  char v14 = 1;
  if (v18) {
LABEL_20:
  }
    [(PUPhotosGridViewController *)self _invalidateCachedViewSizeTransitionContext];
LABEL_21:
  if (v10)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v35[3] = &unk_1E5F2B9D0;
    void v35[4] = self;
    [v7 animateAlongsideTransition:0 completion:v35];
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v33[3] = &unk_1E5F2A598;
  v33[4] = self;
  BOOL v34 = v8;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v29[3] = &unk_1E5F2A5C0;
  BOOL v31 = v8;
  char v32 = v14;
  void v29[4] = self;
  id v30 = v12;
  id v28 = v12;
  [v7 animateAlongsideTransition:v33 completion:v29];
}

void __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) _shareAssetsPopoverController];
  uint64_t v2 = [v7 presentedViewController];
  [v2 dismissViewControllerAnimated:0 completion:0];

  [v7 setDelegate:0];
  [*(id *)(a1 + 32) _setShareAssetsPopoverController:0];
  uint64_t v3 = [*(id *)(a1 + 32) _actionConfirmationAlert];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [*(id *)(a1 + 32) presentedViewController];
    double v6 = [*(id *)(a1 + 32) _actionConfirmationAlert];

    if (v5 == v6)
    {
      [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
      [*(id *)(a1 + 32) _setActionConfirmationAlert:0];
    }
  }
}

uint64_t __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "px_isVisible");
  if (result && *(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) updateNavigationBarAnimated:1];
    [*(id *)(a1 + 32) _updateGlobalHeaderVisibility];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 updateGlobalFooter];
  }
  return result;
}

void __81__PUPhotosGridViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (*(unsigned char *)(a1 + 48) && [*(id *)(a1 + 32) isCurrentCollectionViewDataSource])
  {
    if (*(unsigned char *)(a1 + 49)) {
      [*(id *)(a1 + 32) _updateContentOffsetForPendingViewSizeTransition];
    }
    [*(id *)(a1 + 40) finalizeViewTransitionToSize];
  }
  if (objc_msgSend(*(id *)(a1 + 32), "px_isVisible"))
  {
    objc_msgSend(*(id *)(a1 + 32), "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 0, 0);
    [*(id *)(a1 + 32) updatePeripheralInterfaceAnimated:0];
  }
  [*(id *)(a1 + 32) _adjustedTransitionWidth];
  *(void *)(*(void *)(a1 + 32) + 1032) = v3;
}

- (PUPhotosGridViewControllerSpec)gridSpec
{
  gridSpec = self->_gridSpec;
  if (!gridSpec)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUPhotosGridViewController.m" lineNumber:430 description:@"missing spec"];

    gridSpec = self->_gridSpec;
  }
  return gridSpec;
}

- (void)dealloc
{
  [(PXPhotosDataSource *)self->_photosDataSource unregisterChangeObserver:self];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F8AD20] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  [(PUSessionInfo *)self->_sessionInfo removeSessionInfoObserver:self];
  double v5 = [(PUPhotosGridViewController *)self _shareAssetsPopoverController];
  [v5 setDelegate:0];

  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:0];
  [(PUPhotoPinchGestureRecognizer *)self->_photoOrStackPinchGestureRecognizer setDelegate:0];
  double v6 = [(PUPhotosGridViewController *)self _collectionViewSpeedometer];
  [v6 setDelegate:0];

  v7.receiver = self;
  v7.super_class = (Class)PUPhotosGridViewController;
  [(PUPhotosGridViewController *)&v7 dealloc];
}

- (PUPhotosGridViewController)initWithCollectionViewLayout:(id)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 409, @"Do not use this initializer, use the designated one instead" object file lineNumber description];

  return 0;
}

- (PUPhotosGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 404, @"Do not use this initializer, use the designated one instead" object file lineNumber description];

  return 0;
}

- (PUPhotosGridViewController)initWithSpec:(id)a3 photoLibrary:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    double v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 369, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  double v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PUPhotosGridViewController.m", 370, @"Invalid parameter not satisfying: %@", @"spec" object file lineNumber description];

LABEL_3:
  objc_storeStrong((id *)&self->_photoLibrary, a4);
  objc_storeStrong((id *)&self->_gridSpec, a3);
  id v10 = [(PUPhotosGridViewController *)self newGridLayout];
  v26.receiver = self;
  v26.super_class = (Class)PUPhotosGridViewController;
  double v11 = [(PUPhotosGridViewController *)&v26 initWithCollectionViewLayout:v10];
  if (v11)
  {
    double v12 = objc_alloc_init(PUPhotosGridBarsHelper);
    barsHelper = v11->__barsHelper;
    v11->__barsHelper = v12;

    [(PUPhotosGridBarsHelper *)v11->__barsHelper setDelegate:v11];
    char v14 = [(PUPhotosGridViewController *)v11 navigationItem];
    objc_msgSend(v14, "px_setPreferredLargeTitleDisplayMode:", 2);

    [(PUPhotosGridViewController *)v11 setMainGridLayout:v10];
    [(PUPhotosGridViewController *)v11 setAllowedActions:127];
    double v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = *MEMORY[0x1E4FB2CB0];
    uint64_t v17 = [MEMORY[0x1E4FB1978] sharedMenuController];
    [v15 addObserver:v11 selector:sel__menuControllerDidHideMenu_ name:v16 object:v17];

    int v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v11 selector:sel__contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    uint64_t v19 = objc_opt_new();
    cachingImageManager = v11->__cachingImageManager;
    v11->__cachingImageManager = (PHCachingImageManager *)v19;

    uint64_t v21 = (PXAssetBadgeManager *)objc_alloc_init(MEMORY[0x1E4F8FFC8]);
    badgeManager = v11->__badgeManager;
    v11->__badgeManager = v21;
  }
  return v11;
}

+ (void)transferPhotoBrowserFromGridViewController:(id)a3 toGridViewController:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  double v6 = [v9 _pushedPhotoBrowserController];
  if (v6)
  {
    [v5 _setPushedPhotoBrowserController:v6];
    [v9 _setPushedPhotoBrowserController:0];
    objc_super v7 = [v9 _photoBrowserOneUpPresentationAdaptor];
    [v5 _setPhotoBrowserOneUpPresentationAdaptor:v7];
    [v7 setZoomTransitionDelegate:v5];
    [v9 _setPhotoBrowserOneUpPresentationAdaptor:0];
    id v8 = [v9 oneUpPresentationHelper];
    [v5 _setOneUpPresentationHelper:v8];
    [v8 setDelegate:v5];
    [v9 _setOneUpPresentationHelper:0];
  }
}

+ (id)_localizedSelectionTitleWithPhotoSelectionManager:(id)a3
{
  id v3 = a3;
  if ([v3 isAnyAssetSelected]) {
    [v3 localizedSelectionString];
  }
  else {
  id v4 = PLLocalizedFrameworkString();
  }

  return v4;
}

@end