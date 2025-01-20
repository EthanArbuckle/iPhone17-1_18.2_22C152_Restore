@interface PCInterfaceUsabilityMonitor
+ (BOOL)isBadLinkQuality:(int)a3;
+ (BOOL)isPoorLinkQuality:(int)a3;
+ (id)stringForLinkQuality:(int)a3;
- (BOOL)_createLinkQualityMonitor:(BOOL)a3;
- (BOOL)_isInterfaceHistoricallyUsable;
- (BOOL)_isInterfaceUsable;
- (BOOL)isBadLinkQuality;
- (BOOL)isInternetReachable;
- (BOOL)isNetworkingPowerExpensiveToUse;
- (BOOL)isPoorLinkQuality;
- (BOOL)isRadioHot;
- (NSString)linkQualityString;
- (PCInterfaceUsabilityMonitor)init;
- (PCInterfaceUsabilityMonitor)initWithInterfaceIdentifier:(int64_t)a3 delegateQueue:(id)a4;
- (PCInterfaceUsabilityMonitorDelegate)delegate;
- (id)currentInterfaceName;
- (int)linkQuality;
- (int64_t)interfaceConstraint;
- (int64_t)interfaceIdentifier;
- (void)_callDelegateWithBlock:(id)a3;
- (void)_createPathEvaluator;
- (void)_dynamicStoreCallback:(id)a3;
- (void)_dynamicStoreCallbackForKeys:(id)a3;
- (void)_flushStaleTransitions;
- (void)_pathUpdate:(id)a3;
- (void)_processLinkQualityUpdateWithChangedKey:(id)a3 updatedLinkQuality:(int)a4;
- (void)_unscheduleLinkQualityMonitor;
- (void)_unschedulePathEvaluator;
- (void)_updateOffTransitionsForLinkQualityChange;
- (void)_updatePathParameters;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setThresholdOffTransitionCount:(unint64_t)a3;
- (void)setTrackUsability:(BOOL)a3;
- (void)setTrackedTimeInterval:(double)a3;
@end

@implementation PCInterfaceUsabilityMonitor

- (int)linkQuality
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  int linkQuality = self->_linkQuality;
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return linkQuality;
}

- (BOOL)_isInterfaceUsable
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  BOOL v3 = self->_isPathSatisfied && self->_linkQuality != -2;
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return v3;
}

- (PCInterfaceUsabilityMonitor)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PCInterfaceUsabilityMonitor.m" lineNumber:27 description:@"Must specify an interface identifier for PCInterfaceUsabilityMonitor"];

  return self;
}

- (PCInterfaceUsabilityMonitor)initWithInterfaceIdentifier:(int64_t)a3 delegateQueue:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PCInterfaceUsabilityMonitor;
  v8 = [(PCInterfaceUsabilityMonitor *)&v16 init];
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)a3 > 1)
    {

      v9 = 0;
    }
    else
    {
      v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
      recursiveLock = v9->_recursiveLock;
      v9->_recursiveLock = v10;

      objc_storeStrong((id *)&v9->_delegateQueue, a4);
      v9->_interfaceIdentifier = a3;
      v9->_int linkQuality = -1;
      v9->_isPathSatisfied = 0;
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create("com.apple.PersistentConnection.PCInterfaceUsabilityMonitor-SCDynamicStore", v12);
      scQueue = v9->_scQueue;
      v9->_scQueue = (OS_dispatch_queue *)v13;

      [(PCInterfaceUsabilityMonitor *)v9 _updatePathParameters];
    }
  }

  return v9;
}

- (void)dealloc
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_dynamicStore) {
    [(PCInterfaceUsabilityMonitor *)self _unscheduleLinkQualityMonitor];
  }
  if (self->_evaluator) {
    [(PCInterfaceUsabilityMonitor *)self _unschedulePathEvaluator];
  }
  lqKey = self->_lqKey;
  if (lqKey) {
    CFRelease(lqKey);
  }
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  v4.receiver = self;
  v4.super_class = (Class)PCInterfaceUsabilityMonitor;
  [(PCInterfaceUsabilityMonitor *)&v4 dealloc];
}

- (id)currentInterfaceName
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  lastInterface = self->_lastInterface;
  if (lastInterface)
  {
    objc_super v4 = [NSString stringWithUTF8String:nw_interface_get_name(lastInterface)];
  }
  else
  {
    objc_super v4 = 0;
  }
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return v4;
}

