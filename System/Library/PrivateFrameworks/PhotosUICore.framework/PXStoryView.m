@interface PXStoryView
+ (NSString)allDiagnosticDescriptions;
+ (void)dumpTapToRadarDiagnosticAttachmentsToURL:(id)a3 completionHandler:(id)a4;
- (BOOL)_handlePrimaryInteractionAtPoint:(CGPoint)a3;
- (BOOL)_isRTL;
- (BOOL)acceptsFirstResponder;
- (BOOL)disableGestures;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isActive;
- (BOOL)isTouching;
- (BOOL)verticalSwipeGestureRecognizerHelper:(id)a3 shouldRecognizeSwipeDownGestureRecognizer:(id)a4;
- (NSArray)swipeGestureRecognizers;
- (NSMutableArray)lastDemotedDisplayAssets;
- (NSMutableSet)activeRemoteGestureRecognizers;
- (OS_dispatch_queue)storyQueue;
- (PXGView)tungstenView;
- (PXGViewCoordinator)tungstenViewCoordinator;
- (PXMediaProvider)mediaProvider;
- (PXStoryModel)mainModel;
- (PXStoryPacingTimeSource)timeSource;
- (PXStoryView)initWithCoder:(id)a3;
- (PXStoryView)initWithFrame:(CGRect)a3;
- (PXStoryView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (PXStoryViewConfiguration)viewConfiguration;
- (PXStoryViewDismissalController)dismissalController;
- (PXStoryViewLayout)viewLayout;
- (PXStoryViewModel)viewModel;
- (PXTouchingUIGestureRecognizer)touchingGestureRecognizer;
- (PXUpdater)updater;
- (PXVerticalSwipeGestureRecognizerHelper)swipeDownGestureHelper;
- (UILongPressGestureRecognizer)anyIndirectTouchGestureRecognizer;
- (UILongPressGestureRecognizer)anyPressGestureRecognizer;
- (UILongPressGestureRecognizer)longPressGestureRecognizer;
- (UIPanGestureRecognizer)panDownGestureRecognizer;
- (UIPanGestureRecognizer)panUpGestureRecognizer;
- (UITapGestureRecognizer)menuGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (id)_storyHitTestResultAtPoint:(CGPoint)a3;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (id)mainItemReference;
- (void)_changeColorGrade;
- (void)_changeOverallDuration:(int64_t)a3;
- (void)_changeStyle;
- (void)_considerUpdatingFocusForChrome;
- (void)_considerUpdatingFocusForInfoPanel;
- (void)_considerUpdatingFocusForRelatedOverlay;
- (void)_editCurrentChapter;
- (void)_handleAnyTouchOrPressGesture:(id)a3;
- (void)_handleArrowButton:(id)a3;
- (void)_handleEdgeTap:(unint64_t)a3;
- (void)_handleLongPress:(id)a3;
- (void)_handleMenuGestureRecognizer:(id)a3;
- (void)_handlePanDown:(id)a3;
- (void)_handlePlayPauseGesture:(id)a3;
- (void)_handleRelatedKeyboardNavigation:(unint64_t)a3;
- (void)_handleSwipeGesture:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_handleTwoFingerTap:(id)a3;
- (void)_hideRelatedOverlay;
- (void)_initializeGestureRecognizers;
- (void)_invalidateBackgroundColor;
- (void)_invalidateGestureRecognizers;
- (void)_invalidateMainModel;
- (void)_moveLeftAfterEdgeTap:(BOOL)a3;
- (void)_moveRightAfterEdgeTap:(BOOL)a3;
- (void)_skipToSegmentWithOffset:(int64_t)a3 afterEdgeTap:(BOOL)a4;
- (void)_toggleChrome;
- (void)_togglePlayback;
- (void)_updateBackgroundColor;
- (void)_updateGestureRecognizers;
- (void)_updateMainModel;
- (void)cancelOperation:(id)a3;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)insertNewline:(id)a3;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)moveLeft:(id)a3;
- (void)moveRight:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDisableGestures:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsTouching:(BOOL)a3;
- (void)setMainModel:(id)a3;
- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3;
- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3;
@end

@implementation PXStoryView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tungstenViewCoordinator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_viewLayout, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_timeSource, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewConfiguration, 0);
  objc_storeStrong((id *)&self->_activeRemoteGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_anyPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_anyIndirectTouchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_swipeDownGestureHelper, 0);
  objc_storeStrong((id *)&self->_panDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
  objc_storeStrong((id *)&self->_dismissalController, 0);
  objc_storeStrong((id *)&self->_lastDemotedDisplayAssets, 0);
}

- (void)setDisableGestures:(BOOL)a3
{
  self->_disableGestures = a3;
}

- (BOOL)disableGestures
{
  return self->_disableGestures;
}

- (PXGViewCoordinator)tungstenViewCoordinator
{
  return self->_tungstenViewCoordinator;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)isTouching
{
  return self->_isTouching;
}

- (PXStoryViewLayout)viewLayout
{
  return self->_viewLayout;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXStoryPacingTimeSource)timeSource
{
  return self->_timeSource;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryViewConfiguration)viewConfiguration
{
  return self->_viewConfiguration;
}

- (NSMutableSet)activeRemoteGestureRecognizers
{
  return self->_activeRemoteGestureRecognizers;
}

- (UILongPressGestureRecognizer)anyPressGestureRecognizer
{
  return self->_anyPressGestureRecognizer;
}

- (UILongPressGestureRecognizer)anyIndirectTouchGestureRecognizer
{
  return self->_anyIndirectTouchGestureRecognizer;
}

- (PXTouchingUIGestureRecognizer)touchingGestureRecognizer
{
  return self->_touchingGestureRecognizer;
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
}

- (NSArray)swipeGestureRecognizers
{
  return self->_swipeGestureRecognizers;
}

- (PXVerticalSwipeGestureRecognizerHelper)swipeDownGestureHelper
{
  return self->_swipeDownGestureHelper;
}

- (UIPanGestureRecognizer)panDownGestureRecognizer
{
  return self->_panDownGestureRecognizer;
}

- (UIPanGestureRecognizer)panUpGestureRecognizer
{
  return self->_panUpGestureRecognizer;
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4 = a3;
  v5 = [(PXStoryView *)self viewModel];
  [v4 addSubprovider:v5];

  v6 = [(PXStoryView *)self tungstenView];
  [v4 addSubprovider:v6];

  id v7 = [(PXStoryView *)self viewLayout];
  [v4 addSubprovider:v7];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)ViewModelObservationContext_130688 == a5)
  {
    id v11 = v9;
    if ((a4 & 0x2008) != 0)
    {
      [(PXStoryView *)self _invalidateGestureRecognizers];
      id v9 = v11;
    }
    if ((a4 & 0x10400000020) != 0)
    {
      [(PXStoryView *)self _invalidateBackgroundColor];
      id v9 = v11;
    }
    if ((a4 & 0x40) != 0)
    {
      [(PXStoryView *)self _invalidateMainModel];
      id v9 = v11;
    }
  }
  else if ((void *)ModelObservationContext_130689 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryView.m" lineNumber:1148 description:@"Code which should be unreachable has been reached"];

    abort();
  }
}

