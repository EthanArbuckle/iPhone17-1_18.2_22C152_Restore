@interface WFShortcutServiceViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)initialize;
- (NSBundle)bundle;
- (NSString)currentUserInterfaceType;
- (NSURL)containedAppBundleURL;
- (UIViewController)childViewController;
- (id)_secureHostApplicationBundleIdentifier;
- (id)notificationNameForApplicationStateEvent:(int64_t)a3;
- (id)remoteViewControllerProxy;
- (void)_startAccessingAppBundle;
- (void)_stopAccessingAppBundle;
- (void)addToSiriViewController:(id)a3 didCreateShortcut:(id)a4;
- (void)addToSiriViewController:(id)a3 didDeleteShortcut:(id)a4;
- (void)addToSiriViewController:(id)a3 didSaveShortcut:(id)a4;
- (void)addToSiriViewControllerDidCancel:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)buildForAddingShortcut:(id)a3;
- (void)buildForEditingVoiceShortcut:(id)a3;
- (void)loadView;
- (void)setChildViewController:(id)a3;
- (void)setContainedAppBundleURL:(id)a3;
- (void)setupWithShortcutViewController:(id)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WFShortcutServiceViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containedAppBundleURL, 0);
  objc_storeStrong((id *)&self->_childViewController, 0);
}

- (void)setContainedAppBundleURL:(id)a3
{
}

- (NSURL)containedAppBundleURL
{
  return self->_containedAppBundleURL;
}

- (void)setChildViewController:(id)a3
{
}

- (UIViewController)childViewController
{
  return self->_childViewController;
}

- (NSString)currentUserInterfaceType
{
  return (NSString *)WFUserInterfaceTypeUIKit;
}

- (NSBundle)bundle
{
  uint64_t v2 = objc_opt_class();
  return +[NSBundle bundleForClass:v2];
}

- (id)notificationNameForApplicationStateEvent:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    self = (WFShortcutServiceViewController *)*(id *)*(&off_1000082A8 + a3);
  }
  return self;
}

- (void)addToSiriViewController:(id)a3 didDeleteShortcut:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFShortcutServiceViewController *)self childViewController];

  if (v8 == v6)
  {
    id v10 = objc_alloc((Class)NSUUID);
    v11 = [v7 reference];
    v12 = [v11 identifier];
    id v13 = [v10 initWithUUIDString:v12];

    v14 = [(WFShortcutServiceViewController *)self remoteViewControllerProxy];
    [v14 remoteViewControllerDidDeleteVoiceShortcutWithIdentifier:v13];
  }
  else
  {
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315394;
      v16 = "-[WFShortcutServiceViewController addToSiriViewController:didDeleteShortcut:]";
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Unexpected viewController=%{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)addToSiriViewController:(id)a3 didSaveShortcut:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFShortcutServiceViewController *)self childViewController];

  if (v8 == v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004B20;
    v10[3] = &unk_100008260;
    v10[4] = self;
    sub_100004B84(v7, v10);
  }
  else
  {
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFShortcutServiceViewController addToSiriViewController:didSaveShortcut:]";
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Unexpected viewController=%{public}@", buf, 0x16u);
    }
  }
}

- (void)addToSiriViewController:(id)a3 didCreateShortcut:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFShortcutServiceViewController *)self childViewController];

  if (v8 == v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100004EA8;
    v10[3] = &unk_100008260;
    v10[4] = self;
    sub_100004B84(v7, v10);
  }
  else
  {
    v9 = INSiriLogContextIntents;
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFShortcutServiceViewController addToSiriViewController:didCreateShortcut:]";
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Unexpected viewController=%{public}@", buf, 0x16u);
    }
  }
}

- (void)addToSiriViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(WFShortcutServiceViewController *)self childViewController];

  if (v5 == v4)
  {
    id v7 = [(WFShortcutServiceViewController *)self remoteViewControllerProxy];
    [v7 remoteViewControllerDidCancel];
  }
  else
  {
    id v6 = INSiriLogContextIntents;
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      v9 = "-[WFShortcutServiceViewController addToSiriViewControllerDidCancel:]";
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Unexpected viewController=%{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)setupWithShortcutViewController:(id)a3
{
  id v9 = a3;
  [v9 setDelegate:self];
  [v9 willMoveToParentViewController:self];
  [(WFShortcutServiceViewController *)self addChildViewController:v9];
  id v4 = [v9 view];
  id v5 = [(WFShortcutServiceViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  id v6 = [v9 view];
  [v6 setAutoresizingMask:18];

  id v7 = [(WFShortcutServiceViewController *)self view];
  int v8 = [v9 view];
  [v7 addSubview:v8];

  [v9 didMoveToParentViewController:self];
  [(WFShortcutServiceViewController *)self setChildViewController:v9];
}

- (void)buildForEditingVoiceShortcut:(id)a3
{
  id v4 = a3;
  id v5 = INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFShortcutServiceViewController buildForEditingVoiceShortcut:]";
    __int16 v26 = 2114;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Build for editing voiceShortcut=%{public}@", buf, 0x16u);
  }
  id v6 = +[WFDatabase defaultDatabase];
  id v7 = [v4 identifier];
  int v8 = [v7 UUIDString];
  id v9 = [v6 referenceForWorkflowID:v8];

  if (v9)
  {
    id v23 = 0;
    __int16 v10 = +[WFWorkflow workflowWithReference:v9 database:v6 error:&v23];
    id v11 = v23;
    if (v10)
    {
      v12 = INSiriLogContextIntents;
      if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFShortcutServiceViewController buildForEditingVoiceShortcut:]";
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Got shortcut=%@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, self);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005474;
      block[3] = &unk_100008238;
      objc_copyWeak(&v22, (id *)buf);
      id v21 = v10;
      id v13 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
      goto LABEL_12;
    }
  }
  else
  {
    id v11 = 0;
  }
  id v14 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    id v18 = v14;
    v19 = [v4 identifier];
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFShortcutServiceViewController buildForEditingVoiceShortcut:]";
    __int16 v26 = 2114;
    id v27 = v19;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Couldn't find shortcut with identfier=%{public}@", buf, 0x16u);
  }
  int v15 = [v4 identifier];
  v16 = +[NSString stringWithFormat:@"Couldn't find shortcut to edit with identifier=%@", v15];
  INIntentError();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  __int16 v17 = [(WFShortcutServiceViewController *)self remoteViewControllerProxy];
  [v17 remoteViewControllerDidUpdateVoiceShortcut:0 error:v13];

