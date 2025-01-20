@interface PKDismissalPreventionAssertionManager
+ (id)sharedInstance;
- (BOOL)shouldPreventAutomaticDismissal;
- (PKDismissalPreventionAssertionManager)init;
- (id)acquireAssertion;
@end

@implementation PKDismissalPreventionAssertionManager

+ (id)sharedInstance
{
  if (_MergedGlobals_672 != -1) {
    dispatch_once(&_MergedGlobals_672, &__block_literal_global_30);
  }
  v2 = (void *)qword_1EB545B30;

  return v2;
}

void __55__PKDismissalPreventionAssertionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PKDismissalPreventionAssertionManager);
  v1 = (void *)qword_1EB545B30;
  qword_1EB545B30 = (uint64_t)v0;
}

- (PKDismissalPreventionAssertionManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKDismissalPreventionAssertionManager;
  v2 = [(PKDismissalPreventionAssertionManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    assertions = v2->_assertions;
    v2->_assertions = v3;
  }
  return v2;
}

- (id)acquireAssertion
{
  objc_initWeak(&location, self);
  v3 = [PKDismissalPreventionAssertion alloc];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __57__PKDismissalPreventionAssertionManager_acquireAssertion__block_invoke;
  v9 = &unk_1E59CD550;
  objc_copyWeak(&v10, &location);
  v4 = [(PKDismissalPreventionAssertion *)v3 initWithInvalidationHandler:&v6];
  -[NSMutableSet addObject:](self->_assertions, "addObject:", v4, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

void __57__PKDismissalPreventionAssertionManager_acquireAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[1] removeObject:v5];
  }
}

- (BOOL)shouldPreventAutomaticDismissal
{
  return [(NSMutableSet *)self->_assertions count] != 0;
}

- (void).cxx_destruct
{
}

@end