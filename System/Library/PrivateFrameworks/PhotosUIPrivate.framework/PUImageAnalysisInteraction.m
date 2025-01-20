@interface PUImageAnalysisInteraction
+ (double)interactionResetInterval;
+ (double)maxFocusAbsoluteValueForInteraction;
- (BOOL)_allowsSubjectLifting;
- (BOOL)actionInfoItemExistsAtLocation:(id)a3;
- (BOOL)allowsVKRemoveBackground;
- (BOOL)dataDetectorExistsAtLocation:(id)a3;
- (BOOL)hasActiveTextSelection;
- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5;
- (BOOL)imageAnalysisInteraction:(id)a3 shouldShowLookupForItemFromCallout:(id)a4;
- (BOOL)imageInteractionHasAnalysisAndSubjectLiftingEnabled;
- (BOOL)imageSubjectExistsAtLocation:(id)a3;
- (BOOL)interactionIsResetAndControlledByVKC;
- (BOOL)interactiveItemExistsAtLocation:(id)a3;
- (BOOL)isDrivingLivePhotoPlayback;
- (BOOL)isImageSubjectAnalysisAvailable;
- (BOOL)isImageSubjectAnalyzingFinished;
- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3;
- (BOOL)isSubjectInteractionInProgress;
- (BOOL)isVisualIntelligenceOverlayInitialized;
- (BOOL)shouldResetInteractionWhenNotDrivingLivePhotoPlayback;
- (BOOL)subjectHighlightActive;
- (BOOL)textExistsAtLocation:(id)a3;
- (BOOL)visualImageInteractionEnabled;
- (BOOL)visualSearchExistsAtLocation:(id)a3;
- (CGRect)contentFrame;
- (CGRect)contentsRect;
- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3;
- (NSTimer)pptVKAnalysisWaitingTimer;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingViewModel)browsingViewModel;
- (PUImageAnalysisInteraction)init;
- (PUImageAnalysisInteraction)initWithInteractionCreator:(id)a3;
- (PUImageAnalysisInteractionDelegate)delegate;
- (PXEventCoalescer)sizeChangeCoalescer;
- (PXUpdater)updater;
- (PXVKImageAnalysisInteraction)interaction;
- (UICoordinateSpace)contentCoordinateSpace;
- (UIEdgeInsets)additionalActionInfoEdgeInsets;
- (UILabel)debugLabel;
- (UIView)hostView;
- (id)contentImageForImageAnalysisInteraction:(id)a3;
- (id)contentViewForImageAnalysisInteraction:(id)a3;
- (id)interactionCreator;
- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3;
- (int64_t)vkOverlayUpdateToken;
- (void)_handleAssetViewModelChange:(id)a3;
- (void)_handleBrowsingViewModelChange:(id)a3;
- (void)_invalidateInteraction;
- (void)_ppt_fireVKAnalysisWaitingTimer;
- (void)_ppt_resetVKAnalysisWaitingTimer;
- (void)_resetInteraction;
- (void)_scheduleUpdate;
- (void)_updateAdditionalActionInfoEdgeInsets;
- (void)_updateContentsRect;
- (void)_updateInteraction;
- (void)_updateInteractionView;
- (void)_updateStatusCornerState;
- (void)beginImageSubjectAnalysisIfNecessary;
- (void)dealloc;
- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4;
- (void)imageAnalysisInteraction:(id)a3 livePhotoShouldPlay:(BOOL)a4;
- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4;
- (void)imageAnalysisInteractionDidDismissVisualSearchController:(id)a3;
- (void)imageAnalysisInteractionSubjectInteractionInProgressDidChange:(id)a3;
- (void)ppt_notifyWhenVKAnalysisIsReadyWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)setAdditionalActionInfoEdgeInsets:(UIEdgeInsets)a3;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)setContentCoordinateSpace:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentsRect:(CGRect)a3;
- (void)setDebugLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostView:(id)a3;
- (void)setInteractionIsResetAndControlledByVKC:(BOOL)a3;
- (void)setIsDrivingLivePhotoPlayback:(BOOL)a3;
- (void)setPptVKAnalysisWaitingTimer:(id)a3;
- (void)setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:(BOOL)a3;
- (void)setSizeChangeCoalescer:(id)a3;
- (void)setVkOverlayUpdateToken:(int64_t)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUImageAnalysisInteraction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong(&self->_interactionCreator, 0);
  objc_destroyWeak((id *)&self->_contentCoordinateSpace);
  objc_storeStrong((id *)&self->_sizeChangeCoalescer, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_pptVKAnalysisWaitingTimer, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_browsingViewModel);
  objc_destroyWeak((id *)&self->_assetViewModel);
}

