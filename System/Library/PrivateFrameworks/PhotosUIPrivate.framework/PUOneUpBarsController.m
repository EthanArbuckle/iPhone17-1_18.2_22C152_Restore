@interface PUOneUpBarsController
- (BOOL)_canShowCommentsForCurrentAsset;
- (BOOL)_lastChromeVisibility;
- (BOOL)_needsUpdateChromeVisibility;
- (BOOL)_needsUpdateCommentsTitle;
- (BOOL)_needsUpdateFileSizeButtonMenu;
- (BOOL)_needsUpdateFileSizeButtonTitle;
- (BOOL)_needsUpdatePlayPauseItems;
- (BOOL)_needsUpdateTitle;
- (BOOL)_physicalDeviceIsIPad;
- (BOOL)_shouldShowDoneEditingButton;
- (BOOL)_wantsChromeVisible;
- (BOOL)allowShowingPlayPauseButton;
- (BOOL)allowTapOnTitle;
- (BOOL)disableChromeHiding;
- (BOOL)disableShowingNavigationBars;
- (BOOL)isInCompactLayoutStyle;
- (BOOL)isShowingPlayPauseButton;
- (BOOL)prefersStatusBarHidden;
- (BOOL)scrubberView:(id)a3 shouldIgnoreHitTest:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)shouldBeginEditingAfterShowingComments;
- (BOOL)shouldPlaceButtonsInNavigationBar;
- (BOOL)shouldPlaceScrubberInScrubberBar;
- (BOOL)shouldShowAirPlayButton;
- (BOOL)shouldShowMuteButton;
- (BOOL)shouldShowProgrammaticNavBackButton;
- (BOOL)shouldShowScrubber;
- (BOOL)shouldShowTitleView;
- (BOOL)shouldTapBeginAtLocationFromProvider:(id)a3;
- (BOOL)shouldUseCompactCommentsTitle;
- (BOOL)shouldUseCompactTitleView;
- (BOOL)wantsAllPhotosButton;
- (BOOL)wantsNavigationBarVisible;
- (BOOL)wantsShowInLibraryButton;
- (BOOL)wantsToolbarVisible;
- (CGRect)oneUpActionsControllerPopoverSourceRectIn:(id)a3 actionType:(unint64_t)a4;
- (NSMutableIndexSet)_centerNavBarButtonIdentifiers;
- (NSMutableIndexSet)_leftNavBarButtonIdentifiers;
- (NSMutableIndexSet)_rightNavBarButtonIdentifiers;
- (NSMutableIndexSet)_toolbarButtonIdentifiers;
- (NSString)_scrubbingIdentifier;
- (NSString)_title;
- (NSString)presentedTipID;
- (NSString)subtitle;
- (NSString)title;
- (OS_dispatch_queue)infoRequestSerialQueue;
- (PUBarButtonItemCollection)_centerNavBarButtonItemCollection;
- (PUBarButtonItemCollection)_leftNavBarButtonItemCollection;
- (PUBarButtonItemCollection)_rightNavBarButtonItemCollection;
- (PUBarButtonItemCollection)_toolbarButtonItemCollection;
- (PUBrowsingSession)browsingSession;
- (PUOneUpActionsController)actionsController;
- (PUOneUpBarsController)init;
- (PUOneUpBarsController)initWithStyle:(int64_t)a3 browsingSession:(id)a4 viewController:(id)a5 actionsController:(id)a6 delegate:(id)a7;
- (PUOneUpBarsController)initWithViewController:(id)a3 delegate:(id)a4;
- (PUOneUpBarsControllerDelegate)delegate;
- (PUOneUpDetailsBarButtonController)detailsBarButtonController;
- (PUPhotoBrowserTitleViewController)_titleViewController;
- (PUPlayPauseBarItemsController)_playPauseBarItemsController;
- (PUScrubberView)_scrubberView;
- (PXImageModulationManager)debuggingObservedImageModulationManager;
- (PXInfoUpdater)_currentAssetDisplayInfoUpdater;
- (UIBarButtonItem)barButtonItemActionsMenu;
- (UIBarButtonItem)barButtonItemToggleDetails;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (double)maximumAccessoryToolbarHeight;
- (double)maximumToolbarHeight;
- (id)_actionsMenu;
- (id)_actionsMenuElements;
- (id)_activeBarButtonItemForIdentifier:(int64_t)a3;
- (id)_airPlayBarButtonItemForPopoverPresentation;
- (id)_attributedCommentTitleForTitle:(id)a3 highlighted:(BOOL)a4;
- (id)_barButtonIdentifiersForLocation:(int64_t)a3;
- (id)_barButtonItemCollectionForLocation:(int64_t)a3;
- (id)_barButtonItemForActionType:(unint64_t)a3;
- (id)_barButtonItemForIdentifier:(int64_t)a3;
- (id)_barButtonItemForIdentifier:(int64_t)a3 location:(int64_t)a4;
- (id)_commentTitleAttributes;
- (id)_commentTitleColor;
- (id)_commentsButtonWithTitle:(id)a3;
- (id)_createMultiLineButtonWithTitle:(id)a3;
- (id)_documentMenuActions;
- (id)_localizedTitleForMergeDuplicatesBarButtonItem;
- (id)_newBarButtonItemWithIdentifier:(int64_t)a3 location:(int64_t)a4;
- (id)_textColorForTitleViewController:(BOOL)a3;
- (id)barButtonItemCollection:(id)a3 newBarButtonItemForIdentifier:(int64_t)a4;
- (id)currentAssetByAssetCollection;
- (id)oneUpActionsControllerPopoverSourceItemWithActionType:(unint64_t)a3;
- (id)oneUpActionsControllerPopoverSourceViewWithActionType:(unint64_t)a3;
- (id)overOneUpPresentationSession:(id)a3 barButtonItemForActivityType:(id)a4;
- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4;
- (id)sourceItemForActionType:(id)a3;
- (int64_t)_identifierForButton:(id)a3;
- (int64_t)_locationForBarButtonItemCollection:(id)a3;
- (int64_t)_locationForBarButtonItemWithIdentifier:(int64_t)a3;
- (int64_t)_nextChromeVisibilityUpdateAnimationType;
- (int64_t)_scrubberType;
- (int64_t)preferredBarStyle;
- (int64_t)style;
- (void)_barButtonTappedWithIdentifier:(int64_t)a3;
- (void)_browsingViewModel:(id)a3 didChange:(id)a4;
- (void)_handleCreativeControlsButton:(id)a3;
- (void)_handleFavoriteButton:(id)a3;
- (void)_handleInfoButton:(id)a3;
- (void)_handleTapGestureRecognizer:(id)a3;
- (void)_handleTrashButton:(id)a3;
- (void)_initializeBarButtonItemCollections;
- (void)_invalidateChromeVisibilityWithAnimationType:(int64_t)a3;
- (void)_invalidateCommentsTitle;
- (void)_invalidateFileSizeButtonMenu;
- (void)_invalidateFileSizeButtonTitle;
- (void)_invalidateScrubber;
- (void)_invalidateTitle;
- (void)_performPXActionType:(id)a3;
- (void)_performPXActionType:(id)a3 withCompletionHandler:(id)a4;
- (void)_performPlayPauseAction:(int64_t)a3;
- (void)_resetIdentifierIndexes;
- (void)_revealGainMapImage;
- (void)_setCenterNavBarButtonIdentifiers:(id)a3;
- (void)_setCenterNavBarButtonItemCollection:(id)a3;
- (void)_setLastChromeVisibility:(BOOL)a3;
- (void)_setLeftNavBarButtonIdentifiers:(id)a3;
- (void)_setLeftNavBarButtonItemCollection:(id)a3;
- (void)_setNeedsUpdateChromeVisibility:(BOOL)a3;
- (void)_setNeedsUpdateCommentsTitle:(BOOL)a3;
- (void)_setNeedsUpdateFileSizeButtonMenu:(BOOL)a3;
- (void)_setNeedsUpdateFileSizeButtonTitle:(BOOL)a3;
- (void)_setNeedsUpdatePlayPauseItems:(BOOL)a3;
- (void)_setNeedsUpdateTitle:(BOOL)a3;
- (void)_setNextChromeVisibilityUpdateAnimationType:(int64_t)a3;
- (void)_setRightNavBarButtonIdentifiers:(id)a3;
- (void)_setRightNavBarButtonItemCollection:(id)a3;
- (void)_setShowingPlayPauseButton:(BOOL)a3;
- (void)_setTapGestureRecognizer:(id)a3;
- (void)_setTitle:(id)a3;
- (void)_setToolbarButtonIdentifiers:(id)a3;
- (void)_setToolbarButtonItemCollection:(id)a3;
- (void)_showActionsMenu;
- (void)_startObservingOrientationChanges;
- (void)_stopObservingOrientationChanges;
- (void)_toolbarViewModel:(id)a3 didChange:(id)a4;
- (void)_updateActionsBarButtonItem;
- (void)_updateAddToLibraryBarButtonItem;
- (void)_updateChromeVisibilityIfNeeded;
- (void)_updateCommentsButton:(id)a3 withTitle:(id)a4;
- (void)_updateCommentsTitleIfNeeded;
- (void)_updateFavoriteBarButtonItem;
- (void)_updateFileSizeButtonMenuIfNeeded;
- (void)_updateFileSizeButtonTitleIfNeeded;
- (void)_updateIdentifiersIndexesWithIdentifier:(int64_t)a3 location:(int64_t)a4 shouldEnable:(BOOL)a5;
- (void)_updateScrubberViewIfNeeded;
- (void)_updateShowingPlayPauseButton;
- (void)_updateSyndicationSaveBarButtonItem;
- (void)_updateTitleIfNeeded;
- (void)_updateWantsAllPhotosButton;
- (void)barButtonItemTapped:(id)a3;
- (void)dealloc;
- (void)infoUpdaterDidUpdate:(id)a3;
- (void)invalidateViewControllerView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)overOneUpPresentationSession:(id)a3 didAppendReviewScreenAction:(unint64_t)a4;
- (void)photoBrowserTitleViewControllerTapped:(id)a3;
- (void)playPauseBarItemsController:(id)a3 didChange:(id)a4;
- (void)ppt_performAction:(unint64_t)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAllowShowingPlayPauseButton:(BOOL)a3;
- (void)setAllowTapOnTitle:(BOOL)a3;
- (void)setDebuggingObservedImageModulationManager:(id)a3;
- (void)setDetailsBarButtonController:(id)a3;
- (void)setDisableChromeHiding:(BOOL)a3;
- (void)setDisableShowingNavigationBars:(BOOL)a3;
- (void)setIsInCompactLayoutStyle:(BOOL)a3;
- (void)setMaximumAccessoryToolbarHeight:(double)a3;
- (void)setMaximumToolbarHeight:(double)a3;
- (void)setPresentedTipID:(id)a3;
- (void)setShouldBeginEditingAfterShowingComments:(BOOL)a3;
- (void)setShouldPlaceButtonsInNavigationBar:(BOOL)a3;
- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3;
- (void)setShouldShowAirPlayButton:(BOOL)a3;
- (void)setShouldShowMuteButton:(BOOL)a3;
- (void)setShouldShowProgrammaticNavBackButton:(BOOL)a3;
- (void)setShouldShowScrubber:(BOOL)a3;
- (void)setShouldShowTitleView:(BOOL)a3;
- (void)setShouldUseCompactCommentsTitle:(BOOL)a3;
- (void)setShouldUseCompactTitleView:(BOOL)a3;
- (void)setWantsAllPhotosButton:(BOOL)a3;
- (void)setWantsShowInLibraryButton:(BOOL)a3;
- (void)updateBars;
- (void)updateContentGuideInsets;
- (void)updateGestureRecognizersWithHostingView:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUOneUpBarsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsBarButtonController, 0);
  objc_storeStrong((id *)&self->_infoRequestSerialQueue, 0);
  objc_storeStrong((id *)&self->_debuggingObservedImageModulationManager, 0);
  objc_storeStrong((id *)&self->__leftNavBarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->__leftNavBarButtonItemCollection, 0);
  objc_storeStrong((id *)&self->__centerNavBarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->__centerNavBarButtonItemCollection, 0);
  objc_storeStrong((id *)&self->__rightNavBarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->__rightNavBarButtonItemCollection, 0);
  objc_storeStrong((id *)&self->__toolbarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->__toolbarButtonItemCollection, 0);
  objc_storeStrong((id *)&self->__playPauseBarItemsController, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__currentAssetDisplayInfoUpdater, 0);
  objc_storeStrong((id *)&self->__titleViewController, 0);
  objc_storeStrong((id *)&self->__title, 0);
  objc_storeStrong((id *)&self->__scrubberView, 0);
  objc_storeStrong((id *)&self->__scrubbingIdentifier, 0);
  objc_storeStrong((id *)&self->_presentedTipID, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
}

- (void)setDetailsBarButtonController:(id)a3
{
}

- (PUOneUpDetailsBarButtonController)detailsBarButtonController
{
  return self->_detailsBarButtonController;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)wantsAllPhotosButton
{
  return self->_wantsAllPhotosButton;
}

- (OS_dispatch_queue)infoRequestSerialQueue
{
  return self->_infoRequestSerialQueue;
}

- (PXImageModulationManager)debuggingObservedImageModulationManager
{
  return self->_debuggingObservedImageModulationManager;
}

- (void)_setLeftNavBarButtonIdentifiers:(id)a3
{
}

- (NSMutableIndexSet)_leftNavBarButtonIdentifiers
{
  return self->__leftNavBarButtonIdentifiers;
}

- (void)_setLeftNavBarButtonItemCollection:(id)a3
{
}

- (PUBarButtonItemCollection)_leftNavBarButtonItemCollection
{
  return self->__leftNavBarButtonItemCollection;
}

- (void)_setCenterNavBarButtonIdentifiers:(id)a3
{
}

- (NSMutableIndexSet)_centerNavBarButtonIdentifiers
{
  return self->__centerNavBarButtonIdentifiers;
}

- (void)_setCenterNavBarButtonItemCollection:(id)a3
{
}

- (PUBarButtonItemCollection)_centerNavBarButtonItemCollection
{
  return self->__centerNavBarButtonItemCollection;
}

- (void)_setRightNavBarButtonIdentifiers:(id)a3
{
}

- (NSMutableIndexSet)_rightNavBarButtonIdentifiers
{
  return self->__rightNavBarButtonIdentifiers;
}

- (void)_setRightNavBarButtonItemCollection:(id)a3
{
}

- (PUBarButtonItemCollection)_rightNavBarButtonItemCollection
{
  return self->__rightNavBarButtonItemCollection;
}

- (void)_setToolbarButtonIdentifiers:(id)a3
{
}

- (NSMutableIndexSet)_toolbarButtonIdentifiers
{
  return self->__toolbarButtonIdentifiers;
}

- (void)_setToolbarButtonItemCollection:(id)a3
{
}

- (PUBarButtonItemCollection)_toolbarButtonItemCollection
{
  return self->__toolbarButtonItemCollection;
}

- (PUPlayPauseBarItemsController)_playPauseBarItemsController
{
  return self->__playPauseBarItemsController;
}

- (void)_setNeedsUpdatePlayPauseItems:(BOOL)a3
{
  self->__needsUpdatePlayPauseItems = a3;
}

- (BOOL)_needsUpdatePlayPauseItems
{
  return self->__needsUpdatePlayPauseItems;
}

- (void)_setLastChromeVisibility:(BOOL)a3
{
  self->__lastChromeVisibility = a3;
}

- (BOOL)_lastChromeVisibility
{
  return self->__lastChromeVisibility;
}

- (void)_setNextChromeVisibilityUpdateAnimationType:(int64_t)a3
{
  self->__nextChromeVisibilityUpdateAnimationType = a3;
}

- (int64_t)_nextChromeVisibilityUpdateAnimationType
{
  return self->__nextChromeVisibilityUpdateAnimationType;
}

- (void)_setNeedsUpdateChromeVisibility:(BOOL)a3
{
  self->__needsUpdateChromeVisibility = a3;
}

- (BOOL)_needsUpdateChromeVisibility
{
  return self->__needsUpdateChromeVisibility;
}

- (void)_setTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (PXInfoUpdater)_currentAssetDisplayInfoUpdater
{
  return self->__currentAssetDisplayInfoUpdater;
}

- (void)_setNeedsUpdateFileSizeButtonMenu:(BOOL)a3
{
  self->__needsUpdateFileSizeButtonMenu = a3;
}

- (BOOL)_needsUpdateFileSizeButtonMenu
{
  return self->__needsUpdateFileSizeButtonMenu;
}

- (void)_setNeedsUpdateFileSizeButtonTitle:(BOOL)a3
{
  self->__needsUpdateFileSizeButtonTitle = a3;
}

- (BOOL)_needsUpdateFileSizeButtonTitle
{
  return self->__needsUpdateFileSizeButtonTitle;
}

- (void)setShouldBeginEditingAfterShowingComments:(BOOL)a3
{
  self->_shouldBeginEditingAfterShowingComments = a3;
}

- (BOOL)shouldBeginEditingAfterShowingComments
{
  return self->_shouldBeginEditingAfterShowingComments;
}

- (void)_setNeedsUpdateCommentsTitle:(BOOL)a3
{
  self->__needsUpdateCommentsTitle = a3;
}

- (BOOL)_needsUpdateCommentsTitle
{
  return self->__needsUpdateCommentsTitle;
}

- (PUPhotoBrowserTitleViewController)_titleViewController
{
  return self->__titleViewController;
}

- (void)_setTitle:(id)a3
{
}

- (NSString)_title
{
  return self->__title;
}

- (void)_setNeedsUpdateTitle:(BOOL)a3
{
  self->__needsUpdateTitle = a3;
}

- (BOOL)_needsUpdateTitle
{
  return self->__needsUpdateTitle;
}

- (PUScrubberView)_scrubberView
{
  return self->__scrubberView;
}

- (NSString)_scrubbingIdentifier
{
  return self->__scrubbingIdentifier;
}

- (BOOL)isShowingPlayPauseButton
{
  return self->_isShowingPlayPauseButton;
}

- (NSString)presentedTipID
{
  return self->_presentedTipID;
}

- (void)setDisableChromeHiding:(BOOL)a3
{
  self->_disableChromeHiding = a3;
}

- (BOOL)disableChromeHiding
{
  return self->_disableChromeHiding;
}

- (BOOL)shouldPlaceScrubberInScrubberBar
{
  return self->_shouldPlaceScrubberInScrubberBar;
}

- (BOOL)disableShowingNavigationBars
{
  return self->_disableShowingNavigationBars;
}

- (BOOL)shouldShowMuteButton
{
  return self->_shouldShowMuteButton;
}

- (BOOL)allowShowingPlayPauseButton
{
  return self->_allowShowingPlayPauseButton;
}

- (BOOL)allowTapOnTitle
{
  return self->_allowTapOnTitle;
}

- (void)setShouldShowTitleView:(BOOL)a3
{
  self->_shouldShowTitleView = a3;
}

- (BOOL)shouldShowTitleView
{
  return self->_shouldShowTitleView;
}

