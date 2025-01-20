@interface UIKeyShortcutHUDService
+ (BOOL)_isOOPFeatureEnabled;
+ (UIKeyShortcutHUDService)_existingHUDService;
+ (UIKeyShortcutHUDService)sharedHUDService;
- (BOOL)_canSummonHUDWithModifierFlag:(int64_t)a3;
- (BOOL)_isHUDAllowedForConfiguration:(id)a3;
- (BOOL)_isHUDAllowedForCurrentResponder;
- (BOOL)_isHUDAllowedOverCurrentWindow;
- (BOOL)_isHUDAllowedToAppearForProcess;
- (BOOL)_isHUDAllowedToBePresentedForPresentationState:(int64_t)a3;
- (BOOL)_isHUDAllowedToBeScheduledForPresentationState:(int64_t)a3;
- (BOOL)_isHUDSupportedOnPlatform;
- (NSArray)scheduledHUDHoverGestureRecognizers;
- (NSTimer)scheduledHUDTimer;
- (NSValue)scheduledHUDInitialPointerLocation;
- (OS_dispatch_source)deferredResponseTimer;
- (UIKeyShortcutHUDMetricsProvider)metricsProvider;
- (UIKeyShortcutHUDService)init;
- (UIPhysicalKeyboardEvent)lastKeyboardEvent;
- (UIWindowScene)scheduledHUDKeyWindowScene;
- (_UIKeyShortcutHUDClientSession)deferredResponseSession;
- (_UIKeyShortcutHUDClientSession)session;
- (_UIKeyShortcutHUDConfiguration)scheduledHUDConfiguration;
- (_UIKeyShortcutHUDDismissalResponse)deferredResponse;
- (_UIKeyShortcutHUDModifierKeyListener)modifierKeyListener;
- (_UIOverlayService)overlayService;
- (id)metricsForWindow:(id)a3;
- (int64_t)hudPresentationState;
- (void)_addPresentationObserversIfNeeded;
- (void)_applicationDidBeginIgnoringInteractionEvents:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_cancelAllScheduledHUDPresentationsIfNeeded;
- (void)_didTakeScreenshot:(id)a3;
- (void)_discardScheduledHUDBookkeeping;
- (void)_handleDeferredDismissalResponse:(id)a3;
- (void)_handleKeyCommandFromResponse:(id)a3 withSession:(id)a4;
- (void)_handleScheduledHUDPointerHover:(id)a3;
- (void)_handleSystemHUDPresentationDarwinNotification;
- (void)_handleSystemHUDPreventUnintendedPresentationDarwinNotificationIfNeeded;
- (void)_hardwareKeyboardAvailabilityChanged:(id)a3;
- (void)_registerForScheduledHUDCancellationDarwinNotifications;
- (void)_registerForSystemHUDPresentationDarwinNotifications;
- (void)_registerForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded;
- (void)_removePresentationObserversIfNeeded;
- (void)_requestHUDDismissal;
- (void)_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:(id)a3;
- (void)_requestHUDPresentationWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)_requestHUDPresentationWithUnpreparedConfiguration:(id)a3;
- (void)_sendSystemHUDPresentationDarwinNotificationIfNeeded;
- (void)_sendSystemHUDPreventUnintendedPresentationDarwinNotificationIfNeeded;
- (void)_unregisterForScheduledHUDCancellationDarwinNotifications;
- (void)_unregisterForSystemHUDPresentationDarwinNotifications;
- (void)_unregisterForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded;
- (void)cancelScheduledHUDPresentationIfNeeded;
- (void)dealloc;
- (void)dismissOrCancelHUDPresentationIfNeeded;
- (void)handleKeyboardEvent:(id)a3;
- (void)handleTouchEvent:(id)a3;
- (void)keyShortcutHUDDidDismissWithResponse:(id)a3 toOverlayService:(id)a4;
- (void)modifierKeyListener:(id)a3 didUpdateModifierFlag:(int64_t)a4;
- (void)overlayServiceDidInvalidate:(id)a3;
- (void)presentHUD;
- (void)requestHUDPresentationIntoSearchMode;
- (void)scheduleHUDPresentation;
- (void)setDeferredResponse:(id)a3;
- (void)setDeferredResponseSession:(id)a3;
- (void)setDeferredResponseTimer:(id)a3;
- (void)setLastKeyboardEvent:(id)a3;
- (void)setMetricsProvider:(id)a3;
- (void)setOverlayService:(id)a3;
- (void)setScheduledHUDConfiguration:(id)a3;
- (void)setScheduledHUDHoverGestureRecognizers:(id)a3;
- (void)setScheduledHUDInitialPointerLocation:(id)a3;
- (void)setScheduledHUDKeyWindowScene:(id)a3;
- (void)setScheduledHUDTimer:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation UIKeyShortcutHUDService

- (void)handleTouchEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v7 = v4;
    uint64_t v6 = [v4 type];
    v5 = v7;
    if (!v6)
    {
      [(UIKeyShortcutHUDService *)self _cancelAllScheduledHUDPresentationsIfNeeded];
      v5 = v7;
    }
  }
}

- (void)_cancelAllScheduledHUDPresentationsIfNeeded
{
  if ([(UIKeyShortcutHUDService *)self hudPresentationState] == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"UIKeyShortcutHUDCancelScheduledHUDPresentationDarwinNotificationName", 0, 0, 0);
  }
}