- (CGRect)contentsRect
{
  double x = self->_contentsRect.origin.x;
  double y = self->_contentsRect.origin.y;
  double width = self->_contentsRect.size.width;
  double height = self->_contentsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXVKImageAnalysisInteraction)interaction
{
  return self->_interaction;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (id)interactionCreator
{
  return self->_interactionCreator;
}

- (void)setContentCoordinateSpace:(id)a3
{
}

- (UICoordinateSpace)contentCoordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentCoordinateSpace);
  return (UICoordinateSpace *)WeakRetained;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSizeChangeCoalescer:(id)a3
{
}

- (void)setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:(BOOL)a3
{
  self->_shouldResetInteractionWhenNotDrivingLivePhotoPlayback = a3;
}

- (BOOL)shouldResetInteractionWhenNotDrivingLivePhotoPlayback
{
  return self->_shouldResetInteractionWhenNotDrivingLivePhotoPlayback;
}

- (void)setDebugLabel:(id)a3
{
}

- (UILabel)debugLabel
{
  return self->_debugLabel;
}

- (void)setPptVKAnalysisWaitingTimer:(id)a3
{
}

- (NSTimer)pptVKAnalysisWaitingTimer
{
  return self->_pptVKAnalysisWaitingTimer;
}

- (void)setVkOverlayUpdateToken:(int64_t)a3
{
  self->_vkOverlayUpdateToken = a3;
}

- (int64_t)vkOverlayUpdateToken
{
  return self->_vkOverlayUpdateToken;
}

- (void)setInteractionIsResetAndControlledByVKC:(BOOL)a3
{
  self->_interactionIsResetAndControlledByVKC = a3;
}

- (BOOL)interactionIsResetAndControlledByVKC
{
  return self->_interactionIsResetAndControlledByVKC;
}

- (UIEdgeInsets)additionalActionInfoEdgeInsets
{
  double top = self->_additionalActionInfoEdgeInsets.top;
  double left = self->_additionalActionInfoEdgeInsets.left;
  double bottom = self->_additionalActionInfoEdgeInsets.bottom;
  double right = self->_additionalActionInfoEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIView)hostView
{
  return self->_hostView;
}

- (BOOL)isDrivingLivePhotoPlayback
{
  return self->_isDrivingLivePhotoPlayback;
}

- (void)setDelegate:(id)a3
{
}

- (PUImageAnalysisInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUImageAnalysisInteractionDelegate *)WeakRetained;
}

- (PUBrowsingViewModel)browsingViewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browsingViewModel);
  return (PUBrowsingViewModel *)WeakRetained;
}

- (PUAssetViewModel)assetViewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetViewModel);
  return (PUAssetViewModel *)WeakRetained;
}

- (void)ppt_notifyWhenVKAnalysisIsReadyWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    int v9 = [v8 launchedToTest];

    if (v9)
    {
      v10 = [(PUImageAnalysisInteraction *)self pptVKAnalysisWaitingTimer];
      int v11 = [v10 isValid];

      if (v11)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"PUImageAnalysisInteraction.m", 630, @"Should not request notification, when a request is already on going" object file lineNumber description];
      }
      v12 = (void *)MEMORY[0x1E4F908E8];
      v13 = [(PUImageAnalysisInteraction *)self assetViewModel];
      v14 = [v13 asset];
      char v15 = [v12 canRequestVKImageAnalysisForAsset:v14];

      v16 = [(PUImageAnalysisInteraction *)self assetViewModel];
      v17 = [v16 visualImageAnalysis];

      if (v17 || (v15 & 1) == 0)
      {
        [(PUImageAnalysisInteraction *)self _ppt_resetVKAnalysisWaitingTimer];
        location[1] = (id)MEMORY[0x1E4F143A8];
        location[2] = (id)3221225472;
        location[3] = __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke;
        location[4] = &unk_1E5F2EBA0;
        id v28 = v7;
        px_dispatch_on_main_queue();
      }
      else
      {
        objc_initWeak(location, self);
        v18 = (void *)MEMORY[0x1E4F1CB00];
        uint64_t v21 = MEMORY[0x1E4F143A8];
        uint64_t v22 = 3221225472;
        v23 = __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke_2;
        v24 = &unk_1E5F29240;
        id v25 = v7;
        objc_copyWeak(&v26, location);
        v19 = objc_msgSend(v18, "pu_scheduledTimerWithTimeInterval:repeats:block:", 0, &v21, a3);
        -[PUImageAnalysisInteraction setPptVKAnalysisWaitingTimer:](self, "setPptVKAnalysisWaitingTimer:", v19, v21, v22, v23, v24);

        objc_destroyWeak(&v26);
        objc_destroyWeak(location);
      }
    }
  }
}

uint64_t __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_copyWeak(&v3, (id *)(a1 + 40));
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v3);
}

void __91__PUImageAnalysisInteraction_ppt_notifyWhenVKAnalysisIsReadyWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained assetViewModel];
  id v3 = [v2 visualImageAnalysis];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v3 != 0);
}

