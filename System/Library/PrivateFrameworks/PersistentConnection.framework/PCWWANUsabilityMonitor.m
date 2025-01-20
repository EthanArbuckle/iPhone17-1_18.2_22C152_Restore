@interface PCWWANUsabilityMonitor
- (BOOL)_isCurrentDataSimContextOnIvarQueue:(id)a3;
- (BOOL)isBadLinkQuality;
- (BOOL)isInterfaceHistoricallyUsable;
- (BOOL)isInterfaceUsable;
- (BOOL)isInternetReachable;
- (BOOL)isLTEWithCDRX;
- (BOOL)isPoorLinkQuality;
- (BOOL)isRadioHot;
- (NSString)linkQualityString;
- (NSString)networkCode;
- (PCInterfaceUsabilityMonitorDelegate)delegate;
- (PCWWANUsabilityMonitor)initWithDelegateQueue:(id)a3;
- (__CFString)wwanInterfaceName;
- (id)_currentDataSimContext;
- (int)currentRAT;
- (int)linkQuality;
- (int64_t)interfaceConstraint;
- (int64_t)interfaceIdentifier;
- (unint64_t)interface5GMode;
- (void)_adjustInterfaceNameForWWANContextID:(int)a3 interfaceName:(id)a4 forContext:(id)a5;
- (void)_callDelegateOnIvarQueueWithBlock:(id)a3;
- (void)_forwardConfigurationOnIvarQueue;
- (void)_processCallStatusChanged:(id)a3;
- (void)_processDataConnectionStatus:(id)a3 forContext:(id)a4;
- (void)_processDataStatus:(id)a3 forContext:(id)a4;
- (void)_setupWWANMonitor;
- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5;
- (void)currentDataSimChanged:(id)a3;
- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4;
- (void)dealloc;
- (void)interfaceConstraintChanged:(id)a3;
- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4;
- (void)interfaceReachabilityChanged:(id)a3;
- (void)networkCode;
- (void)setDelegate:(id)a3;
- (void)setThresholdOffTransitionCount:(unint64_t)a3;
- (void)setTrackUsability:(BOOL)a3;
- (void)setTrackedTimeInterval:(double)a3;
@end

@implementation PCWWANUsabilityMonitor

void *__43__PCWWANUsabilityMonitor_isInterfaceUsable__block_invoke(uint64_t a1)
{
  result = *(void **)(*(void *)(a1 + 32) + 72);
  if (result)
  {
    result = (void *)[result isInterfaceUsable];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)isInterfaceUsable
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__PCWWANUsabilityMonitor_isInterfaceUsable__block_invoke;
  v5[3] = &unk_1E698E078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (PCWWANUsabilityMonitor)initWithDelegateQueue:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PCWWANUsabilityMonitor;
  uint64_t v6 = [(PCWWANUsabilityMonitor *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("PCWWANUsabilityMonitor-ivarqueue", 0);
    ivarQueue = v6->_ivarQueue;
    v6->_ivarQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("PCWWANUsabilityMonitor-monitordelegatequeue", 0);
    monitorDelegateQueue = v6->_monitorDelegateQueue;
    v6->_monitorDelegateQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_delegateQueue, a3);
    v6->_currentRAT = -1;
    notify_register_dispatch("com.apple.powerlog.BasebandHasCDRXCapability", &v6->_powerlogCDRXToken, MEMORY[0x1E4F14428], &__block_literal_global_6);
    [(PCWWANUsabilityMonitor *)v6 _setupWWANMonitor];
  }

  return v6;
}

void __48__PCWWANUsabilityMonitor_initWithDelegateQueue___block_invoke(int a1, int token)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  v2 = +[PCLog usabilityMonitor];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v5 = state64;
    _os_log_impl(&dword_1D340D000, v2, OS_LOG_TYPE_DEFAULT, "kPCWWANPowerlogCDRXNotification - state = %llu", buf, 0xCu);
  }
}

