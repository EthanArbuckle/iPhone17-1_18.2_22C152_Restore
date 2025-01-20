@interface PUInteractivePinchDismissalController
- (BOOL)_isHandlingPinchGestureRecognizer;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (PUChangeDirectionValueFilter)_scaleDirectionValueFilter;
- (PUPinchedTileTracker)_pinchedTileTracker;
- (UIPinchGestureRecognizer)_pinchGestureRecognizer;
- (id)pinchedTiledTracker:(id)a3 finalLayoutInfoForInitialLayoutInfo:(id)a4;
- (void)_handlePinchGestureRecognizer:(id)a3;
- (void)_setHandlingPinchGestureRecognizer:(BOOL)a3;
- (void)_setPinchGestureRecognizer:(id)a3;
- (void)_setPinchedTileTracker:(id)a3;
- (void)_setScaleDirectionValueFilter:(id)a3;
- (void)dealloc;
- (void)updateGestureRecognizersWithHostingView:(id)a3;
@end

@implementation PUInteractivePinchDismissalController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pinchedTileTracker, 0);
  objc_storeStrong((id *)&self->__scaleDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->__pinchGestureRecognizer, 0);
}

- (void)_setPinchedTileTracker:(id)a3
{
}

- (PUPinchedTileTracker)_pinchedTileTracker
{
  return self->__pinchedTileTracker;
}

- (void)_setScaleDirectionValueFilter:(id)a3
{
}

- (PUChangeDirectionValueFilter)_scaleDirectionValueFilter
{
  return self->__scaleDirectionValueFilter;
}

- (void)_setHandlingPinchGestureRecognizer:(BOOL)a3
{
  self->_handlingPinchGestureRecognizer = a3;
}

- (BOOL)_isHandlingPinchGestureRecognizer
{
  return self->_handlingPinchGestureRecognizer;
}

- (void)_setPinchGestureRecognizer:(id)a3
{
}

- (UIPinchGestureRecognizer)_pinchGestureRecognizer
{
  return self->__pinchGestureRecognizer;
}

