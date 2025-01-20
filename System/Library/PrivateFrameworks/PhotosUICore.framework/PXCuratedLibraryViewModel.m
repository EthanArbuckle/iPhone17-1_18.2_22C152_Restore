@interface PXCuratedLibraryViewModel
- ($DE30A600513D762F9B6AB73D2AED4B95)selectedAssetsTypedCount;
- (BOOL)aspectFitContent;
- (BOOL)enableFooter;
- (BOOL)hideStatusFooterInSelectMode;
- (BOOL)isAppearing;
- (BOOL)isExpanded;
- (BOOL)isExpandedAnimating;
- (BOOL)isFullyExpanded;
- (BOOL)isModalInPresentation;
- (BOOL)isNavigating;
- (BOOL)isPerformingInitialChanges;
- (BOOL)isResetToInitialState;
- (BOOL)isResetting;
- (BOOL)isSelecting;
- (BOOL)secondaryToolbarLegibilityGradientIsVisible;
- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3;
- (BOOL)shouldShowEmptyPlaceholder;
- (BOOL)sidebarCanBecomeVisible;
- (BOOL)viewBasedDecorationsEnabled;
- (BOOL)wantsDarkStatusBar;
- (BOOL)wantsNavigationBarVisible;
- (BOOL)wantsOptionalChromeVisible;
- (BOOL)wantsSecondaryToolbarVisible;
- (BOOL)wantsSidebarVisible;
- (BOOL)wantsTabBarVisible;
- (BOOL)wantsToolbarVisible;
- (BOOL)wantsZoomControlVisible;
- (CGPoint)lastScrollDirection;
- (Class)cplActionManagerClass;
- (NSArray)presenters;
- (NSArray)views;
- (NSNumber)userWantsAspectFitContent;
- (NSSet)allowedActions;
- (NSSet)draggedAssetReferences;
- (NSSet)visibleAssetCollections;
- (NSString)description;
- (NSString)selectModeCaption;
- (PHPhotoLibrary)photoLibrary;
- (PXAssetActionManager)assetActionManager;
- (PXAssetCollectionActionManager)assetCollectionActionManager;
- (PXAssetReference)singleSelectedAssetReference;
- (PXAssetsDataSource)currentDataSource;
- (PXBannerViewConfiguration)bannerViewConfiguration;
- (PXCPLUIStatusProvider)cplUIStatusProvider;
- (PXContentFilterState)allPhotosContentFilterState;
- (PXContentFilterState)currentContentFilterState;
- (PXCuratedLibraryActionManager)actionManager;
- (PXCuratedLibraryAnalysisStatus)analysisStatus;
- (PXCuratedLibraryAssetCollectionSkimmingInfo)skimmingInfo;
- (PXCuratedLibraryAssetsDataSourceManager)assetsDataSourceManager;
- (PXCuratedLibraryLayoutSpecManager)specManager;
- (PXCuratedLibraryStyleGuide)styleGuide;
- (PXCuratedLibraryVideoPlaybackController)videoPlaybackController;
- (PXCuratedLibraryViewConfiguration)configuration;
- (PXCuratedLibraryViewModel)init;
- (PXCuratedLibraryViewModel)initWithAssetsDataSourceManagerConfiguration:(id)a3 zoomLevel:(int64_t)a4 mediaProvider:(id)a5 specManager:(id)a6 styleGuide:(id)a7;
- (PXCuratedLibraryViewModel)initWithConfiguration:(id)a3 assetsDataSourceManagerConfiguration:(id)a4 zoomLevel:(int64_t)a5 mediaProvider:(id)a6 specManager:(id)a7 styleGuide:(id)a8;
- (PXCuratedLibraryViewModelPresenter)mainPresenter;
- (PXLibraryFilterState)libraryFilterState;
- (PXLibrarySummaryOutputPresenter)librarySummaryPresenter;
- (PXPhotosViewOptionsModel)viewOptionsModel;
- (PXScrollViewSpeedometer)scrollingSpeedometer;
- (PXSectionedSelectionManager)selectionManager;
- (PXSelectionSnapshot)selectionSnapshot;
- (PXSharedLibraryCameraSharingBannerStatusProvider)sharedLibraryCameraSharingBannerStatusProvider;
- (PXSharedLibrarySharingSuggestionsCountsManager)sharedLibrarySuggestionCountsManager;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (PXUpdater)updater;
- (PXZoomablePhotosViewModel)zoomablePhotosViewModel;
- (double)daysMarginScale;
- (double)secondaryToolbarVisibility;
- (id)_assetActionManagerWithAllowedActionTypes:(id)a3;
- (id)_indexPathsForAssetCollectionReference:(id)a3;
- (id)_updatedContentFilterState;
- (id)curatedLibraryAssetsDataSourceManager:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4;
- (id)selectionManager:(id)a3 validateSnapshot:(id)a4;
- (id)visibleAssetCollectionsFromCuratedLibraryAssetsDataSourceManager:(id)a3;
- (int64_t)curatedLibraryAssetsDataSourceManager:(id)a3 transitionTypeFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5;
- (int64_t)lastChromeVisibilityChangeReason;
- (int64_t)scrollRegime;
- (int64_t)zoomLevel;
- (int64_t)zoomLevelInDirection:(int64_t)a3 fromZoomLevel:(int64_t)a4;
- (int64_t)zoomLevelTransitionPhase;
- (unint64_t)desiredVerticalAlignment;
- (unint64_t)libraryState;
- (void)_handleIsSelectingChange;
- (void)_handleSelectionManagerChange:(unint64_t)a3;
- (void)_handleSpecChange;
- (void)_invalidateAllowedActions;
- (void)_invalidateAspectFitContent;
- (void)_invalidateAssetActionManager;
- (void)_invalidateAssetCollectionActionManager;
- (void)_invalidateAssetsDataSourceManager;
- (void)_invalidateBannerViewConfiguration;
- (void)_invalidateChromeVisibility;
- (void)_invalidateChromeVisibilityWithChangeReason:(int64_t)a3;
- (void)_invalidateCurrentContentFilterState;
- (void)_invalidateCurrentDataSource;
- (void)_invalidateDesiredVerticalAlignment;
- (void)_invalidateDraggedAssetReferences;
- (void)_invalidateIsModalInPresentation;
- (void)_invalidateLibraryState;
- (void)_invalidateScrollingProperties;
- (void)_invalidateScrollingSpeedometer;
- (void)_invalidateSelectModeCaption;
- (void)_invalidateShouldShowEmptyPlaceholder;
- (void)_invalidateUserWantsAspectFitContent;
- (void)_invalidateZoomablePhotosViewModel;
- (void)_sendAllPhotosSortOrderAnalyticsEvent:(unint64_t)a3;
- (void)_setNeedsUpdate;
- (void)_updateAllowedActions;
- (void)_updateAspectFitContent;
- (void)_updateAssetsDataSourceManager;
- (void)_updateBannerViewConfiguration;
- (void)_updateChromeVisibility;
- (void)_updateCurrentContentFilterState;
- (void)_updateCurrentDataSource;
- (void)_updateDesiredVerticalAlignment;
- (void)_updateDraggedAssetReferences;
- (void)_updateIsFullyExpanded;
- (void)_updateIsModalInPresentation;
- (void)_updateLibraryState;
- (void)_updateScrollingProperties;
- (void)_updateScrollingSpeedometer;
- (void)_updateSelectModeCaption;
- (void)_updateShouldShowEmptyPlaceholder;
- (void)_updateUserWantsAspectFitContent;
- (void)_updateZoomablePhotosViewModel;
- (void)addPresenter:(id)a3;
- (void)addView:(id)a3;
- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3;
- (void)curatedLibraryAssetsDataSourceManager:(id)a3 didTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5;
- (void)curatedLibraryAssetsDataSourceManager:(id)a3 willTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5;
- (void)dealloc;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performChanges:(id)a3;
- (void)performInitialChanges:(id)a3;
- (void)removePresenter:(id)a3;
- (void)removeView:(id)a3;
- (void)resetAllPhotosContentFilterState;
- (void)resetToInitialState;
- (void)setAllPhotosContentFilterState:(id)a3;
- (void)setAllowedActions:(id)a3;
- (void)setAspectFitContent:(BOOL)a3;
- (void)setAssetActionManager:(id)a3;
- (void)setAssetCollectionActionManager:(id)a3;
- (void)setBannerViewConfiguration:(id)a3;
- (void)setCplActionManagerClass:(Class)a3;
- (void)setCurrentContentFilterState:(id)a3;
- (void)setCurrentDataSource:(id)a3;
- (void)setDaysMarginScale:(double)a3;
- (void)setDesiredVerticalAlignment:(unint64_t)a3;
- (void)setDraggedAssetReferences:(id)a3;
- (void)setIsAppearing:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsExpandedAnimating:(BOOL)a3;
- (void)setIsFullyExpanded:(BOOL)a3;
- (void)setIsModalInPresentation:(BOOL)a3;
- (void)setIsNavigating:(BOOL)a3;
- (void)setIsResetting:(BOOL)a3;
- (void)setIsSelecting:(BOOL)a3;
- (void)setLastScrollDirection:(CGPoint)a3;
- (void)setLibraryState:(unint64_t)a3;
- (void)setLibrarySummaryPresenter:(id)a3;
- (void)setScrollRegime:(int64_t)a3;
- (void)setScrollingSpeedometer:(id)a3;
- (void)setSecondaryToolbarLegibilityGradientIsVisible:(BOOL)a3;
- (void)setSecondaryToolbarVisibility:(double)a3;
- (void)setSelectModeCaption:(id)a3;
- (void)setSelectedAssetsTypedCount:(id)a3;
- (void)setShouldShowEmptyPlaceholder:(BOOL)a3;
- (void)setSidebarCanBecomeVisible:(BOOL)a3;
- (void)setSkimmingInfo:(id)a3;
- (void)setUserWantsAspectFitContent:(id)a3;
- (void)setViewBasedDecorationsEnabled:(BOOL)a3;
- (void)setWantsDarkStatusBar:(BOOL)a3;
- (void)setWantsNavigationBarVisible:(BOOL)a3;
- (void)setWantsOptionalChromeVisible:(BOOL)a3;
- (void)setWantsOptionalChromeVisible:(BOOL)a3 changeReason:(int64_t)a4;
- (void)setWantsSecondaryToolbarVisible:(BOOL)a3;
- (void)setWantsSidebarVisible:(BOOL)a3;
- (void)setWantsTabBarVisible:(BOOL)a3;
- (void)setWantsToolbarVisible:(BOOL)a3;
- (void)setWantsZoomControlVisible:(BOOL)a3;
- (void)setZoomLevel:(int64_t)a3;
- (void)setZoomLevelTransitionPhase:(int64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)toggleSelectionForAssetCollectionReference:(id)a3;
- (void)toggleSelectionForAssetReference:(id)a3;
- (void)toggleSelectionForAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4;
- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3;
- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4;
- (void)userDidSetAllPhotosContentFilterState:(id)a3;
@end

@implementation PXCuratedLibraryViewModel

- (unint64_t)desiredVerticalAlignment
{
  return self->_desiredVerticalAlignment;
}

- (void)_setNeedsUpdate
{
}

- (void)setSecondaryToolbarVisibility:(double)a3
{
  if (self->_secondaryToolbarVisibility != a3)
  {
    self->_secondaryToolbarVisibility = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x2000000000];
  }
}

- (void)setLibrarySummaryPresenter:(id)a3
{
}

- (void)setIsExpandedAnimating:(BOOL)a3
{
  if (self->_isExpandedAnimating != a3)
  {
    self->_isExpandedAnimating = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x8000000000];
    [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
    [(PXCuratedLibraryViewModel *)self _updateIsFullyExpanded];
  }
}

- (void)setIsExpanded:(BOOL)a3
{
  if (self->_isExpanded != a3)
  {
    self->_isExpanded = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x4000000000];
    [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
    [(PXCuratedLibraryViewModel *)self _invalidateZoomablePhotosViewModel];
    [(PXCuratedLibraryViewModel *)self _updateIsFullyExpanded];
  }
}

- (void)performInitialChanges:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__PXCuratedLibraryViewModel_performInitialChanges___block_invoke;
  v6[3] = &unk_1E5DBAEB8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXCuratedLibraryViewModel *)self performChanges:v6];
}

