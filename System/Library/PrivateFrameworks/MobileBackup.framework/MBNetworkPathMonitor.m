@interface MBNetworkPathMonitor
+ (const)_pathTypeStringWithPathType:(int)a3;
- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivity;
- (BOOL)_updateState:(id *)a3 path:(id)a4 pathType:(int)a5;
- (MBCellularDataSubscriptionMonitor)dataSubscriptionMonitor;
- (MBNetworkPathMonitor)init;
- (MBNetworkPathMonitor)initWithQueue:(id)a3;
- (OS_dispatch_group)initialBackupOnCellularSupportGroup;
- (OS_dispatch_group)initialCellularStateGroup;
- (OS_dispatch_group)initialWiFiStateGroup;
- (OS_dispatch_group)initialWiredStateGroup;
- (OS_dispatch_queue)queue;
- (id)backupOnCellularSupportUpdateHandler;
- (id)networkPathUpdateHandler;
- (int)cellularRadioType;
- (unint64_t)backupOnCellularSupport;
- (void)_cancelMonitors;
- (void)_handleCellularStateChange:(id)a3 backupOnCellularSupport:(unint64_t)a4;
- (void)_handleWiFiStateChange;
- (void)_performBlock:(id)a3;
- (void)_startCellularMonitor;
- (void)_startWiFiMonitor;
- (void)cancel;
- (void)dealloc;
- (void)fetchNetworkConnectivityWithBlock:(id)a3;
- (void)setBackupOnCellularSupportUpdateHandler:(id)a3;
- (void)setDataSubscriptionMonitor:(id)a3;
- (void)setInitialBackupOnCellularSupportGroup:(id)a3;
- (void)setInitialCellularStateGroup:(id)a3;
- (void)setInitialWiFiStateGroup:(id)a3;
- (void)setInitialWiredStateGroup:(id)a3;
- (void)setNetworkPathUpdateHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
@end

@implementation MBNetworkPathMonitor

- (MBNetworkPathMonitor)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBNetworkPathMonitor;
  v6 = [(MBNetworkPathMonitor *)&v9 init];
  v7 = v6;
  if (v6)
  {
    atomic_store(0, (unsigned __int8 *)&v6->_started);
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_backupOnCellularSupport = 0;
    v7->_backupOnCellularSupportChanged = 0;
    v7->_wifiPathState = 0;
    v7->_cellularPathState = 0;
  }

  return v7;
}

- (MBNetworkPathMonitor)init
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);

  id v5 = (objc_class *)objc_opt_class();
  Name = class_getName(v5);
  dispatch_queue_t v7 = dispatch_queue_create(Name, v4);
  v8 = [(MBNetworkPathMonitor *)self initWithQueue:v7];

  return v8;
}

- (void)dealloc
{
  [(MBNetworkPathMonitor *)self _cancelMonitors];
  v3.receiver = self;
  v3.super_class = (Class)MBNetworkPathMonitor;
  [(MBNetworkPathMonitor *)&v3 dealloc];
}

- (void)_cancelMonitors
{
  objc_super v3 = [(MBNetworkPathMonitor *)self dataSubscriptionMonitor];
  [v3 cancel];

  [(MBNetworkPathMonitor *)self setDataSubscriptionMonitor:0];
  cellularPathMonitor = self->_cellularPathMonitor;
  if (cellularPathMonitor)
  {
    nw_path_monitor_cancel(cellularPathMonitor);
    id v5 = self->_cellularPathMonitor;
    self->_cellularPathMonitor = 0;
  }
  wifiPathMonitor = self->_wifiPathMonitor;
  if (wifiPathMonitor)
  {
    nw_path_monitor_cancel(wifiPathMonitor);
    dispatch_queue_t v7 = self->_wifiPathMonitor;
    self->_wifiPathMonitor = 0;
  }
  wiredPathMonitor = self->_wiredPathMonitor;
  if (wiredPathMonitor)
  {
    nw_path_monitor_cancel(wiredPathMonitor);
    objc_super v9 = self->_wiredPathMonitor;
    self->_wiredPathMonitor = 0;
  }
}

