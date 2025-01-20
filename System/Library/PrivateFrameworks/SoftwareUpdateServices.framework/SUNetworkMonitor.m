@interface SUNetworkMonitor
+ (BOOL)holdsWiFiAssertion;
+ (SUNetworkMonitor)sharedInstance;
+ (void)setHoldsWiFiAssertion:(BOOL)a3;
- (BOOL)_overriddenByPreferences;
- (BOOL)isBootstrap;
- (BOOL)isCellularDataRoamingEnabled;
- (BOOL)isCellularPossible;
- (BOOL)isCellularRoaming;
- (BOOL)isCurrentNetworkTypeCellular;
- (BOOL)isCurrentNetworkTypeExpensive;
- (BOOL)isNetworkTypeCellular:(int)a3;
- (BOOL)isPathSatisfied;
- (NSHashTable)_allObservers;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)ctQueue;
- (SUNetworkMonitor)init;
- (id)operatorName;
- (id)servingPlmn;
- (id)telephonyClient;
- (int)_networkTypeFromIndicator:(int)a3;
- (int)currentCellularType;
- (int)currentNetworkType;
- (void)_addObserver:(id)a3;
- (void)_carrierBundleChanged;
- (void)_handleNWPath:(id)a3;
- (void)_initNetworkObservation;
- (void)_init_currentlyRoaming;
- (void)_init_dataRoamingEnabled;
- (void)_init_internetDataStatus;
- (void)_operatorBundleChanged;
- (void)_removeObserver:(id)a3;
- (void)_resetCtClient;
- (void)_runOnAllObservers:(id)a3;
- (void)addObserver:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)dataRoamingSettingsChanged:(id)a3 status:(BOOL)a4;
- (void)dealloc;
- (void)detectOverriddenNetwork;
- (void)displayStatusChanged:(id)a3 status:(id)a4;
- (void)internetDataStatus:(id)a3;
- (void)operatorBundleChange:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCellularDataPossible:(BOOL)a3;
- (void)setCellularRoaming:(BOOL)a3;
- (void)setCurrentCellularType:(int)a3;
- (void)setCurrentNetworkType:(int)a3;
- (void)setDataRoamingEnabled:(BOOL)a3;
- (void)setExpensive:(BOOL)a3;
- (void)setPathConstrained:(BOOL)a3;
- (void)setPathSatisfied:(BOOL)a3;
@end

@implementation SUNetworkMonitor

- (SUNetworkMonitor)init
{
  v24 = objc_msgSend(NSString, "stringWithFormat:", @"initiating SUNetworkMonitor [%p]", self);
  SULogDebug(@"[SUNetworkMonitor] %s: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUNetworkMonitor init]");

  v33.receiver = self;
  v33.super_class = (Class)SUNetworkMonitor;
  id v10 = [(SUNetworkMonitor *)&v33 init];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    v12 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;

    *((void *)v10 + 2) = 0;
    *((void *)v10 + 3) = 0;
    *((_WORD *)v10 + 16) = 0;
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.softwareupdateservices.SUNetworkMonitor.coreTelephonyQueue", v13);
    v15 = (void *)*((void *)v10 + 5);
    *((void *)v10 + 5) = v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.softwareupdateservices.SUNetworkMonitor.callbackQueue", v16);
    v18 = (void *)*((void *)v10 + 6);
    *((void *)v10 + 6) = v17;

    v19 = (void *)*((void *)v10 + 7);
    *((void *)v10 + 7) = 0;

    uint64_t default_evaluator = nw_path_create_default_evaluator();
    v21 = (void *)*((void *)v10 + 8);
    *((void *)v10 + 8) = default_evaluator;

    objc_initWeak(&location, v10);
    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    v29 = __24__SUNetworkMonitor_init__block_invoke;
    v30 = &unk_26447EA90;
    objc_copyWeak(&v31, &location);
    nw_path_evaluator_set_update_handler();
    v22 = *((void *)v10 + 5);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __24__SUNetworkMonitor_init__block_invoke_2;
    block[3] = &unk_26447C878;
    id v26 = v10;
    dispatch_sync(v22, block);
    nw_path_evaluator_start();

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return (SUNetworkMonitor *)v10;
}

void __24__SUNetworkMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _handleNWPath:v5];
  }
}

uint64_t __24__SUNetworkMonitor_init__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetCtClient];
  v2 = *(void **)(a1 + 32);
  return [v2 _initNetworkObservation];
}

