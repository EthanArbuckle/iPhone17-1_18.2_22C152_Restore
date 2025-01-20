@interface ULDisplayMonitor
- (BOOL)_checkDisplayOnFromLayout:(id)a3;
- (BOOL)_checkScreenLockedFromLayout:(id)a3;
- (BOOL)displayOn;
- (BOOL)screenLocked;
- (FBSDisplayLayoutMonitor)displayLayoutMinitor;
- (NSString)appInFocus;
- (id)_checkAppInFocusFromLayout:(id)a3;
- (id)latestEventAfterAddingObserverForEventName:(id)a3;
- (void)_didUpdateDisplayLayout:(id)a3;
- (void)setAppInFocus:(id)a3;
- (void)setDisplayLayoutMinitor:(id)a3;
- (void)setDisplayOn:(BOOL)a3;
- (void)setScreenLocked:(BOOL)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring:(id)a3;
@end

@implementation ULDisplayMonitor

uint64_t __36__ULDisplayMonitor_startMonitoring___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didUpdateDisplayLayout:*(void *)(a1 + 40)];
}

void __47__ULDisplayMonitor__checkAppInFocusFromLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  v6 = [v11 bundleIdentifier];
  if (v6 && [v11 layoutRole] == 1)
  {
    int v7 = [v11 isUIApplicationElement];

    if (v7)
    {
      uint64_t v8 = [v11 bundleIdentifier];
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      *a4 = 1;
    }
  }
  else
  {
  }
}

void __36__ULDisplayMonitor_startMonitoring___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    int v7 = [WeakRetained queue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__ULDisplayMonitor_startMonitoring___block_invoke_2;
    v8[3] = &unk_2653F9228;
    v8[4] = v6;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

- (void)_didUpdateDisplayLayout:(id)a3
{
  id v17 = a3;
  id v4 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = v17;
  if (v17)
  {
    v6 = [(ULDisplayMonitor *)self appInFocus];
    int v7 = [(ULDisplayMonitor *)self _checkAppInFocusFromLayout:v17];
    [(ULDisplayMonitor *)self setAppInFocus:v7];

    uint64_t v8 = [(ULDisplayMonitor *)self appInFocus];
    if (v6 == v8)
    {
      uint64_t v10 = 0;
    }
    else
    {
      id v9 = [(ULDisplayMonitor *)self appInFocus];
      uint64_t v10 = [v6 isEqual:v9] ^ 1;
    }
    BOOL v11 = [(ULDisplayMonitor *)self displayOn];
    [(ULDisplayMonitor *)self setDisplayOn:[(ULDisplayMonitor *)self _checkDisplayOnFromLayout:v17]];
    uint64_t v12 = v11 ^ [(ULDisplayMonitor *)self displayOn];
    BOOL v13 = [(ULDisplayMonitor *)self screenLocked];
    [(ULDisplayMonitor *)self setScreenLocked:[(ULDisplayMonitor *)self _checkScreenLockedFromLayout:v17]];
    uint64_t v14 = v13 ^ [(ULDisplayMonitor *)self screenLocked];
    if ((v10 & 1) != 0 || (v12 & 1) != 0 || v14)
    {
      v15 = objc_alloc_init(ULDisplayMonitorEventDisplayState);
      v16 = [(ULDisplayMonitor *)self appInFocus];
      [(ULDisplayMonitorEventDisplayState *)v15 setAppInFocus:v16];

      [(ULDisplayMonitorEventDisplayState *)v15 setAppInFocusChanged:v10];
      [(ULDisplayMonitorEventDisplayState *)v15 setDisplayOn:[(ULDisplayMonitor *)self displayOn]];
      [(ULDisplayMonitorEventDisplayState *)v15 setDisplayOnChanged:v12];
      [(ULDisplayMonitorEventDisplayState *)v15 setScreenLocked:[(ULDisplayMonitor *)self screenLocked]];
      [(ULDisplayMonitorEventDisplayState *)v15 setScreenLockedChanged:v14];
      [(ULEventMonitor *)self postEvent:v15];
    }
    v5 = v17;
  }
}

- (NSString)appInFocus
{
  return self->_appInFocus;
}

- (BOOL)screenLocked
{
  return self->_screenLocked;
}

- (BOOL)displayOn
{
  return self->_displayOn;
}

void __49__ULDisplayMonitor__checkScreenLockedFromLayout___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 identifier];
  int v7 = [v6 isEqual:*MEMORY[0x263F3F560]];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setScreenLocked:(BOOL)a3
{
  self->_screenLocked = a3;
}

- (void)setDisplayOn:(BOOL)a3
{
  self->_displayOn = a3;
}

- (void)setAppInFocus:(id)a3
{
}

- (BOOL)_checkDisplayOnFromLayout:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [v4 displayBacklightLevel];
  return v6 > 0;
}

- (id)_checkAppInFocusFromLayout:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x3032000000;
  BOOL v13 = __Block_byref_object_copy__14;
  uint64_t v14 = __Block_byref_object_dispose__14;
  id v15 = 0;
  uint64_t v6 = [v4 elements];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__ULDisplayMonitor__checkAppInFocusFromLayout___block_invoke;
  v9[3] = &unk_2653F9ED0;
  v9[4] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)_checkScreenLockedFromLayout:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  uint64_t v6 = [v4 elements];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__ULDisplayMonitor__checkScreenLockedFromLayout___block_invoke;
  v8[3] = &unk_2653F9ED0;
  v8[4] = &v9;
  [v6 enumerateObjectsUsingBlock:v8];

  LOBYTE(v6) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)v6;
}

