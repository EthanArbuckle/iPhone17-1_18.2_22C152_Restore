@interface MTMediaContentSourceiOSMusicLibrary
+ (id)sharedInstance;
- (BOOL)iTunesMatchEnabled;
- (MTMediaContentSourceiOSMusicLibrary)init;
- (OS_dispatch_queue)workQueue;
- (void)determineiTunesMatchEnabledWithCompletion:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation MTMediaContentSourceiOSMusicLibrary

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __53__MTMediaContentSourceiOSMusicLibrary_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(MTMediaContentSourceiOSMusicLibrary);
  return MEMORY[0x270F9A758]();
}

- (MTMediaContentSourceiOSMusicLibrary)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTMediaContentSourceiOSMusicLibrary;
  v2 = [(MTMediaContentSourceiOSMusicLibrary *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -15);
    dispatch_queue_t v4 = dispatch_queue_create("MTMediaContentSourceiOSMusicLibrary", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)determineiTunesMatchEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__MTMediaContentSourceiOSMusicLibrary_determineiTunesMatchEnabledWithCompletion___block_invoke;
  aBlock[3] = &unk_265055B68;
  id v8 = v4;
  id v5 = v4;
  v6 = (void (**)(void *, MTMediaContentSourceiOSMusicLibrary *))_Block_copy(aBlock);
  v6[2](v6, self);
}

uint64_t __81__MTMediaContentSourceiOSMusicLibrary_determineiTunesMatchEnabledWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)iTunesMatchEnabled
{
  return self->_iTunesMatchEnabled;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end