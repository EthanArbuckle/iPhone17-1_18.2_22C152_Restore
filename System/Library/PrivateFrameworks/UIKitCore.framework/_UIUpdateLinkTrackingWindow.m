@interface _UIUpdateLinkTrackingWindow
- (BOOL)_canEngage;
- (void)_switchWindowFrom:(void *)a3 to:;
- (void)_windowSceneDidChange:(id)a3;
- (void)_windowSceneWillChange:(id)a3;
- (void)_windowVisibilityChanged:(id)a3;
@end

@implementation _UIUpdateLinkTrackingWindow

- (void)_switchWindowFrom:(void *)a3 to:
{
  if (a1)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if (a2)
    {
      [v6 removeObserver:a1 name:@"UIWindowDidBecomeVisibleNotification" object:a2];
      [v6 removeObserver:a1 name:@"UIWindowDidBecomeHiddenNotification" object:a2];
      [v6 removeObserver:a1 name:@"_UIWindowWillMoveToNilSceneNotification" object:a2];
      [v6 removeObserver:a1 name:0x1ED1601C0 object:a2];
      [v6 removeObserver:a1 name:0x1ED1601E0 object:a2];
    }
    if (a3)
    {
      [v6 addObserver:a1 selector:sel__windowVisibilityChanged_ name:@"UIWindowDidBecomeVisibleNotification" object:a3];
      [v6 addObserver:a1 selector:sel__windowVisibilityChanged_ name:@"UIWindowDidBecomeHiddenNotification" object:a3];
      [v6 addObserver:a1 selector:sel__windowSceneWillChange_ name:@"_UIWindowWillMoveToNilSceneNotification" object:a3];
      [v6 addObserver:a1 selector:sel__windowSceneWillChange_ name:0x1ED1601C0 object:a3];
      [v6 addObserver:a1 selector:sel__windowSceneDidChange_ name:0x1ED1601E0 object:a3];
    }
    *(unsigned char *)(a1 + 52) = [a3 _isVisible];
  }
}

- (BOOL)_canEngage
{
  return *(&self->super.super.super._enabled + 1) && *(&self->super.super.super._enabled + 2);
}

- (void)_windowVisibilityChanged:(id)a3
{
  id v6 = [a3 object];
  *(&self->super.super.super._enabled + 2) = [v6 _isVisible];
  BOOL v4 = [(_UIUpdateLinkTrackingWindow *)self _canEngage];
  if (self->super.super.super._engaged != v4)
  {
    self->super.super.super._engaged = v4;
    int v5 = self->super.super.super._enabled && v4;
    -[UIUpdateLink _setActive:]((uint64_t)self, v5);
  }
}

- (void)_windowSceneWillChange:(id)a3
{
  id v7 = [a3 object];
  BOOL v4 = [v7 _windowHostingScene];
  -[_UIUpdateLinkTrackingScene _switchSceneFrom:to:]((uint64_t)self, (uint64_t)v4, 0);
  if (self)
  {
    BOOL v5 = [(_UIUpdateLinkTrackingWindow *)self _canEngage];
    if (self->super.super.super._engaged != v5)
    {
      self->super.super.super._engaged = v5;
      int v6 = self->super.super.super._enabled && v5;
      -[UIUpdateLink _setActive:]((uint64_t)self, v6);
    }
  }
}

- (void)_windowSceneDidChange:(id)a3
{
  id v7 = [a3 object];
  BOOL v4 = [v7 _windowHostingScene];
  -[_UIUpdateLinkTrackingScene _switchSceneFrom:to:]((uint64_t)self, 0, v4);
  if (self)
  {
    BOOL v5 = [(_UIUpdateLinkTrackingWindow *)self _canEngage];
    if (self->super.super.super._engaged != v5)
    {
      self->super.super.super._engaged = v5;
      int v6 = self->super.super.super._enabled && v5;
      -[UIUpdateLink _setActive:]((uint64_t)self, v6);
    }
  }
}

@end