- (void)_performBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_block_t v17 = a3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  id v5 = [(MBNetworkPathMonitor *)self initialCellularStateGroup];
  if (v5) {
    [v4 addObject:v5];
  }
  v6 = [(MBNetworkPathMonitor *)self initialWiFiStateGroup];

  if (v6) {
    [v4 addObject:v6];
  }
  dispatch_queue_t v7 = [(MBNetworkPathMonitor *)self initialWiredStateGroup];

  if (v7) {
    [v4 addObject:v7];
  }
  v8 = [(MBNetworkPathMonitor *)self initialBackupOnCellularSupportGroup];

  if (v8) {
    [v4 addObject:v8];
  }
  objc_super v9 = dispatch_group_create();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      v14 = v8;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        v8 = *(id *)(*((void *)&v21 + 1) + 8 * v13);

        dispatch_group_enter(v9);
        v15 = [(MBNetworkPathMonitor *)self queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __38__MBNetworkPathMonitor__performBlock___block_invoke;
        block[3] = &unk_1E6D00E18;
        v20 = v9;
        dispatch_group_notify(v8, v15, block);

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  v16 = [(MBNetworkPathMonitor *)self queue];
  dispatch_group_notify(v9, v16, v17);
}

void __38__MBNetworkPathMonitor__performBlock___block_invoke(uint64_t a1)
{
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __30__MBNetworkPathMonitor_cancel__block_invoke;
  v2[3] = &unk_1E6D00E18;
  v2[4] = self;
  [(MBNetworkPathMonitor *)self _performBlock:v2];
}

uint64_t __30__MBNetworkPathMonitor_cancel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelMonitors];
}

+ (const)_pathTypeStringWithPathType:(int)a3
{
  if ((a3 - 1) > 2) {
    return "???";
  }
  else {
    return off_1E6D00ED8[a3 - 1];
  }
}

- (BOOL)_updateState:(id *)a3 path:(id)a4 pathType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  *(void *)&v39[5] = *MEMORY[0x1E4F143B8];
  v8 = a4;
  objc_super v9 = [(MBNetworkPathMonitor *)self queue];
  dispatch_assert_queue_V2(v9);

  if (!a3) {
    -[MBNetworkPathMonitor _updateState:path:pathType:]();
  }
  if (!v5) {
    -[MBNetworkPathMonitor _updateState:path:pathType:]();
  }
  uint64_t v10 = [(id)objc_opt_class() _pathTypeStringWithPathType:v5];
  nw_path_status_t status = nw_path_get_status(v8);
  uint64_t v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    uint64_t v35 = v10;
    __int16 v36 = 1024;
    unsigned __int32 v37 = status;
    __int16 v38 = 2114;
    *(void *)v39 = v8;
    _os_log_impl(&dword_1DD9AE000, v12, OS_LOG_TYPE_DEBUG, "%{public}s path changed, status:%d - %{public}@", buf, 0x1Cu);
    _MBLog(@"DEBUG", (uint64_t)"%{public}s path changed, status:%d - %{public}@", v13, v14, v15, v16, v17, v18, v10);
  }

  BOOL v19 = (status & 0xFFFFFFFD) == 1;
  BOOL is_expensive = nw_path_is_expensive(v8);
  BOOL is_constrained = nw_path_is_constrained(v8);
  if (a3->var0 && a3->var1 == v19 && a3->var2 == is_expensive && a3->var3 == is_constrained)
  {
    BOOL v22 = 0;
  }
  else
  {
    a3->var0 = 1;
    a3->BOOL var1 = v19;
    a3->BOOL var2 = is_expensive;
    a3->BOOL var3 = is_constrained;
    long long v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL var1 = a3->var1;
      BOOL var2 = a3->var2;
      BOOL var3 = a3->var3;
      *(_DWORD *)buf = 136315906;
      uint64_t v35 = v10;
      __int16 v36 = 1024;
      unsigned __int32 v37 = var1;
      __int16 v38 = 1024;
      v39[0] = var2;
      LOWORD(v39[1]) = 1024;
      *(_DWORD *)((char *)&v39[1] + 2) = var3;
      _os_log_impl(&dword_1DD9AE000, v23, OS_LOG_TYPE_DEFAULT, "%s, available:%d, expensive:%d, constrained:%d", buf, 0x1Eu);
      _MBLog(@"DEFAULT", (uint64_t)"%s, available:%d, expensive:%d, constrained:%d", v27, v28, v29, v30, v31, v32, v10);
    }

    BOOL v22 = 1;
  }

  return v22;
}

