@interface PUSwipedDownTileTracker
- (PHSwipeDownTracker)_swipeDownTracker;
- (PUSwipedDownTileTracker)initWithPanGestureRecognizer:(id)a3 tilingView:(id)a4;
- (PUSwipedDownTileTracker)initWithTilingView:(id)a3;
- (PUTileController)designatedTileController;
- (PUTileLayoutInfo)_trackedTileLayoutInfo;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (id)tileControllerToTrack;
- (void)_setSwipeDownTracker:(id)a3;
- (void)_setTrackedTileLayoutInfo:(id)a3;
- (void)completeTracking;
- (void)setDesignatedTileController:(id)a3;
- (void)startTileControllerTracking;
- (void)updateGestureRecognizerTracking;
- (void)updateTileControllerTracking;
@end

@implementation PUSwipedDownTileTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__trackedTileLayoutInfo, 0);
  objc_storeStrong((id *)&self->__swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_designatedTileController, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
}

- (void)_setTrackedTileLayoutInfo:(id)a3
{
}

- (PUTileLayoutInfo)_trackedTileLayoutInfo
{
  return self->__trackedTileLayoutInfo;
}

- (void)_setSwipeDownTracker:(id)a3
{
}

- (PHSwipeDownTracker)_swipeDownTracker
{
  return self->__swipeDownTracker;
}

- (void)setDesignatedTileController:(id)a3
{
}

- (PUTileController)designatedTileController
{
  return self->_designatedTileController;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (id)tileControllerToTrack
{
  v3 = [(PUSwipedDownTileTracker *)self designatedTileController];
  if (!v3)
  {
    v4 = [(PUSwipedDownTileTracker *)self panGestureRecognizer];
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = __Block_byref_object_copy__89735;
    v11[4] = __Block_byref_object_dispose__89736;
    id v12 = 0;
    v5 = [(PUInteractiveTileTracker *)self tilingView];
    [v4 locationInView:v5];
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v10[3] = 0x7FEFFFFFFFFFFFFFLL;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__PUSwipedDownTileTracker_tileControllerToTrack__block_invoke;
    v9[3] = &unk_1E5F2C348;
    *(double *)&v9[6] = v6;
    *(double *)&v9[7] = v7;
    v9[4] = v10;
    v9[5] = v11;
    objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v9, v6 + -50.0, v7 + -50.0, 100.0, 100.0);
    _Block_object_dispose(v10, 8);

    _Block_object_dispose(v11, 8);
  }
  return v3;
}

void __48__PUSwipedDownTileTracker_tileControllerToTrack__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  double v7 = [v6 tileKind];
  int v8 = [v7 isEqualToString:@"PUTileKindItemContent"];

  if (v8)
  {
    [v6 center];
    double v11 = hypot(v9 - *(double *)(a1 + 48), v10 - *(double *)(a1 + 56));
    if (v11 < *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v11;
    }
  }
}

- (void)completeTracking
{
  v3.receiver = self;
  v3.super_class = (Class)PUSwipedDownTileTracker;
  [(PUInteractiveTileTracker *)&v3 completeTracking];
  [(PUSwipedDownTileTracker *)self _setSwipeDownTracker:0];
  [(PUSwipedDownTileTracker *)self _setTrackedTileLayoutInfo:0];
}

- (void)updateTileControllerTracking
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PUSwipedDownTileTracker;
  [(PUInteractiveTileTracker *)&v36 updateTileControllerTracking];
  objc_super v3 = [(PUSwipedDownTileTracker *)self panGestureRecognizer];
  v4 = [(PUInteractiveTileTracker *)self tilingView];
  [v3 translationInView:v4];
  double v6 = v5;
  double v8 = v7;
  [v3 velocityInView:v4];
  double v10 = v9;
  double v12 = v11;
  v13 = [(PUSwipedDownTileTracker *)self _swipeDownTracker];
  objc_msgSend(v13, "trackGestureTranslation:velocity:", v6, v8, v10, v12);
  v14 = [(PUSwipedDownTileTracker *)self _trackedTileLayoutInfo];
  [v13 trackedCenter];
  [v13 trackedBounds];
  PXRectWithCenterAndSize();
  objc_msgSend(v4, "px_screenScale");
  PXRectShrinkToPixel();
  double v16 = v15;
  double v18 = v17;
  PXRectGetCenter();
  double v20 = v19;
  double v22 = v21;
  if (v13) {
    [v13 trackedTransform];
  }
  else {
    memset(v35, 0, sizeof(v35));
  }
  v23 = objc_msgSend(v14, "layoutInfoWithCenter:size:transform:", v35, v20, v22, v16, v18);

  v24 = [(PUInteractiveTileTracker *)self trackedTileController];
  [v24 applyLayoutInfo:v23];

  [v13 dismissalProgress];
  -[PUInteractiveTileTracker setProgress:](self, "setProgress:");
  [v13 trackedVelocity];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = PLOneUpGetLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    v34 = [NSString stringWithFormat:@"{x:%0.1f, y:%0.1f, s:%0.3f, r:%0.2f}", *(void *)&v26, *(void *)&v28, *(void *)&v30, *(void *)&v32];
    *(_DWORD *)buf = 138412290;
    v38 = v34;
    _os_log_impl(&dword_1AE9F8000, v33, OS_LOG_TYPE_DEBUG, "current swipe down velocity: %@", buf, 0xCu);
  }
  -[PUInteractiveTileTracker setCurrentVelocity:](self, "setCurrentVelocity:", v26, v28, v30, v32);
}