- (BOOL)shouldShowScrubber
{
  return self->_shouldShowScrubber;
}

- (BOOL)wantsShowInLibraryButton
{
  return self->_wantsShowInLibraryButton;
}

- (BOOL)shouldShowAirPlayButton
{
  return self->_shouldShowAirPlayButton;
}

- (BOOL)shouldShowProgrammaticNavBackButton
{
  return self->_shouldShowProgrammaticNavBackButton;
}

- (double)maximumAccessoryToolbarHeight
{
  return self->_maximumAccessoryToolbarHeight;
}

- (double)maximumToolbarHeight
{
  return self->_maximumToolbarHeight;
}

- (BOOL)shouldUseCompactCommentsTitle
{
  return self->_shouldUseCompactCommentsTitle;
}

- (BOOL)shouldUseCompactTitleView
{
  return self->_shouldUseCompactTitleView;
}

- (void)setIsInCompactLayoutStyle:(BOOL)a3
{
  self->_isInCompactLayoutStyle = a3;
}

- (BOOL)isInCompactLayoutStyle
{
  return self->_isInCompactLayoutStyle;
}

- (BOOL)shouldPlaceButtonsInNavigationBar
{
  return self->_shouldPlaceButtonsInNavigationBar;
}

- (PUOneUpActionsController)actionsController
{
  return self->_actionsController;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PUDebuggingObservedImageModulationManagerObservationContext == a5)
  {
    id v11 = v9;
    [(PUOneUpBarsController *)self _invalidateTitle];
    goto LABEL_10;
  }
  if ((void *)PUPhotoPickerResizeTaskDescriptorViewModelObservationContext == a5)
  {
    id v11 = v9;
    [(PUOneUpBarsController *)self _invalidateFileSizeButtonTitle];
    id v9 = v11;
    if ((v6 & 4) == 0) {
      goto LABEL_11;
    }
    [(PUOneUpBarsController *)self _invalidateFileSizeButtonMenu];
    goto LABEL_10;
  }
  if ((void *)PhotosUICoreSelectionManagerObservationContext != a5 && (void *)VideoMuteControllerContext_45939 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:3255 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PUBarsController *)self invalidateBars];
LABEL_10:
    id v9 = v11;
  }
LABEL_11:
}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  if (![v7 isEqualToString:@"PUCurrentAssetDisplayInfo"])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:3223 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v10 = [(PUOneUpBarsController *)self browsingSession];
  id v11 = [v10 viewModel];

  v12 = [v11 currentAssetReference];
  BOOL v13 = [(PUOneUpBarsController *)self _canShowCommentsForCurrentAsset];
  v14 = [(PUOneUpBarsController *)self infoRequestSerialQueue];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__PUOneUpBarsController_requestInfoOfKind_withResultHandler___block_invoke;
  v20[3] = &unk_1E5F29330;
  id v15 = v9;
  BOOL v24 = v13;
  id v21 = v15;
  id v22 = v12;
  id v23 = v8;
  id v16 = v8;
  id v17 = v12;
  dispatch_async(v14, v20);

  return v15;
}

void __61__PUOneUpBarsController_requestInfoOfKind_withResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1B3E7C430]();
    v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
    v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    if (*(unsigned char *)(a1 + 56))
    {
      v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    }
    else
    {
      v5 = 0;
    }
    char v6 = [*(id *)(a1 + 40) asset];
    id v7 = [v6 localCreationDate];
    if (v7) {
      [v4 setObject:v7 forKeyedSubscript:@"PUTitleInfoCreationDateKey"];
    }
    id v8 = [v6 localizedGeoDescription];
    if (v8) {
      [v4 setObject:v8 forKeyedSubscript:@"PUTitleInfoGeoDescriptionKey"];
    }
    if (*(unsigned char *)(a1 + 56))
    {
      id v23 = v4;
      BOOL v24 = v2;
      unint64_t v9 = +[PUOneUpCommentsInfoProvider likeCountForDisplayAsset:v6];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v10 = [v6 uuid];
        *(_DWORD *)buf = 138543618;
        v26 = v10;
        __int16 v27 = 2048;
        unint64_t v28 = v9;
        _os_log_impl(&dword_1AE9F8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[79401480]: Like count for asset (%{public}@) BEFORE reload = %lu", buf, 0x16u);
      }
      id v11 = [*(id *)(a1 + 40) asset];
      v12 = [v11 photoLibrary];
      BOOL v13 = [v12 fetchUpdatedObject:v11];

      [v13 fetchPropertySetsIfNeeded];
      id v14 = v13;

      unint64_t v15 = +[PUOneUpCommentsInfoProvider likeCountForDisplayAsset:v14];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        id v16 = [v14 uuid];
        *(_DWORD *)buf = 138543618;
        v26 = v16;
        __int16 v27 = 2048;
        unint64_t v28 = v15;
        _os_log_impl(&dword_1AE9F8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[79401480]: Like count for asset (%{public}@) AFTER reload = %lu", buf, 0x16u);
      }
      if (v9 != v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        id v22 = [v14 uuid];
        *(_DWORD *)buf = 138543362;
        v26 = v22;
        _os_log_error_impl(&dword_1AE9F8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "[79401480]: *** Like count for asset (%{public}@) is different before and after asset reload ***", buf, 0xCu);
      }
      id v17 = [NSNumber numberWithUnsignedInteger:v15];
      [v5 setObject:v17 forKeyedSubscript:@"PUCommentsInfoLikeCountKey"];

      BOOL v18 = +[PUOneUpCommentsInfoProvider hasUserLikedDisplayAsset:v14];
      v19 = [NSNumber numberWithBool:v18];
      [v5 setObject:v19 forKeyedSubscript:@"PUCommentsInfoHasLikedKey"];

      unint64_t v20 = +[PUOneUpCommentsInfoProvider commentCountForDisplayAsset:v14];
      id v21 = [NSNumber numberWithUnsignedInteger:v20];
      [v5 setObject:v21 forKeyedSubscript:@"PUCommentsInfoCommentCountKey"];

      v2 = v24;
      v4 = v23;
    }
    else
    {
      id v14 = v6;
    }
    [v3 setObject:v4 forKeyedSubscript:@"PUTitleInfoDictionaryKey"];
    if (v5) {
      [v3 setObject:v5 forKeyedSubscript:@"PUCommentsInfoDictionaryKey"];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v7 = a3;
  id v5 = [(PUOneUpBarsController *)self _currentAssetDisplayInfoUpdater];

  if (v5 != v7)
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:3159 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PUOneUpBarsController *)self _invalidateTitle];
  [(PUOneUpBarsController *)self _invalidateCommentsTitle];
}

- (void)photoBrowserTitleViewControllerTapped:(id)a3
{
  if (self->_delegateFlags.respondsToDidTapTitle)
  {
    id v4 = [(PUOneUpBarsController *)self delegate];
    [v4 oneUpBarsControllerDidTapTitle:self];
  }
}

- (BOOL)scrubberView:(id)a3 shouldIgnoreHitTest:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(PUBarsController *)self viewController];
  v12 = [(id)v11 view];

  objc_msgSend(v12, "convertPoint:fromView:", v10, x, y);
  double v14 = v13;
  double v16 = v15;
  LOBYTE(v11) = [v10 isDescendantOfView:v12];

  if (v11)
  {
    char isKindOfClass = 0;
  }
  else
  {
    BOOL v18 = objc_msgSend(v12, "hitTest:withEvent:", v9, v14, v16);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  return isKindOfClass & 1;
}

- (void)ppt_performAction:(unint64_t)a3
{
  if (a3 == 32)
  {
    id v3 = [(PUOneUpBarsController *)self actionsController];
    [v3 performShareAction];
  }
  else
  {
    if (a3 != 15) {
      return;
    }
    id v3 = [(PUOneUpBarsController *)self actionsController];
    [v3 performSimpleActionWithActionType:15];
  }
}

- (void)overOneUpPresentationSession:(id)a3 didAppendReviewScreenAction:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v10 = v6;
    id v7 = [(PUOneUpBarsController *)self actionsController];
    id v8 = v7;
    uint64_t v9 = 47;
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v10 = v6;
    id v7 = [(PUOneUpBarsController *)self actionsController];
    id v8 = v7;
    uint64_t v9 = 48;
  }
  [v7 performSimpleActionWithActionType:v9];

  id v6 = v10;
LABEL_6:
}

- (id)overOneUpPresentationSession:(id)a3 barButtonItemForActivityType:(id)a4
{
  if ([a4 isEqual:*MEMORY[0x1E4F90948]])
  {
    id v5 = [(PUOneUpBarsController *)self _airPlayBarButtonItemForPopoverPresentation];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)playPauseBarItemsController:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "playPauseStateDidChange", a3))
  {
    [(PUBarsController *)self invalidateBars];
    [(PUOneUpBarsController *)self _updateShowingPlayPauseButton];
  }
}

- (int64_t)_identifierForButton:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [&unk_1F078AF28 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7) {
    goto LABEL_15;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v17;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(&unk_1F078AF28);
      }
      uint64_t v11 = -[PUOneUpBarsController _barButtonItemCollectionForLocation:](self, "_barButtonItemCollectionForLocation:", [*(id *)(*((void *)&v16 + 1) + 8 * v10) integerValue]);
      v12 = v11;
      if (isKindOfClass)
      {
        uint64_t v13 = [v11 identifierForBarButtonItem:v4];
      }
      else
      {
        if ((v6 & 1) == 0)
        {

          goto LABEL_13;
        }
        uint64_t v13 = [v11 identifierForCustomButton:v4];
      }
      int64_t v14 = v13;

      if (v14) {
        goto LABEL_16;
      }
LABEL_13:
      ++v10;
    }
    while (v8 != v10);
    uint64_t v8 = [&unk_1F078AF28 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v8);
LABEL_15:
  int64_t v14 = 0;
LABEL_16:

  return v14;
}

- (UIBarButtonItem)barButtonItemActionsMenu
{
  return (UIBarButtonItem *)[(PUOneUpBarsController *)self _barButtonItemForIdentifier:50];
}

- (UIBarButtonItem)barButtonItemToggleDetails
{
  return (UIBarButtonItem *)[(PUOneUpBarsController *)self _barButtonItemForIdentifier:38];
}

- (id)_barButtonItemForIdentifier:(int64_t)a3
{
  int64_t v5 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:");
  char v6 = [(PUOneUpBarsController *)self _barButtonItemCollectionForLocation:v5];
  uint64_t v7 = [(PUOneUpBarsController *)self _barButtonIdentifiersForLocation:v5];
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (v6 && v7)
  {
    if ([v7 containsIndex:a3])
    {
      uint64_t v9 = [v6 barButtonItemForIdentifier:a3];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (id)_activeBarButtonItemForIdentifier:(int64_t)a3
{
  int64_t v5 = -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:");
  return [(PUOneUpBarsController *)self _barButtonItemForIdentifier:a3 location:v5];
}

- (id)_barButtonItemForIdentifier:(int64_t)a3 location:(int64_t)a4
{
  int64_t v5 = [(PUOneUpBarsController *)self _barButtonItemCollectionForLocation:a4];
  char v6 = [v5 barButtonItemForIdentifier:a3];

  return v6;
}

- (int64_t)_locationForBarButtonItemCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOneUpBarsController *)self _leftNavBarButtonItemCollection];

  if (v5 == v4)
  {
    int64_t v10 = 3;
  }
  else
  {
    id v6 = [(PUOneUpBarsController *)self _centerNavBarButtonItemCollection];

    if (v6 == v4)
    {
      int64_t v10 = 2;
    }
    else
    {
      id v7 = [(PUOneUpBarsController *)self _rightNavBarButtonItemCollection];

      if (v7 == v4)
      {
        int64_t v10 = 1;
      }
      else
      {
        id v8 = [(PUOneUpBarsController *)self _toolbarButtonItemCollection];
        BOOL v9 = v8 == v4;

        int64_t v10 = 4 * v9;
      }
    }
  }

  return v10;
}

- (id)_barButtonIdentifiersForLocation:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v5 = [(PUOneUpBarsController *)self _rightNavBarButtonIdentifiers];
      goto LABEL_9;
    case 2:
      id v5 = [(PUOneUpBarsController *)self _centerNavBarButtonIdentifiers];
      goto LABEL_9;
    case 3:
      id v5 = [(PUOneUpBarsController *)self _leftNavBarButtonIdentifiers];
      goto LABEL_9;
    case 4:
      id v5 = [(PUOneUpBarsController *)self _toolbarButtonIdentifiers];
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (id)_barButtonItemCollectionForLocation:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v5 = [(PUOneUpBarsController *)self _rightNavBarButtonItemCollection];
      goto LABEL_9;
    case 2:
      id v5 = [(PUOneUpBarsController *)self _centerNavBarButtonItemCollection];
      goto LABEL_9;
    case 3:
      id v5 = [(PUOneUpBarsController *)self _leftNavBarButtonItemCollection];
      goto LABEL_9;
    case 4:
      id v5 = [(PUOneUpBarsController *)self _toolbarButtonItemCollection];
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (id)barButtonItemCollection:(id)a3 newBarButtonItemForIdentifier:(int64_t)a4
{
  id v4 = [(PUOneUpBarsController *)self _newBarButtonItemWithIdentifier:a4 location:[(PUOneUpBarsController *)self _locationForBarButtonItemCollection:a3]];
  return v4;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v3 = [(PUOneUpBarsController *)self browsingSession];
  id v4 = [v3 viewModel];

  if ([v4 isPresentingOverOneUp])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__PUOneUpBarsController_presentationControllerDidDismiss___block_invoke;
    v5[3] = &unk_1E5F2ED10;
    id v6 = v4;
    [v6 performChanges:v5];
  }
}

uint64_t __58__PUOneUpBarsController_presentationControllerDidDismiss___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPresentingOverOneUp:0];
}

- (id)oneUpActionsControllerPopoverSourceViewWithActionType:(unint64_t)a3
{
  return 0;
}

- (CGRect)oneUpActionsControllerPopoverSourceRectIn:(id)a3 actionType:(unint64_t)a4
{
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (id)oneUpActionsControllerPopoverSourceItemWithActionType:(unint64_t)a3
{
  if (a3 == 35) {
    [(PUOneUpBarsController *)self _airPlayBarButtonItemForPopoverPresentation];
  }
  else {
  uint64_t v3 = -[PUOneUpBarsController _barButtonItemForActionType:](self, "_barButtonItemForActionType:");
  }
  return v3;
}

- (id)_airPlayBarButtonItemForPopoverPresentation
{
  if ([(PUOneUpBarsController *)self shouldShowAirPlayButton]) {
    uint64_t v3 = 35;
  }
  else {
    uint64_t v3 = 32;
  }
  double v4 = [(PUOneUpBarsController *)self _barButtonItemForActionType:v3];
  return v4;
}

- (id)_barButtonItemForActionType:(unint64_t)a3
{
  unint64_t v5 = a3 - 1;
  if (a3 - 1 <= 0x3E && ((0x6F7C00B6800256A9uLL >> v5) & 1) != 0)
  {
    double v6 = -[PUOneUpBarsController _activeBarButtonItemForIdentifier:](self, "_activeBarButtonItemForIdentifier:", qword_1AEFF7F08[v5], v3);
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (id)sourceItemForActionType:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if ((id)*MEMORY[0x1E4F90CB0] == v4 || *MEMORY[0x1E4F90C68] == (void)v4)
  {
    uint64_t v7 = 50;
  }
  else if ((id)*MEMORY[0x1E4F90DD0] == v4 {
         || *MEMORY[0x1E4F90D40] == (void)v4
  }
         || *MEMORY[0x1E4F90DE0] == (void)v4
         || *MEMORY[0x1E4F90C98] == (void)v4)
  {
    uint64_t v7 = 2;
  }
  else
  {
    if ((id)*MEMORY[0x1E4F90C60] != v4)
    {
      uint64_t v11 = 0;
      goto LABEL_23;
    }
    uint64_t v7 = 3;
  }
  uint64_t v11 = [(PUOneUpBarsController *)self _barButtonItemForIdentifier:v7];
LABEL_23:

  return v11;
}

- (void)_toolbarViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "accessoryViewChanged", a3))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PUOneUpBarsController__toolbarViewModel_didChange___block_invoke;
    block[3] = &unk_1E5F2ED10;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __53__PUOneUpBarsController__toolbarViewModel_didChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateContentGuideInsets];
}