- (void)_updateOffTransitionsForLinkQualityChange
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_trackUsability)
  {
    if (self->_linkQuality == -2)
    {
      offTransitions = self->_offTransitions;
      if (!offTransitions)
      {
        objc_super v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v5 = self->_offTransitions;
        self->_offTransitions = v4;

        offTransitions = self->_offTransitions;
      }
      v6 = [MEMORY[0x1E4F1C9C8] date];
      [(NSMutableArray *)offTransitions insertObject:v6 atIndex:0];
    }
    [(PCInterfaceUsabilityMonitor *)self _flushStaleTransitions];
  }
  recursiveLock = self->_recursiveLock;
  [(NSRecursiveLock *)recursiveLock unlock];
}

- (void)_flushStaleTransitions
{
  BOOL v3 = (void *)MEMORY[0x1D94354F0](self, a2);
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_trackUsability)
  {
    unint64_t thresholdOffTransitionCount = self->_thresholdOffTransitionCount;
    unint64_t v5 = [(NSMutableArray *)self->_offTransitions count];
    if (thresholdOffTransitionCount >= v5) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = thresholdOffTransitionCount;
    }
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_thresholdOffTransitionCount];
    if (v6)
    {
      uint64_t v8 = 0;
      while (1)
      {
        v9 = [(NSMutableArray *)self->_offTransitions objectAtIndex:v8];
        [v9 timeIntervalSinceNow];
        if (self->_trackedTimeInterval <= -v10) {
          break;
        }
        [(NSMutableArray *)v7 addObject:v9];

        if (v6 == ++v8) {
          goto LABEL_12;
        }
      }
    }
LABEL_12:
    offTransitions = self->_offTransitions;
    self->_offTransitions = v7;
    dispatch_queue_t v13 = v7;

    [(NSRecursiveLock *)self->_recursiveLock unlock];
  }
  else
  {
    v11 = self->_offTransitions;
    self->_offTransitions = 0;

    [(NSRecursiveLock *)self->_recursiveLock unlock];
  }
}

- (void)setTrackUsability:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_trackUsability != v3)
  {
    self->_trackUsability = v3;
    if (v3)
    {
      if (!self->_thresholdOffTransitionCount) {
        self->_unint64_t thresholdOffTransitionCount = 2;
      }
      if (self->_trackedTimeInterval == 0.0) {
        self->_trackedTimeInterval = 600.0;
      }
    }
    [(PCInterfaceUsabilityMonitor *)self _flushStaleTransitions];
  }
  recursiveLock = self->_recursiveLock;
  [(NSRecursiveLock *)recursiveLock unlock];
}

- (void)setThresholdOffTransitionCount:(unint64_t)a3
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_thresholdOffTransitionCount != a3)
  {
    self->_unint64_t thresholdOffTransitionCount = a3;
    [(PCInterfaceUsabilityMonitor *)self _flushStaleTransitions];
  }
  recursiveLock = self->_recursiveLock;
  [(NSRecursiveLock *)recursiveLock unlock];
}

- (void)setTrackedTimeInterval:(double)a3
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_trackedTimeInterval != a3)
  {
    self->_trackedTimeInterval = a3;
    [(PCInterfaceUsabilityMonitor *)self _flushStaleTransitions];
  }
  recursiveLock = self->_recursiveLock;
  [(NSRecursiveLock *)recursiveLock unlock];
}

- (BOOL)_isInterfaceHistoricallyUsable
{
  BOOL v3 = [(PCInterfaceUsabilityMonitor *)self _isInterfaceUsable];
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_trackUsability)
  {
    [(PCInterfaceUsabilityMonitor *)self _flushStaleTransitions];
    if (v3) {
      LOBYTE(v3) = [(NSMutableArray *)self->_offTransitions count] < self->_thresholdOffTransitionCount;
    }
  }
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return v3;
}

- (NSString)linkQualityString
{
  uint64_t v2 = [(PCInterfaceUsabilityMonitor *)self linkQuality];
  return (NSString *)+[PCInterfaceUsabilityMonitor stringForLinkQuality:v2];
}

+ (BOOL)isPoorLinkQuality:(int)a3
{
  return a3 < 51;
}