- (void)dealloc
{
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"deallocating SUNetworkMonitor [%p]", self);
  SULogDebug(@"[SUNetworkMonitor] %s: %@", v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUNetworkMonitor dealloc]");

  if (self->_pathEvaluator) {
    nw_path_evaluator_cancel();
  }
  v11.receiver = self;
  v11.super_class = (Class)SUNetworkMonitor;
  [(SUNetworkMonitor *)&v11 dealloc];
}

+ (SUNetworkMonitor)sharedInstance
{
  if (sharedInstance_singletonPredicate != -1) {
    dispatch_once(&sharedInstance_singletonPredicate, &__block_literal_global_18);
  }
  v2 = (void *)sharedInstance___instance_9;
  return (SUNetworkMonitor *)v2;
}

uint64_t __34__SUNetworkMonitor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SUNetworkMonitor);
  uint64_t v1 = sharedInstance___instance_9;
  sharedInstance___instance_9 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (int)currentNetworkType
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  if ([(SUNetworkMonitor *)self _overriddenByPreferences])
  {
    int overriddenCurrentNetworkType = self->_overriddenCurrentNetworkType;
    *((_DWORD *)v8 + 6) = overriddenCurrentNetworkType;
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__SUNetworkMonitor_currentNetworkType__block_invoke;
    v6[3] = &unk_26447C8A0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(ctQueue, v6);
    int overriddenCurrentNetworkType = *((_DWORD *)v8 + 6);
  }
  _Block_object_dispose(&v7, 8);
  return overriddenCurrentNetworkType;
}

uint64_t __38__SUNetworkMonitor_currentNetworkType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 20);
  return result;
}

- (int)currentCellularType
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  if ([(SUNetworkMonitor *)self _overriddenByPreferences])
  {
    int overriddenCurrentCellularType = self->_overriddenCurrentCellularType;
    *((_DWORD *)v8 + 6) = overriddenCurrentCellularType;
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__SUNetworkMonitor_currentCellularType__block_invoke;
    v6[3] = &unk_26447C8A0;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(ctQueue, v6);
    int overriddenCurrentCellularType = *((_DWORD *)v8 + 6);
  }
  _Block_object_dispose(&v7, 8);
  return overriddenCurrentCellularType;
}

uint64_t __39__SUNetworkMonitor_currentCellularType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 24);
  return result;
}

- (BOOL)isCurrentNetworkTypeCellular
{
  uint64_t v3 = [(SUNetworkMonitor *)self currentNetworkType];
  return [(SUNetworkMonitor *)self isNetworkTypeCellular:v3];
}

- (BOOL)isCurrentNetworkTypeExpensive
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int v23 = 0;
  if (![(SUNetworkMonitor *)self _overriddenByPreferences])
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__SUNetworkMonitor_isCurrentNetworkTypeExpensive__block_invoke;
    block[3] = &unk_26447EAB8;
    void block[4] = self;
    block[5] = &v24;
    block[6] = &v20;
    dispatch_sync(ctQueue, block);
    if (*((unsigned char *)v25 + 24)) {
      goto LABEL_3;
    }
LABEL_8:
    BOOL v15 = 0;
    goto LABEL_9;
  }
  *((_DWORD *)v21 + 6) = self->_overriddenCurrentNetworkType;
  BOOL overriddenExpensive = self->_overriddenExpensive;
  *((unsigned char *)v25 + 24) = overriddenExpensive;
  if (!overriddenExpensive) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v4 = NSString;
  uint64_t v5 = SUStringFromNetworkType(*((_DWORD *)v21 + 6));
  uint64_t v6 = (void *)v5;
  if (*((unsigned char *)v25 + 24)) {
    uint64_t v7 = &stru_26CE93248;
  }
  else {
    uint64_t v7 = @"n't";
  }
  v18 = [v4 stringWithFormat:@"Current network %@ is%@ considered expensive", v5, v7];
  SULogInfo(@"[SUNetworkMonitor] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUNetworkMonitor isCurrentNetworkTypeExpensive]");

  BOOL v15 = *((unsigned char *)v25 + 24) != 0;
LABEL_9:
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v15;
}

void *__49__SUNetworkMonitor_isCurrentNetworkTypeExpensive__block_invoke(void *result)
{
  *(unsigned char *)(*(void *)(result[5] + 8) + 24) = *(unsigned char *)(result[4] + 30);
  *(_DWORD *)(*(void *)(result[6] + 8) + 24) = *(_DWORD *)(result[4] + 20);
  return result;
}

- (BOOL)isNetworkTypeCellular:(int)a3
{
  return (a3 - 2) < 8;
}