- (void)dismissOrCancelHUDPresentationIfNeeded
{
  int64_t v3 = [(UIKeyShortcutHUDService *)self hudPresentationState];
  if ((unint64_t)(v3 - 2) >= 2)
  {
    if (v3 == 1) {
      [(UIKeyShortcutHUDService *)self _discardScheduledHUDBookkeeping];
    }
  }
  else
  {
    [(UIKeyShortcutHUDService *)self _requestHUDDismissal];
  }
  [(UIKeyShortcutHUDService *)self _removePresentationObserversIfNeeded];
}

- (int64_t)hudPresentationState
{
  uint64_t v3 = [(UIKeyShortcutHUDService *)self scheduledHUDTimer];
  if (v3)
  {
    id v4 = (void *)v3;
    v5 = [(UIKeyShortcutHUDService *)self scheduledHUDTimer];
    char v6 = [v5 isValid];

    if (v6) {
      return 1;
    }
  }
  v8 = [(UIKeyShortcutHUDService *)self session];

  if (v8) {
    return 3;
  }
  else {
    return *(unsigned char *)&self->_flags & 2;
  }
}

- (_UIKeyShortcutHUDClientSession)session
{
  return self->_session;
}

- (NSTimer)scheduledHUDTimer
{
  return self->_scheduledHUDTimer;
}

+ (UIKeyShortcutHUDService)_existingHUDService
{
  return (UIKeyShortcutHUDService *)(id)qword_1EB261790;
}

+ (UIKeyShortcutHUDService)sharedHUDService
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__UIKeyShortcutHUDService_sharedHUDService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB261798 != -1) {
    dispatch_once(&qword_1EB261798, block);
  }
  v2 = (void *)qword_1EB261790;
  return (UIKeyShortcutHUDService *)v2;
}

- (void)_removePresentationObserversIfNeeded
{
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)&self->_flags &= ~1u;
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:@"UIApplicationWillResignActiveNotification" object:UIApp];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:0x1ED15D040 object:UIApp];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self name:@"UIApplicationUserDidTakeScreenshotNotification" object:0];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];
  }
}

void __43__UIKeyShortcutHUDService_sharedHUDService__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB261790;
  qword_1EB261790 = v0;
}

- (UIKeyShortcutHUDService)init
{
  v8.receiver = self;
  v8.super_class = (Class)UIKeyShortcutHUDService;
  v2 = [(UIKeyShortcutHUDService *)&v8 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(UIKeyShortcutHUDService *)v2 setMetricsProvider:v2];
    if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled])
    {
      id v4 = objc_opt_new();
      [(UIKeyShortcutHUDService *)v3 setOverlayService:v4];

      v5 = [(UIKeyShortcutHUDService *)v3 overlayService];
      [v5 setDelegate:v3];

      id v6 = [(UIKeyShortcutHUDService *)v3 overlayService];
      [v6 prewarmConnection];
    }
    [(UIKeyShortcutHUDService *)v3 _registerForScheduledHUDCancellationDarwinNotifications];
    [(UIKeyShortcutHUDService *)v3 _registerForSystemHUDPresentationDarwinNotifications];
    [(UIKeyShortcutHUDService *)v3 _registerForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded];
  }
  return v3;
}

- (void)dealloc
{
  [(UIKeyShortcutHUDService *)self _unregisterForScheduledHUDCancellationDarwinNotifications];
  [(UIKeyShortcutHUDService *)self _unregisterForSystemHUDPresentationDarwinNotifications];
  [(UIKeyShortcutHUDService *)self _unregisterForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyShortcutHUDService;
  [(UIKeyShortcutHUDService *)&v3 dealloc];
}

- (void)_registerForScheduledHUDCancellationDarwinNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleUIKeyShortcutHUDCancelScheduledHUDPresentationDarwinNotification, @"UIKeyShortcutHUDCancelScheduledHUDPresentationDarwinNotificationName", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unregisterForScheduledHUDCancellationDarwinNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"UIKeyShortcutHUDCancelScheduledHUDPresentationDarwinNotificationName", 0);
}

- (void)_registerForSystemHUDPresentationDarwinNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleUIKeyShortcutSystemHUDDidPresentDarwinNotification, @"UIKeyShortcutSystemHUDDidPresentDarwinNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_unregisterForSystemHUDPresentationDarwinNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"UIKeyShortcutSystemHUDDidPresentDarwinNotification", 0);
}

- (void)_sendSystemHUDPresentationDarwinNotificationIfNeeded
{
  if (qword_1EB2617B8 != -1) {
    dispatch_once(&qword_1EB2617B8, &__block_literal_global_287_0);
  }
  if (byte_1EB261779)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"UIKeyShortcutSystemHUDDidPresentDarwinNotification", 0, 0, 0);
  }
}

- (void)_handleSystemHUDPresentationDarwinNotification
{
  if (qword_1EB2617B8 != -1) {
    dispatch_once(&qword_1EB2617B8, &__block_literal_global_287_0);
  }
  if (!byte_1EB261779)
  {
    v2 = _UIKeyShortcutHUDLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to non-system HUD due to system HUD presentation", v4, 2u);
    }

    objc_super v3 = +[UIKeyShortcutHUDService sharedHUDService];
    [v3 dismissOrCancelHUDPresentationIfNeeded];
  }
}