- (void)setMainModel:(id)a3
{
  v5 = (PXStoryModel *)a3;
  mainModel = self->_mainModel;
  if (mainModel != v5)
  {
    id v7 = v5;
    [(PXStoryModel *)mainModel unregisterChangeObserver:self context:ModelObservationContext_130689];
    objc_storeStrong((id *)&self->_mainModel, a3);
    [(PXStoryModel *)self->_mainModel registerChangeObserver:self context:ModelObservationContext_130689];
    v5 = v7;
  }
}

- (void)_updateMainModel
{
  id v4 = [(PXStoryView *)self viewModel];
  v3 = [v4 mainModel];
  [(PXStoryView *)self setMainModel:v3];
}

- (void)_invalidateMainModel
{
  id v2 = [(PXStoryView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateMainModel];
}

- (void)_updateBackgroundColor
{
  id v8 = [(PXStoryView *)self viewModel];
  v3 = [v8 viewLayoutSpec];
  id v4 = [v8 viewModeTransition];
  if ([v8 viewMode] == 2
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v4 isComplete])
  {
    uint64_t v5 = [v3 browseGridBackgroundColor];
  }
  else
  {
    uint64_t v5 = [v3 playerBackgroundColor];
  }
  v6 = (void *)v5;
  id v7 = [(PXStoryView *)self tungstenView];
  [v7 setBackgroundColor:v6];
}

- (void)_invalidateBackgroundColor
{
  id v2 = [(PXStoryView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateBackgroundColor];
}

- (void)_updateGestureRecognizers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryView *)self viewModel];
  uint64_t v4 = [v3 wantsChromeVisible];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(PXStoryView *)self swipeGestureRecognizers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v9++) setEnabled:1];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v10 = [(PXStoryView *)self viewModel];
  BOOL v11 = [v10 viewMode] == 1;
  v12 = [(PXStoryView *)self panUpGestureRecognizer];
  [v12 setEnabled:v11];

  v13 = [(PXStoryView *)self viewModel];
  uint64_t v14 = [v13 viewMode];

  if (v14 != 1) {
    uint64_t v4 = v14 == 4 || v14 == 2;
  }
  v15 = [(PXStoryView *)self menuGestureRecognizer];
  [v15 setEnabled:v4];
}

- (void)_invalidateGestureRecognizers
{
  id v2 = [(PXStoryView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateGestureRecognizers];
}

- (void)layoutSubviews
{
  v3 = [(PXStoryView *)self updater];
  [v3 updateIfNeeded];

  v4.receiver = self;
  v4.super_class = (Class)PXStoryView;
  [(PXStoryView *)&v4 layoutSubviews];
}

- (void)touchingUIGestureRecognizerDidEndTouching:(id)a3
{
}

- (void)touchingUIGestureRecognizerDidBeginTouching:(id)a3
{
}

- (BOOL)verticalSwipeGestureRecognizerHelper:(id)a3 shouldRecognizeSwipeDownGestureRecognizer:(id)a4
{
  id v5 = a4;
  id v6 = [(PXStoryView *)self panDownGestureRecognizer];

  if (v6 != v5) {
    return 1;
  }
  uint64_t v8 = [(PXStoryView *)self viewModel];
  if ([v8 viewMode] == 1)
  {
    uint64_t v9 = [v8 viewModeTransition];
    BOOL v7 = v9 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PXStoryView *)self panUpGestureRecognizer];
  if (v8 != v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_6:
      id v11 = [(PXStoryView *)self panDownGestureRecognizer];

      if (v11 == v6)
      {
        id v13 = [(PXStoryView *)self swipeDownGestureHelper];
        char v10 = [v13 verticalSwipeGestureRecognizer:v6 shouldBeRequiredToFailByGestureRecognizer:v7];
      }
      else
      {
        id v12 = [(PXStoryView *)self longPressGestureRecognizer];

        if (v12 != v6)
        {
          char v10 = 0;
          goto LABEL_12;
        }
        id v13 = [(PXStoryView *)self panDownGestureRecognizer];
        char v10 = v13 == v7;
      }

      goto LABEL_12;
    }
  }
  char v9 = objc_msgSend(v7, "px_isPanGestureRecognizerOfScrollView:", 0);

  if ((v9 & 1) == 0) {
    goto LABEL_6;
  }
  char v10 = 1;
LABEL_12:

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(PXStoryView *)self disableGestures])
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [(PXStoryView *)self panDownGestureRecognizer];

    if (v6 == v4)
    {
      id v8 = [(PXStoryView *)self swipeDownGestureHelper];
      char v5 = [v8 verticalSwipeGestureRecognizerShouldBegin:v4 ignoringScrollViews:1];
    }
    else
    {
      id v7 = [(PXStoryView *)self panUpGestureRecognizer];

      if (v7 == v4)
      {
        char v9 = [(PXStoryView *)self panUpGestureRecognizer];
        char v10 = [(PXStoryView *)self tungstenView];
        [v9 velocityInView:v10];
        double v12 = v11;
        double v14 = v13;

        MEMORY[0x1AD10AEE0](v14, v12);
        PXRadiansToDegrees();
      }
      char v5 = 1;
    }
  }

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXStoryView *)self disableGestures])
  {
    char v8 = 0;
  }
  else
  {
    [v7 locationInView:self];
    char v9 = -[PXStoryView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v11 = [(PXStoryView *)self anyIndirectTouchGestureRecognizer];
    if (v11 == v6)
    {
      char v8 = 1;
    }
    else
    {
      id v12 = [(PXStoryView *)self anyPressGestureRecognizer];
      BOOL v13 = v12 == v6;

      char v8 = v13 | isKindOfClass ^ 1;
    }
  }
  return v8 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  touchingGestureRecognizer = self->_touchingGestureRecognizer;
  id v7 = a3;
  id v8 = [(PXStoryView *)self anyIndirectTouchGestureRecognizer];

  id v9 = [(PXStoryView *)self anyPressGestureRecognizer];

  return v9 == v7 || v8 == v7 || touchingGestureRecognizer == a3;
}

