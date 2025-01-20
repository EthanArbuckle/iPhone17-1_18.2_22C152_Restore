@interface PXPhotosDetailsAssetsWidget
+ (void)_refreshSortDescriptorsInPhotosDataSource:(id)a3 withPeople:(id)a4;
- (BOOL)_addAssetReferencesToDrag:(id)a3;
- (BOOL)_autoPlayVideoInOneUp;
- (BOOL)_canDragAssetReferences:(id)a3;
- (BOOL)_canDragOut;
- (BOOL)_curate;
- (BOOL)_isLocationWithinCurrentLayoutBounds:(CGPoint)a3;
- (BOOL)_showCurationButton;
- (BOOL)_transitionWithoutAnimation;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)cursorInteractionEnabled;
- (BOOL)didLogCuratedAssetCount;
- (BOOL)didLogUncuratedAssetCount;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasLoadedContentData;
- (BOOL)isFaceModeEnabled;
- (BOOL)isSelecting;
- (BOOL)isUserInteractionEnabled;
- (BOOL)shouldEnablePlaybackForController:(id)a3;
- (BOOL)supportsFaceMode;
- (BOOL)supportsSelection;
- (BOOL)swipeSelectionManager:(id)a3 shouldBeginSelectionAtLocation:(CGPoint)a4;
- (CGPoint)_visibleOriginScrollTarget;
- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4;
- (CGPoint)tilingController:(id)a3 targetVisibleOriginForLayout:(id)a4 proposedVisibleOrigin:(CGPoint)a5;
- (CGRect)engineDrivenLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5;
- (CGSize)minimumItemSizeForPlaybackInController:(id)a3;
- (NSSet)_draggingAssetReferences;
- (NSSet)_hiddenAssetReferences;
- (NSString)localizedDisclosureTitle;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PXAssetActionManager)assetActionManager;
- (PXAssetReference)_focusedAssetReference;
- (PXAssetReference)_highlightedAssetReference;
- (PXAssetReference)_navigatedAssetReference;
- (PXBasicUIViewTileAnimator)_tileAnimator;
- (PXLayoutGenerator)_layoutGenerator;
- (PXOneUpPresentation)oneUpPresentation;
- (PXPhotoKitAssetsDataSourceManager)_dataSourceManager;
- (PXPhotoKitUIMediaProvider)_mediaProvider;
- (PXPhotosDataSource)_photosDataSource;
- (PXPhotosDataSourceStressTest)_currentDataSourceStressTest;
- (PXPhotosDetailsAssetsSpecManager)_specManager;
- (PXPhotosDetailsAssetsWidget)init;
- (PXPhotosDetailsAssetsWidgetEventTracker)eventTracker;
- (PXPhotosDetailsAssetsWidgetOneUpDelegate)widgetOneUpDelegate;
- (PXPhotosDetailsContext)context;
- (PXPhotosDetailsInlinePlaybackController)_inlinePlaybackController;
- (PXPhotosDetailsLoadCoordinationToken)_loadCoordinationToken;
- (PXSectionedLayoutEngine)_layoutEngine;
- (PXSectionedSelectionManager)_selectionManager;
- (PXSectionedSelectionManager)selectionManager;
- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4;
- (PXSwipeSelectionManager)_swipeSelectionManager;
- (PXTilingController)_tilingController;
- (PXTilingController)contentTilingController;
- (PXTouchingUIGestureRecognizer)_touchGesture;
- (PXUIAssetsScene)_assetsScene;
- (PXUITapGestureRecognizer)_pressGesture;
- (PXUITapGestureRecognizer)_tapGesture;
- (PXWidgetDelegate)widgetDelegate;
- (PXWidgetSpec)spec;
- (UIDragSession)dragSession;
- (UIPinchGestureRecognizer)_pinchGesture;
- (double)engineDrivenLayout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4;
- (double)engineDrivenLayout:(id)a3 zPositionForItemAtIndexPath:(PXSimpleIndexPath *)a4;
- (id)_assetActionManagerForAssetsReference:(id)a3;
- (id)_assetReferenceAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4;
- (id)_createNewLayout;
- (id)_curationButtonTitle;
- (id)_dragItemForAssetReference:(id)a3;
- (id)_extendedTraitCollection;
- (id)_imageTileForDragItem:(id)a3;
- (id)_regionOfInterestForAssetReference:(id)a3;
- (id)_subtitle;
- (id)_title;
- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4;
- (id)assetsScene:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (id)bestCursorTileForLiftingAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (id)dataSourceManager;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)genericPreviewViewController;
- (id)imageViewBasicTileForPreviewingAtPoint:(CGPoint)a3;
- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4;
- (id)oneUpPresentationActionManagerForPreviewing:(id)a3;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4;
- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4;
- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4;
- (id)undoManagerForActionPerformer:(id)a3;
- (int64_t)contentLayoutStyle;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (void)_configureLayout:(id)a3;
- (void)_fallBackByTogglingCurationIfNeeded;
- (void)_handleTapOnAssetReference:(id)a3 autoPlayVideo:(BOOL)a4 activity:(unint64_t)a5;
- (void)_handleTapOnFocusedAssetReferenceWithActivity:(unint64_t)a3;
- (void)_invalidateLayoutGenerator;
- (void)_loadTilingController;
- (void)_logAssetCountsIfNecessary;
- (void)_performTilingChangeWithoutAnimationTransition:(id)a3;
- (void)_presentConfidentialityWarning;
- (void)_setCurate:(BOOL)a3;
- (void)_setCurrentDataSourceStressTest:(id)a3;
- (void)_setDraggingAssetReferences:(id)a3;
- (void)_setFocusedAssetReference:(id)a3;
- (void)_setHasLoadedContentData:(BOOL)a3;
- (void)_setHiddenAssetReferences:(id)a3;
- (void)_setHighlightedAssetReference:(id)a3;
- (void)_setLayoutEngine:(id)a3;
- (void)_setLayoutGenerator:(id)a3;
- (void)_setLoadCoordinationToken:(id)a3;
- (void)_setNavigatedAssetReference:(id)a3 autoPlayVideo:(BOOL)a4;
- (void)_setPhotosDataSource:(id)a3;
- (void)_setShowCurationButton:(BOOL)a3;
- (void)_setTransitionWithoutAnimation:(BOOL)a3;
- (void)_setVisibleOriginScrollTarget:(CGPoint)a3;
- (void)_toggleCuration;
- (void)_updateDraggingAssetReferencesWithDataSource:(id)a3;
- (void)_updateFocusedAssetReference;
- (void)_updateHasLoadedContentData;
- (void)_updateLayoutEngineIfNeeded;
- (void)_updateShowCurationButton;
- (void)_updateTilingLayoutIfNeeded;
- (void)_userDidSelectCurationButton;
- (void)assetsScene:(id)a3 didTransitionToDataSource:(id)a4;
- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4;
- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4;
- (void)commitPreviewViewController:(id)a3;
- (void)contentViewDidDisappear;
- (void)contentViewWillAppear;
- (void)dealloc;
- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5;
- (void)handlePinch:(id)a3;
- (void)handlePress:(id)a3;
- (void)handleTap:(id)a3;
- (void)handleTouch:(id)a3;
- (void)loadContentData;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4;
- (void)playButtonTileWasTapped:(id)a3;
- (void)presentOneUpForAssetReference:(id)a3 animated:(BOOL)a4;
- (void)scrollViewControllerContentBoundsDidChange:(id)a3;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)scrollViewControllerWillBeginScrolling:(id)a3;
- (void)setContext:(id)a3;
- (void)setDidLogCuratedAssetCount:(BOOL)a3;
- (void)setDidLogUncuratedAssetCount:(BOOL)a3;
- (void)setDragSession:(id)a3;
- (void)setFaceModeEnabled:(BOOL)a3;
- (void)setOneUpPresentation:(id)a3;
- (void)setSelecting:(BOOL)a3;
- (void)setSpec:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)setWidgetOneUpDelegate:(id)a3;
- (void)spaceBarWasPressed;
- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3;
- (void)userDidSelectSubtitle;
@end

@implementation PXPhotosDetailsAssetsWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragSession, 0);
  objc_storeStrong((id *)&self->__currentDataSourceStressTest, 0);
  objc_storeStrong((id *)&self->__loadCoordinationToken, 0);
  objc_storeStrong((id *)&self->__focusedAssetReference, 0);
  objc_storeStrong((id *)&self->__highlightedAssetReference, 0);
  objc_storeStrong((id *)&self->__touchGesture, 0);
  objc_storeStrong((id *)&self->__pinchGesture, 0);
  objc_storeStrong((id *)&self->__pressGesture, 0);
  objc_storeStrong((id *)&self->__tapGesture, 0);
  objc_storeStrong((id *)&self->__swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->__draggingAssetReferences, 0);
  objc_storeStrong((id *)&self->__hiddenAssetReferences, 0);
  objc_storeStrong((id *)&self->__navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->__layoutEngine, 0);
  objc_storeStrong((id *)&self->__layoutGenerator, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->__inlinePlaybackController, 0);
  objc_storeStrong((id *)&self->__assetsScene, 0);
  objc_storeStrong((id *)&self->__tileAnimator, 0);
  objc_storeStrong((id *)&self->__tilingController, 0);
  objc_storeStrong((id *)&self->__mediaProvider, 0);
  objc_storeStrong((id *)&self->__photosDataSource, 0);
  objc_destroyWeak((id *)&self->_widgetOneUpDelegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->__specManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
  objc_storeStrong((id *)&self->_loadStartDate, 0);
  objc_storeStrong((id *)&self->_tilesInUse, 0);
}

- (void)setDragSession:(id)a3
{
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (void)setDidLogUncuratedAssetCount:(BOOL)a3
{
  self->_didLogUncuratedAssetCount = a3;
}

- (BOOL)didLogUncuratedAssetCount
{
  return self->_didLogUncuratedAssetCount;
}

- (void)setDidLogCuratedAssetCount:(BOOL)a3
{
  self->_didLogCuratedAssetCount = a3;
}

- (BOOL)didLogCuratedAssetCount
{
  return self->_didLogCuratedAssetCount;
}

- (PXPhotosDataSourceStressTest)_currentDataSourceStressTest
{
  return self->__currentDataSourceStressTest;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (PXPhotosDetailsLoadCoordinationToken)_loadCoordinationToken
{
  return self->__loadCoordinationToken;
}

- (PXAssetReference)_focusedAssetReference
{
  return self->__focusedAssetReference;
}

- (PXAssetReference)_highlightedAssetReference
{
  return self->__highlightedAssetReference;
}

- (void)_setTransitionWithoutAnimation:(BOOL)a3
{
  self->__transitionWithoutAnimation = a3;
}

- (BOOL)_transitionWithoutAnimation
{
  return self->__transitionWithoutAnimation;
}

- (void)_setVisibleOriginScrollTarget:(CGPoint)a3
{
  self->__visibleOriginScrollTarget = a3;
}

- (CGPoint)_visibleOriginScrollTarget
{
  double x = self->__visibleOriginScrollTarget.x;
  double y = self->__visibleOriginScrollTarget.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (PXTouchingUIGestureRecognizer)_touchGesture
{
  return self->__touchGesture;
}

- (UIPinchGestureRecognizer)_pinchGesture
{
  return self->__pinchGesture;
}

- (PXUITapGestureRecognizer)_pressGesture
{
  return self->__pressGesture;
}

- (PXUITapGestureRecognizer)_tapGesture
{
  return self->__tapGesture;
}

- (PXSwipeSelectionManager)_swipeSelectionManager
{
  return self->__swipeSelectionManager;
}

- (BOOL)_showCurationButton
{
  return self->__showCurationButton;
}

- (BOOL)_curate
{
  return self->__curate;
}

- (NSSet)_draggingAssetReferences
{
  return self->__draggingAssetReferences;
}

- (NSSet)_hiddenAssetReferences
{
  return self->__hiddenAssetReferences;
}

- (BOOL)_autoPlayVideoInOneUp
{
  return self->__autoPlayVideoInOneUp;
}

- (PXAssetReference)_navigatedAssetReference
{
  return self->__navigatedAssetReference;
}

- (void)_setLayoutEngine:(id)a3
{
}

- (PXSectionedLayoutEngine)_layoutEngine
{
  return self->__layoutEngine;
}

- (void)_setLayoutGenerator:(id)a3
{
}

- (PXLayoutGenerator)_layoutGenerator
{
  return self->__layoutGenerator;
}

- (PXPhotosDetailsAssetsWidgetEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (PXPhotosDetailsInlinePlaybackController)_inlinePlaybackController
{
  return self->__inlinePlaybackController;
}

- (PXUIAssetsScene)_assetsScene
{
  return self->__assetsScene;
}

- (PXBasicUIViewTileAnimator)_tileAnimator
{
  return self->__tileAnimator;
}

- (PXTilingController)_tilingController
{
  return self->__tilingController;
}

- (PXPhotoKitUIMediaProvider)_mediaProvider
{
  return self->__mediaProvider;
}

- (PXPhotosDataSource)_photosDataSource
{
  return self->__photosDataSource;
}

- (void)setWidgetOneUpDelegate:(id)a3
{
}

- (PXPhotosDetailsAssetsWidgetOneUpDelegate)widgetOneUpDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate);
  return (PXPhotosDetailsAssetsWidgetOneUpDelegate *)WeakRetained;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (PXSectionedSelectionManager)_selectionManager
{
  return self->_selectionManager;
}

- (PXPhotoKitAssetsDataSourceManager)_dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (BOOL)isSelecting
{
  return self->_selecting;
}

- (void)setSpec:(id)a3
{
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (void)setOneUpPresentation:(id)a3
{
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  v4 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
  v5 = [v4 widgetViewControllerHostingWidget:self];

  v6 = +[PXViewControllerPresenter defaultPresenterWithViewController:v5];

  return v6;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  v4 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
  v5 = [v4 widgetUndoManager:self];

  return v5;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
  v8 = [v7 widgetViewControllerHostingWidget:self];

  v9 = [v8 presentedViewController];

  if (v9) {
    [v8 dismissViewControllerAnimated:1 completion:v6];
  }

  return v9 != 0;
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
  LOBYTE(self) = [v6 widget:self transitionToViewController:v5 withTransitionType:2];

  return (char)self;
}

- (id)dragInteraction:(id)a3 sessionForAddingItems:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v26.CGFloat x = x;
    v26.CGFloat y = y;
    v12 = NSStringFromCGPoint(v26);
    int v18 = 138412802;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    __int16 v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ sessionForAddingItems: %@ withTouchAtPoint: %@", (uint8_t *)&v18, 0x20u);
  }
  v13 = [(PXPhotosDetailsAssetsWidget *)self dragSession];
  int v14 = [v10 containsObject:v13];

  if (v14)
  {
    uint64_t v15 = [(PXPhotosDetailsAssetsWidget *)self dragSession];
LABEL_7:
    v16 = (void *)v15;
    goto LABEL_9;
  }
  if ([v10 count] == 1)
  {
    uint64_t v15 = [v10 lastObject];
    goto LABEL_7;
  }
  v16 = 0;
LABEL_9:

  return v16;
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__PXPhotosDetailsAssetsWidget_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v5[3] = &unk_1E5DCF720;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __82__PXPhotosDetailsAssetsWidget_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) _setDraggingAssetReferences:0];
  }
  return result;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__PXPhotosDetailsAssetsWidget_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v5[3] = &unk_1E5DCF720;
  v5[4] = self;
  [a4 addCompletion:v5];
}