- (BOOL)isPoorLinkQuality
{
  BOOL v3 = objc_opt_class();
  uint64_t v4 = [(PCInterfaceUsabilityMonitor *)self linkQuality];
  return [v3 isPoorLinkQuality:v4];
}

+ (BOOL)isBadLinkQuality:(int)a3
{
  return a3 < 11;
}

- (BOOL)isBadLinkQuality
{
  BOOL v3 = objc_opt_class();
  uint64_t v4 = [(PCInterfaceUsabilityMonitor *)self linkQuality];
  return [v3 isBadLinkQuality:v4];
}

- (BOOL)isInternetReachable
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  BOOL isPathSatisfied = self->_isPathSatisfied;
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return isPathSatisfied;
}

- (int64_t)interfaceConstraint
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  int64_t v3 = self->_interfaceConstraint != 0;
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return v3;
}

- (BOOL)isRadioHot
{
  return 0;
}

- (BOOL)isNetworkingPowerExpensiveToUse
{
  return 0;
}

- (int64_t)interfaceIdentifier
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  int64_t interfaceIdentifier = self->_interfaceIdentifier;
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return interfaceIdentifier;
}

- (PCInterfaceUsabilityMonitorDelegate)delegate
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  int64_t v3 = [(CUTWeakReference *)self->_delegateReference object];
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  return (PCInterfaceUsabilityMonitorDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v8 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D94354F0]();
  [(NSRecursiveLock *)self->_recursiveLock lock];
  delegateReference = self->_delegateReference;
  self->_delegateReference = 0;

  if (v8)
  {
    unint64_t v6 = [MEMORY[0x1E4F59E30] weakRefWithObject:v8];
    id v7 = self->_delegateReference;
    self->_delegateReference = v6;
  }
  [(NSRecursiveLock *)self->_recursiveLock unlock];
}

- (void)_callDelegateWithBlock:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_recursiveLock lock];
  unint64_t v5 = self->_delegateReference;
  unint64_t v6 = self->_delegateQueue;
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__PCInterfaceUsabilityMonitor__callDelegateWithBlock___block_invoke;
    v8[3] = &unk_1E698E0A0;
    v9 = v5;
    id v10 = v4;
    dispatch_async((dispatch_queue_t)v6, v8);
  }
}

void __54__PCInterfaceUsabilityMonitor__callDelegateWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D94354F0]();
  int64_t v3 = [*(id *)(a1 + 32) object];
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_unschedulePathEvaluator
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int64_t v3 = +[PCLog usabilityMonitor];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    unint64_t v6 = self;
    _os_log_impl(&dword_1D340D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ - _unschedulePathEvaluatorOnIvarQueue", (uint8_t *)&v5, 0xCu);
  }

  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_evaluator)
  {
    nw_path_evaluator_cancel();
    evaluator = self->_evaluator;
    self->_evaluator = 0;
  }
  [(NSRecursiveLock *)self->_recursiveLock unlock];
}

- (void)_createPathEvaluator
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_evaluator)
  {
    recursiveLock = self->_recursiveLock;
    [(NSRecursiveLock *)recursiveLock unlock];
  }
  else
  {
    objc_initWeak(&location, self);
    evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
    evaluator = self->_evaluator;
    self->_evaluator = evaluator_for_endpoint;

    uint64_t v7 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v8, &location);
    nw_path_evaluator_set_update_handler();
    unint64_t v6 = (void *)nw_path_evaluator_copy_path();
    [(NSRecursiveLock *)self->_recursiveLock unlock];
    [(PCInterfaceUsabilityMonitor *)self _pathUpdate:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __51__PCInterfaceUsabilityMonitor__createPathEvaluator__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _pathUpdate:v5];
  }
}