uint64_t __135__PXCuratedLibraryViewModel_initWithConfiguration_assetsDataSourceManagerConfiguration_zoomLevel_mediaProvider_specManager_styleGuide___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetAllPhotosContentFilterState];
  [*(id *)(a1 + 32) _invalidateAssetsDataSourceManager];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateCurrentDataSource];
}

- (void)setIsNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (void)resetAllPhotosContentFilterState
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__PXCuratedLibraryViewModel_resetAllPhotosContentFilterState__block_invoke;
  v2[3] = &unk_1E5DCF3F0;
  v2[4] = self;
  [(PXCuratedLibraryViewModel *)self performChanges:v2];
}

- (void)setIsSelecting:(BOOL)a3
{
  if (self->_isSelecting != a3)
  {
    self->_isSelecting = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:1];
    [(PXCuratedLibraryViewModel *)self _invalidateAssetActionManager];
    [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
    [(PXCuratedLibraryViewModel *)self _invalidateChromeVisibility];
    [(PXCuratedLibraryViewModel *)self _invalidateZoomablePhotosViewModel];
    [(PXCuratedLibraryViewModel *)self _invalidateIsModalInPresentation];
  }
}

- (void)setIsResetting:(BOOL)a3
{
  self->_isResetting = a3;
}

void __61__PXCuratedLibraryViewModel_resetAllPhotosContentFilterState__block_invoke(uint64_t a1)
{
  id v2 = +[PXContentFilterState defaultAllPhotosFilterStateForPhotoLibrary:*(void *)(*(void *)(a1 + 32) + 168)];
  [*(id *)(a1 + 32) setAllPhotosContentFilterState:v2];
}

- (void)setAllPhotosContentFilterState:(id)a3
{
  v8 = (PXContentFilterState *)a3;
  id v4 = self->_allPhotosContentFilterState;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXContentFilterState *)v8 isEqual:v4];

    if (!v5)
    {
      v6 = (PXContentFilterState *)[(PXContentFilterState *)v8 copy];
      allPhotosContentFilterState = self->_allPhotosContentFilterState;
      self->_allPhotosContentFilterState = v6;

      [(PXCuratedLibraryViewModel *)self signalChange:0x4000000];
      [(PXCuratedLibraryViewModel *)self _invalidateCurrentContentFilterState];
      [(PXCuratedLibraryViewModel *)self _invalidateAssetsDataSourceManager];
      [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
    }
  }
}

- (void)_updateCurrentContentFilterState
{
  if ([(PXCuratedLibraryViewModel *)self zoomLevel] == 4)
  {
    id v3 = [(PXCuratedLibraryViewModel *)self allPhotosContentFilterState];
    [(PXCuratedLibraryViewModel *)self setCurrentContentFilterState:v3];
  }
  else
  {
    [(PXCuratedLibraryViewModel *)self setCurrentContentFilterState:0];
  }
}

- (PXContentFilterState)allPhotosContentFilterState
{
  return self->_allPhotosContentFilterState;
}

- (void)setCurrentContentFilterState:(id)a3
{
  v8 = (PXContentFilterState *)a3;
  id v4 = self->_currentContentFilterState;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXContentFilterState *)v8 isEqual:v4];

    if (!v5)
    {
      v6 = (PXContentFilterState *)[(PXContentFilterState *)v8 copy];
      currentContentFilterState = self->_currentContentFilterState;
      self->_currentContentFilterState = v6;

      [(PXCuratedLibraryViewModel *)self signalChange:0x2000000];
      [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
      [(PXCuratedLibraryViewModel *)self _invalidateShouldShowEmptyPlaceholder];
    }
  }
}

- (void)_invalidateAssetsDataSourceManager
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAssetsDataSourceManager];
}

- (NSSet)allowedActions
{
  return self->_allowedActions;
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLibraryState];
}

- (BOOL)wantsToolbarVisible
{
  return self->_wantsToolbarVisible;
}

- (BOOL)wantsTabBarVisible
{
  return self->_wantsTabBarVisible;
}

- (BOOL)wantsNavigationBarVisible
{
  return self->_wantsNavigationBarVisible;
}

- (int64_t)lastChromeVisibilityChangeReason
{
  return self->_lastChromeVisibilityChangeReason;
}

- (PXContentFilterState)currentContentFilterState
{
  return self->_currentContentFilterState;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return self->_wantsSecondaryToolbarVisible;
}

- (void)_invalidateAllowedActions
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAllowedActions];
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryViewModel;
  [(PXCuratedLibraryViewModel *)&v4 didPerformChanges];
  id v3 = [(PXCuratedLibraryViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)secondaryToolbarLegibilityGradientIsVisible
{
  return self->_secondaryToolbarLegibilityGradientIsVisible;
}

- (double)secondaryToolbarVisibility
{
  return self->_secondaryToolbarVisibility;
}

- (PXCuratedLibraryViewConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)wantsZoomControlVisible
{
  return self->_wantsZoomControlVisible;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXAssetsDataSource)currentDataSource
{
  return self->_currentDataSource;
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllowedActions];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setZoomLevel:4];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllowedActions];
}

- (void)_updateShouldShowEmptyPlaceholder
{
  char v3 = [(PXCuratedLibraryViewModel *)self libraryState];
  id v4 = [(PXCuratedLibraryViewModel *)self currentContentFilterState];
  -[PXCuratedLibraryViewModel setShouldShowEmptyPlaceholder:](self, "setShouldShowEmptyPlaceholder:", PXCuratedLibraryStateIsEmptyLibrary(v3) & ~[v4 isFiltering] & objc_msgSend(v4, "isContentFilterActive:", 2));
}

- (void)_updateChromeVisibility
{
  char v3 = [(PXCuratedLibraryViewModel *)self specManager];
  id v13 = [v3 spec];

  char v4 = [(PXCuratedLibraryViewModel *)self libraryState];
  if ([v13 userInterfaceIdiom] == 4)
  {
    BOOL v5 = 0;
    BOOL v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  BOOL v9 = [(PXCuratedLibraryViewModel *)self isSelecting];
  uint64_t v10 = [v13 layoutOrientation];
  uint64_t v11 = [v13 sizeClass];
  if ((v4 & 2) != 0)
  {
    if (v9)
    {
      uint64_t v8 = 0;
      BOOL v6 = 0;
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v7 = 0;
      uint64_t v8 = 1;
      if (v10 == 2)
      {
        BOOL v6 = 1;
        if (v11 == 1)
        {
          BOOL v6 = [(PXCuratedLibraryViewModel *)self wantsOptionalChromeVisible];
          uint64_t v7 = 0;
        }
      }
      else
      {
        BOOL v6 = 1;
      }
    }
LABEL_12:
    BOOL v5 = [(PXCuratedLibraryViewModel *)self bannerViewConfiguration];

    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 1;
  BOOL v6 = 1;
  if (v11 == 1) {
    goto LABEL_12;
  }
LABEL_13:
  v12 = [(PXCuratedLibraryViewModel *)self configuration];
  BOOL v5 = (void *)[v12 enableNavigationHeader];

LABEL_14:
  [(PXCuratedLibraryViewModel *)self setWantsNavigationBarVisible:v5];
  [(PXCuratedLibraryViewModel *)self setWantsTabBarVisible:v6];
  [(PXCuratedLibraryViewModel *)self setWantsToolbarVisible:v7];
  [(PXCuratedLibraryViewModel *)self setWantsSecondaryToolbarVisible:v8];
  self->_lastChromeVisibilityChangeReason = self->_pendingChromeVisibilityChangeReason;
  self->_pendingChromeVisibilityChangeReason = 0;
}

- (unint64_t)libraryState
{
  return self->_libraryState;
}

- (void)setWantsToolbarVisible:(BOOL)a3
{
  if (self->_wantsToolbarVisible != a3)
  {
    self->_wantsToolbarVisible = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x400000];
  }
}

- (void)setWantsTabBarVisible:(BOOL)a3
{
  if (self->_wantsTabBarVisible != a3)
  {
    self->_wantsTabBarVisible = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x400000];
  }
}

- (void)setWantsSecondaryToolbarVisible:(BOOL)a3
{
  if (self->_wantsSecondaryToolbarVisible != a3)
  {
    self->_wantsSecondaryToolbarVisible = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x400000];
  }
}

- (void)setWantsNavigationBarVisible:(BOOL)a3
{
  if (self->_wantsNavigationBarVisible != a3)
  {
    self->_wantsNavigationBarVisible = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x400000];
  }
}

