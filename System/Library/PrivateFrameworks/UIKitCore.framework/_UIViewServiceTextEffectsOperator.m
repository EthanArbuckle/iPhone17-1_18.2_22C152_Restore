@interface _UIViewServiceTextEffectsOperator
+ (BOOL)_shouldAddServiceOperator;
+ (id)XPCInterface;
+ (id)operatorWithRemoteViewControllerProxy:(id)a3 hostPID:(int)a4 sessionIdentifier:(id)a5;
+ (void)initialize;
- (NSUUID)_sessionIdentifier;
- (id)_queue;
- (id)invalidate;
- (unint64_t)_providerType;
- (void)__createHostedTextEffectsWithReplyHandler:(id)a3;
- (void)__hostDidEnterBackground;
- (void)__hostDidReceiveGestureDirection:(int64_t)a3 authenticationMessage:(id)a4;
- (void)__hostViewDidMoveToScreenWithNewHostingHandleReplyHandler:(id)a3;
- (void)__hostViewWillAppear:(BOOL)a3;
- (void)__hostViewWillDisappear:(BOOL)a3;
- (void)__hostWillEnterForeground;
- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3;
- (void)__setHostAllowedNotifications:(id)a3;
- (void)__setHostedViewReference:(CGRect)a3;
- (void)__setHostedViewSize:(CGSize)a3;
- (void)__setNextAutomaticOrderOutDirection:(int)a3 duration:(double)a4;
- (void)__setRemoteTextEffectsWindowMatchesLayerWithContextId:(unsigned int)a3 renderId:(unint64_t)a4;
- (void)__setSafeAreaInsets:(UIEdgeInsets)a3;
- (void)__setWindowOffset:(CGPoint)a3;
- (void)_associateHostedKeyboardWindowWithViewServiceSessionIfNeeded;
- (void)_associateHostedTextEffectsWindowWithViewServiceSessionIfNeeded;
- (void)_associateWindowWithViewServiceSession:(void *)a3 installingGestureIfNeeded:;
- (void)_disassociateHostedKeyboardWindowFromViewServiceSessionIfNeeded;
- (void)_disassociateTextEffectsWindowFromViewServiceSessionIfNeeded;
- (void)_disassociateWindowForGestureFromViewServiceSessionIfNeeded:(void *)a1;
- (void)_handleRemoteKeyboardActivityObserverGesture:(id)a3;
- (void)_handleTEWActivityObserverGesture:(id)a3;
- (void)_invalidateUnconditionallyThen:(id)a3;
- (void)_objc_initiateDealloc;
- (void)_prepareForDisconnectionUnconditionallyThen:(id)a3;
- (void)_reloadSafeInsets;
- (void)_removeTextEffectsWindowMatchAnimations;
- (void)_resetHostedViewSize;
- (void)_restoreInputViews;
- (void)_screenInterfaceOrientationDidChange:(id)a3;
- (void)_viewServiceHostWillEnterForeground:(id)a3;
- (void)_windowDidBecomeApplicationKey:(id)a3;
- (void)dealloc;
- (void)finishRotationFromInterfaceOrientation:(int64_t)a3;
- (void)forceSyncToStatusBarOrientation;
- (void)hostedWindow:(id)a3 didSetFirstResponder:(id)a4;
- (void)makeHostWindowKey;
- (void)performOnRelevantWindows:(id)a3;
- (void)rotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)setHostedWindow:(id)a3 disableAutomaticBehaviors:(BOOL)a4;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation _UIViewServiceTextEffectsOperator

- (id)_queue
{
  v2 = (void *)MEMORY[0x1E4F14428];
  id v3 = MEMORY[0x1E4F14428];
  return v2;
}

