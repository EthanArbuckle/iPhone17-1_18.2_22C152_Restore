@interface PUOverOneUpPresentationSession
- (BOOL)_dismissActivityViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)_dismissAvalancheReviewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)_dismissEditViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)_dismissFunEffectsViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)_dismissPhotoMarkupViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)_dismissSlideshowViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)_needsUpdatePresentedViewControllers;
- (BOOL)_popToOneUpFromViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)_presentActivityViewController:(id)a3;
- (BOOL)_presentAvalancheReviewController:(id)a3;
- (BOOL)_presentEditViewController:(id)a3;
- (BOOL)_presentFunEffectsViewController:(id)a3 animated:(BOOL)a4;
- (BOOL)_presentPhotoMarkupViewController:(id)a3;
- (BOOL)_presentScreenRoutePickerViewController:(id)a3;
- (BOOL)_presentSlideshowViewController:(id)a3;
- (BOOL)isPresentingAnOverOneUpViewController;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)presentViewController:(id)a3 animated:(BOOL)a4;
- (CGPoint)photosSharingTransition:(id)a3 contentOffsetForAssetReference:(id)a4;
- (CGRect)_frameAtIndexPath:(id)a3;
- (CGRect)_frameForAssetReference:(id)a3;
- (CGRect)_frameForItemAtIndexPath:(id)a3 inAssetCollectionsDataSource:(id)a4 allowZoom:(BOOL)a5;
- (CGSize)collectionViewContentSize;
- (NSHashTable)_presentedViewControllers;
- (PUActivitySharingController)activitySharingController;
- (PUAssetReference)_stashedAssetReference;
- (PUAvalancheReviewController)_avalancheReviewController;
- (PUFunEffectsViewController)_funEffectsViewController;
- (PUOneUpActivitySharingActionPerformer)sharingActionPerformer;
- (PUOverOneUpPresentationSession)initWithActivitySharingActionPerformer:(id)a3;
- (PUOverOneUpPresentationSessionBarsDelegate)barsDelegate;
- (PUOverOneUpPresentationSessionDelegate)delegate;
- (PUPhotoEditViewController)_editViewController;
- (PUPhotoMarkupViewController)_photoMarkupViewController;
- (PUSlideshowViewController)_slideshowViewController;
- (PXActivitySharingControllerDelegate)activitySharingControllerDelegate;
- (id)_assetCollectionsDataSourceForCurrentModalViewController;
- (id)_assetReferenceAtGlobalIndex:(int64_t)a3;
- (id)_assetReferenceFromAsset:(id)a3 hintIndexPath:(id)a4 hintCollection:(id)a5;
- (id)_assetsDataSource;
- (id)_currentTileController;
- (id)_indexPathForGlobalIndex:(int64_t)a3;
- (id)_tilingView;
- (id)_viewModel;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)photosSharingTransition:(id)a3 layoutForAssetReference:(id)a4;
- (id)photosSharingTransitionTransitioningView:(id)a3;
- (id)ppt_activityViewController;
- (id)viewController;
- (id)viewToHideWhilePresentingWithTransition:(id)a3;
- (int64_t)_globalIndexForAssetReference:(id)a3;
- (int64_t)_globalIndexForIndexPath:(id)a3;
- (int64_t)_numberOfItems;
- (int64_t)_tileCountForCurrentModalViewController;
- (void)_activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5;
- (void)_activitySharingControllerDidCancel:(id)a3;
- (void)_activitySharingControllerWillDismissActivityViewController:(id)a3;
- (void)_finalizeAvalancheReviewControllerDismiss;
- (void)_finishOverOneUpPresentationSessionDismissForced:(BOOL)a3 animated:(BOOL)a4;
- (void)_invalidatePresentedViewControllers;
- (void)_performNavigationRequestForAssetDisplayDescriptor:(id)a3 completionHandler:(id)a4;
- (void)_prepareForActivitySharingControllerDismiss:(id)a3 completionHandler:(id)a4;
- (void)_removeViewController:(id)a3;
- (void)_setAvalancheReviewController:(id)a3;
- (void)_setEditViewController:(id)a3;
- (void)_setFunEffectsViewController:(id)a3;
- (void)_setNeedsUpdatePresentedViewControllers:(BOOL)a3;
- (void)_setPhotoMarkupViewController:(id)a3;
- (void)_setPresentedViewControllers:(id)a3;
- (void)_setSlideshowViewController:(id)a3;
- (void)_setStashedAssetReference:(id)a3;
- (void)_updatePresentedViewControllersIfNeeded;
- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5;
- (void)activitySharingControllerDidCancel:(id)a3;
- (void)activitySharingControllerWillDismissActivityViewController:(id)a3;
- (void)avalancheReviewControllerDidComplete:(id)a3 animated:(BOOL)a4;
- (void)avalancheReviewControllerDidComplete:(id)a3 withAsset:(id)a4 animated:(BOOL)a5;
- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)editController:(id)a3 didFinishPreparingForTransitionAfterEditingPhoto:(id)a4;
- (void)editController:(id)a3 didFinishPreparingForTransitionAfterEditingVideo:(id)a4 modificationDate:(id)a5 seekTime:(id *)a6;
- (void)funEffectsViewController:(id)a3 didSaveAsset:(id)a4 withCompletion:(unint64_t)a5;
- (void)oneUpSharingAnimationController:(id)a3 setVisibility:(BOOL)a4 forAssetReference:(id)a5;
- (void)photoMarkupController:(id)a3 didFinishWithSavedAsset:(id)a4;
- (void)photosSharingTransition:(id)a3 setVisibility:(BOOL)a4 forAssetReference:(id)a5;
- (void)ppt_cancelActivity;
- (void)ppt_dismissShareSheetWithCompletion:(id)a3;
- (void)ppt_presentPhotoEditor;
- (void)ppt_presentShareSheetWithCompletion:(id)a3;
- (void)ppt_shareUsingActivityOfType:(id)a3;
- (void)setActivitySharingController:(id)a3;
- (void)setActivitySharingControllerDelegate:(id)a3;
- (void)setBarsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSharingActionPerformer:(id)a3;
- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4;
@end

@implementation PUOverOneUpPresentationSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingActionPerformer, 0);
  objc_destroyWeak((id *)&self->_activitySharingControllerDelegate);
  objc_storeStrong((id *)&self->_activitySharingController, 0);
  objc_storeStrong((id *)&self->__presentedViewControllers, 0);
  objc_storeStrong((id *)&self->__stashedAssetReference, 0);
  objc_storeStrong((id *)&self->__funEffectsViewController, 0);
  objc_storeStrong((id *)&self->__photoMarkupViewController, 0);
  objc_storeStrong((id *)&self->__editViewController, 0);
  objc_storeStrong((id *)&self->__slideshowViewController, 0);
  objc_storeStrong((id *)&self->__avalancheReviewController, 0);
  objc_destroyWeak((id *)&self->_barsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSharingActionPerformer:(id)a3
{
}

- (PUOneUpActivitySharingActionPerformer)sharingActionPerformer
{
  return self->_sharingActionPerformer;
}

- (void)setActivitySharingControllerDelegate:(id)a3
{
}

- (PXActivitySharingControllerDelegate)activitySharingControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activitySharingControllerDelegate);
  return (PXActivitySharingControllerDelegate *)WeakRetained;
}

- (void)setActivitySharingController:(id)a3
{
}

- (PUActivitySharingController)activitySharingController
{
  return self->_activitySharingController;
}

- (void)_setNeedsUpdatePresentedViewControllers:(BOOL)a3
{
  self->__needsUpdatePresentedViewControllers = a3;
}

- (BOOL)_needsUpdatePresentedViewControllers
{
  return self->__needsUpdatePresentedViewControllers;
}

- (void)_setPresentedViewControllers:(id)a3
{
}

- (NSHashTable)_presentedViewControllers
{
  return self->__presentedViewControllers;
}

- (void)_setStashedAssetReference:(id)a3
{
}

- (PUAssetReference)_stashedAssetReference
{
  return self->__stashedAssetReference;
}

- (void)_setFunEffectsViewController:(id)a3
{
}

- (PUFunEffectsViewController)_funEffectsViewController
{
  return self->__funEffectsViewController;
}

- (void)_setPhotoMarkupViewController:(id)a3
{
}

- (PUPhotoMarkupViewController)_photoMarkupViewController
{
  return self->__photoMarkupViewController;
}

- (void)_setEditViewController:(id)a3
{
}

- (PUPhotoEditViewController)_editViewController
{
  return self->__editViewController;
}