- (void)_considerUpdatingFocusForInfoPanel
{
  id v7 = [(PXStoryView *)self mainModel];
  [v7 desiredInfoPanelVisibilityFraction];
  if (v3 == 0.0)
  {
    id v4 = [(PXStoryView *)self mainModel];
    [v4 infoPanelVisibilityFraction];
    double v6 = v5;

    if (v6 == 0.0)
    {
      [(PXStoryView *)self setNeedsFocusUpdate];
    }
  }
  else
  {
  }
}

- (void)_considerUpdatingFocusForRelatedOverlay
{
  id v6 = [(PXStoryView *)self viewModel];
  int v3 = [v6 wantsRelatedOverlayVisible];
  [v6 relatedOverlayVisibilityFraction];
  BOOL v5 = v4 != 1.0;
  if (!v3) {
    BOOL v5 = v4 != 0.0;
  }
  if (!v5) {
    [(PXStoryView *)self setNeedsFocusUpdate];
  }
}

- (void)_considerUpdatingFocusForChrome
{
  id v6 = [(PXStoryView *)self viewModel];
  int v3 = [v6 wantsChromeVisible];
  [v6 chromeVisibilityFraction];
  BOOL v5 = v4 != 1.0;
  if (!v3) {
    BOOL v5 = v4 != 0.0;
  }
  if (!v5) {
    [(PXStoryView *)self setNeedsFocusUpdate];
  }
}

- (void)_handleTwoFingerTap:(id)a3
{
  if ([a3 state] == 3)
  {
    double v4 = +[PXStorySettings sharedInstance];
    uint64_t v5 = [v4 twoFingerTapAction];

    switch(v5)
    {
      case 1:
        id v6 = [(PXStoryView *)self viewModel];
        id v8 = v6;
        id v7 = &__block_literal_global_127;
        goto LABEL_10;
      case 2:
        id v6 = [(PXStoryView *)self viewModel];
        id v8 = v6;
        id v7 = &__block_literal_global_129_130707;
        goto LABEL_10;
      case 3:
        [(PXStoryView *)self _changeStyle];
        return;
      case 4:
        id v6 = [(PXStoryView *)self viewModel];
        id v8 = v6;
        id v7 = &__block_literal_global_131;
LABEL_10:
        [v6 performChanges:v7];

        break;
      case 5:
        [(PXStoryView *)self _editCurrentChapter];
        break;
      default:
        return;
    }
  }
}

void __35__PXStoryView__handleTwoFingerTap___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setWantsRelatedOverlayVisible:", objc_msgSend(v2, "wantsRelatedOverlayVisible") ^ 1);
}

uint64_t __35__PXStoryView__handleTwoFingerTap___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cycleHUDType];
}

uint64_t __35__PXStoryView__handleTwoFingerTap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleHUD];
}

- (void)_handlePanDown:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PXStoryView *)self viewModel];
  id v7 = +[PXStorySettings sharedInstance];
  uint64_t v8 = [v7 swipeDownBehavior];

  if ((unint64_t)(v8 - 1) < 2)
  {
    id v9 = [(PXStoryView *)self tungstenView];
    [v5 lastTouchTimestamp];
    uint64_t v11 = v10;
    switch([v5 state])
    {
      case 0:
      case 3:
      case 4:
      case 5:
        uint64_t v47 = 0;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        if (v6) {
          [v6 swipeDownInteractionState];
        }
        v35[2] = v45;
        v35[3] = v46;
        uint64_t v36 = v47;
        v35[0] = v43;
        v35[1] = v44;
        if ((PXStorySwipeDownInteractionStateEqualsState((uint64_t)v35, (uint64_t)&PXStorySwipeDownInteractionStateNull) & 1) == 0)
        {
          id v12 = &__block_literal_global_125;
          goto LABEL_25;
        }
        break;
      case 1:
        v15 = [v6 viewModeTransition];

        if (v15)
        {
          v34 = [MEMORY[0x1E4F28B00] currentHandler];
          [v34 handleFailureInMethod:a2 object:self file:@"PXStoryView.m" lineNumber:773 description:@"Shuld not have a viewModeTransition at this point"];
        }
        [v5 locationInView:v9];
        double v17 = v16;
        double v19 = v18;
        [v5 velocityInView:v9];
        uint64_t v21 = v20;
        uint64_t v23 = v22;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        v24 = [(PXStoryView *)self tungstenView];
        v25 = objc_msgSend(v24, "hitTestResultsAtPoint:", v17, v19);

        uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v64 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v61;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v61 != v27) {
                objc_enumerationMutation(v25);
              }
              v29 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v29 clipIdentifier])
              {
                uint64_t v26 = [v29 clipIdentifier];
                goto LABEL_27;
              }
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v60 objects:v64 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }
LABEL_27:

        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __30__PXStoryView__handlePanDown___block_invoke;
        v48[3] = &unk_1E5DBD4B0;
        double v50 = v17;
        double v51 = v19;
        double v52 = v17;
        double v53 = v19;
        uint64_t v54 = v21;
        uint64_t v55 = v23;
        v56 = v9;
        uint64_t v57 = v11;
        uint64_t v58 = v11;
        id v49 = v6;
        uint64_t v59 = v26;
        [v49 performChanges:v48];

        break;
      case 2:
        uint64_t v47 = 0;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        if (v6) {
          [v6 swipeDownInteractionState];
        }
        [v5 locationInView:v9];
        *(void *)&long long v44 = v30;
        *((void *)&v44 + 1) = v31;
        [v5 velocityInView:v9];
        *(void *)&long long v45 = v32;
        *((void *)&v45 + 1) = v33;
        uint64_t v47 = v11;
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __30__PXStoryView__handlePanDown___block_invoke_3;
        v37[3] = &__block_descriptor_104_e35_v16__0___PXStoryMutableViewModel__8lu80l8;
        long long v39 = v44;
        long long v38 = v43;
        long long v40 = v45;
        long long v41 = v46;
        uint64_t v42 = v11;
        id v12 = v37;
LABEL_25:
        [v6 performChanges:v12];
        break;
      default:
        goto LABEL_28;
    }
    goto LABEL_28;
  }
  if (!v8)
  {
    BOOL v13 = [v6 viewLayoutSpec];
    int v14 = [v13 wantsSwipeDownGestureToDismiss];

    if (v14)
    {
      id v9 = [(PXStoryView *)self dismissalController];
      [v9 handlePanDownGestureRecognizer:v5];
LABEL_28:
    }
  }
}

