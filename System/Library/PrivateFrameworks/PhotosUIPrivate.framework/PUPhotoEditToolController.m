@interface PUPhotoEditToolController
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)displayedTimeForOriginalAssetTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalAssetTimeForDisplayedTime:(SEL)a3;
- (BOOL)canBecomeActiveTool;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResetToDefaultValue;
- (BOOL)enabled;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handlesMediaViewInsets;
- (BOOL)handlesVideoPlaying;
- (BOOL)hasMediaScrubber;
- (BOOL)isActiveTool;
- (BOOL)isActivelyAdjusting;
- (BOOL)isPerformingLiveInteraction;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)shouldHideMediaView;
- (BOOL)shouldObserveGenericFocusingViewForInteractionDelay;
- (BOOL)shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable;
- (BOOL)supportsGesturesOfType:(unint64_t)a3;
- (BOOL)supportsPreviewingOriginal;
- (BOOL)suppressesEditUpdates;
- (BOOL)toolbarGlyphUsesHierarchicalColor;
- (BOOL)wantsDefaultPreviewView;
- (BOOL)wantsFullscreen;
- (BOOL)wantsScrubberKeyControl;
- (BOOL)wantsSecondaryToolbarVisible;
- (BOOL)wantsShadowViews;
- (BOOL)wantsSliderKeyControl;
- (BOOL)wantsTapToToggleOriginalEnabled;
- (BOOL)wantsZoomAndPanEnabled;
- (CGRect)contentRectInCoordinateSpace:(id)a3;
- (NSArray)editActionActivities;
- (NSArray)leadingToolbarViews;
- (NSArray)trailingToolbarViews;
- (NSMutableArray)mutableEditActionActivites;
- (NSString)backdropViewGroupName;
- (NSString)localizedName;
- (NSString)localizedResetToolActionTitle;
- (NSString)selectedToolbarIconGlyphName;
- (NSString)toolbarIconAccessibilityLabel;
- (NSString)toolbarIconGlyphName;
- (NUComposition)storedComposition;
- (NURenderPipelineFilter)filter;
- (PEValuesCalculator)valuesCalculator;
- (PFSlowMotionTimeRangeMapper)slowMotionTimeMapper;
- (PICompositionController)compositionController;
- (PICompositionController)uneditedCompositionController;
- (PLEditSource)editSource;
- (PUEditableAsset)asset;
- (PUPhotoEditAggregateSession)aggregateSession;
- (PUPhotoEditToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUPhotoEditToolControllerDelegate)delegate;
- (PUPhotoEditToolControllerSpec)toolControllerSpec;
- (PUPhotoEditViewControllerSpec)photoEditSpec;
- (UIColor)preferredPreviewBackgroundColor;
- (UIEdgeInsets)additionalPreviewViewInsets;
- (UIEdgeInsets)preferredPreviewViewInsets;
- (UIView)centerToolbarView;
- (UIView)leftToolbarView;
- (UIView)toolContainerView;
- (double)toolGradientDistance;
- (id)_newTimeMapper;
- (id)_registerActionWithSourceComposition:(id)a3 localizedName:(id)a4;
- (id)accessibilityHUDItemForButton:(id)a3;
- (id)didModifyAdjustmentWithLocalizedName:(id)a3;
- (id)disabledToolAlertMessage;
- (id)disabledToolAlertTitle;
- (id)internalToolActionsForMenu;
- (id)ppt_didBecomeActiveToolBlock;
- (id)toolActionsForMenu;
- (int64_t)layoutOrientation;
- (int64_t)storedCompositionCount;
- (int64_t)toolControllerTag;
- (void)_layoutToolGradient;
- (void)_updateTraitCollectionAndLayoutReferenceSize;
- (void)_updateTraitCollectionAndLayoutReferenceSize:(CGSize)a3;
- (void)addEditActionActivity:(id)a3;
- (void)dealloc;
- (void)didBecomeActiveTool;
- (void)loadView;
- (void)prepareForToolTransitionWithCompletion:(id)a3;
- (void)removeEditActionActivity:(id)a3;
- (void)setActivelyAdjusting:(BOOL)a3;
- (void)setAggregateSession:(id)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHasMediaScrubber:(BOOL)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setMutableEditActionActivites:(id)a3;
- (void)setPerformingLiveInteraction:(BOOL)a3;
- (void)setPhotoEditSpec:(id)a3;
- (void)setPpt_didBecomeActiveToolBlock:(id)a3;
- (void)setSlowMotionTimeMapper:(id)a3;
- (void)setStoredComposition:(id)a3;
- (void)setStoredCompositionCount:(int64_t)a3;
- (void)setToolControllerSpec:(id)a3;
- (void)setToolGradientDistance:(double)a3;
- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6;
- (void)viewControllerSpec:(id)a3 didChange:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBecomeActiveTool;
- (void)willModifyAdjustment;
@end