- (void)_setSlideshowViewController:(id)a3
{
}

- (PUSlideshowViewController)_slideshowViewController
{
  return self->__slideshowViewController;
}

- (void)_setAvalancheReviewController:(id)a3
{
}

- (PUAvalancheReviewController)_avalancheReviewController
{
  return self->__avalancheReviewController;
}

- (PUOverOneUpPresentationSessionBarsDelegate)barsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barsDelegate);
  return (PUOverOneUpPresentationSessionBarsDelegate *)WeakRetained;
}

- (PUOverOneUpPresentationSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOverOneUpPresentationSessionDelegate *)WeakRetained;
}

- (void)ppt_presentPhotoEditor
{
  id v9 = [(PUOverOneUpPresentationSession *)self viewController];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      v8 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
      [v5 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 1255, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.viewController", v7, v8 object file lineNumber description];
    }
  }
  v4 = objc_msgSend(v9, "ppt_actionsController");
  [v4 performSimpleActionWithActionType:15];
}

- (void)ppt_dismissShareSheetWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = [(PUOverOneUpPresentationSession *)self activitySharingController];
  id v11 = [v6 activityViewControllerIfAvailable];

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      v10 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 1250, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.activitySharingController.activityViewControllerIfAvailable", v9, v10 object file lineNumber description];
    }
  }
  [(PUOverOneUpPresentationSession *)self _dismissActivityViewController:v11 animated:1 completionHandler:v5];
}

- (void)ppt_cancelActivity
{
  v4 = [(PUOverOneUpPresentationSession *)self activitySharingController];
  id v9 = [v4 activityViewControllerIfAvailable];

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      v8 = objc_msgSend(v9, "px_descriptionForAssertionMessage");
      [v5 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 1245, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.activitySharingController.activityViewControllerIfAvailable", v7, v8 object file lineNumber description];
    }
  }
  objc_msgSend(v9, "ppt_cancelActivity");
}

- (void)ppt_shareUsingActivityOfType:(id)a3
{
  id v5 = a3;
  v6 = [(PUOverOneUpPresentationSession *)self activitySharingController];
  id v11 = [v6 activityViewControllerIfAvailable];

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      v10 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v7 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 1236, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.activitySharingController.activityViewControllerIfAvailable", v9, v10 object file lineNumber description];
    }
  }
  objc_msgSend(v11, "ppt_performActivityOfType:", v5);
}

- (id)ppt_activityViewController
{
  v2 = [(PUOverOneUpPresentationSession *)self activitySharingController];
  v3 = [v2 activityViewControllerIfAvailable];

  return v3;
}

- (void)ppt_presentShareSheetWithCompletion:(id)a3
{
  id aBlock = a3;
  id v5 = [(PUOverOneUpPresentationSession *)self viewController];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      v12 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v9 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 1224, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.viewController", v11, v12 object file lineNumber description];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = _Block_copy(aBlock);
    v7 = (void *)pptAfterPresentationCompletion;
    pptAfterPresentationCompletion = (uint64_t)v6;

    v8 = objc_msgSend(v5, "ppt_actionsController");
    [v8 performShareAction];
  }
}

- (id)_assetReferenceAtGlobalIndex:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = -[PUOverOneUpPresentationSession _indexPathForGlobalIndex:](self, "_indexPathForGlobalIndex:");
  if (v5)
  {
    v6 = [(PUOverOneUpPresentationSession *)self _assetsDataSource];
    v7 = [v6 assetReferenceAtIndexPath:v5];
  }
  else
  {
    v8 = PXAssertGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      int64_t v11 = a3;
      _os_log_error_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "globalIndex %li out of bounds", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (int64_t)_globalIndexForAssetReference:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUOverOneUpPresentationSession *)self _assetsDataSource];
  v6 = [v5 assetReferenceForAssetReference:v4];

  if (!v4
    || ([v6 indexPath],
        v7 = objc_claimAutoreleasedReturnValue(),
        int64_t v8 = [(PUOverOneUpPresentationSession *)self _globalIndexForIndexPath:v7],
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_error_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "global index not found for assetReference %@", (uint8_t *)&v11, 0xCu);
    }

    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (int64_t)_numberOfItems
{
  v2 = [(PUOverOneUpPresentationSession *)self _assetsDataSource];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28D58]);
  uint64_t v4 = [v2 numberOfSubItemsAtIndexPath:v3];
  if (v4)
  {
    uint64_t v5 = v4;
    int64_t v6 = 0;
    for (uint64_t i = 0; i != v5; ++i)
    {
      int64_t v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:i];
      v6 += [v2 numberOfSubItemsAtIndexPath:v8];
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)_indexPathForGlobalIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || [(PUOverOneUpPresentationSession *)self _numberOfItems] <= a3)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v5 = [(PUOverOneUpPresentationSession *)self _assetsDataSource];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28D58]);
    uint64_t v7 = [v5 numberOfSubItemsAtIndexPath:v6];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        int v11 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v9];
        unint64_t v12 = [v5 numberOfSubItemsAtIndexPath:v11] + v10;
        if (v12 > a3) {
          break;
        }

        ++v9;
        unint64_t v10 = v12;
        if (v8 == v9) {
          goto LABEL_7;
        }
      }
      uint64_t v13 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 - v10 inSection:v9];
    }
    else
    {
LABEL_7:
      uint64_t v13 = 0;
    }
  }
  return v13;
}

- (int64_t)_globalIndexForIndexPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PUOverOneUpPresentationSession *)self _assetsDataSource];
    id v6 = objc_alloc_init(MEMORY[0x1E4F28D58]);
    uint64_t v7 = [v5 numberOfSubItemsAtIndexPath:v6];
    uint64_t v8 = [v4 section];
    uint64_t v9 = [v4 item];
    if (v8 >= v7)
    {
      int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      int64_t v10 = v9;
      int v11 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v8];
      if (v10 >= [v5 numberOfSubItemsAtIndexPath:v11])
      {
        int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else if (v8 >= 1)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v11;
        do
        {
          int v11 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v12];

          v10 += [v5 numberOfSubItemsAtIndexPath:v11];
          ++v12;
          uint64_t v13 = v11;
        }
        while (v8 != v12);
      }
    }
  }
  else
  {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"PUPhotosSharingSelectionBadgeKind"] & 1) != 0
    || ([v6 isEqualToString:@"PUPhotosSharingOptionBadgeKind"] & 1) != 0
    || [v6 isEqualToString:@"PUAvalancheReviewBadgeKind"])
  {
    uint64_t v8 = [(PUOverOneUpPresentationSession *)self layoutAttributesForItemAtIndexPath:v7];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(PUOverOneUpPresentationSession *)self activitySharingController];

    if (v17)
    {
      double v18 = *MEMORY[0x1E4F1DB28];
      double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      v22 = [(PUActivitySharingController *)self->_activitySharingController carouselViewController];
      objc_msgSend(v22, "frameForBadgeOfKind:forItemFrame:atIndexPath:", v6, v7, v10, v12, v14, v16);
    }
    else
    {
      v23 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];
      objc_msgSend(v23, "selectionBadgeFrameForItemFrame:atIndexPath:", v7, v10, v12, v14, v16);
      double v25 = v24;
      double v27 = v26;
      double v20 = v28;
      double v21 = v29;

      double v18 = v10 + v25;
      double v19 = v12 + v27;
    }
    v30 = [MEMORY[0x1E4FB15E0] layoutAttributesForSupplementaryViewOfKind:v6 withIndexPath:v7];

    objc_msgSend(v30, "setFrame:", v18, v19, v20, v21);
    [v30 setZIndex:1];
    [v30 setAlpha:0.0];
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUOverOneUpPresentationSession *)self _assetCollectionsDataSourceForCurrentModalViewController];
  [(PUOverOneUpPresentationSession *)self _frameForItemAtIndexPath:v4 inAssetCollectionsDataSource:v5 allowZoom:1];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v4];

  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  return v14;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int64_t v8 = [(PUOverOneUpPresentationSession *)self _tileCountForCurrentModalViewController];
  double v9 = [(PUOverOneUpPresentationSession *)self viewController];
  double v10 = [v9 view];
  [v10 frame];
  double v12 = v11;

  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  uint64_t v13 = (uint64_t)fmax(CGRectGetMinX(v21) / v12, 0.0);
  double v14 = [MEMORY[0x1E4F1CA48] array];
  if (v8 > v13)
  {
    while (1)
    {
      double v15 = [(PUOverOneUpPresentationSession *)self activitySharingController];
      if (v15)
      {
        double v16 = [(PUOverOneUpPresentationSession *)self _assetReferenceAtGlobalIndex:v13];
        v17 = [v16 indexPath];
      }
      else
      {
        v17 = [MEMORY[0x1E4F28D58] indexPathForItem:v13 inSection:0];
      }

      double v18 = [(PUOverOneUpPresentationSession *)self layoutAttributesForItemAtIndexPath:v17];
      [v18 frame];
      v22.size.CGFloat width = v12 - (v22.origin.x - (double)v13 * v12);
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.CGFloat width = width;
      v23.size.CGFloat height = height;
      if (!CGRectIntersectsRect(v22, v23)) {
        break;
      }
      [v14 addObject:v18];
      ++v13;

      if (v8 == v13) {
        goto LABEL_9;
      }
    }
  }
