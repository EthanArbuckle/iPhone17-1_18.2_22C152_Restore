@interface PUInteractiveTileTracker
- (BOOL)shouldEnd;
- (BOOL)shouldFinish;
- (PUDisplayVelocity)currentVelocity;
- (PUInteractiveTileTracker)init;
- (PUInteractiveTileTracker)initWithTilingView:(id)a3;
- (PUInteractiveTileTrackerDelegate)delegate;
- (PUTileController)trackedTileController;
- (PUTileHider)_tileHider;
- (PUTilingView)tilingView;
- (double)progress;
- (id)tileControllerToTrack;
- (int64_t)_state;
- (void)_setState:(int64_t)a3;
- (void)_setTileHider:(id)a3;
- (void)_setTrackedTileController:(id)a3;
- (void)_updateTrackedTileController;
- (void)setCurrentVelocity:(PUDisplayVelocity)a3;
- (void)setDelegate:(id)a3;
- (void)setProgress:(double)a3;
- (void)setShouldEnd:(BOOL)a3;
- (void)setShouldFinish:(BOOL)a3;
- (void)startTileControllerTracking;
- (void)stopTileControllerTracking;
- (void)update;
@end

@implementation PUInteractiveTileTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedTileController, 0);
  objc_storeStrong((id *)&self->__tileHider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tilingView, 0);
}

- (PUTileController)trackedTileController
{
  return self->_trackedTileController;
}

- (void)_setTileHider:(id)a3
{
}

- (PUTileHider)_tileHider
{
  return self->__tileHider;
}

- (int64_t)_state
{
  return self->__state;
}

- (void)setCurrentVelocity:(PUDisplayVelocity)a3
{
  self->_currentVelocity = a3;
}

- (PUDisplayVelocity)currentVelocity
{
  double x = self->_currentVelocity.x;
  double y = self->_currentVelocity.y;
  double scale = self->_currentVelocity.scale;
  double rotation = self->_currentVelocity.rotation;
  result.double rotation = rotation;
  result.double scale = scale;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setShouldFinish:(BOOL)a3
{
  self->_shouldFinish = a3;
}

- (BOOL)shouldFinish
{
  return self->_shouldFinish;
}

- (void)setShouldEnd:(BOOL)a3
{
  self->_shouldEnd = a3;
}

- (BOOL)shouldEnd
{
  return self->_shouldEnd;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)progress
{
  return self->_progress;
}

- (PUInteractiveTileTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUInteractiveTileTrackerDelegate *)WeakRetained;
}

- (PUTilingView)tilingView
{
  return self->_tilingView;
}

- (void)_setTrackedTileController:(id)a3
{
}

- (void)_setState:(int64_t)a3
{
  int64_t state = self->__state;
  if (state != a3)
  {
    if (state)
    {
      if (state == 1 && a3 == 2) {
        goto LABEL_8;
      }
    }
    else if ((unint64_t)(a3 - 1) < 2)
    {
      goto LABEL_8;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSNumber numberWithInteger:self->__state];
    v10 = [NSNumber numberWithInteger:a3];
    [v8 handleFailureInMethod:a2, self, @"PUInteractiveTileTracker.m", 189, @"invalid state transition %@ -> %@", v9, v10 object file lineNumber description];

LABEL_8:
    self->__int64_t state = a3;
  }
}

- (void)_updateTrackedTileController
{
  v3 = [(PUInteractiveTileTracker *)self trackedTileController];
  if (!v3)
  {
    v3 = [(PUInteractiveTileTracker *)self tileControllerToTrack];
    if (v3)
    {
      id v4 = v3;
      [(PUInteractiveTileTracker *)self _setTrackedTileController:v3];
      [(PUInteractiveTileTracker *)self startTileControllerTracking];
      v3 = v4;
    }
  }
}

- (id)tileControllerToTrack
{
  return 0;
}

