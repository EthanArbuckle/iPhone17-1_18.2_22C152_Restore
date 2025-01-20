@interface VCDaemonSyncDataEndpoint
- (NSMutableSet)mutableSyncDataHandlers;
- (NSSet)syncDataHandlers;
- (OS_dispatch_queue)queue;
- (SwiftVCDaemonXPCEventHandler)eventHandler;
- (VCDaemonSyncDataEndpoint)initWithEventHandler:(id)a3;
@end

@implementation VCDaemonSyncDataEndpoint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSyncDataHandlers, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSMutableSet)mutableSyncDataHandlers
{
  return self->_mutableSyncDataHandlers;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSSet)syncDataHandlers
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3704;
  v11 = __Block_byref_object_dispose__3705;
  id v12 = 0;
  v3 = [(VCDaemonSyncDataEndpoint *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__VCDaemonSyncDataEndpoint_syncDataHandlers__block_invoke;
  v6[3] = &unk_1E6542078;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __44__VCDaemonSyncDataEndpoint_syncDataHandlers__block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) mutableSyncDataHandlers];
  v2 = [v9 valueForKey:@"class"];
  if (([v2 containsObject:objc_opt_class()] & 1) == 0)
  {
    v3 = [VCIntentDefinitionSyncDataHandler alloc];
    id v4 = [*(id *)(a1 + 32) eventHandler];
    v5 = [(VCIntentDefinitionSyncDataHandler *)v3 initWithEventHandler:v4];
    [v9 addObject:v5];
  }
  uint64_t v6 = [v9 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (VCDaemonSyncDataEndpoint)initWithEventHandler:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"VCDaemonSyncDataEndpoint.m", 26, @"Invalid parameter not satisfying: %@", @"eventHandler" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)VCDaemonSyncDataEndpoint;
  uint64_t v7 = [(VCDaemonSyncDataEndpoint *)&v17 init];
  if (v7)
  {
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.shortcuts.VCDaemonSyncDataEndpoint", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v7->_eventHandler, a3);
    uint64_t v12 = objc_opt_new();
    mutableSyncDataHandlers = v7->_mutableSyncDataHandlers;
    v7->_mutableSyncDataHandlers = (NSMutableSet *)v12;

    v14 = v7;
  }

  return v7;
}

@end