LABEL_9:
  return v14;
}

- (CGSize)collectionViewContentSize
{
  uint64_t v3 = [(PUOverOneUpPresentationSession *)self _tileCountForCurrentModalViewController];
  id v4 = [(PUOverOneUpPresentationSession *)self viewController];
  uint64_t v5 = [v4 view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7 * (double)v3;
  double v11 = v9;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (int64_t)_tileCountForCurrentModalViewController
{
  uint64_t v3 = [(PUOverOneUpPresentationSession *)self activitySharingController];

  if (v3)
  {
    return [(PUOverOneUpPresentationSession *)self _numberOfItems];
  }
  else
  {
    uint64_t v5 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];

    if (!v5) {
      return 0;
    }
    double v6 = [(PUOverOneUpPresentationSession *)self _assetCollectionsDataSourceForCurrentModalViewController];
    double v7 = [v6 assetCollectionsFetchResult];
    double v8 = [v6 assetCollectionsFetchResult];
    uint64_t v9 = [v8 count];

    int64_t v10 = 0;
    if (v9)
    {
      unint64_t v11 = 0;
      do
      {
        double v12 = [v7 objectAtIndex:v11];
        uint64_t v13 = [v6 assetsInAssetCollection:v12];
        v10 += [v13 count];

        ++v11;
        double v14 = [v6 assetCollectionsFetchResult];
        unint64_t v15 = [v14 count];
      }
      while (v11 < v15);
    }

    return v10;
  }
}

- (id)_assetCollectionsDataSourceForCurrentModalViewController
{
  uint64_t v3 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];

  if (v3)
  {
    id v4 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];
  }
  else
  {
    uint64_t v5 = [(PUOverOneUpPresentationSession *)self activitySharingController];

    if (v5)
    {
      id v4 = [(PUActivitySharingController *)self->_activitySharingController carouselViewController];
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (void)oneUpSharingAnimationController:(id)a3 setVisibility:(BOOL)a4 forAssetReference:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  double v8 = [(PUOverOneUpPresentationSession *)self viewController];
  id v9 = v8;
  if (v5) {
    [v8 oneUpAssetTransitionDidEnd:v7];
  }
  else {
    [v8 oneUpAssetTransitionWillBegin:v7];
  }
}

- (id)viewToHideWhilePresentingWithTransition:(id)a3
{
  BOOL v5 = [(PUOverOneUpPresentationSession *)self viewController];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v11 = (objc_class *)objc_opt_class();
      double v12 = NSStringFromClass(v11);
      uint64_t v13 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
      [v10 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 1001, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"self.viewController", v12, v13 object file lineNumber description];
    }
  }
  double v6 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];

  if (v6)
  {
    id v7 = [v5 chromeView];
  }
  else
  {
    id v7 = [(PUOverOneUpPresentationSession *)self activitySharingController];

    if (v7)
    {
      double v8 = [v5 navigationController];
      id v7 = [v8 toolbar];
    }
  }

  return v7;
}

- (id)photosSharingTransitionTransitioningView:(id)a3
{
  uint64_t v3 = [(PUOverOneUpPresentationSession *)self viewController];
  id v4 = [v3 view];
  BOOL v5 = [v4 superview];

  return v5;
}

- (void)photosSharingTransition:(id)a3 setVisibility:(BOOL)a4 forAssetReference:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  double v8 = [(PUOverOneUpPresentationSession *)self viewController];
  id v9 = v8;
  if (v5) {
    [v8 oneUpAssetTransitionDidEnd:v7];
  }
  else {
    [v8 oneUpAssetTransitionWillBegin:v7];
  }
}

- (CGPoint)photosSharingTransition:(id)a3 contentOffsetForAssetReference:(id)a4
{
  id v5 = a4;
  double v6 = [(PUOverOneUpPresentationSession *)self _assetCollectionsDataSourceForCurrentModalViewController];
  id v7 = [v5 indexPath];

  [(PUOverOneUpPresentationSession *)self _frameForItemAtIndexPath:v7 inAssetCollectionsDataSource:v6 allowZoom:0];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (id)photosSharingTransition:(id)a3 layoutForAssetReference:(id)a4
{
  id v4 = [[PUCollectionViewLayoutCache alloc] initWithProvider:self];
  return v4;
}

- (CGRect)_frameAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUOverOneUpPresentationSession *)self _tilingView];
  double v6 = [v5 layout];
  id v7 = [v6 layoutInfoForTileWithIndexPath:v4 kind:@"PUTileKindItemContent"];

  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v7 coordinateSystem];
  v17 = [v5 contentCoordinateSystem];
  double v18 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v16, v17, v9, v11);
  double v20 = v19;

  CGRect v21 = [(PUOverOneUpPresentationSession *)self viewController];
  CGRect v22 = [v21 view];
  objc_msgSend(v5, "convertRect:toView:", v22, v18, v20, v13, v15);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (CGRect)_frameForAssetReference:(id)a3
{
  id v5 = a3;
  double v6 = [(PUOverOneUpPresentationSession *)self _assetsDataSource];
  id v7 = [v5 indexPath];
  double v8 = [v6 assetAtIndexPath:v7];
  char v9 = [v8 isEqual:v5];

  double v10 = v5;
  if ((v9 & 1) == 0)
  {
    double v11 = [(PUOverOneUpPresentationSession *)self _assetsDataSource];
    double v10 = [v11 assetReferenceForAssetReference:v5];
  }
  double v12 = [(PUOverOneUpPresentationSession *)self _tilingView];
  double v13 = [v12 layout];
  if (!v13)
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2 object:self file:@"PUOverOneUpPresentationSession.m" lineNumber:941 description:@"Missing layout"];
  }
  double v14 = [v10 indexPath];
  double v15 = [v13 layoutInfoForTileWithIndexPath:v14 kind:@"PUTileKindItemContent"];

  if (v15)
  {
    [v15 frame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v24 = [v15 coordinateSystem];
    double v25 = [v12 contentCoordinateSystem];
    double v26 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v24, v25, v17, v19);
    double v28 = v27;

    double v29 = [(PUOverOneUpPresentationSession *)self viewController];
    double v30 = [v29 view];
    objc_msgSend(v12, "convertRect:toView:", v30, v26, v28, v21, v23);
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
  }
  else
  {
    double v32 = *MEMORY[0x1E4F1DB20];
    double v34 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v36 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v38 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v39 = v32;
  double v40 = v34;
  double v41 = v36;
  double v42 = v38;
  result.size.CGFloat height = v42;
  result.size.CGFloat width = v41;
  result.origin.CGFloat y = v40;
  result.origin.CGFloat x = v39;
  return result;
}

