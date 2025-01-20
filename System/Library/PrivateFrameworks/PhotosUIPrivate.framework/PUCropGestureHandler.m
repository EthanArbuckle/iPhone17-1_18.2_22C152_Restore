@interface PUCropGestureHandler
- (CGSize)masterImageSize;
- (CGVector)panRubberBandOffset;
- (NUCropModel)cropModel;
- (OS_dispatch_queue)delegateQueue;
- (PUCropGestureHandler)initWithCropModel:(id)a3;
- (PUCropGestureHandlerDelegate)delegate;
- (double)_zoomScaleForCurrentCropRectAndModelRect;
- (double)_zoomScaleForModelCropRect:(CGRect)a3;
- (double)maximumZoomScale;
- (double)zoomOverflow;
- (id)delgateQueue;
- (int64_t)gesture;
- (void)_activateRequest;
- (void)_clearGestureTypePan;
- (void)_clearGestureTypePinch;
- (void)_clearGestureTypePitchYawRoll;
- (void)_constrainedMoveCropRectBy:(CGVector)a3 startRect:(CGRect)a4 rubberband:(BOOL)a5;
- (void)_deactivateRequest;
- (void)_didTrack;
- (void)_dispatchSyncOnDelegateQueue:(id)a3;
- (void)_setGestureType:(int64_t)a3;
- (void)_setGestureTypePan;
- (void)_setGestureTypePinch;
- (void)_setZoomScale:(double)a3;
- (void)_startPitchYawRollGestureTimeoutTimer;
- (void)_stopAnimatedPan;
- (void)_stopAnimatedPanTimer;
- (void)_stopAnimatedZoom;
- (void)_stopAnimatedZoomTimer;
- (void)_zoomWithScale:(double)a3 startCropRect:(CGRect)a4;
- (void)beginPan;
- (void)beginZoom;
- (void)endPanWithTranslation:(CGVector)a3 velocity:(CGVector)a4;
- (void)endZoomWithScale:(double)a3;
- (void)panWithTranslation:(CGVector)a3 velocity:(CGVector)a4;
- (void)reset;
- (void)setAnimateEndGestureEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setLoggingEnabled:(BOOL)a3;
- (void)setMaximumZoomScale:(double)a3;
- (void)setPitchAngle:(double)a3;
- (void)setRollAngle:(double)a3;
- (void)setYawAngle:(double)a3;
- (void)tearDown;
- (void)zoomWithScale:(double)a3;
- (void)zoomWithScale:(double)a3 rubberband:(BOOL)a4;
@end

@implementation PUCropGestureHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropModel, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_zoomAnimationTimer, 0);
  objc_storeStrong((id *)&self->_panAnimationTimer, 0);
  objc_storeStrong((id *)&self->_pitchYawRollAnimationTimer, 0);
  objc_storeStrong((id *)&self->_animationQueue, 0);
}

- (int64_t)gesture
{
  return self->_gesture;
}

- (double)zoomOverflow
{
  return self->_zoomOverflow;
}

- (CGVector)panRubberBandOffset
{
  objc_copyStruct(v4, &self->_panRubberBandOffset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (NUCropModel)cropModel
{
  return (NUCropModel *)objc_getProperty(self, a2, 232, 1);
}

- (void)setMaximumZoomScale:(double)a3
{
  self->_maximumZoomScale = a3;
}

- (double)maximumZoomScale
{
  return self->_maximumZoomScale;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegate:(id)a3
{
}

- (PUCropGestureHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCropGestureHandlerDelegate *)WeakRetained;
}

- (void)_stopAnimatedPan
{
  [(PUCropGestureHandler *)self _stopAnimatedPanTimer];
  self->_panSlideVelocity = 0u;
  self->_panRubberBandDelta = 0u;
  self->_panState.modelSpaceTranslation.dx = 0.0;
  self->_panState.modelSpaceTranslation.dy = 0.0;
  self->_panRubberBandOffset.dx = 0.0;
  self->_panRubberBandOffset.dy = 0.0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PUCropGestureHandler__stopAnimatedPan__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __40__PUCropGestureHandler__stopAnimatedPan__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateRequest];
}

- (void)_stopAnimatedPanTimer
{
  double v2 = self;
  objc_sync_enter(v2);
  panAnimationTimer = v2->_panAnimationTimer;
  if (panAnimationTimer)
  {
    dispatch_source_cancel(panAnimationTimer);
    v4 = v2->_panAnimationTimer;
    v2->_panAnimationTimer = 0;
  }
  objc_sync_exit(v2);

  [(PUCropGestureHandler *)v2 _clearGestureTypePan];
}

- (void)_stopAnimatedZoom
{
  [(PUCropGestureHandler *)self _stopAnimatedZoomTimer];
  [(PUCropGestureHandler *)self _clearGestureTypePinch];
  self->_zoomOverflow = 0.0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PUCropGestureHandler__stopAnimatedZoom__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __41__PUCropGestureHandler__stopAnimatedZoom__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deactivateRequest];
}

