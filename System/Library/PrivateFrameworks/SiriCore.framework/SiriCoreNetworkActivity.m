@interface SiriCoreNetworkActivity
- (BOOL)hasStarted;
- (SiriCoreNetworkActivity)initWithLabel:(int64_t)a3 parent:(id)a4;
- (id)nwActivity;
- (id)nwActivityToken;
- (int)_completionReasonToNWActivityCompletionReason:(int64_t)a3;
- (int64_t)parentLabel;
- (void)_networkActivityState:(int64_t)a3;
- (void)activate;
- (void)addConnection:(id)a3;
- (void)removeConnection:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)stopWithCompletionReason:(int64_t)a3 andError:(id)a4;
@end

@implementation SiriCoreNetworkActivity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

- (int)_completionReasonToNWActivityCompletionReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return dword_21CC32930[a3 - 1];
  }
}

- (void)_networkActivityState:(int64_t)a3
{
  int64_t v3 = a3;
  switch(self->_state)
  {
    case 0:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
        int64_t v3 = 0;
      }
      break;
    case 1:
      if (a3 == 3 || !a3)
      {
        [(SiriCoreNetworkActivity *)self _networkActivityAbort];
        goto LABEL_15;
      }
      break;
    case 2:
      if ((unint64_t)a3 >= 2)
      {
        if (a3 == 2)
        {
          [(SiriCoreNetworkActivity *)self _networkActivityRestart];
LABEL_15:
          int64_t v3 = 0;
        }
      }
      else
      {
        [(SiriCoreNetworkActivity *)self _networkActivityAbort];
      }
      break;
    case 3:
      if ((unint64_t)a3 < 2) {
        int64_t v3 = 0;
      }
      break;
    default:
      break;
  }
  self->_state = v3;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (int64_t)parentLabel
{
  return self->_parentLabel;
}

- (id)nwActivityToken
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)uu = 0;
  uint64_t v6 = 0;
  nw_activity_get_token();
  int is_null = uuid_is_null(uu);
  int64_t v3 = 0;
  if (!is_null) {
    int64_t v3 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uu];
  }

  return v3;
}

- (id)nwActivity
{
  return self->_activity;
}

- (void)stopWithCompletionReason:(int64_t)a3 andError:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(SiriCoreNetworkActivity *)self _networkActivityState:3];
  if ([(NSMutableSet *)self->_connections count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = self->_connections;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          nw_connection_end_activity();
        }
        uint64_t v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v9);
    }
  }
  if (v6)
  {
    int v12 = [v6 code];
    v13 = [v6 userInfo];

    if (v13)
    {
      v14 = [v6 userInfo];
      v15 = [v14 objectForKey:*MEMORY[0x263F08608]];

      if (v15) {
        int v16 = [v15 code];
      }
      else {
        int v16 = -1;
      }
    }
    else
    {
      int v16 = -1;
    }
    v17 = *MEMORY[0x263F28350];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28350], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "-[SiriCoreNetworkActivity stopWithCompletionReason:andError:]";
      __int16 v24 = 1024;
      int v25 = v12;
      __int16 v26 = 1024;
      int v27 = v16;
      _os_log_impl(&dword_21CBF7000, v17, OS_LOG_TYPE_INFO, "%s Reporting to nw_activity that SiriCoreNetworkActivity failed with error code %d and underlying error code %d", buf, 0x18u);
    }
    -[SiriCoreNetworkActivity _completionReasonToNWActivityCompletionReason:](self, "_completionReasonToNWActivityCompletionReason:", a3, v18);
  }
  else
  {
    [(SiriCoreNetworkActivity *)self _completionReasonToNWActivityCompletionReason:a3];
  }
  nw_activity_complete_with_reason_and_underlying_error();
}

- (void)removeConnection:(id)a3
{
  if (self->_state == 2)
  {
    id v4 = a3;
    nw_connection_end_activity();
    [(NSMutableSet *)self->_connections removeObject:v4];
  }
}

- (void)addConnection:(id)a3
{
  id v5 = a3;
  int64_t state = self->_state;
  if (state <= 1)
  {
    [(SiriCoreNetworkActivity *)self _networkActivityState:2];
    int64_t state = self->_state;
  }
  if (state == 2)
  {
    nw_connection_start_activity();
    [(NSMutableSet *)self->_connections addObject:v5];
  }
}

- (void)activate
{
  if (self->_state <= 0)
  {
    [(SiriCoreNetworkActivity *)self _networkActivityState:1];
    if (self->_state == 1)
    {
      activity = self->_activity;
      MEMORY[0x270EF7998](activity);
    }
  }
}

- (SiriCoreNetworkActivity)initWithLabel:(int64_t)a3 parent:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriCoreNetworkActivity;
  uint64_t v7 = [(SiriCoreNetworkActivity *)&v13 init];
  if (v7)
  {
    if (a3)
    {
      uint64_t v8 = nw_activity_create();
      if (v6)
      {
        nw_activity_set_parent_activity();
        v7->_parentLabel = nw_activity_get_label();
      }
      uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      connections = v7->_connections;
      v7->_connections = v9;

      activity = v7->_activity;
      v7->_activity = (OS_nw_activity *)v8;
    }
    v7->_int64_t state = 0;
    v7->_hasStarted = 0;
  }

  return v7;
}

@end