- (void)_handleWiFiStateChange
{
  objc_super v3 = [(MBNetworkPathMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  if (self->_wifiPathState.isMonitored && self->_wiredPathState.isMonitored)
  {
    uint64_t v4 = 44;
    if (!self->_wiredPathState.isAvailable) {
      uint64_t v4 = 40;
    }
    uint64_t v5 = *(unsigned int *)((char *)&self->super.isa + v4);
    v6 = [(MBNetworkPathMonitor *)self networkPathUpdateHandler];

    if (v6)
    {
      dispatch_queue_t v7 = [(MBNetworkPathMonitor *)self networkPathUpdateHandler];
      v7[2](v7, 1, v5);
    }
  }
}

- (void)_startWiFiMonitor
{
  objc_super v3 = nw_path_monitor_create_with_type(nw_interface_type_wifi);
  objc_initWeak(&location, self);
  update_handler[0] = MEMORY[0x1E4F143A8];
  update_handler[1] = 3221225472;
  update_handler[2] = __41__MBNetworkPathMonitor__startWiFiMonitor__block_invoke;
  update_handler[3] = &unk_1E6D00E40;
  objc_copyWeak(&v10, &location);
  nw_path_monitor_set_update_handler(v3, update_handler);
  uint64_t v4 = [(MBNetworkPathMonitor *)self queue];
  nw_path_monitor_set_queue(v3, v4);

  objc_storeStrong((id *)&self->_wifiPathMonitor, v3);
  uint64_t v5 = nw_path_monitor_create_with_type(nw_interface_type_wired);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__MBNetworkPathMonitor__startWiFiMonitor__block_invoke_2;
  v7[3] = &unk_1E6D00E40;
  objc_copyWeak(&v8, &location);
  nw_path_monitor_set_update_handler(v5, v7);
  v6 = [(MBNetworkPathMonitor *)self queue];
  nw_path_monitor_set_queue(v5, v6);

  objc_storeStrong((id *)&self->_wiredPathMonitor, v5);
  nw_path_monitor_start(v3);
  nw_path_monitor_start(v5);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __41__MBNetworkPathMonitor__startWiFiMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _updateState:WeakRetained + 40 path:v6 pathType:1]) {
      [v4 _handleWiFiStateChange];
    }
    uint64_t v5 = [v4 initialWiFiStateGroup];
    if (v5)
    {
      [v4 setInitialWiFiStateGroup:0];
      dispatch_group_leave(v5);
    }
  }
}

void __41__MBNetworkPathMonitor__startWiFiMonitor__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _updateState:WeakRetained + 11 path:v8 pathType:3])
    {
      [v4 _handleWiFiStateChange];
      uint64_t v5 = [v4 networkPathUpdateHandler];

      if (v5)
      {
        id v6 = [v4 networkPathUpdateHandler];
        v6[2](v6, 3, v4[11]);
      }
    }
    dispatch_queue_t v7 = [v4 initialWiredStateGroup];
    if (v7)
    {
      [v4 setInitialWiredStateGroup:0];
      dispatch_group_leave(v7);
    }
  }
}

