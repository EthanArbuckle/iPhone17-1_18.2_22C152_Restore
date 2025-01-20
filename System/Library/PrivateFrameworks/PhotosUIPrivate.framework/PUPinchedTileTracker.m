@interface PUPinchedTileTracker
- (PUChangeDirectionValueFilter)_pinchGestureRecognizerScaleDirectionValueFilter;
- (PUPinchTracker)_pinchTracker;
- (PUPinchedTileTracker)initWithPinchGestureRecognizer:(id)a3 tilingView:(id)a4 direction:(int64_t)a5;
- (PUPinchedTileTracker)initWithTilingView:(id)a3;
- (PUTileLayoutInfo)_initialLayoutInfo;
- (PUTileLayoutInfo)_targetLayoutInfo;
- (PUVelocityFilter)_angularVelocityFilter;
- (PUVelocityFilter)_horizontalVelocityFilter;
- (PUVelocityFilter)_verticalVelocityFilter;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (double)_pinchProgress;
- (id)tileControllerToTrack;
- (int64_t)direction;
- (void)_setAngularVelocityFilter:(id)a3;
- (void)_setHorizontalVelocityFilter:(id)a3;
- (void)_setInitialLayoutInfo:(id)a3;
- (void)_setPinchGestureRecognizerScaleDirectionValueFilter:(id)a3;
- (void)_setPinchProgress:(double)a3;
- (void)_setPinchTracker:(id)a3;
- (void)_setTargetLayoutInfo:(id)a3;
- (void)_setVerticalVelocityFilter:(id)a3;
- (void)_updateTargetLayoutInfoIfNeeded;
- (void)completeTracking;
- (void)configureTileReattachmentContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startTileControllerTracking;
- (void)updateGestureRecognizerTracking;
- (void)updateTileControllerTracking;
@end

@implementation PUPinchedTileTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__angularVelocityFilter, 0);
  objc_storeStrong((id *)&self->__verticalVelocityFilter, 0);
  objc_storeStrong((id *)&self->__horizontalVelocityFilter, 0);
  objc_storeStrong((id *)&self->__targetLayoutInfo, 0);
  objc_storeStrong((id *)&self->__initialLayoutInfo, 0);
  objc_storeStrong((id *)&self->__pinchTracker, 0);
  objc_storeStrong((id *)&self->__pinchGestureRecognizerScaleDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
}

- (void)_setAngularVelocityFilter:(id)a3
{
}

- (PUVelocityFilter)_angularVelocityFilter
{
  return self->__angularVelocityFilter;
}

- (void)_setVerticalVelocityFilter:(id)a3
{
}

- (PUVelocityFilter)_verticalVelocityFilter
{
  return self->__verticalVelocityFilter;
}

- (void)_setHorizontalVelocityFilter:(id)a3
{
}

- (PUVelocityFilter)_horizontalVelocityFilter
{
  return self->__horizontalVelocityFilter;
}

- (void)_setTargetLayoutInfo:(id)a3
{
}

- (PUTileLayoutInfo)_targetLayoutInfo
{
  return self->__targetLayoutInfo;
}

- (void)_setInitialLayoutInfo:(id)a3
{
}

- (PUTileLayoutInfo)_initialLayoutInfo
{
  return self->__initialLayoutInfo;
}

- (void)_setPinchProgress:(double)a3
{
  self->__pinchProgress = a3;
}

- (double)_pinchProgress
{
  return self->__pinchProgress;
}

- (void)_setPinchTracker:(id)a3
{
}

- (PUPinchTracker)_pinchTracker
{
  return self->__pinchTracker;
}

- (void)_setPinchGestureRecognizerScaleDirectionValueFilter:(id)a3
{
}

- (PUChangeDirectionValueFilter)_pinchGestureRecognizerScaleDirectionValueFilter
{
  return self->__pinchGestureRecognizerScaleDirectionValueFilter;
}

- (int64_t)direction
{
  return self->_direction;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)_updateTargetLayoutInfoIfNeeded
{
  v3 = [(PUPinchedTileTracker *)self _targetLayoutInfo];

  if (!v3 && self->_delegateFlags.respondsToFinalLayoutInfoForTileWithLayoutInfo)
  {
    id v6 = [(PUPinchedTileTracker *)self _initialLayoutInfo];
    v4 = [(PUInteractiveTileTracker *)self delegate];
    v5 = [v4 pinchedTiledTracker:self finalLayoutInfoForTileWithLayoutInfo:v6];

    [(PUPinchedTileTracker *)self _setTargetLayoutInfo:v5];
  }
}