- (void)_ppt_fireVKAnalysisWaitingTimer
{
  id v3 = [(PUImageAnalysisInteraction *)self pptVKAnalysisWaitingTimer];
  [v3 fire];

  [(PUImageAnalysisInteraction *)self _ppt_resetVKAnalysisWaitingTimer];
}

- (void)_ppt_resetVKAnalysisWaitingTimer
{
  id v3 = [(PUImageAnalysisInteraction *)self pptVKAnalysisWaitingTimer];
  [v3 invalidate];

  [(PUImageAnalysisInteraction *)self setPptVKAnalysisWaitingTimer:0];
}

- (BOOL)allowsVKRemoveBackground
{
  id v2 = +[PUOneUpSettings sharedInstance];
  char v3 = [v2 allowsVisualIntelligenceRemoveBackground];

  return v3;
}

- (void)_updateStatusCornerState
{
  char v3 = [(PUImageAnalysisInteraction *)self assetViewModel];
  if ([v3 statusCornerState] != 1)
  {
    v4 = [(PUImageAnalysisInteraction *)self interaction];
    if (([v4 actionInfoViewHidden] & 1) != 0 || !objc_msgSend(v4, "liveTextButtonVisible"))
    {
      if ([v3 statusCornerState] != 2)
      {
LABEL_8:

        goto LABEL_9;
      }
      v5 = v8;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v6 = __54__PUImageAnalysisInteraction__updateStatusCornerState__block_invoke_2;
    }
    else
    {
      v5 = v9;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v6 = __54__PUImageAnalysisInteraction__updateStatusCornerState__block_invoke;
    }
    v5[2] = v6;
    v5[3] = &unk_1E5F2ED10;
    id v7 = v3;
    v5[4] = v7;
    [v7 performChanges:v5];

    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __54__PUImageAnalysisInteraction__updateStatusCornerState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStatusCornerState:2];
}

uint64_t __54__PUImageAnalysisInteraction__updateStatusCornerState__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setStatusCornerState:0];
}

- (BOOL)isSubjectInteractionInProgress
{
  id v2 = [(PUImageAnalysisInteraction *)self interaction];
  char v3 = [v2 subjectInteractionInProgress];

  return v3;
}

- (BOOL)subjectHighlightActive
{
  id v2 = [(PUImageAnalysisInteraction *)self interaction];
  char v3 = [v2 subjectHighlightActive];

  return v3;
}

