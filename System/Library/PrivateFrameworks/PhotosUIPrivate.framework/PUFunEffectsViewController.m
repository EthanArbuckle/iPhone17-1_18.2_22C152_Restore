@interface PUFunEffectsViewController
- (BOOL)inputHasKnownAdjustments;
- (BOOL)shouldHideBars;
- (CFXReviewViewController)effectsViewController;
- (PUFunEffectsViewController)initWithReviewAsset:(id)a3 mediaProvider:(id)a4;
- (PUMediaProvider)mediaProvider;
- (PUObserverRegistry)observerRegistry;
- (PUProgressIndicatorView)progressIndicatorView;
- (PUReviewAdjustmentOutput)exportAdjustmentOutput;
- (PUReviewAsset)reviewAsset;
- (PUReviewScreenBarsModel)reviewBarsModel;
- (PUReviewScreenControlBar)controlBar;
- (PUReviewScreenTopBar)topBar;
- (id)_barControlsForModelControls:(id)a3 transitioning:(BOOL)a4;
- (int64_t)inputAdjustmentBaseVersion;
- (unint64_t)exportCompletion;
- (void)_dismissProgressIndicator;
- (void)_exportWithCompletion:(unint64_t)a3;
- (void)_finishExportingWithMediaItem:(id)a3;
- (void)_handleCompletion:(unint64_t)a3;
- (void)_handleDidTapDoneButton:(id)a3;
- (void)_handleDidTapEditButton:(id)a3;
- (void)_handleDidTapFunEffectsButton:(id)a3;
- (void)_handleDidTapMarkupButton:(id)a3;
- (void)_handleDidTapRetakeButton:(id)a3;
- (void)_handleDidTapSendButton:(id)a3;
- (void)_handleDismissCompletion;
- (void)_handleExportFailureWithError:(id)a3;
- (void)_handleExportWithCompletion:(unint64_t)a3;
- (void)_setProgressIndicatorView:(id)a3;
- (void)_setShouldHideBars:(BOOL)a3;
- (void)_setShouldHideBars:(BOOL)a3 animated:(BOOL)a4;
- (void)_showProgressIndicator;
- (void)_signalCompletion:(unint64_t)a3 withSavedAsset:(id)a4;
- (void)_updateBars;
- (void)_updateLayout;
- (void)_updateProgressIndicatorWithProgress:(double)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6;
- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)reviewViewController:(id)a3 didFinishExportingMediaItem:(id)a4 withError:(id)a5;
- (void)reviewViewControllerDidHideUserInterface:(id)a3;
- (void)reviewViewControllerDidShowUserInterface:(id)a3;
- (void)reviewViewControllerEffectsButtonWasTapped:(id)a3;
- (void)setExportAdjustmentOutput:(id)a3;
- (void)setExportCompletion:(unint64_t)a3;
- (void)setReviewBarsModel:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUFunEffectsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_exportAdjustmentOutput, 0);
  objc_storeStrong((id *)&self->_controlBar, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_effectsViewController, 0);
  objc_storeStrong((id *)&self->_observerRegistry, 0);
  objc_storeStrong((id *)&self->_reviewBarsModel, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_reviewAsset, 0);
}

- (BOOL)shouldHideBars
{
  return self->_shouldHideBars;
}

- (void)_setProgressIndicatorView:(id)a3
{
}

- (PUProgressIndicatorView)progressIndicatorView
{
  return self->_progressIndicatorView;
}

- (void)setExportCompletion:(unint64_t)a3
{
  self->_exportCompletion = a3;
}

- (unint64_t)exportCompletion
{
  return self->_exportCompletion;
}

- (void)setExportAdjustmentOutput:(id)a3
{
}

- (PUReviewAdjustmentOutput)exportAdjustmentOutput
{
  return self->_exportAdjustmentOutput;
}

- (int64_t)inputAdjustmentBaseVersion
{
  return self->_inputAdjustmentBaseVersion;
}

- (BOOL)inputHasKnownAdjustments
{
  return self->_inputHasKnownAdjustments;
}

- (PUReviewScreenControlBar)controlBar
{
  return self->_controlBar;
}

- (PUReviewScreenTopBar)topBar
{
  return self->_topBar;
}

- (CFXReviewViewController)effectsViewController
{
  return self->_effectsViewController;
}

