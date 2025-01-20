@interface PUOneUpGestureRecognizerCoordinator
- (BOOL)_needsUpdateGestureRecognizers;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (NSHashTable)_irisGestureRecognizers;
- (PUBrowsingSession)browsingSession;
- (PUDoubleTapZoomController)doubleTapZoomController;
- (PUOneUpBarsController)oneUpBarsController;
- (PUOneUpGestureRecognizerCoordinatorDelegate)delegate;
- (PUTouchingGestureRecognizer)touchingGestureRecognizer;
- (id)longPressGestureRecognizer;
- (void)_invalidateGestureRecognizers;
- (void)_setIrisGestureRecognizers:(id)a3;
- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3;
- (void)_updateGestureRecognizersIfNeeded;
- (void)addIrisGestureRecognizer:(id)a3;
- (void)invalidateViewHostingGestureRecognizers;
- (void)setBrowsingSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoubleTapZoomController:(id)a3;
- (void)setOneUpBarsController:(id)a3;
@end

@implementation PUOneUpGestureRecognizerCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__irisGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_doubleTapZoomController, 0);
  objc_storeStrong((id *)&self->_oneUpBarsController, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
}

- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3
{
  self->__needsUpdateGestureRecognizers = a3;
}

- (BOOL)_needsUpdateGestureRecognizers
{
  return self->__needsUpdateGestureRecognizers;
}

- (void)_setIrisGestureRecognizers:(id)a3
{
}

- (NSHashTable)_irisGestureRecognizers
{
  return self->__irisGestureRecognizers;
}

- (void)setDoubleTapZoomController:(id)a3
{
}

- (PUDoubleTapZoomController)doubleTapZoomController
{
  return self->_doubleTapZoomController;
}

- (void)setOneUpBarsController:(id)a3
{
}

- (PUOneUpBarsController)oneUpBarsController
{
  return self->_oneUpBarsController;
}

