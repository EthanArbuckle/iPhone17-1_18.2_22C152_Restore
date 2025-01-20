@interface PCNonCellularUsabilityMonitor
- (BOOL)isBadLinkQuality;
- (BOOL)isInterfaceHistoricallyUsable;
- (BOOL)isInterfaceUsable;
- (BOOL)isInternetReachable;
- (BOOL)isNetworkingPowerExpensiveToUse;
- (BOOL)isPoorLinkQuality;
- (BOOL)isRadioHot;
- (NSString)linkQualityString;
- (PCInterfaceUsabilityMonitorDelegate)delegate;
- (PCNonCellularUsabilityMonitor)initWithDelegateQueue:(id)a3;
- (int)_linkQualityOnIvarQueue;
- (int)linkQuality;
- (int64_t)interfaceConstraint;
- (int64_t)interfaceIdentifier;
- (void)_addMonitor;
- (void)_callDelegateOnIvarQueueWithBlock:(id)a3;
- (void)_forwardConfigurationOnIvarQueue;
- (void)dealloc;
- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4;
- (void)interfaceReachabilityChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setThresholdOffTransitionCount:(unint64_t)a3;
- (void)setTrackUsability:(BOOL)a3;
- (void)setTrackedTimeInterval:(double)a3;
@end

@implementation PCNonCellularUsabilityMonitor

- (int)linkQuality
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__PCNonCellularUsabilityMonitor_linkQuality__block_invoke;
  v5[3] = &unk_1E698E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__PCNonCellularUsabilityMonitor_linkQuality__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _linkQualityOnIvarQueue];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_linkQualityOnIvarQueue
{
  if (self->_demoOverrideInterface) {
    int v2 = 100;
  }
  else {
    int v2 = -2;
  }
  int result = [(PCInterfaceUsabilityMonitor *)self->_monitor linkQuality];
  if (v2 > result) {
    return v2;
  }
  return result;
}

- (BOOL)isInterfaceUsable
{
  return self->_demoOverrideInterface
      || [(PCInterfaceUsabilityMonitor *)self->_monitor isInterfaceUsable];
}

- (PCNonCellularUsabilityMonitor)initWithDelegateQueue:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PCNonCellularUsabilityMonitor;
  uint64_t v6 = [(PCNonCellularUsabilityMonitor *)&v16 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("PCNonCellularUsabilityMonitor-ivarqueue", 0);
    ivarQueue = v6->_ivarQueue;
    v6->_ivarQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("PCNonCellularUsabilityMonitor-monitordelegatequeue", 0);
    monitorDelegateQueue = v6->_monitorDelegateQueue;
    v6->_monitorDelegateQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_delegateQueue, a3);
    v6->_previousLinkQuality = -2;
    v11 = (NSString *)CFPreferencesCopyAppValue(@"PCWiFiInterface", @"com.apple.persistentconnection");
    demoOverrideInterface = v6->_demoOverrideInterface;
    v6->_demoOverrideInterface = v11;

    if (v6->_demoOverrideInterface)
    {
      v13 = +[PCLog usabilityMonitor];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v6->_demoOverrideInterface;
        *(_DWORD *)buf = 138543618;
        v18 = v6;
        __int16 v19 = 2114;
        v20 = v14;
        _os_log_impl(&dword_1D340D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ NonCellularUsabilityMonitor is in demo override mode! (interface name %{public}@)", buf, 0x16u);
      }
    }
    [(PCNonCellularUsabilityMonitor *)v6 _addMonitor];
  }

  return v6;
}