- (void)_browsingViewModel:(id)a3 didChange:(id)a4
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PUOneUpSettings sharedInstance];
  uint64_t v70 = [v8 chromeAnimationType];

  if ([v7 assetsDataSourceDidChange]) {
    [(PUBarsController *)self invalidateBars];
  }
  if ([v7 contentPrivacyStateDidChange])
  {
    [(PUOneUpBarsController *)self _invalidateChromeVisibilityWithAnimationType:0];
    [(PUBarsController *)self invalidateBars];
    BOOL v9 = [v6 contentPrivacyState] == 1;
    [(PUOneUpBarsController *)self _invalidateTitle];
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v10 = [v7 currentAssetDidChange];
  if (v10)
  {
    [(PUOneUpBarsController *)self _invalidateWantsAllPhotosButton];
    uint64_t v11 = [(PUOneUpBarsController *)self _currentAssetDisplayInfoUpdater];
    [v11 invalidateInfo];

    [(PUOneUpBarsController *)self _invalidateTitle];
    [(PUOneUpBarsController *)self _invalidateCommentsTitle];
    [(PUBarsController *)self invalidateBars];
    v12 = [(PUOneUpBarsController *)self detailsBarButtonController];
    [v12 currentAssetDidChange];

    uint64_t v70 = 2;
  }
  if ([v7 reviewScreenSelectionDidChange])
  {
    [(PUOneUpBarsController *)self _invalidateTitle];
    [(PUBarsController *)self invalidateBars];
  }
  if ([v7 navigationBarTitleDidChange]) {
    [(PUOneUpBarsController *)self _invalidateTitle];
  }
  if ([v7 resizeTaskDescriptorViewModelDidChange])
  {
    [(PUOneUpBarsController *)self _invalidateFileSizeButtonTitle];
    [(PUOneUpBarsController *)self _invalidateFileSizeButtonMenu];
  }
  if ([v7 reviewScreenBarsModelDidChange])
  {
    [(PUBarsController *)self invalidateBars];
    [(PUBarsController *)self invalidateContentGuideInsets];
  }
  if ([v7 isInSelectionModeDidChange])
  {
    uint64_t v13 = [(PUOneUpBarsController *)self browsingSession];
    int64_t v14 = [v13 actionManager];
    double v15 = objc_msgSend(v14, "px_selectionManager");

    [v15 performChanges:&__block_literal_global_45977];
    long long v16 = [(PUOneUpBarsController *)self browsingSession];
    long long v17 = [v16 actionManager];

    int v18 = [v6 isInSelectionMode];
    long long v19 = objc_msgSend(v17, "px_selectionManager");
    unint64_t v20 = v19;
    if (v18) {
      [v19 registerChangeObserver:self context:PhotosUICoreSelectionManagerObservationContext];
    }
    else {
      [v19 unregisterChangeObserver:self context:PhotosUICoreSelectionManagerObservationContext];
    }

    [(PUBarsController *)self invalidateBars];
  }
  if ([v7 chromeVisibilityDidChange])
  {
    uint64_t v10 = [(PUOneUpBarsController *)self disableShowingNavigationBars] ^ 1;
    uint64_t v21 = [(PUBarsController *)self viewController];
    int v22 = objc_msgSend(v21, "px_isVisible");
    uint64_t v23 = v70;
    if (!v22) {
      uint64_t v23 = 0;
    }
    uint64_t v70 = v23;
  }
  if ([v7 currentAssetTransitionProgressDidChange])
  {
    BOOL v24 = +[PUOneUpSettings sharedInstance];
    BOOL v25 = PUShouldAutoHideChrome(v6, [v24 chromeAutoHideBehaviorOnSwipe]);
  }
  else
  {
    BOOL v25 = 0;
  }
  v26 = [v6 currentAssetReference];

  if (v26)
  {
    BOOL v66 = v9;
    uint64_t v27 = [v6 currentAssetReference];
    v67 = v7;
    v64 = [v7 assetViewModelChangesByAssetReference];
    v73 = (void *)v27;
    [v64 objectForKeyedSubscript:v27];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
    BOOL v65 = v25;
    if (!v28)
    {
      uint64_t v31 = v70;
      goto LABEL_63;
    }
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v81;
    uint64_t v31 = v70;
    uint64_t v72 = *(void *)v81;
    while (1)
    {
      uint64_t v32 = 0;
      uint64_t v68 = v29;
      do
      {
        if (*(void *)v81 != v30) {
          objc_enumerationMutation(obj);
        }
        v33 = *(void **)(*((void *)&v80 + 1) + 8 * v32);
        v34 = [v33 videoPlayerChange];
        if (([v33 accessoryViewVisibilityChanged] & 1) != 0
          || ([v33 isInEditModeChanged] & 1) != 0
          || ([v33 isFavoriteChanged] & 1) != 0
          || ([v33 assetSyndicationStateChanged] & 1) != 0
          || ([v33 assetChanged] & 1) != 0
          || ([v33 importStateChanged] & 1) != 0
          || ([v34 audioStatusDidChange] & 1) != 0
          || ([v34 isActivatedDidChange] & 1) != 0
          || [v34 desiredPlayStateDidChange])
        {
          [(PUBarsController *)self invalidateBars];
        }
        if ([v33 accessoryViewVisibilityChanged])
        {
          [v6 assetViewModelForAssetReference:v73];
          uint64_t v35 = v32;
          uint64_t v36 = v31;
          uint64_t v37 = v29;
          unsigned int v38 = v10;
          v39 = self;
          id v40 = v6;
          v42 = v41 = v34;
          int v43 = [v42 isLastAccessoryViewVisibilityChangeReasonUserAction];

          v34 = v41;
          id v6 = v40;
          self = v39;
          unsigned int v44 = v38;
          uint64_t v29 = v37;
          uint64_t v31 = v36;
          uint64_t v32 = v35;
          if (v43) {
            uint64_t v31 = 1;
          }
          uint64_t v10 = v43 | v44;
          uint64_t v30 = v72;
        }
        if ([v33 isInEditModeChanged]) {
          [(PUOneUpBarsController *)self _invalidateChromeVisibilityWithAnimationType:v31];
        }
        if ([v33 contentOffsetChanged])
        {
          [(PUBarsController *)self invalidateBars];
          uint64_t v10 = 1;
        }
        if ([v33 visualImageAnalysisChanged])
        {
          v71 = v34;
          uint64_t v45 = v10;
          uint64_t v46 = v31;
          id v47 = v6;
          v48 = [v6 assetViewModelForAssetReference:v73];
          v49 = [v48 assetReference];
          id v50 = [v49 asset];
          id v51 = [v73 asset];
          if (v50 == v51)
          {
          }
          else
          {
            v52 = v51;
            char v53 = [v50 isEqual:v51];

            if ((v53 & 1) == 0) {
              goto LABEL_58;
            }
          }
          [(PUBarsController *)self invalidateBars];
LABEL_58:

          id v6 = v47;
          uint64_t v31 = v46;
          uint64_t v10 = v45;
          v34 = v71;
          uint64_t v30 = v72;
          uint64_t v29 = v68;
        }

        ++v32;
      }
      while (v29 != v32);
      uint64_t v29 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
      if (!v29)
      {
LABEL_63:
        char v54 = v10;
        uint64_t v70 = v31;
        id v7 = v67;
        v55 = [v67 assetSharedViewModelChangesByAssetUUID];
        v56 = [v73 asset];
        v57 = [v56 uuid];
        v58 = [v55 objectForKey:v57];

        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v59 = v58;
        uint64_t v60 = [v59 countByEnumeratingWithState:&v76 objects:v84 count:16];
        if (v60)
        {
          uint64_t v61 = v60;
          uint64_t v62 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v61; ++i)
            {
              if (*(void *)v77 != v62) {
                objc_enumerationMutation(v59);
              }
              if ([*(id *)(*((void *)&v76 + 1) + 8 * i) needsDeferredProcessingChanged]) {
                [(PUBarsController *)self invalidateBars];
              }
            }
            uint64_t v61 = [v59 countByEnumeratingWithState:&v76 objects:v84 count:16];
          }
          while (v61);
        }

        BOOL v25 = v65;
        BOOL v9 = v66;
        LOBYTE(v10) = v54;
        break;
      }
    }
  }
  if (v25)
  {
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __54__PUOneUpBarsController__browsingViewModel_didChange___block_invoke_2;
    v74[3] = &unk_1E5F2ED10;
    id v75 = v6;
    [v75 performChanges:v74];
  }
  else if (v10)
  {
    [(PUOneUpBarsController *)self _invalidateChromeVisibilityWithAnimationType:v70];
  }
  if (v9) {
    [(PUOneUpBarsController *)self updateBars];
  }
}

uint64_t __54__PUOneUpBarsController__browsingViewModel_didChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:0];
}

uint64_t __54__PUOneUpBarsController__browsingViewModel_didChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PUOneUpBarsController *)self _browsingViewModel:v7 didChange:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PUOneUpBarsController *)self _toolbarViewModel:v7 didChange:v6];
    }
  }
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  id v4 = [(PUOneUpBarsController *)self browsingSession];
  unint64_t v5 = [v4 viewModel];

  if ([v5 isInSelectionMode])
  {
    id v6 = [(PUOneUpBarsController *)self actionsController];
    [v6 performSimpleActionWithActionType:42];
  }
  else
  {
    id v7 = +[PUOneUpSettings sharedInstance];
    if ([v7 allowChromeHiding])
    {
      BOOL v8 = [(PUOneUpBarsController *)self disableChromeHiding];

      if (!v8)
      {
        char v9 = [v5 isChromeVisible];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __53__PUOneUpBarsController__handleTapGestureRecognizer___block_invoke;
        v10[3] = &unk_1E5F2E120;
        id v11 = v5;
        char v12 = v9;
        [v11 performChanges:v10];
      }
    }
    else
    {
    }
  }
}

uint64_t __53__PUOneUpBarsController__handleTapGestureRecognizer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeVisible:*(unsigned char *)(a1 + 40) == 0 changeReason:2];
}

- (void)_performPXActionType:(id)a3 withCompletionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(PUOneUpBarsController *)self delegate];
  BOOL v8 = [v7 oneUpBarsControllerAssetActionManager:self];

  if ([v8 canPerformActionType:v10])
  {
    char v9 = [v8 actionPerformerForActionType:v10];
    [v9 performActionWithCompletionHandler:v6];
  }
}

- (void)_performPXActionType:(id)a3
{
}

- (void)_performPlayPauseAction:(int64_t)a3
{
  unint64_t v5 = [(PUOneUpBarsController *)self _scrubberView];
  [v5 cancelDeceleration];

  id v6 = [(PUOneUpBarsController *)self actionsController];
  [v6 performPlayPauseActionWithDesiredState:a3];

  if (self->_delegateFlags.respondsToDidTapPlayPauseButton)
  {
    id v7 = [(PUOneUpBarsController *)self delegate];
    [v7 oneUpBarsController:self didTapPlayPauseButton:a3 == 4];
  }
}

- (void)_revealGainMapImage
{
  v2 = [(PUOneUpBarsController *)self browsingSession];
  uint64_t v3 = [v2 viewModel];

  id v4 = [v3 currentAssetReference];
  if (v4)
  {
    unint64_t v5 = [v3 assetViewModelForAssetReference:v4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PUOneUpBarsController__revealGainMapImage__block_invoke;
    v7[3] = &unk_1E5F2ED10;
    id v8 = v5;
    id v6 = v5;
    [v6 performChanges:v7];
  }
}

uint64_t __44__PUOneUpBarsController__revealGainMapImage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) revealsGainMapImage] ^ 1;
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 setRevealsGainMapImage:v2];
}

- (void)_showActionsMenu
{
  uint64_t v3 = [(PUOneUpBarsController *)self delegate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PUOneUpBarsController__showActionsMenu__block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  [v3 oneUpBarsControllerWillPresentActionsMenu:self completionHandler:v4];
}

void __41__PUOneUpBarsController__showActionsMenu__block_invoke(uint64_t a1)
{
  id v8 = objc_msgSend(*(id *)(a1 + 32), "_barButtonItemForIdentifier:location:", 50, objc_msgSend(*(id *)(a1 + 32), "_locationForBarButtonItemWithIdentifier:", 50));
  uint64_t v2 = [*(id *)(a1 + 32) _actionsMenu];
  [v8 setMenu:v2];

  char v3 = objc_opt_respondsToSelector();
  id v4 = v8;
  if (v3)
  {
    unint64_t v5 = [v8 performSelector:sel_view];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 contextMenuInteraction];
      objc_msgSend(v7, "_presentMenuAtLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    }
    id v4 = v8;
  }
}

- (void)_barButtonTappedWithIdentifier:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 15;
      goto LABEL_51;
    case 2:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performTrashAction];
      goto LABEL_52;
    case 3:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 10;
      goto LABEL_51;
    case 4:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 11;
      goto LABEL_51;
    case 5:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performRestoreAction];
      goto LABEL_52;
    case 6:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performShareAction];
      goto LABEL_52;
    case 7:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performToggleFavoriteAction];
      goto LABEL_52;
    case 10:
    case 31:
      id v11 = [(PUBarsController *)self viewController];
      [v11 dismissViewControllerAnimated:1 completion:0];
      goto LABEL_52;
    case 11:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 40;
      goto LABEL_51;
    case 12:
      uint64_t v6 = 4;
      goto LABEL_15;
    case 13:
      uint64_t v6 = 2;
LABEL_15:
      [(PUOneUpBarsController *)self _performPlayPauseAction:v6];
      return;
    case 14:
    case 15:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      objc_msgSend(v11, "performToggleCommentsActionAndBeginEditing:", -[PUOneUpBarsController shouldBeginEditingAfterShowingComments](self, "shouldBeginEditingAfterShowingComments"));
      goto LABEL_52;
    case 16:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 34;
      goto LABEL_51;
    case 17:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performCancelEditingAction];
      goto LABEL_52;
    case 18:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 35;
      goto LABEL_51;
    case 19:
      id v7 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v7;
      uint64_t v8 = 1;
      goto LABEL_23;
    case 20:
      id v7 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v7;
      uint64_t v8 = 0;
LABEL_23:
      [v7 performLikeActionWithLike:v8];
      goto LABEL_52;
    case 21:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 43;
      goto LABEL_51;
    case 22:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 44;
      goto LABEL_51;
    case 23:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 47;
      goto LABEL_51;
    case 24:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 45;
      goto LABEL_51;
    case 25:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 48;
      goto LABEL_51;
    case 26:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 49;
      goto LABEL_51;
    case 27:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 50;
      goto LABEL_51;
    case 28:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 51;
      goto LABEL_51;
    case 29:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 52;
      goto LABEL_51;
    case 32:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performShowInLibraryAction];
      goto LABEL_52;
    case 33:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 60;
      goto LABEL_51;
    case 34:
      [(PUOneUpBarsController *)self _revealGainMapImage];
      return;
    case 35:
      char v9 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v9;
      uint64_t v10 = 1;
      goto LABEL_40;
    case 36:
      char v9 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v9;
      uint64_t v10 = 0;
LABEL_40:
      [v9 performMuteActionWithShouldMute:v10];
      goto LABEL_52;
    case 37:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performDoneEditingAction];
      goto LABEL_52;
    case 38:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performToggleDetailsAction];
      goto LABEL_52;
    case 39:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performSyndicationSaveAction];
      goto LABEL_52;
    case 40:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 55;
      goto LABEL_51;
    case 41:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 57;
      goto LABEL_51;
    case 42:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 58;
      goto LABEL_51;
    case 43:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 59;
      goto LABEL_51;
    case 45:
    case 46:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 toggleSelectionMode];
      goto LABEL_52;
    case 47:
      id v11 = [(PUOneUpBarsController *)self actionsController];
      [v11 performMergeDuplicatesAction];
      goto LABEL_52;
    case 48:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 4;
      goto LABEL_51;
    case 49:
      id v4 = [(PUOneUpBarsController *)self actionsController];
      id v11 = v4;
      uint64_t v5 = 6;
LABEL_51:
      [v4 performSimpleActionWithActionType:v5];
LABEL_52:

      break;
    case 50:
      [(PUOneUpBarsController *)self _showActionsMenu];
      break;
    default:
      return;
  }
}

- (void)barButtonItemTapped:(id)a3
{
  id v7 = a3;
  int64_t v5 = -[PUOneUpBarsController _identifierForButton:](self, "_identifierForButton:");
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PUOneUpBarsController.m", 2365, @"Untracked BarButtonItem tapped: %@", v7 object file lineNumber description];
  }
  [(PUOneUpBarsController *)self _barButtonTappedWithIdentifier:v5];
}

- (void)_handleFavoriteButton:(id)a3
{
  id v3 = [(PUOneUpBarsController *)self actionsController];
  [v3 performToggleFavoriteAction];
}

- (void)_handleCreativeControlsButton:(id)a3
{
  id v3 = [(PUOneUpBarsController *)self actionsController];
  [v3 performSimpleActionWithActionType:15];
}

- (void)_handleInfoButton:(id)a3
{
  id v3 = [(PUOneUpBarsController *)self actionsController];
  [v3 performToggleDetailsAction];
}

- (void)_handleTrashButton:(id)a3
{
  id v3 = [(PUOneUpBarsController *)self actionsController];
  [v3 performTrashAction];
}

- (void)_stopObservingOrientationChanges
{
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  [v4 endGeneratingDeviceOrientationNotifications];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)_startObservingOrientationChanges
{
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_orientationChanged_ name:*MEMORY[0x1E4FB2828] object:v4];

  [v4 beginGeneratingDeviceOrientationNotifications];
}

