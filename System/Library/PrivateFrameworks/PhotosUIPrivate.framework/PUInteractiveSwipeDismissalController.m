@interface PUInteractiveSwipeDismissalController
- (BOOL)_isHandlingPanGestureRecognizer;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)verticalSwipeGestureRecognizerHelper:(id)a3 shouldRecognizeSwipeDownGestureRecognizer:(id)a4;
- (PUChangeDirectionValueFilter)_dismissGestureDirectionValueFilter;
- (PUInteractiveSwipeDismissalController)init;
- (PUSwipedDownTileTracker)_swipedDownTileTracker;
- (PXVerticalSwipeGestureRecognizerHelper)verticalSwipeGestureRecognizerHelper;
- (UIPanGestureRecognizer)_panGestureRecognizer;
- (void)_handlePanGestureRecognizer:(id)a3;
- (void)_setDismissGestureDirectionValueFilter:(id)a3;
- (void)_setHandlingPanGestureRecognizer:(BOOL)a3;
- (void)_setPanGestureRecognizer:(id)a3;
- (void)_setSwipedDownTileTracker:(id)a3;
- (void)dealloc;
- (void)updateGestureRecognizersWithHostingView:(id)a3;
@end

@implementation PUInteractiveSwipeDismissalController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__swipedDownTileTracker, 0);
  objc_storeStrong((id *)&self->__dismissGestureDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->_verticalSwipeGestureRecognizerHelper, 0);
  objc_storeStrong((id *)&self->__panGestureRecognizer, 0);
}

- (void)_setSwipedDownTileTracker:(id)a3
{
}

- (PUSwipedDownTileTracker)_swipedDownTileTracker
{
  return self->__swipedDownTileTracker;
}

- (void)_setDismissGestureDirectionValueFilter:(id)a3
{
}

- (PUChangeDirectionValueFilter)_dismissGestureDirectionValueFilter
{
  return self->__dismissGestureDirectionValueFilter;
}

- (void)_setHandlingPanGestureRecognizer:(BOOL)a3
{
  self->_handlingPanGestureRecognizer = a3;
}

- (BOOL)_isHandlingPanGestureRecognizer
{
  return self->_handlingPanGestureRecognizer;
}

- (PXVerticalSwipeGestureRecognizerHelper)verticalSwipeGestureRecognizerHelper
{
  return self->_verticalSwipeGestureRecognizerHelper;
}

- (void)_setPanGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  return self->__panGestureRecognizer;
}

