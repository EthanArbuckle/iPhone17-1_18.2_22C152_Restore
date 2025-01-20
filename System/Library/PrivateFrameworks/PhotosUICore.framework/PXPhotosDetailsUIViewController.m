@interface PXPhotosDetailsUIViewController
+ (void)preloadResources;
- (BOOL)_dismissSelfIfSafeAnimated:(BOOL)a3;
- (BOOL)_hasAppeared;
- (BOOL)_previewCommitting;
- (BOOL)_shouldShowMovieHeader;
- (BOOL)canBecomeFirstResponder;
- (BOOL)didAppearOnce;
- (BOOL)isEmpty;
- (BOOL)photosDetailsAssetWidget:(id)a3 shouldPresentOneUpForAssetReference:(id)a4;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)shouldPresentOneUpForAssetReference:(id)a3;
- (BOOL)shouldUpdateStatusBarTitle;
- (BOOL)widgetComposition:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4;
- (BOOL)widgetComposition:(id)a3 shouldUseEdgeToEdgeLayoutForWidget:(id)a4;
- (BOOL)widgetComposition:(id)a3 widget:(id)a4 transitionToViewController:(id)a5 withTransitionType:(int64_t)a6;
- (BOOL)widgetCompositionHasContentAbove:(id)a3;
- (BOOL)widgetDeviceIsUnlocked:(id)a3;
- (CGSize)preferredContentSize;
- (Class)_barsControllerClass;
- (NSArray)_widgets;
- (NSMapTable)_widgetOptions;
- (NSMutableArray)_widgetDisablingDimmingViews;
- (NSUserActivity)siriActionActivity;
- (PXActionManager)assetActionManager;
- (PXAssetCollectionActionPerformerDelegate)actionPerformerDelegate;
- (PXAssetReference)initiallyPresentedAssetReference;
- (PXAssetSelectionUserActivityController)userActivityController;
- (PXBarsController)barsController;
- (PXBoopableItemsProvider)boopableItemsProvider;
- (PXDisplayAsset)presentedKeyAsset;
- (PXPhotosDetailsContext)context;
- (PXPhotosDetailsHeaderTileWidget)_headerWidget;
- (PXPhotosDetailsSpecManager)_specManager;
- (PXPhotosDetailsUIViewController)initWithCoder:(id)a3;
- (PXPhotosDetailsUIViewController)initWithContext:(id)a3 configuration:(id)a4;
- (PXPhotosDetailsUIViewController)initWithContext:(id)a3 options:(unint64_t)a4;
- (PXPhotosDetailsUIViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPhotosDetailsUIViewControllerDelegate)delegate;
- (PXPhotosDetailsViewModel)_viewModel;
- (PXSwipeSelectionManager)_swipeSelectionManager;
- (PXTilingController)_headerAssetWidgetTilingController;
- (PXUIScrollViewController)_scrollViewController;
- (PXUIWidget)_previewWidget;
- (PXViewControllerEventTracker)eventTracker;
- (PXWidgetComposition)composition;
- (PXWidgetSpec)_widgetSpec;
- (UIActivityItemsConfigurationReading)activityItemsConfiguration;
- (UIContextMenuInteraction)_contextMenuInteraction;
- (UIEdgeInsets)contentEdgeInsets;
- (UIPointerInteraction)_pointerInteraction;
- (UIScrollView)ppt_scrollView;
- (UIView)widgetsBackgroundView;
- (UIViewController)_previewViewController;
- (double)captionWidgetCurrentContentHeight;
- (double)captionWidgetPreferredHeight;
- (id)_ppt_allWidgetLoadingCompleteHandler;
- (id)_ppt_variationsWidgetLoadingCompleteHandler;
- (id)_previewViewControllerForLocation:(CGPoint)a3;
- (id)_unlockHandlerWithActionType;
- (id)_unlockStatus;
- (id)_widgetAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)barsControllerActionsForSelectionContextMenu:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)presentationEnvironmentForWidgetComposition:(id)a3;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (int64_t)userInterfaceFeature;
- (int64_t)widgetComposition:(id)a3 loadingPriorityForWidget:(id)a4;
- (unint64_t)_optionsForWidget:(id)a3;
- (unint64_t)occludedContentEdges;
- (unint64_t)options;
- (void)_ensureScrollViewController;
- (void)_handleDeviceDidUnlock;
- (void)_handleSpaceBar:(id)a3;
- (void)_handleWidgetsLoadingDelay;
- (void)_loadComposition;
- (void)_loadWidgets;
- (void)_ppt_informWidgetsLoadedHandlerIfNeeded;
- (void)_ppt_setAllWidgetLoadingCompleteHandler:(id)a3;
- (void)_ppt_setVariationsWidgetLoadingCompleteHandler:(id)a3;
- (void)_setContextMenuInteraction:(id)a3;
- (void)_setHasAppeared:(BOOL)a3;
- (void)_setPointerInteraction:(id)a3;
- (void)_setPreviewCommitting:(BOOL)a3;
- (void)_setPreviewViewController:(id)a3;
- (void)_setSwipeSelectionManager:(id)a3;
- (void)_setWidgetSpec:(id)a3;
- (void)_updateAllWidgetsFaceModeState;
- (void)_updateAllWidgetsSelectionState;
- (void)_updateAllWidgetsSpec;
- (void)_updateBarSpec;
- (void)_updateCompositionSpec;
- (void)_updateScrollViewControllerContentInset;
- (void)_updateStatusBarTitle;
- (void)_updateTitleAndSubtitle;
- (void)_updateWidgetDisablingWithAnimationOptions:(id)a3;
- (void)_updateWidgetSpec;
- (void)_updateWidgetsBackground;
- (void)_viewWillLayoutBeforeAppearing;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)informFirstWidgetAvailableVisibleRectInEditMode:(CGRect)a3;
- (void)invalidateBoopableItemsProvider;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)playMovieWithCompletionHandler:(id)a3;
- (void)ppt_toggleDiscloseWidgets;
- (void)purgeIfPossible;
- (void)requestExitEditModeWithChangeSavingMode:(int64_t)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)setActionPerformerDelegate:(id)a3;
- (void)setBoopableItemsProvider:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setDidAppearOnce:(BOOL)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setInitiallyPresentedAssetReference:(id)a3;
- (void)setOccludedContentEdges:(unint64_t)a3;
- (void)setSiriActionActivity:(id)a3;
- (void)setWidgetsBackgroundView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)widget:(id)a3 didChangeEditingMode:(BOOL)a4;
- (void)widget:(id)a3 performAfterUnlockingDeviceIfNecessary:(id)a4 failurehandler:(id)a5;
- (void)widgetComposition:(id)a3 didUpdateCompositionWithDefaultAnimationOptions:(id)a4;
- (void)widgetComposition:(id)a3 widgetHasLoadedContentDataDidChange:(id)a4;
@end

@implementation PXPhotosDetailsUIViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composition, 0);
  objc_destroyWeak((id *)&self->_actionPerformerDelegate);
  objc_storeStrong((id *)&self->_barsController, 0);
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->__pointerInteraction, 0);
  objc_storeStrong((id *)&self->__previewViewController, 0);
  objc_storeStrong((id *)&self->__contextMenuInteraction, 0);
  objc_storeStrong(&self->__ppt_variationsWidgetLoadingCompleteHandler, 0);
  objc_storeStrong(&self->__ppt_allWidgetLoadingCompleteHandler, 0);
  objc_storeStrong((id *)&self->_widgetsBackgroundView, 0);
  objc_storeStrong((id *)&self->__previewWidget, 0);
  objc_storeStrong(&self->__unlockHandlerWithActionType, 0);
  objc_storeStrong(&self->__unlockStatus, 0);
  objc_storeStrong((id *)&self->__barsControllerClass, 0);
  objc_storeStrong((id *)&self->__swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->__widgetSpec, 0);
  objc_storeStrong((id *)&self->__widgetDisablingDimmingViews, 0);
  objc_storeStrong((id *)&self->__specManager, 0);
  objc_storeStrong((id *)&self->__headerAssetWidgetTilingController, 0);
  objc_storeStrong((id *)&self->__headerWidget, 0);
  objc_storeStrong((id *)&self->__widgetOptions, 0);
  objc_storeStrong((id *)&self->__widgets, 0);
  objc_storeStrong((id *)&self->__scrollViewController, 0);
  objc_storeStrong((id *)&self->__viewModel, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_initiallyPresentedAssetReference, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_userActivityController, 0);
}

- (void)setOccludedContentEdges:(unint64_t)a3
{
  self->_occludedContentEdges = a3;
}

- (PXWidgetComposition)composition
{
  return self->_composition;
}

- (void)setEmpty:(BOOL)a3
{
  self->_empty = a3;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void)setActionPerformerDelegate:(id)a3
{
}

- (PXAssetCollectionActionPerformerDelegate)actionPerformerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionPerformerDelegate);
  return (PXAssetCollectionActionPerformerDelegate *)WeakRetained;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXBarsController)barsController
{
  return self->_barsController;
}

