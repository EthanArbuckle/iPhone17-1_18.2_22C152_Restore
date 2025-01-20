@interface PXStoryViewLayout
- ($8F6F21C65DCD0A0F8AC24DFE540A6236)presentedGridTransform;
- (BOOL)allowsRepeatedSublayoutsUpdates;
- (BOOL)inGridViewMode;
- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4;
- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4;
- (BOOL)photosViewController:(id)a3 didPickAssetReference:(id)a4;
- (BOOL)shouldScrollGridToPlaybackPosition;
- (CGRect)_scrubberFrame;
- (PXGLayout)gridPlaceholderLayout;
- (PXGLayout)mainStoryPlaceholderLayout;
- (PXGLayout)relatedOverlayLayout;
- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory;
- (PXPhotosContentController)gridContentController;
- (PXStoryChromeLayout)chromeLayout;
- (PXStoryLayout)mainStoryLayout;
- (PXStoryModel)mainModel;
- (PXStoryScrubberLayout)scrubberLayout;
- (PXStoryViewLayout)init;
- (PXStoryViewLayout)initWithViewModel:(id)a3;
- (PXStoryViewModeTransition)gridViewModeTransition;
- (PXStoryViewModeTransitionsHelper)viewModeTransitionsHelper;
- (PXStoryViewModel)viewModel;
- (UIEdgeInsets)maskPaddingForContentController:(id)a3;
- (id)axLocalizedLabel;
- (id)createDefaultAnimationForCurrentContext;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)mainItemReference;
- (id)preferredFocusLayouts;
- (id)presentingViewControllerForContentController:(id)a3;
- (id)transitionsHelper:(id)a3 regionOfInterestForTransition:(id)a4;
- (id)transitionsHelper:(id)a3 timelineLayoutSnapshotForViewMode:(int64_t)a4;
- (id)undoManagerForActionPerformer:(id)a3;
- (id)undoManagerForContentController:(id)a3;
- (int64_t)chromeLayoutIndex;
- (int64_t)diagnosticHUDLayoutIndex;
- (int64_t)gridLayoutIndex;
- (int64_t)legibilityOverlayLayoutIndex;
- (int64_t)mainStoryLayoutIndex;
- (int64_t)relatedOverlayLayoutIndex;
- (int64_t)scrollableAxis;
- (int64_t)scrubberLayoutIndex;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (unint64_t)contentChangeTrend;
- (void)_invalidateContentSize;
- (void)_invalidateGridLayout;
- (void)_invalidateGridTransform;
- (void)_invalidateHiddenGridAssets;
- (void)_invalidateMainModel;
- (void)_invalidateMainStoryLayout;
- (void)_invalidateSublayoutFrames;
- (void)_invalidateSublayoutOrigins;
- (void)_invalidateSublayoutVisibility;
- (void)_invalidateTransitionsHelper;
- (void)_invalidateTransitionsHelperAfterSublayouts;
- (void)_setFrame:(CGRect)a3 relativeZPosition:(double)a4 depth:(double)a5 forSublayoutAtIndex:(int64_t)a6;
- (void)_updateContentSize;
- (void)_updateGridLayout;
- (void)_updateGridTransform;
- (void)_updateHeaderSpacing;
- (void)_updateMainModel;
- (void)_updateMainStoryLayout;
- (void)_updateSublayoutFrames;
- (void)_updateSublayoutOrigins;
- (void)_updateSublayoutVisibility;
- (void)_updateTransitionsHelper;
- (void)_updateTransitionsHelperAfterSublayouts;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)didUpdate;
- (void)didUpdateSublayout:(id)a3;
- (void)dismissPresentedViewControllerForContentController:(id)a3;
- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setGridViewModeTransition:(id)a3;
- (void)setMainModel:(id)a3;
- (void)setMainStoryLayout:(id)a3;
- (void)setPresentedGridTransform:(id *)a3;
- (void)setShouldScrollGridToPlaybackPosition:(BOOL)a3;
- (void)setViewModeTransitionsHelper:(id)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXStoryViewLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridViewModeTransition, 0);
  objc_storeStrong((id *)&self->_viewModeTransitionsHelper, 0);
  objc_storeStrong((id *)&self->_gridContentController, 0);
  objc_storeStrong((id *)&self->_relatedOverlayLayout, 0);
  objc_storeStrong((id *)&self->_scrubberLayout, 0);
  objc_storeStrong((id *)&self->_chromeLayout, 0);
  objc_storeStrong((id *)&self->_gridPlaceholderLayout, 0);
  objc_storeStrong((id *)&self->_mainStoryPlaceholderLayout, 0);
  objc_storeStrong((id *)&self->_mainStoryLayout, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_relatedDecorationSource, 0);
}

- (PXStoryViewModeTransition)gridViewModeTransition
{
  return self->_gridViewModeTransition;
}

- (void)setViewModeTransitionsHelper:(id)a3
{
}

- (PXStoryViewModeTransitionsHelper)viewModeTransitionsHelper
{
  return self->_viewModeTransitionsHelper;
}

- (void)setShouldScrollGridToPlaybackPosition:(BOOL)a3
{
  self->_shouldScrollGridToPlaybackPosition = a3;
}

- (BOOL)shouldScrollGridToPlaybackPosition
{
  return self->_shouldScrollGridToPlaybackPosition;
}

- (void)setPresentedGridTransform:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0.c;
  long long v3 = *(_OWORD *)&a3->var0.tx;
  long long v5 = *(_OWORD *)&a3->var0.a;
  self->_presentedGridTransform.tz = a3->var1;
  *(_OWORD *)&self->_presentedGridTransform.affineTransform.c = v4;
  *(_OWORD *)&self->_presentedGridTransform.affineTransform.tx = v3;
  *(_OWORD *)&self->_presentedGridTransform.affineTransform.a = v5;
}

- ($8F6F21C65DCD0A0F8AC24DFE540A6236)presentedGridTransform
{
  long long v3 = *(_OWORD *)&self[22].var0.a;
  *(_OWORD *)&retstr->var0.a = *(_OWORD *)&self[21].var0.ty;
  *(_OWORD *)&retstr->var0.c = v3;
  *(_OWORD *)&retstr->var0.tx = *(_OWORD *)&self[22].var0.c;
  retstr->var1 = self[22].var0.tx;
  return self;
}

- (PXPhotosContentController)gridContentController
{
  return self->_gridContentController;
}

- (int64_t)diagnosticHUDLayoutIndex
{
  return self->_diagnosticHUDLayoutIndex;
}

- (int64_t)gridLayoutIndex
{
  return self->_gridLayoutIndex;
}

- (int64_t)relatedOverlayLayoutIndex
{
  return self->_relatedOverlayLayoutIndex;
}

- (PXGLayout)relatedOverlayLayout
{
  return self->_relatedOverlayLayout;
}

- (int64_t)scrubberLayoutIndex
{
  return self->_scrubberLayoutIndex;
}

- (PXStoryScrubberLayout)scrubberLayout
{
  return self->_scrubberLayout;
}

- (int64_t)chromeLayoutIndex
{
  return self->_chromeLayoutIndex;
}

- (PXStoryChromeLayout)chromeLayout
{
  return self->_chromeLayout;
}

- (int64_t)legibilityOverlayLayoutIndex
{
  return self->_legibilityOverlayLayoutIndex;
}

- (int64_t)mainStoryLayoutIndex
{
  return self->_mainStoryLayoutIndex;
}