- (void)startTileControllerTracking
{
  v36.receiver = self;
  v36.super_class = (Class)PUSwipedDownTileTracker;
  [(PUInteractiveTileTracker *)&v36 startTileControllerTracking];
  v4 = [(PUInteractiveTileTracker *)self trackedTileController];
  double v5 = [(PUInteractiveTileTracker *)self tilingView];
  double v6 = [v4 presentationLayoutInfo];
  double v7 = [v5 layout];
  double v8 = [v6 indexPath];
  double v9 = [v6 tileKind];
  double v10 = [v7 layoutInfoForTileWithIndexPath:v8 kind:v9];

  double v11 = [(PUSwipedDownTileTracker *)self _swipeDownTracker];
  if (!v11)
  {
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PUSwipedDownTileTracker.m", 80, @"Invalid parameter not satisfying: %@", @"swipeDownTracker" object file lineNumber description];
  }
  double v12 = [(PUSwipedDownTileTracker *)self panGestureRecognizer];
  [v12 locationInView:v5];
  double v14 = v13;
  double v16 = v15;
  if (v10)
  {
    double v17 = [v5 contentCoordinateSystem];
    double v18 = [v10 coordinateSystem];
    double v14 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v17, v18, v14, v16);
    double v16 = v19;
  }
  [v12 translationInView:v5];
  double v21 = v20;
  double v23 = v22;
  [v10 center];
  double v33 = v25;
  double v34 = v24;
  double v26 = *MEMORY[0x1E4F1DAD8];
  double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [v10 size];
  double v29 = v28;
  double v31 = v30;
  if (v10) {
    [v10 transform];
  }
  else {
    memset(v35, 0, sizeof(v35));
  }
  objc_msgSend(v11, "startTrackingCenter:bounds:transform:withInitialGestureLocation:", v35, v34, v33, v26, v27, v29, v31, v14 - v21, v16 - v23);
  [(PUSwipedDownTileTracker *)self _setTrackedTileLayoutInfo:v10];
}

- (void)updateGestureRecognizerTracking
{
  v14.receiver = self;
  v14.super_class = (Class)PUSwipedDownTileTracker;
  [(PUInteractiveTileTracker *)&v14 updateGestureRecognizerTracking];
  objc_super v3 = [(PUSwipedDownTileTracker *)self panGestureRecognizer];
  v4 = [(PUInteractiveTileTracker *)self tilingView];
  [v3 translationInView:v4];
  double v6 = v5;
  double v8 = v7;
  [v3 velocityInView:v4];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(PUSwipedDownTileTracker *)self _swipeDownTracker];
  if (!v13)
  {
    double v13 = objc_alloc_init(PHSwipeDownTracker);
    [(PUSwipedDownTileTracker *)self _setSwipeDownTracker:v13];
  }
  -[PHSwipeDownTracker trackGestureTranslation:velocity:](v13, "trackGestureTranslation:velocity:", v6, v8, v10, v12);
  -[PUInteractiveTileTracker setShouldEnd:](self, "setShouldEnd:", (unint64_t)([v3 state] - 3) < 2);
  [(PUInteractiveTileTracker *)self setShouldFinish:[(PHSwipeDownTracker *)v13 shouldFinishDismissal]];
}

- (PUSwipedDownTileTracker)initWithPanGestureRecognizer:(id)a3 tilingView:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUSwipedDownTileTracker.m", 39, @"Invalid parameter not satisfying: %@", @"panGestureRecognizer != nil" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PUSwipedDownTileTracker;
  double v10 = [(PUInteractiveTileTracker *)&v14 initWithTilingView:v9];
  double v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_panGestureRecognizer, a3);
  }

  return v11;
}

- (PUSwipedDownTileTracker)initWithTilingView:(id)a3
{
  return [(PUSwipedDownTileTracker *)self initWithPanGestureRecognizer:0 tilingView:a3];
}

@end