@interface SRAuthorizationPromptPresentationController
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)hostNavigationBarHidden;
- (BOOL)isPresenting;
- (BOOL)isViewControllerPresentedModally;
- (BOOL)presentAnyViewController:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5;
- (NSError)error;
- (SRRemoteAuthorizationPromptViewController)viewController;
- (id)completionHandler;
- (id)navigationControllerFromRoot:(id)a3;
- (id)presentationAnchor;
- (id)presentingViewControllerFromRoot:(id)a3;
- (int64_t)reason;
- (void)authorizationRequestCompleted;
- (void)authorizationRequestDidDisappear;
- (void)authorizationRequestWillDisappear;
- (void)authorizationUIReadyForDisplayModally:(BOOL)a3;
- (void)completePromptWithError:(id)a3;
- (void)dealloc;
- (void)presentAppsAndStudiesPromptViewController:(id)a3 completionHandler:(id)a4;
- (void)presentFirstRunOnboardingViewController:(id)a3 completionHandler:(id)a4;
- (void)presentMigrationPromptViewController:(id)a3 withDesiredServices:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)presentPromptViewController:(id)a3 withDesiredServices:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6;
- (void)presentResearchDataViewController:(id)a3 completionHandler:(id)a4;
- (void)presentStudyAuthorizationPromptViewController:(id)a3 bundlePath:(id)a4 completionHandler:(id)a5;
- (void)setCompletionHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setHostNavigationBarHidden:(BOOL)a3;
- (void)setPresenting:(BOOL)a3;
- (void)setReason:(int64_t)a3;
- (void)setViewController:(id)a3;
- (void)viewControllerCleanUp;
@end

@implementation SRAuthorizationPromptPresentationController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogAuthorizationPromptPresentationController = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationPromptPresentationController");
  }
}

+ (id)sharedInstance
{
  if (qword_26870D030 != -1) {
    dispatch_once(&qword_26870D030, &__block_literal_global);
  }
  return (id)_MergedGlobals_5;
}

SRAuthorizationPromptPresentationController *__61__SRAuthorizationPromptPresentationController_sharedInstance__block_invoke()
{
  result = objc_alloc_init(SRAuthorizationPromptPresentationController);
  _MergedGlobals_5 = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  [(SRRemoteAuthorizationPromptViewController *)[(SRAuthorizationPromptPresentationController *)self viewController] invalidate];
  [(SRAuthorizationPromptPresentationController *)self setViewController:0];
  [(SRAuthorizationPromptPresentationController *)self setCompletionHandler:0];
  [(SRAuthorizationPromptPresentationController *)self setError:0];
  v3.receiver = self;
  v3.super_class = (Class)SRAuthorizationPromptPresentationController;
  [(SRAuthorizationPromptPresentationController *)&v3 dealloc];
}

- (BOOL)presentAnyViewController:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v9 = [(SRAuthorizationPromptPresentationController *)self isPresenting];
  if (v9)
  {
    v10 = SRLogAuthorizationPromptPresentationController;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134218240;
      int64_t v13 = a4;
      __int16 v14 = 2048;
      int64_t v15 = [(SRAuthorizationPromptPresentationController *)self reason];
      _os_log_error_impl(&dword_230B11000, v10, OS_LOG_TYPE_ERROR, "Rejecting prompt request %ld due to ongoing prompt %ld", (uint8_t *)&v12, 0x16u);
    }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F176D8] code:8195 userInfo:0]);
  }
  else
  {
    [(SRAuthorizationPromptPresentationController *)self setPresenting:1];
    [(SRAuthorizationPromptPresentationController *)self setReason:a4];
    [(SRAuthorizationPromptPresentationController *)self setError:0];
    [(SRAuthorizationPromptPresentationController *)self setCompletionHandler:a5];
    [(SRAuthorizationPromptPresentationController *)self setViewController:a3];
    [(SRRemoteAuthorizationPromptViewController *)[(SRAuthorizationPromptPresentationController *)self viewController] setDelegate:self];
  }
  return !v9;
}

- (void)presentPromptViewController:(id)a3 withDesiredServices:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  if ([(SRAuthorizationPromptPresentationController *)self presentAnyViewController:a3 reason:1 completionHandler:a6])
  {
    BOOL v9 = [(SRAuthorizationPromptPresentationController *)self viewController];
    [(SRRemoteAuthorizationPromptViewController *)v9 requestAuthorizationForBundle:a5 services:a4];
  }
}

- (void)presentMigrationPromptViewController:(id)a3 withDesiredServices:(id)a4 bundleIdentifier:(id)a5 completionHandler:(id)a6
{
  if ([(SRAuthorizationPromptPresentationController *)self presentAnyViewController:a3 reason:7 completionHandler:a6])
  {
    BOOL v9 = [(SRAuthorizationPromptPresentationController *)self viewController];
    [(SRRemoteAuthorizationPromptViewController *)v9 requestAuthorizationMigrationForBundle:a5 services:a4];
  }
}

