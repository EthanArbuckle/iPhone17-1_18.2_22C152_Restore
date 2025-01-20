@interface CSDStatusBarManager
+ (BOOL)isDeviceSupported;
+ (id)bundleIdentifiersForPillDataSource;
- (BOOL)isTrackingMSNException;
- (BOOL)shouldOpenInCallServiceForCall:(id)a3;
- (CSDConversationServerBag)serverBag;
- (CSDStatusBarManager)init;
- (CSDStatusBarManager)initWithResolver:(id)a3 withSystemStatusPublisher:(id)a4 queue:(id)a5;
- (CSDStatusBarResolver)resolver;
- (OS_dispatch_queue)queue;
- (STCallingStatusDomainCallDescriptor)currentDescriptor;
- (STCallingStatusDomainPublisher)systemStatusPublisher;
- (id)msnPillRegister;
- (void)currentStatusDescriptorForIdentifier:(id)a3 reply:(id)a4;
- (void)displayHandoffEligibleNearbyByURL;
- (void)displayLagunaPullByURL;
- (void)displaySystemCallControlsByURL;
- (void)openInCallServiceByURL;
- (void)openUIServiceWithURL:(id)a3;
- (void)openVoIPApplicationForCall:(id)a3;
- (void)pillDataSourceRegistrationChangedForResolver:(id)a3;
- (void)resolutionChangedForResolver:(id)a3;
- (void)setCurrentDescriptor:(id)a3;
- (void)setIsTrackingMSNException:(BOOL)a3;
- (void)setMsnPillRegister:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResolver:(id)a3;
- (void)setServerBag:(id)a3;
- (void)startTrackingException;
- (void)stopTrackingException;
- (void)updateAttributionsForDescriptor:(id)a3;
- (void)updateRegistrationIfNeeded;
- (void)updateStatusBar;
@end

@implementation CSDStatusBarManager

+ (BOOL)isDeviceSupported
{
  v2 = +[FTDeviceSupport sharedInstance];
  BOOL v3 = [v2 deviceType] != (id)7;

  return v3;
}

- (CSDStatusBarManager)init
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_1000657C0;
  v14 = sub_1000657D0;
  id v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000657D8;
  block[3] = &unk_100505B90;
  v8 = self;
  v9 = &v10;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.statusbarmanager", 0);
  v2 = v8;
  BOOL v3 = v7;
  dispatch_sync(v3, block);
  v4 = (CSDStatusBarManager *)(id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

+ (id)bundleIdentifiersForPillDataSource
{
  v5[0] = TUBundleIdentifierFaceTimeApplication;
  v5[1] = TUBundleIdentifierMobilePhoneApplication;
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  BOOL v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (CSDStatusBarManager)initWithResolver:(id)a3 withSystemStatusPublisher:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CSDStatusBarManager;
  uint64_t v12 = [(CSDStatusBarManager *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a5);
    objc_storeStrong((id *)&v13->_resolver, a3);
    [(CSDStatusBarResolver *)v13->_resolver setDelegate:v13];
    objc_storeStrong((id *)&v13->_systemStatusPublisher, a4);
    objc_initWeak(&location, v13);
    systemStatusPublisher = v13->_systemStatusPublisher;
    v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    v18 = sub_100065AB4;
    v19 = &unk_100505BB8;
    objc_copyWeak(&v20, &location);
    [(STCallingStatusDomainPublisher *)systemStatusPublisher handleUserInteractionsWithBlock:&v16];
    [(CSDStatusBarManager *)v13 updateStatusBar];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (BOOL)shouldOpenInCallServiceForCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 status];
  v6 = [(CSDStatusBarResolver *)self->_resolver resolvedConversation];
  if ([v6 state] == (id)1)
  {
    dispatch_queue_t v7 = [(CSDStatusBarResolver *)self->_resolver resolvedConversation];
    BOOL v8 = [v7 avMode] == (id)2;
  }
  else
  {
    BOOL v8 = 0;
  }

  if (v5 == 4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    id v10 = [v4 provider];
    unsigned int v9 = [v10 isSystemProvider] | v8;
  }
  id v11 = objc_alloc_init((Class)TUFeatureFlags);
  uint64_t v12 = [v4 provider];
  if (![v12 supportsDynamicSystemUI]
    || ![v11 groupConversations])
  {
    goto LABEL_12;
  }
  int HasChinaSKU = TUDeviceHasChinaSKU();

  if (HasChinaSKU)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v4 providerDisplayMonitor];
      unsigned int v9 = [v12 isVisible] ^ 1;
LABEL_12:
    }
  }
  if ([v4 isPTT])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v4 providerDisplayMonitor];
      unsigned int v9 = [v14 isVisible] ^ 1;
    }
  }

  return v9;
}