- (void)_stopAnimatedZoomTimer
{
  obj = self;
  objc_sync_enter(obj);
  zoomAnimationTimer = obj->_zoomAnimationTimer;
  if (zoomAnimationTimer)
  {
    dispatch_source_cancel(zoomAnimationTimer);
    double v3 = obj->_zoomAnimationTimer;
    obj->_zoomAnimationTimer = 0;
  }
  objc_sync_exit(obj);
}

- (void)_constrainedMoveCropRectBy:(CGVector)a3 startRect:(CGRect)a4 rubberband:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  if (a4.size.width < 1.0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 620, @"Invalid parameter not satisfying: %@", @"startRect.size.width >= 1" object file lineNumber description];
  }
  if (height < 1.0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 621, @"Invalid parameter not satisfying: %@", @"startRect.size.height >= 1" object file lineNumber description];
  }
  -[NUCropModel constrainedMoveCropRectBy:strict:startRect:](self->_cropModel, "constrainedMoveCropRectBy:strict:startRect:", 0, dx, dy, x, y, width, height);
  CGFloat v14 = 0.0;
  CGFloat v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  if (v5)
  {
    [(NUCropModel *)self->_cropModel cropRect];
    CGFloat v14 = dx + x - v18;
    CGFloat v15 = dy + y - v19;
    long double v20 = hypot(v14, v15);
    long double v21 = pow(0.999, v20) * 0.8 + 0.2;
    double v16 = v14 * v21;
    double v17 = v15 * v21;
  }
  self->_panRubberBandDelta.ddouble x = v14;
  self->_panRubberBandDelta.ddouble y = v15;
  self->_panRubberBandOffset.ddouble x = v16;
  self->_panRubberBandOffset.ddouble y = v17;
  if (self->_isLogging)
  {
    [(NUCropModel *)self->_cropModel cropRect];
    printf("// move t = (%.2f, %.2f), sr = (%.2f, %.2f, %.2f, %.2f), cropRect = (%.3f, %.3f, %.3f, %.3f), scale = %f, offset = (%.2f, %.2f), v = (%.2f, %.2f), overflow = %.2f\n", dx, dy, x, y, width, height, v22, v23, v24, v25, self->_pinchState.scale, self->_panRubberBandOffset.dx, self->_panRubberBandOffset.dy, self->_panSlideVelocity.dx, self->_panSlideVelocity.dy, self->_zoomOverflow);
  }
}

