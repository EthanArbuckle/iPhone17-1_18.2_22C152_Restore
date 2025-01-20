@interface PXPhotosViewUIInteraction
- (BOOL)_commitPreviewForContextMenuInteraction:(id)a3;
- (BOOL)_handleHoverWithHitTestResult:(id)a3;
- (BOOL)_handleTapWithHitTestResult:(id)a3 keyModifierFlags:(int64_t)a4;
- (BOOL)_pickNavigatedAssetReference;
- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)allowsActionsForContextMenuInteraction:(id)a3;
- (BOOL)allowsPreviewCommittingForContextMenuInteraction:(id)a3;
- (BOOL)canPerformActionType:(id)a3;
- (BOOL)canStartContextMenuInteraction:(id)a3;
- (BOOL)canToggleSelectMode;
- (BOOL)dragController:(id)a3 shouldResizeCancelledPreviewForAssetReference:(id)a4;
- (BOOL)dragController:(id)a3 shouldSelectRearrangedAssetReferences:(id)a4;
- (BOOL)ensureSelectMode;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 allowsMultiSelectMenuForInteraction:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 allowsPreviewCommittingForContextMenuInteraction:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4;
- (BOOL)oneUpPresentation:(id)a3 commitPreviewForContextMenuInteraction:(id)a4;
- (BOOL)oneUpPresentationShouldPreventShowInAllPhotosAction:(id)a3;
- (BOOL)oneUpPresentationWantsShowInLibraryButton:(id)a3;
- (BOOL)presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4;
- (BOOL)presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4 completionHandler:(id)a5;
- (BOOL)swipeSelectionManager:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4;
- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3;
- (NSArray)keyCommandsForSelectionExtension;
- (NSSet)hiddenAssetReferences;
- (NSUndoManager)undoManager;
- (PXAssetReference)navigatedAssetReference;
- (PXAssetsDataSourceManager)navigatedAssetSectionDataSourceManager;
- (PXOneUpPresentation)oneUpPresentation;
- (PXPhotosDragController)dragController;
- (PXPhotosViewUIInteractionDelegate)uiInteractionDelegate;
- (PXSimpleIndexPath)_indexPathForAssetAtLocation:(SEL)a3 withPadding:(CGPoint)a4 forSwipeSelectionManager:(UIEdgeInsets)a5;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4;
- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4;
- (PXSwipeSelectionManager)swipeSelectionManager;
- (PXTouchingUIGestureRecognizer)touchingGesture;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIHoverGestureRecognizer)hoverGesture;
- (UILongPressGestureRecognizer)longPressGesture;
- (UILongPressGestureRecognizer)touchGesture;
- (UIPinchGestureRecognizer)pinchGesture;
- (UIScreenEdgePanGestureRecognizer)edgeSwipeGesture;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)doubleTapGesture;
- (UITapGestureRecognizer)pressGesture;
- (UITapGestureRecognizer)tapGesture;
- (UIViewController)presentingViewController;
- (UIViewControllerInteractiveTransitioning)edgeSwipeDismissalInteraction;
- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3;
- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)_createActionManagerForNavigatedAssetReferenceUsingSectionDataSource:(BOOL)a3;
- (id)_createContextMenuActionManagerForNavigatedPreviewAssetReference;
- (id)_createContextMenuActionManagerForSelection;
- (id)_createSelectionManagerForNavigatedAssetSection;
- (id)_targetedPreviewForSecondaryAssetReference:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)currentTouchAction;
- (id)discoverabilityTitleForActionType:(id)a3;
- (id)dragController:(id)a3 draggableAssetReferenceAtLocation:(CGPoint)a4;
- (id)dragController:(id)a3 dropTargetAssetReferenceForLocation:(CGPoint)a4;
- (id)dragController:(id)a3 itemProviderForAssetReference:(id)a4;
- (id)dragController:(id)a3 regionOfInterestForAssetReference:(id)a4 image:(id *)a5;
- (id)dragControllerAssetReferenceForBeginningSession:(id)a3;
- (id)oneUpPresentation:(id)a3 accessoriesForContextMenuInteraction:(id)a4 configuration:(id)a5;
- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 previewForDismissingToSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5;
- (id)oneUpPresentation:(id)a3 previewForHighlightingSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5;
- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4;
- (id)oneUpPresentation:(id)a3 secondaryIdentifiersForConfiguration:(id)a4;
- (id)oneUpPresentation:(id)a3 styleForContextMenuInteraction:(id)a4 configuration:(id)a5;
- (id)oneUpPresentationActionManager:(id)a3;
- (id)oneUpPresentationDataSourceManager:(id)a3;
- (id)oneUpPresentationMediaProvider:(id)a3;
- (id)oneUpPresentationPrivacyController:(id)a3;
- (id)oneUpPresentationSearchQueryMatchInfo:(id)a3;
- (id)presentationEnvironmentForActionPerformer:(id)a3;
- (id)regionOfInterestForAssetReference:(id)a3;
- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 fallbackMediaProvider:(id)a5 shouldSnapshot:(BOOL)a6;
- (id)regionOfInterestForAssetReference:(id)a3 image:(id *)a4;
- (id)swipeSelectionManager:(id)a3 indexPathSetFromIndexPath:(PXSimpleIndexPath *)a4 toIndexPath:(PXSimpleIndexPath *)a5;
- (id)targetForKeyCommands;
- (id)targetedPreviewForAssetReference:(id)a3;
- (int64_t)oneUpPresentationActionContext:(id)a3;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (void)_handleDoubleTap:(id)a3;
- (void)_handleHover:(id)a3;
- (void)_handleHoverWithHitTestResults:(id)a3 hoverGesture:(id)a4;
- (void)_handlePinch:(id)a3;
- (void)_handlePress:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_handleTouch:(id)a3;
- (void)_setupGestures;
- (void)_tearDownGestures;
- (void)_updateContextMenuInteraction;
- (void)_updateScrolledToStates:(id)a3;
- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dragController:(id)a3 draggedAssetReferencesDidChange:(id)a4;
- (void)dragController:(id)a3 dropTargetAssetReferenceDidChange:(id)a4;
- (void)ensureSwipeDismissalInteraction;
- (void)handleLongPress:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4;
- (void)oneUpPresentation:(id)a3 willEndPreviewingForContextMenuInteraction:(id)a4 configuration:(id)a5;
- (void)performActionWithType:(id)a3;
- (void)scrollViewControllerDidChange;
- (void)scrollViewControllerDidScroll:(id)a3;
- (void)setContextMenuInteraction:(id)a3;
- (void)setCurrentTouchAction:(id)a3;
- (void)setHiddenAssetReferences:(id)a3;
- (void)setNavigatedAssetReference:(id)a3;
- (void)setNavigatedAssetSectionDataSourceManager:(id)a3;
- (void)setOneUpPresentation:(id)a3;
- (void)setUiInteractionDelegate:(id)a3;
- (void)swipeSelectionManager:(id)a3 extendSelectionInDirection:(unint64_t)a4;
- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3;
- (void)swipeSelectionManagerDidAutoScroll:(id)a3;
- (void)toggleSelectMode;
- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3;
- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3;
- (void)viewDidChange;
- (void)willEndPreviewingForContextMenuInteraction:(id)a3;
@end

@implementation PXPhotosViewUIInteraction

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentTouchAction, 0);
  objc_storeStrong((id *)&self->_navigatedAssetSectionDataSourceManager, 0);
  objc_storeStrong((id *)&self->_dragController, 0);
  objc_storeStrong((id *)&self->_swipeSelectionManager, 0);
  objc_storeStrong((id *)&self->_touchingGesture, 0);
  objc_storeStrong((id *)&self->_edgeSwipeGesture, 0);
  objc_storeStrong((id *)&self->_touchGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_pressGesture, 0);
  objc_storeStrong((id *)&self->_doubleTapGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_hoverGesture, 0);
  objc_storeStrong((id *)&self->_hiddenAssetReferences, 0);
  objc_storeStrong((id *)&self->_edgeSwipeDismissalInteraction, 0);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_navigatedAssetReference, 0);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
  objc_destroyWeak((id *)&self->_uiInteractionDelegate);
}

- (id)currentTouchAction
{
  return self->_currentTouchAction;
}

- (PXAssetsDataSourceManager)navigatedAssetSectionDataSourceManager
{
  return self->_navigatedAssetSectionDataSourceManager;
}

- (PXPhotosDragController)dragController
{
  return self->_dragController;
}

- (PXSwipeSelectionManager)swipeSelectionManager
{
  return self->_swipeSelectionManager;
}

- (PXTouchingUIGestureRecognizer)touchingGesture
{
  return self->_touchingGesture;
}

- (UIScreenEdgePanGestureRecognizer)edgeSwipeGesture
{
  return self->_edgeSwipeGesture;
}

- (UILongPressGestureRecognizer)touchGesture
{
  return self->_touchGesture;
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return self->_pinchGesture;
}

- (UILongPressGestureRecognizer)longPressGesture
{
  return self->_longPressGesture;
}

- (UITapGestureRecognizer)pressGesture
{
  return self->_pressGesture;
}