- (void)_registerForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded
{
  if (qword_1EB2617B8 != -1) {
    dispatch_once(&qword_1EB2617B8, &__block_literal_global_287_0);
  }
  if (byte_1EB261779)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_HandleUIKeyShortcutSystemHUDPreventUnintendedPresentationDarwinNotification, @"UIKeyShortcutSystemHUDPreventUnintendedPresentationDarwinNotificationName", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_unregisterForSystemHUDPreventUnintendedPresentationDarwinNotificationsIfNeeded
{
  if (qword_1EB2617B8 != -1) {
    dispatch_once(&qword_1EB2617B8, &__block_literal_global_287_0);
  }
  if (byte_1EB261779)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"UIKeyShortcutSystemHUDPreventUnintendedPresentationDarwinNotificationName", 0);
  }
}

- (void)_sendSystemHUDPreventUnintendedPresentationDarwinNotificationIfNeeded
{
  if (qword_1EB2617B8 != -1) {
    dispatch_once(&qword_1EB2617B8, &__block_literal_global_287_0);
  }
  if (!byte_1EB261779)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"UIKeyShortcutSystemHUDPreventUnintendedPresentationDarwinNotificationName", 0, 0, 0);
  }
}

- (void)_handleSystemHUDPreventUnintendedPresentationDarwinNotificationIfNeeded
{
  if (qword_1EB2617B8 != -1) {
    dispatch_once(&qword_1EB2617B8, &__block_literal_global_287_0);
  }
  if (byte_1EB261779)
  {
    [(UIKeyShortcutHUDService *)self cancelScheduledHUDPresentationIfNeeded];
  }
}

+ (BOOL)_isOOPFeatureEnabled
{
  if (qword_1EB2617A0 != -1) {
    dispatch_once(&qword_1EB2617A0, &__block_literal_global_20_4);
  }
  return _MergedGlobals_1118;
}

void __47__UIKeyShortcutHUDService__isOOPFeatureEnabled__block_invoke()
{
  id v0 = +[UIDevice currentDevice];
  _MergedGlobals_1118 = [v0 userInterfaceIdiom] == 1;
}

- (void)requestHUDPresentationIntoSearchMode
{
  int64_t v3 = [(UIKeyShortcutHUDService *)self hudPresentationState];
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    [(UIKeyShortcutHUDService *)self dismissOrCancelHUDPresentationIfNeeded];
  }
  id v7 = (id)objc_opt_new();
  [v7 setPresentedModifierFlag:0x100000];
  [v7 setSearching:1];
  id v4 = +[UIWindow _applicationKeyWindow];
  v5 = [(UIKeyShortcutHUDService *)self lastKeyboardEvent];
  id v6 = +[_UIKeyShortcutHUDClientTraits traitsWithReferenceTraitEnvironment:v4 referenceKeyboardEvent:v5];
  [v7 setClientTraits:v6];

  [(UIKeyShortcutHUDService *)self _requestHUDPresentationIfAllowedWithUnpreparedConfiguration:v7];
}

- (void)scheduleHUDPresentation
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(UIKeyShortcutHUDService *)self hudPresentationState] == 1)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UIKeyShortcutHUDService.m", 386, @"Invalid parameter not satisfying: %@", @"self.hudPresentationState != _UIKeyShortcutHUDPresentationStateScheduled" object file lineNumber description];
  }
  [(UIKeyShortcutHUDService *)self _addPresentationObserversIfNeeded];
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v17 + 1) + 8 * v7);
        v9 = [(UIHoverGestureRecognizer *)[_UIInertHoverGestureRecognizer alloc] initWithTarget:self action:sel__handleScheduledHUDPointerHover_];
        [(UIGestureRecognizer *)v9 setName:@"com.apple.UIKit.ShortcutHUDDelayHover"];
        [v8 addGestureRecognizer:v9];

        [v4 addObject:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  [(UIKeyShortcutHUDService *)self setScheduledHUDHoverGestureRecognizers:v4];
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x1E4F1CB00];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__UIKeyShortcutHUDService_scheduleHUDPresentation__block_invoke;
  v14[3] = &unk_1E52DAB28;
  objc_copyWeak(&v15, &location);
  v11 = [v10 scheduledTimerWithTimeInterval:0 repeats:v14 block:0.9];
  [(UIKeyShortcutHUDService *)self setScheduledHUDTimer:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __50__UIKeyShortcutHUDService_scheduleHUDPresentation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained scheduledHUDConfiguration];
    [v3 _requestHUDPresentationIfAllowedWithUnpreparedConfiguration:v2];

    [v3 _discardScheduledHUDBookkeeping];
    id WeakRetained = v3;
  }
}

- (void)_handleScheduledHUDPointerHover:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;
  v10 = [v5 windowScene];
  v11 = [v10 screen];
  v12 = [v11 coordinateSpace];
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v5, v7, v9);
  double v14 = v13;
  double v16 = v15;

  uint64_t v17 = [v4 state];
  if ((unint64_t)(v17 - 1) <= 2)
  {
    long long v18 = [(UIKeyShortcutHUDService *)self scheduledHUDInitialPointerLocation];

    if (v18)
    {
      long long v19 = [(UIKeyShortcutHUDService *)self scheduledHUDInitialPointerLocation];
      [v19 CGPointValue];
      double v22 = sqrt((v14 - v20) * (v14 - v20) + (v16 - v21) * (v16 - v21));

      if (v22 > 10.0) {
        [(UIKeyShortcutHUDService *)self _cancelAllScheduledHUDPresentationsIfNeeded];
      }
    }
    else
    {
      *(double *)v24 = v14;
      *(double *)&v24[1] = v16;
      v23 = [MEMORY[0x1E4F29238] valueWithBytes:v24 objCType:"{CGPoint=dd}"];
      [(UIKeyShortcutHUDService *)self setScheduledHUDInitialPointerLocation:v23];
    }
  }
}