+ (id)operatorWithRemoteViewControllerProxy:(id)a3 hostPID:(int)a4 sessionIdentifier:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  v8 = (NSUUID *)a5;
  v9 = objc_alloc_init(_UIViewServiceTextEffectsOperator);
  id remoteViewControllerProxy = v9->_remoteViewControllerProxy;
  v9->_id remoteViewControllerProxy = v7;
  id v11 = v7;

  sessionIdentifier = v9->_sessionIdentifier;
  v9->_sessionIdentifier = v8;
  v13 = v8;

  v9->_wasInvalidated = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __101___UIViewServiceTextEffectsOperator_operatorWithRemoteViewControllerProxy_hostPID_sessionIdentifier___block_invoke;
  v24[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v24[4] = v9;
  uint64_t v14 = +[_UIAsyncInvocation invocationWithBlock:v24];
  prepareForDisconnectionInvocation = v9->_prepareForDisconnectionInvocation;
  v9->_prepareForDisconnectionInvocation = (_UIAsyncInvocation *)v14;

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101___UIViewServiceTextEffectsOperator_operatorWithRemoteViewControllerProxy_hostPID_sessionIdentifier___block_invoke_2;
  v23[3] = &__block_descriptor_40_e14_v16__0___v___8lu32l8;
  v23[4] = v9;
  uint64_t v16 = +[_UIAsyncInvocation invocationWithBlock:v23];
  invalidationInvocation = v9->_invalidationInvocation;
  v9->_invalidationInvocation = (_UIAsyncInvocation *)v16;

  v18 = [(id)objc_opt_class() XPCInterface];
  v19 = [v18 exportedInterface];
  v20 = [v19 protocol];
  v21 = +[_UIViewServiceUIBehaviorProxy proxyWrappingExportedObject:v9 forCommunicationWithPID:v6 exportedProtocol:v20];

  return v21;
}

+ (BOOL)_shouldAddServiceOperator
{
  return 1;
}

- (void)_prepareForDisconnectionUnconditionallyThen:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81___UIViewServiceTextEffectsOperator__prepareForDisconnectionUnconditionallyThen___block_invoke;
  v6[3] = &unk_1E52DA160;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_invalidateUnconditionallyThen:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIViewServiceTextEffectsOperator *)self _queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68___UIViewServiceTextEffectsOperator__invalidateUnconditionallyThen___block_invoke;
  v7[3] = &unk_1E530D828;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _class_setCustomDeallocInitiation();
  }
}

- (void)_objc_initiateDealloc
{
  id v3 = [(_UIViewServiceTextEffectsOperator *)self invalidate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58___UIViewServiceTextEffectsOperator__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v4[4] = self;
  [v3 whenCompleteDo:v4];
}

- (void)dealloc
{
  v6[4] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = 0x1ED180300;
  v6[1] = @"_UIWindowDidBecomeApplicationKeyNotification";
  v6[2] = @"UITextInputResponderIsReloadedNotification";
  v6[3] = @"_UIScreenInterfaceOrientationDidChangeNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, self->_allowedNotifications);
  v5.receiver = self;
  v5.super_class = (Class)_UIViewServiceTextEffectsOperator;
  [(_UIViewServiceTextEffectsOperator *)&v5 dealloc];
}

- (void)makeHostWindowKey
{
  if (!self->_isRestoringInputViews)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    [WeakRetained makeKeyWindow];

    id v4 = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_super v5 = [v4 screen];
    uint64_t v6 = [v5 _userInterfaceIdiom];

    if (v6 == 3)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_hostedWindow);
      [v7 _makeExternalKeyWindow];
    }
    [(_UIViewServiceTextEffectsOperator *)self forceSyncToStatusBarOrientation];
  }
  double x = self->_windowOrigin.x;
  double y = self->_windowOrigin.y;
  v10 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
  objc_msgSend(v10, "setHostedViewOrigin:", x, y);

  [(_UIViewServiceTextEffectsOperator *)self _reloadSafeInsets];
}

- (void)hostedWindow:(id)a3 didSetFirstResponder:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (!*(_WORD *)&self->_didResignForDisappear)
  {
    objc_storeStrong((id *)&_activeTextEffectsOperator, self);
    [(_UIViewServiceTextEffectsOperator *)self makeHostWindowKey];
  }
}

- (void)__createHostedTextEffectsWithReplyHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void, void *))a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServices", &_MergedGlobals_1303);
  id v6 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v7 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v8, "CreateHostedTextEffects", "", buf, 2u);
    }
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  v10 = (void *)_UISetCurrentFallbackEnvironment(WeakRetained);

  id v11 = +[UIWindowScene _keyWindowScene]();
  v12 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v11];
  [v12 setUseHostedInstance:1];

  v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 postNotificationName:@"UITextEffectsWindowIsHostedNotification" object:0];
  [(_UIViewServiceTextEffectsOperator *)self _associateHostedTextEffectsWindowWithViewServiceSessionIfNeeded];
  [v13 addObserver:self selector:sel__windowDidBecomeApplicationKey_ name:@"_UIWindowDidBecomeApplicationKeyNotification" object:0];
  [v13 addObserver:self selector:sel__inputResponderReloaded_ name:@"UITextInputResponderIsReloadedNotification" object:0];
  uint64_t v14 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
  v15 = [v14 _hostingHandle];
  uint64_t v16 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v17 = [v16 prepareForHostedWindowWithScene:v11];
  v18 = [v17 _hostingHandle];
  v4[2](v4, v15, 0, v18);

  [v13 addObserver:self selector:sel__viewServiceHostWillEnterForeground_ name:0x1ED180300 object:0];
  _UIRestorePreviousFallbackEnvironment(v10);
  unint64_t v19 = __UILogGetCategoryCachedImpl("ViewServices", &qword_1EB264E00);
  v20 = *(id *)(v19 + 8);
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(*(os_log_t *)(v19 + 8), self);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v22 = v21;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v20, OS_SIGNPOST_INTERVAL_END, v22, "CreateHostedTextEffects", "", v23, 2u);
    }
  }
}