- (void)updateRegistrationIfNeeded
{
  BOOL v3 = [(CSDStatusBarManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDStatusBarManager *)self resolver];
  unsigned __int8 v5 = [v4 shouldRegisterForPillDatasource];

  if (v5)
  {
    id v18 = [(CSDStatusBarManager *)self resolver];
    if ([v18 shouldRegisterForPillDatasource])
    {
      v6 = [(CSDStatusBarManager *)self msnPillRegister];

      if (!v6)
      {
        id v7 = objc_alloc_init((Class)TUFeatureFlags);
        if ([v7 usesMediaSafetyNetPillDataSource])
        {
          BOOL v8 = [(CSDStatusBarManager *)self serverBag];
          unsigned int v9 = [v8 isMSNPillDataSourceEnabled];

          if (v9)
          {
            id v10 = (objc_class *)CUTWeakLinkClass();
            if (v10)
            {
              id v11 = [v10 alloc];
              if (objc_opt_respondsToSelector())
              {
                uint64_t v12 = [(CSDStatusBarManager *)self queue];
                -[CSDStatusBarManager setMsnPillRegister:](self, "setMsnPillRegister:", [v11 performSelector:"initWithQueue:" withObject:v12]);

                v13 = [(CSDStatusBarManager *)self msnPillRegister];
                char v14 = objc_opt_respondsToSelector();

                if (v14)
                {
                  id v15 = [(id)objc_opt_class() bundleIdentifiersForPillDataSource];
                  v16 = sub_100008DCC();
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Registering for pill datasource", buf, 2u);
                  }

                  [self->_msnPillRegister performSelector:"registerPillDataSource:forIdentifiers:" withObject:self withObject:v15];
                }
              }
            }
          }
        }
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unregistering for pill datasource", v20, 2u);
    }

    [(CSDStatusBarManager *)self setMsnPillRegister:0];
  }
}

- (void)updateStatusBar
{
  BOOL v3 = [(CSDStatusBarManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v5 = [(CSDStatusBarManager *)self resolver];
  id v4 = [v5 resolvedDescriptor];
  [(CSDStatusBarManager *)self updateAttributionsForDescriptor:v4];
}

- (void)updateAttributionsForDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDStatusBarManager *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(CSDStatusBarManager *)self currentDescriptor];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "updating descriptor old: %{public}@ new: %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  char v14 = sub_1000657C0;
  id v15 = sub_1000657D0;
  id v16 = [(CSDStatusBarManager *)self currentDescriptor];
  [(CSDStatusBarManager *)self setCurrentDescriptor:v4];
  BOOL v8 = [(CSDStatusBarManager *)self systemStatusPublisher];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000663BC;
  v10[3] = &unk_100505BE0;
  uint64_t v12 = buf;
  id v9 = v4;
  id v11 = v9;
  [v8 updateVolatileDataWithBlock:v10];

  _Block_object_dispose(buf, 8);
}

- (void)currentStatusDescriptorForIdentifier:(id)a3 reply:(id)a4
{
  v13 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = [(CSDStatusBarManager *)self queue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(id)objc_opt_class() bundleIdentifiersForPillDataSource];
  unsigned int v9 = [v8 containsObject:v6];

  if (v9)
  {
    id v10 = [(CSDStatusBarManager *)self resolver];
    id v11 = [v10 resolvedCallForActiveDescriptor];

    if (v11)
    {
      uint64_t v12 = [(CSDStatusBarManager *)self currentDescriptor];
      if (![v11 isScreening]
        || ([v11 screeningAnnouncementHasFinished] & 1) != 0
        || v12)
      {
        if ([v11 isScreening]
          && [v11 screeningAnnouncementHasFinished]
          && v12)
        {
          [(CSDStatusBarManager *)self stopTrackingException];
        }
      }
      else
      {
        [(CSDStatusBarManager *)self startTrackingException];
      }
    }
    else
    {
      [(CSDStatusBarManager *)self stopTrackingException];
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  v13[2](v13, v12);
}

- (void)startTrackingException
{
  if (![(CSDStatusBarManager *)self isTrackingMSNException])
  {
    BOOL v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting MSN Exception", v4, 2u);
    }

    MSNMonitorBeginException();
    [(CSDStatusBarManager *)self setIsTrackingMSNException:1];
  }
}

- (void)stopTrackingException
{
  if ([(CSDStatusBarManager *)self isTrackingMSNException])
  {
    BOOL v3 = sub_100008DCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Ending MSN Exception", v4, 2u);
    }

    MSNMonitorEndException();
    [(CSDStatusBarManager *)self setIsTrackingMSNException:0];
  }
}