LABEL_12:
}

- (void)buildForAddingShortcut:(id)a3
{
  id v4 = a3;
  id v5 = INSiriLogContextIntents;
  if (v4)
  {
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[WFShortcutServiceViewController buildForAddingShortcut:]";
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s build for adding shortcut=%{public}@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000570C;
    v8[3] = &unk_100008238;
    objc_copyWeak(&v10, (id *)buf);
    id v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[WFShortcutServiceViewController buildForAddingShortcut:]";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s No shortcut provided to shortcut service", buf, 0xCu);
    }
    id v6 = INIntentError();
    id v7 = [(WFShortcutServiceViewController *)self remoteViewControllerProxy];
    [v7 remoteViewControllerDidCreateVoiceShortcut:0 error:v6];
  }
}

- (id)remoteViewControllerProxy
{
  uint64_t v3 = [(WFShortcutServiceViewController *)self _remoteViewControllerProxy];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(WFShortcutServiceViewController *)self extensionContext];
    id v7 = [v6 _auxiliaryConnection];
    id v5 = [v7 remoteObjectProxy];
  }
  return v5;
}

- (void)_stopAccessingAppBundle
{
  containedAppBundleURL = self->_containedAppBundleURL;
  if (containedAppBundleURL)
  {
    [(NSURL *)containedAppBundleURL stopAccessingSecurityScopedResource];
    id v4 = self->_containedAppBundleURL;
    self->_containedAppBundleURL = 0;
  }
}

- (void)_startAccessingAppBundle
{
  [(WFShortcutServiceViewController *)self _stopAccessingAppBundle];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [(WFShortcutServiceViewController *)self extensionContext];
  id v4 = [v3 inputItems];

  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  id v6 = &OBJC_INSTANCE_METHODS_NSObject;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = INUIVoiceShortcutExtensionItemBundleURLKey;
    uint64_t v10 = INUIVoiceShortcutExtensionItemSandboxExtensionDataKey;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        __int16 v13 = [v12 userInfo];
        id v14 = [v13 objectForKey:v9];

        int v15 = [v12 userInfo];
        v16 = [v15 objectForKey:v10];

        if (v14) {
          BOOL v17 = v16 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (!v17)
        {
          _CFURLAttachSecurityScopeToFileURL();
          id v6 = &OBJC_INSTANCE_METHODS_NSObject;
          containedAppBundleURL = self->_containedAppBundleURL;
          self->_containedAppBundleURL = v14;

          goto LABEL_13;
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
      id v6 = &OBJC_INSTANCE_METHODS_NSObject;
    }
    while (v7);
  }
LABEL_13:

  v19 = *(Class *)((char *)&self->super.super.super.isa + (int)v6[336].count);
  if (v19) {
    [v19 startAccessingSecurityScopedResource];
  }
}

- (id)_secureHostApplicationBundleIdentifier
{
  uint64_t v3 = [(WFShortcutServiceViewController *)self extensionContext];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  long long v12 = 0u;
  long long v13 = 0u;
  if (v5)
  {
    id v6 = [v5 _auxiliaryConnection];
    id v7 = v6;
    if (v6)
    {
      [v6 auditToken];
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
  }
  else
  {
    [(WFShortcutServiceViewController *)self _hostAuditToken];
  }
  v11[0] = v12;
  v11[1] = v13;
  uint64_t v8 = +[VCAccessSpecifier accessSpecifierForAuditToken:v11];
  uint64_t v9 = [v8 associatedAppBundleIdentifier];

  return v9;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFShortcutServiceViewController;
  [(WFShortcutServiceViewController *)&v4 viewWillDisappear:a3];
  [(WFShortcutServiceViewController *)self _stopAccessingAppBundle];
}

- (void)loadView
{
  id v4 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  uint64_t v3 = +[UIColor whiteColor];
  [v4 setBackgroundColor:v3];

  [(WFShortcutServiceViewController *)self setView:v4];
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFShortcutServiceViewController;
  [(WFShortcutServiceViewController *)&v9 beginRequestWithExtensionContext:v4];
  [v4 setExtensionApplicationContextProviderDelegate:self];
  id v5 = +[WFApplicationContext sharedContext];
  [v5 setProvider:v4];

  +[WFInitialization initializeProcessWithDatabase:1];
  id v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  [v8 setDelegate:self];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 0;
}

+ (id)_remoteViewControllerInterface
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerHostingInterface];
}

+ (id)_exportedInterface
{
  return +[INUIVoiceShortcutXPCInterface remoteViewControllerServingInterface];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    _INLogInitIfNeeded();
  }
}

@end