- (void)cancelScheduledHUDPresentationIfNeeded
{
  if ([(UIKeyShortcutHUDService *)self hudPresentationState] == 1)
  {
    [(UIKeyShortcutHUDService *)self dismissOrCancelHUDPresentationIfNeeded];
  }
}

- (void)_discardScheduledHUDBookkeeping
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKeyShortcutHUDService *)self scheduledHUDTimer];
  int v4 = [v3 isValid];

  if (v4)
  {
    uint64_t v5 = [(UIKeyShortcutHUDService *)self scheduledHUDTimer];
    [v5 invalidate];
  }
  [(UIKeyShortcutHUDService *)self setScheduledHUDTimer:0];
  [(UIKeyShortcutHUDService *)self setScheduledHUDConfiguration:0];
  double v6 = [(UIKeyShortcutHUDService *)self scheduledHUDKeyWindowScene];
  if (v6)
  {
    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:@"_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification" object:v6];

    [(UIKeyShortcutHUDService *)self setScheduledHUDKeyWindowScene:0];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v8 = [(UIKeyShortcutHUDService *)self scheduledHUDHoverGestureRecognizers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v13 setEnabled:0];
        double v14 = [v13 view];
        [v14 removeGestureRecognizer:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(UIKeyShortcutHUDService *)self setScheduledHUDHoverGestureRecognizers:0];
  [(UIKeyShortcutHUDService *)self setScheduledHUDInitialPointerLocation:0];
}

- (void)_requestHUDPresentationIfAllowedWithUnpreparedConfiguration:(id)a3
{
  id v4 = a3;
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_UISuppressKeyShortcutHUD, @"UISuppressKeyShortcutHUD") & 1) != 0|| !byte_1E8FD52FC)
  {
    if ([(UIKeyShortcutHUDService *)self _isHUDSupportedOnPlatform]
      && [(UIKeyShortcutHUDService *)self _isHUDAllowedToAppearForProcess]
      && [(UIKeyShortcutHUDService *)self _isHUDAllowedOverCurrentWindow]
      && [(UIKeyShortcutHUDService *)self _isHUDAllowedForCurrentResponder]
      && [(UIKeyShortcutHUDService *)self _isHUDAllowedForConfiguration:v4]
      && [(UIKeyShortcutHUDService *)self _isHUDAllowedToBePresentedForPresentationState:[(UIKeyShortcutHUDService *)self hudPresentationState]])
    {
      [(UIKeyShortcutHUDService *)self _requestHUDPresentationWithUnpreparedConfiguration:v4];
    }
  }
  else
  {
    uint64_t v5 = _UIKeyShortcutHUDLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Suppressing HUD due to UISuppressKeyShortcutHUD default being enabled.", v6, 2u);
    }
  }
}

- (void)_requestHUDPresentationWithUnpreparedConfiguration:(id)a3
{
  id v5 = a3;
  if (![(UIKeyShortcutHUDService *)self _isHUDSupportedOnPlatform]
    || ![(UIKeyShortcutHUDService *)self _isHUDAllowedToAppearForProcess]
    || ![(UIKeyShortcutHUDService *)self _isHUDAllowedOverCurrentWindow]
    || ![(UIKeyShortcutHUDService *)self _isHUDAllowedForCurrentResponder]
    || ![(UIKeyShortcutHUDService *)self _isHUDAllowedForConfiguration:v5])
  {
    double v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"UIKeyShortcutHUDService.m" lineNumber:526 description:@"Attempted to present the key shortcut HUD when not allowed!"];
  }
  if ([(UIKeyShortcutHUDService *)self _isHUDAllowedToBePresentedForPresentationState:[(UIKeyShortcutHUDService *)self hudPresentationState]])
  {
    if (v5) {
      goto LABEL_8;
    }
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"UIKeyShortcutHUDService.m" lineNumber:528 description:@"Attempted to present the key shortcut HUD in a state where it's not allowed!"];

    if (v5) {
      goto LABEL_8;
    }
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2 object:self file:@"UIKeyShortcutHUDService.m" lineNumber:529 description:@"Attempted to present the key shortcut HUD with a nil configuration!"];

LABEL_8:
  double v6 = [v5 model];

  if (!v6)
  {
    double v7 = +[_UIKeyShortcutHUDModel modelForCurrentMenu];
    [v5 setModel:v7];
  }
  double v8 = [v5 model];
  char v9 = [v8 isEmpty];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = objc_opt_new();
    [v10 setConfiguration:v5];
    if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled])
    {
      uint64_t v11 = +[UIKeyboardImpl activeInstance];
      objc_msgSend(v10, "setTextEditingSessionWasTornDown:", objc_msgSend(v11, "isCurrentEditResponderInEditingMode"));
    }
    v12 = [v5 clientTraits];

    if (!v12)
    {
      double v13 = +[UIWindow _applicationKeyWindow];
      double v14 = [(UIKeyShortcutHUDService *)self lastKeyboardEvent];
      long long v15 = +[_UIKeyShortcutHUDClientTraits traitsWithReferenceTraitEnvironment:v13 referenceKeyboardEvent:v14];
      [v5 setClientTraits:v15];
    }
    long long v16 = [(UIKeyShortcutHUDService *)self modifierKeyListener];
    objc_msgSend(v5, "setInitialHeldModifierFlags:", objc_msgSend(v16, "currentModifierFlags"));

    long long v17 = +[UIWindowScene _keyWindowScene]();
    long long v18 = [v17 _eventDeferringManager];
    long long v19 = -[_UIEventDeferringManager bufferKeyboardFocusEnvironmentEventsWithReason:]((uint64_t)v18, @"KeyShortcutHUD request to OverlayUI");

    *(unsigned char *)&self->_flags |= 2u;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __78__UIKeyShortcutHUDService__requestHUDPresentationWithUnpreparedConfiguration___block_invoke;
    v25[3] = &unk_1E52F55F0;
    id v26 = v19;
    v27 = self;
    id v28 = v10;
    id v20 = v10;
    id v21 = v19;
    [(UIKeyShortcutHUDService *)self _requestHUDPresentationWithConfiguration:v5 completionHandler:v25];
  }
}