- (BOOL)isCellularRoaming
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if ([(SUNetworkMonitor *)self _overriddenByPreferences])
  {
    int overriddenRoaming = self->_overriddenRoaming;
    *((unsigned char *)v9 + 24) = overriddenRoaming;
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SUNetworkMonitor_isCellularRoaming__block_invoke;
    v7[3] = &unk_26447C8A0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(ctQueue, v7);
    int overriddenRoaming = *((unsigned __int8 *)v9 + 24);
  }
  BOOL v5 = overriddenRoaming != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __37__SUNetworkMonitor_isCellularRoaming__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 28);
  return result;
}

- (BOOL)isCellularDataRoamingEnabled
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  if ([(SUNetworkMonitor *)self _overriddenByPreferences])
  {
    int overriddenRoaming = self->_overriddenRoaming;
    *((unsigned char *)v9 + 24) = overriddenRoaming;
  }
  else
  {
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
    ctQueue = self->_ctQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __48__SUNetworkMonitor_isCellularDataRoamingEnabled__block_invoke;
    v7[3] = &unk_26447C8A0;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(ctQueue, v7);
    int overriddenRoaming = *((unsigned __int8 *)v9 + 24);
  }
  BOOL v5 = overriddenRoaming != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __48__SUNetworkMonitor_isCellularDataRoamingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 29);
  return result;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SUNetworkMonitor.m", 246, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  [(SUNetworkMonitor *)self _addObserver:v5];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SUNetworkMonitor.m", 251, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];

    id v5 = 0;
  }
  [(SUNetworkMonitor *)self _removeObserver:v5];
}

- (BOOL)isPathSatisfied
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = v2->_ctQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__SUNetworkMonitor_isPathSatisfied__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(ctQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __35__SUNetworkMonitor_isPathSatisfied__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 31);
  return result;
}

- (BOOL)isBootstrap
{
  uint64_t v16 = 0;
  dispatch_queue_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = self->_ctQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__SUNetworkMonitor_isBootstrap__block_invoke;
  block[3] = &unk_26447C9B8;
  void block[4] = self;
  block[5] = &v16;
  dispatch_sync(ctQueue, block);
  if (*((unsigned char *)v17 + 24)) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  uint64_t v14 = [NSString stringWithFormat:@"bootstrap = %@", v4];
  SULogInfo(@"[SUNetworkMonitor] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor isBootstrap]");

  char v12 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v12;
}

void __31__SUNetworkMonitor_isBootstrap__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  id v13 = 0;
  uint64_t v3 = [v2 usingBootstrapDataService:&v13];
  id v4 = v13;
  if (v4)
  {
    char v12 = [NSString stringWithFormat:@"failed to get result from usingBootstrapDataService: %@", v4];
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor isBootstrap]_block_invoke");
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLValue];
  }
}

- (BOOL)isCellularPossible
{
  v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = v2->_ctQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__SUNetworkMonitor_isCellularPossible__block_invoke;
  v5[3] = &unk_26447C8A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(ctQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __38__SUNetworkMonitor_isCellularPossible__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (id)operatorName
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__17;
  uint64_t v11 = __Block_byref_object_dispose__17;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = self->_ctQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SUNetworkMonitor_operatorName__block_invoke;
  v6[3] = &unk_26447C9B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ctQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __32__SUNetworkMonitor_operatorName__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) telephonyClient];
  id v36 = 0;
  uint64_t v3 = [v2 getCurrentDataSubscriptionContextSync:&v36];
  id v4 = v36;

  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v13 = [*(id *)(a1 + 32) telephonyClient];
    id v35 = 0;
    uint64_t v14 = [v13 getOperatorName:v3 error:&v35];
    id v4 = v35;
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if (v4)
    {
      v34 = [NSString stringWithFormat:@"Failed to get the operator name: %@", v4];
      SULogError(@"[SUNetworkMonitor] %s: %@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUNetworkMonitor operatorName]_block_invoke");

      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;
    }
    else
    {
      id v4 = [NSString stringWithFormat:@"Operator Name: %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      SULogInfo(@"[SUNetworkMonitor] %s: %@", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUNetworkMonitor operatorName]_block_invoke");
    }
  }
  else
  {
    objc_super v33 = [NSString stringWithFormat:@"Error copying data subscription context: %@", v4];
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUNetworkMonitor operatorName]_block_invoke");
  }
}