- (void)presentAppsAndStudiesPromptViewController:(id)a3 completionHandler:(id)a4
{
  if ([(SRAuthorizationPromptPresentationController *)self presentAnyViewController:a3 reason:3 completionHandler:a4])
  {
    v5 = [(SRAuthorizationPromptPresentationController *)self viewController];
    [(SRRemoteAuthorizationPromptViewController *)v5 showAppsAndStudies];
  }
}

- (void)presentStudyAuthorizationPromptViewController:(id)a3 bundlePath:(id)a4 completionHandler:(id)a5
{
  if ([(SRAuthorizationPromptPresentationController *)self presentAnyViewController:a3 reason:4 completionHandler:a5])
  {
    v7 = [(SRAuthorizationPromptPresentationController *)self viewController];
    [(SRRemoteAuthorizationPromptViewController *)v7 showStudyAuthorizationForBundlePath:a4];
  }
}

- (void)presentResearchDataViewController:(id)a3 completionHandler:(id)a4
{
  if ([(SRAuthorizationPromptPresentationController *)self presentAnyViewController:a3 reason:5 completionHandler:a4])
  {
    v5 = [(SRAuthorizationPromptPresentationController *)self viewController];
    [(SRRemoteAuthorizationPromptViewController *)v5 showResearchData];
  }
}

- (void)presentFirstRunOnboardingViewController:(id)a3 completionHandler:(id)a4
{
  if ([(SRAuthorizationPromptPresentationController *)self presentAnyViewController:a3 reason:6 completionHandler:a4])
  {
    v5 = [(SRAuthorizationPromptPresentationController *)self viewController];
    [(SRRemoteAuthorizationPromptViewController *)v5 showFirstRunOnboarding];
  }
}

- (id)presentationAnchor
{
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow");
  return (id)[v2 rootViewController];
}

- (void)authorizationUIReadyForDisplayModally:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = SRLogAuthorizationPromptPresentationController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_230B11000, v5, OS_LOG_TYPE_DEFAULT, "Putting up prompt UI", v8, 2u);
  }
  id v6 = [(SRAuthorizationPromptPresentationController *)self presentationAnchor];
  if (v3)
  {
    [(SRRemoteAuthorizationPromptViewController *)[(SRAuthorizationPromptPresentationController *)self viewController] setModalPresentationStyle:2];
    objc_msgSend(-[SRAuthorizationPromptPresentationController presentingViewControllerFromRoot:](self, "presentingViewControllerFromRoot:", v6), "presentViewController:animated:completion:", -[SRAuthorizationPromptPresentationController viewController](self, "viewController"), 1, 0);
  }
  else
  {
    id v7 = [(SRAuthorizationPromptPresentationController *)self navigationControllerFromRoot:v6];
    objc_msgSend(v7, "pushViewController:animated:", -[SRAuthorizationPromptPresentationController viewController](self, "viewController"), 1);
    -[SRAuthorizationPromptPresentationController setHostNavigationBarHidden:](self, "setHostNavigationBarHidden:", [v7 isNavigationBarHidden]);
    [v7 setNavigationBarHidden:1];
  }
}

- (void)authorizationRequestCompleted
{
}

- (BOOL)isViewControllerPresentedModally
{
  BOOL v3 = (SRRemoteAuthorizationPromptViewController *)objc_msgSend((id)-[SRRemoteAuthorizationPromptViewController presentingViewController](-[SRAuthorizationPromptPresentationController viewController](self, "viewController"), "presentingViewController"), "presentedViewController");
  return v3 == [(SRAuthorizationPromptPresentationController *)self viewController];
}

- (void)authorizationRequestWillDisappear
{
  BOOL v3 = SRLogAuthorizationPromptPresentationController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230B11000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down prompt UI", buf, 2u);
  }
  if (![(SRAuthorizationPromptPresentationController *)self isViewControllerPresentedModally])
  {
    v4 = SRLogAuthorizationPromptPresentationController;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_230B11000, v4, OS_LOG_TYPE_DEFAULT, "Prompt ViewController is not modal, hiding the host navigation bar", v5, 2u);
    }
    objc_msgSend(-[SRAuthorizationPromptPresentationController navigationControllerFromRoot:](self, "navigationControllerFromRoot:", -[SRAuthorizationPromptPresentationController presentationAnchor](self, "presentationAnchor")), "setNavigationBarHidden:", -[SRAuthorizationPromptPresentationController hostNavigationBarHidden](self, "hostNavigationBarHidden"));
  }
}

