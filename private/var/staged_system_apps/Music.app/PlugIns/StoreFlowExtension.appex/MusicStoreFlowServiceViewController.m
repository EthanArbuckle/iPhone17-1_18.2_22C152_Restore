@interface MusicStoreFlowServiceViewController
+ (BOOL)supportsSecureCoding;
+ (id)_cloudServiceSetupURLForAction:(id)a3 queryItems:(id)a4 bagDictionary:(id)a5;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)_rootViewControllerForViewController:(id)a3;
- (BOOL)storeFlowScriptingClientController:(id)a3 requestsPresentingViewController:(id)a4 animated:(BOOL)a5;
- (MusicStoreFlowServiceViewController)initWithCoder:(id)a3;
- (MusicStoreFlowServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSString)description;
- (void)_didFinishLoadingWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_dismissCloudServiceSetupViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_loadStorePageViewControllerWithCloudServiceSetupURL:(id)a3;
- (void)_reloadWithCloudServiceSetupURL:(id)a3 forReloadContext:(id)a4;
- (void)_requestCloudServiceSetupURLFromActiveReloadContextWithCompletionHandler:(id)a3;
- (void)applyConfiguration:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleSafariScriptURL:(id)a3;
- (void)reloadWithContext:(id)a3;
- (void)storeFlowScriptingClientController:(id)a3 overrideCreditCardPresentationWithCompletion:(id)a4;
- (void)storeFlowScriptingClientController:(id)a3 requestsDismissingSafariViewControllerAnimated:(BOOL)a4 completion:(id)a5;
- (void)storeFlowScriptingClientController:(id)a3 requestsDismissingViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)storeFlowScriptingClientController:(id)a3 requestsPresentingSafariViewControllerWithURL:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MusicStoreFlowServiceViewController

