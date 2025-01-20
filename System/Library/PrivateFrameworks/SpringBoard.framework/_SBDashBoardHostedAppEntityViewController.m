@interface _SBDashBoardHostedAppEntityViewController
- (BOOL)appViewControllerShouldBackgroundApplicationOnDeactivate:(id)a3;
- (CSHostableEntityPresenterDelegate)entityPresenterDelegate;
- (SBHomeGrabberView)homeGrabberViewForTraitsParticipant;
- (int64_t)hostableEntityContentMode;
- (void)invalidateForReplacementByEntity:(id)a3;
- (void)setActionsToDeliverToHostableEntity:(id)a3;
- (void)setEntityPresenterDelegate:(id)a3;
- (void)setHostableEntityContentMode:(int64_t)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation _SBDashBoardHostedAppEntityViewController

- (CSHostableEntityPresenterDelegate)entityPresenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entityPresenterDelegate);
  return (CSHostableEntityPresenterDelegate *)WeakRetained;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_SBDashBoardHostedAppEntityViewController;
  [(SBDashBoardHostedAppViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(CSCoverSheetViewControllerBase *)self _setDisplayLayoutElementActive:[(CSCoverSheetViewControllerBase *)self isDisplayLayoutElementActive] immediately:1];
  }
}

- (BOOL)appViewControllerShouldBackgroundApplicationOnDeactivate:(id)a3
{
  id v4 = a3;
  if (self->_preventSceneBackgrounding
    || !objc_msgSend((id)-[_SBDashBoardHostedAppEntityViewController superclass](self, "superclass"), "instancesRespondToSelector:", sel_appViewControllerShouldBackgroundApplicationOnDeactivate_))
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SBDashBoardHostedAppEntityViewController;
    BOOL v5 = [(SBDashBoardHostedAppViewController *)&v7 appViewControllerShouldBackgroundApplicationOnDeactivate:v4];
  }

  return v5;
}

- (int64_t)hostableEntityContentMode
{
  int64_t result = [(SBDashBoardHostedAppViewController *)self mode];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (void)setHostableEntityContentMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 3) {
    [(SBDashBoardHostedAppViewController *)self setMode:qword_1D8FD23F0[a3]];
  }
}

- (void)setActionsToDeliverToHostableEntity:(id)a3
{
  id v4 = (id)[a3 copy];
  [(SBDashBoardHostedAppViewController *)self setActionsToDeliver:v4];
}

- (SBHomeGrabberView)homeGrabberViewForTraitsParticipant
{
  v3 = [(SBDashBoardHostedAppViewController *)self appView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    BOOL v5 = [(SBDashBoardHostedAppViewController *)self applicationSceneHandle];
    uint64_t v6 = objc_opt_class();
    id v7 = v5;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v9 = v8;

    v10 = [v4 homeGrabberView];
  }
  else
  {
    id v9 = 0;
    v10 = 0;
  }

  return (SBHomeGrabberView *)v10;
}

- (void)invalidateForReplacementByEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v12 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v12;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 applicationSceneEntity];

  id v9 = [v8 sceneHandle];
  v10 = [(SBDashBoardHostedAppViewController *)self applicationSceneHandle];
  int v11 = [v9 isEqual:v10];

  if (v11) {
    self->_preventSceneBackgrounding = 1;
  }
  [(SBDashBoardHostedAppViewController *)self invalidate];
}

- (void)setEntityPresenterDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end