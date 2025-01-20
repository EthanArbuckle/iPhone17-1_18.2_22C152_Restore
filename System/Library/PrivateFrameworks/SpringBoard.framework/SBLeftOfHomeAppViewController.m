@interface SBLeftOfHomeAppViewController
+ (BOOL)isEnabled;
- (BOOL)canHostAnApp;
- (BOOL)isHostingAnApp;
- (SBAppViewController)appViewController;
- (id)hostedAppSceneHandle;
- (id)hostedAppSceneHandles;
- (unint64_t)contentVisibility;
- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3;
- (void)setAppViewController:(id)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation SBLeftOfHomeAppViewController

+ (BOOL)isEnabled
{
  v2 = +[SBDefaults localDefaults];
  v3 = [v2 homeScreenDefaults];

  v4 = [v3 leftOfHomeAppBundleIdentifier];
  if (os_variant_has_internal_diagnostics()) {
    BOOL v5 = [v4 length] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)SBLeftOfHomeAppViewController;
  [(SBLeftOfHomeAppViewController *)&v15 viewDidLoad];
  v3 = +[SBDefaults localDefaults];
  v4 = [v3 homeScreenDefaults];

  BOOL v5 = [v4 leftOfHomeAppBundleIdentifier];
  if (v5)
  {
    v6 = +[SBApplicationController sharedInstance];
    v7 = [v6 applicationWithBundleIdentifier:v5];
    v8 = +[SBDeviceApplicationSceneEntity defaultEntityWithApplicationForMainDisplay:v7];

    v9 = [[SBAppViewController alloc] initWithIdentifier:@"LeftOfHomeApp" andApplicationSceneEntity:v8];
    appViewController = self->_appViewController;
    self->_appViewController = v9;

    [(SBAppViewController *)self->_appViewController setAutomatesLifecycle:1];
    v11 = [(SBAppViewController *)self->_appViewController view];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBLeftOfHomeAppViewController *)self bs_addChildViewController:self->_appViewController];
    v12 = [(SBAppViewController *)self->_appViewController view];
    v13 = [(SBLeftOfHomeAppViewController *)self view];
    id v14 = (id)SBHPinViewWithinView();
  }
}

- (BOOL)canHostAnApp
{
  return [(SBAppViewController *)self->_appViewController canHostAnApp];
}

- (BOOL)isHostingAnApp
{
  return [(SBAppViewController *)self->_appViewController isHostingAnApp];
}

- (id)hostedAppSceneHandle
{
  return [(SBAppViewController *)self->_appViewController hostedAppSceneHandle];
}

- (id)hostedAppSceneHandles
{
  return [(SBAppViewController *)self->_appViewController hostedAppSceneHandles];
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
}

- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4
{
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (void)setContentVisibility:(unint64_t)a3
{
  self->_contentVisibility = a3;
}

- (SBAppViewController)appViewController
{
  return self->_appViewController;
}

- (void)setAppViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end