@interface JSACookieStorage
+ (JSACookieStorage)sharedInstance;
- (BUCoalescingCallBlock)updateCookiesCoalescingCallBlock;
- (JSACookieStorage)init;
- (JSManagedValue)cookieStorageChangeHandler;
- (NSArray)invalidationTimers;
- (NSDictionary)activeCookiesForDefaultURL;
- (NSDictionary)indexedCookies;
- (NSURL)defaultURL;
- (OS_dispatch_queue)queue;
- (void)_handleCookieDidExpire:(id)a3;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
- (void)dealloc;
- (void)deleteCookie:(id)a3 :(id)a4;
- (void)notificationHandler:(id)a3;
- (void)registerOnCookieStorageChange:(id)a3;
- (void)setCookie:(id)a3 :(id)a4;
- (void)setCookieStorageChangeHandler:(id)a3;
- (void)setIndexedCookies:(id)a3;
- (void)setInvalidationTimers:(id)a3;
- (void)unregisterOnCookieStorageChange;
@end

@implementation JSACookieStorage

+ (JSACookieStorage)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2BAC4;
  block[3] = &unk_B2510;
  block[4] = a1;
  if (qword_CE410 != -1) {
    dispatch_once(&qword_CE410, block);
  }
  v2 = (void *)qword_CE418;

  return (JSACookieStorage *)v2;
}

- (JSACookieStorage)init
{
  v23.receiver = self;
  v23.super_class = (Class)JSACookieStorage;
  v2 = [(JSACookieStorage *)&v23 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.iBooks.JSACookieStorage", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSURL URLWithString:@"https://www.apple.com/"];
    defaultURL = v2->_defaultURL;
    v2->_defaultURL = (NSURL *)v7;

    objc_initWeak(&location, v2);
    id v9 = objc_alloc((Class)BUCoalescingCallBlock);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_2BD4C;
    v20 = &unk_B34D0;
    objc_copyWeak(&v21, &location);
    v10 = (BUCoalescingCallBlock *)[v9 initWithNotifyBlock:&v17 blockDescription:@"JSACookieStorage"];
    updateCookiesCoalescingCallBlock = v2->_updateCookiesCoalescingCallBlock;
    v2->_updateCookiesCoalescingCallBlock = v10;

    -[BUCoalescingCallBlock setCoalescingDelay:](v2->_updateCookiesCoalescingCallBlock, "setCoalescingDelay:", 0.2, v17, v18, v19, v20);
    sub_2BE50((uint64_t)v2, 0);
    v12 = +[NSNotificationCenter defaultCenter];
    v13 = +[NSHTTPCookieStorage sharedHTTPCookieStorage];
    [v12 addObserver:v2 selector:"notificationHandler:" name:NSHTTPCookieManagerCookiesChangedNotification object:v13];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_2BEF8, AMSAccountCookiesChangedNotificationName, 0, (CFNotificationSuspensionBehavior)0);
    v15 = +[BUAccountsProvider sharedProvider];
    [v15 addObserver:v2 accountTypes:1];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  dispatch_queue_t v5 = +[BUAccountsProvider sharedProvider];
  [v5 removeObserver:self accountTypes:1];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = [(JSACookieStorage *)self invalidationTimers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v10) invalidate];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(JSACookieStorage *)self setInvalidationTimers:0];
  v11.receiver = self;
  v11.super_class = (Class)JSACookieStorage;
  [(JSACookieStorage *)&v11 dealloc];
}

- (void)notificationHandler:(id)a3
{
  v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[JSACookieStorage] Received NSHTTPCookieStorage changed notification", v5, 2u);
  }

  if (self) {
    [(BUCoalescingCallBlock *)self->_updateCookiesCoalescingCallBlock signalWithCompletion:0];
  }
}

- (NSDictionary)activeCookiesForDefaultURL
{
  activeCookiesForDefaultURL = self->_activeCookiesForDefaultURL;
  if (!activeCookiesForDefaultURL)
  {
    self->_activeCookiesForDefaultURL = (NSDictionary *)&__NSDictionary0__struct;

    activeCookiesForDefaultURL = self->_activeCookiesForDefaultURL;
  }

  return activeCookiesForDefaultURL;
}