- (void)setWantsAllPhotosButton:(BOOL)a3
{
  if (self->_wantsAllPhotosButton != a3)
  {
    self->_wantsAllPhotosButton = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)_updateWantsAllPhotosButton
{
  id v3 = [(PUOneUpBarsController *)self browsingSession];
  id v4 = [v3 actionManager];
  int64_t v5 = [(PUOneUpBarsController *)self currentAssetByAssetCollection];
  uint64_t v6 = [v4 canPerformAction:40 onAllAssetsByAssetCollection:v5];

  [(PUOneUpBarsController *)self setWantsAllPhotosButton:v6];
}

- (void)_setShowingPlayPauseButton:(BOOL)a3
{
  if (self->_isShowingPlayPauseButton != a3)
  {
    self->_isShowingPlayPauseButton = a3;
    if (self->_delegateFlags.respondsToDidChangeShowingPlayPauseButton)
    {
      id v4 = [(PUOneUpBarsController *)self delegate];
      [v4 oneUpBarsControllerDidChangeShowingPlayPauseButton:self];
    }
  }
}

- (void)_updateShowingPlayPauseButton
{
  if ([(PUOneUpBarsController *)self allowShowingPlayPauseButton])
  {
    id v3 = [(PUOneUpBarsController *)self _playPauseBarItemsController];
    uint64_t v4 = [v3 playPauseState];

    int64_t v5 = +[PUOneUpSettings sharedInstance];
    int v6 = [v5 allowPlayButtonInBars];

    if (v6) {
      BOOL v7 = v4 != 0;
    }
    else {
      BOOL v7 = v4 == 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  [(PUOneUpBarsController *)self _setShowingPlayPauseButton:v7];
}

- (void)_updateChromeVisibilityIfNeeded
{
  if (![(PUOneUpBarsController *)self _needsUpdateChromeVisibility]) {
    return;
  }
  [(PUOneUpBarsController *)self _setNeedsUpdateChromeVisibility:0];
  BOOL v3 = [(PUOneUpBarsController *)self _wantsChromeVisible];
  int64_t v4 = [(PUOneUpBarsController *)self _nextChromeVisibilityUpdateAnimationType];
  int64_t v5 = [(PUBarsController *)self viewController];
  id v9 = v5;
  if (v4)
  {
    int v6 = [(PUOneUpBarsController *)self browsingSession];
    BOOL v7 = [v6 viewModel];
    double v8 = PUChromeAnimationDuration(v7);

    if (!v3)
    {
      if ([(PUOneUpBarsController *)self _lastChromeVisibility]) {
        [(PUBarsController *)self disableUpdateBarsForDuration:v8];
      }
      objc_msgSend(v9, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", v4, *(void *)&v8);
      goto LABEL_12;
    }
    objc_msgSend(v9, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", v4, *(void *)&v8);
    goto LABEL_7;
  }
  objc_msgSend(v5, "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 0, 0);
  if (v3)
  {
LABEL_7:
    if (![(PUOneUpBarsController *)self _lastChromeVisibility]) {
      [(PUBarsController *)self invalidateContentGuideInsets];
    }
  }
LABEL_12:
  [(PUOneUpBarsController *)self _setLastChromeVisibility:v3];
}

- (void)_invalidateChromeVisibilityWithAnimationType:(int64_t)a3
{
  [(PUOneUpBarsController *)self _setNeedsUpdateChromeVisibility:1];
  [(PUOneUpBarsController *)self _setNextChromeVisibilityUpdateAnimationType:a3];
  [(PUOneUpBarsController *)self _updateChromeVisibilityIfNeeded];
}

- (void)_updateFileSizeButtonMenuIfNeeded
{
  if ([(PUOneUpBarsController *)self _needsUpdateFileSizeButtonMenu])
  {
    [(PUOneUpBarsController *)self _setNeedsUpdateFileSizeButtonMenu:0];
    id v7 = [(PUOneUpBarsController *)self _activeBarButtonItemForIdentifier:30];
    BOOL v3 = [(PUOneUpBarsController *)self browsingSession];
    int64_t v4 = [v3 viewModel];
    int64_t v5 = [v4 resizeTaskDescriptorViewModel];
    int v6 = [v5 fileSizeMenu];
    [v7 setMenu:v6];
  }
}

- (void)_updateFileSizeButtonTitleIfNeeded
{
  if ([(PUOneUpBarsController *)self _needsUpdateFileSizeButtonTitle])
  {
    [(PUOneUpBarsController *)self _setNeedsUpdateFileSizeButtonTitle:0];
    id v7 = [(PUOneUpBarsController *)self _activeBarButtonItemForIdentifier:30];
    BOOL v3 = [(PUOneUpBarsController *)self browsingSession];
    int64_t v4 = [v3 viewModel];
    int64_t v5 = [v4 resizeTaskDescriptorViewModel];
    int v6 = [v5 localizedTitle];
    [v7 setTitle:v6];
  }
}

- (void)_invalidateFileSizeButtonMenu
{
  [(PUOneUpBarsController *)self _setNeedsUpdateFileSizeButtonMenu:1];
  [(PUBarsController *)self invalidateBars];
}

- (void)_invalidateFileSizeButtonTitle
{
  [(PUOneUpBarsController *)self _setNeedsUpdateFileSizeButtonTitle:1];
  [(PUBarsController *)self invalidateBars];
}

- (void)_updateCommentsTitleIfNeeded
{
  if (![(PUOneUpBarsController *)self _needsUpdateCommentsTitle]) {
    return;
  }
  [(PUOneUpBarsController *)self _setNeedsUpdateCommentsTitle:0];
  int64_t v4 = [(PUOneUpBarsController *)self _currentAssetDisplayInfoUpdater];
  id v29 = [v4 info];

  int64_t v5 = [v29 objectForKeyedSubscript:@"PUCommentsInfoDictionaryKey"];
  if (v5)
  {
    int v6 = [(PUOneUpBarsController *)self _activeBarButtonItemForIdentifier:14];
    if (!v6)
    {
LABEL_22:

      goto LABEL_23;
    }
    id v7 = [v5 objectForKeyedSubscript:@"PUCommentsInfoCommentCountKey"];
    uint64_t v8 = [v7 integerValue];

    id v9 = [v5 objectForKeyedSubscript:@"PUCommentsInfoLikeCountKey"];
    uint64_t v10 = [v9 integerValue];

    if (v10 && v8)
    {
      id v11 = PULocalizedString(@"ONEUP_COMMENTS_TOGGLE_CONSOLIDATED_COMMENTS");
      char v12 = PULocalizedStringWithValidatedFormat(v11, @"%d");

      if (!objc_msgSend(v12, "length", v10 + v8)
        || ![(PUOneUpBarsController *)self shouldUseCompactCommentsTitle])
      {
        uint64_t v13 = [(PUOneUpBarsController *)self _attributedCommentTitleForTitle:v12 highlighted:0];
        int64_t v14 = [(PUBarsController *)self viewController];
        [v13 size];
        double v16 = v15;
        long long v17 = [v14 view];
        [v17 bounds];
        double v19 = v18 * 0.5;

        if (v16 < v19)
        {
          unint64_t v20 = PULocalizedString(@"ONEUP_COMMENTS_TOGGLE_COMMENTS_AND_LIKES");
          uint64_t v27 = v10;
          uint64_t v28 = v8;
          uint64_t v21 = PULocalizedStringWithValidatedFormat(v20, @"%d %d");

          char v12 = (void *)v21;
        }
      }
    }
    else if (v10 || !v8)
    {
      if (!v10 || v8)
      {
        char v12 = PULocalizedString(@"ONEUP_COMMENTS_TOGGLE_NO_COMMENTS");
        uint64_t v24 = 1;
LABEL_19:
        -[PUOneUpBarsController setShouldBeginEditingAfterShowingComments:](self, "setShouldBeginEditingAfterShowingComments:", v24, v27, v28);
        BOOL v25 = [v6 customView];
        if (!v25 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v26 = [MEMORY[0x1E4F28B00] currentHandler];
          [v26 handleFailureInMethod:a2, self, @"PUOneUpBarsController.m", 2210, @"Invalid parameter not satisfying: %@", @"commentsItemButton && [commentsItemButton isKindOfClass:UIButton.class]" object file lineNumber description];
        }
        [(PUOneUpBarsController *)self _updateCommentsButton:v25 withTitle:v12];

        goto LABEL_22;
      }
      uint64_t v23 = PULocalizedString(@"ONEUP_COMMENTS_TOGGLE_LIKES_ONLY");
      uint64_t v27 = v10;
      char v12 = PULocalizedStringWithValidatedFormat(v23, @"%d");
    }
    else
    {
      int v22 = PULocalizedString(@"ONEUP_COMMENTS_TOGGLE_COMMENTS_ONLY");
      uint64_t v27 = v8;
      char v12 = PULocalizedStringWithValidatedFormat(v22, @"%d");
    }
    uint64_t v24 = 0;
    goto LABEL_19;
  }
LABEL_23:
}

- (void)_invalidateCommentsTitle
{
  [(PUOneUpBarsController *)self _setNeedsUpdateCommentsTitle:1];
  [(PUBarsController *)self invalidateBars];
}

- (id)_textColorForTitleViewController:(BOOL)a3
{
  int64_t v4 = [(PUOneUpBarsController *)self style];
  int64_t v5 = +[PUInterfaceManager currentTheme];
  int v6 = v5;
  if (v4 == 1)
  {
    uint64_t v7 = [v5 photoBrowserSpotlightThemeColor];
  }
  else
  {
    if (a3) {
      [v5 photoBrowserTitleViewTappableTextColor];
    }
    else {
    uint64_t v7 = [v5 photoBrowserTitleViewTextColor];
    }
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (void)_updateTitleIfNeeded
{
  if ([(PUOneUpBarsController *)self _needsUpdateTitle])
  {
    [(PUOneUpBarsController *)self _setNeedsUpdateTitle:0];
    BOOL v3 = [(PUOneUpBarsController *)self browsingSession];
    int64_t v4 = [v3 viewModel];
    int64_t v5 = [v4 navigationBarTitle];

    int v6 = +[PUOneUpSettings sharedInstance];
    uint64_t v7 = [v6 debuggingTitleType];

    switch(v7)
    {
      case 3:
        uint64_t v24 = [(PUOneUpBarsController *)self browsingSession];
        BOOL v25 = [v24 viewModel];
        v26 = [v25 currentAssetReference];
        id v9 = [v26 asset];

        if (objc_opt_respondsToSelector())
        {
          int v27 = [v9 deferredProcessingNeeded];
          uint64_t v28 = @"Processing…";
          if (!v27) {
            uint64_t v28 = @"Processing Done";
          }
          id v29 = v28;

          double v19 = 0;
          int64_t v5 = v29;
        }
        else
        {
          double v19 = 0;
        }
        break;
      case 2:
        unint64_t v20 = [(PUBarsController *)self viewController];
        double v19 = objc_msgSend(v20, "px_imageModulationManager");

        double v21 = MEMORY[0x1B3E7B060]([v19 requestedEDRHeadroomFactor]);
        int v22 = NSString;
        [v19 HDRFocus];
        objc_msgSend(v22, "stringWithFormat:", @"HDR %0.1f · Req %0.1f", v23, *(void *)&v21);
        v5 = id v9 = v5;
        break;
      case 1:
        uint64_t v8 = [(PUOneUpBarsController *)self browsingSession];
        id v9 = [v8 viewModel];

        uint64_t v10 = [v9 currentAssetReference];
        id v11 = [v9 assetsDataSource];
        char v12 = [v11 indexPathForAssetReference:v10];
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:", objc_msgSend(v12, "section"));
        uint64_t v14 = [v11 numberOfSubItemsAtIndexPath:v13];

        double v15 = NSString;
        double v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "item") + 1);
        long long v17 = [NSNumber numberWithInteger:v14];
        uint64_t v18 = [v15 stringWithFormat:@"%@ of %@", v16, v17];

        double v19 = 0;
        int64_t v5 = (void *)v18;
        break;
      default:
        double v19 = 0;
LABEL_14:
        uint64_t v45 = v19;
        uint64_t v46 = v5;
        [(PUOneUpBarsController *)self _setTitle:v5];
        [(PUOneUpBarsController *)self setDebuggingObservedImageModulationManager:v19];
        BOOL v30 = [(PUOneUpBarsController *)self shouldUseCompactTitleView];
        uint64_t v31 = [(PUOneUpBarsController *)self _currentAssetDisplayInfoUpdater];
        uint64_t v32 = [v31 info];

        v33 = [v32 objectForKeyedSubscript:@"PUTitleInfoDictionaryKey"];
        v34 = [v33 objectForKeyedSubscript:@"PUTitleInfoGeoDescriptionKey"];
        uint64_t v35 = [v33 objectForKeyedSubscript:@"PUTitleInfoCreationDateKey"];
        BOOL v36 = [(PUOneUpBarsController *)self allowTapOnTitle];
        uint64_t v37 = [(PUOneUpBarsController *)self _titleTextColorForTitleViewController:v36];
        unsigned int v38 = [(PUOneUpBarsController *)self _subtitleTextColorForTitleViewController:v36];
        v39 = [(PUOneUpBarsController *)self _titleViewController];
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __45__PUOneUpBarsController__updateTitleIfNeeded__block_invoke;
        v47[3] = &unk_1E5F279C0;
        BOOL v53 = v30;
        id v48 = v39;
        id v49 = v34;
        id v50 = v35;
        id v51 = v37;
        id v52 = v38;
        BOOL v54 = v36;
        id v40 = v38;
        id v41 = v37;
        id v42 = v35;
        id v43 = v34;
        id v44 = v39;
        [v44 performChanges:v47];

        return;
    }

    goto LABEL_14;
  }
}

uint64_t __45__PUOneUpBarsController__updateTitleIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUsingCompactTitleView:*(unsigned __int8 *)(a1 + 72)];
  [*(id *)(a1 + 32) setGeoDescription:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCreationDate:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setTitleTextColor:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setSubtitleTextColor:*(void *)(a1 + 64)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 73);
  return [v2 setTappable:v3];
}

- (void)_invalidateTitle
{
  [(PUOneUpBarsController *)self _setNeedsUpdateTitle:1];
  [(PUBarsController *)self invalidateBars];
}

- (void)_invalidateScrubber
{
  [(PUScrubberView *)self->__scrubberView removeFromSuperview];
  scrubberView = self->__scrubberView;
  self->__scrubberView = 0;

  [(PUBarsController *)self invalidateBars];
}

- (void)_updateScrubberViewIfNeeded
{
  int64_t v4 = [(PUOneUpBarsController *)self _scrubberType];
  scrubberView = self->__scrubberView;
  if (!v4)
  {
    if (!scrubberView) {
      return;
    }
    uint64_t v6 = 1;
    goto LABEL_6;
  }
  if (scrubberView)
  {
    uint64_t v6 = 0;
LABEL_6:
    [(PUScrubberView *)scrubberView setHidden:v6];
    return;
  }
  id v12 = [(PUOneUpBarsController *)self browsingSession];
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUOneUpBarsController.m", 2043, @"Invalid parameter not satisfying: %@", @"browsingSession != nil" object file lineNumber description];
  }
  uint64_t v7 = [PUScrubberView alloc];
  uint64_t v8 = -[PUScrubberView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v9 = self->__scrubberView;
  self->__scrubberView = v8;
  uint64_t v10 = v8;

  [(PUScrubberView *)v10 setDelegate:self];
  [(PUScrubberView *)v10 setBrowsingSession:v12];
  [(PUScrubberView *)v10 setType:v4 == 2];
}

- (id)_localizedTitleForMergeDuplicatesBarButtonItem
{
  uint64_t v2 = [(PUOneUpBarsController *)self browsingSession];
  uint64_t v3 = [v2 viewModel];
  int v4 = [v3 isInSelectionMode];

  if (v4)
  {
    int64_t v5 = [v2 actionManager];
    uint64_t v6 = [v5 localizedTitleForActionType:62];
  }
  else
  {
    uint64_t v6 = PULocalizedString(@"ONE_UP_MERGE_DUPLICATES_BUTTON_TITLE_MERGE_ALL");
  }

  return v6;
}

- (id)_createMultiLineButtonWithTitle:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4FB14D0];
  id v5 = a3;
  uint64_t v6 = [v4 buttonWithType:1];
  uint64_t v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v8 = [v6 titleLabel];
  [v8 setFont:v7];

  [v6 setTitle:v5 forState:0];
  [v6 addTarget:self action:sel_barButtonItemTapped_ forControlEvents:64];
  id v9 = [v6 titleLabel];
  [v9 setLineBreakMode:0];

  uint64_t v10 = [v6 titleLabel];
  [v10 setNumberOfLines:0];

  id v11 = [v6 titleLabel];
  [v11 setTextAlignment:1];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 sizeToFit];
  return v6;
}

- (id)_newBarButtonItemWithIdentifier:(int64_t)a3 location:(int64_t)a4
{
  v102[1] = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke;
  aBlock[3] = &unk_1E5F27880;
  aBlock[4] = self;
  uint64_t v7 = (void (**)(void *, __CFString *, void *))_Block_copy(aBlock);
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke_2;
  v100[3] = &unk_1E5F278A8;
  v100[4] = self;
  uint64_t v8 = _Block_copy(v100);
  id v9 = v8;
  switch(a3)
  {
    case 0:
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:1770 description:@"undefined identifier"];

      goto LABEL_5;
    case 1:
    case 25:
      uint64_t v13 = (*((void (**)(void *, uint64_t))v8 + 2))(v8, 2);
      goto LABEL_52;
    case 2:
      uint64_t v13 = (*((void (**)(void *, uint64_t))v8 + 2))(v8, 16);
      goto LABEL_52;
    case 3:
      id v14 = objc_alloc(MEMORY[0x1E4FB14A8]);
      double v15 = PULocalizedString(@"DELETE_BUTTON_TITLE");
      id v11 = (id)[v14 initWithTitle:v15 style:7 target:self action:sel_barButtonItemTapped_];

      break;
    case 4:
      id v16 = objc_alloc(MEMORY[0x1E4FB14A8]);
      long long v17 = PULocalizedString(@"RECOVER_BUTTON_TITLE");
      id v11 = (id)[v16 initWithTitle:v17 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 5:
      id v18 = objc_alloc(MEMORY[0x1E4FB14A8]);
      double v19 = PULocalizedString(@"RESTORE_BUTTON_TITLE");
      id v11 = (id)[v18 initWithTitle:v19 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 6:
      (*((void (**)(void *, uint64_t))v8 + 2))(v8, 9);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      unint64_t v20 = [_PUSharingPreheatGestureRecognizer alloc];
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke_3;
      v97[3] = &unk_1E5F2E530;
      objc_copyWeak(&v98, &location);
      double v21 = [(_PUSharingPreheatGestureRecognizer *)v20 initWithSharingPreheatBlock:v97];
      v102[0] = v21;
      int v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:1];
      [v11 _setGestureRecognizers:v22];

      objc_destroyWeak(&v98);
      objc_destroyWeak(&location);
      break;
    case 7:
    case 9:
      uint64_t v10 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_FAVORITE");
      v7[2](v7, @"heart", v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 8:
      uint64_t v46 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_UNFAVORITE");
      v7[2](v7, @"heart.fill", v46);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 10:
    case 31:
      id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@" " style:0 target:self action:sel_barButtonItemTapped_];
      [v11 _setShowsBackButtonIndicator:1];
      break;
    case 11:
      id v47 = objc_alloc(MEMORY[0x1E4FB14A8]);
      id v48 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_CAMERA_ALLPHOTOS");
      id v11 = (id)[v47 initWithTitle:v48 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 12:
      uint64_t v23 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_PLAY");
      v7[2](v7, @"play.fill", v23);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      [v11 setWidth:50.0];
      break;
    case 13:
      uint64_t v24 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_PAUSE");
      v7[2](v7, @"pause.fill", v24);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      [v11 setWidth:50.0];
      break;
    case 14:
      id v49 = [(PUOneUpBarsController *)self _commentsButtonWithTitle:0];
      id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v49];

      break;
    case 15:
      BOOL v25 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_HIDECOMMENTS");
      v26 = [(PUOneUpBarsController *)self _commentsButtonWithTitle:v25];

      id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v26];
      break;
    case 16:
      id v50 = objc_alloc(MEMORY[0x1E4FB14A8]);
      id v51 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_REVIEW");
      id v11 = (id)[v50 initWithTitle:v51 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 17:
    case 21:
    case 46:
      uint64_t v13 = (*((void (**)(void *, uint64_t))v8 + 2))(v8, 1);
      goto LABEL_52;
    case 18:
      uint64_t v13 = (*((void (**)(void *, uint64_t))v8 + 2))(v8, 111);
      goto LABEL_52;
    case 19:
      id v52 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_LIKE");
      v7[2](v7, @"hand.thumbsup", v52);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 20:
      BOOL v53 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_LIKED");
      v7[2](v7, @"hand.thumbsup.fill", v53);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      break;
    case 22:
    case 37:
      uint64_t v13 = (*((void (**)(void *, void))v8 + 2))(v8, 0);
      goto LABEL_52;
    case 23:
      id v54 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v55 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_MARKUP");
      id v11 = (id)[v54 initWithTitle:v55 style:7 target:self action:sel_barButtonItemTapped_];

      break;
    case 24:
      id v56 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v57 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_RETAKE");
      id v11 = (id)[v56 initWithTitle:v57 style:7 target:self action:sel_barButtonItemTapped_];

      break;
    case 26:
    case 27:
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:&stru_1F06BE7B8 style:0 target:self action:sel_barButtonItemTapped_];
      goto LABEL_52;
    case 28:
      id v58 = objc_alloc(MEMORY[0x1E4FB14A8]);
      id v59 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_SELECT_ALL");
      id v11 = (id)[v58 initWithTitle:v59 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 29:
      id v60 = objc_alloc(MEMORY[0x1E4FB14A8]);
      uint64_t v61 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_DESELECT_ALL");
      id v11 = (id)[v60 initWithTitle:v61 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 30:
      id v62 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v96 = [(PUOneUpBarsController *)self browsingSession];
      v95 = [v96 viewModel];
      v63 = [v95 resizeTaskDescriptorViewModel];
      v64 = [v63 localizedTitle];
      BOOL v65 = [(PUOneUpBarsController *)self browsingSession];
      BOOL v66 = [v65 viewModel];
      v67 = [v66 resizeTaskDescriptorViewModel];
      uint64_t v68 = [v67 fileSizeMenu];
      id v11 = (id)[v62 initWithTitle:v64 menu:v68];

      break;
    case 32:
      id v69 = objc_alloc(MEMORY[0x1E4FB14A8]);
      uint64_t v70 = PULocalizedString(@"PUPHOTOBROWSER_SHOW_IN_LIBRARY");
      id v11 = (id)[v69 initWithTitle:v70 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 33:
      BOOL v27 = [(PUOneUpBarsController *)self style] == 2;
      id v28 = objc_alloc(MEMORY[0x1E4FB14A8]);
      if (v27)
      {
        id v29 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.down"];
        id v11 = (id)[v28 initWithImage:v29 style:0 target:self action:sel_barButtonItemTapped_];
      }
      else
      {
        id v29 = PULocalizedString(@"ONE_UP_SAVE_TO_LIBRARY");
        id v11 = (id)[v28 initWithTitle:v29 style:0 target:self action:sel_barButtonItemTapped_];
      }

      break;
    case 34:
      uint64_t v13 = v7[2](v7, @"map", @"Gain Map");
LABEL_52:
      id v11 = (id)v13;
      break;
    case 35:
      BOOL v30 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_MUTE");
      v7[2](v7, @"speaker.2.fill", v30);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      [v11 setWidth:53.0];
      break;
    case 36:
      uint64_t v31 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_MUTED");
      v7[2](v7, @"speaker.slash.fill", v31);
      id v11 = (id)objc_claimAutoreleasedReturnValue();

      [v11 setWidth:53.0];
      break;
    case 38:
      v71 = [(PUOneUpBarsController *)self browsingSession];
      uint64_t v72 = [v71 viewModel];

      v73 = +[PUOneUpDetailsBarButtonController defaultGlyphNameFor:v72];
      v74 = +[PUAnimatableBarButtonItem barButtonItemWithSystemImageName:v73];
      [v74 addTarget:self action:sel_barButtonItemTapped_ for:64];
      [v74 setAccessibilityIdentifier:@"com.apple.mobileslideshow.infoButton"];
      id v11 = v74;
      id v75 = [[PUOneUpDetailsBarButtonController alloc] initWithBarButtonItem:v11 browseViewModel:v72];

      [(PUOneUpBarsController *)self setDetailsBarButtonController:v75];
      break;
    case 39:
      long long v76 = [(PUOneUpBarsController *)self browsingSession];
      long long v77 = [v76 viewModel];
      long long v78 = [v77 currentAssetReference];
      long long v79 = [v78 asset];

      uint64_t v80 = [v79 mediaType];
      long long v81 = @"ITEM";
      if (v80 == 1) {
        long long v81 = @"PHOTO";
      }
      if (v80 == 2) {
        long long v81 = @"VIDEO";
      }
      long long v82 = v81;
      long long v83 = [@"ONE_UP_SYNDICATION_SAVE_TO_LIBRARY_" stringByAppendingString:v82];
      v84 = PULocalizedString(v83);

      id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v84 style:0 target:self action:sel_barButtonItemTapped_];
      break;
    case 40:
      id v32 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v33 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"trash"];
      id v11 = (id)[v32 initWithImage:v33 style:0 target:self action:sel_barButtonItemTapped_];

      v34 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_TRASH");
      [v11 setTitle:v34];

      break;
    case 41:
      v85 = [(PUOneUpBarsController *)self browsingSession];
      uint64_t v86 = [v85 actionManager];

      id v11 = [v86 barButtonItemForActionType:57];
      v87 = [v11 customView];
      [v87 addTarget:self action:sel_barButtonItemTapped_ forControlEvents:64];

      break;
    case 42:
      id v88 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v89 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrowshape.turn.up.left"];
      id v11 = (id)[v88 initWithImage:v89 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 43:
      id v35 = objc_alloc(MEMORY[0x1E4FB14A8]);
      BOOL v36 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"plus.bubble.tapback"];
      id v11 = (id)[v35 initWithImage:v36 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 44:
      id v37 = objc_alloc(MEMORY[0x1E4FB14A8]);
      unsigned int v38 = [(PUOneUpBarsController *)self _titleViewController];
      v39 = [v38 view];
      id v11 = (id)[v37 initWithCustomView:v39];

      break;
    case 45:
      id v90 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v91 = PULocalizedString(@"ONE_UP_SELECT_BUTTON_TITLE");
      id v11 = (id)[v90 initWithTitle:v91 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 47:
      id v40 = [(PUOneUpBarsController *)self _localizedTitleForMergeDuplicatesBarButtonItem];
      id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v40 style:0 target:self action:sel_barButtonItemTapped_];

      break;
    case 48:
    case 49:
      id v41 = PXLocalizedSharedLibraryString();
      id v42 = [(PUOneUpBarsController *)self _createMultiLineButtonWithTitle:v41];
      id v11 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v42];

      break;
    case 50:
      id v43 = objc_alloc(MEMORY[0x1E4FB14A8]);
      id v44 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"ellipsis.circle"];
      id v11 = (id)[v43 initWithImage:v44 menu:0];

      uint64_t v45 = PULocalizedString(@"BAR_BUTTON_ITEM_TITLE_ACTIONS");
      [v11 setTitle:v45];

      break;
    default:
LABEL_5:
      id v11 = 0;
      break;
  }
  if ([(PUOneUpBarsController *)self style] == 1)
  {
    v92 = +[PUInterfaceManager currentTheme];
    v93 = [v92 photoBrowserSpotlightThemeColor];
    [v11 setTintColor:v93];
  }
  return v11;
}

