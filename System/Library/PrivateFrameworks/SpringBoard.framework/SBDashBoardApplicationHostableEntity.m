@interface SBDashBoardApplicationHostableEntity
- (BOOL)hostedAppShouldHideHomeGrabberView;
- (CSCoverSheetViewPresenting)hostingViewController;
- (NSString)applicationBundleIdentifier;
- (NSString)hostedAppBundleIdentifier;
- (SBApplicationSceneEntity)applicationSceneEntity;
- (SBDashBoardApplicationHostableEntity)initWithApplicationSceneEntity:(id)a3;
- (SBDisplayItem)displayItemRepresentation;
- (void)dashBoardHostedAppViewControllerDidFailToActivateApplication:(id)a3;
- (void)sceneHandle:(id)a3 didCreateScene:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
@end

@implementation SBDashBoardApplicationHostableEntity

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  id v5 = [(_SBDashBoardHostedAppEntityViewController *)self->_hostedAppViewController entityPresenterDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 hostableEntityPresenter:self->_hostedAppViewController didBeginHosting:self];
  }
}

- (SBDashBoardApplicationHostableEntity)initWithApplicationSceneEntity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardApplicationHostableEntity;
  v6 = [(SBDashBoardApplicationHostableEntity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_applicationSceneEntity, a3);
  }

  return v7;
}

- (SBDisplayItem)displayItemRepresentation
{
  return (SBDisplayItem *)[(SBWorkspaceEntity *)self->_applicationSceneEntity displayItemRepresentation];
}

- (NSString)applicationBundleIdentifier
{
  v2 = [(SBApplicationSceneEntity *)self->_applicationSceneEntity application];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (CSCoverSheetViewPresenting)hostingViewController
{
  hostedAppViewController = self->_hostedAppViewController;
  if (!hostedAppViewController)
  {
    v4 = [(SBDashBoardHostedAppViewController *)[_SBDashBoardHostedAppEntityViewController alloc] initWithApplicationSceneEntity:self->_applicationSceneEntity];
    [(SBDashBoardHostedAppViewController *)v4 setHostContextProvider:self];
    id v5 = self->_hostedAppViewController;
    self->_hostedAppViewController = v4;
    v6 = v4;

    [(SBDashBoardHostedAppViewController *)self->_hostedAppViewController setDelegate:self];
    v7 = [(SBDashBoardHostedAppViewController *)self->_hostedAppViewController applicationSceneHandle];

    [v7 addObserver:self];
    hostedAppViewController = self->_hostedAppViewController;
  }
  return (CSCoverSheetViewPresenting *)hostedAppViewController;
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  id v5 = [(_SBDashBoardHostedAppEntityViewController *)self->_hostedAppViewController entityPresenterDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 hostableEntityPresenter:self->_hostedAppViewController didEndHosting:self];
  }
}

- (void)dashBoardHostedAppViewControllerDidFailToActivateApplication:(id)a3
{
  id v4 = [(_SBDashBoardHostedAppEntityViewController *)self->_hostedAppViewController entityPresenterDelegate];
  if (objc_opt_respondsToSelector()) {
    [v4 hostableEntityPresenter:self->_hostedAppViewController didFailToActivate:self];
  }
}

- (BOOL)hostedAppShouldHideHomeGrabberView
{
  return 1;
}

- (NSString)hostedAppBundleIdentifier
{
  v2 = [(SBApplicationSceneEntity *)self->_applicationSceneEntity application];
  v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (SBApplicationSceneEntity)applicationSceneEntity
{
  return self->_applicationSceneEntity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
  objc_storeStrong((id *)&self->_hostedAppViewController, 0);
}

@end