- (void)__hostViewDidMoveToScreenWithNewHostingHandleReplyHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void *))a3;
  [(_UIViewServiceTextEffectsOperator *)self _disassociateTextEffectsWindowFromViewServiceSessionIfNeeded];
  [(_UIViewServiceTextEffectsOperator *)self _disassociateHostedKeyboardWindowFromViewServiceSessionIfNeeded];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  id v19 = [WeakRetained windowScene];

  id v6 = [v19 screen];
  uint64_t v7 = [v6 _userInterfaceIdiom];

  +[_UIViewServiceSessionActivityRecord activityRecordForProvider:userInterfaceIdiom:]((uint64_t)_UIViewServiceSessionActivityRecord, self, v7);
  os_signpost_id_t v8 = (_UIViewServiceSessionActivityRecord *)objc_claimAutoreleasedReturnValue();
  sessionActivityRecord = self->_sessionActivityRecord;
  self->_sessionActivityRecord = v8;

  [(_UIViewServiceTextEffectsOperator *)self _associateHostedTextEffectsWindowWithViewServiceSessionIfNeeded];
  [(_UIViewServiceTextEffectsOperator *)self _associateHostedKeyboardWindowWithViewServiceSessionIfNeeded];
  v10 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v19];
  id v11 = [v10 _hostingHandle];

  v12 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v13 = [v12 prepareForHostedWindowWithScene:v19];
  uint64_t v14 = [v13 _hostingHandle];

  v4[2](v4, v11, v14);
  id v15 = objc_loadWeakRetained((id *)&self->_hostedWindow);
  uint64_t v16 = [v15 screen];
  uint64_t v17 = [v16 _interfaceOrientation];

  if (!v17)
  {
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:self selector:sel__screenInterfaceOrientationDidChange_ name:@"_UIScreenInterfaceOrientationDidChangeNotification" object:0];
  }
}

- (void)_screenInterfaceOrientationDidChange:(id)a3
{
  p_hostedWindow = &self->_hostedWindow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  id v6 = [WeakRetained screen];
  uint64_t v7 = [v6 _interfaceOrientation];

  if (v7)
  {
    id v11 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
    id v8 = objc_loadWeakRetained((id *)p_hostedWindow);
    v9 = [v8 screen];
    objc_msgSend(v11, "_setWindowInterfaceOrientation:", objc_msgSend(v9, "_interfaceOrientation"));

    [v11 _sceneBoundsDidChange];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 removeObserver:self name:@"_UIScreenInterfaceOrientationDidChangeNotification" object:0];
  }
}

- (void)__setWindowOffset:(CGPoint)a3
{
  self->_windowOrigin = a3;
  if (!self->_localVCDisablesAutomaticBehaviors && _activeTextEffectsOperator == (void)self)
  {
    objc_super v5 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
    [v5 hostedViewOrigin];
    double v7 = floor(v6);
    double v9 = floor(v8);
    double v10 = floor(self->_windowOrigin.x);
    double v11 = floor(self->_windowOrigin.y);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55___UIViewServiceTextEffectsOperator___setWindowOffset___block_invoke;
    v14[3] = &unk_1E52DAE18;
    v14[4] = self;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v14];
    if (v7 != v10 || v9 != v11)
    {
      v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 postNotificationName:@"UITextEffectsWindowOffsetDidChangeNotification" object:0];
    }
  }
}

- (void)_reloadSafeInsets
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54___UIViewServiceTextEffectsOperator__reloadSafeInsets__block_invoke;
  v2[3] = &unk_1E52DAE18;
  v2[4] = self;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v2];
}

- (void)__setSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_safeAreaInsets = a3;
  if (_activeTextEffectsOperator) {
    BOOL v3 = _activeTextEffectsOperator == (void)self;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    [(_UIViewServiceTextEffectsOperator *)self _reloadSafeInsets];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"UITextEffectsWindowSafeAreaInsetsDidChangeNotification" object:0];
  }
}