- (void)startMonitoring:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  uint64_t v6 = (void *)MEMORY[0x263F3F728];
  id v7 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __36__ULDisplayMonitor_startMonitoring___block_invoke;
  v14[3] = &unk_2653F9EA8;
  objc_copyWeak(&v15, &location);
  [v7 setTransitionHandler:v14];
  objc_destroyWeak(&v15);
  uint64_t v8 = [v6 monitorWithConfiguration:v7];
  [(ULDisplayMonitor *)self setDisplayLayoutMinitor:v8];

  dispatch_time_t v9 = dispatch_time(0, 100000000);
  uint64_t v10 = [(ULEventMonitor *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __36__ULDisplayMonitor_startMonitoring___block_invoke_3;
  v12[3] = &unk_2653F9228;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_after(v9, v10, v12);

  objc_destroyWeak(&location);
}

void __36__ULDisplayMonitor_startMonitoring___block_invoke_3(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) displayLayoutMinitor];
  v3 = [v2 currentLayout];

  if (!v3)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
    }
    id v4 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_25631F000, v4, OS_LOG_TYPE_ERROR, "DisplayMonitor got currentLayout nil", (uint8_t *)&v13, 2u);
    }
  }
  [*(id *)(a1 + 32) _didUpdateDisplayLayout:v3];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
  }
  v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = v5;
    dispatch_time_t v9 = [v6 appInFocus];
    if ([*(id *)(a1 + 32) displayOn]) {
      uint64_t v10 = @"On";
    }
    else {
      uint64_t v10 = @"Off";
    }
    int v11 = [*(id *)(a1 + 32) screenLocked];
    char v12 = @"Unlocked";
    int v13 = 138413058;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    if (v11) {
      char v12 = @"Locked";
    }
    v16 = v9;
    __int16 v17 = 2112;
    v18 = v10;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_25631F000, v8, OS_LOG_TYPE_DEFAULT, "Start monitoring: %@, appInFocus: %@, display: %@, screen: %@", (uint8_t *)&v13, 0x2Au);
  }
}

- (void)stopMonitoring:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = [(ULDisplayMonitor *)self displayLayoutMinitor];
  [v6 invalidate];

  [(ULDisplayMonitor *)self setDisplayLayoutMinitor:0];
  [(ULDisplayMonitor *)self setAppInFocus:0];
  [(ULDisplayMonitor *)self setDisplayOn:0];
  [(ULDisplayMonitor *)self setScreenLocked:0];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_79);
  }
  uint64_t v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_25631F000, v7, OS_LOG_TYPE_DEFAULT, "Stop monitoring: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  id v4 = a3;
  v5 = [(ULEventMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = +[ULEvent eventName];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    int v8 = objc_alloc_init(ULDisplayMonitorEventDisplayState);
    id v9 = [(ULDisplayMonitor *)self appInFocus];
    [(ULDisplayMonitorEventDisplayState *)v8 setAppInFocus:v9];

    [(ULDisplayMonitorEventDisplayState *)v8 setAppInFocusChanged:1];
    [(ULDisplayMonitorEventDisplayState *)v8 setDisplayOn:[(ULDisplayMonitor *)self displayOn]];
    [(ULDisplayMonitorEventDisplayState *)v8 setDisplayOnChanged:1];
    [(ULDisplayMonitorEventDisplayState *)v8 setScreenLocked:[(ULDisplayMonitor *)self screenLocked]];
    [(ULDisplayMonitorEventDisplayState *)v8 setScreenLockedChanged:1];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (FBSDisplayLayoutMonitor)displayLayoutMinitor
{
  return self->_displayLayoutMinitor;
}

- (void)setDisplayLayoutMinitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInFocus, 0);
  objc_storeStrong((id *)&self->_displayLayoutMinitor, 0);
}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_85);
    }
    v2 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_25631F000, v2, OS_LOG_TYPE_ERROR, "Invalidation called for system handling", v3, 2u);
    }
    [WeakRetained _invalidationHandler];
  }
}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_31(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _screenOnChangedHandler];
    id WeakRetained = v2;
  }
}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _clamshellModeChangedHandler];
    id WeakRetained = v2;
  }
}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _screenLockedChangedHandler];
    id WeakRetained = v2;
  }
}

void __40__ULDisplayMonitor_OSX_startMonitoring___block_invoke_4(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _activateWithCompletion];
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_85);
    }
    id v4 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = v4;
      if ([v3 screenOn]) {
        int v7 = @"On";
      }
      else {
        int v7 = @"Off";
      }
      if ([v3 clamshellMode]) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      int v10 = 138413058;
      if ([v3 screenLocked]) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      int v13 = v7;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      __int16 v16 = 2112;
      __int16 v17 = v9;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_DEFAULT, "System monitor activated, Start monitoring: %@, screenOn: %@, clamshellMode: %@, screenLocked: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
}

@end