uint64_t __83__PXPhotosDetailsAssetsWidget_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1) {
    return [*(id *)(result + 32) _setDraggingAssetReferences:0];
  }
  return result;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2048;
    unint64_t v16 = a5;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ session: %@ didEndWithOperation: %lu", (uint8_t *)&v11, 0x20u);
  }

  [(PXPhotosDetailsAssetsWidget *)self setDragSession:0];
  [(PXPhotosDetailsAssetsWidget *)self _setDraggingAssetReferences:0];
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ sessionWillBegin: %@", (uint8_t *)&v9, 0x16u);
  }

  [(PXPhotosDetailsAssetsWidget *)self setDragSession:v7];
  [(PXPhotosDetailsAssetsWidget *)self _setHighlightedAssetReference:0];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  __int16 v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ previewForCancellingItem: %@", (uint8_t *)&v14, 0x16u);
  }

  id v12 = [(PXPhotosDetailsAssetsWidget *)self _imageTileForDragItem:v10];

  if (v12)
  {
    [v12 view];
    [(id)objc_claimAutoreleasedReturnValue() frame];
    PXRectGetCenter();
  }

  return 0;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v32 = 138412802;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ previewForLiftingItem: %@ session: %@", (uint8_t *)&v32, 0x20u);
  }

  id v12 = [(PXPhotosDetailsAssetsWidget *)self _imageTileForDragItem:v9];
  if ([v12 conformsToProtocol:&unk_1F0420FF8])
  {
    id v13 = objc_alloc(MEMORY[0x1E4FB1838]);
    int v14 = [v12 view];
    [v14 frame];
    id v15 = objc_msgSend(v13, "initWithFrame:");

    __int16 v16 = [v12 image];
    [v15 setImage:v16];

    id v17 = [v12 view];
    objc_msgSend(v15, "setContentMode:", objc_msgSend(v17, "contentMode"));

    uint64_t v18 = [v12 view];
    objc_msgSend(v15, "setClipsToBounds:", objc_msgSend(v18, "clipsToBounds"));

    id v19 = [v12 view];
    __int16 v20 = [v19 layer];
    [v20 contentsRect];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = [v15 layer];
    objc_msgSend(v29, "setContentsRect:", v22, v24, v26, v28);

    v30 = [v15 layer];
    [v30 setZPosition:3.40282347e38];

    [v12 view];
    [(id)objc_claimAutoreleasedReturnValue() frame];
    PXRectGetCenter();
  }

  return 0;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  __int16 v11 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v36.double x = x;
    v36.double y = y;
    id v12 = NSStringFromCGPoint(v36);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v12;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ itemsForAddingToSession: %@ withTouchAtPoint: %@", buf, 0x20u);
  }
  id v13 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  int v14 = [v13 scrollViewController];
  id v15 = [v14 scrollView];
  __int16 v16 = [v13 scrollViewController];
  id v17 = [v16 contentCoordinateSpace];

  objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v15, x, y);
  memset(buf, 0, 32);
  -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:");
  if (*(void *)buf == *(void *)off_1E5DAAED8)
  {
    uint64_t v18 = 0;
  }
  else
  {
    id v30 = v9;
    id v19 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
    __int16 v20 = [v19 dataSource];

    v31[0] = *(_OWORD *)buf;
    v31[1] = *(_OWORD *)&buf[16];
    double v21 = [v20 assetReferenceAtItemIndexPath:v31];
    double v22 = [(PXPhotosDetailsAssetsWidget *)self _draggingAssetReferences];
    char v23 = [v22 containsObject:v21];

    if (v23)
    {
      uint64_t v18 = 0;
      id v9 = v30;
    }
    else
    {
      double v24 = [(PXPhotosDetailsAssetsWidget *)self _dragItemForAssetReference:v21];
      if (v24
        && ([MEMORY[0x1E4F1CAD0] setWithObject:v21],
            double v25 = objc_claimAutoreleasedReturnValue(),
            BOOL v26 = [(PXPhotosDetailsAssetsWidget *)self _addAssetReferencesToDrag:v25],
            v25,
            v26))
      {
        int v32 = v24;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
      }
      else
      {
        uint64_t v18 = 0;
      }
      id v9 = v30;
    }
  }
  double v27 = (void *)MEMORY[0x1E4F1CBF0];
  if (v18) {
    double v27 = v18;
  }
  id v28 = v27;

  return v28;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLDragAndDropGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_DEBUG, "dragInteraction: %@ itemsForBeginningSession: %@", buf, 0x16u);
  }

  if ([(PXPhotosDetailsAssetsWidget *)self _canDragOut])
  {
    id v9 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    id v10 = [v9 scrollViewController];
    __int16 v11 = [v10 scrollView];
    [v7 locationInView:v11];
    double v13 = v12;
    double v15 = v14;
    __int16 v16 = [v9 scrollViewController];
    id v17 = [v16 contentCoordinateSpace];

    objc_msgSend(v17, "convertPoint:fromCoordinateSpace:", v11, v13, v15);
    memset(buf, 0, sizeof(buf));
    -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:");
    if (*(void *)buf == *(void *)off_1E5DAAED8)
    {
      id v18 = (id)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      __int16 v20 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
      double v21 = [v20 dataSource];

      long long v47 = *(_OWORD *)buf;
      long long v48 = *(_OWORD *)&buf[16];
      v41 = v21;
      double v22 = [v21 assetReferenceAtItemIndexPath:&v47];
      char v23 = [(PXPhotosDetailsAssetsWidget *)self _draggingAssetReferences];
      char v24 = [v23 containsObject:v22];

      if (v24)
      {
        id v18 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        double v25 = [v9 selectionManager];
        BOOL v26 = [v25 selectionSnapshot];
        long long v47 = *(_OWORD *)buf;
        long long v48 = *(_OWORD *)&buf[16];
        v40 = v22;
        if ([v26 isIndexPathSelected:&v47])
        {
          id v37 = v25;
          uint64_t v38 = v26;
          double v27 = [v26 selectedIndexPaths];
          id v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v27, "count"));
          v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v27, "count"));
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __72__PXPhotosDetailsAssetsWidget_dragInteraction_itemsForBeginningSession___block_invoke;
          v42[3] = &unk_1E5DC88E0;
          id v43 = v41;
          v44 = self;
          id v30 = v29;
          id v45 = v30;
          id v31 = v28;
          id v46 = v31;
          [v27 enumerateItemIndexPathsUsingBlock:v42];
          if ([(PXPhotosDetailsAssetsWidget *)self _addAssetReferencesToDrag:v31]) {
            id v18 = v30;
          }
          else {
            id v18 = (id)MEMORY[0x1E4F1CBF0];
          }

          double v25 = v37;
          BOOL v26 = v38;
        }
        else
        {
          uint64_t v32 = [(PXPhotosDetailsAssetsWidget *)self _dragItemForAssetReference:v22];
          if (v32)
          {
            id v33 = v22;
            double v27 = (void *)v32;
            v39 = v26;
            uint64_t v34 = [MEMORY[0x1E4F1CAD0] setWithObject:v33];
            BOOL v35 = [(PXPhotosDetailsAssetsWidget *)self _addAssetReferencesToDrag:v34];

            if (v35)
            {
              v49 = v27;
              id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
            }
            else
            {
              id v18 = (id)MEMORY[0x1E4F1CBF0];
            }
            BOOL v26 = v39;
          }
          else
          {
            double v27 = 0;
            id v18 = (id)MEMORY[0x1E4F1CBF0];
          }
        }

        double v22 = v40;
      }
    }
    id v19 = v18;
  }
  else
  {
    id v19 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v19;
}

void __72__PXPhotosDetailsAssetsWidget_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 32);
  long long v4 = a2[1];
  v7[0] = *a2;
  v7[1] = v4;
  id v5 = [v3 assetReferenceAtItemIndexPath:v7];
  id v6 = [*(id *)(a1 + 40) _dragItemForAssetReference:v5];
  if (v6)
  {
    [*(id *)(a1 + 48) addObject:v6];
    [*(id *)(a1 + 56) addObject:v5];
  }
}

- (void)_presentConfidentialityWarning
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB1410];
  long long v4 = PXLocalizedStringFromTable(@"PXOK", @"PhotosUICore");
  id v5 = [v3 actionWithTitle:v4 style:0 handler:0];

  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = +[PXSharingConfidentialityController confidentialityAlertWithActions:v6];

  id v8 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
  [v8 widget:self transitionToViewController:v7 withTransitionType:2];
}

- (BOOL)_canDragAssetReferences:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[PXSharingConfidentialityController confidentialityCheckRequired])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "asset", (void)v12);
          if ([v9 conformsToProtocol:&unk_1F04B3848]
            && +[PXSharingConfidentialityController confidentialWarningRequiredForAsset:v9])
          {

            BOOL v10 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_14:
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_updateDraggingAssetReferencesWithDataSource:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v6 = [(PXPhotosDetailsAssetsWidget *)self _draggingAssetReferences];
  uint64_t v7 = objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(PXPhotosDetailsAssetsWidget *)self _draggingAssetReferences];
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
        long long v13 = [v4 assetReferenceForAssetReference:*(void *)(*((void *)&v14 + 1) + 8 * v12)];
        if (v13) {
          [v7 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(PXPhotosDetailsAssetsWidget *)self _setDraggingAssetReferences:v7];
}

- (BOOL)_addAssetReferencesToDrag:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PXPhotosDetailsAssetsWidget *)self _canDragAssetReferences:v4];
  if (v5)
  {
    uint64_t v6 = [(PXPhotosDetailsAssetsWidget *)self _draggingAssetReferences];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = [v6 setByAddingObjectsFromSet:v4];
    }
    else
    {
      id v8 = v4;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__PXPhotosDetailsAssetsWidget__addAssetReferencesToDrag___block_invoke;
    v11[3] = &unk_1E5DD32A8;
    v11[4] = self;
    id v12 = v8;
    id v9 = v8;
    [(PXPhotosDetailsAssetsWidget *)self _performTilingChangeWithoutAnimationTransition:v11];
  }
  else
  {
    [(PXPhotosDetailsAssetsWidget *)self _presentConfidentialityWarning];
  }

  return v5;
}

uint64_t __57__PXPhotosDetailsAssetsWidget__addAssetReferencesToDrag___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDraggingAssetReferences:*(void *)(a1 + 40)];
}

- (id)_dragItemForAssetReference:(id)a3
{
  id v3 = a3;
  id v4 = [v3 asset];
  BOOL v5 = PXDragAndDropItemProviderForDisplayAsset(v4);

  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v5];
    uint64_t v7 = [[PXDraggingItemLocalObject alloc] initWithAssetReference:v3];
    [v6 setLocalObject:v7];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_imageTileForDragItem:(id)a3
{
  id v4 = [a3 localObject];
  BOOL v5 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
  uint64_t v6 = [v5 dataSource];

  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v7 = [v4 assetReference];
  id v8 = [v6 assetReferenceForAssetReference:v7];
  id v9 = v8;
  if (v8)
  {
    [v8 indexPath];
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
  }

  if ((void)v42 == *(void *)off_1E5DAAED8)
  {
    id v10 = 0;
    goto LABEL_13;
  }
  uint64_t v11 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  id v12 = [v11 tilingController];

  long long v13 = [v12 currentLayout];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    id v10 = 0;
    goto LABEL_12;
  }
  long long v14 = v42;
  long long v15 = v43;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  memset(&v31, 0, sizeof(v31));
  long long v25 = xmmword_1AB359AB0;
  long long v26 = v42;
  long long v27 = v43;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v30 = 0;
  id v10 = 0;
  if ([v13 getGeometry:&v31 group:0 userData:0 forTileWithIdentifier:&v25])
  {
    [v13 visibleRect];
    v45.origin.double x = v16;
    v45.origin.double y = v17;
    v45.size.width = v18;
    v45.size.height = v19;
    if (CGRectIntersectsRect(v31, v45))
    {
      id v24 = 0;
      __int16 v20 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
      double v21 = [v20 tilingController];
      long long v25 = xmmword_1AB359AB0;
      long long v26 = v14;
      long long v27 = v15;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v30 = 0;
      int v22 = [v21 getTile:&v24 geometry:0 group:0 userData:0 forTileWithIdentifier:&v25];

      id v10 = 0;
      if (v22) {
        id v10 = v24;
      }
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  return v10;
}

- (BOOL)_canDragOut
{
  v2 = +[PXDragAndDropSettings sharedInstance];
  char v3 = [v2 dragOutEnabled];

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotosDetailsAssetsWidget *)self _pinchGesture];

  if (v8 == v7)
  {
    id v10 = [(PXPhotosDetailsAssetsWidget *)self _swipeSelectionManager];
    uint64_t v11 = [v10 gesturesForFailureRequirements];
    char v9 = [v11 containsObject:v6];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotosDetailsAssetsWidget *)self _touchGesture];

  if (v8 == v7)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v9 = [(PXPhotosDetailsAssetsWidget *)self _touchGesture];
    BOOL v10 = v9 == v6;
  }
  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(PXPhotosDetailsAssetsWidget *)self isUserInteractionEnabled])
  {
    BOOL v5 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    id v6 = [v5 scrollViewController];
    id v7 = [v6 contentCoordinateSpace];

    objc_msgSend(v4, "px_locationInCoordinateSpace:", v7);
    BOOL v8 = [(PXPhotosDetailsAssetsWidget *)self _isLocationWithinCurrentLayoutBounds:"_isLocationWithinCurrentLayoutBounds:"];
    id v9 = [(PXPhotosDetailsAssetsWidget *)self _pinchGesture];

    BOOL v10 = v9 == v4;
    BOOL v11 = v9 != v4 && v8;
    if (v10 && v8)
    {
      id v12 = [(PXPhotosDetailsAssetsWidget *)self _pinchGesture];
      [v12 velocity];
      BOOL v11 = v13 > 0.0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (CGSize)minimumItemSizeForPlaybackInController:(id)a3
{
  char v3 = [(PXPhotosDetailsAssetsWidget *)self _layoutEngine];
  id v4 = [v3 layoutGenerator];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 minHeroItemsSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = *(double *)off_1E5DAB030;
    double v8 = *((double *)off_1E5DAB030 + 1);
  }

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)shouldEnablePlaybackForController:(id)a3
{
  BOOL v4 = [(PXPhotosDetailsAssetsWidget *)self _curate];
  if (v4) {
    LOBYTE(v4) = ![(PXPhotosDetailsAssetsWidget *)self isSelecting];
  }
  return v4;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  double v10 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  BOOL v11 = [v10 scrollViewController];
  id v12 = [v11 contentCoordinateSpace];
  double v13 = [v9 scrollView];
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v13, x, y);

  long long v14 = [v9 scrollView];

  [v14 frame];
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  double v10 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  BOOL v11 = [v10 scrollViewController];
  id v12 = [v11 contentCoordinateSpace];
  double v13 = [v9 scrollView];
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v13, x, y);

  long long v14 = [v9 scrollView];

  [v14 frame];
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  double v10 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  BOOL v11 = [v10 scrollViewController];
  id v12 = [v11 contentCoordinateSpace];
  double v13 = [v9 scrollView];

  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v13, x, y);
  double v15 = v14;
  double v17 = v16;

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  double v18 = *(double *)off_1E5DAAF08;
  double v19 = *((double *)off_1E5DAAF08 + 1);
  double v20 = *((double *)off_1E5DAAF08 + 2);
  double v21 = *((double *)off_1E5DAAF08 + 3);
  return -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", v15, v17, v18, v19, v20, v21);
}

