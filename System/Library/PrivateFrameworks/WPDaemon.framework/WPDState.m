@interface WPDState
+ (int64_t)getWPStateFromCBManagerState:(int64_t)a3;
- (BOOL)initialUpdate;
- (BOOL)restricted;
- (NSMutableDictionary)cbStates;
- (NSMutableSet)cbManagers;
- (OS_dispatch_queue)cbQueue;
- (WPDState)initWithQueue:(id)a3;
- (id)description;
- (id)notification;
- (int64_t)state;
- (void)coalesceState:(int64_t *)a3 Restricted:(BOOL *)a4 UpdateCache:(BOOL)a5;
- (void)dealloc;
- (void)registerManager:(id)a3;
- (void)setCbManagers:(id)a3;
- (void)setCbQueue:(id)a3;
- (void)setCbStates:(id)a3;
- (void)setInitialUpdate:(BOOL)a3;
- (void)setNotification:(id)a3;
- (void)setRestricted:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)updateWithCompletion:(id)a3;
- (void)updateWithManager:(id)a3 Completion:(id)a4;
@end

@implementation WPDState

- (WPDState)initWithQueue:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WPDState;
  v5 = [(WPDState *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cbQueue, v4);
    v6->_state = 0;
    *(_WORD *)&v6->_restricted = 0;
    uint64_t v7 = objc_opt_new();
    cbManagers = v6->_cbManagers;
    v6->_cbManagers = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    cbStates = v6->_cbStates;
    v6->_cbStates = (NSMutableDictionary *)v9;
  }
  return v6;
}

- (void)dealloc
{
  [(WPDState *)self setState:0];
  [(WPDState *)self setRestricted:0];
  v3 = [(WPDState *)self cbStates];
  [v3 removeAllObjects];

  id v4 = [(WPDState *)self cbManagers];
  [v4 removeAllObjects];

  v5.receiver = self;
  v5.super_class = (Class)WPDState;
  [(WPDState *)&v5 dealloc];
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(WPDState *)self state];
  BOOL v5 = [(WPDState *)self restricted];
  v6 = "no";
  if (v5) {
    v6 = "yes";
  }
  return (id)[v3 stringWithFormat:@"state: %d, restricted: %s", v4, v6];
}

- (void)registerManager:(id)a3
{
  id v4 = a3;
  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_0);
  }
  BOOL v5 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
    -[WPDState registerManager:]((uint64_t)v4, v5);
  }
  v6 = [(WPDState *)self cbManagers];
  [v6 addObject:v4];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "state"));
  v8 = [(WPDState *)self cbStates];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  [v8 setObject:v7 forKeyedSubscript:v9];
}

- (void)updateWithManager:(id)a3 Completion:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if ([(WPDState *)self initialUpdate])
  {
    v8 = [(WPDState *)self cbManagers];
    char v9 = [v8 containsObject:v6];

    if (v9)
    {
      uint64_t v10 = [v6 state];
      v11 = [NSNumber numberWithInteger:v10];
      objc_super v12 = [(WPDState *)self cbStates];
      v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
      [v12 setObject:v11 forKeyedSubscript:v13];

      int64_t v14 = +[WPDState getWPStateFromCBManagerState:v10];
      int64_t v22 = v14;
      v15 = [NSNumber numberWithInteger:v10];
      unsigned __int8 v16 = [&unk_26D646E00 isEqualToNumber:v15];

      unsigned __int8 v21 = v16;
      if (v14 > [(WPDState *)self state] || (v16 & 1) == 0)
      {
        [(WPDState *)self coalesceState:&v22 Restricted:&v21 UpdateCache:0];
        int64_t v14 = v22;
      }
      if (v14 != [(WPDState *)self state] || (int v17 = v21, v17 != [(WPDState *)self restricted]))
      {
        [(WPDState *)self setState:v22];
        [(WPDState *)self setRestricted:v21];
        if (v7) {
          v7[2](v7);
        }
        if (WPLogInitOnce != -1) {
          dispatch_once(&WPLogInitOnce, &__block_literal_global_132);
        }
        v18 = WiProxLog;
        if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          id v24 = v6;
          __int16 v25 = 1024;
          int v26 = v22;
          __int16 v27 = 1024;
          int v28 = v21;
          _os_log_debug_impl(&dword_22316D000, v18, OS_LOG_TYPE_DEBUG, "WPDState updated with manager %@ to state: %d restricted: %d", buf, 0x18u);
        }
      }
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_127);
      }
      v20 = WiProxLog;
      if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_ERROR)) {
        -[WPDState updateWithManager:Completion:]((uint64_t)v6, v20);
      }
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_124);
    }
    v19 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDState updateWithManager:Completion:](v19);
    }
  }
}

