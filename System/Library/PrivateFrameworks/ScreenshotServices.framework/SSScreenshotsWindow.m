@interface SSScreenshotsWindow
+ (BOOL)_isSecure;
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)_shouldControlAutorotation;
- (SSScreenshotsWindow)init;
- (SSScreenshotsWindowDelegate)delegate;
- (id)_hostViewControllerIfExists;
- (void)_deviceBacklightChanged:(unint64_t)a3;
- (void)_deviceLockStateChanged:(unint64_t)a3;
- (void)_dismiss;
- (void)_prepareRemoteViewControllerWithCompletionHandler:(id)a3;
- (void)activateRemoteViewControllerIfAppropriate;
- (void)activeInterfaceOrientationObserver:(id)a3 observedChangeToInterfaceOrientation:(int64_t)a4 withDuration:(double)a5;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation SSScreenshotsWindow

- (void)activeInterfaceOrientationObserver:(id)a3 observedChangeToInterfaceOrientation:(int64_t)a4 withDuration:(double)a5
{
  v8 = [(SSScreenshotsWindow *)self _hostViewControllerIfExists];

  if (v8) {
    [(SSScreenshotsWindow *)self _setRotatableViewOrientation:a4 duration:a5];
  }
  self->_lastActiveInterfaceOrientation = a4;
}

- (id)_hostViewControllerIfExists
{
  v2 = [(SSScreenshotsWindowRootViewController *)self->_root managedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (SSScreenshotsWindow)init
{
  v21.receiver = self;
  v21.super_class = (Class)SSScreenshotsWindow;
  v2 = [(SSScreenshotsWindow *)&v21 init];
  [(SSScreenshotsWindow *)v2 setHidden:0];
  id v3 = [(SSScreenshotsWindow *)v2 layer];
  [v3 setDisableUpdateMask:2];

  [(SSScreenshotsWindow *)v2 setOpaque:0];
  v4 = [MEMORY[0x263F1C550] clearColor];
  [(SSScreenshotsWindow *)v2 setBackgroundColor:v4];

  [(SSScreenshotsWindow *)v2 setWindowLevel:*MEMORY[0x263F1D5C0]];
  [(SSScreenshotsWindow *)v2 _setWindowControlsStatusBarOrientation:0];
  v5 = objc_alloc_init(SSScreenshotsWindowRootViewController);
  root = v2->_root;
  v2->_root = v5;

  [(SSScreenshotsWindow *)v2 setRootViewController:v2->_root];
  v7 = objc_alloc_init(SSActiveInterfaceOrientationObserver);
  activeInterfaceOrientationObserver = v2->_activeInterfaceOrientationObserver;
  v2->_activeInterfaceOrientationObserver = v7;

  [(SSActiveInterfaceOrientationObserver *)v2->_activeInterfaceOrientationObserver setDelegate:v2];
  [(SSActiveInterfaceOrientationObserver *)v2->_activeInterfaceOrientationObserver beginObserving];
  v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.screenshotservices.notifyqueue", v9);
  notifyQueue = v2->_notifyQueue;
  v2->_notifyQueue = (OS_dispatch_queue *)v10;

  objc_initWeak(&location, v2);
  v12 = v2->_notifyQueue;
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  v17 = __27__SSScreenshotsWindow_init__block_invoke;
  v18 = &unk_2644EDB08;
  objc_copyWeak(&v19, &location);
  dispatch_async(v12, &v15);
  v13 = objc_msgSend(MEMORY[0x263F1C550], "purpleColor", v15, v16, v17, v18);
  SSApplyDebuggingCustomizationsToViewIfAppropriate(v2, v13, 10.0);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v2;
}

void __27__SSScreenshotsWindow_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    *((_DWORD *)WeakRetained + 232) = -1;
    v4 = (const char *)*MEMORY[0x263F796A8];
    v5 = WeakRetained[115];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __27__SSScreenshotsWindow_init__block_invoke_2;
    handler[3] = &unk_2644EDAE0;
    v6 = WeakRetained;
    v12 = v6;
    objc_copyWeak(&v13, v1);
    notify_register_dispatch(v4, (int *)v3 + 232, v5, handler);
    v6[233] = -1;
    v7 = v3[115];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __27__SSScreenshotsWindow_init__block_invoke_4;
    v8[3] = &unk_2644EDAE0;
    v9 = v6;
    objc_copyWeak(&v10, v1);
    notify_register_dispatch("com.apple.backboardd.backlight.changed", v6 + 233, v7, v8);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&v13);
  }
}