- (MusicStoreFlowServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MusicStoreFlowServiceViewController;
  v4 = [(MusicStoreFlowServiceViewController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_instanceIndex = atomic_fetch_add(&qword_100011BC8, 1uLL) + 1;
    v6 = +[MusicStoreFlowScriptingClientController sharedScriptingClientController];
    [v6 registerStoreFlowServiceViewController:v5];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[MusicStoreFlowScriptingClientController sharedScriptingClientController];
  [v3 unregisterStoreFlowServiceViewController:self];

  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowServiceViewController;
  [(MusicStoreFlowServiceViewController *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MusicStoreFlowServiceViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MusicStoreFlowServiceViewController;
  v5 = [(MusicStoreFlowServiceViewController *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_instanceIndex = (int64_t)[v4 decodeIntegerForKey:@"MusicStoreFlowServiceInstanceIndex"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MusicStoreFlowServiceStorePageViewController"];
    storePageViewController = v5->_storePageViewController;
    v5->_storePageViewController = (SUStorePageViewController *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MusicStoreFlowServiceActiveCloudServiceContext"];
    activeCloudServiceSetupReloadContext = v5->_activeCloudServiceSetupReloadContext;
    v5->_activeCloudServiceSetupReloadContext = (SKCloudServiceSetupReloadContext *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MusicStoreFlowServiceViewController;
  id v4 = a3;
  [(MusicStoreFlowServiceViewController *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_instanceIndex forKey:@"MusicStoreFlowServiceInstanceIndex" v5.receiver, v5.super_class];
  [v4 encodeObject:self->_storePageViewController forKey:@"MusicStoreFlowServiceStorePageViewController"];
  [v4 encodeObject:self->_activeCloudServiceSetupReloadContext forKey:@"MusicStoreFlowServiceActiveCloudServiceContext"];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  objc_super v5 = +[NSMutableString stringWithFormat:@"<%@: %p [%ld]", v4, self, self->_instanceIndex];

  if (self->_activeCloudServiceSetupReloadContext) {
    [v5 appendFormat:@"; activeCloudServiceSetupReloadContext = %@",
  }
      self->_activeCloudServiceSetupReloadContext);
  [v5 appendString:@">"];

  return (NSString *)v5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowServiceViewController;
  [(MusicStoreFlowServiceViewController *)&v4 viewDidLoad];
  v3 = +[MusicStoreFlowScriptingClientController sharedScriptingClientController];
  [v3 storeFlowServiceViewControllerDidLoad:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MusicStoreFlowServiceViewController;
  [(MusicStoreFlowServiceViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = +[MusicStoreFlowScriptingClientController sharedScriptingClientController];
  [v4 storeFlowServiceViewControllerWillAppear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MusicStoreFlowServiceViewController;
  [(MusicStoreFlowServiceViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = +[MusicStoreFlowScriptingClientController sharedScriptingClientController];
  [v4 storeFlowServiceViewControllerDidDisappear:self];
}

+ (id)_exportedInterface
{
  return +[SKCloudServiceSetupExtension serviceInterface];
}

+ (id)_remoteViewControllerInterface
{
  return +[SKCloudServiceSetupExtension clientInterface];
}

- (void)applyConfiguration:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[MusicStoreFlowScriptingClientController sharedScriptingClientController];
  [v5 applyCloudServiceSetupConfiguration:v4];

  LODWORD(v5) = [v4 targetsFinanceApplication];
  if (v5)
  {
    [(MusicStoreFlowServiceViewController *)self setNavigationBarHidden:1 animated:0];
  }
}

- (void)reloadWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copy];
  objc_storeStrong((id *)&self->_activeCloudServiceSetupReloadContext, v5);
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006098;
  v8[3] = &unk_10000C4D0;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(MusicStoreFlowServiceViewController *)self _requestCloudServiceSetupURLFromActiveReloadContextWithCompletionHandler:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)handleSafariScriptURL:(id)a3
{
  id v3 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:SUScriptInterfaceSafariViewControllerDataUpdate object:v3];
}

- (void)storeFlowScriptingClientController:(id)a3 overrideCreditCardPresentationWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(MusicStoreFlowServiceViewController *)self _remoteViewControllerProxy];
  [v6 overrideCreditCardPresentationWithCompletion:v5];
}

- (void)storeFlowScriptingClientController:(id)a3 requestsDismissingViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v12 = a4;
  id v9 = a6;
  id v10 = [(id)objc_opt_class() _rootViewControllerForViewController:v12];
  id v11 = [(id)objc_opt_class() _rootViewControllerForViewController:self];

  if (v10 == v11) {
    [(MusicStoreFlowServiceViewController *)self _dismissCloudServiceSetupViewControllerAnimated:v7 completion:v9];
  }
  else {
    [v12 dismissViewControllerAnimated:v7 completion:v9];
  }
}

- (BOOL)storeFlowScriptingClientController:(id)a3 requestsPresentingViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  BOOL v7 = self;
  uint64_t v8 = [(MusicStoreFlowServiceViewController *)v7 presentedViewController];
  if (v8)
  {
    id v9 = (void *)v8;
    do
    {
      id v10 = v9;

      id v9 = [(MusicStoreFlowServiceViewController *)v10 presentedViewController];

      BOOL v7 = v10;
    }
    while (v9);
  }
  else
  {
    id v10 = v7;
  }
  [(MusicStoreFlowServiceViewController *)v10 presentViewController:v6 animated:1 completion:0];

  return 1;
}

- (void)storeFlowScriptingClientController:(id)a3 requestsDismissingSafariViewControllerAnimated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = [(MusicStoreFlowServiceViewController *)self _remoteViewControllerProxy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006438;
  v10[3] = &unk_10000C4F8;
  id v11 = v7;
  id v9 = v7;
  [v8 dismissSafariViewControllerAnimated:v5 completion:v10];
}

- (void)storeFlowScriptingClientController:(id)a3 requestsPresentingSafariViewControllerWithURL:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = [(MusicStoreFlowServiceViewController *)self _remoteViewControllerProxy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006520;
  v13[3] = &unk_10000C4F8;
  id v14 = v9;
  id v12 = v9;
  [v11 presentSafariViewControllerWithURL:v10 animated:v6 completion:v13];
}

- (void)storePage:(id)a3 finishedWithSuccess:(BOOL)a4
{
}

+ (id)_cloudServiceSetupURLForAction:(id)a3 queryItems:(id)a4 bagDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [a5 objectForKey:@"financeApp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    id v11 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.Music"];
    id v12 = [v11 stringForKey:@"FinanceApplicationScriptBaseURL"];
    if ([v12 length])
    {
      v43 = v12;
    }
    else
    {
      v15 = [v10 objectForKey:@"baseUrl"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;

        id v12 = v16;
      }
      v43 = v12;
    }
    id v17 = objc_alloc_init((Class)NSMutableDictionary);
    v18 = [v10 objectForKey:@"urlPath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_100006A48;
      v49[3] = &unk_10000C520;
      id v50 = v17;
      [v18 enumerateKeysAndObjectsUsingBlock:v49];
    }
    if (v43)
    {
      v19 = [v7 lowercaseString];
      id v20 = [v17 objectForKey:v19];

      if (!v20) {
        id v20 = v7;
      }
      v21 = +[NSString stringWithFormat:@"%@%@", @"https://finance-app.apple.com/", v20];
      id v14 = +[NSURL URLWithString:v21];
    }
    else
    {
      id v14 = 0;
    }

    if (v14)
    {
      if (![v8 count])
      {
        v13 = v43;
        if (!v43) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
      id v41 = [objc_alloc((Class)NSURLComponents) initWithURL:v14 resolvingAgainstBaseURL:0];
      v22 = [v41 queryItems];
      id v23 = [v22 mutableCopy];
      v24 = v23;
      v42 = v14;
      if (v23) {
        id v25 = v23;
      }
      else {
        id v25 = objc_alloc_init((Class)NSMutableArray);
      }
      v26 = v25;

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v27 = v8;
      id v28 = [v27 countByEnumeratingWithState:&v45 objects:v51 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v46;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v46 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_100006BFC;
            v44[3] = &unk_10000C548;
            v44[4] = v32;
            id v33 = [v26 indexOfObjectPassingTest:v44];
            if (v33 == (id)0x7FFFFFFFFFFFFFFFLL) {
              [v26 addObject:v32];
            }
            else {
              [v26 replaceObjectAtIndex:v33 withObject:v32];
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v45 objects:v51 count:16];
        }
        while (v29);
      }

      [v41 setQueryItems:v26];
      v34 = [v41 URL];
      v35 = v34;
      if (v34)
      {
        id v14 = v34;

        v13 = v43;
      }
      else
      {
        v13 = v43;
        id v14 = v42;
      }

      if (v13)
      {
LABEL_37:
        v36 = [v14 absoluteString];
        id v37 = [v36 mutableCopy];

        [v37 replaceCharactersInRange:0, [@"https://finance-app.apple.com/" length], v13 withString];
        uint64_t v38 = +[NSURL URLWithString:v37];

        id v14 = (id)v38;
      }
    }
    else
    {
      v13 = v43;
    }
  }
  else
  {
    v13 = 0;
    id v14 = 0;
  }
LABEL_38:
  id v39 = v14;

  return v39;
}

+ (id)_rootViewControllerForViewController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 parentViewController];
  id v5 = v3;
  if (v4)
  {
    BOOL v6 = (void *)v4;
    id v7 = v3;
    do
    {
      id v5 = v6;

      BOOL v6 = [v5 parentViewController];

      id v7 = v5;
    }
    while (v6);
  }

  return v5;
}

- (void)_didFinishLoadingWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (!v4) {
    [(MusicStoreFlowServiceViewController *)self _dismissCloudServiceSetupViewControllerAnimated:1 completion:0];
  }
  BOOL v6 = [(MusicStoreFlowServiceViewController *)self _remoteViewControllerProxy];
  [v6 didFinishLoadingWithSuccess:v4 error:v7];
}

- (void)_dismissCloudServiceSetupViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(MusicStoreFlowServiceViewController *)self _remoteViewControllerProxy];
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006E34;
    v8[3] = &unk_10000C4F8;
    id v9 = v6;
    [v7 dismissCloudServiceSetupViewControllerAnimated:v4 completion:v8];
  }
  else
  {
    [(MusicStoreFlowServiceViewController *)self dismissViewControllerAnimated:v4 completion:v6];
  }
}