- (PUObserverRegistry)observerRegistry
{
  return self->_observerRegistry;
}

- (PUReviewScreenBarsModel)reviewBarsModel
{
  return self->_reviewBarsModel;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUReviewAsset)reviewAsset
{
  return self->_reviewAsset;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUFunEffectsViewController *)self observerRegistry];
  [v5 unregisterObserver:v4];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PUFunEffectsViewController *)self observerRegistry];
  [v5 registerObserver:v4];
}

- (void)_signalCompletion:(unint64_t)a3 withSavedAsset:(id)a4
{
  id v6 = a4;
  v7 = [(PUFunEffectsViewController *)self observerRegistry];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PUFunEffectsViewController__signalCompletion_withSavedAsset___block_invoke;
  v9[3] = &unk_1E5F25730;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [v7 enumerateObserversWithBlock:v9];
}

uint64_t __63__PUFunEffectsViewController__signalCompletion_withSavedAsset___block_invoke(void *a1, void *a2)
{
  return [a2 funEffectsViewController:a1[4] didSaveAsset:a1[5] withCompletion:a1[6]];
}

- (void)_updateProgressIndicatorWithProgress:(double)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = PLAssetImportGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    double v8 = a3;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "FunEffects updating progress: %.3f", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(PUFunEffectsViewController *)self progressIndicatorView];
  [v6 setCurrentProgress:a3];
}

- (void)_dismissProgressIndicator
{
  v3 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "FunEffects will dismiss progress indicator", buf, 2u);
  }

  id v4 = [(PUFunEffectsViewController *)self progressIndicatorView];
  [(PUFunEffectsViewController *)self _setProgressIndicatorView:0];
  if ([v4 isShowingProgress])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55__PUFunEffectsViewController__dismissProgressIndicator__block_invoke;
    v5[3] = &unk_1E5F2ED10;
    id v6 = v4;
    [v6 endShowingProgressImmediately:0 animated:1 withCompletionHandler:v5];
  }
}

uint64_t __55__PUFunEffectsViewController__dismissProgressIndicator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_showProgressIndicator
{
  v3 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "FunEffects will show progress indicator", v10, 2u);
  }

  id v4 = [(PUFunEffectsViewController *)self reviewAsset];
  unint64_t v5 = [v4 mediaType];

  if (v5 > 3) {
    id v6 = 0;
  }
  else {
    id v6 = off_1E5F25788[v5];
  }
  int v7 = [[PUProgressIndicatorView alloc] initWithStyle:0];
  [(PUProgressIndicatorView *)v7 setDeterminate:1];
  [(PUProgressIndicatorView *)v7 setShowsBackground:1];
  double v8 = PULocalizedString(v6);
  [(PUProgressIndicatorView *)v7 setLocalizedMessage:v8];

  [(PUProgressIndicatorView *)v7 beginShowingProgressWithDelay:1 animated:0.6];
  uint64_t v9 = [(PUFunEffectsViewController *)self view];
  [v9 addSubview:v7];

  [(PUFunEffectsViewController *)self _setProgressIndicatorView:v7];
}

- (void)_finishExportingWithMediaItem:(id)a3
{
  id v4 = a3;
  [(PUFunEffectsViewController *)self _dismissProgressIndicator];
  id v8 = [v4 adjustmentsData];

  unint64_t v5 = [(PUFunEffectsViewController *)self reviewAsset];
  id v6 = [(PUFunEffectsViewController *)self exportAdjustmentOutput];
  int v7 = [v5 reviewAssetWithAdjustmentOutput:v6 adjustmentData:v8 formatIdentifier:@"com.apple.FunEffects" version:@"1.0"];

  [(PUFunEffectsViewController *)self setExportAdjustmentOutput:0];
  [(PUFunEffectsViewController *)self _signalCompletion:[(PUFunEffectsViewController *)self exportCompletion] withSavedAsset:v7];
}

