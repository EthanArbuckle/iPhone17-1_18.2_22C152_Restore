@interface SFWiFiHealthMonitor
- (OS_dispatch_queue)dispatchQueue;
- (SFWiFiHealthMonitor)init;
- (id)description;
- (id)invalidationHandler;
- (id)statusHandler;
- (void)_activate;
- (void)_invalidate;
- (void)_update;
- (void)_wifiAutoJoinNotification:(id)a3;
- (void)_wifiEnsureStarted;
- (void)_wifiEnsureStopped;
- (void)_wifiStatusChangedExternal:(int64_t)a3;
- (void)_wifiStatusChangedInternal:(int64_t)a3;
- (void)activate;
- (void)invalidate;
- (void)reset;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setStatusHandler:(id)a3;
@end

@implementation SFWiFiHealthMonitor

- (SFWiFiHealthMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFWiFiHealthMonitor;
  v2 = [(SFWiFiHealthMonitor *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    *(void *)&v3->_lockdownActivated = -1;
  }
  return v3;
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  NSAppendPrintF();
  id v4 = v3;

  NSAppendPrintF();
  id v5 = v4;

  if (self->_wifiStatusGoodTicks)
  {
    mach_absolute_time();
    UpTicksToSeconds();
    NSAppendPrintF();
    id v6 = v5;

    id v5 = v6;
  }
  if (self->_wifiStatusBadTicks)
  {
    mach_absolute_time();
    UpTicksToSeconds();
    NSAppendPrintF();
    id v7 = v5;

    id v5 = v7;
  }

  return v5;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__SFWiFiHealthMonitor_activate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SFWiFiHealthMonitor_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_SFWiFiHealthMonitor <= 30
    && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v10 = 0;
  CFPrefs_GetDouble();
  double v4 = v3;
  double wifiStatusDebounceSecs = self->_wifiStatusDebounceSecs;
  if (v4 != wifiStatusDebounceSecs)
  {
    if (gLogCategory_SFWiFiHealthMonitor <= 40)
    {
      if (gLogCategory_SFWiFiHealthMonitor == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_10;
        }
        double wifiStatusDebounceSecs = self->_wifiStatusDebounceSecs;
      }
      double v7 = wifiStatusDebounceSecs;
      double v8 = v4;
      LogPrintF();
    }
LABEL_10:
    self->_double wifiStatusDebounceSecs = v4;
  }
  if (self->_lockdownActivationNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __32__SFWiFiHealthMonitor__activate__block_invoke;
    handler[3] = &unk_1E5BBE120;
    handler[4] = self;
    notify_register_dispatch("com.apple.mobile.lockdown.activation_state", &self->_lockdownActivationNotifyToken, dispatchQueue, handler);
  }
  [(SFWiFiHealthMonitor *)self _update];
}

uint64_t __32__SFWiFiHealthMonitor__activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(_DWORD *)(v1 + 12) = -1;
    return [*(id *)(result + 32) _update];
  }
  return result;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SFWiFiHealthMonitor_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__SFWiFiHealthMonitor_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_SFWiFiHealthMonitor <= 30
    && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  int lockdownActivationNotifyToken = self->_lockdownActivationNotifyToken;
  if (lockdownActivationNotifyToken != -1)
  {
    notify_cancel(lockdownActivationNotifyToken);
    self->_int lockdownActivationNotifyToken = -1;
  }
  [(CURetrier *)self->_wifiRetrier invalidateDirect];
  wifiRetrier = self->_wifiRetrier;
  self->_wifiRetrier = 0;

  [(SFWiFiHealthMonitor *)self _wifiEnsureStopped];
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    id v6 = self->_invalidationHandler;
  }
  else
  {
    id v6 = 0;
  }
  self->_invalidationHandler = 0;

  id statusHandler = self->_statusHandler;
  self->_id statusHandler = 0;
}

- (void)reset
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__SFWiFiHealthMonitor_reset__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SFWiFiHealthMonitor_reset__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFWiFiHealthMonitor <= 30
    && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _wifiStatusChangedInternal:1];
}

