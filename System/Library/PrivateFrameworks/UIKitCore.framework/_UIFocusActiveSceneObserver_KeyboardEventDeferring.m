@interface _UIFocusActiveSceneObserver_KeyboardEventDeferring
- (BOOL)isActive;
- (id)_initWithScene:(id)a3;
- (void)dealloc;
@end

@implementation _UIFocusActiveSceneObserver_KeyboardEventDeferring

- (id)_initWithScene:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusActiveSceneObserver_KeyboardEventDeferring;
  id v5 = [(_UIFocusActiveSceneObserver *)&v9 _initWithScene:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__activeStateChanged_ name:@"_UISceneDidBecomeTargetOfKeyboardEventDeferringEnvironmentNotification" object:v4];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v5 selector:sel__activeStateChanged_ name:@"_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification" object:v4];
  }
  return v5;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"_UISceneDidBecomeTargetOfKeyboardEventDeferringEnvironmentNotification";
  v6[1] = @"_UISceneDidResignTargetOfKeyboardEventDeferringEnvironmentNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusActiveSceneObserver_KeyboardEventDeferring;
  [(_UIFocusActiveSceneObserver_KeyboardEventDeferring *)&v5 dealloc];
}

- (BOOL)isActive
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._scene);
  char v3 = [WeakRetained _isTargetOfKeyboardEventDeferringEnvironment];

  return v3;
}

@end