- (void)dealloc
{
  notify_cancel(self->_powerlogCDRXToken);
  [(PCInterfaceUsabilityMonitor *)self->_interfaceMonitor setDelegate:0];
  interfaceMonitor = self->_interfaceMonitor;
  self->_interfaceMonitor = 0;

  if (self->_ctServerConnection)
  {
    _CTServerConnectionUnregisterForNotification();
    CFRelease(self->_ctServerConnection);
    self->_ctServerConnection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PCWWANUsabilityMonitor;
  [(PCWWANUsabilityMonitor *)&v4 dealloc];
}

- (void)_setupWWANMonitor
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D340D000, a2, OS_LOG_TYPE_ERROR, "Unable to setup WWAN monitor. {dataSimContextError: %@}.", (uint8_t *)&v2, 0xCu);
}

uint64_t __43__PCWWANUsabilityMonitor__setupWWANMonitor__block_invoke(uint64_t a1)
{
  int v2 = [[PCInterfaceUsabilityMonitor alloc] initWithInterfaceIdentifier:1 delegateQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 72);
  *(void *)(v3 + 72) = v2;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setDelegate:");
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 _forwardConfigurationOnIvarQueue];
}

- (void)_adjustInterfaceNameForWWANContextID:(int)a3 interfaceName:(id)a4 forContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  ivarQueue = self->_ivarQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__PCWWANUsabilityMonitor__adjustInterfaceNameForWWANContextID_interfaceName_forContext___block_invoke;
  v13[3] = &unk_1E698E1D8;
  v13[4] = self;
  id v14 = v9;
  int v16 = a3;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(ivarQueue, v13);
}

void __88__PCWWANUsabilityMonitor__adjustInterfaceNameForWWANContextID_interfaceName_forContext___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _isCurrentDataSimContextOnIvarQueue:*(void *)(a1 + 40)])
  {
    int v2 = (void *)MEMORY[0x1D94354F0]();
    int v3 = *(_DWORD *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 32);
    if (v3 != *(_DWORD *)(v4 + 112))
    {
      *(_DWORD *)(v4 + 112) = v3;
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 64);
      *(void *)(v5 + 64) = 0;

      [*(id *)(*(void *)(a1 + 32) + 72) setDelegate:0];
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(void **)(v7 + 72);
      *(void *)(v7 + 72) = 0;

      uint64_t v9 = *(void *)(a1 + 32);
      if (*(_DWORD *)(v9 + 112) != -1)
      {
        objc_storeStrong((id *)(v9 + 64), *(id *)(a1 + 48));
        if (![*(id *)(*(void *)(a1 + 32) + 64) length])
        {
          uint64_t v10 = *(void *)(a1 + 32);
          id v11 = *(void **)(v10 + 64);
          *(void *)(v10 + 64) = 0;
        }
      }
      id v12 = +[PCLog usabilityMonitor];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(int *)(a1 + 56);
        uint64_t v15 = *(void *)(v13 + 64);
        int v19 = 138543874;
        uint64_t v20 = v13;
        __int16 v21 = 2048;
        uint64_t v22 = v14;
        __int16 v23 = 2114;
        uint64_t v24 = v15;
        _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ _adjustInterfaceNameForWWANContextID contextID %ld  interfaceName %{public}@", (uint8_t *)&v19, 0x20u);
      }

      if (*(void *)(*(void *)(a1 + 32) + 64))
      {
        int v16 = [[PCInterfaceUsabilityMonitor alloc] initWithInterfaceIdentifier:1 delegateQueue:*(void *)(*(void *)(a1 + 32) + 24)];
        uint64_t v17 = *(void *)(a1 + 32);
        v18 = *(void **)(v17 + 72);
        *(void *)(v17 + 72) = v16;

        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setDelegate:");
        [*(id *)(a1 + 32) _forwardConfigurationOnIvarQueue];
      }
    }
  }
}

- (BOOL)_isCurrentDataSimContextOnIvarQueue:(id)a3
{
  BOOL result = 0;
  if (a3)
  {
    currentDataSimContext = self->_currentDataSimContext;
    if (currentDataSimContext)
    {
      id v6 = a3;
      uint64_t v7 = [(CTXPCServiceSubscriptionContext *)currentDataSimContext slotID];
      uint64_t v8 = [v6 slotID];

      return v7 == v8;
    }
  }
  return result;
}