- (PXGLayout)gridPlaceholderLayout
{
  return self->_gridPlaceholderLayout;
}

- (PXGLayout)mainStoryPlaceholderLayout
{
  return self->_mainStoryPlaceholderLayout;
}

- (PXStoryLayout)mainStoryLayout
{
  return self->_mainStoryLayout;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)axLocalizedLabel
{
  return PXLocalizedStringFromTable(@"InteractiveMemoryButtonAccessibilityLabelPlayer", @"PhotosUICore");
}

- (id)preferredFocusLayouts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PXStoryViewLayout_preferredFocusLayouts__block_invoke;
  aBlock[3] = &unk_1E5DC6540;
  id v13 = v3;
  id v4 = v3;
  long long v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  v6 = [(PXStoryViewLayout *)self viewModel];
  int v7 = [v6 wantsRelatedOverlayVisible];

  if (v7)
  {
    [(PXStoryViewLayout *)self relatedOverlayLayout];
  }
  else
  {
    v8 = [(PXStoryViewLayout *)self scrubberLayout];
    v5[2](v5, v8);

    [(PXStoryViewLayout *)self chromeLayout];
  v9 = };
  v5[2](v5, v9);

  v10 = (void *)[v4 copy];
  return v10;
}

uint64_t __42__PXStoryViewLayout_preferredFocusLayouts__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)ViewModelObservationContext_221029 == a5)
  {
    if ((a4 & 0x40) != 0)
    {
      [(PXStoryViewLayout *)self _invalidateMainModel];
      if ((a4 & 0x2000) == 0)
      {
LABEL_9:
        if ((a4 & 0x400000000) == 0) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }
    }
    else if ((a4 & 0x2000) == 0)
    {
      goto LABEL_9;
    }
    [(PXStoryViewLayout *)self setShouldScrollGridToPlaybackPosition:[(PXStoryViewLayout *)self inGridViewMode]];
    [(PXStoryViewLayout *)self _invalidateGridLayout];
    [(PXStoryViewLayout *)self _invalidateContentSize];
    [(PXStoryViewLayout *)self _invalidateSublayoutFrames];
    [(PXGLayout *)self setNeedsUpdateOfScrollableAxis];
    [(PXGLayout *)self safeAreaInsetsDidChange];
    if ((a4 & 0x400000000) == 0) {
      goto LABEL_17;
    }
LABEL_15:
    if (!self->_isUpdatingGridLayout)
    {
      [(PXStoryViewLayout *)self _invalidateGridLayout];
      [(PXStoryViewLayout *)self _invalidateHiddenGridAssets];
    }
LABEL_17:
    if ((a4 & 0x20) != 0) {
      [(PXStoryViewLayout *)self _invalidateSublayoutFrames];
    }
    if ((a4 & 0x3000000000) != 0)
    {
      v10 = [(PXStoryViewLayout *)self viewModeTransitionsHelper];
      [v10 invalidatePresentingGeometry];
    }
    if ((a4 & 0x10000000000) != 0)
    {
      [(PXStoryViewLayout *)self _invalidateGridLayout];
      if ((a4 & 0x8000) == 0)
      {
LABEL_23:
        if ((a4 & 0x40000000000) == 0) {
          goto LABEL_30;
        }
        goto LABEL_27;
      }
    }
    else if ((a4 & 0x8000) == 0)
    {
      goto LABEL_23;
    }
    [(PXStoryViewLayout *)self _axMoveCursorToPlayer];
    if ((a4 & 0x40000000000) == 0) {
      goto LABEL_30;
    }
LABEL_27:
    [(PXStoryViewLayout *)self _invalidateSublayoutVisibility];
    goto LABEL_30;
  }
  if ((void *)MainModelObservationContext_221030 == a5)
  {
    if ((a4 & 0x800000000000000) != 0) {
      [(PXStoryViewLayout *)self _invalidateSublayoutFrames];
    }
  }
  else if ((void *)RecipeManagerObservationContext_221031 == a5)
  {
    if ((a4 & 0x10) != 0) {
      [(PXStoryViewLayout *)self _invalidateGridLayout];
    }
  }
  else
  {
    if ((void *)GridViewModeTransitionObservationContext != a5)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXStoryViewLayout.m" lineNumber:997 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if (a4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__PXStoryViewLayout_observable_didChange_context___block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
LABEL_30:
}

uint64_t __50__PXStoryViewLayout_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateGridTransform];
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryViewLayout *)self mainStoryLayout];
  [v4 addSubprovider:v5];
}

- (id)undoManagerForContentController:(id)a3
{
  id v3 = [(PXStoryViewLayout *)self viewModel];
  id v4 = [v3 presentingViewController];

  id v5 = [v4 undoManager];

  return v5;
}

- (UIEdgeInsets)maskPaddingForContentController:(id)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)presentingViewControllerForContentController:(id)a3
{
  double v3 = [(PXStoryViewLayout *)self viewModel];
  double v4 = [v3 presentingViewController];

  return v4;
}

- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4
{
  id v5 = a4;
  double v6 = [(PXStoryViewLayout *)self viewModel];
  int v7 = [v6 presentingViewController];

  v8 = [v7 navigationController];

  if (v8)
  {
    id v9 = [v7 navigationController];
    [v9 pushViewController:v5 animated:1];
  }
  return v8 != 0;
}

- (void)dismissPresentedViewControllerForContentController:(id)a3
{
  double v3 = [(PXStoryViewLayout *)self viewModel];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  double v6 = [(PXStoryViewLayout *)self viewModel];
  int v7 = [v6 presentingViewController];

  if (v7) {
    [v7 presentViewController:v5 animated:1 completion:0];
  }

  return v7 != 0;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  double v3 = [(PXStoryViewLayout *)self viewModel];
  id v4 = [v3 presentingViewController];

  id v5 = [v4 undoManager];

  return v5;
}

- (PXMemoryAssetsActionFactory)memoryAssetsActionFactory
{
  double v3 = [PXStoryMemoryAssetsActionFactory alloc];
  id v4 = [(PXStoryViewLayout *)self viewModel];
  id v5 = [(PXStoryMemoryAssetsActionFactory *)v3 initWithViewModel:v4];

  return (PXMemoryAssetsActionFactory *)v5;
}