- (BOOL)swipeSelectionManager:(id)a3 shouldBeginSelectionAtLocation:(CGPoint)a4
{
  BOOL v4 = [(PXPhotosDetailsAssetsWidget *)self dragSession];

  return v4 == 0;
}

- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3
{
  char v3 = [(PXPhotosDetailsAssetsWidget *)self context];
  id v4 = [v3 viewModel];

  [v4 performChanges:&__block_literal_global_397];
}

uint64_t __93__PXPhotosDetailsAssetsWidget_swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelecting:1];
}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  id v3 = [(PXPhotosDetailsAssetsWidget *)self _inlinePlaybackController];
  [v3 visibleRectDidChange];
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
  [v4 invalidatePresentingGeometry];

  id v5 = [(PXPhotosDetailsAssetsWidget *)self _inlinePlaybackController];
  [v5 visibleRectDidChange];
}

- (void)scrollViewControllerWillBeginScrolling:(id)a3
{
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
  double v7 = [v6 dataSource];

  double v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = [v7 assetReferenceForAssetReference:*(void *)(*((void *)&v18 + 1) + 8 * v13)];
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__PXPhotosDetailsAssetsWidget_oneUpPresentation_setHiddenAssetReferences___block_invoke;
  v16[3] = &unk_1E5DD32A8;
  v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  [(PXPhotosDetailsAssetsWidget *)self _performTilingChangeWithoutAnimationTransition:v16];
}

uint64_t __74__PXPhotosDetailsAssetsWidget_oneUpPresentation_setHiddenAssetReferences___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHiddenAssetReferences:*(void *)(a1 + 40)];
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v5 = a4;
  double v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  double v7 = [v6 tilingController];

  double v8 = [v7 scrollController];
  [v8 updateIfNeeded];

  id v9 = [v7 currentLayout];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v7 currentLayout];
  }
  else
  {
    uint64_t v10 = 0;
  }

  memset(v21, 0, sizeof(v21));
  uint64_t v11 = [v10 dataSource];
  uint64_t v12 = v11;
  if (v11) {
    [v11 indexPathForAssetReference:v5];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }

  if (*(void *)&v21[0] != *(void *)off_1E5DAAED8)
  {
    memset(v20, 0, sizeof(v20));
    long long v13 = xmmword_1AB359AB0;
    uint64_t v14 = *(void *)&v21[0];
    long long v15 = *(_OWORD *)((char *)v21 + 8);
    uint64_t v16 = *((void *)&v21[1] + 1);
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v19 = 0;
    if ([v10 getGeometry:v20 group:0 userData:0 forTileWithIdentifier:&v13]) {
      PXEdgeInsetsMake();
    }
  }
}

void __79__PXPhotosDetailsAssetsWidget_oneUpPresentation_scrollAssetReferenceToVisible___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) widgetDelegate];
  [v2 widgetRequestFocus:*(void *)(a1 + 32)];

  id v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  [(PXTilingLayoutInvalidationContext *)v3 invalidateVisibleRect];
  [*(id *)(a1 + 40) invalidateLayoutWithContext:v3];
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  return [(PXPhotosDetailsAssetsWidget *)self _regionOfInterestForAssetReference:a4];
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v5 = a4;
  memset(v27, 0, sizeof(v27));
  double v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  double v7 = [v6 currentLayout];
  double v8 = [v7 dataSource];
  id v9 = v8;
  if (v8) {
    [v8 indexPathForAssetReference:v5];
  }
  else {
    memset(v27, 0, sizeof(v27));
  }

  uint64_t v10 = *(void *)&v27[0];
  if (*(void *)&v27[0] == *(void *)off_1E5DAAED8)
  {
    uint64_t v11 = 0;
  }
  else
  {
    long long v18 = *(_OWORD *)((char *)v27 + 8);
    uint64_t v12 = *((void *)&v27[1] + 1);
    id v26 = 0;
    long long v13 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    uint64_t v14 = [v13 tilingController];
    long long v19 = xmmword_1AB359AB0;
    uint64_t v20 = v10;
    long long v21 = v18;
    uint64_t v22 = v12;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v25 = 0;
    int v15 = [v14 getTile:&v26 geometry:0 group:0 userData:0 forTileWithIdentifier:&v19];

    uint64_t v11 = 0;
    if (v15)
    {
      id v16 = v26;
      if ([v16 conformsToProtocol:&unk_1F0420FF8])
      {
        uint64_t v11 = [v16 image];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
  }

  return v11;
}

- (id)oneUpPresentationActionManagerForPreviewing:(id)a3
{
  id v4 = [(PXPhotosDetailsAssetsWidget *)self _navigatedAssetReference];
  id v5 = [(PXPhotosDetailsAssetsWidget *)self _assetActionManagerForAssetsReference:v4];

  return v5;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  id v4 = [(PXPhotosDetailsAssetsWidget *)self context];
  uint64_t v5 = [v4 viewSourceOrigin];
  BOOL v6 = [(PXPhotosDetailsAssetsWidget *)self _curate];
  switch(v5)
  {
    case 2:
      BOOL v7 = !v6;
      uint64_t v8 = 14;
      goto LABEL_11;
    case 3:
      BOOL v7 = !v6;
      uint64_t v8 = 16;
      goto LABEL_11;
    case 4:
      BOOL v7 = !v6;
      uint64_t v8 = 18;
      goto LABEL_11;
    case 5:
      BOOL v7 = !v6;
      uint64_t v8 = 20;
      goto LABEL_11;
    case 6:
      BOOL v7 = !v6;
      uint64_t v8 = 24;
      goto LABEL_11;
    case 7:
      BOOL v7 = !v6;
      uint64_t v8 = 26;
      goto LABEL_11;
    case 8:
      BOOL v7 = !v6;
      uint64_t v8 = 28;
      goto LABEL_11;
    case 9:
      BOOL v7 = !v6;
      uint64_t v8 = 22;
LABEL_11:
      if (v7) {
        int64_t v9 = v8 + 1;
      }
      else {
        int64_t v9 = v8;
      }
      break;
    case 10:
      int64_t v9 = 31;
      break;
    default:
      int64_t v9 = 0;
      break;
  }

  return v9;
}

- (void)playButtonTileWasTapped:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(PXPhotosDetailsAssetsWidget *)self _tilingController];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 tileIdentifierForTile:v4];
  }
  else
  {
    uint64_t v19 = 0;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }

  BOOL v7 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
  uint64_t v8 = [v7 dataSource];
  uint64_t v9 = [v8 identifier];

  if ((unint64_t)(v14 - 3) <= 2 && (void)v15 != 0x7FFFFFFFFFFFFFFFLL && (void)v15 == v9)
  {
    uint64_t v10 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
    uint64_t v11 = [v10 dataSource];
    v13[0] = v15;
    v13[1] = v16;
    uint64_t v12 = [v11 assetReferenceAtItemIndexPath:v13];

    if (v12) {
      [(PXPhotosDetailsAssetsWidget *)self _handleTapOnAssetReference:v12 autoPlayVideo:1 activity:0];
    }
  }
}

- (void)_handleTapOnFocusedAssetReferenceWithActivity:(unint64_t)a3
{
  uint64_t v5 = [(PXPhotosDetailsAssetsWidget *)self _focusedAssetReference];
  if (v5)
  {
    BOOL v6 = v5;
    [(PXPhotosDetailsAssetsWidget *)self _handleTapOnAssetReference:v5 autoPlayVideo:0 activity:a3];
    uint64_t v5 = v6;
  }
}

- (void)_handleTapOnAssetReference:(id)a3 autoPlayVideo:(BOOL)a4 activity:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(PXPhotosDetailsAssetsWidget *)self isSelecting])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    if (v8) {
      [v8 indexPath];
    }
    uint64_t v9 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    uint64_t v10 = [v9 selectionManager];

    uint64_t v11 = [v10 selectionSnapshot];
    v24[0] = v25;
    v24[1] = v26;
    char v12 = [v11 isIndexPathSelected:v24];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __81__PXPhotosDetailsAssetsWidget__handleTapOnAssetReference_autoPlayVideo_activity___block_invoke;
    v20[3] = &__block_descriptor_65_e37_v16__0___PXMutableSelectionManager__8l;
    long long v21 = v25;
    long long v22 = v26;
    char v23 = v12;
    [v10 performChanges:v20];
  }
  else
  {
    long long v13 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
    if (([v13 isContextMenuInteractionActive] & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate);
      if (!WeakRetained
        || (long long v15 = WeakRetained,
            id v16 = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate),
            int v17 = [v16 photosDetailsAssetWidget:self shouldPresentOneUpForAssetReference:v8],
            v16,
            v15,
            v17))
      {
        [(PXPhotosDetailsAssetsWidget *)self _setNavigatedAssetReference:v8 autoPlayVideo:v6];
        long long v18 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __81__PXPhotosDetailsAssetsWidget__handleTapOnAssetReference_autoPlayVideo_activity___block_invoke_2;
        v19[3] = &__block_descriptor_40_e44_v16__0___PXOneUpPresentationConfiguration__8l;
        v19[4] = a5;
        [v18 startWithConfigurationHandler:v19];
      }
    }
  }
}

void __81__PXPhotosDetailsAssetsWidget__handleTapOnAssetReference_autoPlayVideo_activity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 dataSource];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = *(void *)(a1 + 32);

  if (v5 == v6)
  {
    BOOL v7 = *(unsigned char *)(a1 + 64) == 0;
    long long v8 = *(_OWORD *)(a1 + 48);
    v9[0] = *(_OWORD *)(a1 + 32);
    v9[1] = v8;
    [v3 setSelectedState:v7 forIndexPath:v9];
  }
}

uint64_t __81__PXPhotosDetailsAssetsWidget__handleTapOnAssetReference_autoPlayVideo_activity___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setActivity:*(void *)(a1 + 32)];
}

- (void)presentOneUpForAssetReference:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if ([(PXPhotosDetailsAssetsWidget *)self _curate]) {
    [(PXPhotosDetailsAssetsWidget *)self _toggleCuration];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v7 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
  long long v8 = [v7 dataSource];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 indexPathForAssetReference:v6];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }

  if ((void)v17 != *(void *)off_1E5DAAED8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate);
    if (!WeakRetained
      || (uint64_t v11 = WeakRetained,
          id v12 = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate),
          int v13 = [v12 photosDetailsAssetWidget:self shouldPresentOneUpForAssetReference:v6],
          v12,
          v11,
          v13))
    {
      [(PXPhotosDetailsAssetsWidget *)self _setNavigatedAssetReference:v6 autoPlayVideo:0];
      long long v14 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70__PXPhotosDetailsAssetsWidget_presentOneUpForAssetReference_animated___block_invoke;
      v15[3] = &__block_descriptor_33_e44_v16__0___PXOneUpPresentationConfiguration__8l;
      BOOL v16 = a4;
      [v14 startWithConfigurationHandler:v15];
    }
  }
}

uint64_t __70__PXPhotosDetailsAssetsWidget_presentOneUpForAssetReference_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAnimated:*(unsigned __int8 *)(a1 + 32)];
}

- (void)handleTouch:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 state];
  uint64_t v5 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
  id v6 = [v5 widgetScrollViewControllerHostingWidget:self];

  BOOL v7 = [v6 scrollView];
  long long v8 = v7;
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 1
      && ([v7 isDragging] & 1) == 0
      && ![(PXPhotosDetailsAssetsWidget *)self _canDragOut])
    {
      uint64_t v9 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
      uint64_t v10 = [v9 scrollViewController];
      uint64_t v11 = [v10 contentCoordinateSpace];

      objc_msgSend(v13, "px_locationInCoordinateSpace:", v11);
      id v12 = -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:");
      [(PXPhotosDetailsAssetsWidget *)self _setHighlightedAssetReference:v12];
    }
  }
  else
  {
    [(PXPhotosDetailsAssetsWidget *)self _setHighlightedAssetReference:0];
  }
}

- (void)handlePinch:(id)a3
{
  id v19 = a3;
  uint64_t v4 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
  char v5 = [v4 handlePresentingPinchGestureRecognizer:v19];

  if ((v5 & 1) == 0
    && ![(PXPhotosDetailsAssetsWidget *)self isSelecting]
    && ([v19 state] == 1 || objc_msgSend(v19, "state") == 2))
  {
    id v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    BOOL v7 = [v6 scrollViewController];
    long long v8 = [v7 contentCoordinateSpace];
    objc_msgSend(v19, "px_locationInCoordinateSpace:", v8);
    double v10 = v9;
    double v12 = v11;

    id v13 = -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v10, v12, *(double *)off_1E5DAAF08, *((double *)off_1E5DAAF08 + 1), *((double *)off_1E5DAAF08 + 2), *((double *)off_1E5DAAF08 + 3));
    if (v13)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate);
      if (!WeakRetained
        || (long long v15 = WeakRetained,
            id v16 = objc_loadWeakRetained((id *)&self->_widgetOneUpDelegate),
            int v17 = [v16 photosDetailsAssetWidget:self shouldPresentOneUpForAssetReference:v13],
            v16,
            v15,
            v17))
      {
        [(PXPhotosDetailsAssetsWidget *)self _setNavigatedAssetReference:v13 autoPlayVideo:0];
        long long v18 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
        [v18 startWithConfigurationHandler:&__block_literal_global_384];
      }
    }
  }
}

uint64_t __43__PXPhotosDetailsAssetsWidget_handlePinch___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInteractiveMode:1];
}

- (void)handlePress:(id)a3
{
}

- (void)handleTap:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(PXPhotosDetailsAssetsWidget *)self dragSession];

  if ([v13 state] == 3 && !v4)
  {
    char v5 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    id v6 = [v5 scrollViewController];
    BOOL v7 = [v6 contentCoordinateSpace];
    objc_msgSend(v13, "px_locationInCoordinateSpace:", v7);
    double v9 = v8;
    double v11 = v10;

    double v12 = -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", v9, v11, *(double *)off_1E5DAAF08, *((double *)off_1E5DAAF08 + 1), *((double *)off_1E5DAAF08 + 2), *((double *)off_1E5DAAF08 + 3));
    if (v12) {
      [(PXPhotosDetailsAssetsWidget *)self _handleTapOnAssetReference:v12 autoPlayVideo:0 activity:0];
    }
  }
}