- (void)_processDataConnectionStatus:(id)a3 forContext:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [v12 pdp];
  if (v7)
  {
    uint64_t v8 = [v12 pdp];
    int v9 = [v8 intValue];
  }
  else
  {
    int v9 = -1;
  }

  if (v9 < 0) {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v10 = v9;
  }
  id v11 = [v12 interfaceName];
  [(PCWWANUsabilityMonitor *)self _adjustInterfaceNameForWWANContextID:v10 interfaceName:v11 forContext:v6];
}

- (void)_processDataStatus:(id)a3 forContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [v7 indicator] < 6;
  int v9 = [v7 radioTechnology];
  int v10 = [v7 dataBearerSoMask];

  ivarQueue = self->_ivarQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__PCWWANUsabilityMonitor__processDataStatus_forContext___block_invoke;
  v13[3] = &unk_1E698E200;
  v13[4] = self;
  id v14 = v6;
  BOOL v17 = v8;
  int v15 = v9;
  int v16 = v10;
  id v12 = v6;
  dispatch_async(ivarQueue, v13);
}

uint64_t __56__PCWWANUsabilityMonitor__processDataStatus_forContext___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isCurrentDataSimContextOnIvarQueue:*(void *)(a1 + 40)];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned __int8 *)(v3 + 41) != v4)
    {
      *(unsigned char *)(v3 + 41) = v4;
      uint64_t v5 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __56__PCWWANUsabilityMonitor__processDataStatus_forContext___block_invoke_2;
      v8[3] = &unk_1E698E0F0;
      v8[4] = v5;
      uint64_t result = [v5 _callDelegateOnIvarQueueWithBlock:v8];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    int v6 = *(_DWORD *)(a1 + 48);
    if (*(_DWORD *)(v3 + 80) != v6)
    {
      *(_DWORD *)(v3 + 80) = v6;
      uint64_t v3 = *(void *)(a1 + 32);
    }
    int v7 = *(_DWORD *)(a1 + 52);
    if (*(_DWORD *)(v3 + 84) != v7) {
      *(_DWORD *)(v3 + 84) = v7;
    }
  }
  return result;
}

void __56__PCWWANUsabilityMonitor__processDataStatus_forContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 interfaceRadioHotnessChanged:*(void *)(a1 + 32)];
  }
}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = +[PCLog usabilityMonitor];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_1D340D000, v10, OS_LOG_TYPE_DEFAULT, "connectionStateChanged - %@", (uint8_t *)&v11, 0xCu);
  }

  if (!a4) {
    [(PCWWANUsabilityMonitor *)self _processDataConnectionStatus:v9 forContext:v8];
  }
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[PCLog usabilityMonitor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, "dataStatus changed - %@", (uint8_t *)&v9, 0xCu);
  }

  [(PCWWANUsabilityMonitor *)self _processDataStatus:v7 forContext:v6];
}

- (void)currentDataSimChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PCLog usabilityMonitor];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "currentDataSimChanged - %@", buf, 0xCu);
  }

  ivarQueue = self->_ivarQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PCWWANUsabilityMonitor_currentDataSimChanged___block_invoke;
  v8[3] = &unk_1E698DD80;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(ivarQueue, v8);
}

void __48__PCWWANUsabilityMonitor_currentDataSimChanged___block_invoke(uint64_t a1)
{
}

- (void)_processCallStatusChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F23B30]];
  id v6 = v5;
  if (v5) {
    BOOL v7 = [v5 intValue] - 6 < 0xFFFFFFFE;
  }
  else {
    BOOL v7 = 0;
  }
  [v4 objectForKey:*MEMORY[0x1E4F23B20]];
  id v8 = (const void *)CTCallGetCallSubType();
  BOOL v9 = CFEqual(v8, (CFTypeRef)*MEMORY[0x1E4F23B40]) == 0;
  ivarQueue = self->_ivarQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__PCWWANUsabilityMonitor__processCallStatusChanged___block_invoke;
  v12[3] = &unk_1E698E140;
  BOOL v11 = !v9 && v7;
  BOOL v13 = v11;
  v12[4] = self;
  dispatch_async(ivarQueue, v12);
}