- (UITapGestureRecognizer)doubleTapGesture
{
  return self->_doubleTapGesture;
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (UIHoverGestureRecognizer)hoverGesture
{
  return self->_hoverGesture;
}

- (NSSet)hiddenAssetReferences
{
  return self->_hiddenAssetReferences;
}

- (UIViewControllerInteractiveTransitioning)edgeSwipeDismissalInteraction
{
  return self->_edgeSwipeDismissalInteraction;
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (PXAssetReference)navigatedAssetReference
{
  return self->_navigatedAssetReference;
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (void)setUiInteractionDelegate:(id)a3
{
}

- (PXPhotosViewUIInteractionDelegate)uiInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_uiInteractionDelegate);
  return (PXPhotosViewUIInteractionDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v13 = a3;
  if ((void *)NavigatedSectionDataSourceObservationContext != a5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXPhotosViewUIInteraction.m" lineNumber:1595 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v8 = [(PXPhotosViewUIInteraction *)self navigatedAssetSectionDataSourceManager];
  v9 = [v8 dataSource];
  char v10 = [v9 containsAnyItems];

  if ((v10 & 1) == 0)
  {
    v11 = [(PXPhotosViewUIInteraction *)self oneUpPresentation];
    [v11 stopAnimated:1];
  }
}

- (void)_updateScrolledToStates:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isScrolledAtEdge:1 tolerance:0.0];
  char v6 = [v4 isScrolledAtEdge:3 tolerance:10.0];

  v7 = [(PXPhotosViewInteraction *)self viewModel];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__PXPhotosViewUIInteraction__updateScrolledToStates___block_invoke;
  v8[3] = &__block_descriptor_34_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
  char v9 = v5;
  char v10 = v6;
  [v7 performChanges:v8];
}

void __53__PXPhotosViewUIInteraction__updateScrolledToStates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  [v4 setScrolledToTop:v3];
  [v4 setScrolledToBottom:*(unsigned __int8 *)(a1 + 33)];
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v9 = a3;
  id v4 = [(PXPhotosViewUIInteraction *)self dragController];
  int v5 = [v4 isDragSessionActive];

  if (v5)
  {
    char v6 = [(PXGInteraction *)self layout];
    [v6 clearLastVisibleAreaAnchoringInformation];
  }
  v7 = [(PXPhotosViewUIInteraction *)self oneUpPresentation];
  [v7 invalidatePresentingGeometry];

  v8 = [(PXPhotosViewUIInteraction *)self hoverGesture];
  objc_msgSend(v8, "px_cancel");

  [(PXPhotosViewUIInteraction *)self _updateScrolledToStates:v9];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v4 = [(PXPhotosViewInteraction *)self viewModel];
  uint64_t v5 = [v4 allowedGesturesKind];

  return v5 != 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PXPhotosViewUIInteraction *)self tapGesture];

  if (v8 == v7
    && ([(PXPhotosViewUIInteraction *)self doubleTapGesture],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        v9 == v6))
  {
    v12 = [(PXPhotosViewInteraction *)self viewModel];
    if ([v12 allowsMacStyleSelection])
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      id v13 = [(PXPhotosViewInteraction *)self viewModel];
      int v10 = [v13 isInSelectMode] ^ 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = (UILongPressGestureRecognizer *)a4;
  id v8 = [(PXPhotosViewUIInteraction *)self pinchGesture];
  if (v8 == v6)
  {
    int v10 = [(PXPhotosViewUIInteraction *)self scrollView];
    v11 = [v10 panGestureRecognizer];
    BOOL v9 = v11 == v7 || self->_longPressGesture == v7;
  }
  else
  {
    BOOL v9 = 0;
  }

  id v12 = [(PXPhotosViewUIInteraction *)self tapGesture];
  if (v12 == v6)
  {
    v14 = [(PXPhotosViewUIInteraction *)self touchGesture];
    if (v14 == v7)
    {
      BOOL v13 = 1;
    }
    else
    {
      v15 = [(PXPhotosViewUIInteraction *)self touchingGesture];
      BOOL v13 = v15 == v7;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  id v16 = [(PXPhotosViewUIInteraction *)self touchingGesture];

  if (v16 == v6)
  {
    id v22 = 0;
    int v18 = [(UILongPressGestureRecognizer *)v7 px_isPanGestureRecognizerOfScrollView:&v22];
    id v19 = v22;
    v20 = v19;
    BOOL v17 = !v18 || (objc_msgSend(v19, "px_isDecelerating") & 1) == 0;
  }
  else
  {
    BOOL v17 = v13 || v9;
  }

  return v17;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosViewUIInteraction *)self pinchGesture];

  if (v5 == v4)
  {
    id v7 = [(PXPhotosViewUIInteraction *)self swipeSelectionManager];
    LOBYTE(v6) = [v7 state] == 0;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  id v8 = [(PXPhotosViewUIInteraction *)self doubleTapGesture];

  if (v8 == v4)
  {
    BOOL v9 = [(PXPhotosViewInteraction *)self viewModel];
    char v10 = [v9 isInSelectMode];

    LOBYTE(v6) = v6 & ~v10;
  }
  v11 = [(PXGInteraction *)self view];
  [v4 locationInView:v11];
  id v12 = objc_msgSend(v11, "hitTest:withEvent:", 0);
  BOOL v13 = [(PXPhotosViewInteraction *)self viewModel];
  int v14 = [v13 isEmbedded];

  if (v14)
  {
    if (v12 == v11)
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      v15 = [(PXPhotosViewUIInteraction *)self scrollView];
      if (v12 == v15) {
        LOBYTE(v6) = 1;
      }
      else {
        int v6 = [v12 isUserInteractionEnabled] ^ 1;
      }
    }
  }
  objc_opt_class();
  char v16 = v6 & ~objc_opt_isKindOfClass();

  return v16;
}

- (double)actionPerformerBottomPaddingForPresentingToast:(id)a3
{
  return 0.0;
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosViewInteraction *)self contentController];
  int v6 = [v5 delegate];

  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 presentationEnvironmentForActionPerformer:v4];
  }
  else
  {
    id v8 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    id v7 = +[PXViewControllerPresenter defaultPresenterWithViewController:v8];
  }
  return v7;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  id v7 = [(PXPhotosViewUIInteraction *)self presentingViewController];
  id v8 = [v7 presentedViewController];

  if (v8) {
    [v7 dismissViewControllerAnimated:1 completion:v6];
  }

  return v8 != 0;
}

- (void)actionPerformer:(id)a3 didChangeState:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  id v15 = v6;
  if (a4 == 10)
  {
    int v8 = [v6 shouldPreventTargetedDismissalAnimation];
    id v7 = v15;
    if (v8)
    {
      BOOL v9 = [(PXPhotosViewUIInteraction *)self oneUpPresentation];
      [v9 preventTargetedContextMenuDismissalAnimation];

      id v7 = v15;
    }
  }
  char v10 = [v7 actionType];
  int v11 = [v10 isEqualToString:@"PXAssetActionTypePickAsset"];

  if (a4 == 30 && v11) {
    [(PXPhotosViewUIInteraction *)self _pickNavigatedAssetReference];
  }
  id v12 = [(PXPhotosViewInteraction *)self viewModel];
  int v13 = [v12 allowsMultiSelectMenu];
  int v14 = [v12 isInSelectMode];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v15 shouldExitSelectModeForState:a4] & v13 & v14) == 1)
  {
    [(PXPhotosViewUIInteraction *)self toggleSelectMode];
  }
}

- (void)swipeSelectionManagerDidAutoScroll:(id)a3
{
  id v3 = [(PXGInteraction *)self layout];
  [v3 clearLastVisibleAreaAnchoringInformation];
}

- (PXSimpleIndexPath)_indexPathForAssetAtLocation:(SEL)a3 withPadding:(CGPoint)a4 forSwipeSelectionManager:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double y = a4.y;
  double x = a4.x;
  int v14 = [a6 scrollView];
  id v15 = -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v14, x, y, top, left, bottom, right);

  if (!v15) {
    goto LABEL_6;
  }
  BOOL v17 = [(PXPhotosViewInteraction *)self viewModel];
  int v18 = [v17 currentDataSource];

  id v20 = [v18 assetReferenceForAssetReference:v15];

  if (v20)
  {
    [v20 indexPath];
  }
  else
  {
LABEL_6:
    long long v19 = *((_OWORD *)off_1E5DAB028 + 1);
    *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E5DAB028;
    *(_OWORD *)&retstr->item = v19;
  }
  return result;
}

- (void)swipeSelectionManager:(id)a3 extendSelectionInDirection:(unint64_t)a4
{
  id v6 = [(PXPhotosViewUIInteraction *)self presentingViewController];
  id v7 = [v6 presentedViewController];

  if (!v7 && [(PXPhotosViewUIInteraction *)self ensureSelectMode])
  {
    int v8 = [(PXPhotosViewInteraction *)self contentController];
    [v8 extendSelectionInDirection:a4];

    id v9 = [(PXPhotosViewUIInteraction *)self uiInteractionDelegate];
    [v9 uiInteractionDidExtendSelection:self];
  }
}

- (id)swipeSelectionManager:(id)a3 indexPathSetFromIndexPath:(PXSimpleIndexPath *)a4 toIndexPath:(PXSimpleIndexPath *)a5
{
  id v9 = [a3 selectionManager];
  char v10 = [v9 dataSourceManager];
  int v11 = [v10 dataSource];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v19 = (objc_class *)objc_opt_class();
    int v18 = NSStringFromClass(v19);
    id v20 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXPhotosViewUIInteraction.m", 1389, @"%@ should be an instance inheriting from %@, but it is %@", @"swipeSelectionManager.selectionManager.dataSourceManager.dataSource", v18, v20 object file lineNumber description];
  }
  else
  {
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v17 = (objc_class *)objc_opt_class();
    int v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXPhotosViewUIInteraction.m", 1389, @"%@ should be an instance inheriting from %@, but it is nil", @"swipeSelectionManager.selectionManager.dataSourceManager.dataSource", v18 object file lineNumber description];
  }

LABEL_3:
  long long v12 = *(_OWORD *)&a4->item;
  v22[0] = *(_OWORD *)&a4->dataSourceIdentifier;
  v22[1] = v12;
  long long v13 = *(_OWORD *)&a5->item;
  v21[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v21[1] = v13;
  int v14 = [v11 indexPathSetFromIndexPath:v22 toIndexPath:v21];

  return v14;
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestAboveLocation:(id)a4
{
  a4;
  id v7 = [(PXGInteraction *)self layout];
  [v7 padding];

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathClosestLeadingLocation:(id)a4
{
  swipeSelectionManager = self->_swipeSelectionManager;
  a4;
  id v7 = [(PXSwipeSelectionManager *)swipeSelectionManager scrollView];
  [v7 frame];

  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXEdgeInsetsMake();
}

- (PXSimpleIndexPath)swipeSelectionManager:(SEL)a3 itemIndexPathAtLocation:(id)a4
{
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  return -[PXPhotosViewUIInteraction _indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:](self, "_indexPathForAssetAtLocation:withPadding:forSwipeSelectionManager:", a4, a5.x, a5.y, *(double *)off_1E5DAAF08, *((double *)off_1E5DAAF08 + 1), *((double *)off_1E5DAAF08 + 2), *((double *)off_1E5DAAF08 + 3));
}

- (void)swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  if (([v3 isInSelectMode] & 1) == 0 && objc_msgSend(v3, "canEnterSelectMode")) {
    [v3 performChanges:&__block_literal_global_281_241385];
  }
}

uint64_t __91__PXPhotosViewUIInteraction_swipeSelectionManagerAutomaticallyTransitionToMultiSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attemptSetInSelectMode:1];
}

