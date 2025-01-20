@interface SBCaptureButtonSuppressionManager
- (BOOL)isInCameraCapturePose;
- (SBCaptureButtonLowLatencyPose)lowLatencyPose;
- (SBCaptureButtonSuppressionManager)init;
- (double)secondsAfterFaceDownAtUnsuppressionTime;
- (int64_t)suppressionState;
- (uint64_t)removeObserver:(uint64_t)result;
- (unint64_t)cameraCapturePoseType;
- (void)_notifyObserversOfSuppressionState;
- (void)_subscribeToViewObstructedUpdates;
- (void)_unsubscribeFromViewObstructedUpdates;
- (void)dealloc;
- (void)setCameraCapturePoseType:(unint64_t)a3;
- (void)setInCameraCapturePose:(BOOL)a3;
- (void)setSecondsAfterFaceDownAtUnsuppressionTime:(double)a3;
- (void)setSuppressionState:(int64_t)a3;
@end

@implementation SBCaptureButtonSuppressionManager

- (SBCaptureButtonSuppressionManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBCaptureButtonSuppressionManager;
  v2 = [(SBCaptureButtonSuppressionManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_suppressionState = 0;
    [(SBCaptureButtonSuppressionManager *)v2 _subscribeToViewObstructedUpdates];
  }
  return v3;
}

- (void)dealloc
{
  [(SBCaptureButtonSuppressionManager *)self _unsubscribeFromViewObstructedUpdates];
  v3.receiver = self;
  v3.super_class = (Class)SBCaptureButtonSuppressionManager;
  [(SBCaptureButtonSuppressionManager *)&v3 dealloc];
}

- (void)setSuppressionState:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_suppressionState != a3)
  {
    self->_suppressionState = a3;
    objc_super v5 = SBLogCameraCaptureSuppression();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSStringFromSBCaptureButtonSuppressionState(a3);
      int v7 = 138543618;
      v8 = self;
      __int16 v9 = 2114;
      v10 = v6;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) suppression state is now: %{public}@", (uint8_t *)&v7, 0x16u);
    }
    [(SBCaptureButtonSuppressionManager *)self _notifyObserversOfSuppressionState];
  }
}

- (uint64_t)removeObserver:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 16) removeObject:a2];
  }
  return result;
}

- (BOOL)isInCameraCapturePose
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  suppressionManager = self->_suppressionManager;
  return [(CMSuppressionManager *)suppressionManager isCameraCapturePose];
}

- (unint64_t)cameraCapturePoseType
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  suppressionManager = self->_suppressionManager;
  return [(CMSuppressionManager *)suppressionManager cameraCapturePoseUIHint];
}

- (SBCaptureButtonLowLatencyPose)lowLatencyPose
{
  v2 = [(CMSuppressionManager *)self->_suppressionManager staticPoseBlocking];
  char v3 = [v2 isStatic];
  [v2 timeInStaticState];
  double v5 = v4;
  if ((v3 & 1) == 0)
  {
    [v2 timeInMovingState];
    double v5 = v5 + v6;
  }
  if ([v2 isStatic])
  {
    [v2 timeInStaticState];
    double v8 = v7;
    [v2 timeInMovingState];
    double v10 = v8 + v9;
  }
  else
  {
    [v2 timeInMovingState];
    double v10 = v11;
  }
  v12 = [[SBCaptureButtonLowLatencyPose alloc] initWithTimeSinceLastStationary:v5 timeSinceLastNonStationary:v10];

  return v12;
}

- (void)_notifyObserversOfSuppressionState
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) captureButtonSuppressionManager:self event:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_subscribeToViewObstructedUpdates
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "-[CMSuppressionManager isAvailable] returned NO", v1, 2u);
}

void __70__SBCaptureButtonSuppressionManager__subscribeToViewObstructedUpdates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 48) = 0;
  long long v8 = SBLogCameraCaptureSuppression();
  long long v9 = v8;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      id v18 = *v7;
      v19 = [v6 localizedDescription];
      v20 = [v6 localizedFailureReason];
      int v21 = 138544130;
      id v22 = v18;
      __int16 v23 = 2114;
      id v24 = v5;
      __int16 v25 = 2114;
      v26 = v19;
      __int16 v27 = 2114;
      v28 = v20;
      _os_log_fault_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_FAULT, "(%{public}@) suppression event error - event:%{public}@ error:%{public}@ reason:%{public}@", (uint8_t *)&v21, 0x2Au);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = *v7;
    int v21 = 138543618;
    id v22 = v10;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "(%{public}@) suppression event: %{public}@", (uint8_t *)&v21, 0x16u);
  }

  uint64_t v11 = [v5 type];
  uint64_t v12 = v11;
  switch(v11)
  {
    case 1:
      v14 = 0;
LABEL_19:
      *((void *)*v7 + 6) = v14;
      goto LABEL_20;
    case 2:
      [v5 timeSinceLastFacedownStatic];
      v14 = v15;
      v16 = SBLogCameraCaptureSuppression();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = *v7;
        int v21 = 138543618;
        id v22 = v17;
        __int16 v23 = 2048;
        id v24 = v14;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) time since last face down: %g", (uint8_t *)&v21, 0x16u);
      }

      goto LABEL_19;
    case 3:
      uint64_t v13 = [NSString stringWithFormat:@"kCMSuppressionEventTypeMax not handled"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __70__SBCaptureButtonSuppressionManager__subscribeToViewObstructedUpdates__block_invoke_cold_1(a1, (uint64_t *)(a1 + 32), (uint64_t)v13);
      }
      [v13 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D8BC6EECLL);
  }
LABEL_14:
  uint64_t v12 = 0;
LABEL_20:
  [*v7 setSuppressionState:v12];
}

- (void)_unsubscribeFromViewObstructedUpdates
{
  if (self->_suppressionManager)
  {
    char v3 = SBLogCameraCaptureSuppression();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "Disabling View Obstructed updates", v5, 2u);
    }

    [(CMSuppressionManager *)self->_suppressionManager stopSuppressionUpdates];
    [(CMSuppressionManager *)self->_suppressionManager stopService];
    suppressionManager = self->_suppressionManager;
    self->_suppressionManager = 0;
  }
}

- (int64_t)suppressionState
{
  return self->_suppressionState;
}

- (void)setInCameraCapturePose:(BOOL)a3
{
  self->_inCameraCapturePose = a3;
}

- (void)setCameraCapturePoseType:(unint64_t)a3
{
  self->_cameraCapturePoseType = a3;
}

- (double)secondsAfterFaceDownAtUnsuppressionTime
{
  return self->_secondsAfterFaceDownAtUnsuppressionTime;
}

- (void)setSecondsAfterFaceDownAtUnsuppressionTime:(double)a3
{
  self->_secondsAfterFaceDownAtUnsuppressionTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
}

void __70__SBCaptureButtonSuppressionManager__subscribeToViewObstructedUpdates__block_invoke_cold_1(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = *a2;
  int v9 = 138544642;
  id v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  __int16 v15 = 2114;
  v16 = @"SBCaptureButtonSuppressionManager.m";
  __int16 v17 = 1024;
  int v18 = 186;
  __int16 v19 = 2114;
  uint64_t v20 = a3;
  _os_log_error_impl(&dword_1D85BA000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
}

@end