void __52__PCWWANUsabilityMonitor__processCallStatusChanged___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 40))
  {
    int v2 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      id v4 = @"YES";
      if (!*(unsigned char *)(a1 + 40)) {
        id v4 = @"NO";
      }
      int v5 = 138412546;
      uint64_t v6 = v3;
      __int16 v7 = 2112;
      id v8 = v4;
      _os_log_impl(&dword_1D340D000, v2, OS_LOG_TYPE_DEFAULT, "%@ call status changed. isInCall = %@", (uint8_t *)&v5, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 40) = *(unsigned char *)(a1 + 40);
  }
}

- (BOOL)isLTEWithCDRX
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PCWWANUsabilityMonitor_isLTEWithCDRX__block_invoke;
  v5[3] = &unk_1E698E078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__PCWWANUsabilityMonitor_isLTEWithCDRX__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  _CTServerConnectionGetCDRXWithLTEState();
  if (!*MEMORY[0x1E4F23DD8])
  {
    __int16 v7 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v8;
      _os_log_impl(&dword_1D340D000, v7, OS_LOG_TYPE_DEFAULT, "%@ isLTEWithCDRX? On", buf, 0xCu);
    }

    goto LABEL_12;
  }
  if (v13 != *MEMORY[0x1E4F23DE0])
  {
    uint64_t v2 = *MEMORY[0x1E4F23DD0];
    char v3 = +[PCLog usabilityMonitor];
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v2)
    {
      if (v4)
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v5;
        uint64_t v6 = "%@ isLTEWithCDRX? Got invalid value from CT";
LABEL_15:
        _os_log_impl(&dword_1D340D000, v3, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
      }
    }
    else if (v4)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v11;
      uint64_t v6 = "%@ isLTEWithCDRX? Off";
      goto LABEL_15;
    }

    return;
  }
  uint64_t v12 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 88), &v12);
  char v9 = +[PCLog usabilityMonitor];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2048;
    uint64_t v17 = v12;
    _os_log_impl(&dword_1D340D000, v9, OS_LOG_TYPE_DEFAULT, "%@ isLTEWithCDRX? Unknown  --  powerlog value %llu", buf, 0x16u);
  }

  if (v12) {
LABEL_12:
  }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

- (unint64_t)interface5GMode
{
  uint64_t v6 = 0;
  __int16 v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PCWWANUsabilityMonitor_interface5GMode__block_invoke;
  v5[3] = &unk_1E698E078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__PCWWANUsabilityMonitor_interface5GMode__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v2 + 80) == 10)
  {
    unint64_t v3 = *(void **)(v2 + 104);
    id v22 = 0;
    int v4 = [v3 isSmartDataModeSupported:&v22];
    uint64_t v5 = v22;
    if (v4
      && ([MEMORY[0x1E4F23A18] descriptorWithSubscriptionContext:*(void *)(*(void *)(a1 + 32) + 128)], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v7 = *(void **)(*(void *)(a1 + 32) + 104), v21 = 0, v8 = objc_msgSend(v7, "smartDataMode:error:", v6, &v21), v6, v8))
    {
      int v9 = 1;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      int v12 = *(_DWORD *)(*(void *)(a1 + 32) + 84);
      if ((v12 & 8) != 0)
      {
        int v9 = 0;
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v14 = 2;
      }
      else
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        int v9 = 0;
        if ((v12 & 4) != 0) {
          uint64_t v14 = 3;
        }
        else {
          uint64_t v14 = 4;
        }
      }
      *(void *)(v13 + 24) = v14;
    }
    uint64_t v15 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v18 = @"NO";
      if (v9) {
        int v19 = @"YES";
      }
      else {
        int v19 = @"NO";
      }
      if (v4) {
        uint64_t v18 = @"YES";
      }
      uint64_t v20 = *(unsigned int *)(v16 + 84);
      *(_DWORD *)buf = 138413314;
      uint64_t v24 = v16;
      __int16 v25 = 1024;
      int v26 = v17;
      __int16 v27 = 2112;
      v28 = v19;
      __int16 v29 = 2112;
      v30 = v18;
      __int16 v31 = 2048;
      uint64_t v32 = v20;
      _os_log_impl(&dword_1D340D000, v15, OS_LOG_TYPE_DEFAULT, "%@ interface5GMode? 5G mode is %d {isSmartDataModeEnabled: %@, isSmartDataModeSupported: %@, currentDataBearerSoMask: %llu}", buf, 0x30u);
    }
  }
  else
  {
    uint64_t v5 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = *(_DWORD *)(v10 + 80);
      *(_DWORD *)buf = 138412546;
      uint64_t v24 = v10;
      __int16 v25 = 1024;
      int v26 = v11;
      _os_log_impl(&dword_1D340D000, v5, OS_LOG_TYPE_DEFAULT, "%@ interface5GMode? Current RAT is not 5G %d", buf, 0x12u);
    }
  }
}