@implementation PUPhotoEditToolController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ppt_didBecomeActiveToolBlock, 0);
  objc_storeStrong((id *)&self->_storedComposition, 0);
  objc_storeStrong((id *)&self->_slowMotionTimeMapper, 0);
  objc_storeStrong((id *)&self->_mutableEditActionActivites, 0);
  objc_storeStrong((id *)&self->_leftToolbarView, 0);
  objc_storeStrong((id *)&self->_toolbarIconAccessibilityLabel, 0);
  objc_storeStrong((id *)&self->_selectedToolbarIconGlyphName, 0);
  objc_storeStrong((id *)&self->_toolbarIconGlyphName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_toolContainerView, 0);
  objc_storeStrong((id *)&self->_aggregateSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoEditSpec, 0);
  objc_storeStrong((id *)&self->_toolControllerSpec, 0);
  objc_storeStrong((id *)&self->_valuesCalculator, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_gradientMask, 0);
  objc_storeStrong((id *)&self->_backdropViewGroupName, 0);
}

- (void)setPpt_didBecomeActiveToolBlock:(id)a3
{
}

- (id)ppt_didBecomeActiveToolBlock
{
  return self->_ppt_didBecomeActiveToolBlock;
}

- (BOOL)wantsSliderKeyControl
{
  return self->_wantsSliderKeyControl;
}

- (BOOL)wantsScrubberKeyControl
{
  return self->_wantsScrubberKeyControl;
}

- (void)setStoredCompositionCount:(int64_t)a3
{
  self->_storedCompositionCount = a3;
}

- (int64_t)storedCompositionCount
{
  return self->_storedCompositionCount;
}

- (void)setStoredComposition:(id)a3
{
}

- (NUComposition)storedComposition
{
  return self->_storedComposition;
}

- (void)setSlowMotionTimeMapper:(id)a3
{
}

- (PFSlowMotionTimeRangeMapper)slowMotionTimeMapper
{
  return self->_slowMotionTimeMapper;
}

- (void)setMutableEditActionActivites:(id)a3
{
}

- (NSMutableArray)mutableEditActionActivites
{
  return self->_mutableEditActionActivites;
}

- (UIView)leftToolbarView
{
  return self->_leftToolbarView;
}

- (void)setHasMediaScrubber:(BOOL)a3
{
  self->_hasMediaScrubber = a3;
}

- (BOOL)hasMediaScrubber
{
  return self->_hasMediaScrubber;
}

- (BOOL)isPerformingLiveInteraction
{
  return self->_performingLiveInteraction;
}

- (BOOL)isActivelyAdjusting
{
  return self->_activelyAdjusting;
}

- (NSString)toolbarIconAccessibilityLabel
{
  return self->_toolbarIconAccessibilityLabel;
}

- (BOOL)toolbarGlyphUsesHierarchicalColor
{
  return self->_toolbarGlyphUsesHierarchicalColor;
}

- (NSString)selectedToolbarIconGlyphName
{
  return self->_selectedToolbarIconGlyphName;
}

