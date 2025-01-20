@interface PCInterfaceMonitor
+ (BOOL)isBadLinkQuality:(int)a3;
+ (BOOL)isNetworkingPowerExpensiveToUse;
+ (BOOL)isPoorLinkQuality:(int)a3;
+ (id)sharedInstanceForIdentifier:(int64_t)a3;
+ (id)stringForLinkQuality:(int)a3;
- (BOOL)isBadLinkQuality;
- (BOOL)isInterfaceHistoricallyUsable;
- (BOOL)isInterfaceUsable;
- (BOOL)isInternetReachable;
- (BOOL)isLTEWithCDRX;
- (BOOL)isNetworkingPowerExpensiveToUse;
- (BOOL)isPoorLinkQuality;
- (BOOL)isRadioHot;
- (NSString)linkQualityString;
- (NSString)networkCode;
- (PCInterfaceMonitor)initWithInterfaceIdentifier:(int64_t)a3;
- (__CFString)wwanInterfaceName;
- (int)currentRAT;
- (int)linkQuality;
- (int64_t)interfaceConstraint;
- (int64_t)interfaceIdentifier;
- (unint64_t)interface5GMode;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)interfaceConstraintChanged:(id)a3;
- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4;
- (void)interfaceRadioHotnessChanged:(id)a3;
- (void)interfaceReachabilityChanged:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation PCInterfaceMonitor

+ (id)sharedInstanceForIdentifier:(int64_t)a3
{
  if (a3 <= 1)
  {
    id v5 = a1;
    objc_sync_enter(v5);
    if (!sharedInstanceForIdentifier__sInstances[a3])
    {
      v6 = [[PCInterfaceMonitor alloc] initWithInterfaceIdentifier:a3];
      id v7 = sharedInstanceForIdentifier__sInstances[a3];
      sharedInstanceForIdentifier__sInstances[a3] = v6;
    }
    objc_sync_exit(v5);

    id v3 = sharedInstanceForIdentifier__sInstances[a3];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isInterfaceUsable
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal isInterfaceUsable];
}

- (int)linkQuality
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal linkQuality];
}

+ (BOOL)isNetworkingPowerExpensiveToUse
{
  v2 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
  if ([v2 isBadLinkQuality])
  {
    id v3 = +[PCInterfaceMonitor sharedInstanceForIdentifier:0];
    int v4 = [v3 isInterfaceUsable] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (PCInterfaceMonitor)initWithInterfaceIdentifier:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PCInterfaceMonitor;
  int v4 = [(PCInterfaceMonitor *)&v10 init];
  if (v4)
  {
    if (a3 == 1)
    {
      dispatch_queue_t v5 = dispatch_queue_create("PCInterfaceMonitor-WWAN", 0);
      v6 = PCWWANUsabilityMonitor;
    }
    else
    {
      if (a3)
      {
LABEL_7:
        [(PCInterfaceUsabilityMonitorProtocol *)v4->_internal setTrackUsability:1];
        [(PCInterfaceUsabilityMonitorProtocol *)v4->_internal setDelegate:v4];
        return v4;
      }
      dispatch_queue_t v5 = dispatch_queue_create("PCInterfaceMonitor-NonCellular", 0);
      v6 = PCNonCellularUsabilityMonitor;
    }
    uint64_t v7 = [[v6 alloc] initWithDelegateQueue:v5];
    internal = v4->_internal;
    v4->_internal = (PCInterfaceUsabilityMonitorProtocol *)v7;

    [(PCInterfaceUsabilityMonitorProtocol *)v4->_internal setDelegate:v4];
    goto LABEL_7;
  }
  return v4;
}

- (void)dealloc
{
  [(PCInterfaceUsabilityMonitorProtocol *)self->_internal setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PCInterfaceMonitor;
  [(PCInterfaceMonitor *)&v3 dealloc];
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  unint64_t v10 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v10 | v6)
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    if (!v7->_delegateMap)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:512 capacity:1];
      delegateMap = v7->_delegateMap;
      v7->_delegateMap = (NSMapTable *)v8;
    }
    if (v10 && v6)
    {
      [(NSMapTable *)v7->_delegateMap setObject:v6 forKey:v10];
    }
    else if (v10)
    {
      [(NSMapTable *)v7->_delegateMap removeObjectForKey:v10];
    }
    objc_sync_exit(v7);
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    dispatch_queue_t v5 = self;
    objc_sync_enter(v5);
    [(NSMapTable *)v5->_delegateMap removeObjectForKey:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)interfaceLinkQualityChanged:(id)a3 previousLinkQuality:(int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = (void *)[(NSMapTable *)v6->_delegateMap copy];
  objc_sync_exit(v6);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          v13 = objc_msgSend(v8, "objectForKey:", v12, v14);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __70__PCInterfaceMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke;
          block[3] = &unk_1E698E228;
          block[4] = v12;
          block[5] = v6;
          int v16 = a4;
          dispatch_async(v13, block);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

void __70__PCInterfaceMonitor_interfaceLinkQualityChanged_previousLinkQuality___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D94354F0]();
  [*(id *)(a1 + 32) interfaceLinkQualityChanged:*(void *)(a1 + 40) previousLinkQuality:*(unsigned int *)(a1 + 48)];
}