- (NSString)networkCode
{
  unint64_t v3 = [(PCWWANUsabilityMonitor *)self _currentDataSimContext];
  int v4 = (void *)[v3 copy];

  if (v4)
  {
    ctClient = self->_ctClient;
    id v15 = 0;
    uint64_t v6 = (void *)[(CoreTelephonyClient *)ctClient copyMobileCountryCode:v4 error:&v15];
    unint64_t v7 = (unint64_t)v15;
    int v8 = self->_ctClient;
    id v14 = 0;
    int v9 = (void *)[(CoreTelephonyClient *)v8 copyMobileNetworkCode:v4 error:&v14];
    unint64_t v10 = (unint64_t)v14;
    if (v7 | v10)
    {
      int v11 = +[PCLog usabilityMonitor];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PCWWANUsabilityMonitor networkCode]();
      }

      int v12 = 0;
    }
    else
    {
      int v12 = [NSString stringWithFormat:@"%@%@", v6, v9];
    }
  }
  else
  {
    int v12 = 0;
  }

  return (NSString *)v12;
}

- (id)_currentDataSimContext
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__0;
  unint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PCWWANUsabilityMonitor__currentDataSimContext__block_invoke;
  v5[3] = &unk_1E698E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__PCWWANUsabilityMonitor__currentDataSimContext__block_invoke(uint64_t a1)
{
}

- (int)currentRAT
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PCWWANUsabilityMonitor_currentRAT__block_invoke;
  v5[3] = &unk_1E698E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__PCWWANUsabilityMonitor_currentRAT__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 80);
  return result;
}

- (__CFString)wwanInterfaceName
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  ivarQueue = self->_ivarQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PCWWANUsabilityMonitor_wwanInterfaceName__block_invoke;
  v6[3] = &unk_1E698E190;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ivarQueue, v6);
  int v3 = (void *)v8[5];
  if (v3) {
    int v4 = (__CFString *)CFAutorelease(v3);
  }
  else {
    int v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __43__PCWWANUsabilityMonitor_wwanInterfaceName__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) currentInterfaceName];
  return MEMORY[0x1F41817F8]();
}

- (void)_forwardConfigurationOnIvarQueue
{
  [(PCInterfaceUsabilityMonitor *)self->_interfaceMonitor setTrackUsability:self->_trackUsability];
  [(PCInterfaceUsabilityMonitor *)self->_interfaceMonitor setTrackedTimeInterval:self->_trackedTimeInterval];
  interfaceMonitor = self->_interfaceMonitor;
  unint64_t thresholdOffTransitionCount = self->_thresholdOffTransitionCount;
  [(PCInterfaceUsabilityMonitor *)interfaceMonitor setThresholdOffTransitionCount:thresholdOffTransitionCount];
}

- (void)setTrackUsability:(BOOL)a3
{
  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__PCWWANUsabilityMonitor_setTrackUsability___block_invoke;
  v4[3] = &unk_1E698E140;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(ivarQueue, v4);
}