- (BOOL)swipeSelectionManager:(id)a3 shouldAutomaticallyTransitionToMultiSelectModeAtPoint:(CGPoint)a4
{
  return 0;
}

- (BOOL)swipeSelectionManagerIsInMultiSelectMode:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  char v4 = [v3 canSwipeSelect];

  return v4;
}

- (id)dragController:(id)a3 itemProviderForAssetReference:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v6 viewDelegateRespondsTo:2048])
  {
    id v7 = [v6 viewDelegate];
    int v8 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    id v9 = [v7 photosViewController:v8 dragItemProviderForAssetReference:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)dragController:(id)a3 dropTargetAssetReferenceDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPhotosViewInteraction *)self viewModel];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PXPhotosViewUIInteraction_dragController_dropTargetAssetReferenceDidChange___block_invoke;
  v8[3] = &unk_1E5DCF6C0;
  id v9 = v5;
  id v7 = v5;
  [v6 performChanges:v8];
}

uint64_t __78__PXPhotosViewUIInteraction_dragController_dropTargetAssetReferenceDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDropTargetAssetReference:*(void *)(a1 + 32)];
}

- (void)dragController:(id)a3 draggedAssetReferencesDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(PXPhotosViewInteraction *)self viewModel];
  id v7 = [v6 draggedAssetReferences];
  unint64_t v8 = [v7 count];
  unint64_t v9 = [v5 count];

  if (v8 > v9)
  {
    char v10 = [(PXGInteraction *)self layout];
    id v11 = (id)[v10 createFenceWithType:2];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PXPhotosViewUIInteraction_dragController_draggedAssetReferencesDidChange___block_invoke;
  v13[3] = &unk_1E5DCF6C0;
  id v14 = v5;
  id v12 = v5;
  [v6 performChanges:v13];
}

uint64_t __76__PXPhotosViewUIInteraction_dragController_draggedAssetReferencesDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDraggedAssetReferences:*(void *)(a1 + 32)];
}

- (BOOL)dragController:(id)a3 shouldResizeCancelledPreviewForAssetReference:(id)a4
{
  char v4 = [(PXGInteraction *)self layout];
  id v5 = [v4 hiddenSpriteIndexes];
  BOOL v6 = [v5 count] == 0;

  return v6;
}

- (BOOL)dragController:(id)a3 shouldSelectRearrangedAssetReferences:(id)a4
{
  char v4 = [(PXPhotosViewInteraction *)self viewModel];
  char v5 = [v4 isInSelectMode];

  return v5;
}

- (id)dragControllerAssetReferenceForBeginningSession:(id)a3
{
  char v4 = [(PXPhotosViewUIInteraction *)self oneUpPresentation];
  if ([v4 isContextMenuInteractionActive])
  {
    char v5 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)dragController:(id)a3 dropTargetAssetReferenceForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v6 = [(PXGInteraction *)self view];
  id v7 = objc_msgSend(v6, "dropTargetObjectReferenceForLocation:", x, y);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)dragController:(id)a3 draggableAssetReferenceAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = [a3 contentView];
  id v8 = -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v7, x, y, *(double *)off_1E5DAAF08, *((double *)off_1E5DAAF08 + 1), *((double *)off_1E5DAAF08 + 2), *((double *)off_1E5DAAF08 + 3));

  return v8;
}

- (id)dragController:(id)a3 regionOfInterestForAssetReference:(id)a4 image:(id *)a5
{
  return [(PXPhotosViewUIInteraction *)self regionOfInterestForAssetReference:a4 image:a5];
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v8 viewDelegateRespondsTo:1024])
  {
    unint64_t v9 = [v8 viewDelegate];
    char v10 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    id v11 = [v9 photosViewController:v10 contextMenuInteraction:v6 styleForMenuWithConfiguration:v7];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v10 viewDelegateRespondsTo:512])
  {
    id v11 = [v10 viewDelegate];
    id v12 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    [v11 photosViewController:v12 contextMenuInteraction:v13 willEndForConfiguration:v8 animator:v9];
  }
}

- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v6 viewDelegateRespondsTo:256] && (objc_msgSend(v6, "isInSelectMode") & 1) == 0)
  {
    id v8 = [v6 viewDelegate];
    id v9 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    char v10 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
    id v7 = [v8 photosViewController:v9 accessoriesForContextMenuInteraction:v5 assetReference:v10];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v9 viewDelegateRespondsTo:128])
  {
    char v10 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    [v8 setPreferredCommitStyle:1];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __110__PXPhotosViewUIInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
    v12[3] = &unk_1E5DD0F30;
    id v13 = v9;
    id v14 = v10;
    id v15 = v7;
    id v11 = v10;
    [v8 addCompletion:v12];
  }
}

void __110__PXPhotosViewUIInteraction_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewDelegate];
  [v2 photosViewController:*(void *)(a1 + 40) commitPreviewViewControllerForContextMenuInteraction:*(void *)(a1 + 48)];
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
  id v6 = [(PXPhotosViewUIInteraction *)self targetedPreviewForAssetReference:v5];

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  if ([(PXPhotosViewUIInteraction *)self canStartContextMenuInteraction:v5])
  {
    id v6 = [(PXPhotosViewInteraction *)self viewModel];
    if ([v6 viewDelegateRespondsTo:64])
    {
      id v7 = [v6 viewDelegate];
      id v8 = [(PXPhotosViewUIInteraction *)self presentingViewController];
      id v9 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
      char v10 = [v7 photosViewController:v8 configurationForContextMenuInteraction:v5 assetReference:v9];
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

  return v10;
}

- (id)oneUpPresentation:(id)a3 secondaryIdentifiersForConfiguration:(id)a4
{
  id v5 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v5 isInSelectMode] && objc_msgSend(v5, "allowsMultiSelectMenu"))
  {
    id v6 = [v5 selectionManager];
    id v7 = [v6 selectionSnapshot];

    id v8 = [v7 dataSource];
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
    if (v9)
    {
      char v10 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
      if (v8)
      {
        [v8 indexPathForAssetReference:v10];
      }
      else
      {
        long long v21 = 0u;
        long long v22 = 0u;
      }
    }
    else
    {
      long long v12 = *((_OWORD *)off_1E5DAB028 + 1);
      long long v21 = *(_OWORD *)off_1E5DAB028;
      long long v22 = v12;
    }

    id v13 = [v7 selectedIndexPaths];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v20[0] = v21;
    v20[1] = v22;
    if ([v13 containsIndexPath:v20])
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __84__PXPhotosViewUIInteraction_oneUpPresentation_secondaryIdentifiersForConfiguration___block_invoke;
      v15[3] = &unk_1E5DC9AE0;
      long long v18 = v21;
      long long v19 = v22;
      id v16 = v8;
      id v17 = v11;
      [v13 enumerateAllIndexPathsUsingBlock:v15];
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __84__PXPhotosViewUIInteraction_oneUpPresentation_secondaryIdentifiersForConfiguration___block_invoke(uint64_t a1, int64x2_t *a2)
{
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(*a2, *(int64x2_t *)(a1 + 48)), (int32x4_t)vceqq_s64(a2[1], *(int64x2_t *)(a1 + 64)))), 0xFuLL))) & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    int64x2_t v4 = a2[1];
    v6[0] = *a2;
    v6[1] = v4;
    id v5 = [v3 assetReferenceAtItemIndexPath:v6];
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (id)targetedPreviewForAssetReference:(id)a3
{
  id v21 = 0;
  int64x2_t v4 = [(PXPhotosViewUIInteraction *)self regionOfInterestForAssetReference:a3 image:&v21];
  id v5 = v21;
  id v6 = [(PXPhotosViewUIInteraction *)self scrollView];
  id v7 = [v6 coordinateSpace];
  [v4 rectInCoordinateSpace:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  if (v5)
  {
    PXPreviewImageViewForImage(v5, v4, v9, v11, v13, v15);
    if (!objc_claimAutoreleasedReturnValue()) {
      goto LABEL_7;
    }
LABEL_6:
    id v19 = objc_alloc(MEMORY[0x1E4FB1B38]);
    PXRectGetCenter();
  }
  id v16 = [v4 placeholderViewFactory];

  if (v16)
  {
    id v17 = [v4 placeholderViewFactory];
    uint64_t v18 = ((void (**)(void, void *))v17)[2](v17, v4);

    if (v18) {
      goto LABEL_6;
    }
  }
LABEL_7:

  return 0;
}

- (id)_targetedPreviewForSecondaryAssetReference:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPhotosViewInteraction *)self viewModel];
  id v6 = [v5 selectionManager];
  id v7 = [v6 selectionSnapshot];

  double v8 = [v7 dataSource];
  double v9 = v8;
  if (v4)
  {
    double v10 = [v8 assetReferenceForAssetReference:v4];
    double v11 = v10;
    if (v10)
    {
      [v10 indexPath];
      if ([v7 isIndexPathSelected:&v14])
      {
        double v12 = [(PXPhotosViewUIInteraction *)self targetedPreviewForAssetReference:v11];
        goto LABEL_7;
      }
    }
  }
  else
  {
    double v11 = 0;
  }
  double v12 = 0;
LABEL_7:

  return v12;
}

- (id)oneUpPresentation:(id)a3 previewForDismissingToSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5
{
  return [(PXPhotosViewUIInteraction *)self _targetedPreviewForSecondaryAssetReference:a4];
}

- (id)oneUpPresentation:(id)a3 previewForHighlightingSecondaryItemWithIdentifier:(id)a4 configuration:(id)a5
{
  return [(PXPhotosViewUIInteraction *)self _targetedPreviewForSecondaryAssetReference:a4];
}

- (void)willEndPreviewingForContextMenuInteraction:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self contentController];
  [v3 stopForceIncludingAllAssetsInDataSource];
}

- (BOOL)_commitPreviewForContextMenuInteraction:(id)a3
{
  id v4 = [(PXPhotosViewInteraction *)self viewModel];
  int v5 = [v4 allowsPickAssetAction];

  if (!v5) {
    return 0;
  }
  return [(PXPhotosViewUIInteraction *)self _pickNavigatedAssetReference];
}

- (BOOL)allowsPreviewCommittingForContextMenuInteraction:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  char v4 = [v3 allowsOneUpPresentation];
  char v5 = v4 | [v3 allowsPickAssetAction];

  return v5;
}

