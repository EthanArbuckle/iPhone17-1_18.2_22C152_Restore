@interface F13Server
+ (id)sharedInstance;
- (BOOL)appInstallationInProgress;
- (BOOL)isPOSDevice;
- (F13Server)init;
- (LSApplicationWorkspace)workspace;
- (NSCopying)extensionContextIdentifier;
- (NSExtension)extension;
- (OS_os_transaction)transaction;
- (id)effectiveAppIdentifiers;
- (id)effectiveExtensionAttributes;
- (id)effectiveExtensionIdentifiers;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)dealloc;
- (void)findExtension;
- (void)matchExtension;
- (void)resetExtension;
- (void)setAppInstallationInProgress:(BOOL)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionContextIdentifier:(id)a3;
- (void)setPOSDevice:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setWorkspace:(id)a3;
- (void)verifyExtensionIsRunning;
- (void)windwardAppInstallationStarted;
@end

@implementation F13Server

+ (id)sharedInstance
{
  if (qword_100189868 != -1) {
    dispatch_once(&qword_100189868, &stru_100151A78);
  }
  v2 = (void *)qword_100189860;

  return v2;
}

- (F13Server)init
{
  v9.receiver = self;
  v9.super_class = (Class)F13Server;
  v2 = [(F13Server *)&v9 init];
  if (v2)
  {
    v3 = sub_100068600();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing F13Server", v8, 2u);
    }

    [(F13Server *)v2 setAppInstallationInProgress:0];
    v4 = +[LSApplicationWorkspace defaultWorkspace];
    [(F13Server *)v2 setWorkspace:v4];

    v5 = +[MSDTargetDevice sharedInstance];
    -[F13Server setPOSDevice:](v2, "setPOSDevice:", [v5 isVerifiedPOSDevice]);

    v6 = [(F13Server *)v2 workspace];
    [v6 addObserver:v2];

    [(F13Server *)v2 findExtension];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(F13Server *)self workspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)F13Server;
  [(F13Server *)&v4 dealloc];
}

- (id)effectiveAppIdentifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(F13Server *)self isPOSDevice])
  {
    CFStringRef v4 = @"com.apple.ist.pierogi";
  }
  else
  {
    [v3 addObject:@"com.retailtech.arkenstone"];
    [v3 addObject:@"com.apple.ist.windward"];
    CFStringRef v4 = @"com.apple.ist.DemoDiscoveryApp";
  }
  [v3 addObject:v4];

  return v3;
}

- (id)effectiveExtensionIdentifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  if ([(F13Server *)self isPOSDevice])
  {
    CFStringRef v4 = @"com.apple.ist.pierogi.potato";
  }
  else
  {
    [v3 addObject:@"com.retailtech.arkenstone.extension"];
    [v3 addObject:@"com.apple.ist.windward.Arizona"];
    CFStringRef v4 = @"com.apple.ist.DemoDiscoveryApp.Extension";
  }
  [v3 addObject:v4];

  return v3;
}

- (id)effectiveExtensionAttributes
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(F13Server *)self isPOSDevice];
  uint64_t v5 = NSExtensionIdentifierName;
  if (v4)
  {
    v21[0] = NSExtensionIdentifierName;
    v22[0] = @"com.apple.ist.pierogi.potato";
    v6 = +[NSString stringWithFormat:@"ENTITLEMENT:%@", @"com.apple.ist.pierogi.potato"];
    v21[1] = v6;
    v22[1] = &__kCFBooleanTrue;
    v7 = v22;
    v8 = v21;
  }
  else
  {
    v19[0] = NSExtensionIdentifierName;
    v20[0] = @"com.retailtech.arkenstone.extension";
    objc_super v9 = +[NSString stringWithFormat:@"ENTITLEMENT:%@", @"com.retailtech.arkenstone.extension"];
    v19[1] = v9;
    v20[1] = &__kCFBooleanTrue;
    v10 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v3 addObject:v10];

    v17[0] = v5;
    v18[0] = @"com.apple.ist.windward.Arizona";
    v11 = +[NSString stringWithFormat:@"ENTITLEMENT:%@", @"com.apple.ist.windward.Arizona"];
    v17[1] = v11;
    v18[1] = &__kCFBooleanTrue;
    v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v3 addObject:v12];

    v16[0] = @"com.apple.ist.DemoDiscoveryApp.Extension";
    v6 = +[NSString stringWithFormat:@"ENTITLEMENT:%@", @"com.apple.ist.DemoDiscoveryApp.Extension", v5];
    v15[1] = v6;
    v16[1] = &__kCFBooleanTrue;
    v7 = v16;
    v8 = v15;
  }
  v13 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v8 count:2];
  [v3 addObject:v13];

  return v3;
}