- (BOOL)photosViewController:(id)a3 didPickAssetReference:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PXStoryViewLayout *)self mainModel];
  id v9 = [v8 viewModeTransition];

  if (!v9)
  {
    v36 = [v8 timeline];
    v10 = [v8 resourcesDataSourceManager];
    v37 = [v10 dataSource];

    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    uint64_t v11 = [v37 indexForDisplayAssetReference:v7];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = [v8 recipeManager];
      id v13 = [v12 recipe];

      v14 = [v13 untruncatedCuratedAssets];
      if (!v14)
      {

        goto LABEL_11;
      }
      v15 = [v7 asset];
      uint64_t v16 = [v14 indexOfObject:v15];

      v17 = [v13 curatedAssets];
      if (v16 >= [v17 count])
      {
        v18 = PLStoryGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_FAULT, "truncated asset picked, falling back to last available asset", (uint8_t *)&buf, 2u);
        }

        id v19 = objc_alloc((Class)off_1E5DA55E0);
        v20 = [v17 lastObject];
        long long v21 = *((_OWORD *)off_1E5DAB028 + 1);
        long long buf = *(_OWORD *)off_1E5DAB028;
        long long v54 = v21;
        v22 = (void *)[v19 initWithSectionObject:0 itemObject:v20 subitemObject:0 indexPath:&buf];

        uint64_t v11 = [v37 indexForDisplayAssetReference:v22];
      }
      else
      {
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }

      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_11:
      }
        PXAssertGetLog();
    }
    uint64_t v23 = [v36 identifierOfFirstClipContainingResourceAtIndex:v11 inResourcesDataSource:v37 resourceKind:1];
    if (!v23)
    {
      v24 = [v37 keyAssetResource];
      v25 = objc_msgSend(v24, "px_storyResourceDisplayAsset");
      v26 = [v7 asset];
      id v27 = v25;
      id v28 = v26;
      if (v27 == v28)
      {
      }
      else
      {
        v29 = v28;
        char v30 = [v27 isEqual:v28];

        if ((v30 & 1) == 0) {
LABEL_29:
        }
          PXAssertGetLog();
      }
      uint64_t v23 = [v36 identifierOfFirstClipContainingResourceAtIndex:-1 inResourcesDataSource:v37 resourceKind:1];
      if (!v23) {
        goto LABEL_29;
      }
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    *(void *)&long long v54 = 0x5010000000;
    *((void *)&v54 + 1) = &unk_1AB5D584F;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    if (v36) {
      [v36 timeRange];
    }
    else {
      memset(v45, 0, sizeof(v45));
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke;
    v44[3] = &unk_1E5DC64F0;
    v44[4] = &buf;
    v44[5] = v23;
    objc_msgSend(v36, "enumerateClipsInTimeRange:rect:usingBlock:", v45, v44, *MEMORY[0x1E4F1DB10], *(double *)(MEMORY[0x1E4F1DB10] + 8), *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    if ((*(unsigned char *)(*((void *)&buf + 1) + 44) & 1) == 0
      || (*(_DWORD *)(*((void *)&buf + 1) + 68) & 1) == 0
      || *(void *)(*((void *)&buf + 1) + 72)
      || (*(void *)(*((void *)&buf + 1) + 56) & 0x8000000000000000) != 0)
    {
      PXAssertGetLog();
    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_2;
    v43[3] = &unk_1E5DCFF38;
    v43[4] = &v46;
    long long v31 = *(_OWORD *)(*((void *)&buf + 1) + 48);
    long long v50 = *(_OWORD *)(*((void *)&buf + 1) + 32);
    long long v51 = v31;
    long long v52 = *(_OWORD *)(*((void *)&buf + 1) + 64);
    [v36 enumerateSegmentsInTimeRange:&v50 usingBlock:v43];
    if (!v47[3]) {
      PXAssertGetLog();
    }
    _Block_object_dispose(&buf, 8);
    v32 = [(PXStoryViewLayout *)self viewModel];
    [v32 performChanges:&__block_literal_global_221047];

    v33 = [(PXStoryViewLayout *)self mainModel];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_2_295;
    v38[3] = &unk_1E5DC6518;
    uint64_t v42 = v23;
    id v39 = v7;
    v41 = &v46;
    id v34 = v36;
    id v40 = v34;
    [v33 performChanges:v38];

    _Block_object_dispose(&v46, 8);
  }

  return 1;
}

uint64_t __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke(uint64_t result, uint64_t a2, long long *a3, uint64_t a4, void *a5, unsigned char *a6)
{
  if (a2 >= 1)
  {
    do
    {
      if (*a5 == *(void *)(result + 40))
      {
        id v6 = *(_OWORD **)(*(void *)(result + 32) + 8);
        long long v7 = *a3;
        long long v8 = a3[2];
        v6[3] = a3[1];
        v6[4] = v8;
        v6[2] = v7;
        *a6 = 1;
      }
      a5 += 96;
      a3 += 3;
      --a2;
    }
    while (a2);
  }
  return result;
}

uint64_t __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, void *a4, unsigned char *a5)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *a4;
  *a5 = 1;
  return result;
}

void __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_2_295(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setViewMode:1];
  [v4 setLastHitClipIdentifier:*(void *)(a1 + 56)];
  [v4 setLastHitAssetReference:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v3)
  {
    if (v3 == [*(id *)(a1 + 40) firstSegmentIdentifier]) {
      [v4 restartPlaybackFromBeginning];
    }
    else {
      [v4 skipToBeginningOfSegmentWithIdentifier:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    }
  }
}

uint64_t __64__PXStoryViewLayout_photosViewController_didPickAssetReference___block_invoke_294(uint64_t a1, void *a2)
{
  return [a2 deselectAllGridItems];
}