- (BOOL)allowsActionsForContextMenuInteraction:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  int v4 = [v3 isInSelectMode];
  if ([v3 allowsPickAssetAction])
  {
    char v5 = 1;
  }
  else
  {
    char v6 = [v3 allowsQuickLookAction];
    char v5 = 1;
    if (v4 && (v6 & 1) == 0 && ([v3 allowsMacStyleSelection] & 1) == 0) {
      char v5 = [v3 allowsMultiSelectMenu];
    }
  }

  return v5;
}

- (BOOL)canStartContextMenuInteraction:(id)a3
{
  id v4 = a3;
  char v5 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v5 viewDelegateRespondsTo:32])
  {
    char v6 = [v5 viewDelegate];
    id v7 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    int v8 = [v6 allowsContextMenuInteractionForPhotosViewController:v7];

    if (!v8) {
      goto LABEL_8;
    }
  }
  uint64_t v9 = [(PXPhotosViewInteraction *)self zoomablePhotosInteraction];
  if (!v9) {
    goto LABEL_5;
  }
  double v10 = (void *)v9;
  double v11 = [(PXPhotosViewInteraction *)self zoomablePhotosInteraction];
  double v12 = [v11 viewModel];
  int v13 = [v12 isDisplayingIndividualItems];

  if (!v13)
  {
LABEL_8:
    BOOL v16 = 0;
  }
  else
  {
LABEL_5:
    uint64_t v14 = [(PXGInteraction *)self view];
    [v4 locationInView:v14];
    double v15 = -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v14);
    BOOL v16 = v15 != 0;
    if (v15) {
      [(PXPhotosViewUIInteraction *)self setNavigatedAssetReference:v15];
    }
  }
  return v16;
}

- (id)oneUpPresentationSearchQueryMatchInfo:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  id v4 = [v3 searchQueryMatchInfo];

  return v4;
}

- (BOOL)oneUpPresentationWantsShowInLibraryButton:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  char v4 = [v3 wantsOneUpShowInLibraryButton];

  return v4;
}

- (BOOL)oneUpPresentationShouldPreventShowInAllPhotosAction:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  char v4 = [v3 preventShowInAllPhotosAction];

  return v4;
}

- (int64_t)oneUpPresentationActionContext:(id)a3
{
  char v4 = [(PXPhotosViewInteraction *)self viewModel];
  char v5 = [v4 allowsCMMActions];

  if (v5) {
    return 4;
  }
  id v7 = [(PXPhotosViewInteraction *)self viewModel];
  int v8 = [v7 allowsPickAssetAction];

  if (v8) {
    return 6;
  }
  else {
    return 0;
  }
}

- (id)oneUpPresentationActionManager:(id)a3
{
  char v4 = [(PXPhotosViewInteraction *)self viewModel];
  uint64_t v5 = [v4 showsOnlyAssetsInSelectedItemSectionInOneUp];

  char v6 = [(PXPhotosViewUIInteraction *)self _createActionManagerForNavigatedAssetReferenceUsingSectionDataSource:v5];
  return v6;
}

- (void)oneUpPresentation:(id)a3 setHiddenAssetReferences:(id)a4
{
}

- (void)oneUpPresentation:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(PXPhotosViewInteraction *)self contentController];
  [v5 scrollToRevealAssetReference:v6 completionHandler:0];

  [(PXPhotosViewUIInteraction *)self setNavigatedAssetReference:v6];
}

- (id)oneUpPresentation:(id)a3 currentImageForAssetReference:(id)a4
{
  id v7 = 0;
  id v4 = [(PXPhotosViewUIInteraction *)self regionOfInterestForAssetReference:a4 image:&v7];
  id v5 = v7;
  return v5;
}

- (id)oneUpPresentation:(id)a3 regionOfInterestForAssetReference:(id)a4
{
  return [(PXPhotosViewUIInteraction *)self regionOfInterestForAssetReference:a4 image:0];
}

- (id)oneUpPresentation:(id)a3 styleForContextMenuInteraction:(id)a4 configuration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(PXPhotosViewInteraction *)self viewModel];
  int v10 = [v9 allowsAccessoriesContextMenuCustomization];

  if (v10)
  {
    double v11 = [(PXPhotosViewUIInteraction *)self _contextMenuInteraction:v7 styleForMenuWithConfiguration:v8];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)oneUpPresentation:(id)a3 accessoriesForContextMenuInteraction:(id)a4 configuration:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(PXPhotosViewInteraction *)self viewModel];
  int v10 = [v9 allowsAccessoriesContextMenuCustomization];

  if (v10)
  {
    double v11 = [(PXPhotosViewUIInteraction *)self _contextMenuInteraction:v7 accessoriesForMenuWithConfiguration:v8];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (void)oneUpPresentation:(id)a3 willEndPreviewingForContextMenuInteraction:(id)a4 configuration:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  [(PXPhotosViewUIInteraction *)self willEndPreviewingForContextMenuInteraction:v10];
  id v8 = [(PXPhotosViewInteraction *)self viewModel];
  int v9 = [v8 allowsAccessoriesContextMenuCustomization];

  if (v9) {
    [(PXPhotosViewUIInteraction *)self contextMenuInteraction:v10 willEndForConfiguration:v7 animator:0];
  }
}

- (BOOL)oneUpPresentation:(id)a3 commitPreviewForContextMenuInteraction:(id)a4
{
  return [(PXPhotosViewUIInteraction *)self _commitPreviewForContextMenuInteraction:a4];
}

- (BOOL)oneUpPresentation:(id)a3 allowsPreviewCommittingForContextMenuInteraction:(id)a4
{
  return [(PXPhotosViewUIInteraction *)self allowsPreviewCommittingForContextMenuInteraction:a4];
}

- (BOOL)oneUpPresentation:(id)a3 allowsMultiSelectMenuForInteraction:(id)a4
{
  id v4 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v4 allowsMultiSelectMenu]) {
    char v5 = [v4 isInSelectMode];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)oneUpPresentation:(id)a3 allowsActionsForContextMenuInteraction:(id)a4
{
  return [(PXPhotosViewUIInteraction *)self allowsActionsForContextMenuInteraction:a4];
}

- (BOOL)oneUpPresentation:(id)a3 canStartPreviewingForContextMenuInteraction:(id)a4
{
  return [(PXPhotosViewUIInteraction *)self canStartContextMenuInteraction:a4];
}

- (id)oneUpPresentationPrivacyController:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  id v4 = [v3 privacyController];

  return v4;
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  id v4 = [v3 mediaProvider];

  return v4;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  id v4 = [(PXPhotosViewInteraction *)self viewModel];
  int v5 = [v4 showsOnlyAssetsInSelectedItemSectionInOneUp];

  if (v5)
  {
    id v6 = [(PXPhotosViewUIInteraction *)self navigatedAssetSectionDataSourceManager];
  }
  else
  {
    id v7 = [(PXPhotosViewInteraction *)self viewModel];
    id v6 = [v7 dataSourceManager];
  }
  return v6;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  int64_t v4 = [v3 oneUpPresentationOrigin];

  return v4;
}

- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3
{
}

- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3
{
  id v4 = a3;
  int v5 = [(PXGInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(PXGInteraction *)self view];
  objc_msgSend(v10, "hitTestResultAtPoint:", v7, v9);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v13, "px_photosViewTouchableHitTestResultTouchAction");
    double v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    double v12 = v11[2]();
    [(PXPhotosViewUIInteraction *)self setCurrentTouchAction:v12];
  }
}

- (void)setCurrentTouchAction:(id)a3
{
  id v4 = (void (**)(void))a3;
  currentTouchAction = (void (**)(void))self->_currentTouchAction;
  if (currentTouchAction != v4)
  {
    double v8 = v4;
    if (currentTouchAction)
    {
      currentTouchAction[2]();
      id v4 = v8;
    }
    double v6 = _Block_copy(v4);
    id v7 = self->_currentTouchAction;
    self->_currentTouchAction = v6;

    id v4 = v8;
  }
}

- (void)_handleTouch:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 3) < 3)
  {
    double v6 = [(PXPhotosViewInteraction *)self viewModel];
    id v7 = [v6 selectionManager];
    [v7 performChanges:&__block_literal_global_269_241396];

    goto LABEL_24;
  }
  if (v5 != 1) {
    goto LABEL_24;
  }
  double v8 = [(PXGInteraction *)self view];
  id v39 = v4;
  [v4 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  id v13 = [(PXGInteraction *)self view];
  uint64_t v14 = objc_msgSend(v13, "hitTestResultsAtPoint:", v10, v12);

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v14;
  uint64_t v15 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (!v15) {
    goto LABEL_23;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v48;
  uint64_t v18 = *(void *)off_1E5DAAED8;
  id v19 = @"PXPhotosLayoutHitTestIdentifierAsset";
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v48 != v17) {
        objc_enumerationMutation(obj);
      }
      id v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      long long v22 = [v21 identifier];
      if (v22 == v19)
      {
      }
      else
      {
        v23 = v22;
        int v24 = [(__CFString *)v22 isEqualToString:v19];

        if (!v24) {
          continue;
        }
      }
      v25 = [(PXPhotosViewInteraction *)self viewModel];
      v26 = [v21 userData];
      long long v45 = 0u;
      long long v46 = 0u;
      v27 = [v25 currentDataSource];
      v28 = v27;
      if (v27)
      {
        [v27 indexPathForAssetReference:v26];
      }
      else
      {
        long long v45 = 0u;
        long long v46 = 0u;
      }

      if ((void)v45 != v18)
      {
        v29 = [v25 currentDataSource];
        v41 = v25;
        v30 = v26;
        v31 = v19;
        uint64_t v32 = v16;
        uint64_t v33 = v17;
        uint64_t v34 = v18;
        v35 = self;
        uint64_t v36 = [v29 identifier];

        BOOL v37 = (void)v45 == v36;
        self = v35;
        uint64_t v18 = v34;
        uint64_t v17 = v33;
        uint64_t v16 = v32;
        id v19 = v31;
        v26 = v30;
        v25 = v41;
        if (v37)
        {
          v38 = [v41 selectionManager];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __42__PXPhotosViewUIInteraction__handleTouch___block_invoke;
          v42[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
          long long v43 = v45;
          long long v44 = v46;
          [v38 performChanges:v42];

          goto LABEL_23;
        }
      }
    }
    uint64_t v16 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v16) {
      continue;
    }
    break;
  }