- (void)_handleExportFailureWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Failed to export FunEffects media with error: %{public}@", buf, 0xCu);
  }

  [(PUFunEffectsViewController *)self _dismissProgressIndicator];
  [(PUFunEffectsViewController *)self setExportAdjustmentOutput:0];
  id v6 = [(PUFunEffectsViewController *)self reviewAsset];
  unint64_t v7 = [v6 mediaType];

  id v8 = 0;
  if (v7 <= 3) {
    id v8 = off_1E5F25768[v7];
  }
  if (MEMORY[0x1B3E7A500]())
  {
    uint64_t v9 = NSString;
    id v10 = [v4 debugDescription];
    unint64_t v11 = [v9 stringWithFormat:@"[INTERNAL ONLY] %@", v10];
  }
  else
  {
    unint64_t v11 = 0;
  }
  v12 = (void *)MEMORY[0x1E4FB1418];
  v13 = PULocalizedString(v8);
  v14 = [v12 alertControllerWithTitle:v13 message:v11 preferredStyle:1];

  v15 = (void *)MEMORY[0x1E4FB1410];
  v16 = PULocalizedString(@"PHOTOEDIT_EDIT_ERROR_ALERT_OK_BUTTON");
  v17 = [v15 actionWithTitle:v16 style:0 handler:0];
  [v14 addAction:v17];

  [(PUFunEffectsViewController *)self presentViewController:v14 animated:1 completion:0];
}

- (void)_exportWithCompletion:(unint64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(PUFunEffectsViewController *)self setExportCompletion:a3];
  id v4 = [(PUFunEffectsViewController *)self reviewAsset];
  unint64_t v5 = objc_msgSend(v4, "adjustmentOutputForInputBaseVersion:withLivePhotoSupport:", -[PUFunEffectsViewController inputAdjustmentBaseVersion](self, "inputAdjustmentBaseVersion"), 0);
  if ([v4 mediaType] == 1) {
    [v5 renderedImageFileURL];
  }
  else {
  id v6 = [v5 renderedVideoFileURL];
  }
  unint64_t v7 = PLAssetExplorerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Export FunEffects media to %{public}@", (uint8_t *)&v11, 0xCu);
  }

  [(PUFunEffectsViewController *)self setExportAdjustmentOutput:v5];
  [(PUFunEffectsViewController *)self _showProgressIndicator];
  id v8 = [(PUFunEffectsViewController *)self effectsViewController];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(PUFunEffectsViewController *)self effectsViewController];
    [v10 exportMediaItemToFileURL:v6];
  }
}

- (void)_handleExportWithCompletion:(unint64_t)a3
{
  [(PUFunEffectsViewController *)self inputHasKnownAdjustments];
  [(PUFunEffectsViewController *)self _exportWithCompletion:a3];
}

- (void)_handleDismissCompletion
{
  [(PUFunEffectsViewController *)self inputHasKnownAdjustments];
  [(PUFunEffectsViewController *)self _signalCompletion:3 withSavedAsset:0];
}

- (void)_handleCompletion:(unint64_t)a3
{
  unint64_t v5 = [(PUFunEffectsViewController *)self exportAdjustmentOutput];

  if (!v5 && a3 <= 5)
  {
    if (((1 << a3) & 0x36) != 0)
    {
      [(PUFunEffectsViewController *)self _handleExportWithCompletion:a3];
    }
    else if (a3)
    {
      [(PUFunEffectsViewController *)self _handleDismissCompletion];
    }
    else
    {
      [(PUFunEffectsViewController *)self _signalCompletion:0 withSavedAsset:0];
    }
  }
}

- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6
{
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
}

- (void)reviewViewControllerDidShowUserInterface:(id)a3
{
}

- (void)reviewViewControllerDidHideUserInterface:(id)a3
{
}

- (void)reviewViewController:(id)a3 didFinishExportingMediaItem:(id)a4 withError:(id)a5
{
  if (a5) {
    -[PUFunEffectsViewController _handleExportFailureWithError:](self, "_handleExportFailureWithError:", a5, a4);
  }
  else {
    [(PUFunEffectsViewController *)self _finishExportingWithMediaItem:a4];
  }
}

- (void)reviewViewControllerEffectsButtonWasTapped:(id)a3
{
}

- (void)_handleDidTapSendButton:(id)a3
{
}

- (void)_handleDidTapEditButton:(id)a3
{
}

- (void)_handleDidTapMarkupButton:(id)a3
{
}