- (id)transitionsHelper:(id)a3 regionOfInterestForTransition:(id)a4
{
  id v5 = a4;
  id v6 = [(PXStoryViewLayout *)self viewModel];
  long long v7 = [v6 viewControllerDismissalTargetPlacement];
  if ([v6 swipeDownTriggeringDismissal] && v7)
  {
    long long v8 = [v7 regionOfInterest];
    [v8 setIsRepresentingPlaceholderContent:1];
  }
  else if ([v5 hasSourceOrDestinationViewMode:2])
  {
    long long v8 = [v5 assetReference];

    if (v8)
    {
      id v9 = [(PXStoryViewLayout *)self gridContentController];
      v10 = [v9 layout];
      uint64_t v11 = [v5 assetReference];
      long long v8 = [v10 regionOfInterestForAssetReference:v11];

      uint64_t v26 = 0;
      memset(&v25[1], 0, sizeof(CGAffineTransform));
      [(PXStoryViewLayout *)self presentedGridTransform];
      memset(&t1, 0, sizeof(t1));
      long long v12 = *((_OWORD *)off_1E5DAAF78 + 1);
      *(_OWORD *)&t2.a = *(_OWORD *)off_1E5DAAF78;
      *(_OWORD *)&t2.c = v12;
      *(_OWORD *)&t2.tx = *((_OWORD *)off_1E5DAAF78 + 2);
      if (!CGAffineTransformEqualToTransform(&t1, &t2) || *((double *)off_1E5DAAF78 + 6) != 0.0)
      {
        id v13 = [(PXGLayout *)self rootLayout];
        v14 = [v13 coordinateSpace];
        [v8 rectInCoordinateSpace:v14];
        -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v13);
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGAffineTransform t1 = v25[1];
        CGAffineTransformInvert(v25, &t1);
        v30.origin.x = v16;
        v30.origin.y = v18;
        v30.size.width = v20;
        v30.size.height = v22;
        CGRect v31 = CGRectApplyAffineTransform(v30, v25);
        objc_msgSend(v13, "convertRect:fromLayout:", self, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
        uint64_t v23 = objc_msgSend(v8, "copyWithRect:inCoordinateSpace:", v14);

        long long v8 = (void *)v23;
      }
    }
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

- (id)transitionsHelper:(id)a3 timelineLayoutSnapshotForViewMode:(int64_t)a4
{
  id v7 = a3;
  long long v8 = 0;
  switch(a4)
  {
    case 0:
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:self file:@"PXStoryViewLayout.m" lineNumber:736 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
    case 3:
    case 5:
      id v9 = [(PXStoryViewLayout *)self viewModel];
      v10 = [v9 mainModel];

      uint64_t v11 = [v10 timeline];
      uint64_t v12 = [v10 currentSegmentIdentifier];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v29 = 0u;
      if (v11) {
        [v11 timeRangeForSegmentWithIdentifier:v12];
      }
      [v11 frameForSegmentWithIdentifier:v12];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v21 = [PXStoryTimelineLayoutSnapshot alloc];
      v28[0] = v29;
      v28[1] = v30;
      v28[2] = v31;
      LODWORD(v22) = *(_DWORD *)off_1E5DAAF50;
      LODWORD(v23) = *((_DWORD *)off_1E5DAAF50 + 1);
      LODWORD(v24) = *((_DWORD *)off_1E5DAAF50 + 2);
      LODWORD(v25) = *((_DWORD *)off_1E5DAAF50 + 3);
      long long v8 = -[PXStoryTimelineLayoutSnapshot initWithTimeline:timelineRect:timeRange:clipCornerRadius:](v21, "initWithTimeline:timelineRect:timeRange:clipCornerRadius:", v11, v28, v14, v16, v18, v20, v22, v23, v24, v25);

      break;
    default:
      break;
  }

  return v8;
}

- (BOOL)inGridViewMode
{
  v2 = [(PXStoryViewLayout *)self viewModel];
  BOOL v3 = [v2 viewMode] == 2;

  return v3;
}

- (void)_setFrame:(CGRect)a3 relativeZPosition:(double)a4 depth:(double)a5 forSublayoutAtIndex:(int64_t)a6
{
  if (a6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    [(PXGLayout *)self referenceDepth];
    double v16 = v15;
    -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:", a6, x, y, width, height);
    [(PXGAbsoluteCompositeLayout *)self setZPosition:a6 forSublayoutAtIndex:-(a4 * v16)];
    [(PXGAbsoluteCompositeLayout *)self setReferenceDepth:a6 forSublayoutAtIndex:v16 * a5];
  }
}

- (CGRect)_scrubberFrame
{
  [(PXGLayout *)self visibleRect];
  BOOL v3 = [(PXStoryViewLayout *)self viewModel];
  id v4 = [v3 viewLayoutSpec];
  [v3 mainModel];
  [(id)objc_claimAutoreleasedReturnValue() infoPanelVisibilityFraction];
  [v4 infoPanelAnimationDistance];
  PXFloatByLinearlyInterpolatingFloats();
}

- (void)_updateContentSize
{
  if ([(PXStoryViewLayout *)self inGridViewMode])
  {
    BOOL v3 = [(PXStoryViewLayout *)self gridContentController];
    id v4 = [v3 layout];
    [v4 contentSize];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    [(PXGLayout *)self referenceSize];
    double v6 = v9;
    double v8 = v10;
  }
  -[PXGAbsoluteCompositeLayout setContentSize:](self, "setContentSize:", v6, v8);
}

- (void)_invalidateContentSize
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateContentSize]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 683, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSublayoutOrigins
{
  [(PXGLayout *)self visibleRect];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = [(PXGLayout *)self sublayoutDataStore];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__PXStoryViewLayout__updateSublayoutOrigins__block_invoke;
  v12[3] = &unk_1E5DC64C8;
  v12[4] = self;
  v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  [v11 enumerateSublayoutsUsingBlock:v12];
}

void __44__PXStoryViewLayout__updateSublayoutOrigins__block_invoke(double *a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = (void *)*((void *)a1 + 4);
  if (v5[147] == a2)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else if (v5[144] == a2)
  {
    [v5 _scrubberFrame];
    uint64_t v5 = (void *)*((void *)a1 + 4);
  }
  else
  {
    double v6 = a1[5];
    double v7 = a1[6];
  }
  objc_msgSend(v5, "setOrigin:forSublayoutAtIndex:", a2, v6, v7);
}

- (void)_invalidateSublayoutOrigins
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateSublayoutOrigins]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 664, @"invalidating %lu after it already has been updated", 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 2048;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateHiddenGridAssets
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x400) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateHiddenGridAssets]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 653, @"invalidating %lu after it already has been updated", 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 1024;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTransitionsHelperAfterSublayouts
{
  id v2 = [(PXStoryViewLayout *)self viewModeTransitionsHelper];
  [v2 updateIfNeeded];
}

- (void)_invalidateTransitionsHelperAfterSublayouts
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x1000;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x1000) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateTransitionsHelperAfterSublayouts]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 645, @"invalidating %lu after it already has been updated", 4096);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4096;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateTransitionsHelper
{
  id v2 = [(PXStoryViewLayout *)self viewModeTransitionsHelper];
  [v2 updateIfNeeded];
}

- (void)_invalidateTransitionsHelper
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateTransitionsHelper]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 637, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateGridTransform
{
  int64_t v3 = [(PXStoryViewLayout *)self gridLayoutIndex];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v4 = v3;
    uint64_t v5 = +[PXStorySettings sharedInstance];
    uint64_t v6 = [v5 swipeDownBehavior];

    if (!v6)
    {
      long long v7 = *((_OWORD *)off_1E5DAAF78 + 1);
      long long v18 = *(_OWORD *)off_1E5DAAF78;
      long long v19 = v7;
      long long v20 = *((_OWORD *)off_1E5DAAF78 + 2);
      uint64_t v21 = *((void *)off_1E5DAAF78 + 6);
      id v8 = [(PXStoryViewLayout *)self gridViewModeTransition];
      uint64_t v9 = [v8 regionOfInterest];
      uint64_t v10 = [(PXStoryViewLayout *)self gridContentController];
      uint64_t v11 = [v10 layout];

      if (v8 && v9)
      {
        if (v11)
        {
          uint64_t v12 = [v11 rootLayout];
          double v13 = [v12 coordinateSpace];
          [v9 rectInCoordinateSpace:v13];
          -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v12);

          PXSizeGetAspectRatio();
        }
      }
      v16[0] = v18;
      v16[1] = v19;
      v16[2] = v20;
      uint64_t v17 = v21;
      [(PXGAbsoluteCompositeLayout *)self setSpriteTransform:v16 forSublayoutAtIndex:v4];
      [v11 setAlpha:1.0];
      v14[0] = v18;
      v14[1] = v19;
      v14[2] = v20;
      uint64_t v15 = v21;
      [(PXStoryViewLayout *)self setPresentedGridTransform:v14];
    }
  }
}

- (void)_invalidateGridTransform
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x80;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateGridTransform]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 603, @"invalidating %lu after it already has been updated", 128);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 128;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSublayoutVisibility
{
  int64_t v3 = [(PXStoryViewLayout *)self viewModel];
  int v4 = [v3 allowedChromeItems];

  id v5 = [(PXStoryViewLayout *)self scrubberLayout];
  [v5 setIsHidden:(v4 & 0x4000000) == 0];
}