- (id)tilingController:(id)a3 transitionAnimationCoordinatorForChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXPhotosDetailsAssetsWidget *)self _transitionWithoutAnimation])
  {
    double v8 = 0;
  }
  else
  {
    double v9 = [v7 fromLayout];
    double v10 = [v9 dataSource];

    double v11 = [v7 toLayout];
    double v12 = [v11 dataSource];

    id v13 = [v10 photosDataSource];
    int v14 = [v13 wantsCurationForFirstAssetCollection];

    long long v15 = [v12 photosDataSource];
    int v16 = [v15 wantsCurationForFirstAssetCollection];

    if (v10 == v12) {
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    if (v14 == v16) {
      goto LABEL_8;
    }
    int v17 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
    long long v18 = [v17 changeHistory];
    double v8 = +[PXAssetsTileTransitionCoordinator transitionCoordinatorForChange:v7 changeHistory:v18];

    [v8 setTreatRemovalsAsDeletes:0];
    if (!v8)
    {
LABEL_8:
      id v19 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
      double v8 = [v19 tilingController:v6 transitionAnimationCoordinatorForChange:v7];
    }
  }

  return v8;
}

- (id)tilingController:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  double v9 = [v8 tilingController:v7 tileIdentifierConverterForChange:v6];

  return v9;
}

- (CGPoint)tilingController:(id)a3 targetVisibleOriginForLayout:(id)a4 proposedVisibleOrigin:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a4;
  id v10 = a3;
  double v11 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  objc_msgSend(v11, "tilingController:targetVisibleOriginForLayout:proposedVisibleOrigin:", v10, v9, x, y);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)tilingController:(id)a3 initialVisibleOriginForLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PXPhotosDetailsAssetsWidget *)self _currentDataSourceStressTest];
  int v10 = [v9 isRunning];

  if (!v10)
  {
    SEL v32 = a2;
    double v15 = [v7 currentLayout];
    id v16 = v8;
    double v17 = [v15 dataSource];
    long long v18 = [v16 dataSource];
    id v19 = [v17 photosDataSource];
    int v20 = [v19 wantsCurationForFirstAssetCollection];

    long long v21 = [v18 photosDataSource];
    int v22 = [v21 wantsCurationForFirstAssetCollection];

    char v23 = [v17 photosDataSource];
    id v34 = [v23 sortDescriptors];

    long long v24 = [v18 photosDataSource];
    long long v33 = [v24 sortDescriptors];

    if (v17 != v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v20 != v22) {
            goto LABEL_9;
          }
          id v25 = v33;
          if (v34 == v25)
          {
          }
          else
          {
            char v26 = [v34 isEqual:v25];

            if ((v26 & 1) == 0)
            {
LABEL_9:
              long long v27 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
              uint64_t v28 = [v27 widgetDefaultContentViewAnchoringTypeForDisclosureHeightChange:self];

              if (v28)
              {
                [v15 contentBounds];
                CGRectGetMinX(v36);
                [v15 contentBounds];
                PXRectEdgeValue();
              }
              CGRect v31 = [MEMORY[0x1E4F28B00] currentHandler];
              [v31 handleFailureInMethod:v32 object:self file:@"PXPhotosDetailsAssetsWidget.m" lineNumber:1503 description:@"Code which should be unreachable has been reached"];

              abort();
            }
          }
        }
      }
    }
    [(PXPhotosDetailsAssetsWidget *)self _visibleOriginScrollTarget];
    PXPointIsNull();
  }
  [v8 contentBounds];
  double v12 = v11;
  double v14 = v13 + -100.0;

  double v29 = v12;
  double v30 = v14;
  result.double y = v30;
  result.double x = v29;
  return result;
}

- (void)checkInTile:(void *)a3 withIdentifier:(PXTileIdentifier *)a4
{
  id v7 = [(PXPhotosDetailsAssetsWidget *)self _inlinePlaybackController];
  long long v8 = *(_OWORD *)&a4->index[5];
  long long v18 = *(_OWORD *)&a4->index[3];
  long long v19 = v8;
  long long v20 = *(_OWORD *)&a4->index[7];
  unint64_t v21 = a4->index[9];
  long long v9 = *(_OWORD *)&a4->index[1];
  long long v16 = *(_OWORD *)&a4->length;
  long long v17 = v9;
  [v7 checkInTile:a3 withIdentifier:&v16];

  int v10 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  long long v11 = *(_OWORD *)&a4->index[5];
  long long v18 = *(_OWORD *)&a4->index[3];
  long long v19 = v11;
  long long v20 = *(_OWORD *)&a4->index[7];
  unint64_t v21 = a4->index[9];
  long long v12 = *(_OWORD *)&a4->index[1];
  long long v16 = *(_OWORD *)&a4->length;
  long long v17 = v12;
  if ([v10 providesTileForIdentifier:&v16])
  {
    long long v13 = *(_OWORD *)&a4->index[5];
    long long v18 = *(_OWORD *)&a4->index[3];
    long long v19 = v13;
    long long v20 = *(_OWORD *)&a4->index[7];
    unint64_t v21 = a4->index[9];
    long long v14 = *(_OWORD *)&a4->index[1];
    long long v16 = *(_OWORD *)&a4->length;
    long long v17 = v14;
    [v10 checkInTile:a3 withIdentifier:&v16];
  }
  else
  {
    double v15 = [v10 viewTileReusePool];
    [v15 checkInReusableObject:a3];

    [(NSMutableSet *)self->_tilesInUse removeObject:a3];
  }
}

- (void)checkOutTileForIdentifier:(PXTileIdentifier *)a3 layout:(id)a4
{
  id v7 = a4;
  long long v8 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  long long v9 = *(_OWORD *)&a3->index[5];
  long long v27 = *(_OWORD *)&a3->index[3];
  long long v28 = v9;
  long long v29 = *(_OWORD *)&a3->index[7];
  unint64_t v30 = a3->index[9];
  long long v10 = *(_OWORD *)&a3->index[1];
  long long v25 = *(_OWORD *)&a3->length;
  long long v26 = v10;
  if (![v8 providesTileForIdentifier:&v25])
  {
    if (a3->length == 1)
    {
      unint64_t v14 = a3->index[0];
      if (v14 == 32100)
      {
        uint64_t v15 = 1500;
      }
      else
      {
        if (v14 != 32101) {
          goto LABEL_15;
        }
        uint64_t v15 = 1501;
      }
      long long v16 = [v8 viewTileReusePool];
      long long v13 = [v16 checkOutReusableObjectWithReuseIdentifier:v15];

      [(NSMutableSet *)self->_tilesInUse addObject:v13];
      if (v13) {
        goto LABEL_16;
      }
    }
LABEL_15:
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v18 = *(_OWORD *)&a3->index[5];
    long long v27 = *(_OWORD *)&a3->index[3];
    long long v28 = v18;
    long long v29 = *(_OWORD *)&a3->index[7];
    unint64_t v30 = a3->index[9];
    long long v19 = *(_OWORD *)&a3->index[1];
    long long v25 = *(_OWORD *)&a3->length;
    long long v26 = v19;
    long long v20 = PXTileIdentifierDescription((unint64_t *)&v25);
    [v17 handleFailureInMethod:a2, self, @"PXPhotosDetailsAssetsWidget.m", 1458, @"%@ couldn't check out tile for identifier:%@, layout:%@", self, v20, v7 object file lineNumber description];

    long long v13 = 0;
    goto LABEL_16;
  }
  long long v11 = *(_OWORD *)&a3->index[5];
  long long v27 = *(_OWORD *)&a3->index[3];
  long long v28 = v11;
  long long v29 = *(_OWORD *)&a3->index[7];
  unint64_t v30 = a3->index[9];
  long long v12 = *(_OWORD *)&a3->index[1];
  long long v25 = *(_OWORD *)&a3->length;
  long long v26 = v12;
  long long v13 = (void *)[v8 checkOutTileForIdentifier:&v25 layout:v7];
  if (a3->length - 3 <= 2 && a3->index[1] != 0x7FFFFFFFFFFFFFFFLL && a3->index[0] == 6332437)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v13 setDelegate:self];
    }
  }
  if (!v13) {
    goto LABEL_15;
  }
LABEL_16:
  unint64_t v21 = [(PXPhotosDetailsAssetsWidget *)self _inlinePlaybackController];
  long long v22 = *(_OWORD *)&a3->index[5];
  long long v27 = *(_OWORD *)&a3->index[3];
  long long v28 = v22;
  long long v29 = *(_OWORD *)&a3->index[7];
  unint64_t v30 = a3->index[9];
  long long v23 = *(_OWORD *)&a3->index[1];
  long long v25 = *(_OWORD *)&a3->length;
  long long v26 = v23;
  [v21 checkOutTile:v13 withIdentifier:&v25];

  return v13;
}

- (id)assetsScene:(id)a3 tileIdentifierConverterForChange:(id)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 tilingController];
  long long v8 = [v6 tilingController:v7 tileIdentifierConverterForChange:v5];

  long long v9 = objc_alloc_init(_PXAssetsWidgetTileIdentifierConverter);
  long long v10 = [PXComposedTileIdentifierConverter alloc];
  v14[0] = v8;
  v14[1] = v9;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  long long v12 = [(PXComposedTileIdentifierConverter *)v10 initWithTileIdentifierConverters:v11];

  return v12;
}

- (id)assetsScene:(id)a3 layoutForDataSource:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(PXPhotosDetailsAssetsWidget *)self _updateLayoutEngineIfNeeded];
  id v7 = (void *)MEMORY[0x1E4F1CA80];
  long long v8 = [(PXPhotosDetailsAssetsWidget *)self _hiddenAssetReferences];
  long long v9 = objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v10 = [(PXPhotosDetailsAssetsWidget *)self _hiddenAssetReferences];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [v6 assetReferenceForAssetReference:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        if (v15) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v12);
  }

  [(PXPhotosDetailsAssetsWidget *)self _setHiddenAssetReferences:v9];
  long long v16 = [(PXPhotosDetailsAssetsWidget *)self _layoutEngine];
  long long v17 = [v16 dataSourceSnapshot];
  uint64_t v18 = [v17 identifier];

  long long v19 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
  long long v20 = [v19 changeHistory];
  unint64_t v21 = objc_msgSend(v20, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", v18, objc_msgSend(v6, "identifier"));

  if ([v21 count] == 1)
  {
    long long v22 = [v21 firstObject];
  }
  else
  {
    long long v22 = 0;
  }
  long long v23 = [(PXPhotosDetailsAssetsWidget *)self _layoutEngine];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  long long v35 = __63__PXPhotosDetailsAssetsWidget_assetsScene_layoutForDataSource___block_invoke;
  CGRect v36 = &unk_1E5DC9FE8;
  id v24 = v6;
  id v37 = v24;
  id v25 = v22;
  id v38 = v25;
  id v26 = (id)[v23 performChangesAndWait:&v33];

  long long v27 = [(PXPhotosDetailsAssetsWidget *)self _createNewLayout];
  long long v28 = [v27 dataSource];
  char v29 = [v28 isEqual:v24];

  if ((v29 & 1) == 0)
  {
    CGRect v31 = [MEMORY[0x1E4F28B00] currentHandler];
    SEL v32 = [v27 dataSource];
    [v31 handleFailureInMethod:a2, self, @"PXPhotosDetailsAssetsWidget.m", 1413, @"Should be getting a layout with the updated correct data source from the layout engine %@ != %@", v24, v32, v33, v34, v35, v36, v37 object file lineNumber description];
  }
  return v27;
}

uint64_t __63__PXPhotosDetailsAssetsWidget_assetsScene_layoutForDataSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDataSourceSnapshot:*(void *)(a1 + 32) withChangeDetails:*(void *)(a1 + 40)];
}

- (void)assetsScene:(id)a3 didTransitionToDataSource:(id)a4
{
  id v5 = a4;
  [(PXPhotosDetailsAssetsWidget *)self _updateHasLoadedContentData];
  [(PXPhotosDetailsAssetsWidget *)self _updateShowCurationButton];
  [(PXPhotosDetailsAssetsWidget *)self _updateFocusedAssetReference];
  [(PXPhotosDetailsAssetsWidget *)self _updateDraggingAssetReferencesWithDataSource:v5];

  [(PXPhotosDetailsAssetsWidget *)self _logAssetCountsIfNecessary];
  id v6 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
  [v6 widget:self animateChanges:0 withAnimationOptions:0];

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __69__PXPhotosDetailsAssetsWidget_assetsScene_didTransitionToDataSource___block_invoke;
  v7[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E4F14428], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __69__PXPhotosDetailsAssetsWidget_assetsScene_didTransitionToDataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fallBackByTogglingCurationIfNeeded];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSpecManagerObservationContext_174500 != a5)
  {
    if ((void *)PXStressTestObservationContext != a5)
    {
      if ((void *)PXPhotosDetailsContextObservationContext_174501 != a5)
      {
        long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsAssetsWidget.m" lineNumber:1362 description:@"unknown observation context"];
LABEL_22:

        goto LABEL_23;
      }
      if ((v6 & 0x30) != 0)
      {
        uint64_t v11 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
        [v11 widgetLocalizedTitleDidChange:self];
      }
      if ((v6 & 8) != 0)
      {
        uint64_t v12 = PLPeopleGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v19 = 0;
          _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "PXPhotosDetailsAssetsWidget: People changed, will refresh Data Source", v19, 2u);
        }

        long long v10 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
        uint64_t v13 = objc_opt_class();
        unint64_t v14 = [(PXPhotosDetailsAssetsWidget *)self context];
        uint64_t v15 = [v14 people];
        [v13 _refreshSortDescriptorsInPhotosDataSource:v10 withPeople:v15];

        long long v16 = [v10 firstAssetCollection];
        if (v16) {
          objc_msgSend(v10, "setWantsCuration:forAssetCollection:", -[PXPhotosDetailsAssetsWidget _curate](self, "_curate"), v16);
        }

        goto LABEL_22;
      }
      goto LABEL_23;
    }
    if (v6)
    {
      long long v17 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
      [v17 widgetLocalizedSubtitleDidChange:self];

      if ((v6 & 2) == 0)
      {
LABEL_9:
        if ((v6 & 4) == 0) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_9;
    }
    uint64_t v18 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__PXPhotosDetailsAssetsWidget_observable_didChange_context___block_invoke;
    v20[3] = &unk_1E5DD36F8;
    void v20[4] = self;
    [v18 performChanges:v20];

    if ((v6 & 4) == 0) {
      goto LABEL_23;
    }
LABEL_21:
    long long v10 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v10 widgetLocalizedTitleDidChange:self];
    goto LABEL_22;
  }
  if (v6)
  {
    [(PXPhotosDetailsAssetsWidget *)self _invalidateLayoutGenerator];
    [(PXPhotosDetailsAssetsWidget *)self _updateLayoutEngineIfNeeded];
    [(PXPhotosDetailsAssetsWidget *)self _updateTilingLayoutIfNeeded];
    long long v10 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v10 widgetInvalidateContentLayoutStyle:self];
    goto LABEL_22;
  }