- (void)_handleDidTapFunEffectsButton:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__PUFunEffectsViewController__handleDidTapFunEffectsButton___block_invoke;
  aBlock[3] = &unk_1E5F2ED10;
  aBlock[4] = self;
  unint64_t v5 = (void (**)(void))_Block_copy(aBlock);
  id v6 = [(PUFunEffectsViewController *)self effectsViewController];
  unint64_t v7 = [v6 adjustmentsData];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    char v9 = (void *)MEMORY[0x1E4FB1410];
    id v10 = PULocalizedString(@"PHOTOEDIT_FUNEFFECTS_DISCARD_CHANGES_CANCEL");
    int v11 = [v9 actionWithTitle:v10 style:1 handler:&__block_literal_global_87];
    [v8 addAction:v11];

    v12 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v13 = PULocalizedString(@"PHOTOEDIT_FUNEFFECTS_DISCARD_CHANGES_CONFIRM");
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __60__PUFunEffectsViewController__handleDidTapFunEffectsButton___block_invoke_3;
    id v19 = &unk_1E5F2E898;
    uint64_t v20 = v5;
    v14 = [v12 actionWithTitle:v13 style:0 handler:&v16];
    objc_msgSend(v8, "addAction:", v14, v16, v17, v18, v19);

    v15 = [v8 popoverPresentationController];
    [v15 setSourceView:v4];
    [v4 bounds];
    objc_msgSend(v15, "setSourceRect:");
    [(PUFunEffectsViewController *)self presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    v5[2](v5);
  }
}

uint64_t __60__PUFunEffectsViewController__handleDidTapFunEffectsButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCompletion:3];
}

uint64_t __60__PUFunEffectsViewController__handleDidTapFunEffectsButton___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleDidTapDoneButton:(id)a3
{
}

- (void)_handleDidTapRetakeButton:(id)a3
{
}

- (void)_setShouldHideBars:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shouldHideBars != a3)
  {
    BOOL v4 = a4;
    self->_shouldHideBars = a3;
    if (a3) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
    unint64_t v7 = [(PUFunEffectsViewController *)self topBar];
    id v8 = [(PUFunEffectsViewController *)self controlBar];
    if (v4)
    {
      char v9 = +[PUOneUpSettings sharedInstance];
      [v9 chromeDefaultAnimationDuration];
      double v11 = v10;

      v12 = (void *)MEMORY[0x1E4FB1EB0];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __58__PUFunEffectsViewController__setShouldHideBars_animated___block_invoke;
      v13[3] = &unk_1E5F2D2C8;
      id v14 = v7;
      double v16 = v6;
      id v15 = v8;
      [v12 animateWithDuration:6 delay:v13 options:0 animations:v11 completion:0.0];
    }
    else
    {
      [v7 setAlpha:v6];
      [v8 setAlpha:v6];
    }
  }
}

uint64_t __58__PUFunEffectsViewController__setShouldHideBars_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  double v2 = *(double *)(a1 + 48);
  v3 = *(void **)(a1 + 40);
  return [v3 setAlpha:v2];
}

- (void)_setShouldHideBars:(BOOL)a3
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PUReviewScreenFunEffectsBarContext == a5) {
    [(PUFunEffectsViewController *)self _updateBars];
  }
}

- (id)_barControlsForModelControls:(id)a3 transitioning:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = v5;
  if (v4 && ([v5 containsObject:&unk_1F078BD68] & 1) != 0)
  {
    id v7 = (id)[v6 mutableCopy];
    [v7 removeObject:&unk_1F078BD68];
  }
  else
  {
    id v7 = v6;
  }

  return v7;
}

- (void)_updateBars
{
  id v9 = [(PUFunEffectsViewController *)self reviewBarsModel];
  v3 = [(PUFunEffectsViewController *)self controlBar];
  BOOL v4 = [v9 availableControls];
  id v5 = -[PUFunEffectsViewController _barControlsForModelControls:transitioning:](self, "_barControlsForModelControls:transitioning:", v4, [v9 isTransitioningWithCamera]);
  [v3 setAvailableButtons:v5];

  double v6 = [v9 enabledControls];
  [v3 setEnabledButtons:v6];

  [v9 controlCenterAlignmentPoint];
  objc_msgSend(v3, "setLayoutCenterAlignmentPoint:");
  uint64_t v7 = [v9 useVerticalControlLayout];
  [v3 setUseTransparentBackground:v7];
  [v3 setShouldLayoutVertically:v7];
  [v3 setUseTransparentTouches:1];
  id v8 = [(PUFunEffectsViewController *)self topBar];
  [v8 setBackgroundStyle:v7 ^ 1];
}

