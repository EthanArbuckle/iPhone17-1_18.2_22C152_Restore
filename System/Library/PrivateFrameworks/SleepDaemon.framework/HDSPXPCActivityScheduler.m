@interface HDSPXPCActivityScheduler
- (HDSPXPCActivityScheduler)initWithCallbackScheduler:(id)a3;
- (NAScheduler)callbackScheduler;
- (NSMutableSet)eventNames;
- (os_unfair_lock_s)eventNamesLock;
- (void)_withLock:(id)a3;
- (void)scheduleActivity:(id)a3 activityHandler:(id)a4;
- (void)unscheduleActivities;
@end

@implementation HDSPXPCActivityScheduler

- (HDSPXPCActivityScheduler)initWithCallbackScheduler:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSPXPCActivityScheduler;
  v6 = [(HDSPXPCActivityScheduler *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackScheduler, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    eventNames = v7->_eventNames;
    v7->_eventNames = v8;

    v7->_eventNamesLock._os_unfair_lock_opaque = 0;
    v10 = v7;
  }

  return v7;
}

- (void)_withLock:(id)a3
{
  p_eventNamesLock = &self->_eventNamesLock;
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_eventNamesLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_eventNamesLock);
}

- (void)scheduleActivity:(id)a3 activityHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke;
    v23[3] = &unk_2645D9288;
    v23[4] = self;
    id v9 = v8;
    id v24 = v9;
    [(HDSPXPCActivityScheduler *)self _withLock:v23];
    id v10 = [v9 name];
    v11 = (const char *)[v10 UTF8String];
    objc_super v12 = [v9 criteria];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_2;
    handler[3] = &unk_2645DADE8;
    id v13 = v9;
    id v20 = v13;
    v21 = self;
    id v14 = v7;
    id v22 = v14;
    xpc_activity_register(v11, v12, handler);

    if ([v13 options])
    {
      callbackScheduler = self->_callbackScheduler;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_4;
      v16[3] = &unk_2645D9B28;
      id v18 = v14;
      id v17 = v13;
      [(NAScheduler *)callbackScheduler performBlock:v16];
    }
  }
}

void __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = [*(id *)(a1 + 40) name];
  [v1 addObject:v2];
}

void __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HDSPXPCActivity alloc];
  id v5 = [*(id *)(a1 + 32) name];
  uint64_t v6 = [*(id *)(a1 + 32) options];
  id v7 = [*(id *)(a1 + 32) criteria];
  id v8 = [(HDSPXPCActivity *)v4 initWithEventName:v5 options:v6 criteria:v7 activity:v3];

  if (![(HDSPXPCActivity *)v8 deferIfNecessary])
  {
    id v9 = *(void **)(*(void *)(a1 + 40) + 16);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_3;
    v10[3] = &unk_2645D9B28;
    id v12 = *(id *)(a1 + 48);
    v11 = v8;
    [v9 performBlock:v10];
  }
}

uint64_t __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __61__HDSPXPCActivityScheduler_scheduleActivity_activityHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)unscheduleActivities
{
  uint64_t v3 = 0;
  v4 = &v3;
  uint64_t v5 = 0x3032000000;
  uint64_t v6 = __Block_byref_object_copy__20;
  id v7 = __Block_byref_object_dispose__20;
  id v8 = 0;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48__HDSPXPCActivityScheduler_unscheduleActivities__block_invoke;
  v2[3] = &unk_2645D9630;
  v2[4] = self;
  v2[5] = &v3;
  [(HDSPXPCActivityScheduler *)self _withLock:v2];
  objc_msgSend((id)v4[5], "na_each:", &__block_literal_global_26);
  _Block_object_dispose(&v3, 8);
}

uint64_t __48__HDSPXPCActivityScheduler_unscheduleActivities__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];

  return MEMORY[0x270F9A758]();
}

void __48__HDSPXPCActivityScheduler_unscheduleActivities__block_invoke_2(int a1, id a2)
{
  id v2 = (const char *)[a2 UTF8String];

  xpc_activity_unregister(v2);
}

- (NAScheduler)callbackScheduler
{
  return self->_callbackScheduler;
}

- (NSMutableSet)eventNames
{
  return self->_eventNames;
}

- (os_unfair_lock_s)eventNamesLock
{
  return self->_eventNamesLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventNames, 0);

  objc_storeStrong((id *)&self->_callbackScheduler, 0);
}

@end