@interface UISnapshottingAssertionManager
+ (id)sharedInstance;
- (UISnapshottingAssertionManager)init;
- (id)_init;
- (id)acquireNewAssertion;
- (void)dealloc;
- (void)executeIfNoActiveAssertions:(id)a3;
- (void)relinquishAssertion:(id)a3;
- (void)withLock:(id)a3;
@end

@implementation UISnapshottingAssertionManager

+ (id)sharedInstance
{
  if (qword_1EB260998 != -1) {
    dispatch_once(&qword_1EB260998, &__block_literal_global_248);
  }
  v2 = (void *)_MergedGlobals_1067;
  return v2;
}

void __48__UISnapshottingAssertionManager_sharedInstance__block_invoke()
{
  id v0 = [[UISnapshottingAssertionManager alloc] _init];
  v1 = (void *)_MergedGlobals_1067;
  _MergedGlobals_1067 = (uint64_t)v0;
}

- (UISnapshottingAssertionManager)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"UISnapshottingAssertionManager.m", 42, @"UISnapshottingAssertionManager is a singleton, used sharedInstance instead" object file lineNumber description];

  return 0;
}

- (id)_init
{
  v7.receiver = self;
  v7.super_class = (Class)UISnapshottingAssertionManager;
  v2 = [(UISnapshottingAssertionManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    pthread_mutex_init(&v2->lock, 0);
    uint64_t v4 = objc_opt_new();
    heldAssertions = v3->_heldAssertions;
    v3->_heldAssertions = (NSMutableSet *)v4;
  }
  return v3;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->lock);
  v3.receiver = self;
  v3.super_class = (Class)UISnapshottingAssertionManager;
  [(UISnapshottingAssertionManager *)&v3 dealloc];
}

- (void)withLock:(id)a3
{
  if (a3)
  {
    p_lock = &self->lock;
    uint64_t v4 = (void (**)(void))a3;
    pthread_mutex_lock(p_lock);
    v4[2](v4);

    pthread_mutex_unlock(p_lock);
  }
}

- (id)acquireNewAssertion
{
  objc_super v3 = objc_alloc_init(UISnapshottingAssertion);
  uint64_t v4 = v3;
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__UISnapshottingAssertionManager_acquireNewAssertion__block_invoke;
    v8[3] = &unk_1E52D9F98;
    v8[4] = self;
    v5 = v3;
    v9 = v5;
    [(UISnapshottingAssertionManager *)self withLock:v8];
    v6 = v5;
  }
  return v4;
}

uint64_t __53__UISnapshottingAssertionManager_acquireNewAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
}

- (void)relinquishAssertion:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__UISnapshottingAssertionManager_relinquishAssertion___block_invoke;
    v6[3] = &unk_1E52D9F98;
    v6[4] = self;
    id v7 = v4;
    [(UISnapshottingAssertionManager *)self withLock:v6];
  }
}

uint64_t __54__UISnapshottingAssertionManager_relinquishAssertion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

- (void)executeIfNoActiveAssertions:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__UISnapshottingAssertionManager_executeIfNoActiveAssertions___block_invoke;
    v6[3] = &unk_1E52DA160;
    v6[4] = self;
    id v7 = v4;
    [(UISnapshottingAssertionManager *)self withLock:v6];
  }
}

uint64_t __62__UISnapshottingAssertionManager_executeIfNoActiveAssertions___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) count];
  if (!result)
  {
    objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void).cxx_destruct
{
}

@end