- (id)tileControllerToTrack
{
  v3 = [(PUPinchedTileTracker *)self pinchGestureRecognizer];
  if ((unint64_t)[v3 numberOfTouches] >= 2)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__72656;
    v23 = __Block_byref_object_dispose__72657;
    id v24 = 0;
    v5 = [(PUInteractiveTileTracker *)self tilingView];
    [v3 locationInView:v5];
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    [v3 locationOfTouch:0 inView:v5];
    double v11 = v10;
    double v13 = v12;
    [v3 locationOfTouch:1 inView:v5];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0x7FEFFFFFFFFFFFFFLL;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __45__PUPinchedTileTracker_tileControllerToTrack__block_invoke;
    v17[3] = &unk_1E5F2C348;
    v17[6] = v7;
    v17[7] = v9;
    v17[4] = v18;
    v17[5] = &v19;
    objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v17, fmin(v11, v14), fmin(v13, v15), vabdd_f64(v11, v14), vabdd_f64(v13, v15));
    id v4 = (id)v20[5];
    _Block_object_dispose(v18, 8);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __45__PUPinchedTileTracker_tileControllerToTrack__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 tileKind];
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

- (void)configureTileReattachmentContext:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPinchedTileTracker;
  [(PUInteractiveTileTracker *)&v6 configureTileReattachmentContext:v4];
  if ([(PUPinchedTileTracker *)self direction] == 1)
  {
    if ([(PUInteractiveTileTracker *)self shouldEnd]) {
      BOOL v5 = [(PUInteractiveTileTracker *)self shouldFinish];
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  [v4 setZoomingIn:v5];
}

- (void)completeTracking
{
  v5.receiver = self;
  v5.super_class = (Class)PUPinchedTileTracker;
  [(PUInteractiveTileTracker *)&v5 completeTracking];
  v3 = [(PUPinchedTileTracker *)self _pinchTracker];
  id v4 = v3;
  if (v3)
  {
    [v3 setUpdateHandler:0];
    [(PUPinchedTileTracker *)self _setPinchTracker:0];
  }
  [(PUPinchedTileTracker *)self _setPinchGestureRecognizerScaleDirectionValueFilter:0];
}

- (void)updateTileControllerTracking
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)PUPinchedTileTracker;
  [(PUInteractiveTileTracker *)&v31 updateTileControllerTracking];
  v3 = [(PUPinchedTileTracker *)self pinchGestureRecognizer];
  id v4 = [(PUInteractiveTileTracker *)self tilingView];
  objc_super v5 = [v4 superview];

  objc_super v6 = [(PUPinchedTileTracker *)self _pinchTracker];
  if (v6)
  {
    [v3 locationOfTouch:0 inView:v5];
    double v8 = v7;
    double v10 = v9;
    [v3 locationOfTouch:1 inView:v5];
    objc_msgSend(v6, "setPinchLocation1:location2:", v8, v10, v11, v12);
  }
  [(PUPinchedTileTracker *)self _pinchProgress];
  double v14 = fabs(v13);
  if (v14 >= INFINITY && v14 <= INFINITY)
  {
    [v3 scale];
    double v16 = v15;
    int64_t v17 = [(PUPinchedTileTracker *)self direction];
    double v13 = v16 + -1.0;
    if (v17 != 1) {
      double v13 = (1.0 - v16) * 1.5;
    }
  }
  if (v13 < 0.0) {
    double v13 = 0.0;
  }
  [(PUInteractiveTileTracker *)self setProgress:fmin(v13, 1.0)];
  v18 = [(PUPinchedTileTracker *)self _horizontalVelocityFilter];
  [v18 outputValue];
  double v20 = v19;

  uint64_t v21 = [(PUPinchedTileTracker *)self _verticalVelocityFilter];
  [v21 outputValue];
  double v23 = v22;

  [v3 velocity];
  double v25 = v24;
  v26 = [(PUPinchedTileTracker *)self _angularVelocityFilter];
  [v26 outputValue];
  double v28 = v27;

  v29 = PLOneUpGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v30 = [NSString stringWithFormat:@"{x:%0.1f, y:%0.1f, s:%0.3f, r:%0.2f}", *(void *)&v20, *(void *)&v23, *(void *)&v25, *(void *)&v28];
    *(_DWORD *)buf = 138412290;
    v33 = v30;
    _os_log_impl(&dword_1AE9F8000, v29, OS_LOG_TYPE_DEBUG, "current pinch velocity: %@", buf, 0xCu);
  }
  -[PUInteractiveTileTracker setCurrentVelocity:](self, "setCurrentVelocity:", v20, v23, v25, v28);
}

