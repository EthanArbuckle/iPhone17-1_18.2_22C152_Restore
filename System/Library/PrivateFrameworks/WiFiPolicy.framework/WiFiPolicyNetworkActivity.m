@interface WiFiPolicyNetworkActivity
- (BOOL)hasStarted;
- (WiFiPolicyNetworkActivity)initWithLabel:(int64_t)a3 parent:(id)a4;
- (id)description;
- (id)nwActivity;
- (id)nwActivityToken;
- (int64_t)getState;
- (int64_t)parentLabel;
- (void)_cancelActivityTimer;
- (void)_networkActivityState:(int64_t)a3;
- (void)_startActivityTimer;
- (void)_startMaxActivityLifetime;
- (void)activate;
- (void)addConnection:(id)a3;
- (void)removeConnection:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)stopWithCompletionReason:(int)a3 withClientMetric:(const char *)a4 withClientDict:(id)a5 andError:(id)a6;
@end

@implementation WiFiPolicyNetworkActivity

- (WiFiPolicyNetworkActivity)initWithLabel:(int64_t)a3 parent:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WiFiPolicyNetworkActivity;
  v8 = [(WiFiPolicyNetworkActivity *)&v15 init];
  if (v8)
  {
    if (a3)
    {
      v9 = _labelDescription(a3);
      NSLog(&cfstr_SCreatingActiv.isa, "-[WiFiPolicyNetworkActivity initWithLabel:parent:]", v9, v7 != 0);

      uint64_t v10 = nw_activity_create();
      if (v7)
      {
        nw_activity_set_parent_activity();
        v8->_parentLabel = nw_activity_get_label();
        objc_storeStrong((id *)&v8->_parentActivity, a4);
      }
      v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      connections = v8->_connections;
      v8->_connections = v11;

      activity = v8->_activity;
      v8->_activity = (OS_nw_activity *)v10;
    }
    v8->_state = 0;
    v8->_hasStarted = 0;
  }

  return v8;
}

- (void)activate
{
  if (self->_state > 0)
  {
    id v4 = [(OS_nw_activity *)self->_activity description];
    NSLog(&cfstr_SFailedToActiv_0.isa, "-[WiFiPolicyNetworkActivity activate]", v4, self->_state);
LABEL_8:

    return;
  }
  [(WiFiPolicyNetworkActivity *)self _networkActivityState:1];
  if (self->_state != 1)
  {
    id v4 = [(OS_nw_activity *)self->_activity description];
    NSLog(&cfstr_SFailedToActiv.isa, "-[WiFiPolicyNetworkActivity activate]", v4, self->_state);
    goto LABEL_8;
  }
  NSLog(&cfstr_SActivatingAct.isa, "-[WiFiPolicyNetworkActivity activate]");
  activity = self->_activity;

  MEMORY[0x1F40F2870](activity);
}

- (void)addConnection:(id)a3
{
  id v5 = a3;
  int64_t state = self->_state;
  if (state <= 1)
  {
    NSLog(&cfstr_SActivityHasSt.isa, "-[WiFiPolicyNetworkActivity addConnection:]", state);
    [(WiFiPolicyNetworkActivity *)self _networkActivityState:2];
    goto LABEL_5;
  }
  if (state != 2)
  {
    NSLog(&cfstr_SFailedToAddco.isa, "-[WiFiPolicyNetworkActivity addConnection:]", self->_activity, state);
LABEL_5:
    if (self->_state != 2) {
      goto LABEL_7;
    }
  }
  NSLog(&cfstr_SStartingActiv.isa, "-[WiFiPolicyNetworkActivity addConnection:]");
  nw_connection_start_activity();
  [(NSMutableSet *)self->_connections addObject:v5];
LABEL_7:
}

- (void)removeConnection:(id)a3
{
  id v5 = a3;
  int64_t state = self->_state;
  if (state == 2)
  {
    NSLog(&cfstr_SEndingActivit.isa, "-[WiFiPolicyNetworkActivity removeConnection:]");
    nw_connection_end_activity();
    [(NSMutableSet *)self->_connections removeObject:v5];
  }
  else
  {
    NSLog(&cfstr_SFailedToRemov.isa, "-[WiFiPolicyNetworkActivity removeConnection:]", self->_activity, state);
  }
}

- (void)stopWithCompletionReason:(int)a3 withClientMetric:(const char *)a4 withClientDict:(id)a5 andError:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a6;
  if (a4 && v9)
  {
    xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke;
    v27[3] = &unk_1E69BE270;
    id v28 = v11;
    id v12 = v11;
    [v9 enumerateKeysAndObjectsUsingBlock:v27];
    NSLog(&cfstr_SAddingClientM.isa, "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]", a4, v9);
    nw_activity_submit_metrics();
  }
  [(WiFiPolicyNetworkActivity *)self _networkActivityState:3];
  if ([(NSMutableSet *)self->_connections count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v13 = self->_connections;
    uint64_t v14 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          NSLog(&cfstr_SEndingActivit_0.isa, "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]");
          nw_connection_end_activity();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableSet *)v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v15);
    }
  }
  if (v10)
  {
    uint64_t v18 = [v10 code];
    v19 = [v10 userInfo];

    if (v19)
    {
      v20 = [v10 userInfo];
      v21 = [v20 objectForKey:*MEMORY[0x1E4F28A50]];

      if (v21) {
        uint64_t v22 = [v21 code];
      }
      else {
        uint64_t v22 = 0xFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v22 = 0xFFFFFFFFLL;
    }
    NSLog(&cfstr_SReportingToNw.isa, "-[WiFiPolicyNetworkActivity stopWithCompletionReason:withClientMetric:withClientDict:andError:]", v18, v22);
    nw_activity_complete_with_reason_and_underlying_error();
  }
  else
  {
    nw_activity_complete_with_reason();
  }
}