- (void)_invalidateSublayoutVisibility
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateSublayoutVisibility]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 594, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateSublayoutFrames
{
  [(PXGLayout *)self visibleRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", [(PXStoryViewLayout *)self mainStoryLayoutIndex], v3, v5, v7, v9, 0.0, 0.1);
  double v18 = v4;
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", [(PXStoryViewLayout *)self legibilityOverlayLayoutIndex], v4, v6, v8, v10, 0.1, 0.1);
  [(PXStoryViewLayout *)self _scrubberFrame];
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", [(PXStoryViewLayout *)self scrubberLayoutIndex], v11, v12, v13, v14, 0.2, 0.1);
  if ([(PXStoryViewLayout *)self gridLayoutIndex] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = [(PXGLayout *)self sublayoutAtIndex:[(PXStoryViewLayout *)self gridLayoutIndex] loadIfNeeded:0];
    [v15 contentSize];
    double v17 = v16;

    if (v17 < v10) {
      double v17 = v10;
    }
    -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", [(PXStoryViewLayout *)self gridLayoutIndex], 0.0, 0.0, v8, v17, -0.5, 0.1);
  }
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", [(PXStoryViewLayout *)self chromeLayoutIndex], v18, v6, v8, v10, 0.3, 0.1);
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", [(PXStoryViewLayout *)self relatedOverlayLayoutIndex], v18, v6, v8, v10, 0.3, 0.1);
  -[PXStoryViewLayout _setFrame:relativeZPosition:depth:forSublayoutAtIndex:](self, "_setFrame:relativeZPosition:depth:forSublayoutAtIndex:", [(PXStoryViewLayout *)self diagnosticHUDLayoutIndex], v18, v6, v8, v10, 0.9, 0.1);
  [(PXStoryViewLayout *)self _updateHeaderSpacing];
}

- (void)_updateHeaderSpacing
{
  double v3 = [(PXStoryViewLayout *)self gridContentController];

  if (v3)
  {
    double v4 = [(PXStoryViewLayout *)self viewModel];
    id v10 = [v4 viewLayoutSpec];

    double v5 = [(PXStoryViewLayout *)self gridContentController];
    double v6 = [v5 layout];

    [v10 predictedBrowseChromeTextHeight];
    double v8 = v7;
    [v10 distanceFromBottomChromeTextToGrid];
    [v6 setStatusBarHeight:v8 + v9];
    [v6 setWantsHeaderInSafeArea:1];
  }
}

- (void)_invalidateSublayoutFrames
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateSublayoutFrames]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 558, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateGridLayout
{
  v66[8] = *MEMORY[0x1E4F143B8];
  self->_isUpdatingGridLayout = 1;
  double v3 = +[PXStorySettings sharedInstance];
  double v4 = [(PXStoryViewLayout *)self viewModel];
  double v5 = [(PXStoryViewLayout *)self viewModel];
  double v6 = [v5 mainModel];
  double v7 = [v6 viewModeTransition];

  if ([v3 wantsGridLayout]
    && ([(PXStoryViewLayout *)self inGridViewMode]
     || [v7 hasSourceOrDestinationViewMode:2]))
  {
    id v8 = v7;
    double v9 = [(PXStoryViewLayout *)self mainModel];
    id v10 = [v9 recipeManager];
    double v11 = [v10 assetsDataSourceManager];

    gridContentController = self->_gridContentController;
    if (gridContentController)
    {
      double v13 = [(PXPhotosContentController *)gridContentController viewModel];
      double v14 = [v13 dataSourceManager];

      if (v14 == v11)
      {
        unsigned int v16 = 0;
      }
      else
      {
        uint64_t v15 = [(PXPhotosContentController *)self->_gridContentController viewModel];
        unsigned int v16 = [v15 isInSelectMode];

        double v17 = self->_gridContentController;
        self->_gridContentController = 0;
      }
      if (self->_gridContentController)
      {
LABEL_29:
        v45 = [(PXStoryViewLayout *)self gridContentController];
        uint64_t v46 = [v45 layout];

        if ([v3 swipeDownBehavior])
        {
          [v4 swipeDownDismissalPreviewFraction];
          [v46 setAlpha:1.0 - v47];
        }
        uint64_t v48 = [(PXGLayout *)self sublayoutAtIndex:[(PXStoryViewLayout *)self gridLayoutIndex] loadIfNeeded:0];

        if (v48 != v46)
        {
          [(PXGLayout *)self removeSublayoutAtIndex:[(PXStoryViewLayout *)self gridLayoutIndex]];
          [(PXGAbsoluteCompositeLayout *)self insertSublayout:v46 atIndex:[(PXStoryViewLayout *)self gridLayoutIndex]];
        }
        if ([(PXStoryViewLayout *)self shouldScrollGridToPlaybackPosition])
        {
          uint64_t v49 = v11;
          long long v50 = v7;
          long long v51 = [(PXStoryViewLayout *)self mainModel];
          id v60 = 0;
          int v52 = [v51 getMainVisibleClipIdentifier:0 assetReferece:&v60];
          id v53 = v60;

          if (v52 && v53)
          {
            long long v54 = [(PXStoryViewLayout *)self gridContentController];
            [v54 scrollToRevealAssetReference:v53 completionHandler:0];
          }
          [(PXStoryViewLayout *)self setShouldScrollGridToPlaybackPosition:0];

          double v7 = v50;
          double v11 = v49;
        }

        goto LABEL_39;
      }
    }
    else
    {
      unsigned int v16 = 0;
    }
    long long v20 = (void *)[objc_alloc((Class)off_1E5DA84B0) initWithDataSourceManager:v11];
    objc_opt_class();
    v59 = v7;
    id v57 = v8;
    unsigned int v55 = v16;
    if (objc_opt_isKindOfClass())
    {
      id v21 = v11;
      double v22 = [[PXPhotoKitAssetActionManager alloc] initWithSelectionManager:v20];
      [(PXPhotoKitAssetActionManager *)v22 setDataSourceManager:v21];
      v66[0] = @"PXAssetActionTypeShare";
      v66[1] = @"PXAssetActionTypeShowInLibrary";
      v66[2] = @"PXAssetActionTypeStoryMakeKeyPhoto";
      v66[3] = @"PXAssetActionTypeToggleFavorite";
      v66[4] = @"PXAssetActionTypeStoryRemoveAsset";
      v66[5] = @"PXAssetActionTypeUnifiedDestructive";
      v66[6] = @"PXAssetActionTypeInternalAssetDetails";
      v66[7] = @"PXAssetActionTypeInternalAssetSearchDetails";
      double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:8];
      double v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v23];
      [(PXActionManager *)v22 setAllowedActionTypes:v24];

      double v25 = v22;
      uint64_t v26 = +[PXPhotoKitAssetCollectionActionManager actionManagerWithDataSourceManager:v21];
    }
    else
    {
      uint64_t v26 = 0;
      double v25 = 0;
    }
    id v27 = [PXPhotosViewConfiguration alloc];
    id v28 = [v4 mediaProvider];
    uint64_t v58 = v11;
    long long v56 = v25;
    long long v29 = [(PXPhotosViewConfiguration *)v27 initWithDataSourceManager:v11 mediaProvider:v28 selectionManager:v20 assetActionManager:v25 assetCollectionActionManager:v26];

    [(PXPhotosViewConfiguration *)v29 setSectionBodyStyle:1];
    [(PXPhotosViewConfiguration *)v29 setGridStyle:1];
    if ([v3 preferTopChromeItemsInAppNavigationBar]) {
      uint64_t v30 = 8;
    }
    else {
      uint64_t v30 = 3;
    }
    [(PXPhotosViewConfiguration *)v29 setNavBarStyle:v30];
    [(PXPhotosViewConfiguration *)v29 setAllowsUserDefaults:0];
    [(PXPhotosViewConfiguration *)v29 setDelegate:self];
    long long v31 = [v4 viewLayoutSpec];
    uint64_t v32 = [v31 browseGridAllowsDragGesture];

    uint64_t v33 = 0;
    if (v32) {
      uint64_t v33 = objc_msgSend(v3, "allowCustomUserAssets", 0);
    }
    uint64_t v34 = 65585;
    [(PXPhotosViewConfiguration *)v29 setAllowsDragIn:v33];
    [(PXPhotosViewConfiguration *)v29 setAllowsDragOut:v32];
    [(PXPhotosViewConfiguration *)v29 setForbiddenBadges:0];
    [(PXPhotosViewConfiguration *)v29 setSelectionContextOverride:13];
    [(PXPhotosViewConfiguration *)v29 setAllowsMultiSelectMenu:0];
    [(PXPhotosViewConfiguration *)v29 setAlwaysIncludeSharedWithYouAssets:1];
    [(PXPhotosViewConfiguration *)v29 setAllowedActions:536903713];
    if ([v3 allowCustomUserAssets]
      && ([v4 allowedChromeItems] & 0x20000000) == 0)
    {
      v35 = [v4 viewLayoutSpec];
      -[PXPhotosViewConfiguration setPreferredUserInterfaceStyle:](v29, "setPreferredUserInterfaceStyle:", [v35 preferredUserInterfaceStyleForBrowseGridInlineAddButton]);

      uint64_t v34 = 65587;
    }
    [(PXPhotosViewConfiguration *)v29 setAllowedBehaviors:v34];
    [(PXPhotosViewConfiguration *)v29 setStartsInSelectMode:v55];
    [(PXPhotosViewConfiguration *)v29 setWantsAssetIndexBadge:1];
    [(PXPhotosViewConfiguration *)v29 setPreferredBackgroundStyle:2];
    v36 = [PXPhotosContentController alloc];
    v37 = [v4 extendedTraitCollection];
    v38 = [(PXPhotosContentController *)v36 initWithConfiguration:v29 traitCollection:v37];
    id v39 = self->_gridContentController;
    self->_gridContentController = v38;

    [(PXPhotosContentController *)self->_gridContentController setDelegate:self];
    id v40 = [(PXPhotosContentController *)self->_gridContentController viewModel];
    v41 = [v4 presentingViewController];
    if (objc_opt_respondsToSelector())
    {
      id v42 = v41;
      uint64_t v43 = [v42 gridDecorationViewClass];
      if (v43)
      {
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __38__PXStoryViewLayout__updateGridLayout__block_invoke;
        v65[3] = &__block_descriptor_40_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8lu32l8;
        v65[4] = v43;
        [v40 performChanges:v65];
      }
    }
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __38__PXStoryViewLayout__updateGridLayout__block_invoke_2;
    v61[3] = &unk_1E5DC64A0;
    id v62 = v40;
    id v63 = v4;
    v64 = self;
    id v44 = v40;
    [v63 performChanges:v61];

    double v11 = v58;
    double v7 = v59;
    id v8 = v57;
    goto LABEL_29;
  }
  double v18 = [(PXGLayout *)self sublayoutAtIndex:self->_gridLayoutIndex loadIfNeeded:0];
  gridPlaceholderLayout = self->_gridPlaceholderLayout;

  if (v18 != gridPlaceholderLayout)
  {
    [(PXGLayout *)self removeSublayoutAtIndex:self->_gridLayoutIndex];
    [(PXGAbsoluteCompositeLayout *)self insertSublayout:self->_gridPlaceholderLayout atIndex:self->_gridLayoutIndex];
  }
  id v8 = 0;