- (NSString)toolbarIconGlyphName
{
  return self->_toolbarIconGlyphName;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (double)toolGradientDistance
{
  return self->_toolGradientDistance;
}

- (UIView)toolContainerView
{
  return self->_toolContainerView;
}

- (PUPhotoEditAggregateSession)aggregateSession
{
  return self->_aggregateSession;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setDelegate:(id)a3
{
}

- (PUPhotoEditToolControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUPhotoEditToolControllerDelegate *)WeakRetained;
}

- (void)setPhotoEditSpec:(id)a3
{
}

- (PUPhotoEditViewControllerSpec)photoEditSpec
{
  return self->_photoEditSpec;
}

- (PUPhotoEditToolControllerSpec)toolControllerSpec
{
  return self->_toolControllerSpec;
}

- (PEValuesCalculator)valuesCalculator
{
  return self->_valuesCalculator;
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)setBackdropViewGroupName:(id)a3
{
}

- (NSString)backdropViewGroupName
{
  return self->_backdropViewGroupName;
}

- (id)_newTimeMapper
{
  v3 = [(PUPhotoEditToolController *)self delegate];
  int v4 = [v3 isHighframeRateVideo];

  if (!v4) {
    return 0;
  }
  v5 = [(PUPhotoEditToolController *)self compositionController];
  v6 = [v5 slomoAdjustmentController];

  memset(&v21, 0, sizeof(v21));
  if (v6)
  {
    [v6 startTime];
    [v6 endTime];
  }
  else
  {
    memset(&start, 0, sizeof(start));
    memset(&end, 0, sizeof(end));
  }
  CMTimeRangeFromTimeToTime(&v21, &start, &end);
  v8 = [(PUPhotoEditToolController *)self delegate];
  v9 = [v8 mediaView];

  v10 = [v9 player];
  v11 = v10;
  if (v10) {
    [v10 mediaDuration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  v13 = (void *)MEMORY[0x1E4F8CDA0];
  [v6 rate];
  *(float *)&double v15 = v14;
  CMTimeRange v17 = v21;
  v7 = [v13 timeRangeMapperForSourceDuration:&v17 slowMotionRate:1 slowMotionTimeRange:Seconds forExport:v15];

  return v7;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)displayedTimeForOriginalAssetTime:(SEL)a3
{
  v7 = [(PUPhotoEditToolController *)self delegate];
  int v8 = [v7 isHighframeRateVideo];

  if (v8)
  {
    slowMotionTimeMapper = self->_slowMotionTimeMapper;
    if (slowMotionTimeMapper
      || (v11 = [(PUPhotoEditToolController *)self _newTimeMapper],
          v12 = self->_slowMotionTimeMapper,
          self->_slowMotionTimeMapper = v11,
          v12,
          (slowMotionTimeMapper = self->_slowMotionTimeMapper) != 0))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&v15);
      *(float *)&Float64 Seconds = Seconds;
      [(PFSlowMotionTimeRangeMapper *)slowMotionTimeMapper scaledTimeForOriginalTime:Seconds];
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)&v15, v14, a4->var1);
      *a4 = v15;
    }
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
  retstr->var3 = a4->var3;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalAssetTimeForDisplayedTime:(SEL)a3
{
  v7 = [(PUPhotoEditToolController *)self delegate];
  int v8 = [v7 isHighframeRateVideo];

  if (v8)
  {
    slowMotionTimeMapper = self->_slowMotionTimeMapper;
    if (slowMotionTimeMapper
      || (v11 = [(PUPhotoEditToolController *)self _newTimeMapper],
          v12 = self->_slowMotionTimeMapper,
          self->_slowMotionTimeMapper = v11,
          v12,
          (slowMotionTimeMapper = self->_slowMotionTimeMapper) != 0))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
      Float64 Seconds = CMTimeGetSeconds((CMTime *)&v15);
      *(float *)&Float64 Seconds = Seconds;
      [(PFSlowMotionTimeRangeMapper *)slowMotionTimeMapper originalTimeForScaledTime:Seconds];
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)&v15, v14, a4->var1);
      *a4 = v15;
    }
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
  retstr->var3 = a4->var3;
  return result;
}

- (id)accessibilityHUDItemForButton:(id)a3
{
  return 0;
}

- (CGRect)contentRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(PUPhotoEditToolController *)self view];
  [v5 bounds];
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", v4);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)wantsShadowViews
{
  return 1;
}

- (BOOL)shouldHideMediaView
{
  return 0;
}

- (BOOL)wantsFullscreen
{
  return 0;
}

- (void)didBecomeActiveTool
{
  ppt_didBecomeActiveToolBlock = (void (**)(void))self->_ppt_didBecomeActiveToolBlock;
  if (ppt_didBecomeActiveToolBlock) {
    ppt_didBecomeActiveToolBlock[2]();
  }
}

- (void)willBecomeActiveTool
{
  if ([(PUPhotoEditToolController *)self hasMediaScrubber])
  {
    v3 = [(PUPhotoEditToolController *)self delegate];
    [v3 toolController:self showVideoScrubber:0 animated:0];
  }
  [(PUPhotoEditToolController *)self setSlowMotionTimeMapper:0];
}

