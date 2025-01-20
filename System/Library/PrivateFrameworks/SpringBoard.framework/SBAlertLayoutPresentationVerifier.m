@interface SBAlertLayoutPresentationVerifier
+ (id)__lock_verifiers;
+ (void)_handleTrackingStateChange;
- (SBAlertLayoutPresentationVerifier)initWithScreen:(id)a3;
- (uint64_t)_fixAlertItemLayout;
- (uint64_t)_hasBrokenAlertPresentationInvariants;
- (uint64_t)_hasBrokenHostingLayerInvariants;
- (uint64_t)_hasBrokenWindowInvariants;
- (void)_hasBrokenAlertPresentationInvariants;
- (void)_logAlertItemLayout;
- (void)_logToAutoBugCapture;
- (void)_performLayoutVerification;
- (void)_startTrackingBadPositions;
- (void)_stopTrackingBadPositions;
- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5;
- (void)activeInterfaceOrientationWillChangeToOrientation:(int64_t)a3;
- (void)addVerifier:(uint64_t)a1;
- (void)dealloc;
- (void)handleReachabilityYOffsetDidChange;
- (void)removeVerifier:(uint64_t)a1;
- (void)scheduleAlertLayoutVerificationForReason:(id)a3;
- (void)scheduleDelayedAlertLayoutVerificationForReason:(id)a3;
- (void)setAlertItemWindow:(id)a3;
- (void)setAlertPresenter:(id)a3;
@end

@implementation SBAlertLayoutPresentationVerifier

- (SBAlertLayoutPresentationVerifier)initWithScreen:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAlertLayoutPresentationVerifier;
  v6 = [(SBAlertLayoutPresentationVerifier *)&v11 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    updateReasons = v6->_updateReasons;
    v6->_updateReasons = v7;

    v6->_firstLogEventTime = -1.79769313e308;
    objc_storeStrong((id *)&v6->_screen, a3);
    v6->_lastAutoBugCaptureEventTime = 0.0;
    [(id)SBApp addActiveOrientationObserver:v6];
    v9 = +[SBReachabilityManager sharedInstance];
    [v9 addObserver:v6];

    +[SBAlertLayoutPresentationVerifier _handleTrackingStateChange]();
    -[SBAlertLayoutPresentationVerifier addVerifier:]((uint64_t)v6, v6);
  }

  return v6;
}

+ (void)_handleTrackingStateChange
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  __isReportingBadPositions = [v0 BOOLForKey:@"SBTrackAlertWindowPosition"];

  os_unfair_lock_lock(&__verifierLock);
  v1 = +[SBAlertLayoutPresentationVerifier __lock_verifiers]();
  v2 = (void *)[v1 copy];

  os_unfair_lock_unlock(&__verifierLock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        if (v8)
        {
          [*(id *)(v8 + 48) invalidate];
          v9 = *(void **)(v8 + 48);
          *(void *)(v8 + 48) = 0;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  if (__isReportingBadPositions)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          -[SBAlertLayoutPresentationVerifier _startTrackingBadPositions](*(id *)(*((void *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

- (void)addVerifier:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    os_unfair_lock_lock(&__verifierLock);
    id v3 = +[SBAlertLayoutPresentationVerifier __lock_verifiers]();
    [v3 addObject:v2];

    os_unfair_lock_unlock(&__verifierLock);
  }
}

- (void)dealloc
{
  -[SBAlertLayoutPresentationVerifier removeVerifier:]((uint64_t)self, self);
  [(NSTimer *)self->_bugCaptureTimer invalidate];
  [(id)SBApp removeActiveOrientationObserver:self];
  id v3 = +[SBReachabilityManager sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBAlertLayoutPresentationVerifier;
  [(SBAlertLayoutPresentationVerifier *)&v4 dealloc];
}

- (void)removeVerifier:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    os_unfair_lock_lock(&__verifierLock);
    id v3 = +[SBAlertLayoutPresentationVerifier __lock_verifiers]();
    [v3 removeObject:v2];

    os_unfair_lock_unlock(&__verifierLock);
  }
}

- (void)setAlertItemWindow:(id)a3
{
}

- (void)setAlertPresenter:(id)a3
{
}

- (void)scheduleDelayedAlertLayoutVerificationForReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SBAlertLayoutPresentationVerifier.m", 97, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_pendingScheduledLayoutVerification)
  {
    [(NSMutableArray *)self->_updateReasons addObject:v5];
  }
  else
  {
    self->_pendingScheduledLayoutVerification = 1;
    dispatch_time_t v6 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__SBAlertLayoutPresentationVerifier_scheduleDelayedAlertLayoutVerificationForReason___block_invoke;
    block[3] = &unk_1E6AF5290;
    block[4] = self;
    id v10 = v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F14428];
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __85__SBAlertLayoutPresentationVerifier_scheduleDelayedAlertLayoutVerificationForReason___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  return [*(id *)(a1 + 32) scheduleAlertLayoutVerificationForReason:*(void *)(a1 + 40)];
}

- (void)scheduleAlertLayoutVerificationForReason:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBAlertLayoutPresentationVerifier.m", 113, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSMutableArray *)self->_updateReasons addObject:v5];
  if (!self->_pendingLayoutVerification)
  {
    self->_pendingLayoutVerification = 1;
    dispatch_time_t v6 = (void *)*MEMORY[0x1E4F43630];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__SBAlertLayoutPresentationVerifier_scheduleAlertLayoutVerificationForReason___block_invoke;
    v8[3] = &unk_1E6AF4AC0;
    v8[4] = self;
    [v6 _performBlockAfterCATransactionCommits:v8];
  }
}

uint64_t __78__SBAlertLayoutPresentationVerifier_scheduleAlertLayoutVerificationForReason___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F39CF8] currentState];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    *(unsigned char *)(v3 + 8) = 0;
    objc_super v4 = *(void **)(a1 + 32);
    return [v4 scheduleAlertLayoutVerificationForReason:@"Rescheduling for later when not in a transaction."];
  }
  else
  {
    -[SBAlertLayoutPresentationVerifier _performLayoutVerification](v3);
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
    dispatch_time_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
    return [v6 removeAllObjects];
  }
}