- (void)_zoomWithScale:(double)a3 startCropRect:(CGRect)a4
{
  double height = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double width = a4.size.width;
  double ScaledRect = getScaledRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a3);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(PUCropGestureHandler *)self masterImageSize];
  if (v12 >= 1.0) {
    double v17 = v12;
  }
  else {
    double v17 = 1.0;
  }
  double v18 = v15 / v17;
  if (v14 >= 1.0) {
    double v19 = v14;
  }
  else {
    double v19 = 1.0;
  }
  double v20 = v16 / v19;
  if (v18 < v20) {
    double v20 = v18;
  }
  double v39 = v20;
  if (v20 <= self->_maximumZoomScale)
  {
    -[NUCropModel setForZoomCropRect:newCropRect:](self->_cropModel, "setForZoomCropRect:newCropRect:", x, y, width, height, ScaledRect, v10, v12, v14);
    [(PUCropGestureHandler *)self _zoomScaleForCurrentCropRectAndModelRect];
    if (v39 >= v25)
    {
      self->_zoomOverflow = 0.0;
    }
    else
    {
      double v26 = v25;
      [(NUCropModel *)self->_cropModel cropRect];
      if (v27 < 1.0) {
        double v27 = 1.0;
      }
      CGFloat v29 = self->_panPinchStartRect.size.width / v27;
      if (v28 >= 1.0) {
        double v30 = v28;
      }
      else {
        double v30 = 1.0;
      }
      if (v29 >= self->_panPinchStartRect.size.height / v30) {
        CGFloat v29 = self->_panPinchStartRect.size.height / v30;
      }
      self->_panState.scale = v29;
      self->_zoomOverflow = (1.0 - 1.0 / ((v26 - v39) * 2.0 + 1.0)) * -0.5;
      if (self->_isDebugging) {
        printf(" zoomWithScale - rubberband in (%.2f, %.2f)\n");
      }
    }
  }
  else
  {
    [(PUCropGestureHandler *)self masterImageSize];
    double maximumZoomScale = self->_maximumZoomScale;
    double v35 = v23 / maximumZoomScale;
    double v36 = v22 / maximumZoomScale;
    v40.origin.double x = ScaledRect;
    v40.origin.double y = v10;
    v40.size.double width = v12;
    v40.size.double height = v14;
    double v37 = height;
    double MidX = CGRectGetMidX(v40);
    v41.origin.double x = ScaledRect;
    v41.origin.double y = v10;
    v41.size.double width = v12;
    v41.size.double height = v14;
    -[NUCropModel setForZoomCropRect:newCropRect:](self->_cropModel, "setForZoomCropRect:newCropRect:", x, y, width, v37, MidX - v36 * 0.5, CGRectGetMidY(v41) - v35 * 0.5);
    self->_zoomOverflow = (1.0 - 1.0 / ((v39 - self->_maximumZoomScale) * 0.25 * 2.0 + 1.0)) * 0.5 * 4.0;
    if (self->_isDebugging) {
      printf(" zoomWithScale - rubberband out (%.2f, %.2f)\n");
    }
  }
  if (self->_isLogging)
  {
    [(NUCropModel *)self->_cropModel cropRect];
    printf("// zoom cropRect = (%.3f, %.3f, %.3f, %.3f), scale = %f, offset = (%.2f, %.2f), v = (%.2f, %.2f), overflow = %.2f\n", v31, v32, v33, v34, self->_pinchState.scale, self->_panRubberBandOffset.dx, self->_panRubberBandOffset.dy, self->_panSlideVelocity.dx, self->_panSlideVelocity.dy, self->_zoomOverflow);
  }
}

- (void)setRollAngle:(double)a3
{
  [(PUCropGestureHandler *)self _setGestureType:2];
  double x = self->_pitchYawRollState.startCropRect.origin.x;
  double y = self->_pitchYawRollState.startCropRect.origin.y;
  double width = self->_pitchYawRollState.startCropRect.size.width;
  double height = self->_pitchYawRollState.startCropRect.size.height;
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  double v9 = CGRectGetWidth(v11);
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  -[NUCropModel setRollAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self->_cropModel, "setRollAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, v9 * CGRectGetHeight(v12), x, y, width, height, self->_gestureStartRoll);
  [(PUCropGestureHandler *)self _didTrack];
  [(PUCropGestureHandler *)self _startPitchYawRollGestureTimeoutTimer];
}

- (void)setYawAngle:(double)a3
{
  [(PUCropGestureHandler *)self _setGestureType:3];
  double x = self->_pitchYawRollState.startCropRect.origin.x;
  double y = self->_pitchYawRollState.startCropRect.origin.y;
  double width = self->_pitchYawRollState.startCropRect.size.width;
  double height = self->_pitchYawRollState.startCropRect.size.height;
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  double v9 = CGRectGetWidth(v11);
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  -[NUCropModel setYawAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self->_cropModel, "setYawAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, v9 * CGRectGetHeight(v12), x, y, width, height, self->_gestureStartYaw);
  [(PUCropGestureHandler *)self _didTrack];
  [(PUCropGestureHandler *)self _startPitchYawRollGestureTimeoutTimer];
}

- (void)setPitchAngle:(double)a3
{
  [(PUCropGestureHandler *)self _setGestureType:1];
  double x = self->_pitchYawRollState.startCropRect.origin.x;
  double y = self->_pitchYawRollState.startCropRect.origin.y;
  double width = self->_pitchYawRollState.startCropRect.size.width;
  double height = self->_pitchYawRollState.startCropRect.size.height;
  v11.origin.double x = x;
  v11.origin.double y = y;
  v11.size.double width = width;
  v11.size.double height = height;
  double v9 = CGRectGetWidth(v11);
  v12.origin.double x = x;
  v12.origin.double y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  -[NUCropModel setPitchAngle:constrainCropRectWithTargetArea:startRect:startAngle:](self->_cropModel, "setPitchAngle:constrainCropRectWithTargetArea:startRect:startAngle:", a3, v9 * CGRectGetHeight(v12), x, y, width, height, self->_gestureStartPitch);
  [(PUCropGestureHandler *)self _didTrack];
  [(PUCropGestureHandler *)self _startPitchYawRollGestureTimeoutTimer];
}

- (void)_startPitchYawRollGestureTimeoutTimer
{
  double v2 = self;
  objc_sync_enter(v2);
  animationQueue = v2->_animationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PUCropGestureHandler__startPitchYawRollGestureTimeoutTimer__block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = v2;
  dispatch_async(animationQueue, block);
  if (!v2->_pitchYawRollAnimationTimer)
  {
    v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v2->_animationQueue);
    dispatch_time_t v5 = dispatch_time(0, 120000000);
    dispatch_source_set_timer(v4, v5, 0x7270E00uLL, 0x5F5E100uLL);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__PUCropGestureHandler__startPitchYawRollGestureTimeoutTimer__block_invoke_2;
    v8[3] = &unk_1E5F2ED10;
    v8[4] = v2;
    dispatch_source_set_event_handler(v4, v8);
    pitchYawRollAnimationTimer = v2->_pitchYawRollAnimationTimer;
    v2->_pitchYawRollAnimationTimer = (OS_dispatch_source *)v4;
    v7 = v4;

    dispatch_resume(v7);
  }
  objc_sync_exit(v2);
}

uint64_t __61__PUCropGestureHandler__startPitchYawRollGestureTimeoutTimer__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 192) = 3;
  return result;
}

