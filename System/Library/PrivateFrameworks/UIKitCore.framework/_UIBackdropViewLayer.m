@interface _UIBackdropViewLayer
- (_UIBackdropView)backdropView;
- (void)dealloc;
- (void)renderInContext:(CGContext *)a3;
- (void)setBackdropView:(id)a3;
@end

@implementation _UIBackdropViewLayer

- (void)setBackdropView:(id)a3
{
  self->_backdropView = (_UIBackdropView *)a3;
}

- (void)dealloc
{
  self->_backdropView = 0;
  v2.receiver = self;
  v2.super_class = (Class)_UIBackdropViewLayer;
  [(_UIBackdropViewLayer *)&v2 dealloc];
}

- (void)renderInContext:(CGContext *)a3
{
  v5 = [(_UIBackdropViewLayer *)self backdropView];
  [v5 willCallRenderInContextOnBackdropViewLayer];

  v7.receiver = self;
  v7.super_class = (Class)_UIBackdropViewLayer;
  [(_UIBackdropViewLayer *)&v7 renderInContext:a3];
  v6 = [(_UIBackdropViewLayer *)self backdropView];
  [v6 didCallRenderInContextOnBackdropViewLayer];
}

- (_UIBackdropView)backdropView
{
  return self->_backdropView;
}

@end