- (void)_pathUpdate:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  nw_path_status_t status = nw_path_get_status(v4);
  int v5 = status == nw_path_status_satisfied;
  unint64_t v6 = nw_path_copy_interface();
  if (v6) {
    interface = nw_interface_copy_delegate_interface();
  }
  else {
    interface = 0;
  }
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (_os_feature_enabled_impl())
  {
    BOOL v7 = self->_interfaceConstraint != 0;
    unsigned int is_ultra_constrained = nw_path_is_ultra_constrained();
    self->_interfaceConstraint = is_ultra_constrained;
    int v9 = v7 ^ is_ultra_constrained;
  }
  else
  {
    int v9 = 0;
  }
  p_lastInterface = &self->_lastInterface;
  int v11 = nw_interface_shallow_compare();
  if ((v11 & 1) == 0)
  {
    v12 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int64_t interfaceIdentifier = self->_interfaceIdentifier;
      v14 = @"unknown";
      if (interfaceIdentifier == 1) {
        v14 = @"WWAN";
      }
      if (interfaceIdentifier) {
        v15 = v14;
      }
      else {
        v15 = @"NonCellular";
      }
      objc_super v16 = v15;
      lastInterface = self->_lastInterface;
      if (lastInterface)
      {
        name = nw_interface_get_name(lastInterface);
        if (*p_lastInterface) {
          uint32_t index = nw_interface_get_index((nw_interface_t)*p_lastInterface);
        }
        else {
          uint32_t index = 0;
        }
      }
      else
      {
        uint32_t index = 0;
        name = "<none>";
      }
      int v45 = v9;
      if (v6)
      {
        v19 = nw_interface_get_name(v6);
        uint32_t v20 = nw_interface_get_index(v6);
      }
      else
      {
        uint32_t v20 = 0;
        v19 = "<none>";
      }
      *(_DWORD *)buf = 138544642;
      v54 = self;
      __int16 v55 = 2114;
      v56 = v16;
      __int16 v57 = 2080;
      v58 = name;
      __int16 v59 = 1024;
      *(_DWORD *)v60 = index;
      *(_WORD *)&v60[4] = 2080;
      *(void *)&v60[6] = v19;
      *(_WORD *)&v60[14] = 1024;
      *(_DWORD *)&v60[16] = v20;
      _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ InterfaceUsabilityMonitor [%{public}@]: current interface changed from %s (%u) to %s (%u)", buf, 0x36u);

      int v9 = v45;
      int v5 = status == nw_path_status_satisfied;
    }

    objc_storeStrong((id *)&self->_lastInterface, v6);
  }
  p_lastDelegateInterface = &self->_lastDelegateInterface;
  if (nw_interface_shallow_compare())
  {
    int v22 = v11 ^ 1;
  }
  else
  {
    v23 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v47 = v5;
      int64_t v24 = self->_interfaceIdentifier;
      v25 = @"unknown";
      if (v24 == 1) {
        v25 = @"WWAN";
      }
      if (v24) {
        v26 = v25;
      }
      else {
        v26 = @"NonCellular";
      }
      v27 = v26;
      lastDelegateInterface = self->_lastDelegateInterface;
      if (lastDelegateInterface)
      {
        v29 = nw_interface_get_name(lastDelegateInterface);
        if (*p_lastDelegateInterface) {
          uint32_t v30 = nw_interface_get_index((nw_interface_t)*p_lastDelegateInterface);
        }
        else {
          uint32_t v30 = 0;
        }
      }
      else
      {
        uint32_t v30 = 0;
        v29 = "<none>";
      }
      int v46 = v9;
      if (interface)
      {
        v31 = nw_interface_get_name(interface);
        uint32_t v32 = nw_interface_get_index(interface);
      }
      else
      {
        uint32_t v32 = 0;
        v31 = "<none>";
      }
      *(_DWORD *)buf = 138544642;
      v54 = self;
      __int16 v55 = 2114;
      v56 = v27;
      __int16 v57 = 2080;
      v58 = v29;
      __int16 v59 = 1024;
      *(_DWORD *)v60 = v30;
      *(_WORD *)&v60[4] = 2080;
      *(void *)&v60[6] = v31;
      *(_WORD *)&v60[14] = 1024;
      *(_DWORD *)&v60[16] = v32;
      _os_log_impl(&dword_1D340D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ InterfaceUsabilityMonitor [%{public}@]: current delegate interface changed from %s (%u) to %s (%u)", buf, 0x36u);

      int v9 = v46;
      int v5 = v47;
    }

    objc_storeStrong((id *)&self->_lastDelegateInterface, interface);
    int v22 = 1;
  }
  int isPathSatisfied = self->_isPathSatisfied;
  if (isPathSatisfied != v5)
  {
    v34 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v35 = self->_interfaceIdentifier;
      v36 = @"unknown";
      if (v35 == 1) {
        v36 = @"WWAN";
      }
      if (v35) {
        v37 = v36;
      }
      else {
        v37 = @"NonCellular";
      }
      v38 = v37;
      v48 = v6;
      int v39 = v5;
      if (self->_isPathSatisfied) {
        v40 = "satisfied";
      }
      else {
        v40 = "unsatisfied";
      }
      int v41 = v9;
      if (status == nw_path_status_satisfied) {
        v42 = "satisfied";
      }
      else {
        v42 = "unsatisfied";
      }
      uint64_t reason_description = nw_path_get_reason_description();
      *(_DWORD *)buf = 138544386;
      v54 = self;
      __int16 v55 = 2114;
      v56 = v38;
      __int16 v57 = 2080;
      v58 = v40;
      int v5 = v39;
      unint64_t v6 = v48;
      __int16 v59 = 2080;
      *(void *)v60 = v42;
      int v9 = v41;
      *(_WORD *)&v60[8] = 2080;
      *(void *)&v60[10] = reason_description;
      _os_log_impl(&dword_1D340D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ InterfaceUsabilityMonitor [%{public}@]: path changed from %s to %s (%s)", buf, 0x34u);
    }
    self->_int isPathSatisfied = v5;
  }
  if (!v22
    || ([(PCInterfaceUsabilityMonitor *)self _unscheduleLinkQualityMonitor],
        [(PCInterfaceUsabilityMonitor *)self _createLinkQualityMonitor:1]))
  {
    [(NSRecursiveLock *)self->_recursiveLock unlock];
  }
  if (v9)
  {
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __43__PCInterfaceUsabilityMonitor__pathUpdate___block_invoke;
    v52[3] = &unk_1E698E0F0;
    v52[4] = self;
    [(PCInterfaceUsabilityMonitor *)self _callDelegateWithBlock:v52];
  }
  if (isPathSatisfied != v5)
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __43__PCInterfaceUsabilityMonitor__pathUpdate___block_invoke_2;
    v51[3] = &unk_1E698E0F0;
    v51[4] = self;
    [(PCInterfaceUsabilityMonitor *)self _callDelegateWithBlock:v51];
  }
}

