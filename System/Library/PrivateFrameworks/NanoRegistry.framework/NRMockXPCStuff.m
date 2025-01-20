@interface NRMockXPCStuff
+ (id)sharedInstance;
- (NRMockXPCStuff)init;
@end

@implementation NRMockXPCStuff

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__NRMockXPCStuff_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1E95CE9D8 != -1) {
    dispatch_once(&qword_1E95CE9D8, block);
  }
  v2 = (void *)_MergedGlobals_1;

  return v2;
}

uint64_t __32__NRMockXPCStuff_sharedInstance__block_invoke()
{
  objc_opt_class();
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = _MergedGlobals_1;
  _MergedGlobals_1 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (NRMockXPCStuff)init
{
  v8.receiver = self;
  v8.super_class = (Class)NRMockXPCStuff;
  v2 = [(NRMockXPCStuff *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    mockListeners = v2->_mockListeners;
    v2->_mockListeners = (NSMutableDictionary *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanoregistry.mockxpc.stuff", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_mockListeners, 0);
}

@end