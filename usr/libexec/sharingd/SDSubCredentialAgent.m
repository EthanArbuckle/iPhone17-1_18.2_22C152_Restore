@interface SDSubCredentialAgent
+ (id)sharedAgent;
- (BOOL)_uiShowing;
- (NSString)description;
- (OS_dispatch_queue)dispatchQueue;
- (SDSubCredentialAgent)init;
- (void)_activate;
- (void)_invalidate;
- (void)_uiPresentWithParams:(id)a3 completion:(id)a4;
- (void)activate;
- (void)invalidate;
- (void)prefsChanged;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)uiPresentWithParams:(id)a3 completion:(id)a4;
- (void)uiPresentWithParamsDirect:(id)a3 completion:(id)a4;
@end

@implementation SDSubCredentialAgent

+ (id)sharedAgent
{
  if (qword_1009802A0 != -1) {
    dispatch_once(&qword_1009802A0, &stru_1008CFC00);
  }
  v2 = (void *)qword_1009802A8;

  return v2;
}

- (SDSubCredentialAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)SDSubCredentialAgent;
  v2 = [(SDSubCredentialAgent *)&v7 init];
  if (v2)
  {
    v3 = SFMainQueue();
    [(SDSubCredentialAgent *)v2 setDispatchQueue:v3];

    uint64_t v4 = +[SDStatusMonitor sharedMonitor];
    statusMonitor = v2->_statusMonitor;
    v2->_statusMonitor = (SDStatusMonitor *)v4;
  }
  return v2;
}