- (id)servingPlmn
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__17;
  uint64_t v11 = __Block_byref_object_dispose__17;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = self->_ctQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__SUNetworkMonitor_servingPlmn__block_invoke;
  v6[3] = &unk_26447C9B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(ctQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__SUNetworkMonitor_servingPlmn__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) telephonyClient];
  id v36 = 0;
  uint64_t v3 = [v2 getCurrentDataSubscriptionContextSync:&v36];
  id v4 = v36;

  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v13 = [*(id *)(a1 + 32) telephonyClient];
    id v35 = 0;
    uint64_t v14 = [v13 copyServingPlmn:v3 error:&v35];
    id v4 = v35;
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if (v4)
    {
      v34 = [NSString stringWithFormat:@"Failed to get the serving plmn: %@", v4];
      SULogError(@"[SUNetworkMonitor] %s: %@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUNetworkMonitor servingPlmn]_block_invoke");

      uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
      v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = 0;
    }
    else
    {
      id v4 = [NSString stringWithFormat:@"Serving Plmn: %@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      SULogInfo(@"[SUNetworkMonitor] %s: %@", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUNetworkMonitor servingPlmn]_block_invoke");
    }
  }
  else
  {
    objc_super v33 = [NSString stringWithFormat:@"Error copying data subscription context: %@", v4];
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUNetworkMonitor servingPlmn]_block_invoke");
  }
}

- (void)_addObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)_removeObserver:(id)a3
{
  if (a3)
  {
    p_observersLock = &self->_observersLock;
    id v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_observersLock);
  }
}

- (void)_runOnAllObservers:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    id v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_observersLock);
    callbackQueue = self->_callbackQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__SUNetworkMonitor__runOnAllObservers___block_invoke;
    v8[3] = &unk_26447C940;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(callbackQueue, v8);
  }
}

void __39__SUNetworkMonitor__runOnAllObservers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSHashTable)_allObservers
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v4 = (void *)[(NSHashTable *)self->_observers copy];
  os_unfair_lock_unlock(p_observersLock);
  return (NSHashTable *)v4;
}