void __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = *(void **)(a1 + 32);
    id v7 = v11;
    id v8 = v5;
    id v9 = (const char *)[v7 UTF8String];
    [v8 doubleValue];
    xpc_dictionary_set_double(v6, v9, v10);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke_cold_1((uint64_t)v11, (uint64_t)v5);
    }
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), (const char *)[v11 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
  }
}

- (void)_startMaxActivityLifetime
{
  v3 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  dispatch_time_t v4 = dispatch_time(0, 100000000000);
  dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __54__WiFiPolicyNetworkActivity__startMaxActivityLifetime__block_invoke;
  handler[3] = &unk_1E69BD148;
  uint64_t v11 = 100;
  id v5 = v3;
  id v9 = v5;
  double v10 = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  activityTimer = self->_activityTimer;
  self->_activityTimer = (OS_dispatch_source *)v5;
  id v7 = v5;
}

void __54__WiFiPolicyNetworkActivity__startMaxActivityLifetime__block_invoke(uint64_t a1)
{
  NSLog(&cfstr_SActivityStill.isa, "-[WiFiPolicyNetworkActivity _startMaxActivityLifetime]_block_invoke", *(void *)(a1 + 48));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2 == *(void **)(v3 + 56))
  {
    *(void *)(v3 + 56) = 0;
  }
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.wifi.policy.nwactivity" code:1 userInfo:0];
  dispatch_time_t v4 = [*(id *)(a1 + 40) description];
  NSLog(&cfstr_SCancellingAct.isa, "-[WiFiPolicyNetworkActivity _startMaxActivityLifetime]_block_invoke", v4);

  id v5 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
  [v5 networkActivityStop:nw_activity_get_label() withReason:4 withClientMetric:0 withClientDict:0 andError:v6];
}

- (void)_startActivityTimer
{
  [(WiFiPolicyNetworkActivity *)self _cancelActivityTimer];

  [(WiFiPolicyNetworkActivity *)self _startMaxActivityLifetime];
}

- (void)_cancelActivityTimer
{
  activityTimer = self->_activityTimer;
  if (activityTimer)
  {
    dispatch_source_cancel(activityTimer);
    dispatch_time_t v4 = self->_activityTimer;
    self->_activityTimer = 0;
  }
}

- (id)nwActivity
{
  return self->_activity;
}

- (id)nwActivityToken
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)uu = 0;
  uint64_t v6 = 0;
  nw_activity_get_token();
  int is_null = uuid_is_null(uu);
  uint64_t v3 = 0;
  if (!is_null) {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];
  }

  return v3;
}

- (int64_t)parentLabel
{
  return self->_parentLabel;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
  if (a3) {
    [(WiFiPolicyNetworkActivity *)self _startActivityTimer];
  }
  else {
    [(WiFiPolicyNetworkActivity *)self _cancelActivityTimer];
  }
}

- (void)setQueue:(id)a3
{
}

- (int64_t)getState
{
  return self->_state;
}

- (id)description
{
  parentActivity = self->_parentActivity;
  dispatch_time_t v4 = NSString;
  uint64_t domain = nw_activity_get_domain();
  uint64_t label = nw_activity_get_label();
  uint64_t v7 = [(WiFiPolicyNetworkActivity *)self nwActivityToken];
  id v8 = (void *)v7;
  if (parentActivity)
  {
    uint64_t v9 = nw_activity_get_domain();
    uint64_t v10 = nw_activity_get_label();
    uint64_t v11 = [(OS_nw_activity *)self->_parentActivity description];
    id v12 = [v4 stringWithFormat:@"nw_activity %d:%d[%@] parent nw_activity %d:%d[%@]", domain, label, v8, v9, v10, v11];
  }
  else
  {
    id v13 = (id)[v4 stringWithFormat:@"nw_activity %d:%d[%@]", domain, label, v7];
    id v12 = 0;
  }

  return v12;
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
      if (!a3) {
        goto LABEL_8;
      }
      break;
    case 2:
      if ((unint64_t)a3 >= 2)
      {
        if (a3 == 2)
        {
          [(WiFiPolicyNetworkActivity *)self _networkActivityRestart];
          int64_t v3 = 0;
        }
      }
      else
      {
LABEL_8:
        [(WiFiPolicyNetworkActivity *)self _networkActivityAbort];
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
  self->_int64_t state = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activityTimer, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_parentActivity, 0);

  objc_storeStrong((id *)&self->_activity, 0);
}

void __95__WiFiPolicyNetworkActivity_stopWithCompletionReason_withClientMetric_withClientDict_andError___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
}

@end