- (CGRect)_frameForItemAtIndexPath:(id)a3 inAssetCollectionsDataSource:(id)a4 allowZoom:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  double v11 = [v10 assetCollectionsFetchResult];
  double v12 = [(PUOverOneUpPresentationSession *)self _viewModel];
  double v13 = [v12 currentAssetReference];

  BOOL v68 = v5;
  if (v11 && (unint64_t v14 = [v11 count], v14 > objc_msgSend(v9, "section")))
  {
    double v15 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v9, "section"));
    double v16 = [v10 assetsInAssetCollection:v15];
  }
  else
  {
    double v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PUOverOneUpPresentationSession.m" lineNumber:889 description:@"No datasource or index out of bounds"];

    double v16 = 0;
    double v15 = 0;
  }
  unint64_t v18 = [v16 count];
  v69 = v11;
  v70 = v10;
  v71 = v15;
  if ([v9 item] >= v18)
  {
    double v23 = NSString;
    double v24 = [v15 uuid];
    double v19 = [v23 stringWithFormat:@"PUOverOneUpPresentationSession: IndexPath %@ does not exist in collection %@ with count %lu", v9, v24, v18];

    double v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PUOverOneUpPresentationSession.m" lineNumber:900 description:v19];
    double v25 = 0;
  }
  else
  {
    double v19 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v9, "item"));
    double v20 = [v13 indexPath];
    if (v20)
    {
      double v21 = [MEMORY[0x1E4F29128] UUID];
      double v22 = [v21 UUIDString];
    }
    else
    {
      double v22 = 0;
    }

    double v26 = [PUAssetReference alloc];
    double v27 = [v13 assetCollection];
    double v28 = [v13 indexPath];
    double v25 = [(PUAssetReference *)v26 initWithAsset:v19 assetCollection:v27 indexPath:v28 dataSourceIdentifier:v22];
  }
  double v29 = [(PUOverOneUpPresentationSession *)self activitySharingController];

  if (v29)
  {
    if (v25)
    {
      double v30 = [(PUOverOneUpPresentationSession *)self _assetsDataSource];
      double v31 = [v30 assetReferenceForAssetReference:v25];

      uint64_t v32 = [(PUOverOneUpPresentationSession *)self _globalIndexForAssetReference:v31];
      if (v31)
      {
        double v33 = [(PUAssetReference *)v31 asset];
        double v34 = [v13 asset];
        int v35 = [v33 isEqual:v34];

        double v25 = v31;
      }
      else
      {
        int v35 = 0;
        double v25 = 0;
      }
    }
    else
    {
      int v35 = 0;
      uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    double v36 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];

    int v35 = 1;
    uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
    if (v16 && v36)
    {
      double v37 = [v13 asset];
      uint64_t v38 = [v16 indexOfObject:v37];

      uint64_t v39 = [v9 item];
      uint64_t v32 = v39;
      int v35 = v38 == 0x7FFFFFFFFFFFFFFFLL || v39 == 0x7FFFFFFFFFFFFFFFLL || v39 == v38;
    }
  }
  double v42 = [(PUOverOneUpPresentationSession *)self viewController];
  v43 = [v42 view];
  [v43 frame];
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  CGFloat v51 = v50;

  if (!v25 || (v35 & v68 & 1) != 0)
  {
    [(PUOverOneUpPresentationSession *)self _frameForAssetReference:v13];
  }
  else
  {
    v52 = [(PUAssetReference *)v25 asset];
    double v53 = (double)(unint64_t)[v52 pixelWidth];
    v54 = [(PUAssetReference *)v25 asset];
    double v55 = (double)(unint64_t)[v54 pixelHeight];

    double v56 = PURectWithSizeThatFitsInRect(v53, v55, v45, v47, v49, v51);
  }
  double v60 = v57;
  double v61 = v58;
  double v62 = v59;
  double v63 = v56 + (double)v32 * v49;

  double v64 = v63;
  double v65 = v60;
  double v66 = v61;
  double v67 = v62;
  result.size.CGFloat height = v67;
  result.size.CGFloat width = v66;
  result.origin.CGFloat y = v65;
  result.origin.CGFloat x = v64;
  return result;
}

- (void)_activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PUOverOneUpPresentationSession *)self activitySharingController];

  if (!v10)
  {
    unint64_t v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "didCompleteWithActivityType: was called whereas self.activitySharingController == nil.", buf, 2u);
    }
    goto LABEL_11;
  }
  if (v5)
  {
    [(PUOverOneUpPresentationSession *)self setActivitySharingController:0];
    double v11 = [(PUOverOneUpPresentationSession *)self activitySharingControllerDelegate];
    [v8 setDelegate:v11];
    [(PUOverOneUpPresentationSession *)self setActivitySharingControllerDelegate:0];
    if (([v9 isEqualToString:*MEMORY[0x1E4F90A10]] & 1) != 0
      || ([v9 isEqualToString:*MEMORY[0x1E4F909D0]] & 1) != 0
      || ([v9 isEqualToString:*MEMORY[0x1E4F90A60]] & 1) != 0
      || [v9 isEqualToString:*MEMORY[0x1E4F90B10]])
    {
      double v12 = [v8 selectedAssetsByAssetCollection];
    }
    else
    {
      double v12 = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __97__PUOverOneUpPresentationSession__activitySharingController_didCompleteWithActivityType_success___block_invoke;
    v15[3] = &unk_1E5F2C960;
    v15[4] = self;
    id v16 = v8;
    id v17 = v11;
    id v18 = v9;
    id v19 = v12;
    id v13 = v12;
    unint64_t v14 = v11;
    [(PUOverOneUpPresentationSession *)self _prepareForActivitySharingControllerDismiss:v16 completionHandler:v15];

LABEL_11:
  }
}

void __97__PUOverOneUpPresentationSession__activitySharingController_didCompleteWithActivityType_success___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) activityViewControllerIfAvailable];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __97__PUOverOneUpPresentationSession__activitySharingController_didCompleteWithActivityType_success___block_invoke_2;
  v6[3] = &unk_1E5F2D098;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  [v2 dismissViewController:v3 animated:1 completionHandler:v6];
}

void __97__PUOverOneUpPresentationSession__activitySharingController_didCompleteWithActivityType_success___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) sharingActionPerformer];
    [v2 performActionWithActivityType:*(void *)(a1 + 48) assetsByAssetCollection:*(void *)(a1 + 56)];
  }
}

- (void)_activitySharingControllerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUOverOneUpPresentationSession *)self activitySharingControllerDelegate];
  [v4 setDelegate:v5];

  [(PUOverOneUpPresentationSession *)self setActivitySharingControllerDelegate:0];
  [(PUOverOneUpPresentationSession *)self setActivitySharingController:0];
  [(PUOverOneUpPresentationSession *)self _finishOverOneUpPresentationSessionDismissForced:0 animated:1];
}

- (void)_activitySharingControllerWillDismissActivityViewController:(id)a3
{
}

- (void)_prepareForActivitySharingControllerDismiss:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = [a3 currentAsset];
  uint64_t v8 = [(PUOverOneUpPresentationSession *)self _assetReferenceFromAsset:v7 hintIndexPath:0 hintCollection:0];

  id v9 = +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__PUOverOneUpPresentationSession__prepareForActivitySharingControllerDismiss_completionHandler___block_invoke;
  v11[3] = &unk_1E5F2DB20;
  id v12 = v6;
  id v10 = v6;
  [(PUOverOneUpPresentationSession *)self _performNavigationRequestForAssetDisplayDescriptor:v9 completionHandler:v11];
}

uint64_t __96__PUOverOneUpPresentationSession__prepareForActivitySharingControllerDismiss_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  double v11 = [(PUOverOneUpPresentationSession *)self activitySharingControllerDelegate];
  [v11 activitySharingController:v9 didCompleteWithActivityType:v10 success:v5];

  id v17 = v9;
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v15 = (objc_class *)objc_opt_class();
    unint64_t v14 = NSStringFromClass(v15);
    id v16 = objc_msgSend(v17, "px_descriptionForAssertionMessage");
    [v12 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 814, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController", v14, v16 object file lineNumber description];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = (objc_class *)objc_opt_class();
    unint64_t v14 = NSStringFromClass(v13);
    [v12 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 814, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController", v14 object file lineNumber description];
  }

LABEL_3:
  [(PUOverOneUpPresentationSession *)self _activitySharingController:v17 didCompleteWithActivityType:v10 success:v5];
}

- (void)activitySharingControllerWillDismissActivityViewController:(id)a3
{
  id v5 = a3;
  id v6 = [(PUOverOneUpPresentationSession *)self activitySharingControllerDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(PUOverOneUpPresentationSession *)self activitySharingControllerDelegate];
    [v8 activitySharingControllerWillDismissActivityViewController:v5];
  }
  id v14 = v5;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v12);
    id v13 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 807, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController", v11, v13 object file lineNumber description];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 807, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController", v11 object file lineNumber description];
  }

LABEL_5:
  [(PUOverOneUpPresentationSession *)self _activitySharingControllerWillDismissActivityViewController:v14];
}

- (void)activitySharingControllerDidCancel:(id)a3
{
  id v5 = a3;
  id v6 = [(PUOverOneUpPresentationSession *)self activitySharingControllerDelegate];
  [v6 activitySharingControllerDidCancel:v5];

  id v12 = v5;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v10);
    double v11 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 798, @"%@ should be an instance inheriting from %@, but it is %@", @"activitySharingController", v9, v11 object file lineNumber description];
  }
  else
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 798, @"%@ should be an instance inheriting from %@, but it is nil", @"activitySharingController", v9 object file lineNumber description];
  }

LABEL_3:
  [(PUOverOneUpPresentationSession *)self _activitySharingControllerDidCancel:v12];
}