- (void)setBoopableItemsProvider:(id)a3
{
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setSiriActionActivity:(id)a3
{
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)_setPointerInteraction:(id)a3
{
}

- (UIPointerInteraction)_pointerInteraction
{
  return self->__pointerInteraction;
}

- (void)_setPreviewViewController:(id)a3
{
}

- (UIViewController)_previewViewController
{
  return self->__previewViewController;
}

- (void)_setPreviewCommitting:(BOOL)a3
{
  self->__previewCommitting = a3;
}

- (BOOL)_previewCommitting
{
  return self->__previewCommitting;
}

- (void)_setContextMenuInteraction:(id)a3
{
}

- (UIContextMenuInteraction)_contextMenuInteraction
{
  return self->__contextMenuInteraction;
}

- (id)_ppt_variationsWidgetLoadingCompleteHandler
{
  return self->__ppt_variationsWidgetLoadingCompleteHandler;
}

- (id)_ppt_allWidgetLoadingCompleteHandler
{
  return self->__ppt_allWidgetLoadingCompleteHandler;
}

- (void)setDidAppearOnce:(BOOL)a3
{
  self->_didAppearOnce = a3;
}

- (BOOL)didAppearOnce
{
  return self->_didAppearOnce;
}

- (void)setWidgetsBackgroundView:(id)a3
{
}

- (UIView)widgetsBackgroundView
{
  return self->_widgetsBackgroundView;
}

- (PXUIWidget)_previewWidget
{
  return self->__previewWidget;
}

- (id)_unlockHandlerWithActionType
{
  return self->__unlockHandlerWithActionType;
}

- (id)_unlockStatus
{
  return self->__unlockStatus;
}

- (Class)_barsControllerClass
{
  return self->__barsControllerClass;
}

- (void)_setSwipeSelectionManager:(id)a3
{
}

- (PXSwipeSelectionManager)_swipeSelectionManager
{
  return self->__swipeSelectionManager;
}

- (void)_setHasAppeared:(BOOL)a3
{
  self->__hasAppeared = a3;
}

- (BOOL)_hasAppeared
{
  return self->__hasAppeared;
}

- (PXWidgetSpec)_widgetSpec
{
  return self->__widgetSpec;
}

- (NSMutableArray)_widgetDisablingDimmingViews
{
  return self->__widgetDisablingDimmingViews;
}

- (PXPhotosDetailsSpecManager)_specManager
{
  return self->__specManager;
}

- (PXTilingController)_headerAssetWidgetTilingController
{
  return self->__headerAssetWidgetTilingController;
}

- (PXPhotosDetailsHeaderTileWidget)_headerWidget
{
  return self->__headerWidget;
}

- (NSMapTable)_widgetOptions
{
  return self->__widgetOptions;
}

- (NSArray)_widgets
{
  return self->__widgets;
}

- (PXUIScrollViewController)_scrollViewController
{
  return self->__scrollViewController;
}

- (PXPhotosDetailsViewModel)_viewModel
{
  return self->__viewModel;
}

- (PXViewControllerEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (void)setInitiallyPresentedAssetReference:(id)a3
{
}

- (PXAssetReference)initiallyPresentedAssetReference
{
  return self->_initiallyPresentedAssetReference;
}

- (PXPhotosDetailsUIViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosDetailsUIViewControllerDelegate *)WeakRetained;
}

- (unint64_t)options
{
  return self->_options;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)_ppt_informWidgetsLoadedHandlerIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(PXPhotosDetailsUIViewController *)self _ppt_allWidgetLoadingCompleteHandler];
  if (!v3) {
    goto LABEL_16;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5)
  {

LABEL_15:
    v3[2](v3);
    [(PXPhotosDetailsUIViewController *)self _ppt_setAllWidgetLoadingCompleteHandler:0];
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
  int v8 = 1;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
      int v11 = objc_opt_respondsToSelector();
      if (v11 & v8) {
        int v8 = [v10 hasLoadedContentData];
      }
      else {
        v8 &= v11 ^ 1;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  }
  while (v6);

  if (v8) {
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_ppt_setVariationsWidgetLoadingCompleteHandler:(id)a3
{
  uint64_t v5 = _Block_copy(a3);
  id ppt_variationsWidgetLoadingCompleteHandler = self->__ppt_variationsWidgetLoadingCompleteHandler;
  self->__id ppt_variationsWidgetLoadingCompleteHandler = v5;

  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__PXPhotosDetailsUIViewController__ppt_setVariationsWidgetLoadingCompleteHandler___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __82__PXPhotosDetailsUIViewController__ppt_setVariationsWidgetLoadingCompleteHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_informWidgetsLoadedHandlerIfNeeded");
}

- (void)_ppt_setAllWidgetLoadingCompleteHandler:(id)a3
{
  uint64_t v5 = _Block_copy(a3);
  id ppt_allWidgetLoadingCompleteHandler = self->__ppt_allWidgetLoadingCompleteHandler;
  self->__id ppt_allWidgetLoadingCompleteHandler = v5;

  if (a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PXPhotosDetailsUIViewController__ppt_setAllWidgetLoadingCompleteHandler___block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__PXPhotosDetailsUIViewController__ppt_setAllWidgetLoadingCompleteHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ppt_informWidgetsLoadedHandlerIfNeeded");
}

- (void)ppt_toggleDiscloseWidgets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          int v8 = [v7 localizedDisclosureTitle];
          uint64_t v9 = [v8 length];

          if (v9) {
            [v7 userDidSelectDisclosureControl];
          }
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (UIScrollView)ppt_scrollView
{
  v2 = [(PXPhotosDetailsUIViewController *)self _scrollViewController];
  uint64_t v3 = [v2 scrollView];

  return (UIScrollView *)v3;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXPhotosDetailsUIViewController *)self presentedViewController];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v5 prepareForDismissingForced:v3])
  {
    BOOL v6 = 0;
  }
  else
  {
    [(PXPhotosDetailsUIViewController *)self dismissViewControllerAnimated:0 completion:0];
    BOOL v6 = 1;
  }

  return v6;
}

- (PXActionManager)assetActionManager
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(PXPhotosDetailsUIViewController *)self _widgets];
  BOOL v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          BOOL v3 = [v6 assetActionManager];
          goto LABEL_11;
        }
      }
      BOOL v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (PXActionManager *)v3;
}

- (void)invalidateBoopableItemsProvider
{
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  BOOL v3 = [(PXPhotosDetailsUIViewController *)self boopableItemsProvider];

  if (!v3)
  {
    uint64_t v4 = objc_alloc_init(PXBoopableItemsProvider);
    [(PXPhotosDetailsUIViewController *)self setBoopableItemsProvider:v4];

    uint64_t v5 = [(PXPhotosDetailsUIViewController *)self _viewModel];
    BOOL v6 = [v5 selectionManager];
    uint64_t v7 = [(PXPhotosDetailsUIViewController *)self boopableItemsProvider];
    [v7 setSelectionManager:v6];
  }
  return (UIActivityItemsConfigurationReading *)[(PXPhotosDetailsUIViewController *)self boopableItemsProvider];
}

- (id)_previewViewControllerForLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  uint64_t v7 = [v6 scrollView];

  [v7 contentOffset];
  double v9 = y + v8;
  long long v10 = -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v7, x, v9);
  long long v11 = objc_msgSend(v10, "previewViewControllerAtLocation:fromSourceView:", v7, x, v9);

  return v11;
}

- (id)_widgetAtLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  PXPointIsNull();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a3;
  uint64_t v7 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  id v14 = [v7 scrollView];

  [v6 locationInView:v14];
  double v9 = v8;
  double v11 = v10;

  long long v12 = -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v14, v9, v11);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [(PXPhotosDetailsUIViewController *)self _previewViewController];
    objc_msgSend(v12, "didDismissPreviewViewController:committing:", v13, -[PXPhotosDetailsUIViewController _previewCommitting](self, "_previewCommitting"));
  }
  [(PXPhotosDetailsUIViewController *)self _setPreviewCommitting:0];
  [(PXPhotosDetailsUIViewController *)self _setPreviewViewController:0];
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = [(PXPhotosDetailsUIViewController *)self _viewModel];
  char v10 = [v9 isSelecting];

  if ((v10 & 1) == 0)
  {
    double v11 = [v8 previewViewController];
    if (v11)
    {
      [(PXPhotosDetailsUIViewController *)self _setPreviewCommitting:1];
      [v8 setPreferredCommitStyle:1];
      long long v12 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
      uint64_t v13 = [v12 scrollView];

      [v7 locationInView:v13];
      id v14 = -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v13);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __116__PXPhotosDetailsUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
      v16[3] = &unk_1E5DD32A8;
      id v17 = v14;
      id v18 = v11;
      id v15 = v14;
      [v8 addCompletion:v16];
    }
  }
}

uint64_t __116__PXPhotosDetailsUIViewController_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitPreviewViewController:*(void *)(a1 + 40)];
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  id v7 = [v6 scrollView];

  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  long long v12 = -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v7, v9, v11);
  uint64_t v13 = objc_msgSend(v12, "imageViewBasicTileForPreviewingAtPoint:", v9, v11);
  id v14 = [v13 view];
  if (v14) {
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v14];
  }
  else {
    id v15 = 0;
  }

  return v15;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  id v9 = [v8 scrollView];

  [v7 locationInView:v9];
  double v11 = v10;
  double v13 = v12;

  id v14 = -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v9, v11, v13);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v14, "imageViewBasicTileForPreviewingAtPoint:", v11, v13),
        id v15 = objc_claimAutoreleasedReturnValue(),
        [v15 view],
        v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    id v17 = [(PXPhotosDetailsUIViewController *)self _viewModel];
    char v18 = [v17 isSelecting] ^ 1;

    v19 = -[PXPhotosDetailsUIViewController _previewViewControllerForLocation:](self, "_previewViewControllerForLocation:", x, y);
    [(PXPhotosDetailsUIViewController *)self _setPreviewViewController:v19];
    v20 = (void *)MEMORY[0x1E4FB1678];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __89__PXPhotosDetailsUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v27[3] = &unk_1E5DC4F48;
    id v28 = v19;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __89__PXPhotosDetailsUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v24[3] = &unk_1E5DB8AC8;
    char v26 = v18;
    id v25 = v28;
    id v21 = v28;
    v22 = [v20 configurationWithIdentifier:0 previewProvider:v27 actionProvider:v24];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id __89__PXPhotosDetailsUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __89__PXPhotosDetailsUIViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v1 = objc_msgSend(*(id *)(a1 + 32), "px_previewActionMenus");
    v2 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 children:v1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  id v7 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  double v8 = [v7 scrollView];

  [v6 location];
  id v9 = -[PXPhotosDetailsUIViewController _widgetAtLocation:inCoordinateSpace:](self, "_widgetAtLocation:inCoordinateSpace:", v8);
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    [v6 location];
    double v10 = objc_msgSend(v9, "imageViewBasicTileForPreviewingAtPoint:");
    double v11 = [v10 view];
    if (v11)
    {
      int v12 = [v9 cursorInteractionEnabled];

      if (v12)
      {
        double v13 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v10];
        id v14 = (void *)MEMORY[0x1E4FB1AD8];
        id v15 = [v10 view];
        [v15 frame];
        double v11 = objc_msgSend(v14, "regionWithRect:identifier:", v13);
      }
      else
      {
        double v11 = 0;
      }
    }
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PXPhotosDetailsUIViewController;
  double v8 = -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v24, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  id v9 = (void *)[v8 mutableCopy];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v10 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v15 conformsToProtocol:&unk_1F02F64F8])
        {
          v16 = objc_msgSend(v15, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v7, x, y);
          [v9 addObjectsFromArray:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v12);
  }

  if (![v9 count])
  {
    id v17 = objc_alloc_init(PXDiagnosticsItemProvider);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __89__PXPhotosDetailsUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
    v19[3] = &unk_1E5DD2988;
    v19[4] = self;
    [(PXDiagnosticsItemProvider *)v17 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierAssetCollection" loadHandler:v19];
    [v9 addObject:v17];
  }
  return v9;
}

id __89__PXPhotosDetailsUIViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) context];
  v2 = [v1 assetCollections];
  BOOL v3 = [v2 firstObject];

  return v3;
}