LABEL_23:

  id v4 = v39;
LABEL_24:
}

uint64_t __42__PXPhotosViewUIInteraction__handleTouch___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setPressedIndexPath:v4];
}

uint64_t __42__PXPhotosViewUIInteraction__handleTouch___block_invoke_2(uint64_t a1, void *a2)
{
  long long v2 = *((_OWORD *)off_1E5DAB028 + 1);
  v4[0] = *(_OWORD *)off_1E5DAB028;
  v4[1] = v2;
  return [a2 setPressedIndexPath:v4];
}

- (void)_handlePinch:(id)a3
{
  id v17 = a3;
  if ([v17 state] == 1)
  {
    id v4 = [(PXPhotosViewUIInteraction *)self scrollView];
    uint64_t v5 = [v4 panGestureRecognizer];
    objc_msgSend(v5, "px_cancel");
  }
  double v6 = [(PXPhotosViewInteraction *)self viewModel];
  id v7 = [(PXGInteraction *)self view];
  if (([v6 isInSelectMode] & 1) != 0 || !objc_msgSend(v6, "canPresentOneUp"))
  {
    char v10 = 0;
    goto LABEL_8;
  }
  double v8 = [(PXPhotosViewUIInteraction *)self oneUpPresentation];
  char v9 = [v8 handlePresentingPinchGestureRecognizer:v17];

  char v10 = 1;
  int v11 = 1;
  if ((v9 & 1) == 0)
  {
LABEL_8:
    double v12 = [(PXPhotosViewInteraction *)self zoomablePhotosInteraction];
    int v11 = [v12 handlePinch:v17];
  }
  BOOL v13 = [v17 state] != 1 && objc_msgSend(v17, "state") != 2;
  if (((v11 | v13) & 1) == 0)
  {
    [v17 velocity];
    char v14 = v10 ^ 1;
    if (v15 <= 0.0) {
      char v14 = 1;
    }
    if ((v14 & 1) == 0)
    {
      [v17 locationInView:v7];
      uint64_t v16 = -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v7);
      if (v16) {
        [(PXPhotosViewUIInteraction *)self presentOneUpForAssetReference:v16 configurationHandler:&__block_literal_global_267_241398];
      }
    }
  }
}

uint64_t __42__PXPhotosViewUIInteraction__handlePinch___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInteractiveMode:1];
}

- (void)_handlePress:(id)a3
{
  if ([a3 state] == 3)
  {
    id v5 = [(PXPhotosViewInteraction *)self viewModel];
    id v4 = [v5 singleSelectedAssetReference];
    if (v4 && ([v5 isInSelectMode] & 1) == 0 && objc_msgSend(v5, "canPresentOneUp")) {
      [(PXPhotosViewUIInteraction *)self presentOneUpForAssetReference:v4 configurationHandler:&__block_literal_global_265_241400];
    }
  }
}

uint64_t __42__PXPhotosViewUIInteraction__handlePress___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setActivity:1];
}

- (void)handleLongPress:(id)a3
{
  id v17 = a3;
  if ([v17 state] == 1)
  {
    id v4 = [(PXGInteraction *)self view];
    [v17 locationInView:v4];
    double v6 = v5;
    double v8 = v7;
    char v9 = -[PXPhotosViewInteraction assetReferenceAtLocation:withPadding:inCoordinateSpace:](self, "assetReferenceAtLocation:withPadding:inCoordinateSpace:", v4);
    char v10 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    int v11 = [v10 canPerformAction:sel_paste_ withSender:v17];

    if (v11)
    {
      double v12 = [(PXPhotosViewInteraction *)self viewModel];
      char v13 = [v12 isInSelectMode];

      if ((v13 & 1) == 0)
      {
        [v4 becomeFirstResponder];
        double v14 = *MEMORY[0x1E4F1DB30];
        double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        if (v9)
        {
          [(PXPhotosViewUIInteraction *)self regionOfInterestForAssetReference:v9];
          [(id)objc_claimAutoreleasedReturnValue() rectInCoordinateSpace:v4];
          PXRectGetCenter();
        }
        uint64_t v16 = [MEMORY[0x1E4FB1978] sharedMenuController];
        objc_msgSend(v16, "showMenuFromView:rect:", v4, v6, v8, v14, v15);
      }
    }
  }
}

- (void)_handleDoubleTap:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    double v5 = [(PXPhotosViewInteraction *)self viewModel];
    if ([v5 viewDelegateRespondsTo:16])
    {
      double v6 = [(PXGInteraction *)self view];
      [v4 locationInView:v6];
      double v8 = v7;
      double v10 = v9;

      int v11 = [(PXGInteraction *)self view];
      double v12 = objc_msgSend(v11, "hitTestResultsAtPoint:", v8, v10);

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v27;
        v25 = v5;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v27 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v19 = [v18 identifier];
            if (v19 == @"PXPhotosLayoutHitTestIdentifierAsset")
            {

LABEL_14:
              long long v22 = [v18 userData];
              double v5 = v25;
              v23 = [v25 viewDelegate];
              int v24 = [(PXPhotosViewUIInteraction *)self presentingViewController];
              [v23 photosViewController:v24 didDoubleTapAssetReference:v22];

              goto LABEL_15;
            }
            id v20 = v19;
            int v21 = [(__CFString *)v19 isEqualToString:@"PXPhotosLayoutHitTestIdentifierAsset"];

            if (v21) {
              goto LABEL_14;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
          double v5 = v25;
          if (v15) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
  }
}

- (BOOL)_handleTapWithHitTestResult:(id)a3 keyModifierFlags:(int64_t)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(PXPhotosViewInteraction *)self viewModel];
  if (a4 & 0x100000) != 0 && ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode])
  {
    int v8 = 0;
    int v9 = 1;
  }
  else if ((a4 & 0x20000) != 0)
  {
    int v8 = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
    int v9 = 0;
  }
  else
  {
    int v9 = 0;
    int v8 = 0;
  }
  double v10 = [v6 identifier];
  int v11 = @"PXPhotosLayoutHitTestIdentifierAsset";
  if (v10 == @"PXPhotosLayoutHitTestIdentifierAsset")
  {

LABEL_16:
    long long v26 = [v6 userData];
    long long v27 = [(PXPhotosViewInteraction *)self zoomablePhotosInteraction];
    int v28 = [v27 handleTapOnAssetReference:v26];

    if (v28)
    {
      long long v29 = [(PXGInteraction *)self layout];
      [v29 clearLastVisibleAreaAnchoringInformation];
LABEL_47:

LABEL_50:
      long long v43 = [(PXPhotosViewUIInteraction *)self presentingViewController];
      long long v44 = objc_msgSend(v43, "px_splitViewController");
      [v44 requestFocusUpdateWithPreferredFocusEnvironment:v43];

      goto LABEL_51;
    }
    if (v8 && [(PXPhotosViewUIInteraction *)self ensureSelectMode])
    {
      v30 = PLUIGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = 1;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = [v7 isInSelectMode];
        *(_WORD *)&buf[14] = 2048;
        *(void *)&long long v60 = a4;
        WORD4(v60) = 1024;
        *(_DWORD *)((char *)&v60 + 10) = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
        _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEFAULT, "[PXPhotosViewUIInteraction] Handling tap wants range selection: %i. Select mode enabled: %i. Key modifier flags: %lu. Connected to hardware keyboard: %i.", buf, 0x1Eu);
      }

      *(_OWORD *)buf = 0u;
      long long v60 = 0u;
      uint64_t v31 = [v7 currentDataSource];
      uint64_t v32 = v31;
      if (v31)
      {
        [v31 indexPathForAssetReference:v26];
      }
      else
      {
        *(_OWORD *)buf = 0u;
        long long v60 = 0u;
      }

      long long v29 = [v7 selectionManager];
      v42 = [(PXPhotosViewInteraction *)self contentController];
      v58[0] = *(_OWORD *)buf;
      v58[1] = v60;
      [v29 extendSelectionToItemIndexPath:v58 withDelegate:v42];

      goto LABEL_47;
    }
    if ([v7 isInSelectMode])
    {
      if ([v7 allowsMacStyleSelection])
      {
        if (v9)
        {
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke;
          v56[3] = &unk_1E5DCF6C0;
          id v57 = v26;
          [v7 performChanges:v56];
          uint64_t v33 = v57;
        }
        else
        {
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_2;
          v54[3] = &unk_1E5DCF6C0;
          id v55 = v26;
          [v7 performChanges:v54];
          uint64_t v33 = v55;
        }
      }
      else
      {
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_3;
        v52[3] = &unk_1E5DCF6C0;
        id v53 = v26;
        [v7 performChanges:v52];
        uint64_t v33 = v53;
      }
LABEL_49:

      goto LABEL_50;
    }
    if (v9
      && ([v7 allowsMacStyleSelection] & 1) == 0
      && [(PXPhotosViewUIInteraction *)self ensureSelectMode])
    {
      uint64_t v34 = PLUIGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)&buf[4] = 1;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = [v7 allowsMacStyleSelection];
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v60) = [v7 isInSelectMode];
        WORD2(v60) = 2048;
        *(void *)((char *)&v60 + 6) = a4;
        HIWORD(v60) = 1024;
        int v61 = [MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode];
        _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_DEFAULT, "[PXPhotosViewUIInteraction] Handling tap wants toggle selection: %i. Allows mac style selection: %i. Select mode enabled: %i. Key modifier flags: %lu. Connected to hardware keyboard: %i.", buf, 0x24u);
      }

      uint64_t v47 = MEMORY[0x1E4F143A8];
      uint64_t v48 = 3221225472;
      long long v49 = __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_259;
      long long v50 = &unk_1E5DCF6C0;
      id v51 = v26;
      [v7 performChanges:&v47];
      uint64_t v33 = v51;
      goto LABEL_49;
    }
    if ([v7 canPresentOneUp])
    {
      [(PXPhotosViewUIInteraction *)self presentOneUpForAssetReference:v26 configurationHandler:0];
LABEL_51:
      char v41 = 1;
LABEL_52:

      goto LABEL_53;
    }
    v35 = [v7 customAssetSelectionHandler];

    if (v35)
    {
      uint64_t v36 = [(PXPhotosViewInteraction *)self viewModel];
      int v37 = [v36 showsOnlyAssetsInSelectedItemSectionInOneUp];

      if (!v37)
      {
        v38 = [v7 customAssetSelectionHandler];
        id v39 = [(PXPhotosViewInteraction *)self viewModel];
        long long v46 = [v39 dataSourceManager];
        char v41 = ((uint64_t (**)(void, void *, void *))v38)[2](v38, v26, v46);

        goto LABEL_58;
      }
      [(PXPhotosViewUIInteraction *)self setNavigatedAssetReference:v26];
      v38 = [v7 customAssetSelectionHandler];
      id v39 = [(PXPhotosViewUIInteraction *)self navigatedAssetSectionDataSourceManager];
      char v40 = ((uint64_t (**)(void, void *, void *))v38)[2](v38, v26, v39);
    }
    else
    {
      if (![v7 viewDelegateRespondsTo:1])
      {
        char v41 = 0;
        goto LABEL_52;
      }
      v38 = [v7 viewDelegate];
      id v39 = [(PXPhotosViewUIInteraction *)self presentingViewController];
      char v40 = [v38 photosViewController:v39 didPickAssetReference:v26];
    }
    char v41 = v40;
