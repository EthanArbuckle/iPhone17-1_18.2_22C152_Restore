@interface COSAppInstallationController
+ (void)getAppAvailabilityStatusWithBundleID:(id)a3 andStoreIdentifier:(id)a4 andCompletion:(id)a5;
- (BOOL)availableInStoreResult;
- (BOOL)installInProgress;
- (BOOL)isInstalled;
- (BOOL)needsAvailableInStoreCheck;
- (COSAppInstallationController)initWithBundleID:(id)a3 andStoreIdentifier:(id)a4;
- (NSHashTable)observers;
- (NSNumber)storeIdentifier;
- (NSString)bundleIndentifier;
- (id)amsPromise;
- (id)versionString;
- (unint64_t)isAvailableInStore;
- (void)_checkAwaitingInstallsWithUserInfo:(id)a3;
- (void)_performAvailabilityCheck:(id)a3;
- (void)_setAvailableInStoreResult:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)checkAvailabilityInStore:(id)a3;
- (void)dealloc;
- (void)notifyObserversThatAppAvailabilityChanged:(BOOL)a3;
- (void)notifyObserversThatControllerDidBeginInstallationWithSuccess:(BOOL)a3;
- (void)notifyObserversThatControllerDidCompleteInstallationWithSuccess:(BOOL)a3;
- (void)notifyObserversThatControllerDidInitiatePurchase;
- (void)removeObserver:(id)a3;
- (void)setAvailableInStoreResult:(BOOL)a3;
- (void)setBundleIndentifier:(id)a3;
- (void)setNeedsAvailableInStoreCheck:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)startInstalling;
@end

@implementation COSAppInstallationController

- (COSAppInstallationController)initWithBundleID:(id)a3 andStoreIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)COSAppInstallationController;
  v8 = [(COSAppInstallationController *)&v15 init];
  if (v8)
  {
    uint64_t v9 = +[NSHashTable weakObjectsHashTable];
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    objc_storeStrong((id *)&v8->_storeIdentifier, a4);
    v11 = (NSString *)[v6 copy];
    bundleIndentifier = v8->_bundleIndentifier;
    v8->_bundleIndentifier = v11;

    v8->_needsAvailableInStoreCheck = 1;
    v13 = +[LSApplicationWorkspace defaultWorkspace];
    [v13 addObserver:v8];
  }
  return v8;
}

- (void)dealloc
{
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.applicationRegistered", 0);
  v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)COSAppInstallationController;
  [(COSAppInstallationController *)&v5 dealloc];
}

- (BOOL)isInstalled
{
  if (self->_bundleIndentifier)
  {
    id v3 = objc_alloc((Class)LSApplicationRecord);
    bundleIndentifier = self->_bundleIndentifier;
    id v12 = 0;
    id v5 = [v3 initWithBundleIdentifier:bundleIndentifier allowPlaceholder:0 error:&v12];
    id v6 = v12;
    if (v6)
    {
      id v7 = pbb_bridge_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_bundleIndentifier;
        *(_DWORD *)buf = 138412546;
        v14 = v8;
        __int16 v15 = 2112;
        v16 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "error while retrieving application record %@ with error %@", buf, 0x16u);
      }
    }
    uint64_t v9 = [v5 applicationState];
    unsigned __int8 v10 = [v9 isInstalled];
  }
  else
  {
    id v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "isInstalled requires a bundleID", buf, 2u);
    }
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)installInProgress
{
  if (self->_bundleIndentifier)
  {
    v2 = +[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:");
    id v3 = +[LSApplicationWorkspace defaultWorkspace];
    v4 = [v3 installProgressForApplication:v2 withPhase:1];

    if (v4)
    {
      id v5 = [v2 appState];
      if ([v5 isInstalled])
      {
        unsigned __int8 v6 = 0;
      }
      else
      {
        v8 = [v2 appState];
        unsigned __int8 v6 = [v8 isValid];
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    id v7 = pbb_bridge_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "install progress requires a bundleID", v10, 2u);
    }

    return 0;
  }
  return v6;
}

- (id)versionString
{
  if (self->_bundleIndentifier)
  {
    id v3 = objc_alloc((Class)LSApplicationRecord);
    bundleIndentifier = self->_bundleIndentifier;
    id v11 = 0;
    id v5 = [v3 initWithBundleIdentifier:bundleIndentifier allowPlaceholder:0 error:&v11];
    unsigned __int8 v6 = v11;
    if (v6)
    {
      id v7 = pbb_bridge_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_bundleIndentifier;
        *(_DWORD *)buf = 138412546;
        v13 = v8;
        __int16 v14 = 2112;
        __int16 v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "error while retrieving application record %@ with error %@", buf, 0x16u);
      }
    }
    uint64_t v9 = [v5 shortVersionString];
  }
  else
  {
    unsigned __int8 v6 = pbb_bridge_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "versionString requires a bundleID", buf, 2u);
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_checkAwaitingInstallsWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"bundleIDs"];
  unsigned __int8 v6 = [v4 objectForKeyedSubscript:@"isPlaceholder"];
  id v7 = v6;
  if (v6 && ([v6 BOOLValue] & 1) == 0)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        id v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v12), "isEqualToString:", self->_bundleIndentifier, (void)v14))
          {

            DistributedCenter = CFNotificationCenterGetDistributedCenter();
            CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.applicationRegistered", 0);
            [(COSAppInstallationController *)self notifyObserversThatControllerDidCompleteInstallationWithSuccess:1];
            goto LABEL_13;
          }
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
LABEL_13:
}