- (void)dealloc
{
  [(PCInterfaceUsabilityMonitor *)self->_monitor setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PCNonCellularUsabilityMonitor;
  [(PCNonCellularUsabilityMonitor *)&v3 dealloc];
}

- (void)_addMonitor
{
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PCNonCellularUsabilityMonitor__addMonitor__block_invoke;
  block[3] = &unk_1E698DE90;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

void __44__PCNonCellularUsabilityMonitor__addMonitor__block_invoke(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1D94354F0]();
  objc_super v3 = [[PCInterfaceUsabilityMonitor alloc] initWithInterfaceIdentifier:0 delegateQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v3;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "setDelegate:");
}

- (void)_forwardConfigurationOnIvarQueue
{
  [(PCInterfaceUsabilityMonitor *)self->_monitor setTrackUsability:self->_trackUsability];
  [(PCInterfaceUsabilityMonitor *)self->_monitor setTrackedTimeInterval:self->_trackedTimeInterval];
  monitor = self->_monitor;
  unint64_t thresholdOffTransitionCount = self->_thresholdOffTransitionCount;
  [(PCInterfaceUsabilityMonitor *)monitor setThresholdOffTransitionCount:thresholdOffTransitionCount];
}

- (void)setTrackUsability:(BOOL)a3
{
  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__PCNonCellularUsabilityMonitor_setTrackUsability___block_invoke;
  v4[3] = &unk_1E698E140;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(ivarQueue, v4);
}

uint64_t __51__PCNonCellularUsabilityMonitor_setTrackUsability___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 52) != v2)
  {
    *(unsigned char *)(v1 + 52) = v2;
    uint64_t v3 = *(void *)(result + 32);
    if (*(unsigned char *)(v3 + 52))
    {
      if (!*(void *)(v3 + 56))
      {
        *(void *)(v3 + 56) = 2;
        uint64_t v3 = *(void *)(result + 32);
      }
      if (*(double *)(v3 + 64) == 0.0)
      {
        *(void *)(v3 + 64) = 0x4082C00000000000;
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
  v4[2] = __64__PCNonCellularUsabilityMonitor_setThresholdOffTransitionCount___block_invoke;
  v4[3] = &unk_1E698E168;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(ivarQueue, v4);
}

uint64_t __64__PCNonCellularUsabilityMonitor_setThresholdOffTransitionCount___block_invoke(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 32);
  uint64_t v1 = *(void *)(result + 40);
  if (v1 != *(void *)(v2 + 56))
  {
    *(void *)(v2 + 56) = v1;
    return [*(id *)(result + 32) _forwardConfigurationOnIvarQueue];
  }
  return result;
}

- (void)setTrackedTimeInterval:(double)a3
{
  ivarQueue = self->_ivarQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__PCNonCellularUsabilityMonitor_setTrackedTimeInterval___block_invoke;
  v4[3] = &unk_1E698E168;
  *(double *)&void v4[5] = a3;
  v4[4] = self;
  dispatch_async(ivarQueue, v4);
}

uint64_t __56__PCNonCellularUsabilityMonitor_setTrackedTimeInterval___block_invoke(uint64_t result)
{
  double v1 = *(double *)(result + 40);
  uint64_t v2 = *(void *)(result + 32);
  if (v1 != *(double *)(v2 + 64))
  {
    *(double *)(v2 + 64) = v1;
    return [*(id *)(result + 32) _forwardConfigurationOnIvarQueue];
  }
  return result;
}

- (int64_t)interfaceIdentifier
{
  return 0;
}

- (BOOL)isInterfaceHistoricallyUsable
{
  return [(PCInterfaceUsabilityMonitor *)self->_monitor isInterfaceHistoricallyUsable];
}

- (BOOL)isInternetReachable
{
  return self->_demoOverrideInterface
      || [(PCInterfaceUsabilityMonitor *)self->_monitor isInternetReachable];
}

- (NSString)linkQualityString
{
  uint64_t v2 = [(PCNonCellularUsabilityMonitor *)self linkQuality];
  return (NSString *)+[PCInterfaceUsabilityMonitor stringForLinkQuality:v2];
}

- (BOOL)isPoorLinkQuality
{
  uint64_t v2 = [(PCNonCellularUsabilityMonitor *)self linkQuality];
  return +[PCInterfaceUsabilityMonitor isPoorLinkQuality:v2];
}

- (BOOL)isBadLinkQuality
{
  uint64_t v2 = [(PCNonCellularUsabilityMonitor *)self linkQuality];
  return +[PCInterfaceUsabilityMonitor isBadLinkQuality:v2];
}

- (BOOL)isRadioHot
{
  return 1;
}

- (int64_t)interfaceConstraint
{
  return 0;
}

- (BOOL)isNetworkingPowerExpensiveToUse
{
  return 0;
}

- (PCInterfaceUsabilityMonitorDelegate)delegate
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__PCNonCellularUsabilityMonitor_delegate__block_invoke;
  v5[3] = &unk_1E698E190;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (PCInterfaceUsabilityMonitorDelegate *)v3;
}

uint64_t __41__PCNonCellularUsabilityMonitor_delegate__block_invoke(uint64_t a1)
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
  v7[2] = __45__PCNonCellularUsabilityMonitor_setDelegate___block_invoke;
  v7[3] = &unk_1E698DD80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(ivarQueue, v7);
}

void __45__PCNonCellularUsabilityMonitor_setDelegate___block_invoke(uint64_t a1)
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
    v9[2] = __67__PCNonCellularUsabilityMonitor__callDelegateOnIvarQueueWithBlock___block_invoke;
    v9[3] = &unk_1E698E0A0;
    v10 = v6;
    id v11 = v4;
    id v8 = v6;
    dispatch_async(delegateQueue, v9);
  }
}

void __67__PCNonCellularUsabilityMonitor__callDelegateOnIvarQueueWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D94354F0]();
  id v3 = [*(id *)(a1 + 32) object];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PCNonCellularUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke;
  block[3] = &unk_1E698DE90;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

uint64_t __81__PCNonCellularUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) _linkQualityOnIvarQueue];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 48);
  if (result != v4)
  {
    int v5 = result;
    *(_DWORD *)(v3 + 48) = result;
    id v6 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v7;
      __int16 v13 = 1024;
      int v14 = v4;
      __int16 v15 = 1024;
      int v16 = v5;
      _os_log_impl(&dword_1D340D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ NonCellularUsabilityMonitor - LQ changed from %d to %d", buf, 0x18u);
    }

    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__PCNonCellularUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke_6;
    v9[3] = &unk_1E698E118;
    void v9[4] = v8;
    int v10 = v4;
    return [v8 _callDelegateOnIvarQueueWithBlock:v9];
  }
  return result;
}

void __81__PCNonCellularUsabilityMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke_6(uint64_t a1, void *a2)
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
  v7[2] = __62__PCNonCellularUsabilityMonitor_interfaceReachabilityChanged___block_invoke;
  v7[3] = &unk_1E698DD80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ivarQueue, v7);
}

void *__62__PCNonCellularUsabilityMonitor_interfaceReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result[9] == *(void *)(a1 + 40))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __62__PCNonCellularUsabilityMonitor_interfaceReachabilityChanged___block_invoke_2;
    v3[3] = &unk_1E698E0F0;
    v3[4] = result;
    return (void *)[result _callDelegateOnIvarQueueWithBlock:v3];
  }
  return result;
}

void __62__PCNonCellularUsabilityMonitor_interfaceReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 interfaceReachabilityChanged:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_demoOverrideInterface, 0);
  objc_storeStrong((id *)&self->_delegateReference, 0);
  objc_storeStrong((id *)&self->_monitorDelegateQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

@end