uint64_t __61__PUCropGestureHandler__startPitchYawRollGestureTimeoutTimer__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(v1 + 192);
  BOOL v3 = __OFSUB__(v2--, 1);
  *(_DWORD *)(v1 + 192) = v2;
  if ((v2 < 0) ^ v3 | (v2 == 0))
  {
    uint64_t v4 = result;
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(result + 32) + 48));
    uint64_t v5 = *(void *)(v4 + 32);
    v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;

    v7 = *(void **)(v4 + 32);
    return [v7 _clearGestureTypePitchYawRoll];
  }
  return result;
}

- (void)endZoomWithScale:(double)a3
{
  if (self->_isLogging) {
    printf("[handler endZoomWithScale:%f];\n", a3);
  }
  [(PUCropGestureHandler *)self zoomWithScale:((unint64_t)self->_gesture >> 2) & 1 rubberband:a3];
  if (!self->_inZoomState)
  {
    CGRect v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 489, @"Invalid parameter not satisfying: %@", @"_inZoomState" object file lineNumber description];
  }
  self->_inZoomState = 0;
  if ((self->_gesture & 8) == 0)
  {
    CGRect v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 492, @"Invalid parameter not satisfying: %@", @"_gesture & PUCropGestureTypePinch" object file lineNumber description];
  }
  if (self->_animateEndGesture)
  {
    v6 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_animationQueue);
    dispatch_time_t v7 = dispatch_time(0, 8000000);
    dispatch_source_set_timer(v6, v7, 0x7A1200uLL, 0x5F5E100uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __41__PUCropGestureHandler_endZoomWithScale___block_invoke;
    handler[3] = &unk_1E5F2ED10;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    v8 = self;
    objc_sync_enter(v8);
    zoomAnimationTimer = v8->_zoomAnimationTimer;
    v8->_zoomAnimationTimer = (OS_dispatch_source *)v6;
    double v10 = v6;

    dispatch_resume(v10);
    objc_sync_exit(v8);
  }
  else
  {
    [(PUCropGestureHandler *)self _stopAnimatedZoom];
  }
}

void __41__PUCropGestureHandler_endZoomWithScale___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(a1 + 32) + 240) = *(double *)(*(void *)(a1 + 32) + 240) * 0.92;
  [*(id *)(a1 + 32) _didTrack];
  uint64_t v2 = *(void *)(a1 + 32);
  if (fabs(*(double *)(v2 + 240)) < 0.005)
  {
    BOOL v3 = *(NSObject **)(v2 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PUCropGestureHandler_endZoomWithScale___block_invoke_2;
    block[3] = &unk_1E5F2ED10;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __41__PUCropGestureHandler_endZoomWithScale___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAnimatedZoom];
}

- (void)zoomWithScale:(double)a3
{
  if (self->_isLogging) {
    printf("[handler zoomWithScale:%f];\n", a3);
  }
  [(PUCropGestureHandler *)self zoomWithScale:1 rubberband:a3];
}

