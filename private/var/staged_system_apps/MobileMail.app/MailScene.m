@interface MailScene
+ (BOOL)wantsDeferredConnectionActions;
+ (NSArray)menuCommands;
+ (OS_os_log)log;
- (BOOL)allowsBackgroundMonitoring;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isInExpandedEnvironment;
- (BOOL)shouldUpdateWidgetWhenSceneResignsActive;
- (EFCancelable)backgroundMonitorOverrideObservation;
- (EMDaemonBooster)daemonBooster;
- (EMDaemonInterface)daemonInterface;
- (MFAlertOverlayController)alertOverlayController;
- (MFMailAssetViewerManager)assetViewerManager;
- (MFMailboxProvider)mailboxProvider;
- (MFURLRouter)urlRouter;
- (MFWindow)mf_window;
- (MUIBrandIndicatorProvider)brandIndicatorProvider;
- (MailExtendedLaunchTracker)extendedLaunchTracker;
- (NSMutableSet)backgroundMonitors;
- (NSString)ef_publicDescription;
- (UIAlertController)lowDiskAlertController;
- (UIViewController)mf_rootViewController;
- (id)_createURLRoutes;
- (id)undoManager;
- (id)undoManagerForWindow:(id)a3;
- (unint64_t)urlRouter:(id)a3 decidePolicyForRoutingRequest:(id)a4;
- (void)_escapeShortcutInvoked:(id)a3;
- (void)_freeDiskSpaceStatusDidChange:(id)a3;
- (void)_switchToComposeSceneWithContext:(id)a3 modifiedContentsURL:(id)a4 isReply:(BOOL)a5 composeType:(int64_t)a6;
- (void)addBackgroundMonitor:(id)a3;
- (void)assetViewerManager:(id)a3 editCompletedForHandler:(id)a4 URL:(id)a5;
- (void)assetViewerManager:(id)a3 sceneClosedForHandler:(id)a4;
- (void)beginBackgroundMonitoring;
- (void)closeSceneWithAnimation:(int64_t)a3;
- (void)closeSceneWithAnimation:(int64_t)a3 errorHandler:(id)a4;
- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5;
- (void)endBackgroundMonitoring;
- (void)mailSceneDebugGesturePerformed;
- (void)mailSceneDidBecomeActive;
- (void)mailSceneDidConnectWithOptions:(id)a3;
- (void)mailSceneDidDisconnect;
- (void)mailSceneDidEnterBackground;
- (void)mailSceneOpenURLContexts:(id)a3;
- (void)mailSceneWillEnterForeground;
- (void)mailSceneWillResignActive;
- (void)mf_resetPreferredTitle;
- (void)monitor:(id)a3 requestsAction:(int64_t)a4;
- (void)redo:(id)a3;
- (void)setBackgroundMonitorOverrideObservation:(id)a3;
- (void)setBackgroundMonitors:(id)a3;
- (void)setDaemonBooster:(id)a3;
- (void)setLowDiskAlertController:(id)a3;
- (void)setMf_rootViewController:(id)a3;
- (void)undo:(id)a3;
@end

@implementation MailScene

- (void)mailSceneDidBecomeActive
{
  if (a1)
  {
    v2 = +[MFDiskFreeSpaceMonitor defaultMonitor];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000B710;
    v3[3] = &unk_1006074A0;
    v3[4] = a1;
    [v2 getFreeSpaceStatusWithCompletionHandler:v3];
  }
}

- (MUIBrandIndicatorProvider)brandIndicatorProvider
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 brandIndicatorProvider];

  return (MUIBrandIndicatorProvider *)v3;
}

+ (NSArray)menuCommands
{
  v2 = (void *)qword_100699700;
  if (!qword_100699700)
  {
    v3 = +[MFMailMenuCommand shortcutWithInput:UIKeyInputEscape flags:0 repeatable:0 menu:0 action:"_escapeShortcutInvoked:"];
    v7 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v7 count:1];
    v5 = (void *)qword_100699700;
    qword_100699700 = v4;

    v2 = (void *)qword_100699700;
  }

  return (NSArray *)v2;
}