- (void)_finalizeAvalancheReviewControllerDismiss
{
  uint64_t v3 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];
  [v3 setDelegate:0];

  [(PUOverOneUpPresentationSession *)self _setAvalancheReviewController:0];
}

- (void)avalancheReviewControllerDidComplete:(id)a3 animated:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_animated___block_invoke;
  v4[3] = &unk_1E5F2ED10;
  v4[4] = self;
  [(PUOverOneUpPresentationSession *)self dismissViewController:a3 animated:a4 completionHandler:v4];
}

uint64_t __80__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finalizeAvalancheReviewControllerDismiss];
}

- (void)avalancheReviewControllerDidComplete:(id)a3 withAsset:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = [(PUOverOneUpPresentationSession *)self _assetReferenceFromAsset:a4 hintIndexPath:0 hintCollection:0];
  id v10 = +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_withAsset_animated___block_invoke;
  v12[3] = &unk_1E5F282A8;
  v12[4] = self;
  id v13 = v8;
  BOOL v14 = a5;
  id v11 = v8;
  [(PUOverOneUpPresentationSession *)self _performNavigationRequestForAssetDisplayDescriptor:v10 completionHandler:v12];
}

uint64_t __90__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_withAsset_animated___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __90__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_withAsset_animated___block_invoke_2;
  v5[3] = &unk_1E5F2ED10;
  v5[4] = v2;
  return [v2 dismissViewController:v1 animated:v3 completionHandler:v5];
}

uint64_t __90__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_withAsset_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finalizeAvalancheReviewControllerDismiss];
}

- (void)funEffectsViewController:(id)a3 didSaveAsset:(id)a4 withCompletion:(unint64_t)a5
{
  char v7 = [(PUOverOneUpPresentationSession *)self _funEffectsViewController];
  switch(a5)
  {
    case 5uLL:
      if (!self->_barsDelegateFlags.respondsToDidAppendReviewScreenAction) {
        goto LABEL_11;
      }
      id v12 = v7;
      id v8 = [(PUOverOneUpPresentationSession *)self barsDelegate];
      id v9 = v8;
      id v10 = self;
      uint64_t v11 = 1;
      break;
    case 4uLL:
      if (!self->_barsDelegateFlags.respondsToDidAppendReviewScreenAction) {
        goto LABEL_11;
      }
      id v12 = v7;
      id v8 = [(PUOverOneUpPresentationSession *)self barsDelegate];
      id v9 = v8;
      id v10 = self;
      uint64_t v11 = 0;
      break;
    case 3uLL:
      id v12 = v7;
      [(PUOverOneUpPresentationSession *)self dismissViewController:v7 animated:1 completionHandler:0];
      [v12 unregisterObserver:self];
      [(PUOverOneUpPresentationSession *)self _setFunEffectsViewController:0];
      goto LABEL_10;
    default:
      goto LABEL_11;
  }
  [v8 overOneUpPresentationSession:v10 didAppendReviewScreenAction:v11];

LABEL_10:
  char v7 = v12;
LABEL_11:
}

- (void)photoMarkupController:(id)a3 didFinishWithSavedAsset:(id)a4
{
  id v5 = a3;
  id v6 = [v5 reviewAsset];
  char v7 = [(PUOverOneUpPresentationSession *)self _assetReferenceFromAsset:v6 hintIndexPath:0 hintCollection:0];
  id v8 = +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:v7];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __80__PUOverOneUpPresentationSession_photoMarkupController_didFinishWithSavedAsset___block_invoke;
  id v13 = &unk_1E5F2D4B8;
  BOOL v14 = self;
  id v15 = v5;
  id v9 = v5;
  [(PUOverOneUpPresentationSession *)self _performNavigationRequestForAssetDisplayDescriptor:v8 completionHandler:&v10];
  objc_msgSend(v9, "unregisterObserver:", self, v10, v11, v12, v13, v14);
}

uint64_t __80__PUOverOneUpPresentationSession_photoMarkupController_didFinishWithSavedAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewController:*(void *)(a1 + 40) animated:1 completionHandler:0];
}

- (void)editController:(id)a3 didFinishPreparingForTransitionAfterEditingVideo:(id)a4 modificationDate:(id)a5 seekTime:(id *)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = [(PUOverOneUpPresentationSession *)self _assetReferenceFromAsset:a4 hintIndexPath:0 hintCollection:0];
  id v13 = [PUAssetDisplayDescriptor alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf = *a6;
  BOOL v14 = [(PUAssetDisplayDescriptor *)v13 initWithAssetReference:v12 modifiedAfterDate:v11 videoSeekTime:&buf];

  id v15 = [(PUOverOneUpPresentationSession *)self viewController];
  id v16 = [v15 navigationController];
  id v17 = [v16 presentingViewController];
  id v18 = [v17 parentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = [v18 tabBar];
    [v19 setHidden:0];
  }
  double v20 = PLOneUpGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.var0) = 138412546;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v14;
    LOWORD(buf.var2) = 2112;
    *(void *)((char *)&buf.var2 + 2) = v18;
    _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_DEBUG, "Preparing to perform dismiss Edit for displayDescriptor: %@, parentController: %@", (uint8_t *)&buf, 0x16u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __124__PUOverOneUpPresentationSession_editController_didFinishPreparingForTransitionAfterEditingVideo_modificationDate_seekTime___block_invoke;
  v22[3] = &unk_1E5F2D4B8;
  v22[4] = self;
  id v23 = v10;
  id v21 = v10;
  [(PUOverOneUpPresentationSession *)self _performNavigationRequestForAssetDisplayDescriptor:v14 completionHandler:v22];
}

void __124__PUOverOneUpPresentationSession_editController_didFinishPreparingForTransitionAfterEditingVideo_modificationDate_seekTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLOneUpGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    char v7 = [NSNumber numberWithBool:a2];
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "Performing dismiss Edit with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) dismissViewController:*(void *)(a1 + 40) animated:1 completionHandler:0];
}

- (void)editController:(id)a3 didFinishPreparingForTransitionAfterEditingPhoto:(id)a4
{
  id v6 = a3;
  char v7 = [(PUOverOneUpPresentationSession *)self _assetReferenceFromAsset:a4 hintIndexPath:0 hintCollection:0];
  int v8 = +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:v7];
  id v9 = [(PUOverOneUpPresentationSession *)self viewController];
  __int16 v10 = [v9 navigationController];
  id v11 = [v10 presentingViewController];
  uint64_t v12 = [v11 parentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [v12 tabBar];
    [v13 setHidden:0];
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__PUOverOneUpPresentationSession_editController_didFinishPreparingForTransitionAfterEditingPhoto___block_invoke;
  v15[3] = &unk_1E5F2D4B8;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [(PUOverOneUpPresentationSession *)self _performNavigationRequestForAssetDisplayDescriptor:v8 completionHandler:v15];
}

uint64_t __98__PUOverOneUpPresentationSession_editController_didFinishPreparingForTransitionAfterEditingPhoto___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewController:*(void *)(a1 + 40) animated:1 completionHandler:0];
}

- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4
{
  id v6 = a3;
  char v7 = [a4 firstObject];
  int v8 = [(PUOverOneUpPresentationSession *)self _assetReferenceFromAsset:v7 hintIndexPath:0 hintCollection:0];
  id v9 = +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__PUOverOneUpPresentationSession_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke;
  v11[3] = &unk_1E5F2D4B8;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(PUOverOneUpPresentationSession *)self _performNavigationRequestForAssetDisplayDescriptor:v9 completionHandler:v11];
}

uint64_t __85__PUOverOneUpPresentationSession_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewController:*(void *)(a1 + 40) animated:1 completionHandler:0];
}

- (void)_performNavigationRequestForAssetDisplayDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 dateWithTimeIntervalSinceNow:2.0];
  id v9 = [(PUOverOneUpPresentationSession *)self viewController];
  [v9 navigateToAssetDisplayDescriptor:v8 beforeDate:v10 completionHandler:v7];
}