- (void)authorizationRequestDidDisappear
{
  BOOL v3 = SRLogAuthorizationPromptPresentationController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230B11000, v3, OS_LOG_TYPE_DEFAULT, "Prompt UI torn down", buf, 2u);
  }
  char v4 = [(SRRemoteAuthorizationPromptViewController *)[(SRAuthorizationPromptPresentationController *)self viewController] isMovingFromParentViewController];
  if (![(SRAuthorizationPromptPresentationController *)self isViewControllerPresentedModally]&& (v4 & 1) == 0)
  {
    v5 = SRLogAuthorizationPromptPresentationController;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_230B11000, v5, OS_LOG_TYPE_DEFAULT, "Prompt ViewController is not moving from parent view controller, popping from the navigation controller if necessary", v7, 2u);
    }
    id v6 = (void *)[(SRRemoteAuthorizationPromptViewController *)[(SRAuthorizationPromptPresentationController *)self viewController] parentViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 popViewControllerAnimated:0];
    }
  }
  [(SRAuthorizationPromptPresentationController *)self viewControllerCleanUp];
}

- (void)viewControllerCleanUp
{
  BOOL v3 = SRLogAuthorizationPromptPresentationController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_230B11000, v3, OS_LOG_TYPE_DEFAULT, "Clearing prompt ViewController", v5, 2u);
  }
  [(SRRemoteAuthorizationPromptViewController *)[(SRAuthorizationPromptPresentationController *)self viewController] invalidate];
  [(SRRemoteAuthorizationPromptViewController *)[(SRAuthorizationPromptPresentationController *)self viewController] setDelegate:0];
  [(SRAuthorizationPromptPresentationController *)self setViewController:0];
  char v4 = (void (**)(id, NSError *))[(SRAuthorizationPromptPresentationController *)self completionHandler];
  [(SRAuthorizationPromptPresentationController *)self setPresenting:0];
  [(SRAuthorizationPromptPresentationController *)self setReason:0];
  v4[2](v4, [(SRAuthorizationPromptPresentationController *)self error]);

  [(SRAuthorizationPromptPresentationController *)self setError:0];
}

- (void)completePromptWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(SRAuthorizationPromptPresentationController *)self setError:a3];
  id v4 = [(SRAuthorizationPromptPresentationController *)self navigationControllerFromRoot:[(SRAuthorizationPromptPresentationController *)self presentationAnchor]];
  v5 = [(SRAuthorizationPromptPresentationController *)self viewController];
  if ([(SRAuthorizationPromptPresentationController *)self isViewControllerPresentedModally])
  {
    id v6 = SRLogAuthorizationPromptPresentationController;
    if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134349312;
      v11 = v5;
      __int16 v12 = 2050;
      uint64_t v13 = [(SRRemoteAuthorizationPromptViewController *)v5 presentingViewController];
      _os_log_impl(&dword_230B11000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing ViewController %{public}p from presenting ViewController %{public}p", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend((id)-[SRRemoteAuthorizationPromptViewController presentingViewController](v5, "presentingViewController"), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_7);
  }
  else
  {
    uint64_t v7 = [v4 topViewController];
    v8 = SRLogAuthorizationPromptPresentationController;
    BOOL v9 = os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_DEFAULT);
    if ((SRRemoteAuthorizationPromptViewController *)v7 == v5)
    {
      if (v9)
      {
        int v10 = 134349312;
        v11 = v5;
        __int16 v12 = 2050;
        uint64_t v13 = (uint64_t)v4;
        _os_log_impl(&dword_230B11000, v8, OS_LOG_TYPE_DEFAULT, "Popping ViewController %{public}p from NavigationController %{public}p", (uint8_t *)&v10, 0x16u);
      }
      [v4 popViewControllerAnimated:1];
    }
    else
    {
      if (v9)
      {
        int v10 = 134349056;
        v11 = v5;
        _os_log_impl(&dword_230B11000, v8, OS_LOG_TYPE_DEFAULT, "ViewController %{public}p is neither modal or in a NavigationController, just cleaning up", (uint8_t *)&v10, 0xCu);
      }
      [(SRAuthorizationPromptPresentationController *)self viewControllerCleanUp];
    }
  }
}

void __71__SRAuthorizationPromptPresentationController_completePromptWithError___block_invoke()
{
  v0 = SRLogAuthorizationPromptPresentationController;
  if (os_log_type_enabled((os_log_t)SRLogAuthorizationPromptPresentationController, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_230B11000, v0, OS_LOG_TYPE_INFO, "ViewController dismissed", v1, 2u);
  }
}

- (id)navigationControllerFromRoot:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a3 = (id)[a3 selectedViewController];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return a3;
  }
  if (![a3 navigationController]) {
    return 0;
  }
  return (id)[a3 navigationController];
}

- (id)presentingViewControllerFromRoot:(id)a3
{
  id v3 = a3;
  for (i = a3; [i presentedViewController]; id v3 = i)
    id i = (id)[v3 presentedViewController];
  return v3;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (SRRemoteAuthorizationPromptViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)hostNavigationBarHidden
{
  return self->_hostNavigationBarHidden;
}

- (void)setHostNavigationBarHidden:(BOOL)a3
{
  self->_hostNavigationBarHidden = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

@end