- (void)_update
{
  int lockdownActivated = self->_lockdownActivated;
  if (lockdownActivated < 0)
  {
    int lockdownActivated = MAGetActivationState();
    if (self->_lockdownActivated != lockdownActivated)
    {
      if (gLogCategory_SFWiFiHealthMonitor <= 30
        && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
      {
        double v4 = "yes";
        if (lockdownActivated) {
          id v5 = "no";
        }
        else {
          id v5 = "yes";
        }
        if (!lockdownActivated) {
          double v4 = "no";
        }
        int v10 = v5;
        v11 = v4;
        LogPrintF();
      }
      self->_int lockdownActivated = lockdownActivated;
    }
  }
  wifiRetrier = self->_wifiRetrier;
  if (lockdownActivated)
  {
    if (!wifiRetrier)
    {
      if (gLogCategory_SFWiFiHealthMonitor <= 30
        && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      double v7 = (CURetrier *)objc_alloc_init(MEMORY[0x1E4F5E1D0]);
      double v8 = self->_wifiRetrier;
      self->_wifiRetrier = v7;

      [(CURetrier *)self->_wifiRetrier setDispatchQueue:self->_dispatchQueue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __30__SFWiFiHealthMonitor__update__block_invoke;
      v12[3] = &unk_1E5BBC870;
      v12[4] = self;
      [(CURetrier *)self->_wifiRetrier setActionHandler:v12];
      [(CURetrier *)self->_wifiRetrier startDirect];
    }
  }
  else
  {
    if (wifiRetrier)
    {
      if (gLogCategory_SFWiFiHealthMonitor <= 30
        && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(CURetrier *)self->_wifiRetrier invalidateDirect];
      v9 = self->_wifiRetrier;
      self->_wifiRetrier = 0;
    }
    [(SFWiFiHealthMonitor *)self _wifiEnsureStopped];
  }
}

uint64_t __30__SFWiFiHealthMonitor__update__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wifiEnsureStarted];
}

- (void)_wifiEnsureStarted
{
  *(int64x2_t *)&self->_wifiStatusExternal = vdupq_n_s64(1uLL);
  uint64_t v3 = mach_absolute_time();
  self->_wifiStatusBadTicks = 0;
  self->_wifiStatusGoodTicks = v3;
  if (self->_wifiManager) {
    goto LABEL_38;
  }
  double v4 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->_wifiManager = v4;
  if (v4) {
    goto LABEL_38;
  }
  if (gLogCategory_SFWiFiHealthMonitor <= 60)
  {
    if (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (self->_wifiManager)
    {
LABEL_38:
      if (!self->_wifiManagerSetup)
      {
        CFRunLoopGetMain();
        WiFiManagerClientScheduleWithRunLoop();
        WiFiManagerClientRegisterDeviceAttachmentCallback();
        WiFiManagerClientRegisterServerRestartCallback();
        self->_wifiManagerSetup = 1;
        if (gLogCategory_SFWiFiHealthMonitor <= 30
          && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      if (self->_wifiManager && !self->_wifiDevice)
      {
        CFArrayRef v5 = (const __CFArray *)WiFiManagerClientCopyDevices();
        CFArrayRef v6 = v5;
        if (v5 && CFArrayGetCount(v5) >= 1)
        {
          ValueAtIndex = (__WiFiDeviceClient *)CFArrayGetValueAtIndex(v6, 0);
          self->_wifiDevice = ValueAtIndex;
          CFRetain(ValueAtIndex);
LABEL_24:
          CFRelease(v6);
          goto LABEL_25;
        }
        if (gLogCategory_SFWiFiHealthMonitor <= 60
          && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
        {
          CFArrayRef v9 = v6;
          LogPrintF();
        }
        if (v6) {
          goto LABEL_24;
        }
      }
    }
  }
LABEL_25:
  if (self->_wifiDevice && !self->_wifiDeviceSetup)
  {
    WiFiDeviceClientRegisterAutoJoinNotificationCallback();
    WiFiDeviceClientRegisterRemovalCallback();
    self->_wifiDeviceSetup = 1;
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(CURetrier *)self->_wifiRetrier succeededDirect];
  }
  if (!self->_wifiDeviceSetup)
  {
    wifiRetrier = self->_wifiRetrier;
    [(CURetrier *)wifiRetrier failedDirect];
  }
}

- (void)_wifiEnsureStopped
{
  wifiStatusDebounceTimer = self->_wifiStatusDebounceTimer;
  if (wifiStatusDebounceTimer)
  {
    double v4 = wifiStatusDebounceTimer;
    dispatch_source_cancel(v4);
    CFArrayRef v5 = self->_wifiStatusDebounceTimer;
    self->_wifiStatusDebounceTimer = 0;
  }
  self->_wifiDeviceSetup = 0;
  if (self->_wifiDevice)
  {
    WiFiDeviceClientRegisterAutoJoinNotificationCallback();
    WiFiDeviceClientRegisterRemovalCallback();
    CFRelease(self->_wifiDevice);
    self->_wifiDevice = 0;
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  self->_wifiManagerSetup = 0;
  if (self->_wifiManager)
  {
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    WiFiManagerClientRegisterServerRestartCallback();
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_wifiAutoJoinNotification:(id)a3
{
  id v7 = a3;
  CFStringGetTypeID();
  double v4 = CFDictionaryGetTypedValue();
  if (gLogCategory_SFWiFiHealthMonitor <= 30
    && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
  {
    CFArrayRef v6 = v4;
    LogPrintF();
  }
  if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E4F78C00], v6) & 1) != 0
    || ([v4 isEqual:*MEMORY[0x1E4F78BF8]] & 1) != 0
    || [v4 isEqual:*MEMORY[0x1E4F78BE0]])
  {
    if (CFDictionaryGetInt64()) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 2;
    }
    goto LABEL_11;
  }
  if ([v4 isEqual:*MEMORY[0x1E4F78C08]])
  {
    uint64_t v5 = 1;
LABEL_11:
    [(SFWiFiHealthMonitor *)self _wifiStatusChangedInternal:v5];
  }
}

- (void)_wifiStatusChangedExternal:(int64_t)a3
{
  if (self->_wifiStatusExternal != a3)
  {
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_wifiStatusExternal = a3;
    id statusHandler = self->_statusHandler;
    if (statusHandler)
    {
      CFArrayRef v6 = (void (*)(void))*((void *)statusHandler + 2);
      v6();
    }
  }
}

- (void)_wifiStatusChangedInternal:(int64_t)a3
{
  if (self->_wifiStatusInternal != a3)
  {
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int64_t wifiStatusInternal = a3;
    if (a3 == 1)
    {
      self->_wifiStatusBadTicks = 0;
      self->_wifiStatusGoodTicks = mach_absolute_time();
      wifiStatusDebounceTimer = self->_wifiStatusDebounceTimer;
      if (wifiStatusDebounceTimer)
      {
        CFArrayRef v6 = wifiStatusDebounceTimer;
        dispatch_source_cancel(v6);
        id v7 = self->_wifiStatusDebounceTimer;
        self->_wifiStatusDebounceTimer = 0;
      }
      int64_t wifiStatusInternal = self->_wifiStatusInternal;
      [(SFWiFiHealthMonitor *)self _wifiStatusChangedExternal:wifiStatusInternal];
    }
    else if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      self->_wifiStatusBadTicks = mach_absolute_time();
      self->_wifiStatusGoodTicks = 0;
      if (!self->_wifiStatusDebounceTimer)
      {
        CFArrayRef v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        int v10 = self->_wifiStatusDebounceTimer;
        self->_wifiStatusDebounceTimer = v9;

        v11 = self->_wifiStatusDebounceTimer;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __50__SFWiFiHealthMonitor__wifiStatusChangedInternal___block_invoke;
        handler[3] = &unk_1E5BBC870;
        handler[4] = self;
        dispatch_source_set_event_handler(v11, handler);
        SFDispatchTimerSet(self->_wifiStatusDebounceTimer, self->_wifiStatusDebounceSecs, -1.0, -4.0);
        dispatch_resume((dispatch_object_t)self->_wifiStatusDebounceTimer);
      }
    }
  }
}

uint64_t __50__SFWiFiHealthMonitor__wifiStatusChangedInternal___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_SFWiFiHealthMonitor <= 30
      && (gLogCategory_SFWiFiHealthMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(void **)(*(void *)(v1 + 32) + 88);
    if (v2)
    {
      uint64_t v3 = v2;
      dispatch_source_cancel(v3);
      uint64_t v4 = *(void *)(v1 + 32);
      uint64_t v5 = *(void **)(v4 + 88);
      *(void *)(v4 + 88) = 0;
    }
    CFArrayRef v6 = *(void **)(v1 + 32);
    uint64_t v7 = v6[13];
    return [v6 _wifiStatusChangedExternal:v7];
  }
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)statusHandler
{
  return self->_statusHandler;
}

- (void)setStatusHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiStatusDebounceTimer, 0);

  objc_storeStrong((id *)&self->_wifiRetrier, 0);
}

@end