- (void)zoomWithScale:(double)a3 rubberband:(BOOL)a4
{
  if (self->_inZoomState)
  {
    BOOL v4 = a4;
    if ((self->_gesture & 8) == 0)
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 461, @"Invalid parameter not satisfying: %@", @"_gesture & PUCropGestureTypePinch" object file lineNumber description];
    }
    [(PUCropGestureHandler *)self _setZoomScale:a3];
    double scale = self->_pinchState.scale;
    if (scale != 1.0) {
      -[PUCropGestureHandler _zoomWithScale:startCropRect:](self, "_zoomWithScale:startCropRect:", scale, self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, self->_panPinchStartRect.size.width, self->_panPinchStartRect.size.height);
    }
    double ScaledRect = getScaledRect(self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, self->_panPinchStartRect.size.width, self->_panPinchStartRect.size.height, self->_panState.scale);
    -[PUCropGestureHandler _constrainedMoveCropRectBy:startRect:rubberband:](self, "_constrainedMoveCropRectBy:startRect:rubberband:", v4, self->_panState.modelSpaceTranslation.dx, self->_panState.modelSpaceTranslation.dy, ScaledRect, v9, v10, v11);
    [(PUCropGestureHandler *)self _didTrack];
  }
}

- (void)_setZoomScale:(double)a3
{
  self->_pinchState.double scale = a3;
  self->_panState.double scale = a3;
  [(PUCropGestureHandler *)self masterImageSize];
  double width = self->_panPinchStartRect.size.width;
  double height = self->_panPinchStartRect.size.height;
  if (v5 < 1.0) {
    double v5 = 1.0;
  }
  double v9 = width / v5;
  if (v6 < 1.0) {
    double v6 = 1.0;
  }
  double v10 = height / v6;
  if (v9 >= v10) {
    double v9 = v10;
  }
  if (v9 > a3) {
    self->_panState.double scale = v9;
  }
  double maximumZoomScale = self->_maximumZoomScale;
  if (maximumZoomScale >= a3) {
    double maximumZoomScale = self->_panState.scale;
  }
  else {
    self->_panState.double scale = maximumZoomScale;
  }
  getScaledRect(self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, width, height, maximumZoomScale);
  if (v13 < 2.0 || v12 < 2.0)
  {
    CGFloat v14 = self->_panPinchStartRect.size.height * 0.5;
    if (self->_panPinchStartRect.size.width * 0.5 < v14) {
      CGFloat v14 = self->_panPinchStartRect.size.width * 0.5;
    }
    self->_panState.double scale = v14;
  }
}

- (void)beginZoom
{
  if (self->_isLogging) {
    puts("[handler beginZoom];");
  }
  [(PUCropGestureHandler *)self _activateRequest];
  if (self->_inZoomState)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 416, @"Invalid parameter not satisfying: %@", @"!_inZoomState" object file lineNumber description];
  }
  self->_inZoomState = 1;
  [(PUCropGestureHandler *)self _stopAnimatedZoomTimer];
  [(PUCropGestureHandler *)self _stopAnimatedPanTimer];
  [(PUCropGestureHandler *)self _setGestureTypePinch];
}

- (double)_zoomScaleForCurrentCropRectAndModelRect
{
  [(NUCropModel *)self->_cropModel cropRect];
  -[PUCropGestureHandler _zoomScaleForModelCropRect:](self, "_zoomScaleForModelCropRect:");
  return result;
}

- (double)_zoomScaleForModelCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(PUCropGestureHandler *)self masterImageSize];
  double v7 = 1.0;
  if (width >= 1.0) {
    double v8 = width;
  }
  else {
    double v8 = 1.0;
  }
  double result = v5 / v8;
  if (height >= 1.0) {
    double v7 = height;
  }
  double v10 = v6 / v7;
  if (result >= v10) {
    return v10;
  }
  return result;
}

- (void)endPanWithTranslation:(CGVector)a3 velocity:(CGVector)a4
{
  ddouble y = a4.dy;
  ddouble x = a4.dx;
  double v6 = a3.dy;
  double v7 = a3.dx;
  -[PUCropGestureHandler panWithTranslation:velocity:](self, "panWithTranslation:velocity:");
  if (self->_isLogging) {
    printf("[handler endPanWithTranslation:CGVectorMake(%f, %f) velocity:CGVectorMake(%f, %f)];\n", v7, v6, dx, dy);
  }
  self->_inPanState = 0;
  self->_panSlideVelocity.ddouble x = dx;
  self->_panSlideVelocity.ddouble y = dy;
  if (self->_animateEndGesture)
  {
    double v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_animationQueue);
    dispatch_time_t v10 = dispatch_time(0, 8000000);
    dispatch_source_set_timer(v9, v10, 0x7A1200uLL, 0x5F5E100uLL);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __55__PUCropGestureHandler_endPanWithTranslation_velocity___block_invoke;
    handler[3] = &unk_1E5F2ED10;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    double v11 = self;
    objc_sync_enter(v11);
    panAnimationTimer = v11->_panAnimationTimer;
    v11->_panAnimationTimer = (OS_dispatch_source *)v9;
    double v13 = v9;

    dispatch_resume(v13);
    objc_sync_exit(v11);
  }
  else
  {
    [(PUCropGestureHandler *)self _stopAnimatedPan];
    [(PUCropGestureHandler *)self _clearGestureTypePan];
  }
}

