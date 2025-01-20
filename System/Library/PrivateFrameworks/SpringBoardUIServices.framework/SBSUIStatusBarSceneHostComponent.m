@interface SBSUIStatusBarSceneHostComponent
- (SBSUIStatusBarSceneHostComponentDelegate)delegate;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation SBSUIStatusBarSceneHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  id v9 = a4;
  if ([v9 isUISubclass])
  {
    v6 = [v9 displayConfiguration];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = [WeakRetained statusBarForDisplayConfiguration:v6 statusBarSceneHostComponent:self];

    [v8 heightForOrientation:1];
    objc_msgSend(v9, "setDefaultStatusBarHeight:forOrientation:", 1);
    [v8 heightForOrientation:2];
    objc_msgSend(v9, "setDefaultStatusBarHeight:forOrientation:", 2);
    [v8 heightForOrientation:4];
    objc_msgSend(v9, "setDefaultStatusBarHeight:forOrientation:", 4);
    [v8 heightForOrientation:3];
    objc_msgSend(v9, "setDefaultStatusBarHeight:forOrientation:", 3);
  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v19 = a5;
  id v9 = a6;
  v10 = [a3 clientSettings];
  uint64_t v11 = objc_opt_class();
  id v12 = v10;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v14 = v13;

  if (v14)
  {
    id v15 = v19;
    int v16 = [v14 statusBarHidden];
    if (v16 != [v15 statusBarHidden])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v18 = [v9 animationSettings];
      [WeakRetained statusBarSceneHostComponent:self didChangePreferredStatusBarVisibilityWithAnimationSettings:v18];
    }
  }
}

- (SBSUIStatusBarSceneHostComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSUIStatusBarSceneHostComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end