- (void)_resetHostedViewSize
{
  id v3 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0 forViewService:1];
  objc_msgSend(v3, "setHostedViewSize:", self->_hostedViewSize.width, self->_hostedViewSize.height);
  [v3 _sceneBoundsDidChange];
}

- (void)__setHostedViewSize:(CGSize)a3
{
  self->_hostedViewSize = a3;
  [(_UIViewServiceTextEffectsOperator *)self _resetHostedViewSize];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UITextEffectsWindowHostedViewSizeDidChangeNotification" object:0];
}

- (void)__setHostedViewReference:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0 forViewService:1];
  objc_msgSend(v7, "setHostedViewReference:", x, y, width, height);
}

- (void)__setNextAutomaticOrderOutDirection:(int)a3 duration:(double)a4
{
  if (!self->_localVCDisablesAutomaticBehaviors)
  {
    uint64_t v5 = *(void *)&a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    id v7 = [WeakRetained windowScene];
    id v8 = [v7 keyboardSceneDelegate];

    [v8 setNextAutomaticOrderInDirection:v5 duration:a4];
  }
}

- (void)__setHostAllowedNotifications:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = self->_allowedNotifications;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 removeObserver:self name:*(void *)(*((void *)&v21 + 1) + 8 * i) object:0];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  objc_storeStrong((id *)&self->_allowedNotifications, a3);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = self->_allowedNotifications;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__sendNotification_, *(void *)(*((void *)&v17 + 1) + 8 * j), 0, (void)v17);
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)__hostDidEnterBackground
{
  if (!self->_wasInvalidated && !self->_localVCDisablesAutomaticBehaviors && _activeTextEffectsOperator == (void)self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    id v5 = [WeakRetained windowScene];
    id v8 = [v5 keyboardSceneDelegate];

    double v6 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v8 _preserveInputViewsWithId:v6 animated:0];

    id v7 = (void *)_activeTextEffectsOperator;
    _activeTextEffectsOperator = 0;

    self->_canRestoreInputViews = 0;
  }
}

- (void)_restoreInputViews
{
  if (self->_canRestoreInputViews)
  {
    self->_isRestoringInputViews = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    id v4 = [WeakRetained windowScene];
    id v6 = [v4 keyboardSceneDelegate];

    id v5 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v6 _restoreInputViewsWithId:v5 animated:0];

    self->_isRestoringInputViews = 0;
  }
  else
  {
    self->_canRestoreInputViews = 1;
  }
}

- (void)__hostWillEnterForeground
{
  if (!self->_wasInvalidated && !self->_localVCDisablesAutomaticBehaviors)
  {
    if (_activeTextEffectsOperator) {
      BOOL v3 = _activeTextEffectsOperator == (void)self;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3) {
      self->_canRestoreInputViews = 0;
    }
    double x = self->_windowOrigin.x;
    double y = self->_windowOrigin.y;
    id v6 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:0];
    objc_msgSend(v6, "setHostedViewOrigin:", x, y);

    [(_UIViewServiceTextEffectsOperator *)self _reloadSafeInsets];
    [(_UIViewServiceTextEffectsOperator *)self _resetHostedViewSize];
    [(_UIViewServiceTextEffectsOperator *)self _restoreInputViews];
    objc_storeStrong((id *)&_activeTextEffectsOperator, self);
  }
}

- (void)_viewServiceHostWillEnterForeground:(id)a3
{
  if (!self->_localVCDisablesAutomaticBehaviors) {
    [(_UIViewServiceTextEffectsOperator *)self _restoreInputViews];
  }
}

- (void)__hostViewWillAppear:(BOOL)a3
{
  if (!self->_wasInvalidated && !self->_localVCDisablesAutomaticBehaviors)
  {
    if (self->_didResignForDisappear)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
      id v5 = [WeakRetained firstResponder];
      [v5 reloadInputViews];

      self->_didResignForDisappear = 0;
    }
    objc_storeStrong((id *)&_activeTextEffectsOperator, self);
  }
}

- (void)__hostViewWillDisappear:(BOOL)a3
{
  if (!self->_wasInvalidated && !self->_localVCDisablesAutomaticBehaviors && _activeTextEffectsOperator == (void)self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
    UIKeyboardSafariDepresentForViewService();

    id v6 = objc_loadWeakRetained((id *)&self->_hostedWindow);
    id v7 = [v6 windowScene];
    id v10 = [v7 keyboardSceneDelegate];

    id v8 = [v10 responder];
    [v8 resignFirstResponder];

    [v10 _reloadInputViewsForResponder:0];
    self->_didResignForDisappear = 1;
    uint64_t v9 = (void *)_activeTextEffectsOperator;
    _activeTextEffectsOperator = 0;
  }
}