- (void)_handleCellularStateChange:(id)a3 backupOnCellularSupport:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v7 = [(MBNetworkPathMonitor *)self queue];
  dispatch_assert_queue_V2(v7);

  if (__PAIR64__((*(unsigned int *)&a3 >> 8) & 1, a3.var0) == __PAIR64__(self->_cellularPathState.isAvailable, self->_cellularPathState.isMonitored)&& (HIWORD(*(unsigned int *)&a3) & 1) == self->_cellularPathState.isExpensive&& (HIBYTE(*(unsigned int *)&a3) & 1) == self->_cellularPathState.isConstrained)
  {
    int v8 = 0;
  }
  else
  {
    self->_cellularPathState = ($AA2DF90B845B79CAB9D40DC176B17A2E)a3;
    int v8 = 1;
  }
  if (self->_backupOnCellularSupportChanged && self->_backupOnCellularSupport == a4)
  {
    if (!v8) {
      return;
    }
    int v9 = 0;
  }
  else
  {
    self->_backupOnCellularSupport = a4;
    int v9 = 1;
    self->_backupOnCellularSupportChanged = 1;
  }
  uint64_t v10 = [(id)objc_opt_class() _pathTypeStringWithPathType:2];
  uint64_t v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    uint64_t v23 = v10;
    __int16 v24 = 1024;
    unsigned int v25 = (*(unsigned int *)&a3 >> 8) & 1;
    __int16 v26 = 1024;
    unsigned int v27 = HIWORD(*(unsigned int *)&a3) & 1;
    __int16 v28 = 1024;
    unsigned int v29 = HIBYTE(*(unsigned int *)&a3) & 1;
    __int16 v30 = 2048;
    unint64_t v31 = a4;
    _os_log_impl(&dword_1DD9AE000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s, available:%d, expensive:%d, constrained:%d, backupOnCellularSupport:0x%lx", buf, 0x28u);
    _MBLog(@"DEFAULT", (uint64_t)"%{public}s, available:%d, expensive:%d, constrained:%d, backupOnCellularSupport:0x%lx", v12, v13, v14, v15, v16, v17, v10);
  }

  if (v8)
  {
    uint64_t v18 = [(MBNetworkPathMonitor *)self networkPathUpdateHandler];

    if (v18)
    {
      BOOL v19 = [(MBNetworkPathMonitor *)self networkPathUpdateHandler];
      v19[2](v19, 2, *(unsigned int *)&a3);
    }
  }
  if (v9)
  {
    v20 = [(MBNetworkPathMonitor *)self backupOnCellularSupportUpdateHandler];

    if (v20)
    {
      long long v21 = [(MBNetworkPathMonitor *)self backupOnCellularSupportUpdateHandler];
      v21[2](v21, a4);
    }
  }
}

