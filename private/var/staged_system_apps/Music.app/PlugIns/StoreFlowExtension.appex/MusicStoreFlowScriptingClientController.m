@interface MusicStoreFlowScriptingClientController
+ (id)sharedScriptingClientController;
- (BOOL)clientInterface:(id)a3 isAllowedToOpenExternalURL:(id)a4;
- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5;
- (MusicStoreFlowScriptingClientController)init;
- (id)_correspondingStoreFlowServiceViewControllerForViewController:(id)a3;
- (id)newScriptInterface;
- (void)_activateStoreFlowServiceViewController:(id)a3;
- (void)_deactivateStoreFlowServiceViewController:(id)a3 andUnregister:(BOOL)a4;
- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3;
- (void)_handleApplicationWillEnterForegroundNotification:(id)a3;
- (void)applyCloudServiceSetupConfiguration:(id)a3;
- (void)clientInterface:(id)a3 dismissSafariViewControllerAnimated:(BOOL)a4 fromViewController:(id)a5 completion:(id)a6;
- (void)clientInterface:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)clientInterface:(id)a3 overrideCreditCardPresentationFromViewController:(id)a4 completion:(id)a5;
- (void)clientInterface:(id)a3 presentSafariViewControllerWithURL:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)dealloc;
- (void)registerStoreFlowServiceViewController:(id)a3;
- (void)storeFlowServiceViewControllerDidDisappear:(id)a3;
- (void)storeFlowServiceViewControllerDidLoad:(id)a3;
- (void)storeFlowServiceViewControllerWillAppear:(id)a3;
- (void)unregisterStoreFlowServiceViewController:(id)a3;
@end

@implementation MusicStoreFlowScriptingClientController

+ (id)sharedScriptingClientController
{
  if (qword_100011BB8 != -1) {
    dispatch_once(&qword_100011BB8, &stru_10000C3D8);
  }
  v2 = (void *)qword_100011BB0;

  return v2;
}

- (MusicStoreFlowScriptingClientController)init
{
  v9.receiver = self;
  v9.super_class = (Class)MusicStoreFlowScriptingClientController;
  v2 = [(MusicStoreFlowScriptingClientController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    registeredStoreFlowServiceViewControllers = v2->_registeredStoreFlowServiceViewControllers;
    v2->_registeredStoreFlowServiceViewControllers = (NSHashTable *)v3;

    uint64_t v5 = +[NSPointerArray weakObjectsPointerArray];
    activeStoreFlowServiceViewControllersStack = v2->_activeStoreFlowServiceViewControllersStack;
    v2->_activeStoreFlowServiceViewControllersStack = (NSPointerArray *)v5;

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_handleApplicationDidEnterBackgroundNotification:" name:UIApplicationDidEnterBackgroundNotification object:0];
    [v7 addObserver:v2 selector:"_handleApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
  [v3 removeObserver:self name:UIApplicationWillEnterForegroundNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)MusicStoreFlowScriptingClientController;
  [(MusicStoreFlowScriptingClientController *)&v4 dealloc];
}

- (void)applyCloudServiceSetupConfiguration:(id)a3
{
  id v4 = a3;
  id v7 = [(MusicStoreFlowScriptingClientController *)self clientInterface];
  uint64_t v5 = [v4 applicationIdentifier];
  [v7 setApplicationIdentifier:v5];

  v6 = [v4 applicationVersion];

  [v7 setApplicationVersion:v6];
}

- (void)registerStoreFlowServiceViewController:(id)a3
{
  id v4 = a3;
  if (!-[NSHashTable containsObject:](self->_registeredStoreFlowServiceViewControllers, "containsObject:")) {
    [(NSHashTable *)self->_registeredStoreFlowServiceViewControllers addObject:v4];
  }
}

- (void)storeFlowServiceViewControllerDidLoad:(id)a3
{
  id v5 = a3;
  id v4 = [(MusicStoreFlowScriptingClientController *)self rootViewController];

  if (!v4) {
    [(MusicStoreFlowScriptingClientController *)self _activateStoreFlowServiceViewController:v5];
  }
}

- (void)storeFlowServiceViewControllerWillAppear:(id)a3
{
  id v6 = a3;
  id v4 = [(MusicStoreFlowScriptingClientController *)self rootViewController];

  id v5 = v6;
  if (v4 != v6)
  {
    [(MusicStoreFlowScriptingClientController *)self _activateStoreFlowServiceViewController:v6];
    id v5 = v6;
  }
}

- (void)storeFlowServiceViewControllerDidDisappear:(id)a3
{
}

- (void)unregisterStoreFlowServiceViewController:(id)a3
{
}

- (BOOL)presentAccountViewController:(id)a3 showNavigationBar:(BOOL)a4 animated:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)SUNavigationController) initWithRootViewController:v8];
  v10 = [v8 clientInterface];

  [v9 setClientInterface:v10];
  [v9 setNavigationBarHidden:!v6];
  v11 = [(MusicStoreFlowScriptingClientController *)self rootViewController];
  LOBYTE(v5) = [v11 storeFlowScriptingClientController:self requestsPresentingViewController:v9 animated:v5];

  return v5;
}

- (id)newScriptInterface
{
  return objc_alloc_init(MusicStoreFlowScriptInterface);
}

- (void)clientInterface:(id)a3 dismissViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v13 = a4;
  id v9 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v13 adjustedTargetForSelector:"self"];
  }
  else
  {
    id v10 = v13;
  }
  v11 = v10;
  v12 = [(MusicStoreFlowScriptingClientController *)self _correspondingStoreFlowServiceViewControllerForViewController:v13];
  [v12 storeFlowScriptingClientController:self requestsDismissingViewController:v11 animated:v7 completion:v9];
}