- (void)__setRemoteTextEffectsWindowMatchesLayerWithContextId:(unsigned int)a3 renderId:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v28[4] = *MEMORY[0x1E4F143B8];
  [(_UIViewServiceTextEffectsOperator *)self _removeTextEffectsWindowMatchAnimations];
  if (v5)
  {
    if (a4)
    {
      id v7 = objc_opt_new();
      [v7 setSourceContextId:v5];
      [v7 setSourceLayerRenderId:a4];
      [v7 setDuration:INFINITY];
      [v7 setUsesNormalizedCoordinates:1];
      v27[0] = 0;
      v27[1] = 0;
      id v8 = [MEMORY[0x1E4F29238] valueWithBytes:v27 objCType:"{CGPoint=dd}"];
      v28[0] = v8;
      long long v26 = xmmword_186B8C800;
      uint64_t v9 = [MEMORY[0x1E4F29238] valueWithBytes:&v26 objCType:"{CGPoint=dd}"];
      v28[1] = v9;
      __asm { FMOV            V0.2D, #1.0 }
      long long v25 = _Q0;
      uint64_t v15 = [MEMORY[0x1E4F29238] valueWithBytes:&v25 objCType:"{CGPoint=dd}"];
      v28[2] = v15;
      long long v24 = xmmword_186B89740;
      uint64_t v16 = [MEMORY[0x1E4F29238] valueWithBytes:&v24 objCType:"{CGPoint=dd}"];
      v28[3] = v16;
      long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
      [v7 setSourcePoints:v17];

      long long v18 = objc_opt_new();
      [v18 setSourceContextId:v5];
      [v18 setSourceLayerRenderId:a4];
      [v18 setKeyPath:@"cornerRadius"];
      [v18 setDuration:INFINITY];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
      long long v20 = [WeakRetained windowScene];
      long long v21 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v20];

      long long v22 = [v21 layer];
      [v22 addAnimation:v7 forKey:@"matchMove"];

      long long v23 = [v21 layer];
      [v23 addAnimation:v18 forKey:@"matchCornerRadius"];

      [v21 setClipsToBounds:1];
    }
  }
}

- (void)_removeTextEffectsWindowMatchAnimations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  BOOL v3 = [WeakRetained windowScene];
  id v5 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v3];

  id v4 = [v5 layer];
  [v4 removeAnimationForKey:@"matchMove"];
  [v4 removeAnimationForKey:@"matchCornerRadius"];
  [v5 setClipsToBounds:0];
}

- (void)__hostDidReceiveGestureDirection:(int64_t)a3 authenticationMessage:(id)a4
{
  id v6 = a4;
  uint64_t v9 = [[_UIProductivityGestureAction alloc] initWithGestureDirection:a3 authenticationMessage:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  id v8 = [WeakRetained windowScene];
  [(_UIProductivityGestureAction *)v9 _handleActionForWindowScene:v8];
}

- (void)__prepareForDisconnectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIAsyncInvocation *)self->_prepareForDisconnectionInvocation invoke];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84___UIViewServiceTextEffectsOperator___prepareForDisconnectionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E52DA040;
  id v8 = v4;
  id v6 = v4;
  [v5 whenCompleteDo:v7];
}

- (id)invalidate
{
  return [(_UIAsyncInvocation *)self->_invalidationInvocation invoke];
}

+ (id)XPCInterface
{
  if (qword_1EB264E08 != -1) {
    dispatch_once(&qword_1EB264E08, &__block_literal_global_620);
  }
  v2 = (void *)qword_1EB264E10;
  return v2;
}