void __30__PXStoryView__handlePanDown___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v4 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v4;
  uint64_t v8 = *(void *)(a1 + 104);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  [a2 setSwipeDownInteractionState:v7];
  id v5 = [*(id *)(a1 + 32) mainModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30__PXStoryView__handlePanDown___block_invoke_2;
  v6[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
  v6[4] = *(void *)(a1 + 112);
  [v5 performChanges:v6];
}

uint64_t __30__PXStoryView__handlePanDown___block_invoke_3(uint64_t a1, void *a2)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  v5[2] = *(_OWORD *)(a1 + 64);
  v5[3] = v2;
  uint64_t v6 = *(void *)(a1 + 96);
  long long v3 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v3;
  return [a2 setSwipeDownInteractionState:v5];
}

uint64_t __30__PXStoryView__handlePanDown___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  return [a2 setSwipeDownInteractionState:v3];
}

void __30__PXStoryView__handlePanDown___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setLastHitAssetReference:0];
  [v3 setLastHitClipIdentifier:*(void *)(a1 + 32)];
  [v3 setViewMode:2];
}

- (PXStoryViewDismissalController)dismissalController
{
  dismissalController = self->_dismissalController;
  if (!dismissalController)
  {
    uint64_t v4 = [PXStoryViewDismissalController alloc];
    id v5 = [(PXStoryView *)self viewModel];
    uint64_t v6 = [(PXStoryViewDismissalController *)v4 initWithViewModel:v5];
    id v7 = self->_dismissalController;
    self->_dismissalController = v6;

    dismissalController = self->_dismissalController;
  }
  return dismissalController;
}

- (void)_handleArrowButton:(id)a3
{
  id v10 = a3;
  if ([v10 state] == 3)
  {
    uint64_t v4 = [(PXStoryView *)self viewModel];
    char v5 = [v4 wantsChromeVisible];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = [v10 allowedPressTypes];
      int v7 = [v6 isEqualToArray:&unk_1F02D4630];

      if (v7)
      {
        [(PXStoryView *)self _moveLeftAfterEdgeTap:0];
      }
      else
      {
        uint64_t v8 = [v10 allowedPressTypes];
        int v9 = [v8 isEqualToArray:&unk_1F02D4648];

        if (v9) {
          [(PXStoryView *)self _moveRightAfterEdgeTap:0];
        }
      }
    }
  }
}

- (void)_handleLongPress:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] != 2)
  {
    char v5 = PLStoryGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 134218240;
      int v7 = self;
      __int16 v8 = 2048;
      uint64_t v9 = [v4 state];
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "%p long press state=%li", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [v4 locationInView:self];
    -[PXStoryView _handlePrimaryInteractionAtPoint:](self, "_handlePrimaryInteractionAtPoint:");
  }
}

- (void)_handleSwipeGesture:(id)a3
{
  id v11 = a3;
  BOOL v4 = [v11 state] == 3;
  char v5 = v11;
  if (v4)
  {
    uint64_t v6 = [v11 direction];
    if (v6 == 8)
    {
      int v7 = +[PXStorySettings sharedInstance];
      uint64_t v8 = [v7 swipeDownAction];

      char v5 = v11;
      if (v8 != 2) {
        goto LABEL_12;
      }
      uint64_t v9 = [(PXStoryView *)self viewModel];
      uint64_t v10 = [v9 actionPerformer];
      [v10 dismissStoryViewController];
    }
    else if (v6 == 2)
    {
      [(PXStoryView *)self _moveRightAfterEdgeTap:0];
    }
    else
    {
      BOOL v4 = v6 == 1;
      char v5 = v11;
      if (!v4) {
        goto LABEL_12;
      }
      [(PXStoryView *)self _moveLeftAfterEdgeTap:0];
    }
    char v5 = v11;
  }
LABEL_12:
}

- (void)_handleAnyTouchOrPressGesture:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if ((unint64_t)(v5 - 1) <= 1) {
      [(NSMutableSet *)self->_activeRemoteGestureRecognizers addObject:v4];
    }
  }
  else
  {
    [(NSMutableSet *)self->_activeRemoteGestureRecognizers removeObject:v4];
  }
  uint64_t v6 = [(PXStoryView *)self viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__PXStoryView__handleAnyTouchOrPressGesture___block_invoke;
  v7[3] = &unk_1E5DD1EF0;
  _OWORD v7[4] = self;
  [v6 performChanges:v7];
}

void __45__PXStoryView__handleAnyTouchOrPressGesture___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 activeRemoteGestureRecognizers];
  objc_msgSend(v3, "setIsUserPerformingRemoteGesture:", objc_msgSend(v4, "count") != 0);
}

- (void)_handleMenuGestureRecognizer:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(PXStoryView *)self viewModel];
    uint64_t v5 = [v4 viewMode];

    if (v5 == 1)
    {
      int v7 = [(PXStoryView *)self viewModel];
      int v8 = [v7 wantsRelatedOverlayVisible];

      if (v8)
      {
        [(PXStoryView *)self _hideRelatedOverlay];
      }
      else
      {
        [(PXStoryView *)self _toggleChrome];
      }
    }
    else if (v5 == 4 || v5 == 2)
    {
      id v9 = [(PXStoryView *)self viewModel];
      uint64_t v6 = [v9 mainModel];
      [v6 performChanges:&__block_literal_global_110_130727];
    }
  }
}

uint64_t __44__PXStoryView__handleMenuGestureRecognizer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setViewMode:1];
}

- (void)_handlePlayPauseGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    [(PXStoryView *)self _togglePlayback];
  }
}

- (void)cancelOperation:(id)a3
{
  id v4 = [(PXStoryView *)self viewModel];
  id v3 = [v4 actionPerformer];
  [v3 dismissStoryViewController];
}

- (void)insertNewline:(id)a3
{
  id v4 = [(PXStoryView *)self viewModel];
  uint64_t v5 = [v4 highlightedRelatedIndex];

  uint64_t v6 = [(PXStoryView *)self viewModel];
  int v7 = [v6 wantsRelatedOverlayVisible];

  if (v7 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(PXStoryView *)self viewModel];
    [v8 performChanges:&__block_literal_global_108];
  }
}

void __29__PXStoryView_insertNewline___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "selectRelatedAtIndex:", objc_msgSend(v2, "highlightedRelatedIndex"));
}

- (void)moveRight:(id)a3
{
  id v4 = [(PXStoryView *)self viewModel];
  char v5 = [v4 wantsRelatedOverlayVisible];

  if (v5)
  {
    [(PXStoryView *)self _handleRelatedKeyboardNavigation:8];
  }
  else
  {
    [(PXStoryView *)self _handleEdgeTap:8];
  }
}

- (void)moveLeft:(id)a3
{
  id v4 = [(PXStoryView *)self viewModel];
  char v5 = [v4 wantsRelatedOverlayVisible];

  if (v5)
  {
    [(PXStoryView *)self _handleRelatedKeyboardNavigation:2];
  }
  else
  {
    [(PXStoryView *)self _handleEdgeTap:2];
  }
}