- (void)clientInterface:(id)a3 presentSafariViewControllerWithURL:(id)a4 fromViewController:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v11 = a7;
  id v12 = a4;
  id v13 = [(MusicStoreFlowScriptingClientController *)self _correspondingStoreFlowServiceViewControllerForViewController:a5];
  [v13 storeFlowScriptingClientController:self requestsPresentingSafariViewControllerWithURL:v12 animated:v7 completion:v11];
}

- (void)clientInterface:(id)a3 dismissSafariViewControllerAnimated:(BOOL)a4 fromViewController:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(MusicStoreFlowScriptingClientController *)self _correspondingStoreFlowServiceViewControllerForViewController:a5];
  [v10 storeFlowScriptingClientController:self requestsDismissingSafariViewControllerAnimated:v7 completion:v9];
}

- (BOOL)clientInterface:(id)a3 isAllowedToOpenExternalURL:(id)a4
{
  id v4 = a4;
  if ([v4 isSafeExternalURL])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    BOOL v6 = [v4 scheme];
    BOOL v7 = [v6 lowercaseString];
    unsigned __int8 v5 = [v7 containsString:@"sonos"];
  }
  return v5;
}

- (void)clientInterface:(id)a3 overrideCreditCardPresentationFromViewController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = [(MusicStoreFlowScriptingClientController *)self _correspondingStoreFlowServiceViewControllerForViewController:a4];
  [v8 storeFlowScriptingClientController:self overrideCreditCardPresentationWithCompletion:v7];
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  self->_isApplicationInBackground = 1;
  if ([(MusicStoreFlowScriptingClientController *)self isActive])
  {
    [(MusicStoreFlowScriptingClientController *)self resignActive];
  }
}

- (void)_handleApplicationWillEnterForegroundNotification:(id)a3
{
  self->_isApplicationInBackground = 0;
  if (([(MusicStoreFlowScriptingClientController *)self isActive] & 1) == 0)
  {
    id v4 = [(MusicStoreFlowScriptingClientController *)self rootViewController];

    if (v4)
    {
      [(MusicStoreFlowScriptingClientController *)self becomeActive];
    }
  }
}

- (void)_activateStoreFlowServiceViewController:(id)a3
{
  id v4 = a3;
  -[MusicStoreFlowScriptingClientController setRootViewController:](self, "setRootViewController:");
  if (([(MusicStoreFlowScriptingClientController *)self isActive] & 1) == 0
    && !self->_isApplicationInBackground)
  {
    [(MusicStoreFlowScriptingClientController *)self becomeActive];
  }
  [(NSPointerArray *)self->_activeStoreFlowServiceViewControllersStack addPointer:v4];
}

- (id)_correspondingStoreFlowServiceViewControllerForViewController:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4)
  {
    BOOL v6 = v4;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v7 = [v6 parentViewController];

      BOOL v6 = (void *)v7;
      if (!v7) {
        goto LABEL_5;
      }
    }
    id v9 = v6;
    id v8 = v9;
  }
  else
  {
LABEL_5:
    id v8 = [(MusicStoreFlowScriptingClientController *)self rootViewController];
    id v9 = 0;
  }

  return v8;
}

- (void)_deactivateStoreFlowServiceViewController:(id)a3 andUnregister:(BOOL)a4
{
  id v15 = a3;
  NSUInteger v6 = [(NSPointerArray *)self->_activeStoreFlowServiceViewControllersStack count];
  if (v6)
  {
    NSUInteger v7 = v6 - 1;
    do
    {
      id v8 = [(NSPointerArray *)self->_activeStoreFlowServiceViewControllersStack pointerAtIndex:v7];
      if (v8 == v15) {
        [(NSPointerArray *)self->_activeStoreFlowServiceViewControllersStack removePointerAtIndex:v7];
      }

      --v7;
    }
    while (v7 != -1);
  }
  if (a4 && [(NSHashTable *)self->_registeredStoreFlowServiceViewControllers containsObject:v15]) {
    [(NSHashTable *)self->_registeredStoreFlowServiceViewControllers removeObject:v15];
  }
  id v9 = [(MusicStoreFlowScriptingClientController *)self rootViewController];

  id v10 = v15;
  if (v9 == v15)
  {
    NSUInteger v11 = [(NSPointerArray *)self->_activeStoreFlowServiceViewControllersStack count];
    if (v11)
    {
      NSUInteger v12 = v11 - 1;
      while (1)
      {
        uint64_t v13 = [(NSPointerArray *)self->_activeStoreFlowServiceViewControllersStack pointerAtIndex:v12];
        if (v13) {
          break;
        }
        if (--v12 == -1) {
          goto LABEL_14;
        }
      }
      v14 = (void *)v13;
      [(MusicStoreFlowScriptingClientController *)self setRootViewController:v13];
      if (([(MusicStoreFlowScriptingClientController *)self isActive] & 1) == 0
        && !self->_isApplicationInBackground)
      {
        [(MusicStoreFlowScriptingClientController *)self becomeActive];
      }
    }
    else
    {
LABEL_14:
      [(MusicStoreFlowScriptingClientController *)self setRootViewController:0];
      v14 = 0;
      if ([(MusicStoreFlowScriptingClientController *)self isActive])
      {
        [(MusicStoreFlowScriptingClientController *)self resignActive];
        v14 = 0;
      }
    }

    id v10 = v15;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeStoreFlowServiceViewControllersStack, 0);

  objc_storeStrong((id *)&self->_registeredStoreFlowServiceViewControllers, 0);
}

@end