- (void)_performLayoutVerification
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Alert layout appears correct.", v1, 2u);
}

+ (id)__lock_verifiers
{
  self;
  if (__lock_verifiers_once != -1) {
    dispatch_once(&__lock_verifiers_once, &__block_literal_global_281);
  }
  v0 = (void *)__lock_verifiers_lock_verifiers;
  return v0;
}

void __53__SBAlertLayoutPresentationVerifier___lock_verifiers__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:5];
  v1 = (void *)__lock_verifiers_lock_verifiers;
  __lock_verifiers_lock_verifiers = v0;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SBTrackAlertWindowPreferencesChangedHandler, @"com.apple.springboard.trackAlertWindowPositionPrefsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_stopTrackingBadPositions
{
  if (a1)
  {
    [*(id *)(a1 + 48) invalidate];
    int v2 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;
  }
}

- (void)_startTrackingBadPositions
{
  if (val)
  {
    objc_initWeak(&location, val);
    int v2 = (void *)MEMORY[0x1E4F1CB00];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__SBAlertLayoutPresentationVerifier__startTrackingBadPositions__block_invoke;
    v5[3] = &unk_1E6AF61A0;
    objc_copyWeak(&v6, &location);
    uint64_t v3 = [v2 scheduledTimerWithTimeInterval:1 repeats:v5 block:5.0];
    objc_super v4 = (void *)*((void *)val + 6);
    *((void *)val + 6) = v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __63__SBAlertLayoutPresentationVerifier__startTrackingBadPositions__block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scheduleAlertLayoutVerificationForReason:@"timer"];
}

- (void)_logToAutoBugCapture
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    if (__isReportingBadPositions)
    {
      double v2 = *(double *)(a1 + 56);
      if (v2 == 0.0 || (BSContinuousMachTimeNow(), v3 - *(double *)(a1 + 56) >= 300.0))
      {
        BSContinuousMachTimeNow();
        *(void *)(a1 + 56) = v4;
        id v5 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
        id v6 = [MEMORY[0x1E4F28F80] processInfo];
        uint64_t v7 = [v6 processName];
        uint64_t v8 = [v5 signatureWithDomain:@"SpringBoard" type:@"AlertLayout" subType:@"PositionVerifier" subtypeContext:0 detectedProcess:v7 triggerThresholdValues:0];

        uint64_t v9 = *MEMORY[0x1E4FA8B18];
        v12[0] = *MEMORY[0x1E4FA8B28];
        v12[1] = v9;
        v13[0] = MEMORY[0x1E4F1CC28];
        v13[1] = MEMORY[0x1E4F1CC28];
        id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke;
        v11[3] = &unk_1E6B087E0;
        v11[4] = a1;
        *(double *)&v11[5] = v2;
        [v5 snapshotWithSignature:v8 duration:MEMORY[0x1E4F1CBF0] events:0 payload:v10 actions:v11 reply:0.0];
      }
    }
  }
}

