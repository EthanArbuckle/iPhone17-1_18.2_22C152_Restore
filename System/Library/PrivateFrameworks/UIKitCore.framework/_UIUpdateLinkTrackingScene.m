@interface _UIUpdateLinkTrackingScene
- (BOOL)_canEngage;
- (id)_initWithScene:(void *)a1;
- (void)_sceneEnterForeground;
- (void)_sceneExitForeground;
- (void)_switchSceneFrom:(void *)a3 to:;
@end

@implementation _UIUpdateLinkTrackingScene

- (id)_initWithScene:(void *)a1
{
  if (!a1) {
    return 0;
  }
  id v3 = -[UIUpdateLink _init](a1);
  id v4 = v3;
  if (v3) {
    -[_UIUpdateLinkTrackingScene _switchSceneFrom:to:]((uint64_t)v3, 0, a2);
  }
  return v4;
}

- (void)_switchSceneFrom:(void *)a3 to:
{
  if (a1)
  {
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v8 = v6;
    if (a2)
    {
      [v6 removeObserver:a1 name:@"UISceneWillEnterForegroundNotification" object:a2];
      [v8 removeObserver:a1 name:@"UISceneDidEnterBackgroundNotification" object:a2];
      [v8 removeObserver:a1 name:@"UISceneDidDisconnectNotification" object:a2];
      v6 = v8;
    }
    if (a3)
    {
      [v6 addObserver:a1 selector:sel__sceneEnterForeground name:@"UISceneWillEnterForegroundNotification" object:a3];
      [v8 addObserver:a1 selector:sel__sceneExitForeground name:@"UISceneDidEnterBackgroundNotification" object:a3];
      [v8 addObserver:a1 selector:sel__sceneExitForeground name:@"UISceneDidDisconnectNotification" object:a3];
      if ([a3 activationState]) {
        BOOL v7 = [a3 activationState] == 1;
      }
      else {
        BOOL v7 = 1;
      }
      v6 = v8;
    }
    else
    {
      BOOL v7 = 0;
    }
    *(unsigned char *)(a1 + 51) = v7;
  }
}

- (BOOL)_canEngage
{
  return *(&self->super.super._enabled + 1);
}

- (void)_sceneEnterForeground
{
  *(&self->super.super._enabled + 1) = 1;
  BOOL v3 = [(_UIUpdateLinkTrackingScene *)self _canEngage];
  if (self->super.super._engaged != v3)
  {
    self->super.super._engaged = v3;
    int v4 = self->super.super._enabled && v3;
    -[UIUpdateLink _setActive:]((uint64_t)self, v4);
  }
}

- (void)_sceneExitForeground
{
  *(&self->super.super._enabled + 1) = 0;
  BOOL v3 = [(_UIUpdateLinkTrackingScene *)self _canEngage];
  if (self->super.super._engaged != v3)
  {
    self->super.super._engaged = v3;
    int v4 = self->super.super._enabled && v3;
    -[UIUpdateLink _setActive:]((uint64_t)self, v4);
  }
}

@end