- (void)_updateAllowedActions
{
  int64_t v3 = [(PXCuratedLibraryViewModel *)self zoomLevel];
  uint64_t v91 = 0;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  char v4 = [(PXCuratedLibraryViewModel *)self zoomablePhotosViewModel];
  BOOL v5 = v4;
  if (v4)
  {
    [v4 zoomState];
  }
  else
  {
    uint64_t v91 = 0;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
  }

  v80 = +[PXCuratedLibrarySettings sharedInstance];
  v81 = +[PXPhotosGridSettings sharedInstance];
  BOOL v6 = [(PXCuratedLibraryViewModel *)self zoomablePhotosViewModel];
  uint64_t v7 = [(PXCuratedLibraryViewModel *)self specManager];
  uint64_t v8 = [v7 spec];

  unsigned int v9 = [(PXCuratedLibraryViewModel *)self isSelecting];
  v79 = v6;
  int v10 = [v6 isDisplayingIndividualItems];
  uint64_t v82 = [v8 userInterfaceIdiom];
  uint64_t v75 = [v8 userInterfaceIdiom];
  uint64_t v70 = [v8 userInterfaceIdiom];
  v78 = v8;
  uint64_t v64 = [v8 sizeClass];
  int v11 = [(PXCuratedLibraryViewModel *)self shouldShowEmptyPlaceholder];
  BOOL v12 = [(PXCuratedLibraryViewModel *)self isExpanded];
  BOOL v13 = [(PXCuratedLibraryViewModel *)self isExpandedAnimating];
  v14 = [(PXCuratedLibraryViewModel *)self analysisStatus];
  if (([v14 isDaysMonthsYearsStructureEnabled] & 1) != 0
    || +[PXCuratedLibrarySettings enableEmptyYearsMonthsDaysForTesting])
  {
    v15 = [(PXCuratedLibraryViewModel *)self currentContentFilterState];
    if ([v15 isFiltering]) {
      int v16 = 0;
    }
    else {
      int v16 = (v12 || v13) & ~v11;
    }
  }
  else
  {
    int v16 = 0;
  }
  uint64_t v17 = v82;

  v18 = [(PXCuratedLibraryViewModel *)self sharedLibraryStatusProvider];
  uint64_t v19 = [v18 hasSharedLibraryOrPreview];

  unsigned int v77 = v16;
  if ([v81 enableNewActionMenu])
  {
    if (v3 == 4)
    {
      uint64_t v20 = [v81 enableContentFiltering];
      int v66 = 1;
      unsigned int v56 = 1;
      uint64_t v21 = 1;
      goto LABEL_26;
    }
    if (v3 == 3)
    {
      uint64_t v20 = 0;
      unsigned int v56 = 0;
      uint64_t v21 = 0;
      int v66 = v9 ^ 1;
      goto LABEL_26;
    }
    if (v3 != 1)
    {
      v22 = [(PXCuratedLibraryViewModel *)self skimmingInfo];
      int v66 = [v22 touchInteractionStarted] ^ 1;

      goto LABEL_25;
    }
    goto LABEL_15;
  }
  if (v3 == 1)
  {
LABEL_15:
    int v66 = 0;
    goto LABEL_25;
  }
  if (v9)
  {
    int v66 = 0;
  }
  else
  {
    v23 = [(PXCuratedLibraryViewModel *)self skimmingInfo];
    int v66 = [v23 touchInteractionStarted] ^ 1;
  }
  if (v3 == 4)
  {
    uint64_t v20 = [v81 enableContentFiltering];
    uint64_t v21 = 0;
    unsigned int v56 = v20;
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v20 = 0;
  unsigned int v56 = 0;
  uint64_t v21 = 0;
LABEL_26:
  if (v3 == 4) {
    int v24 = v10;
  }
  else {
    int v24 = 0;
  }
  if (v3 == 3) {
    int v24 = 1;
  }
  int v25 = v24 & ~v9;
  if (v82 == 4) {
    int v26 = 0;
  }
  else {
    int v26 = v25;
  }
  if (v9)
  {
    int v27 = 0;
  }
  else
  {
    if (v3 == 4) {
      int v27 = v10;
    }
    else {
      int v27 = 1;
    }
    if (v3 == 4) {
      int v28 = v10;
    }
    else {
      int v28 = 0;
    }
    if (v28 == 1)
    {
      BOOL v60 = (uint64_t)v87 > 1;
      goto LABEL_45;
    }
  }
  BOOL v60 = 0;
LABEL_45:
  BOOL v29 = v3 == 4 && v12;
  unsigned int v74 = v26;
  int v72 = v27;
  if (v29)
  {
    v30 = [(PXCuratedLibraryViewModel *)self currentDataSource];
    uint64_t v31 = [v30 containsAnyItems];

    uint64_t v68 = *((void *)&v87 + 1);
    uint64_t v32 = v31;
    if (v31)
    {
      v33 = [v79 allowedColumns];
      BOOL v34 = *((void *)&v87 + 1) + 1 < (unint64_t)[v33 count];

      unsigned int v35 = v34;
    }
    else
    {
      unsigned int v35 = 0;
    }
    uint64_t v38 = v70;
    uint64_t v37 = v75;
    uint64_t v17 = v82;
    BOOL v40 = v3 == 1 && v82 != 4;
    unsigned int v59 = v40;
  }
  else
  {
    if (v3 == 3) {
      char v36 = v9;
    }
    else {
      char v36 = 1;
    }
    uint64_t v68 = *((void *)&v87 + 1);
    if ((v36 & 1) == 0)
    {
      unsigned int v35 = [v80 enableShowAllButtons];
      uint64_t v32 = 0;
      uint64_t v17 = v82;
      unsigned int v59 = (v82 != 4) & ~((v3 == 4) ^ (v3 == 1));
      unsigned int v57 = 0;
      unsigned int v58 = 1;
      uint64_t v38 = v70;
      uint64_t v37 = v75;
      goto LABEL_76;
    }
    unsigned int v35 = 0;
    uint64_t v37 = v75;
    unsigned int v59 = (v82 != 4) & ~((v3 == 4) ^ (v3 == 1));
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      unsigned int v57 = 0;
      unsigned int v58 = 1;
      uint64_t v32 = 0;
      uint64_t v38 = v70;
      goto LABEL_76;
    }
    uint64_t v32 = 0;
    uint64_t v38 = v70;
  }
  BOOL v43 = v3 == 4 && v17 != 4 || v3 == 1;
  unsigned int v57 = v35;
  unsigned int v58 = v43;
  unsigned int v35 = 0;
LABEL_76:
  unsigned int v76 = v35;
  if (v17 == 4)
  {
    unsigned int v61 = 0;
  }
  else
  {
    v44 = +[PXRootSettings sharedInstance];
    unsigned int v61 = [v44 canShowInternalUI];

    uint64_t v17 = v82;
  }
  BOOL v45 = 0;
  if (v37 == 2 && v64 != 1) {
    BOOL v45 = [(PXCuratedLibraryViewModel *)self sidebarCanBecomeVisible];
  }
  BOOL v71 = v45;
  if (v3 == 1) {
    int v46 = 0;
  }
  else {
    int v46 = v9 ^ 1;
  }
  if ((unint64_t)(v3 - 1) < 2) {
    uint64_t v47 = v9 ^ 1;
  }
  else {
    uint64_t v47 = 0;
  }
  if (v3 == 3) {
    unsigned int v48 = v9;
  }
  else {
    unsigned int v48 = 0;
  }
  if (v3 == 3) {
    unsigned int v49 = 0;
  }
  else {
    unsigned int v49 = v66 | v19;
  }
  if (v17 == 4) {
    unsigned int v48 = 0;
  }
  unsigned int v62 = v48;
  if (v38 == 5) {
    uint64_t v50 = v49;
  }
  else {
    uint64_t v50 = v66 | v19;
  }
  if (v38 == 5) {
    int v51 = 0;
  }
  else {
    int v51 = v72;
  }
  if (v68 > 0) {
    unsigned int v52 = v32;
  }
  else {
    unsigned int v52 = 0;
  }
  unsigned int v69 = v52;
  unsigned int v63 = v51;
  unsigned int v65 = v46 & v77;
  if (v3 == 4) {
    int v53 = 0;
  }
  else {
    int v53 = v9 ^ 1;
  }
  unsigned int v67 = v53;
  v54 = objc_opt_new();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PXCuratedLibraryViewModel__updateAllowedActions__block_invoke;
  aBlock[3] = &unk_1E5DBAF28;
  id v84 = v54;
  id v73 = v54;
  v55 = (void (**)(void *, void, __CFString *))_Block_copy(aBlock);
  v55[2](v55, v50, @"PXCuratedLibraryActionEllipsisButton");
  v55[2](v55, v19, @"PXCuratedLibraryActionSetAllLibrariesFilter");
  v55[2](v55, v19, @"PXCuratedLibraryActionSetPersonalLibraryFilter");
  v55[2](v55, v19, @"PXCuratedLibraryActionSetSharedLibraryFilter");
  v55[2](v55, v19, @"PXCuratedLibraryActionToggleSharedLibraryBadge");
  v55[2](v55, v20, @"PXCuratedLibraryActionShowFiltersMenu");
  v55[2](v55, v20, @"PXCuratedLibraryActionShowFilters");
  v55[2](v55, v20, @"PXCuratedLibraryActionUnfilter");
  v55[2](v55, v20, @"PXCuratedLibraryActionRemoveFilters");
  v55[2](v55, v21, @"PXCuratedLibraryActionToggleFavoriteFilter");
  v55[2](v55, v21, @"PXCuratedLibraryActionToggleEditFilter");
  v55[2](v55, v21, @"PXCuratedLibraryActionToggleImageFilter");
  v55[2](v55, v21, @"PXCuratedLibraryActionToggleVideoFilter");
  v55[2](v55, v56, @"PXCuratedLibraryActionToggleShowOnlyScreenshotFilter");
  v55[2](v55, v56, @"PXCuratedLibraryActionToggleIncludeScreenshotFilter");
  v55[2](v55, v56, @"PXCuratedLibraryActionToggleIncludeSharedWithYouFilter");
  v55[2](v55, v21, @"PXCuratedLibraryActionToggleLiveFilter");
  v55[2](v55, v21, @"PXCuratedLibraryActionTogglePortraitFilter");
  v55[2](v55, v74, @"PXCuratedLibraryActionEnterSelectMode");
  v55[2](v55, v62, @"PXCuratedLibraryActionSelectAllToggle");
  v55[2](v55, v9, @"PXCuratedLibraryActionCancelSelectMode");
  v55[2](v55, v63, @"PXCuratedLibraryActionNavigateToOneUp");
  v55[2](v55, v65, @"PXCuratedLibraryActionNavigateToPreviousZoomLevel");
  v55[2](v55, v47 & v77, @"PXCuratedLibraryActionNavigateToNextZoomLevel");
  v55[2](v55, v67, @"PXCuratedLibraryActionPinchToSwitchZoomLevel");
  v55[2](v55, v47, @"PXCuratedLibraryActionSkim");
  v55[2](v55, v32, @"PXCuratedLibraryActionAllPhotosInteractiveZoom");
  ((void (**)(void *, BOOL, __CFString *))v55)[2](v55, v60, @"PXCuratedLibraryActionAllPhotosToggleAspectFit");
  v55[2](v55, v69, @"PXCuratedLibraryActionAllPhotosZoomIn");
  v55[2](v55, v57, @"PXCuratedLibraryActionAllPhotosZoomOut");
  v55[2](v55, 1, @"PXCuratedLibraryActionDropInFromDrag");
  v55[2](v55, v76, @"PXCuratedLibraryActionShowAll");
  v55[2](v55, v59, @"PXCuratedLibraryActionShare");
  v55[2](v55, v77, @"PXCuratedLibraryActionNavigateToYearsMonthsOrDays");
  v55[2](v55, v58, @"PXCuratedLibraryActionShowMap");
  v55[2](v55, v61, @"PXCuratedLibraryActionTapToRadar");
  v55[2](v55, v61, @"PXCuratedLibraryActionCurationDebug");
  ((void (**)(void *, BOOL, __CFString *))v55)[2](v55, v71, @"PXCuratedLibraryActionShowSidebar");
  ((void (**)(void *, BOOL, __CFString *))v55)[2](v55, v38 == 5, @"PXCuratedLibraryActionNavigateToAssetReference");
  v55[2](v55, 0, @"PXCuratedLibraryActionHover");
  [(PXCuratedLibraryViewModel *)self setAllowedActions:v73];
}

uint64_t __50__PXCuratedLibraryViewModel__updateAllowedActions__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  }
  return result;
}

- (PXCuratedLibraryLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (PXZoomablePhotosViewModel)zoomablePhotosViewModel
{
  return self->_zoomablePhotosViewModel;
}

- (BOOL)isSelecting
{
  return self->_isSelecting;
}

- (BOOL)shouldShowEmptyPlaceholder
{
  return self->_shouldShowEmptyPlaceholder;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (BOOL)isExpandedAnimating
{
  return self->_isExpandedAnimating;
}

- (PXCuratedLibraryAnalysisStatus)analysisStatus
{
  return self->_analysisStatus;
}

- (void)setAllowedActions:(id)a3
{
  id v5 = a3;
  if (!-[NSSet isEqualToSet:](self->_allowedActions, "isEqualToSet:"))
  {
    objc_storeStrong((id *)&self->_allowedActions, a3);
    [(PXCuratedLibraryViewModel *)self signalChange:0x10000];
  }
}

- (PXBannerViewConfiguration)bannerViewConfiguration
{
  return self->_bannerViewConfiguration;
}

- (void)setShouldShowEmptyPlaceholder:(BOOL)a3
{
  if (self->_shouldShowEmptyPlaceholder != a3)
  {
    self->_shouldShowEmptyPlaceholder = a3;
    [(PXCuratedLibraryViewModel *)self _invalidateDesiredVerticalAlignment];
    [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
    [(PXCuratedLibraryViewModel *)self signalChange:0x1000000000];
  }
}

- (void)_invalidateDesiredVerticalAlignment
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDesiredVerticalAlignment];
}

- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3
{
  return ![(PXCuratedLibraryViewModel *)self isSelecting];
}

void __58__PXCuratedLibraryViewModel__updateDraggedAssetReferences__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = *(void **)(a1 + 32);
  id v5 = a2;
  if ([v3 count]) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  [v5 setDraggedAssetReferences:v4];
}

- (void)setDraggedAssetReferences:(id)a3
{
  uint64_t v8 = (NSSet *)a3;
  uint64_t v4 = self->_draggedAssetReferences;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSSet *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      BOOL v6 = (NSSet *)[(NSSet *)v8 copy];
      draggedAssetReferences = self->_draggedAssetReferences;
      self->_draggedAssetReferences = v6;

      [(PXCuratedLibraryViewModel *)self signalChange:0x200000];
      [(PXCuratedLibraryViewModel *)self _invalidateZoomablePhotosViewModel];
    }
  }
}

- (void)setWantsDarkStatusBar:(BOOL)a3
{
  if (self->_wantsDarkStatusBar != a3)
  {
    self->_wantsDarkStatusBar = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x1000000];
  }
}

- (void)setIsAppearing:(BOOL)a3
{
  if (self->_isAppearing != a3)
  {
    self->_isAppearing = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:256];
  }
}

- (void)setDesiredVerticalAlignment:(unint64_t)a3
{
  if (self->_desiredVerticalAlignment != a3)
  {
    self->_desiredVerticalAlignment = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x800000000];
  }
}

- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __80__PXCuratedLibraryViewModel_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke;
  v3[3] = &unk_1E5DCF3F0;
  v3[4] = self;
  [(PXCuratedLibraryViewModel *)self performChanges:v3];
}

uint64_t __80__PXCuratedLibraryViewModel_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLibraryState];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLibraryState];
}

- (void)_updateBannerViewConfiguration
{
}

uint64_t __135__PXCuratedLibraryViewModel_initWithConfiguration_assetsDataSourceManagerConfiguration_zoomLevel_mediaProvider_specManager_styleGuide___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateZoomablePhotosViewModel];
  [*(id *)(a1 + 32) _invalidateUserWantsAspectFitContent];
  [*(id *)(a1 + 32) _invalidateAspectFitContent];
  [*(id *)(a1 + 32) _invalidateAllowedActions];
  [*(id *)(a1 + 32) _invalidateLibraryState];
  [*(id *)(a1 + 32) _invalidateCurrentContentFilterState];
  [*(id *)(a1 + 32) _invalidateBannerViewConfiguration];
  [*(id *)(a1 + 32) _invalidateChromeVisibility];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateShouldShowEmptyPlaceholder];
}