- (id)_assetReferenceFromAsset:(id)a3 hintIndexPath:(id)a4 hintCollection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = v9;
    id v12 = v10;
    if (!v11)
    {
      id v11 = [(PUOverOneUpPresentationSession *)self _stashedAssetReference];

      if (v11)
      {
        id v13 = [(PUOverOneUpPresentationSession *)self _stashedAssetReference];
        id v11 = [v13 indexPath];
      }
    }
    if (!v12)
    {
      id v12 = [(PUOverOneUpPresentationSession *)self _stashedAssetReference];

      if (v12)
      {
        id v14 = [(PUOverOneUpPresentationSession *)self _stashedAssetReference];
        id v12 = [v14 assetCollection];
      }
    }
    id v15 = [MEMORY[0x1E4F29128] UUID];
    id v16 = [v15 UUIDString];

    id v17 = [[PUAssetReference alloc] initWithAsset:v8 assetCollection:v12 indexPath:v11 dataSourceIdentifier:v16];
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PUOverOneUpPresentationSession *)self _invalidatePresentedViewControllers];
  [(PUOverOneUpPresentationSession *)self _updatePresentedViewControllersIfNeeded];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(PUOverOneUpPresentationSession *)self _presentedViewControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v6)
  {
    int v9 = 1;
    goto LABEL_16;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v15;
  int v9 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      int v12 = [v11 conformsToProtocol:&unk_1F07DFE40];
      if ((v9 & v12) == 1)
      {
        int v9 = [v11 prepareForDismissingForced:v3];
        if (v9) {
          continue;
        }
      }
      else
      {
        v9 &= v12 ^ 1;
        if (v9) {
          continue;
        }
      }
      if (!v3)
      {
        int v9 = 0;
        goto LABEL_16;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_16:

  [(PUOverOneUpPresentationSession *)self _finishOverOneUpPresentationSessionDismissForced:v9 | v3 animated:0];
  return v9;
}

- (void)_removeViewController:(id)a3
{
  id v10 = a3;
  id v4 = [(PUOverOneUpPresentationSession *)self _photoMarkupViewController];

  if (v4 == v10)
  {
    [(PUOverOneUpPresentationSession *)self _setPhotoMarkupViewController:0];
  }
  else
  {
    id v5 = [(PUOverOneUpPresentationSession *)self _funEffectsViewController];

    if (v5 == v10)
    {
      [(PUOverOneUpPresentationSession *)self _setFunEffectsViewController:0];
    }
    else
    {
      id v6 = [(PUOverOneUpPresentationSession *)self _slideshowViewController];

      if (v6 == v10)
      {
        [(PUOverOneUpPresentationSession *)self _setSlideshowViewController:0];
      }
      else
      {
        id v7 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];

        if (v7 == v10)
        {
          [(PUOverOneUpPresentationSession *)self _setAvalancheReviewController:0];
        }
        else
        {
          id v8 = [(PUOverOneUpPresentationSession *)self _editViewController];

          int v9 = v10;
          if (v8 != v10) {
            goto LABEL_12;
          }
          [(PUOverOneUpPresentationSession *)self _setEditViewController:0];
        }
      }
    }
  }
  int v9 = v10;
LABEL_12:
}

- (BOOL)_popToOneUpFromViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PUOverOneUpPresentationSession *)self viewController];
  id v8 = [v7 navigationController];
  int v9 = [v8 viewControllers];
  uint64_t v10 = [v9 indexOfObject:v7];
  char v11 = [v9 containsObject:v6];
  if (v8) {
    BOOL v12 = v10 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    char v13 = 1;
  }
  else {
    char v13 = v11 ^ 1;
  }
  if ((v13 & 1) == 0)
  {
    BOOL v20 = v4;
    long long v14 = objc_msgSend(v9, "px_subarrayAfterIndex:", v10);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          [(PUOverOneUpPresentationSession *)self _removeViewController:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }
    objc_msgSend(v8, "pu_popToViewController:animated:interactive:", v7, v20, 0);
  }
  return v13 ^ 1;
}

- (BOOL)_dismissAvalancheReviewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(PUOverOneUpPresentationSession *)self viewController];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__PUOverOneUpPresentationSession__dismissAvalancheReviewController_animated_completionHandler___block_invoke;
  v11[3] = &unk_1E5F2EA60;
  void v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  objc_msgSend(v8, "pu_dismissViewControllerAnimated:interactive:completion:", v5, 0, v11);

  return 1;
}

uint64_t __95__PUOverOneUpPresentationSession__dismissAvalancheReviewController_animated_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _finalizeAvalancheReviewControllerDismiss];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)_dismissActivityViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__PUOverOneUpPresentationSession__dismissActivityViewController_animated_completionHandler___block_invoke;
  v11[3] = &unk_1E5F2EA60;
  void v11[4] = self;
  id v12 = v8;
  id v9 = v8;
  objc_msgSend(a3, "pu_dismissViewControllerAnimated:interactive:completion:", v5, 0, v11);

  return 1;
}

uint64_t __92__PUOverOneUpPresentationSession__dismissActivityViewController_animated_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) activitySharingControllerDelegate];
  BOOL v3 = [*(id *)(a1 + 32) activitySharingController];
  [v3 setDelegate:v2];

  [*(id *)(a1 + 32) setActivitySharingControllerDelegate:0];
  [*(id *)(a1 + 32) setActivitySharingController:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (BOOL)_dismissFunEffectsViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = (void (**)(void))a5;
  id v9 = a3;
  [(PUOverOneUpPresentationSession *)self _setFunEffectsViewController:0];
  BOOL v10 = [(PUOverOneUpPresentationSession *)self _popToOneUpFromViewController:v9 animated:v5];

  if (v8) {
    v8[2](v8);
  }

  return v10;
}

- (BOOL)_dismissPhotoMarkupViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  BOOL v10 = [(PUOverOneUpPresentationSession *)self viewController];
  char v11 = [v10 navigationController];
  [(PUOverOneUpPresentationSession *)self _setPhotoMarkupViewController:0];
  id v12 = [v11 presentedViewController];

  if (v12 == v8)
  {
    BOOL v13 = 1;
    [v11 dismissViewControllerAnimated:1 completion:0];
    if (!v9) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  BOOL v13 = [(PUOverOneUpPresentationSession *)self _popToOneUpFromViewController:v8 animated:v6];
  if (v9) {
LABEL_3:
  }
    v9[2](v9);
LABEL_4:

  return v13;
}

- (BOOL)_dismissEditViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(void))a5;
  BOOL v9 = [(PUOverOneUpPresentationSession *)self _popToOneUpFromViewController:a3 animated:v5];
  [(PUOverOneUpPresentationSession *)self _setEditViewController:0];
  if (v8) {
    v8[2](v8);
  }
  BOOL v10 = PLOneUpGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    char v11 = [NSNumber numberWithBool:v9];
    int v13 = 138412290;
    long long v14 = v11;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEBUG, "Actually dismissed Edit VC success? %@", (uint8_t *)&v13, 0xCu);
  }
  return v9;
}

- (BOOL)_dismissSlideshowViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  return 1;
}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PUOverOneUpPresentationSession_dismissViewController_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5F29240;
  id v10 = v9;
  id v22 = v10;
  objc_copyWeak(&v23, &location);
  char v11 = (void (**)(void))_Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v12 = [(PUOverOneUpPresentationSession *)self _dismissPhotoMarkupViewController:v8 animated:v6 completionHandler:v11];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v12 = [(PUOverOneUpPresentationSession *)self _dismissFunEffectsViewController:v8 animated:v6 completionHandler:v11];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v12 = [(PUOverOneUpPresentationSession *)self _dismissSlideshowViewController:v8 animated:v6 completionHandler:v11];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v12 = [(PUOverOneUpPresentationSession *)self _dismissAvalancheReviewController:v8 animated:v6 completionHandler:v11];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(PUOverOneUpPresentationSession *)self _dismissEditViewController:v8 animated:v6 completionHandler:v11])
    {
      goto LABEL_17;
    }
    id v18 = PLOneUpGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [v8 presentingViewController];
      BOOL v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "modalPresentationStyle"));
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 138412802;
      id v26 = v8;
      __int16 v27 = 2112;
      double v28 = v19;
      __int16 v29 = 2112;
      double v30 = v20;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_ERROR, "Failed to dismiss view controller: %@. presentingVC: %@, modalPresentationStyle: %@", buf, 0x20u);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v12 = [(PUOverOneUpPresentationSession *)self _dismissActivityViewController:v8 animated:v6 completionHandler:v11];
LABEL_9:
      if (v12) {
        goto LABEL_17;
      }
    }
  }
  int v13 = [v8 presentingViewController];
  BOOL v14 = v13 == 0;

  if (!v14)
  {
    if ([v8 modalPresentationStyle] != 7)
    {
      uint64_t v17 = [(PUOverOneUpPresentationSession *)self viewController];
      [v17 dismissViewControllerAnimated:v6 completion:v11];

      goto LABEL_17;
    }
    uint64_t v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(PUOverOneUpPresentationSession *)self viewController];
      *(_DWORD *)$3CC8671D27C23BF42ADDB32F2B5E48AE buf = 138412546;
      id v26 = v8;
      __int16 v27 = 2112;
      double v28 = v16;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "can't dismiss %@ from presumed presenting view controller %@", buf, 0x16u);
    }
  }
  v11[2](v11);