- (void)playMovieWithCompletionHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLMemoriesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(PXPhotosDetailsUIViewController *)self _headerWidget];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "Header widget (%@) is about to start playing Memories movie...", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(PXPhotosDetailsUIViewController *)self _headerWidget];
  [v7 playMovieWithCompletionHandler:v4];
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
  id v8 = +[PXPhotosDetailsSettings sharedInstance];
  if ([v8 allowWidgetsContentLoading])
  {
    id v4 = +[PXPhotosDetailsSettings sharedInstance];
    int v5 = [v4 loadAllWidgetsContentOnScroll];

    if (v5)
    {
      id v6 = [(PXPhotosDetailsUIViewController *)self composition];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __74__PXPhotosDetailsUIViewController_scrollViewControllerWillBeginScrolling___block_invoke;
      v9[3] = &unk_1E5DD36F8;
      id v10 = v6;
      id v7 = v6;
      [v7 performWidgetLoadingChange:v9];
    }
  }
  else
  {
  }
}

uint64_t __74__PXPhotosDetailsUIViewController_scrollViewControllerWillBeginScrolling___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMinimumWidgetLoadingPriority:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setShouldLoadAllWidgets:1];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXSpecManagerObservationContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_20;
    }
    id v16 = v9;
    [(PXPhotosDetailsUIViewController *)self _invalidateCompositionSpec];
    [(PXPhotosDetailsUIViewController *)self _invalidateWidgetSpec];
    [(PXPhotosDetailsUIViewController *)self _invalidateBarSpec];
    goto LABEL_19;
  }
  if ((void *)PXExtendedTraitCollectionObservationContext_91415 == a5)
  {
    if ((v6 & 0x14A) == 0) {
      goto LABEL_20;
    }
    id v16 = v9;
    [(PXPhotosDetailsUIViewController *)self _invalidateCompositionSpec];
    goto LABEL_19;
  }
  id v16 = v9;
  if ((void *)PXViewModelObservationContext_91416 != a5)
  {
    if ((void *)PXPhotosDetailsContextObservationContext_91418 == a5)
    {
      if ((v6 & 0x30) == 0) {
        goto LABEL_20;
      }
      [(PXPhotosDetailsUIViewController *)self _updateTitleAndSubtitle];
      uint64_t v11 = [(PXPhotosDetailsUIViewController *)self barsController];
      [v11 updateIfNeeded];
    }
    else
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsUIViewController.m" lineNumber:1475 description:@"unknown observation context"];
    }
    goto LABEL_19;
  }
  if ((v6 & 1) == 0)
  {
    if ((v6 & 0x10) == 0) {
      goto LABEL_12;
    }
LABEL_17:
    [(PXPhotosDetailsUIViewController *)self _updateAllWidgetsFaceModeState];
    id v9 = v16;
    if ((v6 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  [(PXPhotosDetailsUIViewController *)self _updateAllWidgetsSelectionState];
  uint64_t v12 = +[PXBasicTileAnimationOptions defaultAnimationOptions];
  [(PXPhotosDetailsUIViewController *)self _updateWidgetDisablingWithAnimationOptions:v12];

  [(PXPhotosDetailsUIViewController *)self invalidateBoopableItemsProvider];
  id v9 = v16;
  if ((v6 & 0x10) != 0) {
    goto LABEL_17;
  }
LABEL_12:
  if ((v6 & 4) != 0)
  {
LABEL_18:
    uint64_t v13 = [(PXPhotosDetailsUIViewController *)self _viewModel];
    id v14 = [v13 selectionManager];
    id v15 = [(PXPhotosDetailsUIViewController *)self userActivityController];
    [v15 setSelectionManager:v14];

    [(PXPhotosDetailsUIViewController *)self invalidateBoopableItemsProvider];
LABEL_19:
    id v9 = v16;
  }
LABEL_20:
}

- (BOOL)photosDetailsAssetWidget:(id)a3 shouldPresentOneUpForAssetReference:(id)a4
{
  return [(PXPhotosDetailsUIViewController *)self shouldPresentOneUpForAssetReference:a4];
}

- (BOOL)shouldPresentOneUpForAssetReference:(id)a3
{
  return 1;
}

- (id)presentationEnvironmentForWidgetComposition:(id)a3
{
  return +[PXViewControllerPresenter defaultPresenterWithViewController:self];
}

- (void)widgetComposition:(id)a3 didUpdateCompositionWithDefaultAnimationOptions:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v6;
  }
  else
  {

    id v5 = 0;
  }
  id v7 = v5;
  [(PXPhotosDetailsUIViewController *)self _updateWidgetDisablingWithAnimationOptions:v5];
}

- (void)widgetComposition:(id)a3 widgetHasLoadedContentDataDidChange:(id)a4
{
  if (self->_delegateRespondsTo.compositionDidChange)
  {
    id v5 = [(PXPhotosDetailsUIViewController *)self delegate];
    [v5 photosDetailsUIViewControllerCompositionDidChange:self];
  }
  [(PXPhotosDetailsUIViewController *)self _ppt_informWidgetsLoadedHandlerIfNeeded];
}

- (BOOL)widgetComposition:(id)a3 widget:(id)a4 transitionToViewController:(id)a5 withTransitionType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a6)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsUIViewController.m" lineNumber:1397 description:@"undefined transition type"];

    goto LABEL_9;
  }
  if (a6 == 2)
  {
    id v17 = [(PXPhotosDetailsUIViewController *)self presentedViewController];

    if (!v17)
    {
      BOOL v15 = 1;
      [(PXPhotosDetailsUIViewController *)self presentViewController:v13 animated:1 completion:0];
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  if (a6 != 1)
  {
LABEL_9:
    BOOL v15 = 0;
    goto LABEL_13;
  }
  id v14 = [(PXPhotosDetailsUIViewController *)self navigationController];
  if (v14
    && [(UIViewController *)self px_canPresentViewControllerAnimated:1])
  {
    BOOL v15 = 1;
    [v14 pushViewController:v13 animated:1];
  }
  else
  {
    BOOL v15 = 0;
  }

LABEL_13:
  return v15;
}

- (int64_t)widgetComposition:(id)a3 loadingPriorityForWidget:(id)a4
{
  return ([(PXPhotosDetailsUIViewController *)self _optionsForWidget:a4] >> 1) & 1;
}

- (BOOL)widgetComposition:(id)a3 shouldUseEdgeToEdgeLayoutForWidget:(id)a4
{
  return ([(PXPhotosDetailsUIViewController *)self _optionsForWidget:a4] & 1) == 0;
}

- (BOOL)widgetComposition:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4
{
  return [(PXPhotosDetailsUIViewController *)self _dismissSelfIfSafeAnimated:a4];
}

- (BOOL)widgetCompositionHasContentAbove:(id)a3
{
  return ([(PXPhotosDetailsUIViewController *)self options] >> 2) & 1;
}

- (void)widget:(id)a3 didChangeEditingMode:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  id v10 = [v6 scrollView];

  if (v4)
  {
    id v7 = [(PXPhotosDetailsUIViewController *)self composition];
    [v7 invalidateFocusedTilingController];
    id v8 = +[PXPhotosDetailsSettings sharedInstance];
    uint64_t v9 = [v8 captionWidgetEnableVScrollingInEdit];

    [v10 setScrollEnabled:v9];
  }
  else
  {
    [v10 setScrollEnabled:1];
  }
  [(PXPhotosDetailsUIViewController *)self editingDidChange:v4];
}

- (void)widget:(id)a3 performAfterUnlockingDeviceIfNecessary:(id)a4 failurehandler:(id)a5
{
  id v7 = (void (**)(void))a4;
  id v8 = a5;
  uint64_t v9 = [(PXPhotosDetailsUIViewController *)self _unlockStatus];
  if (v9
    && (id v10 = (void *)v9,
        [(PXPhotosDetailsUIViewController *)self _unlockStatus],
        id v11 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(),
        char v12 = v11[2](),
        v11,
        v10,
        (v12 & 1) == 0))
  {
    id v13 = [(PXPhotosDetailsUIViewController *)self _unlockHandlerWithActionType];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__PXPhotosDetailsUIViewController_widget_performAfterUnlockingDeviceIfNecessary_failurehandler___block_invoke;
    aBlock[3] = &unk_1E5DB8AA0;
    aBlock[4] = self;
    id v17 = v7;
    id v14 = (void (**)(void))v8;
    id v18 = v14;
    BOOL v15 = _Block_copy(aBlock);
    if (v13)
    {
      ((void (**)(void, void *, void))v13)[2](v13, v15, 0);
    }
    else if (v14)
    {
      v14[2](v14);
    }
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __96__PXPhotosDetailsUIViewController_widget_performAfterUnlockingDeviceIfNecessary_failurehandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _handleDeviceDidUnlock];
    uint64_t result = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t result = *(void *)(a1 + 48);
    if (!result) {
      return result;
    }
  }
  BOOL v4 = *(uint64_t (**)(void))(result + 16);
  return v4();
}

- (BOOL)widgetDeviceIsUnlocked:(id)a3
{
  BOOL v4 = [(PXPhotosDetailsUIViewController *)self _unlockStatus];

  if (!v4) {
    return 1;
  }
  id v5 = [(PXPhotosDetailsUIViewController *)self _unlockStatus];
  char v6 = v5[2]();

  return v6;
}

- (int64_t)userInterfaceFeature
{
  return 6;
}

- (void)_updateBarSpec
{
  BOOL v3 = [(PXPhotosDetailsUIViewController *)self _specManager];
  BOOL v4 = [v3 spec];
  id v6 = [v4 barSpec];

  id v5 = [(PXPhotosDetailsUIViewController *)self barsController];
  [v5 setBarSpec:v6];
}

- (void)_updateWidgetSpec
{
  BOOL v3 = [(PXPhotosDetailsUIViewController *)self _specManager];
  BOOL v4 = [v3 spec];
  id v5 = [v4 widgetSpec];

  [(PXPhotosDetailsUIViewController *)self _setWidgetSpec:v5];
}

- (void)_updateCompositionSpec
{
  BOOL v3 = [(PXPhotosDetailsUIViewController *)self _specManager];
  BOOL v4 = [v3 spec];
  id v6 = [v4 compositionSpec];

  id v5 = [(PXPhotosDetailsUIViewController *)self composition];
  [v5 setSpec:v6];
}