- (BOOL)verticalSwipeGestureRecognizerHelper:(id)a3 shouldRecognizeSwipeDownGestureRecognizer:(id)a4
{
  return [(PUInteractiveDismissalController *)self canBeginDismissalAtLocationFromProvider:a4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUInteractiveSwipeDismissalController *)self _panGestureRecognizer];

  if (v8 == v6)
  {
    v10 = [(PUInteractiveSwipeDismissalController *)self verticalSwipeGestureRecognizerHelper];
    char v9 = [v10 verticalSwipeGestureRecognizer:v6 shouldBeRequiredToFailByGestureRecognizer:v7];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(PUInteractiveSwipeDismissalController *)self _panGestureRecognizer];

  if (v5 == v4)
  {
    id v7 = [(PUInteractiveSwipeDismissalController *)self verticalSwipeGestureRecognizerHelper];
    char v6 = [v7 verticalSwipeGestureRecognizerShouldBegin:v4];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)_handlePanGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  char v6 = [(PUInteractiveSwipeDismissalController *)self _swipedDownTileTracker];
  id v7 = [(PUInteractiveSwipeDismissalController *)self _dismissGestureDirectionValueFilter];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PUInteractiveSwipeDismissalController__handlePanGestureRecognizer___block_invoke;
  aBlock[3] = &unk_1E5F26578;
  id v8 = v6;
  v42 = v8;
  char v9 = v7;
  v43 = v9;
  v10 = (uint64_t (**)(void))_Block_copy(aBlock);
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == 2)
    {
      if ([(PUInteractiveSwipeDismissalController *)self _isHandlingPanGestureRecognizer])
      {
        if (v8)
        {
          [(PUInteractiveTileTracker *)v8 update];
          [(PUInteractiveTileTracker *)v8 progress];
          double v27 = v26;
        }
        else
        {
          v29 = [v4 view];
          [v4 translationInView:v29];
          double v31 = v30;

          [(PUValueFilter *)v9 setInputValue:v31];
          double v27 = v31 / 200.0;
        }
        [(PUInteractiveDismissalController *)self updateDismissalWithInteractionProgress:v10[2](v10) interactionWillFinish:v27];
      }
    }
    else if (v5 == 1 {
           && ![(PUInteractiveSwipeDismissalController *)self _isHandlingPanGestureRecognizer])
    }
    {
      [(PUInteractiveSwipeDismissalController *)self _setHandlingPanGestureRecognizer:1];
      v11 = +[PUWorkaroundSettings sharedInstance];
      int v12 = [v11 shouldWorkAround54502886];

      if (v12)
      {
        v13 = [(PUInteractiveDismissalController *)self delegate];
        v14 = [v13 interactiveDismissalControllerViewController:self];

        v15 = [v14 viewIfLoaded];
        [v15 safeAreaInsets];
        double v17 = v16;
        double v19 = v18;

        v20 = [v14 presentingViewController];
        v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        int v23 = [v22 hasPrefix:@"CAM"];

        v24 = [v14 traitCollection];
        if ([v24 userInterfaceIdiom])
        {
          BOOL v25 = 0;
        }
        else
        {
          v39 = [v14 viewIfLoaded];
          [v39 window];
          v32 = int v40 = v23;
          v33 = [v32 windowScene];
          BOOL v25 = (unint64_t)([v33 interfaceOrientation] - 3) < 2;

          int v23 = v40;
        }

        BOOL v34 = v17 > 0.0;
        if (v19 > 0.0) {
          BOOL v34 = 1;
        }
        int v28 = v23 & v25 & v34;
      }
      else
      {
        int v28 = 0;
      }
      v35 = [(PUInteractiveDismissalController *)self tilingView];
      if (v35)
      {
        v36 = [[PUSwipedDownTileTracker alloc] initWithPanGestureRecognizer:v4 tilingView:v35];

        [(PUInteractiveSwipeDismissalController *)self _setSwipedDownTileTracker:v36];
        v37 = [(PUInteractiveDismissalController *)self designatedTileController];
        [(PUSwipedDownTileTracker *)v36 setDesignatedTileController:v37];
        [(PUInteractiveTileTracker *)v36 update];

        id v8 = v36;
      }
      else
      {
        v38 = objc_alloc_init(PUChangeDirectionValueFilter);

        [(PUChangeDirectionValueFilter *)v38 setMinimumChangeValue:5.0];
        [(PUInteractiveSwipeDismissalController *)self _setDismissGestureDirectionValueFilter:v38];
        char v9 = v38;
      }
      [(PUInteractiveDismissalController *)self beginDismissal];
      if (v28) {
        objc_msgSend(v4, "px_cancel");
      }
    }
  }
  else if ([(PUInteractiveSwipeDismissalController *)self _isHandlingPanGestureRecognizer])
  {
    [(PUInteractiveSwipeDismissalController *)self _setHandlingPanGestureRecognizer:0];
    if (v8)
    {
      [(PUInteractiveTileTracker *)v8 update];
      [(PUInteractiveSwipeDismissalController *)self _setSwipedDownTileTracker:0];
    }
    else
    {
      [(PUInteractiveSwipeDismissalController *)self _setDismissGestureDirectionValueFilter:0];
    }
    [(PUInteractiveDismissalController *)self endDismissal:v10[2](v10)];
  }
}

uint64_t __69__PUInteractiveSwipeDismissalController__handlePanGestureRecognizer___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v2 shouldFinish];
  }
  else
  {
    [*(id *)(a1 + 40) outputValue];
    return v4 >= 0.0;
  }
}

- (void)updateGestureRecognizersWithHostingView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUInteractiveSwipeDismissalController;
  [(PUInteractiveDismissalController *)&v10 updateGestureRecognizersWithHostingView:v4];
  if (![(PUInteractiveSwipeDismissalController *)self _isHandlingPanGestureRecognizer])
  {
    uint64_t v5 = [(PUInteractiveSwipeDismissalController *)self _panGestureRecognizer];
    char v6 = v5;
    if (v4)
    {
      if (!v5)
      {
        char v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handlePanGestureRecognizer_];
        [v6 setDelegate:self];
        [v6 setAllowedScrollTypesMask:3];
        [(PUInteractiveSwipeDismissalController *)self _setPanGestureRecognizer:v6];
      }
      id v7 = [v6 view];

      if (v7 != v4)
      {
        id v8 = [v6 view];
        [v8 removeGestureRecognizer:v6];

        [v4 addGestureRecognizer:v6];
      }
    }
    else if (v5)
    {
      char v9 = [v5 view];
      [v9 removeGestureRecognizer:v6];

      [(PUInteractiveSwipeDismissalController *)self _setPanGestureRecognizer:0];
    }
  }
}

- (void)dealloc
{
  [(UIPanGestureRecognizer *)self->__panGestureRecognizer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PUInteractiveSwipeDismissalController;
  [(PUInteractiveSwipeDismissalController *)&v3 dealloc];
}

- (PUInteractiveSwipeDismissalController)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUInteractiveSwipeDismissalController;
  v2 = [(PUInteractiveSwipeDismissalController *)&v6 init];
  if (v2)
  {
    objc_super v3 = (PXVerticalSwipeGestureRecognizerHelper *)objc_alloc_init(MEMORY[0x1E4F90898]);
    verticalSwipeGestureRecognizerHelper = v2->_verticalSwipeGestureRecognizerHelper;
    v2->_verticalSwipeGestureRecognizerHelper = v3;

    [(PXVerticalSwipeGestureRecognizerHelper *)v2->_verticalSwipeGestureRecognizerHelper setDelegate:v2];
  }
  return v2;
}

@end