@interface PUDoubleTapZoomController
- (BOOL)_needsUpdateGestureRecognizers;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)shouldDoubleTapBeginAtLocationFromProvider:(id)a3;
- (PUDoubleTapZoomController)init;
- (PUDoubleTapZoomControllerDelegate)delegate;
- (UITapGestureRecognizer)_doubleTapGestureRecognizer;
- (UITapGestureRecognizer)doubleTapGestureRecognizer;
- (id)_userTransformViewAtLocationFromProvider:(id)a3;
- (void)_handleDoubleTapGestureRecognizer:(id)a3;
- (void)_invalidateGestureRecognizers;
- (void)_setDoubleTapGestureRecognizer:(id)a3;
- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3;
- (void)_updateGestureRecognizersIfNeeded;
- (void)invalidateViewHostingGestureRecognizers;
- (void)setDelegate:(id)a3;
@end

@implementation PUDoubleTapZoomController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__doubleTapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setDoubleTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)_doubleTapGestureRecognizer
{
  return self->__doubleTapGestureRecognizer;
}

- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3
{
  self->__needsUpdateGestureRecognizers = a3;
}

- (BOOL)_needsUpdateGestureRecognizers
{
  return self->__needsUpdateGestureRecognizers;
}

- (PUDoubleTapZoomControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUDoubleTapZoomControllerDelegate *)WeakRetained;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return [(PUDoubleTapZoomController *)self shouldDoubleTapBeginAtLocationFromProvider:a4];
}

- (id)_userTransformViewAtLocationFromProvider:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23261;
  v16 = __Block_byref_object_dispose__23262;
  id v17 = 0;
  if (self->_delegateFlags.respondsToTilingView)
  {
    v5 = [(PUDoubleTapZoomController *)self delegate];
    v6 = [v5 doubleTapZoomControllerTilingView:self];

    if (v6)
    {
      [v4 locationInView:v6];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __70__PUDoubleTapZoomController__userTransformViewAtLocationFromProvider___block_invoke;
      v11[3] = &unk_1E5F27F88;
      v11[4] = &v12;
      objc_msgSend(v6, "enumeratePresentedTileControllersInRect:usingBlock:", v11, v7 + -1.0, v8 + -1.0, 2.0, 2.0);
    }
  }
  else
  {
    v6 = 0;
  }
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

void __70__PUDoubleTapZoomController__userTransformViewAtLocationFromProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v9 userTransformView];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (void)_handleDoubleTapGestureRecognizer:(id)a3
{
  id v5 = a3;
  if ([v5 state] == 3)
  {
    id v4 = [(PUDoubleTapZoomController *)self _userTransformViewAtLocationFromProvider:v5];
    if ([v4 hasUserZoomedIn]) {
      [v4 zoomOut:1];
    }
    else {
      [v4 zoomInOnLocationFromProvider:v5];
    }
  }
}

- (void)_updateGestureRecognizersIfNeeded
{
  if ([(PUDoubleTapZoomController *)self _needsUpdateGestureRecognizers])
  {
    [(PUDoubleTapZoomController *)self _setNeedsUpdateGestureRecognizers:0];
    if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
    {
      v3 = [(PUDoubleTapZoomController *)self delegate];
      id v10 = [v3 doubleTapZoomControllerViewHostingGestureRecognizers:self];
    }
    else
    {
      id v10 = 0;
    }
    id v4 = [(PUDoubleTapZoomController *)self _doubleTapGestureRecognizer];
    if (v10)
    {
      if (!v4)
      {
        id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDoubleTapGestureRecognizer_];
        [v4 setNumberOfTapsRequired:2];
        [(PUDoubleTapZoomController *)self _setDoubleTapGestureRecognizer:v4];
        if (!self->_delegateFlags.respondsToDelegateForGestureRecognizer
          || ([(PUDoubleTapZoomController *)self delegate],
              id v5 = objc_claimAutoreleasedReturnValue(),
              [v5 doubleTapZoomController:self delegateForGestureRecognizer:v4],
              uint64_t v6 = (PUDoubleTapZoomController *)objc_claimAutoreleasedReturnValue(),
              v5,
              !v6))
        {
          uint64_t v6 = self;
        }
        [v4 setDelegate:v6];
      }
      id v7 = [v4 view];

      if (v10 != v7)
      {
        double v8 = [v4 view];
        [v8 removeGestureRecognizer:v4];

        [v10 addGestureRecognizer:v4];
      }
    }
    else if (v4)
    {
      id v9 = [v4 view];
      [v9 removeGestureRecognizer:v4];

      [(PUDoubleTapZoomController *)self _setDoubleTapGestureRecognizer:0];
    }
  }
}

- (void)_invalidateGestureRecognizers
{
}

- (BOOL)shouldDoubleTapBeginAtLocationFromProvider:(id)a3
{
  id v4 = a3;
  id v5 = +[PUOneUpSettings sharedInstance];
  int v6 = [v5 allowDoubleTapZoom];

  id v7 = +[PUOneUpSettings sharedInstance];
  if (v6
    && (!self->_delegateFlags.respondsToCanDoubleTapBeginAtLocationFromProvider
     || ([(PUDoubleTapZoomController *)self delegate],
         double v8 = objc_claimAutoreleasedReturnValue(),
         int v9 = [v8 doubleTapZoomController:self canDoubleTapBeginAtLocationFromProvider:v4],
         v8,
         v9)))
  {
    if ([v7 doubleTapZoomAreaExcludesBackground])
    {
      id v10 = [(PUDoubleTapZoomController *)self _userTransformViewAtLocationFromProvider:v4];
      v11 = v10;
      if (v10) {
        char v12 = [v10 contentContainsLocationFromProvider:v4];
      }
      else {
        char v12 = 1;
      }
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  [(PUDoubleTapZoomController *)self _updateGestureRecognizersIfNeeded];
  return [(PUDoubleTapZoomController *)self _doubleTapGestureRecognizer];
}

- (void)invalidateViewHostingGestureRecognizers
{
  [(PUDoubleTapZoomController *)self _invalidateGestureRecognizers];
  [(PUDoubleTapZoomController *)self _updateGestureRecognizersIfNeeded];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToTilingView = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDelegateForGestureRecognizer = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToCanDoubleTapBeginAtLocationFromProvider = objc_opt_respondsToSelector() & 1;
    [(PUDoubleTapZoomController *)self _invalidateGestureRecognizers];
    [(PUDoubleTapZoomController *)self _updateGestureRecognizersIfNeeded];
  }
}

- (PUDoubleTapZoomController)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUDoubleTapZoomController;
  result = [(PUDoubleTapZoomController *)&v3 init];
  if (result) {
    result->__needsUpdateGestureRecognizers = 1;
  }
  return result;
}

@end