- (void)updateWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v9 = 0;
  unsigned __int8 v8 = 0;
  [(WPDState *)self setInitialUpdate:1];
  [(WPDState *)self coalesceState:&v9 Restricted:&v8 UpdateCache:1];
  uint64_t v5 = v9;
  if (v5 != [(WPDState *)self state] || (int v6 = v8, v6 != [(WPDState *)self restricted]))
  {
    [(WPDState *)self setState:v9];
    [(WPDState *)self setRestricted:v8];
    if (v4) {
      v4[2](v4);
    }
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_134);
    }
    uint64_t v7 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      [(WPDState *)&v9 updateWithCompletion:v7];
    }
  }
}

- (void)coalesceState:(int64_t *)a3 Restricted:(BOOL *)a4 UpdateCache:(BOOL)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v21 = a5;
  if (a5)
  {
    unsigned __int8 v8 = [(WPDState *)self cbManagers];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __49__WPDState_coalesceState_Restricted_UpdateCache___block_invoke;
    v26[3] = &unk_26469AB10;
    v26[4] = self;
    [v8 enumerateObjectsUsingBlock:v26];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [(WPDState *)self cbStates];
  uint64_t v10 = [v9 allValues];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    int64_t v14 = 3;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v23 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v16 = [*(id *)(*((void *)&v22 + 1) + 8 * v15) integerValue];
      int64_t v17 = +[WPDState getWPStateFromCBManagerState:v16];
      if (v17 < v14) {
        int64_t v14 = v17;
      }
      v18 = [NSNumber numberWithInteger:v16];
      int v19 = [&unk_26D646E00 isEqualToNumber:v18];

      if (!v14 || (v19 & 1) != 0) {
        break;
      }
      if (v12 == ++v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v33 count:16];
        if (v12) {
          goto LABEL_5;
        }
        int v19 = 0;
        break;
      }
    }
  }
  else
  {
    int v19 = 0;
    int64_t v14 = 3;
  }

  if (WPLogInitOnce != -1) {
    dispatch_once(&WPLogInitOnce, &__block_literal_global_137);
  }
  v20 = WiProxLog;
  if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    int v28 = v14;
    __int16 v29 = 1024;
    int v30 = v19;
    __int16 v31 = 1024;
    BOOL v32 = v21;
    _os_log_debug_impl(&dword_22316D000, v20, OS_LOG_TYPE_DEBUG, "WPDState coalesce state:%d restricted:%d cache updated:%d ", buf, 0x14u);
  }
  *a3 = v14;
  *a4 = v19;
}

void __49__WPDState_coalesceState_Restricted_UpdateCache___block_invoke(uint64_t a1, void *a2)
{
  v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v4, "state"));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [*(id *)(a1 + 32) cbStates];
  int v6 = NSNumber;
  uint64_t v7 = [v4 hash];

  unsigned __int8 v8 = [v6 numberWithUnsignedInteger:v7];
  [v5 setObject:v9 forKeyedSubscript:v8];
}

+ (int64_t)getWPStateFromCBManagerState:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA) {
    return 0;
  }
  else {
    return qword_2231CEC18[a3];
  }
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)restricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

- (OS_dispatch_queue)cbQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cbQueue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setCbQueue:(id)a3
{
}

- (id)notification
{
  id WeakRetained = objc_loadWeakRetained(&self->_notification);
  return WeakRetained;
}

- (void)setNotification:(id)a3
{
}

- (NSMutableSet)cbManagers
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCbManagers:(id)a3
{
}

- (NSMutableDictionary)cbStates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCbStates:(id)a3
{
}

- (BOOL)initialUpdate
{
  return self->_initialUpdate;
}

- (void)setInitialUpdate:(BOOL)a3
{
  self->_initialUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cbStates, 0);
  objc_storeStrong((id *)&self->_cbManagers, 0);
  objc_destroyWeak(&self->_notification);
  objc_destroyWeak((id *)&self->_cbQueue);
}

- (void)registerManager:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_22316D000, a2, OS_LOG_TYPE_DEBUG, "WPDState registered manager %@", (uint8_t *)&v2, 0xCu);
}

- (void)updateWithManager:(uint64_t)a1 Completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22316D000, a2, OS_LOG_TYPE_ERROR, "WPDState update with manager - unexpected CBManager %@", (uint8_t *)&v2, 0xCu);
}

- (void)updateWithManager:(os_log_t)log Completion:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "WPDState update with manager - initialUpdate:NO, ignore", v1, 2u);
}

- (void)updateWithCompletion:(os_log_t)log .cold.1(uint64_t *a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl(&dword_22316D000, log, OS_LOG_TYPE_DEBUG, "WPDState updated to state:%d restricted:%d", (uint8_t *)v5, 0xEu);
}

@end