- (void)_invalidateLibraryState
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateLibraryState];
}

uint64_t __46__PXCuratedLibraryViewModel__handleSpecChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateUserWantsAspectFitContent];
  [*(id *)(a1 + 32) _invalidateChromeVisibility];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateAllowedActions];
}

- (void)_invalidateUserWantsAspectFitContent
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateUserWantsAspectFitContent];
}

- (void)_updateCurrentDataSource
{
  uint64_t v4 = [(PXCuratedLibraryViewModel *)self assetsDataSourceManager];
  id v9 = [v4 dataSource];

  char v5 = [(PXCuratedLibraryViewModel *)self selectionManager];
  BOOL v6 = [v5 dataSourceManager];
  uint64_t v7 = [v6 dataSource];

  if (([v9 isEqual:v7] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryViewModel.m" lineNumber:871 description:@"Expected selection manager's data source to match assetsDataSourceManager.dataSource!"];
  }
  [(PXCuratedLibraryViewModel *)self setCurrentDataSource:v9];
}

- (id)_assetActionManagerWithAllowedActionTypes:(id)a3
{
  id v4 = a3;
  char v5 = [(PXCuratedLibraryViewModel *)self assetsDataSourceManager];
  BOOL v6 = [v5 currentPhotoKitAssetsDataSourceManager];

  uint64_t v7 = [(PXCuratedLibraryViewModel *)self selectionManager];
  uint64_t v8 = [[PXPhotoKitAssetActionManager alloc] initWithSelectionManager:v7];
  [(PXPhotoKitAssetActionManager *)v8 setDataSourceManager:v6];
  [(PXActionManager *)v8 setAllowedActionTypes:v4];

  return v8;
}

- (void)_updateLibraryState
{
  id v8 = [(PXCuratedLibraryViewModel *)self assetsDataSourceManager];
  uint64_t v3 = 0;
  int64_t v4 = [(PXCuratedLibraryViewModel *)self zoomLevel] - 1;
  uint64_t v5 = 1;
  do
  {
    if (v4 == v3 || v3 == 3)
    {
      char v6 = [v8 libraryStateForZoomLevel:v3 + 1];
      unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFELL;
      if (v6) {
        unint64_t v7 = v5;
      }
      uint64_t v5 = v7 | v6 & 2;
    }
    ++v3;
  }
  while (v3 != 4);
  [(PXCuratedLibraryViewModel *)self setLibraryState:v5];
}

- (PXCuratedLibraryAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (void)setLibraryState:(unint64_t)a3
{
  if (self->_libraryState != a3)
  {
    self->_libraryState = a3;
    [(PXCuratedLibraryViewModel *)self _invalidateChromeVisibility];
    [(PXCuratedLibraryViewModel *)self _invalidateShouldShowEmptyPlaceholder];
    [(PXCuratedLibraryViewModel *)self signalChange:64];
  }
}

- (void)_invalidateChromeVisibility
{
}

- (void)_invalidateChromeVisibilityWithChangeReason:(int64_t)a3
{
  if (a3) {
    self->_pendingChromeVisibilityChangeReason = a3;
  }
  id v3 = [(PXCuratedLibraryViewModel *)self updater];
  [v3 setNeedsUpdateOf:sel__updateChromeVisibility];
}

- (void)_invalidateShouldShowEmptyPlaceholder
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateShouldShowEmptyPlaceholder];
}

- (void)setCurrentDataSource:(id)a3
{
  uint64_t v5 = (PXAssetsDataSource *)a3;
  if (self->_currentDataSource != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_currentDataSource, a3);
    [(PXCuratedLibraryViewModel *)self signalChange:16];
    [(PXCuratedLibraryViewModel *)self _invalidateDraggedAssetReferences];
    [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
    uint64_t v5 = v6;
  }
}

- (void)_invalidateDraggedAssetReferences
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDraggedAssetReferences];
}

- (void)_invalidateCurrentContentFilterState
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentContentFilterState];
}

- (void)_updateScrollingSpeedometer
{
  id v5 = [(PXCuratedLibraryViewModel *)self views];
  id v3 = [v5 firstObject];
  int64_t v4 = [v3 scrollingSpeedometer];
  [(PXCuratedLibraryViewModel *)self setScrollingSpeedometer:v4];
}

- (NSArray)views
{
  return [(NSHashTable *)self->_views allObjects];
}

- (void)setScrollingSpeedometer:(id)a3
{
  id v5 = (PXScrollViewSpeedometer *)a3;
  scrollingSpeedometer = self->_scrollingSpeedometer;
  if (scrollingSpeedometer != v5)
  {
    unint64_t v7 = v5;
    [(PXScrollViewSpeedometer *)scrollingSpeedometer unregisterChangeObserver:self context:PXCuratedLibraryViewModelScrollingSpeedometerObserverContext];
    objc_storeStrong((id *)&self->_scrollingSpeedometer, a3);
    [(PXScrollViewSpeedometer *)self->_scrollingSpeedometer registerChangeObserver:self context:PXCuratedLibraryViewModelScrollingSpeedometerObserverContext];
    [(PXCuratedLibraryViewModel *)self _invalidateScrollingProperties];
    id v5 = v7;
  }
}

- (void)_updateScrollingProperties
{
  id v3 = [(PXCuratedLibraryViewModel *)self scrollingSpeedometer];
  -[PXCuratedLibraryViewModel setScrollRegime:](self, "setScrollRegime:", [v3 regime]);
  [v3 lastScrollDirection];
  -[PXCuratedLibraryViewModel setLastScrollDirection:](self, "setLastScrollDirection:");
}

- (void)setScrollRegime:(int64_t)a3
{
  if (self->_scrollRegime != a3)
  {
    self->_scrollRegime = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:2048];
  }
}

- (void)setLastScrollDirection:(CGPoint)a3
{
  if (a3.x != self->_lastScrollDirection.x || a3.y != self->_lastScrollDirection.y)
  {
    self->_lastScrollDirection = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:4096];
  }
}

- (PXScrollViewSpeedometer)scrollingSpeedometer
{
  return self->_scrollingSpeedometer;
}

- (void)_invalidateZoomablePhotosViewModel
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateZoomablePhotosViewModel];
}

- (void)_invalidateScrollingProperties
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateScrollingProperties];
}

- (void)_invalidateBannerViewConfiguration
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateBannerViewConfiguration];
}

- (void)_invalidateAspectFitContent
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAspectFitContent];
}