LABEL_58:

    goto LABEL_52;
  }
  int v12 = [(__CFString *)v10 isEqualToString:@"PXPhotosLayoutHitTestIdentifierAsset"];

  if (v12) {
    goto LABEL_16;
  }
  id v13 = [v6 identifier];
  uint64_t v14 = @"PXGHitTestResultGenericSingleView";
  if (v13 == @"PXGHitTestResultGenericSingleView")
  {
    int v24 = @"PXGHitTestResultGenericSingleView";
LABEL_42:

LABEL_43:
    goto LABEL_44;
  }
  char v15 = [(__CFString *)v13 isEqualToString:@"PXGHitTestResultGenericSingleView"];

  if (v15) {
    goto LABEL_44;
  }
  uint64_t v16 = [v6 identifier];
  id v17 = @"PXPhotosLayoutHitTestIdentifierAccessoryCell";
  if (v16 == @"PXPhotosLayoutHitTestIdentifierAccessoryCell")
  {
    int v24 = @"PXPhotosLayoutHitTestIdentifierAccessoryCell";
    goto LABEL_42;
  }
  char v18 = [(__CFString *)v16 isEqualToString:@"PXPhotosLayoutHitTestIdentifierAccessoryCell"];

  if ((v18 & 1) == 0)
  {
    id v19 = [(PXPhotosViewInteraction *)self contentController];
    id v20 = [v19 overlayController];
    int v21 = [v6 spriteReference];
    long long v22 = [v21 objectReference];
    int v23 = [v20 canHandleObjectReference:v22];

    if (!v23)
    {
      char v41 = 0;
      goto LABEL_53;
    }
    int v24 = [(PXPhotosViewInteraction *)self contentController];
    v25 = [(__CFString *)v24 overlayController];
    [v25 handleTapWithHitTestResult:v6];

    goto LABEL_43;
  }
LABEL_44:
  char v41 = 1;
LABEL_53:

  return v41;
}

uint64_t __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleSelectionForAssetReference:*(void *)(a1 + 32) updateCursorIndexPath:1];
}

uint64_t __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 clickSelectAssetReference:*(void *)(a1 + 32) updateCursorIndexPath:1];
}

uint64_t __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 toggleSelectionForAssetReference:*(void *)(a1 + 32) updateCursorIndexPath:1];
}

uint64_t __74__PXPhotosViewUIInteraction__handleTapWithHitTestResult_keyModifierFlags___block_invoke_259(uint64_t a1, void *a2)
{
  return [a2 toggleSelectionForAssetReference:*(void *)(a1 + 32) updateCursorIndexPath:1];
}

- (void)_handleTap:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    double v5 = [(PXGInteraction *)self view];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    double v10 = [(PXGInteraction *)self view];
    int v11 = objc_msgSend(v10, "hitTestResultsAtPoint:", v7, v9);

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          if (-[PXPhotosViewUIInteraction _handleTapWithHitTestResult:keyModifierFlags:](self, "_handleTapWithHitTestResult:keyModifierFlags:", *(void *)(*((void *)&v23 + 1) + 8 * v16), objc_msgSend(v4, "modifierFlags", (void)v23)))
          {
            char v17 = 1;
            goto LABEL_12;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    char v17 = 0;
LABEL_12:

    char v18 = [(PXPhotosViewInteraction *)self viewModel];
    id v19 = v18;
    if ((v17 & 1) == 0
      && ([v18 handlePrimaryAction:v4] & 1) == 0
      && [v19 allowsMacStyleSelection])
    {
      id v20 = [v19 selectionManager];
      [v20 performChanges:&__block_literal_global_257_241408];
    }
    if (objc_msgSend(v4, "state", (void)v23) == 3
      && [v19 viewDelegateRespondsTo:0x40000])
    {
      int v21 = [v19 viewDelegate];
      long long v22 = [(PXPhotosViewUIInteraction *)self presentingViewController];
      [v21 photosViewController:v22 didReceiveUserInteraction:1];
    }
  }
}

uint64_t __40__PXPhotosViewUIInteraction__handleTap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (BOOL)_handleHoverWithHitTestResult:(id)a3
{
  id v4 = a3;
  double v5 = [v4 identifier];
  double v6 = @"PXPhotosLayoutHitTestIdentifierAsset";
  if (v5 == @"PXPhotosLayoutHitTestIdentifierAsset")
  {
  }
  else
  {
    int v7 = [(__CFString *)v5 isEqualToString:@"PXPhotosLayoutHitTestIdentifierAsset"];

    if (!v7)
    {
      BOOL v8 = 0;
      goto LABEL_9;
    }
  }
  double v9 = [(PXPhotosViewInteraction *)self viewModel];
  double v10 = [v4 userData];
  long long v19 = 0u;
  long long v20 = 0u;
  int v11 = [v9 currentDataSource];
  id v12 = v11;
  if (v11)
  {
    [v11 indexPathForAssetReference:v10];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
  }

  objc_initWeak(&location, self);
  uint64_t v13 = [v9 selectionManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__PXPhotosViewUIInteraction__handleHoverWithHitTestResult___block_invoke;
  v15[3] = &__block_descriptor_64_e37_v16__0___PXMutableSelectionManager__8l;
  long long v16 = v19;
  long long v17 = v20;
  [v13 performChanges:v15];

  objc_destroyWeak(&location);
  BOOL v8 = 1;
LABEL_9:

  return v8;
}

uint64_t __59__PXPhotosViewUIInteraction__handleHoverWithHitTestResult___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  return [a2 setPendingIndexPath:v4];
}

- (void)_handleHoverWithHitTestResults:(id)a3 hoverGesture:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 state] != 1 && objc_msgSend(v7, "state") != 2) {
    goto LABEL_12;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v9)
  {
LABEL_11:

LABEL_12:
    id v8 = [(PXPhotosViewInteraction *)self viewModel];
    uint64_t v13 = [v8 selectionManager];
    [v13 performChanges:&__block_literal_global_255_241410];

    goto LABEL_13;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v15;
LABEL_5:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v15 != v11) {
      objc_enumerationMutation(v8);
    }
    if (-[PXPhotosViewUIInteraction _handleHoverWithHitTestResult:](self, "_handleHoverWithHitTestResult:", *(void *)(*((void *)&v14 + 1) + 8 * v12), (void)v14))
    {
      break;
    }
    if (v10 == ++v12)
    {
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
LABEL_13:
}

uint64_t __73__PXPhotosViewUIInteraction__handleHoverWithHitTestResults_hoverGesture___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *((_OWORD *)off_1E5DAB028 + 1);
  v4[0] = *(_OWORD *)off_1E5DAB028;
  v4[1] = v2;
  return [a2 setPendingIndexPath:v4];
}

- (void)_handleHover:(id)a3
{
  id v4 = a3;
  double v5 = [(PXGInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(PXGInteraction *)self view];
  objc_msgSend(v10, "hitTestResultsAtPoint:", v7, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  [(PXPhotosViewUIInteraction *)self _handleHoverWithHitTestResults:v11 hoverGesture:v4];
}

- (void)setContextMenuInteraction:(id)a3
{
  double v5 = (UIContextMenuInteraction *)a3;
  p_contextMenuInteraction = &self->_contextMenuInteraction;
  contextMenuInteraction = self->_contextMenuInteraction;
  if (contextMenuInteraction != v5)
  {
    uint64_t v10 = v5;
    if (!v5 && contextMenuInteraction)
    {
      double v8 = [(UIContextMenuInteraction *)contextMenuInteraction view];
      [v8 removeInteraction:*p_contextMenuInteraction];
    }
    objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
    double v5 = v10;
    if (*p_contextMenuInteraction)
    {
      double v9 = [(PXGInteraction *)self view];
      [v9 addInteraction:*p_contextMenuInteraction];

      double v5 = v10;
    }
  }
}

- (id)_createContextMenuActionManagerForSelection
{
  id v3 = [(PXPhotosViewInteraction *)self viewModel];
  id v4 = [v3 selectionManager];

  double v5 = [[PXAssetActionManager alloc] initWithSelectionManager:v4];
  [(PXActionManager *)v5 setPerformerDelegate:self];

  return v5;
}

- (id)_createContextMenuActionManagerForNavigatedPreviewAssetReference
{
  id v3 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
  if (!v3) {
    PXAssertGetLog();
  }
  id v4 = [(PXPhotosViewInteraction *)self viewModel];
  double v5 = [v4 assetActionManager];
  id v6 = objc_alloc((Class)objc_opt_class());
  double v7 = [v4 selectionManager];
  double v8 = (void *)[v6 initWithSelectionManager:v7];

  [v8 setPerformerDelegate:self];
  char v9 = [v4 allowsMultiSelectMenu];
  uint64_t v10 = [v8 selectionManager];
  id v11 = [v10 selectionSnapshot];

  uint64_t v12 = [v11 selectedIndexPaths];
  [v3 indexPath];
  int v13 = [v12 containsIndexPath:&v18];

  if (!v13 || (v9 & 1) == 0) {
    [v8 setObjectReference:v3];
  }
  long long v14 = [v4 assetActionManager];
  [v8 setAdditionalPropertiesFromActionManager:v14];

  long long v15 = [v4 assetActionManager];
  long long v16 = [v15 allowedActionTypes];
  [v8 setAllowedActionTypes:v16];

  return v8;
}

- (id)_createActionManagerForNavigatedAssetReferenceUsingSectionDataSource:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PXPhotosViewInteraction *)self viewModel];
  id v6 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
  if (!v6) {
    PXAssertGetLog();
  }
  double v7 = [v5 assetActionManager];
  if (v3)
  {
    double v8 = [(PXPhotosViewUIInteraction *)self _createSelectionManagerForNavigatedAssetSection];
    uint64_t v9 = [objc_alloc((Class)objc_opt_class()) initWithSelectionManager:v8];
  }
  else
  {
    id v10 = objc_alloc((Class)objc_opt_class());
    double v8 = [v5 dataSourceManager];
    uint64_t v9 = [v10 initWithSelectedObjectReference:v6 dataSourceManager:v8];
  }
  id v11 = (void *)v9;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 setSupportsAirPlay:1];
  }
  [v11 setPerformerDelegate:self];
  uint64_t v12 = [v7 allowedActionTypes];
  [v11 setAllowedActionTypes:v12];

  [v11 setAdditionalPropertiesFromActionManager:v7];
  return v11;
}