- (void)purgeIfPossible
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(UIViewController *)self px_isVisible] && self->__scrollViewController)
  {
    BOOL v3 = PLMemoriesGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v4 = [(PXUIScrollViewController *)self->__scrollViewController scrollView];
      *(_DWORD *)buf = 138412546;
      v27 = self;
      __int16 v28 = 2048;
      v29 = v4;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "Purging contents of:%@ withScrollView:%p", buf, 0x16u);
    }
    id v5 = [(PXPhotosDetailsUIViewController *)self _widgets];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
          if (objc_opt_respondsToSelector()) {
            [v10 setWidgetDelegate:0];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }
    headerWidget = self->__headerWidget;
    self->__headerWidget = 0;

    previewWidget = self->__previewWidget;
    self->__previewWidget = 0;

    widgetOptions = self->__widgetOptions;
    self->__widgetOptions = 0;

    headerAssetWidgetTilingController = self->__headerAssetWidgetTilingController;
    self->__headerAssetWidgetTilingController = 0;

    widgets = self->__widgets;
    self->__widgets = 0;

    contextMenuInteraction = self->__contextMenuInteraction;
    self->__contextMenuInteraction = 0;

    pointerInteraction = self->__pointerInteraction;
    self->__pointerInteraction = 0;

    [(PXWidgetComposition *)self->_composition setShouldUnloadAllWidgets:1];
    composition = self->_composition;
    self->_composition = 0;

    v19 = [(PXUIScrollViewController *)self->__scrollViewController scrollView];
    [v19 removeFromSuperview];

    scrollViewController = self->__scrollViewController;
    self->__scrollViewController = 0;
  }
}

- (id)barsControllerActionsForSelectionContextMenu:(id)a3
{
  BOOL v4 = [(PXPhotosDetailsUIViewController *)self _viewModel];
  id v5 = [v4 selectionManager];
  uint64_t v6 = [v5 selectionSnapshot];

  if ([v6 isAnyItemSelected])
  {
    uint64_t v7 = [(PXPhotosDetailsUIViewController *)self assetActionManager];
    uint64_t v8 = +[PXAssetActionMenuBuilder menuElementsForActionManager:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (PXAssetSelectionUserActivityController)userActivityController
{
  userActivityController = self->_userActivityController;
  if (!userActivityController)
  {
    BOOL v4 = [[PXAssetSelectionUserActivityController alloc] initWithSelectionManager:0];
    id v5 = self->_userActivityController;
    self->_userActivityController = v4;

    userActivityController = self->_userActivityController;
  }
  return userActivityController;
}

- (void)informFirstWidgetAvailableVisibleRectInEditMode:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v5 = [(PXPhotosDetailsUIViewController *)self _widgets];
  id v6 = [v5 firstObject];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "setMaxVisibleSizeInEditMode:", width, height);
  }
}

- (void)requestExitEditModeWithChangeSavingMode:(int64_t)a3
{
  widgets = self->__widgets;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PXPhotosDetailsUIViewController_requestExitEditModeWithChangeSavingMode___block_invoke;
  v4[3] = &unk_1E5DB8A78;
  v4[5] = a3;
  v4[6] = a2;
  v4[4] = self;
  [(NSArray *)widgets enumerateObjectsUsingBlock:v4];
}

void __75__PXPhotosDetailsUIViewController_requestExitEditModeWithChangeSavingMode___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = v12;
  if (v6)
  {
    int v8 = [v12 isInEditMode];
    uint64_t v7 = v12;
    if (v8)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v9 = a1[5];
        if (v9 == 2) {
          uint64_t v10 = 2;
        }
        else {
          uint64_t v10 = v9 == 1;
        }
        [v12 requestExitEditWithChangesSavingMode:v10];
      }
      else
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a1[6] object:a1[4] file:@"PXPhotosDetailsUIViewController.m" lineNumber:1141 description:@"requestExitEditWithChangesSavingMode: should be supported with isInEditMode"];
      }
      *a4 = 1;
      uint64_t v7 = v12;
    }
  }
}

- (void)_handleSpaceBar:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 spaceBarWasPressed];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_handleDeviceDidUnlock
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(PXPhotosDetailsUIViewController *)self _widgets];
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
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 deviceDidBecomeUnlocked];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_updateWidgetDisablingWithAnimationOptions:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  uint64_t v4 = [(PXPhotosDetailsUIViewController *)self _viewModel];
  int v5 = [v4 isSelecting];

  uint64_t v6 = [(PXPhotosDetailsUIViewController *)self _widgetDisablingDimmingViews];
  uint64_t v7 = v6;
  v53 = v6;
  v52 = self;
  if (v5)
  {
    long long v8 = [(PXPhotosDetailsUIViewController *)self _scrollViewController];
    long long v9 = [(PXPhotosDetailsUIViewController *)self _specManager];
    long long v10 = [v9 spec];

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obuint64_t j = [(PXPhotosDetailsUIViewController *)self _widgets];
    uint64_t v11 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      id v55 = *(id *)v77;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(id *)v77 != v55) {
            objc_enumerationMutation(obj);
          }
          BOOL v15 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0 || ([v15 supportsSelection] & 1) == 0)
          {
            id v16 = [(PXPhotosDetailsUIViewController *)self composition];
            [v16 frameForWidget:v15];
            double v18 = v17;
            double v20 = v19;
            double v22 = v21;
            double v24 = v23;

            id v25 = [v8 scrollView];
            uint64_t v26 = [v8 contentCoordinateSpace];
            objc_msgSend(v25, "convertRect:fromCoordinateSpace:", v26, v18, v20, v22, v24);
            double v28 = v27;
            double v30 = v29;
            double v32 = v31;
            double v34 = v33;

            v84.origin.double x = v28;
            v84.origin.double y = v30;
            v84.size.double width = v32;
            v84.size.double height = v34;
            if (!CGRectIsEmpty(v84))
            {
              if (v13 == [v7 count])
              {
                v35 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v28, v30, v32, v34);
                [v10 dimmingColor];
                v37 = v36 = v7;
                [v35 setBackgroundColor:v37];

                [v35 setOpaque:1];
                [v35 setAlpha:0.0];
                v38 = v36;
                self = v52;
                [v38 addObject:v35];
                [v8 addSubviewToScrollView:v35];
              }
              else
              {
                v35 = [v7 objectAtIndexedSubscript:v13];
              }
              v39 = [v35 layer];
              [v39 setZPosition:10000000.0];

              v69[0] = MEMORY[0x1E4F143A8];
              v69[1] = 3221225472;
              v69[2] = __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke;
              v69[3] = &unk_1E5DB8FA0;
              id v70 = v35;
              id v71 = v10;
              double v72 = v28;
              double v73 = v30;
              double v74 = v32;
              double v75 = v34;
              id v40 = v35;
              +[PXBasicUIViewTileAnimator animateWithOptions:v57 animations:v69 completion:0];
              ++v13;

              uint64_t v7 = v53;
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v76 objects:v82 count:16];
      }
      while (v12);
    }
  }
  else if ([v6 count])
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v56 = v53;
    uint64_t v41 = [v56 countByEnumeratingWithState:&v65 objects:v81 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v66 != v43) {
            objc_enumerationMutation(v56);
          }
          uint64_t v63 = *(void *)(*((void *)&v65 + 1) + 8 * j);
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke_2;
          v64[3] = &unk_1E5DD36F8;
          v64[4] = v63;
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke_3;
          v62[3] = &unk_1E5DD2188;
          +[PXBasicUIViewTileAnimator animateWithOptions:v57 animations:v64 completion:v62];
        }
        uint64_t v42 = [v56 countByEnumeratingWithState:&v65 objects:v81 count:16];
      }
      while (v42);
    }

    [v56 removeAllObjects];
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v45 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v58 objects:v80 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v47; ++k)
      {
        if (*(void *)v59 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v58 + 1) + 8 * k);
        if (objc_opt_respondsToSelector())
        {
          if (v5)
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v51 = [v50 supportsSelection];
            }
            else {
              uint64_t v51 = 0;
            }
          }
          else
          {
            uint64_t v51 = 1;
          }
          [v50 setUserInteractionEnabled:v51];
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v58 objects:v80 count:16];
    }
    while (v47);
  }
}

uint64_t __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) dimmingAlpha];
  objc_msgSend(v2, "setAlpha:");
  uint64_t v3 = *(void **)(a1 + 32);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  return objc_msgSend(v3, "setFrame:", v4, v5, v6, v7);
}

uint64_t __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __78__PXPhotosDetailsUIViewController__updateWidgetDisablingWithAnimationOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_updateTitleAndSubtitle
{
  id v8 = [(PXPhotosDetailsUIViewController *)self context];
  uint64_t v3 = [v8 localizedTitle];
  double v4 = [off_1E5DA7230 defaultHelper];
  double v5 = [v4 displayableTextForTitle:v3 intent:1];

  double v6 = [v8 localizedSubtitle];
  [(PXPhotosDetailsUIViewController *)self setTitle:v5];
  [(UIViewController *)self px_setSubtitle:v6];
  double v7 = [(PXPhotosDetailsUIViewController *)self barsController];
  [v7 invalidateBars];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsUIViewController;
  id v7 = a4;
  -[PXPhotosDetailsUIViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PXPhotosDetailsUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5DD2A68;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __86__PXPhotosDetailsUIViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) composition];
  [v1 invalidatePreferredContentHeightForAllWidgets];
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v16 traitCollectionDidChange:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [(PXPhotosDetailsUIViewController *)self traitCollection];
          [v10 controllerTraitCollectionDidChangeFrom:v4 to:v11];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
        if (objc_opt_respondsToSelector()) {
          [v11 environmentDidUpdateFocusInContext:v5];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (unint64_t)_optionsForWidget:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDetailsUIViewController *)self _widgetOptions];
  uint64_t v6 = [v5 objectForKey:v4];

  unint64_t v7 = [v6 unsignedIntegerValue];
  return v7;
}

- (void)_updateAllWidgetsFaceModeState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXPhotosDetailsUIViewController *)self _viewModel];
  uint64_t v4 = [v3 isFaceModeEnabled];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(PXPhotosDetailsUIViewController *)self _widgets];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 setFaceModeEnabled:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_updateAllWidgetsSelectionState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXPhotosDetailsUIViewController *)self _viewModel];
  uint64_t v4 = [v3 isSelecting];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(PXPhotosDetailsUIViewController *)self _widgets];
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 setSelecting:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_updateAllWidgetsSpec
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXPhotosDetailsUIViewController *)self _widgetSpec];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(PXPhotosDetailsUIViewController *)self _widgets];
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
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 setSpec:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_setWidgetSpec:(id)a3
{
  uint64_t v5 = (PXWidgetSpec *)a3;
  if (self->__widgetSpec != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->__widgetSpec, a3);
    [(PXPhotosDetailsUIViewController *)self _updateAllWidgetsSpec];
    uint64_t v5 = v6;
  }
}