- (void)forceSyncToStatusBarOrientation
{
  p_hostedWindow = &self->_hostedWindow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  id v5 = [WeakRetained windowScene];
  id v6 = [v5 keyboardSceneDelegate];

  id v7 = objc_loadWeakRetained((id *)p_hostedWindow);
  id v8 = [v7 windowScene];
  uint64_t v9 = [v8 interfaceOrientation];

  id v10 = [v6 containerWindow];
  double v11 = [v10 rootViewController];
  uint64_t v12 = [v11 _lastKnownInterfaceOrientation];

  if (v9 != v12)
  {
    [(_UIViewServiceTextEffectsOperator *)self willRotateToInterfaceOrientation:v9 duration:0.0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68___UIViewServiceTextEffectsOperator_forceSyncToStatusBarOrientation__block_invoke;
    v13[3] = &unk_1E530DC08;
    v13[4] = self;
    v13[5] = v9;
    [(_UIViewServiceTextEffectsOperator *)self performOnRelevantWindows:v13];
    [(_UIViewServiceTextEffectsOperator *)self rotateToInterfaceOrientation:v9 duration:0.0];
    [(_UIViewServiceTextEffectsOperator *)self finishRotationFromInterfaceOrientation:v12];
  }
}

- (void)setHostedWindow:(id)a3 disableAutomaticBehaviors:(BOOL)a4
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);

  if (WeakRetained != v6)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_hostedWindow);
    objc_msgSend(v8, "set_hostedWindowDelegate:", 0);

    id v9 = objc_storeWeak((id *)&self->_hostedWindow, v6);
    objc_msgSend(v6, "set_hostedWindowDelegate:", self);
  }
  self->_localVCDisablesAutomaticBehaviors = a4;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79___UIViewServiceTextEffectsOperator_setHostedWindow_disableAutomaticBehaviors___block_invoke;
  aBlock[3] = &unk_1E52D9960;
  objc_copyWeak(&v12, &location);
  aBlock[4] = self;
  id v10 = (void (**)(void))_Block_copy(aBlock);
  if (pthread_main_np() == 1) {
    v10[2](v10);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)performOnRelevantWindows:(id)a3
{
  uint64_t v16 = (void (**)(id, void *))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  id v5 = [WeakRetained windowScene];
  id v6 = [v5 keyboardSceneDelegate];

  id v7 = [v6 containerWindow];
  v16[2](v16, v7);

  id v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v9 = [v8 keyboardWindow];
  v16[2](v16, v9);

  if (+[UIKeyboard usesInputSystemUI])
  {
    id v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v11 = [v10 remoteInputViewHost];
    id v12 = [v11 inputViewWindow];
    v16[2](v16, v12);

    uint64_t v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v14 = [v13 remoteInputViewHost];
    uint64_t v15 = [v14 assistantViewWindow];
    v16[2](v16, v15);
  }
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79___UIViewServiceTextEffectsOperator_willRotateToInterfaceOrientation_duration___block_invoke;
  v4[3] = &__block_descriptor_48_e18_v16__0__UIWindow_8l;
  v4[4] = a3;
  *(double *)&void v4[5] = a4;
  [(_UIViewServiceTextEffectsOperator *)self performOnRelevantWindows:v4];
}

- (void)rotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75___UIViewServiceTextEffectsOperator_rotateToInterfaceOrientation_duration___block_invoke;
  v4[3] = &__block_descriptor_48_e18_v16__0__UIWindow_8l;
  v4[4] = a3;
  *(double *)&void v4[5] = a4;
  [(_UIViewServiceTextEffectsOperator *)self performOnRelevantWindows:v4];
}

- (void)finishRotationFromInterfaceOrientation:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76___UIViewServiceTextEffectsOperator_finishRotationFromInterfaceOrientation___block_invoke;
  v3[3] = &__block_descriptor_40_e18_v16__0__UIWindow_8l;
  v3[4] = a3;
  [(_UIViewServiceTextEffectsOperator *)self performOnRelevantWindows:v3];
}

- (unint64_t)_providerType
{
  return 1;
}

- (NSUUID)_sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)_windowDidBecomeApplicationKey:(id)a3
{
  id v7 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v7;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);

  if (WeakRetained == v5)
  {
    [(_UIViewServiceTextEffectsOperator *)self _associateHostedTextEffectsWindowWithViewServiceSessionIfNeeded];
    [(_UIViewServiceTextEffectsOperator *)self _associateHostedKeyboardWindowWithViewServiceSessionIfNeeded];
  }
  else
  {
    [(_UIViewServiceTextEffectsOperator *)self _disassociateTextEffectsWindowFromViewServiceSessionIfNeeded];
    [(_UIViewServiceTextEffectsOperator *)self _disassociateHostedKeyboardWindowFromViewServiceSessionIfNeeded];
  }
}