- (void)_handleNWPath:(id)a3
{
  path = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (path)
  {
    BOOL is_expensive = nw_path_is_expensive(path);
    BOOL v5 = nw_path_get_status(path) == nw_path_status_satisfied;
    BOOL v6 = nw_path_uses_interface_type(path, nw_interface_type_wifi);
    BOOL v7 = nw_path_uses_interface_type(path, nw_interface_type_wired);
    BOOL v8 = nw_path_uses_interface_type(path, nw_interface_type_cellular);
    BOOL is_constrained = nw_path_is_constrained(path);
    uint64_t v26 = [NSString stringWithFormat:@"from nwpath, expensive = %d, satisfied = %d, wifi = %d, cellular = %d, wired = %d, constrained = %d", is_expensive, v5, v6, v8, v7, is_constrained];
    SULogDebug(@"[SUNetworkMonitor] %s: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUNetworkMonitor _handleNWPath:]");

    [(SUNetworkMonitor *)self setExpensive:is_expensive];
    [(SUNetworkMonitor *)self setPathSatisfied:v5];
    [(SUNetworkMonitor *)self setPathConstrained:is_constrained];
    if (v6 || v7)
    {
      uint64_t v18 = self;
      uint64_t currentCellularType = 1;
    }
    else if (v8)
    {
      uint64_t currentCellularType = self->_currentCellularType;
      uint64_t v18 = self;
    }
    else
    {
      uint64_t v18 = self;
      uint64_t currentCellularType = 0;
    }
    [(SUNetworkMonitor *)v18 setCurrentNetworkType:currentCellularType];
  }
  else
  {
    uint64_t v27 = [NSString stringWithFormat:@"path is nil"];
    SULogError(@"[SUNetworkMonitor] %s: %@", v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[SUNetworkMonitor _handleNWPath:]");
  }
}

- (BOOL)_overriddenByPreferences
{
  uint64_t v3 = +[SUPreferences sharedInstance];
  uint64_t v4 = [v3 networkMonitorOverride];

  if (v4 && ([v4 intValue] & 0x80000000) == 0 && (int)objc_msgSend(v4, "intValue") <= 9999)
  {
    self->_int overriddenCurrentNetworkType = (int)[v4 intValue] / 1000 % 10;
    self->_int overriddenCurrentCellularType = (int)[v4 intValue] / 100 % 10;
    HIDWORD(v6) = -858993459 * ((int)[v4 intValue] / 10) + 429496728;
    LODWORD(v6) = HIDWORD(v6);
    self->_int overriddenRoaming = (v6 >> 1) > 0x19999998;
    HIDWORD(v6) = 429496728 - 858993459 * [v4 intValue];
    LODWORD(v6) = HIDWORD(v6);
    BOOL v7 = (v6 >> 1) > 0x19999998;
    self->_BOOL overriddenExpensive = v7;
    uint64_t v16 = [NSString stringWithFormat:@"Overrides detected: network = %d, cellular = %d, roaming = %d, expensive = %d", self->_overriddenCurrentNetworkType, self->_overriddenCurrentCellularType, self->_overriddenRoaming, v7];
    SULogDebug(@"[SUNetworkMonitor] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUNetworkMonitor _overriddenByPreferences]");

    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_initNetworkObservation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUNetworkMonitor__initNetworkObservation__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  if (_initNetworkObservation_onceToken != -1) {
    dispatch_once(&_initNetworkObservation_onceToken, block);
  }
  uint64_t v3 = NSString;
  uint64_t v4 = SUStringFromNetworkType(self->_currentCellularType);
  uint64_t v5 = SUStringFromNetworkType(self->_currentNetworkType);
  unint64_t v6 = (void *)v5;
  BOOL v7 = @"YES";
  if (self->_isExpensive) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if (self->_dataRoamingEnabled) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  if (self->_roaming) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (self->_pathSatisfied) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (self->_pathConstrained) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if (!self->_cellularDataPossible) {
    BOOL v7 = @"NO";
  }
  uint64_t v20 = [v3 stringWithFormat:@"currentCellularType: %@, currentNetworkType: %@, isExpensive: %@, dataRoamingEnabled: %@, isRoaming: %@, pathSatisfied: %@, pathConstrained: %@, cellularDataPossible: %@", v4, v5, v8, v9, v10, v11, v12, v7];
  SULogDebug(@"[SUNetworkMonitor] %s: %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUNetworkMonitor _initNetworkObservation]");
}

void __43__SUNetworkMonitor__initNetworkObservation__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_init_internetDataStatus");
  id v2 = (id)nw_path_evaluator_copy_path();
  [*(id *)(a1 + 32) _handleNWPath:v2];
  objc_msgSend(*(id *)(a1 + 32), "_init_dataRoamingEnabled");
  objc_msgSend(*(id *)(a1 + 32), "_init_currentlyRoaming");
}

- (void)_init_dataRoamingEnabled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  uint64_t v3 = [(SUNetworkMonitor *)self telephonyClient];
  id v17 = 0;
  uint64_t v4 = [v3 getCurrentDataServiceDescriptorSync:&v17];
  id v5 = v17;

  if (!v4 || v5)
  {
    [NSString stringWithFormat:@"Error getting current data service descriptor: %@", v5];
  }
  else
  {
    unint64_t v6 = [(SUNetworkMonitor *)self telephonyClient];
    id v16 = 0;
    uint64_t v7 = [v6 getInternationalDataAccessSync:v4 error:&v16];
    id v5 = v16;

    if (!v5)
    {
      [(SUNetworkMonitor *)self setDataRoamingEnabled:v7];
      goto LABEL_7;
    }
    [NSString stringWithFormat:@"Failed to get international data status: %@", v5];
  uint64_t v15 = };
  SULogInfo(@"[SUNetworkMonitor] %s: %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUNetworkMonitor _init_dataRoamingEnabled]");

LABEL_7:
}

- (void)_init_currentlyRoaming
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  uint64_t v3 = [(SUNetworkMonitor *)self telephonyClient];
  id v34 = 0;
  uint64_t v4 = [v3 getCurrentDataSubscriptionContextSync:&v34];
  id v5 = v34;

  if (!v4 || v5)
  {
    uint64_t v7 = [NSString stringWithFormat:@"Error copying data subscription context: %@", v5];
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUNetworkMonitor _init_currentlyRoaming]");
  }
  else
  {
    unint64_t v6 = [(SUNetworkMonitor *)self telephonyClient];
    id v33 = 0;
    uint64_t v7 = (void *)[v6 copyRegistrationDisplayStatus:v4 error:&v33];
    id v5 = v33;

    if (!v7 || v5)
    {
      uint64_t v32 = [NSString stringWithFormat:@"Error copying registration display status: %@", v5];
      SULogInfo(@"[SUNetworkMonitor] %s: %@", v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUNetworkMonitor _init_currentlyRoaming]");
    }
    else
    {
      uint64_t v8 = [v7 registrationDisplayStatus];
      uint64_t v9 = [v8 isEqualToString:*MEMORY[0x263F03010]];

      uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"isRoaming = %d", v9);
      SULogInfo(@"[SUNetworkMonitor] %s: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUNetworkMonitor _init_currentlyRoaming]");

      [(SUNetworkMonitor *)self setCellularRoaming:v9];
    }
  }
}