- (void)_loadWidgets
{
  if (self->__widgets) {
    return;
  }
  uint64_t v3 = os_log_create((const char *)*MEMORY[0x1E4F8A240], "InfoPanelLoadWidgetsSignpost");
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  uint64_t v5 = v3;
  uint64_t v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "InfoPanelWillLoadWidgets", "", buf, 2u);
  }

  *(void *)buf = 0;
  v138 = buf;
  uint64_t v139 = 0x3032000000;
  v140 = __Block_byref_object_copy__91456;
  v141 = __Block_byref_object_dispose__91457;
  id v142 = [(UIViewController *)self px_oneUpPresentation];
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  char v136 = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x2020000000;
  char v134 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x3032000000;
  v131[3] = __Block_byref_object_copy__91456;
  v131[4] = __Block_byref_object_dispose__91457;
  id v132 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  uint64_t v9 = +[PXPhotosDetailsSettings sharedInstance];
  v104 = v6;
  unint64_t v105 = v4 - 1;
  long long v10 = [(PXPhotosDetailsUIViewController *)self context];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke;
  aBlock[3] = &unk_1E5DB8A08;
  aBlock[4] = self;
  id v118 = v10;
  id v124 = v118;
  v127 = buf;
  id v116 = v7;
  id v125 = v116;
  obuint64_t j = v8;
  id v103 = v8;
  id v126 = v103;
  v128 = v135;
  v129 = v131;
  v130 = v133;
  long long v11 = (uint64_t (**)(void *, PXPhotosDetailsCaptionHashtagsWidget *, void))_Block_copy(aBlock);
  long long v12 = [(PXPhotosDetailsUIViewController *)self _specManager];
  v117 = [v12 spec];

  unint64_t v13 = [(PXPhotosDetailsUIViewController *)self options];
  int v14 = [v9 showAssetsWidget];
  unint64_t v15 = v13 & 2;
  if ((v13 & 2) != 0) {
    int v16 = 0;
  }
  else {
    int v16 = v14;
  }
  int v115 = v16;
  BOOL v17 = 0;
  if (([v9 showHeaderWidget] & ((v13 & 2) == 0)) == 1 && (v13 & 8) == 0)
  {
    BOOL v17 = [(PXPhotosDetailsUIViewController *)self _shouldShowMovieHeader];
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke_2;
    v121[3] = &__block_descriptor_33_e41_v16__0___PXMutablePhotosDetailsContext__8l;
    BOOL v122 = v17;
    [v118 performChanges:v121];
  }
  unsigned __int8 v18 = [v9 showRelatedPeopleWidget];
  if ((v13 & 8) != 0) {
    unsigned __int8 v19 = 0;
  }
  else {
    unsigned __int8 v19 = v18;
  }
  unsigned __int8 v114 = v19;
  int v20 = objc_msgSend(v9, "showPlacesWidget", v4);
  if ((v13 & 8) != 0) {
    int v21 = 0;
  }
  else {
    int v21 = v20;
  }
  double v22 = +[PXRootSettings sharedInstance];
  int v23 = [v22 canShowInternalUI];
  int v112 = v21;

  int v24 = [v9 showSharedLibraryWidget];
  if ((v13 & 2) != 0) {
    int v25 = v24;
  }
  else {
    int v25 = 0;
  }
  int v26 = [v9 showAlbumAttributionWidget];
  if ((v13 & 2) != 0) {
    int v27 = v26;
  }
  else {
    int v27 = 0;
  }
  if ((v13 & 0x80) != 0) {
    int v28 = 0;
  }
  else {
    int v28 = v27;
  }
  int v29 = [v9 showAppAttributionWidget];
  int v108 = v28;
  int v109 = v25;
  if ((v13 & 2) != 0) {
    int v30 = v29;
  }
  else {
    int v30 = 0;
  }
  int v31 = [v9 showVisualLookUpWidget];
  if ((v13 & 2) != 0) {
    int v32 = v31;
  }
  else {
    int v32 = 0;
  }
  int v33 = [v9 showTimeWidget];
  if ((v13 & 2) != 0) {
    int v34 = v33;
  }
  else {
    int v34 = 0;
  }
  int v113 = v34;
  int v35 = [v9 showEXIFWidget];
  if ((v13 & 2) != 0) {
    int v36 = v35;
  }
  else {
    int v36 = 0;
  }
  int v110 = v36;
  if (v23)
  {
    int v37 = [v9 showAssetDescriptionWidget];
    if ((v13 & 2) != 0) {
      int v38 = v37;
    }
    else {
      int v38 = 0;
    }
    int v111 = v38;
  }
  else
  {
    int v111 = 0;
  }
  v39 = +[PXContentSyndicationConfigurationProvider sharedInstance];
  if ([v39 contentSyndicationIsAvailable])
  {
    id v40 = +[PXContentSyndicationSettings sharedInstance];
    int v41 = [v40 showSyndicatedContentWidgetForSavedAssets];
    if ((v13 & 2) != 0) {
      int v42 = v41;
    }
    else {
      int v42 = 0;
    }
    int v102 = v42;
  }
  else
  {
    int v102 = 0;
  }

  if ([v117 enableActionsWidget])
  {
    int v43 = [v9 showActionsWidget];
    if ((v13 & 8) != 0) {
      int v44 = 0;
    }
    else {
      int v44 = v43;
    }
    int v101 = v44;
  }
  else
  {
    int v101 = 0;
  }
  int v106 = v30;
  int v45 = [v9 showCaptionHashtagsWidget];
  if ((v13 & 2) != 0) {
    int v46 = v45;
  }
  else {
    int v46 = 0;
  }
  int v47 = [v9 showPeopleInlineCandidateWidget];
  if ((v13 & 8) != 0) {
    BOOL v48 = 0;
  }
  else {
    BOOL v48 = v47;
  }
  if (v48 && (v13 & 2) == 0)
  {
    v49 = [v118 people];
    BOOL v48 = [v49 count] == 1;
  }
  v99 = +[PXMemoriesRelatedSettings sharedInstance];
  if ([v99 enableMemoriesLivingOnFeedback])
  {
    unsigned int v100 = ((v13 & 8) == 0) & ~[(id)*MEMORY[0x1E4FB2608] isRunningTest];
    if (!v46) {
      goto LABEL_67;
    }
  }
  else
  {
    unsigned int v100 = 0;
    if (!v46)
    {
LABEL_67:
      if (!v48) {
        goto LABEL_68;
      }
      goto LABEL_72;
    }
  }
  v50 = objc_alloc_init(PXPhotosDetailsCaptionHashtagsWidget);
  [(PXPhotosDetailsCaptionHashtagsWidget *)v50 setWidgetEditingDelegate:self];
  id v51 = (id)v11[2](v11, v50, 0);

  if (!v48)
  {
LABEL_68:
    if (!v32) {
      goto LABEL_76;
    }
LABEL_75:
    id v55 = objc_alloc_init(_TtC12PhotosUICore31PhotosDetailsVisualLookupWidget);
    id v56 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v55, 0);

    goto LABEL_76;
  }
LABEL_72:
  v52 = objc_alloc_init(PXPeopleCandidateWidget);
  v53 = v52;
  if ((v13 & 2) != 0) {
    [(PXPeopleCandidateWidget *)v52 setLoadPeopleFromFirstAsset:1];
  }
  id v54 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v53, 0);

  if (v32) {
    goto LABEL_75;
  }
LABEL_76:
  if (v113)
  {
    id v57 = objc_alloc_init(_TtC12PhotosUICore23PhotosDetailsTimeWidget);
    id v58 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v57, 0);
  }
  if (v111)
  {
    long long v59 = objc_alloc_init(_TtC12PhotosUICore35PhotosDetailsAssetDescriptionWidget);
    id v60 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v59, 0);
  }
  if (v110)
  {
    long long v61 = objc_alloc_init(_TtC12PhotosUICore23PhotosDetailsEXIFWidget);
    id v62 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v61, 0);
  }
  if (v17)
  {
    uint64_t v63 = objc_alloc_init(PXPhotosDetailsHeaderTileWidget);
    v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v63, 0);
    v64 = (PXPhotosDetailsHeaderTileWidget *)objc_claimAutoreleasedReturnValue();
    headerWidget = self->__headerWidget;
    self->__headerWidget = v64;
  }
  if (v115)
  {
    long long v66 = objc_alloc_init(PXPhotosDetailsAssetsWidget);
    [(PXPhotosDetailsAssetsWidget *)v66 setWidgetOneUpDelegate:self];
    v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v66, 2);
    long long v67 = (PXUIWidget *)objc_claimAutoreleasedReturnValue();
    previewWidget = self->__previewWidget;
    self->__previewWidget = v67;
  }
  if ((v114 & ((v13 & 2) == 0)) != 0)
  {
    v69 = [[PXPeopleRelatedWidget alloc] initWithViewType:v15 >> 1];
    id v70 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v69, 0);
  }
  if (v112)
  {
    id v71 = [[PXUIMapWidget alloc] initWithEnableCuratedThumbnails:(v13 & 2) == 0];
    [(PXUIMapWidget *)v71 setShowAddressLink:v15 != 0];
    id v72 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v71, 1);
  }
  if (v109)
  {
    double v73 = objc_alloc_init(_TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget);
    id v74 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v73, 0);
  }
  if (v108)
  {
    double v75 = objc_alloc_init(_TtC12PhotosUICore35PhotosDetailsAlbumAttributionWidget);
    id v76 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v75, 0);
  }
  if (v102)
  {
    long long v77 = objc_alloc_init(_TtC12PhotosUICore32PhotosDetailsSharedWithYouWidget);
    id v78 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v77, 0);
  }
  if (v106)
  {
    long long v79 = objc_alloc_init(_TtC12PhotosUICore32PhotosDetailsSavedFromAppsWidget);
    id v80 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v79, 0);

LABEL_99:
    v81 = objc_alloc_init(_TtC12PhotosUICore34PhotosDetailsAssetProvenanceWidget);
    id v82 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v81, 0);

    goto LABEL_100;
  }
  if ((v13 & 2) != 0) {
    goto LABEL_99;
  }