- (void)displaySystemCallControlsByURL
{
  id v3 = +[NSURL faceTimeShowSystemCallControlsURL];
  [(CSDStatusBarManager *)self openUIServiceWithURL:v3];
}

- (void)displayHandoffEligibleNearbyByURL
{
  id v3 = +[NSURL faceTimeShowHandoffEligibleNearbyURL];
  [(CSDStatusBarManager *)self openUIServiceWithURL:v3];
}

- (void)displayLagunaPullByURL
{
  id v3 = +[NSURL faceTimeShowLagunaPullConversationURL];
  [(CSDStatusBarManager *)self openUIServiceWithURL:v3];
}

- (void)openInCallServiceByURL
{
  id v3 = +[NSURL faceTimeShowInCallUIURL];
  [(CSDStatusBarManager *)self openUIServiceWithURL:v3];
}

- (void)openUIServiceWithURL:(id)a3
{
  id v3 = a3;
  id v4 = +[CSDCallCapabilities sharedInstance];
  unsigned int v5 = [v4 _supportslaunchingInCallApplicationForIncomingCall];

  if (v5)
  {
    id v6 = v3;
    TUOpenURLWithCompletion();
  }
}

- (void)openVoIPApplicationForCall:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  unsigned int v5 = [v4 applicationRecord];
  id v6 = [v5 bundleIdentifier];

  if ([v6 length])
  {
    id v7 = objc_alloc_init((Class)_LSOpenConfiguration);
    unsigned int v8 = [v4 isPTT];
    unsigned int v9 = sub_100008DCC();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Background launching application with bundle identifier %@", buf, 0xCu);
      }

      uint64_t v22 = FBSOpenApplicationOptionKeyActivateSuspended;
      v23 = &__kCFBooleanTrue;
      id v11 = &v23;
      uint64_t v12 = &v22;
      uint64_t v13 = 1;
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Foreground launching application with bundle identifier %@", buf, 0xCu);
      }

      v20[0] = FBSOpenApplicationOptionKeyUnlockDevice;
      v20[1] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
      v21[0] = &__kCFBooleanTrue;
      v21[1] = &__kCFBooleanTrue;
      id v11 = (void **)v21;
      uint64_t v12 = v20;
      uint64_t v13 = 2;
    }
    char v14 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v12 count:v13];
    [v7 setFrontBoardOptions:v14];

    id v15 = +[LSApplicationWorkspace defaultWorkspace];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100066C6C;
    v16[3] = &unk_100505C08;
    id v17 = v6;
    id v18 = v4;
    id v19 = v3;
    [v15 openApplicationWithBundleIdentifier:v17 configuration:v7 completionHandler:v16];
  }
}

- (void)resolutionChangedForResolver:(id)a3
{
  id v4 = [(CSDStatusBarManager *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDStatusBarManager *)self updateStatusBar];
}

- (void)pillDataSourceRegistrationChangedForResolver:(id)a3
{
  id v4 = [(CSDStatusBarManager *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDStatusBarManager *)self updateRegistrationIfNeeded];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSDStatusBarResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
}

- (STCallingStatusDomainPublisher)systemStatusPublisher
{
  return self->_systemStatusPublisher;
}

- (STCallingStatusDomainCallDescriptor)currentDescriptor
{
  return self->_currentDescriptor;
}

- (void)setCurrentDescriptor:(id)a3
{
}

- (id)msnPillRegister
{
  return self->_msnPillRegister;
}

- (void)setMsnPillRegister:(id)a3
{
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (BOOL)isTrackingMSNException
{
  return self->_isTrackingMSNException;
}

- (void)setIsTrackingMSNException:(BOOL)a3
{
  self->_isTrackingMSNException = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong(&self->_msnPillRegister, 0);
  objc_storeStrong((id *)&self->_currentDescriptor, 0);
  objc_storeStrong((id *)&self->_systemStatusPublisher, 0);
  objc_storeStrong((id *)&self->_resolver, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end