LABEL_23:
}

void __60__PXPhotosDetailsAssetsWidget_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _dataSourceManager];
  v2 = [*(id *)(a1 + 32) _currentDataSourceStressTest];
  id v3 = [v2 dataSource];
  [v4 setPhotosDataSource:v3];
}

- (CGRect)engineDrivenLayout:(id)a3 contentsRectForItemAtIndexPath:(PXSimpleIndexPath *)a4 forAspectRatio:(double)a5
{
  id v8 = [a3 dataSource];
  if ([(PXPhotosDetailsAssetsWidget *)self isFaceModeEnabled])
  {
    long long v9 = *(_OWORD *)&a4->item;
    long long v37 = *(_OWORD *)&a4->dataSourceIdentifier;
    long long v38 = v9;
    long long v10 = [v8 primaryFaceForAssetAtItemIndexPath:&v37];
    if (v10)
    {
      uint64_t v11 = v10;
      [v10 normalizedCropRect];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
    }
    else
    {
      long long v26 = *(_OWORD *)&a4->item;
      long long v37 = *(_OWORD *)&a4->dataSourceIdentifier;
      long long v38 = v26;
      long long v27 = [v8 assetAtItemIndexPath:&v37];
      [v27 bestCropRectForAspectRatio:0 verticalContentMode:1 cropMode:a5];
      double v13 = v28;
      double v15 = v29;
      double v17 = v30;
      double v19 = v31;

      uint64_t v11 = 0;
    }
    goto LABEL_8;
  }
  if ((unint64_t)[v8 numberOfItemsInSection:a4->section] >> 3 <= 0x270)
  {
    long long v20 = *(_OWORD *)&a4->item;
    long long v37 = *(_OWORD *)&a4->dataSourceIdentifier;
    long long v38 = v20;
    uint64_t v11 = [v8 assetAtItemIndexPath:&v37];
    v36[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v36[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    unint64_t v21 = [v8 assetCollectionAtSectionIndexPath:v36];
    objc_msgSend(v11, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, objc_msgSend(v21, "px_shouldUseFacesRectForSmartCropping"), a5);
    double v13 = v22;
    double v15 = v23;
    double v17 = v24;
    double v19 = v25;

LABEL_8:
    goto LABEL_9;
  }
  double v13 = *(double *)off_1E5DAB010;
  double v15 = *((double *)off_1E5DAB010 + 1);
  double v17 = *((double *)off_1E5DAB010 + 2);
  double v19 = *((double *)off_1E5DAB010 + 3);
LABEL_9:

  double v32 = v13;
  double v33 = v15;
  double v34 = v17;
  double v35 = v19;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (double)engineDrivenLayout:(id)a3 zPositionForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v5 = a3;
  char v6 = [v5 dataSource];
  id v7 = [v6 photosDataSource];

  long long v8 = *(_OWORD *)&a4->item;
  v27[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v27[1] = v8;
  int v9 = [v7 isAssetAtIndexPathPartOfCuratedSet:v27];
  int64_t item = a4->item;
  if (v5)
  {
    [v5 focusedIndexPath];
    int64_t v11 = a4->item;
    uint64_t v13 = v24;
    uint64_t v12 = v23;
    uint64_t v14 = v26;
    uint64_t v15 = v25;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v13 = 0;
    uint64_t v12 = 0;
    int64_t v11 = a4->item;
  }
  double v16 = 1000000.0;
  if (!v9) {
    double v16 = 0.0;
  }
  double v17 = v16 + (double)(100 * item);
  BOOL v20 = a4->dataSourceIdentifier == v12 && a4->section == v13 && v11 == v15;
  if (v20 && a4->subitem == v14) {
    double v21 = v17 + 2000000.0;
  }
  else {
    double v21 = v17;
  }

  return v21;
}

- (double)engineDrivenLayout:(id)a3 aspectRatioForItemAtIndexPath:(PXSimpleIndexPath *)a4
{
  id v6 = a3;
  double v7 = 1.0;
  if (![(PXPhotosDetailsAssetsWidget *)self isFaceModeEnabled])
  {
    long long v8 = [v6 dataSource];
    int v9 = [v8 photosDataSource];
    long long v10 = *(_OWORD *)&a4->item;
    v14[0] = *(_OWORD *)&a4->dataSourceIdentifier;
    v14[1] = v10;
    int64_t v11 = [v9 assetAtSimpleIndexPath:v14];

    [v11 aspectRatio];
    double v7 = v12;
  }
  return v7;
}

- (void)commitPreviewViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
  [v5 commitPreviewViewController:v4];
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
  [v7 didDismissPreviewViewController:v6 committing:v4];
}

- (id)genericPreviewViewController
{
  id v3 = [(PXPhotosDetailsAssetsWidget *)self context];
  BOOL v4 = [v3 viewModel];

  id v5 = [v4 selectionManager];
  id v6 = [v5 selectionSnapshot];

  if ([v6 isAnyItemSelected])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    if (v6) {
      [v6 firstSelectedIndexPath];
    }
    id v7 = [v6 dataSource];
    v12[0] = v13;
    v12[1] = v14;
    long long v8 = [v7 objectReferenceAtIndexPath:v12];

    [(PXPhotosDetailsAssetsWidget *)self _setNavigatedAssetReference:v8 autoPlayVideo:0];
    int v9 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
    long long v10 = [v9 previewViewControllerAllowingActions:1];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4
{
  id v5 = -[PXPhotosDetailsAssetsWidget _assetReferenceAtPoint:padding:](self, "_assetReferenceAtPoint:padding:", a4, a3.x, a3.y, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  if (v5)
  {
    [(PXPhotosDetailsAssetsWidget *)self _setNavigatedAssetReference:v5 autoPlayVideo:0];
    id v6 = [(PXPhotosDetailsAssetsWidget *)self oneUpPresentation];
    id v7 = [v6 previewViewControllerAllowingActions:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)imageViewBasicTileForPreviewingAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  id v7 = [v6 scrollViewController];

  long long v8 = [v7 scrollView];
  int v9 = [v7 contentCoordinateSpace];
  objc_msgSend(v9, "convertPoint:fromCoordinateSpace:", v8, x, y);
  long long v45 = 0u;
  long long v46 = 0u;
  -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:");
  if (*(void *)off_1E5DAAED8)
  {
    uint64_t v26 = v8;
    int64_t v11 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    double v12 = [v11 tilingController];

    long long v13 = [v12 currentLayout];
    long long v14 = v45;
    long long v15 = v46;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    memset(&v34, 0, sizeof(v34));
    long long v28 = xmmword_1AB359AB0;
    long long v29 = v45;
    long long v30 = v46;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v33 = 0;
    int v16 = [v13 getGeometry:&v34 group:0 userData:0 forTileWithIdentifier:&v28];
    double v17 = v13;
    id v10 = 0;
    if (v16)
    {
      [v13 visibleRect];
      v48.origin.double x = v18;
      v48.origin.double y = v19;
      v48.size.width = v20;
      v48.size.height = v21;
      if (CGRectIntersectsRect(v34, v48))
      {
        id v27 = 0;
        double v22 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
        uint64_t v23 = [v22 tilingController];
        long long v28 = xmmword_1AB359AB0;
        long long v29 = v14;
        long long v30 = v15;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v33 = 0;
        int v24 = [v23 getTile:&v27 geometry:0 group:0 userData:0 forTileWithIdentifier:&v28];

        id v10 = 0;
        if (v24) {
          id v10 = v27;
        }
      }
      else
      {
        id v10 = 0;
      }
      double v17 = v13;
    }

    long long v8 = v26;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)cursorInteractionEnabled
{
  return ![(PXPhotosDetailsAssetsWidget *)self _curate];
}

- (id)bestCursorTileForLiftingAtPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  long long v8 = [v7 tilingController];

  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  if (v8
    && (objc_msgSend(v8, "hitTestTileAtPoint:padding:passingTest:", &__block_literal_global_364_174506, x, y, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3)), (void)v20))
  {
    int v9 = [v8 currentLayout];
    memset(v19, 0, sizeof(v19));
    long long v15 = v22;
    long long v16 = v23;
    long long v17 = v24;
    uint64_t v18 = v25;
    long long v13 = v20;
    long long v14 = v21;
    id v10 = 0;
    if ([v9 getGeometry:v19 group:0 userData:0 forTileWithIdentifier:&v13])
    {
      id v12 = 0;
      long long v15 = v22;
      long long v16 = v23;
      long long v17 = v24;
      uint64_t v18 = v25;
      long long v13 = v20;
      long long v14 = v21;
      id v10 = 0;
      if ([v8 getTile:&v12 geometry:0 group:0 userData:0 forTileWithIdentifier:&v13])id v10 = v12; {
    }
      }
  }
  else
  {
    -[PXPhotosDetailsAssetsWidget imageViewBasicTileForPreviewingAtPoint:](self, "imageViewBasicTileForPreviewingAtPoint:", x, y);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

BOOL __81__PXPhotosDetailsAssetsWidget_bestCursorTileForLiftingAtPoint_inCoordinateSpace___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)(*(void *)(a2 + 8) - 6332438) < 4;
}

- (void)spaceBarWasPressed
{
}

- (PXAssetActionManager)assetActionManager
{
  id v3 = [(PXPhotosDetailsAssetsWidget *)self _focusedAssetReference];
  BOOL v4 = [(PXPhotosDetailsAssetsWidget *)self _assetActionManagerForAssetsReference:v3];

  return (PXAssetActionManager *)v4;
}

- (void)contentViewDidDisappear
{
  id v3 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  [v3 setAnimatesContent:0];

  BOOL v4 = [(PXPhotosDetailsAssetsWidget *)self _inlinePlaybackController];
  [v4 setIsContentViewVisible:0];

  id v5 = [(PXPhotosDetailsAssetsWidget *)self eventTracker];
  [v5 logContentViewDidDisappear];
}

- (void)contentViewWillAppear
{
  id v3 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  [v3 setAnimatesContent:1];

  BOOL v4 = [(PXPhotosDetailsAssetsWidget *)self _inlinePlaybackController];
  [v4 setIsContentViewVisible:1];

  id v5 = [(PXPhotosDetailsAssetsWidget *)self eventTracker];
  [v5 logContentViewWillAppear];
}

- (void)_setHasLoadedContentData:(BOOL)a3
{
  if (self->_hasLoadedContentData != a3)
  {
    self->_hasLoadedContentData = a3;
    id v4 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v4 widgetHasLoadedContentDataDidChange:self];
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    id v5 = [(PXPhotosDetailsAssetsWidget *)self _createNewLayout];
    id v4 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    [v4 transitionToLayout:v5];
  }
}

- (BOOL)supportsFaceMode
{
  v2 = [(PXPhotosDetailsAssetsWidget *)self context];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 people];
    BOOL v4 = [v3 count] == 1;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setSelecting:(BOOL)a3
{
  if (self->_selecting != a3)
  {
    self->_selecting = a3;
    if (!a3)
    {
      BOOL v4 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
      id v5 = [v4 selectionManager];
      [v5 performChanges:&__block_literal_global_362_174510];
    }
    id v6 = [(PXPhotosDetailsAssetsWidget *)self _inlinePlaybackController];
    [v6 updatePlaybackEnabled];

    [(PXPhotosDetailsAssetsWidget *)self _updateShowCurationButton];
    id v7 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v7 widgetLocalizedSubtitleDidChange:self];

    id v8 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v8 widgetLocalizedDisclosureTitleDidChange:self];
  }
}

uint64_t __44__PXPhotosDetailsAssetsWidget_setSelecting___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (BOOL)supportsSelection
{
  return 1;
}

- (void)userDidSelectSubtitle
{
  id v3 = +[PXPhotosDetailsSettings sharedInstance];
  int v4 = [v3 allowEditorialLayoutStressTest];

  if (v4)
  {
    id v5 = [(PXPhotosDetailsAssetsWidget *)self _currentDataSourceStressTest];
    if (!v5)
    {
      id v6 = objc_alloc_init(PXPhotosDataSourceStressTest);
      [(PXPhotosDataSourceStressTest *)v6 setMaximumAssetCount:6];
      [(PXPhotosDetailsAssetsWidget *)self _setCurrentDataSourceStressTest:v6];
      id v5 = v6;
    }
    id v7 = v5;
    objc_msgSend(v5, "setRunning:", objc_msgSend(v5, "isRunning") ^ 1);
  }
  else
  {
    [(PXPhotosDetailsAssetsWidget *)self _userDidSelectCurationButton];
  }
}

- (void)_toggleCuration
{
  char v3 = ![(PXPhotosDetailsAssetsWidget *)self _curate];
  int v4 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PXPhotosDetailsAssetsWidget__toggleCuration__block_invoke;
  v5[3] = &unk_1E5DCFE98;
  v5[4] = self;
  char v6 = v3;
  [v4 performChanges:v5];
}

uint64_t __46__PXPhotosDetailsAssetsWidget__toggleCuration__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _curate];
  if (*(unsigned __int8 *)(a1 + 40) != result)
  {
    [*(id *)(a1 + 32) _logAssetCountsIfNecessary];
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
    return [v3 _setCurate:v4];
  }
  return result;
}

- (void)_userDidSelectCurationButton
{
  [(PXPhotosDetailsAssetsWidget *)self _toggleCuration];
  if ([(PXPhotosDetailsAssetsWidget *)self _curate]) {
    char v3 = @"com.apple.photos.CPAnalytics.photosDetailsSummaryButtonSelected";
  }
  else {
    char v3 = @"com.apple.photos.CPAnalytics.photosDetailsShowMoreButtonSelected";
  }
  uint64_t v4 = MEMORY[0x1E4F1CC08];
  id v5 = (void *)MEMORY[0x1E4F56658];
  [v5 sendEvent:v3 withPayload:v4];
}

- (NSString)localizedSubtitle
{
  if ([(PXPhotosDetailsAssetsWidget *)self _showCurationButton])
  {
    char v3 = [(PXPhotosDetailsAssetsWidget *)self _curationButtonTitle];
    goto LABEL_9;
  }
  uint64_t v4 = [(PXPhotosDetailsAssetsWidget *)self _specManager];
  id v5 = [v4 spec];

  char v6 = [(PXPhotosDetailsAssetsWidget *)self context];
  if ([v6 shouldShowMovieHeader])
  {

LABEL_7:
    char v3 = 0;
    goto LABEL_8;
  }
  int v7 = [v5 shouldShowTitle];

  if (!v7) {
    goto LABEL_7;
  }
  char v3 = [(PXPhotosDetailsAssetsWidget *)self _subtitle];
LABEL_8:

LABEL_9:
  id v8 = +[PXPhotosDetailsSettings sharedInstance];
  int v9 = [v8 allowEditorialLayoutStressTest];

  if (v9)
  {
    id v10 = [(PXPhotosDetailsAssetsWidget *)self _currentDataSourceStressTest];
    int v11 = [v10 isRunning];
    id v12 = @"Start Test";
    if (v11) {
      id v12 = @"Pause Test";
    }
    long long v13 = v12;

    char v3 = v13;
  }
  return (NSString *)v3;
}