- (BOOL)imageInteractionHasAnalysisAndSubjectLiftingEnabled
{
  if ([(PUImageAnalysisInteraction *)self allowsVKRemoveBackground]
    && ([(PUImageAnalysisInteraction *)self interaction],
        char v3 = objc_claimAutoreleasedReturnValue(),
        [v3 analysis],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    v5 = [(PUImageAnalysisInteraction *)self interaction];
    unint64_t v6 = ((unint64_t)[v5 activeInteractionTypes] >> 3) & 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)beginImageSubjectAnalysisIfNecessary
{
  if ([(PUImageAnalysisInteraction *)self allowsVKRemoveBackground])
  {
    id v3 = [(PUImageAnalysisInteraction *)self interaction];
    [v3 beginImageSubjectAnalysisIfNecessary];
  }
}

- (BOOL)isImageSubjectAnalysisAvailable
{
  id v2 = [(PUImageAnalysisInteraction *)self interaction];
  char v3 = [v2 isSubjectHighlightAvailable];

  return v3;
}

- (BOOL)hasActiveTextSelection
{
  id v2 = [(PUImageAnalysisInteraction *)self interaction];
  char v3 = [v2 hasActiveTextSelection];

  return v3;
}

- (BOOL)isVisualIntelligenceOverlayInitialized
{
  id v2 = [(PUImageAnalysisInteraction *)self interaction];
  char v3 = [v2 analysis];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)imageSubjectExistsAtLocation:(id)a3
{
  id v4 = a3;
  if ([(PUImageAnalysisInteraction *)self allowsVKRemoveBackground])
  {
    v5 = [(PUImageAnalysisInteraction *)self interaction];
    unint64_t v6 = [(PUImageAnalysisInteraction *)self interaction];
    id v7 = [v6 view];
    [v4 locationInView:v7];
    char v8 = objc_msgSend(v5, "imageSubjectExistsAtPoint:");
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)actionInfoItemExistsAtLocation:(id)a3
{
  id v4 = a3;
  v5 = [(PUImageAnalysisInteraction *)self interaction];
  unint64_t v6 = [(PUImageAnalysisInteraction *)self interaction];
  id v7 = [v6 view];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  LOBYTE(v4) = objc_msgSend(v5, "actionInfoItemExistsAtPoint:", v9, v11);
  return (char)v4;
}

- (BOOL)interactiveItemExistsAtLocation:(id)a3
{
  id v4 = a3;
  v5 = [(PUImageAnalysisInteraction *)self interaction];
  unint64_t v6 = [(PUImageAnalysisInteraction *)self interaction];
  id v7 = [v6 view];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  LOBYTE(v4) = objc_msgSend(v5, "interactableItemExistsAtPoint:", v9, v11);
  return (char)v4;
}

- (BOOL)dataDetectorExistsAtLocation:(id)a3
{
  id v4 = a3;
  v5 = [(PUImageAnalysisInteraction *)self interaction];
  unint64_t v6 = [(PUImageAnalysisInteraction *)self interaction];
  id v7 = [v6 view];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  LOBYTE(v4) = objc_msgSend(v5, "dataDetectorExistsAtPoint:", v9, v11);
  return (char)v4;
}

- (BOOL)textExistsAtLocation:(id)a3
{
  id v4 = a3;
  v5 = [(PUImageAnalysisInteraction *)self interaction];
  unint64_t v6 = [(PUImageAnalysisInteraction *)self interaction];
  id v7 = [v6 view];
  [v4 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  LOBYTE(v4) = objc_msgSend(v5, "textExistsAtPoint:", v9, v11);
  return (char)v4;
}

- (BOOL)visualImageInteractionEnabled
{
  id v2 = self;
  char v3 = [(PUImageAnalysisInteraction *)self delegate];
  LOBYTE(v2) = [v3 analysisInteractionAllowedForImageAnalysisInteraction:v2];

  return (char)v2;
}

- (void)setIsDrivingLivePhotoPlayback:(BOOL)a3
{
  if (self->_isDrivingLivePhotoPlayback != a3)
  {
    self->_isDrivingLivePhotoPlayback = a3;
    if (!a3
      && [(PUImageAnalysisInteraction *)self shouldResetInteractionWhenNotDrivingLivePhotoPlayback])
    {
      [(PUImageAnalysisInteraction *)self _resetInteraction];
    }
    id v4 = [(PUImageAnalysisInteraction *)self delegate];
    [v4 imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange:self];
  }
}

- (void)imageAnalysisInteractionDidDismissVisualSearchController:(id)a3
{
  char v3 = [(PUImageAnalysisInteraction *)self assetViewModel];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__PUImageAnalysisInteraction_imageAnalysisInteractionDidDismissVisualSearchController___block_invoke;
  v5[3] = &unk_1E5F2ED10;
  id v6 = v3;
  id v4 = v3;
  [v4 performChanges:v5];
}

uint64_t __87__PUImageAnalysisInteraction_imageAnalysisInteractionDidDismissVisualSearchController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsVisualSearchCardShowing:0];
}

- (void)imageAnalysisInteraction:(id)a3 didTapVisualSearchIndicatorWithNormalizedBoundingBox:(CGRect)a4
{
  id v4 = [(PUImageAnalysisInteraction *)self assetViewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__PUImageAnalysisInteraction_imageAnalysisInteraction_didTapVisualSearchIndicatorWithNormalizedBoundingBox___block_invoke;
  v6[3] = &unk_1E5F2ED10;
  id v7 = v4;
  id v5 = v4;
  [v5 performChanges:v6];
}

uint64_t __108__PUImageAnalysisInteraction_imageAnalysisInteraction_didTapVisualSearchIndicatorWithNormalizedBoundingBox___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsVisualSearchCardShowing:1];
}

- (id)presentingViewControllerForImageAnalysisInteraction:(id)a3
{
  id v4 = [(PUImageAnalysisInteraction *)self delegate];
  id v5 = [v4 presentingViewControllerForImageAnalysisInteraction:self];

  return v5;
}

- (void)imageAnalysisInteraction:(id)a3 livePhotoShouldPlay:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PUImageAnalysisInteraction *)self assetViewModel];
  char v7 = [v6 isAccessoryViewVisible];

  if ((v7 & 1) == 0)
  {
    double v8 = [(PUImageAnalysisInteraction *)self browsingViewModel];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__PUImageAnalysisInteraction_imageAnalysisInteraction_livePhotoShouldPlay___block_invoke;
    v9[3] = &unk_1E5F2E120;
    v9[4] = self;
    BOOL v10 = v4;
    [v8 performChanges:v9];

    [(PUImageAnalysisInteraction *)self setIsDrivingLivePhotoPlayback:v4];
  }
}

void __75__PUImageAnalysisInteraction_imageAnalysisInteraction_livePhotoShouldPlay___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) browsingViewModel];
  [v2 setLivePhotoShouldPlay:v1];
}

- (BOOL)isShowingLivePhotoForImageAnalysisInteraction:(id)a3
{
  char v3 = [(PUImageAnalysisInteraction *)self assetViewModel];
  BOOL v4 = [v3 asset];
  BOOL v5 = [v4 playbackStyle] == 3;

  return v5;
}

- (void)imageAnalysisInteraction:(id)a3 liveTextButtonDidChangeToVisible:(BOOL)a4
{
}