- (NSMutableArray)lastDemotedDisplayAssets
{
  if ((PFOSVariantHasInternalUI() & 1) == 0)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXStoryView.m", 543, @"Invalid parameter not satisfying: %@", @"PLHasInternalUI()" object file lineNumber description];
  }
  lastDemotedDisplayAssets = self->_lastDemotedDisplayAssets;
  if (!lastDemotedDisplayAssets)
  {
    char v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v6 = self->_lastDemotedDisplayAssets;
    self->_lastDemotedDisplayAssets = v5;

    lastDemotedDisplayAssets = self->_lastDemotedDisplayAssets;
  }
  return lastDemotedDisplayAssets;
}

- (void)_editCurrentChapter
{
  id v3 = [(PXStoryView *)self viewModel];
  id v2 = [v3 actionPerformer];
  [v2 presentChapterEditor];
}

- (void)_changeOverallDuration:(int64_t)a3
{
  id v4 = [(PXStoryView *)self viewModel];
  char v5 = [v4 mainModel];
  uint64_t v6 = [v5 recipeManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PXStoryView__changeOverallDuration___block_invoke;
  v7[3] = &__block_descriptor_40_e39_v16__0___PXStoryMutableRecipeManager__8l;
  _OWORD v7[4] = a3;
  [v6 performChanges:v7];
}

uint64_t __38__PXStoryView__changeOverallDuration___block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *MEMORY[0x1E4F8D280];
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 16);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 48);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F8D280] + 32);
  long long v9 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(MEMORY[0x1E4F8D280] + 64);
  long long v6 = v2;
  return [a2 applyTargetOverallDurationInfo:&v5];
}

- (void)_changeColorGrade
{
  long long v2 = [(PXStoryView *)self viewModel];
  long long v3 = [v2 mainModel];

  id v4 = [v3 styleManager];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__PXStoryView__changeColorGrade__block_invoke;
  v6[3] = &unk_1E5DC3518;
  id v7 = v4;
  id v5 = v4;
  [v5 performChanges:v6 origin:2];
}

void __32__PXStoryView__changeColorGrade__block_invoke(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 currentStyle];
  objc_msgSend(v3, "applyFocusedStyleWithCustomizedColorGradeKind:", (objc_msgSend(v4, "customColorGradeKind") + 1) % 13);
}

- (void)_changeStyle
{
  long long v2 = [(PXStoryView *)self viewModel];
  id v3 = [v2 mainModel];

  id v4 = [v3 styleManager];
  id v5 = [v4 selectionDataSource];
  uint64_t v6 = [v5 numberOfStyles];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v5 indexOfCurrentStyle];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __27__PXStoryView__changeStyle__block_invoke;
    v9[3] = &unk_1E5DBD468;
    uint64_t v11 = (v8 + 1) % v7;
    id v10 = v5;
    [v4 performChanges:v9 origin:2];
  }
}

uint64_t __27__PXStoryView__changeStyle__block_invoke(uint64_t a1, void *a2)
{
  return [a2 applyStyleAtIndex:*(void *)(a1 + 40) fromDataSource:*(void *)(a1 + 32)];
}

- (void)_hideRelatedOverlay
{
  id v2 = [(PXStoryView *)self viewModel];
  [v2 performChanges:&__block_literal_global_98];
}

uint64_t __34__PXStoryView__hideRelatedOverlay__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWantsRelatedOverlayVisible:0];
}

- (void)_toggleChrome
{
  id v2 = [(PXStoryView *)self viewModel];
  [v2 performChanges:&__block_literal_global_96];
}

uint64_t __28__PXStoryView__toggleChrome__block_invoke(uint64_t a1, void *a2)
{
  return [a2 toggleChrome];
}

- (void)_togglePlayback
{
  id v2 = [(PXStoryView *)self viewModel];
  [v2 performChanges:&__block_literal_global_94_130739];
}

uint64_t __30__PXStoryView__togglePlayback__block_invoke(uint64_t a1, void *a2)
{
  return [a2 togglePlayback];
}

- (id)_storyHitTestResultAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PXStoryView *)self tungstenView];
  objc_msgSend(v6, "convertPoint:fromView:", self, x, y);
  uint64_t v7 = objc_msgSend(v6, "hitTestResultAtPoint:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (void)_handleEdgeTap:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [(PXStoryView *)self viewModel];
  uint64_t v6 = [v5 mainModel];

  uint64_t v7 = [v6 currentSegmentIdentifier];
  id v8 = [v6 timeline];
  uint64_t v9 = [v8 lastSegmentIdentifier];

  BOOL v10 = [(PXStoryView *)self _isRTL];
  if (v7 == v9 && (a3 != 8 ? (char v11 = 1) : (char v11 = v10), a3 == 2 ? (v12 = v10) : (v12 = 0), v12 || (v11 & 1) == 0))
  {
    BOOL v13 = [(PXStoryView *)self viewModel];
    int v14 = [v13 shouldAutoReplayPreference];

    v15 = [(PXStoryView *)self viewModel];
    double v16 = [v15 mainConfiguration];
    char v17 = [v16 shouldReplayAtEnd];

    if ((v17 & 1) != 0 || v14)
    {
      double v18 = [(PXStoryView *)self viewModel];
      BOOL v19 = [v18 desiredPlayState] == 1;

      uint64_t v20 = [(PXStoryView *)self viewModel];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __30__PXStoryView__handleEdgeTap___block_invoke;
      v21[3] = &__block_descriptor_34_e35_v16__0___PXStoryMutableViewModel__8l;
      BOOL v22 = v19;
      char v23 = v14;
      [v20 performChanges:v21];
    }
    else
    {
      [v6 performChanges:&__block_literal_global_91];
    }
  }
  else if (a3 == 2)
  {
    [(PXStoryView *)self _moveLeftAfterEdgeTap:1];
  }
  else
  {
    if (a3 != 8) {
      PXAssertGetLog();
    }
    [(PXStoryView *)self _moveRightAfterEdgeTap:1];
  }
}

uint64_t __30__PXStoryView__handleEdgeTap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rewindToBeginning:*(unsigned __int8 *)(a1 + 32) rewindMusic:*(unsigned char *)(a1 + 33) == 0];
}

uint64_t __30__PXStoryView__handleEdgeTap___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 flickedPastEnd];
}