id __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4FB14A8];
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  id v9 = [MEMORY[0x1E4FB1818] _systemImageNamed:v7];

  uint64_t v10 = (void *)[v8 initWithImage:v9 style:0 target:*(void *)(a1 + 32) action:sel_barButtonItemTapped_];
  [v10 setTitle:v6];

  return v10;
}

id __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:a2 target:*(void *)(a1 + 32) action:sel_barButtonItemTapped_];
  return v2;
}

void __66__PUOneUpBarsController__newBarButtonItemWithIdentifier_location___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained actionsController];
  [v1 preheatShareAction];
}

- (id)_commentsButtonWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  [v5 addTarget:self action:sel_barButtonItemTapped_ forControlEvents:64];
  if (v4) {
    [(PUOneUpBarsController *)self _updateCommentsButton:v5 withTitle:v4];
  }

  return v5;
}

- (void)_updateCommentsButton:(id)a3 withTitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PUOneUpBarsController *)self _attributedCommentTitleForTitle:v6 highlighted:0];
  id v8 = [(PUOneUpBarsController *)self _attributedCommentTitleForTitle:v6 highlighted:1];

  [v7 addTarget:self action:sel_barButtonItemTapped_ forControlEvents:64];
  [v7 setAttributedTitle:v9 forState:0];
  [v7 setAttributedTitle:v8 forState:1];
  [v7 sizeToFit];
}

- (id)_attributedCommentTitleForTitle:(id)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PUOneUpBarsController *)self _commentTitleAttributes];
  id v8 = objc_msgSend(MEMORY[0x1E4F28B18], "px_attributedStringWithHTMLString:defaultAttributes:", v6, v7);

  if (v4)
  {
    id v9 = [(PUOneUpBarsController *)self _commentTitleColor];
    id v10 = (id)[v8 mutableCopy];
    uint64_t v11 = *MEMORY[0x1E4FB0700];
    id v12 = [v9 colorWithAlphaComponent:0.5];
    objc_msgSend(v10, "addAttribute:value:range:", v11, v12, 0, objc_msgSend(v10, "length"));
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

- (id)_commentTitleAttributes
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28C8], *MEMORY[0x1E4FB27B0], 0);
  uint64_t v4 = *MEMORY[0x1E4FB06F8];
  v10[0] = v3;
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  v9[0] = v4;
  v9[1] = v5;
  id v6 = [(PUOneUpBarsController *)self _commentTitleColor];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)_commentTitleColor
{
  return (id)[MEMORY[0x1E4FB1618] _systemInteractionTintColor];
}

- (int64_t)_locationForBarButtonItemWithIdentifier:(int64_t)a3
{
  uint64_t v5 = [(PUOneUpBarsController *)self _playPauseBarItemsController];
  uint64_t v6 = [v5 playPauseState];
  BOOL v7 = [(PUOneUpBarsController *)self shouldPlaceButtonsInNavigationBar];
  BOOL v8 = [(PUOneUpBarsController *)self allowShowingPlayPauseButton];
  if (v6) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v10 = [(PUOneUpBarsController *)self isInCompactLayoutStyle];
  if (v10) {
    BOOL v10 = [(PUOneUpBarsController *)self _physicalDeviceIsIPad];
  }
  if (v7 || v10) {
    int v11 = !v7;
  }
  else {
    int v11 = [(PUOneUpBarsController *)self shouldShowAirPlayButton]
  }
       || [(PUOneUpBarsController *)self wantsShowInLibraryButton]
       || [(PUOneUpBarsController *)self wantsAllPhotosButton];
  BOOL v12 = [(PUOneUpBarsController *)self _canShowCommentsForCurrentAsset];
  if (!v9
    || (+[PUOneUpSettings sharedInstance],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 allowPlayButtonInBars],
        v13,
        (v14 & 1) != 0)
    || a3 == 13
    || v6 != 1
    || a3 == 10
    || a3 == 18
    || (unint64_t)(a3 - 21) <= 1)
  {
    switch(a3)
    {
      case 1:
        if (v11) {
          int64_t v15 = 4;
        }
        else {
          int64_t v15 = 1;
        }
        break;
      case 2:
      case 40:
        BOOL v16 = !v7 && !v12;
        goto LABEL_27;
      case 3:
      case 4:
      case 5:
      case 14:
      case 15:
      case 19:
      case 20:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 33:
      case 41:
      case 42:
      case 43:
      case 48:
      case 49:
        int64_t v15 = 4;
        break;
      case 6:
      case 7:
      case 8:
      case 9:
      case 16:
      case 39:
        if (v7) {
          int64_t v15 = 3;
        }
        else {
          int64_t v15 = 4;
        }
        break;
      case 10:
      case 17:
      case 21:
      case 31:
        goto LABEL_43;
      case 11:
      case 18:
      case 22:
      case 32:
      case 37:
      case 46:
      case 50:
        int64_t v15 = 1;
        break;
      case 12:
        long long v17 = +[PUOneUpSettings sharedInstance];
        int v18 = [v17 allowPlayButtonInBars];

        if ((v18 & v9) != 1) {
          goto LABEL_40;
        }
        goto LABEL_34;
      case 13:
        if (!v9) {
          goto LABEL_40;
        }
        goto LABEL_34;
      case 34:
      case 38:
      case 45:
        BOOL v16 = !v7;
LABEL_27:
        if (v16) {
          int64_t v15 = 4;
        }
        else {
          int64_t v15 = 1;
        }
        break;
      case 35:
      case 36:
LABEL_34:
        int64_t v19 = [(PUOneUpBarsController *)self style];
        uint64_t v20 = 3;
        if (!v7) {
          uint64_t v20 = 4;
        }
        if (v19 == 1) {
          int64_t v15 = 4;
        }
        else {
          int64_t v15 = v20;
        }
        break;
      case 44:
        int64_t v15 = 2;
        break;
      case 47:
        if (v7)
        {
LABEL_43:
          int64_t v15 = 3;
        }
        else
        {
          int v22 = [(PUOneUpBarsController *)self browsingSession];
          uint64_t v23 = [v22 viewModel];
          if ([v23 isInSelectionMode]) {
            int64_t v15 = 4;
          }
          else {
            int64_t v15 = 1;
          }
        }
        break;
      default:
        goto LABEL_40;
    }
  }
  else
  {
LABEL_40:
    int64_t v15 = 0;
  }

  return v15;
}

- (int64_t)_scrubberType
{
  uint64_t v3 = [(PUOneUpBarsController *)self browsingSession];
  uint64_t v4 = [v3 viewModel];

  uint64_t v5 = [v4 contentPrivacyState];
  int64_t v6 = 0;
  if ([(PUOneUpBarsController *)self shouldShowScrubber] && v5 != 1)
  {
    BOOL v7 = +[PUOneUpSettings sharedInstance];
    int v8 = [v7 allowScrubber];

    if (!v8) {
      goto LABEL_7;
    }
    if ([(PUOneUpBarsController *)self _canShowCommentsForCurrentAsset]) {
      goto LABEL_7;
    }
    BOOL v9 = [(PUOneUpBarsController *)self browsingSession];
    BOOL v10 = [v9 viewModel];
    int v11 = [v10 assetsDataSource];
    char v12 = [v11 containsMultipleAssets];

    if (v12)
    {
      int64_t v6 = 1;
    }
    else
    {
LABEL_7:
      uint64_t v13 = [v4 currentAssetReference];
      char v14 = [v4 assetViewModelForAssetReference:v13];
      int64_t v15 = [v14 asset];
      uint64_t v16 = [v15 playbackStyle];

      long long v17 = [v14 videoPlayer];
      int v18 = v17;
      if (v16 == 4
        && (([v17 isPlaybackDesired] & 1) != 0 || objc_msgSend(v18, "isActivated")))
      {
        int64_t v6 = 2;
      }
      else
      {
        int64_t v6 = 0;
      }
    }
  }

  return v6;
}