- (void)_loadStorePageViewControllerWithCloudServiceSetupURL:(id)a3
{
  id v4 = a3;
  id v5 = (SUStorePageViewController *)[objc_alloc((Class)SUAccountViewController) initWithExternalAccountURL:v4];

  storePageViewController = self->_storePageViewController;
  self->_storePageViewController = v5;

  id v7 = [(SUStorePageViewController *)self->_storePageViewController copyDefaultScriptProperties];
  id v8 = +[UIColor whiteColor];
  [v7 setBackgroundColor:v8];

  id v9 = +[UIColor whiteColor];
  id v10 = +[SUGradient gradientWithColor:v9];
  [v7 setPlaceholderBackgroundGradient:v10];

  [v7 setShouldLoadProgressively:0];
  [v7 setShouldShowFormAccessory:1];
  [(SUStorePageViewController *)self->_storePageViewController setScriptProperties:v7];
  uint64_t v11 = [(SKCloudServiceSetupReloadContext *)self->_activeCloudServiceSetupReloadContext sourceApplicationBundleIdentifier];
  id v12 = [(SKCloudServiceSetupReloadContext *)self->_activeCloudServiceSetupReloadContext referrerURL];
  uint64_t v13 = [v12 absoluteString];

  if (v11 | v13)
  {
    id v14 = [(SUStorePageViewController *)self->_storePageViewController URLRequestProperties];
    id v15 = [v14 mutableCopy];

    if (v11) {
      [v15 setValue:v11 forHTTPHeaderField:@"ref-user-agent"];
    }
    if (v13) {
      [v15 setValue:v13 forHTTPHeaderField:@"referer"];
    }
    [(SUStorePageViewController *)self->_storePageViewController setURLRequestProperties:v15];
  }
  id v16 = [(SKCloudServiceSetupReloadContext *)self->_activeCloudServiceSetupReloadContext serializedUserInfo];
  if (v16) {
    [(SUStorePageViewController *)self->_storePageViewController setScriptUserInfo:v16];
  }
  [(SUStorePageViewController *)self->_storePageViewController setCanMoveToOverlay:0];
  id v17 = self->_storePageViewController;
  v18 = +[MusicStoreFlowScriptingClientController sharedScriptingClientController];
  v19 = [v18 clientInterface];
  [(SUStorePageViewController *)v17 setClientInterface:v19];

  v21 = self->_storePageViewController;
  id v20 = +[NSArray arrayWithObjects:&v21 count:1];
  [(MusicStoreFlowServiceViewController *)self setViewControllers:v20];
}

