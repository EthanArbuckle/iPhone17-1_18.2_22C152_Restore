@interface WLKUpNextDeltaStore
+ (id)sharedInstance;
- (WLKUpNextDeltaStore)init;
- (void)delete:(id)a3;
- (void)merge:(id)a3 completion:(id)a4;
- (void)read:(id)a3;
- (void)write:(id)a3 completion:(id)a4;
@end

@implementation WLKUpNextDeltaStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_15);
  }
  v2 = (void *)sharedInstance__singleton;

  return v2;
}

uint64_t __37__WLKUpNextDeltaStore_sharedInstance__block_invoke()
{
  sharedInstance__singleton = objc_alloc_init(WLKUpNextDeltaStore);

  return MEMORY[0x1F41817F8]();
}

- (WLKUpNextDeltaStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)WLKUpNextDeltaStore;
  v2 = [(WLKUpNextDeltaStore *)&v6 init];
  if (v2)
  {
    v3 = [[WLKSharedFileStorage alloc] initWithFileName:@"upnextdelta.plist" class:objc_opt_class()];
    fileStorage = v2->_fileStorage;
    v2->_fileStorage = v3;
  }
  return v2;
}

- (void)read:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[WLKUpNextDeltaStore read:]();
  }
  id v5 = v4;
  [(WLKSharedFileStorage *)self->_fileStorage read:v4];
}

- (void)write:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (!v7) {
    -[WLKUpNextDeltaStore write:completion:]();
  }
  if (!v6) {
    -[WLKUpNextDeltaStore write:completion:]();
  }
  [(WLKSharedFileStorage *)self->_fileStorage write:v7 completion:v6];
}

- (void)merge:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (!v7) {
    -[WLKUpNextDeltaStore merge:completion:]();
  }
  if (!v6) {
    -[WLKUpNextDeltaStore merge:completion:]();
  }
  [(WLKSharedFileStorage *)self->_fileStorage merge:v7 completion:v6];
}

- (void)delete:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[WLKUpNextDeltaStore delete:]();
  }
  id v5 = v4;
  [(WLKSharedFileStorage *)self->_fileStorage delete:v4];
}

- (void).cxx_destruct
{
}

- (void)read:.cold.1()
{
  __assert_rtn("-[WLKUpNextDeltaStore read:]", "WLKUpNextDeltaStore.m", 48, "completion != nil");
}

- (void)write:completion:.cold.1()
{
  __assert_rtn("-[WLKUpNextDeltaStore write:completion:]", "WLKUpNextDeltaStore.m", 55, "delta != nil");
}

- (void)write:completion:.cold.2()
{
  __assert_rtn("-[WLKUpNextDeltaStore write:completion:]", "WLKUpNextDeltaStore.m", 56, "completion != nil");
}

- (void)merge:completion:.cold.1()
{
  __assert_rtn("-[WLKUpNextDeltaStore merge:completion:]", "WLKUpNextDeltaStore.m", 63, "delta != nil");
}

- (void)merge:completion:.cold.2()
{
  __assert_rtn("-[WLKUpNextDeltaStore merge:completion:]", "WLKUpNextDeltaStore.m", 64, "completion != nil");
}

- (void)delete:.cold.1()
{
  __assert_rtn("-[WLKUpNextDeltaStore delete:]", "WLKUpNextDeltaStore.m", 71, "completion != nil");
}

@end