- (BOOL)canBecomeActiveTool
{
  return 1;
}

- (BOOL)supportsPreviewingOriginal
{
  return 1;
}

- (BOOL)supportsGesturesOfType:(unint64_t)a3
{
  return 1;
}

- (void)setAggregateSession:(id)a3
{
  v5 = (PUPhotoEditAggregateSession *)a3;
  if (self->_aggregateSession != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_aggregateSession, a3);
    v5 = v6;
  }
}

- (void)setPerformingLiveInteraction:(BOOL)a3
{
  if (self->_performingLiveInteraction != a3)
  {
    self->_performingLiveInteraction = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained toolControllerDidChangeIsPerformingLiveInteraction:self];
  }
}

- (void)setActivelyAdjusting:(BOOL)a3
{
  if (self->_activelyAdjusting != a3)
  {
    self->_activelyAdjusting = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained toolControllerDidChangeIsActivelyAdjusting:self];
  }
}

- (void)setToolControllerSpec:(id)a3
{
  v5 = (PUPhotoEditToolControllerSpec *)a3;
  p_toolControllerSpec = &self->_toolControllerSpec;
  toolControllerSpec = self->_toolControllerSpec;
  if (toolControllerSpec != v5)
  {
    double v9 = v5;
    [(PUViewControllerSpec *)toolControllerSpec unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_toolControllerSpec, a3);
    [(PUPhotoEditToolControllerSpec *)*p_toolControllerSpec setLayoutOrientation:[(PUPhotoEditToolController *)self layoutOrientation]];
    if ([(PUPhotoEditToolController *)self px_isVisible]) {
      [(PUViewControllerSpec *)*p_toolControllerSpec registerChangeObserver:self];
    }
    double v8 = [(PUPhotoEditToolController *)self traitCollection];
    if ([v8 horizontalSizeClass]) {
      [(PUPhotoEditToolController *)self _updateTraitCollectionAndLayoutReferenceSize];
    }

    v5 = v9;
  }
}

- (void)_updateTraitCollectionAndLayoutReferenceSize
{
  v3 = [(PUPhotoEditToolController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[PUPhotoEditToolController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", v5, v7);
}

- (void)_updateTraitCollectionAndLayoutReferenceSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = [(PUPhotoEditToolController *)self traitCollection];
  toolControllerSpec = self->_toolControllerSpec;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PUPhotoEditToolController__updateTraitCollectionAndLayoutReferenceSize___block_invoke;
  v9[3] = &unk_1E5F2E580;
  v9[4] = self;
  id v10 = v6;
  CGFloat v11 = width;
  CGFloat v12 = height;
  id v8 = v6;
  [(PUViewControllerSpec *)toolControllerSpec performChanges:v9];
}

uint64_t __74__PUPhotoEditToolController__updateTraitCollectionAndLayoutReferenceSize___block_invoke(double *a1)
{
  [*(id *)(*((void *)a1 + 4) + 1048) setTraitCollection:*((void *)a1 + 5)];
  v2 = *(void **)(*((void *)a1 + 4) + 1048);
  double v3 = a1[6];
  double v4 = a1[7];
  return objc_msgSend(v2, "setLayoutReferenceSize:", v3, v4);
}

- (id)toolActionsForMenu
{
  return 0;
}

- (id)internalToolActionsForMenu
{
  return 0;
}

- (id)didModifyAdjustmentWithLocalizedName:(id)a3
{
  id v4 = a3;
  [(PUPhotoEditToolController *)self setStoredCompositionCount:[(PUPhotoEditToolController *)self storedCompositionCount] - 1];
  if ([(PUPhotoEditToolController *)self storedCompositionCount])
  {
    double v5 = 0;
  }
  else
  {
    double v6 = [(PUPhotoEditToolController *)self storedComposition];
    double v5 = [(PUPhotoEditToolController *)self _registerActionWithSourceComposition:v6 localizedName:v4];

    [(PUPhotoEditToolController *)self setStoredComposition:0];
  }

  return v5;
}

- (void)willModifyAdjustment
{
  [(PUPhotoEditToolController *)self setStoredCompositionCount:[(PUPhotoEditToolController *)self storedCompositionCount] + 1];
  double v3 = [(PUPhotoEditToolController *)self storedComposition];

  if (!v3)
  {
    id v5 = [(PUPhotoEditToolController *)self compositionController];
    id v4 = [v5 composition];
    [(PUPhotoEditToolController *)self setStoredComposition:v4];
  }
}

- (id)_registerActionWithSourceComposition:(id)a3 localizedName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUPhotoEditToolController *)self undoManager];
  double v9 = v8;
  if (!v8 || ([v8 isUndoing] & 1) != 0 || (objc_msgSend(v9, "isRedoing") & 1) != 0)
  {
    id v10 = 0;
  }
  else
  {
    CGFloat v12 = [(PUPhotoEditToolController *)self compositionController];
    double v13 = [v12 composition];
    char v14 = [v13 isEqualToComposition:v6];

    if (v14)
    {
      id v10 = 0;
    }
    else
    {
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F90148]) initWithCompositionController:v12 sourceComposition:v6];
      [v10 setLocalizedActionName:v7];
      [v10 registerWithUndoManager:v9];
    }
  }
  return v10;
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "layoutStyleChanged", a3))
  {
    [(PUPhotoEditToolController *)self specDidChange];
  }
}

