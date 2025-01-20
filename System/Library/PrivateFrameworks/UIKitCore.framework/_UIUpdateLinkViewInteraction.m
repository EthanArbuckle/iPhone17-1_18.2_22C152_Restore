@interface _UIUpdateLinkViewInteraction
- (UIView)view;
- (void)_updateWindowFrom:(void *)a3 to:;
- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
@end

@implementation _UIUpdateLinkViewInteraction

- (void)dealloc
{
  link = self->_link;
  if (link) {
    *(void *)&link->super.super._sceneForeground = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_UIUpdateLinkViewInteraction;
  [(_UIUpdateLinkViewInteraction *)&v3 dealloc];
}

- (UIView)view
{
  return self->_view;
}

- (void)didMoveToView:(id)a3
{
  v5 = [(UIView *)self->_view _window];
  v6 = [a3 _window];
  -[_UIUpdateLinkViewInteraction _updateWindowFrom:to:]((uint64_t)self, v5, v6);

  self->_view = (UIView *)a3;
}

- (void)_updateWindowFrom:(void *)a3 to:
{
  if (a1)
  {
    -[_UIUpdateLinkTrackingWindow _switchWindowFrom:to:](*(void *)(a1 + 16), (uint64_t)a2, a3);
    uint64_t v6 = *(void *)(a1 + 16);
    v7 = [a2 _windowHostingScene];
    v8 = [a3 _windowHostingScene];
    -[_UIUpdateLinkTrackingScene _switchSceneFrom:to:](v6, (uint64_t)v7, v8);

    v9 = *(unsigned char **)(a1 + 16);
    if (v9)
    {
      int v10 = [v9 _canEngage];
      if (v9[48] != v10)
      {
        v9[48] = v10;
        if (v9[50]) {
          int v11 = v10;
        }
        else {
          int v11 = 0;
        }
        -[UIUpdateLink _setActive:]((uint64_t)v9, v11);
      }
    }
  }
}

- (void)_willMoveFromWindow:(id)a3 toWindow:(id)a4
{
}

@end