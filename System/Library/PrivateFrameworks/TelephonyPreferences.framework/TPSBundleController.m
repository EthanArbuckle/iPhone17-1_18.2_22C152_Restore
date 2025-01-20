@interface TPSBundleController
- (BOOL)isHidden;
- (BOOL)isSubscriptionListHidden;
- (BOOL)supportsDisabledSubscriptions;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSArray)specifiers;
- (NSOrderedSet)subscriptions;
- (PSListController)parentListController;
- (TPSBundleController)initWithParentListController:(id)a3;
- (TPSTelephonyController)telephonyController;
- (id)specifiersWithSpecifier:(id)a3;
- (id)subscriptionContextForSpecifier:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setSubscriptionContext:(id)a3;
- (void)telephonyController:(id)a3 didChangeActiveSubscriptions:(id)a4;
- (void)telephonyController:(id)a3 didChangeSubscriptions:(id)a4;
@end

@implementation TPSBundleController

- (TPSBundleController)initWithParentListController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSBundleController;
  v5 = [(TPSBundleController *)&v12 initWithParentListController:v4];
  if (v5)
  {
    v6 = objc_alloc_init(TPSTelephonyController);
    telephonyController = v5->_telephonyController;
    v5->_telephonyController = v6;

    v8 = [v4 specifier];
    if (v8)
    {
      uint64_t v9 = [(TPSBundleController *)v5 subscriptionContextForSpecifier:v8];
      subscriptionContext = v5->_subscriptionContext;
      v5->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v9;
    }
  }

  return v5;
}

- (BOOL)isHidden
{
  v2 = [(TPSBundleController *)self supportedSubscriptions];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)isSubscriptionListHidden
{
  v2 = [(TPSBundleController *)self subscriptionContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (PSListController)parentListController
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E4F92EE8]));
  return (PSListController *)WeakRetained;
}

- (NSOrderedSet)subscriptions
{
  BOOL v3 = [(TPSBundleController *)self supportsDisabledSubscriptions];
  id v4 = [(TPSBundleController *)self telephonyController];
  v5 = v4;
  if (v3) {
    [v4 subscriptions];
  }
  else {
  v6 = [v4 activeSubscriptions];
  }

  v7 = [(TPSBundleController *)self subscriptionContext];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28F60];
    v10 = [v7 uuid];
    v11 = [v9 predicateWithFormat:@"uuid == %@", v10];

    uint64_t v12 = [v6 filteredOrderedSetUsingPredicate:v11];

    v6 = (void *)v12;
  }

  return (NSOrderedSet *)v6;
}

- (id)specifiersWithSpecifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(TPSBundleController *)self isHidden])
  {
    id v4 = 0;
  }
  else
  {
    v5 = [(TPSBundleController *)self specifiers];
    if ([(TPSBundleController *)self isSubscriptionListHidden])
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v29;
        uint64_t v10 = *MEMORY[0x1E4F93210];
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v29 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v13 = [(TPSBundleController *)self subscriptionContext];
            [v12 setProperty:v13 forKey:v10];

            v14 = [(TPSBundleController *)self supportedSubscriptions];
            [v12 setProperty:v14 forKey:@"TPSSpecifierSubscriptionsKey"];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v8);
      }
      id v4 = v6;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA48] array];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v4 = v5;
      uint64_t v15 = [v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
      id obj = v4;
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v27 = *(void *)v33;
        do
        {
          uint64_t v17 = 0;
          v18 = v4;
          do
          {
            if (*(void *)v33 != v27) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v32 + 1) + 8 * v17);
            v20 = (void *)MEMORY[0x1E4F92E70];
            v21 = [v19 name];
            v22 = [v20 preferenceSpecifierNamed:v21 target:0 set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

            objc_msgSend(v22, "setProperty:forKey:", objc_msgSend(v19, "detailControllerClass"), @"TPSSpecifierSubscriptionDetailControllerKey");
            v23 = [(TPSBundleController *)self supportedSubscriptions];
            [v22 setProperty:v23 forKey:@"TPSSpecifierSubscriptionsKey"];

            v24 = [v19 identifier];
            [v22 setIdentifier:v24];

            [v6 addObject:v22];
            id v4 = (id)[v6 copy];

            ++v17;
            v18 = v4;
          }
          while (v16 != v17);
          uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v16);
      }
    }
  }
  return v4;
}

- (id)subscriptionContextForSpecifier:(id)a3
{
  id v4 = objc_msgSend(a3, "tps_subscriptionContext");
  if (!v4)
  {
    v5 = +[TPSPreferences sharedInstance];
    uint64_t v6 = [v5 showSubscriptionList];

    if (v6)
    {
      id v4 = 0;
    }
    else
    {
      uint64_t v7 = [(TPSBundleController *)self supportedSubscriptions];
      if ([v7 count] == 1
        && (uint64_t v8 = [v7 count],
            [(TPSBundleController *)self subscriptions],
            uint64_t v9 = objc_claimAutoreleasedReturnValue(),
            uint64_t v10 = [v9 count],
            v9,
            v8 == v10))
      {
        v11 = [v7 firstObject];
        id v4 = [v11 context];
      }
      else
      {
        id v4 = 0;
      }
    }
  }
  return v4;
}

- (void)telephonyController:(id)a3 didChangeActiveSubscriptions:(id)a4
{
  id v4 = TPSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Active subscriptions have changed.", v5, 2u);
  }
}

- (void)telephonyController:(id)a3 didChangeSubscriptions:(id)a4
{
  id v4 = TPSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1E4DD4000, v4, OS_LOG_TYPE_DEFAULT, "Subscriptions have changed.", v5, 2u);
  }
}

- (TPSTelephonyController)telephonyController
{
  return self->_telephonyController;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
}

- (BOOL)supportsDisabledSubscriptions
{
  return self->_supportsDisabledSubscriptions;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyController, 0);
}

@end