- (void)_init_internetDataStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  uint64_t v3 = [(SUNetworkMonitor *)self telephonyClient];
  id v19 = 0;
  uint64_t v4 = [v3 getInternetDataStatusSync:&v19];
  id v5 = v19;

  if ((!v4 || v5) && ([v5 code] == 4097 || objc_msgSend(v5, "code") == 4099))
  {
    [(SUNetworkMonitor *)self _resetCtClient];

    unint64_t v6 = [(SUNetworkMonitor *)self telephonyClient];
    id v18 = 0;
    uint64_t v7 = [v6 getInternetDataStatusSync:&v18];
    id v5 = v18;

    uint64_t v4 = (void *)v7;
  }
  if (!v4 || v5)
  {
    uint64_t v17 = [NSString stringWithFormat:@"failed to get status from CoreTelephony with error %@", v5];
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUNetworkMonitor _init_internetDataStatus]");
  }
  else
  {
    uint64_t v8 = -[SUNetworkMonitor _networkTypeFromIndicator:](self, "_networkTypeFromIndicator:", [v4 indicator]);
    uint64_t v9 = [v4 cellularDataPossible];
    [(SUNetworkMonitor *)self setCurrentCellularType:v8];
    [(SUNetworkMonitor *)self setCellularDataPossible:v9];
  }
}

- (id)telephonyClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  ctClient = self->_ctClient;
  if (!ctClient)
  {
    [(SUNetworkMonitor *)self _resetCtClient];
    ctClient = self->_ctClient;
  }
  return ctClient;
}

- (void)_resetCtClient
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  ctClient = self->_ctClient;
  if (ctClient)
  {
    self->_ctClient = 0;
  }
  uint64_t v4 = (CoreTelephonyClient *)[objc_alloc(MEMORY[0x263F02D30]) initWithQueue:self->_ctQueue];
  id v5 = self->_ctClient;
  self->_ctClient = v4;

  unint64_t v6 = self->_ctClient;
  [(CoreTelephonyClient *)v6 setDelegate:self];
}

- (int)_networkTypeFromIndicator:(int)a3
{
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"Determining network type from cellular data indicator: %d", *(void *)&a3);
  SULogDebug(@"[SUNetworkMonitor] %s: %@", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUNetworkMonitor _networkTypeFromIndicator:]");

  if ((a3 - 1) > 0xB) {
    return 0;
  }
  else {
    return dword_21DDCF6B8[a3 - 1];
  }
}

- (void)setCellularRoaming:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_roaming != v3)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"isRoaming changed from %d to %d", self->_roaming, v3);
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setCellularRoaming:]");

    self->_roaming = v3;
    if (![(SUNetworkMonitor *)self _overriddenByPreferences])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __39__SUNetworkMonitor_setCellularRoaming___block_invoke;
      v13[3] = &unk_26447EAE0;
      v13[4] = self;
      [(SUNetworkMonitor *)self _runOnAllObservers:v13];
    }
  }
}

uint64_t __39__SUNetworkMonitor_setCellularRoaming___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 cellularRoamingStatusChanged:*(unsigned __int8 *)(*(void *)(a1 + 32) + 28)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (void)setDataRoamingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_dataRoamingEnabled != v3)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"The 'Data Roaming' setting changed from %d to %d", self->_dataRoamingEnabled, v3);
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setDataRoamingEnabled:]");

    self->_dataRoamingEnabled = v3;
  }
}

- (void)setCellularDataPossible:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_cellularDataPossible != v3)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"cellularDataPossible changed from %d to %d", self->_cellularDataPossible, v3);
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setCellularDataPossible:]");

    self->_cellularDataPossible = v3;
  }
}

- (void)setExpensive:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_isExpensive != v3)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"isExpensive changed from %d to %d", self->_isExpensive, v3);
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setExpensive:]");

    self->_isExpensive = v3;
  }
}

- (void)setPathSatisfied:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_pathSatisfied != v3)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"pathSatisfied changed from %d to %d", self->_pathSatisfied, v3);
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setPathSatisfied:]");

    self->_pathSatisfied = v3;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __37__SUNetworkMonitor_setPathSatisfied___block_invoke;
    v13[3] = &unk_26447EAE0;
    v13[4] = self;
    [(SUNetworkMonitor *)self _runOnAllObservers:v13];
  }
}