- (void)_handleRelatedKeyboardNavigation:(unint64_t)a3
{
  uint64_t v6 = [(PXStoryView *)self viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__PXStoryView__handleRelatedKeyboardNavigation___block_invoke;
  v7[3] = &unk_1E5DBD440;
  _OWORD v7[4] = self;
  void v7[5] = a3;
  v7[6] = a2;
  [v6 performChanges:v7];
}

void __48__PXStoryView__handleRelatedKeyboardNavigation___block_invoke(uint64_t a1, void *a2)
{
  id v23 = a2;
  id v3 = [*(id *)(a1 + 32) viewModel];
  id v4 = [v3 relatedModels];
  uint64_t v5 = [v4 count] - 1;

  uint64_t v6 = [v23 highlightedRelatedIndex];
  if ([v23 highlightedRelatedIndex]) {
    BOOL v7 = [v23 highlightedRelatedIndex] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 1;
  }
  uint64_t v8 = [v23 highlightedRelatedIndex];
  BOOL v9 = *(void *)(a1 + 40) == 2;
  int v10 = [*(id *)(a1 + 32) _isRTL];
  BOOL v11 = *(void *)(a1 + 40) == 8;
  int v12 = v11 ^ [*(id *)(a1 + 32) _isRTL];
  int v13 = (v9 ^ v10) & v7;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    int v14 = v12;
  }
  else {
    int v14 = 0;
  }
  if (v8 == v5) {
    char v15 = v12;
  }
  else {
    char v15 = 0;
  }
  BOOL v17 = v6 != 0x7FFFFFFFFFFFFFFFLL && v5 >= 0;
  if (v13) {
    BOOL v17 = 0;
  }
  if (v15) {
    BOOL v17 = 0;
  }
  if (v14)
  {
    double v18 = v23;
    uint64_t v19 = 0;
LABEL_31:
    [v18 setHighlightedRelatedIndex:v19];
    goto LABEL_32;
  }
  uint64_t v20 = v23;
  if (!v13)
  {
    if (!v17) {
      goto LABEL_33;
    }
    if (v12) {
      uint64_t v21 = 1;
    }
    else {
      uint64_t v21 = -1;
    }
    if ([v23 highlightedRelatedIndex] + v21 < 0
      || [v23 highlightedRelatedIndex] + v21 > v5)
    {
      BOOL v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"PXStoryView.m" lineNumber:444 description:@"Selection index out of bounds"];
    }
    uint64_t v19 = [v23 highlightedRelatedIndex] + v21;
    double v18 = v23;
    goto LABEL_31;
  }
  [v23 setWantsRelatedOverlayVisible:0];
LABEL_32:
  uint64_t v20 = v23;
LABEL_33:
}

- (BOOL)_handlePrimaryInteractionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(PXStoryView *)self viewModel];
  uint64_t v7 = [v6 viewMode];
  if (v7 == 4)
  {
    uint64_t v8 = [v6 mainConfiguration];
    char v9 = [v8 isAppleMusicPreview];

    if ((v9 & 1) == 0)
    {
      int v10 = [v6 mainModel];
      BOOL v11 = [v6 mainModel];
      int v12 = [v11 styleManager];

      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      uint64_t v24 = __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke;
      v25 = &unk_1E5DC2D18;
      id v26 = v12;
      id v27 = v10;
      id v13 = v10;
      id v14 = v12;
      [v6 performChanges:&v22];
    }
    goto LABEL_7;
  }
  uint64_t v15 = v7;
  double v16 = [(PXStoryView *)self tungstenView];
  objc_msgSend(v16, "convertPoint:fromView:", self, x, y);
  char v17 = objc_msgSend(v16, "handlePrimaryInteractionAtPoint:");

  if (v17)
  {
LABEL_7:
    double v18 = objc_msgSend(v6, "viewLayoutSpec", v22, v23, v24, v25);
    goto LABEL_8;
  }
  if ([v6 wantsRelatedOverlayVisible])
  {
    [v6 performChanges:&__block_literal_global_85];
    goto LABEL_7;
  }
  double v18 = [v6 viewLayoutSpec];
  int v21 = [v18 wantsEdgeTapToChangeCurrentSegment];
  if (v15 == 1 && v21)
  {
    [(PXStoryView *)self bounds];
    [v18 tapNavigationAreaInsets];
    PXEdgeInsetsInsetRect();
  }
  if (v15 == 2)
  {
    BOOL v19 = 0;
    goto LABEL_9;
  }
  [(PXStoryView *)self _toggleChrome];
LABEL_8:
  BOOL v19 = 1;
LABEL_9:

  return v19;
}

void __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) focusedStyleIsCurrentStyle] & 1) == 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke_2;
    v5[3] = &unk_1E5DD36F8;
    id v4 = *(void **)(a1 + 40);
    id v6 = *(id *)(a1 + 32);
    [v4 performWithPrerequestedPersistencePermission:v5];
  }
  [v3 setViewMode:1];
}

uint64_t __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setWantsRelatedOverlayVisible:0];
}

uint64_t __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performChanges:&__block_literal_global_130746 origin:2];
}

uint64_t __48__PXStoryView__handlePrimaryInteractionAtPoint___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 applyFocusedStyle];
}

- (void)_skipToSegmentWithOffset:(int64_t)a3 afterEdgeTap:(BOOL)a4
{
  id v6 = [(PXStoryView *)self viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PXStoryView__skipToSegmentWithOffset_afterEdgeTap___block_invoke;
  v7[3] = &__block_descriptor_41_e35_v16__0___PXStoryMutableViewModel__8l;
  _OWORD v7[4] = a3;
  BOOL v8 = a4;
  [v6 performChanges:v7];
}

uint64_t __53__PXStoryView__skipToSegmentWithOffset_afterEdgeTap___block_invoke(uint64_t a1, void *a2)
{
  return [a2 skipToSegmentWithOffset:*(void *)(a1 + 32) byTappingEdge:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_isRTL
{
  return [(PXStoryView *)self effectiveUserInterfaceLayoutDirection] == 1;
}

- (void)_moveRightAfterEdgeTap:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXStoryView *)self _isRTL]) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = 1;
  }
  [(PXStoryView *)self _skipToSegmentWithOffset:v5 afterEdgeTap:v3];
}

- (void)_moveLeftAfterEdgeTap:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXStoryView *)self _isRTL]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = -1;
  }
  [(PXStoryView *)self _skipToSegmentWithOffset:v5 afterEdgeTap:v3];
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXStoryView *)self viewModel];
  uint64_t v6 = [v5 viewMode];
  if ([v4 isEqualToString:@" "]
    && ([v5 wantsRelatedOverlayVisible] & 1) == 0
    && v6 == 1)
  {
    [(PXStoryView *)self _togglePlayback];
  }
  if (PFOSVariantHasInternalUI())
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    BOOL v11 = __26__PXStoryView_insertText___block_invoke;
    int v12 = &unk_1E5DC2D18;
    id v7 = v4;
    id v13 = v7;
    id v14 = self;
    [v5 performChanges:&v9];
    if (objc_msgSend(v7, "isEqualToString:", @"v", v9, v10, v11, v12))
    {
      BOOL v8 = [v5 actionPerformer];
      [v8 showVisualDiagnostics];
    }
  }
}