LABEL_100:
  if ((v13 & 0x800) != 0)
  {
    uint64_t v83 = objc_alloc_init(PXDemoTilingControllerWidget);
    id v84 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v83, 1);

    v85 = objc_alloc_init(PXDemoViewWidget);
    id v86 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v85, 1);

    v87 = objc_alloc_init(PXDemoDynamicViewWidget);
    id v88 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v87, 1);
  }
  if (v100)
  {
    v89 = objc_alloc_init(PXMemoriesLivingOnFeedbackWidget);
    id v90 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v89, 0);
  }
  if (v101)
  {
    v91 = objc_alloc_init(PXPhotosDetailsActionsUIWidget);
    [(PXPhotosDetailsActionsUIWidget *)v91 setAllowRevealInMomentAction:(v13 >> 4) & 1];
    [(PXPhotosDetailsActionsUIWidget *)v91 setAllowCreateMemoryAction:(v13 & 2) == 0];
    [(PXPhotosDetailsActionsUIWidget *)v91 setAllowInternalFileRadarAction:(v13 >> 6) & 1];
    id v92 = (id)v11[2](v11, (PXPhotosDetailsCaptionHashtagsWidget *)v91, 0);
  }
  v93 = (NSArray *)[v116 copy];
  widgets = self->__widgets;
  self->__widgets = v93;

  [(PXPhotosDetailsUIViewController *)self setEmpty:[(NSArray *)self->__widgets count] == 0];
  [(PXPhotosDetailsUIViewController *)self _updateAllWidgetsSpec];
  [(PXPhotosDetailsUIViewController *)self _updateAllWidgetsSelectionState];
  objc_storeStrong((id *)&self->__widgetOptions, obj);
  v95 = [(PXPhotosDetailsUIViewController *)self _viewModel];
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke_3;
  v120[3] = &unk_1E5DB8A50;
  v120[4] = v135;
  v120[5] = v131;
  v120[6] = v133;
  [v95 performChanges:v120];

  v96 = v104;
  v97 = v96;
  if (v105 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
  {
    *(_WORD *)v119 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v97, OS_SIGNPOST_INTERVAL_END, spid, "InfoPanelWillLoadWidgets", "", v119, 2u);
  }

  _Block_object_dispose(v131, 8);
  _Block_object_dispose(v133, 8);
  _Block_object_dispose(v135, 8);
  _Block_object_dispose(buf, 8);
}

id __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector()) {
    [v5 setWidgetUnlockDelegate:*(void *)(a1 + 32)];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setContext:*(void *)(a1 + 40)];
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setWidgetInteractionDelegate:*(void *)(a1 + 32)];
  }
  if ([v5 conformsToProtocol:&unk_1F0396DB8]
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v5 conformsToProtocol:&unk_1F0304B38])
  {
    [v5 setOneUpPresentation:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDelegate:v5];
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v5 hasContentForCurrentInput])
  {
    [*(id *)(a1 + 48) addObject:v5];
    uint64_t v8 = *(void **)(a1 + 56);
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [v8 setObject:v9 forKey:v5];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    if (*(unsigned char *)(v10 + 24))
    {
      char v11 = 1;
    }
    else
    {
      char v11 = [v5 supportsSelection];
      uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    }
    *(unsigned char *)(v10 + 24) = v11;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      uint64_t v12 = [v5 selectionManager];
      uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
      int v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
    if (*(unsigned char *)(v15 + 24))
    {
      char v16 = 1;
    }
    else
    {
      char v16 = [v5 supportsFaceMode];
      uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
    }
    *(unsigned char *)(v15 + 24) = v16;
  }
  if (objc_opt_respondsToSelector()) {
    [v5 setActionPerformerDelegate:*(void *)(a1 + 32)];
  }
  return v5;
}

uint64_t __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setShouldShowMovieHeader:*(unsigned __int8 *)(a1 + 32)];
}

void __47__PXPhotosDetailsUIViewController__loadWidgets__block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1[4] + 8) + 24);
  id v4 = a2;
  [v4 setSupportsSelection:v3];
  [v4 setSelectionManager:*(void *)(*(void *)(a1[5] + 8) + 40)];
  [v4 setSupportsFaceMode:*(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24)];
}

- (BOOL)_shouldShowMovieHeader
{
  v2 = [(PXPhotosDetailsUIViewController *)self context];
  uint64_t v3 = [v2 photosDataSource];
  BOOL v4 = +[PXPhotosDetailsHeaderTileWidget canShowMovieHeaderForDataSource:v3];

  return v4;
}

- (void)_loadComposition
{
  if (!self->_composition)
  {
    [(PXPhotosDetailsUIViewController *)self _loadWidgets];
    id v13 = [(PXPhotosDetailsUIViewController *)self _widgets];
    BOOL v4 = [(PXPhotosDetailsUIViewController *)self _scrollViewController];
    if (!v4)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsUIViewController.m" lineNumber:693 description:@"missing scrollViewController"];
    }
    id v5 = [[PXWidgetComposition alloc] initWithScrollViewController:v4];
    composition = self->_composition;
    self->_composition = v5;

    [(PXPhotosDetailsUIViewController *)self _updateCompositionSpec];
    [(PXWidgetComposition *)self->_composition setDelegate:self];
    [(PXWidgetComposition *)self->_composition setWidgets:v13];
    if (![(PXPhotosDetailsUIViewController *)self isEmpty]) {
      [(PXTilingControllerComposition *)self->_composition setActive:1];
    }
    uint64_t v7 = [(PXPhotosDetailsUIViewController *)self composition];
    uint64_t v8 = [(PXPhotosDetailsUIViewController *)self _previewWidget];
    uint64_t v9 = [v7 headerTilingControllerForWidget:v8];
    headerAssetWidgetTilingController = self->__headerAssetWidgetTilingController;
    self->__headerAssetWidgetTilingController = v9;

    if (self->_delegateRespondsTo.compositionDidChange)
    {
      char v11 = [(PXPhotosDetailsUIViewController *)self delegate];
      [v11 photosDetailsUIViewControllerCompositionDidChange:self];
    }
  }
}

- (void)_updateWidgetsBackground
{
  uint64_t v3 = [(PXPhotosDetailsUIViewController *)self context];
  uint64_t v4 = [v3 viewSourceOrigin];

  id v5 = [(PXPhotosDetailsUIViewController *)self _widgetSpec];
  uint64_t v6 = [v5 sizeClass];

  if (v4 == 1 && v6 == 1)
  {
    uint64_t v7 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
    id v29 = [v7 scrollView];

    uint64_t v8 = [(PXPhotosDetailsUIViewController *)self widgetsBackgroundView];

    if (!v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      uint64_t v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      char v11 = [MEMORY[0x1E4FB1618] systemGray6Color];
      uint64_t v12 = [v11 colorWithAlphaComponent:0.6];
      [v10 setBackgroundColor:v12];

      id v13 = [v10 layer];
      [v13 setZPosition:-15000000.0];

      [v29 addSubview:v10];
      [(PXPhotosDetailsUIViewController *)self setWidgetsBackgroundView:v10];
    }
    [v29 contentSize];
    double v15 = v14;
    [v29 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    [(PXPhotosDetailsUIViewController *)self contentEdgeInsets];
    if (v22 > 0.0)
    {
      [(PXPhotosDetailsUIViewController *)self contentEdgeInsets];
      double v24 = v23;
      [v29 adjustedContentInset];
      double v19 = v24 - v25;
    }
    [v29 bounds];
    double v27 = v15 + v26 * 1.5;
    int v28 = [(PXPhotosDetailsUIViewController *)self widgetsBackgroundView];
    objc_msgSend(v28, "setFrame:", v17, v19, v21, v27);
  }
}

- (void)_ensureScrollViewController
{
  if (!self->__scrollViewController)
  {
    if (([(PXPhotosDetailsUIViewController *)self isViewLoaded] & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsUIViewController.m" lineNumber:634 description:@"view not loaded"];
    }
    id v11 = [(PXPhotosDetailsUIViewController *)self view];
    uint64_t v4 = [PXUIScrollViewController alloc];
    [v11 bounds];
    id v5 = -[PXUIScrollViewController initWithFrame:](v4, "initWithFrame:");
    scrollViewController = self->__scrollViewController;
    self->__scrollViewController = v5;

    [(PXUIScrollViewController *)self->__scrollViewController setChildScrollViewAccessibilityIdentifier:@"photos_details_view_scroll_view"];
    [(PXScrollViewController *)self->__scrollViewController registerObserver:self];
    [(PXUIScrollViewController *)self->__scrollViewController setIgnoresSafeAreaInsets:1];
    uint64_t v7 = [(PXUIScrollViewController *)self->__scrollViewController scrollView];
    uint64_t v8 = [(PXPhotosDetailsUIViewController *)self context];
    BOOL v9 = [v8 viewSourceOrigin] != 1;

    [v7 setAutoresizingMask:18];
    [v11 addSubview:v7];
    [(PXUIScrollViewController *)self->__scrollViewController setShowsVerticalScrollIndicator:v9];
    [(PXPhotosDetailsUIViewController *)self _updateScrollViewControllerContentInset];
  }
}

- (double)captionWidgetCurrentContentHeight
{
  v2 = [(NSArray *)self->__widgets firstObject];
  objc_opt_class();
  double v3 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v2 currentContentHeight];
    double v3 = v4;
  }

  return v3;
}

- (double)captionWidgetPreferredHeight
{
  double v3 = [(NSArray *)self->__widgets firstObject];
  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(PXPhotosDetailsUIViewController *)self view];
    [v5 bounds];
    double v7 = v6;

    [v3 preferredContentHeightForWidth:v7];
    double v4 = v8;
  }

  return v4;
}

- (void)_handleWidgetsLoadingDelay
{
  if ([(PXPhotosDetailsUIViewController *)self _hasAppeared])
  {
    double v3 = [(PXPhotosDetailsUIViewController *)self composition];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__PXPhotosDetailsUIViewController__handleWidgetsLoadingDelay__block_invoke;
    v5[3] = &unk_1E5DD36F8;
    id v6 = v3;
    id v4 = v3;
    [v4 performWidgetLoadingChange:v5];
  }
}

void __61__PXPhotosDetailsUIViewController__handleWidgetsLoadingDelay__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMinimumWidgetLoadingPriority:0];
  v2 = +[PXPhotosDetailsSettings sharedInstance];
  int v3 = [v2 loadAllWidgetsContentAfterDelay];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 setShouldLoadAllWidgets:1];
  }
}

- (unint64_t)occludedContentEdges
{
  return 15;
}

- (BOOL)shouldUpdateStatusBarTitle
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->requestDismissal = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->compositionDidChange = objc_opt_respondsToSelector() & 1;
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
}

- (void)_updateScrollViewControllerContentInset
{
}