void __55__PUCropGestureHandler_endPanWithTranslation_velocity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  float64x2_t v3 = *(float64x2_t *)(v2 + 24);
  float64x2_t v11 = vmlaq_f64(vmulq_f64(v3, (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL)), (float64x2_t)vdupq_n_s64(0x3FEA3D70A3D70A3DuLL), *(float64x2_t *)(v2 + 8));
  *(double *)(v2 + 24) = 0.94 * v3.f64[0];
  *(double *)(*(void *)(a1 + 32) + 32) = *(double *)(*(void *)(a1 + 32) + 32) * 0.94;
  BOOL v4 = *(id **)(a1 + 32);
  [v4[29] cropRect];
  objc_msgSend(v4, "_constrainedMoveCropRectBy:startRect:rubberband:", 1, *(_OWORD *)&v11, v5, v6, v7, v8);
  [*(id *)(a1 + 32) _didTrack];
  uint64_t v9 = *(void *)(a1 + 32);
  if (hypot(*(long double *)(v9 + 24), *(long double *)(v9 + 32)) < 16.0
    && hypot(*(long double *)(v9 + 256), *(long double *)(v9 + 264)) < 0.1)
  {
    dispatch_time_t v10 = *(NSObject **)(v9 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PUCropGestureHandler_endPanWithTranslation_velocity___block_invoke_2;
    block[3] = &unk_1E5F2ED10;
    block[4] = v9;
    dispatch_async(v10, block);
  }
}

uint64_t __55__PUCropGestureHandler_endPanWithTranslation_velocity___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopAnimatedPan];
}

- (void)panWithTranslation:(CGVector)a3 velocity:(CGVector)a4
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  if (self->_isLogging) {
    printf("[handler panWithTranslation:CGVectorMake(%f, %f) velocity:CGVectorMake(%f, %f)];\n",
  }
      a3.dx,
      a3.dy,
      a4.dx,
      a4.dy);
  if (self->_inPanState)
  {
    if (self->_isLogging && (self->_gesture & 4) == 0) {
      puts("- NOT in pan state");
    }
    self->_panState.modelSpaceTranslation.ddouble x = dx;
    self->_panState.modelSpaceTranslation.ddouble y = dy;
    double scale = self->_pinchState.scale;
    if (scale != 1.0) {
      -[PUCropGestureHandler _zoomWithScale:startCropRect:](self, "_zoomWithScale:startCropRect:", scale, self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, self->_panPinchStartRect.size.width, self->_panPinchStartRect.size.height);
    }
    double ScaledRect = getScaledRect(self->_panPinchStartRect.origin.x, self->_panPinchStartRect.origin.y, self->_panPinchStartRect.size.width, self->_panPinchStartRect.size.height, self->_panState.scale);
    -[PUCropGestureHandler _constrainedMoveCropRectBy:startRect:rubberband:](self, "_constrainedMoveCropRectBy:startRect:rubberband:", 1, self->_panState.modelSpaceTranslation.dx, self->_panState.modelSpaceTranslation.dy, ScaledRect, v9, v10, v11);
    [(PUCropGestureHandler *)self _didTrack];
  }
  else
  {
    NSLog(&cfstr_PanGestureCall.isa, a2, a3.dx, a3.dy, a4.dx, a4.dy);
  }
}

- (void)beginPan
{
  if (self->_isLogging) {
    puts("[handler beginPan];");
  }
  [(PUCropGestureHandler *)self _activateRequest];
  if (self->_inPanState)
  {
    BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 308, @"Invalid parameter not satisfying: %@", @"!_inPanState" object file lineNumber description];
  }
  self->_inPanState = 1;
  [(PUCropGestureHandler *)self _stopAnimatedPanTimer];
  [(PUCropGestureHandler *)self _setGestureTypePan];
  self->_panState.modelSpaceTranslation.ddouble x = 0.0;
  self->_panState.modelSpaceTranslation.ddouble y = 0.0;
}