LABEL_17:

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __83__PUOverOneUpPresentationSession_dismissViewController_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishOverOneUpPresentationSessionDismissForced:0 animated:0];
}

- (BOOL)_presentScreenRoutePickerViewController:(id)a3
{
  id v4 = a3;
  if (self->_barsDelegateFlags.respondsToBarButtonItem)
  {
    BOOL v5 = [(PUOverOneUpPresentationSession *)self barsDelegate];
    BOOL v6 = [v5 overOneUpPresentationSession:self barButtonItemForActivityType:*MEMORY[0x1E4F90948]];
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = [v4 popoverPresentationController];
  [v7 setBarButtonItem:v6];

  id v8 = [(PUOverOneUpPresentationSession *)self viewController];
  [v8 presentViewController:v4 animated:1 completion:0];

  return 1;
}

- (BOOL)_presentSlideshowViewController:(id)a3
{
  id v4 = a3;
  [(PUOverOneUpPresentationSession *)self _setSlideshowViewController:v4];
  [v4 setDelegate:self];
  BOOL v5 = [[PUSlideshowNavigationController alloc] initWithRootViewController:v4];

  [(PUSlideshowNavigationController *)v5 setModalTransitionStyle:2];
  BOOL v6 = [(PUOverOneUpPresentationSession *)self viewController];
  [v6 presentViewController:v5 animated:1 completion:0];

  return 1;
}

- (BOOL)_presentAvalancheReviewController:(id)a3
{
  id v5 = a3;
  [(PUOverOneUpPresentationSession *)self _setAvalancheReviewController:v5];
  [v5 setDelegate:self];
  BOOL v6 = [[PUNavigationController alloc] initWithNavigationBarClass:0 toolbarClass:objc_opt_class()];
  [(PUNavigationController *)v6 pushViewController:v5 animated:0];

  [(PUNavigationController *)v6 setModalPresentationStyle:0];
  id v7 = [(PUOverOneUpPresentationSession *)self _viewModel];
  id v8 = [v7 currentAssetReference];

  id v9 = [v8 asset];
  uint64_t v10 = [v9 burstIdentifier];
  if (!v10)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"PUOverOneUpPresentationSession.m" lineNumber:407 description:@"Current asset must have an avalanche UUID"];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F8A6B8]);
  BOOL v12 = [v9 photoLibrary];
  int v13 = [v12 mainQueueConcurrencyPhotoLibrary];
  BOOL v14 = (void *)[v11 initWithUUID:v10 photoLibrary:v13];

  uint64_t v15 = objc_msgSend(v9, "pl_managedAsset");
  double v36 = v14;
  uint64_t v16 = [v14 assets];
  int v35 = (void *)v15;
  uint64_t v17 = [v16 indexOfObject:v15];

  double v34 = (void *)v10;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"PUOverOneUpPresentationSession.m" lineNumber:412 description:@"expect asset"];
  }
  id v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v17 inSection:0];
  uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
  BOOL v20 = [v19 UUIDString];

  long long v21 = [PUAssetReference alloc];
  id v22 = [v8 asset];
  id v23 = [v8 assetCollection];
  long long v24 = [(PUAssetReference *)v21 initWithAsset:v22 assetCollection:v23 indexPath:v18 dataSourceIdentifier:v20];

  uint64_t v25 = objc_alloc_init(PUOneUpPhotosSharingTransitionContext);
  id v26 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];
  [(PUPhotosSharingTransitionContext *)v25 setAssetCollectionsDataSource:v26];

  [(PUOneUpPhotosSharingTransitionContext *)v25 setCurrentAssetReference:v24];
  __int16 v27 = [(PUViewControllerTransition *)[PUOneUpPhotosSharingTransition alloc] initWithDuration:0.300000012];
  double v28 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];
  [(PUOneUpPhotosSharingTransition *)v27 setSharingTransitionViewController:v28];

  __int16 v29 = [(PUOverOneUpPresentationSession *)self viewController];
  [(PUOneUpPhotosSharingTransition *)v27 setPresentingViewController:v29];

  [(PUOneUpPhotosSharingTransition *)v27 setOneUpPhotosSharingTransitionContext:v25];
  [(PUOneUpPhotosSharingTransition *)v27 setDelegate:self];
  double v30 = [(PUOverOneUpPresentationSession *)self viewController];
  objc_msgSend(v30, "pu_presentViewController:transition:animated:interactive:completion:", v6, v27, 1, 0, 0);

  return 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  BOOL v6 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3, a4, a5);
  uint64_t v7 = [v6 userInterfaceIdiom];

  id v8 = [MEMORY[0x1E4F906A0] sharedInstance];
  int v9 = [v8 enableOneUpAnimation];

  if (v9) {
    BOOL v10 = v7 == 1;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v16 = 0;
  }
  else
  {
    id v11 = [(PUOverOneUpPresentationSession *)self _viewModel];
    BOOL v12 = [v11 currentAssetReference];

    int v13 = objc_alloc_init(PUOneUpPhotosSharingTransitionContext);
    [(PUOneUpPhotosSharingTransitionContext *)v13 setCurrentAssetReference:v12];
    BOOL v14 = [PUOneUpSharingAnimationController alloc];
    uint64_t v15 = [(PUOverOneUpPresentationSession *)self viewController];
    uint64_t v16 = [(PUOneUpSharingAnimationController *)v14 initWithTransitionContext:v13 presentingViewController:v15];

    [(PUOneUpSharingAnimationController *)v16 setDelegate:self];
  }
  return v16;
}

- (BOOL)_presentActivityViewController:(id)a3
{
  id v5 = a3;
  BOOL v6 = [v5 activitySharingController];
  if (!v6)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUOverOneUpPresentationSession.m", 361, @"Invalid parameter not satisfying: %@", @"activitySharingController" object file lineNumber description];
  }
  objc_storeStrong((id *)&self->_activitySharingController, v6);
  uint64_t v7 = [v6 delegate];
  objc_storeWeak((id *)&self->_activitySharingControllerDelegate, v7);

  [v6 setDelegate:self];
  if (pptAfterPresentationCompletion)
  {
    id v8 = (void *)[(id)pptAfterPresentationCompletion copy];
    objc_msgSend(v5, "setPpt_readyToInteractHandler:", v8);

    int v9 = (void *)pptAfterPresentationCompletion;
    pptAfterPresentationCompletion = 0;
  }
  [v5 setTransitioningDelegate:self];
  BOOL v10 = [(PUOverOneUpPresentationSession *)self viewController];
  [v10 presentViewController:v5 animated:1 completion:0];

  return 1;
}

- (BOOL)_presentFunEffectsViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 registerObserver:self];
  [(PUOverOneUpPresentationSession *)self _setFunEffectsViewController:v6];
  uint64_t v7 = objc_alloc_init(PUCrossfadeNavigationTransition);
  id v8 = [(PUOverOneUpPresentationSession *)self viewController];
  int v9 = [v8 navigationController];
  objc_msgSend(v9, "pu_pushViewController:withTransition:animated:isInteractive:", v6, v7, v4, 0);

  return 1;
}

- (BOOL)_presentPhotoMarkupViewController:(id)a3
{
  id v4 = a3;
  [(PUOverOneUpPresentationSession *)self _setPhotoMarkupViewController:v4];
  [v4 registerObserver:self];
  id v5 = [(PUOverOneUpPresentationSession *)self viewController];
  id v6 = [v5 navigationController];

  if ([v6 isNavigationBarHidden])
  {
    uint64_t v7 = objc_alloc_init(PUCrossfadeNavigationTransition);
    id v8 = [(PUOverOneUpPresentationSession *)self _funEffectsViewController];

    if (v8)
    {
      int v9 = [(PUOverOneUpPresentationSession *)self viewController];
      [(PUNavigationTransition *)v7 setExpectedDestinationOnPop:v9];
    }
    objc_msgSend(v6, "pu_pushViewController:withTransition:animated:isInteractive:", v4, v7, 1, 0);
  }
  else
  {
    uint64_t v7 = objc_alloc_init(PUCrossfadeModalTransition);
    objc_msgSend(v6, "pu_presentViewController:transition:animated:interactive:completion:", v4, v7, 1, 0, 0);
  }

  return 1;
}