- (NSString)ef_publicDescription
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(MailScene *)self session];
  v5 = [v4 persistentIdentifier];
  v6 = +[NSString stringWithFormat:@"%@:%@", v3, v5];

  return (NSString *)v6;
}

- (void)mailSceneWillEnterForeground
{
  [(MailScene *)self endBackgroundMonitoring];
  uint64_t v3 = [(MailScene *)self daemonBooster];

  if (!v3)
  {
    id v8 = [(MailScene *)self daemonInterface];
    uint64_t v4 = [v8 clientState];
    v5 = [(MailScene *)self ef_publicDescription];
    v6 = [v4 daemonBoosterWithDescription:v5];
    [(MailScene *)self setDaemonBooster:v6];
  }
  [(MailScene *)self mf_resetPreferredTitle];
  if (_os_feature_enabled_impl())
  {
    id v9 = +[EFScheduler mainThreadScheduler];
    id v7 = [v9 afterDelay:&stru_100608BF0 performBlock:1.0];
  }
}

- (void)endBackgroundMonitoring
{
  uint64_t v3 = [(MailScene *)self backgroundMonitors];
  uint64_t v4 = [v3 allObjects];

  v5 = [(MailScene *)self backgroundMonitors];
  [v5 removeAllObjects];

  if ([v4 count])
  {
    v6 = +[MailScene log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopping background monitors...", buf, 2u);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v16;
      *(void *)&long long v9 = 138543362;
      long long v14 = v9;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
          v13 = +[MailScene log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v14;
            v20 = v12;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Stopping monitor: %{public}@", buf, 0xCu);
          }

          [v12 endMonitoring];
          v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        id v8 = [v7 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (NSMutableSet)backgroundMonitors
{
  backgroundMonitors = self->_backgroundMonitors;
  if (!backgroundMonitors)
  {
    uint64_t v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v5 = self->_backgroundMonitors;
    self->_backgroundMonitors = v4;

    backgroundMonitors = self->_backgroundMonitors;
  }

  return backgroundMonitors;
}

- (void)mailSceneDidConnectWithOptions:(id)a3
{
  uint64_t v4 = [(MailScene *)self daemonInterface];
  v5 = [v4 clientState];
  v6 = [(MailScene *)self ef_publicDescription];
  id v7 = [v5 daemonBoosterWithDescription:v6];
  [(MailScene *)self setDaemonBooster:v7];

  id v8 = +[EFDevice currentDevice];
  LODWORD(v5) = [v8 isInternal];

  if (v5)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    long long v14 = sub_10011E2C4;
    long long v15 = &unk_100608BD0;
    objc_copyWeak(&v16, &location);
    long long v9 = +[EMInternalPreferences observeChangesForPreference:14 usingBlock:&v12];
    -[MailScene setBackgroundMonitorOverrideObservation:](self, "setBackgroundMonitorOverrideObservation:", v9, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  uint64_t v10 = +[NSNotificationCenter defaultCenter];
  v11 = +[MFDiskFreeSpaceMonitor defaultMonitor];
  [v10 addObserver:self selector:"_freeDiskSpaceStatusDidChange:" name:@"MFDiskFreeSpaceMonitorDidChangeNotification" object:v11];
}

- (void)mf_resetPreferredTitle
{
  id v5 = [(MailScene *)self mf_window];
  uint64_t v3 = [v5 rootViewController];
  uint64_t v4 = [v3 mf_preferredTitle];
  [(MailScene *)self setTitle:v4];
}

- (MFWindow)mf_window
{
  v2 = [(MailScene *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 window];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (MFWindow *)v3;
}

- (BOOL)isInExpandedEnvironment
{
  if ([(MailScene *)self conformsToProtocol:&OBJC_PROTOCOL___SplitLayoutCapable])
  {
    uint64_t v3 = [(MailScene *)self splitViewController];
    unsigned int v4 = [v3 isCollapsed] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (EMDaemonInterface)daemonInterface
{
  v2 = +[UIApplication sharedApplication];
  uint64_t v3 = [v2 daemonInterface];

  return (EMDaemonInterface *)v3;
}

- (void)setDaemonBooster:(id)a3
{
}

- (UIAlertController)lowDiskAlertController
{
  return self->_lowDiskAlertController;
}

- (EMDaemonBooster)daemonBooster
{
  return self->_daemonBooster;
}

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000909C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006996F8 != -1) {
    dispatch_once(&qword_1006996F8, block);
  }
  v2 = (void *)qword_1006996F0;

  return (OS_os_log *)v2;
}

- (void)mailSceneDidDisconnect
{
}

- (void)mailSceneDidEnterBackground
{
  [(MailScene *)self beginBackgroundMonitoring];

  [(MailScene *)self setDaemonBooster:0];
}

- (void)mailSceneWillResignActive
{
  if ([(MailScene *)self shouldUpdateWidgetWhenSceneResignsActive])
  {
    id v2 = +[MFWidgetController sharedController];
    [v2 reloadTimelinesWithReason:@"appBackgrounded"];
  }
}

+ (BOOL)wantsDeferredConnectionActions
{
  return 0;
}

- (MailExtendedLaunchTracker)extendedLaunchTracker
{
  return 0;
}

- (MFMailboxProvider)mailboxProvider
{
  id v2 = +[UIApplication sharedApplication];
  uint64_t v3 = [v2 mailboxProvider];

  return (MFMailboxProvider *)v3;
}

- (MFMailAssetViewerManager)assetViewerManager
{
  assetViewerManager = self->_assetViewerManager;
  self->_assetViewerManager = 0;

  unsigned int v4 = self->_assetViewerManager;

  return v4;
}

- (MFAlertOverlayController)alertOverlayController
{
  alertOverlayController = self->_alertOverlayController;
  if (!alertOverlayController)
  {
    unsigned int v4 = (MFAlertOverlayController *)[objc_alloc((Class)MFAlertOverlayController) initWithWindowScene:self];
    id v5 = self->_alertOverlayController;
    self->_alertOverlayController = v4;

    alertOverlayController = self->_alertOverlayController;
  }

  return alertOverlayController;
}

- (BOOL)shouldUpdateWidgetWhenSceneResignsActive
{
  return 0;
}

- (void)_switchToComposeSceneWithContext:(id)a3 modifiedContentsURL:(id)a4 isReply:(BOOL)a5 composeType:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = objc_alloc((Class)NSMutableDictionary);
  uint64_t v38 = MSMailActivityHandoffTypeKey;
  uint64_t v39 = MSMailActivityHandoffTypeComposeSansStreams;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
  id v14 = [v12 initWithDictionary:v13];

  long long v15 = [v10 subject];
  if (v15
    && ([v10 messageObjectID],
        id v16 = objc_claimAutoreleasedReturnValue(),
        BOOL v17 = v16 != 0,
        v16,
        v15,
        v7 && v17))
  {
    long long v18 = +[NSNumber numberWithInteger:a6];
    [v14 setObject:v18 forKeyedSubscript:MSMailActivityHandoffComposeKeyComposeType];

    v19 = [v10 messageObjectID];
    v20 = [v19 serializedRepresentation];
    [v14 setObject:v20 forKeyedSubscript:MSMailActivityHandoffComposeKeyMessageObjectIDRepresentation];

    v21 = [v10 subject];
    [v14 setObject:v21 forKeyedSubscript:MSMailActivityHandoffComposeKeySubject];

    v22 = [v10 senderDisplayName];
    [v14 setObject:v22 forKeyedSubscript:MSMailQuickLookActivityKeySenderDisplayName];

    v23 = [v10 mailboxObjectID];

    if (v23)
    {
      v24 = [v10 mailboxObjectID];
      v25 = [v24 serializedRepresentation];
      [v14 setObject:v25 forKeyedSubscript:MSMailActivityHandoffComposeKeyMailboxObjectIDRepresentation];
    }
  }
  else
  {
    if (v7)
    {
      v26 = +[MailScene log];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_10045AEB8();
      }
    }
    [v14 setObject:&off_10062A968 forKeyedSubscript:MSMailActivityHandoffComposeKeyComposeType];
  }
  if (v11)
  {
    v27 = +[NSFileManager defaultManager];
    id v36 = 0;
    v28 = [v27 mf_copyFileAtURLToContainer:v11 securityScoped:1 preferredFileName:0 error:&v36];
    v29 = v36;

    if (v28)
    {
      v30 = [v28 absoluteString];
      [v14 setObject:v30 forKeyedSubscript:MSMailQuickLookActivityKeyContentURL];
    }
    else
    {
      v30 = +[MailScene log];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = [v29 ef_publicDescription];
        sub_10045AE6C(v31, (uint64_t)v37, v30);
      }
    }
  }
  else
  {
    v29 = +[MailScene log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_10045AE38();
    }
  }

  id v32 = objc_alloc_init((Class)UIWindowSceneActivationRequestOptions);
  [v32 setRequestingScene:self];
  [v32 setPreferredPresentationStyle:2];
  id v33 = objc_alloc((Class)NSUserActivity);
  id v34 = [v33 initWithActivityType:MSMailActivityHandoffTypeComposeWithStreams];
  [v34 setUserInfo:v14];
  v35 = +[UIApplication sharedApplication];
  [v35 requestSceneSessionActivation:0 userActivity:v34 options:v32 errorHandler:0];
}

- (void)mailSceneOpenURLContexts:(id)a3
{
  id v6 = [a3 anyObject];
  if (v6)
  {
    unsigned int v4 = [(MailScene *)self urlRouter];
    id v5 = +[MFURLRoutingRequest externalRequestWithOpenURLContext:v6];
    [v4 routeRequest:v5];
  }
}

- (MFURLRouter)urlRouter
{
  urlRouter = self->_urlRouter;
  if (!urlRouter)
  {
    unsigned int v4 = [MFURLRouter alloc];
    id v5 = [(MailScene *)self _createURLRoutes];
    id v6 = [(MFURLRouter *)v4 initWithRoutes:v5];
    BOOL v7 = self->_urlRouter;
    self->_urlRouter = v6;

    [(MFURLRouter *)self->_urlRouter setDelegate:self];
    urlRouter = self->_urlRouter;
  }

  return urlRouter;
}

- (id)_createURLRoutes
{
  uint64_t v3 = objc_alloc_init(MFOAuthRedirectURLRoute);
  unsigned int v4 = objc_alloc_init(MFWorkspaceURLRoute);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011ED5C;
  v8[3] = &unk_100608C18;
  v8[4] = self;
  id v5 = [[MFStoreURLRoute alloc] initWithPresenterProvider:v8];
  v9[0] = v3;
  v9[1] = v5;
  v9[2] = v4;
  id v6 = +[NSArray arrayWithObjects:v9 count:3];

  return v6;
}

- (unint64_t)urlRouter:(id)a3 decidePolicyForRoutingRequest:(id)a4
{
  id v4 = a4;
  id v5 = [v4 URL];
  unsigned __int8 v6 = [v5 mf_isOAuthRedirectURL];

  if ((v6 & 1) != 0
    || (+[MFDiskFreeSpaceMonitor defaultMonitor],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isFreeSpaceCritical],
        v7,
        !v8))
  {
    unint64_t v11 = 0;
  }
  else
  {
    long long v9 = +[MailScene log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v4 ef_publicDescription];
      sub_10045AEEC(v10, (uint64_t)&v13, v9);
    }

    unint64_t v11 = 2;
  }

  return v11;
}

- (void)displayError:(id)a3 forAccount:(id)a4 mode:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MailScene *)self doesNotRecognizeSelector:a2];
  __assert_rtn("-[MailScene displayError:forAccount:mode:]", "MailScene.m", 265, "0");
}

