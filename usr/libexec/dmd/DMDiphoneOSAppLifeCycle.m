@interface DMDiphoneOSAppLifeCycle
- (DMDiphoneOSAppLifeCycle)initWithBundleIdentifier:(id)a3;
- (NSProgress)proxyProgress;
- (id)progress;
- (void)_findProxyInProxies:(id)a3 andCallBlock:(id)a4;
- (void)applicationInstallsDidCancel:(id)a3;
- (void)applicationInstallsDidChange:(id)a3;
- (void)applicationInstallsDidPause:(id)a3;
- (void)applicationInstallsDidResume:(id)a3;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidFailToInstall:(id)a3;
- (void)applicationsDidFailToUninstall:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsWillInstall:(id)a3;
- (void)applicationsWillUninstall:(id)a3;
- (void)dealloc;
- (void)setProxyProgress:(id)a3;
@end

@implementation DMDiphoneOSAppLifeCycle

- (DMDiphoneOSAppLifeCycle)initWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = DMFAppLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v41 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initialize app life cycle with bundle identifier: %{public}@", buf, 0xCu);
  }

  id v39 = 0;
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v39];
  id v6 = v39;
  if (!v5)
  {
    v7 = DMFAppLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10007FF84((uint64_t)v3, (uint64_t)v6, v7);
    }
  }
  v8 = [v5 compatibilityObject];
  v9 = v8;
  if (v5 && v8)
  {
    v10 = [v8 appState];
    unsigned int v11 = [v10 isInstalled];

    unint64_t v12 = (unint64_t)[v9 installType];
    if (v12 > 0xA)
    {
LABEL_25:
      uint64_t v15 = 0;
    }
    else if (((1 << v12) & 0x45E) != 0)
    {
      v13 = [v9 installProgress];
      id v14 = [v13 installState];

      switch((unint64_t)v14)
      {
        case 0uLL:
          if (v11) {
            uint64_t v15 = 5;
          }
          else {
            uint64_t v15 = 1;
          }
          break;
        case 1uLL:
          BOOL v20 = v11 == 0;
          uint64_t v21 = 2;
          uint64_t v22 = 6;
          goto LABEL_31;
        case 2uLL:
          BOOL v20 = v11 == 0;
          uint64_t v21 = 3;
          uint64_t v22 = 7;
LABEL_31:
          if (v20) {
            uint64_t v15 = v21;
          }
          else {
            uint64_t v15 = v22;
          }
          break;
        case 3uLL:
        case 4uLL:
          if (v11) {
            uint64_t v15 = 4;
          }
          else {
            uint64_t v15 = 0;
          }
          break;
        case 5uLL:
          uint64_t v15 = 4;
          break;
        default:
          goto LABEL_25;
      }
    }
    else
    {
      uint64_t v18 = 4;
      if (!v11) {
        uint64_t v18 = 0;
      }
      uint64_t v19 = 6;
      if (v12 != 5) {
        uint64_t v19 = 0;
      }
      if (v12) {
        uint64_t v15 = v19;
      }
      else {
        uint64_t v15 = v18;
      }
    }
    v16 = DMFAppLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v23 = +[DMFApp stringForInstallationState:v15];
      if (v11) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      v36 = [v9 appState:v24];
      id v25 = v6;
      if ([v36 isPlaceholder]) {
        CFStringRef v26 = @"YES";
      }
      else {
        CFStringRef v26 = @"NO";
      }
      id v27 = [v9 installType];
      v28 = [v9 installProgress];
      id v29 = [v28 installState];
      *(_DWORD *)buf = 138544642;
      id v41 = v3;
      __int16 v42 = 2114;
      v43 = v23;
      __int16 v44 = 2114;
      uint64_t v45 = v35;
      __int16 v46 = 2114;
      CFStringRef v47 = v26;
      id v6 = v25;
      __int16 v48 = 2048;
      id v49 = v27;
      __int16 v50 = 2048;
      id v51 = v29;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "App lifecycle for %{public}@\n\tcalculated install state:%{public}@\n\tis installed: %{public}@\n\tis placeholder: %{public}@\n\tinstall type: %lu\n\tinstall progress install state: %lu", buf, 0x3Eu);
    }
  }
  else
  {
    v16 = DMFAppLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = +[DMFApp stringForInstallationState:0];
      *(_DWORD *)buf = 138543618;
      id v41 = v3;
      __int16 v42 = 2114;
      v43 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "App lifecycle for %{public}@ (no proxy)\n\tassumed install state:%{public}@", buf, 0x16u);
    }
    uint64_t v15 = 0;
  }

  v38.receiver = self;
  v38.super_class = (Class)DMDiphoneOSAppLifeCycle;
  v30 = [(DMDAppLifeCycle *)&v38 initWithBundleIdentifier:v3 currentState:v15];
  if (v30)
  {
    uint64_t v31 = [v9 installProgress];
    proxyProgress = v30->_proxyProgress;
    v30->_proxyProgress = (NSProgress *)v31;

    v33 = +[LSApplicationWorkspace defaultWorkspace];
    [v33 addObserver:v30];
  }
  return v30;
}

- (void)dealloc
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DMDiphoneOSAppLifeCycle;
  [(DMDiphoneOSAppLifeCycle *)&v4 dealloc];
}

- (id)progress
{
  return [(DMDiphoneOSAppLifeCycle *)self proxyProgress];
}

- (void)applicationsWillInstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002579C;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationInstallsDidStart:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000259DC;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationInstallsDidChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100025E68;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationInstallsDidPause:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000260AC;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationInstallsDidResume:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000262F0;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationInstallsDidCancel:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100026534;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationsDidFailToInstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100026780;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationsDidInstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100026ADC;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationsWillUninstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100026F18;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationsDidFailToUninstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000271DC;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)applicationsDidUninstall:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100027398;
  v3[3] = &unk_1000CA530;
  v3[4] = self;
  [(DMDiphoneOSAppLifeCycle *)self _findProxyInProxies:a3 andCallBlock:v3];
}

- (void)_findProxyInProxies:(id)a3 andCallBlock:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v8)
  {
    uint64_t v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2, self, @"DMDAppLifeCycle+iphoneOS.m", 460, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v15 = [(DMDAppLifeCycle *)self bundleIdentifier];
        v16 = [v14 bundleIdentifier];
        unsigned int v17 = [v15 isEqualToString:v16];

        if (v17)
        {
          v8[2](v8, v14);
          goto LABEL_13;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (NSProgress)proxyProgress
{
  return self->_proxyProgress;
}

- (void)setProxyProgress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end