void __78__UIKeyShortcutHUDService__requestHUDPresentationWithUnpreparedConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 invalidate];
  LODWORD(v3) = [v4 accepted];

  if (v3)
  {
    [*(id *)(a1 + 40) setSession:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _addPresentationObserversIfNeeded];
  }
  *(unsigned char *)(*(void *)(a1 + 40) + 8) &= ~2u;
}

- (void)_requestHUDPresentationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled])
  {
    char v9 = [[_UIORequestKeyShortcutHUDPresentationAction alloc] initWithConfiguration:v7 responseHandler:v6];

    double v8 = [(UIKeyShortcutHUDService *)self overlayService];
    [v8 sendOverlayAction:v9];
  }
  else
  {
    +[UIWindowScene _keyWindowScene]();
    char v9 = (_UIORequestKeyShortcutHUDPresentationAction *)objc_claimAutoreleasedReturnValue();
    double v8 = +[_UIKeyShortcutHUDServer sharedHUDServer];
    [v8 presentHUDWithConfiguration:v7 inWindowScene:v9 forConnection:0 completionHandler:v6];
  }
}

- (void)presentHUD
{
  int64_t v3 = [(UIKeyShortcutHUDService *)self hudPresentationState];
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    [(UIKeyShortcutHUDService *)self cancelScheduledHUDPresentationIfNeeded];
  }
  id v7 = (id)objc_opt_new();
  [v7 setPresentedModifierFlag:0x800000];
  id v4 = +[UIWindow _applicationKeyWindow];
  id v5 = [(UIKeyShortcutHUDService *)self lastKeyboardEvent];
  id v6 = +[_UIKeyShortcutHUDClientTraits traitsWithReferenceTraitEnvironment:v4 referenceKeyboardEvent:v5];
  [v7 setClientTraits:v6];

  [(UIKeyShortcutHUDService *)self _requestHUDPresentationIfAllowedWithUnpreparedConfiguration:v7];
}

- (void)_requestHUDDismissal
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_KeyShortcutHUDEnhancedLogging, @"KeyShortcutHUDEnhancedLogging") & 1) == 0&& byte_1E8FD4F24)
  {
    int64_t v3 = _UIKeyShortcutHUDLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [MEMORY[0x1E4F29060] callStackSymbols];
      int v7 = 138543362;
      double v8 = v4;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal; callStack=%{public}@",
        (uint8_t *)&v7,
        0xCu);
    }
  }
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled])
  {
    id v5 = +[_UIORequestKeyShortcutHUDDismissalAction dismissalAction];
    id v6 = [(UIKeyShortcutHUDService *)self overlayService];
    [v6 sendOverlayAction:v5];
  }
  else
  {
    id v5 = +[_UIKeyShortcutHUDServer sharedHUDServer];
    [v5 dismissHUDForConnection:0];
  }
}

- (void)handleKeyboardEvent:(id)a3
{
  id v4 = a3;
  if ([(UIKeyShortcutHUDService *)self _isHUDSupportedOnPlatform])
  {
    [(UIKeyShortcutHUDService *)self setLastKeyboardEvent:v4];
    id v10 = (id)[v4 _cloneEvent];

    [v10 _privatize];
    if ([v10 _isKeyDown] && (objc_msgSend(v10, "modifierFlags") & 0x800000) != 0)
    {
      id v5 = [v10 _modifiedInput];
      if ([v5 length])
      {
        char v6 = [(id)UIApp isFrontBoard];

        if ((v6 & 1) == 0) {
          [(UIKeyShortcutHUDService *)self preventUnintendedSystemHUDPresentationIfNeeded];
        }
      }
      else
      {
      }
    }
    if (!+[UIKeyShortcutHUDService _isOOPFeatureEnabled]
      || _UIApplicationProcessIsOverlayUI())
    {
      double v8 = +[_UIKeyShortcutHUDServer sharedHUDServer];
      [v8 handleKeyboardEvent:v10];
    }
    if ([(UIKeyShortcutHUDService *)self _isHUDAllowedToAppearForProcess])
    {
      uint64_t v9 = [(UIKeyShortcutHUDService *)self modifierKeyListener];
      [v9 handleKeyboardEvent:v10];
    }
    int v7 = v10;
  }
  else
  {
    int v7 = v4;
  }
}