- (void)_setGestureType:(int64_t)a3
{
  if (self->_gesture != a3)
  {
    if (self->_isDebugging)
    {
      double v6 = (unint64_t)a3 > 0xC ? "<incorrect enum value>" : off_1E5F2E978[a3];
      printf(" _setGestureType:%s\n", v6);
      if ((a3 & 3) != 0)
      {
        puts(" pitching, yawing or rolling during a pan or pinch is not expected");
        if ((a3 & 4) != 0)
        {
          double v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 239, @"Invalid parameter not satisfying: %@", @"(type & PUCropGestureTypePan) == 0" object file lineNumber description];

          if ((a3 & 8) == 0) {
            goto LABEL_9;
          }
        }
        else if ((a3 & 8) == 0)
        {
          goto LABEL_9;
        }
        double v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 240, @"Invalid parameter not satisfying: %@", @"(type & PUCropGestureTypePinch) == 0" object file lineNumber description];
      }
    }
LABEL_9:
    int64_t gesture = self->_gesture;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v9 = WeakRetained;
    if (WeakRetained && !gesture)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __40__PUCropGestureHandler__setGestureType___block_invoke;
      v33[3] = &unk_1E5F2ECC8;
      id v34 = WeakRetained;
      double v35 = self;
      [(PUCropGestureHandler *)self _dispatchSyncOnDelegateQueue:v33];
    }
    if ((a3 & 0xC) == 0 || (gesture & 4) != 0 || (gesture & 8) != 0)
    {
      if ((a3 & 4) == 0 && (gesture & 4) != 0)
      {
        self->_panState.modelSpaceTranslation.ddouble x = 0.0;
        self->_panState.modelSpaceTranslation.ddouble y = 0.0;
      }
    }
    else
    {
      [(NUCropModel *)self->_cropModel cropRect];
      self->_panPinchStartRect.origin.double x = v10;
      self->_panPinchStartRect.origin.double y = v11;
      self->_panPinchStartRect.size.double width = v12;
      self->_panPinchStartRect.size.double height = v13;
      [(PUCropGestureHandler *)self _setZoomScale:1.0];
      if (self->_panPinchStartRect.size.width < 1.0)
      {
        double v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 266, @"Invalid parameter not satisfying: %@", @"_panPinchStartRect.size.width >= 1" object file lineNumber description];
      }
      if (self->_panPinchStartRect.size.height < 1.0)
      {
        CGFloat v14 = [MEMORY[0x1E4F28B00] currentHandler];
        [v14 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 267, @"Invalid parameter not satisfying: %@", @"_panPinchStartRect.size.height >= 1" object file lineNumber description];
      }
    }
    if ((a3 & 3) != 0)
    {
      [(NUCropModel *)self->_cropModel cropRect];
      self->_pitchYawRollState.startCropRect.origin.double x = v16;
      self->_pitchYawRollState.startCropRect.origin.double y = v17;
      self->_pitchYawRollState.startCropRect.size.double width = v18;
      self->_pitchYawRollState.startCropRect.size.double height = height;
      if (v18 < 1.0)
      {
        double v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 276, @"Invalid parameter not satisfying: %@", @"_pitchYawRollState.startCropRect.size.width >= 1" object file lineNumber description];

        double height = self->_pitchYawRollState.startCropRect.size.height;
      }
      if (height < 1.0)
      {
        double v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 277, @"Invalid parameter not satisfying: %@", @"_pitchYawRollState.startCropRect.size.height >= 1" object file lineNumber description];
      }
    }
    [(NUCropModel *)self->_cropModel pitchRadians];
    self->_gestureStartPitch = v19;
    [(NUCropModel *)self->_cropModel yawRadians];
    self->_gestureStartYaw = v20;
    [(NUCropModel *)self->_cropModel rollRadians];
    self->_gestureStartRoll = v21;
    self->_int64_t gesture = a3;
    if (!v9) {
      goto LABEL_30;
    }
    if (gesture)
    {
      if (a3)
      {
LABEL_30:

        return;
      }
    }
    else
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __40__PUCropGestureHandler__setGestureType___block_invoke_2;
      v30[3] = &unk_1E5F2ECC8;
      id v31 = v9;
      double v32 = self;
      [(PUCropGestureHandler *)self _dispatchSyncOnDelegateQueue:v30];

      if (a3) {
        goto LABEL_30;
      }
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __40__PUCropGestureHandler__setGestureType___block_invoke_3;
    v27[3] = &unk_1E5F2ECC8;
    id v28 = v9;
    CGFloat v29 = self;
    [(PUCropGestureHandler *)self _dispatchSyncOnDelegateQueue:v27];

    goto LABEL_30;
  }
}

uint64_t __40__PUCropGestureHandler__setGestureType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) willBeginTrackingWithCropGestureHandler:*(void *)(a1 + 40)];
}