- (id)disabledToolAlertMessage
{
  return (id)PELocalizedString();
}

- (id)disabledToolAlertTitle
{
  return (id)PELocalizedString();
}

- (BOOL)shouldObserveGenericFocusingViewForInteractionDelay
{
  return 1;
}

- (BOOL)shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable
{
  return 0;
}

- (BOOL)isActiveTool
{
  uint64_t v3 = [(PUPhotoEditToolController *)self delegate];
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  id v5 = [(PUPhotoEditToolController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = [(PUPhotoEditToolController *)self delegate];
  id v8 = [v7 currentTool];
  BOOL v9 = v8 == self;

  return v9;
}

- (int64_t)toolControllerTag
{
  return 0;
}

- (void)prepareForToolTransitionWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (NSArray)trailingToolbarViews
{
  return 0;
}

- (UIView)centerToolbarView
{
  return 0;
}

- (NSArray)leadingToolbarViews
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  if (!self->_enabled && a3) {
    [(PUPhotoEditToolController *)self willBecomeEnabled];
  }
  self->_enabled = a3;
}

- (NSArray)editActionActivities
{
  v2 = (void *)[(NSMutableArray *)self->_mutableEditActionActivites copy];
  return (NSArray *)v2;
}

- (void)removeEditActionActivity:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->_mutableEditActionActivites, "containsObject:")) {
    [(NSMutableArray *)self->_mutableEditActionActivites removeObject:v4];
  }
}

- (void)addEditActionActivity:(id)a3
{
  id v4 = a3;
  mutableEditActionActivites = self->_mutableEditActionActivites;
  id v8 = v4;
  if (!mutableEditActionActivites)
  {
    char v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_mutableEditActionActivites;
    self->_mutableEditActionActivites = v6;

    id v4 = v8;
    mutableEditActionActivites = self->_mutableEditActionActivites;
  }
  if (([(NSMutableArray *)mutableEditActionActivites containsObject:v4] & 1) == 0) {
    [(NSMutableArray *)self->_mutableEditActionActivites addObject:v8];
  }
}