- (void)mailSceneDebugGesturePerformed
{
  id v4 = [[MFMailDebugMenuController alloc] initWithScene:self];
  uint64_t v3 = [(MailScene *)self mf_rootViewController];
  [v3 presentViewController:v4 animated:1 completion:0];
}

- (void)closeSceneWithAnimation:(int64_t)a3
{
}

- (void)closeSceneWithAnimation:(int64_t)a3 errorHandler:(id)a4
{
  id v9 = a4;
  id v6 = objc_alloc_init((Class)UIWindowSceneDestructionRequestOptions);
  [v6 setWindowDismissalAnimation:a3];
  BOOL v7 = +[UIApplication sharedApplication];
  id v8 = [(MailScene *)self session];
  [v7 requestSceneSessionDestruction:v8 options:v6 errorHandler:v9];
}

- (id)undoManager
{
  undoManager = self->_undoManager;
  if (!undoManager)
  {
    id v4 = (NSUndoManager *)objc_alloc_init((Class)NSUndoManager);
    id v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }

  return undoManager;
}

- (id)undoManagerForWindow:(id)a3
{
  uint64_t v3 = [(MailScene *)self undoManager];

  return v3;
}

- (void)_escapeShortcutInvoked:(id)a3
{
  if ([(MailScene *)self conformsToProtocol:&OBJC_PROTOCOL___SplitLayoutCapable])
  {
    id v4 = [(MailScene *)self splitViewController];
  }
  else
  {
    id v4 = 0;
  }
  id v6 = v4;
  id v5 = [v4 presentedViewController];

  if (v5) {
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)addBackgroundMonitor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(MailScene *)self allowsBackgroundMonitoring])
    {
      id v5 = +[MailScene log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Added background monitor: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      id v6 = [(MailScene *)self backgroundMonitors];
      [v6 addObject:v4];

      if ([(MailScene *)self activationState] == (id)2)
      {
        BOOL v7 = +[MailScene log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 138543362;
          id v10 = v4;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scene is in the background. Starting monitor immediately: %{public}@", (uint8_t *)&v9, 0xCu);
        }

        [v4 beginMonitoringWithHandler:self];
      }
    }
  }
  else
  {
    id v8 = +[MailScene log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "addBackgroundMonitor called with nil monitor. Ignoring.", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)beginBackgroundMonitoring
{
  if ([(MailScene *)self allowsBackgroundMonitoring])
  {
    uint64_t v3 = [(MailScene *)self backgroundMonitors];
    id v4 = [v3 count];

    if (v4)
    {
      id v5 = +[MailScene log];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting background monitors...", buf, 2u);
      }

      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = [(MailScene *)self backgroundMonitors];
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v7)
      {
        uint64_t v9 = *(void *)v15;
        *(void *)&long long v8 = 138543362;
        long long v13 = v8;
        do
        {
          id v10 = 0;
          do
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v6);
            }
            unint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
            id v12 = +[MailScene log];
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v13;
              v19 = v11;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Starting monitor: %{public}@", buf, 0xCu);
            }

            [v11 beginMonitoringWithHandler:self];
            id v10 = (char *)v10 + 1;
          }
          while (v7 != v10);
          id v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)monitor:(id)a3 requestsAction:(int64_t)a4
{
  id v6 = a3;
  [(MailScene *)self endBackgroundMonitoring];
  if ([(MailScene *)self allowsBackgroundMonitoring])
  {
    if ([(MailScene *)self activationState] == (id)2)
    {
      if (a4 == 1)
      {
        uint64_t v9 = +[MailScene log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v12 = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Monitor requested scene session close: %{public}@. Requesting from system now...", buf, 0xCu);
        }

        [(MailScene *)self closeSceneWithAnimation:1];
      }
      else if (!a4)
      {
        id v7 = +[MailScene log];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v12 = v6;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Monitor requested scene session refresh: %{public}@. Requesting from system now...", buf, 0xCu);
        }

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10011F7A0;
        block[3] = &unk_1006047A0;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
    else
    {
      long long v8 = +[MailScene log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10045AF38();
      }
    }
  }
}

- (BOOL)allowsBackgroundMonitoring
{
  id v2 = +[UIApplication sharedApplication];
  if ([v2 launchedToTest]) {
    int v3 = 1;
  }
  else {
    int v3 = EFIsRunningUnitTests();
  }

  unsigned int v4 = +[EMInternalPreferences preferenceEnabled:14];
  char v5 = v3 | v4;
  if ((v3 | v4) == 1)
  {
    char v6 = v4;
    id v7 = +[MailScene log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10045AF6C(v3, v6, v7);
    }
  }
  return v5 ^ 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("_escapeShortcutInvoked:" == a3)
  {
    BOOL v7 = 1;
    goto LABEL_9;
  }
  if ("undo:" == a3)
  {
    long long v8 = [(MailScene *)self undoManager];
    unsigned __int8 v9 = [v8 canUndo];
LABEL_8:
    BOOL v7 = v9;

    goto LABEL_9;
  }
  if ("redo:" == a3)
  {
    long long v8 = [(MailScene *)self undoManager];
    unsigned __int8 v9 = [v8 canRedo];
    goto LABEL_8;
  }
  v11.receiver = self;
  v11.super_class = (Class)MailScene;
  BOOL v7 = [(MailScene *)&v11 canPerformAction:a3 withSender:v6];
LABEL_9:

  return v7;
}

- (void)undo:(id)a3
{
  id v3 = [(MailScene *)self undoManager];
  [v3 undo];
}

- (void)redo:(id)a3
{
  id v3 = [(MailScene *)self undoManager];
  [v3 redo];
}

- (void)_freeDiskSpaceStatusDidChange:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10011FB48;
  v4[3] = &unk_1006047A0;
  v4[4] = self;
  id v3 = +[EFScheduler mainThreadScheduler];
  [v3 performBlock:v4];
}