uint64_t __44__PCWWANUsabilityMonitor_setTrackUsability___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 42) != v2)
  {
    *(unsigned char *)(v1 + 42) = v2;
    uint64_t v3 = *(void *)(result + 32);
    if (*(unsigned char *)(v3 + 42))
    {
      if (!*(void *)(v3 + 48))
      {
        *(void *)(v3 + 48) = 2;
        uint64_t v3 = *(void *)(result + 32);
      }
      if (*(double *)(v3 + 56) == 0.0)
      {
        *(void *)(v3 + 56) = 0x4082C00000000000;
        uint64_t v3 = *(void *)(result + 32);
      }
    }
    return [(id)v3 _forwardConfigurationOnIvarQueue];
  }
  return result;
}

- (void)setThresholdOffTransitionCount:(unint64_t)a3
{
  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PCWWANUsabilityMonitor_setThresholdOffTransitionCount___block_invoke;
  v4[3] = &unk_1E698E168;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(ivarQueue, v4);
}

uint64_t __57__PCWWANUsabilityMonitor_setThresholdOffTransitionCount___block_invoke(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v1 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 48))
  {
    *(void *)(v2 + 48) = v1;
    return [*(id *)(result + 32) _forwardConfigurationOnIvarQueue];
  }
  return result;
}

- (void)setTrackedTimeInterval:(double)a3
{
  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PCWWANUsabilityMonitor_setTrackedTimeInterval___block_invoke;
  v4[3] = &unk_1E698E168;
  *(double *)&void v4[5] = a3;
  v4[4] = self;
  dispatch_async(ivarQueue, v4);
}

uint64_t __49__PCWWANUsabilityMonitor_setTrackedTimeInterval___block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(double *)(v2 + 56))
  {
    *(double *)(v2 + 56) = v1;
    return [*(id *)(result + 32) _forwardConfigurationOnIvarQueue];
  }
  return result;
}

- (int64_t)interfaceIdentifier
{
  return 1;
}

- (int)linkQuality
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PCWWANUsabilityMonitor_linkQuality__block_invoke;
  v5[3] = &unk_1E698E078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__PCWWANUsabilityMonitor_linkQuality__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 72);
  if (v2) {
    uint64_t result = [v2 linkQuality];
  }
  else {
    uint64_t result = 4294967294;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isInterfaceHistoricallyUsable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PCWWANUsabilityMonitor_isInterfaceHistoricallyUsable__block_invoke;
  v5[3] = &unk_1E698E078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__55__PCWWANUsabilityMonitor_isInterfaceHistoricallyUsable__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 72);
  if (result)
  {
    uint64_t result = (void *)[result isInterfaceHistoricallyUsable];
    if (result) {
      BOOL v3 = *(unsigned char *)(*(void *)(a1 + 32) + 40) == 0;
    }
    else {
      BOOL v3 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)isInternetReachable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PCWWANUsabilityMonitor_isInternetReachable__block_invoke;
  v5[3] = &unk_1E698E078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__45__PCWWANUsabilityMonitor_isInternetReachable__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 72);
  if (result)
  {
    uint64_t result = (void *)[result isInternetReachable];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (NSString)linkQualityString
{
  uint64_t v2 = [(PCWWANUsabilityMonitor *)self linkQuality];
  return (NSString *)+[PCInterfaceUsabilityMonitor stringForLinkQuality:v2];
}

- (BOOL)isPoorLinkQuality
{
  uint64_t v2 = [(PCWWANUsabilityMonitor *)self linkQuality];
  return +[PCInterfaceUsabilityMonitor isPoorLinkQuality:v2];
}

- (BOOL)isBadLinkQuality
{
  uint64_t v2 = [(PCWWANUsabilityMonitor *)self linkQuality];
  return +[PCInterfaceUsabilityMonitor isBadLinkQuality:v2];
}

- (BOOL)isRadioHot
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PCWWANUsabilityMonitor_isRadioHot__block_invoke;
  v5[3] = &unk_1E698E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__PCWWANUsabilityMonitor_isRadioHot__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 41);
  return result;
}

