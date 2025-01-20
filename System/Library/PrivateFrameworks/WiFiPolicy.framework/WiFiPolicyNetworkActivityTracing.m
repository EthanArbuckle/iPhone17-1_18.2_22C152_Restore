@interface WiFiPolicyNetworkActivityTracing
+ (id)sharedNetworkActivityTracing;
- (BOOL)hasActivitiesRunning;
- (WiFiPolicyNetworkActivityTracing)init;
- (void)_networkActivityActivate:(int64_t)a3;
- (void)_networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4;
- (void)_networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5;
- (void)_networkActivityStart:(int64_t)a3 activate:(BOOL)a4;
- (void)_networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7;
- (void)_networkActivityTracingCancel;
- (void)currentNetworkActivityTokenWithCompletion:(id)a3;
- (void)networkActivityActivate:(int64_t)a3;
- (void)networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4;
- (void)networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5;
- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4;
- (void)networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7;
- (void)networkActivityTracingCompleteConnectionsActivities;
@end

@implementation WiFiPolicyNetworkActivityTracing

+ (id)sharedNetworkActivityTracing
{
  if (sharedNetworkActivityTracing_sActivityTracerInitToken != -1) {
    dispatch_once(&sharedNetworkActivityTracing_sActivityTracerInitToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedNetworkActivityTracing_sActivityTracer;

  return v2;
}

uint64_t __64__WiFiPolicyNetworkActivityTracing_sharedNetworkActivityTracing__block_invoke()
{
  v0 = objc_alloc_init(WiFiPolicyNetworkActivityTracing);
  uint64_t v2 = sharedNetworkActivityTracing_sActivityTracer;
  sharedNetworkActivityTracing_sActivityTracer = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v2, v1);
}

- (WiFiPolicyNetworkActivityTracing)init
{
  v12.receiver = self;
  v12.super_class = (Class)WiFiPolicyNetworkActivityTracing;
  uint64_t v2 = [(WiFiPolicyNetworkActivityTracing *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:11];
    activities = v2->_activities;
    v2->_activities = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:4];
    connections = v2->_connections;
    v2->_connections = (NSMutableSet *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v9 = dispatch_queue_create("network.activity.tracing", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WiFiPolicyNetworkActivityTracing_networkActivityStart_activate___block_invoke;
  block[3] = &unk_1E69BCFE0;
  block[4] = self;
  block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(queue, block);
}

uint64_t __66__WiFiPolicyNetworkActivityTracing_networkActivityStart_activate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityStart:*(void *)(a1 + 40) activate:*(unsigned __int8 *)(a1 + 48)];
}

- (void)networkActivityActivate:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__WiFiPolicyNetworkActivityTracing_networkActivityActivate___block_invoke;
  v4[3] = &unk_1E69BD378;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __60__WiFiPolicyNetworkActivityTracing_networkActivityActivate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityActivate:*(void *)(a1 + 40)];
}

- (void)networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  if (a3 == 1) {
    NSLog(&cfstr_SLinktest.isa, "-[WiFiPolicyNetworkActivityTracing networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", @"linkTest");
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__WiFiPolicyNetworkActivityTracing_networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke;
  block[3] = &unk_1E69BE1B0;
  int v22 = a4;
  int64_t v20 = a3;
  v21 = a5;
  block[4] = self;
  id v18 = v12;
  id v19 = v13;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(queue, block);
}

uint64_t __108__WiFiPolicyNetworkActivityTracing_networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityStop:*(void *)(a1 + 56) withReason:*(unsigned int *)(a1 + 72) withClientMetric:*(void *)(a1 + 64) withClientDict:*(void *)(a1 + 40) andError:*(void *)(a1 + 48)];
}

- (void)networkActivityTracingCompleteConnectionsActivities
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WiFiPolicyNetworkActivityTracing_networkActivityTracingCompleteConnectionsActivities__block_invoke;
  block[3] = &unk_1E69BC8D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __87__WiFiPolicyNetworkActivityTracing_networkActivityTracingCompleteConnectionsActivities__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityTracingCancel];
}