uint64_t __88__PUImageAnalysisInteraction_imageAnalysisInteraction_liveTextButtonDidChangeToVisible___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateStatusCornerState];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateAdditionalActionInfoEdgeInsets];
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldShowLookupForItemFromCallout:(id)a4
{
  BOOL v5 = +[PUOneUpSettings sharedInstance];
  int v6 = [v5 allowsVisualIntelligenceVisualLookupInfoPanelMode];

  if (v6)
  {
    char v7 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 != 1
      || ([(PUImageAnalysisInteraction *)self browsingViewModel],
          double v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = [v9 horizontalSizeClass],
          v9,
          v10 != 2))
    {
      objc_initWeak(&location, self);
      dispatch_time_t v11 = dispatch_time(0, 200000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __90__PUImageAnalysisInteraction_imageAnalysisInteraction_shouldShowLookupForItemFromCallout___block_invoke;
      block[3] = &unk_1E5F2E4E8;
      objc_copyWeak(&v14, &location);
      block[4] = self;
      dispatch_after(v11, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  return 1;
}

void __90__PUImageAnalysisInteraction_imageAnalysisInteraction_shouldShowLookupForItemFromCallout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained delegate];
  [v2 showDetailsViewForImageAnalysisInteraction:*(void *)(a1 + 32)];
}

- (void)imageAnalysisInteractionSubjectInteractionInProgressDidChange:(id)a3
{
  id v4 = [(PUImageAnalysisInteraction *)self delegate];
  [v4 imageAnalysisInteractionSubjectInteractionInProgressDidChange:self];
}

- (BOOL)imageAnalysisInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4 forAnalysisType:(unint64_t)a5
{
  char v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = [(PUImageAnalysisInteraction *)self interaction];

  if (v10 != v9) {
    goto LABEL_2;
  }
  if ((v5 & 8) == 0)
  {
LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }
  if ([(PUImageAnalysisInteraction *)self allowsVKRemoveBackground])
  {
    if (![v9 isSubjectHighlightAvailable]) {
      goto LABEL_4;
    }
    if (objc_msgSend(v9, "imageSubjectExistsAtPoint:", x, y))
    {
      v13 = (void *)MEMORY[0x1E4F908E8];
      id v14 = [(PUImageAnalysisInteraction *)self assetViewModel];
      char v15 = [v14 asset];
      [v13 preheatResourcesForSubjectExtractionOfAsset:v15];

      goto LABEL_4;
    }
  }
LABEL_2:
  BOOL v11 = 0;
LABEL_5:

  return v11;
}

- (CGRect)contentsRectForImageAnalysisInteraction:(id)a3
{
  [(PUImageAnalysisInteraction *)self contentsRect];
  id v4 = [(PUImageAnalysisInteraction *)self hostView];
  [v4 bounds];

  char v5 = [(PUImageAnalysisInteraction *)self assetViewModel];
  int v6 = [v5 asset];
  [v6 aspectRatio];
  double v8 = v7;

  if (v8 < 0.0 || v8 > 0.0)
  {
    v13 = [(PUImageAnalysisInteraction *)self hostView];
    id v14 = [v13 traitCollection];
    [v14 displayScale];
    PFFrameApplyingContentsRectInBounds();

    PXRectNormalize();
  }
  else
  {
    double v9 = *MEMORY[0x1E4F91340];
    double v10 = *(double *)(MEMORY[0x1E4F91340] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F91340] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F91340] + 24);
  }
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (id)contentImageForImageAnalysisInteraction:(id)a3
{
  char v3 = [(PUImageAnalysisInteraction *)self assetViewModel];
  id v4 = [v3 asset];
  uint64_t v5 = [v4 mediaType];

  if (v5 != 2) {
    goto LABEL_6;
  }
  int v6 = [v3 videoPlayer];
  double v7 = [v6 videoSession];
  double v8 = (__CVBuffer *)[v7 currentPixelBuffer];

  if (!v8) {
    goto LABEL_8;
  }
  CGImageRef imageOut = 0;
  VTCreateCGImageFromCVPixelBuffer(v8, 0, &imageOut);
  if (imageOut)
  {
    double v9 = [v3 videoPlayer];
    double v10 = [v9 videoSession];
    double v11 = v10;
    if (v10) {
      [v10 preferredTransform];
    }
    uint64_t v12 = PXVKImageOrientationFromPreferredTransform();

    double v8 = [MEMORY[0x1E4FB1818] imageWithCGImage:imageOut scale:v12 orientation:1.0];
    CGImageRelease(imageOut);
  }
  else
  {
LABEL_6:
    double v8 = 0;
  }
LABEL_8:

  return v8;
}

- (id)contentViewForImageAnalysisInteraction:(id)a3
{
  id v4 = [(PUImageAnalysisInteraction *)self delegate];
  uint64_t v5 = [v4 contentViewForImageAnalysisInteraction:self];

  if (!v5)
  {
    uint64_t v5 = [(PUImageAnalysisInteraction *)self hostView];
  }
  return v5;
}