void __43__PCInterfaceUsabilityMonitor__pathUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 interfaceConstraintChanged:*(void *)(a1 + 32)];
  }
}

void __43__PCInterfaceUsabilityMonitor__pathUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 interfaceReachabilityChanged:*(void *)(a1 + 32)];
  }
}

- (void)_updatePathParameters
{
  [(NSRecursiveLock *)self->_recursiveLock lock];
  [(PCInterfaceUsabilityMonitor *)self _unschedulePathEvaluator];
  id v3 = (OS_nw_parameters *)nw_parameters_create();
  pathParameters = self->_pathParameters;
  self->_pathParameters = v3;

  if (self->_interfaceIdentifier)
  {
    nw_parameters_set_required_interface_type((nw_parameters_t)self->_pathParameters, nw_interface_type_cellular);
    if (_os_feature_enabled_impl()) {
      nw_parameters_set_allow_ultra_constrained();
    }
  }
  else
  {
    xpc_object_t v5 = xpc_array_create(0, 0);
    xpc_array_set_uint64(v5, 0xFFFFFFFFFFFFFFFFLL, 2uLL);
    nw_parameters_set_prohibited_interface_types();
  }
  id v6 = xpc_array_create(0, 0);
  xpc_array_set_uint64(v6, 0xFFFFFFFFFFFFFFFFLL, 0x1389uLL);
  nw_parameters_set_prohibited_interface_subtypes();
  [(NSRecursiveLock *)self->_recursiveLock unlock];
  [(PCInterfaceUsabilityMonitor *)self _createPathEvaluator];
}

- (void)_unscheduleLinkQualityMonitor
{
  dynamicStore = (const __SCDynamicStore *)self->_dynamicStore;
  if (dynamicStore)
  {
    SCDynamicStoreSetDispatchQueue(dynamicStore, 0);
    CFRelease(self->_dynamicStore);
    self->_dynamicStore = 0;
  }
  lqKey = self->_lqKey;
  if (lqKey)
  {
    CFRelease(lqKey);
    self->_lqKey = 0;
  }
}