- (void)_startCellularMonitor
{
  objc_super v3 = [(MBNetworkPathMonitor *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  uint64_t v4 = [MBCellularDataSubscriptionMonitor alloc];
  uint64_t v5 = [(MBNetworkPathMonitor *)self queue];
  id v6 = [(MBCellularDataSubscriptionMonitor *)v4 initWithQueue:v5 timeout:30];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__MBNetworkPathMonitor__startCellularMonitor__block_invoke;
  v11[3] = &unk_1E6D00E68;
  objc_copyWeak(&v12, &location);
  [(MBCellularDataSubscriptionMonitor *)v6 setBackupOnCellularSupportHandler:v11];
  [(MBNetworkPathMonitor *)self setDataSubscriptionMonitor:v6];
  dispatch_queue_t v7 = nw_path_monitor_create_with_type(nw_interface_type_cellular);
  update_handler[0] = MEMORY[0x1E4F143A8];
  update_handler[1] = 3221225472;
  update_handler[2] = __45__MBNetworkPathMonitor__startCellularMonitor__block_invoke_2;
  update_handler[3] = &unk_1E6D00E40;
  objc_copyWeak(&v10, &location);
  nw_path_monitor_set_update_handler(v7, update_handler);
  int v8 = [(MBNetworkPathMonitor *)self queue];
  nw_path_monitor_set_queue(v7, v8);

  objc_storeStrong((id *)&self->_cellularPathMonitor, v7);
  [(MBCellularDataSubscriptionMonitor *)v6 start];
  nw_path_monitor_start(v7);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __45__MBNetworkPathMonitor__startCellularMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    [WeakRetained _handleCellularStateChange:WeakRetained[12] backupOnCellularSupport:a2];
    uint64_t v4 = [v5 initialBackupOnCellularSupportGroup];
    if (v4)
    {
      [v5 setInitialBackupOnCellularSupportGroup:0];
      dispatch_group_leave(v4);
    }

    WeakRetained = v5;
  }
}

void __45__MBNetworkPathMonitor__startCellularMonitor__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [(id)objc_opt_class() _pathTypeStringWithPathType:2];
    nw_path_status_t status = nw_path_get_status(v3);
    dispatch_queue_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      uint64_t v22 = v5;
      __int16 v23 = 1024;
      nw_path_status_t v24 = status;
      __int16 v25 = 2114;
      __int16 v26 = v3;
      _os_log_impl(&dword_1DD9AE000, v7, OS_LOG_TYPE_DEBUG, "%{public}s path changed, status:%d - %{public}@", buf, 0x1Cu);
      _MBLog(@"DEBUG", (uint64_t)"%{public}s path changed, status:%d - %{public}@", v8, v9, v10, v11, v12, v13, v5);
    }

    unsigned int v14 = status & 0xFFFFFFFD;
    BOOL is_expensive = nw_path_is_expensive(v3);
    BOOL is_constrained = nw_path_is_constrained(v3);
    uint64_t v17 = 0x1000000;
    if (!is_constrained) {
      uint64_t v17 = 0;
    }
    uint64_t v18 = 0x10000;
    if (!is_expensive) {
      uint64_t v18 = 0;
    }
    uint64_t v19 = 257;
    if (v14 != 1) {
      uint64_t v19 = 1;
    }
    [WeakRetained _handleCellularStateChange:v19 | v18 | v17 backupOnCellularSupport:WeakRetained[7]];
    v20 = [WeakRetained initialCellularStateGroup];
    if (v20)
    {
      [WeakRetained setInitialCellularStateGroup:0];
      dispatch_group_leave(v20);
    }
  }
}

- (void)start
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_started, 1u) & 1) == 0)
  {
    dispatch_group_t v3 = dispatch_group_create();
    [(MBNetworkPathMonitor *)self setInitialWiFiStateGroup:v3];

    uint64_t v4 = [(MBNetworkPathMonitor *)self initialWiFiStateGroup];
    dispatch_group_enter(v4);

    dispatch_group_t v5 = dispatch_group_create();
    [(MBNetworkPathMonitor *)self setInitialWiredStateGroup:v5];

    id v6 = [(MBNetworkPathMonitor *)self initialWiredStateGroup];
    dispatch_group_enter(v6);

    dispatch_group_t v7 = dispatch_group_create();
    [(MBNetworkPathMonitor *)self setInitialCellularStateGroup:v7];

    uint64_t v8 = [(MBNetworkPathMonitor *)self initialCellularStateGroup];
    dispatch_group_enter(v8);

    dispatch_group_t v9 = dispatch_group_create();
    [(MBNetworkPathMonitor *)self setInitialBackupOnCellularSupportGroup:v9];

    uint64_t v10 = [(MBNetworkPathMonitor *)self initialBackupOnCellularSupportGroup];
    dispatch_group_enter(v10);

    uint64_t v11 = [(MBNetworkPathMonitor *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__MBNetworkPathMonitor_start__block_invoke;
    block[3] = &unk_1E6D00E18;
    void block[4] = self;
    dispatch_async(v11, block);
  }
}

uint64_t __29__MBNetworkPathMonitor_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startWiFiMonitor];
  v2 = *(void **)(a1 + 32);
  return [v2 _startCellularMonitor];
}