- (void)setReviewBarsModel:(id)a3
{
  id v5 = (PUReviewScreenBarsModel *)a3;
  reviewBarsModel = self->_reviewBarsModel;
  uint64_t v7 = v5;
  if (reviewBarsModel != v5)
  {
    [(PUReviewScreenBarsModel *)reviewBarsModel unregisterChangeObserver:self context:PUReviewScreenFunEffectsBarContext];
    [(PUReviewScreenBarsModel *)v7 registerChangeObserver:self context:PUReviewScreenFunEffectsBarContext];
    objc_storeStrong((id *)&self->_reviewBarsModel, a3);
    [(PUFunEffectsViewController *)self _updateBars];
  }
}

- (void)_updateLayout
{
  v3 = [(PUFunEffectsViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(PUFunEffectsViewController *)self view];
  uint64_t v13 = [v12 window];
  uint64_t v14 = [v13 _windowInterfaceOrientation];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  +[PUReviewScreenUtilities reviewScreenTopBarGeometryForReferenceBounds:withOrientation:](PUReviewScreenUtilities, "reviewScreenTopBarGeometryForReferenceBounds:withOrientation:", v14, v5, v7, v9, v11);
  long long v15 = v35;
  long long v16 = v36;
  uint64_t v17 = [(PUFunEffectsViewController *)self topBar];
  objc_msgSend(v17, "setBounds:", v15, v16);

  long long v18 = v37;
  id v19 = [(PUFunEffectsViewController *)self topBar];
  [v19 setCenter:v18];

  long long v32 = v38;
  long long v33 = v39;
  long long v34 = v40;
  uint64_t v20 = [(PUFunEffectsViewController *)self topBar];
  v31[0] = v32;
  v31[1] = v33;
  v31[2] = v34;
  [v20 setTransform:v31];

  v21 = [(PUFunEffectsViewController *)self progressIndicatorView];
  [v21 intrinsicContentSize];

  UIRectCenteredIntegralRectScale();
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [(PUFunEffectsViewController *)self progressIndicatorView];
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v61.receiver = self;
  v61.super_class = (Class)PUFunEffectsViewController;
  -[PUFunEffectsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v61, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  double v8 = [(PUFunEffectsViewController *)self reviewBarsModel];
  int v9 = [v8 shouldBarsCounterrotate];

  if (v9)
  {
    double v10 = [(PUFunEffectsViewController *)self topBar];
    double v11 = [v10 snapshotViewAfterScreenUpdates:0];
    v12 = [(PUFunEffectsViewController *)self view];
    [v12 bounds];
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;

    UIRectGetCenter();
    uint64_t v40 = v22;
    uint64_t v41 = v21;
    double v23 = [(PUFunEffectsViewController *)self view];
    double v24 = [v23 window];
    uint64_t v25 = [v24 _toWindowOrientation];

    double v26 = [(PUFunEffectsViewController *)self view];
    double v27 = [v26 window];
    uint64_t v28 = [v27 _fromWindowOrientation];

    double v29 = 0.0;
    double v30 = 0.0;
    if (v25 != 1)
    {
      if (v25 == 3)
      {
        double v30 = 1.57079633;
      }
      else if (v25 == 4)
      {
        double v30 = -1.57079633;
      }
      else
      {
        double v30 = 3.14159265;
        if (v25 != 2) {
          double v30 = 0.0;
        }
      }
    }
    if (v28 != 1)
    {
      switch(v28)
      {
        case 3:
          double v29 = 1.57079633;
          break;
        case 4:
          double v29 = -1.57079633;
          break;
        case 2:
          double v29 = 3.14159265;
          break;
        default:
          double v29 = 0.0;
          break;
      }
    }
    double v31 = v29 - v30;
    long long v32 = objc_alloc_init(PUReviewScreenBarsSnapshot);
    [(PUReviewScreenBarsSnapshot *)v32 addSubview:v11];
    long long v33 = [(PUFunEffectsViewController *)self view];
    [v33 addSubview:v32];

    long long v34 = (void *)MEMORY[0x1E4FB1EB0];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v50[3] = &unk_1E5F256E0;
    long long v35 = v32;
    uint64_t v54 = v14;
    uint64_t v55 = v16;
    uint64_t v56 = v18;
    uint64_t v57 = v20;
    uint64_t v58 = v41;
    uint64_t v59 = v40;
    v51 = v35;
    id v52 = v11;
    id v36 = v10;
    id v53 = v36;
    double v60 = v29;
    id v37 = v11;
    [v34 performWithoutAnimation:v50];
    [v36 setHidden:1];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v45[3] = &unk_1E5F25708;
    v46 = v35;
    double v47 = v31;
    double v48 = width;
    double v49 = height;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v42[3] = &unk_1E5F28AE8;
    v43 = v46;
    id v44 = v36;
    id v38 = v36;
    long long v39 = v46;
    [v7 animateAlongsideTransition:v45 completion:v42];
  }
}

uint64_t __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  [*(id *)(a1 + 48) bounds];
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  [*(id *)(a1 + 48) center];
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  CGAffineTransformMakeRotation(&v5, -*(double *)(a1 + 104));
  double v2 = *(void **)(a1 + 40);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setZRotation:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 48) * 0.5;
  double v3 = *(double *)(a1 + 56) * 0.5;
  CGAffineTransform v4 = *(void **)(a1 + 32);
  return objc_msgSend(v4, "setCenter:", v2, v3);
}