- (void)findExtension
{
  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Finding extension...", (uint8_t *)&v5, 2u);
  }

  unsigned int v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543874;
    CFStringRef v6 = @"com.retailtech.arkenstone.extension";
    __int16 v7 = 2114;
    CFStringRef v8 = @"com.apple.ist.windward.Arizona";
    __int16 v9 = 2114;
    CFStringRef v10 = @"com.apple.ist.DemoDiscoveryApp.Extension";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "\"ENTITLEMENT:%{public}@\" OR \"ENTITLEMENT:%{public}@\" OR \"ENTITLEMENT:%{public}@\"", (uint8_t *)&v5, 0x20u);
  }

  [(F13Server *)self verifyExtensionIsRunning];
  [(F13Server *)self matchExtension];
}

- (void)matchExtension
{
  [(F13Server *)self effectiveExtensionAttributes];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        __int16 v7 = *(NSObject **)(*((void *)&v18 + 1) + 8 * i);
        CFStringRef v8 = sub_100068600();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "F13Server: Matching extension: %{public}@", buf, 0xCu);
        }

        id v17 = 0;
        __int16 v9 = +[NSExtension extensionsWithMatchingAttributes:v7 error:&v17];
        CFStringRef v10 = v17;
        if (!v10 && [v9 count])
        {
          v13 = [v9 firstObject];
          [(F13Server *)self setExtension:v13];

          v14 = sub_100068600();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "F13Server: Found extension!", buf, 2u);
          }

          v15 = (void *)os_transaction_create();
          [(F13Server *)self setTransaction:v15];

          v12 = v2;
          goto LABEL_19;
        }
        v11 = sub_100068600();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "F13Server: Error matching extension: %{public}@", buf, 0xCu);
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v2;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "F13Server: Failed to match extensions in: %{public}@", buf, 0xCu);
  }
LABEL_19:
}

- (void)verifyExtensionIsRunning
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000079E8;
  v3[3] = &unk_100151AC8;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)resetExtension
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007DC4;
  block[3] = &unk_100151AF0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)windwardAppInstallationStarted
{
  id v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "F13Server: killing extension...", v4, 2u);
  }

  [(F13Server *)self resetExtension];
  [(F13Server *)self setAppInstallationInProgress:1];
}

- (void)applicationInstallsDidStart:(id)a3
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    long long v21 = self;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        CFStringRef v10 = [(F13Server *)self effectiveAppIdentifiers];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              id v17 = [v9 bundleIdentifier];
              LODWORD(v16) = [v17 isEqualToString:v16];

              if (v16)
              {
                long long v18 = sub_100068600();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  long long v19 = [v9 bundleIdentifier];
                  *(_DWORD *)buf = 138543362;
                  v31 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "F13Server: New %{public}@ app installation started, killing extension...", buf, 0xCu);
                }
                [(F13Server *)v21 windwardAppInstallationStarted];

                goto LABEL_20;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v20;
        self = v21;
      }
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v6);
  }
LABEL_20:
}

- (void)applicationsDidInstall:(id)a3
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    long long v21 = self;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        __int16 v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        CFStringRef v10 = [(F13Server *)self effectiveAppIdentifiers];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * (void)j);
              id v17 = [v9 bundleIdentifier];
              LODWORD(v16) = [v17 isEqualToString:v16];

              if (v16)
              {
                long long v18 = sub_100068600();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  long long v19 = [v9 bundleIdentifier];
                  *(_DWORD *)buf = 138543362;
                  v31 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "F13Server: %{public}@ app installation finished", buf, 0xCu);
                }
                [(F13Server *)v21 setAppInstallationInProgress:0];
                [(F13Server *)v21 matchExtension];

                goto LABEL_20;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v20;
        self = v21;
      }
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v6);
  }
LABEL_20:
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (LSApplicationWorkspace)workspace
{
  return self->_workspace;
}

- (void)setWorkspace:(id)a3
{
}

- (NSCopying)extensionContextIdentifier
{
  return self->_extensionContextIdentifier;
}

- (void)setExtensionContextIdentifier:(id)a3
{
}

- (BOOL)appInstallationInProgress
{
  return self->_appInstallationInProgress;
}

- (void)setAppInstallationInProgress:(BOOL)a3
{
  self->_appInstallationInProgress = a3;
}

- (BOOL)isPOSDevice
{
  return self->_POSDevice;
}

- (void)setPOSDevice:(BOOL)a3
{
  self->_POSDevice = a3;
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_extensionContextIdentifier, 0);
  objc_storeStrong((id *)&self->_workspace, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end