- ($1C6001547D93A6C6CE4901F2C331F3E5)networkConnectivity
{
  dispatch_group_t v3 = [(MBNetworkPathMonitor *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x3010000000;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v16 = "";
  uint64_t v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__MBNetworkPathMonitor_networkConnectivity__block_invoke;
  v10[3] = &unk_1E6D00E90;
  uint64_t v12 = &v13;
  dispatch_group_t v5 = v4;
  uint64_t v11 = v5;
  [(MBNetworkPathMonitor *)self fetchNetworkConnectivityWithBlock:v10];
  MBGroupWaitForever(v5);
  uint64_t v6 = v14[4];
  unint64_t v7 = v14[5];

  _Block_object_dispose(&v13, 8);
  BOOL v8 = v6;
  unint64_t v9 = v7;
  result.var4 = v9;
  result.var0 = v8;
  result.BOOL var1 = BYTE1(v8);
  result.BOOL var2 = BYTE2(v8);
  result.BOOL var3 = HIDWORD(v8);
  return result;
}

void __43__MBNetworkPathMonitor_networkConnectivity__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = a2;
  *(void *)(v3 + 40) = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)fetchNetworkConnectivityWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__MBNetworkPathMonitor_fetchNetworkConnectivityWithBlock___block_invoke;
  v6[3] = &unk_1E6D00EB8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(MBNetworkPathMonitor *)self _performBlock:v6];
}

uint64_t __58__MBNetworkPathMonitor_fetchNetworkConnectivityWithBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataSubscriptionMonitor];
  [v2 cellularRadioType];

  uint64_t v3 = [*(id *)(a1 + 32) dataSubscriptionMonitor];
  [v3 backupOnCellularSupport];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (unint64_t)backupOnCellularSupport
{
  v2 = [(MBNetworkPathMonitor *)self dataSubscriptionMonitor];
  unint64_t v3 = [v2 backupOnCellularSupport];

  return v3;
}

- (int)cellularRadioType
{
  v2 = [(MBNetworkPathMonitor *)self dataSubscriptionMonitor];
  int v3 = [v2 cellularRadioType];

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)networkPathUpdateHandler
{
  return self->_networkPathUpdateHandler;
}

- (void)setNetworkPathUpdateHandler:(id)a3
{
}

- (id)backupOnCellularSupportUpdateHandler
{
  return self->_backupOnCellularSupportUpdateHandler;
}

- (void)setBackupOnCellularSupportUpdateHandler:(id)a3
{
}

- (OS_dispatch_group)initialWiFiStateGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInitialWiFiStateGroup:(id)a3
{
}

- (OS_dispatch_group)initialWiredStateGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInitialWiredStateGroup:(id)a3
{
}

- (OS_dispatch_group)initialCellularStateGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInitialCellularStateGroup:(id)a3
{
}

- (OS_dispatch_group)initialBackupOnCellularSupportGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInitialBackupOnCellularSupportGroup:(id)a3
{
}

- (MBCellularDataSubscriptionMonitor)dataSubscriptionMonitor
{
  return (MBCellularDataSubscriptionMonitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDataSubscriptionMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSubscriptionMonitor, 0);
  objc_storeStrong((id *)&self->_initialBackupOnCellularSupportGroup, 0);
  objc_storeStrong((id *)&self->_initialCellularStateGroup, 0);
  objc_storeStrong((id *)&self->_initialWiredStateGroup, 0);
  objc_storeStrong((id *)&self->_initialWiFiStateGroup, 0);
  objc_storeStrong(&self->_backupOnCellularSupportUpdateHandler, 0);
  objc_storeStrong(&self->_networkPathUpdateHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cellularPathMonitor, 0);
  objc_storeStrong((id *)&self->_wiredPathMonitor, 0);
  objc_storeStrong((id *)&self->_wifiPathMonitor, 0);
}

- (void)_updateState:path:pathType:.cold.1()
{
}

- (void)_updateState:path:pathType:.cold.2()
{
  __assert_rtn("-[MBNetworkPathMonitor _updateState:path:pathType:]", "MBNetworkPathMonitor.m", 127, "pathType != MBNetworkPathTypeUnspecified");
}

@end