- (void)_layoutToolGradient
{
  if (self->_gradientView)
  {
    uint64_t v3 = [(PUPhotoEditToolController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    double v8 = 0.0;
    -[CEKEdgeGradientView setFrame:](self->_gradientMask, "setFrame:", 0.0, 0.0, v5, v7);
    int64_t v9 = [(PUPhotoEditToolController *)self layoutOrientation];
    gradientMask = self->_gradientMask;
    if (v9 == 1)
    {
      [(CEKEdgeGradientView *)gradientMask setGradientDirection:0];
      [(PUPhotoEditToolController *)self toolGradientDistance];
      double v8 = v7 - v11;
      double v12 = 0.0;
    }
    else
    {
      [(CEKEdgeGradientView *)gradientMask setGradientDirection:1];
      [(PUPhotoEditToolController *)self toolGradientDistance];
      double v12 = v5 - v13;
    }
    -[CEKEdgeGradientView setContentInsets:](self->_gradientMask, "setContentInsets:", v8, v12, 0.0, 0.0);
    char v14 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v15 = [v14 currentLayoutStyle];

    if (v15 == 4)
    {
      if (v7 <= 650.0) {
        double v16 = v7;
      }
      else {
        double v16 = 650.0;
      }
      double v17 = (v7 - v16) * 0.5;
      double v18 = v16 * 0.1;
      double v19 = v17;
    }
    else
    {
      if (v5 >= v7) {
        double v20 = v7;
      }
      else {
        double v20 = v5;
      }
      double v19 = v20 * 0.03;
      double v18 = v20 * 0.07;
      double v21 = 44.0;
      if (v9 == 1) {
        double v21 = 0.0;
      }
      double v17 = v19 + v21;
    }
    v22 = self->_gradientMask;
    -[CEKEdgeGradientView setGradientDimensions:](v22, "setGradientDimensions:", v17, v18, v18, v19);
  }
}

- (void)setToolGradientDistance:(double)a3
{
  if (self->_toolGradientDistance != a3)
  {
    self->_toolGradientDistance = a3;
    [(PUPhotoEditToolController *)self _layoutToolGradient];
  }
}

- (PICompositionController)uneditedCompositionController
{
  uint64_t v3 = [(PUPhotoEditToolController *)self delegate];
  double v4 = [v3 toolControllerUneditedCompositionController:self];

  return (PICompositionController *)v4;
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  if (self->_layoutOrientation != a3)
  {
    self->_layoutOrientation = a3;
    [(PUPhotoEditToolControllerSpec *)self->_toolControllerSpec setLayoutOrientation:"setLayoutOrientation:"];
    id v5 = [(PUPhotoEditToolController *)self view];
    [v5 setNeedsLayout];
  }
}

- (void)setLayoutOrientation:(int64_t)a3
{
}

- (NURenderPipelineFilter)filter
{
  return 0;
}

- (BOOL)handlesMediaViewInsets
{
  return 0;
}

- (BOOL)handlesVideoPlaying
{
  return 0;
}

- (BOOL)suppressesEditUpdates
{
  return 0;
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 0;
}

- (BOOL)wantsTapToToggleOriginalEnabled
{
  return 1;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 0;
}

- (UIColor)preferredPreviewBackgroundColor
{
  return 0;
}

- (BOOL)wantsDefaultPreviewView
{
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (UIEdgeInsets)additionalPreviewViewInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)preferredPreviewViewInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSString)localizedResetToolActionTitle
{
  return 0;
}

- (BOOL)canResetToDefaultValue
{
  return 0;
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  double v11 = (PUEditableAsset *)a3;
  double v12 = (PICompositionController *)a4;
  double v13 = (PLEditSource *)a5;
  char v14 = (PEValuesCalculator *)a6;
  if (!v12)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PUPhotoEditToolController.m", 244, @"Invalid parameter not satisfying: %@", @"compositionController" object file lineNumber description];
  }
  compositionController = self->_compositionController;
  if (compositionController) {
    BOOL v16 = compositionController == v12;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"PUPhotoEditToolController.m" lineNumber:245 description:@"Can only set up the composition once"];
  }
  editSource = self->_editSource;
  if (editSource) {
    BOOL v18 = editSource == v13;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"PUPhotoEditToolController.m" lineNumber:246 description:@"Can only set up the edit source once"];
  }
  valuesCalculator = self->_valuesCalculator;
  if (valuesCalculator) {
    BOOL v20 = valuesCalculator == v14;
  }
  else {
    BOOL v20 = 1;
  }
  if (!v20)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2 object:self file:@"PUPhotoEditToolController.m" lineNumber:247 description:@"Can only set up the values calculator once"];
  }
  asset = self->_asset;
  self->_asset = v11;
  v31 = v11;

  v22 = self->_compositionController;
  self->_compositionController = v12;
  v23 = v12;

  v24 = self->_editSource;
  self->_editSource = v13;
  v25 = v13;

  v26 = self->_valuesCalculator;
  self->_valuesCalculator = v14;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditToolController;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  -[PUPhotoEditToolController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", width, height);
}