- (_UIKeyShortcutHUDModifierKeyListener)modifierKeyListener
{
  modifierKeyListener = self->_modifierKeyListener;
  if (!modifierKeyListener)
  {
    id v4 = (_UIKeyShortcutHUDModifierKeyListener *)objc_opt_new();
    id v5 = self->_modifierKeyListener;
    self->_modifierKeyListener = v4;

    [(_UIKeyShortcutHUDModifierKeyListener *)self->_modifierKeyListener setDelegate:self];
    modifierKeyListener = self->_modifierKeyListener;
  }
  return modifierKeyListener;
}

- (void)modifierKeyListener:(id)a3 didUpdateModifierFlag:(int64_t)a4
{
  id v6 = a3;
  int64_t v7 = [(UIKeyShortcutHUDService *)self hudPresentationState];
  uint64_t v8 = [v6 currentModifierFlags];

  if ([(UIKeyShortcutHUDService *)self _canSummonHUDWithModifierFlag:a4])
  {
    int64_t v9 = v8 & a4;
    if ([(UIKeyShortcutHUDService *)self _isHUDAllowedToBeScheduledForPresentationState:v7]&& v9)
    {
      id v10 = objc_opt_new();
      [(UIKeyShortcutHUDService *)self setScheduledHUDConfiguration:v10];

      uint64_t v11 = [(UIKeyShortcutHUDService *)self scheduledHUDConfiguration];
      [v11 setPresentedModifierFlag:a4];

      +[UIWindowScene _keyWindowScene]();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v12 addObserver:self selector:sel__sceneDidLoseKeyboardFocus_ name:@"_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification" object:v15];

        [(UIKeyShortcutHUDService *)self setScheduledHUDKeyWindowScene:v15];
      }
      [(UIKeyShortcutHUDService *)self scheduleHUDPresentation];
    }
    else if (v7 == 1 && !v9)
    {
      double v13 = [(UIKeyShortcutHUDService *)self scheduledHUDConfiguration];
      uint64_t v14 = [v13 presentedModifierFlag];

      if (v14 == a4)
      {
        [(UIKeyShortcutHUDService *)self cancelScheduledHUDPresentationIfNeeded];
      }
    }
  }
}

- (void)keyShortcutHUDDidDismissWithResponse:(id)a3 toOverlayService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIKeyShortcutHUDService *)self overlayService];

  if (v8 == v7)
  {
    [(UIKeyShortcutHUDService *)self _removePresentationObserversIfNeeded];
    id v10 = [(UIKeyShortcutHUDService *)self session];
    [(UIKeyShortcutHUDService *)self setSession:0];
    if (v10)
    {
      uint64_t v11 = [v6 keyCommand];
      if (v11)
      {
        if ([v10 textEditingSessionWasTornDown])
        {
          [(UIKeyShortcutHUDService *)self setDeferredResponse:v6];
          [(UIKeyShortcutHUDService *)self setDeferredResponseSession:v10];
          v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v12 addObserver:self selector:sel__handleDeferredDismissalResponse_ name:@"UITextInputResponderIsReloadedNotification" object:0];

          dispatch_source_t v13 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
          [(UIKeyShortcutHUDService *)self setDeferredResponseTimer:v13];

          uint64_t v14 = [(UIKeyShortcutHUDService *)self deferredResponseTimer];
          dispatch_time_t v15 = dispatch_time(0, 500000000);
          dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);

          objc_initWeak(buf, self);
          long long v16 = [(UIKeyShortcutHUDService *)self deferredResponseTimer];
          uint64_t v20 = MEMORY[0x1E4F143A8];
          uint64_t v21 = 3221225472;
          double v22 = __81__UIKeyShortcutHUDService_keyShortcutHUDDidDismissWithResponse_toOverlayService___block_invoke;
          v23 = &unk_1E52D9960;
          objc_copyWeak(&v25, buf);
          v24 = self;
          dispatch_source_set_event_handler(v16, &v20);

          long long v17 = [(UIKeyShortcutHUDService *)self deferredResponseTimer];
          dispatch_activate(v17);

          objc_destroyWeak(&v25);
          objc_destroyWeak(buf);
        }
        else
        {
          [(UIKeyShortcutHUDService *)self _handleKeyCommandFromResponse:v6 withSession:v10];
        }
      }
    }
    else if (os_variant_has_internal_diagnostics())
    {
      long long v19 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_fault_impl(&dword_1853B0000, v19, OS_LOG_TYPE_FAULT, "Something has gone wrong, we got a dismissal response despite our presentation request being rejected", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      long long v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2617B0) + 8);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Something has gone wrong, we got a dismissal response despite our presentation request being rejected", (uint8_t *)buf, 2u);
      }
    }
    goto LABEL_14;
  }
  if (os_variant_has_internal_diagnostics())
  {
    id v10 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Something has gone very wrong, OverlayUI has told the HUD that it dismissed via a different overlay service than the one the HUD service uses", (uint8_t *)buf, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  int64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2617A8) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Something has gone very wrong, OverlayUI has told the HUD that it dismissed via a different overlay service than the one the HUD service uses", (uint8_t *)buf, 2u);
  }
LABEL_15:
}

void __81__UIKeyShortcutHUDService_keyShortcutHUDDidDismissWithResponse_toOverlayService___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [*(id *)(a1 + 32) deferredResponseTimer];
    [WeakRetained _handleDeferredDismissalResponse:v2];
  }
}