- (void)startTileControllerTracking
{
  v50.receiver = self;
  v50.super_class = (Class)PUPinchedTileTracker;
  [(PUInteractiveTileTracker *)&v50 startTileControllerTracking];
  v3 = [(PUInteractiveTileTracker *)self trackedTileController];
  id v4 = [(PUInteractiveTileTracker *)self tilingView];
  objc_super v5 = [v4 freezeTileController:v3];
  [(PUPinchedTileTracker *)self _setInitialLayoutInfo:v5];
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  [v5 size];
  double v11 = v10;
  double v13 = v12;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  if (v5) {
    [v5 transform];
  }
  if (self->_delegateFlags.respondsToInitialAspectRatioForTileWithLayoutInfo)
  {
    double v14 = [(PUInteractiveTileTracker *)self delegate];
    [v14 pinchedTiledTracker:self initialAspectRatioForTileWithLayoutInfo:v5];
    double v16 = v15;

    BOOL v17 = v16 < 0.0 || ((*(void *)&v16 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    if (!v17 || (unint64_t)(*(void *)&v16 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      if (v16 <= v11 / v13) {
        double v13 = v11 / v16;
      }
      else {
        double v11 = v13 * v16;
      }
    }
  }
  double v19 = [PUPinchTracker alloc];
  long long v44 = v47;
  long long v45 = v48;
  long long v46 = v49;
  double v20 = -[PUPinchTracker initWithInitialCenter:initialSize:initialTransform:](v19, "initWithInitialCenter:initialSize:initialTransform:", &v44, v7, v9, v11, v13);
  if ([(PUPinchedTileTracker *)self direction] == 2) {
    [(PUPinchTracker *)v20 setAllowTrackingOutside:1];
  }
  uint64_t v21 = +[PUVelocityFilter gestureVelocityFilter];
  double v22 = +[PUVelocityFilter gestureVelocityFilter];
  double v23 = +[PUVelocityFilter gestureVelocityFilter];
  *(void *)&long long v44 = 0;
  *((void *)&v44 + 1) = &v44;
  *(void *)&long long v45 = 0x2020000000;
  BYTE8(v45) = 1;
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke;
  v33 = &unk_1E5F2B018;
  id v24 = v5;
  id v34 = v24;
  id v25 = v3;
  id v35 = v25;
  id v26 = v21;
  id v36 = v26;
  id v27 = v22;
  id v37 = v27;
  id v28 = v23;
  id v38 = v28;
  v39 = self;
  double v42 = v11;
  double v43 = v13;
  v41 = &v44;
  v29 = v20;
  v40 = v29;
  [(PUPinchTracker *)v29 setUpdateHandler:&v30];
  -[PUPinchedTileTracker _setPinchTracker:](self, "_setPinchTracker:", v29, v30, v31, v32, v33);
  [(PUPinchedTileTracker *)self _setPinchProgress:0.0];
  [(PUPinchedTileTracker *)self _setHorizontalVelocityFilter:v26];
  [(PUPinchedTileTracker *)self _setVerticalVelocityFilter:v27];
  [(PUPinchedTileTracker *)self _setAngularVelocityFilter:v28];

  _Block_object_dispose(&v44, 8);
}

void __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke(uint64_t a1, long long *a2, double a3, double a4, double a5, double a6)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke_2;
  aBlock[3] = &unk_1E5F2AFF0;
  id v20 = *(id *)(a1 + 32);
  double v26 = a3;
  double v27 = a4;
  double v28 = a5;
  double v29 = a6;
  long long v12 = a2[1];
  long long v30 = *a2;
  long long v31 = v12;
  long long v32 = a2[2];
  id v21 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 48);
  id v23 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  id v24 = v13;
  uint64_t v25 = v14;
  long long v33 = *(_OWORD *)(a1 + 96);
  double v15 = (void (**)(void))_Block_copy(aBlock);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)
    && ([*(id *)(a1 + 80) allowTrackingOutside] & 1) == 0)
  {
    double v16 = (void *)MEMORY[0x1E4FB1EB0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke_3;
    v17[3] = &unk_1E5F2EBA0;
    v18 = v15;
    [v16 animateWithDuration:v17 animations:0.2];
  }
  else
  {
    v15[2](v15);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
}

void __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 80);
  double v4 = *(double *)(a1 + 88);
  double v5 = *(double *)(a1 + 96);
  double v6 = *(double *)(a1 + 104);
  long long v7 = *(_OWORD *)(a1 + 128);
  long long v22 = *(_OWORD *)(a1 + 112);
  long long v23 = v7;
  long long v24 = *(_OWORD *)(a1 + 144);
  double v8 = objc_msgSend(v2, "layoutInfoWithCenter:size:transform:", &v22, v3, v4, v5, v6);
  [*(id *)(a1 + 40) applyLayoutInfo:v8];
  [*(id *)(a1 + 48) setInputValue:*(double *)(a1 + 80)];
  [*(id *)(a1 + 56) setInputValue:*(double *)(a1 + 88)];
  double v21 = 0.0;
  long long v9 = *(_OWORD *)(a1 + 128);
  long long v22 = *(_OWORD *)(a1 + 112);
  long long v23 = v9;
  long long v24 = *(_OWORD *)(a1 + 144);
  PUDecomposeTransform((uint64_t)&v22, 0, 0, 0, &v21);
  double v10 = MEMORY[0x1B3E7B070]([*(id *)(a1 + 64) setInputValue:v21]);
  [*(id *)(a1 + 72) _updateTargetLayoutInfoIfNeeded];
  double v11 = [*(id *)(a1 + 72) _targetLayoutInfo];
  long long v12 = v11;
  if (v11)
  {
    [v11 size];
    double v14 = v13;
    double v16 = v15;
    if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      double v20 = *(double *)(a1 + 160);
      double v18 = *(double *)(a1 + 96) - v20;
      double v19 = v14 - v20;
      goto LABEL_6;
    }
    if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      double v17 = *(double *)(a1 + 168);
      double v18 = *(double *)(a1 + 104) - v17;
      double v19 = v16 - v17;