- (id)_createSelectionManagerForNavigatedAssetSection
{
  id v3 = objc_alloc((Class)off_1E5DA84B0);
  id v4 = [(PXPhotosViewUIInteraction *)self navigatedAssetSectionDataSourceManager];
  double v5 = (void *)[v3 initWithDataSourceManager:v4];

  [v5 performChanges:&__block_literal_global_251_241417];
  return v5;
}

uint64_t __76__PXPhotosViewUIInteraction__createSelectionManagerForNavigatedAssetSection__block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAllItems];
}

- (void)ensureSwipeDismissalInteraction
{
  if (!self->_edgeSwipeGesture)
  {
    id v3 = (UIScreenEdgePanGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1BB0]);
    id v4 = [(PXGInteraction *)self view];
    uint64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];

    if (v5 == 1) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 2;
    }
    [(UIScreenEdgePanGestureRecognizer *)v3 setEdges:v6];
    double v7 = [(PXGInteraction *)self view];
    [v7 addGestureRecognizer:v3];

    edgeSwipeGesture = self->_edgeSwipeGesture;
    self->_edgeSwipeGesture = v3;
    uint64_t v9 = v3;

    id v10 = [PXPhotosGridEdgeSwipeInteractiveDismissalTransition alloc];
    id v13 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    id v11 = [(PXPhotosGridEdgeSwipeInteractiveDismissalTransition *)v10 initWithEdgeSwipeGesture:v9 viewController:v13];
    edgeSwipeDismissalInteraction = self->_edgeSwipeDismissalInteraction;
    self->_edgeSwipeDismissalInteraction = v11;
  }
}

- (void)setHiddenAssetReferences:(id)a3
{
  id v10 = (NSSet *)a3;
  id v4 = self->_hiddenAssetReferences;
  uint64_t v5 = v10;
  if (v4 != v10)
  {
    char v6 = [(NSSet *)v10 isEqual:v4];

    if (v6) {
      goto LABEL_5;
    }
    double v7 = (NSSet *)[(NSSet *)v10 copy];
    hiddenAssetReferences = self->_hiddenAssetReferences;
    self->_hiddenAssetReferences = v7;

    uint64_t v5 = [(PXGInteraction *)self layout];
    uint64_t v9 = [v5 rootLayout];
    [v9 hideSpritesForObjectReferences:v10];
  }
LABEL_5:
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(CGImage *)a4 fallbackMediaProvider:(id)a5 shouldSnapshot:(BOOL)a6
{
  double v7 = a4;
  uint64_t v32 = 0;
  if (!a6) {
    a4 = &v32;
  }
  v31.receiver = self;
  v31.super_class = (Class)PXPhotosViewUIInteraction;
  uint64_t v9 = -[PXPhotosViewInteraction regionOfInterestForAssetReference:image:fallbackMediaProvider:shouldSnapshot:](&v31, sel_regionOfInterestForAssetReference_image_fallbackMediaProvider_shouldSnapshot_, a3, a4, a5);
  if (v7 && !a6) {
    NSSet *v7 = v32;
  }
  id v10 = [(PXGInteraction *)self view];
  [v9 rectInCoordinateSpace:v10];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  if (a6)
  {
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4FB1818] imageWithCGImage:v32];
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __106__PXPhotosViewUIInteraction_regionOfInterestForAssetReference_image_fallbackMediaProvider_shouldSnapshot___block_invoke;
  v23[3] = &unk_1E5DC9A80;
  BOOL v30 = a6;
  uint64_t v26 = v12;
  uint64_t v27 = v14;
  uint64_t v28 = v16;
  uint64_t v29 = v18;
  id v24 = v10;
  id v25 = v19;
  id v20 = v19;
  id v21 = v10;
  [v9 setPlaceholderViewFactory:v23];

  return v9;
}

id __106__PXPhotosViewUIInteraction_regionOfInterestForAssetReference_image_fallbackMediaProvider_shouldSnapshot___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  if (*(unsigned char *)(a1 + 80)) {
    objc_msgSend(*(id *)(a1 + 32), "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v2, v3, v4, v5, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
  else {
  char v6 = PXPreviewImageViewForImage(*(void **)(a1 + 40), a2, v2, v3, v4, v5);
  }
  return v6;
}

- (id)regionOfInterestForAssetReference:(id)a3 image:(id *)a4
{
  uint64_t v8 = 0;
  if (a4) {
    double v5 = &v8;
  }
  else {
    double v5 = 0;
  }
  char v6 = [(PXPhotosViewUIInteraction *)self regionOfInterestForAssetReference:a3 image:v5 fallbackMediaProvider:0 shouldSnapshot:1];
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  return [(PXPhotosViewUIInteraction *)self regionOfInterestForAssetReference:a3 image:0];
}

- (id)targetForKeyCommands
{
  return [(PXSwipeSelectionManager *)self->_swipeSelectionManager targetForKeyCommands];
}

- (NSArray)keyCommandsForSelectionExtension
{
  return [(PXSwipeSelectionManager *)self->_swipeSelectionManager keyCommandsForSelectionExtension];
}

- (id)discoverabilityTitleForActionType:(id)a3
{
  id v4 = a3;
  double v5 = [(PXPhotosViewInteraction *)self viewModel];
  char v6 = [v5 gridActionManager];
  double v7 = [v6 actionPerformerForActionType:v4];

  uint64_t v8 = [v7 localizedTitleForUseCase:1];

  return v8;
}

- (void)performActionWithType:(id)a3
{
  id v4 = a3;
  double v5 = [(PXPhotosViewInteraction *)self viewModel];
  char v6 = [v5 gridActionManager];
  id v7 = [v6 actionPerformerForActionType:v4];

  [v7 performActionWithCompletionHandler:0];
}

- (BOOL)canPerformActionType:(id)a3
{
  id v4 = a3;
  double v5 = [(PXPhotosViewInteraction *)self viewModel];
  char v6 = [v5 gridActionManager];
  char v7 = [v6 canPerformActionType:v4];

  return v7;
}

- (BOOL)ensureSelectMode
{
  double v2 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v2 canEnterSelectMode]) {
    [v2 performChanges:&__block_literal_global_241_241425];
  }
  char v3 = [v2 isInSelectMode];

  return v3;
}

uint64_t __45__PXPhotosViewUIInteraction_ensureSelectMode__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsInSelectMode:1];
}

- (void)toggleSelectMode
{
  if ([(PXPhotosViewUIInteraction *)self canToggleSelectMode])
  {
    id v3 = [(PXPhotosViewInteraction *)self viewModel];
    [v3 performChanges:&__block_literal_global_241427];
  }
}

void __45__PXPhotosViewUIInteraction_toggleSelectMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "attemptSetInSelectMode:", objc_msgSend(v2, "isInSelectMode") ^ 1);
}

- (BOOL)canToggleSelectMode
{
  id v2 = [(PXPhotosViewInteraction *)self viewModel];
  if ([v2 canEnterSelectMode]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 canExitSelectMode];
  }

  return v3;
}

- (BOOL)presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PXPhotosViewInteraction *)self viewModel];
  int v9 = [v8 viewDelegateRespondsTo:0x80000];

  if (v9)
  {
    id v10 = [(PXPhotosViewInteraction *)self viewModel];
    uint64_t v11 = [v10 viewDelegate];
    uint64_t v12 = [(PXPhotosViewUIInteraction *)self presentingViewController];
    [v11 photosViewController:v12 didPresentOneUp:1 forAsset:v6];
  }
  BOOL v13 = [(PXPhotosViewUIInteraction *)self presentOneUpForAssetReference:v6 configurationHandler:v7 completionHandler:0];

  return v13;
}

- (BOOL)presentOneUpForAssetReference:(id)a3 configurationHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PXPhotosViewUIInteraction *)self oneUpPresentation];
  uint64_t v12 = [(PXPhotosViewInteraction *)self viewModel];
  int v13 = [v12 canPresentOneUp];

  if (v13)
  {
    [(PXPhotosViewUIInteraction *)self setNavigatedAssetReference:v8];
    char v14 = [v11 startWithConfigurationHandler:v9];
    if ((v14 & 1) == 0) {
      [(PXPhotosViewUIInteraction *)self setNavigatedAssetReference:0];
    }
    if (v10) {
      [v11 waitForTransitionToFinishWithTimeout:v10 completionHandler:5.0];
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)_pickNavigatedAssetReference
{
  char v3 = [(PXPhotosViewUIInteraction *)self navigatedAssetReference];
  if (v3)
  {
    id v4 = [(PXPhotosViewInteraction *)self viewModel];
    if ([v4 isInSelectMode])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__PXPhotosViewUIInteraction__pickNavigatedAssetReference__block_invoke;
      v9[3] = &unk_1E5DCF6C0;
      id v10 = v3;
      [v4 performChanges:v9];
    }
    else
    {
      if (![v4 viewDelegateRespondsTo:1])
      {
        BOOL v5 = 0;
        goto LABEL_9;
      }
      id v6 = [v4 viewDelegate];
      id v7 = [(PXPhotosViewUIInteraction *)self presentingViewController];
      [v6 photosViewController:v7 didPickAssetReference:v3];
    }
    BOOL v5 = 1;
LABEL_9:

    goto LABEL_10;
  }
  BOOL v5 = 0;
LABEL_10:

  return v5;
}