- (void)_updateAdditionalActionInfoEdgeInsets
{
  id v3 = [(PUImageAnalysisInteraction *)self interaction];
  [(PUImageAnalysisInteraction *)self additionalActionInfoEdgeInsets];
  PXEdgeInsetsAdd();
  objc_msgSend(v3, "setActionInfoEdgeInsets:");
}

- (void)setAdditionalActionInfoEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_additionalActionInfoEdgeInsets.left
    || a3.top != self->_additionalActionInfoEdgeInsets.top
    || a3.right != self->_additionalActionInfoEdgeInsets.right
    || a3.bottom != self->_additionalActionInfoEdgeInsets.bottom)
  {
    self->_additionalActionInfoEdgeInsets = a3;
    [(PUImageAnalysisInteraction *)self _updateAdditionalActionInfoEdgeInsets];
  }
}

- (BOOL)_allowsSubjectLifting
{
  id v3 = [(PUImageAnalysisInteraction *)self assetViewModel];
  [v3 accessoryViewVisibilityFraction];
  int v4 = PXFloatGreaterThanOrApproximatelyEqualToFloat();

  if (!v4) {
    return 1;
  }
  uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = [(PUImageAnalysisInteraction *)self browsingViewModel];
  uint64_t v8 = [v7 horizontalSizeClass];

  return !v6 || v8 == 1;
}

- (void)_updateInteraction
{
  id v3 = [(PUImageAnalysisInteraction *)self interaction];
  if (!v3) {
    goto LABEL_50;
  }
  int v4 = [(PUImageAnalysisInteraction *)self assetViewModel];
  uint64_t v5 = [(PUImageAnalysisInteraction *)self browsingViewModel];
  uint64_t v6 = [(PUImageAnalysisInteraction *)self delegate];
  if (![v4 isFullyInFocus]
    || ([v4 isBeingDismissed] & 1) != 0
    || [v4 statusCornerState] == 1)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = [v5 isInSelectionMode] ^ 1;
  }
  uint64_t v8 = [v3 analysis];
  double v9 = [v4 visualImageAnalysis];

  if (v8 != v9)
  {
    double v10 = [v4 visualImageAnalysis];
    [v3 setAnalysis:v10];
  }
  v29 = v6;
  if (v7)
  {
    double v11 = [v4 bestImage];
    uint64_t v12 = [v6 textsToHighlightForImageAnalysisInteraction:self];
    if ([v5 isChromeVisible])
    {
      v13 = [(PUImageAnalysisInteraction *)self sizeChangeCoalescer];
      if ([v13 hasPendingEvent] && (objc_msgSend(v3, "hasActiveTextSelection") & 1) == 0) {
        int v28 = [v3 highlightSelectableItems];
      }
      else {
        int v28 = 1;
      }
      v17 = v5;
    }
    else
    {
      v17 = v5;
      if ([v3 hasActiveTextSelection]) {
        int v28 = 1;
      }
      else {
        int v28 = [v3 highlightSelectableItems];
      }
    }
    BOOL v18 = [(PUImageAnalysisInteraction *)self _allowsSubjectLifting];
    v19 = [(PUImageAnalysisInteraction *)self assetViewModel];
    [v19 accessoryViewVisibilityFraction];
    int v20 = PXFloatGreaterThanOrApproximatelyEqualToFloat();

    if (v20)
    {
      if (v18)
      {
        uint64_t v21 = [(PUImageAnalysisInteraction *)self sizeChangeCoalescer];
        uint64_t v5 = v17;
        if ([v21 hasPendingEvent])
        {

          int v16 = v28;
          goto LABEL_54;
        }
        if (v29)
        {
          char v27 = [v29 imageAnalysisInteractionShouldHighlightSubjectWhenAccessoryIsVisible:self];

          int v16 = v28;
          if (v27)
          {
            uint64_t v15 = 1;
            uint64_t v22 = 8;
            goto LABEL_32;
          }
LABEL_54:
          uint64_t v15 = 0;
          uint64_t v22 = 0;
LABEL_32:
          if ([v3 highlightSelectableItems]) {
            uint64_t v14 = v22 | 2;
          }
          else {
            uint64_t v14 = v22;
          }
          if (v16)
          {
            [v3 updateActionInfoLayout];
            int v16 = 1;
          }
          goto LABEL_37;
        }

        uint64_t v15 = 1;
        uint64_t v22 = 8;
LABEL_31:
        int v16 = v28;
        goto LABEL_32;
      }
      v23 = [v3 analysis];
      int v24 = [v23 hasVisualSearchResults];

      uint64_t v15 = 0;
      if (v24) {
        uint64_t v22 = 4;
      }
      else {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
      if (v18) {
        uint64_t v22 = 9;
      }
      else {
        uint64_t v22 = 1;
      }
    }
    uint64_t v5 = v17;
    goto LABEL_31;
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
  double v11 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
LABEL_37:
  if ([v3 activeInteractionTypes] != v14) {
    [v3 setActiveInteractionTypes:v14];
  }
  id v25 = [v3 _photosImageForRemoveBackground];

  if (v25 != v11) {
    objc_msgSend(v3, "set_photosImageForRemoveBackground:", v11);
  }
  if (v15 != [v3 _photosInfoSingleTapSubjectModeEnabled]) {
    objc_msgSend(v3, "set_photosInfoSingleTapSubjectModeEnabled:", v15);
  }
  if (v16 == [v3 actionInfoViewHidden]) {
    [v3 setActionInfoViewHidden:v16 ^ 1u];
  }
  if (v7) {
    [v3 beginImageSubjectAnalysisIfNecessary];
  }
  if (v12) {
    [v3 highlightMatchesForStrings:v12 animated:1];
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __48__PUImageAnalysisInteraction__updateInteraction__block_invoke;
  v30[3] = &unk_1E5F2ECC8;
  id v31 = v4;
  id v32 = v3;
  id v26 = v4;
  [v26 performChanges:v30];

LABEL_50:
}

uint64_t __48__PUImageAnalysisInteraction__updateInteraction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisualSearchImageAnalysisInteraction:*(void *)(a1 + 40)];
}