- (PXCuratedLibraryViewModel)initWithConfiguration:(id)a3 assetsDataSourceManagerConfiguration:(id)a4 zoomLevel:(int64_t)a5 mediaProvider:(id)a6 specManager:(id)a7 styleGuide:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v90.receiver = self;
  v90.super_class = (Class)PXCuratedLibraryViewModel;
  uint64_t v20 = [(PXCuratedLibraryViewModel *)&v90 init];
  uint64_t v21 = v20;
  if (v20)
  {
    id v83 = v19;
    id v84 = v17;
    objc_storeStrong((id *)&v20->_configuration, a3);
    uint64_t v22 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v21];
    updater = v21->_updater;
    v21->_updater = (PXUpdater *)v22;

    [(PXUpdater *)v21->_updater setNeedsUpdateSelector:sel__setNeedsUpdate];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateAssetsDataSourceManager];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateCurrentDataSource];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateSelectModeCaption];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateUserWantsAspectFitContent];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateAspectFitContent];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateLibraryState];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateCurrentContentFilterState];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateScrollingSpeedometer];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateScrollingProperties];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateBannerViewConfiguration];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateChromeVisibility];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateDraggedAssetReferences];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateZoomablePhotosViewModel];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateShouldShowEmptyPlaceholder];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateAllowedActions];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateIsModalInPresentation];
    [(PXUpdater *)v21->_updater addUpdateSelector:sel__updateDesiredVerticalAlignment];
    objc_storeStrong((id *)&v21->_specManager, a7);
    [v18 registerChangeObserver:v21 context:PXCuratedLibraryViewModelSpecManagerObserverContext];
    objc_storeStrong((id *)&v21->_styleGuide, a8);
    v21->_desiredVerticalAlignment = 0;
    int v24 = [[PXCuratedLibraryAssetsDataSourceManager alloc] initWithConfiguration:v16];
    assetsDataSourceManager = v21->_assetsDataSourceManager;
    v21->_assetsDataSourceManager = v24;

    [(PXCuratedLibraryAssetsDataSourceManager *)v21->_assetsDataSourceManager setDelegate:v21];
    [(PXSectionedDataSourceManager *)v21->_assetsDataSourceManager registerChangeObserver:v21 context:PXCuratedLibraryViewModelAssetsDataSourceManagerObserverContext];
    int v26 = [[PXCuratedLibraryVideoPlaybackController alloc] initViewViewModel:v21];
    videoPlaybackController = v21->_videoPlaybackController;
    v21->_videoPlaybackController = v26;

    int v28 = [[PXCuratedLibraryActionManager alloc] initWithViewModel:v21];
    actionManager = v21->_actionManager;
    v21->_actionManager = v28;

    v21->_zoomLevel = a5;
    uint64_t v30 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    presenters = v21->_presenters;
    v21->_presenters = (NSHashTable *)v30;

    v21->_wantsZoomControlVisible = 1;
    char v32 = [v15 isExpandedInitially];
    v21->_isExpanded = v32;
    v21->_isFullyExpanded = v32;
    v21->_secondaryToolbarVisibility = 1.0;
    uint64_t v33 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    views = v21->_views;
    v21->_views = (NSHashTable *)v33;

    uint64_t v35 = [MEMORY[0x1E4F1CA80] set];
    visibleAssetCollections = v21->_visibleAssetCollections;
    v21->_visibleAssetCollections = (NSMutableSet *)v35;

    uint64_t v37 = [objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v21->_assetsDataSourceManager];
    selectionManager = v21->_selectionManager;
    v21->_selectionManager = (PXSectionedSelectionManager *)v37;

    [(PXSectionedSelectionManager *)v21->_selectionManager setSnapshotValidator:v21];
    [(PXSectionedSelectionManager *)v21->_selectionManager registerChangeObserver:v21 context:PXCuratedLibraryViewModelSelectionObserverContext];
    [(PXCuratedLibraryViewModel *)v21 registerChangeObserver:v21 context:PXCuratedLibraryViewModelObserverContext_113441];
    v39 = +[PXUserDefaults standardUserDefaults];
    BOOL v40 = [v39 daysMarginScale];

    if (v40)
    {
      [v40 floatValue];
      double v42 = v41;
    }
    else
    {
      double v42 = 1.0;
    }
    v21->_daysMarginScale = v42;
    BOOL v43 = [v16 photoLibrary];
    uint64_t v44 = +[PXCuratedLibraryAnalysisStatus sharedStatusForLibrary:v43];
    analysisStatus = v21->_analysisStatus;
    v21->_analysisStatus = (PXCuratedLibraryAnalysisStatus *)v44;

    [(PXCuratedLibraryAnalysisStatus *)v21->_analysisStatus setDataSourceManager:v21->_assetsDataSourceManager];
    [(PXCuratedLibraryAnalysisStatus *)v21->_analysisStatus registerChangeObserver:v21 context:PXCuratedLibraryViewModelAnalysisStatusObserverContext];
    int v46 = [(PXCuratedLibraryViewModel *)v21 selectionManager];
    uint64_t v47 = [v46 assetTypeCounter];
    [v47 registerChangeObserver:v21 context:PXCuratedLibraryViewModelAssetSelectionTypeObserverContext];

    uint64_t v48 = [v16 photoLibrary];
    photoLibrary = v21->_photoLibrary;
    v21->_photoLibrary = (PHPhotoLibrary *)v48;

    uint64_t v50 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v21->_photoLibrary];
    sharedLibraryStatusProvider = v21->_sharedLibraryStatusProvider;
    v21->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v50;

    unsigned int v52 = [[PXLibraryFilterState alloc] initWithSharedLibraryStatusProvider:v21->_sharedLibraryStatusProvider];
    libraryFilterState = v21->_libraryFilterState;
    v21->_libraryFilterState = v52;

    uint64_t v54 = [v15 viewOptionsModel];
    long long v85 = v15;
    viewOptionsModel = v21->_viewOptionsModel;
    v21->_viewOptionsModel = (PXPhotosViewOptionsModel *)v54;

    unsigned int v56 = [(PXPhotosViewOptionsModel *)v21->_viewOptionsModel sortOrderState];
    [v56 registerChangeObserver:v21 context:PXPhotosSortOrderStateObservationContext];

    unsigned int v57 = [(PXPhotosViewOptionsModel *)v21->_viewOptionsModel sortOrderState];
    -[PXCuratedLibraryViewModel _sendAllPhotosSortOrderAnalyticsEvent:](v21, "_sendAllPhotosSortOrderAnalyticsEvent:", [v57 sortOrder]);

    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __135__PXCuratedLibraryViewModel_initWithConfiguration_assetsDataSourceManagerConfiguration_zoomLevel_mediaProvider_specManager_styleGuide___block_invoke;
    v88[3] = &unk_1E5DCF3F0;
    unsigned int v58 = v21;
    long long v89 = v58;
    [v58 performChanges:v88];
    uint64_t v82 = [(PXCuratedLibraryAssetsDataSourceManager *)v21->_assetsDataSourceManager dataSourceManagerForZoomLevel:4];
    [v82 registerChangeObserver:v58 context:PXCuratedLibraryViewModelAllPhotosDataSourceManagerObserverContext];
    unsigned int v59 = [PXZoomablePhotosLayoutSpecManager alloc];
    BOOL v60 = [v18 extendedTraitCollection];
    unsigned int v61 = [(PXFeatureSpecManager *)v59 initWithExtendedTraitCollection:v60];

    unsigned int v62 = +[PXUserDefaults standardUserDefaults];
    unsigned int v63 = [v62 curatedLibraryUserDefaults];
    [(PXZoomablePhotosLayoutSpecManager *)v61 setUserDefaults:v63];

    uint64_t v64 = [v18 availableThumbnailSizes];
    [(PXZoomablePhotosLayoutSpecManager *)v61 setAvailableThumbnailSizes:v64];

    unsigned int v65 = [v58 configuration];
    -[PXZoomablePhotosLayoutSpecManager setOverrideDefaultNumberOfColumns:](v61, "setOverrideDefaultNumberOfColumns:", [v65 overrideDefaultNumberOfColumns]);

    [(PXZoomablePhotosLayoutSpecManager *)v61 setGridStyle:3];
    int v66 = [PXZoomablePhotosViewModel alloc];
    unsigned int v67 = v21->_selectionManager;
    uint64_t v68 = [v58 videoPlaybackController];
    unsigned int v69 = v66;
    uint64_t v70 = v67;
    id v17 = v84;
    id v15 = v85;
    uint64_t v71 = [(PXZoomablePhotosViewModel *)v69 initWithDataSourceManager:v82 selectionManager:v70 mediaProvider:v84 specManager:v61 loadingStatusManager:0 badgesModifier:0 preferredAssetCropDelegate:0 preferredColumnCountsDelegate:0 inlinePlaybackController:v68];
    id v72 = v58[35];
    v58[35] = (id)v71;

    [v58[35] registerChangeObserver:v58 context:PXCuratedLibraryViewModelZoomablePhotosObserverContext];
    uint64_t v73 = [(PHPhotoLibrary *)v21->_photoLibrary px_sharedLibrarySharingSuggestionsCountsManager];
    id v74 = v58[56];
    v58[56] = (id)v73;

    [v58[56] registerChangeObserver:v58 context:&PXSharedLibrarySharingSuggestionsCountsManagerObservationContext];
    uint64_t v75 = objc_alloc_init(PXSharedLibraryCameraSharingBannerStatusProvider);
    id v76 = v58[57];
    v58[57] = v75;

    [v58[57] registerChangeObserver:v58 context:&PXSharedLibraryCameraSharingBannerStatusProviderObservationContext];
    *((unsigned char *)v58 + 155) = [v85 enableFooter];
    unsigned int v77 = +[PXCuratedLibrarySettings sharedInstance];
    *((unsigned char *)v58 + 156) = [v77 hideStatusFooterInSelectMode];

    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __135__PXCuratedLibraryViewModel_initWithConfiguration_assetsDataSourceManagerConfiguration_zoomLevel_mediaProvider_specManager_styleGuide___block_invoke_2;
    v86[3] = &unk_1E5DCF3F0;
    v78 = v58;
    long long v87 = v78;
    [v78 performChanges:v86];
    [(PXSharedLibraryStatusProvider *)v21->_sharedLibraryStatusProvider registerChangeObserver:v78 context:PXSharedLibraryStatusProviderObservationContext_113443];
    [(PXLibraryFilterState *)v21->_libraryFilterState registerChangeObserver:v78 context:PXLibraryFilterStateObservationContext_113444];
    v79 = +[PXPhotosGridSettings sharedInstance];
    [v79 addDeferredKeyObserver:v78];

    v80 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v80 addObserver:v78 forKeyPath:@"IncludeScreenshots" options:0 context:PXUserDefaultsObservationContext];
    [v80 addObserver:v78 forKeyPath:@"IncludeSharedWithYou" options:0 context:PXUserDefaultsObservationContext];

    id v19 = v83;
  }

  return v21;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  int v10 = v9;
  if ((void *)PXCuratedLibraryViewModelObserverContext_113441 == a5)
  {
    if (a4) {
      [(PXCuratedLibraryViewModel *)self _handleIsSelectingChange];
    }
    if ((a4 & 0x10000) != 0)
    {
      BOOL v12 = [(PXCuratedLibraryViewModel *)self allowedActions];
      char v13 = [v12 containsObject:@"PXCuratedLibraryActionNavigateToYearsMonthsOrDays"];

      if ((v13 & 1) == 0)
      {
        int v11 = (uint64_t *)&__block_literal_global_292_113442;
        goto LABEL_53;
      }
    }
  }
  else if ((void *)PXCuratedLibraryViewModelZoomablePhotosObserverContext == a5)
  {
    if (a4)
    {
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_2;
      v50[3] = &unk_1E5DCF3F0;
      v50[4] = self;
      int v11 = v50;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelSelectionObserverContext == a5)
  {
    [(PXCuratedLibraryViewModel *)self _handleSelectionManagerChange:a4];
  }
  else if ((void *)PXCuratedLibraryViewModelScrollingSpeedometerObserverContext == a5)
  {
    if ((a4 & 0xA) != 0)
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_3;
      v49[3] = &unk_1E5DCF3F0;
      v49[4] = self;
      int v11 = v49;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelSpecManagerObserverContext == a5)
  {
    if (a4) {
      [(PXCuratedLibraryViewModel *)self _handleSpecChange];
    }
  }
  else if ((void *)PXCuratedLibraryViewModelAnalysisStatusObserverContext == a5)
  {
    if ((a4 & 0x20) != 0)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_4;
      v48[3] = &unk_1E5DCF3F0;
      v48[4] = self;
      int v11 = v48;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelAllPhotosDataSourceManagerObserverContext == a5)
  {
    if (a4)
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_5;
      v47[3] = &unk_1E5DCF3F0;
      v47[4] = self;
      int v11 = v47;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelAssetsDataSourceManagerObserverContext == a5)
  {
    if ((a4 & 2) != 0)
    {
      v14 = [(PXCuratedLibraryViewModel *)self selectionManager];
      [v14 performChanges:&__block_literal_global_294];

      [(PXCuratedLibraryViewModel *)self _invalidateAssetCollectionActionManager];
    }
    if ((a4 & 4) != 0)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_7;
      v46[3] = &unk_1E5DCF3F0;
      v46[4] = self;
      int v11 = v46;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelAssetSelectionTypeObserverContext == a5)
  {
    if (a4)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_8;
      v44[3] = &unk_1E5DBB000;
      v44[4] = self;
      id v45 = v9;
      [(PXCuratedLibraryViewModel *)self performChanges:v44];
    }
  }
  else if ((void *)PXSharedLibrarySharingSuggestionsCountsManagerObservationContext == a5)
  {
    if ((a4 & 0xA) != 0)
    {
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      float v41 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_9;
      double v42 = &unk_1E5DCF3F0;
      BOOL v43 = self;
      int v11 = &v39;
      goto LABEL_53;
    }
  }
  else if ((void *)PXPhotosSortOrderStateObservationContext == a5)
  {
    if (a4)
    {
      uint64_t v34 = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      char v36 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_10;
      uint64_t v37 = &unk_1E5DCF3F0;
      uint64_t v38 = self;
      int v11 = &v34;
      goto LABEL_53;
    }
  }
  else if ((void *)PXSharedLibraryCameraSharingBannerStatusProviderObservationContext == a5)
  {
    if (a4)
    {
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      uint64_t v31 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_11;
      char v32 = &unk_1E5DCF3F0;
      uint64_t v33 = self;
      int v11 = &v29;
      goto LABEL_53;
    }
  }
  else if ((void *)PXSharedLibraryStatusProviderObservationContext_113443 == a5)
  {
    if ((a4 & 3) != 0)
    {
      if (a4)
      {
        id v16 = [(PXCuratedLibraryViewModel *)self sharedLibraryStatusProvider];
        if ([v16 hasSharedLibraryOrPreview]) {
          uint64_t v15 = 2;
        }
        else {
          uint64_t v15 = 0;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      id v17 = [(PXCuratedLibraryViewModel *)self libraryFilterState];
      [v17 setViewMode:v15];

      uint64_t v24 = MEMORY[0x1E4F143A8];
      uint64_t v25 = 3221225472;
      int v26 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_12;
      int v27 = &unk_1E5DCF3F0;
      int v28 = self;
      int v11 = &v24;
      goto LABEL_53;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_113444 != a5)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryViewModel.m" lineNumber:1506 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (a4)
    {
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      uint64_t v21 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_13;
      uint64_t v22 = &unk_1E5DCF3F0;
      v23 = self;
      int v11 = &v19;
LABEL_53:
      -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v11, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42,
        v43);
    }
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryViewModel;
  [(PXCuratedLibraryViewModel *)&v3 performChanges:a3];
}

- (void)_updateUserWantsAspectFitContent
{
  id v7 = +[PXUserDefaults standardUserDefaults];
  objc_super v3 = [v7 allPhotosAspectFit];
  int64_t v4 = [(PXCuratedLibraryViewModel *)self specManager];
  id v5 = [v4 spec];

  if ([v5 userInterfaceIdiom] == 2 && objc_msgSend(v5, "sizeClass") == 1)
  {
    uint64_t v6 = [v7 allPhotosAspectFitInCompact];

    objc_super v3 = (void *)v6;
  }
  [(PXCuratedLibraryViewModel *)self setUserWantsAspectFitContent:v3];
}

- (void)setUserWantsAspectFitContent:(id)a3
{
  BOOL v12 = (NSNumber *)a3;
  int64_t v4 = self->_userWantsAspectFitContent;
  id v5 = v12;
  if (v4 != v12)
  {
    uint64_t v6 = v4;
    char v7 = [(NSNumber *)v4 isEqual:v12];

    if (v7) {
      goto LABEL_9;
    }
    id v8 = (NSNumber *)[(NSNumber *)v12 copy];
    userWantsAspectFitContent = self->_userWantsAspectFitContent;
    self->_userWantsAspectFitContent = v8;

    int v10 = [(PXCuratedLibraryViewModel *)self specManager];
    id v5 = [v10 spec];

    if ([v5 userInterfaceIdiom] == 2 && objc_msgSend(v5, "sizeClass") == 1)
    {
      int v11 = +[PXUserDefaults standardUserDefaults];
      [v11 setAllPhotosAspectFitInCompact:v12];
    }
    else
    {
      int v11 = +[PXUserDefaults standardUserDefaults];
      [v11 setAllPhotosAspectFit:v12];
    }

    [(PXCuratedLibraryViewModel *)self _invalidateAspectFitContent];
  }

LABEL_9:
}

- (void)_handleSpecChange
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__PXCuratedLibraryViewModel__handleSpecChange__block_invoke;
  v2[3] = &unk_1E5DCF3F0;
  v2[4] = self;
  [(PXCuratedLibraryViewModel *)self performChanges:v2];
}

- (void)_handleSelectionManagerChange:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PXCuratedLibraryViewModel__handleSelectionManagerChange___block_invoke;
  v3[3] = &unk_1E5DBB100;
  v3[4] = self;
  void v3[5] = a3;
  [(PXCuratedLibraryViewModel *)self performChanges:v3];
}

