@interface JSAStore
+ (JSAStore)sharedInstance;
+ (id)getInstance;
- (BOOL)allowsAccountModification;
- (BOOL)allowsErotica;
- (BOOL)allowsStore;
- (BOOL)isAuthenticated;
- (BOOL)isRunningInStoreDemoMode;
- (JSAAccount)account;
- (JSAStore)init;
- (JSManagedValue)restrictionHandler;
- (JSManagedValue)storefrontChangeHandler;
- (NSArray)accountHandlers;
- (NSString)platform;
- (NSString)storeFrontIdentifier;
- (OS_dispatch_queue)accountQueue;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)restrictionsQueue;
- (void)_updateRestrictionsAndNotifyIfNeeded;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)accountControllerDidAttemptSignIn:(id)a3;
- (void)accountControllerDidAttemptSignOut:(uint64_t)a1;
- (void)accountControllerWillAttemptSignOut:(uint64_t)a1;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)registerOnAccountChange:(id)a3;
- (void)registerOnRestrictionChange:(id)a3;
- (void)registerOnStorefrontChange:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAccountHandlers:(id)a3;
- (void)setAccountQueue:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setRestrictionHandler:(id)a3;
- (void)setRestrictionsQueue:(id)a3;
- (void)setStorefrontChangeHandler:(id)a3;
- (void)unregisterOnAccountChange:(id)a3;
- (void)unregisterOnRestrictionChange;
- (void)unregisterOnStorefrontChange;
@end

@implementation JSAStore

+ (id)getInstance
{
  return +[JSAStore sharedInstance];
}

- (JSAStore)init
{
  v29.receiver = self;
  v29.super_class = (Class)JSAStore;
  v2 = [(JSAStore *)&v29 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("JSAStore.Account", v3);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("JSAStore.Callback", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("JSAStore.Restrictions", v9);
    restrictionsQueue = v2->_restrictionsQueue;
    v2->_restrictionsQueue = (OS_dispatch_queue *)v10;

    v2->_accessLock._os_unfair_lock_opaque = 0;
    v12 = [[JSAAccount alloc] initWithDelegate:v2];
    account = v2->_account;
    v2->_account = v12;

    uint64_t v14 = +[NSArray array];
    accountHandlers = v2->_accountHandlers;
    v2->_accountHandlers = (NSArray *)v14;

    uint64_t v16 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (NSMutableArray *)v16;

    v18 = +[BUAccountsProvider sharedProvider];
    uint64_t v19 = [v18 currentStorefront];
    storeFrontIdentifier = v2->_storeFrontIdentifier;
    v2->_storeFrontIdentifier = (NSString *)v19;

    v21 = +[BURestrictionsProvider sharedInstance];
    [v21 addObserver:v2];

    v22 = +[BURestrictionsProvider sharedInstance];
    v2->_allowsAccountModification = [v22 isAccountModificationAllowed];

    v23 = +[BURestrictionsProvider sharedInstance];
    v2->_allowsErotica = [v23 isExplicitContentAllowed];

    v24 = +[BURestrictionsProvider sharedInstance];
    v2->_allowsStore = [v24 isBookStoreAllowed];

    v2->_isRunningInStoreDemoMode = +[UIApplication isRunningInStoreDemoMode];
    v25 = +[JSAAccountController sharedController];
    [v25 addObserver:v2];

    v26 = +[BUAccountsProvider sharedProvider];
    [v26 addObserver:v2 accountTypes:1];

    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v2 selector:"_updateRestrictionsAndNotifyIfNeeded" name:UIApplicationWillEnterForegroundNotification object:0];

    [(JSAStore *)v2 _updateRestrictionsAndNotifyIfNeeded];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  dispatch_queue_t v4 = +[BUAccountsProvider sharedProvider];
  [v4 removeObserver:self accountTypes:1];

  v5 = +[BURestrictionsProvider sharedInstance];
  [v5 removeObserver:self];

  v6 = +[JSAAccountController sharedController];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)JSAStore;
  [(JSAStore *)&v7 dealloc];
}

+ (JSAStore)sharedInstance
{
  if (qword_CE400 != -1) {
    dispatch_once(&qword_CE400, &stru_B34A8);
  }
  v2 = (void *)qword_CE408;

  return (JSAStore *)v2;
}