- (void)_updateInteractionView
{
  id v3 = [(PUImageAnalysisInteraction *)self interaction];
  if (v3)
  {
    id v7 = v3;
    int v4 = [(PUImageAnalysisInteraction *)self hostView];
    uint64_t v5 = [v7 view];

    if (v4 != v5)
    {
      uint64_t v6 = [v7 view];
      [v6 removeInteraction:v7];

      [v4 addInteraction:v7];
    }

    id v3 = v7;
  }
}

- (void)setHostView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  if (self->_hostView != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_hostView, a3);
    [(PUImageAnalysisInteraction *)self _resetInteraction];
    uint64_t v5 = v6;
  }
}

- (void)_handleBrowsingViewModelChange:(id)a3
{
  id v4 = a3;
  if (([v4 chromeVisibilityDidChange] & 1) != 0
    || ([v4 isInteractingWithVideoScrubberDidChange] & 1) != 0
    || [v4 isInSelectionModeDidChange])
  {
    [(PUImageAnalysisInteraction *)self _invalidateInteraction];
  }
}

- (void)_updateContentsRect
{
  id v3 = [(PUImageAnalysisInteraction *)self assetViewModel];
  [v3 mainImageContentsRect];
  -[PUImageAnalysisInteraction setContentsRect:](self, "setContentsRect:");
}

- (void)_handleAssetViewModelChange:(id)a3
{
  id v5 = a3;
  if (([v5 accessoryViewVisibilityFractionChanged] & 1) != 0
    || ([v5 modelTileTransformChanged] & 1) != 0
    || [v5 isUserTransformingTileDidChange])
  {
    id v4 = [(PUImageAnalysisInteraction *)self sizeChangeCoalescer];
    [v4 inputEvent];
  }
  if ([v5 visualImageAnalysisChanged])
  {
    if ([(PUImageAnalysisInteraction *)self isDrivingLivePhotoPlayback])
    {
      [(PUImageAnalysisInteraction *)self setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:1];
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (([v5 bestImageChanged] & 1) != 0
    || ([v5 isFullyInFocusChanged] & 1) != 0
    || ([v5 accessoryViewVisibilityFractionChanged] & 1) != 0
    || ([v5 isBeingDismissedChanged] & 1) != 0
    || [v5 statusCornerStateChanged])
  {
LABEL_13:
    [(PUImageAnalysisInteraction *)self _invalidateInteraction];
    goto LABEL_14;
  }
  if ([v5 mainImageContentsRectChanged]) {
    [(PUImageAnalysisInteraction *)self _updateContentsRect];
  }
LABEL_14:
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(PUImageAnalysisInteraction *)self assetViewModel];

  if (v7 == v9)
  {
    [(PUImageAnalysisInteraction *)self _handleAssetViewModelChange:v6];
  }
  else
  {
    id v8 = [(PUImageAnalysisInteraction *)self browsingViewModel];

    if (v8 == v9) {
      [(PUImageAnalysisInteraction *)self _handleBrowsingViewModelChange:v6];
    }
  }
}

- (void)_invalidateInteraction
{
  id v2 = [(PUImageAnalysisInteraction *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInteraction];
}

- (void)_scheduleUpdate
{
}

void __45__PUImageAnalysisInteraction__scheduleUpdate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) updater];
  [v1 updateIfNeeded];
}