- (void)_handleDeferredDismissalResponse:(id)a3
{
  id v4 = [(UIKeyShortcutHUDService *)self deferredResponseTimer];

  if (v4)
  {
    id v5 = [(UIKeyShortcutHUDService *)self deferredResponseTimer];
    dispatch_source_cancel(v5);
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:@"UITextInputResponderIsReloadedNotification" object:0];

  id v7 = [(UIKeyShortcutHUDService *)self deferredResponse];
  id v8 = [(UIKeyShortcutHUDService *)self deferredResponseSession];
  int64_t v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__UIKeyShortcutHUDService__handleDeferredDismissalResponse___block_invoke;
  v12[3] = &unk_1E52DCB30;
  id v13 = v7;
  id v14 = v8;
  dispatch_time_t v15 = self;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlock:v12];

  [(UIKeyShortcutHUDService *)self setDeferredResponse:0];
  [(UIKeyShortcutHUDService *)self setDeferredResponseSession:0];
  [(UIKeyShortcutHUDService *)self setDeferredResponseTimer:0];
}

uint64_t __60__UIKeyShortcutHUDService__handleDeferredDismissalResponse___block_invoke(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    if (*(void *)(result + 40)) {
      return objc_msgSend(*(id *)(result + 48), "_handleKeyCommandFromResponse:withSession:");
    }
  }
  return result;
}

- (void)_handleKeyCommandFromResponse:(id)a3 withSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int64_t v9 = [v7 keyCommand];
  if (!v9)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"UIKeyShortcutHUDService.m", 870, @"The keyboard shortcut HUD was dismissed without a selected key command, but the non-nil key command code path was run in the HUD service" object file lineNumber description];
  }
  id v10 = [v7 pasteAuthenticationMessage];
  +[UIPasteboard _attemptAuthenticationWithMessage:v10];
  id v11 = [v8 configuration];
  v12 = [v11 model];
  id v13 = [v12 appKeyCommandForSelectedKeyCommand:v9];

  if (v13)
  {
    id v14 = [v8 configuration];
    dispatch_time_t v15 = [v14 model];
    long long v16 = [v15 originalTargetForSelectedKeyCommand:v9];

    if (([v13 isPlaceholder] & 1) == 0 && (objc_msgSend(v13, "attributes") & 1) == 0)
    {
      if (v16)
      {
        long long v17 = objc_msgSend((id)UIApp, "_unswizzledTargetInChainForAction:sender:", objc_msgSend(v13, "action"), v13);

        if (v16 == v17)
        {
          objc_msgSend((id)UIApp, "sendAction:to:from:forEvent:", objc_msgSend(v13, "action"), v16, v13, 0);
          if ([v13 upAction]) {
            objc_msgSend((id)UIApp, "sendAction:to:from:forEvent:", objc_msgSend(v13, "upAction"), 0, v13, 0);
          }
        }
      }
    }
LABEL_10:

    goto LABEL_14;
  }
  if (os_variant_has_internal_diagnostics())
  {
    long long v16 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "Something has gone very wrong, the app was asked to trigger a keyboard shortcut it didn't provide to the keyboard shortcut HUD", buf, 2u);
    }
    goto LABEL_10;
  }
  long long v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_handleKeyCommandFromResponse_withSession____s_category)
                     + 8);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Something has gone very wrong, the app was asked to trigger a keyboard shortcut it didn't provide to the keyboard shortcut HUD", v20, 2u);
  }
LABEL_14:
}

- (void)overlayServiceDidInvalidate:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyShortcutHUDService *)self overlayService];

  if (v5 == v4 && [(UIKeyShortcutHUDService *)self hudPresentationState] == 3)
  {
    id v7 = (id)objc_opt_new();
    id v6 = [(UIKeyShortcutHUDService *)self overlayService];
    [(UIKeyShortcutHUDService *)self keyShortcutHUDDidDismissWithResponse:v7 toOverlayService:v6];
  }
}

- (void)_addPresentationObserversIfNeeded
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    *(unsigned char *)&self->_flags |= 1u;
    int64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:UIApp];

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__applicationDidBeginIgnoringInteractionEvents_ name:0x1ED15D040 object:UIApp];

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__didTakeScreenshot_ name:@"UIApplicationUserDidTakeScreenshotNotification" object:0];

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__hardwareKeyboardAvailabilityChanged_ name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];
  }
}

- (void)_applicationWillResignActive:(id)a3
{
  id v4 = _UIKeyShortcutHUDLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to app resigning active", v6, 2u);
  }

  [(UIKeyShortcutHUDService *)self dismissOrCancelHUDPresentationIfNeeded];
  id v5 = [(UIKeyShortcutHUDService *)self modifierKeyListener];
  [v5 setCurrentModifierFlags:0];
}

- (void)_applicationDidBeginIgnoringInteractionEvents:(id)a3
{
  id v4 = _UIKeyShortcutHUDLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to app ignoring interaction events", v5, 2u);
  }

  [(UIKeyShortcutHUDService *)self dismissOrCancelHUDPresentationIfNeeded];
}

- (void)_didTakeScreenshot:(id)a3
{
  if ([(UIKeyShortcutHUDService *)self hudPresentationState] == 1)
  {
    id v4 = _UIKeyShortcutHUDLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to screenshot being taken", v5, 2u);
    }

    [(UIKeyShortcutHUDService *)self dismissOrCancelHUDPresentationIfNeeded];
  }
}

- (void)_hardwareKeyboardAvailabilityChanged:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  char v5 = [v4 _isHardwareKeyboardAvailable];

  if ((v5 & 1) == 0)
  {
    id v6 = _UIKeyShortcutHUDLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Requesting HUD dismissal due to hardware keyboard disconnecting", v7, 2u);
    }

    [(UIKeyShortcutHUDService *)self dismissOrCancelHUDPresentationIfNeeded];
  }
}