- (PXCuratedLibraryVideoPlaybackController)videoPlaybackController
{
  return self->_videoPlaybackController;
}

- (void)_sendAllPhotosSortOrderAnalyticsEvent:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PXCuratedLibraryViewModel__sendAllPhotosSortOrderAnalyticsEvent___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (_sendAllPhotosSortOrderAnalyticsEvent__onceToken != -1) {
    dispatch_once(&_sendAllPhotosSortOrderAnalyticsEvent__onceToken, block);
  }
}

- (void)_invalidateAssetCollectionActionManager
{
  assetCollectionActionManager = self->_assetCollectionActionManager;
  self->_assetCollectionActionManager = 0;
}

- (void)_updateDesiredVerticalAlignment
{
  uint64_t v3 = [(PXCuratedLibraryViewModel *)self shouldShowEmptyPlaceholder];
  [(PXCuratedLibraryViewModel *)self setDesiredVerticalAlignment:v3];
}

void __59__PXCuratedLibraryViewModel__handleSelectionManagerChange___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 40);
  if ((v3 & 2) != 0)
  {
    [*(id *)(a1 + 32) _invalidateCurrentDataSource];
    uint64_t v3 = *(void *)(a1 + 40);
  }
  if (v3)
  {
    [*(id *)(a1 + 32) _invalidateAssetActionManager];
    [*(id *)(a1 + 32) signalChange:8];
  }
}

- (void)_invalidateCurrentDataSource
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentDataSource];
}

- (void)_invalidateAssetActionManager
{
  uint64_t v3 = [(PXCuratedLibraryViewModel *)self assetActionManager];
  id v6 = [v3 allowedActionTypes];

  id v4 = [(PXCuratedLibraryViewModel *)self _assetActionManagerWithAllowedActionTypes:v6];
  assetActionManager = self->_assetActionManager;
  self->_assetActionManager = v4;
}

- (PXAssetActionManager)assetActionManager
{
  assetActionManager = self->_assetActionManager;
  if (!assetActionManager)
  {
    id v4 = [(PXCuratedLibraryViewModel *)self _assetActionManagerWithAllowedActionTypes:0];
    id v5 = self->_assetActionManager;
    self->_assetActionManager = v4;

    assetActionManager = self->_assetActionManager;
  }
  return assetActionManager;
}

- (PXLibrarySummaryOutputPresenter)librarySummaryPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_librarySummaryPresenter);
  return (PXLibrarySummaryOutputPresenter *)WeakRetained;
}

- (BOOL)isResetting
{
  return self->_isResetting;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (int64_t)zoomLevelTransitionPhase
{
  return self->_zoomLevelTransitionPhase;
}

- (int64_t)scrollRegime
{
  return self->_scrollRegime;
}

- (PXCPLUIStatusProvider)cplUIStatusProvider
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  cplUIStatusProvider = self->_cplUIStatusProvider;
  if (!cplUIStatusProvider)
  {
    cplActionManagerClass = self->_cplActionManagerClass;
    if (cplActionManagerClass) {
      id v5 = (void *)[[cplActionManagerClass alloc] initWithPhotoLibrary:self->_photoLibrary];
    }
    else {
      id v5 = 0;
    }
    id v6 = [[PXCPLUIStatusProvider alloc] initWithPhotoLibrary:self->_photoLibrary actionManager:v5];
    char v7 = self->_cplUIStatusProvider;
    self->_cplUIStatusProvider = v6;

    id v8 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      int v10 = self->_cplUIStatusProvider;
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did assign %{public}@", (uint8_t *)&v12, 0x20u);
    }

    cplUIStatusProvider = self->_cplUIStatusProvider;
  }
  return cplUIStatusProvider;
}

- (void)addPresenter:(id)a3
{
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (PXCuratedLibraryActionManager)actionManager
{
  return self->_actionManager;
}

void __59__PXCuratedLibraryViewModel__updateAssetsDataSourceManager__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 loadIfNeeded];
  objc_msgSend(v3, "setZoomLevel:", objc_msgSend(*(id *)(a1 + 32), "zoomLevel"));
  [v3 setAllPhotosFilterPredicate:*(void *)(a1 + 40)];
  [v3 setAllPhotosSortDescriptors:*(void *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) libraryFilterState];
  objc_msgSend(v3, "setLibraryFilter:", objc_msgSend(v4, "viewMode"));

  id v5 = +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:*(void *)(*(void *)(a1 + 32) + 168)];
  objc_msgSend(v3, "setCanIncludeUnsavedSyndicatedAssets:", objc_msgSend(v5, "showUnsavedSyndicatedContentInPhotosGrids"));
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  id v2 = [(PXCuratedLibraryViewModel *)self selectionManager];
  id v3 = [v2 selectionSnapshot];

  return (PXSelectionSnapshot *)v3;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (BOOL)isFullyExpanded
{
  return self->_isFullyExpanded;
}

- (void)_updateZoomablePhotosViewModel
{
  id v3 = [(PXCuratedLibraryViewModel *)self zoomablePhotosViewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PXCuratedLibraryViewModel__updateZoomablePhotosViewModel__block_invoke;
  v4[3] = &unk_1E5DBDFA0;
  v4[4] = self;
  [v3 performChanges:v4];
}

void __59__PXCuratedLibraryViewModel__updateZoomablePhotosViewModel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "setIsInSelectMode:", objc_msgSend(v3, "isSelecting"));
  objc_msgSend(v5, "setViewBasedDecorationsEnabled:", objc_msgSend(*(id *)(a1 + 32), "viewBasedDecorationsEnabled"));
  id v4 = [*(id *)(a1 + 32) draggedAssetReferences];
  [v5 setDraggedAssetReferences:v4];

  objc_msgSend(v5, "setAspectFit:", objc_msgSend(*(id *)(a1 + 32), "aspectFitContent"));
  objc_msgSend(v5, "setIsInteractiveZoomingAllowed:", objc_msgSend(*(id *)(a1 + 32), "isExpanded"));
}

- (void)_updateDraggedAssetReferences
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXCuratedLibraryViewModel *)self currentDataSource];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(PXCuratedLibraryViewModel *)self draggedAssetReferences];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [v3 assetReferenceForAssetReference:*(void *)(*((void *)&v14 + 1) + 8 * v9)];
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PXCuratedLibraryViewModel__updateDraggedAssetReferences__block_invoke;
  v12[3] = &unk_1E5DCF3F0;
  id v13 = v4;
  id v11 = v4;
  [(PXCuratedLibraryViewModel *)self performChanges:v12];
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (BOOL)viewBasedDecorationsEnabled
{
  return self->_viewBasedDecorationsEnabled;
}

- (BOOL)aspectFitContent
{
  return self->_aspectFitContent;
}

- (void)setAspectFitContent:(BOOL)a3
{
  if (self->_aspectFitContent != a3)
  {
    self->_aspectFitContent = a3;
    [(PXCuratedLibraryViewModel *)self _invalidateZoomablePhotosViewModel];
  }
}

- (id)visibleAssetCollectionsFromCuratedLibraryAssetsDataSourceManager:(id)a3
{
  id v3 = [(PXCuratedLibraryViewModel *)self visibleAssetCollections];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (NSSet)visibleAssetCollections
{
  return (NSSet *)self->_visibleAssetCollections;
}

- (void)setZoomLevel:(int64_t)a3
{
  int64_t zoomLevel = self->_zoomLevel;
  if (zoomLevel != a3)
  {
    self->_int64_t zoomLevel = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:4];
    [(PXCuratedLibraryViewModel *)self _invalidateAssetsDataSourceManager];
    [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
    [(PXCuratedLibraryViewModel *)self _invalidateCurrentContentFilterState];
    if (![(PXCuratedLibraryViewModel *)self isPerformingInitialChanges])
    {
      uint64_t v6 = [NSNumber numberWithInteger:a3];
      uint64_t v7 = +[PXUserDefaults standardUserDefaults];
      [v7 setCuratedLibraryZoomLevel:v6];
    }
    if (a3 == 4 && (unint64_t)(zoomLevel - 1) <= 1)
    {
      uint64_t v8 = [(PXCuratedLibraryViewModel *)self zoomablePhotosViewModel];
      char v9 = [v8 isDisplayingIndividualItems];

      if ((v9 & 1) == 0)
      {
        id v10 = [(PXCuratedLibraryViewModel *)self zoomablePhotosViewModel];
        [v10 performChanges:&__block_literal_global_113500];
      }
    }
  }
}

- (void)setSidebarCanBecomeVisible:(BOOL)a3
{
  if (self->_sidebarCanBecomeVisible != a3)
  {
    self->_sidebarCanBecomeVisible = a3;
    [(PXCuratedLibraryViewModel *)self _invalidateAllowedActions];
    [(PXCuratedLibraryViewModel *)self signalChange:0x40000000];
  }
}

uint64_t __67__PXCuratedLibraryViewModel__sendAllPhotosSortOrderAnalyticsEvent___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) == 1) {
    v1 = @"com.apple.photos.CPAnalytics.allPhotosSortOrderDateCreated";
  }
  else {
    v1 = @"com.apple.photos.CPAnalytics.allPhotosSortOrderDateAdded";
  }
  return [MEMORY[0x1E4F56658] sendEvent:v1 withPayload:MEMORY[0x1E4F1CC08]];
}

- (void)_updateAspectFitContent
{
  id v3 = [(PXCuratedLibraryViewModel *)self specManager];
  id v4 = [v3 spec];
  uint64_t v5 = [v4 userInterfaceIdiom] == 4;

  uint64_t v6 = [(PXCuratedLibraryViewModel *)self userWantsAspectFitContent];

  if (v6)
  {
    uint64_t v7 = [(PXCuratedLibraryViewModel *)self userWantsAspectFitContent];
    uint64_t v5 = [v7 BOOLValue];
  }
  [(PXCuratedLibraryViewModel *)self setAspectFitContent:v5];
}

- (NSNumber)userWantsAspectFitContent
{
  return self->_userWantsAspectFitContent;
}

- (void)addView:(id)a3
{
  [(NSHashTable *)self->_views addObject:a3];
  [(PXCuratedLibraryViewModel *)self _invalidateScrollingSpeedometer];
}

- (void)_invalidateScrollingSpeedometer
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateScrollingSpeedometer];
}

uint64_t __51__PXCuratedLibraryViewModel_performInitialChanges___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 159);
  *(unsigned char *)(v2 + 159) = 1;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 159) = v3;
  return result;
}

- (void)setCplActionManagerClass:(Class)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  p_cplActionManagerClass = &self->_cplActionManagerClass;
  if (*p_cplActionManagerClass != a3)
  {
    objc_storeStrong((id *)p_cplActionManagerClass, a3);
    cplUIStatusProvider = self->_cplUIStatusProvider;
    if (cplUIStatusProvider)
    {
      self->_cplUIStatusProvider = 0;

      uint64_t v6 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 138543618;
        uint64_t v8 = objc_opt_class();
        __int16 v9 = 2048;
        id v10 = self;
        _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did reset PXCPLUIStatusProvider", (uint8_t *)&v7, 0x16u);
      }
    }
    [(PXCuratedLibraryViewModel *)self signalChange:0x10000000];
  }
}

- (void)setBannerViewConfiguration:(id)a3
{
  uint64_t v8 = (PXBannerViewConfiguration *)a3;
  uint64_t v5 = self->_bannerViewConfiguration;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PXBannerViewConfiguration *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bannerViewConfiguration, a3);
      [(PXCuratedLibraryViewModel *)self _invalidateChromeVisibility];
      [(PXCuratedLibraryViewModel *)self signalChange:0x80000000];
    }
  }
}