- (NSString)description
{
  id v2 = objc_alloc_init((Class)NSMutableString);
  [v2 appendFormat:@"-- SDSubCredentialAgent --"];

  return (NSString *)v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B9D0C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969048 <= 50 && (dword_100969048 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  [(SDSubCredentialAgent *)self prefsChanged];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001B9E14;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_100969048 <= 50 && (dword_100969048 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  BOOL v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefAppInfoDownload != v3)
  {
    if (dword_100969048 <= 40 && (dword_100969048 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_prefAppInfoDownload = v3;
  }
  CFStringGetTypeID();
  uint64_t v4 = (void *)CFPrefs_CopyTypedValue();
  if (v4)
  {
    if (dword_100969048 <= 50 && (dword_100969048 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_prefAppStoreURL, v4);
  }
  CFStringGetTypeID();
  v5 = (void *)CFPrefs_CopyTypedValue();

  if (v5)
  {
    if (dword_100969048 <= 50 && (dword_100969048 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_prefWalletLaunchURL, v5);
  }
}

- (void)uiPresentWithParams:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BA1E8;
  block[3] = &unk_1008CAD48;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)uiPresentWithParamsDirect:(id)a3 completion:(id)a4
{
}

- (void)_uiPresentWithParams:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v8 = [v6 adamIDs];
  if (v8
    || ([v6 adamID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v31 = v9,
        +[NSArray arrayWithObjects:&v31 count:1],
        v8 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8))
  {
    id v10 = [v6 title];
    if (!v10)
    {
      if (dword_100969048 <= 90 && (dword_100969048 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v11 = NSErrorWithOSStatusF();
      if (v7) {
        v7[2](v7, v11);
      }
      goto LABEL_54;
    }
    v11 = [v6 subtitle];
    if (v11)
    {
      id v12 = [v6 issuerID];
      if (v12 || ([v6 adamID], (id v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        if (gSDProxCardsSuppressed)
        {
          if (dword_100969048 > 90 || dword_100969048 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_50;
          }
        }
        else if ([(SDSubCredentialAgent *)self _uiShowing])
        {
          if (dword_100969048 > 90 || dword_100969048 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_50;
          }
        }
        else
        {
          id v13 = +[SDStatusMonitor sharedMonitor];
          [v13 systemUIFlags];

          v14 = +[SDStatusMonitor sharedMonitor];
          unsigned int v15 = [v14 systemUIFlags] & 0x5C808;

          if (!v15)
          {
            if (dword_100969048 <= 30 && (dword_100969048 != -1 || _LogCategory_Initialize()))
            {
              v29 = v8;
              LogPrintF();
            }
            id v17 = objc_alloc_init((Class)NSMutableDictionary);
            [v17 setObject:v8 forKeyedSubscript:@"adamIDs"];
            [v17 setObject:v10 forKeyedSubscript:@"title"];
            [v17 setObject:v11 forKeyedSubscript:@"subtitle"];
            [v17 setObject:v12 forKeyedSubscript:@"issuerID"];
            v18 = +[NSNumber numberWithBool:self->_prefAppInfoDownload];
            [v17 setObject:v18 forKeyedSubscript:@"appInfoDownload"];

            prefAppStoreURL = self->_prefAppStoreURL;
            if (prefAppStoreURL) {
              [v17 setObject:prefAppStoreURL forKeyedSubscript:@"appStoreURL"];
            }
            prefWalletLaunchURL = self->_prefWalletLaunchURL;
            if (prefWalletLaunchURL) {
              [v17 setObject:prefWalletLaunchURL forKeyedSubscript:@"launchURL"];
            }
            id v21 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:@"com.apple.SharingViewService" viewControllerClassName:@"SubCredentialActivationMainController"];
            v22 = objc_opt_new();
            [v22 setUserInfo:v17];
            alertHandle = self->_alertHandle;
            if (alertHandle)
            {
              [(SBSRemoteAlertHandle *)alertHandle removeObserver:self];
              [(SBSRemoteAlertHandle *)self->_alertHandle invalidate];
              v24 = self->_alertHandle;
              self->_alertHandle = 0;
            }
            v25 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v21, v22, v29);
            v26 = self->_alertHandle;
            self->_alertHandle = v25;

            v27 = self->_alertHandle;
            if (!v27)
            {
              id v30 = v21;
              if (dword_100969048 <= 90 && (dword_100969048 != -1 || _LogCategory_Initialize())) {
                LogPrintF();
              }
              v28 = NSErrorWithOSStatusF();
              if (v7) {
                v7[2](v7, v28);
              }

              v27 = self->_alertHandle;
              id v21 = v30;
            }
            [(SBSRemoteAlertHandle *)v27 addObserver:self];
            [(SBSRemoteAlertHandle *)self->_alertHandle activateWithContext:0];
            if (v7) {
              v7[2](v7, 0);
            }

            goto LABEL_53;
          }
          if (dword_100969048 > 90 || dword_100969048 == -1 && !_LogCategory_Initialize())
          {
LABEL_50:
            v16 = NSErrorWithOSStatusF();
            if (v7) {
              v7[2](v7, v16);
            }

LABEL_53:
LABEL_54:

            goto LABEL_55;
          }
        }
        LogPrintF();
        goto LABEL_50;
      }
      if (dword_100969048 > 90 || dword_100969048 == -1 && !_LogCategory_Initialize())
      {
LABEL_35:
        id v12 = NSErrorWithOSStatusF();
        if (v7) {
          v7[2](v7, v12);
        }
        goto LABEL_53;
      }
    }
    else if (dword_100969048 > 90 || dword_100969048 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_35;
    }
    LogPrintF();
    goto LABEL_35;
  }
  if (dword_100969048 <= 90 && (dword_100969048 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v8 = NSErrorWithOSStatusF();
  if (v7) {
    v7[2](v7, v8);
  }
LABEL_55:
}

- (BOOL)_uiShowing
{
  return self->_alertHandle != 0;
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BA9E0;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001BAB6C;
  v7[3] = &unk_1008CA640;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BAD24;
  block[3] = &unk_1008CAF18;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_prefWalletLaunchURL, 0);
  objc_storeStrong((id *)&self->_prefAppStoreURL, 0);

  objc_storeStrong((id *)&self->_alertHandle, 0);
}

@end