- (void)_resetInteraction
{
  [(PUImageAnalysisInteraction *)self setShouldResetInteractionWhenNotDrivingLivePhotoPlayback:0];
  interaction = self->_interaction;
  if (interaction)
  {
    [(PXVKImageAnalysisInteraction *)interaction setAnalysis:0];
    [(PXVKImageAnalysisInteraction *)self->_interaction setActiveInteractionTypes:0];
    [(PXVKImageAnalysisInteraction *)self->_interaction set_photosImageForRemoveBackground:0];
  }
  else
  {
    id v4 = [(PUImageAnalysisInteraction *)self interactionCreator];
    v4[2]();
    id v5 = (PXVKImageAnalysisInteraction *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_interaction;
    self->_interaction = v5;
  }
  [(PXVKImageAnalysisInteraction *)self->_interaction setDelegate:self];
  id v7 = [(PUImageAnalysisInteraction *)self sizeChangeCoalescer];
  [v7 inputEvent];

  [(PUImageAnalysisInteraction *)self _updateInteractionView];
  [(PUImageAnalysisInteraction *)self _invalidateInteraction];
}

- (PXEventCoalescer)sizeChangeCoalescer
{
  sizeChangeCoalescer = self->_sizeChangeCoalescer;
  if (!sizeChangeCoalescer)
  {
    id v4 = (void *)MEMORY[0x1E4F91248];
    [(id)objc_opt_class() interactionResetInterval];
    objc_msgSend(v4, "delayedCoalescerWithDelay:");
    id v5 = (PXEventCoalescer *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_sizeChangeCoalescer;
    self->_sizeChangeCoalescer = v5;

    [(PXEventCoalescer *)self->_sizeChangeCoalescer registerObserver:self];
    sizeChangeCoalescer = self->_sizeChangeCoalescer;
  }
  return sizeChangeCoalescer;
}

- (void)setContentsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_contentsRect))
  {
    self->_contentsRect.origin.CGFloat x = x;
    self->_contentsRect.origin.CGFloat y = y;
    self->_contentsRect.size.CGFloat width = width;
    self->_contentsRect.size.CGFloat height = height;
    id v8 = [(PUImageAnalysisInteraction *)self interaction];
    [v8 updateContentsRect];
  }
}

- (BOOL)visualSearchExistsAtLocation:(id)a3
{
  id v4 = a3;
  if ([(PUImageAnalysisInteraction *)self visualImageInteractionEnabled]
    && ([(PUImageAnalysisInteraction *)self interaction],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 activeInteractionTypes],
        v5,
        (v6 & 4) != 0))
  {
    id v8 = [(PUImageAnalysisInteraction *)self interaction];
    id v9 = [(PUImageAnalysisInteraction *)self interaction];
    double v10 = [v9 view];
    [v4 locationInView:v10];
    char v7 = objc_msgSend(v8, "visualSearchExistsAtPoint:");
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isImageSubjectAnalyzingFinished
{
  id v2 = [(PUImageAnalysisInteraction *)self interaction];
  char v3 = [v2 isSubjectAnalysisComplete];

  return v3;
}

- (void)setBrowsingViewModel:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browsingViewModel);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_browsingViewModel);
    [v5 unregisterChangeObserver:self];

    id v6 = objc_storeWeak((id *)&self->_browsingViewModel, obj);
    [obj registerChangeObserver:self];

    [(PUImageAnalysisInteraction *)self _invalidateInteraction];
  }
}

- (void)setAssetViewModel:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assetViewModel);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_assetViewModel);
    [v5 unregisterChangeObserver:self];

    id v6 = objc_storeWeak((id *)&self->_assetViewModel, obj);
    [obj registerChangeObserver:self];

    [(PUImageAnalysisInteraction *)self _updateContentsRect];
    [(PUImageAnalysisInteraction *)self _invalidateInteraction];
  }
}

- (PUImageAnalysisInteraction)initWithInteractionCreator:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PUImageAnalysisInteraction;
  id v5 = [(PUImageAnalysisInteraction *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F912F8]) initWithTarget:v5 needsUpdateSelector:sel__scheduleUpdate];
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v6;

    [(PXUpdater *)v5->_updater addUpdateSelector:sel__updateInteraction];
    if (v4) {
      id v8 = v4;
    }
    else {
      id v8 = &__block_literal_global_44204;
    }
    id v9 = _Block_copy(v8);
    id interactionCreator = v5->_interactionCreator;
    v5->_id interactionCreator = v9;

    [(PUImageAnalysisInteraction *)v5 _resetInteraction];
  }

  return v5;
}

uint64_t __57__PUImageAnalysisInteraction_initWithInteractionCreator___block_invoke()
{
  return MEMORY[0x1F4144068](0);
}

- (void)dealloc
{
  char v3 = [(PXVKImageAnalysisInteraction *)self->_interaction view];
  [v3 removeInteraction:self->_interaction];

  v4.receiver = self;
  v4.super_class = (Class)PUImageAnalysisInteraction;
  [(PUImageAnalysisInteraction *)&v4 dealloc];
}

- (PUImageAnalysisInteraction)init
{
  return [(PUImageAnalysisInteraction *)self initWithInteractionCreator:0];
}

+ (double)interactionResetInterval
{
  return 0.3;
}

+ (double)maxFocusAbsoluteValueForInteraction
{
  return 0.01;
}

@end