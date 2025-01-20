@interface NCBannerTransitionBlockingPrototypeRecipe
- (NCBannerTransitionBlockingPrototypeRecipe)initWithNotificationAlertDestination:(id)a3;
- (NCNotificationAlertDestinationPrototyping)notificationAlertDestination;
- (void)_popTopAssertion;
- (void)_pushNewAssertion;
@end

@implementation NCBannerTransitionBlockingPrototypeRecipe

- (NCBannerTransitionBlockingPrototypeRecipe)initWithNotificationAlertDestination:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NCBannerTransitionBlockingPrototypeRecipe;
  v5 = [(NCBannerTransitionBlockingPrototypeRecipe *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_notificationAlertDestination, v4);
    objc_initWeak(&location, v6);
    v7 = (void *)MEMORY[0x1E4F94120];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__NCBannerTransitionBlockingPrototypeRecipe_initWithNotificationAlertDestination___block_invoke;
    v12[3] = &unk_1E6A919A0;
    objc_copyWeak(&v13, &location);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__NCBannerTransitionBlockingPrototypeRecipe_initWithNotificationAlertDestination___block_invoke_2;
    v10[3] = &unk_1E6A919A0;
    objc_copyWeak(&v11, &location);
    v8 = [v7 recipeWithTitle:@"Block Banner Transitions" increaseAction:v12 decreaseAction:v10];
    +[PTDomain registerTestRecipe:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __82__NCBannerTransitionBlockingPrototypeRecipe_initWithNotificationAlertDestination___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pushNewAssertion];
}

void __82__NCBannerTransitionBlockingPrototypeRecipe_initWithNotificationAlertDestination___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _popTopAssertion];
}

- (void)_pushNewAssertion
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_assertions)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assertions = v2->_assertions;
    v2->_assertions = v3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_notificationAlertDestination);
  v6 = [WeakRetained activeNotificationRequestPresenter];

  if (v6)
  {
    objc_initWeak(&location, v2);
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"transitionBlockingPrototypeRecipe-%ld", -[NSMutableArray count](v2->_assertions, "count"));
    v8 = [v6 requestTransitionBlockingAssertionWithReason:v7];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__NCBannerTransitionBlockingPrototypeRecipe__pushNewAssertion__block_invoke;
    v9[3] = &unk_1E6A91958;
    objc_copyWeak(&v10, &location);
    [v8 addInvalidationBlock:v9];
    if (v8) {
      [(NSMutableArray *)v2->_assertions addObject:v8];
    }
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }

  objc_sync_exit(v2);
}

void __62__NCBannerTransitionBlockingPrototypeRecipe__pushNewAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = (id *)WeakRetained;
    objc_sync_enter(v8);
    [v8[1] removeObject:v9];
    objc_sync_exit(v8);
  }
}

- (void)_popTopAssertion
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(NSMutableArray *)obj->_assertions lastObject];
  [(NSMutableArray *)obj->_assertions removeLastObject];
  [v2 invalidateWithReason:@"popTopAssertion"];

  objc_sync_exit(obj);
}

- (NCNotificationAlertDestinationPrototyping)notificationAlertDestination
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationAlertDestination);

  return (NCNotificationAlertDestinationPrototyping *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationAlertDestination);

  objc_storeStrong((id *)&self->_assertions, 0);
}

@end