void __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke(uint64_t a1, void *a2)
{
  double v3 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    id v5 = v7;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke_2;
    v7[3] = &unk_1E6AF4AC0;
    v7[4] = *(void *)(a1 + 32);
  }
  else
  {
    id v5 = block;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke_3;
    block[3] = &unk_1E6AF4A70;
    block[4] = *(void *)(a1 + 32);
    void block[5] = *(void *)(a1 + 40);
  }
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke_2(uint64_t a1)
{
  uint64_t result = BSContinuousMachTimeNow();
  *(void *)(*(void *)(a1 + 32) + 56) = v3;
  return result;
}

double __57__SBAlertLayoutPresentationVerifier__logToAutoBugCapture__block_invoke_3(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 56) = result;
  return result;
}

- (uint64_t)_hasBrokenHostingLayerInvariants
{
  uint64_t v1 = a1;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*(void *)(a1 + 24))
    {
      double v2 = [MEMORY[0x1E4F62490] sharedInstance];
      uint64_t v3 = [*(id *)(v1 + 24) _scene];
      int v4 = [v3 identifier];
      id v5 = [v2 sceneWithIdentifier:v4];

      id v6 = [v5 uiPresentationManager];
      uint64_t v7 = [v6 defaultPresentationContext];
      uint64_t v8 = [v7 layerPresentationOverrides];

      uint64_t v9 = [MEMORY[0x1E4F42D70] targetForUIWindow:*(void *)(v1 + 24)];
      id v10 = [v8 objectForKey:v9];
      uint64_t v11 = [v10 transformer];

      float64x2_t v26 = 0u;
      float64x2_t v27 = 0u;
      float64x2_t v25 = 0u;
      if (v11)
      {
        [v11 transform];
      }
      else
      {
        float64x2_t v25 = *(float64x2_t *)MEMORY[0x1E4F1DAB8];
        float64x2_t v26 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16);
        float64x2_t v27 = *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      [*(id *)(v1 + 24) bounds];
      CGFloat x = v34.origin.x;
      CGFloat y = v34.origin.y;
      CGFloat width = v34.size.width;
      CGFloat height = v34.size.height;
      double MidX = CGRectGetMidX(v34);
      v35.origin.CGFloat x = x;
      v35.origin.CGFloat y = y;
      v35.size.CGFloat width = width;
      v35.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v35);
      float64x2_t v17 = vaddq_f64(v27, vmlaq_n_f64(vmulq_n_f64(v26, MidY), v25, MidX));
      uint64_t v1 = MidX != v17.f64[0];
      if (MidX != v17.f64[0])
      {
        CGPoint point = (CGPoint)v17;
        CGFloat v23 = MidY;
        long long v18 = SBLogAlertItems();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v33.CGFloat y = v23;
          v33.CGFloat x = MidX;
          long long v20 = NSStringFromCGPoint(v33);
          long long v21 = NSStringFromCGPoint(point);
          *(_DWORD *)buf = 138543618;
          v29 = v20;
          __int16 v30 = 2114;
          v31 = v21;
          _os_log_error_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_ERROR, "Alert window hosting layer has misaligned transform. Layer midpoint: %{public}@. Transformed midpoint:  %{public}@", buf, 0x16u);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)_hasBrokenWindowInvariants
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    double result = *(void *)(result + 24);
    if (result)
    {
      double v2 = [(id)result screen];
      uint64_t v3 = *(void **)(v1 + 40);

      [*(id *)(v1 + 24) bounds];
      CGFloat v5 = v4;
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      [*(id *)(v1 + 40) bounds];
      v41.origin.CGFloat x = v12;
      v41.origin.CGFloat y = v13;
      v41.size.CGFloat width = v14;
      v41.size.CGFloat height = v15;
      v38.origin.CGFloat x = v5;
      v38.origin.CGFloat y = v7;
      v38.size.CGFloat width = v9;
      v38.size.CGFloat height = v11;
      BOOL v16 = CGRectEqualToRect(v38, v41);
      int v17 = [*(id *)(v1 + 24) isHidden] | v16;
      if (v2 == v3)
      {
        long long v19 = [*(id *)(v1 + 40) coordinateSpace];
        [*(id *)(v1 + 24) bounds];
        objc_msgSend(v19, "convertRect:fromCoordinateSpace:", *(void *)(v1 + 24));
        CGFloat v21 = v20;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;

        v39.origin.CGFloat x = v21;
        v39.origin.CGFloat y = v23;
        v39.size.CGFloat width = v25;
        v39.size.CGFloat height = v27;
        double MidX = CGRectGetMidX(v39);
        [*(id *)(v1 + 40) bounds];
        double v29 = vabdd_f64(MidX, CGRectGetMidX(v40));
        int v30 = [*(id *)(v1 + 24) isHidden];
        if (v29 < 1.0) {
          int v18 = 1;
        }
        else {
          int v18 = v30;
        }
        if (v17 & v18) {
          return 0;
        }
      }
      else
      {
        int v18 = 0;
      }
      v31 = SBLogAlertItems();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32[0] = 67109632;
        v32[1] = v2 == v3;
        __int16 v33 = 1024;
        int v34 = v17;
        __int16 v35 = 1024;
        int v36 = v18;
        _os_log_error_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_ERROR, "Alert window invariants broken. correctScreenPresentation:%{BOOL}i correctBounds:%{BOOL}i correctXLayout:%{BOOL}i", (uint8_t *)v32, 0x14u);
      }

      return 1;
    }
  }
  return result;
}