uint64_t __81__PUFunEffectsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  double v2 = *(void **)(a1 + 40);
  return [v2 setHidden:0];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PUFunEffectsViewController;
  [(PUFunEffectsViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(PUFunEffectsViewController *)self _updateLayout];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUFunEffectsViewController;
  [(PUFunEffectsViewController *)&v3 viewWillLayoutSubviews];
  [(PUFunEffectsViewController *)self _updateLayout];
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)PUFunEffectsViewController;
  [(PUFunEffectsViewController *)&v41 viewDidLoad];
  objc_super v3 = [(PUFunEffectsViewController *)self reviewAsset];
  CGAffineTransform v4 = [(PUFunEffectsViewController *)self mediaProvider];
  objc_super v5 = [v3 inputForAdjustmentWithMediaProvider:v4 canHandleAdjustments:&__block_literal_global_28491];

  self->_inputAdjustmentBaseVersion = [v5 adjustmentBaseVersion];
  double v6 = [v5 knownAdjustmentData];
  self->_inputHasKnownAdjustments = v6 != 0;

  uint64_t v47 = 0;
  double v48 = &v47;
  uint64_t v49 = 0x2050000000;
  id v7 = (void *)getCFXMediaItemClass_softClass;
  uint64_t v50 = getCFXMediaItemClass_softClass;
  if (!getCFXMediaItemClass_softClass)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    id v44 = __getCFXMediaItemClass_block_invoke;
    v45 = &unk_1E5F2E228;
    v46 = &v47;
    __getCFXMediaItemClass_block_invoke((uint64_t)&v42);
    id v7 = (void *)v48[3];
  }
  double v8 = v7;
  _Block_object_dispose(&v47, 8);
  id v9 = objc_alloc_init(v8);
  double v10 = [v5 knownAdjustmentData];
  [v9 setAdjustmentsData:v10];

  double v11 = [v5 baseImageFileURL];
  if (v11)
  {
    [v9 setOriginalAssetURL:v11];
  }
  else
  {
    v12 = [v5 baseVideoFileURL];
    [v9 setOriginalAssetURL:v12];
  }
  uint64_t v13 = [v3 mediaType];
  if (v13 == 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    if (v13 != 2) {
      goto LABEL_11;
    }
    uint64_t v14 = 1;
  }
  [v9 setType:v14];