- (void)_reloadWithCloudServiceSetupURL:(id)a3 forReloadContext:(id)a4
{
  id v10 = a3;
  id v6 = (SKCloudServiceSetupReloadContext *)a4;
  if (self->_activeCloudServiceSetupReloadContext == v6)
  {
    if (self->_storePageViewController)
    {
      id v7 = objc_alloc_init((Class)SUWebScriptReloadContext);
      [v7 setURL:v10];
      id v8 = [(SKCloudServiceSetupReloadContext *)self->_activeCloudServiceSetupReloadContext sourceApplicationBundleIdentifier];
      [v7 setReferringUserAgent:v8];

      id v9 = [(SKCloudServiceSetupReloadContext *)self->_activeCloudServiceSetupReloadContext referrerURL];
      [v7 setReferrerURL:v9];

      [(SUStorePageViewController *)self->_storePageViewController requestWebScriptReloadWithContext:v7];
    }
    else
    {
      [(MusicStoreFlowServiceViewController *)self _loadStorePageViewControllerWithCloudServiceSetupURL:v10];
    }
    if (([(SUStorePageViewController *)self->_storePageViewController isSkLoaded] & 1) == 0
      && ([(SUStorePageViewController *)self->_storePageViewController isSkLoading] & 1) == 0)
    {
      [(SUStorePageViewController *)self->_storePageViewController _reloadForAppearance:0];
    }
  }
}

- (void)_requestCloudServiceSetupURLFromActiveReloadContextWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = self->_activeCloudServiceSetupReloadContext;
  id v6 = [(SKCloudServiceSetupReloadContext *)v5 cloudServiceSetupURL];

  if (v6)
  {
    id v7 = [(SKCloudServiceSetupReloadContext *)v5 cloudServiceSetupURL];
    v4[2](v4, v7, 0);
  }
  else
  {
    id v8 = [(SKCloudServiceSetupReloadContext *)v5 action];
    if (v8)
    {
      objc_initWeak(&location, self);
      id v9 = +[ISURLBagLoadingController sharedBagLoadingController];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100007458;
      v12[3] = &unk_10000C598;
      objc_copyWeak(&v16, &location);
      id v13 = v8;
      id v14 = v5;
      id v15 = v4;
      [v9 requestAccessToBagUsingBlock:v12];

      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      CFStringRef v19 = @"Cloud service setup reload context needs to have at least a URL or an action.";
      id v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      uint64_t v11 = +[NSError errorWithDomain:NSCocoaErrorDomain code:0 userInfo:v10];
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v11);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCloudServiceSetupReloadContext, 0);

  objc_storeStrong((id *)&self->_storePageViewController, 0);
}

@end