- (int64_t)interfaceConstraint
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PCWWANUsabilityMonitor_interfaceConstraint__block_invoke;
  v5[3] = &unk_1E698E078;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *__45__PCWWANUsabilityMonitor_interfaceConstraint__block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(*(void *)(a1 + 32) + 72);
  if (result) {
    uint64_t result = (void *)[result interfaceConstraint];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (PCInterfaceUsabilityMonitorDelegate)delegate
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  unint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PCWWANUsabilityMonitor_delegate__block_invoke;
  v5[3] = &unk_1E698E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PCInterfaceUsabilityMonitorDelegate *)v3;
}

uint64_t __34__PCWWANUsabilityMonitor_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 32) object];
  return MEMORY[0x1F41817F8]();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PCWWANUsabilityMonitor_setDelegate___block_invoke;
  v7[3] = &unk_1E698DD80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(ivarQueue, v7);
}

void __38__PCWWANUsabilityMonitor_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  if (*(void *)(a1 + 40))
  {
    *(void *)(*(void *)(a1 + 32) + 32) = objc_msgSend(MEMORY[0x1E4F59E30], "weakRefWithObject:");
    MEMORY[0x1F41817F8]();
  }
}

- (void)_callDelegateOnIvarQueueWithBlock:(id)a3
{
  id v4 = a3;
  delegateReference = self->_delegateReference;
  if (delegateReference && self->_delegateQueue)
  {
    id v6 = delegateReference;
    delegateQueue = self->_delegateQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__PCWWANUsabilityMonitor__callDelegateOnIvarQueueWithBlock___block_invoke;
    v9[3] = &unk_1E698E0A0;
    unint64_t v10 = v6;
    id v11 = v4;
    id v8 = v6;
    dispatch_async(delegateQueue, v9);
  }
}

void __60__PCWWANUsabilityMonitor__callDelegateOnIvarQueueWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D94354F0]();
  id v3 = [*(id *)(a1 + 32) object];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  id v6 = a3;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__PCWWANUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke;
  block[3] = &unk_1E698E228;
  id v10 = v6;
  id v11 = self;
  int v12 = a4;
  id v8 = v6;
  dispatch_async(ivarQueue, block);
}

void *__74__PCWWANUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[9])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __74__PCWWANUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke_2;
    v4[3] = &unk_1E698E118;
    v4[4] = result;
    int v5 = *(_DWORD *)(a1 + 48);
    return (void *)[result _callDelegateOnIvarQueueWithBlock:v4];
  }
  return result;
}

void __74__PCWWANUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 interfaceLinkQualityChanged:*(void *)(a1 + 32) previousLinkQuality:*(unsigned int *)(a1 + 40)];
  }
}

- (void)interfaceReachabilityChanged:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PCWWANUsabilityMonitor_interfaceReachabilityChanged___block_invoke;
  v7[3] = &unk_1E698DD80;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

void *__55__PCWWANUsabilityMonitor_interfaceReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[9])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PCWWANUsabilityMonitor_interfaceReachabilityChanged___block_invoke_2;
    v3[3] = &unk_1E698E0F0;
    v3[4] = result;
    return (void *)[result _callDelegateOnIvarQueueWithBlock:v3];
  }
  return result;
}

void __55__PCWWANUsabilityMonitor_interfaceReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 interfaceReachabilityChanged:*(void *)(a1 + 32)];
  }
}

- (void)interfaceConstraintChanged:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PCWWANUsabilityMonitor_interfaceConstraintChanged___block_invoke;
  v7[3] = &unk_1E698DD80;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

void *__53__PCWWANUsabilityMonitor_interfaceConstraintChanged___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[9])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __53__PCWWANUsabilityMonitor_interfaceConstraintChanged___block_invoke_2;
    v3[3] = &unk_1E698E0F0;
    v3[4] = result;
    return (void *)[result _callDelegateOnIvarQueueWithBlock:v3];
  }
  return result;
}

void __53__PCWWANUsabilityMonitor_interfaceConstraintChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 interfaceConstraintChanged:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSimContext, 0);
  objc_storeStrong((id *)&self->_ctServerQueue, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_interfaceMonitor, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_delegateReference, 0);
  objc_storeStrong((id *)&self->_monitorDelegateQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)networkCode
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D340D000, v0, v1, "Failed to copy mobile network code. {MCC error: %@; MNC error: %@}");
}

@end