- (void)_updateAssetsDataSourceManager
{
  char v3 = [(PXCuratedLibraryViewModel *)self allPhotosContentFilterState];
  id v4 = [v3 predicateForUseCase:0];

  uint64_t v5 = [(PXCuratedLibraryViewModel *)self viewOptionsModel];
  uint64_t v6 = [v5 sortOrderState];
  uint64_t v7 = [v6 sortOrder];

  uint64_t v8 = PXFetchSortOrderStandardAssetSortDescriptors(v7);
  __int16 v9 = [(PXCuratedLibraryViewModel *)self assetsDataSourceManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PXCuratedLibraryViewModel__updateAssetsDataSourceManager__block_invoke;
  v12[3] = &unk_1E5DBAF00;
  void v12[4] = self;
  id v13 = v4;
  id v14 = v8;
  id v10 = v8;
  id v11 = v4;
  [v9 performChanges:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryCameraSharingBannerStatusProvider, 0);
  objc_storeStrong((id *)&self->_sharedLibrarySuggestionCountsManager, 0);
  objc_storeStrong((id *)&self->_scrollingSpeedometer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_destroyWeak((id *)&self->_librarySummaryPresenter);
  objc_storeStrong((id *)&self->_bannerViewConfiguration, 0);
  objc_storeStrong((id *)&self->_userWantsAspectFitContent, 0);
  objc_storeStrong((id *)&self->_cplActionManagerClass, 0);
  objc_storeStrong((id *)&self->_analysisStatus, 0);
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong((id *)&self->_allPhotosContentFilterState, 0);
  objc_storeStrong((id *)&self->_currentContentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_selectModeCaption, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_storeStrong((id *)&self->_skimmingInfo, 0);
  objc_storeStrong((id *)&self->_zoomablePhotosViewModel, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_allowedActions, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_videoPlaybackController, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_visibleAssetCollections, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_presenters, 0);
}

- (PXSharedLibraryCameraSharingBannerStatusProvider)sharedLibraryCameraSharingBannerStatusProvider
{
  return self->_sharedLibraryCameraSharingBannerStatusProvider;
}

- (PXSharedLibrarySharingSuggestionsCountsManager)sharedLibrarySuggestionCountsManager
{
  return self->_sharedLibrarySuggestionCountsManager;
}

- (BOOL)isPerformingInitialChanges
{
  return self->_isPerformingInitialChanges;
}

- (BOOL)hideStatusFooterInSelectMode
{
  return self->_hideStatusFooterInSelectMode;
}

- (BOOL)enableFooter
{
  return self->_enableFooter;
}

- (BOOL)wantsSidebarVisible
{
  return self->_wantsSidebarVisible;
}

- (BOOL)sidebarCanBecomeVisible
{
  return self->_sidebarCanBecomeVisible;
}

- (Class)cplActionManagerClass
{
  return self->_cplActionManagerClass;
}

- ($DE30A600513D762F9B6AB73D2AED4B95)selectedAssetsTypedCount
{
  p_selectedAssetsTypedCount = &self->_selectedAssetsTypedCount;
  unint64_t count = self->_selectedAssetsTypedCount.count;
  int64_t type = p_selectedAssetsTypedCount->type;
  result.var1 = type;
  result.var0 = count;
  return result;
}

- (NSString)selectModeCaption
{
  return self->_selectModeCaption;
}

- (PXCuratedLibraryAssetCollectionSkimmingInfo)skimmingInfo
{
  return self->_skimmingInfo;
}

- (CGPoint)lastScrollDirection
{
  double x = self->_lastScrollDirection.x;
  double y = self->_lastScrollDirection.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)daysMarginScale
{
  return self->_daysMarginScale;
}

- (BOOL)isModalInPresentation
{
  return self->_isModalInPresentation;
}

- (BOOL)wantsDarkStatusBar
{
  return self->_wantsDarkStatusBar;
}

- (BOOL)wantsOptionalChromeVisible
{
  return self->_wantsOptionalChromeVisible;
}

- (void)setAssetCollectionActionManager:(id)a3
{
}

- (void)setAssetActionManager:(id)a3
{
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  uint64_t v6 = NSStringFromSelector(sel_enableNewActionMenu);
  if ([v5 isEqualToString:v6])
  {

LABEL_4:
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PXCuratedLibraryViewModel_settings_changedValueForKey___block_invoke;
    v9[3] = &unk_1E5DCF3F0;
    v9[4] = self;
    [(PXCuratedLibraryViewModel *)self performChanges:v9];
    goto LABEL_5;
  }
  uint64_t v7 = NSStringFromSelector(sel_enableContentFiltering);
  int v8 = [v5 isEqualToString:v7];

  if (v8) {
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __57__PXCuratedLibraryViewModel_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateAllowedActions];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  if ((void *)PXUserDefaultsObservationContext == a6)
  {
    id v10 = (void *)MEMORY[0x1E4F1CB18];
    id v11 = a4;
    int v12 = [v10 standardUserDefaults];
    LODWORD(v10) = [v11 isEqual:v12];

    if (v10)
    {
      if ([v9 isEqual:@"IncludeSharedWithYou"])
      {

LABEL_7:
        id v14 = [(PXCuratedLibraryViewModel *)self _updatedContentFilterState];
        objc_initWeak(&location, self);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__PXCuratedLibraryViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1E5DD20C8;
        objc_copyWeak(&v18, &location);
        id v17 = v14;
        id v15 = v14;
        dispatch_async(MEMORY[0x1E4F14428], block);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      char v13 = [v9 isEqual:@"IncludeScreenshots"];

      if (v13) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
LABEL_8:
}

void __76__PXCuratedLibraryViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__PXCuratedLibraryViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v4[3] = &unk_1E5DBB028;
  objc_copyWeak(&v6, v2);
  id v5 = *(id *)(a1 + 32);
  [WeakRetained performChanges:v4];

  objc_destroyWeak(&v6);
}

void __76__PXCuratedLibraryViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAllPhotosContentFilterState:v1];
}

- (id)_updatedContentFilterState
{
  char v3 = +[PXUserDefaults standardUserDefaults];
  id v4 = [(PXCuratedLibraryViewModel *)self allPhotosContentFilterState];
  id v5 = (void *)[v4 copy];

  id v6 = [v3 includeScreenshots];
  objc_msgSend(v5, "setIncludeScreenshots:", objc_msgSend(v6, "BOOLValue"));

  uint64_t v7 = [v3 includeSharedWithYou];
  objc_msgSend(v5, "setIncludeSharedWithYou:", objc_msgSend(v7, "BOOLValue"));

  return v5;
}

- (void)_handleIsSelectingChange
{
  if (![(PXCuratedLibraryViewModel *)self isSelecting])
  {
    char v3 = [(PXCuratedLibraryViewModel *)self selectionManager];
    [v3 performChanges:&__block_literal_global_300];
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PXCuratedLibraryViewModel__handleIsSelectingChange__block_invoke_2;
  v4[3] = &unk_1E5DCF3F0;
  void v4[4] = self;
  [(PXCuratedLibraryViewModel *)self performChanges:v4];
}

uint64_t __53__PXCuratedLibraryViewModel__handleIsSelectingChange__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateSelectModeCaption];
}

uint64_t __53__PXCuratedLibraryViewModel__handleIsSelectingChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateScrollingProperties];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_8(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 40) typedCount];
  id v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setSelectedAssetsTypedCount:", v3, v2);
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateBannerViewConfiguration];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_10(uint64_t a1)
{
  [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.CPAnalytics.allPhotosSortOrderChanged" withPayload:MEMORY[0x1E4F1CC08]];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateAssetsDataSourceManager];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateBannerViewConfiguration];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_12(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateBannerViewConfiguration];
  [*(id *)(a1 + 32) _invalidateChromeVisibility];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateAllowedActions];
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_13(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateAssetsDataSourceManager];
  [*(id *)(a1 + 32) _invalidateCurrentDataSource];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _invalidateAllowedActions];
}

- (id)selectionManager:(id)a3 validateSnapshot:(id)a4
{
  return a4;
}

- (int64_t)curatedLibraryAssetsDataSourceManager:(id)a3 transitionTypeFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  int v8 = [(PXCuratedLibraryViewModel *)self mainPresenter];
  if (objc_opt_respondsToSelector()) {
    int64_t v9 = [v8 viewModel:self transitionTypeFromZoomLevel:a4 toZoomLevel:a5];
  }
  else {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)curatedLibraryAssetsDataSourceManager:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4
{
  id v6 = [(PXCuratedLibraryViewModel *)self mainPresenter];
  uint64_t v7 = [v6 viewModel:self dominantAssetCollectionReferenceForZoomLevel:a4];

  return v7;
}

- (void)curatedLibraryAssetsDataSourceManager:(id)a3 didTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v8 = [(PXCuratedLibraryViewModel *)self presenters];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 viewModel:self didTransitionFromZoomLevel:a4 toZoomLevel:a5];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)curatedLibraryAssetsDataSourceManager:(id)a3 willTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v8 = [(PXCuratedLibraryViewModel *)self presenters];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        char v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 viewModel:self willTransitionFromZoomLevel:a4 toZoomLevel:a5];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)_updateIsModalInPresentation
{
  BOOL v3 = [(PXCuratedLibraryViewModel *)self isSelecting];
  [(PXCuratedLibraryViewModel *)self setIsModalInPresentation:v3];
}

- (void)_invalidateIsModalInPresentation
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateIsModalInPresentation];
}

- (void)_updateSelectModeCaption
{
  id v16 = [(PXCuratedLibraryViewModel *)self selectionSnapshot];
  if ([v16 isAnyItemSelected])
  {
    uint64_t v4 = [(PXCuratedLibraryViewModel *)self selectedAssetsTypedCount];
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = *(void *)off_1E5DAAEF8;
    uint64_t v6 = *((void *)off_1E5DAAEF8 + 1);
  }
  uint64_t v7 = [(PXCuratedLibraryViewModel *)self sharedLibraryStatusProvider];
  if (![v7 hasPreview])
  {

    goto LABEL_15;
  }
  int v8 = [v16 isAnyItemSelected];

  if (!v8)
  {
LABEL_15:
    long long v14 = PXLocalizedSelectModeCaption([(PXCuratedLibraryViewModel *)self isSelecting], v4, v6);
    goto LABEL_16;
  }
  uint64_t v9 = [(PXCuratedLibraryViewModel *)self assetActionManager];
  int v10 = [v9 canPerformActionType:@"PXAssetActionTypeMoveToPersonalLibrary"];
  int v11 = [v9 canPerformActionType:@"PXAssetActionTypeMoveToSharedLibrary"];
  if ((v10 & 1) == 0 && (v11 & 1) == 0)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryViewModel.m" lineNumber:973 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v12 = 15;
  if ((v10 & v11) == 0) {
    uint64_t v12 = 16;
  }
  if (v10) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 17;
  }
  long long v14 = PXLocalizedSharedLibraryAssetCountForUsage(v4, v6, 0, v13);

LABEL_16:
  [(PXCuratedLibraryViewModel *)self setSelectModeCaption:v14];
}

- (void)_invalidateSelectModeCaption
{
  id v2 = [(PXCuratedLibraryViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateSelectModeCaption];
}

- (void)setSelectedAssetsTypedCount:(id)a3
{
  if (a3.var0 != self->_selectedAssetsTypedCount.count || a3.var1 != self->_selectedAssetsTypedCount.type)
  {
    self->_selectedAssetsTypedCount = ($7D1650DB7441A0F5833AC641852B48F3)a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x8000000];
    [(PXCuratedLibraryViewModel *)self _invalidateSelectModeCaption];
  }
}

- (void)resetToInitialState
{
  [(PXCuratedLibraryViewModel *)self setIsResetting:1];
  BOOL v3 = [(PXCuratedLibraryViewModel *)self zoomablePhotosViewModel];
  [v3 saveCurrentZoomLevelAsUserPreferredIfPossible];

  [(PXCuratedLibraryViewModel *)self setZoomLevel:4];
  uint64_t v4 = [(PXCuratedLibraryViewModel *)self allPhotosContentFilterState];
  int v5 = [v4 isFiltering];

  if (v5) {
    [(PXCuratedLibraryViewModel *)self resetAllPhotosContentFilterState];
  }
  id v6 = [(PXCuratedLibraryViewModel *)self zoomablePhotosViewModel];
  [v6 performChanges:&__block_literal_global_272];
}

uint64_t __48__PXCuratedLibraryViewModel_resetToInitialState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 resetToInitialState];
}

- (BOOL)isResetToInitialState
{
  if ([(PXCuratedLibraryViewModel *)self zoomLevel] != 4) {
    return 0;
  }
  BOOL v3 = [(PXCuratedLibraryViewModel *)self allPhotosContentFilterState];
  char v4 = [v3 isFiltering];

  if (v4) {
    return 0;
  }
  id v6 = [(PXCuratedLibraryViewModel *)self zoomablePhotosViewModel];
  char v7 = [v6 isResetToInitialState];

  return v7;
}