uint64_t __37__SUNetworkMonitor_setPathSatisfied___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 pathSatisficationStatusChangedTo:*(unsigned __int8 *)(*(void *)(a1 + 32) + 31)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (void)setPathConstrained:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (self->_pathConstrained != v3)
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"pathConstrained changed from %d to %d", self->_pathConstrained, v3);
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUNetworkMonitor setPathConstrained:]");

    self->_pathConstrained = v3;
  }
}

- (void)setCurrentNetworkType:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  unsigned int currentNetworkType = self->_currentNetworkType;
  if (currentNetworkType != a3)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = SUStringFromNetworkType(currentNetworkType);
    uint64_t v8 = SUStringFromNetworkType(a3);
    uint64_t v17 = [v6 stringWithFormat:@"Network type changed from %@ to %@", v7, v8];
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[SUNetworkMonitor setCurrentNetworkType:]");

    int v16 = self->_currentNetworkType;
    self->_unsigned int currentNetworkType = a3;
    if (![(SUNetworkMonitor *)self _overriddenByPreferences])
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __42__SUNetworkMonitor_setCurrentNetworkType___block_invoke;
      v18[3] = &unk_26447EB08;
      int v19 = v16;
      v18[4] = self;
      [(SUNetworkMonitor *)self _runOnAllObservers:v18];
    }
  }
}

uint64_t __42__SUNetworkMonitor_setCurrentNetworkType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 networkChangedFromNetworkType:*(unsigned int *)(a1 + 40) toNetworkType:*(unsigned int *)(*(void *)(a1 + 32) + 20)];
    }
  }
  return MEMORY[0x270F9A830]();
}

- (void)setCurrentCellularType:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  unsigned int currentCellularType = self->_currentCellularType;
  if (currentCellularType != a3)
  {
    uint64_t v6 = NSString;
    uint64_t v7 = SUStringFromNetworkType(currentCellularType);
    uint64_t v8 = SUStringFromNetworkType(a3);
    uint64_t v17 = [v6 stringWithFormat:@"Cellular type changed from %@ to %@", v7, v8];
    SULogInfo(@"[SUNetworkMonitor] %s: %@", v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[SUNetworkMonitor setCurrentCellularType:]");

    int v16 = self->_currentCellularType;
    self->_unsigned int currentCellularType = a3;
    if (![(SUNetworkMonitor *)self _overriddenByPreferences])
    {
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __43__SUNetworkMonitor_setCurrentCellularType___block_invoke;
      v18[3] = &unk_26447EB08;
      int v19 = v16;
      v18[4] = self;
      [(SUNetworkMonitor *)self _runOnAllObservers:v18];
    }
  }
}

uint64_t __43__SUNetworkMonitor_setCurrentCellularType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 cellularChangedFromCellularType:*(unsigned int *)(a1 + 40) toCellularType:*(unsigned int *)(*(void *)(a1 + 32) + 24)];
    }
  }
  return MEMORY[0x270F9A830]();
}

- (void)_carrierBundleChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (![(SUNetworkMonitor *)self _overriddenByPreferences])
  {
    [(SUNetworkMonitor *)self _runOnAllObservers:&__block_literal_global_127];
  }
}

uint64_t __41__SUNetworkMonitor__carrierBundleChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v4 = v2;
    if (objc_opt_respondsToSelector()) {
      [v4 carrierBundleChanged];
    }
  }
  return MEMORY[0x270F9A790]();
}

- (void)_operatorBundleChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ctQueue);
  if (![(SUNetworkMonitor *)self _overriddenByPreferences])
  {
    [(SUNetworkMonitor *)self _runOnAllObservers:&__block_literal_global_131];
  }
}

uint64_t __42__SUNetworkMonitor__operatorBundleChanged__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v4 = v2;
    if (objc_opt_respondsToSelector()) {
      [v4 operatorBundleChanged];
    }
  }
  return MEMORY[0x270F9A790]();
}

+ (BOOL)holdsWiFiAssertion
{
  return __assertionCount != 0;
}