- (void)networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WiFiPolicyNetworkActivityTracing_networkActivityAddNWConnection_toActivityWithLabel___block_invoke;
  block[3] = &unk_1E69BD148;
  block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __87__WiFiPolicyNetworkActivityTracing_networkActivityAddNWConnection_toActivityWithLabel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityAddNWConnection:*(void *)(a1 + 40) toActivityWithLabel:*(void *)(a1 + 48)];
}

- (void)networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__WiFiPolicyNetworkActivityTracing_networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke;
  v13[3] = &unk_1E69BE1D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

uint64_t __103__WiFiPolicyNetworkActivityTracing_networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _networkActivityRemoveNWConnection:*(void *)(a1 + 40) fromActivityWithLabel:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)currentNetworkActivityTokenWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WiFiPolicyNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke;
  v7[3] = &unk_1E69BCE00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __78__WiFiPolicyNetworkActivityTracing_currentNetworkActivityTokenWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:@"linkTest"];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  if (v2)
  {
    id v4 = [v2 nwActivityToken];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (BOOL)hasActivitiesRunning
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__WiFiPolicyNetworkActivityTracing_hasActivitiesRunning__block_invoke;
  v5[3] = &unk_1E69BD5B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__WiFiPolicyNetworkActivityTracing_hasActivitiesRunning__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_networkActivityStart:(int64_t)a3 activate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v7 = _labelDescription(a3);
  uint64_t v8 = [(NSMutableDictionary *)self->_activities objectForKey:v7];
  if (!v8)
  {
    if (a3 == 1)
    {
      id v11 = [[WiFiPolicyNetworkActivity alloc] initWithLabel:1 parent:0];
      if (v11)
      {
LABEL_5:
        [(NSMutableDictionary *)self->_activities setObject:v11 forKey:v7];
        if (v4) {
          [(WiFiPolicyNetworkActivityTracing *)self _networkActivityActivate:a3];
        }
        if ([(NSMutableSet *)self->_connections count])
        {
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v12 = self->_connections;
          uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v25;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v25 != v15) {
                  objc_enumerationMutation(v12);
                }
                [(WiFiPolicyNetworkActivity *)v11 addConnection:*(void *)(*((void *)&v24 + 1) + 8 * i)];
              }
              uint64_t v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
            }
            while (v14);
          }
        }
        [(WiFiPolicyNetworkActivity *)v11 setQueue:self->_queue];
        v17 = v11;
        goto LABEL_23;
      }
    }
    else
    {
      id v18 = [(NSMutableDictionary *)self->_activities objectForKey:@"linkTest"];
      id v19 = v18;
      if (v18)
      {
        int64_t v20 = [v18 nwActivity];
        id v11 = [[WiFiPolicyNetworkActivity alloc] initWithLabel:a3 parent:v20];
      }
      else
      {
        id v11 = 0;
      }

      if (v11) {
        goto LABEL_5;
      }
    }
    if ([0 hasStarted])
    {
LABEL_24:
      v21 = _labelDescription(a3);
      activities = self->_activities;
      v23 = [(WiFiPolicyNetworkActivity *)v11 description];
      NSLog(&cfstr_SStartActivity.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStart:activate:]", v21, activities, v23);

      goto LABEL_25;
    }
    v17 = 0;
LABEL_23:
    [(WiFiPolicyNetworkActivity *)v17 setHasStarted:1];
    goto LABEL_24;
  }
  char v9 = _labelDescription(a3);
  id v10 = [v8 description];
  NSLog(&cfstr_SFailedToStart.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStart:activate:]", v9, v10, self->_activities);

LABEL_25:
}

- (void)_networkActivityActivate:(int64_t)a3
{
  activities = self->_activities;
  uint64_t v6 = _labelDescription(a3);
  id v9 = [(NSMutableDictionary *)activities objectForKey:v6];

  v7 = v9;
  if (!v9)
  {
    uint64_t v8 = _labelDescription(a3);
    NSLog(&cfstr_SFailedToFindA.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityActivate:]", v8, self->_activities);

    v7 = 0;
  }
  [v7 activate];
}

