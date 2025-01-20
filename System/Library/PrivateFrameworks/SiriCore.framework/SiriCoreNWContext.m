@interface SiriCoreNWContext
+ (id)sharedInstance;
- (SiriCoreNWContext)init;
- (id)_init;
- (id)nwContext;
@end

@implementation SiriCoreNWContext

- (void).cxx_destruct
{
}

- (id)nwContext
{
  return self->_context;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SiriCoreNWContext;
  v2 = [(SiriCoreNWContext *)&v6 init];
  if (v2)
  {
    uint64_t v3 = nw_context_create();
    context = v2->_context;
    v2->_context = (OS_nw_context *)v3;

    nw_context_set_scheduling_mode();
    nw_context_set_isolate_protocol_stack();
    nw_context_set_privacy_level();
    nw_context_set_isolate_protocol_cache();
  }
  return v2;
}

- (SiriCoreNWContext)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SiriCoreNWContext.m", 29, @"%s is marked as NS_UNAVAILABLE. Use the designated initializer instead.", "-[SiriCoreNWContext init]");

  return 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_642);
  }
  v2 = (void *)sharedInstance_sSharedInstance;

  return v2;
}

uint64_t __35__SiriCoreNWContext_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance = [[SiriCoreNWContext alloc] _init];

  return MEMORY[0x270F9A758]();
}

@end