- (BOOL)_dismissSelfIfSafeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXPhotosDetailsUIViewController *)self navigationController];
  id v6 = v5;
  if (v5)
  {
    double v7 = [v5 visibleViewController];

    if (v7 == self)
    {
      id v8 = (id)[v6 popViewControllerAnimated:v3];
LABEL_9:
      char v11 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v9 = [(PXPhotosDetailsUIViewController *)self presentedViewController];

    if (!v9)
    {
      [(PXPhotosDetailsUIViewController *)self dismissViewControllerAnimated:v3 completion:0];
      goto LABEL_9;
    }
  }
  if (self->_delegateRespondsTo.requestDismissal)
  {
    uint64_t v10 = [(PXPhotosDetailsUIViewController *)self delegate];
    char v11 = [v10 photosDetailsUIViewControllerRequestDismissal:self];
  }
  else
  {
    char v11 = 0;
  }
LABEL_10:

  return v11;
}

- (CGSize)preferredContentSize
{
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v12 preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  if (([(PXPhotosDetailsUIViewController *)self options] & 8) != 0)
  {
    double v7 = [(PXPhotosDetailsUIViewController *)self view];
    [v7 frame];
    double v4 = v8;
    double v6 = v9;
  }
  double v10 = v4;
  double v11 = v6;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_viewWillLayoutBeforeAppearing
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(PXPhotosDetailsUIViewController *)self _ensureScrollViewController];
  [(PXPhotosDetailsUIViewController *)self _ensureComposition];
  double v3 = [(PXPhotosDetailsUIViewController *)self composition];
  double v4 = PLRelatedGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    int v33 = self;
    __int16 v34 = 2112;
    int v35 = v3;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "[%@] _viewWillLayoutBeforeAppearing composition=%@", buf, 0x16u);
  }

  double v5 = +[PXPhotosDetailsSettings sharedInstance];
  if ([v5 allowWidgetsContentLoading])
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __65__PXPhotosDetailsUIViewController__viewWillLayoutBeforeAppearing__block_invoke;
    v29[3] = &unk_1E5DD36F8;
    id v30 = v3;
    [v30 performWidgetLoadingChange:v29];
    [v5 defaultPriorityWidgetsLoadingDelay];
    double v7 = v6;
    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PXPhotosDetailsUIViewController__viewWillLayoutBeforeAppearing__block_invoke_2;
    block[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v28, (id *)buf);
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  [(PXPhotosDetailsUIViewController *)self _updateStatusBarTitle];
  double v9 = [(PXPhotosDetailsUIViewController *)self barsController];
  [v9 updateIfNeeded];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
  [(PXPhotosDetailsUIViewController *)self _setContextMenuInteraction:v10];
  double v11 = [(PXPhotosDetailsUIViewController *)self view];
  [v11 addInteraction:v10];

  objc_super v12 = +[PXCursorInteractionSettings sharedInstance];
  int v13 = [v12 enableDetailsEffect];

  if (v13)
  {
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:self];
    [(PXPhotosDetailsUIViewController *)self _setPointerInteraction:v14];
    double v15 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
    double v16 = [v15 scrollView];

    [v16 addInteraction:v14];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v17 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        double v22 = *(void **)(*((void *)&v23 + 1) + 8 * v21);
        if (objc_opt_respondsToSelector()) {
          [v22 contentViewWillAppear];
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v19);
  }
}

uint64_t __65__PXPhotosDetailsUIViewController__viewWillLayoutBeforeAppearing__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMinimumWidgetLoadingPriority:1];
  v2 = *(void **)(a1 + 32);
  return [v2 setShouldLoadVisibleWidgets:1];
}

void __65__PXPhotosDetailsUIViewController__viewWillLayoutBeforeAppearing__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleWidgetsLoadingDelay];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v3 viewWillLayoutSubviews];
  if (![(PXPhotosDetailsUIViewController *)self _hasAppeared]
    && [(UIViewController *)self px_isVisible])
  {
    [(PXPhotosDetailsUIViewController *)self _setHasAppeared:1];
    [(PXPhotosDetailsUIViewController *)self _viewWillLayoutBeforeAppearing];
  }
  [(PXPhotosDetailsUIViewController *)self _updateScrollViewControllerContentInset];
  [(PXPhotosDetailsUIViewController *)self _updateWidgetsBackground];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v20 viewDidDisappear:a3];
  double v4 = [(PXPhotosDetailsUIViewController *)self eventTracker];
  [v4 logViewControllerDidDisappear:self];

  [(PXPhotosDetailsUIViewController *)self _setHasAppeared:0];
  double v5 = [(PXPhotosDetailsUIViewController *)self _contextMenuInteraction];
  double v6 = v5;
  if (v5)
  {
    double v7 = [v5 view];
    [v7 removeInteraction:v6];

    [(PXPhotosDetailsUIViewController *)self _setContextMenuInteraction:0];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  dispatch_time_t v8 = [(PXPhotosDetailsUIViewController *)self _widgets];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 contentViewDidDisappear];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  double v14 = [(PXPhotosDetailsUIViewController *)self siriActionActivity];
  [v14 resignCurrent];

  double v15 = [(PXPhotosDetailsUIViewController *)self userActivityController];
  [v15 setActive:0];

  [MEMORY[0x1E4F39160] clearCurrentMemoryForURLNavigation];
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v67.receiver = self;
  v67.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v67 viewDidAppear:a3];
  double v4 = [(PXPhotosDetailsUIViewController *)self context];
  double v5 = [v4 photosDataSource];
  double v6 = [v5 containerAssetCollection];

  double v7 = +[_PXPhotosDetailsPurger sharedPurger];
  [v7 detailsViewControllerDidAppear:self];
  if ((self->_options & 0xA) == 0) {
    [v7 purgeOldViewControllers];
  }
  dispatch_time_t v8 = [(PXPhotosDetailsUIViewController *)self scrollViewController];
  uint64_t v9 = [v8 scrollView];

  if (objc_msgSend(v9, "px_isScrolledAtEdge:", 1))
  {
    uint64_t v10 = [(PXPhotosDetailsUIViewController *)self view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v10 safeAreaInsets];
    CGFloat v20 = v12 + v19;
    CGFloat v22 = v14 + v21;
    CGFloat v24 = v16 - (v19 + v23);
    CGFloat v26 = v18 - (v21 + v25);
    double v27 = [(PXPhotosDetailsUIViewController *)self _headerWidget];
    id v28 = [(PXPhotosDetailsUIViewController *)self context];
    id v29 = [v27 regionOfInterestForContext:v28];
    id v30 = [(PXPhotosDetailsUIViewController *)self view];
    [v29 rectInCoordinateSpace:v30];
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v71.origin.double x = v20;
    v71.origin.double y = v22;
    v71.size.double width = v24;
    v71.size.double height = v26;
    CGRectGetMaxY(v71);
    v72.origin.double x = v32;
    v72.origin.double y = v34;
    v72.size.double width = v36;
    v72.size.double height = v38;
    CGRectGetMaxY(v72);
    PXFloatEqualToFloatWithTolerance();
  }
  if (objc_msgSend(MEMORY[0x1E4F22488], "px_allowsDonationsForCurrentProcess"))
  {
    v39 = [(PXPhotosDetailsUIViewController *)self siriActionActivity];

    if (v39)
    {
      id v40 = [(PXPhotosDetailsUIViewController *)self siriActionActivity];
      [v40 becomeCurrent];
LABEL_20:

      goto LABEL_21;
    }
    if ([v4 viewSourceOrigin] == 5)
    {
      int v41 = [v6 localizedTitle];
      id v40 = v41;
      if (v41)
      {
        int v42 = [v41 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];
        int v43 = (void *)MEMORY[0x1E4F22488];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke;
        v65[3] = &unk_1E5DC5600;
        id v66 = v42;
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_2;
        v62[3] = &unk_1E5DB89E0;
        id v63 = v6;
        v64 = self;
        int v44 = v42;
        objc_msgSend(v43, "px_requestActivityWithActivityType:titleProvider:completionBlock:", @"com.apple.mobileslideshow.memory", v65, v62);
      }
      else
      {
        int v44 = PLUIGetLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v69 = v6;
          _os_log_impl(&dword_1A9AE7000, v44, OS_LOG_TYPE_ERROR, "No localized title found for memory: %@", buf, 0xCu);
        }
      }
      goto LABEL_19;
    }
    if ([v4 viewSourceOrigin] == 6)
    {
      int v45 = [v4 people];
      id v40 = [v45 fetchedObjects];

      if ([v40 count] != 1) {
        goto LABEL_20;
      }
      int v44 = [v40 firstObject];
      int v46 = [v44 px_localizedName];
      if (!+[PXPeopleUtilities isPersonHiddenFromPeopleHome:](PXPeopleUtilities, "isPersonHiddenFromPeopleHome:", v44)&& [v46 length])
      {
        int v47 = (void *)MEMORY[0x1E4F22488];
        v60[0] = MEMORY[0x1E4F143A8];
        v60[1] = 3221225472;
        v60[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_315;
        v60[3] = &unk_1E5DC5600;
        id v61 = v46;
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_2_319;
        v57[3] = &unk_1E5DB89E0;
        id v58 = v44;
        long long v59 = self;
        objc_msgSend(v47, "px_requestActivityWithActivityType:titleProvider:completionBlock:", @"com.apple.mobileslideshow.people", v60, v57);
      }
LABEL_19:

      goto LABEL_20;
    }
  }
LABEL_21:
  BOOL v48 = [(PXPhotosDetailsUIViewController *)self userActivityController];
  [v48 setActive:1];

  v49 = [(PXPhotosDetailsUIViewController *)self eventTracker];
  [v49 logViewControllerDidAppear:self];

  if (![(PXPhotosDetailsUIViewController *)self didAppearOnce])
  {
    [(PXPhotosDetailsUIViewController *)self setDidAppearOnce:1];
    uint64_t v50 = [v4 contextHierarchyDepth];
    if (v50)
    {
      id v51 = objc_msgSend(MEMORY[0x1E4F56658], "bucketNameForInteger:bucketLimits:", v50, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 15, 20, 30, 50, 0);
      v52 = (void *)[[NSString alloc] initWithFormat:@"com.apple.photos.CPAnalytics.photosDetailsNavigatedToDepth%@", v51];
      [MEMORY[0x1E4F56658] sendEvent:v52 withPayload:MEMORY[0x1E4F1CC08]];
    }
  }
  v53 = [(PXPhotosDetailsUIViewController *)self initiallyPresentedAssetReference];

  if (v53)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_3;
    aBlock[3] = &unk_1E5DD36F8;
    aBlock[4] = self;
    id v54 = (void (**)(void))_Block_copy(aBlock);
    id v55 = [(PXPhotosDetailsUIViewController *)self presentedViewController];

    if (v55) {
      [(PXPhotosDetailsUIViewController *)self dismissViewControllerAnimated:0 completion:v54];
    }
    else {
      v54[2](v54);
    }
  }
}