- (void)setSecondaryToolbarLegibilityGradientIsVisible:(BOOL)a3
{
  if (self->_secondaryToolbarLegibilityGradientIsVisible != a3)
  {
    self->_secondaryToolbarLegibilityGradientIsVisible = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x400000000];
  }
}

- (void)setIsModalInPresentation:(BOOL)a3
{
  if (self->_isModalInPresentation != a3)
  {
    self->_isModalInPresentation = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x200000000];
  }
}

- (void)setWantsZoomControlVisible:(BOOL)a3
{
  self->_wantsZoomControlVisible = a3;
  [(PXCuratedLibraryViewModel *)self signalChange:0x100000000];
}

- (void)setWantsSidebarVisible:(BOOL)a3
{
  self->_wantsSidebarVisible = a3;
  [(PXCuratedLibraryViewModel *)self signalChange:0x20000000];
}

- (id)_indexPathsForAssetCollectionReference:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  int v5 = [(PXCuratedLibraryViewModel *)self currentDataSource];
  id v6 = v5;
  if (v5)
  {
    [v5 indexPathForAssetCollectionReference:v4];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }

  char v7 = [(PXCuratedLibraryViewModel *)self currentDataSource];
  v10[0] = v11;
  v10[1] = v12;
  int v8 = [v7 indexPathSetForItemsInIndexPath:v10];

  return v8;
}

- (void)toggleSelectionForAssetCollectionReference:(id)a3
{
  id v4 = [(PXCuratedLibraryViewModel *)self _indexPathsForAssetCollectionReference:a3];
  int v5 = [(PXCuratedLibraryViewModel *)self selectionSnapshot];
  id v6 = [v5 selectedIndexPaths];
  char v7 = [v4 isSubsetOfSet:v6];

  int v8 = [(PXCuratedLibraryViewModel *)self selectionManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = __72__PXCuratedLibraryViewModel_toggleSelectionForAssetCollectionReference___block_invoke;
  v10[3] = &unk_1E5DCFE48;
  char v12 = v7;
  id v11 = v4;
  id v9 = v4;
  [v8 performChanges:v10];
}

uint64_t __72__PXCuratedLibraryViewModel_toggleSelectionForAssetCollectionReference___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedState:*(unsigned char *)(a1 + 40) == 0 forIndexPathSet:*(void *)(a1 + 32)];
}

- (void)toggleSelectionForAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  char v7 = [(PXCuratedLibraryViewModel *)self currentDataSource];
  int v8 = v7;
  if (v7)
  {
    [v7 indexPathForAssetReference:v6];
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }

  if ((void)v11 == *(void *)off_1E5DAAED8)
  {
    id v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [(PXCuratedLibraryViewModel *)self currentDataSource];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_DEFAULT, "can't toggle selection for %@ because it's not in %@", buf, 0x16u);
    }
  }
  else
  {
    *(_OWORD *)buf = v11;
    *(_OWORD *)&buf[16] = v12;
    [(PXCuratedLibraryViewModel *)self toggleSelectionForIndexPath:buf updateCursorIndexPath:v4];
  }
}

- (void)toggleSelectionForAssetReference:(id)a3
{
}

- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4
{
  char v7 = [(PXCuratedLibraryViewModel *)self selectionSnapshot];
  long long v8 = *(_OWORD *)&a3->item;
  v17[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v17[1] = v8;
  char v9 = [v7 isIndexPathSelected:v17];

  int v10 = [(PXCuratedLibraryViewModel *)self selectionManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PXCuratedLibraryViewModel_toggleSelectionForIndexPath_updateCursorIndexPath___block_invoke;
  v12[3] = &__block_descriptor_66_e37_v16__0___PXMutableSelectionManager__8l;
  char v15 = v9;
  long long v11 = *(_OWORD *)&a3->item;
  long long v13 = *(_OWORD *)&a3->dataSourceIdentifier;
  long long v14 = v11;
  BOOL v16 = a4;
  [v10 performChanges:v12];
}

uint64_t __79__PXCuratedLibraryViewModel_toggleSelectionForIndexPath_updateCursorIndexPath___block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(unsigned char *)(a1 + 64) == 0;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 65);
  long long v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  return [a2 setSelectedState:v2 forIndexPath:v6 andUpdateCursorIndexPath:v3];
}

- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3
{
  long long v3 = *(_OWORD *)&a3->item;
  v4[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v4[1] = v3;
  [(PXCuratedLibraryViewModel *)self toggleSelectionForIndexPath:v4 updateCursorIndexPath:0];
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  assetCollectionActionManager = self->_assetCollectionActionManager;
  if (!assetCollectionActionManager)
  {
    long long v4 = [(PXCuratedLibraryViewModel *)self assetsDataSourceManager];
    int v5 = [v4 currentPhotoKitAssetsDataSourceManager];

    id v6 = [[PXPhotoKitAssetCollectionActionManager alloc] initWithAssetCollectionReference:0 displayTitleInfo:0];
    [(PXAssetCollectionActionManager *)v6 setAssetsDataSourceManager:v5];
    char v7 = self->_assetCollectionActionManager;
    self->_assetCollectionActionManager = &v6->super;

    assetCollectionActionManager = self->_assetCollectionActionManager;
  }
  return assetCollectionActionManager;
}

- (void)userDidSetAllPhotosContentFilterState:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PXCuratedLibraryViewModel *)self zoomLevel] == 4)
  {
    [(PXCuratedLibraryViewModel *)self setAllPhotosContentFilterState:v4];
  }
  else
  {
    int v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134217984;
      int64_t v7 = [(PXCuratedLibraryViewModel *)self zoomLevel];
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Attempted content filtering with unexpected zoom level %li", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (int64_t)zoomLevelInDirection:(int64_t)a3 fromZoomLevel:(int64_t)a4
{
  if (a3 >= 1) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = a3;
  }
  if (v5 < 0) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = v5;
  }
  int64_t v7 = [(PXCuratedLibraryViewModel *)self configuration];
  int64_t v8 = v6 + a4;
  if (v8 > 4)
  {
LABEL_10:
    int64_t v8 = 0;
  }
  else
  {
    while (([v7 isZoomLevelEnabled:v8] & 1) == 0)
    {
      if (++v8 == 5) {
        goto LABEL_10;
      }
    }
  }

  return v8;
}

uint64_t __42__PXCuratedLibraryViewModel_setZoomLevel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 zoomInToIndividualItemsWithAnchorAssetReference:0 animated:0];
}

- (void)removeView:(id)a3
{
  [(NSHashTable *)self->_views removeObject:a3];
  [(PXCuratedLibraryViewModel *)self _invalidateScrollingSpeedometer];
}

- (PXCuratedLibraryViewModelPresenter)mainPresenter
{
  BOOL v2 = [(PXCuratedLibraryViewModel *)self presenters];
  long long v3 = [v2 firstObject];

  return (PXCuratedLibraryViewModelPresenter *)v3;
}

- (void)removePresenter:(id)a3
{
}

- (NSArray)presenters
{
  return [(NSHashTable *)self->_presenters allObjects];
}

- (void)setSelectModeCaption:(id)a3
{
  int64_t v8 = (NSString *)a3;
  id v4 = self->_selectModeCaption;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      uint64_t v6 = (NSString *)[(NSString *)v8 copy];
      selectModeCaption = self->_selectModeCaption;
      self->_selectModeCaption = v6;

      [(PXCuratedLibraryViewModel *)self signalChange:2];
    }
  }
}

- (PXAssetReference)singleSelectedAssetReference
{
  long long v3 = [(PXCuratedLibraryViewModel *)self selectionManager];
  id v4 = [v3 selectionSnapshot];

  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = [v4 selectedIndexPaths];
  if ([v5 count] == 1)
  {
    if (v4)
    {
      [v4 firstSelectedIndexPath];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }
  }
  else
  {
    long long v6 = *((_OWORD *)off_1E5DAB028 + 1);
    long long v13 = *(_OWORD *)off_1E5DAB028;
    long long v14 = v6;
  }

  if ((void)v13 != *(void *)off_1E5DAAED8
    && (void)v14 != 0x7FFFFFFFFFFFFFFFLL
    && *((void *)&v14 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v10 = [(PXCuratedLibraryViewModel *)self currentDataSource];
    v12[0] = v13;
    v12[1] = v14;
    char v9 = [v10 assetReferenceAtItemIndexPath:v12];
  }
  else
  {
    char v9 = 0;
  }

  return (PXAssetReference *)v9;
}

- (void)setSkimmingInfo:(id)a3
{
  int64_t v7 = (PXCuratedLibraryAssetCollectionSkimmingInfo *)a3;
  BOOL v5 = self->_skimmingInfo;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXCuratedLibraryAssetCollectionSkimmingInfo *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_skimmingInfo, a3);
      [(PXCuratedLibraryViewModel *)self signalChange:512];
    }
  }
}

- (void)setDaysMarginScale:(double)a3
{
  if (self->_daysMarginScale != a3)
  {
    self->_daysMarginScale = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:128];
    if (![(PXCuratedLibraryViewModel *)self isPerformingInitialChanges])
    {
      id v6 = [NSNumber numberWithDouble:a3];
      BOOL v5 = +[PXUserDefaults standardUserDefaults];
      [v5 setDaysMarginScale:v6];
    }
  }
}

- (void)setWantsOptionalChromeVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  if (self->_wantsOptionalChromeVisible != a3)
  {
    self->_wantsOptionalChromeVisible = a3;
    [(PXCuratedLibraryViewModel *)self _invalidateChromeVisibilityWithChangeReason:a4];
  }
}

- (void)setWantsOptionalChromeVisible:(BOOL)a3
{
}

- (void)setViewBasedDecorationsEnabled:(BOOL)a3
{
  if (self->_viewBasedDecorationsEnabled != a3)
  {
    self->_viewBasedDecorationsEnabled = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x800000];
    [(PXCuratedLibraryViewModel *)self _invalidateZoomablePhotosViewModel];
  }
}

- (void)setIsFullyExpanded:(BOOL)a3
{
  if (self->_isFullyExpanded != a3)
  {
    self->_isFullyExpanded = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x10000000000];
  }
}

- (void)_updateIsFullyExpanded
{
  if ([(PXCuratedLibraryViewModel *)self isExpanded]) {
    uint64_t v3 = [(PXCuratedLibraryViewModel *)self isExpandedAnimating] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  [(PXCuratedLibraryViewModel *)self setIsFullyExpanded:v3];
}

- (void)setZoomLevelTransitionPhase:(int64_t)a3
{
  if (self->_zoomLevelTransitionPhase != a3)
  {
    self->_zoomLevelTransitionPhase = a3;
    [(PXCuratedLibraryViewModel *)self signalChange:0x2000];
  }
}

- (NSString)description
{
  uint64_t v3 = [(PXCuratedLibraryViewModel *)self allowedActions];
  id v4 = [v3 allObjects];
  BOOL v5 = [v4 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
  id v6 = [v5 componentsJoinedByString:@", "];

  int64_t v7 = NSString;
  int64_t v8 = (objc_class *)objc_opt_class();
  char v9 = NSStringFromClass(v8);
  objc_msgSend(v7, "stringWithFormat:", @"<%@; %p; int64_t zoomLevel = %ld; allowedActions = [%@];>",
    v9,
    self,
    [(PXCuratedLibraryViewModel *)self zoomLevel],
  int v10 = v6);

  return (NSString *)v10;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"IncludeSharedWithYou" context:PXUserDefaultsObservationContext];

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryViewModel;
  [(PXCuratedLibraryViewModel *)&v4 dealloc];
}

- (PXCuratedLibraryViewModel)initWithAssetsDataSourceManagerConfiguration:(id)a3 zoomLevel:(int64_t)a4 mediaProvider:(id)a5 specManager:(id)a6 styleGuide:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  BOOL v16 = [PXCuratedLibraryViewConfiguration alloc];
  long long v17 = [v15 photoLibrary];
  id v18 = [(PXCuratedLibraryViewConfiguration *)v16 initWithPhotoLibrary:v17];

  uint64_t v19 = [(PXCuratedLibraryViewModel *)self initWithConfiguration:v18 assetsDataSourceManagerConfiguration:v15 zoomLevel:a4 mediaProvider:v14 specManager:v13 styleGuide:v12];
  return v19;
}

- (PXCuratedLibraryViewModel)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryViewModel.m", 138, @"%s is not available as initializer", "-[PXCuratedLibraryViewModel init]");

  abort();
}

@end