- (void)stopTileControllerTracking
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [(PUInteractiveTileTracker *)self trackedTileController];
  if (!v4)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUInteractiveTileTracker.m", 122, @"Invalid parameter not satisfying: %@", @"tileController != nil" object file lineNumber description];
  }
  [(PUInteractiveTileTracker *)self currentVelocity];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = PLOneUpGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = [NSString stringWithFormat:@"{x:%0.1f, y:%0.1f, s:%0.3f, r:%0.2f}", *(void *)&v6, *(void *)&v8, *(void *)&v10, *(void *)&v12];
    *(_DWORD *)buf = 138412290;
    v23 = v14;
    _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEBUG, "final tile velocity: %@", buf, 0xCu);
  }
  v15 = objc_alloc_init(PUTileReattachmentContext);
  -[PUTileReattachmentContext setVelocity:forTileController:](v15, "setVelocity:forTileController:", v4, v6, v8, v10, v12);
  [(PUInteractiveTileTracker *)self configureTileReattachmentContext:v15];
  v16 = [(PUInteractiveTileTracker *)self tilingView];
  v21 = v4;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v16 reattachTileControllers:v17 withContext:v15];

  if (self->_delegateFlags.respondsToDidStopTrackingTileController)
  {
    v18 = [(PUInteractiveTileTracker *)self delegate];
    [v18 interactiveTileTracker:self didStopTrackingTileController:v4];
  }
  v19 = [(PUInteractiveTileTracker *)self _tileHider];
  if (v19)
  {
    if ([(PUInteractiveTileTracker *)self shouldFinish]) {
      [v19 reattachTiles];
    }
    else {
      [v19 unhideTilesAnimated:1];
    }
    [(PUInteractiveTileTracker *)self _setTileHider:0];
  }
}

- (void)startTileControllerTracking
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PUInteractiveTileTracker *)self trackedTileController];
  if (!v4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUInteractiveTileTracker.m", 100, @"Invalid parameter not satisfying: %@", @"tileController != nil" object file lineNumber description];
  }
  double v5 = [(PUInteractiveTileTracker *)self tilingView];
  v14[0] = v4;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v5 detachTileControllers:v6];

  if (self->_delegateFlags.respondsToWillStartTrackingTileController)
  {
    double v7 = [(PUInteractiveTileTracker *)self delegate];
    [v7 interactiveTileTracker:self willStartTrackingTileController:v4];
  }
  double v8 = [[PUTileHider alloc] initWithTilingView:v5];
  [(PUInteractiveTileTracker *)self _setTileHider:v8];
  double v9 = [v4 presentationLayoutInfo];
  double v10 = +[PUOneUpTilingLayout centerTileKinds];
  double v11 = [v9 indexPath];
  double v12 = [v9 dataSourceIdentifier];
  [(PUTileHider *)v8 hideTilesAtIndexPath:v11 withKinds:v10 dataSourceIdentifier:v12 animated:1];
}

- (void)update
{
  if ([(PUInteractiveTileTracker *)self _state] != 2)
  {
    [(PUInteractiveTileTracker *)self updateGestureRecognizerTracking];
    [(PUInteractiveTileTracker *)self _updateTrackedTileController];
    id v3 = [(PUInteractiveTileTracker *)self trackedTileController];
    if ([(PUInteractiveTileTracker *)self shouldEnd])
    {
      if (v3)
      {
        [(PUInteractiveTileTracker *)self stopTileControllerTracking];
        [(PUInteractiveTileTracker *)self _setTrackedTileController:0];
      }
      [(PUInteractiveTileTracker *)self _setState:2];
      [(PUInteractiveTileTracker *)self completeTracking];
    }
    else
    {
      [(PUInteractiveTileTracker *)self _setState:1];
      [(PUInteractiveTileTracker *)self updateTileControllerTracking];
    }
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToWillStartTrackingTileController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidStopTrackingTileController = objc_opt_respondsToSelector() & 1;
  }
}

- (PUInteractiveTileTracker)initWithTilingView:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUInteractiveTileTracker.m", 49, @"Invalid parameter not satisfying: %@", @"tilingView != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PUInteractiveTileTracker;
  double v7 = [(PUInteractiveTileTracker *)&v11 init];
  double v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_tilingView, a3);
    v8->_shouldFinish = 1;
  }

  return v8;
}

- (PUInteractiveTileTracker)init
{
  return [(PUInteractiveTileTracker *)self initWithTilingView:0];
}

@end