id __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return px_deferredLocalizedStringWithFormat(@"PXSiriActionsViewMemoryContainerTitle", a2, a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
}

void __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setEligibleForSearch:1];
  [v3 _setEligibleForPrediction:1];
  [v3 setEligibleForHandoff:0];
  double v6 = @"identifier";
  double v4 = [*(id *)(a1 + 32) localIdentifier];
  v7[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 addUserInfoEntriesFromDictionary:v5];

  objc_msgSend(v3, "px_setPersistentIdentifierFromAssetCollection:", *(void *)(a1 + 32));
  [*(id *)(a1 + 40) setSiriActionActivity:v3];
  [v3 becomeCurrent];
}

id __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_315(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return px_deferredLocalizedStringWithFormat(@"PXSiriActionsViewPersonTitle", a2, a3, a4, a5, a6, a7, a8, *(void *)(a1 + 32));
}

void __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_2_319(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setEligibleForSearch:1];
  [v3 _setEligibleForPrediction:1];
  double v6 = @"identifier";
  double v4 = [*(id *)(a1 + 32) localIdentifier];
  v7[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 addUserInfoEntriesFromDictionary:v5];

  [*(id *)(a1 + 40) setSiriActionActivity:v3];
  [v3 becomeCurrent];
}

void __49__PXPhotosDetailsUIViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _previewWidget];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [*(id *)(a1 + 32) _previewWidget];
    double v4 = [*(id *)(a1 + 32) initiallyPresentedAssetReference];
    [v5 presentOneUpForAssetReference:v4 animated:0];

    [*(id *)(a1 + 32) setInitiallyPresentedAssetReference:0];
  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v7 viewIsAppearing:a3];
  double v4 = [(PXFeatureSpecManager *)self->__specManager spec];
  id v5 = [v4 backgroundColor];
  double v6 = [(PXPhotosDetailsUIViewController *)self view];
  [v6 setBackgroundColor:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v5 viewWillAppear:a3];
  double v4 = [(PXPhotosDetailsUIViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)_updateStatusBarTitle
{
  if ([(PXPhotosDetailsUIViewController *)self shouldUpdateStatusBarTitle])
  {
    id v3 = [(PXPhotosDetailsUIViewController *)self barsController];

    if (v3)
    {
      id v19 = [(PXPhotosDetailsUIViewController *)self barsController];
      double v4 = [(PXPhotosDetailsUIViewController *)self _headerWidget];

      if (v4)
      {
        objc_super v5 = [(PXPhotosDetailsUIViewController *)self _headerWidget];
        double v6 = [v5 contentTilingController];
      }
      else
      {
        double v6 = [(PXPhotosDetailsUIViewController *)self _headerAssetWidgetTilingController];
      }
      objc_super v7 = [v6 currentLayout];
      [v7 contentBounds];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      uint64_t v16 = [v6 currentLayout];
      if (v16)
      {
        double v17 = (void *)v16;
        v21.origin.double x = v9;
        v21.origin.double y = v11;
        v21.size.double width = v13;
        v21.size.double height = v15;
        IsEmptdouble y = CGRectIsEmpty(v21);

        if (!IsEmpty)
        {
          [v7 visibleRect];
          [v6 scrollController];
          [(id)objc_claimAutoreleasedReturnValue() contentInset];
          PXEdgeInsetsInsetRect();
        }
      }
      [v19 shouldShowTitleView:0 animated:0];
    }
  }
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v13 viewDidLoad];
  id v3 = [(PXFeatureSpecManager *)self->__specManager spec];
  if (([(PXPhotosDetailsUIViewController *)self options] & 4) == 0
    && [v3 shouldInitializeBarsController])
  {
    [(UIViewController *)self px_enableBarAppearance];
    id v4 = objc_alloc(self->__barsControllerClass);
    context = self->_context;
    viewModel = self->__viewModel;
    objc_super v7 = [(UIViewController *)self px_extendedTraitCollection];
    double v8 = (PXBarsController *)[v4 initWithContext:context viewModel:viewModel extendedTraitCollection:v7];
    barsController = self->_barsController;
    self->_barsController = v8;

    [(PXBarsController *)self->_barsController setDelegate:self];
    [(PXBarsController *)self->_barsController setViewController:self];
    [(PXBarsController *)self->_barsController setActionPerformerDelegate:self];
    [(PXPhotosDetailsUIViewController *)self _updateBarSpec];
  }
  double v10 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@" " modifierFlags:0 action:sel__handleSpaceBar_];
  [(PXPhotosDetailsUIViewController *)self addKeyCommand:v10];

  CGFloat v11 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"." modifierFlags:0 action:sel_favoriteAssets_];
  [(PXPhotosDetailsUIViewController *)self addKeyCommand:v11];

  double v12 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\b" modifierFlags:0 action:sel_trashAssets_];
  [(PXPhotosDetailsUIViewController *)self addKeyCommand:v12];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (PXDisplayAsset)presentedKeyAsset
{
  v2 = [(PXPhotosDetailsUIViewController *)self _headerWidget];
  id v3 = [v2 presentedKeyAsset];

  return (PXDisplayAsset *)v3;
}

- (void)dealloc
{
  [(PXWidgetComposition *)self->_composition setShouldUnloadAllWidgets:1];
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsUIViewController;
  [(PXPhotosDetailsUIViewController *)&v3 dealloc];
}

- (PXPhotosDetailsUIViewController)initWithContext:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = objc_alloc_init(PXPhotosDetailsConfiguration);
  [(PXPhotosDetailsConfiguration *)v7 setOptions:a4];
  double v8 = [(PXPhotosDetailsUIViewController *)self initWithContext:v6 configuration:v7];

  return v8;
}

- (PXPhotosDetailsUIViewController)initWithContext:(id)a3 configuration:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    CGFloat v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PXPhotosDetailsUIViewController.m", 197, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  v39.receiver = self;
  v39.super_class = (Class)PXPhotosDetailsUIViewController;
  double v10 = [(PXPhotosDetailsUIViewController *)&v39 initWithNibName:0 bundle:0];
  CGFloat v11 = v10;
  if (v10)
  {
    p_context = (id *)&v10->_context;
    objc_storeStrong((id *)&v10->_context, a3);
    [*p_context registerChangeObserver:v11 context:PXPhotosDetailsContextObservationContext_91418];
    if (v9) {
      uint64_t v13 = [v9 options];
    }
    else {
      uint64_t v13 = 0;
    }
    v11->_options = v13;
    uint64_t v14 = PXViewControllerEventTrackerCreateWithPhotosDetailsContext(*p_context);
    eventTracker = v11->_eventTracker;
    v11->_eventTracker = (PXViewControllerEventTracker *)v14;

    long long v16 = *((_OWORD *)off_1E5DAAF00 + 1);
    *(_OWORD *)&v11->_contentEdgeInsets.double top = *(_OWORD *)off_1E5DAAF00;
    *(_OWORD *)&v11->_contentEdgeInsets.double bottom = v16;
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    widgetDisablingDimmingViews = v11->__widgetDisablingDimmingViews;
    v11->__widgetDisablingDimmingViews = (NSMutableArray *)v17;

    id v19 = [(PXPhotosDetailsUIViewController *)v11 navigationItem];
    objc_msgSend(v19, "px_setPreferredLargeTitleDisplayMode:", 2);

    [(UIViewController *)v11 px_enableExtendedTraitCollection];
    CGFloat v20 = [(UIViewController *)v11 px_extendedTraitCollection];
    [v20 registerChangeObserver:v11 context:PXExtendedTraitCollectionObservationContext_91415];
    CGRect v21 = [[PXPhotosDetailsSpecManager alloc] initWithExtendedTraitCollection:v20 detailsOptions:v11->_options];
    specManager = v11->__specManager;
    v11->__specManager = v21;

    [(PXPhotosDetailsSpecManager *)v11->__specManager registerChangeObserver:v11 context:PXSpecManagerObservationContext];
    double v23 = objc_alloc_init(PXPhotosDetailsViewModel);
    viewModel = v11->__viewModel;
    v11->__viewModel = v23;

    [(PXPhotosDetailsViewModel *)v11->__viewModel registerChangeObserver:v11 context:PXViewModelObservationContext_91416];
    id v25 = *p_context;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __65__PXPhotosDetailsUIViewController_initWithContext_configuration___block_invoke;
    v36[3] = &unk_1E5DB89B8;
    CGFloat v26 = v11;
    double v37 = v26;
    id v27 = v9;
    id v38 = v27;
    [v25 performChanges:v36];
    [v26 _updateTitleAndSubtitle];
    id v28 = (void *)[v27 barsControllerClass];
    if (!v28) {
      id v28 = objc_opt_class();
    }
    objc_storeStrong(v26 + 139, v28);
    if (([v26[139] isSubclassOfClass:objc_opt_class()] & 1) == 0)
    {
      double v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2, v26, @"PXPhotosDetailsUIViewController.m", 234, @"Invalid parameter not satisfying: %@", @"[__barsControllerClass isSubclassOfClass:[PXPhotosDetailsBarsController class]]" object file lineNumber description];
    }
    uint64_t v29 = [v27 unlockDeviceStatus];
    id v30 = v26[140];
    v26[140] = (id)v29;

    uint64_t v31 = [v27 unlockDeviceHandlerWithActionType];
    id v32 = v26[141];
    v26[141] = (id)v31;

    objc_msgSend(v26, "px_enableOneUpPresentation");
  }

  return v11;
}

void __65__PXPhotosDetailsUIViewController_initWithContext_configuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 1032);
  id v4 = a2;
  [v4 setViewModel:v3];
  id v5 = [*(id *)(a1 + 40) unlockDeviceStatus];
  [v4 setUnlockDeviceStatus:v5];
}

- (PXPhotosDetailsUIViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosDetailsUIViewController.m", 193, @"%s is not available as initializer", "-[PXPhotosDetailsUIViewController initWithCoder:]");

  abort();
}

- (PXPhotosDetailsUIViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosDetailsUIViewController.m", 189, @"%s is not available as initializer", "-[PXPhotosDetailsUIViewController initWithNibName:bundle:]");

  abort();
}

+ (void)preloadResources
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PXPhotosDetailsUIViewController_preloadResources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (preloadResources_onceToken != -1) {
    dispatch_once(&preloadResources_onceToken, block);
  }
}

uint64_t __51__PXPhotosDetailsUIViewController_preloadResources__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "px_preloadExtendedTraitCollection");
}

@end