LABEL_6:
      double v10 = v18 / v19;
    }
  }
  [*(id *)(a1 + 72) _setPinchProgress:v10];
}

uint64_t __51__PUPinchedTileTracker_startTileControllerTracking__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateGestureRecognizerTracking
{
  v11.receiver = self;
  v11.super_class = (Class)PUPinchedTileTracker;
  [(PUInteractiveTileTracker *)&v11 updateGestureRecognizerTracking];
  double v3 = [(PUPinchedTileTracker *)self pinchGestureRecognizer];
  [v3 scale];
  double v5 = v4;
  double v6 = [(PUPinchedTileTracker *)self _pinchGestureRecognizerScaleDirectionValueFilter];
  if (!v6)
  {
    double v6 = objc_alloc_init(PUChangeDirectionValueFilter);
    [(PUChangeDirectionValueFilter *)v6 setMinimumChangeValue:0.05];
    [(PUPinchedTileTracker *)self _setPinchGestureRecognizerScaleDirectionValueFilter:v6];
  }
  [(PUValueFilter *)v6 setInputValue:v5];
  BOOL v7 = (unint64_t)([v3 state] - 3) < 2
    || (unint64_t)[v3 numberOfTouches] < 2;
  [(PUInteractiveTileTracker *)self setShouldEnd:v7];
  [(PUValueFilter *)v6 outputValue];
  double v9 = v8;
  if ([(PUPinchedTileTracker *)self direction] == 1) {
    BOOL v10 = v9 >= 0.0;
  }
  else {
    BOOL v10 = v9 <= 0.0;
  }
  [(PUInteractiveTileTracker *)self setShouldFinish:v10];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(PUInteractiveTileTracker *)self delegate];

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPinchedTileTracker;
    [(PUInteractiveTileTracker *)&v7 setDelegate:v4];
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToInitialAspectRatioForTileWithLayoutInfo = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToFinalLayoutInfoForTileWithLayoutInfo = objc_opt_respondsToSelector() & 1;
  }
}

- (PUPinchedTileTracker)initWithPinchGestureRecognizer:(id)a3 tilingView:(id)a4 direction:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  if (v10)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPinchedTileTracker.m", 54, @"Invalid parameter not satisfying: %@", @"pinchGestureRecognizer != nil" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  double v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PUPinchedTileTracker.m", 55, @"Invalid parameter not satisfying: %@", @"direction != PUPinchedTileTrackerDirectionUndefined" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PUPinchedTileTracker;
  long long v12 = [(PUInteractiveTileTracker *)&v17 initWithTilingView:v11];
  double v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pinchGestureRecognizer, a3);
    v13->_direction = a5;
  }

  return v13;
}

- (PUPinchedTileTracker)initWithTilingView:(id)a3
{
  return [(PUPinchedTileTracker *)self initWithPinchGestureRecognizer:0 tilingView:a3 direction:0];
}

@end