- (void)viewDidLayoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)PUPhotoEditToolController;
  [(PUPhotoEditToolController *)&v25 viewDidLayoutSubviews];
  if (self->_gradientView)
  {
    double v3 = [(PUPhotoEditToolController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    -[_PUPhotoEditToolGradientView setFrame:](self->_gradientView, "setFrame:", v5, v7, v9, v11);
    int64_t v12 = [(PUPhotoEditToolController *)self layoutOrientation];
    double v13 = v5;
    double v14 = v7;
    double v15 = v9;
    double v16 = v11;
    if (v12 == 1)
    {
      CGFloat v17 = CGRectGetMaxY(*(CGRect *)&v13) + -141.0;
      BOOL v18 = [(PUPhotoEditToolController *)self toolContainerView];
      double v19 = v18;
      double v20 = 141.0;
      double v21 = 0.0;
      double v22 = v17;
      double v23 = v9;
    }
    else
    {
      CGFloat v24 = CGRectGetMaxX(*(CGRect *)&v13) + -141.0;
      BOOL v18 = [(PUPhotoEditToolController *)self toolContainerView];
      double v19 = v18;
      double v23 = 141.0;
      double v22 = 0.0;
      double v21 = v24;
      double v20 = v11;
    }
    objc_msgSend(v18, "setFrame:", v21, v22, v23, v20);

    [(PUPhotoEditToolController *)self _layoutToolGradient];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditToolController;
  [(PUPhotoEditToolController *)&v4 viewDidDisappear:a3];
  [(PUViewControllerSpec *)self->_toolControllerSpec unregisterChangeObserver:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditToolController;
  [(PUPhotoEditToolController *)&v5 viewDidAppear:a3];
  [(PUPhotoEditToolController *)self becomeFirstResponder];
  if (![(PUPhotoEditToolController *)self hasMediaScrubber])
  {
    objc_super v4 = [(PUPhotoEditToolController *)self delegate];
    [v4 toolController:self showVideoScrubber:1 animated:1];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditToolController;
  [(PUPhotoEditToolController *)&v6 viewWillAppear:a3];
  objc_super v4 = [(PUPhotoEditToolController *)self view];
  [v4 bringSubviewToFront:self->_gradientView];

  [(PUPhotoEditToolController *)self _updateTraitCollectionAndLayoutReferenceSize];
  [(PUViewControllerSpec *)self->_toolControllerSpec registerChangeObserver:self];
  if ([(PUPhotoEditToolController *)self wantsZoomAndPanEnabled])
  {
    objc_super v5 = [(PUPhotoEditToolController *)self view];
    [v5 setToolController:self];
  }
}

- (void)loadView
{
  id v12 = (id)objc_opt_new();
  [(PUPhotoEditToolController *)self setView:v12];
  double v3 = objc_alloc_init(_PUPhotoEditToolGradientView);
  gradientView = self->_gradientView;
  self->_gradientView = v3;

  objc_super v5 = [(PUPhotoEditToolController *)self view];
  [v5 addSubview:self->_gradientView];

  id v6 = objc_alloc(MEMORY[0x1E4F57D48]);
  double v7 = (CEKEdgeGradientView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  gradientMask = self->_gradientMask;
  self->_gradientMask = v7;

  [(CEKEdgeGradientView *)self->_gradientMask setEdgeGradientStyleMask];
  [(_PUPhotoEditToolGradientView *)self->_gradientView setMaskView:self->_gradientMask];
  double v9 = objc_alloc_init(_PUPhotoEditToolContainerView);
  toolContainerView = self->_toolContainerView;
  self->_toolContainerView = &v9->super;

  double v11 = [(UIView *)self->_toolContainerView layer];
  [v11 setMasksToBounds:0];

  [(_PUPhotoEditToolGradientView *)self->_gradientView addSubview:self->_toolContainerView];
  self->_toolGradientDistance = 141.0;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditToolController;
  [(PUPhotoEditToolController *)&v4 dealloc];
}

- (PUPhotoEditToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoEditToolController;
  objc_super v4 = [(PUPhotoEditToolController *)&v10 initWithNibName:0 bundle:0];
  if (v4)
  {
    objc_super v5 = objc_alloc_init(PUPhotoEditToolControllerSpec);
    toolControllerSpec = v4->_toolControllerSpec;
    v4->_toolControllerSpec = v5;

    v4->_enabled = 1;
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v11[2] = objc_opt_class();
    v11[3] = objc_opt_class();
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
    id v8 = (id)[(PUPhotoEditToolController *)v4 registerForTraitChanges:v7 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v4;
}

@end