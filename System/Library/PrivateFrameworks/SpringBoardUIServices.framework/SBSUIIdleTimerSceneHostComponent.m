@interface SBSUIIdleTimerSceneHostComponent
- (SBSUIIdleTimerSceneHostComponentDelegate)delegate;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation SBSUIIdleTimerSceneHostComponent

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v16 = a5;
  v8 = [a3 clientSettings];
  uint64_t v9 = objc_opt_class();
  id v10 = v8;
  if (v9)
  {
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = v16;
    int v14 = [v12 idleTimerDisabled];
    if (v14 != [v13 idleTimerDisabled])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained idleTimerSceneHostComponentDidChangeShouldDisableIdleTimer:self];
    }
  }
}

- (SBSUIIdleTimerSceneHostComponentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBSUIIdleTimerSceneHostComponentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end