uint64_t __40__PUCropGestureHandler__setGestureType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didBeginTrackingWithCropGestureHandler:*(void *)(a1 + 40)];
}

uint64_t __40__PUCropGestureHandler__setGestureType___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEndTrackingWithCropGestureHandler:*(void *)(a1 + 40)];
}

- (void)_didTrack
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __33__PUCropGestureHandler__didTrack__block_invoke;
    v5[3] = &unk_1E5F2ECC8;
    id v6 = WeakRetained;
    double v7 = self;
    [(PUCropGestureHandler *)self _dispatchSyncOnDelegateQueue:v5];
  }
}

uint64_t __33__PUCropGestureHandler__didTrack__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didTrackWithCropGestureHandler:*(void *)(a1 + 40)];
}

- (void)_dispatchSyncOnDelegateQueue:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  id v6 = v4;
  if (self->_delegateQueueIsMain && (int v5 = [MEMORY[0x1E4F29060] isMainThread], v4 = v6, v5)) {
    v6[2](v6);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_delegateQueue, v4);
  }
}

- (void)_clearGestureTypePinch
{
}

- (void)_clearGestureTypePan
{
}

- (void)_clearGestureTypePitchYawRoll
{
}

- (void)_setGestureTypePinch
{
}

- (void)_setGestureTypePan
{
}

- (void)tearDown
{
}

- (void)_deactivateRequest
{
  if (self->_isRequestActive)
  {
    self->_isRequestActive = 0;
    MEMORY[0x1F41670F0](&PUCropUpdateRequest, 2228225);
  }
}

- (void)_activateRequest
{
  if (!self->_isRequestActive)
  {
    self->_isRequestActive = 1;
    MEMORY[0x1F41670E8](&PUCropUpdateRequest, 2228225);
  }
}

- (CGSize)masterImageSize
{
  [(NUCropModel *)self->_cropModel masterImageSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)delgateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  int v5 = (OS_dispatch_queue *)a3;
  if (v5 == (OS_dispatch_queue *)MEMORY[0x1E4F14428])
  {
    double v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUCropGestureHandler.m", 131, @"Invalid parameter not satisfying: %@", @"delegateQueue != dispatch_get_main_queue()" object file lineNumber description];
  }
  self->_delegateQueueIsMain = 0;
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v5;
}

- (void)setAnimateEndGestureEnabled:(BOOL)a3
{
  self->_animateEndGesture = a3;
}

- (void)setLoggingEnabled:(BOOL)a3
{
  self->_isLogging = a3;
}

- (void)reset
{
  CGSize v2 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_panPinchStartRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_panRubberBandDelta.ddouble x = 0.0;
  self->_panRubberBandDelta.ddouble y = 0.0;
  self->_panRubberBandOffset.ddouble x = 0.0;
  self->_panRubberBandOffset.ddouble y = 0.0;
  self->_panPinchStartRect.size = v2;
  self->_panState.double scale = 1.0;
  self->_panState.modelSpaceTranslation.ddouble x = 0.0;
  self->_panState.modelSpaceTranslation.ddouble y = 0.0;
  self->_pinchState.double scale = 1.0;
  self->_int64_t gesture = 0;
}

- (PUCropGestureHandler)initWithCropModel:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUCropGestureHandler;
  int v5 = [(PUCropGestureHandler *)&v14 init];
  id v6 = (void *)*((void *)v5 + 29);
  *((void *)v5 + 29) = v4;
  id v7 = v4;

  *(_OWORD *)(v5 + 24) = 0u;
  *(_OWORD *)(v5 + 8) = 0u;
  *((void *)v5 + 32) = 0;
  *((void *)v5 + 33) = 0;
  double v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("PUCropGestureHandlerAnimationQueue", v8);
  CGFloat v10 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v9;

  *((void *)v5 + 31) = 0;
  CGFloat v11 = +[PUPhotoEditProtoSettings sharedInstance];
  v5[198] = [v11 perspectiveViewDebugCropEnabled];

  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *(_OWORD *)(v5 + 136) = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)(v5 + 152) = v12;
  *((void *)v5 + 9) = 0x3FF0000000000000;
  *((void *)v5 + 10) = 0;
  *((void *)v5 + 11) = 0;
  *((void *)v5 + 12) = 0x3FF0000000000000;
  *((void *)v5 + 28) = 0x4024000000000000;
  v5[200] = 1;
  objc_storeStrong((id *)v5 + 27, MEMORY[0x1E4F14428]);

  *(_WORD *)(v5 + 201) = 1;
  return (PUCropGestureHandler *)v5;
}

@end