- (void)addObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableArray *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  [(NSMutableArray *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (NSString)storeFrontIdentifier
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_2A3F8;
  dispatch_queue_t v10 = sub_2A408;
  id v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2A410;
  v5[3] = &unk_B2430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (NSString)platform
{
  v2 = +[UIDevice currentDevice];
  if ([v2 userInterfaceIdiom] == (char *)&dword_0 + 1)
  {

    return (NSString *)@"iPad";
  }
  id v3 = +[UIDevice currentDevice];
  dispatch_queue_t v4 = (char *)[v3 userInterfaceIdiom];

  if (v4 == (unsigned char *)&dword_4 + 1) {
    return (NSString *)@"iPad";
  }
  uint64_t v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (!v7) {
    return (NSString *)@"iPhone";
  }
  uint64_t v8 = JSALog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_85BFC(v8);
  }

  return 0;
}

- (JSAAccount)account
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_2A3F8;
  dispatch_queue_t v10 = sub_2A408;
  id v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2A624;
  v5[3] = &unk_B2430;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (JSAAccount *)v3;
}

- (void)accountControllerDidAttemptSignOut:(uint64_t)a1
{
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
          if (objc_opt_respondsToSelector()) {
            [v7 storeDidAttemptSignOut:a1];
          }
          uint64_t v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)accountControllerWillAttemptSignOut:(uint64_t)a1
{
  if (a1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * (void)v6);
          if (objc_opt_respondsToSelector()) {
            [v7 storeWillAttemptSignOut:a1];
          }
          uint64_t v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

- (void)registerOnStorefrontChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    long long v9 = "-[JSAStore registerOnStorefrontChange:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = +[JSManagedValue managedValueWithValue:v4];

  storefrontChangeHandler = self->_storefrontChangeHandler;
  self->_storefrontChangeHandler = v6;
}

- (void)unregisterOnStorefrontChange
{
  self->_storefrontChangeHandler = 0;
  _objc_release_x1();
}

- (void)registerOnAccountChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    long long v11 = "-[JSAStore registerOnAccountChange:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  uint64_t v6 = [(JSAStore *)self callbackQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2AAB4;
  v8[3] = &unk_B2050;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)unregisterOnAccountChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(JSAStore *)self callbackQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2ABDC;
  v7[3] = &unk_B2050;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)registerOnRestrictionChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    id v9 = "-[JSAStore registerOnRestrictionChange:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = +[JSManagedValue managedValueWithValue:v4];

  restrictionHandler = self->_restrictionHandler;
  self->_restrictionHandler = v6;
}

- (void)unregisterOnRestrictionChange
{
  self->_restrictionHandler = 0;
  _objc_release_x1();
}

- (BOOL)isAuthenticated
{
  id v3 = [(JSAStore *)self account];
  if (v3)
  {
    id v4 = [(JSAStore *)self account];
    uint64_t v5 = [v4 uniqueIdentifier];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_updateRestrictionsAndNotifyIfNeeded
{
  objc_initWeak(&location, self);
  id v3 = [(JSAStore *)self restrictionsQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2AE84;
  v4[3] = &unk_B22D8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  id v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[Store] account store did change", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  accountQueue = self->_accountQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B654;
  block[3] = &unk_B22D8;
  objc_copyWeak(&v8, buf);
  dispatch_async(accountQueue, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)accountControllerDidAttemptSignIn:(id)a3
{
  objc_initWeak(&location, self);
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2B884;
  v5[3] = &unk_B22D8;
  objc_copyWeak(&v6, &location);
  dispatch_async(accountQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)allowsAccountModification
{
  return self->_allowsAccountModification;
}

- (BOOL)allowsErotica
{
  return self->_allowsErotica;
}

- (BOOL)allowsStore
{
  return self->_allowsStore;
}

- (BOOL)isRunningInStoreDemoMode
{
  return self->_isRunningInStoreDemoMode;
}

- (OS_dispatch_queue)accountQueue
{
  return self->_accountQueue;
}

- (void)setAccountQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)restrictionsQueue
{
  return self->_restrictionsQueue;
}

- (void)setRestrictionsQueue:(id)a3
{
}

- (NSArray)accountHandlers
{
  return self->_accountHandlers;
}

- (void)setAccountHandlers:(id)a3
{
}

- (JSManagedValue)restrictionHandler
{
  return self->_restrictionHandler;
}

- (void)setRestrictionHandler:(id)a3
{
}

- (JSManagedValue)storefrontChangeHandler
{
  return self->_storefrontChangeHandler;
}

- (void)setStorefrontChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontChangeHandler, 0);
  objc_storeStrong((id *)&self->_restrictionHandler, 0);
  objc_storeStrong((id *)&self->_accountHandlers, 0);
  objc_storeStrong((id *)&self->_restrictionsQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accountQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
}

@end