- (void)_networkActivityStop:(int64_t)a3 withReason:(int)a4 withClientMetric:(const char *)a5 withClientDict:(id)a6 andError:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a6;
  id v13 = a7;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__7;
  v42 = __Block_byref_object_dispose__7;
  id v43 = [MEMORY[0x1E4F1CA48] array];
  activities = self->_activities;
  uint64_t v15 = _labelDescription(a3);
  int64_t v16 = [(NSMutableDictionary *)activities objectForKey:v15];

  v17 = _labelDescription(a3);
  if (v16)
  {
    id v18 = self->_activities;
    id v19 = [v16 description];
    NSLog(&cfstr_SStoppingActiv.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v17, v18, v19);
  }
  else
  {
    NSLog(&cfstr_SFailedToFindA.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v17, self->_activities);
  }

  if (a3 == 1)
  {
    int64_t v20 = _labelDescription(1uLL);
    v21 = [v16 description];
    NSLog(&cfstr_SStoppingParen.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v20, v21);

    int v22 = self->_activities;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __109__WiFiPolicyNetworkActivityTracing__networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke;
    v29[3] = &unk_1E69BE200;
    uint64_t v35 = 1;
    v36 = a5;
    id v30 = v12;
    id v31 = v16;
    int v37 = v9;
    id v32 = v13;
    v33 = &v44;
    v34 = &v38;
    [(NSMutableDictionary *)v22 enumerateKeysAndObjectsUsingBlock:v29];
  }
  if ([v16 hasStarted])
  {
    if (a5 && v12)
    {
      v23 = _labelDescription(a3);
      NSLog(&cfstr_SStoppingNetwo_1.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v23, v9, a5, v12, v13);
    }
    else
    {
      v23 = _labelDescription(a3);
      NSLog(&cfstr_SStoppingNetwo_2.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v23, v9, v13);
    }

    [v16 setHasStarted:0];
    [v16 stopWithCompletionReason:v9 withClientMetric:a5 withClientDict:v12 andError:v13];
    *((unsigned char *)v45 + 24) = 1;
    if ([v16 getState] == 3)
    {
      long long v24 = _labelDescription(a3);
      long long v25 = [v16 description];
      NSLog(&cfstr_SWillRemoveEnd_0.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v24, v25);

      long long v26 = (void *)v39[5];
      long long v27 = _labelDescription(a3);
      [v26 addObject:v27];
    }
  }
  if (!*((unsigned char *)v45 + 24))
  {
    v28 = _labelDescription(a3);
    NSLog(&cfstr_SFailedToStopA.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", v28, self->_activities);
  }
  if ([(id)v39[5] count])
  {
    [(NSMutableDictionary *)self->_activities removeObjectsForKeys:v39[5]];
    NSLog(&cfstr_SThereAreLuRem.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", [(NSMutableDictionary *)self->_activities count], self->_activities);
  }
  if (a3 == 1)
  {
    if ([(NSMutableDictionary *)self->_activities count]) {
      NSLog(&cfstr_SWhenStoppingP.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]", [(NSMutableDictionary *)self->_activities count], self->_activities);
    }
    [(WiFiPolicyNetworkActivityTracing *)self _networkActivityTracingCancel];
  }

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);
}