- (BOOL)_shouldShowDoneEditingButton
{
  uint64_t v2 = [(PUOneUpBarsController *)self browsingSession];
  uint64_t v3 = [v2 viewModel];

  uint64_t v4 = [v3 assetViewModelForCurrentAssetReference];
  if ([v4 isInEditMode]) {
    BOOL v5 = [v4 editStyle] == 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_canShowCommentsForCurrentAsset
{
  uint64_t v3 = [(PUOneUpBarsController *)self browsingSession];
  uint64_t v4 = [v3 viewModel];
  BOOL v5 = [v4 currentAssetReference];

  int64_t v6 = [v5 asset];
  if (self->_delegateFlags.respondsToCanShowCommentsForAsset)
  {
    BOOL v7 = [(PUOneUpBarsController *)self delegate];
    char v8 = [v7 oneUpBarsController:self canShowCommentsForAsset:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_physicalDeviceIsIPad
{
  uint64_t v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (BOOL)_wantsChromeVisible
{
  BOOL v3 = [(PUOneUpBarsController *)self browsingSession];
  uint64_t v4 = [v3 viewModel];
  if ([v4 isChromeVisible]) {
    BOOL v5 = ![(PUOneUpBarsController *)self disableShowingNavigationBars];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)subtitle
{
  uint64_t v2 = [(PUOneUpBarsController *)self _titleViewController];
  BOOL v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (NSString)title
{
  uint64_t v2 = [(PUOneUpBarsController *)self _titleViewController];
  BOOL v3 = [v2 title];

  return (NSString *)v3;
}

- (int64_t)preferredBarStyle
{
  uint64_t v2 = +[PUInterfaceManager currentTheme];
  int64_t v3 = [v2 photoBrowserBarStyle];

  return v3;
}

- (BOOL)wantsToolbarVisible
{
  if ([(PUOneUpBarsController *)self _wantsChromeVisible])
  {
    int64_t v3 = [(PUOneUpBarsController *)self browsingSession];
    uint64_t v4 = [v3 viewModel];

    BOOL v5 = [v4 assetViewModelForCurrentAssetReference];
    if ([v5 isAccessoryViewVisible])
    {
      int64_t v6 = [v5 assetReference];
      if (v6 && self->_delegateFlags.respondsToShouldHideToolbarWhenShowingAccessoryViewForAssetReference)
      {
        BOOL v7 = [(PUOneUpBarsController *)self delegate];
        int v8 = [v7 oneUpBarsController:self shouldHideToolbarWhenShowingAccessoryViewForAssetReference:v6] ^ 1;
      }
      else
      {
        LOBYTE(v8) = 1;
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (id)currentAssetByAssetCollection
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PUOneUpBarsController *)self browsingSession];
  int64_t v3 = [v2 viewModel];
  uint64_t v4 = [v3 currentAssetReference];

  BOOL v5 = [v4 assetCollection];
  if (v5)
  {
    int64_t v6 = [v4 asset];
    if (v6)
    {
      BOOL v7 = [v4 assetCollection];
      uint64_t v13 = v7;
      int v8 = [v4 asset];
      char v12 = v8;
      BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
      v14[0] = v9;
      BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)wantsNavigationBarVisible
{
  if ([(PUOneUpBarsController *)self _wantsChromeVisible])
  {
    int64_t v3 = [(PUOneUpBarsController *)self browsingSession];
    uint64_t v4 = [v3 viewModel];

    BOOL v5 = [v4 assetViewModelForCurrentAssetReference];
    if ([v5 isAccessoryViewVisible])
    {
      int64_t v6 = [v5 assetReference];
      if (v6 && self->_delegateFlags.respondsToShouldHideNavigationBarWhenShowingAccessoryViewForAssetReference)
      {
        BOOL v7 = [(PUOneUpBarsController *)self delegate];
        int v8 = [v7 oneUpBarsController:self shouldHideNavigationBarWhenShowingAccessoryViewForAssetReference:v6] ^ 1;
      }
      else
      {
        LOBYTE(v8) = 1;
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)prefersStatusBarHidden
{
  int64_t v3 = [(PUOneUpBarsController *)self browsingSession];
  uint64_t v4 = [v3 viewModel];
  BOOL v5 = [v4 currentAssetReference];

  if ([(PUOneUpBarsController *)self _wantsChromeVisible])
  {
    int64_t v6 = +[PUOneUpSettings sharedInstance];
    int v7 = [v6 allowStatusBar] ^ 1;

    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    int v7 = 1;
    if (!v5) {
      goto LABEL_8;
    }
  }
  if (self->_delegateFlags.respondsToShouldHideStatusBarWhenShowingAccessoryViewForAssetReference)
  {
    int v8 = [(PUOneUpBarsController *)self delegate];
    int v9 = [v8 oneUpBarsController:self shouldHideStatusBarWhenShowingAccessoryViewForAssetReference:v5] ^ 1;

    if (((v7 | v9) & 1) == 0)
    {
      BOOL v10 = [(PUOneUpBarsController *)self browsingSession];
      int v11 = [v10 viewModel];

      char v12 = [v11 assetViewModelForCurrentAssetReference];
      LOBYTE(v7) = [v12 isAccessoryViewVisible];
    }
  }
LABEL_8:

  return v7;
}

- (BOOL)shouldTapBeginAtLocationFromProvider:(id)a3
{
  if (!self->_delegateFlags.respondsToShouldTapBeginAtLocationFromProvider) {
    return 1;
  }
  int64_t v3 = self;
  id v4 = a3;
  BOOL v5 = [(PUOneUpBarsController *)v3 delegate];
  LOBYTE(v3) = [v5 oneUpBarsController:v3 shouldTapBeginAtLocationFromProvider:v4];

  return (char)v3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  [(PUBarsController *)self updateIfNeeded];
  return [(PUOneUpBarsController *)self _tapGestureRecognizer];
}

- (void)updateContentGuideInsets
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  v130.receiver = self;
  v130.super_class = (Class)PUOneUpBarsController;
  [(PUBarsController *)&v130 updateContentGuideInsets];
  int64_t v3 = PLOneUpGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = self;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEBUG, "Updating content guide insets for %@", buf, 0xCu);
  }

  [(PUBarsController *)self contentGuideInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  char v12 = [(PUBarsController *)self viewController];
  if ([v12 isViewLoaded])
  {
    uint64_t v13 = [v12 view];
    char v14 = (double *)MEMORY[0x1E4FB2848];
    double v15 = *MEMORY[0x1E4FB2848];
    uint64_t v16 = [v12 navigationController];
    long long v17 = [v16 navigationBar];
    int v18 = [v17 window];

    if (v18)
    {
      if ([v17 barStyle] == 4)
      {
        [v17 frame];
      }
      else
      {
        [v17 bounds];
        objc_msgSend(v13, "convertRect:fromView:", v17);
      }
      double MaxY = CGRectGetMaxY(*(CGRect *)&v19);
      [v13 bounds];
      double v37 = MaxY - CGRectGetMinY(v134);
      uint64_t v23 = PLOneUpGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v37;
        _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_DEBUG, "\t topBarHeight: %f", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v24 = [v23 statusBarOrientation];
      BOOL v25 = PLOneUpGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v26 = [NSNumber numberWithInteger:v24];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v26;
        _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_DEBUG, "\t interfaceOrientation: %@", buf, 0xCu);

        char v14 = (double *)MEMORY[0x1E4FB2848];
      }

      double v27 = 0.0;
      if (([v16 prefersStatusBarHidden] & 1) == 0)
      {
        id v28 = [v13 window];
        id v29 = [v28 windowScene];
        BOOL v30 = [v29 statusBarManager];
        [v30 statusBarFrame];
        double v32 = v31;

        v33 = PLOneUpGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&uint8_t buf[4] = v32;
          _os_log_impl(&dword_1AE9F8000, v33, OS_LOG_TYPE_DEBUG, "\t statusBarHeight: %f", buf, 0xCu);
        }

        double v27 = v32 + 0.0;
        char v14 = (double *)MEMORY[0x1E4FB2848];
      }
      [MEMORY[0x1E4FB19D0] defaultSizeForOrientation:v24];
      double v35 = v34;
      BOOL v36 = PLOneUpGetLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)&uint8_t buf[4] = v35;
        _os_log_impl(&dword_1AE9F8000, v36, OS_LOG_TYPE_DEBUG, "\t statusBarHeight: %f", buf, 0xCu);
      }

      double v37 = v27 + v35;
      [v13 safeAreaInsets];
      if (v37 < v38) {
        double v37 = v38;
      }
    }
    double v40 = v14[2];

    if (v15 >= v37) {
      double v5 = v15;
    }
    else {
      double v5 = v37;
    }
    id v41 = [v16 toolbar];
    if ([(PUOneUpBarsController *)self wantsToolbarVisible])
    {
      id v42 = [v41 window];
      id v43 = [v13 window];

      if (v42 == v43)
      {
        [v41 bounds];
        objc_msgSend(v13, "convertRect:fromView:", v41);
        CGFloat v49 = v48;
        CGFloat v51 = v50;
        CGFloat v53 = v52;
        double v54 = v5;
        CGFloat v56 = v55;
        [v13 bounds];
        double v58 = v57;
        v135.origin.CGFloat x = v49;
        v135.origin.CGFloat y = v51;
        v135.size.CGFloat width = v53;
        v135.size.CGFloat height = v56;
        double v5 = v54;
        double v9 = v58 - CGRectGetMinY(v135);
      }
      else
      {
        double v9 = v40;
        if (v41)
        {
          objc_msgSend(v41, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
          double v45 = v44;
          uint64_t v46 = PLOneUpGetLog();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(double *)&uint8_t buf[4] = v45;
            _os_log_impl(&dword_1AE9F8000, v46, OS_LOG_TYPE_DEBUG, "\t toolbarHeight: %f", buf, 0xCu);
          }

          if (v40 >= v45) {
            double v9 = v40;
          }
          else {
            double v9 = v45;
          }
        }
      }
    }
    else
    {
      [v13 safeAreaInsets];
      double v9 = v47;
    }
    double v7 = v14[1];
    double v11 = v14[3];
    if ([(PUOneUpBarsController *)self disableShowingNavigationBars])
    {
      id v59 = [(PUOneUpBarsController *)self browsingSession];
      id v60 = [v59 viewModel];
      uint64_t v61 = [v60 reviewScreenBarsModel];

      if (v61)
      {
        double v105 = v7;
        double v106 = v40;
        double v107 = v11;
        double v110 = v15;
        [v13 bounds];
        double v63 = v62;
        double v65 = v64;
        double v67 = v66;
        double v69 = v68;
        UIRectGetCenter();
        double v104 = v70;
        double v72 = v71;
        v73 = [v13 window];
        uint64_t v74 = [v73 _windowInterfaceOrientation];

        if (v74)
        {
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          +[PUReviewScreenUtilities reviewScreenTopBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenTopBarGeometryForReferenceBounds:withOrientation:", v74, v63, v65, v67, v69);
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          +[PUReviewScreenUtilities reviewScreenControlBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenControlBarGeometryForReferenceBounds:withOrientation:", v74, v63, v65, v67, v69);
          long long v116 = 0u;
          long long v117 = 0u;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          double v108 = v69;
          double v109 = v67;
          +[PUReviewScreenUtilities reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:](PUReviewScreenUtilities, "reviewScreenScrubberBarGeometryForReferenceBounds:withOrientation:safeAreaInsets:", v74, v63, v65, v67, v69, v5, v7, v9, v107);
          unint64_t v75 = 0;
          *(_OWORD *)buf = 0u;
          memset(v132, 0, sizeof(v132));
          do
          {
            long long v76 = &buf[v75];
            CGFloat v78 = *(double *)&buf[v75];
            CGFloat v77 = *(double *)&buf[v75 + 8];
            CGFloat v79 = *(double *)&buf[v75 + 16];
            CGFloat v80 = *((double *)&v132[v75 / 0x10] + 1);
            v136.origin.CGFloat x = v78;
            v136.origin.CGFloat y = v77;
            v136.size.CGFloat width = v79;
            v136.size.CGFloat height = v80;
            if (!CGRectIsEmpty(v136))
            {
              long long v81 = *((_OWORD *)v76 + 4);
              *(_OWORD *)&v111.a = *((_OWORD *)v76 + 3);
              *(_OWORD *)&v111.c = v81;
              *(_OWORD *)&v111.tCGFloat x = *((_OWORD *)v76 + 5);
              CGFloat v82 = v78;
              *(CGFloat *)&long long v81 = v77;
              CGFloat v83 = v79;
              CGFloat v84 = v80;
              CGRectApplyAffineTransform(*(CGRect *)((char *)&v81 - 8), &v111);
              UIRectCenteredAboutPoint();
              CGFloat x = v137.origin.x;
              CGFloat y = v137.origin.y;
              CGFloat width = v137.size.width;
              CGFloat height = v137.size.height;
              double MinX = CGRectGetMinX(v137);
              v138.origin.CGFloat x = x;
              v138.origin.CGFloat y = y;
              v138.size.CGFloat width = width;
              v138.size.CGFloat height = height;
              double MaxX = CGRectGetMaxX(v138);
              v139.origin.CGFloat x = x;
              v139.origin.CGFloat y = y;
              v139.size.CGFloat width = width;
              v139.size.CGFloat height = height;
              double MinY = CGRectGetMinY(v139);
              v140.origin.CGFloat x = x;
              v140.origin.CGFloat y = y;
              v140.size.CGFloat width = width;
              v140.size.CGFloat height = height;
              double v92 = CGRectGetMaxY(v140);
              if (MinY < v72 && v92 < v72)
              {
                double v110 = v92;
              }
              else if (MinY <= v72 || v92 <= v72)
              {
                if (MinX < v104 && MaxX < v104)
                {
                  double v105 = MaxX;
                }
                else
                {
                  BOOL v96 = MaxX <= v104 || MinX <= v104;
                  double v97 = v107;
                  if (!v96) {
                    double v97 = v109 - MinX;
                  }
                  double v107 = v97;
                }
              }
              else
              {
                double v106 = v108 - MinY;
              }
            }
            v75 += 96;
          }
          while (v75 != 288);
          double v5 = v110;
          double v9 = v106;
          double v11 = v107;
          double v7 = v105;
        }
        else
        {
          [(PUBarsController *)self contentGuideInsets];
          double v5 = v98;
          double v7 = v99;
          double v9 = v100;
          double v11 = v101;
        }
      }
    }
  }
  v102 = PLOneUpGetLog();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
  {
    v141.top = v5;
    v141.left = v7;
    v141.bottom = v9;
    v141.right = v11;
    v103 = NSStringFromUIEdgeInsets(v141);
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v103;
    _os_log_impl(&dword_1AE9F8000, v102, OS_LOG_TYPE_DEBUG, "\t contentGuideInsets: %@", buf, 0xCu);
  }
  -[PUBarsController setContentGuideInsets:](self, "setContentGuideInsets:", v5, v7, v9, v11);
}

- (void)updateGestureRecognizersWithHostingView:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUOneUpBarsController;
  [(PUBarsController *)&v12 updateGestureRecognizersWithHostingView:v4];
  double v5 = [(PUOneUpBarsController *)self _tapGestureRecognizer];
  double v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapGestureRecognizer_];
      [(PUOneUpBarsController *)self _setTapGestureRecognizer:v6];
      double v7 = [(PUOneUpBarsController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        double v8 = [v7 barsController:self delegateForGestureRecognizer:v6];
      }
      else
      {
        double v8 = 0;
      }
      [v6 setDelegate:v8];
    }
    id v10 = [v6 view];

    if (v10 != v4)
    {
      double v11 = [v6 view];
      [v11 removeGestureRecognizer:v6];

      [v4 addGestureRecognizer:v6];
    }
  }
  else if (v5)
  {
    double v9 = [v5 view];
    [v9 removeGestureRecognizer:v6];

    [(PUOneUpBarsController *)self _setTapGestureRecognizer:0];
  }
}

- (void)_updateAddToLibraryBarButtonItem
{
  int64_t v3 = [MEMORY[0x1E4F90068] sharedInstance];
  char v4 = [v3 disableOneUpDescriptiveAdd];

  if ((v4 & 1) == 0)
  {
    double v5 = [(PUOneUpBarsController *)self browsingSession];
    id v11 = [v5 viewModel];

    double v6 = [v11 currentAssetReference];
    double v7 = [v11 assetViewModelForAssetReference:v6];

    if (v7)
    {
      unint64_t v8 = [v7 importState];
      if (v8 > 4)
      {
        double v9 = 0;
      }
      else
      {
        double v9 = PULocalizedString(*(&off_1E5F278E8 + v8));
      }
      id v10 = [(PUOneUpBarsController *)self _activeBarButtonItemForIdentifier:33];
      [v10 setTitle:v9];
    }
  }
}

- (void)_updateSyndicationSaveBarButtonItem
{
  int64_t v3 = [(PUOneUpBarsController *)self browsingSession];
  id v16 = [v3 viewModel];

  char v4 = [(PUOneUpBarsController *)self browsingSession];
  double v5 = [v4 viewModel];
  double v6 = [v5 currentAssetReference];

  double v7 = [v16 assetViewModelForAssetReference:v6];
  if (v7)
  {
    unint64_t v8 = [(PUOneUpBarsController *)self _activeBarButtonItemForIdentifier:39];
    double v9 = [v7 asset];
    uint64_t v10 = [v9 mediaType];
    id v11 = @"ITEM";
    if (v10 == 1) {
      id v11 = @"PHOTO";
    }
    if (v10 == 2) {
      id v11 = @"VIDEO";
    }
    objc_super v12 = v11;

    uint64_t v13 = [v7 fetchAssetSyndicationState];
    if ((unint64_t)(v13 - 2) > 2)
    {
      double v15 = &stru_1F06BE7B8;
    }
    else
    {
      char v14 = [(__CFString *)off_1E5F2ED80[v13 - 2] stringByAppendingString:v12];
      PULocalizedString(v14);
      double v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v8 setTitle:v15];
    [v8 setEnabled:v13 == 2];
  }
}

- (void)_updateFavoriteBarButtonItem
{
  int64_t v3 = [(PUOneUpBarsController *)self browsingSession];
  id v15 = [v3 viewModel];

  char v4 = [v15 currentAssetReference];
  double v5 = [v15 assetViewModelForAssetReference:v4];
  double v6 = v5;
  if (v5)
  {
    if ([v5 isFavorite]) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = 9;
    }
    unint64_t v8 = [(PUOneUpBarsController *)self _barButtonItemForIdentifier:v7 location:[(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:7]];
    double v9 = [(PUOneUpBarsController *)self _activeBarButtonItemForIdentifier:7];
    uint64_t v10 = [v8 image];
    id v11 = [v9 image];

    if (v10 != v11)
    {
      objc_super v12 = [v8 image];
      [v9 setImage:v12];

      uint64_t v13 = [v8 landscapeImagePhone];
      [v9 setLandscapeImagePhone:v13];

      char v14 = [v8 title];
      [v9 setTitle:v14];
    }
  }
}

- (void)_updateActionsBarButtonItem
{
  id v4 = [(PUOneUpBarsController *)self _barButtonItemForIdentifier:50 location:[(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:50]];
  if (self->_presentedTipID)
  {
    [v4 setTarget:self];
    [v4 setAction:sel_barButtonItemTapped_];
    [v4 setMenu:0];
  }
  else
  {
    [v4 setTarget:0];
    [v4 setAction:0];
    int64_t v3 = [(PUOneUpBarsController *)self _actionsMenu];
    [v4 setMenu:v3];
  }
}

- (id)_actionsMenu
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x1E4FB16B8];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __37__PUOneUpBarsController__actionsMenu__block_invoke;
  id v11 = &unk_1E5F29218;
  objc_copyWeak(&v12, &location);
  int64_t v3 = [v2 elementWithUncachedProvider:&v8];
  id v4 = (void *)MEMORY[0x1E4FB1970];
  v14[0] = v3;
  double v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  double v6 = [v4 menuWithChildren:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __37__PUOneUpBarsController__actionsMenu__block_invoke(uint64_t a1, void (**a2)(void, void))
{
  int64_t v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained _documentMenuActions];
  double v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  a2[2](v4, v7);
}

- (id)_actionsMenuElements
{
  void v10[3] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PUOneUpBarsController *)self delegate];
  id v4 = [v3 oneUpBarsControllerAssetActionManager:self];

  uint64_t v5 = (void *)MEMORY[0x1E4F8FFC0];
  uint64_t v6 = *MEMORY[0x1E4F90DD0];
  v10[0] = *MEMORY[0x1E4F90D70];
  v10[1] = v6;
  v10[2] = *MEMORY[0x1E4F90DC0];
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  uint64_t v8 = [v5 menuElementsForActionManager:v4 excludedActionTypes:v7];

  return v8;
}

- (id)_documentMenuActions
{
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__46132;
  uint64_t v20 = __Block_byref_object_dispose__46133;
  id v21 = (id)MEMORY[0x1E4F1CBF0];
  int64_t v3 = [(PUOneUpBarsController *)self browsingSession];
  id v4 = [v3 viewModel];
  uint64_t v5 = [v4 currentAssetReference];
  uint64_t v6 = [v5 asset];
  uint64_t v7 = [v5 assetCollection];
  uint64_t v8 = [v3 actionManager];
  int v9 = [v8 canPerformActionType:63 onAsset:v6 inAssetCollection:v7];

  if (v9)
  {
    objc_initWeak(&location, self);
    uint64_t v10 = [(PUOneUpBarsController *)self actionsController];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__PUOneUpBarsController__documentMenuActions__block_invoke;
    v13[3] = &unk_1E5F27858;
    v13[4] = &v16;
    objc_copyWeak(&v14, &location);
    [v10 performSimpleActionWithActionType:63 completionHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

void __45__PUOneUpBarsController__documentMenuActions__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v3 = [WeakRetained _actionsMenuElements];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (void)updateBars
{
  v194[10] = *MEMORY[0x1E4F143B8];
  v192.receiver = self;
  v192.super_class = (Class)PUOneUpBarsController;
  [(PUBarsController *)&v192 updateBars];
  v167 = +[PUOneUpSettings sharedInstance];
  uint64_t v3 = [(PUOneUpBarsController *)self browsingSession];
  uint64_t v4 = [v3 viewModel];

  uint64_t v5 = [v4 currentAssetReference];
  uint64_t v6 = [v4 assetViewModelForAssetReference:v5];
  uint64_t v7 = [v5 asset];
  v161 = v5;
  uint64_t v8 = [v5 assetCollection];
  uint64_t v9 = [v4 contentPrivacyState];
  [(PUOneUpBarsController *)self _updateTitleIfNeeded];
  v165 = [(PUOneUpBarsController *)self _title];
  uint64_t v10 = [(PUOneUpBarsController *)self _titleViewController];
  v164 = [v10 view];

  id v11 = [(PUOneUpBarsController *)self browsingSession];
  id v12 = [v11 actionManager];

  v170 = [(PUOneUpBarsController *)self currentAssetByAssetCollection];
  v173 = [(PUBarsController *)self viewController];
  [(PUOneUpBarsController *)self _updateCommentsTitleIfNeeded];
  [(PUOneUpBarsController *)self _updateFileSizeButtonTitleIfNeeded];
  [(PUOneUpBarsController *)self _updateFileSizeButtonMenuIfNeeded];
  BOOL v162 = [(PUOneUpBarsController *)self shouldShowProgrammaticNavBackButton];
  BOOL v160 = [(PUOneUpBarsController *)self shouldShowTitleView];
  int v13 = [v6 isInEditMode];
  if (v9 == 1) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  BOOL v15 = [(PUOneUpBarsController *)self _canShowCommentsForCurrentAsset];
  BOOL v156 = [(PUOneUpBarsController *)self allowShowingPlayPauseButton];
  BOOL v159 = [(PUOneUpBarsController *)self _shouldShowDoneEditingButton];
  v169 = v4;
  int v172 = [v4 isInSelectionMode];
  BOOL v16 = [(PUOneUpBarsController *)self wantsAllPhotosButton];
  int64_t v155 = [(PUOneUpBarsController *)self style];
  [(PUOneUpBarsController *)self _resetIdentifierIndexes];
  int v17 = v14;
  uint64_t v168 = v9;
  if (v14 == 1)
  {
    if (v9 == 1) {
      goto LABEL_13;
    }
    int64_t v18 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:17];
    int64_t v19 = v18;
    if (v18 && v18 != 3)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:658 description:@"The cancel item can only be in the left navigation bar"];

      uint64_t v9 = v168;
    }
    id v21 = self;
    uint64_t v22 = 17;
    int64_t v23 = v19;
    uint64_t v24 = 1;
  }
  else
  {
    if (!v16) {
      goto LABEL_13;
    }
    uint64_t v25 = [v12 shouldEnableActionType:40 onAllAssetsByAssetCollection:v170];
    int64_t v23 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:11];
    id v21 = self;
    uint64_t v22 = 11;
    uint64_t v24 = v25;
  }
  [(PUOneUpBarsController *)v21 _updateIdentifiersIndexesWithIdentifier:v22 location:v23 shouldEnable:v24];
LABEL_13:
  BOOL v26 = v15;
  int v27 = [v12 canPerformAction:13 onAllAssetsByAssetCollection:v170];
  int v28 = [v12 canPerformAction:11 onAllAssetsByAssetCollection:v170];
  int v29 = [v12 canPerformActionType:32 onAsset:v7 inAssetCollection:v8];
  if (v7) {
    BOOL v30 = v8 == 0;
  }
  else {
    BOOL v30 = 1;
  }
  if (v30) {
    char v31 = 1;
  }
  else {
    char v31 = v17;
  }
  v166 = v6;
  v171 = v7;
  v174 = v8;
  if (v31) {
    goto LABEL_136;
  }
  HIDWORD(v150) = v17;
  int v157 = v27;
  int v158 = v28;
  int v32 = (v28 | v172) ^ 1;
  v33 = v8;
  int v34 = v29 & ~v27;
  int v35 = [v12 canPerformActionType:4 onAsset:v7 inAssetCollection:v33];
  if (v35)
  {
    int64_t v36 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:48];
    if (v36) {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 48, v36, [v12 shouldEnableActionType:4 onAllAssetsByAssetCollection:v170]);
    }
  }
  int v37 = v34 & v32;
  int v38 = [v12 canPerformActionType:6 onAsset:v7 inAssetCollection:v174];
  BOOL v39 = v26;
  if (v38)
  {
    int64_t v40 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:49];
    if (v40) {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 49, v40, [v12 shouldEnableActionType:6 onAllAssetsByAssetCollection:v170]);
    }
  }
  id v41 = [v169 assetSharedViewModelForAsset:v7];
  id v42 = +[PUPhotoEditProtoSettings sharedInstance];
  if ([v42 enableLiveVideoRender]) {
    int v43 = 1;
  }
  else {
    int v43 = [v41 needsDeferredProcessing] ^ 1;
  }
  LODWORD(v150) = v43;

  if (v37)
  {
    int64_t v44 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:6];
    if (v44) {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 6, v44, [v12 shouldEnableActionType:32 onAsset:v7 inAssetCollection:v174]);
    }
  }
  v153 = v41;
  if (objc_msgSend(v12, "canPerformActionType:onAsset:inAssetCollection:", 57, v7, v174, v150))
  {
    if ([MEMORY[0x1E4F8FF98] isAppInstalled:1])
    {
      int64_t v45 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:41];
      if (v45) {
        -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 41, v45, [v12 shouldEnableActionType:57 onAsset:v7 inAssetCollection:v174]);
      }
    }
  }
  if ((([v12 canPerformActionType:34 onAsset:v7 inAssetCollection:v174] ^ 1 | v157 | v158) & 1) == 0)
  {
    int64_t v46 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:16];
    if (v46) {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 16, v46, [v12 shouldEnableActionType:34 onAsset:v7 inAssetCollection:v174]);
    }
  }
  int v47 = [v12 canPerformActionType:63 onAsset:v7 inAssetCollection:v174];
  double v48 = [(PUOneUpBarsController *)self delegate];
  int v49 = [v48 oneUpBarsControllerWantsActionsMenu:self];

  if ((v49 & v37) == 1 && v47)
  {
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 50, -[PUOneUpBarsController _locationForBarButtonItemWithIdentifier:](self, "_locationForBarButtonItemWithIdentifier:", 50), [v12 shouldEnableActionType:63 onAsset:v171 inAssetCollection:v174]);
    [(PUOneUpBarsController *)self _updateActionsBarButtonItem];
  }
  int v50 = v35 | v38;
  if (v155 == 1) {
    goto LABEL_50;
  }
  if ((([v12 canPerformActionType:15 onAsset:v171 inAssetCollection:v174] ^ 1 | v157 | v158) & 1) == 0)
  {
    int64_t v51 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:1];
    if (v51) {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 1, v51, [v12 shouldEnableActionType:15 onAsset:v171 inAssetCollection:v174]);
    }
  }
  if (![v12 canPerformActionType:54 onAsset:v171 inAssetCollection:v174])
  {
LABEL_50:
    int v53 = 0;
  }
  else
  {
    int64_t v52 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:39];
    if (v52) {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 39, v52, [v12 shouldEnableActionType:54 onAllAssetsByAssetCollection:v170]);
    }
    int v53 = 1;
  }
  if (((v50 | v26 | v172) & 1) == 0)
  {
    if (self->_delegateFlags.respondsToIsDetailsAccessoryAvailableForAssetReference)
    {
      double v54 = [(PUOneUpBarsController *)self delegate];
      int v55 = [v54 oneUpBarsController:self isDetailsAccessoryAvailableForAssetReference:v161];
    }
    else
    {
      int v55 = 0;
    }
    CGFloat v56 = +[PUOneUpSettings sharedInstance];
    int v57 = [v56 allowsDetailsToggleButtonInBars];

    if (v57)
    {
      if (v55
        && (!v53 || [(PUOneUpBarsController *)self shouldPlaceButtonsInNavigationBar]))
      {
        int64_t v58 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:38];
        if (v58)
        {
          [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:38 location:v58 shouldEnable:1];
          id v59 = [(PUOneUpBarsController *)self detailsBarButtonController];
          [v59 update];
        }
      }
    }
  }
  uint64_t v8 = v174;
  if ([v12 canPerformActionType:62 onAsset:v171 inAssetCollection:v174])
  {
    int64_t v60 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:47];
    int v61 = v157;
    if (v60)
    {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 47, v60, [v12 shouldEnableActionType:62 onAsset:v171 inAssetCollection:v174]);
      double v62 = [(PUOneUpBarsController *)self _activeBarButtonItemForIdentifier:47];
      double v63 = [(PUOneUpBarsController *)self _localizedTitleForMergeDuplicatesBarButtonItem];
      [v62 setTitle:v63];
    }
    int v64 = v152;
    if ((v172 & 1) == 0)
    {
      int64_t v65 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:45];
      if (v65)
      {
        int64_t v66 = v65;
        double v67 = self;
        uint64_t v68 = 45;
LABEL_70:
        [(PUOneUpBarsController *)v67 _updateIdentifiersIndexesWithIdentifier:v68 location:v66 shouldEnable:1];
        goto LABEL_71;
      }
      goto LABEL_71;
    }
  }
  else
  {
    int v61 = v157;
    int v64 = v152;
    if (!v172) {
      goto LABEL_71;
    }
  }
  int64_t v69 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:46];
  if (v69)
  {
    int64_t v66 = v69;
    double v67 = self;
    uint64_t v68 = 46;
    goto LABEL_70;
  }