- (void)assetViewerManager:(id)a3 editCompletedForHandler:(id)a4 URL:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  long long v8 = +[MailScene log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10045B088((uint64_t)v6, (uint64_t)v7, v8);
  }
}

- (void)assetViewerManager:(id)a3 sceneClosedForHandler:(id)a4
{
  id v4 = a4;
  char v5 = +[MailScene log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asset Viewer sceneClosedForHandler %@", (uint8_t *)&v6, 0xCu);
  }
}

- (UIViewController)mf_rootViewController
{
  return self->mf_rootViewController;
}

- (void)setMf_rootViewController:(id)a3
{
}

- (void)setBackgroundMonitors:(id)a3
{
}

- (EFCancelable)backgroundMonitorOverrideObservation
{
  return self->_backgroundMonitorOverrideObservation;
}

- (void)setBackgroundMonitorOverrideObservation:(id)a3
{
}

- (void)setLowDiskAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowDiskAlertController, 0);
  objc_storeStrong((id *)&self->_backgroundMonitorOverrideObservation, 0);
  objc_storeStrong((id *)&self->_backgroundMonitors, 0);
  objc_storeStrong((id *)&self->_daemonBooster, 0);
  objc_storeStrong((id *)&self->_assetViewerManager, 0);
  objc_storeStrong((id *)&self->_urlRouter, 0);
  objc_storeStrong((id *)&self->_alertOverlayController, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);

  objc_storeStrong((id *)&self->mf_rootViewController, 0);
}

@end