void __27__SSScreenshotsWindow_init__block_invoke_2(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 928), &state64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__SSScreenshotsWindow_init__block_invoke_3;
  block[3] = &unk_2644EDAB8;
  objc_copyWeak(v3, (id *)(a1 + 40));
  v3[1] = (id)state64;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v3);
}

void __27__SSScreenshotsWindow_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deviceLockStateChanged:*(void *)(a1 + 40)];
}

void __27__SSScreenshotsWindow_init__block_invoke_4(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 932), &state64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__SSScreenshotsWindow_init__block_invoke_5;
  block[3] = &unk_2644EDAB8;
  objc_copyWeak(v3, (id *)(a1 + 40));
  v3[1] = (id)state64;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(v3);
}

void __27__SSScreenshotsWindow_init__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _deviceBacklightChanged:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  notifyQueue = self->_notifyQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__SSScreenshotsWindow_dealloc__block_invoke;
  block[3] = &unk_2644EDB30;
  void block[4] = self;
  dispatch_sync(notifyQueue, block);
  [(SSActiveInterfaceOrientationObserver *)self->_activeInterfaceOrientationObserver stopObserving];
  v4.receiver = self;
  v4.super_class = (Class)SSScreenshotsWindow;
  [(SSScreenshotsWindow *)&v4 dealloc];
}

uint64_t __30__SSScreenshotsWindow_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 928);
  if (v3 != -1)
  {
    notify_cancel(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t result = *(unsigned int *)(v2 + 932);
  if (result != -1)
  {
    return notify_cancel(result);
  }
  return result;
}

+ (BOOL)_isSecure
{
  return 1;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (void)activateRemoteViewControllerIfAppropriate
{
  int v3 = [(SSScreenshotsWindowRootViewController *)self->_root managedViewController];

  if (!v3)
  {
    objc_super v4 = [(SSScreenshotsWindow *)self delegate];
    [v4 screenshotWindowWillBeDisplayed];

    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __64__SSScreenshotsWindow_activateRemoteViewControllerIfAppropriate__block_invoke;
    v5[3] = &unk_2644EDB58;
    v5[4] = self;
    [(SSScreenshotsWindow *)self _prepareRemoteViewControllerWithCompletionHandler:v5];
  }
}

uint64_t __64__SSScreenshotsWindow_activateRemoteViewControllerIfAppropriate__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 904) setManagedViewController:a2];
}

- (void)_prepareRemoteViewControllerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v5, OS_LOG_TYPE_INFO, "Preparing remote view controller", buf, 2u);
  }

  [(SSScreenshotsWindow *)self _setRotatableViewOrientation:self->_lastActiveInterfaceOrientation duration:1 force:0.0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke;
  v8[3] = &unk_2644EDB80;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = +[_UIRemoteViewController requestViewController:@"SSSDittoRemoteViewController" fromServiceWithBundleIdentifier:@"com.apple.ScreenshotServicesService" connectionHandler:v8];
}

void __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke_cold_1(v6, v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v5;
  [v9 setDelegate:v8];
  [v9 setModalPresentationStyle:5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_dismiss
{
  int v3 = [(SSScreenshotsWindow *)self _hostViewControllerIfExists];
  [v3 setDelegate:0];

  id v4 = [(SSScreenshotsWindow *)self _hostViewControllerIfExists];
  id v5 = (id)[v4 disconnect];

  [(SSScreenshotsWindowRootViewController *)self->_root setManagedViewController:0];
  id v6 = [(SSScreenshotsWindow *)self delegate];
  [v6 screenshotWindowWasDismissed];
}

- (BOOL)_shouldControlAutorotation
{
  return 0;
}

- (BOOL)_shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 0;
}

- (void)_deviceLockStateChanged:(unint64_t)a3
{
  if (a3 == 1)
  {
    id v4 = [(SSScreenshotsWindow *)self _hostViewControllerIfExists];
    [v4 dismissScreenshotExperience];
  }
}

- (void)_deviceBacklightChanged:(unint64_t)a3
{
  if (!a3)
  {
    id v4 = [(SSScreenshotsWindow *)self _hostViewControllerIfExists];
    [v4 dismissScreenshotExperience];
  }
}

- (SSScreenshotsWindowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSScreenshotsWindowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_activeInterfaceOrientationObserver, 0);
}

void __73__SSScreenshotsWindow__prepareRemoteViewControllerWithCompletionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_21ECED000, a2, OS_LOG_TYPE_ERROR, "Couldn't prepare remote view controller, %@", (uint8_t *)&v4, 0xCu);
}

@end