- (uint64_t)_hasBrokenAlertPresentationInvariants
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = [WeakRetained currentlyPresentedAlertItem];

    double v4 = [v3 alertController];
    CGFloat v5 = [v4 view];
    uint64_t v6 = [v4 presentationController];
    if (v6)
    {
      CGFloat v7 = (void *)v6;
      uint64_t v8 = [v5 window];
      if (v8)
      {
        CGFloat v9 = (void *)v8;
        double v10 = [v5 window];
        char v11 = [v10 isHidden];

        if ((v11 & 1) == 0)
        {
          CGFloat v12 = [v5 window];
          CGFloat v13 = *(void **)(v1 + 24);

          CGFloat v14 = *(void **)(v1 + 40);
          CGFloat v15 = [*(id *)(v1 + 24) screen];

          if (v14 != v15)
          {
            char v16 = 0;
LABEL_7:
            int v17 = SBLogAlertItems();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
              [(SBAlertLayoutPresentationVerifier *)v12 == v13 _hasBrokenAlertPresentationInvariants];
            }

            uint64_t v1 = 1;
            goto LABEL_12;
          }
          long long v19 = [*(id *)(v1 + 40) coordinateSpace];
          [v5 bounds];
          objc_msgSend(v19, "convertRect:fromCoordinateSpace:", v5);
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          CGFloat v27 = v26;

          v30.origin.CGFloat x = v21;
          v30.origin.CGFloat y = v23;
          v30.size.CGFloat width = v25;
          v30.size.CGFloat height = v27;
          double MidX = CGRectGetMidX(v30);
          [*(id *)(v1 + 40) bounds];
          double v29 = vabdd_f64(MidX, CGRectGetMidX(v31));
          char v16 = v29 < 1.0;
          if (v12 != v13 || v29 >= 1.0) {
            goto LABEL_7;
          }
        }
      }
      else
      {
      }
    }
    uint64_t v1 = 0;
LABEL_12:
  }
  return v1;
}

- (void)_logAlertItemLayout
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "Broken invariant in alert item layout.", v1, 2u);
}

- (uint64_t)_fixAlertItemLayout
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 24) frame];
    CGFloat v3 = v2;
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    [*(id *)(v1 + 40) bounds];
    v18.origin.CGFloat x = v10;
    v18.origin.CGFloat y = v11;
    v18.size.CGFloat width = v12;
    v18.size.CGFloat height = v13;
    v17.origin.CGFloat x = v3;
    v17.origin.CGFloat y = v5;
    v17.size.CGFloat width = v7;
    v17.size.CGFloat height = v9;
    double result = CGRectEqualToRect(v17, v18);
    if ((result & 1) == 0)
    {
      CGFloat v14 = SBLogAlertItems();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v16 = 0;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEFAULT, "Broken alert layout getting fixed", v16, 2u);
      }

      CGFloat v15 = *(void **)(v1 + 24);
      [*(id *)(v1 + 40) bounds];
      return objc_msgSend(v15, "setFrame:");
    }
  }
  return result;
}

- (void)handleReachabilityYOffsetDidChange
{
}

- (void)activeInterfaceOrientationWillChangeToOrientation:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"Will change to orientation %li", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(SBAlertLayoutPresentationVerifier *)self scheduleAlertLayoutVerificationForReason:v4];
}

- (void)activeInterfaceOrientationDidChangeToOrientation:(int64_t)a3 willAnimateWithDuration:(double)a4 fromOrientation:(int64_t)a5
{
  objc_msgSend(NSString, "stringWithFormat:", @"Did change from orientation %li to orientation %li", a4, a5, a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(SBAlertLayoutPresentationVerifier *)self scheduleAlertLayoutVerificationForReason:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bugCaptureTimer, 0);
  objc_storeStrong((id *)&self->_screen, 0);
  objc_destroyWeak((id *)&self->_alertPresenter);
  objc_storeStrong((id *)&self->_alertWindow, 0);
  objc_storeStrong((id *)&self->_updateReasons, 0);
}

- (void)_hasBrokenAlertPresentationInvariants
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Alert layout invariants broken. correctScreenPresentation:%{BOOL}i correctXLayout:%{BOOL}i", (uint8_t *)v3, 0xEu);
}

@end