void __26__PXStoryView_insertText___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:@"h"])
  {
    [v7 toggleHUD];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"i"])
  {
    [v7 cycleHUDType];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"r"])
  {
    objc_msgSend(v7, "setWantsRelatedOverlayVisible:", objc_msgSend(v7, "wantsRelatedOverlayVisible") ^ 1);
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"e"])
  {
    objc_msgSend(v7, "setShouldShowErrorIndicator:", objc_msgSend(v7, "shouldShowErrorIndicator") ^ 1);
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"s"])
  {
    [*(id *)(a1 + 40) _changeStyle];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"c"])
  {
    [*(id *)(a1 + 40) _changeColorGrade];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"C"])
  {
    [*(id *)(a1 + 40) _editCurrentChapter];
  }
  else
  {
    if ([*(id *)(a1 + 32) isEqualToString:@"1"])
    {
      BOOL v3 = *(void **)(a1 + 40);
      uint64_t v4 = 3;
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"2"])
    {
      BOOL v3 = *(void **)(a1 + 40);
      uint64_t v4 = 4;
    }
    else if ([*(id *)(a1 + 32) isEqualToString:@"3"])
    {
      BOOL v3 = *(void **)(a1 + 40);
      uint64_t v4 = 5;
    }
    else
    {
      int v5 = [*(id *)(a1 + 32) isEqualToString:@"0"];
      uint64_t v6 = v7;
      if (!v5) {
        goto LABEL_25;
      }
      BOOL v3 = *(void **)(a1 + 40);
      uint64_t v4 = 1;
    }
    [v3 _changeOverallDuration:v4];
  }
  uint64_t v6 = v7;
LABEL_25:
}

- (BOOL)acceptsFirstResponder
{
  return 1;
}

- (void)_initializeGestureRecognizers
{
  v36[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = objc_alloc_init(PXVerticalSwipeGestureRecognizerHelper);
  swipeDownGestureHelper = self->_swipeDownGestureHelper;
  self->_swipeDownGestureHelper = v4;

  [(PXVerticalSwipeGestureRecognizerHelper *)self->_swipeDownGestureHelper setAllowSwipeUp:0];
  [(PXVerticalSwipeGestureRecognizerHelper *)self->_swipeDownGestureHelper setDelegate:self];
  uint64_t v6 = [[PXTouchingUIGestureRecognizer alloc] initWithTarget:0 action:0];
  touchingGestureRecognizer = self->_touchingGestureRecognizer;
  self->_touchingGestureRecognizer = v6;

  [(PXTouchingUIGestureRecognizer *)self->_touchingGestureRecognizer setDelegate:self];
  [(PXTouchingUIGestureRecognizer *)self->_touchingGestureRecognizer setTouchDelegate:self];
  [v3 addObject:self->_touchingGestureRecognizer];
  BOOL v8 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
  tapGestureRecognizer = self->_tapGestureRecognizer;
  self->_tapGestureRecognizer = v8;

  [(UITapGestureRecognizer *)self->_tapGestureRecognizer setDelegate:self];
  [v3 addObject:self->_tapGestureRecognizer];
  uint64_t v10 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleLongPress_];
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = v10;

  [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:self];
  [v3 addObject:self->_longPressGestureRecognizer];
  if (PFOSVariantHasInternalUI())
  {
    int v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTwoFingerTap_];
    [v12 setNumberOfTouchesRequired:2];
    [v3 addObject:v12];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PXStoryView__initializeGestureRecognizers__block_invoke;
  aBlock[3] = &unk_1E5DBD3D8;
  aBlock[4] = self;
  id v13 = v3;
  id v34 = v13;
  id v14 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  uint64_t v15 = [(PXStoryView *)self viewConfiguration];
  double v16 = [v15 configuration];
  int v17 = [v16 allowsVerticalGestures];

  if (v17)
  {
    double v18 = v14[2](v14, 8);
    v36[0] = v18;
    BOOL v19 = v14[2](v14, 4);
    v36[1] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    swipeGestureRecognizers = self->_swipeGestureRecognizers;
    self->_swipeGestureRecognizers = v20;

    uint64_t v22 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handlePanDown_];
    panDownGestureRecognizer = self->_panDownGestureRecognizer;
    self->_panDownGestureRecognizer = v22;

    [(UIPanGestureRecognizer *)self->_panDownGestureRecognizer setDelegate:self];
    [v13 addObject:self->_panDownGestureRecognizer];
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v24 = v13;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        -[PXStoryView addGestureRecognizer:](self, "addGestureRecognizer:", *(void *)(*((void *)&v29 + 1) + 8 * v28++), (void)v29);
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v26);
  }
}

id __44__PXStoryView__initializeGestureRecognizers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:*(void *)(a1 + 32) action:sel__handleSwipeGesture_];
  [v4 setDirection:a2];
  [*(id *)(a1 + 40) addObject:v4];
  return v4;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  int v5 = [(PXStoryView *)self viewLayout];
  uint64_t v6 = [v5 itemPlacementControllerForItemReference:v4];

  return v6;
}

- (id)mainItemReference
{
  id v2 = [(PXStoryView *)self viewLayout];
  BOOL v3 = [v2 mainItemReference];

  return v3;
}

- (void)setIsTouching:(BOOL)a3
{
  if (self->_isTouching != a3)
  {
    self->_isTouching = a3;
    id v4 = [(PXStoryView *)self viewModel];
    int v5 = [v4 mainModel];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__PXStoryView_setIsTouching___block_invoke;
    v6[3] = &__block_descriptor_33_e31_v16__0___PXStoryMutableModel__8l;
    BOOL v7 = a3;
    [v5 performChanges:v6];
  }
}

uint64_t __29__PXStoryView_setIsTouching___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsTouching:*(unsigned __int8 *)(a1 + 32)];
}

- (PXGView)tungstenView
{
  id v2 = [(PXStoryView *)self tungstenViewCoordinator];
  BOOL v3 = [v2 tungstenView];

  return (PXGView *)v3;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    id v4 = [(PXStoryView *)self viewModel];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __27__PXStoryView_setIsActive___block_invoke;
    v5[3] = &__block_descriptor_33_e35_v16__0___PXStoryMutableViewModel__8l;
    BOOL v6 = a3;
    [v4 performChanges:v5];
  }
}