uint64_t __57__PXPhotosViewUIInteraction__pickNavigatedAssetReference__block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleSelectionForAssetReference:*(void *)(a1 + 32) updateCursorIndexPath:1];
}

- (void)_updateContextMenuInteraction
{
  if (!self->_contextMenuInteraction)
  {
    char v3 = [(PXPhotosViewInteraction *)self viewModel];
    int v4 = [v3 allowsContextMenuCustomization];

    if (v4)
    {
      id v6 = (id)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
    }
    else
    {
      BOOL v5 = [(PXPhotosViewUIInteraction *)self oneUpPresentation];
      id v6 = [v5 contextMenuInteraction];
    }
    [(PXPhotosViewUIInteraction *)self setContextMenuInteraction:v6];
  }
}

- (void)_tearDownGestures
{
  char v3 = [(UITapGestureRecognizer *)self->_tapGesture view];
  [v3 removeGestureRecognizer:self->_tapGesture];

  int v4 = [(UILongPressGestureRecognizer *)self->_longPressGesture view];
  [v4 removeGestureRecognizer:self->_longPressGesture];

  BOOL v5 = [(UIPinchGestureRecognizer *)self->_pinchGesture view];
  [v5 removeGestureRecognizer:self->_pinchGesture];

  id v6 = [(UILongPressGestureRecognizer *)self->_touchGesture view];
  [v6 removeGestureRecognizer:self->_touchGesture];

  id v7 = [(PXTouchingUIGestureRecognizer *)self->_touchingGesture view];
  [v7 removeGestureRecognizer:self->_touchingGesture];

  [(PXSwipeSelectionManager *)self->_swipeSelectionManager removeFromView];
  [(PXPhotosDragController *)self->_dragController removeFromView];
  id v8 = [(PXPhotosViewInteraction *)self zoomablePhotosInteraction];
  [v8 setView:0];

  tapGesture = self->_tapGesture;
  self->_tapGesture = 0;

  longPressGesture = self->_longPressGesture;
  self->_longPressGesture = 0;

  pinchGesture = self->_pinchGesture;
  self->_pinchGesture = 0;

  touchGesture = self->_touchGesture;
  self->_touchGesture = 0;

  touchingGesture = self->_touchingGesture;
  self->_touchingGesture = 0;

  swipeSelectionManager = self->_swipeSelectionManager;
  self->_swipeSelectionManager = 0;

  dragController = self->_dragController;
  self->_dragController = 0;

  [(PXPhotosViewUIInteraction *)self setContextMenuInteraction:0];
}

- (void)_setupGestures
{
  char v3 = [(PXGInteraction *)self view];

  if (v3)
  {
    id v33 = [(PXPhotosViewInteraction *)self viewModel];
    int v4 = [(PXGInteraction *)self view];
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_handleLongPress_];
    [v5 setDelegate:self];
    objc_storeStrong((id *)&self->_longPressGesture, v5);
    [v4 addGestureRecognizer:v5];
    if ([v33 allowsHoverBehavior])
    {
      id v6 = (UIHoverGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:self action:sel__handleHover_];
      [(UIHoverGestureRecognizer *)v6 setDelegate:self];
      hoverGesture = self->_hoverGesture;
      self->_hoverGesture = v6;
      id v8 = v6;

      [v4 addGestureRecognizer:v8];
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
    [v9 setDelegate:self];
    [v9 setCancelsTouchesInView:0];
    objc_storeStrong((id *)&self->_tapGesture, v9);
    [v4 addGestureRecognizer:v9];
    if ([v33 allowsDoubleTapBehavior])
    {
      id v10 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDoubleTap_];
      [(UITapGestureRecognizer *)v10 setNumberOfTapsRequired:2];
      [(UITapGestureRecognizer *)v10 setDelegate:self];
      [v9 setCancelsTouchesInView:0];
      doubleTapGesture = self->_doubleTapGesture;
      self->_doubleTapGesture = v10;
      uint64_t v12 = v10;

      [v4 addGestureRecognizer:v12];
    }
    int v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handlePress_];
    [v13 setAllowedPressTypes:&unk_1F02D54D0];
    [v13 setDelegate:self];
    objc_storeStrong((id *)&self->_pressGesture, v13);
    [v4 addGestureRecognizer:v13];
    char v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel__handlePinch_];
    [v14 _setEndsOnSingleTouch:1];
    [v14 setDelegate:self];
    objc_storeStrong((id *)&self->_pinchGesture, v14);
    [v4 addGestureRecognizer:v14];
    if ([v33 allowsSwipeToSelect])
    {
      uint64_t v15 = [PXSwipeSelectionManager alloc];
      uint64_t v16 = [(PXPhotosViewInteraction *)self viewModel];
      uint64_t v17 = [v16 selectionManager];
      uint64_t v18 = [(PXPhotosViewUIInteraction *)self scrollView];
      uint64_t v19 = [(PXSwipeSelectionManager *)v15 initWithSelectionManager:v17 scrollView:v18];

      [(PXSwipeSelectionManager *)v19 setDelegate:self];
      swipeSelectionManager = self->_swipeSelectionManager;
      self->_swipeSelectionManager = v19;
    }
    if (([v33 allowsDragOut] & 1) != 0 || objc_msgSend(v33, "allowsDragIn"))
    {
      id v21 = [PXPhotosDragController alloc];
      long long v22 = [v33 selectionManager];
      long long v23 = [v33 assetCollectionActionManager];
      id v24 = [(PXPhotosDragController *)v21 initWithContentView:v4 selectionManager:v22 assetCollectionActionManager:v23 delegate:self];
      dragController = self->_dragController;
      self->_dragController = v24;

      uint64_t v26 = [v33 allowsDragIn];
      uint64_t v27 = [(PXPhotosViewUIInteraction *)self dragController];
      [v27 setCanDragIn:v26];
    }
    uint64_t v28 = [(PXGInteraction *)self view];
    uint64_t v29 = [(PXPhotosViewInteraction *)self zoomablePhotosInteraction];
    [v29 setView:v28];

    BOOL v30 = [(PXPhotosViewUIInteraction *)self oneUpPresentation];

    if (!v30)
    {
      objc_super v31 = [(PXPhotosViewUIInteraction *)self presentingViewController];
      uint64_t v32 = objc_msgSend(v31, "px_oneUpPresentation");
      [(PXPhotosViewUIInteraction *)self setOneUpPresentation:v32];
    }
    [(PXPhotosViewUIInteraction *)self _updateContextMenuInteraction];
  }
}

- (void)setNavigatedAssetSectionDataSourceManager:(id)a3
{
  int v4 = (PXAssetsDataSourceManager *)a3;
  [(PXAssetsDataSourceManager *)self->_navigatedAssetSectionDataSourceManager unregisterChangeObserver:self context:NavigatedSectionDataSourceObservationContext];
  navigatedAssetSectionDataSourceManager = self->_navigatedAssetSectionDataSourceManager;
  self->_navigatedAssetSectionDataSourceManager = v4;
  id v6 = v4;

  [(PXAssetsDataSourceManager *)self->_navigatedAssetSectionDataSourceManager registerChangeObserver:self context:NavigatedSectionDataSourceObservationContext];
}

- (void)setNavigatedAssetReference:(id)a3
{
  uint64_t v16 = (PXAssetReference *)a3;
  id v6 = self->_navigatedAssetReference;
  id v7 = v16;
  if (v6 == v16)
  {
LABEL_8:

    goto LABEL_9;
  }
  char v8 = [(PXAssetReference *)v16 isEqual:v6];

  if ((v8 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_navigatedAssetReference, a3);
    id v9 = [(PXPhotosViewUIInteraction *)self uiInteractionDelegate];
    [v9 uiInteraction:self didChangeNavigatedAssetReference:v16];

    if (v16)
    {
      id v10 = [(PXPhotosViewInteraction *)self viewModel];
      int v11 = [v10 showsOnlyAssetsInSelectedItemSectionInOneUp];

      if (v11)
      {
        uint64_t v12 = [(PXPhotosViewInteraction *)self viewModel];
        int v13 = [v12 dataSourceManager];
        char v14 = [(PXPhotosViewInteraction *)self viewModel];
        id v7 = objc_msgSend(v13, "createDataSourceManagerForAssetsInSectionOfAsset:usingNewTransientAssetCollection:", v16, objc_msgSend(v14, "gridStyle") == 6);

        if (!v7)
        {
          uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2 object:self file:@"PXPhotosViewUIInteraction.m" lineNumber:137 description:@"Unable to create a data source manager for the selected asset section."];
        }
        [(PXPhotosViewUIInteraction *)self setNavigatedAssetSectionDataSourceManager:v7];
        goto LABEL_8;
      }
    }
  }
LABEL_9:
}

- (NSUndoManager)undoManager
{
  char v3 = [(PXPhotosViewInteraction *)self delegate];
  int v4 = [v3 undoManagerForPhotosInteraction:self];

  return (NSUndoManager *)v4;
}

- (UIViewController)presentingViewController
{
  char v3 = [(PXPhotosViewInteraction *)self delegate];
  int v4 = [v3 presentingViewControllerForPhotosInteraction:self];

  return (UIViewController *)v4;
}

- (void)setOneUpPresentation:(id)a3
{
  BOOL v5 = (PXOneUpPresentation *)a3;
  if (self->_oneUpPresentation != v5)
  {
    objc_storeStrong((id *)&self->_oneUpPresentation, a3);
    [(PXOneUpPresentation *)v5 setDelegate:self];
    [(PXPhotosViewUIInteraction *)self setContextMenuInteraction:0];
    [(PXPhotosViewUIInteraction *)self _updateContextMenuInteraction];
  }
}

- (UIScrollView)scrollView
{
  id v2 = [(PXGInteraction *)self scrollViewController];
  char v3 = [v2 scrollView];

  return (UIScrollView *)v3;
}

- (void)scrollViewControllerDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosViewUIInteraction;
  [(PXGInteraction *)&v4 scrollViewControllerDidChange];
  char v3 = [(PXGInteraction *)self scrollViewController];
  [v3 registerObserver:self];
}

- (void)viewDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosViewUIInteraction;
  [(PXGInteraction *)&v3 viewDidChange];
  [(PXPhotosViewUIInteraction *)self _tearDownGestures];
  [(PXPhotosViewUIInteraction *)self _setupGestures];
}

@end