- (NSString)localizedDisclosureTitle
{
  return 0;
}

- (NSString)localizedTitle
{
  char v3 = [(PXPhotosDetailsAssetsWidget *)self _specManager];
  uint64_t v4 = [v3 spec];

  if (![v4 shouldShowTitle]) {
    goto LABEL_17;
  }
  id v5 = [(PXPhotosDetailsAssetsWidget *)self context];
  int v6 = [v5 shouldShowHeaderTitle];

  if (!v6) {
    goto LABEL_17;
  }
  int v7 = [(PXPhotosDetailsAssetsWidget *)self context];
  if ([v7 shouldShowMovieHeader])
  {
    uint64_t v8 = [v4 userInterfaceIdiom];

    if (v8 == 3) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  int v9 = [(PXPhotosDetailsAssetsWidget *)self context];
  if ([v9 shouldShowMovieHeader])
  {
  }
  else
  {
    id v10 = [(PXPhotosDetailsAssetsWidget *)self context];
    int v11 = [v10 shouldUseKeyFace];

    if (!v11)
    {
      long long v14 = [(PXPhotosDetailsAssetsWidget *)self _title];
      goto LABEL_18;
    }
  }
  id v12 = +[PXPhotosDetailsSettings sharedInstance];
  int v13 = [v12 allowEditorialLayoutStressTest];

  if (!v13)
  {
LABEL_17:
    long long v14 = 0;
    goto LABEL_18;
  }
  PXLocalizedStringFromTable(@"PXPhotosDetailsAssetsWidgetTitle", @"PhotosUICore");
  long long v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  long long v15 = [(PXPhotosDetailsAssetsWidget *)self _currentDataSourceStressTest];
  long long v16 = v15;
  if (v15)
  {
    if (v14) {
      long long v17 = v14;
    }
    else {
      long long v17 = @"Photos";
    }
    uint64_t v18 = -[__CFString stringByAppendingFormat:](v17, "stringByAppendingFormat:", @" (#%lu)", [v15 dataSourceIndex]);

    long long v14 = (__CFString *)v18;
  }

LABEL_18:
  return (NSString *)v14;
}

- (id)_curationButtonTitle
{
  if ([(PXPhotosDetailsAssetsWidget *)self _curate]) {
    v2 = @"PXPhotosDetailsAssetsWidgetShowMoreButton";
  }
  else {
    v2 = @"PXPhotosDetailsAssetsWidgetShowSummaryButton";
  }
  char v3 = PXLocalizedStringFromTable(v2, @"PhotosUICore");
  return v3;
}

- (id)_subtitle
{
  v2 = [(PXPhotosDetailsAssetsWidget *)self context];
  char v3 = [v2 localizedSubtitle];

  return v3;
}

- (id)_title
{
  v2 = [(PXPhotosDetailsAssetsWidget *)self context];
  char v3 = [v2 localizedTitle];

  uint64_t v4 = [off_1E5DA7230 defaultHelper];
  id v5 = [v4 displayableTextForTitle:v3 intent:1];

  return v5;
}

- (int64_t)contentLayoutStyle
{
  v2 = [(PXPhotosDetailsAssetsWidget *)self _specManager];
  char v3 = [v2 spec];

  int64_t v4 = [v3 shouldInsetAllPhotoDetailsContent] ^ 1;
  return v4;
}

- (PXTilingController)contentTilingController
{
  [(PXPhotosDetailsAssetsWidget *)self _loadTilingController];
  return [(PXPhotosDetailsAssetsWidget *)self _tilingController];
}

- (void)loadContentData
{
  char v3 = [MEMORY[0x1E4F1C9C8] date];
  loadStartDate = self->_loadStartDate;
  self->_loadStartDate = v3;

  id v5 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
  [v5 startBackgroundFetchIfNeeded];
}

- (id)_extendedTraitCollection
{
  char v3 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
  int64_t v4 = [v3 widgetViewControllerHostingWidget:self];

  id v5 = objc_msgSend(v4, "px_extendedTraitCollection");

  return v5;
}

- (void)_setPhotosDataSource:(id)a3
{
  id v17 = a3;
  char v5 = [(PXPhotosDataSource *)self->__photosDataSource isEqual:v17];
  int v6 = v17;
  if ((v5 & 1) == 0)
  {
    int v7 = v17;
    if (!v17)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PXPhotosDetailsAssetsWidget.m", 886, @"Invalid parameter not satisfying: %@", @"photosDataSource != nil" object file lineNumber description];

      int v7 = 0;
    }
    uint64_t v8 = -[PXPhotosDataSource initWithPhotosDataSource:options:]([PXPhotosDataSource alloc], "initWithPhotosDataSource:options:", v17, [v7 options] | 0x10);
    int v9 = objc_opt_class();
    id v10 = [(PXPhotosDetailsAssetsWidget *)self context];
    int v11 = [v10 people];
    [v9 _refreshSortDescriptorsInPhotosDataSource:v8 withPeople:v11];

    id v12 = [(PXPhotosDataSource *)v8 firstAssetCollection];
    if (v12)
    {
      [(PXPhotosDataSource *)v8 setWantsCuration:[(PXPhotosDetailsAssetsWidget *)self _curate] forAssetCollection:v12];
      if ([(PXPhotosDataSource *)v8 isCuratedAssetsEmptyForAssetCollection:v12])
      {
        self->__curate = 0;
        [(PXPhotosDataSource *)v8 setWantsCuration:0 forAssetCollection:v12];
      }
    }
    else
    {
      self->__curate = 0;
    }
    photosDataSource = self->__photosDataSource;
    self->__photosDataSource = v8;
    long long v14 = v8;

    long long v15 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
    [v15 setPhotosDataSource:v14];

    int v6 = v17;
  }
}

- (void)_setLoadCoordinationToken:(id)a3
{
  char v5 = (PXPhotosDetailsLoadCoordinationToken *)a3;
  loadCoordinationToken = self->__loadCoordinationToken;
  if (loadCoordinationToken != v5)
  {
    int v7 = v5;
    [(PXPhotosDetailsLoadCoordinationToken *)loadCoordinationToken complete];
    objc_storeStrong((id *)&self->__loadCoordinationToken, a3);
    char v5 = v7;
  }
}

- (PXSectionedSelectionManager)selectionManager
{
  if (!self->_selectionManager)
  {
    char v3 = [(PXPhotosDetailsAssetsWidget *)self dataSourceManager];

    if (v3)
    {
      id v4 = objc_alloc((Class)off_1E5DA84B0);
      char v5 = [(PXPhotosDetailsAssetsWidget *)self dataSourceManager];
      int v6 = (PXSectionedSelectionManager *)[v4 initWithDataSourceManager:v5];
      selectionManager = self->_selectionManager;
      self->_selectionManager = v6;
    }
  }
  uint64_t v8 = self->_selectionManager;
  return v8;
}

- (id)dataSourceManager
{
  if (!self->_dataSourceManager)
  {
    char v3 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];

    if (v3)
    {
      id v4 = [PXPhotoKitAssetsDataSourceManager alloc];
      char v5 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
      int v6 = [(PXPhotoKitAssetsDataSourceManager *)v4 initWithPhotosDataSource:v5];
      dataSourceManager = self->_dataSourceManager;
      self->_dataSourceManager = v6;
    }
  }
  uint64_t v8 = self->_dataSourceManager;
  return v8;
}

- (void)setContext:(id)a3
{
  char v5 = (PXPhotosDetailsContext *)a3;
  context = self->_context;
  id v10 = v5;
  if (context != v5)
  {
    [(PXPhotosDetailsContext *)context unregisterChangeObserver:self context:PXPhotosDetailsContextObservationContext_174501];
    objc_storeStrong((id *)&self->_context, a3);
    [(PXPhotosDetailsContext *)self->_context registerChangeObserver:self context:PXPhotosDetailsContextObservationContext_174501];
    int v7 = +[PXPhotosDetailsLoadCoordinator loadCoordinatorForContext:v10];
    uint64_t v8 = [v7 tokenForCuratedFetch];

    [(PXPhotosDetailsAssetsWidget *)self _setLoadCoordinationToken:v8];
    int v9 = [(PXPhotosDetailsContext *)v10 photosDataSource];
    [(PXPhotosDetailsAssetsWidget *)self _setPhotosDataSource:v9];

    [(PXPhotosDetailsAssetsWidget *)self _updateShowCurationButton];
  }
}

- (id)_assetActionManagerForAssetsReference:(id)a3
{
  id v4 = a3;
  char v5 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  int v6 = [v5 dataSourceManager];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    uint64_t v8 = [v7 dataSourceManager];
  }
  else
  {
    uint64_t v8 = 0;
  }

  int v9 = [(PXPhotosDetailsAssetsWidget *)self context];
  id v10 = [v9 viewModel];

  int v11 = [v10 selectionManager];
  if (([v10 isSelecting] & 1) == 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    if (v4) {
      [v4 indexPath];
    }
    v22[0] = v23;
    v22[1] = v24;
    id v12 = [off_1E5DA6F50 indexPathSetWithIndexPath:v22];
    int v13 = (void *)[objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v8];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__PXPhotosDetailsAssetsWidget__assetActionManagerForAssetsReference___block_invoke;
    v20[3] = &unk_1E5DC9F28;
    id v21 = v12;
    id v14 = v12;
    [v13 performChanges:v20];

    int v11 = v13;
  }
  long long v15 = [[PXPhotoKitAssetActionManager alloc] initWithSelectionManager:v11];
  [(PXActionManager *)v15 setPerformerDelegate:self];
  long long v16 = [(PXPhotosDetailsAssetsWidget *)self context];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [v16 people];
    if ([v17 count] == 1)
    {
      uint64_t v18 = [v17 firstObject];
      [(PXPhotoKitAssetActionManager *)v15 setPerson:v18];
    }
  }

  return v15;
}

uint64_t __69__PXPhotosDetailsAssetsWidget__assetActionManagerForAssetsReference___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedIndexPaths:*(void *)(a1 + 32)];
}

- (void)_fallBackByTogglingCurationIfNeeded
{
  id v5 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
  char v3 = [v5 firstAssetCollection];
  int v4 = [v5 isCuratedAssetsEmptyForAssetCollection:v3];
  if ((v4 & 1) != 0
    || ([v5 wantsCurationForAssetCollection:v3] & 1) == 0 && objc_msgSend(v5, "isEmpty"))
  {
    [(PXPhotosDetailsAssetsWidget *)self _setCurate:v4 ^ 1u];
  }
}

- (id)_regionOfInterestForAssetReference:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DB20];
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  int v9 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  id v10 = [v9 tilingController];

  int v11 = [v10 scrollController];
  [v11 updateIfNeeded];

  long long v72 = 0u;
  long long v73 = 0u;
  id v12 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
  int v13 = [v12 dataSource];
  id v14 = v13;
  if (v13)
  {
    [v13 indexPathForAssetReference:v4];
  }
  else
  {
    long long v72 = 0u;
    long long v73 = 0u;
  }
  double v15 = *(double *)off_1E5DAB010;
  double v16 = *((double *)off_1E5DAB010 + 1);
  double v17 = *((double *)off_1E5DAB010 + 2);
  double v18 = *((double *)off_1E5DAB010 + 3);

  uint64_t v19 = v72;
  if ((void)v72 != *(void *)off_1E5DAAED8)
  {
    uint64_t v20 = *((void *)&v72 + 1);
    long long v21 = v73;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v48 = xmmword_1AB359AB0;
    long long v49 = v72;
    long long v50 = v73;
    long long v51 = 0u;
    long long v52 = 0u;
    *(void *)&long long v53 = 0;
    if ([v10 getTile:0 geometry:&v60 group:0 userData:0 forTileWithIdentifier:&v48])
    {
      double v6 = *((double *)&v60 + 1);
      double v5 = *(double *)&v60;
      double v8 = *((double *)&v61 + 1);
      double v7 = *(double *)&v61;
      double v15 = *((double *)&v69 + 1);
      double v17 = *((double *)&v70 + 1);
      double v16 = *(double *)&v70;
      double v18 = *(double *)&v71;
    }
    v75.origin.double x = v5;
    v75.origin.double y = v6;
    v75.size.width = v7;
    v75.size.height = v8;
    if (CGRectIsNull(v75))
    {
      id v40 = v4;
      long long v22 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
      long long v23 = [v22 currentLayout];

      uint64_t v24 = v72;
      uint64_t v25 = [v23 dataSource];
      uint64_t v26 = [v25 identifier];

      if (v24 == v26)
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v41 = xmmword_1AB359AB0;
        uint64_t v42 = v19;
        uint64_t v43 = v20;
        long long v44 = v21;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v47 = 0;
        if ([v23 getGeometry:&v48 group:0 userData:0 forTileWithIdentifier:&v41])
        {
          id v27 = +[PXTilingCoordinateSpaceConverter defaultConverter];
          uint64_t v28 = [v23 coordinateSpaceIdentifier];
          uint64_t v29 = [v10 contentCoordinateSpaceIdentifier];
          objc_msgSend(v27, "convertRect:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", v28, v29, v48, v49);
          double v5 = v30;
          double v6 = v31;
          double v7 = v32;
          double v8 = v33;
        }
      }
      id v4 = v40;
    }
  }
  v76.origin.double x = v5;
  v76.origin.double y = v6;
  v76.size.width = v7;
  v76.size.height = v8;
  if (CGRectIsNull(v76))
  {
    CGRect v34 = 0;
  }
  else
  {
    id v35 = objc_alloc((Class)off_1E5DA82B8);
    long long v36 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    long long v37 = [v36 scrollViewController];
    long long v38 = [v37 contentCoordinateSpace];
    CGRect v34 = objc_msgSend(v35, "initWithRect:inCoordinateSpace:", v38, v5, v6, v7, v8);

    objc_msgSend(v34, "setImageContentsRect:", v15, v16, v17, v18);
  }

  return v34;
}

- (void)_setCurrentDataSourceStressTest:(id)a3
{
  double v5 = (PXPhotosDataSourceStressTest *)a3;
  currentDataSourceStressTest = self->__currentDataSourceStressTest;
  if (currentDataSourceStressTest != v5)
  {
    double v8 = v5;
    [(PXPhotosDataSourceStressTest *)currentDataSourceStressTest unregisterChangeObserver:self context:PXStressTestObservationContext];
    objc_storeStrong((id *)&self->__currentDataSourceStressTest, a3);
    [(PXPhotosDataSourceStressTest *)self->__currentDataSourceStressTest registerChangeObserver:self context:PXStressTestObservationContext];
    double v7 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v7 widgetLocalizedDisclosureTitleDidChange:self];

    double v5 = v8;
  }
}