- (void)startInstalling
{
  id v3 = pbb_bridge_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    storeIdentifier = self->_storeIdentifier;
    *(_DWORD *)buf = 138412290;
    long long v14 = storeIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting install for StoreID: %@", buf, 0xCu);
  }

  if (self->_storeIdentifier)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, self, (CFNotificationCallback)sub_100086A8C, @"com.apple.LaunchServices.applicationRegistered", 0, CFNotificationSuspensionBehaviorCoalesce);
    unsigned __int8 v6 = +[NSString stringWithFormat:@"%@", self->_storeIdentifier];
    id v7 = [(COSAppInstallationController *)self amsPromise];
    objc_initWeak((id *)buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100086A98;
    v9[3] = &unk_1002454E0;
    objc_copyWeak(&v12, (id *)buf);
    id v10 = @"com.nike.nikeplus-gps";
    id v8 = v6;
    id v11 = v8;
    [v7 addFinishBlock:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_setAvailableInStoreResult:(BOOL)a3
{
  BOOL availableInStoreResult = self->_availableInStoreResult;
  self->_BOOL availableInStoreResult = a3;
  if (availableInStoreResult != a3 || self->_needsAvailableInStoreCheck) {
    -[COSAppInstallationController notifyObserversThatAppAvailabilityChanged:](self, "notifyObserversThatAppAvailabilityChanged:");
  }
  self->_needsAvailableInStoreCheck = 0;
}

- (void)_performAvailabilityCheck:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_storeIdentifier)
  {
    unsigned __int8 v6 = [(COSAppInstallationController *)self amsPromise];
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000873D4;
    v7[3] = &unk_100245508;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    [v6 addFinishBlock:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (id)amsPromise
{
  id v3 = +[AMSMediaTask bagSubProfile];
  id v4 = +[AMSMediaTask bagSubProfileVersion];
  id v5 = +[AMSBag bagForProfile:v3 profileVersion:v4];

  id v6 = [objc_alloc((Class)AMSMediaTask) initWithType:0 clientIdentifier:@"com.apple.Bridge" clientVersion:@"1" bag:v5];
  id v7 = +[NSString stringWithFormat:@"%@", self->_storeIdentifier];
  id v11 = v7;
  id v8 = +[NSArray arrayWithObjects:&v11 count:1];
  [v6 setItemIdentifiers:v8];

  id v9 = [v6 perform];

  return v9;
}

- (unint64_t)isAvailableInStore
{
  if (self->_needsAvailableInStoreCheck) {
    return 0;
  }
  if (self->_availableInStoreResult) {
    return 1;
  }
  return 2;
}

- (void)checkAvailabilityInStore:(id)a3
{
  if (self->_needsAvailableInStoreCheck) {
    [(COSAppInstallationController *)self _performAvailabilityCheck:a3];
  }
  else {
    (*((void (**)(id, BOOL))a3 + 2))(a3, self->_availableInStoreResult);
  }
}

+ (void)getAppAvailabilityStatusWithBundleID:(id)a3 andStoreIdentifier:(id)a4 andCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[COSAppInstallationController alloc] initWithBundleID:v9 andStoreIdentifier:v8];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000878F4;
  v12[3] = &unk_100244FD0;
  id v13 = v7;
  id v11 = v7;
  [(COSAppInstallationController *)v10 _performAvailabilityCheck:v12];
}

- (void)notifyObserversThatControllerDidCompleteInstallationWithSuccess:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100087988;
  v3[3] = &unk_1002448E8;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)notifyObserversThatControllerDidInitiatePurchase
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100087AFC;
  block[3] = &unk_1002438A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyObserversThatControllerDidBeginInstallationWithSuccess:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100087C6C;
  v3[3] = &unk_1002448E8;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)notifyObserversThatAppAvailabilityChanged:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100087DE4;
  v3[3] = &unk_1002448E8;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) bundleIdentifier];
        unsigned int v10 = [v9 isEqualToString:self->_bundleIndentifier];

        if (v10) {
          [(COSAppInstallationController *)self notifyObserversThatControllerDidCompleteInstallationWithSuccess:1];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSString)bundleIndentifier
{
  return self->_bundleIndentifier;
}

- (void)setBundleIndentifier:(id)a3
{
}

- (NSNumber)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (BOOL)availableInStoreResult
{
  return self->_availableInStoreResult;
}

- (void)setAvailableInStoreResult:(BOOL)a3
{
  self->_BOOL availableInStoreResult = a3;
}

- (BOOL)needsAvailableInStoreCheck
{
  return self->_needsAvailableInStoreCheck;
}

- (void)setNeedsAvailableInStoreCheck:(BOOL)a3
{
  self->_needsAvailableInStoreCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIndentifier, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end