- (void)setBrowsingSession:(id)a3
{
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (PUOneUpGestureRecognizerCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOneUpGestureRecognizerCoordinatorDelegate *)WeakRetained;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUOneUpGestureRecognizerCoordinator *)self _irisGestureRecognizers];
  if ([v8 containsObject:v6]) {
    char v9 = 1;
  }
  else {
    char v9 = [v8 containsObject:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  v11 = [(PUOneUpGestureRecognizerCoordinator *)self oneUpBarsController];
  id v12 = [v11 tapGestureRecognizer];
  if (v12 == v6)
  {
    BOOL v15 = 0;
  }
  else
  {
    v13 = [(PUOneUpGestureRecognizerCoordinator *)self oneUpBarsController];
    id v14 = [v13 tapGestureRecognizer];
    BOOL v15 = v14 != v7;
  }
  v16 = [(PUOneUpGestureRecognizerCoordinator *)self browsingSession];
  v17 = [v16 viewModel];
  char v18 = [v17 isScrubbing];

  return isKindOfClass & (v15 | isKindOfClass & v18 ^ 1) | v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUOneUpGestureRecognizerCoordinator *)self oneUpBarsController];
  id v9 = [v8 tapGestureRecognizer];
  if (v9 == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = [v6 view];
    v11 = [v7 view];

    if (v10 == v11)
    {
      char isKindOfClass = 1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  v13 = [(PUOneUpGestureRecognizerCoordinator *)self doubleTapZoomController];
  id v14 = [v13 doubleTapGestureRecognizer];

  if (v14 == v6)
  {
    id v15 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    id v15 = [(PUOneUpGestureRecognizerCoordinator *)self oneUpBarsController];
    id v16 = [v15 tapGestureRecognizer];
    if (v16 == v6)
    {
      v17 = (objc_class *)objc_opt_class();
      char v18 = NSStringFromClass(v17);
      if ([v18 isEqualToString:@"UITextTapRecognizer"]) {
        char isKindOfClass = [v7 numberOfTapsRequired] == 1;
      }
      else {
        char isKindOfClass = 0;
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
LABEL_16:

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PUOneUpGestureRecognizerCoordinator *)self oneUpBarsController];
  id v9 = [v8 tapGestureRecognizer];
  if (v9 == v6)
  {
    v11 = [(PUOneUpGestureRecognizerCoordinator *)self doubleTapZoomController];
    id v12 = [v11 doubleTapGestureRecognizer];

    if (v12 != v7)
    {
      char v10 = 0;
      goto LABEL_6;
    }
    v8 = [(PUOneUpGestureRecognizerCoordinator *)self doubleTapZoomController];
    char v10 = [v8 shouldDoubleTapBeginAtLocationFromProvider:v6];
  }
  else
  {

    char v10 = 0;
  }

LABEL_6:
  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = [(PUOneUpGestureRecognizerCoordinator *)self doubleTapZoomController];
  id v6 = [v5 doubleTapGestureRecognizer];

  if (v6 == v4)
  {
    v11 = [(PUOneUpGestureRecognizerCoordinator *)self doubleTapZoomController];
    char v12 = [v11 shouldDoubleTapBeginAtLocationFromProvider:v4];
    goto LABEL_9;
  }
  id v7 = [(PUOneUpGestureRecognizerCoordinator *)self oneUpBarsController];
  id v8 = [v7 tapGestureRecognizer];

  if (v8 == v4)
  {
    v11 = [(PUOneUpGestureRecognizerCoordinator *)self oneUpBarsController];
    char v12 = [v11 shouldTapBeginAtLocationFromProvider:v4];
    goto LABEL_9;
  }
  if (self->_delegateFlags.respondsToShouldAllowIrisGestureRecognizer)
  {
    id v9 = [(PUOneUpGestureRecognizerCoordinator *)self _irisGestureRecognizers];
    int v10 = [v9 containsObject:v4];

    if (v10)
    {
      v11 = [(PUOneUpGestureRecognizerCoordinator *)self delegate];
      char v12 = [v11 oneUpGestureRecognizerCoordinator:self shouldAllowIrisGestureAtLocationFromProvider:v4];
LABEL_9:
      BOOL v13 = v12;

      goto LABEL_10;
    }
  }
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (void)_updateGestureRecognizersIfNeeded
{
  if ([(PUOneUpGestureRecognizerCoordinator *)self _needsUpdateGestureRecognizers])
  {
    [(PUOneUpGestureRecognizerCoordinator *)self _setNeedsUpdateGestureRecognizers:0];
    if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
    {
      v3 = [(PUOneUpGestureRecognizerCoordinator *)self delegate];
      id v7 = [v3 oneUpGestureRecognizerCoordinatorViewHostingTouchingGesture:self];
    }
    else
    {
      id v7 = 0;
    }
    id v4 = [(PUOneUpGestureRecognizerCoordinator *)self touchingGestureRecognizer];
    if (!v4)
    {
      id v4 = [[PUTouchingGestureRecognizer alloc] initWithTarget:0 action:0];
      [(PUTouchingGestureRecognizer *)v4 setCancelsTouchesInView:0];
      [(PUTouchingGestureRecognizer *)v4 setDelaysTouchesBegan:0];
      [(PUTouchingGestureRecognizer *)v4 setDelaysTouchesEnded:0];
      objc_storeStrong((id *)&self->_touchingGestureRecognizer, v4);
      [(PUTouchingGestureRecognizer *)v4 setDelegate:self];
    }
    id v5 = [(PUTouchingGestureRecognizer *)v4 view];

    if (v7 != v5)
    {
      id v6 = [(PUTouchingGestureRecognizer *)v4 view];
      [v6 removeGestureRecognizer:v4];

      [v7 addGestureRecognizer:v4];
    }
  }
}

- (void)invalidateViewHostingGestureRecognizers
{
  [(PUOneUpGestureRecognizerCoordinator *)self _invalidateGestureRecognizers];
  [(PUOneUpGestureRecognizerCoordinator *)self _updateGestureRecognizersIfNeeded];
}

- (void)_invalidateGestureRecognizers
{
}

- (id)longPressGestureRecognizer
{
  [(PUOneUpGestureRecognizerCoordinator *)self _updateGestureRecognizersIfNeeded];
  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  return longPressGestureRecognizer;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToShouldAllowIrisGestureRecognizer = objc_opt_respondsToSelector() & 1;
    [(PUOneUpGestureRecognizerCoordinator *)self _invalidateGestureRecognizers];
    [(PUOneUpGestureRecognizerCoordinator *)self _updateGestureRecognizersIfNeeded];
  }
}

- (PUTouchingGestureRecognizer)touchingGestureRecognizer
{
  [(PUOneUpGestureRecognizerCoordinator *)self _updateGestureRecognizersIfNeeded];
  touchingGestureRecognizer = self->_touchingGestureRecognizer;
  return touchingGestureRecognizer;
}

- (void)addIrisGestureRecognizer:(id)a3
{
  id v5 = a3;
  id v4 = [(PUOneUpGestureRecognizerCoordinator *)self _irisGestureRecognizers];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    [(PUOneUpGestureRecognizerCoordinator *)self _setIrisGestureRecognizers:v4];
  }
  [v4 addObject:v5];
}

@end