- (void)interfaceReachabilityChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  dispatch_queue_t v5 = (void *)[(NSMapTable *)v4->_delegateMap copy];
  objc_sync_exit(v4);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v6 objectForKey:v10];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51__PCInterfaceMonitor_interfaceReachabilityChanged___block_invoke;
          block[3] = &unk_1E698DD80;
          block[4] = v10;
          block[5] = v4;
          dispatch_async(v11, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

void __51__PCInterfaceMonitor_interfaceReachabilityChanged___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D94354F0]();
  [*(id *)(a1 + 32) interfaceReachabilityChanged:*(void *)(a1 + 40)];
}

- (void)interfaceRadioHotnessChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  dispatch_queue_t v5 = (void *)[(NSMapTable *)v4->_delegateMap copy];
  objc_sync_exit(v4);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v6 objectForKey:v10];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __51__PCInterfaceMonitor_interfaceRadioHotnessChanged___block_invoke;
          block[3] = &unk_1E698DD80;
          block[4] = v10;
          block[5] = v4;
          dispatch_async(v11, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

void __51__PCInterfaceMonitor_interfaceRadioHotnessChanged___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D94354F0]();
  [*(id *)(a1 + 32) interfaceRadioHotnessChanged:*(void *)(a1 + 40)];
}

- (void)interfaceConstraintChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  dispatch_queue_t v5 = (void *)[(NSMapTable *)v4->_delegateMap copy];
  objc_sync_exit(v4);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = [v6 objectForKey:v10];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __49__PCInterfaceMonitor_interfaceConstraintChanged___block_invoke;
          block[3] = &unk_1E698DD80;
          block[4] = v10;
          block[5] = v4;
          dispatch_async(v11, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

void __49__PCInterfaceMonitor_interfaceConstraintChanged___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D94354F0]();
  [*(id *)(a1 + 32) interfaceConstraintChanged:*(void *)(a1 + 40)];
}

- (int64_t)interfaceIdentifier
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal interfaceIdentifier];
}

- (BOOL)isInterfaceHistoricallyUsable
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal isInterfaceHistoricallyUsable];
}

- (BOOL)isInternetReachable
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal isInternetReachable];
}

- (NSString)linkQualityString
{
  return (NSString *)[(PCInterfaceUsabilityMonitorProtocol *)self->_internal linkQualityString];
}

- (BOOL)isPoorLinkQuality
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal isPoorLinkQuality];
}

- (BOOL)isBadLinkQuality
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal isBadLinkQuality];
}

- (BOOL)isRadioHot
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal isRadioHot];
}

- (int64_t)interfaceConstraint
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal interfaceConstraint];
}

- (BOOL)isNetworkingPowerExpensiveToUse
{
  return [(PCInterfaceUsabilityMonitorProtocol *)self->_internal isNetworkingPowerExpensiveToUse];
}

- (int)currentRAT
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return -1;
  }
  internal = self->_internal;
  return [(PCInterfaceUsabilityMonitorProtocol *)internal currentRAT];
}

- (__CFString)wwanInterfaceName
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  internal = self->_internal;
  return (__CFString *)[(PCInterfaceUsabilityMonitorProtocol *)internal wwanInterfaceName];
}

- (BOOL)isLTEWithCDRX
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  internal = self->_internal;
  return [(PCInterfaceUsabilityMonitorProtocol *)internal isLTEWithCDRX];
}

- (unint64_t)interface5GMode
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  internal = self->_internal;
  return [(PCInterfaceUsabilityMonitorProtocol *)internal interface5GMode];
}

- (NSString)networkCode
{
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [(PCInterfaceUsabilityMonitorProtocol *)self->_internal networkCode];
  }
  else
  {
    objc_super v3 = 0;
  }
  return (NSString *)v3;
}

+ (id)stringForLinkQuality:(int)a3
{
  return +[PCInterfaceUsabilityMonitor stringForLinkQuality:*(void *)&a3];
}

+ (BOOL)isPoorLinkQuality:(int)a3
{
  return +[PCInterfaceUsabilityMonitor isPoorLinkQuality:*(void *)&a3];
}

+ (BOOL)isBadLinkQuality:(int)a3
{
  return +[PCInterfaceUsabilityMonitor isBadLinkQuality:*(void *)&a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateMap, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

@end