LABEL_39:
  [(PXStoryViewLayout *)self setGridViewModeTransition:v8];
  [(PXStoryViewLayout *)self _invalidateSublayoutFrames];
  self->_isUpdatingGridLayout = 0;
}

void __38__PXStoryViewLayout__updateGridLayout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setDecorationViewClass:v2];
  [v3 setViewBasedDecorationsEnabled:1];
}

void __38__PXStoryViewLayout__updateGridLayout__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 setPhotosGridViewModel:*(void *)(a1 + 32)];
  id v3 = [*(id *)(*(void *)(a1 + 48) + 1192) interaction];
  [*(id *)(a1 + 40) setPhotosGridViewInteraction:v3];
}

- (void)_invalidateGridLayout
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateGridLayout]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 418, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateMainStoryLayout
{
  id v3 = [(PXStoryViewLayout *)self viewModel];
  id v7 = [v3 mainModel];

  double v4 = [[PXStoryLayout alloc] initWithModel:v7];
  [(PXStoryViewLayout *)self setMainStoryLayout:v4];

  double v5 = [[PXStoryViewModeTransitionsHelper alloc] initWithModel:v7];
  [(PXStoryViewLayout *)self setViewModeTransitionsHelper:v5];

  double v6 = [(PXStoryViewLayout *)self viewModeTransitionsHelper];
  [v6 setDelegate:self];
}

- (void)_invalidateMainStoryLayout
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateMainStoryLayout]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 407, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateMainModel
{
  id v4 = [(PXStoryViewLayout *)self viewModel];
  id v3 = [v4 mainModel];
  [(PXStoryViewLayout *)self setMainModel:v3];
}