- (void)_associateWindowWithViewServiceSession:(void *)a3 installingGestureIfNeeded:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (!v6)
    {
      double v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__associateWindowWithViewServiceSession_installingGestureIfNeeded_, a1, @"UIViewServiceTextEffectsOperator.m", 669, @"Invalid parameter not satisfying: %@", @"observerGesture" object file lineNumber description];
    }
    -[_UIViewServiceSessionActivityRecord associateHostedWindow:](a1[21], v5);
    id v8 = [v5 gestureRecognizers];
    char v9 = [v8 containsObject:v7];

    if ((v9 & 1) == 0)
    {
      [v5 addGestureRecognizer:v7];
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &_associateWindowWithViewServiceSession_installingGestureIfNeeded____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        id v12 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          uint64_t v13 = NSString;
          uint64_t v14 = a1;
          uint64_t v15 = (objc_class *)objc_opt_class();
          uint64_t v16 = NSStringFromClass(v15);
          long long v17 = [v13 stringWithFormat:@"<%@: %p>", v16, v14];

          id v18 = v17;
          long long v19 = v5;
          long long v20 = NSString;
          long long v21 = (objc_class *)objc_opt_class();
          long long v22 = NSStringFromClass(v21);
          long long v23 = [v20 stringWithFormat:@"<%@: %p>", v22, v19];

          uint64_t v24 = v14[2];
          *(_DWORD *)buf = 138412802;
          id v26 = v18;
          __int16 v27 = 2112;
          v28 = v23;
          __int16 v29 = 2112;
          uint64_t v30 = v24;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Installed activity gesture for operator: %@; on window: %@; sessionIdentifier: %@",
            buf,
            0x20u);
        }
      }
    }
  }
}

- (void)_disassociateWindowForGestureFromViewServiceSessionIfNeeded:(void *)a1
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    id v3 = a2;
    id v4 = [v3 view];
    id v5 = [v4 _window];

    [v5 removeGestureRecognizer:v3];
    id v6 = *(id *)(__UILogGetCategoryCachedImpl("ViewServiceSessionActivityTracking", &_disassociateWindowForGestureFromViewServiceSessionIfNeeded____s_category)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = NSString;
      id v8 = a1;
      char v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      double v11 = [v7 stringWithFormat:@"<%@: %p>", v10, v8];

      id v12 = v11;
      id v13 = v5;
      if (v13)
      {
        uint64_t v14 = NSString;
        uint64_t v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        long long v17 = [v14 stringWithFormat:@"<%@: %p>", v16, v13];
      }
      else
      {
        long long v17 = @"(nil)";
      }

      uint64_t v18 = v8[2];
      *(_DWORD *)buf = 138412802;
      id v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v17;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Uninstalled activity gesture for operator: %@; on window: %@; sessionIdentifier: %@",
        buf,
        0x20u);
    }
    long long v19 = (void *)a1[22];
    a1[22] = 0;

    uint64_t v20 = a1[21];
    if (v20 && !*(unsigned char *)(v20 + 16))
    {
      if (v5) {
        -[_UIViewServiceSessionActivityRecord disassociateHostedWindow:](v20, v5);
      }
    }
  }
}

- (void)_associateHostedTextEffectsWindowWithViewServiceSessionIfNeeded
{
  if (pthread_main_np() != 1)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"UIViewServiceTextEffectsOperator.m" lineNumber:698 description:@"Call must be made on main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  id v16 = [WeakRetained windowScene];

  id v5 = v16;
  if (v16)
  {
    id v6 = [v16 keyWindow];
    id v7 = objc_loadWeakRetained((id *)&self->_hostedWindow);
    BOOL v8 = v6 != v7;

    id v5 = v16;
  }
  else
  {
    BOOL v8 = 1;
  }
  char v9 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v5];
  id v10 = v9;
  if (v9 && (([v9 _isHostedInAnotherProcess] ^ 1 | v8) & 1) == 0)
  {
    hostedTEWActivityObserverGesture = self->_hostedTEWActivityObserverGesture;
    if (!hostedTEWActivityObserverGesture)
    {
      id v12 = [NSString stringWithFormat:@"%@-%p", @"ViewService-HostedTEW-Observer", self];
      id v13 = (_UITouchesBeganObserverGestureRecognizer *)-[_UITouchesBeganObserverGestureRecognizer initWithTarget:action:name:]([_UITouchesBeganObserverGestureRecognizer alloc], (uint64_t)self, (uint64_t)sel__handleTEWActivityObserverGesture_, (uint64_t)v12);
      uint64_t v14 = self->_hostedTEWActivityObserverGesture;
      self->_hostedTEWActivityObserverGesture = v13;

      hostedTEWActivityObserverGesture = self->_hostedTEWActivityObserverGesture;
    }
    -[_UIViewServiceTextEffectsOperator _associateWindowWithViewServiceSession:installingGestureIfNeeded:]((uint64_t *)self, v10, hostedTEWActivityObserverGesture);
  }
}

- (void)_disassociateTextEffectsWindowFromViewServiceSessionIfNeeded
{
  if (pthread_main_np() != 1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIViewServiceTextEffectsOperator.m" lineNumber:720 description:@"Call must be made on main thread"];
  }
  -[_UIViewServiceTextEffectsOperator _disassociateWindowForGestureFromViewServiceSessionIfNeeded:](self, self->_hostedTEWActivityObserverGesture);
  hostedTEWActivityObserverGesture = self->_hostedTEWActivityObserverGesture;
  self->_hostedTEWActivityObserverGesture = 0;
}