LABEL_11:
  uint64_t v47 = 0;
  double v48 = &v47;
  uint64_t v49 = 0x2050000000;
  uint64_t v15 = (void *)getCFXReviewViewControllerClass_softClass;
  uint64_t v50 = getCFXReviewViewControllerClass_softClass;
  if (!getCFXReviewViewControllerClass_softClass)
  {
    uint64_t v42 = MEMORY[0x1E4F143A8];
    uint64_t v43 = 3221225472;
    id v44 = __getCFXReviewViewControllerClass_block_invoke;
    v45 = &unk_1E5F2E228;
    v46 = &v47;
    __getCFXReviewViewControllerClass_block_invoke((uint64_t)&v42);
    uint64_t v15 = (void *)v48[3];
  }
  uint64_t v40 = v3;
  uint64_t v16 = v15;
  _Block_object_dispose(&v47, 8);
  uint64_t v17 = (CFXReviewViewController *)[[v16 alloc] initWithMediaItem:v9];
  effectsViewController = self->_effectsViewController;
  self->_effectsViewController = v17;

  [(CFXReviewViewController *)self->_effectsViewController setDelegate:self];
  [(PUFunEffectsViewController *)self addChildViewController:self->_effectsViewController];
  uint64_t v19 = [(CFXReviewViewController *)self->_effectsViewController view];
  uint64_t v20 = [(PUFunEffectsViewController *)self view];
  [v20 addSubview:v19];

  [v19 setAutoresizingMask:18];
  [(CFXReviewViewController *)self->_effectsViewController didMoveToParentViewController:self];
  uint64_t v21 = objc_alloc_init(PUReviewScreenControlBar);
  uint64_t v22 = [(PUReviewScreenControlBar *)v21 funEffectsButton];
  [v22 setSelected:1];

  double v23 = [(PUReviewScreenControlBar *)v21 funEffectsButton];
  [v23 addTarget:self action:sel__handleDidTapFunEffectsButton_ forControlEvents:64];

  double v24 = [(PUReviewScreenControlBar *)v21 markupButton];
  [v24 addTarget:self action:sel__handleDidTapMarkupButton_ forControlEvents:64];

  uint64_t v25 = [(PUReviewScreenControlBar *)v21 editButton];
  [v25 addTarget:self action:sel__handleDidTapEditButton_ forControlEvents:64];

  double v26 = [(PUReviewScreenControlBar *)v21 sendButton];
  [v26 addTarget:self action:sel__handleDidTapSendButton_ forControlEvents:64];

  if (objc_opt_respondsToSelector()) {
    [(CFXReviewViewController *)self->_effectsViewController setEffectsPickerDrawer:v21];
  }
  controlBar = self->_controlBar;
  self->_controlBar = v21;
  uint64_t v28 = v21;

  [(PUReviewScreenControlBar *)v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:v28 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:156.0];
  [v29 setActive:1];
  double v30 = objc_alloc_init(PUReviewScreenTopBar);
  double v31 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F078BD38, &unk_1F078BD50, 0);
  [(PUReviewScreenTopBar *)v30 setAvailableButtons:v31];

  long long v32 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F078BD38, &unk_1F078BD50, 0);
  [(PUReviewScreenTopBar *)v30 setEnabledButtons:v32];

  long long v33 = [(PUReviewScreenTopBar *)v30 doneButton];
  [v33 addTarget:self action:sel__handleDidTapDoneButton_ forControlEvents:64];

  long long v34 = [(PUReviewScreenTopBar *)v30 retakeButton];
  [v34 addTarget:self action:sel__handleDidTapRetakeButton_ forControlEvents:64];

  long long v35 = [(PUFunEffectsViewController *)self view];
  [v35 addSubview:v30];

  topBar = self->_topBar;
  self->_topBar = v30;
  id v37 = v30;

  [(PUFunEffectsViewController *)self _updateBars];
  id v38 = [MEMORY[0x1E4FB1618] blackColor];

  long long v39 = [(PUFunEffectsViewController *)self view];
  [v39 setBackgroundColor:v38];
}

uint64_t __41__PUFunEffectsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = [v2 adjustmentFormatIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.FunEffects"];

  objc_super v5 = [v2 adjustmentFormatVersion];

  LODWORD(v2) = [v5 isEqualToString:@"1.0"];
  return v4 & v2;
}

- (PUFunEffectsViewController)initWithReviewAsset:(id)a3 mediaProvider:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PUFunEffectsViewController;
  double v10 = [(PUFunEffectsViewController *)&v15 initWithNibName:0 bundle:0];
  if (v10)
  {
    if (!v8 || !v9)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v10, @"PUFunEffectsViewController.m", 87, @"Invalid parameter not satisfying: %@", @"reviewAsset && mediaProvider" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_reviewAsset, a3);
    objc_storeStrong((id *)&v10->_mediaProvider, a4);
    double v11 = objc_alloc_init(PUObserverRegistry);
    observerRegistry = v10->_observerRegistry;
    v10->_observerRegistry = v11;
  }
  return v10;
}

@end