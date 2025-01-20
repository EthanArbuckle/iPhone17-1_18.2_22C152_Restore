@interface WPDPendingCompletions
- (NSMutableArray)pendingCompletions;
- (NSString)name;
- (WPDPendingCompletions)initWithName:(id)a3;
- (id)description;
- (unint64_t)addCompletion:(id)a3;
- (unint64_t)lastID;
- (void)completeID:(unint64_t)a3 success:(BOOL)a4;
- (void)setLastID:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setPendingCompletions:(id)a3;
@end

@implementation WPDPendingCompletions

- (WPDPendingCompletions)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WPDPendingCompletions;
  v6 = [(WPDPendingCompletions *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v7->_lastID = 0;
    uint64_t v8 = objc_opt_new();
    pendingCompletions = v7->_pendingCompletions;
    v7->_pendingCompletions = (NSMutableArray *)v8;
  }
  return v7;
}

- (id)description
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [NSString stringWithFormat:@"%@ pending completions:%lu, last ID:%lu\n", v2->_name, -[NSMutableArray count](v2->_pendingCompletions, "count"), v2->_lastID];
  objc_sync_exit(v2);

  return v3;
}

- (unint64_t)addCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    if ([(WPDPendingCompletions *)v5 lastID] == -1)
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_125);
      }
      uint64_t v8 = (id)WiProxLog;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[WPDPendingCompletions addCompletion:]((uint64_t)v5->_name, (uint8_t *)&v12, [(NSMutableArray *)v5->_pendingCompletions count], v8);
      }
      unint64_t v7 = 0;
    }
    else
    {
      v6 = [(WPDPendingCompletions *)v5 pendingCompletions];
      [v6 addObject:v4];

      unint64_t v7 = [(WPDPendingCompletions *)v5 lastID] + 1;
      [(WPDPendingCompletions *)v5 setLastID:v7];
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_2);
      }
      uint64_t v8 = (id)WiProxLog;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        name = v5->_name;
        uint64_t v10 = [(NSMutableArray *)v5->_pendingCompletions count];
        int v12 = 138412802;
        v13 = name;
        __int16 v14 = 2048;
        unint64_t v15 = v7;
        __int16 v16 = 2048;
        uint64_t v17 = v10;
        _os_log_debug_impl(&dword_22316D000, v8, OS_LOG_TYPE_DEBUG, "WPDSearchPartyAgent %@ added completion ID:%lu, outstanding:%lu", (uint8_t *)&v12, 0x20u);
      }
    }

    objc_sync_exit(v5);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)completeID:(unint64_t)a3 success:(BOOL)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v5 = a4;
    unint64_t v7 = (void *)MEMORY[0x223CB05A0](self, a2);
    uint64_t v8 = self;
    objc_sync_enter(v8);
    unint64_t v9 = a3 - v8->_lastID + [(NSMutableArray *)v8->_pendingCompletions count];
    if (v9 <= [(NSMutableArray *)v8->_pendingCompletions count])
    {
      -[NSMutableArray subarrayWithRange:](v8->_pendingCompletions, "subarrayWithRange:", 0, v9);
      uint64_t v18 = (WPDPendingCompletions *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](v8->_pendingCompletions, "removeObjectsInRange:", 0, v9);
      if (![(NSMutableArray *)v8->_pendingCompletions count]) {
        v8->_unint64_t lastID = 0;
      }
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_133);
      }
      v19 = (id)WiProxLog;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        unint64_t lastID = v8->_lastID;
        name = v8->_name;
        uint64_t v25 = [(NSMutableArray *)v8->_pendingCompletions count];
        *(_DWORD *)buf = 138413570;
        v28 = name;
        __int16 v29 = 2048;
        unint64_t v30 = a3;
        __int16 v31 = 2048;
        unint64_t v32 = v9;
        __int16 v33 = 1024;
        *(_DWORD *)v34 = v5;
        *(_WORD *)&v34[4] = 2048;
        *(void *)&v34[6] = lastID;
        __int16 v35 = 2048;
        uint64_t v36 = v25;
        _os_log_debug_impl(&dword_22316D000, v19, OS_LOG_TYPE_DEBUG, "WPDSearchPartyAgent %@ will complete ID:%lu (count %lu), success:%d, last ID:%lU pending:%lu", buf, 0x3Au);
      }

      objc_sync_exit(v8);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __44__WPDPendingCompletions_completeID_success___block_invoke_134;
      v26[3] = &__block_descriptor_40_e22_v32__0___v__q_8Q16_B24l;
      v26[4] = !v5;
      [(WPDPendingCompletions *)v18 enumerateObjectsUsingBlock:v26];
      uint64_t v8 = v18;
    }
    else
    {
      if (WPLogInitOnce != -1) {
        dispatch_once(&WPLogInitOnce, &__block_literal_global_130);
      }
      uint64_t v10 = (id)WiProxLog;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unint64_t v20 = v8->_lastID;
        v21 = v8->_name;
        uint64_t v22 = [(NSMutableArray *)v8->_pendingCompletions count];
        *(_DWORD *)buf = 138413058;
        v28 = v21;
        __int16 v29 = 2048;
        unint64_t v30 = a3;
        __int16 v31 = 2048;
        unint64_t v32 = v20;
        __int16 v33 = 2048;
        *(void *)v34 = v22;
        _os_log_error_impl(&dword_22316D000, v10, OS_LOG_TYPE_ERROR, "WPDSearchPartyAgent %@ NOOP unexpected completion ID:%lu, last known ID:%lu, pending count:%lu", buf, 0x2Au);
      }

      objc_sync_exit(v8);
    }
  }
  else
  {
    if (WPLogInitOnce != -1) {
      dispatch_once(&WPLogInitOnce, &__block_literal_global_127_0);
    }
    objc_super v11 = WiProxLog;
    if (os_log_type_enabled((os_log_t)WiProxLog, OS_LOG_TYPE_DEBUG)) {
      -[WPDPendingCompletions completeID:success:]((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

uint64_t __44__WPDPendingCompletions_completeID_success___block_invoke_134(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

- (NSMutableArray)pendingCompletions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPendingCompletions:(id)a3
{
}

- (unint64_t)lastID
{
  return self->_lastID;
}

- (void)setLastID:(unint64_t)a3
{
  self->_unint64_t lastID = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pendingCompletions, 0);
}

- (void)addCompletion:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(void *)(buf + 14) = 0;
  *((_WORD *)buf + 11) = 2048;
  *((void *)buf + 3) = a3;
  _os_log_error_impl(&dword_22316D000, log, OS_LOG_TYPE_ERROR, "WPDSearchPartyAgent %@ cannot increment completion ID:%lu, outstanding:%lu", buf, 0x20u);
}

- (void)completeID:(uint64_t)a3 success:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end