+ (id)stringForLinkQuality:(int)a3
{
  id v3 = @"off";
  id v4 = @"bad";
  xpc_object_t v5 = @"good";
  if (a3 < 0x33) {
    xpc_object_t v5 = @"poor";
  }
  if (a3 >= 0xB) {
    id v4 = v5;
  }
  if (a3 >= -1) {
    id v3 = v4;
  }
  if (a3 == -1) {
    return @"unknown";
  }
  else {
    return v3;
  }
}

- (void)_processLinkQualityUpdateWithChangedKey:(id)a3 updatedLinkQuality:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSRecursiveLock *)self->_recursiveLock lock];
  lqKey = self->_lqKey;
  if (lqKey && CFEqual(v6, lqKey) && self->_linkQuality != v4)
  {
    id v8 = +[PCLog usabilityMonitor];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int64_t interfaceIdentifier = self->_interfaceIdentifier;
      id v10 = @"unknown";
      if (interfaceIdentifier == 1) {
        id v10 = @"WWAN";
      }
      if (interfaceIdentifier) {
        int v11 = v10;
      }
      else {
        int v11 = @"NonCellular";
      }
      v12 = v11;
      lastInterface = self->_lastInterface;
      v14 = +[PCInterfaceUsabilityMonitor stringForLinkQuality:self->_linkQuality];
      v15 = +[PCInterfaceUsabilityMonitor stringForLinkQuality:v4];
      *(_DWORD *)buf = 138544642;
      uint32_t v20 = self;
      __int16 v21 = 2114;
      int v22 = v12;
      __int16 v23 = 2114;
      int64_t v24 = lastInterface;
      __int16 v25 = 2114;
      v26 = v14;
      __int16 v27 = 2114;
      v28 = v15;
      __int16 v29 = 1024;
      int v30 = v4;
      _os_log_impl(&dword_1D340D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Interface Manager: %{public}@(%{public}@) LinkQuality changed from %{public}@ to %{public}@ (%d)", buf, 0x3Au);
    }
    int linkQuality = self->_linkQuality;
    self->_int linkQuality = v4;
    [(PCInterfaceUsabilityMonitor *)self _updateOffTransitionsForLinkQualityChange];
    [(NSRecursiveLock *)self->_recursiveLock unlock];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__PCInterfaceUsabilityMonitor__processLinkQualityUpdateWithChangedKey_updatedLinkQuality___block_invoke;
    v17[3] = &unk_1E698E118;
    v17[4] = self;
    int v18 = linkQuality;
    [(PCInterfaceUsabilityMonitor *)self _callDelegateWithBlock:v17];
  }
  else
  {
    [(NSRecursiveLock *)self->_recursiveLock unlock];
  }
}

void __90__PCInterfaceUsabilityMonitor__processLinkQualityUpdateWithChangedKey_updatedLinkQuality___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 interfaceLinkQualityChanged:*(void *)(a1 + 32) previousLinkQuality:*(unsigned int *)(a1 + 40)];
  }
}

- (void)_dynamicStoreCallback:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    key = (void *)*MEMORY[0x1E4F41B38];
    unint64_t v8 = 0x1E698D000uLL;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v21 + 1) + 8 * i);
        CFPropertyListRef v11 = SCDynamicStoreCopyValue((SCDynamicStoreRef)self->_dynamicStore, v10);
        v12 = [*(id *)(v8 + 3128) usabilityMonitor];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v26 = self;
          __int16 v27 = 2114;
          CFStringRef v28 = v10;
          __int16 v29 = 2114;
          CFPropertyListRef v30 = v11;
          _os_log_impl(&dword_1D340D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ _dynamicStoreCallback - processing changedKey %{public}@ linkQualityInfo %{public}@.", buf, 0x20u);
        }

        if (v11)
        {
          CFTypeID v13 = CFGetTypeID(v11);
          if (v13 == CFDictionaryGetTypeID())
          {
            CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v11, key);
            if (Value)
            {
              CFNumberRef v15 = Value;
              unint64_t v16 = v8;
              id v17 = v4;
              CFTypeID v18 = CFGetTypeID(Value);
              BOOL v19 = v18 == CFNumberGetTypeID();
              id v4 = v17;
              unint64_t v8 = v16;
              if (v19)
              {
                *(_DWORD *)buf = 0;
                CFNumberGetValue(v15, kCFNumberIntType, buf);
                [(PCInterfaceUsabilityMonitor *)self _processLinkQualityUpdateWithChangedKey:v10 updatedLinkQuality:*(unsigned int *)buf];
              }
            }
          }
          CFRelease(v11);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v6);
  }
}