- (void)setCookie:(id)a3 :(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)NSHTTPCookie);
  uint64_t v9 = [v8 jsa_initWithScriptingCookie:v7];

  v10 = +[BUAccountsProvider sharedProvider];
  objc_super v11 = [v10 localStoreAccount];

  v20 = v9;
  long long v12 = +[NSArray arrayWithObjects:&v20 count:1];
  [v11 ams_addCookies:v12];

  if ([v11 isDirty])
  {
    long long v13 = +[ACAccountStore bu_sharedAccountStore];
    [v13 ams_saveAccount:v11 verifyCredentials:0];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_2C3D0;
    v18[3] = &unk_B34F8;
    v18[4] = self;
    id v19 = v6;
    id v15 = v6;
    [v14 resultWithCompletion:v18];
  }
  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_2C4C0;
    v16[3] = &unk_B2000;
    id v17 = v6;
    id v14 = v6;
    sub_2BE50((uint64_t)self, v16);
    id v15 = v17;
  }
}

- (void)deleteCookie:(id)a3 :(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 name];
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v6 domain];
  if (!v10)
  {

    goto LABEL_6;
  }
  objc_super v11 = (void *)v10;
  long long v12 = [v6 path];

  if (!v12)
  {
LABEL_6:
    uint64_t v18 = +[JSABridge sharedInstance];
    [v18 enqueueValueCall:v7 arguments:0 file:@"JSACookieStorage.m" line:148];

    goto LABEL_7;
  }
  v21[0] = NSHTTPCookieName;
  long long v13 = [v6 name];
  v22[0] = v13;
  v21[1] = NSHTTPCookieDomain;
  id v14 = [v6 domain];
  v22[1] = v14;
  v21[2] = NSHTTPCookiePath;
  id v15 = [v6 path];
  v22[2] = v15;
  v16 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  id v17 = +[ACAccountStore bu_sharedAccountStore];
  [v17 ams_removeCookiesMatchingProperties:v16 error:0];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_2C750;
  v19[3] = &unk_B2000;
  id v20 = v7;
  sub_2BE50((uint64_t)self, v19);

LABEL_7:
}

- (void)registerOnCookieStorageChange:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Registering on cookie storage change", v7, 2u);
  }

  id v6 = +[JSManagedValue managedValueWithValue:v4];

  [(JSACookieStorage *)self setCookieStorageChangeHandler:v6];
}

- (void)unregisterOnCookieStorageChange
{
}

- (void)_handleCookieDidExpire:(id)a3
{
  id v4 = JSALog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v5 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "[JSACookieStorage] A cookie has expired", v5, 2u);
  }

  if (self) {
    [(BUCoalescingCallBlock *)self->_updateCookiesCoalescingCallBlock signalWithCompletion:0];
  }
}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  dispatch_queue_t v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[JSACookieStorage] Received account changed notification", v6, 2u);
  }

  if (self) {
    [(BUCoalescingCallBlock *)self->_updateCookiesCoalescingCallBlock signalWithCompletion:0];
  }
}

- (NSURL)defaultURL
{
  return self->_defaultURL;
}

- (NSArray)invalidationTimers
{
  return self->_invalidationTimers;
}

- (void)setInvalidationTimers:(id)a3
{
}

- (NSDictionary)indexedCookies
{
  return self->_indexedCookies;
}

- (void)setIndexedCookies:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (JSManagedValue)cookieStorageChangeHandler
{
  return (JSManagedValue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCookieStorageChangeHandler:(id)a3
{
}

- (BUCoalescingCallBlock)updateCookiesCoalescingCallBlock
{
  return self->_updateCookiesCoalescingCallBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCookiesCoalescingCallBlock, 0);
  objc_storeStrong((id *)&self->_cookieStorageChangeHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_indexedCookies, 0);
  objc_storeStrong((id *)&self->_invalidationTimers, 0);
  objc_storeStrong((id *)&self->_defaultURL, 0);

  objc_storeStrong((id *)&self->_activeCookiesForDefaultURL, 0);
}

@end