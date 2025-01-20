@interface _UISceneLifecycleMonitor
- (UIScene)_scene;
- (_UISceneLifecycleMonitor)initWithScene:(id)a3;
- (int64_t)currentActivationState;
- (void)didBecomeActive;
- (void)didConnect;
- (void)didEnterBackground;
- (void)didResignActive;
- (void)set_scene:(id)a3;
- (void)transitionToTargetState:(id)a3 fromState:(id)a4 withTransitionContext:(id)a5 preparations:(id)a6;
- (void)willEnterForeground;
- (void)willResignActive;
@end

@implementation _UISceneLifecycleMonitor

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  return (UIScene *)WeakRetained;
}

- (void)willEnterForeground
{
  p_scene = &self->__scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  if (WeakRetained)
  {
    int v4 = WeakRetained[54];

    if ((v4 & 0x20) != 0)
    {
      kdebug_trace();
      id v5 = objc_loadWeakRetained((id *)p_scene);
      v6 = [v5 delegate];
      id v7 = objc_loadWeakRetained((id *)p_scene);
      [v6 sceneWillEnterForeground:v7];

      kdebug_trace();
    }
  }
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = objc_loadWeakRetained((id *)p_scene);
  [v8 postNotificationName:@"UISceneWillEnterForegroundNotification" object:v9];

  id v10 = objc_loadWeakRetained((id *)p_scene);
  v11 = [v10 delegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    kdebug_trace();
    id v12 = objc_loadWeakRetained((id *)p_scene);
    v13 = [v12 delegate];
    id v14 = objc_loadWeakRetained((id *)p_scene);
    [v13 canvasWillEnterForeground:v14];

    kdebug_trace();
  }
  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v15 = objc_loadWeakRetained((id *)p_scene);
  [v16 postNotificationName:@"UICanvasWillEnterForegroundNotification" object:v15];
}

- (void)didBecomeActive
{
  p_scene = &self->__scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  if (WeakRetained)
  {
    int v4 = WeakRetained[54];

    if ((v4 & 8) != 0)
    {
      kdebug_trace();
      id v5 = objc_loadWeakRetained((id *)p_scene);
      v6 = [v5 delegate];
      id v7 = objc_loadWeakRetained((id *)p_scene);
      [v6 sceneDidBecomeActive:v7];

      kdebug_trace();
    }
  }
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = objc_loadWeakRetained((id *)p_scene);
  [v8 postNotificationName:@"UISceneDidActivateNotification" object:v9];

  id v10 = objc_loadWeakRetained((id *)p_scene);
  v11 = [v10 delegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    kdebug_trace();
    id v12 = objc_loadWeakRetained((id *)p_scene);
    v13 = [v12 delegate];
    id v14 = objc_loadWeakRetained((id *)p_scene);
    [v13 canvasDidBecomeActive:v14];

    kdebug_trace();
  }
  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v15 = objc_loadWeakRetained((id *)p_scene);
  [v16 postNotificationName:@"UICanvasDidActivateNotification" object:v15];
}

- (_UISceneLifecycleMonitor)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISceneLifecycleMonitor;
  id v5 = [(_UISceneLifecycleMonitor *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->__scene, v4);
  }

  return v6;
}

- (void)didConnect
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  [WeakRetained _finishSceneConnection];
}

- (int64_t)currentActivationState
{
  return 0;
}

- (void)transitionToTargetState:(id)a3 fromState:(id)a4 withTransitionContext:(id)a5 preparations:(id)a6
{
  if (a6) {
    (*((void (**)(id, void *))a6 + 2))(a6, &__block_literal_global_82);
  }
}

- (void)willResignActive
{
  p_scene = &self->__scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  if (WeakRetained)
  {
    int v4 = WeakRetained[54];

    if ((v4 & 0x10) != 0)
    {
      kdebug_trace();
      id v5 = objc_loadWeakRetained((id *)p_scene);
      v6 = [v5 delegate];
      id v7 = objc_loadWeakRetained((id *)p_scene);
      [v6 sceneWillResignActive:v7];

      kdebug_trace();
    }
  }
  objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = objc_loadWeakRetained((id *)p_scene);
  [v8 postNotificationName:@"UISceneWillDeactivateNotification" object:v9];

  id v10 = objc_loadWeakRetained((id *)p_scene);
  v11 = [v10 delegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    kdebug_trace();
    id v12 = objc_loadWeakRetained((id *)p_scene);
    v13 = [v12 delegate];
    id v14 = objc_loadWeakRetained((id *)p_scene);
    [v13 canvasWillResignActive:v14];

    kdebug_trace();
  }
  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v15 = objc_loadWeakRetained((id *)p_scene);
  [v16 postNotificationName:@"UICanvasWillDeactivateNotification" object:v15];
}

- (void)didResignActive
{
  p_scene = &self->__scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  int v4 = [WeakRetained _allowsEventUIWindowRouting];

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_scene);
    [(id)UIApp _cancelAllEventsOfType:11 onEventRoutingScene:v5];
    [(id)UIApp _cancelAllEventsOfType:10 onEventRoutingScene:v5];
  }
}

- (void)didEnterBackground
{
  p_scene = &self->__scene;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__scene);
  if (WeakRetained)
  {
    int v4 = WeakRetained[54];

    if ((v4 & 0x40) != 0)
    {
      kdebug_trace();
      id v5 = objc_loadWeakRetained((id *)p_scene);
      v6 = [v5 delegate];
      id v7 = objc_loadWeakRetained((id *)p_scene);
      [v6 sceneDidEnterBackground:v7];

      kdebug_trace();
    }
  }
  objc_super v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = objc_loadWeakRetained((id *)p_scene);
  [v8 postNotificationName:@"UISceneDidEnterBackgroundNotification" object:v9];

  id v10 = objc_loadWeakRetained((id *)p_scene);
  v11 = [v10 delegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    kdebug_trace();
    id v12 = objc_loadWeakRetained((id *)p_scene);
    v13 = [v12 delegate];
    id v14 = objc_loadWeakRetained((id *)p_scene);
    [v13 canvasDidEnterBackground:v14];

    kdebug_trace();
  }
  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v16 = objc_loadWeakRetained((id *)p_scene);
  [v15 postNotificationName:@"UICanvasDidEnterBackgroundNotification" object:v16];

  id v17 = objc_loadWeakRetained((id *)p_scene);
  int v18 = [v17 _allowsEventUIWindowRouting];

  if (v18)
  {
    id v19 = objc_loadWeakRetained((id *)p_scene);
    [(id)UIApp _cancelAllInputsOnEventRoutingScene:v19];
  }
}

- (void)set_scene:(id)a3
{
}

- (void).cxx_destruct
{
}

@end