- (void)_invalidateMainModel
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout _invalidateMainModel]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryViewLayout.m", 399, @"invalidating %lu after it already has been updated", 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 64;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryViewLayout;
  [(PXGCompositeLayout *)&v7 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryViewLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryViewLayout.m", 394, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXStoryViewLayout.m", 395, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  BOOL v3 = [(PXStoryViewLayout *)self inGridViewMode];
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (v3)
  {
    BOOL isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v46 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, @"PXStoryViewLayout.m", 344, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    needsUpdate |= 1uLL;
    p_updateFlags->unint64_t needsUpdate = needsUpdate;
    self->_updateFlags.BOOL willPerformUpdate = 0;
    if (!isPerformingUpdate) {
      goto LABEL_5;
    }
    goto LABEL_53;
  }
  self->_updateFlags.BOOL willPerformUpdate = 0;
  if (!needsUpdate) {
    goto LABEL_36;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_53:
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v20 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
    [v19 handleFailureInFunction:v20, @"PXStoryViewLayout.m", 347, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

    unint64_t needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.BOOL isPerformingUpdate = 1;
  self->_updateFlags.updated = 1;
  if (needsUpdate)
  {
    p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    [(PXStoryViewLayout *)self _updateContentSize];
    if (!self->_updateFlags.isPerformingUpdate)
    {
      id v21 = [MEMORY[0x1E4F28B00] currentHandler];
      double v22 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
      [v21 handleFailureInFunction:v22, @"PXStoryViewLayout.m", 351, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
  }
  unint64_t v7 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 0x40uLL;
  if ((v7 & 0x40) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFBFLL;
    [(PXStoryViewLayout *)self _updateMainModel];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v23 = [MEMORY[0x1E4F28B00] currentHandler];
    double v24 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
    [v23 handleFailureInFunction:v24, @"PXStoryViewLayout.m", 354, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v8 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((v8 & 2) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFFDLL;
    [(PXStoryViewLayout *)self _updateMainStoryLayout];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    double v25 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
    [v25 handleFailureInFunction:v26, @"PXStoryViewLayout.m", 357, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v9 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 4uLL;
  if ((v9 & 4) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFFBLL;
    [(PXStoryViewLayout *)self _updateTransitionsHelper];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    id v27 = [MEMORY[0x1E4F28B00] currentHandler];
    id v28 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
    [v27 handleFailureInFunction:v28, @"PXStoryViewLayout.m", 360, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v10 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 8uLL;
  if ((v10 & 8) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v10 & 0xFFFFFFFFFFFFFFF7;
    [(PXStoryViewLayout *)self _updateGridLayout];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v30 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
    [v29 handleFailureInFunction:v30, @"PXStoryViewLayout.m", 363, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v11 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 0x10uLL;
  if ((v11 & 0x10) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFFEFLL;
    [(PXStoryViewLayout *)self _updateSublayoutFrames];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v32 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
    [v31 handleFailureInFunction:v32, @"PXStoryViewLayout.m", 366, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v12 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 0x20uLL;
  if ((v12 & 0x20) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFFFDFLL;
    [(PXStoryViewLayout *)self _updateSublayoutVisibility];
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v34 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
    [v33 handleFailureInFunction:v34, @"PXStoryViewLayout.m", 369, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  unint64_t v13 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 0x80uLL;
  if ((v13 & 0x80) != 0)
  {
    p_updateFlags->unint64_t needsUpdate = v13 & 0xFFFFFFFFFFFFFF7FLL;
    [(PXStoryViewLayout *)self _updateGridTransform];
    unint64_t v13 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.BOOL isPerformingUpdate = 0;
  if (v13)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"PXStoryViewLayout.m", 372, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
  }
LABEL_36:
  BOOL isUpdatingSublayouts = self->_isUpdatingSublayouts;
  self->_BOOL isUpdatingSublayouts = 1;
  v47.receiver = self;
  v47.super_class = (Class)PXStoryViewLayout;
  [(PXGCompositeLayout *)&v47 update];
  self->_BOOL isUpdatingSublayouts = isUpdatingSublayouts;
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v16 = self->_postUpdateFlags.needsUpdate;
  if (v16)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      v38 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
      [v37 handleFailureInFunction:v38, @"PXStoryViewLayout.m", 379, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v16 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.BOOL isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v16 & 0x400) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v16 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXStoryViewLayout *)self _updateHiddenGridAssets];
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        id v39 = [MEMORY[0x1E4F28B00] currentHandler];
        id v40 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
        [v39 handleFailureInFunction:v40, @"PXStoryViewLayout.m", 383, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v17 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v17 & 0x800) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v17 & 0xFFFFFFFFFFFFF7FFLL;
      [(PXStoryViewLayout *)self _updateSublayoutOrigins];
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      id v42 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
      [v41 handleFailureInFunction:v42, @"PXStoryViewLayout.m", 386, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v18 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000uLL;
    if ((v18 & 0x1000) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v18 & 0xFFFFFFFFFFFFEFFFLL;
      [(PXStoryViewLayout *)self _updateTransitionsHelperAfterSublayouts];
      unint64_t v18 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.BOOL isPerformingUpdate = 0;
    if (v18)
    {
      uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
      id v44 = [NSString stringWithUTF8String:"-[PXStoryViewLayout update]"];
      objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"PXStoryViewLayout.m", 389, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryViewLayout;
  [(PXGCompositeLayout *)&v7 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    BOOL v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryViewLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryViewLayout.m", 338, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.BOOL willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    double v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[PXStoryViewLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXStoryViewLayout.m", 339, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  double v5 = [(PXStoryViewLayout *)self mainStoryLayout];
  double v6 = [v5 itemPlacementControllerForItemReference:v4];

  return v6;
}

- (id)mainItemReference
{
  uint64_t v2 = [(PXStoryViewLayout *)self mainStoryLayout];
  BOOL v3 = [v2 itemReference];

  return v3;
}

- (id)createDefaultAnimationForCurrentContext
{
  if ([(PXStoryViewLayout *)self inGridViewMode]
    && ([(PXStoryViewLayout *)self viewModel],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        [v3 viewModeTransition],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    v7.receiver = self;
    v7.super_class = (Class)PXStoryViewLayout;
    double v5 = [(PXGLayout *)&v7 createDefaultAnimationForCurrentContext];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (void)didUpdateSublayout:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXStoryViewLayout;
  id v4 = a3;
  [(PXGLayout *)&v9 didUpdateSublayout:v4];
  double v5 = [(PXStoryViewLayout *)self gridContentController];
  id v6 = [v5 layout];

  if (v6 == v4)
  {
    if ([(PXStoryViewLayout *)self inGridViewMode]) {
      [(PXStoryViewLayout *)self _updateContentSize];
    }
    objc_super v7 = [(PXStoryViewLayout *)self viewModeTransitionsHelper];
    [v7 invalidatePresentingGeometry];

    unint64_t v8 = [(PXStoryViewLayout *)self viewModeTransitionsHelper];
    [v8 updateIfNeeded];
  }
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7 = a3;
  if ([(PXStoryViewLayout *)self inGridViewMode]) {
    gridLayoutIndedouble x = self->_gridLayoutIndex;
  }
  else {
    gridLayoutIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v9 = v7;

  *a5 = v9;
  return gridLayoutIndex;
}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  return 1;
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  gridLayoutIndedouble x = self->_gridLayoutIndex;
  id v5 = a3;
  id v6 = [(PXGLayout *)self sublayoutAtIndex:gridLayoutIndex loadIfNeeded:0];
  [v6 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v5];
}

- (void)setGridViewModeTransition:(id)a3
{
  id v5 = (PXStoryViewModeTransition *)a3;
  gridViewModeTransition = self->_gridViewModeTransition;
  if (gridViewModeTransition != v5)
  {
    id v7 = v5;
    [(PXStoryViewModeTransition *)gridViewModeTransition unregisterChangeObserver:self context:GridViewModeTransitionObservationContext];
    objc_storeStrong((id *)&self->_gridViewModeTransition, a3);
    [(PXStoryViewModeTransition *)self->_gridViewModeTransition registerChangeObserver:self context:GridViewModeTransitionObservationContext];
    [(PXStoryViewLayout *)self _invalidateGridTransform];
    id v5 = v7;
  }
}

- (void)setMainStoryLayout:(id)a3
{
  id v5 = (PXStoryLayout *)a3;
  p_mainStoryLayout = &self->_mainStoryLayout;
  mainStoryLayout = self->_mainStoryLayout;
  if (mainStoryLayout != v5)
  {
    unint64_t v10 = v5;
    [(PXStoryLayout *)mainStoryLayout setAccessoryItemPlacementLayout:0];
    objc_storeStrong((id *)&self->_mainStoryLayout, a3);
    [(PXStoryLayout *)*p_mainStoryLayout setAccessoryItemPlacementLayout:self];
    [(PXGLayout *)self referenceDepth];
    [(PXStoryLayout *)*p_mainStoryLayout setRelativeZPositionAboveLegibilityGradients:0.2 / (0.1 / v8)];
    [(PXGLayout *)self removeSublayoutAtIndex:self->_mainStoryLayoutIndex];
    if (*p_mainStoryLayout)
    {
      [(PXGAbsoluteCompositeLayout *)self insertSublayout:*p_mainStoryLayout atIndex:self->_mainStoryLayoutIndex];
    }
    else
    {
      id v9 = [(PXStoryViewLayout *)self mainStoryPlaceholderLayout];
      [(PXGAbsoluteCompositeLayout *)self insertSublayout:v9 atIndex:self->_mainStoryLayoutIndex];
    }
    [(PXStoryViewLayout *)self _invalidateSublayoutFrames];
    id v5 = v10;
  }
}

- (void)setMainModel:(id)a3
{
  unint64_t v11 = (PXStoryModel *)a3;
  p_mainModel = &self->_mainModel;
  id v6 = self->_mainModel;
  if (v6 == v11)
  {
  }
  else
  {
    char v7 = [(PXStoryModel *)v11 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryModel *)*p_mainModel unregisterChangeObserver:self context:MainModelObservationContext_221030];
      double v8 = [(PXStoryModel *)*p_mainModel recipeManager];
      [v8 unregisterChangeObserver:self context:RecipeManagerObservationContext_221031];

      objc_storeStrong((id *)&self->_mainModel, a3);
      id v9 = [(PXStoryModel *)*p_mainModel recipeManager];
      [v9 registerChangeObserver:self context:RecipeManagerObservationContext_221031];

      [(PXStoryModel *)*p_mainModel registerChangeObserver:self context:MainModelObservationContext_221030];
      [(PXStoryViewLayout *)self _invalidateMainStoryLayout];
      [(PXStoryViewLayout *)self _invalidateGridLayout];
      gridContentController = self->_gridContentController;
      self->_gridContentController = 0;

      [(PXStoryViewLayout *)self _axMoveCursorToPlayer];
    }
  }
}

- (int64_t)scrollableAxis
{
  return [(PXStoryViewLayout *)self inGridViewMode];
}

- (unint64_t)contentChangeTrend
{
  uint64_t v2 = [(PXStoryViewLayout *)self mainStoryLayout];
  unint64_t v3 = [v2 contentChangeTrend];

  return v3;
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewLayout;
  [(PXGCompositeLayout *)&v3 referenceDepthDidChange];
  [(PXStoryViewLayout *)self _invalidateSublayoutFrames];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryViewLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXStoryViewLayout *)self _invalidateContentSize];
}

- (void)visibleRectDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryViewLayout;
  [(PXGCompositeLayout *)&v6 visibleRectDidChange];
  if (self->_isUpdatingSublayouts)
  {
    if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x800) != 0)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      id v5 = [NSString stringWithUTF8String:"-[PXStoryViewLayout visibleRectDidChange]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"PXStoryViewLayout.m", 208, @"invalidating %lu after it already has been updated", 2048);

      abort();
    }
    self->_postUpdateFlags.needsUpdate |= 0x800uLL;
  }
  else
  {
    [(PXStoryViewLayout *)self _invalidateSublayoutFrames];
    [(PXStoryViewLayout *)self _invalidateSublayoutOrigins];
    objc_super v3 = [(PXStoryViewLayout *)self viewModeTransitionsHelper];
    [v3 invalidatePresentingGeometry];
  }
}

- (PXStoryViewLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)PXStoryViewLayout;
  objc_super v6 = [(PXGAbsoluteCompositeLayout *)&v42 init];
  char v7 = v6;
  if (!v6) {
    goto LABEL_17;
  }
  p_viewModel = (id *)&v6->_viewModel;
  objc_storeStrong((id *)&v6->_viewModel, a3);
  [*p_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_221029];
  id v9 = +[PXStorySettings sharedInstance];
  [(PXGAbsoluteCompositeLayout *)v7 setShouldUpdateSublayoutsInStrictOrder:1];
  unint64_t v10 = objc_alloc_init(PXGLayout);
  gridPlaceholderLayout = v7->_gridPlaceholderLayout;
  v7->_gridPlaceholderLayout = v10;

  v7->_gridLayoutIndedouble x = [(PXGLayout *)v7 addSublayout:v7->_gridPlaceholderLayout];
  long long v12 = *((_OWORD *)off_1E5DAAF78 + 1);
  *(_OWORD *)&v7->_presentedGridTransform.affineTransform.a = *(_OWORD *)off_1E5DAAF78;
  *(_OWORD *)&v7->_presentedGridTransform.affineTransform.c = v12;
  *(_OWORD *)&v7->_presentedGridTransform.affineTransform.tdouble x = *((_OWORD *)off_1E5DAAF78 + 2);
  v7->_presentedGridTransform.tz = *((double *)off_1E5DAAF78 + 6);
  unint64_t v13 = objc_alloc_init(PXGLayout);
  mainStoryPlaceholderLayout = v7->_mainStoryPlaceholderLayout;
  v7->_mainStoryPlaceholderLayout = v13;

  v7->_mainStoryLayoutIndedouble x = [(PXGLayout *)v7 addSublayout:v7->_mainStoryPlaceholderLayout];
  uint64_t v15 = [v5 mainConfiguration];
  char v16 = [v15 isPresentedForAirPlay];
  int v17 = [v15 isExportPreview];
  __int16 v18 = [v15 options];
  long long v19 = [[PXStoryViewLegibilityOverlayLayout alloc] initWithViewModel:*p_viewModel];
  uint64_t v20 = [(PXGLayout *)v7 addSublayout:v19];

  uint64_t v41 = v20;
  if (v16)
  {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_13;
  }
  if ([v9 wantsScrubber] && v17 != 1 && (v18 & 0x400) == 0)
  {
    double v24 = [[PXStoryScrubberLayout alloc] initWithViewModel:*p_viewModel];
    scrubberLayout = v7->_scrubberLayout;
    v7->_scrubberLayout = v24;

    uint64_t v23 = [(PXGLayout *)v7 addSublayout:v7->_scrubberLayout];
  }
  else
  {
    uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    if ((v18 & 0x400) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v26 = [[PXStoryChromeLayout alloc] initWithViewModel:*p_viewModel];
  chromeLayout = v7->_chromeLayout;
  v7->_chromeLayout = v26;

  uint64_t v22 = [(PXGLayout *)v7 addSublayout:v7->_chromeLayout];
LABEL_10:
  if (v17)
  {
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v28 = [[PXStoryRelatedOverlayLayout alloc] initWithViewModel:*p_viewModel];
    long long v29 = [PXStoryRelatedOverlayItemDecorationSource alloc];
    uint64_t v30 = [(PXStoryViewLayout *)v7 viewModel];
    uint64_t v31 = [(PXStoryRelatedOverlayItemDecorationSource *)v29 initWithViewModel:v30];
    relatedDecorationSource = v7->_relatedDecorationSource;
    v7->_relatedDecorationSource = (PXStoryRelatedOverlayItemDecorationSource *)v31;

    uint64_t v33 = [[PXGDecoratingLayout alloc] initWithDecoratedLayout:v28];
    [(PXGDecoratingLayout *)v33 setActiveDecorations:&unk_1F02D52C0];
    [(PXGDecoratingLayout *)v33 setContentSource:v7->_relatedDecorationSource];
    [(PXGDecoratingLayout *)v33 setDecorationSource:v7->_relatedDecorationSource];
    [(PXStoryRelatedOverlayItemDecorationSource *)v7->_relatedDecorationSource setDecoratedLayout:v28];
    relatedOverlayLayout = v7->_relatedOverlayLayout;
    v7->_relatedOverlayLayout = &v33->super;
    v35 = v33;

    uint64_t v21 = [(PXGLayout *)v7 addSublayout:v35];
  }
LABEL_13:
  v36 = +[PXStorySettings sharedInstance];
  int v37 = [v36 isHUDEnabled];

  if (v37)
  {
    v38 = [[PXStoryDiagnosticHUDLayout alloc] initWithDataSource:*p_viewModel];
    uint64_t v39 = [(PXGLayout *)v7 addSublayout:v38];
  }
  else
  {
    uint64_t v39 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v7->_chromeLayoutIndedouble x = v22;
  v7->_relatedOverlayLayoutIndedouble x = v21;
  v7->_scrubberLayoutIndedouble x = v23;
  v7->_diagnosticHUDLayoutIndedouble x = v39;
  v7->_legibilityOverlayLayoutIndedouble x = v41;
  [(PXStoryViewLayout *)v7 _invalidateMainModel];
  [(PXStoryViewLayout *)v7 _invalidateMainStoryLayout];

LABEL_17:
  return v7;
}

- (PXStoryViewLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewLayout.m", 126, @"%s is not available as initializer", "-[PXStoryViewLayout init]");

  abort();
}

@end