LABEL_71:
  if (v155 != 1
    && ((v50 | [v12 canPerformActionType:41 onAsset:v171 inAssetCollection:v174] ^ 1 | v172) & 1) == 0)
  {
    int64_t v70 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:7];
    if (v70) {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 7, v70, [v12 shouldEnableActionType:41 onAsset:v171 inAssetCollection:v174]);
    }
  }
  uint64_t v7 = v171;
  if ([v167 showGainMapButton])
  {
    int64_t v71 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:34];
    if (v71) {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 34, v71, ((unint64_t)[v171 mediaSubtypes] >> 9) & 1);
    }
  }
  if ([(PUOneUpBarsController *)self shouldShowAirPlayButton]
    && [v12 canPerformActionType:35 onAsset:v171 inAssetCollection:v174])
  {
    [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:18 location:[(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:18] shouldEnable:1];
  }
  if (v39)
  {
    double v72 = [v169 currentAssetReference];
    v73 = [v169 assetViewModelForAssetReference:v72];

    if ([v73 isAccessoryViewVisible]) {
      uint64_t v74 = 15;
    }
    else {
      uint64_t v74 = 14;
    }
    int64_t v75 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:v74];
    if ((v75 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      v145 = [MEMORY[0x1E4F28B00] currentHandler];
      [v145 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:859 description:@"The comments item can only be in the toolbar"];
    }
    [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:v74 location:v75 shouldEnable:1];

    long long v76 = [(PUOneUpBarsController *)self _currentAssetDisplayInfoUpdater];
    CGFloat v77 = [v76 info];

    CGFloat v78 = [v77 objectForKeyedSubscript:@"PUCommentsInfoDictionaryKey"];
    CGFloat v79 = [v78 objectForKeyedSubscript:@"PUCommentsInfoHasLikedKey"];
    int v80 = [v79 BOOLValue];

    if (v80) {
      uint64_t v81 = 20;
    }
    else {
      uint64_t v81 = 19;
    }
    int64_t v82 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:v81];
    if ((v82 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      v146 = [MEMORY[0x1E4F28B00] currentHandler];
      [v146 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:870 description:@"The like item can only be in the toolbar"];
    }
    [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:v81 location:v82 shouldEnable:1];

    uint64_t v7 = v171;
    uint64_t v8 = v174;
  }
  if ((v172 & 1) == 0)
  {
    int v83 = [v7 conformsToProtocol:&unk_1F090E360];
    CGFloat v84 = [(PUOneUpBarsController *)self delegate];
    v85 = [v84 oneUpBarsControllerAssetActionManager:self];

    if (([v85 canPerformActionType:*MEMORY[0x1E4F90DE0]] & 1) != 0 || v83)
    {
      if ([v85 canPerformActionType:*MEMORY[0x1E4F90C60]])
      {
        int64_t v86 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:3];
        if ((v86 & 0xFFFFFFFFFFFFFFFBLL) != 0)
        {
          v149 = [MEMORY[0x1E4F28B00] currentHandler];
          [v149 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:883 description:@"The delete item can only be in the toolbar"];

          uint64_t v8 = v174;
        }
        uint64_t v87 = v83 ^ 1u;
        id v88 = self;
        uint64_t v89 = 3;
        int64_t v90 = v86;
      }
      else
      {
        int64_t v90 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:2];
        uint64_t v87 = v83 ^ 1u;
        id v88 = self;
        uint64_t v89 = 2;
      }
      [(PUOneUpBarsController *)v88 _updateIdentifiersIndexesWithIdentifier:v89 location:v90 shouldEnable:v87];
    }
  }
  if (v156)
  {
    v91 = [(PUOneUpBarsController *)self _playPauseBarItemsController];
    uint64_t v92 = [v91 playPauseState];

    if (v92 == 2) {
      uint64_t v93 = 12;
    }
    else {
      uint64_t v93 = 13;
    }
    [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:v93 location:[(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:v93] shouldEnable:v151];
  }
  if ([(PUOneUpBarsController *)self shouldShowMuteButton])
  {
    v94 = [MEMORY[0x1E4F908A0] sharedController];
    if ([v94 isMuted]) {
      uint64_t v95 = 36;
    }
    else {
      uint64_t v95 = 35;
    }

    [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:v95 location:[(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:v95] shouldEnable:v151];
  }
  if (v158)
  {
    int64_t v96 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:4];
    int64_t v97 = v96;
    if ((v96 & 0xFFFFFFFFFFFFFFFBLL) != 0)
    {
      v147 = [MEMORY[0x1E4F28B00] currentHandler];
      [v147 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:911 description:@"The recover item can only be in the toolbar"];
    }
    else if (!v96)
    {
      goto LABEL_117;
    }
    -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 4, v97, [v12 shouldEnableActionType:11 onAllAssetsByAssetCollection:v170]);
  }
LABEL_117:
  uint64_t v9 = v168;
  if (!v61) {
    goto LABEL_121;
  }
  int64_t v98 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:5];
  int64_t v99 = v98;
  if ((v98 & 0xFFFFFFFFFFFFFFFBLL) != 0)
  {
    v148 = [MEMORY[0x1E4F28B00] currentHandler];
    [v148 handleFailureInMethod:a2 object:self file:@"PUOneUpBarsController.m" lineNumber:922 description:@"The restore item can only be in the toolbar"];

    uint64_t v9 = v168;
  }
  else if (!v98)
  {
    goto LABEL_121;
  }
  -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 5, v99, [v12 shouldEnableActionType:13 onAllAssetsByAssetCollection:v170]);
LABEL_121:
  if ([(PUOneUpBarsController *)self wantsShowInLibraryButton])
  {
    int64_t v100 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:32];
    if (v100) {
      [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:32 location:v100 shouldEnable:1];
    }
  }
  if ([v12 canPerformActionType:58 onAsset:v7 inAssetCollection:v8])
  {
    int64_t v101 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:42];
    if (v101) {
      [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:42 location:v101 shouldEnable:1];
    }
  }
  if ([v12 canPerformActionType:59 onAsset:v7 inAssetCollection:v8])
  {
    int64_t v102 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:43];
    if (v102) {
      [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:43 location:v102 shouldEnable:1];
    }
  }
  if ([v12 canPerformActionType:60 onAsset:v7 inAssetCollection:v8])
  {
    int64_t v103 = [(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:33];
    if (v103)
    {
      -[PUOneUpBarsController _updateIdentifiersIndexesWithIdentifier:location:shouldEnable:](self, "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", 33, v103, [v12 shouldEnableActionType:60 onAllAssetsByAssetCollection:v170]);
      [(PUOneUpBarsController *)self _updateAddToLibraryBarButtonItem];
    }
  }
  if ([v12 canPerformActionType:53 onAsset:v7 inAssetCollection:v8])
  {
    double v104 = [(PUOneUpBarsController *)self _toolbarButtonItemCollection];
    double v105 = [v104 centeredItemIdentifiers];
    double v106 = (void *)[v105 mutableCopy];

    uint64_t v9 = v168;
    [v106 removeIndex:28];
    [v106 removeIndex:29];
    double v107 = [(PUOneUpBarsController *)self _toolbarButtonItemCollection];
    [v107 setCenteredItemIdentifiers:v106];
  }
  int v17 = v64;
LABEL_136:
  int v108 = v17 ^ 1;
  if (v9 == 1) {
    int v108 = 1;
  }
  if ((v162 & v108) == 1) {
    [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:10 location:[(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:10] shouldEnable:1];
  }
  if (v159) {
    [(PUOneUpBarsController *)self _updateIdentifiersIndexesWithIdentifier:37 location:[(PUOneUpBarsController *)self _locationForBarButtonItemWithIdentifier:37] shouldEnable:1];
  }
  double v109 = [v169 reviewScreenBarsModel];
  if (v109)
  {
    id v110 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  else
  {
    id v110 = 0;
  }
  if ((v17 & 1) == 0)
  {
    v193[0] = &unk_1F078C350;
    v193[1] = &unk_1F078C368;
    v194[0] = &unk_1F078C2A8;
    v194[1] = &unk_1F078C320;
    v193[2] = &unk_1F078C380;
    v193[3] = &unk_1F078C398;
    v194[2] = &unk_1F078C188;
    v194[3] = &unk_1F078C170;
    v193[4] = &unk_1F078C3B0;
    v193[5] = &unk_1F078C3C8;
    v194[4] = &unk_1F078C1A0;
    v194[5] = &unk_1F078C1D0;
    v193[6] = &unk_1F078C3E0;
    v193[7] = &unk_1F078C3F8;
    v194[6] = &unk_1F078C1B8;
    v194[7] = &unk_1F078C1E8;
    v193[8] = &unk_1F078C410;
    v193[9] = &unk_1F078C428;
    v194[8] = &unk_1F078C200;
    v194[9] = &unk_1F078C218;
    CGAffineTransform v111 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v194 forKeys:v193 count:10];
    v186[0] = MEMORY[0x1E4F143A8];
    v186[1] = 3221225472;
    v186[2] = __35__PUOneUpBarsController_updateBars__block_invoke;
    v186[3] = &unk_1E5F277E0;
    id v187 = v12;
    id v188 = v7;
    id v189 = v8;
    v190 = self;
    id v191 = v110;
    [v111 enumerateKeysAndObjectsUsingBlock:v186];
  }
  [(PUOneUpBarsController *)self _updateFavoriteBarButtonItem];
  [(PUOneUpBarsController *)self _updateSyndicationSaveBarButtonItem];
  long long v112 = [(PUOneUpBarsController *)self _toolbarButtonItemCollection];
  long long v113 = [(PUOneUpBarsController *)self _toolbarButtonIdentifiers];
  v163 = [v112 orderedBarButtonsItemsForIdentifiers:v113];

  long long v114 = [(PUOneUpBarsController *)self _rightNavBarButtonItemCollection];
  long long v115 = [(PUOneUpBarsController *)self _rightNavBarButtonIdentifiers];
  long long v116 = [v114 orderedBarButtonsItemsForIdentifiers:v115];

  long long v117 = [(PUOneUpBarsController *)self _leftNavBarButtonItemCollection];
  long long v118 = [(PUOneUpBarsController *)self _leftNavBarButtonIdentifiers];
  long long v119 = [v117 orderedBarButtonsItemsForIdentifiers:v118];

  long long v120 = [v173 navigationItem];
  if (!v160 || v168 == 1)
  {
    [v173 setTitle:0];
    long long v121 = 0;
  }
  else
  {
    [v173 setTitle:v165];
    if (v165) {
      long long v121 = 0;
    }
    else {
      long long v121 = v164;
    }
  }
  [v120 setTitleView:v121];
  id v122 = [v120 leftBarButtonItems];
  id v123 = v119;
  long long v124 = v123;
  if (v122 == v123)
  {
  }
  else
  {
    char v125 = [v122 isEqual:v123];

    if ((v125 & 1) == 0)
    {
      objc_msgSend(v120, "setLeftItemsSupplementBackButton:", objc_msgSend(v124, "count") != 0);
      [v120 setLeftBarButtonItems:v124];
    }
  }
  id v126 = [v120 rightBarButtonItems];
  id v127 = v116;
  long long v128 = v127;
  if (v126 == v127)
  {
  }
  else
  {
    char v129 = [v126 isEqual:v127];

    if ((v129 & 1) == 0) {
      [v120 setRightBarButtonItems:v128];
    }
  }
  objc_super v130 = [(PUOneUpBarsController *)self title];
  [v120 setBackButtonTitle:v130];

  BOOL v131 = 1;
  objc_msgSend(v120, "px_setBackButtonDisplayMode:", 1);
  if ((v172 & 1) == 0)
  {
    if ([v166 isInEditMode]) {
      BOOL v131 = [v166 editStyle] != 0;
    }
    else {
      BOOL v131 = 0;
    }
  }
  [v120 setHidesBackButton:v131];
  [(PUOneUpBarsController *)self _updateScrubberViewIfNeeded];
  v132 = [(PUOneUpBarsController *)self _scrubberView];
  if ([v132 isHidden]) {
    uint64_t v133 = 0;
  }
  else {
    uint64_t v133 = v132;
  }
  id v134 = v133;

  id v135 = v134;
  [v135 topOutset];
  uint64_t v137 = v136;
  [(PUOneUpBarsController *)self maximumToolbarHeight];
  uint64_t v139 = v138;
  [(PUOneUpBarsController *)self maximumAccessoryToolbarHeight];
  uint64_t v141 = v140;
  if (![(PUOneUpBarsController *)self disableShowingNavigationBars])
  {
    v144 = objc_msgSend(v173, "pu_toolbarViewModel");
    v179[0] = MEMORY[0x1E4F143A8];
    v179[1] = 3221225472;
    v179[2] = __35__PUOneUpBarsController_updateBars__block_invoke_2;
    v179[3] = &unk_1E5F27808;
    id v143 = v144;
    id v180 = v143;
    id v181 = v163;
    id v182 = v135;
    uint64_t v183 = v137;
    uint64_t v184 = v141;
    uint64_t v185 = v139;
    [v143 performChanges:v179];

    v142 = v174;
    goto LABEL_172;
  }
  v142 = v174;
  if (v109)
  {
    v175[0] = MEMORY[0x1E4F143A8];
    v175[1] = 3221225472;
    v175[2] = __35__PUOneUpBarsController_updateBars__block_invoke_3;
    v175[3] = &unk_1E5F27830;
    id v176 = v110;
    id v177 = v135;
    v178 = self;
    [v109 performChanges:v175];

    id v143 = v176;
LABEL_172:
  }
}

void __35__PUOneUpBarsController_updateBars__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  uint64_t v5 = [a2 integerValue];
  uint64_t v6 = [v10 integerValue];
  if ([*(id *)(a1 + 32) canPerformActionType:v5 onAsset:*(void *)(a1 + 40) inAssetCollection:*(void *)(a1 + 48)])
  {
    uint64_t v7 = [*(id *)(a1 + 56) _locationForBarButtonItemWithIdentifier:v6];
    if (v7)
    {
      uint64_t v8 = v7;
      objc_msgSend(*(id *)(a1 + 56), "_updateIdentifiersIndexesWithIdentifier:location:shouldEnable:", v6, v7, objc_msgSend(*(id *)(a1 + 32), "shouldEnableActionType:onAsset:inAssetCollection:", v5, *(void *)(a1 + 40), *(void *)(a1 + 48)));
      uint64_t v9 = [*(id *)(a1 + 56) _barButtonItemForIdentifier:v6 location:v8];
      [*(id *)(a1 + 64) setObject:v9 forKeyedSubscript:v10];
    }
  }
}