uint64_t __27__PXStoryView_setIsActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsActive:*(unsigned __int8 *)(a1 + 32)];
}

- (PXStoryView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v40.receiver = self;
  v40.super_class = (Class)PXStoryView;
  BOOL v11 = -[PXStoryView initWithFrame:](&v40, sel_initWithFrame_, x, y, width, height);
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewConfiguration, a4);
    id v13 = [v10 configuration];
    uint64_t v14 = [v13 storyQueue];
    storyQueue = v12->_storyQueue;
    v12->_storyQueue = (OS_dispatch_queue *)v14;

    double v16 = objc_alloc_init(PXStoryPacingAutoIncrementingTimeSource);
    timeSource = v12->_timeSource;
    v12->_timeSource = (PXStoryPacingTimeSource *)v16;

    double v18 = [v13 mediaProvider];
    BOOL v19 = [PXStoryViewModel alloc];
    uint64_t v20 = [v10 extendedTraitCollection];
    uint64_t v21 = [(PXStoryViewModel *)v19 initWithConfiguration:v13 extendedTraitCollection:v20 timeSource:v12->_timeSource mediaProvider:v18];
    viewModel = v12->_viewModel;
    v12->_viewModel = (PXStoryViewModel *)v21;

    [(PXStoryViewModel *)v12->_viewModel registerChangeObserver:v12 context:ViewModelObservationContext_130688];
    uint64_t v23 = [[PXStoryViewLayout alloc] initWithViewModel:v12->_viewModel];
    viewLayout = v12->_viewLayout;
    v12->_viewLayout = v23;

    uint64_t v25 = [PXGViewCoordinator alloc];
    uint64_t v26 = v12->_viewLayout;
    uint64_t v27 = [v10 containerViewController];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __43__PXStoryView_initWithFrame_configuration___block_invoke;
    v38[3] = &unk_1E5DBD3B0;
    id v28 = v18;
    id v39 = v28;
    uint64_t v29 = [(PXGViewCoordinator *)v25 initWithContentLayout:v26 containerView:v12 belowSubview:0 containerViewController:v27 configuration:v38];
    tungstenViewCoordinator = v12->_tungstenViewCoordinator;
    v12->_tungstenViewCoordinator = (PXGViewCoordinator *)v29;

    [(PXStoryView *)v12 _updateBackgroundColor];
    long long v31 = [v10 configuration];
    char v32 = [v31 options];

    if ((v32 & 0x20) != 0)
    {
      uint64_t v33 = 2;
    }
    else
    {
      long long v31 = +[PXStoryTransitionsSettings sharedInstance];
      uint64_t v33 = [v31 transitionQuality];
    }
    id v34 = [(PXGViewCoordinator *)v12->_tungstenViewCoordinator tungstenView];
    [v34 setOffscreenEffectQuality:v33];

    if ((v32 & 0x20) == 0) {
    if (([v13 options] & 0x400) == 0)
    }
      [(PXStoryView *)v12 _initializeGestureRecognizers];
    uint64_t v35 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v12 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v12->_updater;
    v12->_updater = (PXUpdater *)v35;

    [(PXUpdater *)v12->_updater addUpdateSelector:sel__updateGestureRecognizers needsUpdate:1];
    [(PXUpdater *)v12->_updater addUpdateSelector:sel__updateBackgroundColor];
    [(PXUpdater *)v12->_updater addUpdateSelector:sel__updateMainModel needsUpdate:1];
  }
  return v12;
}

void __43__PXStoryView_initWithFrame_configuration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setMediaProvider:v2];
  [v3 setShowsHorizontalScrollIndicator:0];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setContentInsetAdjustmentBehavior:1];
  id v4 = +[PXStorySettings sharedInstance];
  objc_msgSend(v3, "setPresentationType:", objc_msgSend(v4, "playerPresentationType"));
}

- (PXStoryView)initWithCoder:(id)a3
{
  id v5 = a3;
  BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryView.m", 111, @"%s is not available as initializer", "-[PXStoryView initWithCoder:]");

  abort();
}

- (PXStoryView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryView.m", 107, @"%s is not available as initializer", "-[PXStoryView initWithFrame:]");

  abort();
}

+ (void)dumpTapToRadarDiagnosticAttachmentsToURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__130820;
  uint64_t v14 = __Block_byref_object_dispose__130821;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PXStoryView_dumpTapToRadarDiagnosticAttachmentsToURL_completionHandler___block_invoke;
  v9[3] = &unk_1E5DBD520;
  void v9[4] = &v10;
  EnumerateAllViewsUsingBlock(v9);
  if (v11[5])
  {
    BOOL v7 = objc_alloc_init(PXRadarConfiguration);
    BOOL v8 = [(id)v11[5] viewModel];
    [(PXRadarConfiguration *)v7 addDiagnosticProvider:v8];

    [(PXRadarConfiguration *)v7 setAttachmentsIncludeAnyUserAsset:0];
    PXDumpRadarAttachmentsWithConfigurationToFolderURL(v7, v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"couldn't find any PXStoryView");
    BOOL v7 = (PXRadarConfiguration *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, PXRadarConfiguration *))v6 + 2))(v6, 0, v7);
  }

  _Block_object_dispose(&v10, 8);
}

void __74__PXStoryView_dumpTapToRadarDiagnosticAttachmentsToURL_completionHandler___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (NSString)allDiagnosticDescriptions
{
  uint64_t v2 = +[PXStorySettings sharedInstance];
  uint64_t v3 = [v2 useVerboseStyleHUDText];
  [v2 setUseVerboseStyleHUDText:1];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PXStoryView_allDiagnosticDescriptions__block_invoke;
  v8[3] = &unk_1E5DBD4F8;
  id v5 = v4;
  id v9 = v5;
  EnumerateAllViewsUsingBlock(v8);
  if (![v5 length]) {
    [v5 appendString:@"Could not find an instance of Interactive Memories Player (PXStoryView) in the view hierarchy"];
  }
  [v2 setUseVerboseStyleHUDText:v3];
  id v6 = (void *)[v5 copy];

  return (NSString *)v6;
}

void __40__PXStoryView_allDiagnosticDescriptions__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v10;
    id v4 = [v3 viewModel];
    id v5 = [v4 diagnosticDescriptionForAllHUDTypes];
    id v6 = NSString;
    BOOL v7 = (objc_class *)objc_opt_class();
    BOOL v8 = NSStringFromClass(v7);
    id v9 = [v6 stringWithFormat:@"%@ %p:\n%@\n", v8, v3, v5];

    [*(id *)(a1 + 32) appendString:v9];
  }
}

@end