+ (void)setHoldsWiFiAssertion:(BOOL)a3
{
  if (!+[SUUtility isWiFiCapable]) {
    return;
  }
  uint64_t v4 = __assertionCount;
  if (a3)
  {
    uint64_t v5 = 1;
  }
  else
  {
    if (!__assertionCount) {
      goto LABEL_7;
    }
    uint64_t v5 = -1;
  }
  uint64_t v4 = __assertionCount + v5;
  __assertionCount += v5;
LABEL_7:
  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"WiFi background assertion count changed: %lu", v4);
  SULogDebug(@"[SUNetworkMonitor] %s: %@", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"+[SUNetworkMonitor setHoldsWiFiAssertion:]");

  BOOL v13 = __assertionCount != 0;
  if (__wifiManager)
  {
    if (WiFiManagerClientGetType() != v13)
    {
      uint64_t v14 = __wifiManager;
      MEMORY[0x270F4B688](v14, v13);
    }
  }
  else
  {
    __wifiManager = WiFiManagerClientCreate();
  }
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v5 = a4;
  ctQueue = self->_ctQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__SUNetworkMonitor_displayStatusChanged_status___block_invoke;
  v8[3] = &unk_26447C8C8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(ctQueue, v8);
}

uint64_t __48__SUNetworkMonitor_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registrationDisplayStatus];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F03010]];

  uint64_t v4 = *(void **)(a1 + 40);
  return [v4 setCellularRoaming:v3];
}

- (void)operatorBundleChange:(id)a3
{
  ctQueue = self->_ctQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SUNetworkMonitor_operatorBundleChange___block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(ctQueue, block);
}

uint64_t __41__SUNetworkMonitor_operatorBundleChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _operatorBundleChanged];
}

- (void)carrierBundleChange:(id)a3
{
  ctQueue = self->_ctQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SUNetworkMonitor_carrierBundleChange___block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_async(ctQueue, block);
}

uint64_t __40__SUNetworkMonitor_carrierBundleChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _carrierBundleChanged];
}

- (void)internetDataStatus:(id)a3
{
  id v4 = a3;
  ctQueue = self->_ctQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SUNetworkMonitor_internetDataStatus___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(ctQueue, v7);
}

uint64_t __39__SUNetworkMonitor_internetDataStatus___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentCellularType:", objc_msgSend(*(id *)(a1 + 32), "_networkTypeFromIndicator:", objc_msgSend(*(id *)(a1 + 40), "indicator")));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) cellularDataPossible];
  return [v2 setCellularDataPossible:v3];
}

- (void)dataRoamingSettingsChanged:(id)a3 status:(BOOL)a4
{
  ctQueue = self->_ctQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__SUNetworkMonitor_dataRoamingSettingsChanged_status___block_invoke;
  v5[3] = &unk_26447CD98;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async(ctQueue, v5);
}

uint64_t __54__SUNetworkMonitor_dataRoamingSettingsChanged_status___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDataRoamingEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)detectOverriddenNetwork
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ctQueue);
  ctQueue = self->_ctQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke;
  block[3] = &unk_26447C878;
  void block[4] = self;
  dispatch_sync(ctQueue, block);
}

uint64_t __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v2 + 72);
  int v3 = *(_DWORD *)(v2 + 76);
  int v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t result = [(id)v2 _overriddenByPreferences];
  if (result)
  {
    uint64_t result = *(void *)(a1 + 32);
    if (v4 != *(_DWORD *)(result + 72))
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_2;
      v10[3] = &unk_26447EB08;
      int v11 = v4;
      v10[4] = result;
      [(id)result _runOnAllObservers:v10];
      uint64_t result = *(void *)(a1 + 32);
    }
    if (v3 != *(_DWORD *)(result + 76))
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_3;
      v8[3] = &unk_26447EB08;
      int v9 = v3;
      void v8[4] = result;
      [(id)result _runOnAllObservers:v8];
      uint64_t result = *(void *)(a1 + 32);
    }
    if (v5 != *(unsigned __int8 *)(result + 80))
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_4;
      v7[3] = &unk_26447EAE0;
      v7[4] = result;
      return [(id)result _runOnAllObservers:v7];
    }
  }
  return result;
}

uint64_t __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 networkChangedFromNetworkType:*(unsigned int *)(a1 + 40) toNetworkType:*(unsigned int *)(*(void *)(a1 + 32) + 72)];
    }
  }
  return MEMORY[0x270F9A830]();
}

uint64_t __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 cellularChangedFromCellularType:*(unsigned int *)(a1 + 40) toCellularType:*(unsigned int *)(*(void *)(a1 + 32) + 76)];
    }
  }
  return MEMORY[0x270F9A830]();
}

uint64_t __43__SUNetworkMonitor_detectOverriddenNetwork__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v5 = v3;
    if (objc_opt_respondsToSelector()) {
      [v5 cellularRoamingStatusChanged:*(unsigned __int8 *)(*(void *)(a1 + 32) + 80)];
    }
  }
  return MEMORY[0x270F9A828]();
}

- (OS_dispatch_queue)ctQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_ctQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end