uint64_t __35__PUOneUpBarsController_updateBars__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setToolbarItems:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setAccessoryView:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setAccessoryViewTopOutset:*(double *)(a1 + 56)];
  [*(id *)(a1 + 32) setAccessoryViewMaximumHeight:*(double *)(a1 + 64)];
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 72);
  return [v2 setMaximumHeight:v3];
}

void __35__PUOneUpBarsController_updateBars__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAvailableItemsByIdentifier:v3];
  [v4 setAccessoryView:*(void *)(a1 + 40)];
  objc_msgSend(v4, "setShouldPlaceScrubberInScrubberBar:", objc_msgSend(*(id *)(a1 + 48), "shouldPlaceScrubberInScrubberBar"));
}

- (void)_updateIdentifiersIndexesWithIdentifier:(int64_t)a3 location:(int64_t)a4 shouldEnable:(BOOL)a5
{
  BOOL v5 = a5;
  switch(a4)
  {
    case 0:
      return;
    case 1:
      uint64_t v8 = [(PUOneUpBarsController *)self _rightNavBarButtonIdentifiers];
      [v8 addIndex:a3];

      uint64_t v9 = [(PUOneUpBarsController *)self _rightNavBarButtonItemCollection];
      goto LABEL_7;
    case 2:
      id v10 = [(PUOneUpBarsController *)self _centerNavBarButtonIdentifiers];
      [v10 addIndex:a3];

      uint64_t v9 = [(PUOneUpBarsController *)self _centerNavBarButtonItemCollection];
      goto LABEL_7;
    case 3:
      id v11 = [(PUOneUpBarsController *)self _leftNavBarButtonIdentifiers];
      [v11 addIndex:a3];

      uint64_t v9 = [(PUOneUpBarsController *)self _leftNavBarButtonItemCollection];
      goto LABEL_7;
    case 4:
      id v12 = [(PUOneUpBarsController *)self _toolbarButtonIdentifiers];
      [v12 addIndex:a3];

      uint64_t v9 = [(PUOneUpBarsController *)self _toolbarButtonItemCollection];
LABEL_7:
      int v13 = v9;
      id v14 = [v9 barButtonItemForIdentifier:a3];

      [v14 setEnabled:v5];
      break;
    default:
      id v14 = 0;
      [0 setEnabled:a5];
      break;
  }
}

- (void)_resetIdentifierIndexes
{
  id v6 = [(PUOneUpBarsController *)self _toolbarButtonIdentifiers];
  uint64_t v3 = [(PUOneUpBarsController *)self _rightNavBarButtonIdentifiers];
  id v4 = [(PUOneUpBarsController *)self _centerNavBarButtonIdentifiers];
  BOOL v5 = [(PUOneUpBarsController *)self _leftNavBarButtonIdentifiers];
  [v6 removeAllIndexes];
  [v3 removeAllIndexes];
  [v4 removeAllIndexes];
  [v5 removeAllIndexes];
}

- (void)invalidateViewControllerView
{
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpBarsController;
  [(PUBarsController *)&v3 invalidateViewControllerView];
  [(PUBarsController *)self invalidateContentGuideInsets];
}

- (void)setPresentedTipID:(id)a3
{
  objc_storeStrong((id *)&self->_presentedTipID, a3);
  [(PUOneUpBarsController *)self _updateActionsBarButtonItem];
}

- (void)setDebuggingObservedImageModulationManager:(id)a3
{
  BOOL v5 = (PXImageModulationManager *)a3;
  debuggingObservedImageModulationManager = self->_debuggingObservedImageModulationManager;
  if (debuggingObservedImageModulationManager != v5)
  {
    uint64_t v7 = v5;
    [(PXImageModulationManager *)debuggingObservedImageModulationManager unregisterChangeObserver:self context:PUDebuggingObservedImageModulationManagerObservationContext];
    objc_storeStrong((id *)&self->_debuggingObservedImageModulationManager, a3);
    [(PXImageModulationManager *)self->_debuggingObservedImageModulationManager registerChangeObserver:self context:PUDebuggingObservedImageModulationManagerObservationContext];
    BOOL v5 = v7;
  }
}

- (void)setShouldShowMuteButton:(BOOL)a3
{
  if (self->_shouldShowMuteButton != a3)
  {
    self->_shouldShowMuteButton = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)setAllowShowingPlayPauseButton:(BOOL)a3
{
  if (self->_allowShowingPlayPauseButton != a3)
  {
    self->_allowShowingPlayPauseButton = a3;
    [(PUBarsController *)self invalidateBars];
    [(PUOneUpBarsController *)self _updateShowingPlayPauseButton];
  }
}

- (void)setAllowTapOnTitle:(BOOL)a3
{
  if (self->_allowTapOnTitle != a3)
  {
    self->_allowTapOnTitle = a3;
    [(PUOneUpBarsController *)self _invalidateTitle];
  }
}

- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3
{
  if (self->_shouldPlaceScrubberInScrubberBar != a3)
  {
    self->_shouldPlaceScrubberInScrubberBar = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)setDisableShowingNavigationBars:(BOOL)a3
{
  if (self->_disableShowingNavigationBars != a3)
  {
    self->_disableShowingNavigationBars = a3;
    [(PUOneUpBarsController *)self _invalidateChromeVisibilityWithAnimationType:0];
  }
}

- (void)setShouldShowScrubber:(BOOL)a3
{
  if (self->_shouldShowScrubber != a3)
  {
    self->_shouldShowScrubber = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)setWantsShowInLibraryButton:(BOOL)a3
{
  if (self->_wantsShowInLibraryButton != a3)
  {
    self->_wantsShowInLibraryButton = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)setShouldShowAirPlayButton:(BOOL)a3
{
  if (self->_shouldShowAirPlayButton != a3)
  {
    self->_shouldShowAirPlayButton = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)setShouldShowProgrammaticNavBackButton:(BOOL)a3
{
  if (self->_shouldShowProgrammaticNavBackButton != a3)
  {
    self->_shouldShowProgrammaticNavBackButton = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)setMaximumAccessoryToolbarHeight:(double)a3
{
  if (self->_maximumAccessoryToolbarHeight != a3)
  {
    self->_maximumAccessoryToolbarHeight = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)setMaximumToolbarHeight:(double)a3
{
  if (self->_maximumToolbarHeight != a3)
  {
    self->_maximumToolbarHeight = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (void)setShouldUseCompactCommentsTitle:(BOOL)a3
{
  if (self->_shouldUseCompactCommentsTitle != a3)
  {
    self->_shouldUseCompactCommentsTitle = a3;
    [(PUOneUpBarsController *)self _invalidateCommentsTitle];
  }
}

- (void)setShouldUseCompactTitleView:(BOOL)a3
{
  if (self->_shouldUseCompactTitleView != a3)
  {
    self->_shouldUseCompactTitleView = a3;
    [(PUOneUpBarsController *)self _invalidateTitle];
  }
}

- (void)setShouldPlaceButtonsInNavigationBar:(BOOL)a3
{
  if (self->_shouldPlaceButtonsInNavigationBar != a3)
  {
    self->_shouldPlaceButtonsInNavigationBar = a3;
    [(PUBarsController *)self invalidateBars];
  }
}

- (PUOneUpBarsControllerDelegate)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpBarsController;
  uint64_t v2 = [(PUBarsController *)&v4 delegate];
  return (PUOneUpBarsControllerDelegate *)v2;
}

- (void)dealloc
{
  [(PUPlayPauseBarItemsController *)self->__playPauseBarItemsController unregisterChangeObserver:self];
  [(PUOneUpBarsController *)self _stopObservingOrientationChanges];
  v3.receiver = self;
  v3.super_class = (Class)PUOneUpBarsController;
  [(PUOneUpBarsController *)&v3 dealloc];
}

- (void)_initializeBarButtonItemCollections
{
  if ([(PUOneUpBarsController *)self style] == 3)
  {
    uint64_t v3 = 5;
  }
  else if ([(PUOneUpBarsController *)self style] == 1)
  {
    if ([(PUOneUpBarsController *)self _physicalDeviceIsIPad]) {
      uint64_t v3 = 5;
    }
    else {
      uint64_t v3 = 3;
    }
  }
  else
  {
    uint64_t v3 = 3;
  }
  p_superclass = &OBJC_METACLASS___PUWrappingPXMediaProvider.superclass;
  BOOL v5 = [[PUBarButtonItemCollection alloc] initWithOptions:v3];
  toolbarButtonItemCollection = self->__toolbarButtonItemCollection;
  self->__toolbarButtonItemCollection = v5;

  [(PUBarButtonItemCollection *)self->__toolbarButtonItemCollection setDataSource:self];
  if ([(PUOneUpBarsController *)self style] == 3)
  {
    uint64_t v7 = (void *)[&unk_1F078AEC8 mutableCopy];
    uint64_t v8 = [&unk_1F078AEC8 indexOfObject:&unk_1F078BF18];
    uint64_t v9 = [&unk_1F078AEC8 indexOfObject:&unk_1F078BF30];
    uint64_t v10 = [&unk_1F078AEC8 indexOfObject:&unk_1F078BFA8];
    uint64_t v11 = [&unk_1F078AEC8 indexOfObject:&unk_1F078BFC0];
    uint64_t v12 = v8;
    p_superclass = (__objc2_class **)(&OBJC_METACLASS___PUWrappingPXMediaProvider + 8);
    [v7 replaceObjectAtIndex:v12 withObject:&unk_1F078BFA8];
    [v7 replaceObjectAtIndex:v9 withObject:&unk_1F078BFC0];
    [v7 replaceObjectAtIndex:v10 withObject:&unk_1F078BF18];
    [v7 replaceObjectAtIndex:v11 withObject:&unk_1F078BF30];
    id v29 = (id)[v7 copy];

    int v13 = v29;
  }
  else
  {
    int v13 = &unk_1F078AEC8;
  }
  id v30 = v13;
  -[PUBarButtonItemCollection setIdentifiersOrder:](self->__toolbarButtonItemCollection, "setIdentifiersOrder:");
  id v14 = [MEMORY[0x1E4F28E60] indexSet];
  [v14 addIndex:14];
  [v14 addIndex:15];
  [v14 addIndex:8];
  [v14 addIndex:9];
  [v14 addIndex:7];
  [v14 addIndex:34];
  [v14 addIndex:24];
  if ([(PUOneUpBarsController *)self style] != 2) {
    [v14 addIndex:33];
  }
  [v14 addIndex:48];
  [v14 addIndex:49];
  [v14 addIndex:28];
  [v14 addIndex:29];
  [v14 addIndex:39];
  if ([(PUOneUpBarsController *)self style] == 1)
  {
    [v14 addIndex:12];
    [v14 addIndex:13];
    [v14 addIndex:35];
  }
  [(PUBarButtonItemCollection *)self->__toolbarButtonItemCollection setCenteredItemIdentifiers:v14];
  BOOL v15 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  toolbarButtonIdentifiers = self->__toolbarButtonIdentifiers;
  self->__toolbarButtonIdentifiers = v15;

  int v17 = (PUBarButtonItemCollection *)[objc_alloc((Class)(p_superclass + 39)) initWithOptions:0];
  rightNavBarButtonItemCollection = self->__rightNavBarButtonItemCollection;
  self->__rightNavBarButtonItemCollection = v17;

  [(PUBarButtonItemCollection *)self->__rightNavBarButtonItemCollection setDataSource:self];
  [(PUBarButtonItemCollection *)self->__rightNavBarButtonItemCollection setIdentifiersOrder:&unk_1F078AEE0];
  int64_t v19 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  rightNavBarButtonIdentifiers = self->__rightNavBarButtonIdentifiers;
  self->__rightNavBarButtonIdentifiers = v19;

  id v21 = (PUBarButtonItemCollection *)[objc_alloc((Class)(p_superclass + 39)) initWithOptions:0];
  centerNavBarButtonItemCollection = self->__centerNavBarButtonItemCollection;
  self->__centerNavBarButtonItemCollection = v21;

  [(PUBarButtonItemCollection *)self->__centerNavBarButtonItemCollection setDataSource:self];
  [(PUBarButtonItemCollection *)self->__centerNavBarButtonItemCollection setIdentifiersOrder:&unk_1F078AEF8];
  int64_t v23 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  centerNavBarButtonIdentifiers = self->__centerNavBarButtonIdentifiers;
  self->__centerNavBarButtonIdentifiers = v23;

  uint64_t v25 = (PUBarButtonItemCollection *)[objc_alloc((Class)(p_superclass + 39)) initWithOptions:0];
  leftNavBarButtonItemCollection = self->__leftNavBarButtonItemCollection;
  self->__leftNavBarButtonItemCollection = v25;

  [(PUBarButtonItemCollection *)self->__leftNavBarButtonItemCollection setDataSource:self];
  [(PUBarButtonItemCollection *)self->__leftNavBarButtonItemCollection setIdentifiersOrder:&unk_1F078AF10];
  int v27 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
  leftNavBarButtonIdentifiers = self->__leftNavBarButtonIdentifiers;
  self->__leftNavBarButtonIdentifiers = v27;
}

- (PUOneUpBarsController)initWithStyle:(int64_t)a3 browsingSession:(id)a4 viewController:(id)a5 actionsController:(id)a6 delegate:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v42.receiver = self;
  v42.super_class = (Class)PUOneUpBarsController;
  BOOL v16 = [(PUBarsController *)&v42 initWithViewController:a5 delegate:v15];
  int v17 = v16;
  if (v16)
  {
    v16->_style = a3;
    p_browsingSession = (id *)&v16->_browsingSession;
    objc_storeStrong((id *)&v16->_browsingSession, a4);
    v17->_delegateFlags.respondsToDidChangeShowingPlayPauseButton = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToDidTapPlayPauseButton = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToDidTapTitle = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToIsDetailsAccessoryAvailableForAssetReference = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToToggleDetailsVisibilitCGFloat y = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToToggleCommentsVisibilitCGFloat y = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToCanShowCommentsForAsset = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToShouldTapBeginAtLocationFromProvider = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToShouldHideToolbarWhenShowingAccessoryViewForAssetReference = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToShouldHideNavigationBarWhenShowingAccessoryViewForAssetReference = objc_opt_respondsToSelector() & 1;
    v17->_delegateFlags.respondsToShouldHideStatusBarWhenShowingAccessoryViewForAssetReference = objc_opt_respondsToSelector() & 1;
    int64_t v19 = [*p_browsingSession viewModel];
    [v19 registerChangeObserver:v17];

    uint64_t v20 = [*p_browsingSession viewModel];
    id v21 = [v20 resizeTaskDescriptorViewModel];
    [v21 registerChangeObserver:v17 context:PUPhotoPickerResizeTaskDescriptorViewModelObservationContext];

    uint64_t v22 = [MEMORY[0x1E4F908A0] sharedController];
    [v22 registerChangeObserver:v17 context:VideoMuteControllerContext_45939];

    objc_storeStrong((id *)&v17->_actionsController, a6);
    [(PUOneUpActionsController *)v17->_actionsController setPopoverHelper:v17];
    int64_t v23 = [(PUBarsController *)v17 viewController];
    uint64_t v24 = objc_msgSend(v23, "pu_toolbarViewModel");
    [v24 registerChangeObserver:v17];

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.photos.one-up-info-provider-request", 0);
    infoRequestSerialQueue = v17->_infoRequestSerialQueue;
    v17->_infoRequestSerialQueue = (OS_dispatch_queue *)v25;

    int v27 = [(id)objc_opt_class() description];
    int v28 = [MEMORY[0x1E4F29128] UUID];
    id v29 = [v28 UUIDString];
    uint64_t v30 = [v27 stringByAppendingString:v29];
    scrubbingIdentifier = v17->__scrubbingIdentifier;
    v17->__scrubbingIdentifier = (NSString *)v30;

    int v32 = objc_alloc_init(PUPhotoBrowserTitleViewController);
    titleViewController = v17->__titleViewController;
    v17->__titleViewController = v32;

    [(PUPhotoBrowserTitleViewController *)v17->__titleViewController setDelegate:v17];
    v17->__needsUpdateTitle = 1;
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F902E8]) initWithInfoProvider:v17 infoKind:@"PUCurrentAssetDisplayInfo"];
    currentAssetDisplayInfoUpdater = v17->__currentAssetDisplayInfoUpdater;
    v17->__currentAssetDisplayInfoUpdater = (PXInfoUpdater *)v34;

    [(PXInfoUpdater *)v17->__currentAssetDisplayInfoUpdater setObserver:v17];
    int64_t v36 = [PUPlayPauseBarItemsController alloc];
    int v37 = [*p_browsingSession viewModel];
    uint64_t v38 = [(PUPlayPauseBarItemsController *)v36 initWithViewModel:v37];
    playPauseBarItemsController = v17->__playPauseBarItemsController;
    v17->__playPauseBarItemsController = (PUPlayPauseBarItemsController *)v38;

    [(PUPlayPauseBarItemsController *)v17->__playPauseBarItemsController registerChangeObserver:v17];
    v17->__lastChromeVisibilitCGFloat y = 1;
    [(PUOneUpBarsController *)v17 _initializeBarButtonItemCollections];
    [(PUOneUpBarsController *)v17 _startObservingOrientationChanges];
    [(PUOneUpBarsController *)v17 _invalidateScrubber];
    int64_t v40 = [(PUOneUpBarsController *)v17 _currentAssetDisplayInfoUpdater];
    [v40 invalidateInfo];

    [(PUOneUpBarsController *)v17 _invalidateWantsAllPhotosButton];
  }

  return v17;
}

- (PUOneUpBarsController)initWithViewController:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUOneUpBarsController.m", 211, @"%s is not available as initializer", "-[PUOneUpBarsController initWithViewController:delegate:]");

  abort();
}

- (PUOneUpBarsController)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUOneUpBarsController.m", 207, @"%s is not available as initializer", "-[PUOneUpBarsController init]");

  abort();
}

@end