- (void)_associateHostedKeyboardWindowWithViewServiceSessionIfNeeded
{
  if (pthread_main_np() != 1)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"UIViewServiceTextEffectsOperator.m" lineNumber:726 description:@"Call must be made on main thread"];
  }
  id v13 = +[UIWindow _applicationKeyWindow];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);

  id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v6 = [v5 keyboardWindow];

  if (!+[UIKeyboard usesInputSystemUI])
  {
    if (+[_UIRemoteKeyboards enabled])
    {
      id v7 = objc_loadWeakRetained((id *)&self->_hostedWindow);
      if (v7)
      {

        if (WeakRetained == v13)
        {
          if (v6)
          {
            hostedRemoteKeyboardWindowActivityObserverGesture = self->_hostedRemoteKeyboardWindowActivityObserverGesture;
            if (!hostedRemoteKeyboardWindowActivityObserverGesture)
            {
              char v9 = [NSString stringWithFormat:@"%@-%p", @"ViewService-HostedRKW-Observer", self];
              id v10 = (_UITouchesBeganObserverGestureRecognizer *)-[_UITouchesBeganObserverGestureRecognizer initWithTarget:action:name:]([_UITouchesBeganObserverGestureRecognizer alloc], (uint64_t)self, (uint64_t)sel__handleRemoteKeyboardActivityObserverGesture_, (uint64_t)v9);
              double v11 = self->_hostedRemoteKeyboardWindowActivityObserverGesture;
              self->_hostedRemoteKeyboardWindowActivityObserverGesture = v10;

              hostedRemoteKeyboardWindowActivityObserverGesture = self->_hostedRemoteKeyboardWindowActivityObserverGesture;
            }
            -[_UIViewServiceTextEffectsOperator _associateWindowWithViewServiceSession:installingGestureIfNeeded:]((uint64_t *)self, v6, hostedRemoteKeyboardWindowActivityObserverGesture);
          }
        }
      }
    }
  }
}

- (void)_disassociateHostedKeyboardWindowFromViewServiceSessionIfNeeded
{
  if (pthread_main_np() != 1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIViewServiceTextEffectsOperator.m" lineNumber:753 description:@"Call must be made on main thread"];
  }
  -[_UIViewServiceTextEffectsOperator _disassociateWindowForGestureFromViewServiceSessionIfNeeded:](self, self->_hostedRemoteKeyboardWindowActivityObserverGesture);
  hostedRemoteKeyboardWindowActivityObserverGesture = self->_hostedRemoteKeyboardWindowActivityObserverGesture;
  self->_hostedRemoteKeyboardWindowActivityObserverGesture = 0;
}

- (void)_handleTEWActivityObserverGesture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostedWindow);
  id v5 = [WeakRetained windowScene];
  char v9 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v5];

  id v6 = v9;
  if (v9)
  {
    int v7 = [v9 _isHostedInAnotherProcess];
    id v6 = v9;
    if (v7)
    {
      if (self->_sessionActivityRecord)
      {
        BOOL v8 = +[_UIActiveViewServiceSessionTracker sharedTracker];
        -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v8, 4uLL, v9, (__CFString *)self, (uint64_t)self->_sessionActivityRecord);

        id v6 = v9;
      }
    }
  }
}

- (void)_handleRemoteKeyboardActivityObserverGesture:(id)a3
{
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v7 = [v4 keyboardWindow];

  id v5 = v7;
  if (v7 && self->_sessionActivityRecord)
  {
    id v6 = +[_UIActiveViewServiceSessionTracker sharedTracker];
    -[_UIActiveViewServiceSessionTracker handleViewServiceActivity:inHostedWindow:fromProvider:forSessionActivityRecord:](v6, 4uLL, v7, (__CFString *)self, (uint64_t)self->_sessionActivityRecord);

    id v5 = v7;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedRemoteKeyboardWindowActivityObserverGesture, 0);
  objc_storeStrong((id *)&self->_hostedTEWActivityObserverGesture, 0);
  objc_storeStrong((id *)&self->_sessionActivityRecord, 0);
  objc_storeStrong((id *)&self->_allowedNotifications, 0);
  objc_destroyWeak((id *)&self->_hostedWindow);
  objc_storeStrong((id *)&self->_invalidationInvocation, 0);
  objc_storeStrong((id *)&self->_prepareForDisconnectionInvocation, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong(&self->_remoteViewControllerProxy, 0);
}

@end