- (BOOL)_presentEditViewController:(id)a3
{
  id v4 = a3;
  [(PUOverOneUpPresentationSession *)self _setEditViewController:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setPresentationDelegate:self];
  }
  id v5 = objc_alloc_init(PUOneUpAssetNavigationTransition);
  id v6 = [(PUOverOneUpPresentationSession *)self viewController];
  uint64_t v7 = [v6 navigationController];
  id v8 = [v7 presentingViewController];
  int v9 = [v8 parentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v10 = [v9 tabBar];
    [v10 setHidden:1];
  }
  id v11 = [(PUOverOneUpPresentationSession *)self _funEffectsViewController];

  if (v11)
  {
    BOOL v12 = [(PUOverOneUpPresentationSession *)self viewController];
    [(PUNavigationTransition *)v5 setExpectedDestinationOnPop:v12];
  }
  int v13 = [(PUOverOneUpPresentationSession *)self viewController];
  BOOL v14 = [v13 navigationController];
  objc_msgSend(v14, "pu_pushViewController:withTransition:animated:isInteractive:", v4, v5, 1, 0);

  return 1;
}

- (BOOL)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!self->_delegateFlags.respondsToIsReady
    || ([(PUOverOneUpPresentationSession *)self delegate],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 overOneUpPresentationSessionPresentingViewControllerIsReady:self],
        v7,
        v8))
  {
    int v9 = [(PUOverOneUpPresentationSession *)self _viewModel];
    BOOL v10 = [v9 currentAssetReference];

    id v11 = (void *)[v10 copy];
    [(PUOverOneUpPresentationSession *)self _setStashedAssetReference:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![(PUOverOneUpPresentationSession *)self _presentPhotoMarkupViewController:v6])
      {
LABEL_26:
        int v13 = [(PUOverOneUpPresentationSession *)self viewController];
        [v13 presentViewController:v6 animated:v4 completion:0];
        BOOL v12 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![(PUOverOneUpPresentationSession *)self _presentFunEffectsViewController:v6 animated:v4])goto LABEL_26; {
      }
        }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (![(PUOverOneUpPresentationSession *)self _presentAvalancheReviewController:v6])goto LABEL_26; {
        }
          }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (![(PUOverOneUpPresentationSession *)self _presentSlideshowViewController:v6])goto LABEL_26; {
          }
            }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (![(PUOverOneUpPresentationSession *)self _presentScreenRoutePickerViewController:v6])goto LABEL_26; {
            }
              }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if (![(PUOverOneUpPresentationSession *)self _presentEditViewController:v6])goto LABEL_26; {
              }
                }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || ![(PUOverOneUpPresentationSession *)self _presentActivityViewController:v6])
                {
                  goto LABEL_26;
                }
              }
            }
          }
        }
      }
    }
    if (!self->_delegateFlags.respondsToDidPresent)
    {
      BOOL v12 = 1;
      goto LABEL_28;
    }
    int v13 = [(PUOverOneUpPresentationSession *)self delegate];
    [v13 overOneUpPresentationSession:self didPresent:v6];
    BOOL v12 = 1;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  BOOL v12 = 0;
LABEL_29:

  return v12;
}

- (id)_currentTileController
{
  BOOL v3 = [(PUOverOneUpPresentationSession *)self _viewModel];
  uint64_t v4 = [(PUOverOneUpPresentationSession *)self _tilingView];
  id v5 = (void *)v4;
  id v6 = 0;
  if (v3 && v4)
  {
    uint64_t v7 = [v3 currentAssetReference];
    int v8 = [v7 indexPath];
    int v9 = [v7 dataSourceIdentifier];
    BOOL v10 = [v5 presentedTileControllerWithIndexPath:v8 kind:@"PUTileKindItemContent" dataSourceIdentifier:v9];

    id v6 = v10;
  }

  return v6;
}

- (id)_assetsDataSource
{
  uint64_t v2 = [(PUOverOneUpPresentationSession *)self _viewModel];
  BOOL v3 = [v2 assetsDataSource];

  return v3;
}

- (id)_viewModel
{
  if (self->_delegateFlags.respondsToBrowsingViewModel)
  {
    BOOL v3 = [(PUOverOneUpPresentationSession *)self delegate];
    uint64_t v4 = [v3 overOneUpPresentationSessionBrowserViewModel:self];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)_tilingView
{
  if (self->_delegateFlags.respondsToTilingView)
  {
    BOOL v3 = [(PUOverOneUpPresentationSession *)self delegate];
    uint64_t v4 = [v3 overOneUpPresentationSessionTilingView:self];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)viewController
{
  if (self->_delegateFlags.respondsToViewController)
  {
    BOOL v3 = [(PUOverOneUpPresentationSession *)self delegate];
    uint64_t v4 = [v3 overOneUpPresentationSessionViewController:self];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)_finishOverOneUpPresentationSessionDismissForced:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(PUOverOneUpPresentationSession *)self _invalidatePresentedViewControllers];
  [(PUOverOneUpPresentationSession *)self _updatePresentedViewControllersIfNeeded];
  if (![(PUOverOneUpPresentationSession *)self isPresentingAnOverOneUpViewController]|| v5)
  {
    uint64_t v7 = [(PUOverOneUpPresentationSession *)self _presentedViewControllers];
    if ([v7 count])
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v15 != v11) {
              objc_enumerationMutation(v8);
            }
            -[PUOverOneUpPresentationSession dismissViewController:animated:completionHandler:](self, "dismissViewController:animated:completionHandler:", *(void *)(*((void *)&v14 + 1) + 8 * i), v4, 0, (void)v14);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v10);
      }
    }
    if (self->_delegateFlags.respondsToDidFinish)
    {
      int v13 = [(PUOverOneUpPresentationSession *)self delegate];
      [v13 overOneUpPresentationSessionDidFinish:self];
    }
  }
}

- (BOOL)isPresentingAnOverOneUpViewController
{
  uint64_t v2 = [(PUOverOneUpPresentationSession *)self _presentedViewControllers];
  BOOL v3 = [v2 anyObject];

  return v3 != 0;
}

- (void)_updatePresentedViewControllersIfNeeded
{
  if ([(PUOverOneUpPresentationSession *)self _needsUpdatePresentedViewControllers])
  {
    [(PUOverOneUpPresentationSession *)self _setNeedsUpdatePresentedViewControllers:0];
    id v13 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    BOOL v3 = [(PUOverOneUpPresentationSession *)self _slideshowViewController];

    if (v3)
    {
      BOOL v4 = [(PUOverOneUpPresentationSession *)self _slideshowViewController];
      [v13 addObject:v4];
    }
    BOOL v5 = [(PUOverOneUpPresentationSession *)self _editViewController];

    if (v5)
    {
      id v6 = [(PUOverOneUpPresentationSession *)self _editViewController];
      [v13 addObject:v6];
    }
    uint64_t v7 = [(PUOverOneUpPresentationSession *)self _photoMarkupViewController];

    if (v7)
    {
      id v8 = [(PUOverOneUpPresentationSession *)self _photoMarkupViewController];
      [v13 addObject:v8];
    }
    uint64_t v9 = [(PUOverOneUpPresentationSession *)self _funEffectsViewController];

    if (v9)
    {
      uint64_t v10 = [(PUOverOneUpPresentationSession *)self _funEffectsViewController];
      [v13 addObject:v10];
    }
    uint64_t v11 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];

    if (v11)
    {
      BOOL v12 = [(PUOverOneUpPresentationSession *)self _avalancheReviewController];
      [v13 addObject:v12];
    }
    [(PUOverOneUpPresentationSession *)self _setPresentedViewControllers:v13];
  }
}

- (void)_invalidatePresentedViewControllers
{
  if (![(PUOverOneUpPresentationSession *)self _needsUpdatePresentedViewControllers])
  {
    [(PUOverOneUpPresentationSession *)self _setNeedsUpdatePresentedViewControllers:1];
    [(PUOverOneUpPresentationSession *)self _setPresentedViewControllers:0];
  }
}

- (void)setBarsDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barsDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_barsDelegate, obj);
    self->_barsDelegateFlags.respondsToBarButtonItem = objc_opt_respondsToSelector() & 1;
    self->_barsDelegateFlags.respondsToDidAppendReviewScreenAction = objc_opt_respondsToSelector() & 1;
  }
}

- (PUOverOneUpPresentationSession)initWithActivitySharingActionPerformer:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUOverOneUpPresentationSession;
  BOOL v5 = [(PUOverOneUpPresentationSession *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(PUOverOneUpPresentationSession *)v5 setSharingActionPerformer:v4];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToTilingView = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToBrowsingViewModel = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidPresent = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidFinish = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToIsReadCGFloat y = objc_opt_respondsToSelector() & 1;
  }
}

@end