- (void)_performTilingChangeWithoutAnimationTransition:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = [(PXPhotosDetailsAssetsWidget *)self _transitionWithoutAnimation];
  [(PXPhotosDetailsAssetsWidget *)self _setTransitionWithoutAnimation:1];
  v4[2](v4);

  double v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  double v7 = [v6 tilingController];
  double v8 = [v7 scrollController];
  [v8 updateIfNeeded];

  [(PXPhotosDetailsAssetsWidget *)self _setTransitionWithoutAnimation:v5];
}

- (BOOL)_isLocationWithinCurrentLayoutBounds:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  double v7 = [v6 currentLayout];

  if (v7)
  {
    double v8 = +[PXTilingCoordinateSpaceConverter defaultConverter];
    int v9 = [(PXPhotosDetailsAssetsWidget *)self contentTilingController];
    objc_msgSend(v8, "convertPoint:fromCoordinateSpaceIdentifier:toCoordinateSpaceIdentifier:", objc_msgSend(v9, "contentCoordinateSpaceIdentifier"), objc_msgSend(v7, "coordinateSpaceIdentifier"), x, y);

    [v7 contentBounds];
    [v7 contentInset];
    PXEdgeInsetsInsetRect();
  }

  return 0;
}

- (id)_assetReferenceAtPoint:(CGPoint)a3 padding:(UIEdgeInsets)a4
{
  long long v10 = 0u;
  long long v11 = 0u;
  -[PXPhotosDetailsAssetsWidget _assetIndexPathAtLocation:padding:](self, "_assetIndexPathAtLocation:padding:", a3.x, a3.y, a4.top, a4.left, a4.bottom, a4.right);
  if (*(void *)off_1E5DAAED8)
  {
    double v6 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
    double v7 = [v6 dataSource];
    v9[0] = v10;
    v9[1] = v11;
    BOOL v5 = [v7 assetReferenceAtItemIndexPath:v9];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (PXSimpleIndexPath)_assetIndexPathAtLocation:(SEL)a3 padding:(CGPoint)a4
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double y = a4.y;
  double x = a4.x;
  long long v13 = *((_OWORD *)off_1E5DAB028 + 1);
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
  *(_OWORD *)&retstr->int64_t item = v13;
  id v14 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
  double v15 = [v14 dataSource];
  uint64_t v16 = [v15 identifier];

  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  double v17 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  double v18 = [v17 tilingController];
  uint64_t v19 = v18;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  _OWORD v22[2] = __65__PXPhotosDetailsAssetsWidget__assetIndexPathAtLocation_padding___block_invoke;
  v22[3] = &__block_descriptor_40_e355_B504__0_PXTileIdentifier_Q_10Q__8_v96_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_104_PXTileGeometry__CGRect__CGPoint_dd__CGSize_dd___CGPoint_dd__CGSize_dd__CGAffineTransform_dddddd_ddB_CGSize_dd__CGRect__CGPoint_dd__CGSize_dd___v_296Q488___NSObject__496l;
  v22[4] = v16;
  if (v18)
  {
    objc_msgSend(v18, "hitTestTileAtPoint:padding:passingTest:", v22, x, y, top, left, bottom, right);
  }
  else
  {
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v23 = 0u;
  }

  if (v23 == __PAIR128__(6432423, 5))
  {
    long long v21 = v25;
    *(_OWORD *)&retstr->dataSourceIdentifier = v24;
    *(_OWORD *)&retstr->int64_t item = v21;
  }
  return result;
}

BOOL __65__PXPhotosDetailsAssetsWidget__assetIndexPathAtLocation_padding___block_invoke(uint64_t a1, void *a2)
{
  return *a2 == 5 && a2[1] == 6432423 && a2[2] == *(void *)(a1 + 32);
}

- (void)_logAssetCountsIfNecessary
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (![(PXPhotosDetailsAssetsWidget *)self didLogCuratedAssetCount])
  {
    char v3 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
    uint64_t v4 = [v3 numberOfSections];

    if (v4 >= 1)
    {
      uint64_t v5 = 0;
      char v6 = 0;
      uint64_t v7 = 0;
      do
      {
        double v8 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
        int v9 = [v8 curatedAssetsInSection:v7];

        v5 += [v9 count];
        v6 |= v9 != 0;

        ++v7;
        long long v10 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
        uint64_t v11 = [v10 numberOfSections];
      }
      while (v7 < v11);
      if (v6)
      {
        id v12 = (void *)MEMORY[0x1E4F56658];
        uint64_t v29 = *MEMORY[0x1E4F56570];
        long long v13 = [NSNumber numberWithUnsignedInteger:v5];
        v30[0] = v13;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        [v12 sendEvent:@"com.apple.photos.CPAnalytics.photosDetailsSummaryAssetsCounted" withPayload:v14];

        [(PXPhotosDetailsAssetsWidget *)self setDidLogCuratedAssetCount:1];
      }
    }
  }
  if (![(PXPhotosDetailsAssetsWidget *)self didLogUncuratedAssetCount])
  {
    double v15 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
    uint64_t v16 = [v15 numberOfSections];

    if (v16 >= 1)
    {
      uint64_t v17 = 0;
      char v18 = 0;
      uint64_t v19 = 0;
      do
      {
        uint64_t v20 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
        long long v21 = [v20 uncuratedAssetsInSection:v17];

        v19 += [v21 count];
        v18 |= v21 != 0;

        ++v17;
        long long v22 = [(PXPhotosDetailsAssetsWidget *)self _photosDataSource];
        uint64_t v23 = [v22 numberOfSections];
      }
      while (v17 < v23);
      if (v18)
      {
        long long v24 = (void *)MEMORY[0x1E4F56658];
        uint64_t v27 = *MEMORY[0x1E4F56570];
        long long v25 = [NSNumber numberWithUnsignedInteger:v19];
        uint64_t v28 = v25;
        long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        [v24 sendEvent:@"com.apple.photos.CPAnalytics.photosDetailsAllAssetsCounted" withPayload:v26];

        [(PXPhotosDetailsAssetsWidget *)self setDidLogUncuratedAssetCount:1];
      }
    }
  }
}

- (void)_setShowCurationButton:(BOOL)a3
{
  if (self->__showCurationButton != a3)
  {
    self->__showCurationButton = a3;
    id v4 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v4 widgetLocalizedSubtitleDidChange:self];
  }
}

- (void)_updateShowCurationButton
{
  char v3 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
  id v7 = [v3 photosDataSource];

  id v4 = [v7 firstAssetCollection];
  if ([(PXPhotosDetailsAssetsWidget *)self isSelecting]
    && (![(PXPhotosDetailsAssetsWidget *)self isSelecting]
     || ![(PXPhotosDetailsAssetsWidget *)self _curate])
    || v4 && ([v7 isCuratedAssetsFutilelyForAssetCollection:v4] & 1) != 0
    || ([v7 isCuratedAssetsEmptyForAssetCollection:v4] & 1) != 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    char v6 = [(PXPhotosDetailsAssetsWidget *)self spec];
    BOOL v5 = ([v6 detailsOptions] & 8) == 0;
  }
  [(PXPhotosDetailsAssetsWidget *)self _setShowCurationButton:v5];
}

- (void)_setCurate:(BOOL)a3
{
  if (self->__curate != a3)
  {
    BOOL v3 = a3;
    self->__curate = a3;
    [(PXPhotosDetailsAssetsWidget *)self _invalidateLayoutGenerator];
    BOOL v5 = [(PXPhotosDetailsAssetsWidget *)self eventTracker];
    [v5 setIsDisplayingCuratedContent:v3];

    char v6 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
    id v11 = [v6 photosDataSource];

    id v7 = [v11 firstAssetCollection];
    if (v7) {
      [v11 setWantsCuration:v3 forAssetCollection:v7];
    }
    [(PXPhotosDetailsAssetsWidget *)self _updateShowCurationButton];
    double v8 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v8 widgetLocalizedSubtitleDidChange:self];

    int v9 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    [v9 widget:self animateChanges:0 withAnimationOptions:0];

    [(PXPhotosDetailsAssetsWidget *)self _updateLayoutEngineIfNeeded];
    long long v10 = [(PXPhotosDetailsAssetsWidget *)self _inlinePlaybackController];
    [v10 updatePlaybackEnabled];
  }
}

- (void)_updateFocusedAssetReference
{
  BOOL v3 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
  id v4 = [v3 scrollViewController];

  BOOL v5 = (void *)MEMORY[0x1E4FB1790];
  char v6 = [v4 scrollView];
  id v7 = [v5 focusSystemForEnvironment:v6];
  double v8 = [v7 focusedItem];

  int v9 = [v8 parentFocusEnvironment];
  long long v10 = [v9 focusItemContainer];
  uint64_t v11 = [v10 coordinateSpace];

  if (v11)
  {
    [v8 frame];
    PXRectGetCenter();
  }
  [(PXPhotosDetailsAssetsWidget *)self _setFocusedAssetReference:0];
}

- (void)_setFocusedAssetReference:(id)a3
{
  BOOL v5 = (PXAssetReference *)a3;
  if (self->__focusedAssetReference != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->__focusedAssetReference, a3);
    char v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    id v7 = [v6 targetLayout];
    [(PXPhotosDetailsAssetsWidget *)self _configureLayout:v7];

    BOOL v5 = v8;
  }
}

- (void)_setHighlightedAssetReference:(id)a3
{
  BOOL v5 = (PXAssetReference *)a3;
  if (self->__highlightedAssetReference != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->__highlightedAssetReference, a3);
    char v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    id v7 = [v6 targetLayout];
    [(PXPhotosDetailsAssetsWidget *)self _configureLayout:v7];

    BOOL v5 = v8;
  }
}

- (void)_setHiddenAssetReferences:(id)a3
{
  id v4 = (NSSet *)a3;
  if (v4)
  {
    double v8 = v4;
    if ([(NSSet *)v4 count])
    {
      BOOL v5 = v8;
      goto LABEL_6;
    }
  }
  BOOL v5 = 0;
LABEL_6:
  if (self->__hiddenAssetReferences != v5)
  {
    int v9 = v5;
    objc_storeStrong((id *)&self->__hiddenAssetReferences, v5);
    char v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    id v7 = [v6 targetLayout];
    [(PXPhotosDetailsAssetsWidget *)self _configureLayout:v7];

    BOOL v5 = v9;
  }
}

- (void)_setDraggingAssetReferences:(id)a3
{
  id v4 = (NSSet *)a3;
  if (v4)
  {
    double v8 = v4;
    if ([(NSSet *)v4 count])
    {
      BOOL v5 = v8;
      goto LABEL_6;
    }
  }
  BOOL v5 = 0;
LABEL_6:
  if (self->__draggingAssetReferences != v5)
  {
    int v9 = v5;
    objc_storeStrong((id *)&self->__draggingAssetReferences, v5);
    char v6 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    id v7 = [v6 targetLayout];
    [(PXPhotosDetailsAssetsWidget *)self _configureLayout:v7];

    BOOL v5 = v9;
  }
}

- (void)_updateHasLoadedContentData
{
  BOOL v3 = [(PXPhotosDetailsAssetsWidget *)self _tilingController];
  id v5 = [v3 targetLayout];

  uint64_t v4 = [v5 placeholderMode];
  [(PXPhotosDetailsAssetsWidget *)self _setHasLoadedContentData:v4 != 1];
  if (v4 != 1) {
    [(PXPhotosDetailsAssetsWidget *)self _setLoadCoordinationToken:0];
  }
}

- (void)_updateTilingLayoutIfNeeded
{
  uint64_t v4 = [(PXPhotosDetailsAssetsWidget *)self _layoutEngine];
  if (v4)
  {
    id v18 = v4;
    id v5 = [v4 layoutSnapshot];
    if (!v5)
    {
      uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsAssetsWidget.m" lineNumber:518 description:@"The layout engine should always return a layoutSnapshot."];
    }
    char v6 = [(PXPhotosDetailsAssetsWidget *)self _tilingController];
    id v7 = [v6 targetLayout];

    uint64_t v8 = [v7 layoutSnapshot];
    if (!v8) {
      goto LABEL_6;
    }
    int v9 = (void *)v8;
    long long v10 = [v7 layoutSnapshot];
    uint64_t v11 = [v10 dataSourceSnapshot];
    uint64_t v12 = [v11 identifier];
    long long v13 = [v5 dataSourceSnapshot];
    uint64_t v14 = [v13 identifier];

    if (v12 != v14)
    {
      uint64_t v15 = [(PXPhotosDetailsAssetsWidget *)self _createNewLayout];

      uint64_t v16 = [(PXPhotosDetailsAssetsWidget *)self _tilingController];
      [v16 transitionToLayout:v15];

      id v7 = (void *)v15;
    }
    else
    {
LABEL_6:
      [(PXPhotosDetailsAssetsWidget *)self _configureLayout:v7];
    }

    uint64_t v4 = v18;
  }
}