- (id)metricsForWindow:(id)a3
{
  int64_t v3 = [a3 windowScene];
  id v4 = [v3 coordinateSpace];
  [v4 bounds];

  char v5 = objc_opt_new();
  return v5;
}

- (BOOL)_canSummonHUDWithModifierFlag:(int64_t)a3
{
  return a3 == 0x100000 || a3 == 0x800000;
}

- (BOOL)_isHUDSupportedOnPlatform
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3) {
    BOOL v4 = v3 == 3;
  }
  else {
    BOOL v4 = 1;
  }
  return !v4;
}

- (BOOL)_isHUDAllowedToAppearForProcess
{
  return _UIApplicationProcessIsOverlayUI() ^ 1;
}

- (BOOL)_isHUDAllowedOverCurrentWindow
{
  v2 = +[UIWindow _applicationKeyWindow];
  uint64_t v3 = [v2 _windowHostingScene];
  char v4 = [v3 _sceneSessionRoleIsCarPlayOrNonInteractiveExternal];

  if (v4 & 1) != 0 || ([v2 _isHostedInAnotherProcess])
  {
    BOOL v5 = 0;
  }
  else
  {
    [v2 frame];
    BOOL v8 = vabdd_f64(v6, *(double *)(MEMORY[0x1E4F1DB30] + 8)) >= 0.00000011920929;
    BOOL v5 = vabdd_f64(v7, *MEMORY[0x1E4F1DB30]) >= 0.00000011920929 || v8;
  }

  return v5;
}

- (BOOL)_isHUDAllowedForConfiguration:(id)a3
{
  uint64_t v3 = [a3 presentedModifierFlag];
  if (v3 == 0x800000)
  {
    double v6 = (void *)UIApp;
    return [v6 _isGlobeKeyShortcutHUDEnabled];
  }
  else if (v3 == 0x100000)
  {
    char v4 = (void *)UIApp;
    return [v4 _areKeyboardHUDsEnabled];
  }
  else
  {
    return 0;
  }
}

- (BOOL)_isHUDAllowedForCurrentResponder
{
  v2 = +[UIResponder _globalFirstResponder];
  char v3 = [v2 _disallowsPresentationOfKeyboardShortcutHUD] ^ 1;

  return v3;
}

- (BOOL)_isHUDAllowedToBeScheduledForPresentationState:(int64_t)a3
{
  return !a3 || a3 == 3;
}

- (BOOL)_isHUDAllowedToBePresentedForPresentationState:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (_UIOverlayService)overlayService
{
  return self->_overlayService;
}

- (void)setOverlayService:(id)a3
{
}

- (void)setSession:(id)a3
{
}

- (void)setScheduledHUDTimer:(id)a3
{
}

- (_UIKeyShortcutHUDConfiguration)scheduledHUDConfiguration
{
  return self->_scheduledHUDConfiguration;
}

- (void)setScheduledHUDConfiguration:(id)a3
{
}

- (UIWindowScene)scheduledHUDKeyWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scheduledHUDKeyWindowScene);
  return (UIWindowScene *)WeakRetained;
}

- (void)setScheduledHUDKeyWindowScene:(id)a3
{
}

- (_UIKeyShortcutHUDDismissalResponse)deferredResponse
{
  return self->_deferredResponse;
}

- (void)setDeferredResponse:(id)a3
{
}

- (_UIKeyShortcutHUDClientSession)deferredResponseSession
{
  return self->_deferredResponseSession;
}

- (void)setDeferredResponseSession:(id)a3
{
}

- (OS_dispatch_source)deferredResponseTimer
{
  return self->_deferredResponseTimer;
}

- (void)setDeferredResponseTimer:(id)a3
{
}

- (NSArray)scheduledHUDHoverGestureRecognizers
{
  return self->_scheduledHUDHoverGestureRecognizers;
}

- (void)setScheduledHUDHoverGestureRecognizers:(id)a3
{
}

- (NSValue)scheduledHUDInitialPointerLocation
{
  return self->_scheduledHUDInitialPointerLocation;
}

- (void)setScheduledHUDInitialPointerLocation:(id)a3
{
}

- (UIPhysicalKeyboardEvent)lastKeyboardEvent
{
  return self->_lastKeyboardEvent;
}

- (void)setLastKeyboardEvent:(id)a3
{
}

- (UIKeyShortcutHUDMetricsProvider)metricsProvider
{
  return self->_metricsProvider;
}

- (void)setMetricsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsProvider, 0);
  objc_storeStrong((id *)&self->_lastKeyboardEvent, 0);
  objc_storeStrong((id *)&self->_scheduledHUDInitialPointerLocation, 0);
  objc_storeStrong((id *)&self->_scheduledHUDHoverGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_deferredResponseTimer, 0);
  objc_storeStrong((id *)&self->_deferredResponseSession, 0);
  objc_storeStrong((id *)&self->_deferredResponse, 0);
  objc_destroyWeak((id *)&self->_scheduledHUDKeyWindowScene);
  objc_storeStrong((id *)&self->_scheduledHUDConfiguration, 0);
  objc_storeStrong((id *)&self->_scheduledHUDTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_overlayService, 0);
  objc_storeStrong((id *)&self->_modifierKeyListener, 0);
}

@end