void __109__WiFiPolicyNetworkActivityTracing__networkActivityStop_withReason_withClientMetric_withClientDict_andError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v5 parentLabel] == *(void *)(a1 + 72) && objc_msgSend(v5, "hasStarted"))
  {
    if (*(void *)(a1 + 80) && *(void *)(a1 + 32))
    {
      uint64_t v6 = [*(id *)(a1 + 40) description];
      NSLog(&cfstr_SStoppingNetwo.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke", v6, *(unsigned int *)(a1 + 88), *(void *)(a1 + 80), *(void *)(a1 + 32), *(void *)(a1 + 48));
    }
    else
    {
      uint64_t v6 = [*(id *)(a1 + 40) description];
      NSLog(&cfstr_SStoppingNetwo_0.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke", v6, *(unsigned int *)(a1 + 88), *(void *)(a1 + 48));
    }

    [v5 setHasStarted:0];
    [v5 stopWithCompletionReason:*(unsigned int *)(a1 + 88) withClientMetric:*(void *)(a1 + 80) withClientDict:*(void *)(a1 + 32) andError:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if ([v5 getState] == 3)
    {
      uint64_t v8 = _labelDescription(*(void *)(a1 + 72));
      uint64_t v9 = [*(id *)(a1 + 40) description];
      NSLog(&cfstr_SWillRemoveEnd.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke", v8, v9);

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v10];
    }
  }
  else if ([v5 parentLabel] == *(void *)(a1 + 72) && (objc_msgSend(v5, "hasStarted") & 1) == 0)
  {
    v7 = [*(id *)(a1 + 40) description];
    NSLog(&cfstr_SFailedToStopN.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityStop:withReason:withClientMetric:withClientDict:andError:]_block_invoke", v7, *(unsigned int *)(a1 + 88), *(void *)(a1 + 48));
  }
}

- (void)_networkActivityTracingCancel
{
  [(NSMutableDictionary *)self->_activities enumerateKeysAndObjectsUsingBlock:&__block_literal_global_54];
  [(NSMutableDictionary *)self->_activities removeAllObjects];
  connections = self->_connections;

  [(NSMutableSet *)connections removeAllObjects];
}

void __65__WiFiPolicyNetworkActivityTracing__networkActivityTracingCancel__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  unsigned int v4 = [v3 hasStarted];
  id v5 = [v3 description];

  NSLog(&cfstr_SFailedToPrope.isa, "-[WiFiPolicyNetworkActivityTracing _networkActivityTracingCancel]_block_invoke", v4, v5);
}

- (void)_networkActivityAddNWConnection:(id)a3 toActivityWithLabel:(int64_t)a4
{
  id v6 = a3;
  if (([(NSMutableSet *)self->_connections containsObject:v6] & 1) == 0)
  {
    [(NSMutableSet *)self->_connections addObject:v6];
    activities = self->_activities;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__WiFiPolicyNetworkActivityTracing__networkActivityAddNWConnection_toActivityWithLabel___block_invoke;
    v8[3] = &unk_1E69BE248;
    int64_t v10 = a4;
    id v9 = v6;
    [(NSMutableDictionary *)activities enumerateKeysAndObjectsUsingBlock:v8];
  }
}

void __88__WiFiPolicyNetworkActivityTracing__networkActivityAddNWConnection_toActivityWithLabel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  unsigned int v4 = [v7 nwActivity];
  int label = nw_activity_get_label();
  uint64_t v6 = *(void *)(a1 + 40);

  if (v6 == label) {
    [v7 addConnection:*(void *)(a1 + 32)];
  }
}

- (void)_networkActivityRemoveNWConnection:(id)a3 fromActivityWithLabel:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  if ([(NSMutableSet *)self->_connections containsObject:v8])
  {
    [(NSMutableSet *)self->_connections removeObject:v8];
    activities = self->_activities;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__WiFiPolicyNetworkActivityTracing__networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke;
    v11[3] = &unk_1E69BE248;
    int64_t v13 = a4;
    id v12 = v8;
    [(NSMutableDictionary *)activities enumerateKeysAndObjectsUsingBlock:v11];
  }
  if (v9) {
    v9[2](v9);
  }
}

void __104__WiFiPolicyNetworkActivityTracing__networkActivityRemoveNWConnection_fromActivityWithLabel_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  unsigned int v4 = [v7 nwActivity];
  int label = nw_activity_get_label();
  uint64_t v6 = *(void *)(a1 + 40);

  if (v6 == label) {
    [v7 removeConnection:*(void *)(a1 + 32)];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_activities, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end