- (void)_configureLayout:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [(PXPhotosDetailsAssetsWidget *)self _layoutEngine];
  uint64_t v7 = [v6 layoutSnapshot];

  long long v55 = (void *)v7;
  if (!v7)
  {
    long long v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsAssetsWidget.m" lineNumber:433 description:@"The layout engine should always return a layoutSnapshot."];
  }
  uint64_t v8 = [(PXPhotosDetailsAssetsWidget *)self _hiddenAssetReferences];
  long long v54 = v8;
  if ([v8 count])
  {
    id v9 = objc_alloc_init((Class)off_1E5DA7430);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v65 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          long long v62 = 0u;
          long long v63 = 0u;
          uint64_t v16 = [v5 dataSource];
          uint64_t v17 = v16;
          if (v16)
          {
            [v16 indexPathForAssetReference:v15];
          }
          else
          {
            long long v62 = 0u;
            long long v63 = 0u;
          }

          long long v60 = v62;
          long long v61 = v63;
          [v9 addIndexPath:&v60];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v9 = 0;
  }
  id v18 = [(PXPhotosDetailsAssetsWidget *)self _draggingAssetReferences];
  long long v53 = v18;
  if ([v18 count])
  {
    id v19 = objc_alloc_init((Class)off_1E5DA7430);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v57 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v56 + 1) + 8 * j);
          long long v62 = 0u;
          long long v63 = 0u;
          long long v26 = [v5 dataSource];
          uint64_t v27 = v26;
          if (v26)
          {
            [v26 indexPathForAssetReference:v25];
          }
          else
          {
            long long v62 = 0u;
            long long v63 = 0u;
          }

          long long v60 = v62;
          long long v61 = v63;
          [v19 addIndexPath:&v60];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v22);
    }
  }
  else
  {
    id v19 = 0;
  }
  uint64_t v28 = [(PXPhotosDetailsAssetsWidget *)self _highlightedAssetReference];
  long long v49 = *((_OWORD *)off_1E5DAB028 + 1);
  long long v51 = *(_OWORD *)off_1E5DAB028;
  long long v62 = *(_OWORD *)off_1E5DAB028;
  long long v63 = v49;
  if (v28)
  {
    uint64_t v29 = [v5 dataSource];
    double v30 = v29;
    if (v29)
    {
      [v29 indexPathForAssetReference:v28];
    }
    else
    {
      long long v60 = 0u;
      long long v61 = 0u;
    }
    long long v62 = v60;
    long long v63 = v61;
  }
  double v31 = [(PXPhotosDetailsAssetsWidget *)self _focusedAssetReference];
  long long v60 = v51;
  long long v61 = v50;
  if (v31)
  {
    double v32 = [v5 dataSource];
    double v33 = v32;
    if (v32) {
      [v32 indexPathForAssetReference:v31];
    }
    else {
      memset(buf, 0, 32);
    }
    long long v60 = *(_OWORD *)buf;
    long long v61 = *(_OWORD *)&buf[16];
  }
  long long v52 = (void *)v28;
  CGRect v34 = [v5 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = [v34 photosDataSource];
    int v36 = [v35 wantsCurationForFirstAssetCollection];
    if ([v35 numberOfSections] < 1
      || ([v35 assetsInSection:0],
          long long v37 = objc_claimAutoreleasedReturnValue(),
          v37,
          v37))
    {
      int v38 = [v35 isEmpty];
      uint64_t v39 = 2;
      if (v36) {
        uint64_t v39 = 0;
      }
      if (v38) {
        uint64_t v40 = v39;
      }
      else {
        uint64_t v40 = 0;
      }
    }
    else
    {
      uint64_t v40 = 1;
    }
  }
  else
  {
    LOBYTE(v36) = 0;
    uint64_t v40 = 0;
  }
  [v5 setSelectionBadgeOptions:1025];
  long long v41 = [(PXPhotosDetailsAssetsWidget *)self _specManager];
  uint64_t v42 = [v41 spec];

  if (v36)
  {
    uint64_t v43 = 1;
    uint64_t v44 = 1;
  }
  else
  {
    uint64_t v44 = [v42 gridContentMode];
    uint64_t v43 = 3;
  }
  if (![v42 enableBadges]) {
    uint64_t v43 = 0;
  }
  [v5 setContentMode:v44];
  [v5 setBadgeOptions:v43];
  [v5 setLayoutSnapshot:v55];
  [v5 setHiddenIndexPaths:v9];
  [v5 setPlaceholderMode:v40];
  *(_OWORD *)buf = v62;
  *(_OWORD *)&buf[16] = v63;
  [v5 setHighlightedIndexPath:buf];
  [v5 setDraggingIndexPaths:v19];
  *(_OWORD *)buf = v60;
  *(_OWORD *)&buf[16] = v61;
  [v5 setFocusedIndexPath:buf];
  [v5 setSpec:v42];
  if (v40 != 1 && self->_loadStartDate)
  {
    long long v45 = PLRelatedGetLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      [(NSDate *)self->_loadStartDate timeIntervalSinceNow];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = -v46;
      _os_log_impl(&dword_1A9AE7000, v45, OS_LOG_TYPE_DEFAULT, "[%@] initial data souce loaded in %fs", buf, 0x16u);
    }

    loadStartDate = self->_loadStartDate;
    self->_loadStartDate = 0;
  }
}

- (id)_createNewLayout
{
  [(PXPhotosDetailsAssetsWidget *)self _updateLayoutEngineIfNeeded];
  uint64_t v4 = [(PXPhotosDetailsAssetsWidget *)self _layoutEngine];
  id v5 = [v4 layoutSnapshot];

  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PXPhotosDetailsAssetsWidget.m" lineNumber:421 description:@"The layout engine should always return a layoutSnapshot."];
  }
  char v6 = [(PXEngineDrivenAssetsTilingLayout *)[PXPhotosDetailsAssetsTilingLayout alloc] initWithLayoutEngineSnapshot:v5];
  [(PXEngineDrivenAssetsTilingLayout *)v6 setDelegate:self];
  [(PXPhotosDetailsAssetsWidget *)self _configureLayout:v6];

  return v6;
}

- (void)_updateLayoutEngineIfNeeded
{
  BOOL v3 = [(PXPhotosDetailsAssetsWidget *)self _specManager];
  uint64_t v4 = [v3 spec];

  id v5 = [(PXPhotosDetailsAssetsWidget *)self _specManager];
  char v6 = [v5 extendedTraitCollection];

  if (v4 && v6)
  {
    [v6 layoutReferenceSize];
    [v4 contentGuideInsets];
    PXSizeIsNull();
  }
}

void __58__PXPhotosDetailsAssetsWidget__updateLayoutEngineIfNeeded__block_invoke(uint64_t a1, void *a2)
{
}

- (void)_invalidateLayoutGenerator
{
  [(PXPhotosDetailsAssetsWidget *)self _setLayoutGenerator:0];
  [(PXPhotosDetailsAssetsWidget *)self _setLayoutEngine:0];
}

- (void)_loadTilingController
{
  if (!self->__tilingController)
  {
    BOOL v3 = [MEMORY[0x1E4F1CA80] set];
    tilesInUse = self->_tilesInUse;
    self->_tilesInUse = v3;

    id v5 = [PXPhotoKitUIMediaProvider alloc];
    id v6 = objc_alloc_init(MEMORY[0x1E4F38FB0]);
    uint64_t v7 = [(PXPhotoKitUIMediaProvider *)v5 initWithImageManager:v6];
    mediaProvider = self->__mediaProvider;
    self->__mediaProvider = v7;

    id v9 = objc_alloc_init(PXBasicUIViewTileAnimator);
    tileAnimator = self->__tileAnimator;
    self->__tileAnimator = v9;

    id v11 = [(PXPhotosDetailsAssetsWidget *)self _specManager];
    uint64_t v12 = [(PXPhotosDetailsAssetsWidget *)self widgetDelegate];
    id v51 = [v12 widgetScrollViewControllerHostingWidget:self];

    [v51 registerObserver:self];
    long long v50 = [(PXPhotosDetailsAssetsWidget *)self _createNewLayout];
    uint64_t v13 = [[PXTilingController alloc] initWithLayout:v50];
    tilingController = self->__tilingController;
    self->__tilingController = v13;

    [(PXTilingController *)self->__tilingController setScrollController:v51];
    [(PXTilingController *)self->__tilingController setTileAnimator:self->__tileAnimator];
    uint64_t v15 = [[PXPhotosDetailsInlinePlaybackController alloc] initWithTilingController:self->__tilingController];
    inlinePlaybackController = self->__inlinePlaybackController;
    self->__inlinePlaybackController = v15;

    [(PXPhotosDetailsInlinePlaybackController *)self->__inlinePlaybackController setDelegate:self];
    uint64_t v17 = [PXUIAssetsScene alloc];
    id v19 = self->__mediaProvider;
    id v18 = self->__tilingController;
    id v20 = [(PXPhotosDetailsAssetsWidget *)self _dataSourceManager];
    uint64_t v21 = [(PXPhotosDetailsAssetsWidget *)self _selectionManager];
    uint64_t v22 = [(PXUIAssetsScene *)v17 initWithTilingController:v18 mediaProvider:v19 dataSourceManager:v20 selectionManager:v21 delegate:self];
    assetsScene = self->__assetsScene;
    self->__assetsScene = v22;

    [(PXTilingController *)self->__tilingController setTileSource:self];
    [(PXTilingController *)self->__tilingController setTransitionDelegate:self];
    [(PXTilingController *)self->__tilingController setScrollDelegate:self];
    [(PXAssetsScene *)self->__assetsScene setDelegate:self];
    [(PXAssetsScene *)self->__assetsScene setAutoplayTilesWaitForInput:1];
    long long v24 = [(PXPhotosDetailsAssetsWidget *)self _specManager];
    uint64_t v25 = [v24 spec];

    if (v25 && [v25 userInterfaceIdiom] == 5)
    {
      [v25 defaultCornerRadius];
      -[PXUIAssetsScene setContentTileCornerRadius:](self->__assetsScene, "setContentTileCornerRadius:");
    }
    long long v26 = [(PXAssetsScene *)self->__assetsScene viewTileReusePool];
    [v26 registerReusableObjectForReuseIdentifier:1501 creationHandler:&__block_literal_global_174589];

    uint64_t v27 = [(PXAssetsScene *)self->__assetsScene viewTileReusePool];
    [v27 registerReusableObjectForReuseIdentifier:1500 creationHandler:&__block_literal_global_263_174590];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
    uint64_t v29 = [WeakRetained widgetViewHostingGestureRecognizers:self];

    long long v49 = v25;
    double v30 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel_handleTap_];
    [(PXUITapGestureRecognizer *)v30 setDelegate:self];
    tapGesture = self->__tapGesture;
    self->__tapGesture = v30;
    long long v48 = v30;

    [v29 addGestureRecognizer:v48];
    double v32 = [[PXUITapGestureRecognizer alloc] initWithTarget:self action:sel_handlePress_];
    [(PXUITapGestureRecognizer *)v32 setAllowedPressTypes:&unk_1F02D4C60];
    [(PXUITapGestureRecognizer *)v32 setDelegate:self];
    pressGesture = self->__pressGesture;
    self->__pressGesture = v32;
    CGRect v34 = v32;

    [v29 addGestureRecognizer:v34];
    id v35 = (UIPinchGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel_handlePinch_];
    [(UIPinchGestureRecognizer *)v35 setDelegate:self];
    pinchGesture = self->__pinchGesture;
    self->__pinchGesture = v35;
    long long v37 = v35;

    [v29 addGestureRecognizer:v37];
    int v38 = [[PXTouchingUIGestureRecognizer alloc] initWithTarget:self action:sel_handleTouch_];
    [(PXTouchingUIGestureRecognizer *)v38 setDelegate:self];
    [(PXTouchingUIGestureRecognizer *)v38 setMinimumTouchDuration:0.15];
    [(PXTouchingUIGestureRecognizer *)v38 setMaximumTouchMovement:20.0];
    touchGesture = self->__touchGesture;
    self->__touchGesture = v38;
    uint64_t v40 = v38;

    [v51 addGestureRecognizer:v40];
    long long v41 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:self];
    [v29 addInteraction:v41];
    [v41 setEnabled:1];
    uint64_t v42 = [v51 scrollView];
    uint64_t v43 = [PXSwipeSelectionManager alloc];
    uint64_t v44 = [(PXPhotosDetailsAssetsWidget *)self _assetsScene];
    long long v45 = [v44 selectionManager];
    double v46 = [(PXSwipeSelectionManager *)v43 initWithSelectionManager:v45 scrollView:v42];

    [(PXSwipeSelectionManager *)v46 setDelegate:self];
    swipeSelectionManager = self->__swipeSelectionManager;
    self->__swipeSelectionManager = v46;

    [(PXPhotosDetailsAssetsWidget *)self _updateHasLoadedContentData];
    [(PXPhotosDetailsAssetsWidget *)self _updateShowCurationButton];
  }
}

PXPlaceholderView *__52__PXPhotosDetailsAssetsWidget__loadTilingController__block_invoke_2()
{
  v0 = [PXPlaceholderView alloc];
  v1 = -[PXPlaceholderView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PXPlaceholderView *)v1 setShouldShowIndicatorView:1];
  return v1;
}

_PXContentUnavailableView *__52__PXPhotosDetailsAssetsWidget__loadTilingController__block_invoke()
{
  v0 = [_PXContentUnavailableView alloc];
  v1 = PXLocalizedStringFromTable(@"PXPhotosDetailsAssetsWidgetContentUnavailableTitle", @"PhotosUICore");
  v2 = -[_UIContentUnavailableView initWithFrame:title:style:](v0, "initWithFrame:title:style:", v1, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(_PXContentUnavailableView *)v2 sizeToFit];
  return v2;
}

- (PXPhotosDetailsAssetsSpecManager)_specManager
{
  specManager = self->__specManager;
  if (!specManager)
  {
    uint64_t v4 = [(PXPhotosDetailsAssetsWidget *)self _extendedTraitCollection];
    id v5 = [(PXPhotosDetailsAssetsWidget *)self spec];
    id v6 = -[PXPhotosDetailsAssetsSpecManager initWithExtendedTraitCollection:detailsOptions:]([PXPhotosDetailsAssetsSpecManager alloc], "initWithExtendedTraitCollection:detailsOptions:", v4, [v5 detailsOptions]);
    uint64_t v7 = self->__specManager;
    self->__specManager = v6;

    [(PXPhotosDetailsAssetsSpecManager *)self->__specManager registerChangeObserver:self context:PXSpecManagerObservationContext_174500];
    specManager = self->__specManager;
  }
  return specManager;
}

- (void)dealloc
{
  [(PXPhotosDataSourceStressTest *)self->__currentDataSourceStressTest setRunning:0];
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsAssetsWidget;
  [(PXPhotosDetailsAssetsWidget *)&v3 dealloc];
}

- (PXPhotosDetailsAssetsWidget)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotosDetailsAssetsWidget;
  v2 = [(PXPhotosDetailsAssetsWidget *)&v7 init];
  objc_super v3 = (PXPhotosDetailsAssetsWidget *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 14) = 257;
    *(_OWORD *)(v2 + 280) = *(_OWORD *)off_1E5DAB000;
    uint64_t v4 = objc_alloc_init(_PXPhotosDetailsAssetsWidgetEventTracker);
    eventTracker = v3->_eventTracker;
    v3->_eventTracker = (PXPhotosDetailsAssetsWidgetEventTracker *)v4;

    [(PXPhotosDetailsAssetsWidgetEventTracker *)v3->_eventTracker setIsDisplayingCuratedContent:v3->__curate];
    +[PXUIAssetsScene preloadResources];
  }
  return v3;
}

- (void)_setNavigatedAssetReference:(id)a3 autoPlayVideo:(BOOL)a4
{
  self->__autoPlayVideoInOneUp = a4;
}

+ (void)_refreshSortDescriptorsInPhotosDataSource:(id)a3 withPeople:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count] == 1)
  {
    objc_super v7 = [v6 firstObject];
    +[PXPeopleUtilities sortDescriptorsWithPersonAssetSortOrder:](PXPeopleUtilities, "sortDescriptorsWithPersonAssetSortOrder:", [v7 assetSortOrder]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v5 sortDescriptors];
    if (v9 == v8)
    {
    }
    else
    {
      id v10 = v9;
      char v11 = [v9 isEqual:v8];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = PLPeopleGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v7 uuid];
          int v14 = 138543618;
          uint64_t v15 = v13;
          __int16 v16 = 2112;
          id v17 = v8;
          _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "PXPhotosDetailsAssetsWidget: Sort descriptors for person set on Person: %{public}@. New Sort Descriptors: %@.", (uint8_t *)&v14, 0x16u);
        }
        [v5 setSortDescriptors:v8];
      }
    }
  }
}

@end