- (id)pinchedTiledTracker:(id)a3 finalLayoutInfoForInitialLayoutInfo:(id)a4
{
  id v5 = a4;
  v6 = [(PUInteractiveDismissalController *)self tilingViewControllerTransition];
  if ([v6 hasStarted])
  {
    v7 = [(PUInteractiveDismissalController *)self tilingView];
    v8 = [v7 layout];
    v9 = [v5 indexPath];
    v10 = [v5 tileKind];
    v11 = [v8 layoutInfoForTileWithIndexPath:v9 kind:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUInteractivePinchDismissalController *)self _pinchGestureRecognizer];
  if (v8 != v6)
  {

LABEL_7:
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_7;
  }
  id v17 = 0;
  int v10 = objc_msgSend(v7, "px_isPinchGestureRecognizerOfScrollView:", &v17);
  id v11 = v17;
  v12 = v11;
  if (v10)
  {
    [v11 minimumZoomScale];
    double v14 = v13;
    [v12 zoomScale];
    LOBYTE(v10) = v15 <= v14;
  }

LABEL_8:
  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(PUInteractivePinchDismissalController *)self _pinchGestureRecognizer];
  if (v5 == v4)
  {
    if ([(PUInteractiveDismissalController *)self canBeginDismissalAtLocationFromProvider:v4])
    {
      [v4 velocity];
      BOOL v6 = v7 < 0.0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)_handlePinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  BOOL v6 = [(PUInteractivePinchDismissalController *)self _pinchedTileTracker];
  double v7 = [(PUInteractivePinchDismissalController *)self _scaleDirectionValueFilter];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __71__PUInteractivePinchDismissalController__handlePinchGestureRecognizer___block_invoke;
  v21 = &unk_1E5F26578;
  id v8 = v6;
  v22 = v8;
  v9 = v7;
  v23 = v9;
  int v10 = (uint64_t (**)(void))_Block_copy(&v18);
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == 2)
    {
      if ([(PUInteractivePinchDismissalController *)self _isHandlingPinchGestureRecognizer])
      {
        if (v8)
        {
          [(PUInteractiveTileTracker *)v8 update];
          [(PUInteractiveTileTracker *)v8 progress];
          double v14 = v13;
        }
        else
        {
          [v4 scale];
          double v16 = v15;
          -[PUValueFilter setInputValue:](v9, "setInputValue:");
          double v14 = 1.0 - v16 + 1.0 - v16;
        }
        [(PUInteractiveDismissalController *)self updateDismissalWithInteractionProgress:v10[2](v10) interactionWillFinish:v14];
      }
    }
    else if (v5 == 1 {
           && ![(PUInteractivePinchDismissalController *)self _isHandlingPinchGestureRecognizer])
    }
    {
      [(PUInteractivePinchDismissalController *)self _setHandlingPinchGestureRecognizer:1];
      id v11 = [(PUInteractiveDismissalController *)self tilingView];
      if (v11)
      {
        v12 = [[PUPinchedTileTracker alloc] initWithPinchGestureRecognizer:v4 tilingView:v11 direction:2];

        [(PUPinchedTileTracker *)v12 setDelegate:self];
        [(PUInteractivePinchDismissalController *)self _setPinchedTileTracker:v12];
        [(PUInteractiveTileTracker *)v12 update];
        id v8 = v12;
      }
      else
      {
        id v17 = objc_alloc_init(PUChangeDirectionValueFilter);

        [(PUChangeDirectionValueFilter *)v17 setMinimumChangeValue:0.05];
        [(PUInteractivePinchDismissalController *)self _setScaleDirectionValueFilter:v17];
        v9 = v17;
      }
      [(PUInteractiveDismissalController *)self beginDismissal];
    }
  }
  else if ([(PUInteractivePinchDismissalController *)self _isHandlingPinchGestureRecognizer])
  {
    [(PUInteractivePinchDismissalController *)self _setHandlingPinchGestureRecognizer:0];
    if (v8)
    {
      [(PUInteractiveTileTracker *)v8 update];
      [(PUInteractivePinchDismissalController *)self _setPinchedTileTracker:0];
    }
    else
    {
      [(PUInteractivePinchDismissalController *)self _setScaleDirectionValueFilter:0];
    }
    [(PUInteractiveDismissalController *)self endDismissal:v10[2](v10)];
  }
}

uint64_t __71__PUInteractivePinchDismissalController__handlePinchGestureRecognizer___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v2 shouldFinish];
  }
  else
  {
    [*(id *)(a1 + 40) outputValue];
    return v4 <= 0.0;
  }
}

- (void)updateGestureRecognizersWithHostingView:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUInteractivePinchDismissalController;
  [(PUInteractiveDismissalController *)&v10 updateGestureRecognizersWithHostingView:v4];
  if (![(PUInteractivePinchDismissalController *)self _isHandlingPinchGestureRecognizer])
  {
    uint64_t v5 = [(PUInteractivePinchDismissalController *)self _pinchGestureRecognizer];
    BOOL v6 = v5;
    if (v4)
    {
      if (!v5)
      {
        BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:self action:sel__handlePinchGestureRecognizer_];
        [v6 setDelegate:self];
        [(PUInteractivePinchDismissalController *)self _setPinchGestureRecognizer:v6];
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
      v9 = [v5 view];
      [v9 removeGestureRecognizer:v6];

      [(PUInteractivePinchDismissalController *)self _setPinchGestureRecognizer:0];
    }
  }
}

- (void)dealloc
{
  [(UIPinchGestureRecognizer *)self->__pinchGestureRecognizer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PUInteractivePinchDismissalController;
  [(PUInteractivePinchDismissalController *)&v3 dealloc];
}

@end