- (void)_dynamicStoreCallbackForKeys:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_recursiveLock lock];
  if (self->_dynamicStore) {
    [(PCInterfaceUsabilityMonitor *)self _dynamicStoreCallback:v4];
  }
  [(NSRecursiveLock *)self->_recursiveLock unlock];
}

- (BOOL)_createLinkQualityMonitor:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D94354F0](self, a2);
  lastDelegateInterface = self->_lastDelegateInterface;
  if (lastDelegateInterface)
  {
    uint64_t v7 = lastDelegateInterface;
  }
  else
  {
    uint64_t v7 = self->_lastInterface;
    if (!v7) {
      goto LABEL_19;
    }
  }
  if (!self->_dynamicStore)
  {
    if (!a3)
    {
      [(NSRecursiveLock *)self->_recursiveLock lock];
      if (self->_dynamicStore)
      {
        a3 = 1;
        goto LABEL_19;
      }
    }
    self->_int linkQuality = -1;
    unint64_t v8 = [MEMORY[0x1E4F59E30] weakRefWithObject:self];
    context.version = 0;
    context.info = v8;
    context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E4F1C280];
    context.release = (void (__cdecl *)(const void *))MEMORY[0x1E4F1C278];
    context.copyDescription = 0;
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFStringRef v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    CFPropertyListRef v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    self->_dynamicStore = SCDynamicStoreCreate(v9, v11, (SCDynamicStoreCallBack)_dynamicStoreCallback, &context);

    dynamicStore = (const __SCDynamicStore *)self->_dynamicStore;
    if (dynamicStore)
    {
      if (SCDynamicStoreSetDispatchQueue(dynamicStore, (dispatch_queue_t)self->_scQueue))
      {
        Mutable = CFArrayCreateMutable(v9, 0, MEMORY[0x1E4F1D510]);
        v14 = [NSString stringWithUTF8String:nw_interface_get_name((nw_interface_t)v7)];
        self->_lqKey = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(v9, (CFStringRef)*MEMORY[0x1E4F41AC8], v14, (CFStringRef)*MEMORY[0x1E4F41B38]);
        CFNumberRef v15 = +[PCLog usabilityMonitor];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          lqKey = self->_lqKey;
          *(_DWORD *)buf = 138543874;
          uint32_t v20 = self;
          __int16 v21 = 2114;
          long long v22 = v7;
          __int16 v23 = 2114;
          long long v24 = lqKey;
          _os_log_impl(&dword_1D340D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Interface manager: creating monitor for interface: %{public}@ LinkQuality key: %{public}@", buf, 0x20u);
        }

        CFArrayAppendValue(Mutable, self->_lqKey);
        SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)self->_dynamicStore, Mutable, 0);
        [(NSRecursiveLock *)self->_recursiveLock unlock];
        [(PCInterfaceUsabilityMonitor *)self _dynamicStoreCallbackForKeys:Mutable];
        CFRelease(Mutable);
        a3 = 0;
        goto LABEL_18;
      }
      v14 = +[PCLog usabilityMonitor];
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        -[PCInterfaceUsabilityMonitor _createLinkQualityMonitor:]((os_log_t)v14);
      }
    }
    else
    {
      v14 = +[PCLog usabilityMonitor];
      if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
        -[PCInterfaceUsabilityMonitor _createLinkQualityMonitor:]((os_log_t)v14);
      }
    }
    a3 = 1;
LABEL_18:
  }
LABEL_19:

  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recursiveLock, 0);
  objc_storeStrong((id *)&self->_offTransitions, 0);
  objc_storeStrong((id *)&self->_lastDelegateInterface, 0);
  objc_storeStrong((id *)&self->_lastInterface, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_pathParameters, 0);
  objc_storeStrong((id *)&self->_delegateReference, 0);
  objc_storeStrong((id *)&self->_scQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)_createLinkQualityMonitor:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D340D000, log, OS_LOG_TYPE_ERROR, "Interface manager: failed to create SCDynamicStore object", v1, 2u);
}

- (void)_createLinkQualityMonitor:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D340D000, log, OS_LOG_TYPE_ERROR, "Interface manager: SCDynamicStoreSetDispatchQueue failed", v1, 2u);
}

@end