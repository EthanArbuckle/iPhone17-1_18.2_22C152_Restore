@interface MTAccountController
+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3;
+ (void)openAccountsPanel;
- (ACAccount)_activeAccount;
- (ACAccount)accountOverride;
- (BOOL)activeAccountIsManagedAppleID;
- (BOOL)hasFetchedInitialAccount;
- (BOOL)isPrimaryUserActiveAccount;
- (BOOL)isUserLoggedIn;
- (MTAccountController)init;
- (NSMutableSet)declinedAuthRequests;
- (NSMutableSet)inFlightAuthRequests;
- (id)_activeAccountBlocking;
- (id)activeAccount;
- (id)activeDsid;
- (id)activeEmail;
- (id)activeFullName;
- (id)activeStorefront;
- (id)primaryUser;
- (void)_updateActiveAccount;
- (void)dealloc;
- (void)didChangeStoreAccount:(id)a3;
- (void)fetchActiveAccountWithCompletion:(id)a3;
- (void)promptAccountAuthenticationWithDebugReason:(id)a3 forced:(BOOL)a4;
- (void)setAccountOverride:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setDeclinedAuthRequests:(id)a3;
- (void)setHasFetchedInitialAccount:(BOOL)a3;
- (void)setInFlightAuthRequests:(id)a3;
- (void)set_activeAccount:(id)a3;
- (void)signOut;
@end

@implementation MTAccountController

- (id)_activeAccountBlocking
{
  v2 = +[ACAccountStore ams_sharedAccountStore];
  v3 = [v2 ams_activeiTunesAccount];

  return v3;
}

- (void)setActiveAccount:(id)a3
{
  id v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FC80;
  v7[3] = &unk_10054D9B0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

- (id)activeDsid
{
  v2 = [(MTAccountController *)self activeAccount];
  v3 = [v2 ams_DSID];

  return v3;
}

- (void)_updateActiveAccount
{
  v3 = [(MTAccountController *)self activeDsid];
  id v4 = [v3 stringValue];

  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100017990;
  v7[3] = &unk_10054D9B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

- (MTAccountController)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTAccountController;
  v2 = [(MTAccountController *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.podcasts.MTAccountController.accountQueue", 0);
    accountQueue = v2->_accountQueue;
    v2->_accountQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.podcasts.MTAccountController.callbackQueue", 0);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    [(MTAccountController *)v2 _updateActiveAccount];
    uint64_t v7 = objc_opt_new();
    inFlightAuthRequests = v2->_inFlightAuthRequests;
    v2->_inFlightAuthRequests = (NSMutableSet *)v7;

    uint64_t v9 = objc_opt_new();
    declinedAuthRequests = v2->_declinedAuthRequests;
    v2->_declinedAuthRequests = (NSMutableSet *)v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"didChangeStoreAccount:" name:ACDAccountStoreDidChangeNotification object:0];
  }
  return v2;
}

- (BOOL)hasFetchedInitialAccount
{
  return self->_hasFetchedInitialAccount;
}

- (id)activeAccount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_100056FEC;
  v10 = sub_1000572C0;
  id v11 = 0;
  accountQueue = self->_accountQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100058040;
  v5[3] = &unk_10054E2A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accountQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isUserLoggedIn
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = [v2 ams_DSID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setHasFetchedInitialAccount:(BOOL)a3
{
  self->_hasFetchedInitialAccount = a3;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTAccountController;
  [(MTAccountController *)&v4 dealloc];
}

- (id)primaryUser
{
  return [(MTAccountController *)self _activeAccount];
}

- (BOOL)isPrimaryUserActiveAccount
{
  id v3 = [(ACAccount *)self->__activeAccount ams_DSID];
  if (v3)
  {
    objc_super v4 = [(MTAccountController *)self activeDsid];
    dispatch_queue_t v5 = [(ACAccount *)self->__activeAccount ams_DSID];
    unsigned __int8 v6 = [v4 isEqualToNumber:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)fetchActiveAccountWithCompletion:(id)a3
{
  id v4 = a3;
  accountQueue = self->_accountQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000E2AE4;
  v7[3] = &unk_10054D738;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accountQueue, v7);
}

- (id)activeStorefront
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = [v2 ams_storefront];

  return v3;
}

- (id)activeEmail
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = [v2 username];

  return v3;
}

- (id)activeFullName
{
  v2 = [(MTAccountController *)self activeAccount];
  id v3 = [v2 ams_fullName];

  return v3;
}

- (BOOL)activeAccountIsManagedAppleID
{
  v2 = [(MTAccountController *)self activeAccount];
  unsigned __int8 v3 = [v2 ams_isManagedAppleID];

  return v3;
}

- (void)didChangeStoreAccount:(id)a3
{
  if (+[MTAccountController iTunesAccountDidChangeForACAccountNotification:a3])
  {
    [(MTAccountController *)self _updateActiveAccount];
    if ([(MTAccountController *)self isUserLoggedIn])
    {
      id v5 = +[NSNotificationCenter defaultCenter];
      [v5 postNotificationName:@"MTShouldCheckShowWelcomeNotification" object:0];
    }
    else
    {
      callbackQueue = self->_callbackQueue;
      dispatch_async(callbackQueue, &stru_100550F78);
    }
  }
}

+ (BOOL)iTunesAccountDidChangeForACAccountNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = ACAccountTypeIdentifierKey;
  id v6 = [v4 objectForKeyedSubscript:ACAccountTypeIdentifierKey];
  if (v6)
  {
    uint64_t v7 = [v3 userInfo];
    id v8 = [v7 objectForKeyedSubscript:v5];
    unsigned __int8 v9 = [v8 isEqualToString:ACAccountTypeIdentifieriTunesStore];
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

+ (void)openAccountsPanel
{
  id v3 = +[NSURL URLWithString:UIApplicationOpenSettingsURLString];
  v2 = +[UIApplication sharedApplication];
  [v2 openURL:v3 options:&__NSDictionary0__struct completionHandler:0];
}

- (void)promptAccountAuthenticationWithDebugReason:(id)a3 forced:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Prompting for sign-in with reason %@", buf, 0xCu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E3088;
  block[3] = &unk_10054EA08;
  BOOL v11 = a4;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)signOut
{
  id v5 = [(MTAccountController *)self activeAccount];
  id v3 = [v5 accountStore];
  id v4 = [(MTAccountController *)self activeAccount];
  [v3 removeAccount:v4 withCompletionHandler:&stru_100551008];
}

- (ACAccount)accountOverride
{
  return self->_accountOverride;
}

- (void)setAccountOverride:(id)a3
{
}

- (NSMutableSet)inFlightAuthRequests
{
  return self->_inFlightAuthRequests;
}

- (void)setInFlightAuthRequests:(id)a3
{
}

- (NSMutableSet)declinedAuthRequests
{
  return self->_declinedAuthRequests;
}

- (void)setDeclinedAuthRequests:(id)a3
{
}

- (ACAccount)_activeAccount
{
  return self->__activeAccount;
}

- (void)set_activeAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeAccount, 0);
  objc_storeStrong((id *)&self->_declinedAuthRequests, 0);
  objc_storeStrong((id *)&self->_inFlightAuthRequests, 0);
  objc_storeStrong((id *)&self->_accountOverride, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong((id *)&self->_accountQueue, 0);
}

@end